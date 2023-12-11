<?php
include_once SERVER_ROOT_PATH . "core/classes/model/validation/ModelValidatorInstance.php";

class ModelValidatorScript extends ModelValidatorInstance
{
    private $attributes = [];

    public function __construct($attributes = [])
    {
        $this->attributes = $attributes;
    }

    public function validate(Metaobject $object, array $parms)
    {
        $attributes = $this->attributes;

        if (count($attributes) < 1) {
            foreach (array_keys($object->getAttributes()) as $attribute) {
                if (
                    !$object->IsAttributePersisted($attribute)
                    || !$object->getAttributeEditable($attribute)
                ) {
                    continue;
                }

                $attributes[] = $attribute;
            }
        }

        $objectIt = $object->createCachedIterator([$parms]);

        $entity = get_class($object);
        $transition = isset($parms['Transition']) ? $parms['Transition'] : '';

        $stateAttribute = getFactory()->getObject('StateAttribute');
        $stateAttributeIt = $stateAttribute->getRegistry()->Query([
            new FilterVpdPredicate(),
            new FilterAttributePredicate('Entity', $entity),
            new FilterAttributePredicate('Transition', $transition),
        ]);

        while (!$stateAttributeIt->end()) {
            $attribute = $stateAttributeIt->get('ReferenceName');
            if (mb_strlen($stateAttributeIt->get('PHPScript')) === 0) {
                $stateAttributeIt->moveNext();
                continue;
            }

            foreach (getFactory()->getPluginsManager()->getPluginsForSection('pm') as $plugin) {
                if (!$plugin->validateStateAttribute($stateAttributeIt, $objectIt)) {
                    return text(3604) . ': ' . $object->getDisplayName() . '.' . translate($object->getAttributeUserName($attribute)) . " [" . get_class($object) . '.' . $attribute . "]";
                }
            }

            $stateAttributeIt->moveNext();
        }

        $customAttribute = getFactory()->getObject('pm_CustomAttribute');
        $customAttributeIt = $customAttribute->getByEntity($object);

        while (!$customAttributeIt->end()) {
            $attribute = $customAttributeIt->get('ReferenceName');
            if (mb_strlen($customAttributeIt->get('PHPScript')) === 0) {
                $customAttributeIt->moveNext();
                continue;
            }

            foreach (getFactory()->getPluginsManager()->getPluginsForSection('pm') as $plugin) {
                if (!$plugin->validateCustomAttribute($customAttributeIt, $objectIt)) {
                    return text(3604) . ': ' . $object->getDisplayName() . '.' . translate($object->getAttributeUserName($attribute)) . " [" . get_class($object) . '.' . $attribute . "]";
                }
            }

            $customAttributeIt->moveNext();
        }

        return '';
    }
}
