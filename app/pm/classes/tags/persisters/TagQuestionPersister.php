<?php

class TagQuestionPersister extends ObjectSQLPersister
{
    function getAttributes() {
        return array('Questions');
    }

 	function getSelectColumns( $alias )
 	{
 		return array( 
 			" ( SELECT COUNT(rt.ObjectId)
 				  FROM pm_CustomTag rt 
				 WHERE rt.Tag = {$this->getPK($alias)}
				   AND rt.ObjectClass = 'question' ) Question "
 		);
 	}
}
