<?php

class WikiPageBaselineDetailsPersister extends ObjectSQLPersister
{
 	function getSelectColumns( $alias )
 	{
 		return array(
            " (SELECT sp.UID 
                 FROM WikiPageTrace tr, WikiPage sp 
                WHERE tr.TargetPage = {$this->getPK($alias)} 
                  AND tr.Type = 'branch'
                  AND tr.SourcePage = sp.WikiPageId LIMIT 1) MasterPageUID ",
        );
 	}
}
