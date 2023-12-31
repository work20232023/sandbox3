<?php

include "predicates/FeatureTerminalFilter.php";

class FeatureTerminalRegistry extends ObjectRegistrySQL
{
	function getFilters()
	{
		return array_merge(
				parent::getFilters(), 
				array ( 
						new FeatureTerminalFilter()
				)
		);
	}
}