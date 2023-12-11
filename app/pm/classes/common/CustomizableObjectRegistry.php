<?php

class CustomizableObjectRegistry extends ObjectRegistrySQL
{
 	protected $objects = array();
 	private $useTypes = false;

 	function add( $class_name, $key = '', $title = '' )
 	{
 		$this->objects[] = array( 
 			'key' => $key == '' ? strtolower($class_name) : $key,
			'title' => $title
 		);
 	}
 	
 	function Query( $parms = array() )
 	{
 		foreach( getSession()->getBuilders('CustomizableObjectBuilder') as $builder ) {
 		    $builder->build($this, $this->useTypes);
 		}
 		
 		$data = array();
 		foreach( $this->objects as $object )
 		{
            $title = $object['title'];
            if ( $title == '' && class_exists(getFactory()->getClass($object['key'])) ) {
                $title = getFactory()->getObject($object['key'])->getDisplayName();
            }
            if ( $title == '' ) continue;

 			$data[] = array (
 				'entityId' => $object['key'],
 				'ReferenceName' => $object['key'],
				'Caption' => $title
 			);
 		}
        usort( $data, function($left, $right) {
            return $left['Caption'] > $right['Caption'] ? 1 : -1;
        });

 		return $this->createIterator( $data );
 	}

	public function getData() {
		return $this->object;
	}

	public function useTypes( $value = true ) {
 	    $this->useTypes = $value;
    }
}