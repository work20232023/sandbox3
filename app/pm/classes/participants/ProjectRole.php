<?php
include "ProjectRoleIterator.php";
include "predicates/ProjectRoleInheritedFilter.php";
include "predicates/ProjectRoleBaseRoleNamePredicate.php";

class ProjectRole extends Metaobject
{
 	function __construct( $registry = null )
 	{
 		parent::__construct('pm_ProjectRole', $registry);
 		
 		$this->setSortDefault( new SortAttributeClause('Caption') );
 		$this->setAttributeType('ProjectRoleBase', 'REF_ProjectRoleBaseId');
 		$this->setAttributeVisible('ProjectRoleBase', true);
        $this->addAttributeGroup('Caption', 'alternative-key');
 	}

 	function createIterator() {
 		return new ProjectRoleIterator( $this );
 	}

 	function add_parms( $parms )
	{
		if ( $parms['ReferenceName'] == '' ) {
			$base = getFactory()->getObject('ProjectRoleBase');
			$base_it = $base->getExact($parms['ProjectRoleBase']);
			$parms['ReferenceName'] = $base_it->get('ReferenceName');
		}
		
		if ( $parms['ProjectRoleBase'] == '' ) {
			$base = getFactory()->getObject('ProjectRoleBase');
			$base_it = $base->getByRef('ReferenceName', $parms['ReferenceName']);
        	$parms['ProjectRoleBase'] = $base_it->getId();
		}
		return parent::add_parms( $parms );
	}

	function IsDeletedCascade( $object )
    {
		return false;
	}
	
	function DeletesCascade( $object )
    {
        $cascadeEntities = ['pm_TransitionRole', 'pm_AccessRight', 'pm_ParticipantRole', 'pm_Invitation'];
 	    if ( in_array($object->getEntityRefName(), $cascadeEntities) ) return true;
		return false;
	}

	function getPage()
    {
        return getSession()->getApplicationUrl($this).'project/dicts/pm_ProjectRole?';
    }
}