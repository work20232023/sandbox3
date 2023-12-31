<?php
include "ProjectRoleBaseIterator.php";
include "ProjectRoleBaseRegistry.php";

class ProjectRoleBase extends MetaobjectCacheable
{
 	function __construct() 
 	{
 		parent::__construct('pm_ProjectRole', new ProjectRoleBaseRegistry($this));
 		
 		$this->setSortDefault( new SortAttributeClause('Caption') );
 		$this->setAttributeType('ProjectRoleBase', 'REF_ProjectRoleBaseId');
 		$this->setAttributeRequired('ReferenceName', true);
 		$this->setAttributeRequired('ProjectRoleBase', false);
        $this->addAttributeGroup('ReferenceName', 'alternative-key');
 	}
 	
 	function createIterator() {
 		return new ProjectRoleBaseIterator( $this );
 	}
 	
 	function getVpdValue()
    {
 		return '';
 	}

    function IsVPDEnabled()
    {
         return false;
    }
}