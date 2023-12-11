<?php
include_once SERVER_ROOT_PATH."cms/classes/model/ObjectModelBuilder.php";

class ParticipantRoleAPIModelBuilder extends ObjectModelBuilder
{
    public function build( Metaobject $object )
    {
    	if ( ! $object instanceof ParticipantRole ) return;
        $object->setAttributeType('Capacity', 'INTEGER');
   	}
}