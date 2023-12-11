<?php
include_once "sorts/CustomAttributeSortClause.php";

class CustomAttributesObjectModelBuilder extends ObjectModelBuilder
{
    private $restrictedEntities = array(
        'pm_Project','pm_CustomAttribute','pm_ProjectLink','pm_Participant', 'pm_ParticipantRole', 'pm_ProjectRole',
        'cms_User'
    );

    private $objectIt = null;

    function __construct($objectIt) {
        $this->objectIt = $objectIt;
    }

    public function build( Metaobject $object )
    {
        if ( in_array($object->getEntityRefName(), $this->restrictedEntities) ) return;

        $attributes = array_keys($object->getAttributes());
		$attr_it = getFactory()->getObject('pm_CustomAttribute')->getRegistry()->Query(
		    array(
		        new CustomAttributeObjectPredicate($this->objectIt),
                new CustomAttributeSortClause(array_shift($attributes))
            )
        );
        $policy = getFactory()->getAccessPolicy();

        $addedAttributes = [];
    	while( !$attr_it->end() )
		{
            if ( $object->hasAttribute($attr_it->get('ReferenceName')) ) {
                $attr_it->moveNext();
                continue;
            }

		    $readable = $policy->can_read_attribute($object,
                $attr_it->get('ReferenceName'), $object->getAttributeClass($attr_it->get('ReferenceName')));
            if ( !$readable ) {
                $attr_it->moveNext();
                continue;
            }

            $object->addAttribute(
                $attr_it->get('ReferenceName'),
                $attr_it->getDbType(),
                $attr_it->get('Caption'),
                $attr_it->get('IsVisible') == 'Y',
                false, $attr_it->get('Description')
            );

			$object->setAttributeRequired($attr_it->get('ReferenceName'),
                $attr_it->get('ObjectKind') == '' ? $attr_it->get('IsRequired') == 'Y' : false);

            $object->setAttributeDefault(
                $attr_it->get('ReferenceName'),
                $attr_it->get('ObjectKind') == ''
                        ? $attr_it->getHtmlDecoded('DefaultValue') : ''
                );

            if ( in_array(PMCustomAttribute::KEY_CHECKLIST, $attr_it->getGroups()) ) {
                $object->setAttributeDefault(
                    $attr_it->get('ReferenceName'),
                    $attr_it->getHtmlDecoded(PMCustomAttribute::VALUE_RANGE)
                );
            }

            $groups = $attr_it->getGroups();
            $object->setAttributeGroups($attr_it->get('ReferenceName'), $groups);
            $object->setAttributeOrigin($attr_it->get('ReferenceName'), ORIGIN_CUSTOM);
            $object->setAttributeEditable($attr_it->get('ReferenceName'), !in_array('computed', $groups));

            $addedAttributes[$attr_it->get('ReferenceName')] = $attr_it->getData();

			$attr_it->moveNext();
		}

		if ( count($addedAttributes) > 0 ) {
            $object->addPersister(
                new CustomAttributesPersister(array_keys($addedAttributes), $addedAttributes)
            );
        }
    }
}