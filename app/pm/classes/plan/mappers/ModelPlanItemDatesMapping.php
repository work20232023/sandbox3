<?php

class ModelPlanItemDatesMapping
{
    public function map($object, &$values)
    {
        if ( $values['StartDate'] == '') return;
        if ( $values['FinishDate'] != '' && $values['action_mode'] != '' ) return;

        if ( $values[$object->getIdAttribute()] != '' )
        {
            $objectIt = $object->getExact($values[$object->getIdAttribute()]);

            $nowStart = new DateTime($values['StartDate']);
            $wasStart = new DateTime($objectIt->get('StartDate'));
            $interval = $wasStart->diff($nowStart);

            $values['FinishDate'] = date('Y-m-d',
                strtotime($interval->format('%R%a days'),
                    strtotime($objectIt->get('FinishDate')))
            );
        }
    }
}
