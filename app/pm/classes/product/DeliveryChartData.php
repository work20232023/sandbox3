<?php
include "DeliveryChartDataRegistry.php";
include "predicates/DeliveryProductTypePredicate.php";

class DeliveryChartData extends Metaobject
{
 	function __construct() 
 	{
 	    parent::__construct('entity', new DeliveryChartDataRegistry($this));

        $this->addAttribute('Project', 'INTEGER', '', false, true);
        $this->addAttribute('SortIndex', 'INTEGER', '', false, true);
        $this->addAttribute('Importance', 'REF_ImportanceId', '', false, true);
        $this->addAttribute('Priority', 'REF_PriorityId', '', false, true);
 	    $this->setSortDefault(
 	    		array (
                    new SortAttributeClause('SortIndex'),
                    new SortAttributeClause('FinishDate')
 	    		)
 	    	);
 	}

    function IsPersistable()
    {
        return false;
    }
}
