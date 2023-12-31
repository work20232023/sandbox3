<?php

class MethodologyIterator extends OrderedIterator
{
    function __wakeup()
    {
        parent::__wakeup();
        $this->setObject( new Methodology() );
    }

 	function HasTasks() {
 		return $this->get('IsTasks') == 'Y';
 	}
 	
 	function HasPlanning() {
 		return $this->get('IsPlanningUsed') == 'Y';
 	}

    function UsePlanningByTasks() {
        return $this->get('IsTasks') == 'Y' && $this->get('TaskEstimationUsed') == 'Y';
    }
 	
	function HasFixedRelease() {
		return $this->get('IsFixedRelease') == 'Y';
	}
	function getReleaseDuration() {
		return $this->get('ReleaseDuration');
	}
	function getAvgDurationOfTaskVerification() {
		return $this->get('VerificationTime') == '' ? 1 : $this->get('VerificationTime');
	}

	function getMeasureUnitName() {
		return translate ('ч.');
	}
	
	function HasMeasureUnitDays() {
		return false;
	}
	
	function HasMilestones() {
		return true;
	}
	
	function IsParticipantsTakesTasks() {
		return $this->get('IsParticipantsTakeTasks') == 'Y';
	}

	function HasFeatures() {
		return $this->get('UseFunctionalDecomposition') == 'Y';
	}
	
	function IsUsedDeadlines()
	{
		return $this->get('IsDeadlineUsed') == 'Y';
	}

	function IsReportsRequiredOnActivities()
	{
		return $this->get('IsReportsOnActivities') == 'Y';
	}

	function CustomerAcceptsIssues()
	{
		return $this->get('CustomerAcceptsIssues') == 'Y';
	}
	
	function HasStatistics()
	{
		return true;
	}
	
	function HasReleases()
	{
		return in_array($this->get('IsReleasesUsed'), array('Y', 'I'));
	}
	
	function IsIssueTracking()
	{
		return !$this->HasPlanning();
	}
	
	function IsTimeTracking()
	{
		return $this->IsReportsRequiredOnActivities();
	}

	function HasVelocity()
	{
		return $this->IsAgile() && ($this->HasPlanning() || $this->HasReleases());
	}
	
	function getEstimationStrategy()
	{
	    $builders = getSession()->getBuilders('EstimationStrategyBuilder');
	    if ( is_array($builders) )
	    {
    	    foreach( $builders  as $builder ) {
                foreach( $builder->getStrategies() as $strategy ) {
                    if ( is_a($strategy, $this->get('RequestEstimationRequired')) ) {
                        return $strategy;
                    }
                }
            }
	    }
		return new EstimationNoneStrategy();
	}

    function getIterationEstimationStrategy()
    {
        $builders = getSession()->getBuilders('EstimationStrategyBuilder');
        if ( is_array($builders) )
        {
            foreach( $builders  as $builder ) {
                foreach( $builder->getStrategies() as $strategy ) {
                    if ( is_a($strategy, $this->get('RequestEstimationRequired')) ) {
                        if ( $strategy instanceof EstimationNoneStrategy && $this->get('TaskEstimationUsed') == 'Y' ) {
                            return new EstimationHoursStrategy();
                        }
                        return $strategy;
                    }
                }
            }
        }
        return new EstimationNoneStrategy();
    }

	function RequestEstimationUsed()
	{
		return $this->get('RequestEstimationRequired') != 'estimationnonestrategy';
	}

	function IsEstimationHoursStrategy() {
        return $this->get('RequestEstimationRequired') == 'estimationhoursstrategy';
    }
	
	function TaskEstimationUsed()
	{
		return $this->get('TaskEstimationUsed') == 'Y';
	}

	function IsAgile() {
        return $this->get('MetricsType') == 'A';
    }

    function IsLeftWorkVisible() {
        return $this->HasTasks() && $this->TaskEstimationUsed()
            || !$this->TaskEstimationUsed() && $this->IsEstimationHoursStrategy();
    }

    function IsTimesheetsAreApproved() {
        return $this->get('IsTimesheetsAreApproved') == 'Y';
    }
}