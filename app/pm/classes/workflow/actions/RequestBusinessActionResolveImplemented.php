<?php
include_once "RequestBusinessActionChangeStateBase.php";

class RequestBusinessActionResolveImplemented extends RequestBusinessActionChangeStateBase
{
 	function getId() {
 		return '706204028';
 	}

    function getFilters($object_it) {
        return array (
            new RequestLinkedByTypeFilter('implemented', $object_it->getId())
        );
    }

    function getStateFilters($object_it) {
        return array(
            new FilterAttributePredicate('IsTerminal', 'Y'),
        );
    }

 	function getDisplayName() {
 		return text(1387);
 	}
}