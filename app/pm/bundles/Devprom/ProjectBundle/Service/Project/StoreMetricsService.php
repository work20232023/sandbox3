<?php
namespace Devprom\ProjectBundle\Service\Project;

include_once SERVER_ROOT_PATH . "pm/classes/project/MetricIssueBuilder.php";
include_once SERVER_ROOT_PATH . "pm/classes/product/persisters/FeatureMetricsPersister.php";
include_once SERVER_ROOT_PATH . "pm/classes/participants/predicates/UserHasIncompleteWorkPredicate.php";

class StoreMetricsService
{
 	function execute( $project_it, $force = false )
 	{
        $registry = getFactory()->getObject('Task')->getRegistryBase();
        $customBuilders = getSession()->getBuilders('MetricTaskBuilder');
        foreach( $customBuilders as $builder ) {
            $builder->buildAll($registry, array (
                new \StatePredicate('notresolved'),
                new \FilterVpdPredicate()
            ));
        }

        $registry = getFactory()->getObject('Request')->getRegistryBase();
        $customBuilders = getSession()->getBuilders('MetricIssueBuilder');
        foreach( $customBuilders as $builder ) {
            $builder->buildAll($registry, array (
                new \StatePredicate('notresolved'),
                new \FilterVpdPredicate($project_it->get('VPD'))
            ));
        }

        $this->storeProjectMetrics(
            $project_it,
            getFactory()->getObject('Release')->getRegistryBase()->Query(
                array (
                    new \FilterAttributePredicate('Project', $project_it->getId()),
                    $force
                        ? new \FilterDummyPredicate()
                        : new \ReleaseTimelinePredicate('not-passed')
                )
            ),
            getFactory()->getObject('Iteration')->getRegistryBase()->Query(
                array (
                    new \FilterAttributePredicate('Project', $project_it->getId()),
                    new \FilterAttributeNullPredicate('Version'),
                    $force
                        ? new \FilterDummyPredicate()
                        : new \IterationTimelinePredicate(\IterationTimelinePredicate::NOTPASSED)
                )
            )
        );

        $registry = getFactory()->getObject('Feature')->getRegistryBase();
		$this->storeFeatureMetrics(
			$registry,
			array (
				new \FilterVpdPredicate($project_it->get('VPD')),
				new \FeatureMetricsPersister()
			)
		);
 	}
 	
 	function storeProjectMetrics( $project_it, $version_it, $iteration_it )
 	{
        getFactory()->resetCachedIterator($project_it->object);

        if ( $version_it instanceof \OrderedIterator ) {
            while ( !$version_it->end() ) {
                $version_it->storeMetrics();
                $version_it->moveNext();
            }
        }

        if ( $iteration_it instanceof \OrderedIterator ) {
            while ( !$iteration_it->end() ) {
                $iteration_it->storeMetrics();
                $iteration_it->moveNext();
            }
        }

		$project_it->object->setNotificationEnabled(false);
 		$project_it->object->modify_parms($project_it->getId(), 
            array (
                'EstimatedStartDate' => $project_it->get('EstimatedStartDate'),
                'EstimatedFinishDate' => $project_it->get('EstimatedFinishDate'),
                'RecordModified' => $project_it->get('RecordModified')
            )
		);

 		$metricIt = getFactory()->getObject('Metric')->getAll();
        $metrics_registry = getFactory()->getObject('ProjectMetric')->getRegistry();
        foreach( $project_it->object->getAttributesByGroup('metrics') as $attribute ) {
            $metricIt->moveToId($attribute);
            $metrics_registry->setMetric($attribute, $project_it->get($attribute), $metricIt->getDisplayName());
        }
 	}
 	
 	function storeFeatureMetrics( $registry, $queryParms )
 	{
		$registry->setPersisters(array());
		$feature_it = $registry->Query($queryParms);

        getFactory()->resetCachedIterator($feature_it->object);
        $feature_it->object->setNotificationEnabled(false);

 		while( !$feature_it->end() )
 		{
			$registry->Store(
	 				$feature_it,
	 				array (
						'Estimation' => $feature_it->get('MetricEstimation'),
						'EstimationLeft' => $feature_it->get('MetricEstimationLeft'),
						'Workload' => $feature_it->get('MetricWorkload'),
						'EstimatedStartDate' => $feature_it->get('MetricStartDate'),
						'EstimatedFinishDate' => $feature_it->get('MetricDeliveryDate'),
						'RecordModified' => $feature_it->get('RecordModified')
	 				)
	 		);
 			$feature_it->moveNext();
 		}
 	}

 	public function forceIssueMetrics( $queryParms )
    {
        $registry = getFactory()->getObject('Request')->getRegistryBase();
        $customBuilders = getSession()->getBuilders('MetricIssueBuilder');
        foreach( $customBuilders as $builder ) {
            $builder->buildAll($registry,$queryParms);
        }
    }

    public function forceTaskMetrics( $queryParms )
    {
        $registry = getFactory()->getObject('Task')->getRegistryBase();
        $customBuilders = getSession()->getBuilders('MetricTaskBuilder');
        foreach( $customBuilders as $builder ) {
            $builder->buildAll($registry, $queryParms);
        }
    }

    public function executeWorkers()
    {
        $this->forceUsersMetrics(array(
            new \UserHasIncompleteWorkPredicate()
        ));
    }

    public function forceUsersMetrics( $queryParms )
    {
        $registry = getFactory()->getObject('User')->getRegistryBase();
        $customBuilders = getSession()->getBuilders('MetricUserBuilder');
        foreach( $customBuilders as $builder ) {
            $builder->buildAll($registry, $queryParms);
        }
    }
}