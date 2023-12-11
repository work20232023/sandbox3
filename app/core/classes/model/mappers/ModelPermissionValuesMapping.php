<?php

class ModelPermissionValuesMapping
{
	public function map( $object, &$values )
    {
        $attributes = array_filter( array_keys($object->getAttributes()),
            function( $attribute ) use ($object) {
                return $object->IsAttributeModifiable($attribute);
            }
        );

        foreach ($attributes as $attribute)
        {
            if (!getFactory()->getAccessPolicy()->can_modify_attribute($object, $attribute) ) {
                unset($values[$attribute]);
            }
        }
	}
}
