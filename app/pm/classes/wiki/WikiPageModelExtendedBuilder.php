<?php

include_once SERVER_ROOT_PATH."cms/classes/model/ObjectModelBuilder.php";
include_once SERVER_ROOT_PATH."pm/classes/comments/persisters/CommentRecentPersister.php";
include_once SERVER_ROOT_PATH."pm/classes/watchers/persisters/WatchersPersister.php";
include "persisters/WikiTagsPersister.php";
include "persisters/WikiPageAttachmentsPersister.php";
include "persisters/WikiPageWorkflowPersister.php";
include "persisters/WikiPageBrokenTracesPersister.php";
include "persisters/WikiPageCurrentBaselinePersister.php";

class WikiPageModelExtendedBuilder extends ObjectModelBuilder 
{
    public function build( Metaobject $object )
    {
    	if ( !$object instanceof WikiPage ) return;

        if ( $object->getStateClassName() != '' ) {
            $object->addAttributeGroup('Workflow', 'workflow');
            $object->addPersister(new WikiPageWorkflowPersister(array('Workflow')));
        }

		$object->addPersister( new WikiPageAttachmentsPersister(array('Attachments')) );
		$object->addPersister( new WikiTagsPersister() );
		$object->addPersister( new WatchersPersister(array('Watchers')) );
		$object->addPersister( new CommentRecentPersister() );
		$object->addPersister( new WikiPageBrokenTracesPersister() );
		$object->addPersister( new WikiPageCurrentBaselinePersister() );
    }
}