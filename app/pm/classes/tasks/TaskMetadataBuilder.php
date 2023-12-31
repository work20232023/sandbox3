<?php
include_once SERVER_ROOT_PATH."cms/classes/ObjectMetadataEntityBuilder.php";
include_once "persisters/TaskFactPersister.php";
include_once "persisters/TaskTracePersister.php";
include_once "persisters/TaskDetailsPersister.php";
include_once "persisters/TaskTypePersister.php";
include_once "persisters/TaskColorsPersister.php";
include "persisters/TaskAssigneePersister.php";
include "persisters/TaskTagsPersister.php";
include "persisters/TaskTagPersister.php";

class TaskMetadataBuilder extends ObjectMetadataEntityBuilder 
{
    public function build( ObjectMetadata $metadata )
    {
    	if ( $metadata->getObject()->getEntityRefName() != 'pm_Task' ) return;

        $metadata->setAttributeOrderNum('Priority', 5);
        $metadata->setAttributeRequired('Release', false);
		$metadata->setAttributeType('Caption', 'VARCHAR');
		$metadata->setAttributeOrderNum('Assignee', 12);
		$metadata->setAttributeOrderNum('Planned', 13);
		$metadata->setAttributeRequired('Planned', false);
		$metadata->setAttributeOrderNum('LeftWork', 14);
		$metadata->setAttributeVisible('LeftWork', false);
        $metadata->setAttributeRequired('OrderNum', true);
        $metadata->setAttributeVisible('OrderNum', true);
        $metadata->setAttributeEditable('EstimatedStartDate', false);
        $metadata->setAttributeEditable('EstimatedFinishDate', false);
        $metadata->setAttributeEditable('StartDate', false);
        $metadata->setAttributeEditable('FinishDate', false);

        $metadata->addAttribute( 'Tags', 'REF_TagId', translate('Тэги'), true, false, '', 280 );
        $metadata->addPersister( new TaskTagPersister() );

		$metadata->addAttribute('TaskTypeBase', 'REF_TaskTypeUnifiedId', translate('Тип'), false);
		$metadata->addAttributeGroup('TaskTypeBase', 'system');
        $metadata->addAttributeGroup('TaskType', 'type');
        $metadata->addAttributeGroup('TaskType', 'customattribute-descriptor');
		$metadata->addPersister(new TaskTypePersister());

		$metadata->addAttribute('TraceTask', 'REF_TaskId', text(874), true, false, '', 80);
		$metadata->addAttribute('TraceInversedTask', 'REF_TaskId', text(1921), true, false, '', 81);
		$metadata->addPersister( new TaskTracePersister() );

		$metadata->addAttribute('Attachment', 'REF_pm_AttachmentId', translate('Приложения'), true, false, '', 75);
		$metadata->addAttribute('Watchers', 'REF_WatcherId', translate('Наблюдатели'), true);
		
		$metadata->setAttributeOrderNum( 'PlannedStartDate', 18 );
		$metadata->setAttributeOrderNum( 'PlannedFinishDate', 19 );
        foreach ( array('PlannedStartDate','PlannedFinishDate') as $attribute ) {
            $metadata->setAttributeVisible($attribute, true);
        }

        $metadata->setAttributeVisible('Author', true);
        $metadata->setAttributeRequired('Author', false);
        $metadata->setAttributeOrderNum('Author', 999);

        $metadata->addAttribute('DueWeeks', 'REF_DeadlineSwimlaneId', text(1898), false);
        $metadata->addPersister( new TaskDatesPersister() );

        $metadata->addAttribute('RecentComment', 'WYSIWYG', translate('Комментарий'), false);
        $metadata->addAttributeGroup('RecentComment', 'non-form');

        $attributes = array(
            'Assignee',
            'Release',
            'Caption',
            'ChangeRequest',
            'Priority',
            'Planned',
            'Fact',
            'FactToday',
            'Tags',
            'OrderNum',
            'TraceTask',
            'PlannedFinishDate',
            'Project',
            'RecentComment'
        );
        foreach ( $attributes as $attribute ) {
			$metadata->addAttributeGroup($attribute, 'permissions');
			$metadata->addAttributeGroup($attribute, 'tooltip');
		}
        foreach ( array('TaskType') as $attribute ) {
            $metadata->addAttributeGroup($attribute, 'permissions');
            $metadata->addAttributeGroup($attribute, 'skip-tooltip');
        }
        foreach ( array('Result') as $attribute ) {
			$metadata->addAttributeGroup($attribute, 'system');
		}
		foreach ( array('Release','PlannedStartDate','PlannedFinishDate','StartDate','FinishDate','EstimatedStartDate', 'EstimatedFinishDate') as $attribute ) {
			$metadata->addAttributeGroup($attribute, 'deadlines');
		}
        foreach ( array('Watchers','TraceTask','TraceInversedTask','OrderNum','Tags','Author') as $attribute ) {
            $metadata->addAttributeGroup($attribute, 'additional');
        }
		foreach ( array('Caption','Description','Fact','Attachment') as $attribute ) {
			$metadata->addAttributeGroup($attribute, 'nonbulk');
		}
        foreach ( array('StartDate','FinishDate','DueWeeks','PlannedStartDate','PlannedFinishDate','RecordCreated','RecordModified') as $attribute ) {
            $metadata->addAttributeGroup($attribute, 'dates');
        }

        $metadata->addPersister( new TaskDetailsPersister() );
        $metadata->addPersister( new TaskAssigneePersister() );
        $metadata->addPersister( new TaskColorsPersister() );

        $priority = new Priority();
        $priorityIt = $priority->getByRef('IsDefault', 'Y');
        if ( $priorityIt->getId() != '' ) {
            $metadata->setAttributeDefault('Priority', $priorityIt->getId());
        }

        $methodologyIt = getSession()->getProjectIt()->getMethodologyIt();
        if ( $methodologyIt->getId() != '' && getSession()->IsRDD() ) {
            $metadata->setAttributeCaption('ChangeRequest', text(2698));
        }
        $metadata->setAttributeRequired('Assignee', !$methodologyIt->IsParticipantsTakesTasks());

        $metadata->addAttribute('Fact', 'FLOAT', translate('Затрачено'), true, true, '', 14 );
        $metadata->addPersister( new TaskFactPersister(array('Fact')) );

        foreach( array('Fact','FactToday') as $attribute ) {
            $metadata->addAttributeGroup($attribute, 'skip-notification');
            $metadata->addAttributeGroup($attribute, 'nonbulk');
            $metadata->setAttributeEditable($attribute, false);
        }
        foreach( array('LeftWork') as $attribute ) {
            $metadata->addAttributeGroup($attribute, 'skip-notification');
        }

        $metadata->addAttribute('IssueDescription', 'WYSIWYG', text(2083), true, false, '', 40);
        $metadata->setAttributeEditable('IssueDescription', false);
        $metadata->addAttribute('IssueState', 'VARCHAR', text(2128), false, false, '', 43);
        $metadata->addAttributeGroup('IssueState', 'workflow');

        foreach ( array('IssueDescription') as $attribute ) {
            $metadata->addAttributeGroup($attribute, 'source-issue');
        }

        $typesCount = getFactory()->getObject('TaskType')->getRegistry()->Count(
            array( new FilterBaseVpdPredicate() )
        );
        if ( $typesCount < 1 ) {
            $metadata->setAttributeRequired('TaskType', false);
            $metadata->setAttributeVisible('TaskType', false);
            $metadata->setAttributeRequired('Caption', true);
        }

        foreach ( array('Planned','LeftWork','Fact','FactToday') as $attribute ) {
            $metadata->addAttributeGroup($attribute, 'workload');
            $metadata->addAttributeGroup($attribute, 'hours');
        }

        $this->removeAttributes($metadata, $methodologyIt);
    }
    
    private function removeAttributes( $metadata, $methodology_it )
    {
        if ( !$methodology_it->IsTimeTracking() ) {
            $metadata->addAttributeGroup('Fact', 'system');
            $metadata->addAttributeGroup('FactToday', 'system');
        }

        if ( !$methodology_it->TaskEstimationUsed() ) {
            $metadata->addAttributeGroup('Planned', 'system');
            $metadata->addAttributeGroup('LeftWork', 'system');
        }
    }
}