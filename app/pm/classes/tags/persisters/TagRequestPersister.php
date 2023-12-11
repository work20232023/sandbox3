<?php

class TagRequestPersister extends ObjectSQLPersister
{
    function getAttributes() {
        return array('Request');
    }

    function getSelectColumns( $alias )
 	{
 		return array( 
 			" ( SELECT COUNT(r.pm_ChangeRequestId) 
 				  FROM pm_RequestTag rt, pm_ChangeRequest r 
				 WHERE rt.Tag = {$this->getPK($alias)}
			       AND rt.Request = r.pm_ChangeRequestId 
			       ".(getSession()->IsRDD() ? "AND r.Type IS NOT NULL " : "")." ) Request "
 		);
 	}
}
