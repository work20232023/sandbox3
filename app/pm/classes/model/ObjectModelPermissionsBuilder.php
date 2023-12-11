<?php

class ObjectModelPermissionsBuilder extends ObjectModelBuilder
{
    public function build( Metaobject $object )
    {
    	$policy = getFactory()->getAccessPolicy();
        foreach($object->getAttributesByGroup('permissions') as $attribute )
        {
			if ( $policy->can_read_attribute($object, $attribute, $object->getAttributeClass($attribute))) continue;

            $object->setAttributeVisible($attribute, false);
            $object->setAttributeRequired($attribute, false);
            $object->addAttributeGroup($attribute, 'system');
		}
    }
}