<?php

class RequestMilestonesPersister extends ObjectSQLPersister
{
 	function getSelectColumns( $alias )
 	{
 		$columns = array();
 		
 		$columns[] =  
 			"( SELECT GROUP_CONCAT(CAST(tr.ObjectId AS CHAR)) 
 			     FROM pm_ChangeRequestTrace tr 
			    WHERE tr.ChangeRequest = {$this->getPK($alias)}
 			      AND tr.ObjectClass = 'Milestone' ) Deadlines ";
  		
 		return $columns;
 	}

    function add($object_id, $parms)
    {
        if ( array_key_exists('Deadlines', $parms) ) {
            $this->set($object_id, \TextUtils::parseIds($parms['Deadlines']));
        }
    }

    function modify($object_id, $parms)
    {
        if ( array_key_exists('Deadlines', $parms) ) {
            $this->set($object_id, \TextUtils::parseIds($parms['Deadlines']));
        }
    }

    function set( $object_id, $deadlines = array() )
    {
        $trace = getFactory()->getObject('RequestTraceMilestone');
        $trace->setNotificationEnabled(false);

        $wasMilestoneIds = $trace->getRegistryBase()->Query(
                array(
                    new FilterAttributePredicate('ChangeRequest', $object_id)
                )
            )->fieldToArray('ObjectId');

        $deleteIds = array_diff($wasMilestoneIds, $deadlines);
        if ( count($deleteIds) > 0 ) {
            $traceIt = $trace->getRegistryBase()->Query(
                array(
                    new FilterAttributePredicate('ObjectId', $deleteIds),
                    new FilterAttributePredicate('ChangeRequest', $object_id)
                )
            );
            while( !$traceIt->end() ) {
                DAL::Instance()->Query(
                    " DELETE FROM pm_ChangeRequestTrace WHERE pm_ChangeRequestTraceId = {$traceIt->getId()} "
                );
                $traceIt->moveNext();
            }
        }

        foreach( $deadlines as $milestoneId ) {
            getFactory()->mergeEntity( $trace,
                array(
                    'ObjectId' => $milestoneId,
                    'ObjectClass' => 'Milestone',
                    'ChangeRequest' => $object_id
                )
            );
        }
    }
}
