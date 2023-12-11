<?php
include_once "BusinessActionWorkflow.php";
include_once SERVER_ROOT_PATH."pm/methods/DuplicateIssuesWebMethod.php";

class RequestBusinessActionMakeRealization extends BusinessActionWorkflow
{
 	function getId() {
 		return '464a0fb7-6c9d-49fc-8f6a-cd28ccb335b0';
 	}
	
 	function getObject() {
 		return getFactory()->getObject('pm_ChangeRequest');
 	}
 	
 	function getDisplayName() {
 		return text(3023);
 	}

    function apply( $object_it )
    {
        if ( $this->getParameters() == '' ) return false;

        $link_type = getFactory()->getObject('RequestLinkType');
        $typeIt = $link_type->getByRef('ReferenceName', 'implemented');

        if ( $typeIt->getId() == '' ) {
            getFactory()->error("Can'\t find issues link type with referenceName = implemented");
            return false;
        }

        foreach( \TextUtils::parseItems($this->getParameters()) as $projectCodeName )
        {
            $projectIt = getFactory()->getObject('Project')->getRegistry()->Query(
                array(
                    new FilterAttributePredicate('CodeName', $projectCodeName)
                )
            );
            if ( $projectIt->getId() == '' ) {
                getFactory()->error("Can'\t find project by codename = {$projectCodeName}");
                continue;
            }

            $method = new DuplicateIssuesWebMethod($object_it->copy(), $typeIt);
            $method->duplicate($projectIt, array());
        }

        return true;
    }
}