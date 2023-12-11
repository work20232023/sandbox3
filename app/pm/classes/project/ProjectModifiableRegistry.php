<?php

class ProjectModifiableRegistry extends ObjectRegistrySQL
{
	public function getFilters()
	{
		return array_merge(
		    parent::getFilters(),
            array (
                new ProjectAccessiblePredicate(getSession()->getUserIt(), true),
                new ProjectStatePredicate('active')
            )
		);
	}
}