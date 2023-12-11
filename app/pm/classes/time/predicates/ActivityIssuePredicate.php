<?php

class ActivityIssuePredicate extends FilterPredicate
{
 	function _predicate( $filter )
 	{
        $ids = \TextUtils::parseIds($filter);
        if ( count($ids) < 1 ) return " AND 1 = 2 ";

        $idsString = join(',',$ids);
		return " AND (t.Issue IN ({$idsString}) OR 
		              EXISTS (SELECT 1 FROM pm_Task s WHERE s.ChangeRequest IN ({$idsString})
			   			         AND s.pm_TaskId = t.Task)) ";
 	}
}
