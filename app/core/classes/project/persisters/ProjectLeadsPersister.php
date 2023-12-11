<?php

class ProjectLeadsPersister extends ObjectSQLPersister
{
 	function getSelectColumns( $alias )
 	{
 		return [
            "(SELECT GROUP_CONCAT(CAST(p.SystemUser AS CHAR)) 
                FROM pm_Participant p 
		       WHERE EXISTS (
		                SELECT 1 FROM pm_ParticipantRole r, pm_ProjectRole l, pm_ProjectRole br
			   			 WHERE r.Participant = p.pm_ParticipantId 
			               AND r.ProjectRole = l.pm_ProjectRoleId
			               AND l.ProjectRoleBase = br.pm_ProjectRoleId
			   			   AND br.ReferenceName = 'lead' ) 
			               AND p.Project = {$this->getPK($alias)}) Coordinators "
        ];
 	}
}
