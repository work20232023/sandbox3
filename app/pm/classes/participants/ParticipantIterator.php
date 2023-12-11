<?php

class ParticipantIterator extends OrderedIterator
{
    function get( $attr_name )
	{
		switch ( strtolower($attr_name) )
		{
			case 'password':
				
			    $user_it = $this->getRef('SystemUser');
				
				if ( is_object($user_it) )
				{
					return $user_it->get_native($attr_name);
				}
				else
				{
					return '';
				}

			default:
			    return parent::get( $attr_name );
		}
	}

 	function getRoles()
 	{
 		if ( $this->getId() < 1 ) return array(0); // guest

 		if ( $this->get('ProjectRole') == '' ) {
			$roles = getFactory()->getObject('pm_ProjectRole')->getByRef('ReferenceName', 'linkedguest')->getId();
			if ( $roles == '' ) return array(0); // guest
 		}
		else {
			$roles = $this->get('ProjectRole');
		}

 		return array_filter( preg_split('/,/', $roles),
				function($value) {
					return $value > 0;
				}
		);
	}

	function isActive()
	{
		return true;
	}
	
	/*
	 * returns total capacity of the participant
	 */
	function getCapacity()
	{
		return $this->get('Capacity');
	}
	
	/*
	 * returns capacity of the participant per role
	 */
	function getCapacityByRoles( $roles )
	{
		$sql = " SELECT IFNULL(ROUND(SUM(r.Capacity)), 0) Result " .
				"  FROM pm_ParticipantRole r, pm_ProjectRole p" .
				" WHERE r.Participant = ".$this->getId().
				"   AND r.Project = ".$this->get('Project').
				"   AND r.ProjectRole = p.pm_ProjectRoleId" .
				"   AND p.ProjectRoleBase IN ( ".join(',', $roles)." )";
		
		$it = $this->object->createSQLIterator($sql);
		return $it->get('Result');
	}

	/*
	 * returns capacity of the participant per role
	 */
	function getCapacityByRole( $role_id )
	{
		return $this->getCapacityByRoles( array($role_id) );
	}

	function getDevelopmentCapacity()
	{
		return $this->getCapacityByRole( 2 );
	}
	
	function getTestingCapacity()
	{
		return $this->getCapacityByRole( 3 );
	}
}