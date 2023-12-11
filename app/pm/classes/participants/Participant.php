<?php
include "ParticipantIterator.php";
include "predicates/ParticipantActivePredicate.php";
include "predicates/ParticipantBaseRoleNamePredicate.php";
include "predicates/ParticipantBaseRolePredicate.php";
include "predicates/ParticipantIterationInvolvedPredicate.php";
include "predicates/ParticipantRolePredicate.php";
include "predicates/ParticipantUserGroupPredicate.php";
include "predicates/ParticipantUserPredicate.php";
include "predicates/ParticipantWorkerPredicate.php";
include "predicates/ParticipantWorkloadPredicate.php";
include "predicates/UserWorkerPredicate.php";
include "predicates/ProjectUserPredicate.php";
include "predicates/ProjectUserGroupPredicate.php";
include "persisters/ParticipantOthersPersister.php";
include "persisters/UserParticipatesDetailsPersister.php";

class Participant extends Metaobject
{
 	function __construct( $registry = null ) 
 	{
		parent::__construct('pm_Participant', $registry);
        $this->defaultsort = " IFNULL(IsActive, 'N') DESC, Caption ASC ";
	}
	
	function createIterator()
	{
		return new ParticipantIterator( $this );
	}

	function add_parms( $parms ) 
	{
		$user_it = getFactory()->getObject('cms_User')->getExact($parms['SystemUser']);
		if($user_it->count() > 0) 
		{
			$parms['Caption'] = $user_it->getHtmlDecoded('Caption');
			$parms['Login'] = $user_it->getHtmlDecoded('Login');
			$parms['Email'] = $user_it->getHtmlDecoded('Email');
			$parms['HomePhone'] = $user_it->getHtmlDecoded('Phone');
			$parms['ICQNumber'] = $user_it->getHtmlDecoded('ICQ');
			$parms['Skype'] = $user_it->getHtmlDecoded('Skype');
		}

		return parent::add_parms( $parms );
	}
	
	function DeletesCascade( $object )
	{
	    switch ( $object->getEntityRefName() )
	    {
	        case 'pm_ParticipantRole':
	            return true;
	        default:
	            return false;
	    }
	}
	
	function IsDeletedCascade( $object )
	{
	    if ( is_a($object, 'User') ) return true;
	    
	    return false;
	}
	
	function getPage() 
	{
		$session = getSession();
		
		return $session->getApplicationUrl().'module/permissions/participants?';
	}
 
	function getAttributeUserName( $name ) 
	{
		if($name == 'RepeatPassword') return 'Повтор пороля';
		return parent::getAttributeUserName( $name );
	}

	function hasTeamMembers( $role_it, $projectIt )
	{
		$sql = "SELECT COUNT(1) items 
		          FROM pm_Participant p, cms_User u 
		        WHERE EXISTS (SELECT 1 FROM pm_ParticipantRole r, pm_ProjectRole l
		                       WHERE r.Participant = p.pm_ParticipantId 
		                         AND r.ProjectRole = {$role_it->getId()}) 
		          AND p.Project = {$projectIt->getId()}
                  AND p.SystemUser = u.cms_UserId
                  AND NOT EXISTS (SELECT 1 FROM cms_Blacklist bl WHERE bl.SystemUser = p.SystemUser)
		";

		$it = $this->createSQLIterator($sql);
		return $it->get('items') > 0;
	}

	function getDefaultAttributeValue( $attr )
	{
		switch ( $attr )
		{
			case 'Project':
				return getSession()->getProjectIt()->getId();
			case 'Capacity':
			    return 0;
			default:
				return parent::getDefaultAttributeValue( $attr );
		}
	}
}
