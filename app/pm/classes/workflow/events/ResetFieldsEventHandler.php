<?php
include_once "WorklfowMovementEventHandler.php";

class ResetFieldsEventHandler extends WorklfowMovementEventHandler
{
	function handle( $object_it )
	{
	    $transitionId = $object_it->get('LastTransition');
	    if ( $transitionId == '' ) return;

	    $parms = array();
	    $data = $this->getData();

		$reset_fields_it = getFactory()->getObject('TransitionResetField')
            ->getByRef('Transition', $transitionId);

		while ( !$reset_fields_it->end() ) {
		    if ( $data[$reset_fields_it->get('ReferenceName')] != '' ) {
                $reset_fields_it->moveNext();
                continue;
            }
			$parms[$reset_fields_it->get('ReferenceName')] = '';
			$reset_fields_it->moveNext();
		}
		if ( count($parms) < 1 ) return;
		
		$object_it->object->modify_parms( $object_it->getId(), $parms );
	}
}