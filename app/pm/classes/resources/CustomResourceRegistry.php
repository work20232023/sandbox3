<?php

class CustomResourceRegistry extends ResourceRegistry
{
 	function createSQLIterator( $sql )
 	{
 	    if ( !$this->getObject()->getCacheEnabled() )
 	    {
 	    	return ObjectRegistrySQL::createSQLIterator( $sql );
 	    }
 	    
 	    parent::createSQLIterator( $sql );
 	    
 	    $records = $this->getRecords();

 	    // import globally defined resources into the current project
 	    $vpd_value = array_shift($this->getObject()->getVpds());

 	    foreach( $records as $key => $record ) $records[$key]['VPD'] = $vpd_value;

 	    if ( !getSession()->getProjectIt()->IsPortfolio() )
 	    {
	 	    // override original values with custom ones
	 	    $it = ObjectRegistrySQL::createSQLIterator( $sql );
	 	    
	 	    while( !$it->end() )
	 	    {
	 	        if ( !array_key_exists($it->get('ResourceKey'), $records) ) 
	 	        {
	 	            $it->moveNext();
	 	            
	 	            continue;
	 	        }
	 	        
	 	        $records[$it->get('ResourceKey')]['ResourceValue'] = $it->getHtmlDecoded('ResourceValue');
	 	        $records[$it->get('ResourceKey')]['Caption'] = $it->getHtmlDecoded('ResourceValue');
	 	        $records[$it->get('ResourceKey')]['OriginalId'] = $it->getId();
	 	        
	 	        $it->moveNext();
	 	    }
 	    }

 	    usort($records, function($left, $right) {
             return mb_strlen($left['Caption']) > mb_strlen($right['Caption']);
        });
 	    
 	    return $this->createIterator( array_values($records) );
 	}	
} 