<?php

class EntityProjectPersister extends ObjectSQLPersister
{
    function getAttributes()
    {
        $attributes = ['ProjectCodeName'];
        if ( !$this->getObject()->IsAttributeStored('Project') ) {
            $attributes[] = 'Project';
        }
        return $attributes;
    }

    function getSelectColumns( $alias )
 	{
 		$columns = array(
			"(SELECT r.CodeName FROM pm_Project r WHERE r.VPD = t.VPD LIMIT 1) ProjectCodeName "
		);

		if ( !$this->getObject()->IsAttributeStored('Project') ) {
			$columns[] = "(SELECT r.pm_ProjectId FROM pm_Project r WHERE r.VPD = t.VPD LIMIT 1) Project ";
		}

		return $columns;
 	}

 	function IsPersisterImportant() {
        return true;
    }
}
