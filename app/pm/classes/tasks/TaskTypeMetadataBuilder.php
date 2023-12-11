<?php
include_once SERVER_ROOT_PATH."cms/classes/ObjectMetadataEntityBuilder.php";
include "persisters/TaskTypeStatePersister.php";

class TaskTypeMetadataBuilder extends ObjectMetadataEntityBuilder 
{
    public function build( ObjectMetadata $metadata )
    {
    	if ( !$metadata->getObject() instanceof TaskType ) return;

		$metadata->setAttributeRequired('ProjectRole', false);
        $metadata->setAttributeType('ProjectRole', 'REF_ProjectRoleInheritedId');

		$metadata->addAttribute('States', 'VARCHAR', text(2077), false, false, text(2078));
		$metadata->addPersister( new TaskTypeStatePersister() );
        $metadata->addAttributeGroup('States', 'system');

		$metadata->setAttributeCaption('ReferenceName', text(1868));
		$metadata->setAttributeOrderNum('ReferenceName', 14);

		$metadata->setAttributeType('ParentTaskType', 'REF_TaskTypeBaseId');
		$metadata->setAttributeRequired('ParentTaskType', true);

		$metadata->setAttributeRequired('ReferenceName', true);

 		$metadata->setAttributeDescription( 'RelatedColor', text(1856) );
 		$metadata->setAttributeDescription( 'IsDefault', text(1877) );
        $metadata->setAttributeDescription( 'ShortCaption', text(3334) );

        $metadata->setAttributeOrderNum( 'ParentTaskType', 300 );
        $metadata->setAttributeOrderNum( 'ReferenceName', 310 );
        $metadata->setAttributeOrderNum( 'OrderNum', 320 );

        $metadata->addAttributeGroup('ReferenceName', 'alternative-key');
        $metadata->setAttributeDescription('ParentTaskType', text(1883));

        foreach( array('Description','OrderNum','ReferenceName') as $attribute ) {
            $metadata->addAttributeGroup($attribute, 'additional');
        }

        foreach( array('Description','OrderNum') as $attribute ) {
            $metadata->setAttributeRequired($attribute, false);
        }
    }
}