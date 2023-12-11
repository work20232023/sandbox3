<?php
include_once SERVER_ROOT_PATH."cms/classes/ObjectMetadataEntityBuilder.php";

class IssueScrumMetadataBuilder extends ObjectMetadataEntityBuilder
{
    public function build( ObjectMetadata $metadata )
    {
    	if ( !$metadata->getObject() instanceof \Request ) return;
    }
}
