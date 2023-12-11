<?php
include_once SERVER_ROOT_PATH."core/classes/model/validation/ModelValidatorInstance.php";
include_once SERVER_ROOT_PATH."core/classes/model/mappers/ModelDataTypeMappingDate.php";

class ModelValidatorDayTimeSpentLimit extends ModelValidatorInstance
{
	public function validate( Metaobject $object, array $parms )
	{
        if ( !defined('MAX_DAILY_HOURS') ) return "";

        $dataString = $parms['Capacity'] . $parms['Participant'] . $parms['ReportDate'];
        if ( $dataString == '' ) return "";

        $totalSpentTime = 0;
        if ( $parms[$object->getIdAttribute()] == '' ) {
            $parms[$object->getIdAttribute()] = '-1';
            $totalSpentTime += floatval($parms['Capacity']);
            if ( $parms['Participant'] == '') {
                $parms['Participant'] = $object->getDefaultAttributeValue('Participant');
            }
            if ( $parms['ReportDate'] == '') {
                $parms['ReportDate'] = $object->getDefaultAttributeValue('ReportDate');
            }
        }
        else {
            $objectIt = $object->getExact($parms[$object->getIdAttribute()]);
            $totalSpentTime += floatval($objectIt->get('Capacity'));
            if( $parms['Participant'] == '' ) {
                $parms['Participant'] = $objectIt->get('Participant');
            }
            if( $parms['ReportDate'] == '' ) {
                $parms['ReportDate'] = $objectIt->get('ReportDate');
            }
        }

        $totalSpentTime += $object->getRegistryBase()->Query(array(
                new FilterAttributePredicate('Participant', $parms['Participant']),
                new FilterAttributePredicate('ReportDate', $parms['ReportDate']),
                new FilterNotInPredicate($parms[$object->getIdAttribute()])
            ))->getSumByField('Capacity');

        if ( $totalSpentTime > MAX_DAILY_HOURS ) {
            return sprintf(text(3328), MAX_DAILY_HOURS);
        }

        return "";
    }
}