<?php
include_once SERVER_ROOT_PATH.'pm/classes/notificators/EntityModifyProjectTrigger.php';

class TaskModifyProjectTrigger extends EntityModifyProjectTrigger
{
	protected function checkEntity( $object_it )
	{
		return $object_it->object->getEntityRefName() == 'pm_Task';
	}

    static function getObjectReferences( $object_it )
	{
 	    // prepare list of objects to be serilalized
 	    $references = array();
 	    $ids = $object_it->idsToArray();
        
        $references[] = getFactory()->getObject('Task')->getRegistry()->Query(
            [new FilterInPredicate($ids)]
        );

        $references[] = getFactory()->getObject('pm_TaskTrace')->getRegistry()->Query(
            [new FilterAttributePredicate('Task', $ids)]
        );

        $references[] = getFactory()->getObject('pm_Attachment')->getRegistry()->Query(
            [new AttachmentObjectPredicate($object_it)]
        );

        $references[] = getFactory()->getObject('Activity')->getRegistry()->Query(
            [new FilterAttributePredicate('Task',$ids)]
        );

		$references[] = getFactory()->getObject('Comment')->getRegistry()->Query(
            [new CommentObjectFilter($object_it)]
        );
 	    
		return $references;
	}
}
 