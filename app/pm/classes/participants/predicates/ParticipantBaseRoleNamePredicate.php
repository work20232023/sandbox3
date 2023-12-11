<?php

class ParticipantBaseRoleNamePredicate extends FilterPredicate
{
 	function _predicate( $filter )
 	{
		return " AND EXISTS (
		            SELECT 1 FROM pm_ParticipantRole r, pm_ProjectRole prr, pm_ProjectRole rb 
	   			     WHERE r.Participant = t.pm_ParticipantId
			   		   AND r.ProjectRole = prr.pm_ProjectRoleId
			           AND prr.ProjectRoleBase = rb.pm_ProjectRoleId
			           AND rb.ReferenceName = '{$filter}' ) ";
 	}
}
