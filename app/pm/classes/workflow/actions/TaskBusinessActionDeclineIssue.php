<?php
use Devprom\ProjectBundle\Service\Workflow\WorkflowService;
include_once "BusinessActionWorkflow.php";

class TaskBusinessActionDeclineIssue extends BusinessActionWorkflow
{
 	function getId() {
 		return '1362383505';
 	}
	
 	function apply( $object_it )
 	{
		if ( !getSession()->getProjectIt()->getMethodologyIt()->HasTasks() ) return true;
 		if ( $object_it->get('ChangeRequest') == '' ) return true;

		$request = getFactory()->getObject('Request');
		getFactory()->resetCachedIterator($request);
 		getSession()->addBuilder( new RequestModelExtendedBuilder() );
 		
 		$request_it = $object_it->getRef('ChangeRequest')->getSpecifiedIt();

        if ( $request_it->object->getAttributeType('OpenTasks') == '' ) return true;
        if ( getSession()->IsRDD() && $request_it->object instanceof Issue ) return true;

		$task_it = $request_it->getRef('OpenTasks');
		
		// if there is failed task then decline issue
		if ( $task_it->end() ) {
			$service = new WorkflowService($request_it->object);
			$service->moveToState($request_it, array_shift($request_it->object->getNonTerminalStates()));
		}
 		return true;
 	}

 	function getObject() {
 		return getFactory()->getObject('pm_Task');
 	}
 	
 	function getDisplayName() {
 		return text(2823);
 	}
} 
 