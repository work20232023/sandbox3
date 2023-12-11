<?php
include_once SERVER_ROOT_PATH."core/classes/model/validation/ModelValidatorInstance.php";
include_once SERVER_ROOT_PATH."core/classes/model/mappers/ModelDataTypeMappingDate.php";

class ModelValidatorWorkAssignedLimit extends ModelValidatorInstance
{
	public function validate( Metaobject $object, array $parms )
	{
        if ( !$object instanceof Task ) return "";
        if ( $parms['Assignee'] == '' && $parms['State'] == '' ) return "";

        if ( $parms[$object->getIdAttribute()] == '' ) {
            $parms[$object->getIdAttribute()] = '-1';
        }
        else {
            $objectIt = $object->getExact($parms[$object->getIdAttribute()]);
            if ( $parms['Assignee'] == '' ) {
                $parms['Assignee'] = $objectIt->get('Assignee');
            }
            if ( $parms['State'] == '' ) {
                $parms['State'] = $objectIt->get('State');
            }
        }
        if ( $parms['Assignee'] == '' || $parms['State'] == '' ) return "";

        $stateIt = WorkflowScheme::Instance()->getStateIt($object);
        $stateIt->moveTo('ReferenceName', $parms['State']);

        if ( $stateIt->get('AssignedLimit') > 0 ) {
            $itemIt = $object->getRegistryBase()->QueryKeys(array(
                new FilterAttributePredicate('State', $parms['State']),
                new FilterAttributePredicate('Assignee', $parms['Assignee']),
                new FilterBaseVpdPredicate()
            ));
            $ids = array_unique(array_merge(
                array_filter(
                    $itemIt->idsToArray(),
                    function($item) {
                        return $item > 0;
                    }
                ),
                array($parms[$object->getIdAttribute()])
            ));
            if ( count($ids) > $stateIt->get('AssignedLimit') ) {
                return text(3327);
            }
        }

        return "";
    }
}