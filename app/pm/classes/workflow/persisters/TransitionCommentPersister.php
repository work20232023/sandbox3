<?php

class TransitionCommentPersister extends ObjectSQLPersister
{
    function getAttributes() {
        return array(
            'TransitionComment'
        );
    }

    function getSelectColumns( $alias )
 	{
  		$objectPK = ($alias != '' ? $alias."." : "").'StateObject';

        $columns = array(
            "( SELECT IFNULL(so.Comment, (SELECT co.Caption FROM Comment co WHERE co.CommentId = so.CommentObject)) 
                 FROM pm_StateObject so 
                WHERE so.pm_StateObjectId = {$objectPK} ) TransitionComment "
        );

 		return $columns;
 	}

    function IsPersisterImportant()
    {
        return true;
    }
}