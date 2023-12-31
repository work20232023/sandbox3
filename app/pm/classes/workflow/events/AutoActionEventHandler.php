<?php
include_once SERVER_ROOT_PATH."cms/classes/ObjectFactoryNotificator.php";
include_once SERVER_ROOT_PATH."pm/classes/workflow/actions/BusinessActionIssueAutoActionShift.php";
include_once SERVER_ROOT_PATH."pm/classes/workflow/actions/BusinessActionIssueAutoActionWorkflow.php";

class AutoActionEventHandler extends ObjectFactoryNotificator
{
    private $eventTypes = array(
        AutoActionEventRegistry::CreateAndModify,
        AutoActionEventRegistry::CreateOnly
    );

 	function add( $object_it ) 
	{
        if ( $object_it->object instanceof Comment ) {
		    $anchorIt = $object_it->getAnchorIt();
		    if ( $anchorIt->object instanceof Request ) {
		        $this->applyAutoActionsOnComment($anchorIt, $object_it);
            }
        }

        if ( $object_it->object instanceof Request ) {
            $this->applyAutoActionsOnCreated($object_it);
        }

        if ( $object_it->object instanceof Activity ) {
            if ( $object_it->get('Issue') == '' ) {
                $taskIt = $object_it->getRef('Task');
                if ( $taskIt->get('ChangeRequest') == '' ) return;
                $issueIt = $taskIt->getRef('ChangeRequest');
            }
            else {
                $issueIt = $object_it->getRef('Issue');
            }
            if ( $issueIt->getId() == '' ) return;
            $this->applyAutoActionsOnModification( $issueIt,
                array(
                    'Fact' => $object_it->get('Capacity'),
                    'FactToday' => $object_it->get('Capacity')
                )
            );
        }
    }

 	function modify( $prev_object_it, $object_it ) 
	{
        if ( $object_it->object instanceof Request ) {
		    $this->applyAutoActionsOnModification(
                $object_it->object->getExact($object_it->getId()),
                array_diff_assoc($object_it->getData(), $prev_object_it->getData())
            );
        }
	}

 	function delete( $object_it )
 	{ 
 	}
 	
 	function applyAutoActionsOnComment( $object_it, $commentIt )
    {
        $actionIt = getFactory()->getObject('IssueAutoAction')->getRegistry()->Query(
            array(
                new FilterAttributePredicate('EventType', AutoActionEventRegistry::NewComment),
                new FilterVpdPredicate($object_it->get('VPD'))
            )
        );
        while( !$actionIt->end() ) {
            $action = new BusinessActionIssueAutoActionWorkflow($actionIt);
            $action->setCommentIt($commentIt);
            $action->apply($object_it);
            $actionIt->moveNext();
        }
    }

    function applyAutoActionsOnCreated( $object_it )
    {
        $actionIt = getFactory()->getObject('IssueAutoAction')->getRegistry()->Query(
            array(
                new FilterAttributePredicate('EventType', array(
                    AutoActionEventRegistry::CreateAndModify,
                    AutoActionEventRegistry::CreateOnly
                )),
                new FilterVpdPredicate($object_it->get('VPD'))
            )
        );
        while( !$actionIt->end() ) {
            $action = new BusinessActionIssueAutoActionWorkflow($actionIt);
            $action->apply($object_it);
            $actionIt->moveNext();
        }
    }

    function applyAutoActionsOnModification( $object_it, $attributes )
    {
        $actionIt = getFactory()->getObject('IssueAutoAction')->getRegistry()->Query(
            array(
                new FilterAttributePredicate('EventType',
                    array(
                        AutoActionEventRegistry::ModifyOnly,
                        AutoActionEventRegistry::CreateAndModify
                    )
                ),
                new FilterVpdPredicate($object_it->get('VPD'))
            )
        );
        while( !$actionIt->end() ) {
            $action = new BusinessActionIssueAutoActionShift($actionIt);
            $action->applyContent($object_it, $attributes);
            $actionIt->moveNext();
        }
    }
}