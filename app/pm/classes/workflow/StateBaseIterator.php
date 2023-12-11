<?php

class StateBaseIterator extends OrderedIterator
{
	function getObject() {
		return getFactory()->getObject( $this->get('ObjectClass') );
	}

	function getObjectsCount()
	{
		$object = $this->getObject();
		if ( !is_object($object) ) return 0;

		$count_aggregate = new AggregateBase( 'State' );

		$it = $object->getAggregated(
                [$count_aggregate],
                [new ObjectStatePredicate($this), new FilterBaseVpdPredicate()]
            );
		$cnt = $it->get( $count_aggregate->getAggregateAlias() );
		
		return $cnt == '' ? 0 : $cnt;
	}

	function getTransitionIt()
	{
		if ( $this->getId() == '' ) return getFactory()->getObject('Transition')->getEmptyIterator();
		
		$it = getFactory()->getObject('Transition')->getRegistry()->Query(
            array (
                new FilterAttributePredicate('SourceState', $this->getId())
            )
		);
		$it->object->setStateAttributeType( $this->object );
		
		return $it;
	}
	
	function getWarningMessage( $object_it = null ) {
		return '';
	}
	
	function getDbSafeReferenceName() {
		return preg_replace('/\s+/', '_', $this->get('ReferenceName'));
	}
}