<?php
include SERVER_ROOT_PATH.'/cms/c_view.php';
include_once SERVER_ROOT_PATH.'core/methods/FilterFreezeWebMethod.php';
include_once SERVER_ROOT_PATH.'core/methods/BulkDeleteWebMethod.php';
include_once SERVER_ROOT_PATH."core/methods/DeleteObjectWebMethod.php";
include_once SERVER_ROOT_PATH."core/methods/ModifyAttributeWebMethod.php";
include_once SERVER_ROOT_PATH."core/methods/AutoSaveFieldWebMethod.php";
include_once SERVER_ROOT_PATH."core/methods/FilterObjectMethod.php";
include_once SERVER_ROOT_PATH."core/methods/FilterCheckMethod.php";
include_once SERVER_ROOT_PATH."core/methods/FilterDateWebMethod.php";
include_once SERVER_ROOT_PATH."core/methods/FilterDateIntervalWebMethod.php";
include_once SERVER_ROOT_PATH."core/methods/FilterTextWebMethod.php";
include_once SERVER_ROOT_PATH.'core/methods/ObjectCreateNewWebMethod.php';
include_once SERVER_ROOT_PATH.'core/methods/FilterReferenceWebMethod.php';
include_once SERVER_ROOT_PATH."core/methods/ViewSubmmitedBeforeDateWebMethod.php";
include_once SERVER_ROOT_PATH."core/methods/ViewSubmmitedAfterDateWebMethod.php";
include_once SERVER_ROOT_PATH.'core/methods/ExcelExportWebMethod.php';

class PageTable extends ViewTable
{
 	var $rows, $filters, $filter_values, $page, $view;
 	private $system_attributes = array();
 	private $persistent_filter = null;
 	private $filter_defaults = array();
	private $filters_name = '';
	const FILTER_OPTIONS = array('all','hide','');
 	
 	function PageTable( $object )
 	{
		parent::ViewTable( $object );
 		$this->system_attributes = $this->buildSystemAttributes();
 	}
 	
 	function buildSystemAttributes()
 	{
	    $system_attributes = $this->getObject()->getAttributesByGroup('system');

	    if ( in_array('State', $system_attributes) ) unset( $system_attributes[array_search('State', $system_attributes)] );
 		
	    return $system_attributes;
 	}
 	
 	function getId()
 	{
 	    return md5(get_class($this));
 	}

	function getListIterator()
	{
		$it = parent::getListIterator();
		if ( in_array($this->getMode(), array('chart','graph')) ) {
			return $this->getListRef()->buildDataIterator();
		}
		return $it;
	}

 	function setPage( & $page )
 	{
 	    $this->page = $page;
 	}
 	
 	function getPage()
 	{
 	    return $this->page;
 	}
 	
	function getMode()
	{
		return $_REQUEST['view'] != '' ? $_REQUEST['view'] : $_REQUEST['module'];
	}

  	function getSection()
 	{
 	    return 'co';
 	}

 	protected function getPersistentFilter()
 	{
 		if ( is_object($this->persistent_filter) ) return $this->persistent_filter;
 		
		$filter = new FilterFreezeWebMethod();

		$filter->setFilter( $this->getFiltersName() );
		
		return $this->persistent_filter = $filter;
 	}
 	
 	function getFilters()
 	{
 	    return array();
 	}

	function getFiltersName()
	{
		if ( $this->filters_name != '' ) return $this->filters_name;
		return $this->filters_name = $this->buildFiltersName();
	}

	function buildFiltersName() {
		return md5(strtolower(get_class($this)));
	}
	
 	function getFilterPredicates( $values )
 	{
 	    $predicates = $this->buildAttributesPredicates($values);
 	    $predicate = $this->buildSearchPredicate($values);
 	    if ( is_object($predicate) ) {
            $predicates[] = $predicate;
        }
 		return $predicates;
 	}

 	function buildSearchPredicate($values) {
 	    return new FilterSearchAttributesPredicate(
                $values['search'], $this->getObject()->getSearchableAttributes()
            );
    }

    function buildAttributesPredicates( $values )
    {
        $predicates = array();
        $attributes = $this->getObject()->getAttributesStored();
        $loweredAttributes = array_diff(
                array_map(function($value) {
                        return strtolower($value);
                    }, $attributes),
                array(
                    'state', 'project'
                )
        );
        foreach( $values as $key => $value ) {
            if ( $value == '' ) continue;
            if ( !in_array($key, $loweredAttributes) ) continue;
            $predicates[] = new FilterAttributePredicate($attributes[array_search($key, $loweredAttributes)], $value);
        }
        return $predicates;
    }

	function buildFilters()
	{
	    if ( count($this->filters) > 0 ) return $this->filters;
	
	    $this->filters = $this->getFilters();
	
	    $plugins = getFactory()->getPluginsManager();
	    
	    $plugins_interceptors = is_object($plugins) ? $plugins->getPluginsForSection($this->getSection()) : array();
	
	    foreach( $plugins_interceptors as $plugin )
	    {
	        $plugin->interceptMethodTableGetFilters( $this, $this->filters );
	    }

	    return $this->filters;
	}

	function getFilterValues()
	{
		if ( is_array($this->filter_values) ) return $this->filter_values;

		// filter parms driven by filters
		$this->filter_values = $this->buildFilterValuesByDefault($this->filters);
		$filter_keys = array();
        $persistent_filter = $this->getPersistentFilter();

        // apply persisted filters settings
        foreach ( $this->filters as $filter )
        {
            $filter_name = $filter->getValueParm();
            $filter_keys[] = $filter_name;
            $filter->setFilter($this->getFiltersName());
            if ( $this->getFilterIds() == '' ) {
                $filter->setFreezeMethod($persistent_filter);
                $value = $filter->getPersistedValue();
                if ( !is_null($value) && $value != '' ) {
                    $this->filter_values[$filter_name] = $value;
                    continue;
                }
            }
            $default_value = $filter->getValue();
            if ( $this->getFilterIds() != '' || $default_value == '' || array_key_exists($filter_name,$this->filter_values) ) continue;
            $this->filter_values[$filter_name] = $default_value;
        }

        if ( is_object($persistent_filter) ) {
            // backward compatiibility to old settings
            foreach( $this->getFilterParms() as $parm )
            {
                if ( !$this->IsFilterParmPersisted($parm) ) continue;
                $filter_value = $persistent_filter->getValue($parm);
                if ( $filter_value == '' ) continue;
                if ( $parm == 'hide' )
                {
                    // backward compatibility
                    $columns = array_unique(preg_split('/-/', $persistent_filter->getValue('show')));
                    $filter_value = join('-',array_diff(preg_split('/-/',$filter_value), $columns));
                }
                $this->filter_values[$parm] = $filter_value;
            }
        }
		$this->filter_defaults = $this->filter_values;

		// apply web-session based filters settings
		foreach( array_merge($filter_keys, $this->getFilterParms()) as $parm )
		{
		    if ( !array_key_exists($parm, $_REQUEST) ) continue;
            $this->filter_values[$parm] = stripslashes($_REQUEST[$parm]);
		}

		return $this->filter_values;
	}

	public function getPredicateFilterValues()
    {
        $values = $this->getFilterValues();

        $values = array_map(
            function($value) {
                return SystemDateTime::parseRelativeDateTime($value, getLanguage());
            },
            $values
        );

        foreach( $this->buildFilters() as $filter ) {
            array_walk( $values, function(&$value, $key) use($filter) {
                if ( $filter->getValueParm() == $key ) {
                    $value = $filter->parseFilterValue($value, $this->getObject());
                }
            });
        }

        return $values;
    }

	public function buildFilterValuesByDefault( & $filters )
	{
		$values = array();

		foreach( array('sort', 'sort2', 'sort3', 'sort4') as $parm ) {
		    $values[$parm] = $this->getSortDefault($parm);
		}
		$values['color'] = $this->getDefaultColorScheme();

		$visibleAttributes = array();
		$attributes = array_diff(
		    array_keys($this->getObject()->getAttributes()),
            $this->getObject()->getAttributesByGroup('system')
        );

		foreach( $attributes as $attribute ) {
            if ( !$this->getObject()->IsAttributeVisible($attribute) ) continue;
		    if ( in_array($this->getObject()->getAttributeType($attribute),array('char','password')) ) continue;
		    $visibleAttributes[] = $attribute;
        }
        $values['show'] = join("-", array_unique($visibleAttributes));

        foreach( $this->filters as $filter ) {
            if ( ! $filter instanceof FilterWebMethod ) continue;
            $defaultValue = $filter->getDefaultValue();
            if ( $defaultValue != '' ) {
                if ( $this->getFilterIds() != '' && $defaultValue != 'all' ) continue;
                $values[$filter->getValueParm()] = $defaultValue;
            }
        }

		return $values;
	}
	
	function resetFilterValues()
	{
		$this->filter_values = null;
	}
	
	function setFilterValue( $filter, $value )
	{
	    $this->filter_values[$filter] = $value;
	}

	function getFilterIds() {
		if ( $_REQUEST['wait'] == 'true' ) return '';
        if ( $_REQUEST['ids'] != '' || array_key_exists('clear', $_REQUEST) ) return '0';
		return $_REQUEST[strtolower(get_class($this->getObject()))];
	}

	function getFilterParms()
	{
		return array_merge(
            array(
                'rows',
                'group',
                'sort',
                'sort2',
                'sort3',
                'sort4',
                'show',
                'hide',
                'aggby',
                'aggregator',
                'infosections',
                'hiddencolumns',
                'chartlegend',
                'chartdata',
                'addobjects',
                'color',
                'groupfunc',
                'sortgroup',
                'search',
                'target',
            ),
            array_diff(
                array_map(function($value) {
                        return strtolower($value);
                    }, $this->getObject()->getAttributesStored()),
                array(
                    'project'
                )
            )
        );
	}

	function IsFilterParmPersisted( $parm ) {
 	    switch ($parm) {
            case 'infosections':
                return false;
        }
        return true;
    }
	
	function IsFilterPersisted()
	{
	    if ( !array_key_exists('filterlocation', $_REQUEST) ) return true;

	    foreach( array_keys($this->filter_values) as $parm )
	    {
	        if ( $parm == 'infosections' && $this->filter_defaults[$parm] == '' ) continue;
	        if ( $this->filter_values[$parm] != $this->filter_defaults[$parm] )
	        {
	            return false;
	        }
	    }
	    foreach ( $this->filters as $filter )
	    {
	        if ( !in_array($_REQUEST[$filter->getValueParm()], array('hide','all')) ) continue;
	        if ( $_REQUEST[$filter->getValueParm()] != $this->filter_defaults[$filter->getValueParm()] )
	        {
	            return false;
	        }
	    }

	    return true;
	}
	
	function IsNeedLinks()
	{	
		return false;
	}
	
	function getActions() {
		return array();
	}

	function getExportActions()
	{
	}

	function getDeleteActions()
	{
		if( !$this->IsNeedToDelete() ) return array();
		if( !is_object($this->getListRef()) ) return array();
		if( !$this->getListRef() instanceof PageBoard ) return array();
		
		return array (
			array( 
					'name' => translate('Выбрать все'),
					'url' => 'javascript: checkRowsTrue(\''.$this->getListRef()->getId().'\');',
					'title' => text(969)
			)
		);
	}
	
	function getNewActions()
	{
		$actions = array();
		if( !$this->IsNeedToAdd() ) return $actions;

		$object = $this->getObject();
		if ( !is_object($object) ) return $actions;

		$method = new ObjectCreateNewWebMethod($object);
		if ( $method->hasAccess() ) {
			$uid = strtolower('new-'.get_class($this->getObject()));
			$actions[$uid] = array (
					'name' => translate('Добавить'),
					'uid' => $uid,
					'url' => $method->getJSCall(
                                array(
                                    'area' => $this->getPage()->getArea()
                                )
							 ) 
			);
		}
		return $actions;
	}

    function getFilterMoreActions()
    {
        $actions = array();

        $filter = $this->getPersistentFilter();
        if ( is_object($filter) )
        {
            $persisted = $this->IsFilterPersisted() && $filter->getQueryString() != '';
            $parms = array (
                'url' => $filter->url(
                    "li[uid=personal-persist]>a",
                    $persisted,
                    "function() { hidePersistButton(); ".($persisted ? "filterLocation.restoreFilter();" : "")." }"
                ),
                'name' => $persisted ? text(2112) : $filter->getCaption(),
                'title' => !$persisted ? $filter->getDescription() : '',
                'uid' => 'personal-persist',
                'persisted' => $persisted
            );
            if ( !$persisted ) {
                $parms['multiselect'] = true;
            }
            $actions = array_merge($actions, array( 'personal-persist' => $parms ));
        }

        return $actions;
    }

    function getFilterActions()
	{
		return array();
	}

	function buildBulkActionIt()
    {
        $action = new BulkAction($this->getObject());
        return $action->getAll();
    }

	function getBulkActions()
	{
        $filterValues = $this->getFilterValues();
        $action_it = $this->buildBulkActionIt();

		$workflow_actions = array();
		$delete_actions = array();
		$modify_actions = array();
		$custom_actions = array();
		
		$url = '?formonly=true';

		$filterItems = \TextUtils::parseFilterItems($filterValues['target']);
		$projectSelected = array_shift($filterItems);
		if ( $projectSelected != '' ) {
            $codeName = getFactory()->getObject('Project')
                            ->getExact($projectSelected)->get('CodeName');
            if ( $codeName != '' ) {
                $url .= '&project='.$codeName;
            }
        }
		
		while( !$action_it->end() )
		{
			$action_url = "javascript:processBulk('".$action_it->get('Caption')."','".$url.'&operation='.$action_it->getId()."');";
			switch( $action_it->get('package') )
			{
			    case 'workflow':
			    	$workflow_actions[$action_it->get('ReferenceName')][] = array (
			    		'name' => $action_it->get('Caption'),
			    		'url' => $action_url
			    	);
			    	break;
			    case 'delete':
			    	$delete_actions[] = array (
			    		'uid' => 'bulk-delete',
			    		'name' => $action_it->get('Caption'),
			    		'url' => $action_url
			    	);
			    	break;
			    case 'modify':
			    	$modify_actions[] = array (
			    		'name' => $action_it->get('Caption'),
			    		'url' => $action_url
			    	);
			    	break;
				case 'action':
					$custom_actions[] = array (
						'name' => $action_it->get('Caption'),
						'uid' => $action_it->get('OrderNum'),
						'url' => $action_url
					);
					break;
				case 'url':
					$custom_actions[] = array (
						'name' => $action_it->get('Caption'),
						'url' => $action_it->getId()
					);
					break;
			}
			
			$action_it->moveNext();
		}
		return array (
				'workflow' => $workflow_actions,
				'delete' => $delete_actions,
				'modify' => $modify_actions,
				'action' => $custom_actions
		);
	}
	
	function getList( $mode = '' )
	{
		return null;
	}
	
	function setList( $list )
	{
		if ( is_subclass_of($list, 'PageList') )
		{
			$list->setTable( $this );
		}
		
		parent::setList( $list );
	}
	
	function getRowsOnPage()
	{
	    $values = $this->getFilterValues();
	    return $values['rows'] == 'all'
				? 9999 : (
					is_numeric($values['rows'])
							? $values['rows']
							: $this->getDefaultRowsOnPage()
				);
	}

 	function getDefaultRowsOnPage() {
		return 60;
	}
	
 	function getSortFields()
	{
		$list = $this->getListRef();
		
		if ( !is_object($list) ) return array();
		
		if ( is_a($list, 'PageChart') ) return array();
	    
		$object = $this->getObject();
	    
		$attributes = array_keys($object->getAttributes());
		
	    $fields = array();

	    $uid = new ObjectUID();
	    if ( $uid->hasUidObject($object) ) {
            $fields[] = 'UID';
        }

		foreach( $attributes as $key => $field )
		{
		    $db_type = $object->getAttributeDbType($field);
		    
			if ( $db_type == '' ) continue;
			
			$type = $object->getAttributeType($field);

			if ( in_array($type, array('text','wysiwyg','password','file')) && $field != 'State' ) continue;

			if ( $object->getAttributeUserName($field) == '' ) continue;
			
			$fields[] = $field;
		}

		$fields = array_diff($fields, $this->system_attributes);		

		return $fields;
	}

 	function getSortAttributeClause( $field )
	{
	    $parts = preg_split('/\./', $field);
	    if ( $parts[0] == 'UID' ) {
	        return new SortUIDClause($parts[1] == 'D' ? 'DESC' : 'ASC');
        }

	    if ( !$this->getObject()->hasAttribute($parts[0]) ) return null;
	    if ( $this->getObject()->IsReference($parts[0]) ) {
	        $refObject = $this->getObject()->getAttributeObject($parts[0]);
	        if ( $refObject->IsDictionary() && $refObject->hasAttribute('ReferenceName') && $refObject->getEntityRefName() != 'entity' ) {
	            return new SortReferenceNameClause($refObject, $parts[0]);
            }
        }

		return new SortAttributeClause( $field );
	}
	
 	function getSortDefault( $sort_parm = 'sort' )
	{
	    foreach( $this->getObject()->getSortDefault() as $sort ) {
	        if ( $sort instanceof SortOrderedClause ) {
	            return 'OrderNum.A';
            }
            if ( $sort instanceof SortAttributeClause ) {
                return $sort->getAttributeName();
            }
        }

		$sort = array_shift($this->getSortFields());
		return $sort != '' ? $sort : 'none';
	}
	
	function getSort( $sort_parm = 'sort' )
	{
	    $values = $this->getFilterValues();

		if ( $values[$sort_parm] == '' )
		{
			return $this->getSortDefault( $sort_parm );
		}
		else
		{
			return $values[$sort_parm];
		}
	}
	
	function getDefaultColorScheme()
	{
		return 'priority';
	}
	
	function draw( $view = null )
	{
	}
	
	function drawScripts()
	{
		$values = $this->getFilterValues();
		?>
		<script type="text/javascript">
			filterLocation.visibleColumns = ['<? echo join(preg_split('/-/', trim(SanitizeUrl::parseScript($values['show']), '-')),"','") ?>'];
			filterLocation.hiddenColumns = ['<? echo join(preg_split('/-/', trim(SanitizeUrl::parseScript($values['hide']), '-')),"','") ?>'];
			<?php foreach( $values as $key => $value ) { ?>
			    filterLocation.parms['<?=$key?>'] = '<?=SanitizeUrl::parseUrl($value)?>';
			<?php } ?>
		</script>
		<?php				
	}
	
	function drawFooter()
	{
	}
	
	function getDescription()
	{
	    return "";
	}
	
	function getRenderParms( $parms )
	{
        $this->buildFilters();
        $this->getListIterator();

		$parms = array_merge($parms, array(
			'table' => $this,
            'list' => $this->getListRef(),
            'leftPaneTemplate' => $this->getLeftPaneTemplate(),
            'leftPaneParameters' => $this->getLeftPaneParameters(),
            'leftPaneVisible' => $this->getLeftPaneVisible(),
            'placeholderClass' => 'placeholder-fixed'
		));

		if ( $this->getPage()->showFullPage() ) {
			$parms = array_merge($parms, $this->getFullPageRenderParms($parms));
		}
		
		return $parms;
	}

	function renderFilter( &$filter, $filterValues )
    {
    }

    function getFilterItems()
    {
        $this->buildFilters();
        $filter_values = $this->getFilterValues();
        $filter_items = array();

        if ( $_REQUEST['parameter'] != '' ) {
            $filter_values = \TextUtils::parseAttributeFilter($filter_values[$_REQUEST['parameter']]);
        }

        foreach ( $this->filters as $filter )
        {
            if ( !$filter->hasAccess() ) continue;
            $this->renderFilter($filter, $filter_values);

            $filter->setFilter( $this->getFiltersName() );
            if ( is_object($filter->getFreezeMethod()) ) $filter->getFreezeMethod()->setValues($filter_values);

            $filterId = $filter->getCaption();
            if ( $filter instanceof SelectDateRefreshWebMethod )
            {
                if ( array_key_exists($filterId, $filter_items) ) {
                    $filter_items[$filterId]['valueRight'] = array_shift(\TextUtils::parseFilterItems($filter->getValue()));
                    $filter_items[$filterId]['nameRight'] = $filter->getValueParm();
                }
                else {
                    $filter_items[$filterId] = array (
                        'caption' => $filter->getCaption(),
                        'class' => get_class($filter),
                        'value' => array_shift(\TextUtils::parseFilterItems($filter->getValue())),
                        'name' => $filter->getValueParm()
                    );
                }
            }
            else if ( is_a($filter, 'FilterWebMethod') )
            {
                $filter_items[$filterId] = array (
                    'type' => $filter->getType(),
                    'name' => $filter->getName(),
                    'caption' => $filter->getCaption(),
                    'options' => array_map(function($item) { return htmlentities($item, ENT_NOQUOTES); }, $filter->getValues()),
                    'value' => $filter_values[$filter->getName()],
                    'class' => get_class($filter),
                    'attribute' => $filter->getType() != 'singlevalue' ? 'multiple' : '',
                    'lazyurl' => ''
                );
                if ( $filter instanceof FilterObjectMethod ) {
                    $filter_items[$filterId]['lazyurl'] = $filter->getLazyLoad() ? $filter->getLazyLoadUrl() : '';

                    $values = \TextUtils::parseFilterItems($filter_items[$filterId]['value']);
                    $options = array_map(
                            function($item) {
                                return trim($item);
                            }, array_keys($filter_items[$filterId]['options'])
                        );
                    $options = explode(',',join(',',$options));

                    $filter_items[$filterId]['options'] = array_merge(
                        $filter_items[$filterId]['options'],
                        $filter->getValuesText(array_diff($values, $options))
                    );
                }
            }
        }

        ksort($filter_items);
        return $filter_items;
    }

	function getFullPageRenderParms( $parms )
	{
        $filter_values = $this->getFilterValues();

        $filter_buttons = array();
        foreach ( $this->filters as $filter ) {
            if ( !$filter->hasAccess() ) continue;
            $this->renderFilter($filter, $filter_values);

            $filter->setFilter( $this->getFiltersName() );
            if ( is_object($filter->getFreezeMethod()) ) $filter->getFreezeMethod()->setValues($filter_values);

            $values = array_diff(
                TextUtils::parseItems($filter_values[$filter->getValueParm()], ','),
                array(
                    'all', 'hide'
                )
            );
            if ( count($values) < 1 ) continue;

            $filterId = $filter->getCaption();
            if ( !is_a($filter, 'FilterWebMethod') )
            {
                if ( array_key_exists($filterId, $filter_buttons) ) {
                    $filter_buttons[$filterId]['value'] = sprintf(
                        text(3121), $filter_buttons[$filterId]['value'], $filter->getValue()
                    );
                }
                else {
                    $filter_buttons[$filterId] = array (
                        'caption' => $filter->getCaption(),
                        'value' => $filter->getValue(),
                        'name' => $filter->getValueParm()
                    );
                }
            }
            else {
                $filter_options = array_filter(
                    $filter->getValues(),
                    function($item,$key) use($values) {
                        return count(array_intersect(\TextUtils::parseItems($key), $values)) > 0;
                    },
                    ARRAY_FILTER_USE_BOTH
                );

                if ( $filter instanceof FilterObjectMethod ) {
                    $filter_options = array_unique( array_merge(
                        $filter_options, $filter->getValuesText($values)
                    ));
                }

                $filter_buttons[$filterId] = array (
                    'caption' => $filter->getCaption(),
                    'value' => join(', ',$filter_options),
                    'name' => $filter->getValueParm()
                );
            }
        }
        ksort($filter_buttons);

	    $new_actions = $this->getNewActions();
	    $actions = $this->getActions();

	    if ( $this->getListRef() instanceof PageChart ) {
            $export_actions = $this->getListRef()->getExportActions();
        }
        else {
            $export_actions = $this->getExportActions();
        }
		if ( count($export_actions) > 1 ) {
			$actions[] = array();
			$actions[] = array(
				'name' => translate('Экспорт'),
				'items' => $export_actions,
				'uid' => 'export'
			);
		}
		if ( count($export_actions) == 1 ) {
			$actions = array_merge($actions, $export_actions);
		}

		$plugins = getFactory()->getPluginsManager();
		$plugins_interceptors = is_object($plugins)
				? $plugins->getPluginsForSection(getSession()->getSite()) : array();
		
		foreach( $plugins_interceptors as $plugin ) {
			$plugin->interceptMethodTableGetActions( $this, $actions );
            $plugin->interceptMethodTableGetNewActions( $this, $new_actions );
		}
	    
	    $delete_actions = $this->getDeleteActions();
   
	    if ( count($delete_actions) > 0 ) {
	    	if ( $actions[array_pop(array_keys($actions))]['name'] != '' ) $actions[] = array();
	    	$actions = array_merge($actions, $delete_actions);
	    }

        $additional_actions = array();
        if ( count($new_actions) > 0 ) {
            $additional_actions[] = array (
                'name' => translate('Добавить'),
                'items' => $new_actions
            );
        }

        return array_merge($parms, array(
            'filter_visible' => count($this->filters) > 0,
            'filter_buttons' => $filter_buttons,
            'filter_search' =>
                array(
                    'searchable' => $this->getObject() instanceof Metaobject
                        && $this->getObject()->getSearchableAttributes(),
                    'value' => addslashes(join(' ', \TextUtils::parseFilterItems($filter_values['search']))),
                ),
            'filter_modified' => !$this->IsFilterPersisted(),
            'actions' => $actions,
            'filterMoreActions' => $this->getFilterMoreActions(),
            'additional_actions' => $additional_actions,
			'bulk_actions' => $this->getBulkActions(),
            'sliderClass' => 'list-slider-2'
		));
	}

	function getTemplate() {
		return "core/PageTable.php";
	}

    function getLeftPaneTemplate() {
         return '';
    }

    function getLeftPaneParameters() {
         return array();
    }

    function getLeftPaneVisible() {
         return false;
    }

	function getReferencesListWidget( $parm, $referenceName ) {
		return getFactory()->getObject('Module')->getEmptyIterator();
	}

	function render( $view, $parms )
	{
		$this->view = $view;

        if ( $_REQUEST['settings'] == 'true' ) {
            echo $view->render( "core/PageTableFilterSettings.php", array(
                'filter_items' => $this->getFilterItems()
            ));
        }
        elseif ( $_REQUEST['view-settings'] == 'true' ) {
            $list = $this->getList($this->getMode());
            $this->setList($list);
            $list->extendModel();
            $titles = array();
            foreach( $this->getObject()->getAttributes() as $attribute => $data ) {
                $titles[$attribute] = $this->getObject()->getAttributeDescription($attribute);
            }
            echo $view->render( "core/PageTableViewSettings.php", array(
                'parms' => $list->getSettingsViewParms(),
                'titles' => $titles
            ));
        }
        else {
            $this->touch();
            echo $view->render( $this->getTemplate(), $this->getRenderParms($parms) );
        }
	}

	function getRenderView() {
 	    return $this->view;
    }

	function touch() {
		\FeatureTouch::Instance()->touch($this->getPage()->getModule());
	}

    function getIds( $values )
    {
        $keyFilter = strtolower(get_class($this->getObject()));
        $ids = $_REQUEST[$keyFilter];
        if ( $ids == '' ) {
            $ids = $_REQUEST[$this->getObject()->getIdAttribute()];
        }
        if ( $ids == '' ) {
            $ids = $_REQUEST['ids'];
        }
        if ( $ids == '' ) {
            $ids = $values[$keyFilter];
        }
        return \TextUtils::parseIds($ids);
    }
}
