<?php
include_once SERVER_ROOT_PATH."cms/classes/ObjectMetadataEntityBuilder.php";
include "persisters/TagKnowledgeBasePersister.php";
include "persisters/TagFeaturePersister.php";
include "persisters/TagQuestionPersister.php";
include "persisters/TagRequestPersister.php";
include "persisters/TagParentPersister.php";

class TagMetadataBuilder extends ObjectMetadataEntityBuilder
{
    public function build( ObjectMetadata $metadata )
    {
    	if ( !$metadata->getObject() instanceof Tag) return;

        $methodology_it = getSession()->getProjectIt()->getMethodologyIt();

        $metadata->addAttribute('Request', 'INTEGER',
            getSession()->IsRDD() ? text(2032) : text(808), true);
        $metadata->addPersister( new TagRequestPersister() );

        if ( $methodology_it->HasFeatures() )
        {
            $metadata->addAttribute('Feature', 'INTEGER', translate('Функции'), true);
            $metadata->addPersister( new TagFeaturePersister() );
        }

        $metadata->addAttribute('Question', 'INTEGER', text(980), true);
        $metadata->addPersister( new TagQuestionPersister() );

        $metadata->addAttribute('ProjectPage', 'INTEGER', translate('База знаний'), true);
        $metadata->addPersister( new TagKnowledgeBasePersister() );
    }
}