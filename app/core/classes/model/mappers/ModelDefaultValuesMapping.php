<?php

class ModelDefaultValuesMapping
{
	public function map( $object, &$values )
    {
        $attributes = array_filter( array_keys($object->getAttributes()),
            function( $attribute ) use ($object,$values) {
                return $object->IsAttributeModifiable($attribute);
            }
        );

        foreach ($attributes as $attribute)
        {
            $groups = $object->getAttributeGroups($attribute);
            $valueDefined = in_array('multiselect', $groups)
                ? count($values[$attribute]) > 0
                : trim($values[$attribute]) != '';

            if (!$valueDefined) {
                $values[$attribute] = $object->getDefaultAttributeValue($attribute);
            }
        }
	}
}
