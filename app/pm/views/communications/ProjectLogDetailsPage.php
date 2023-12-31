<?php
include "ProjectLogDetailsTable.php";

class ProjectLogDetailsPage extends PMPage
{
	function getObject() {
 		return getFactory()->getObject('ChangeLogAggregated');
	}
    
    function getTable() {
 		return new ProjectLogDetailsTable( $this->getObject() );
 	}

 	function getEntityForm() {
 		return null;
 	}

	function getRecentChangedObjectIds( $filters )
	{
        return (new ObjectRegistrySQL($this->getObject()))->QueryKeys(
				array (
                    new FilterCreatedSinceSecondsPredicate(5 * 60),
                    new FilterVpdPredicate(),
                    new SortKeyClause('DESC')
				)
			 )->idsToArray();
 	}

 	function getRenderParms()
    {
        return array_merge(
            parent::getRenderParms(),
            array(
                'context_template' => ''
            )
        );
    }
}
