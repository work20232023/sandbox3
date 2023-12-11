<?php

trait PageFormActions
{
    function getNewRelatedActions()
    {
        $references = getFactory()->getModelReferenceRegistry()
            ->getBackwardReferences($this->getObject());

        $actions = [];
        foreach ( $references as $attribute_path => $class_name )
        {
            if ( !class_exists($class_name) ) continue;

            $ref = getFactory()->getObject($class_name);
            if ( !$ref->IsPersistable() ) continue;
            if ( array_key_exists($ref->getEntityRefName(), $actions) ) continue;

            $parts = preg_split('/::/', $attribute_path);
            $attribute = $parts[1];
            if ( in_array($attribute, $ref->getAttributesByGroup('system')) ) continue;

            $method = new ObjectCreateNewWebMethod($ref);
            if ( $method->hasAccess() ) {
                $actions[$ref->getEntityRefName()] = array(
                    'name' => $method->getObject()->getDisplayName(),
                    'url' => $method->getJSCall([$attribute => $this->getObjectIt()->getId()])
                );
            }
        }

        return $actions;
    }
}
