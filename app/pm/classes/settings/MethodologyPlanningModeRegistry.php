<?php

class MethodologyPlanningModeRegistry extends ObjectRegistrySQL
{
	const None = 'N';
	const Releases = 'Y';
	const Iterations = 'I';
	const IterationsOnly = 'T';
	
	public function Query($parms = array())
	{
		return $this->createIterator( array (
				array ( 'entityId' => MethodologyPlanningModeRegistry::None, 'Caption' => text(1718) ),
				array ( 'entityId' => MethodologyPlanningModeRegistry::Releases, 'Caption' => text(1719) ),
				array ( 'entityId' => MethodologyPlanningModeRegistry::IterationsOnly, 'Caption' => text(2137) ),
				array ( 'entityId' => MethodologyPlanningModeRegistry::Iterations, 'Caption' => text(1720) )
		));
	}
}