<?php

class WikiPageVersionRegistry extends ObjectRegistrySQL
{
	function getFilters()
	{
		return array_merge( parent::getFilters(), 
				array (
					new FilterVpdPredicate(),
					new FilterAttributePredicate('ObjectClass', $this->getObject()->getObjectClass()),
					new FilterAttributePredicate('Type', 'none')
				)
		);
	}
}