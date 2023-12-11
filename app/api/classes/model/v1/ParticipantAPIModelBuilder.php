<?php
include_once SERVER_ROOT_PATH."cms/classes/model/ObjectModelBuilder.php";

class ParticipantAPIModelBuilder extends ObjectModelBuilder
{
    public function build( Metaobject $object )
    {
    	if ( ! $object instanceof Participant ) return;
        $object->setAttributeType('Capacity', 'INTEGER');
   	}
}