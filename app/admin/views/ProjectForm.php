<?php
include (dirname(__FILE__).'/../methods/c_project_methods.php');

class ProjectForm extends AdminPageForm
{
	function getRenderParms()
    {
        $object = $this->getObject();
        foreach( array_keys($object->getAttributes()) as $attribute ) {
            $object->setAttributeVisible($attribute, false);
        }
        $visible = array(
            'Caption', 'CodeName', 'Language', 'Importance', 'Description', 'IsClosed', 'OrderNum'
        );
        foreach( $visible as $attribute ) {
            $object->setAttributeVisible($attribute, true);
        }
        return parent::getRenderParms();
    }

    function getDeleteActions()
    {
        $actions = array();
        $method = new BulkDeleteWebMethod($this->getObject());
        if ( $method->HasAccess() )
        {
            $actions[] = array(
                'url' => $method->url($this->getObject(), $this->getObjectIt()->getId()),
                'name' => $method->getCaption()
            );
        }
        return $actions;
    }
}
