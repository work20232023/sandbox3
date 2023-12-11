<?php

class SystemSettingsAdminProjectPersister extends ObjectSQLPersister
{
 	function modify( $object_id, $parms )
 	{
        global $session;

 		if ( $parms['AdminProject'] == '' ) return;

 		$session = new PMSession(getFactory()->getObject('Project')->getExact($parms['AdminProject']));
 		
		// setup permissions for public access
		$role = getFactory()->getObject('pm_ProjectRole');

		$role_it = $role->getByRef('ReferenceName', 'guest');

		$access = getFactory()->getObject('pm_AccessRight');

		$attributes = array (
				'ReferenceName' => 'project',
			    'ReferenceType' => 'Y',
			    'ProjectRole' => $role_it->getId()
		);
		
		$access_it = $access->getByRefArray($attributes);
		if ( $access_it->getId() < 1 )
		{
			$access->add_parms(
                array_merge(
                    $attributes,
                    ['AccessType' => 'view']
                )
            );
		}
		
		$attributes = array (
				'ReferenceName' => 'request',
				'ReferenceType' => 'Y',
				'ProjectRole' => $role_it->getId()
		);

		$access_it = $access->getByRefArray($attributes);
		if ( $access_it->getId() < 1 )
		{
			$access->add_parms(
                array_merge(
                    $attributes,
                    ['AccessType' => 'modify']
                )
            );
		}
 	}
 	
 	function getSelectColumns( $alias )
 	{
 		return array();
 	}
}