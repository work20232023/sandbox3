<?php

include_once SERVER_ROOT_PATH."core/classes/ResourceBuilder.php";

class ResourceBuilderLanguageFiles extends ResourceBuilder
{
    public function build( ResourceRegistry $object )
    {
    	$lang = strtolower($object->getObject()->getLanguageUid());
    	
   		foreach ( include(SERVER_ROOT_PATH.'/lang/'.$lang.'/resource.php') as $key => $value ) {
		    $object->addText($key, $value);
		}
   		foreach ( include(SERVER_ROOT_PATH.'/lang/'.$lang.'/terms.php') as $key => $value ) {
		    $object->addText($key, $value);
		}
    }
}