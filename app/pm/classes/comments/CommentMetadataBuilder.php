<?php
include_once SERVER_ROOT_PATH."cms/classes/ObjectMetadataEntityBuilder.php";
include "persisters/CommentAuthorPersister.php";

class CommentMetadataBuilder extends ObjectMetadataEntityBuilder
{
    public function build( ObjectMetadata $metadata )
    {
    	if ( !$metadata->getObject() instanceof Comment) return;

        $metadata->addPersister( new CommentAuthorPersister() );

        foreach( array('EmailMessageId', 'AnnotationLength', 'AnnotationPath', 'AnnotationStart', 'AnnotationText', 'ExternalEmail', 'Project') as $attribute ) {
            $metadata->addAttributeGroup($attribute, 'system');
        }
        $metadata->addPersister( new CommentNewPersister() );
    }
}