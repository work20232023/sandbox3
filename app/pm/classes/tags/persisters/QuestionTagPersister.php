<?php

class QuestionTagPersister extends ObjectSQLPersister
{
    function getAttributes()
    {
        return array('Tags');
    }

    function getSelectColumns( $alias )
 	{
        $className = getFactory()->getObject('QuestionTag')->getObjectClass();

 		$columns = [
            " (SELECT GROUP_CONCAT(CAST(wt.Tag AS CHAR)) 
             	 FROM pm_CustomTag wt 
              	WHERE wt.ObjectId = {$this->getPK($alias)}
            	  AND wt.ObjectClass = '{$className}' ) Tags "
        ];
 		
 		return $columns;
 	}
} 