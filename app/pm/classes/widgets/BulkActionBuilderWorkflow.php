<?php

include_once SERVER_ROOT_PATH."core/classes/widgets/BulkActionBuilder.php";

class BulkActionBuilderWorkflow extends BulkActionBuilder
{
 	function build( BulkActionRegistry $registry )
 	{
 		$object = $registry->getObject()->getObject();
 		if ( !$object instanceof MetaobjectStatable ) return;
 		if ( $object->getStateClassName() == '' ) return;
 	 	if ( !getFactory()->getAccessPolicy()->can_modify_attribute($object, 'State') ) return;

		$transition_it = WorkflowScheme::Instance()->getTransitionIt($object);
		while ( !$transition_it->end() )
		{
		    if ( !$transition_it->appliable() ) {
                $transition_it->moveNext();
                continue;
            }
			$registry->addWorkflowAction(
					$transition_it->get('SourceStateReferenceName'),
					$transition_it->getDisplayName(),
					$transition_it->get('ProjectCodeName'),
					$transition_it->getId()
				);
			$transition_it->moveNext();
		}
 	}
}