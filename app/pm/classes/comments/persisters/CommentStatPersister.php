<?php

class CommentStatPersister extends ObjectSQLPersister
{
    function getAttributes()
    {
        return [];
    }

    function getSelectColumns( $alias )
 	{
 		$columns = array();
 		$className = get_class($this->getObject());
 		
 		$columns[] =
 			"( SELECT COUNT(1) FROM Comment so  
 			    WHERE so.ObjectId = {$this->getPK($alias)}
 			      AND so.ObjectClass = '{$className}' 
 			      AND so.Closed = 'N') CommentsCount ";

 		$userIt = getSession()->getUserIt();
 		if ( $userIt->getId() != '' ) {
            $columns[] =
                "( SELECT COALESCE(MAX(so.RecordCreated),'') FROM ObjectChangeNotification so 
                    WHERE so.ObjectId = {$this->getPK($alias)}
                     AND so.ObjectClass = '{$className}' 
                     AND so.SystemUser = {$userIt->getId()}
                     AND so.Action = 'commented' LIMIT 1 ) NewComments ";
        }

 		return $columns;
 	}
}
