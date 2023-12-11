<?php
include "ReleaseIterator.php";
include "ReleaseRegistry.php";
include "predicates/ReleaseTimelinePredicate.php";
include "predicates/ReleaseUserHasTasksPredicate.php";
include "sorts/SortReleaseEstimatedStartClause.php";
include_once "validators/ModelValidatorDatesCausality.php";
include_once "mappers/ModelPlanItemDatesMapping.php";

class Release extends Metaobject
{
 	function __construct( $registry = null )
 	{
		parent::__construct('pm_Version',
            is_object($registry) ? $registry : new ReleaseRegistry($this));

		$this->setSortDefault( array(
            new SortAttributeClause('StartDate'),
            new SortAttributeClause('Caption'))
        );
	}

	function createIterator() {
		return new ReleaseIterator( $this );
	}

	function getValidators()
    {
        return [
            new ModelValidatorDatesCausality()
        ];
    }

    function getMappers()
    {
        return [new \ModelPlanItemDatesMapping()];
    }

    function getPageFormPopup() {
        return true;
    }

    function getDefaultAttributeValue( $name )
	{
		switch ( $name )
		{
			case 'Project':
			    return getSession()->getProjectIt()->getId();
				
			case 'StartDate':
			    $release = getFactory()->getObject('Release');
				$release->addFilter( new ReleaseTimelinePredicate('not-passed') );
				$release->addSort( new SortAttributeClause('StartDate.D') );
				
				$release_it = $release->getAll();
				if ( $release_it->count() < 1 ) {
					return date( 'Y-m-j' );
				}
				else {
					return  $release_it->get('EstimatedFinishDate') != '' 
					            ? date( 'Y-m-j', strtotime('1 day', strtotime($release_it->get('EstimatedFinishDate')))) : 
					                $release_it->get('FinishDate') != '' 
					                    ? date( 'Y-m-j', strtotime('1 day', strtotime($release_it->get('FinishDate')))) : date( 'Y-m-j' );
				}

            case 'FinishDate':
                return date( 'Y-m-j',
                    strtotime('-1 day',
                        strtotime('12 week', strtotime( $this->getDefaultAttributeValue('StartDate') ) )
                    )
                );

            case 'InitialVelocity':
				return 0;
		}

		return parent::getDefaultAttributeValue($name);
	}

	function getDefaultFinishDate( $start_date, $finish_date = '' )
	{
		$methodology_it = getSession()->getProjectIt()->getMethodologyIt();

		if ( ($methodology_it->HasFixedRelease() || $finish_date == '') && !$methodology_it->HasPlanning() )
		{
			$weeks = $methodology_it->get('ReleaseDuration');
			
			if ( $weeks < 1 ) $weeks = 4;

			return date( 'Y-m-d H:i:s', strtotime('-1 day', 
							strtotime($weeks.' week', strtotime( $start_date ) ) )
				   );
		}
		
		return $finish_date;
	}

	function getVelocitySuggested()
	{
		$this->getRegistry()->setLimit(5);
		$release_it = $this->getRegistry()->Query(
			array (
				new ReleaseTimelinePredicate('past'),
				new FilterBaseVpdPredicate(),
				new SortAttributeClause('StartDate.D')
			)
		);
		$velocity = $release_it->getId() > 0 ? $release_it->getVelocity() : 0;
		$average = 0;
		while( !$release_it->end() ) {
			$average += $release_it->getVelocity();
			$release_it->moveNext();
		}
		$average = $release_it->count() > 0 ? $average / $release_it->count() : 0;

		return array($average, $velocity);
	}

	function getPage()
	{
		return getSession()->getApplicationUrl($this).'releases?';
	}

	function DeletesCascade( $object )
	{
	    switch ( $object->getEntityRefName() )
	    {
	        case 'pm_VersionMetric':
	        case 'pm_Release':
	        	return true;
                	                
	        default:
	            return false;
	    }
	}
	
	function add_parms( $parms )
	{
		$object_id = parent::add_parms( $parms );

		if ( $object_id > 0 ) {
			$object_it = $this->getExact( $object_id );
			$object_it->storeMetrics();
		}

		return $object_id;
	}
	
	function modify_parms( $object_id, $parms )
	{
		$result = parent::modify_parms( $object_id, $parms );
		if ( $result < 1 ) return $result;
		
		$object_it = $this->getExact( $object_id );
		if ( $parms['StartDate'] != '' ) {
		    $object_it->resetBurndown();
        }

		$object_it->storeMetrics();
		return $result;
	}
}