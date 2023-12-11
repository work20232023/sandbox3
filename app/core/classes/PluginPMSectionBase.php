<?php

class PluginPMBase extends PluginSectionBase
{
 	function getEntityAccess( $action, $role_ref_name, & $object )
 	{
 	}

 	function getObjectAccess( $action, $role_ref_name, & $object_it )
 	{
 	}

    /**
     * @param AutoActionIterator $action_it Iterator of AutoAction entity
     * @param IteratorBase $objectIt Subject of an automatic action
     * @param array $parms Data changed
     */
    function processAutoAction($action_it, $objectIt, $parms)
    {
    }

    function processTransition($transitionIt, $objectIt, & $message)
    {
        return null;
    }

    /**
     * @param StateAttributeIterator $stateAttributeIt
     * @param IteratorBase $objectIt
     *
     * @return bool
     */
    function validateStateAttribute($stateAttributeIt, $objectIt)
    {
        return true;
    }

    /**
     * @param PMCustomAttributeIterator $customAttributeIt
     * @param IteratorBase $objectIt
     *
     * @return bool
     */
    function validateCustomAttribute($customAttributeIt, $objectIt)
    {
        return true;
    }
}
