<?php

class RequestLinkTypeSyncAttributesPersister extends ObjectSQLPersister
{
    private $sourceId;

    function __construct($sourceId, array $attributes = array()) {
        $this->sourceId = $sourceId;
        parent::__construct($attributes);
    }

    function getSelectColumns( $alias )
 	{
 		$columns = array();
 		
 		$columns[] =
 			" CONCAT_WS(',',
 			     (SELECT GROUP_CONCAT(lkt.SyncAttributes) 
			        FROM pm_ChangeRequestLink l,
                         pm_ChangeRequestLinkType lkt 
					WHERE l.LinkType = lkt.pm_ChangeRequestLinkTypeId 
			    	  AND l.TargetRequest = {$this->getPK($alias)}
			    	  AND l.SourceRequest = {$this->sourceId}
			    	  ), 
 			     (SELECT GROUP_CONCAT(lkt.SyncAttributes) 
			        FROM pm_ChangeRequestLink l,
                         pm_ChangeRequestLinkType lkt 
					WHERE l.LinkType = lkt.pm_ChangeRequestLinkTypeId 
			    	  AND l.SourceRequest = {$this->getPK($alias)} 
 					  AND l.TargetRequest = {$this->sourceId} 
 					  AND lkt.Caption = lkt.BackwardCaption
               ) ) SyncAttributes ";
 		
 		return $columns;
 	}
}
