<?php

class ProjectRoleForm extends PMPageForm
{
    private $permissionsModuleIt = null;

    function extendModel()
    {
        parent::extendModel();

        $this->permissionsModuleIt = getFactory()->getObject('Module')->getExact('permissions/settings');
    }

    function validateInputValues( $id, $action )
	{
	    // check at least one 'lead' derived role is in the list or project roles
	    $base = getFactory()->getObject('ProjectRoleBase');

        $base_ids = getFactory()->getObject('ProjectRole')
                        ->getRegistry()->Query([
                            new FilterNotInPredicate($id),
                            new FilterVpdPredicate()
                        ])->fieldToArray('ProjectRoleBase');

        $roles = array(
            $base->getExact($_REQUEST['ProjectRoleBase'])->get('ReferenceName')
        );
	    $roles = array_merge( $roles, $base->getExact($base_ids)->fieldToArray('ReferenceName') );

	    if ( !in_array('lead', $roles) )
	    {
	        return text(1331);
	    }
	}
	
	function createFieldObject( $attr_name )
	{
		if( $attr_name == 'ProjectRoleBase') {
			return new FieldDictionary( getFactory()->getObject('ProjectRoleBase') );
		}
		return parent::createFieldObject( $attr_name );
	}

    function getMoreActions()
    {
        $actions = parent::getMoreActions();

        if ( $this->permissionsModuleIt->getId() != '' ) {
            $actions[] = array(
                'name' => text('permissions31'),
                'url' => $this->permissionsModuleIt->getUrl('role='.$this->getObjectIt()->getId()),
                'uid' => 'permissions-url'
            );

        }

        return $actions;
    }
}