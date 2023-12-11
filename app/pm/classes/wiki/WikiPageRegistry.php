<?php

class WikiPageRegistry extends ObjectRegistrySQL
{
	function getQueryClause(array $parms)
	{
	    $attributes = array();

        $extendedAttributes = [];
        foreach( $this->getPersisters() as $persister ) {
            $extendedAttributes = array_merge($extendedAttributes, $persister->getAttributes());
        }

	    foreach( $this->getObject()->getAttributes() as $attribute => $data ) {
	        if ( $attribute == 'Content' ) continue;
	        if ( $attribute == 'UserField3' ) continue;
            if ( in_array($attribute, $extendedAttributes) ) continue;
	        if ( !$this->getObject()->IsAttributeStored($attribute) ) continue;
	        $attributes[] = "t.".$attribute;
	    }

	    if ( $this->getObject()->getReferenceName() != '' ) {
	    	$reference_predicate = " AND t.ReferenceName = ".$this->getObject()->getReferenceName()." ";
	    }

	    return " (SELECT t.WikiPageId, t.VPD, t.RecordVersion, ".join(",",$attributes).", 
	                     IF(t.Content<>'', 'Y', 'N') ContentPresents, t.DocumentId, t.SortIndex 
	                FROM WikiPage t WHERE 1 = 1 {$this->getFilterPredicate($this->extractPredicates($parms))} {$reference_predicate} ) ";
	}

	function QueryById($ids)
    {
        return (new WikiPageRegistryContent(
                    $this->getObject(), $this->getPersisters(), array(), array()))
                        ->QueryById($ids);
    }

    public function getFilterClause( $parms, $alias )
    {
        // filter is used inside getQueryClause
        return "";
    }
}