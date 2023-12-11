<?php

class CommentRecentPersister extends ObjectSQLPersister
{
    function getAttributes()
    {
        return ['RecentComment', 'RecentCommentDate', 'RecentCommentAuthor'];
    }

    function getSelectColumns( $alias )
 	{
 		$columns = array();
 		$className = get_class($this->getObject());

 		$columns[] =  
 			"( SELECT so.Caption FROM Comment so 
 			    WHERE so.ObjectId = {$this->getPK($alias)}
 			      AND so.ObjectClass = '{$className}'
 			    ORDER BY so.RecordCreated DESC LIMIT 1 ) RecentComment ";

        $columns[] =
            "( SELECT so.RecordModified FROM Comment so 
                WHERE so.ObjectId = {$this->getPK($alias)}
                  AND so.ObjectClass = '{$className}'
                ORDER BY so.RecordCreated DESC LIMIT 1 ) RecentCommentDate ";

		$columns[] =
			"( SELECT so.AuthorId FROM Comment so 
			    WHERE so.ObjectId = {$this->getPK($alias)}
			      AND so.ObjectClass = '{$className}'
			    ORDER BY so.RecordCreated DESC LIMIT 1 ) RecentCommentAuthor ";

 		return $columns;
 	}
}
