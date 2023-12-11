<?php
include_once SERVER_ROOT_PATH."core/classes/model/validation/ModelValidatorInstance.php";
include_once SERVER_ROOT_PATH."core/classes/model/mappers/ModelDataTypeMappingDate.php";

class ModelValidatorPlannedTimeSpentLimit extends ModelValidatorInstance
{
	public function validate( Metaobject $object, array $parms )
	{
        if ( !defined('PLANNED_HOURS_EXCEED') ) return "";
        if ( PLANNED_HOURS_EXCEED ) return "";

        $totalSpentTime = 0;
        if ( $parms['Capacity'] != '' ) {
            $totalSpentTime += floatval($parms['Capacity']);
        }

        if ( $parms['Task'] != '' ) {
            $taskIt = getFactory()->getObject('Task')->getExact($parms['Task']);
            // check if attribute LeftWork is available
            if ( $taskIt->get('Planned') != '' && !in_array('system', $taskIt->object->getAttributeGroups('LeftWork')) ) {
                $totalSpentTime += $object->getRegistryBase()->Query(array(
                                        new FilterAttributePredicate('Task', $parms['Task']),
                                        new FilterNotInPredicate($parms[$object->getIdAttribute()])
                                    ))->getSumByField('Capacity');
                if ( $totalSpentTime > $taskIt->get('Planned') ) {
                    return text(3329);
                }
            }
        }

        if ( $parms['Issue'] != '' ) {
            $issueIt = getFactory()->getObject('Request')->getExact($parms['Issue']);
            // check if attribute EstimationLeft is available
            if ( $issueIt->get('Estimation') != '' && !in_array('system', $issueIt->object->getAttributeGroups('EstimationLeft')) ) {
                $totalSpentTime += $object->getRegistryBase()->Query(array(
                                        new FilterAttributePredicate('Issue', $parms['Issue']),
                                        new FilterNotInPredicate($parms[$object->getIdAttribute()])
                                    ))->getSumByField('Capacity');
                if ( $totalSpentTime > $issueIt->get('Estimation') ) {
                    return text(3329);
                }
            }
        }

        return "";
    }
}