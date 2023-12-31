<?php

class FeatureRequestPersister extends ObjectSQLPersister
{
    function getAttributes()
    {
        return array(
            'Request', 'Fact'
        );
    }

    function getSelectColumns( $alias )
 	{
 		return array( 
 			"( SELECT GROUP_CONCAT(CAST(l.pm_ChangeRequestId AS CHAR)) 
			     FROM pm_ChangeRequest l 
			    WHERE l.Function = {$this->getPK($alias)} LIMIT 101 ) Request ",

			"( SELECT SUM(l.Fact)
			     FROM pm_ChangeRequest l, pm_Function fn
			    WHERE l.Function = fn.pm_FunctionId 
                  AND fn.ParentPath LIKE CONCAT({$alias}.ParentPath, '%') ) Fact "
 		);
 	}
}
