<?php

class ProjectRoleBaseRoleNamePredicate extends FilterPredicate
{
 	function _predicate( $filter )
 	{
		return " AND EXISTS (
		            SELECT 1 FROM pm_ProjectRole rb 
	   			     WHERE rb.pm_ProjectRoleId = {$this->getAlias()}.ProjectRoleBase
			           AND rb.ReferenceName = '{$filter}' ) ";
 	}
}
