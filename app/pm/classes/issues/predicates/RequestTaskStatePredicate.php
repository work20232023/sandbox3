<?php

class RequestTaskStatePredicate extends FilterPredicate
{
 	function _predicate( $filter )
 	{
        $task = getFactory()->getObject('pm_Task');

 		switch ( $filter )
 		{
 			case 'notresolved':
		 		return " AND (
		 		            EXISTS (
		 		                SELECT 1 FROM pm_Task e 
		 			   		     WHERE e.ChangeRequest = t.pm_ChangeRequestId 
		 			   		       AND e.FinishDate IS NULL )
		 			   		OR NOT EXISTS (
		 			   		    SELECT 1 FROM pm_Task e
		 			   		      WHERE e.ChangeRequest = t.pm_ChangeRequestId )
		 			    ) ";
 				
 			default:
                $states = array_intersect(
                    \WorkflowScheme::Instance()->getStates($task),
                    preg_split('/,/', $filter)
                );
                if ( count($states) < 1 ) return " AND 1 = 2 ";

		 		return " AND (SELECT COUNT(1) FROM pm_Task e " .
		 			   "	   WHERE e.ChangeRequest = t.pm_ChangeRequestId " .
		 			   "		 AND e.State IN ('".join($states,"','")."') ) ".
                       "     = (SELECT COUNT(1) FROM pm_Task e WHERE e.ChangeRequest = t.pm_ChangeRequestId)";
 		}
 	}
}