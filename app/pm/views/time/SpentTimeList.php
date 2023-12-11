<?php

class SpentTimeList extends PMPageList
{
    function extendModel()
    {
        parent::extendModel();

        $object = $this->getObject();
        foreach( array('LeftWork','Completed') as $attribute ) {
            $object->removeAttribute($attribute);
        }

        $object->setAttributeVisible('Participant', true);
        $object->setAttributeVisible('Issue', true);

        $methodologyIt = getSession()->getProjectIt()->getMethodologyIt();
        if ( $methodologyIt->HasTasks() ) {
            $object->setAttributeVisible('Task', true);
        }
        $object->addAttributeGroup('Completed', 'system');

        $object->setAttributeOrderNum('Participant', 5);
        $object->setAttributeOrderNum('ReportDate', 6);
        $object->setAttributeOrderNum('Capacity', 7);
        $object->setAttributeOrderNum('LeftWork', 8);

        foreach( array('Capacity') as $attribute ) {
            $object->addAttributeGroup($attribute, 'hours');
        }
    }

    function getGroupDefault()
    {
        $roles = getSession()->getRoles();
        return $roles['lead'] ? 'Participant' : 'ReportDate';
    }
}
 