<?php

abstract class EstimationStrategy
{
	abstract function getDisplayName();
	
	function getEstimationAggregate()
	{
	    return 'SUM';
	}
	
	function getEstimation( $object = null, $estimation = 'Estimation', $group = 'Project' )
	{
		if ( !is_object($object) ) $object = getFactory()->getObject('pm_ChangeRequest');
			
		$sum_aggregate = new AggregateBase( $group, $estimation, $this->getEstimationAggregate() );
		$request_it = $object->getAggregated([$sum_aggregate]);

		$data = array();
		while ( !$request_it->end() )
		{
		    $data[$request_it->get( $sum_aggregate->getAttribute() )] = $request_it->get( $sum_aggregate->getAggregateAlias() );
		    $request_it->moveNext();
		}
		
		return $data;
	}
	
	function getEstimationByIt( $request_it )
	{
 	 	$total_open = 0;
 	 	$estimated = 0;
 	 	$nonestimated = array();
		
 	 	$request_it->moveFirst();
 	 	
		while( !$request_it->end() )
		{
			if ( $request_it->get("Estimation") != '' )
			{
				$estimated++;
			}
			else
			{
				array_push($nonestimated, $request_it->getId());
			}
			
			if ( !$request_it->IsFinished() )
			{
				$total_open += $request_it->get("Estimation");
			}

			$request_it->moveNext();
		}

		return array(round($total_open, 1), round($estimated/$request_it->count()*100, 1));
	}
	
    function getVelocityText()
    {
        $methodology_it = getSession()->getProjectIt()->getMethodologyIt();
        if ( $methodology_it->HasFixedRelease() )
        {
            return text(1115);
        }
        else
        {
            return text(1117);
        }
    }
	
	function getDimensionText( $text )
	{
		return $text;
	}
	
	function hasEstimationValue()
	{
		return false;
	}
	
	function getEstimationFilter()
	{
		return null;
	}
	
	function getEstimationPredicate( $value )
	{
		return null;
	}
	
	function getScale()
	{
		return array();
	}

	function getFilterScale()
	{
		return array();
	}

	function hasDiscreteValues() {
		return true;
	}

	public function getReleaseVelocityText( $object_it )
    {
        return $object_it->getVelocity() > 0
            ? str_replace('%1', $this->getDimensionText(round($object_it->getVelocity(), 0)), array_pop(preg_split('/:/',$this->getVelocityText())))
            : '0';
    }

    public function convertToNumeric( $value ) {
	    return $value;
    }
}
