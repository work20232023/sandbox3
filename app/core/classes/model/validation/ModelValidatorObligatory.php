<?php
include_once "ModelValidatorInstance.php";

class ModelValidatorObligatory extends ModelValidatorInstance
{
	private $attributes = [];
	
	public function __construct( $attributes = [] ) {
		$this->attributes = $attributes;
	}
	
	public function validate(Metaobject $object, array $parms)
	{
        $attributes = $this->attributes;
	    if (count($attributes) < 1) {
            $attributes = array_keys($object->getAttributes());
        }

        $attributes = array_filter( $attributes,
            function( $attribute ) use ($object) {
                return $object->IsAttributeModifiable($attribute);
            }
        );

		foreach ( $attributes as $attribute )
        {
            $groups = $object->getAttributeGroups($attribute);
            if ( in_array( 'multiselect', $groups) ) {
                $valueDefined = count($parms[$attribute]) > 0;
            }
            else if ( in_array( 'checklist', $groups) ) {
                $values = array_map(
                    function($item){ return $item['value'] == 'on' ? $item['name'] : ''; },
                    \JsonWrapper::decode(html_entity_decode($parms[$attribute]))
                );
                if ( is_null($values) ) $values = array();

                $valueDefined = count(array_diff(
                        preg_split('/\r\n/', $object->getDefaultAttributeValue($attribute)),
                        $values
                    )) == 0;
                if ( !$valueDefined ) {
                    return sprintf(text('validation.checklist.empty'), translate($object->getAttributeUserName($attribute)));
                }
            }
            else {
                $valueDefined = trim($parms[$attribute]) != '';
            }

            if ( !$valueDefined ) {
                $defaultValue = $object->getDefaultAttributeValue($attribute);
                if ( $defaultValue == '' ) {
                    return text(2).': '.$object->getDisplayName().'.'.translate($object->getAttributeUserName($attribute))." [".get_class($object).'.'.$attribute."]";
                }
            }
		}

		return "";
	}
}