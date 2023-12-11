<?php
include "PMCustomAttributeIterator.php";
include "predicates/CustomAttributeEntityPredicate.php";
include "predicates/CustomAttributeValuePredicate.php";
include "predicates/CustomAttributeDateIntervalPredicate.php";
include "predicates/CustomAttributeObjectPredicate.php";
include_once "persisters/CustomAttributesPersister.php";

class PMCustomAttribute extends MetaobjectCacheable
{
	public const PASSWORD_VALUE = 'PasswordValue';
	public const TEXT_VALUE 	= 'TextValue';
	public const STRING_VALUE 	= 'StringValue';
	public const DEFAULT_VALUE 	= 'DefaultValue';

	public const REFERENCE_NAME	= 'ReferenceName';
	public const SHOW_MAIN_TAB	= 'ShowMainTab';
	public const VALUE_RANGE 	= 'ValueRange';
	public const OBJECT_KIND	= 'ObjectKind';
	public const CAPTION		= 'Caption';
	public const DESCRIPTION	= 'Description';
	public const ORDER_NUM		= 'OrderNum';
	public const ATTRIBUTE_TYPE	= 'AttributeType';
	public const GROUPS			= 'Groups';

	public const IS_REQUIRED 	= 'IsRequired';
	public const IS_MULTIPLE	= 'IsMultiple';
	public const IS_UNIQUE		= 'IsUnique';
	public const IS_VISIBLE		= 'IsVisible';
	public const IS_READ_ONLY	= 'IsReadonly';
	public const IS_NOTIFICATION_VISIBLE = 'IsNotificationVisible';

	public const ATTRIBUTE_TYPE_CLASS_NAME	= 'AttributeTypeClassName';
	public const ENTITY_REFERENCE_NAME		= 'EntityReferenceName';
	public const CUSTOM_ATTRIBUTE			= 'CustomAttribute';

	public const KEY_CHECKLIST 		= 'checklist';
	public const KEY_STRING 		= 'string';
	public const KEY_COMPUTED 		= 'computed';
	public const KEY_CHAR 			= 'char';
	public const KEY_DICTIONARY		= 'dictionary';
	public const KEY_INTEGER 		= 'integer';
	public const KEY_PASSWORD 		= 'password';
	public const KEY_TEXT 			= 'text';
	public const KEY_WYSIWYG 		= 'wysiwyg';

	public const DB_TYPE_VARCHAR 	= 'varchar';
	public const DB_TYPE_CHAR 		= 'char';
	public const DB_TYPE_FLOAT 		= 'float';

 	function __construct()
	{
 		parent::__construct('pm_CustomAttribute');

 		$this->setSortDefault([
			new SortAttributeClause(self::ENTITY_REFERENCE_NAME),
			new SortAttributeClause(self::ORDER_NUM)
		]);

 		$this->setAttributeType(self::ATTRIBUTE_TYPE, 'REF_CustomAttributeTypeId');
        $this->setAttributeEditable(self::ATTRIBUTE_TYPE, false);
        $this->setAttributeDescription(self::GROUPS, text(2645));

 		foreach([self::OBJECT_KIND, self::ATTRIBUTE_TYPE_CLASS_NAME, 'Capacity'] as $field) {
			$this->addAttributeGroup($field, 'system');
		}

        foreach([self::ATTRIBUTE_TYPE, self::ENTITY_REFERENCE_NAME, self::ORDER_NUM, self::GROUPS, self::DESCRIPTION] as $field) {
            $this->addAttributeGroup($field, 'additional');
        }

        foreach([self::REFERENCE_NAME] as $field) {
            $this->addAttributeGroup($field, 'alternative-key');
        }
 	}

 	function getDisplayName()
 	{
 		return translate('Атрибуты');
 	}
 	
 	function createIterator() 
 	{
 		return new PMCustomAttributeIterator($this);
 	}

    function getPage()
    {
        return getSession()->getApplicationUrl($this).'project/dicts/PMCustomAttribute?';
    }

 	function getEntityDisplayName($ref_name, $kind)
 	{
 		$class_name = getFactory()->getClass($ref_name);
		$ref 		= getFactory()->getObject($class_name);
		
 		if (!class_exists($class_name) || !is_object($ref)) {
			return '';
		}

 		if (empty($kind)) {
			return $ref->getDisplayName();
 		} else {
            $attributes = $ref->getAttributesByGroup('customattribute-descriptor');

            if (count($attributes) > 0) {
                $type_it = $ref->getAttributeObject($attributes[0])->getByRef(self::REFERENCE_NAME, $kind);

                return $ref->getDisplayName() . ': '. $type_it->getDisplayName();
            }

            return '-';
 		}
 	}

 	function getEntityClasses($object): array
    {
        return array_merge([strtolower(get_class($object))], 
			array_values(
				array_diff(
						array_map(function($class) {
							return strtolower($class);
						},
						class_parents($object)
					),
					['metaobject', 'metaobjectstatable', 'storedobjectdb', 'abstractobject']
				)
			)
		);
    }

 	function getByEntity($object)
 	{
 		return $this->getRegistry()->Query([
			new FilterAttributePredicate(self::ENTITY_REFERENCE_NAME, $this->getEntityClasses($object)),
			new FilterVpdPredicate()
		]);
 	}

 	function getByAttribute($object, $attribue)
 	{
        return $this->getRegistry()->Query([
			new FilterAttributePredicate(self::ENTITY_REFERENCE_NAME, $this->getEntityClasses($object)),
			new FilterAttributePredicate(self::REFERENCE_NAME, $attribue),
			new FilterVpdPredicate()
		]);
 	}

 	function add_parms($parms)
 	{
 		// check for uniqueness
 		$object_it = $this->getByRefArray([
			'LCASE(EntityReferenceName)' 	=> strtolower($parms[self::ENTITY_REFERENCE_NAME]),
			'LCASE(ReferenceName)' 			=> strtolower($parms[self::REFERENCE_NAME])
		]);

 		if ($object_it->count() > 0) {
			return -1;
		}

 		$object = getFactory()->getObject($parms[self::ENTITY_REFERENCE_NAME]);

 		if (!empty($object->getAttributeType($parms[self::REFERENCE_NAME]))) {
			$object_it = $object->getAll();
		}
 		
 		$result = parent::add_parms( $parms );
 		
 		if ($result > 0 && is_object($object_it)) {

 			$type_it	= $this->getAttributeObject(self::ATTRIBUTE_TYPE)->getExact($parms[self::ATTRIBUTE_TYPE]);
 			$value 		= getFactory()->getObject('pm_AttributeValue');

 			while (!$object_it->end()) {
 				if (empty($object_it->get($parms[self::REFERENCE_NAME]))) {
 					$object_it->moveNext();
					continue;
 				}

 				if ($parms[self::REFERENCE_NAME] !== 'UID') {
                    $value->add_parms([
                        self::CUSTOM_ATTRIBUTE => $result,
                        'ObjectId' => $object_it->getId(),
                        $type_it->getValueColumn() => $object_it->getHtmlDecoded($parms[self::REFERENCE_NAME])
                    ]);
                }

				$object_it->moveNext();
 			}

			if ($type_it->get(self::REFERENCE_NAME) === self::KEY_COMPUTED) {
				$this->rebuildComputedAttributes($result, $parms);
			}
		}
 		
 		return $result;
 	}

	function modify_parms($id, $parms)
	{
		$was_parms 	= $this->getExact($id)->getData();
		$result 	= parent::modify_parms($id, $parms);

		if ($parms[self::REFERENCE_NAME] === 'UID' && $was_parms[self::DEFAULT_VALUE] !== $parms[self::DEFAULT_VALUE]) {
			$type_it = getFactory()->getObject('CustomAttributeType')->getExact($parms[self::ATTRIBUTE_TYPE]);

			if ($type_it->get(self::REFERENCE_NAME) === self::KEY_COMPUTED) {
				$this->rebuildComputedAttributes($id, $parms);
			}
		}

		return $result;
	}

	protected function rebuildComputedAttributes( $id, $parms )
	{
        $attributeIt = $this->getExact($id);
        if ( $attributeIt->getId() == '' ) return;

        $class_name = getFactory()->getClass($attributeIt->get('EntityReferenceName'));
        if (!class_exists($class_name, false)) return;

        $object = getFactory()->getObject($class_name);
        $object->setAttributeDefault($parms[self::REFERENCE_NAME], $parms[self::DEFAULT_VALUE]);
        $object->setNotificationEnabled(false);

        $registry = $object->getRegistry();

        $parms = array(
            new FilterBaseVpdPredicate()
        );

        if (!empty($attributeIt->get('ObjectKind'))) {
            $attributes = $object->getAttributesByGroup('customattribute-descriptor');
            if (count($attributes) > 0) {
                $parms[] = new FilterAttributePredicate($attributes[0], $attributeIt->get('ObjectKind'));
            }
        }

        $skipAttributes = array_merge(
            array(
                'Caption', 'RecordCreated', 'RecordVersion', 'UID'
            ),
            $object->getAttributesByType('wysiwyg')
        );

		$object_it = $registry->Query($parms);
		while(!$object_it->end()) {
			$data = $object_it->getData();

            foreach( $skipAttributes as $attribute ) {
                unset($data[$attribute]);
            }

 			$registry->Store($object_it, $data);
			$object_it->moveNext();
		}
	}

    function getValidators()
    {
        return array_merge(
            parent::getValidators(), [new ModelValidatorUnique([self::CAPTION, self::ENTITY_REFERENCE_NAME])]
        );
    }
}