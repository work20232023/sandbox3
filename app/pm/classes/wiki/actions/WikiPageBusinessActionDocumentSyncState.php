<?php
use Devprom\ProjectBundle\Service\Workflow\WorkflowService;
include_once SERVER_ROOT_PATH . "pm/classes/workflow/actions/BusinessActionWorkflow.php";

class WikiPageBusinessActionDocumentSyncState extends BusinessActionWorkflow
{
 	function getId()
 	{
 		return '633bcf08-b935-11e4-a71e-12e3f512a338';
 	}

    function getDisplayName() {
        return text(2751);
    }

	function apply( $object_it )
 	{
		if ( $object_it->get('ParentPage') == '' ) return true;
		if ( $object_it->get('DocumentId') == '' ) return true;
        $stateAttribute = 'State';

        $parentObject = getFactory()->getObject(get_class($object_it->object));
		$childRegistry = new ObjectRegistrySQL($parentObject);
        $service = new WorkflowService($parentObject);

        $page_it = $object_it->getParentsIt($parentObject);
        while( !$page_it->end() ) {
            $otherStatesCount = $childRegistry->Count(
                array (
                    new ParentTransitiveFilter($page_it->getId()),
                    new FilterNotInPredicate($page_it->getId()),
                    new FilterHasNoAttributePredicate($stateAttribute, $object_it->get($stateAttribute))
                )
            );
            if ( $otherStatesCount > 0 ) {
                $page_it->moveNext();
                continue;
            }
            try {
                $service->moveToState(
                    $page_it, $object_it->get('State'), '', array(), false
                );
            }
            catch( Exception $e ) {
                Logger::getLogger('System')->error($e->getMessage());
            }
            $page_it->moveNext();
        }

 		return true;
 	}

 	function getObject()
 	{
 		return null;
 	}
}
