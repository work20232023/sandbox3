<?php

class RequestComponentsPersister extends ObjectSQLPersister
{
    function getAttributes() {
        return array(
            'Components'
        );
    }

    function getSelectColumns( $alias )
 	{
        $trace = getFactory()->getObject('ComponentTraceRequest');
 		return array(
            " ( SELECT GROUP_CONCAT(CAST(l.Component AS CHAR)) 
                 FROM pm_ComponentTrace l 
                WHERE l.ObjectId = {$this->getPK($alias)}
                  AND l.ObjectClass = '{$trace->getObjectClass()}' ) Components ",
 		);
 	}

    function modify($object_id, $parms)
    {
        if ( array_key_exists('Components', $parms) ) {
            $this->bind($object_id, $parms['Components']);
        }
        parent::modify($object_id, $parms);
    }

    function add($object_id, $parms)
    {
        if ( $parms['Components'] != '' ) {
            $this->bind($object_id, $parms['Components']);
        }
        parent::add($object_id, $parms);
    }

    function bind( $objectId, $traceId )
    {
        $trace = getFactory()->getObject('ComponentTraceRequest');
        $components = $trace->getByRef('ObjectId', $objectId)->fieldToArray('Component');

        $tobeDeleted = array_diff($components, \TextUtils::parseIds($traceId));
        $tobeAdded = array_diff(\TextUtils::parseIds($traceId), $components);

        if ( count($tobeDeleted) > 0 ) {
            $traceIt = $trace->getRegistry()->Query(array(
                new FilterAttributePredicate('ObjectId', $objectId),
                new FilterAttributePredicate('Component', $tobeDeleted)
            ));
            while( !$traceIt->end() ) {
                $traceIt->object->delete($traceIt->getId());
                $traceIt->moveNext();
            }
        }

        foreach( $tobeAdded as $componentId ) {
            $trace->getRegistry()->Merge(
                array(
                    'Component' => $componentId,
                    'ObjectId' => $objectId
                )
            );
        }
    }
}
