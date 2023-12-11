<?php
include "persisters/CommentStatPersister.php";

class CommentStatModelBuilder extends ObjectModelBuilder
{
    private $extendedEntities = [];

    public function __construct( array $entities )
    {
        $this->extendedEntities = $entities;
    }

    public function build( Metaobject $object )
    {
        if ( !in_array($object->getEntityRefName(), $this->extendedEntities) ) return;
        $object->addPersister( new CommentStatPersister() );
	}
}