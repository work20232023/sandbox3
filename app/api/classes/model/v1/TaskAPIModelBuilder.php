<?php
include_once SERVER_ROOT_PATH."cms/classes/model/ObjectModelBuilder.php";

class TaskAPIModelBuilder extends ObjectModelBuilder
{
    public function build( Metaobject $object )
    {
    	if ( ! $object instanceof Task ) return;
        $object->setAttributeRequired('Assignee', false);
   	}
}