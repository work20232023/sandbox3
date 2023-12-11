<?php
include_once "AccessPolicyBase.php";

class AccessPolicyPortfolio extends AccessPolicyBase
{
	protected function buildRoles()
	{
		return array( 1 => 0 );
	}
	
 	function getEntityAccess( $action_kind, & $object ) 
 	{
 	    switch ( $object->getClassName() )
 	    {
            case 'pm_Methodology':
            case 'pm_AccessRight':
            case 'pm_CustomAttribute':
                return false;
 	    }
 	    
 	    return parent::getEntityAccess( $action_kind, $object );
 	}

 	function getObjectAccess($action_kind, &$object_it)
    {
        switch( $object_it->object->getEntityRefName() )
        {
            case 'pm_Project':
                if ( $object_it->IsPortfolio() ) {
                    return !in_array($object_it->get('CodeName'), array('my','all')) || $action_kind == ACCESS_READ;
                }
                else {
                    return in_array($action_kind, array(ACCESS_READ, ACCESS_CREATE));
                }
                break;
        }
        return parent::getObjectAccess($action_kind, $object_it); // TODO: Change the autogenerated stub
    }

    function getRoleReferenceName( $role_id )
	{
	    return 'linkedguest';
	}

    public function getAttributeAccess( $action_kind, &$object, $attribute_refname, $reference_class = '' )
    {
        if ( $object->getEntityRefName() == 'pm_Activity' ) {
            switch( $attribute_refname ) {
                case 'Participant':
                    return $action_kind == ACCESS_READ;
            }
        }
        return parent::getAttributeAccess( $action_kind, $object, $attribute_refname, $reference_class = '' );
    }
}