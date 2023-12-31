<?php

include "permissions/AccessPolicy.php";
include "events/ModelEventsManager.php";
include "events/ModelEventsManagerDummy.php";
include "references/ModelReferenceRegistry.php";
include "ObjectMetadataRegistry.php";

class ModelFactoryBase
{
 	var $sql_log_enabled,
		$entities,
		$sql_cache,
		$sql_cache_enabled,
		$objects_cache;
 	
 	private $cache_service = null;
 	private $access_policy = null;
 	private $events_manager = null;
 	private $references = null;
 	private $metadata_registry = null;
    private $cache_key = '';

 	function __construct( $cache_service, $cache_key = 'global', $access_policy = null, $events_manager = null )
 	{
        $this->cache_key = $cache_key;

 		$this->setCacheService($cache_service);
 		$this->setAccessPolicy(
 			is_object($access_policy) ? $access_policy : new AccessPolicy($this->getCacheService(), $cache_key)
 		);
 		$this->setEventsManager(
 			is_object($events_manager) ? $events_manager : new ModelEventsManager()
 		);
 		 
 		$this->references = new ModelReferenceRegistry($this->getCacheService(), $cache_key);
 		$this->metadata_registry = new ObjectMetadataRegistry();
		$this->sql_log_enabled = false;
		$this->entities = array();
		$this->sql_cache = array();
		$this->sql_cache_enabled = true;
		$this->objects_cache = array();
	}
	
	public function setCacheService( $service )
	{
		$this->cache_service = $service;
	}
	
	public function getCacheService()
	{
		return $this->cache_service;
	}

	public function setCacheKey( $key ) {
        $this->cache_key = $key;
        $this->references->setCacheKey($this->cache_key);
        $this->getAccessPolicy()->setCacheKey($this->cache_key);
    }
	
	public function getAccessPolicy()
	{
		return $this->access_policy;
	}
	
	public function setAccessPolicy( $policy )
	{
		$this->access_policy = $policy;
	}
	
	public function getEventsManager()
	{
		return $this->events_manager;
	}
	
	public function setEventsManager( $manager )
	{
		$this->events_manager = $manager;
	}
	
	public function getModelReferenceRegistry()
	{
		return $this->references;
	}
	
	public function getMetadataRegistry()
	{
		return $this->metadata_registry;
	}
	
	function createInstance( $class_name, $parameters = null )
	{
	    if ( class_exists($class_name, false) )
	    {
	        $object = is_null($parameters) ? new $class_name : new $class_name($parameters);
	    }
	    else
	    {
	        $object = is_null($parameters) ? new Metaobject($class_name) : $parameters;
	    }
	    
	    return $object;
	}
	
	function getObject( $class_name ) 
	{
		$object = $this->createInstance( $class_name );
		
		$this->references->addObjectReferences($object);
		
		return $object;
	}

	function getObject2( $class_name, $parm1 ) 
	{
		$object = $this->createInstance( $class_name, $parm1 );
		
		$this->references->addObjectReferences($object);
		
		return $object;
	}
	
	function getVpdValue( $object ) {
		return '';
	}
	
	function getCachedIterator( $entity_ref_name, $sql )
	{
	    $iterator = $this->sql_cache[$entity_ref_name][md5($sql)];
		return is_object($iterator) ? $iterator->copyAll() : $iterator;
	}
	
	function cacheIterator( $entity_ref_name, $sql, $iterator )
	{
		if ( !$this->sql_cache_enabled ) return;
		$this->sql_cache[$entity_ref_name][md5($sql)] = $iterator->copyAll();
	}

	function resetCachedIterator( $object )
	{
		if ( !$this->sql_cache_enabled ) return;
        $this->sql_cache[$object->getEntityRefName()] = array();
	}
	
	function resetCache()
	{
		$this->objects_cache = array();
		$this->sql_cache = array();
	}

	
	
	function resetReferences()
	{
	    $this->reference_forward = array();
	    
	    $this->reference_backward = array();
	}
	
	function error( $message )
	{
	}
	
	function debug( $message )
	{
	}
}
