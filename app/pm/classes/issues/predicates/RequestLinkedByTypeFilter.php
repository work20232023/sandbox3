<?php

class RequestLinkedByTypeFilter extends FilterPredicate
{
    private $linkType;

    function __construct($linkType, $filter) {
        $this->linkType = $linkType;
        parent::__construct($filter);
    }

    function _predicate( $filter )
 	{
 		$type_it = getFactory()->getObject('RequestLinkType')->getRegistry()->Query(
            array (
                new FilterAttributePredicate('ReferenceName', array($this->linkType))
            )
 		);
 		if ( $type_it->getId() < 1 ) return " AND 1 = 2 ";

        $idsString = join(',',$type_it->idsToArray());
 		return " AND EXISTS (SELECT 1 FROM pm_ChangeRequestLink l 
 			   			  WHERE l.LinkType IN ({$idsString}) 
 			   				AND t.pm_ChangeRequestId = l.SourceRequest   
 			   				AND l.TargetRequest = {$filter}
 			   			  UNION 
 			   			 SELECT 1 FROM pm_ChangeRequestLink l 
 			   			  WHERE l.LinkType IN ({$idsString}) 
 			   				AND t.pm_ChangeRequestId = l.TargetRequest   
 			   				AND l.SourceRequest = {$filter}) ";
 	}
}
