<?php

class ResourceSystemRegistry extends ResourceRegistry
{
 	private $records = array();

 	function addText( $key, $value, $original = '' )
 	{
		$this->records[$key] = array( 
            'cms_ResourceId' => $key,
	        'Caption' => $value == '' ? $key : $value,
	        'ResourceKey' => $key, 
		    'ResourceValue' => $value == '' ? $key : $value
		);
 	}
 	
 	function createSQLIterator( $sql )
 	{
 	    foreach( getSession()->getBuilders('ResourceBuilder') as $builder ) {
             if ( $builder instanceof ResourceBuilderTerminology ) continue;
     	    $builder->build( $this );
 	    }
 	 	return $this->createIterator( array_values($this->records) );
 	}
}