<?php

class ArtefactUserReviewItemPersister extends ObjectSQLPersister
{
 	function getSelectColumns( $alias )
 	{
        $objectClass = get_class($this->getObject());
        $userId = getSession()->getUserIt()->getId();
        if ( $userId == '' ) return [];

 		return array(
 			" (SELECT MAX(ri.pm_ReviewItemId) 
 			     FROM pm_ReviewItem ri
 			    WHERE ri.ObjectClass = '{$objectClass}' 
 			      AND ri.IsActive = 'Y' " .
                ($this->getObject() instanceof WikiPage
                    ? " AND FIND_IN_SET(ri.ObjectId, t.ParentPath) > 0 "
                    : " AND ri.ObjectId = {$this->getPK('t')}") . "
                  AND (FIND_IN_SET({$userId}, ri.ReviewUsers) > 0
                            OR EXISTS (SELECT 1 FROM pm_ParticipantRole pr, pm_Participant pp 
                                        WHERE pr.Participant = pp.pm_ParticipantId
                                          AND pp.SystemUser = {$userId} AND FIND_IN_SET(pr.ProjectRole, ri.ReviewRoles) > 0) 
                            OR EXISTS (SELECT 1 FROM co_UserGroupLink gr 
                                        WHERE gr.SystemUser = {$userId} AND FIND_IN_SET(gr.UserGroup, ri.ReviewTeams) > 0))
                ) ArtefactUserReviewItem
 			"
 		);
 	}
}
