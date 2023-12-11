<?php

class CustomAttributeFinalForm extends PMPageForm
{
	protected function getAttributeType()
	{
		$attr_type = $this->getFieldValue(PMCustomAttribute::ATTRIBUTE_TYPE);

		if (empty($attr_type)) {
			return $attr_type;
		}

		return getFactory()
				->getObject('CustomAttributeType')
				->getExact($attr_type)
				->get('ReferenceName');
	}

	function extendModel()
	{
		$object = $this->getObject();
		$object->setAttributeDescription(PMCustomAttribute::DEFAULT_VALUE, text(1083));
		$object->setAttributeVisible('ShowMainTab', true);

		parent::extendModel();

        $parts = preg_split('/\:/', $_REQUEST[PMCustomAttribute::ENTITY_REFERENCE_NAME]);

        if (count($parts) > 1) {
            $_REQUEST['EntityReferenceName'] = $parts[0];
            $object->setAttributeRequired(PMCustomAttribute::OBJECT_KIND, true);
            $object->setAttributeDefault(PMCustomAttribute::OBJECT_KIND, $parts[1]);
            $object->setAttributeVisible(PMCustomAttribute::OBJECT_KIND, false);
            $object->resetAttributeGroup(PMCustomAttribute::OBJECT_KIND, 'system');
        }

        $entityObject = is_object($this->getObjectIt())
            ? getFactory()->getObject($this->getObjectIt()->get(PMCustomAttribute::ENTITY_REFERENCE_NAME))
            : getFactory()->getObject($_REQUEST['EntityReferenceName']);

        foreach($object->getAttributesByGroup('additional') as $field) {
            $object->setAttributeRequired($field, false);
        }

        $object->setAttributeVisible(PMCustomAttribute::ORDER_NUM, true);

		switch ($this->getAttributeType()) {

			case PMCustomAttribute::KEY_COMPUTED:
				$object->setAttributeCaption(PMCustomAttribute::DEFAULT_VALUE, text(2133));
				$object->setAttributeDescription(
                    PMCustomAttribute::DEFAULT_VALUE,
                    sprintf(text(2134),
                        getFactory()->getObject('Module')->getExact('apidocs-list')
                            ->getUrl('search=' . $entityObject->getDisplayName()))
                );
				break;

			case PMCustomAttribute::KEY_WYSIWYG:
				$object->setAttributeType(PMCustomAttribute::DEFAULT_VALUE, 'WYSIWYG');
				break;

			case PMCustomAttribute::KEY_CHAR:
				$object->setAttributeDefault(PMCustomAttribute::DEFAULT_VALUE, 'N');
				break;

			case PMCustomAttribute::KEY_CHECKLIST:
				$object->setAttributeCaption(PMCustomAttribute::VALUE_RANGE, text(3330));
				$object->setAttributeDefault(PMCustomAttribute::IS_NOTIFICATION_VISIBLE, 'N');
				$object->setAttributeVisible(PMCustomAttribute::IS_NOTIFICATION_VISIBLE, false);
				$object->setAttributeVisible(PMCustomAttribute::DEFAULT_VALUE, false);
				$object->setAttributeVisible(PMCustomAttribute::IS_READ_ONLY, false);
				$object->setAttributeVisible(PMCustomAttribute::IS_UNIQUE, false);
                $object->setAttributeVisible(PMCustomAttribute::IS_REQUIRED, false);
				break;
		}

		if (empty($_REQUEST['formonly'])) {
            foreach([PMCustomAttribute::ENTITY_REFERENCE_NAME, PMCustomAttribute::ATTRIBUTE_TYPE] as $attribute ) {
                $object->setAttributeVisible($attribute, false);
                $object->setAttributeRequired($attribute, true);
            }
        }
	}

	function validateInputValues( $id, $action )
	{
		$object = $this->getObject();

		// check for conflicts with metadata attributes
		$reserved 	= [];
		$titles 	= [];

		$className = getFactory()->getClass($_REQUEST['EntityReferenceName']);
		
		if (class_exists($className)) {
            $entity = getFactory()->getObject($className);

            foreach($entity->getAttributes() as $key => $attribute) {
                if (!$entity->IsAttributeStored($key) || $key === 'UID') {
					continue;
				}

                $reserved[] = strtolower($key);
                $titles[] 	= mb_strtolower($entity->getAttributeUserName($key));
            }

            if (in_array(strtolower(trim($_REQUEST['ReferenceName'])), $reserved)) {
                return text(1086);
            }

            if (in_array(mb_strtolower(trim($_REQUEST['Caption'])), $titles)) {
                return text(1086);
            }

            // check for db-column correctness
            if (!\TextUtils::checkDatabaseColumnName($_REQUEST['ReferenceName'])) {
                return text(1126);
            }

            // check for duplicates across custom attributes
            $dup_it = $object->getByRefArray([ 	
						'LCASE(ReferenceName)' 	=> strtolower($_REQUEST['ReferenceName']),
                    	'EntityReferenceName' 	=> $_REQUEST['EntityReferenceName']
					]);

            if ($dup_it->count() > 0 && $dup_it->getId() != $id) {
                return text(1086);
            }
        }
		else {
		    unset($_REQUEST['ReferenceName']);
        }

		$attr_type = $_REQUEST[PMCustomAttribute::ATTRIBUTE_TYPE];

		if (empty($attr_type)) {
			$object_it = $object->getExact($id);
			$attr_type = $object_it->get(PMCustomAttribute::ATTRIBUTE_TYPE);
		}

		if ($attr_type === 2) {
			$lines = preg_split('/\n/', trim($_REQUEST[PMCustomAttribute::VALUE_RANGE], '\n\r'));

			if (count($lines) < 1) {
				return text(1091);
			}

			$was_keys = [];

			foreach ($lines as $line) {
				if (empty($line)) {
					continue;
				}

				$parts = preg_split('/:/', $line);

				if(count($parts) < 2) {
					return str_replace('%1', $line, text(1092));
				}

				if (in_array( $parts[0], $was_keys)) {
					return text(1093);
				}

				$was_keys[] = $parts[0];

				if (!is_numeric( $parts[0] ) || $parts[0] < 1) {
					return str_replace('%1', $line, text(1094));
				}
			}
		}

		// check for valid default values
		$default_value = $_REQUEST[PMCustomAttribute::DEFAULT_VALUE];

		if (!empty($default_value)) {
			$mapper = new ModelDataTypeMapper();
			
			$default_value = $mapper->getMapper(
						$this->getObject()->getAttributeObject('AttributeType')->getExact($attr_type)->getDbType()
				)->map($default_value);

			if (empty($default_value)) {
				return text(1741);
			}
		}

		return parent::validateInputValues( $id, $action );
	}

    function getDefaultValue($attr)
    {
        $value = parent::getDefaultValue($attr);

		if ($attr === PMCustomAttribute::ENTITY_REFERENCE_NAME && empty($value)) {
			return preg_split('/\:/', $_REQUEST[PMCustomAttribute::ENTITY_REFERENCE_NAME])[0];
		}

        return $value;
    }

    function IsAttributeVisible( $attr_name )
	{
		$attrType = $this->getAttributeType();

		switch ($attr_name) {
			case PMCustomAttribute::VALUE_RANGE:
				return in_array($attrType, ['dictionary', PMCustomAttribute::KEY_CHECKLIST]);

			case PMCustomAttribute::DEFAULT_VALUE:
				return !in_array($attrType, ['date','password', PMCustomAttribute::KEY_CHECKLIST]);

            case PMCustomAttribute::IS_MULTIPLE :
                return in_array($attrType, ['dictionary','reference']);

			case PMCustomAttribute::IS_UNIQUE:
				return !in_array($attrType, ['computed', PMCustomAttribute::KEY_CHECKLIST]);

            case PMCustomAttribute::OBJECT_KIND:
                return false;

			default:
				return parent::IsAttributeVisible($attr_name);
		}
	}
	
	function IsAttributeRequired( $attr_name ): bool
	{
		if ($attr_name === PMCustomAttribute::VALUE_RANGE) {
			return ($this->getAttributeType() === PMCustomAttribute::KEY_DICTIONARY);
		}

		return parent::IsAttributeRequired( $attr_name );
	}

	function createFieldObject( $attr_name ) 
	{
		switch($attr_name) {
			case PMCustomAttribute::DEFAULT_VALUE:
				switch ($this->getAttributeType()) {
					case 'integer':
						return new FieldNumber();
                    case 'reference':
                        $className = getFactory()->getClass($this->getFieldValue('AttributeTypeClassName'));
                        if ( class_exists($className) ) {
                            return new FieldAutoCompleteObject(getFactory()->getObject($className));
                        }
                        else {
                            return parent::createFieldObject( $attr_name );
                        }
					default:
						return parent::createFieldObject( $attr_name );
				}
				break;
				
			default:
				return parent::createFieldObject( $attr_name );
		}
	}

	function createField( $attr_name ) 
	{
		$field = parent::createField( $attr_name );

		switch($attr_name) {
			case PMCustomAttribute::ENTITY_REFERENCE_NAME:
				$field->setReadonly(true);
				$field->setText( $this->getObject()->getEntityDisplayName(
					$this->getFieldValue(PMCustomAttribute::ENTITY_REFERENCE_NAME), $this->getFieldValue('ObjectKind'))
				);

				break;
				
			case PMCustomAttribute::ATTRIBUTE_TYPE:

				$field->setReadonly(true);

				$type 		= new CustomAttributeType();
				$type_it 	= $type->getExact($this->getFieldValue(PMCustomAttribute::ATTRIBUTE_TYPE));
				$className 	= getFactory()->getClass($this->getFieldValue('AttributeTypeClassName'));

				if ($type_it->get('ReferenceName') == 'reference' && class_exists($className)) {
					$field->setText(
                        $type_it->getDisplayName().': '.getFactory()->getObject($className)->getDisplayName()
					);
				}
				else {
                    $field->setText($type_it->getDisplayName());
                }

				break;
				
			case PMCustomAttribute::ORDER_NUM:
				if (!is_object($this->getObjectIt())) {
					$ref = getFactory()->getObject( $this->getFieldValue('EntityReferenceName') );
					$field->setValue( $ref->getLatestOrderNum() + 10 );
				}

				break;
		}
		
		return $field;
	}
	
	function getFieldDescription( $attr )
	{
		switch ($attr) {
			case PMCustomAttribute::CAPTION:
				return text(1081);

			case PMCustomAttribute::REFERENCE_NAME :
				return text(1082);

			case PMCustomAttribute::IS_VISIBLE:
				return text(1084);

			case PMCustomAttribute::ORDER_NUM:
				return text(1085);

			case PMCustomAttribute::DESCRIPTION:
				return text(1149);

			case PMCustomAttribute::IS_UNIQUE:
				return text(1175);

            case PMCustomAttribute::SHOW_MAIN_TAB:
                return text(2682);

            case PMCustomAttribute::IS_REQUIRED:
                return text(2683);

			case PMCustomAttribute::VALUE_RANGE:
				return self::getDescForValueRange($this->getAttributeType());

			default:
				return parent::getFieldDescription($attr);
		}
	}

	function redirectOnAdded($object_it, $redirect_url = ''): void
    {
        $redirect_url = $this->getObject()->getPage();
        parent::redirectOnAdded($object_it, $redirect_url);
    }

    function getBodyTemplate(): string
	{
        return "core/PageFormBody.php";
    }

	private static function getDescForValueRange(string $attributeType): string
	{
		switch ($attributeType) {
			case PMCustomAttribute::KEY_DICTIONARY:
				return text(1087);

			case PMCustomAttribute::KEY_CHECKLIST:
				return text(3331);
		}

		return '';
	}

    function persist()
    {
        $result = parent::persist();

        if ( $result && $_REQUEST['ReferenceName'] == 'UID' )
        {
            $className = getFactory()->getClass($_REQUEST['EntityReferenceName']);
            if ( class_exists($className) )
            {
                $object = getFactory()->getObject($className);
                if ( $object instanceof \WikiPage )
                {
                    $object->setAttributeDefault('UID', $_REQUEST['DefaultValue']);
                    $pageIt = $object->getRegistry()->Query([
                        new FilterAttributeNullPredicate('ParentPage'),
                        new FilterBaseVpdPredicate()
                    ]);
                    while( !$pageIt->end() ) {
                        $object->updateUIDs($pageIt);
                        $pageIt->moveNext();
                    }
                }
            }
        }

        return $result;
    }
}