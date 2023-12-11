<?php
include_once SERVER_ROOT_PATH."cms/classes/ObjectMetadataEntityBuilder.php";
include "persisters/ParticipantDetailsPersister.php";
include "persisters/ParticipantRolesPersister.php";

class ParticipantMetadataBuilder extends ObjectMetadataEntityBuilder
{
    public function build( ObjectMetadata $metadata )
    {
    	if ( !$metadata->getObject() instanceof Participant) return;

        $metadata->setAttributeCaption('IsActive', text(2178));
        $metadata->setAttributeDescription('IsActive', text(1054));

        $metadata->addAttribute('ParticipantRole', 'REF_ParticipantRoleId', translate('Роль в проекте'), false, false, '', 100);
        $metadata->addAttribute('ProjectRole', 'REF_ProjectRoleId', translate('Роль'), false, false, '', 101);
        $metadata->setAttributeRequired('ProjectRole', true);
        $metadata->addPersister( new ParticipantRolesPersister() );

        $metadata->setAttributeDescription('NotificationEmailType', text(1913));
        $metadata->addPersister( new ParticipantDetailsPersister() );

        $metadata->setAttributeDefault('NotificationTrackingType', 'personal');
        $metadata->setAttributeDefault('NotificationEmailType', 'direct');

        $system_attributes = array (
            'Login',
            'Password',
            'OverrideUser',
            'Salary'
        );
        foreach( $system_attributes as $attribute )
        {
            $metadata->addAttributeGroup($attribute, 'system');
            $metadata->setAttributeVisible($attribute, false);
        }
        foreach( array('NotificationTrackingType','NotificationEmailType') as $attribute ) {
            $metadata->addAttributeGroup($attribute, 'permissions');
        }
    }
}