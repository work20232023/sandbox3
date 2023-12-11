<?php
use Devprom\ProjectBundle\Service\Project\StoreMetricsService;

class MilestoneMetricsEventHandler extends SystemTriggersBase
{
	function process( $object_it, $kind, $content = array(), $visibility = 1) 
	{
	    if ( !$object_it->object instanceof Milestone ) return;
	    if ( $object_it->get('TraceRequests') == '' ) return;

        $ids = \TextUtils::parseIds($object_it->get('TraceRequests'));
	    if ( count($ids) < 1 ) return;

	    $service = new StoreMetricsService();
    	$service->forceIssueMetrics(
			array (
				new FilterInPredicate($ids)
			)
		);
	}
}