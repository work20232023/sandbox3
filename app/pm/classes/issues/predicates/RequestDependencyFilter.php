<?php

class RequestDependencyFilter extends FilterPredicate
{
    private $sourceIds = array();

    function __construct( $ids ) {
        $this->sourceIds = $ids;
        parent::__construct('dummy');
    }

    function _predicate( $filter ) {
        $idsString = join(',',$this->sourceIds);
        if ( $idsString == '' ) return " 1 = 2 ";

 		return " AND EXISTS (
 		                 SELECT 1 FROM pm_ChangeRequestLink l 
 			   			  WHERE t.pm_ChangeRequestId = l.SourceRequest
 			   			    AND l.TargetRequest IN ({$idsString})    
 			   			  UNION 
 			   			 SELECT 1 FROM pm_ChangeRequestLink l 
 			   			  WHERE t.pm_ChangeRequestId = l.TargetRequest
 			   			    AND l.SourceRequest IN ({$idsString})
 			   			    ) ";
 	}
}
