<?php
include_once SERVER_ROOT_PATH.'pm/classes/notificators/EntityModifyProjectTrigger.php';

class ProjectPageModifyProjectTrigger extends EntityModifyProjectTrigger
{
	function checkEntity( $object_it ) {
	    return $object_it->object instanceof ProjectPage;
	}

    static function getObjectReferences( $object_it )
	{
 	    // prepare list of objects to be serilalized
 	    $references = array();
        
 	    $references[] = (new WikiPageRegistryContent(getFactory()->getObject('ProjectPage')))->Query(
             [new FilterInPredicate($object_it->idsToArray()), new SortDocumentClause()]
        );
 	    
		$references[] = getFactory()->getObject('WikiPageFile')->getRegistry()->Query(
            [new FilterAttributePredicate('WikiPage', $object_it->idsToArray())]
        );

		$references[] = getFactory()->getObject('WikiPageChange')->getRegistry()->Query(
            [new FilterAttributePredicate('WikiPage', $object_it->idsToArray())]
        );
		
		$references[] = getFactory()->getObject('Comment')->getRegistry()->Query(
            [new CommentObjectFilter($object_it)]
        );

		return $references;
	}
}
 