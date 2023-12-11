<?php

include_once SERVER_ROOT_PATH."cms/classes/ObjectMetadataEntityBuilder.php";

class ActivityMetadataBuilder extends ObjectMetadataEntityBuilder
{
    public function build( ObjectMetadata $metadata )
    {
        if ($metadata->getObject()->getEntityRefName() != 'pm_Activity') return;

        $metadata->addAttribute('IsApproved', 'CHAR', text(3624), true, true);
        $metadata->addAttributeGroup('IsApproved', 'daily-hours');

        $methodology_it = getSession()->getProjectIt()->getMethodologyIt();
        if ($methodology_it->IsTimesheetsAreApproved()) {
            $metadata->setAttributeDefault('IsApproved', 'N');
        } else {
            $metadata->setAttributeVisible('IsApproved', false);
            $metadata->setAttributeDefault('IsApproved', 'Y');
        }
    }
}