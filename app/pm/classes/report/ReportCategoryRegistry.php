<?php

class ReportCategoryRegistry extends ObjectRegistryArray
{
 	protected $reports = array();

 	function addCategory( $array )
 	{
 		array_push( $this->reports, $array );
 	}
 	
 	function createSQLIterator( $sql )
 	{
 	    $data_array = array();
 	    
 	    $vpd_value = array_shift($this->getObject()->getVpds());
 	    
 	    foreach( $this->reports as $key => $report )
 	    {
 	        $data = array();
 	        
    		$data['cms_ReportCategoryId'] = $key + 1;
    		$data['ReferenceName'] = $report['name'];
    		$data['Caption'] = $report['title'];
    		$data['VPD'] = $vpd_value;
    		
    		$data_array[] = $data;
 	    }
 	    
 		return $this->createIterator( $data_array );
 	}
}
