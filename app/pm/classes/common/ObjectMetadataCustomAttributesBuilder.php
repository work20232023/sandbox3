<?php
define( 'ORIGIN_CUSTOM', 'custom' );
include_once "persisters/CustomAttributesPersister.php";
include_once "sorts/CustomAttributeSortClause.php";

class ObjectMetadataCustomAttributesBuilder extends ObjectMetadataBuilder 
{
	private const ORIGIN_CUSTOM		= 'custom';

	private const KEY_DB_TYPE		= 'dbtype';
	private const KEY_CAPTION		= 'caption';
	private const KEY_VISIBLE		= 'visible';
	private const KEY_STORED		= 'stored';
	private const KEY_TYPE			= 'type';
	private const KEY_DESCRIPTION	= 'description';
	private const KEY_ORDER_NUM		= 'ordernum';
	private const KEY_EDITABLE		= 'editable';
	private const KEY_ORIGIN		= 'origin';
	private const KEY_DEFAULT		= 'default';
	private const KEY_REQUIRED		= 'required';
	private const KEY_GROUPS		= 'groups';

	private const ATTRIBUTES_ARRAY =
	[
		self::KEY_DB_TYPE		=> null,
		self::KEY_CAPTION		=> null,
		self::KEY_VISIBLE		=> null,
		self::KEY_STORED		=> false,
		self::KEY_TYPE			=> null,
		self::KEY_DESCRIPTION	=> null,
		self::KEY_ORDER_NUM		=> null,
		self::KEY_EDITABLE		=> null,
		self::KEY_ORIGIN		=> self::ORIGIN_CUSTOM,
		self::KEY_DEFAULT		=> null,
		self::KEY_REQUIRED		=> null,
		self::KEY_GROUPS		=> null,
	];

	private $classes;

	public function __construct()
	{
		$result = DAL::Instance()->QueryArray("SELECT GROUP_CONCAT(DISTINCT EntityReferenceName) Classes FROM pm_CustomAttribute");
		$this->classes = preg_split('/,/',$result[0]);
	}

    public function build(ObjectMetadata $metadata): void
    {
        $object = $metadata->getObject();
				
        if (in_array($object->getEntityRefName(), ['pm_CustomAttribute','pm_ProjectLink','pm_StateAttribute']) ) {
			return;
		}

        $attr = getFactory()->getObject('pm_CustomAttribute');

        if (count(array_intersect($attr->getEntityClasses($object), $this->classes)) < 1) {
			return;
		}

		$attr_it = $attr->getByEntity($object);

		$attributes 		= [];
		$firstTabAttributes = [];
        $attributesData     = [];

    	while(!$attr_it->end())
        {
			if ($attr_it->get('ReferenceName') == 'UID' )
            {
                $metadata->setAttributeDefault('UID', $attr_it->getHtmlDecoded('DefaultValue'));
                $metadata->setAttributeCaption('UID', $attr_it->getHtmlDecoded('Caption'));
                $metadata->addAttributeGroup('UID', 'computed');
				
				$attr_it->moveNext();
				continue;
			}

			$attributes[$attr_it->get('ReferenceName')] = self::setAttributesArray($attr_it);
            $attributesData[$attr_it->get('ReferenceName')] = $attr_it->getData();

			$attr_it->moveNext();
		}

		if ($object->getEntityRefName() == 'pm_ChangeRequest') {
		    unset($attributes['Description']);
		}

		foreach($attributes as $key => $attribute) {
            $metadata->setAttribute($key, $attribute);

            if (in_array('computed', $attribute['groups'])) {
                $metadata->setAttributeEditable($key, false);
            }
			$metadata->addAttributeGroup($key, 'bulk');
		}

        if (count($attributesData) > 0 ) {
            $metadata->addPersister(
                new CustomAttributesPersister(array_keys($attributesData), $attributesData)
            );
        }
    }

	private static function setAttributesArray($attr_it): array
	{
		$isEmptyObjKind	= empty($attr_it->get(PMCustomAttribute::OBJECT_KIND));

		$result		= self::ATTRIBUTES_ARRAY;
		$db_type	= $attr_it->getDbType();
		$default	= '';

		if ($isEmptyObjKind) {
			$default = $attr_it->getHtmlDecoded(PMCustomAttribute::DEFAULT_VALUE);
		}
        if ( in_array(PMCustomAttribute::KEY_CHECKLIST, $attr_it->getGroups()) ) {
            $default = $attr_it->getHtmlDecoded(PMCustomAttribute::VALUE_RANGE);
        }

		$result[self::KEY_DB_TYPE] 		= $db_type;
		$result[self::KEY_CAPTION] 		= $attr_it->get(PMCustomAttribute::CAPTION);
		$result[self::KEY_VISIBLE] 		= ($attr_it->get(PMCustomAttribute::IS_VISIBLE) === 'Y');
		$result[self::KEY_TYPE] 		= $db_type;
		$result[self::KEY_DESCRIPTION] 	= $attr_it->get(PMCustomAttribute::DESCRIPTION);
		$result[self::KEY_ORDER_NUM] 	= $attr_it->get(PMCustomAttribute::ORDER_NUM);
		$result[self::KEY_EDITABLE] 	= !empty($attr_it->get('IsReadonly')) ? ($attr_it->get('IsReadonly') === 'N') : true;
		$result[self::KEY_DEFAULT] 		= $default;
		$result[self::KEY_REQUIRED] 	= ($isEmptyObjKind && $attr_it->get('IsRequired') === 'Y');
		$result[self::KEY_GROUPS] 		= $attr_it->getGroups();

		return $result;
	}
}