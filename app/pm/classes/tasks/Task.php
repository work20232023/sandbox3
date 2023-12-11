<?php
include_once SERVER_ROOT_PATH . "pm/classes/workflow/MetaobjectStatable.php";
include "TaskIterator.php";
include "predicates/TaskCategoryPredicate.php";
include "predicates/TaskTypeBasePredicate.php";
include "predicates/TaskVersionPredicate.php";
include "predicates/TaskBindedToObjectPredicate.php";
include "predicates/TaskReleasePredicate.php";
include "predicates/TaskFeaturePredicate.php";
include "predicates/TaskIssueStatePredicate.php";
include "sorts/TaskAssigneeSortClause.php";
include "validators/ModelValidatorTaskDeadlines.php";
include "TaskModelExtendedBuilder.php";

class Task extends MetaobjectStatable 
{
 	function __construct( $registry = null )
 	{
		parent::__construct('pm_Task', $registry);
		$this->setSortDefault(
		    array(
		        new SortOrderedClause()
            )
        );
 	}

 	function getValidators()
    {
        return array_merge(
            parent::getValidators(),
            array(
                new ModelValidatorTaskDeadlines()
            )
        );
    }

    function getPage()
	{
		return getSession()->getApplicationUrl($this).'tasks/board?';
	}

	function createIterator() 
	{
		return new TaskIterator($this);
	}

	function getAttachmentUrl( $task_it ) 
	{
	}
	
 	function getOrderStep() {
	    return 1;
	}
	
	function IsDeletedCascade( $object )
	{
	    if ( is_a($object, 'Request') ) return true;
		return false;
	}

	function getDefaultAttributeValue($attr)
    {
        switch( $attr )
        {
            case 'Author':
                return getSession()->getUserIt()->getId();

            case 'TaskType':
                $registry = getFactory()->getObject('TaskType')->getRegistryBase();
                $registry->setLimit(1);
                return $registry->Query(array(new FilterVpdPredicate()))->getId();

            default:
                return parent::getDefaultAttributeValue($attr);
        }
    }

    function add_parms( $parms )
	{
		if ( !\TextUtils::isValueDefined($parms['LeftWork']) ) {
			$parms['LeftWork'] = $parms['Planned'];
		}
		
		if ( !\TextUtils::isValueDefined($parms['Release']) ) {
		    $parms['Release'] = $this->getDefaultAttributeValue('Release');
        }

        if ( !\TextUtils::isValueDefined($parms['Author']) ) {
            $parms['Author'] = $this->getDefaultAttributeValue('Author');
        }

        if ( !\TextUtils::isValueDefined($parms['Assignee']) && \TextUtils::isValueDefined($parms['TaskType']) )
        {
            $parms['Assignee'] = \Devprom\ProjectBundle\Service\Task\TaskDefaultsService::getAssignee($parms['TaskType']);
        }

        if ( $parms['ChangeRequest'] > 0 ) {
			$issue_it = getFactory()->getObject('pm_ChangeRequest')->getExact($parms['ChangeRequest']);
			if ( $parms['Priority'] == '' ) $parms['Priority'] = $issue_it->get('Priority');
			if ( $parms['OrderNum'] == '' ) $parms['OrderNum'] = $issue_it->get('OrderNum');
			if ( $parms['Release'] == '' ) $parms['Release'] = $issue_it->get('Iteration');
		}

		return parent::add_parms( $parms );
	}
	
	function modify_parms( $object_id, $parms )
	{
		$object_it = $this->getExact($object_id);

		if ( array_key_exists('Release', $parms) && $parms['Release'] == '' ) {
			$parms['Release'] = $this->getDefaultAttributeValue('Release');
		}

		if ( $parms['Planned'] != '' && $object_it->get('Planned') != $parms['Planned'] ) {
			$parms['LeftWork'] = max(0, $parms['Planned'] - $object_it->get("Fact"));
		}

		if ( $parms['Transition'] > 0 )
		{
			$target_state = getFactory()->getObject('Transition')->
					getExact($parms['Transition'])->getRef('TargetState')->get('ReferenceName');
			
			switch ( $target_state )
			{
				default:
					if ( in_array($target_state, $this->getTerminalStates()) ) {
						// if the task is marked as completed then
						// reset left work value to 0
						//
						$parms['LeftWork'] = 0;
					}
					if ( $target_state == array_shift($this->getStates()) ) {
						$parms['LeftWork'] = $parms['Planned'] != '' ? $parms['Planned'] : $object_it->get('Planned');
					}
					break;
			}
		}

		return parent::modify_parms($object_id, $parms);
	}
}