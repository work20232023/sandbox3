<?php

class FeatureTagPersister extends ObjectSQLPersister
{
    function getAttributes()
    {
        return array('Tags');
    }

    function getSelectColumns( $alias )
 	{
        $className = getFactory()->getObject('FeatureTag')->getObjectClass();

 	    return array(
            " (SELECT GROUP_CONCAT(CAST(wt.Tag AS CHAR)) 
             	 FROM pm_CustomTag wt 
              	WHERE wt.ObjectId = {$this->getPK($alias)}
            	  AND wt.ObjectClass = '{$className}' ) Tags ",

            " (SELECT GROUP_CONCAT(tg.Caption) 
             	 FROM pm_CustomTag wt, Tag tg 
              	WHERE wt.ObjectId = {$this->getPK($alias)}
                 AND wt.Tag = tg.TagId 
            	  AND wt.ObjectClass = '{$className}' ) TagNames "
        );
 	}

    function IsPersisterImportant() {
        return true;
    }
} 