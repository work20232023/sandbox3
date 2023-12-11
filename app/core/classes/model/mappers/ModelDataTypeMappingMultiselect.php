<?php

class ModelDataTypeMappingMultiselect
{
	public function map( $object, &$values )
    {
        $attributes = $object->getAttributesByGroup('multiselect');
        foreach( $attributes as $attribute ) {
            if ( !array_key_exists($attribute, $values) && array_key_exists($attribute . 'OnForm', $values) ) {
                $values[$attribute] = '';
            }
        }
	}
}
