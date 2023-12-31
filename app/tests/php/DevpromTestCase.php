<?php

include_once SERVER_ROOT_PATH."core/classes/database/DALDummy.php";
include_once SERVER_ROOT_PATH."core/classes/user/User.php";
include_once SERVER_ROOT_PATH."core/classes/Resource.php";

class DevpromTestCase extends \PHPUnit\Framework\TestCase
{
    protected $dal_mock;
    protected $access_policy;
    protected $events_manager;
    
    function setUp()
    {
        global $model_factory, $session, $language;

        // prepare DAL
        
        $this->dal_mock =
            $this->getMockBuilder(DALDummy::class)
                ->disableOriginalConstructor()
                ->setMethods(['Query', 'GetAffectedRows'])
                ->getMock();
        $this->dal_mock->expects($this->any())->method('GetAffectedRows')->will( $this->returnValue(1) );
        
        $ref = new \ReflectionProperty('DAL', 'singleInstance');
		$ref->setAccessible(true);
		$ref->setValue(null, $this->dal_mock);

        $this->plugins_mock =
            $this->getMockBuilder(PluginsFactory::class)
                ->disableOriginalConstructor()
                ->setMethods(['buildPlugins'])
                ->getMock();

        $ref = new \ReflectionProperty('PluginsFactory', 'singleInstance');
        $ref->setAccessible(true);
        $ref->setValue(null, $this->plugins_mock);

		// prepare session
		$this->access_policy =
            $this->getMockBuilder(AccessPolicy::class)
                ->setConstructorArgs(array(CacheEngineVar::Instance()))
                ->setMethods(["check_access"])
                ->getMock();
        $this->access_policy->expects($this->any())->method('check_access')->will( $this->returnValue(true) );

        $this->events_manager =
            $this->getMockBuilder(ModelEventsManager::class)
                ->disableOriginalConstructor()
                ->setMethods(['getNotificators', 'notificationEnabled'])
                ->getMock();

        $this->events_manager->expects($this->any())
            ->method('notificationEnabled')->will( $this->returnValue(true) );
        $this->events_manager->expects($this->any())
            ->method('getNotificators')->will( $this->returnValue($this->getObjectNotificators()));
        
        $model_factory =
            $this->getMockBuilder(ModelFactoryProject::class)
                ->setConstructorArgs(array($this->plugins_mock, CacheEngineVar::Instance(), '', $this->access_policy, $this->events_manager))
                ->setMethods(['createInstance', 'getAccessPolicy', 'getEventsManager', 'getModelValidators'])
                ->getMock();

        $model_factory->expects($this->any())->method('getAccessPolicy')->will( $this->returnValue($this->access_policy) );
        $model_factory->expects($this->any())->method('getEventsManager')->will( $this->returnValue($this->events_manager) );
        $model_factory->expects($this->any())->method('getModelValidators')->will( $this->returnValue([]) );

    	$auth_factory =
            $this->getMockBuilder(AuthenticationFactory::class)
                ->disableOriginalConstructor()
                ->setMethods(['authorize'])
                ->getMock();
        $auth_factory->expects($this->any())->method('authorize')
            ->will($this->returnValue( 
            		(new UserIterator($this->getMockBuilder('User')->disableOriginalConstructor()->getMock()))
            				->setRowset( array( array(
						        			'cms_UserId' => 1,
						        			'IsAdministrator' => 'Y' 
						        		)))
            ));
        
    	$resource_mock = $this->getMockBuilder('Resource')
    			->disableOriginalConstructor()
    			->setMethods(array('getAll'))
    			->getMock();
        $resource_mock->expects($this->any())->method('getAll')
            ->will( $this->returnValue($resource_mock->getEmptyIterator()) );
        
        $language = new Language();
        $session = new SessionBase($auth_factory, null, $language);
    }
    
    function & getDALMock()
    {
        return $this->dal_mock;
    }

    function getObjectFactoryMock()
    {
        return $this->access_policy;
    }
    
    function getObjectNotificators()
    {
        return array();
    }
    
    function getSessionObject()
    {
    	global $session;
    	return $session;
    }
}
