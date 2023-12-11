<?php
include "ObjectHierarchyIterator.php";
include "sorts/SortObjectHierarchyClause.php";
include "predicates/ObjectRootFilter.php";
include SERVER_ROOT_PATH.'cms/classes/model/ModelFactoryBase.php';
include SERVER_ROOT_PATH.'core/classes/model/classes.php';
include_once "ModelEntityOriginationService.php";
include_once "ModelProjectOriginationService.php";
include 'validation/ModelValidator.php';
include 'mappers/ModelMapper.php';
include 'mappers/ModelDataTypeMappingPositives.php';
include "mappers/ModelDataTypeMappingMultiselect.php";
include 'mappers/ModelDefaultValuesMapping.php';
include 'mappers/ModelPermissionValuesMapping.php';
include 'mappers/ModelPasswordMapping.php';
include 'mappers/ModelChecklistMapper.php';

class ModelFactory extends ModelFactoryBase
{
    private $classes = [];
	private $plugins = null;
	private $logger;

 	private $origination_service = null;

 	function __construct($pluginsManager, $cache_engine, $cache_key = 'global', $access_policy = null, $events_manager = null, $origination_service = null )
 	{
        global $model_factory;
        $model_factory = $this;

 	    parent::__construct($cache_engine, $cache_key, $access_policy, $events_manager);

		$this->plugins = $pluginsManager;
		$this->classes = $this->buildClasses();
 	    $this->origination_service = is_object($origination_service)
 	    		? $origination_service : new ModelEntityOriginationService($this->getCacheService(), $cache_key);

 	    if (is_object($pluginsManager) ) {
            $pluginsManager->checkLicenses();
        }
 	}

 	function __sleep() {
        return [];
    }

    public function getPluginsManager() {
		return $this->plugins;
	}

 	public function getEntityOriginationService()
 	{
 		return $this->origination_service;
 	}

 	public function setEntityOriginationService( $service )
 	{
 		$this->origination_service = $service;
 	}

    public function setCacheKey( $key ) {
        parent::setCacheKey($key);
        $this->origination_service->setCacheKey($key);
    }

	protected function buildClasses()
	{
		return [
			'cms_checkquestion'     => ['CheckQuestion'],
			'cms_snapshot'          => ['Snapshot'],
			'cms_snapshotitem'      => ['SnapshotItem'],
		    'cms_snapshotitemvalue' => ['SnapshotItemValue'],
			'cms_systemsettings'    => ['SystemSettings'],
			'pm_project'            => ['Project'],
			'pm_projecttemplate'    => ['ProjectTemplate'],
			'program'               => ['Program'],
			'objectchangelog'       => ['ChangeLog'],
			'co_scheduledjob'       => ['CoScheduledJob'],
			'cms_update'            => ['Update'],
			'cms_user'              => ['User'],
		    'cms_language'          => ['LanguageEntity'],
			'cms_pluginmodule'      => ['Module'],
			'cms_resource'          => ['Resource'],
			'pm_calendarinterval'   => ['Calendar'],
			'pm_customattribute'    => ['PMCustomAttribute'],
            'pm_attributevalue'     => ['PMCustomAttributeValue'],
			'cms_tempfile'          => ['TempFile'],
            'pm_tasktype'           => ['TaskTypeBase'],
            'pm_projectrole'        => ['ProjectRoleBase'],
            'emailqueue'            => ['EmailQueue']
        ];
	}

 	function getClass( $class_name )
 	{
		$class = $this->classes[strtolower($class_name)];

		if (is_array($class)) {
			$class_name = $class[0];

			if (!class_exists($class_name, false) && !empty(trim($class[1]))) {
			    $path = $class[2].$class[1];

			    if (strpos($path, SERVER_ROOT_PATH) === false) {
                    $path = SERVER_ROOT_PATH.$path;
                }

			    include($path);
			}
		}

		if (strtolower($class_name) === 'metaobject' ) {
		    return '';
        }

		return $class_name;
	}

	function getObject($class_name)
	{
		$use_class = $this->getClass( $class_name );

		if (empty(trim($use_class))) {
            return null;
        }

		return parent::getObject( $use_class );
	}

	function getObject2( $class_name, $parms )
	{
		$use_class = $this->getClass( $class_name );

        if (empty(trim($use_class))) {
            return null;
        }

		return parent::getObject2( $use_class, $parms );
	}

	function getLogger()
	{
 		try
 		{
 			if ( !is_object($this->logger) )
 			{
 				$this->logger = Logger::getLogger('System');
 			}

 			return $this->logger;
 		}
 		catch( Exception $e)
 		{
 			error_log('Unable initialize logger: '.$e->getMessage());
 		}
	}

	function error( $message )
	{
        if ( is_array($message) ) $message = var_export($message,true);

		$log = $this->getLogger();

        if (!is_object($log)) {
            return;
        }

		$log->error( $message );
	}

	function debug( $message )
	{
		if ( defined('DEBUG_ENABLED') && DEBUG_ENABLED ) {
			$log = $this->getLogger();
			if ( !is_object($log) ) return;
			$log->debug( $message );
		}
	}

	function info( $message )
	{
		$log = $this->getLogger();

		if (!is_object($log)) {
            return;
        }

		$log->info( $message );
	}

    public function trace()
    {
        $this->error(var_export(debug_backtrace(DEBUG_BACKTRACE_IGNORE_ARGS), true));
    }

	public static function get()
	{
    	global $model_factory;

    	if (!is_object($model_factory)) {
    		$model_factory = new ModelFactory(PluginsFactory::Instance(), getCacheService());
    	}

    	return $model_factory;
	}

	protected function getModelValidators() {
        return [
            new \ModelValidatorTypes(),
            new \ModelValidatorObligatory(),
        ];
    }

    protected function getModelMappers() {
 	    return [
            new \ModelDataTypeMappingMultiselect(),
 	        new \ModelDataTypeMappingPositives(),
            new \ModelDefaultValuesMapping(),
            new \ModelPasswordMapping(),
            new \ModelChecklistMapper(),
            new \ModelPermissionValuesMapping()
        ];
    }

	public function transformEntityData( $object, &$parms, $data = [], $validators = [], $mappers = [] )
    {
        $mapper = new \ModelMapper(
            array_merge(
                [new \ModelDataTypeMapper()], // convert data into database format
                $object->getMappers(),
                $this->getModelMappers()
            )
        );

        foreach( $object->getAttributesRequired() as $attribute ) {
            if ( array_key_exists($attribute, $parms) ) continue;
            $parms[$attribute] = $data[$attribute];
            if ( $object->getAttributeType($attribute) == 'wysiwyg' ) {
                $parms[$attribute] = html_entity_decode($parms[$attribute]);
            }
        }

        $mapper->map($object, $parms);

        $validator = new \ModelValidator(
            array_merge(
                $validators,
                $object->getValidators(),
                $this->getModelValidators()
            )
        );

        // validate field values
        $data       = array_merge($data, $parms);
        $message    = $validator->validate( $object, $data );

        if (!empty($message)) {
            throw new \Exception($message);
        }
    }

	public function createEntity($object, $parms, $validators = [], $mappers = [])
    {
        if (!$this->getAccessPolicy()->can_create($object)) {
            throw new \Exception("There is no permission to create entity of class " . get_class($object));
        }

        $alternativeKeyAttributes = $object->getAttributesByGroup('alternative-key');

        if (count($alternativeKeyAttributes) > 0) {
            $validators[] = new ModelValidatorUnique($alternativeKeyAttributes);
        }

        $this->transformEntityData($object, $parms, [], $validators, $mappers);

        $id = $object->add_parms($parms);

        if ($id < 1) {
            throw new \Exception("Unable create entity of class " . get_class($object));
        }

        $objectIt = $object->getExact($id);
        $this->notifyWorkflowChanges($objectIt);

        return $objectIt;
    }

    public function mergeEntity( $object, $parms, $validators = [], $mappers = [] )
    {
        if (!$this->getAccessPolicy()->can_create($object)) {
            throw new \Exception("There is no permission to merge entity of class " . get_class($object));
        }

        $this->transformEntityData($object, $parms, [], $validators, $mappers);

        if ( $parms['UID'] != '' ) {
            $objectIt = (new ObjectUID())->getObjectIt($parms['UID']);
            if ( $objectIt->getId() != '' )
            {
                return $this->modifyEntity($objectIt, $parms, $validators, $mappers);
            }
        }

        $alternativeKeyAttributes = $object->getAttributesByGroup('alternative-key');
        foreach( $alternativeKeyAttributes as $index => $key ) {
            if ( $parms[$key] == '' ) unset($alternativeKeyAttributes[$index]);
        }

        if ( count($alternativeKeyAttributes) > 0 )
        {
            $modifiedIt = $object->getRegistry()->Merge($parms, $alternativeKeyAttributes);

            if ( $parms['Transition'] != '' || $parms['State'] != '' ) {
                $this->notifyWorkflowChanges($modifiedIt);
            }

            return $modifiedIt;
        }
        else {
            $objectIt = $object->getRegistry()->Create($parms);
            $this->notifyWorkflowChanges($objectIt);

            return $objectIt;
        }
    }

    public function modifyEntity( $objectIt, $parms, $validators = array(), $mappers = array(), $disableNotifications = false )
    {
        if ( $parms['Transition'] != '' && $objectIt->object instanceof \MetaobjectStatable ) {
            if ( !$this->getAccessPolicy()->can_modify_attribute($objectIt->object, 'State') ) {
                throw new \Exception("There is no permission to modify state of entity " . get_class($objectIt->object));
            }
        }
        else if ( !$this->getAccessPolicy()->can_modify($objectIt) ) {
            throw new \Exception("There is no permission to modify entity of class " . get_class($objectIt->object));
        }

        $alternativeKeyAttributes = $objectIt->object->getAttributesByGroup('alternative-key');
        if ( count($alternativeKeyAttributes) > 0 ) {
            $parms[$objectIt->object->getIdAttribute()] = $objectIt->getId();
            $validators[] = new ModelValidatorUnique($alternativeKeyAttributes);
        }

        // reload object iterator to have all actual attributes
        $objectIt = $objectIt->object->getExact($objectIt->getId());

        $this->transformEntityData($objectIt->object, $parms, $objectIt->getData(), $validators, $mappers);

        if ( $objectIt->object->modify_parms($objectIt->getId(), $parms) < 1 ) {
            throw new \Exception("Unable modify entity of class " . get_class($objectIt->object) . ' id ' . $objectIt->getId());
        }

        getFactory()->resetCache();
        $modifiedIt = $objectIt->object->getExact($objectIt->getId());

        if ( !$disableNotifications ) {
            if ( $parms['Transition'] != '' || $objectIt->get('State') != $modifiedIt->get('State') ) {
                $this->notifyWorkflowChanges($modifiedIt);
            }
        }

        return $modifiedIt;
    }

    public function getEntities($object, $objectId) {
        return $object->getExact($objectId);
    }

    protected function notifyWorkflowChanges( $objectIt )
    {
        $data = [];

        foreach($objectIt->getData() as $key => $value) {
            if ($objectIt->object->IsAttributeVisible($key)) {
                $data[$key] = $value;
            }
        }

        getFactory()->getEventsManager()
            ->executeEventsAfterBusinessTransaction(
                $objectIt->copy(), 'WorklfowMovementEventHandler', $data
            );
    }
}

function getFactory()
{
    return ModelFactory::get();
}