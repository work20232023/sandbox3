<?php
include_once SERVER_ROOT_PATH.'pm/classes/notificators/EntityModifyProjectTrigger.php';

class IssueModifyProjectTrigger extends EntityModifyProjectTrigger
{
	protected function checkEntity( $object_it )
	{
		switch( $object_it->object->getEntityRefName() )
	    {
	        case 'pm_ChangeRequest':
	        	return true;
	    }
	    
	    return false;
	}

    function process( $object_it, $kind, $content = array(), $visibility = 1)
    {
        if ( $kind != TRIGGER_ACTION_MODIFY ) return;
        if ( !$this->checkEntity($object_it) ) return;

        if ( getSession()->getProjectIt()->IsPortfolio() )
        {
            $references = $this->getObjectReferences($object_it);
            if ( !is_array($references) ) return;

            if ( array_key_exists('PlannedRelease', $content) )
            {
                $release_it = getFactory()->getObject('Release')->getExact($content['PlannedRelease']);
                if ( $release_it->get('VPD') != '' && $release_it->get('VPD') != $object_it->get('VPD') ) {
                    return $this->moveEntity( $object_it, $release_it->getRef('Project'), $references );
                }
            }
            if ( array_key_exists('Iteration', $content) )
            {
                $release_it = getFactory()->getObject('Iteration')->getExact($content['Iteration']);
                if ( $release_it->get('VPD') != '' && $release_it->get('VPD') != $object_it->get('VPD') ) {
                    return $this->moveEntity( $object_it, $release_it->getRef('Project'), $references );
                }
            }
        }

        parent::process($object_it, $kind, $content, $visibility);
    }

    static function getObjectReferences( $object_it )
	{
 	    // prepare list of objects to be serilalized
 	    $references = array();
 	    $ids = $object_it->idsToArray();
        
 	    $request = getFactory()->getObject(get_class($object_it->object));
		$persisters = $request->getPersisters();
		foreach( $persisters as $key => $persister ) {
			if ( $persister instanceof IssueAuthorPersister ) {
				unset($persisters[$key]);
			}
		}
        $references[] = $request->getRegistryBase()->Query(
            array_merge(
                $persisters,
                array(
                    new FilterInPredicate($ids)
                )
            )
        );

        $references[] = getFactory()->getObject('pm_ChangeRequestTrace')->getRegistry()->Query(
            [new FilterAttributePredicate('ChangeRequest', $ids)]
        );

        $references[] = getFactory()->getObject('pm_ChangeRequestLink')->getRegistry()->Query(
            [new RequestLinkedFilter($ids)]
        );

        $references[] = getFactory()->getObject('pm_Attachment')->getRegistry()->Query(
            [new AttachmentObjectPredicate($object_it)]
        );

 	    $taskIt = getFactory()->getObject('Task')->getRegistry()->Query(
             [new FilterAttributePredicate('ChangeRequest', $ids)]
        );
        $references[] = $taskIt;

        $references[] = getFactory()->getObject('Activity')->getRegistry()->Query(
            [new FilterAttributePredicate('Issue', $ids)]
        );

 	    if ( $taskIt->count() > 0 ) {
 	        $references = array_merge($references,
                TaskModifyProjectTrigger::getObjectReferences($taskIt));
        }

        $references[] = getFactory()->getObject('Comment')->getRegistry()->Query(
            [ new CommentObjectFilter($object_it), new SortOrderedClause() ]
        );

        $references[] = getFactory()->getObject('Watcher')->getRegistry()->Query(
            [
                new FilterAttributePredicate('ObjectId', $ids),
                new FilterAttributePredicate('ObjectClass', strtolower(get_class($request)))
            ]
        );

        $references[] = getFactory()->getObject('pm_RequestTag')->getRegistry()->Query(
            [new FilterAttributePredicate('Request', $ids)]
        );

		return $references;
	}
}
 