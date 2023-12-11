<?php

class RequestLinkedHasSyncedAttributesFilter extends FilterPredicate
{
    function _predicate( $filter ) {
        $ids = \TextUtils::parseIds($filter);
        if ( count($ids) < 1 ) return " 1 = 2 ";

        $idsString = join(',',$ids);
 		return " AND EXISTS (
 		                 SELECT 1 FROM pm_ChangeRequestLink l, pm_ChangeRequestLinkType lkt 
 			   			  WHERE t.pm_ChangeRequestId = l.SourceRequest
 			   			    AND l.TargetRequest IN ({$idsString})    
 			   			    AND l.LinkType = lkt.pm_ChangeRequestLinkTypeId
 			   			    AND lkt.SyncAttributes IS NOT NULL
 			   			    AND lkt.Caption = lkt.BackwardCaption
 			   			  UNION 
 			   			 SELECT 1 FROM pm_ChangeRequestLink l, pm_ChangeRequestLinkType lkt 
 			   			  WHERE t.pm_ChangeRequestId = l.TargetRequest
 			   			    AND l.SourceRequest IN ({$idsString})
 			   			    AND l.LinkType = lkt.pm_ChangeRequestLinkTypeId
 			   			    AND lkt.SyncAttributes IS NOT NULL
 			   			    ) ";
 	}
}
