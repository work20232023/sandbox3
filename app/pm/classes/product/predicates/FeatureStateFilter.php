<?php

class FeatureStateFilter extends FilterPredicate
{
 	function _predicate( $filter )
 	{
		switch ( $filter )
		{
			case 'closed':
				return " AND EXISTS (
				            SELECT 1 FROM pm_Function pa 
				             WHERE pa.ParentPath LIKE CONCAT('%,',t.pm_FunctionId,',%') 
				               AND pa.EstimatedFinishDate < CURDATE() 
				               ) ";
			case 'open':
                return " AND EXISTS (
                            SELECT 1 FROM pm_Function pa
                             WHERE pa.ParentPath LIKE CONCAT('%,',t.pm_FunctionId,',%')
                               AND COALESCE(pa.EstimatedFinishDate, CURDATE()) >= CURDATE()
                         ) ";

			default:
				return '';
		}
 	}
}
