<?php
namespace Devprom\ProjectBundle\Service\Model;

class ModelUMLRepresentationService
{
    private $session = null;
    private $observerdClasses = array();

    function __construct( \SessionBase $session ) {
        $this->session = $session;
    }

    public function getUMLString( \Metaobject $object )
    {
        $plantUml = $this->getClassString($object);

        $references = getFactory()->getModelReferenceRegistry()->getBackwardReferences($object);
        foreach ( $references as $attribute_path => $class_name ) {
            $ref = getFactory()->getObject($class_name);
            if ( is_a($ref, $object) ) continue;

            $parts = preg_split('/::/', $attribute_path);
            $attribute = $parts[1];

            $classUml = $this->getClassString($ref, false);
            if ( $classUml != '' ) {
                $cardinality = "0..1";
                if ( $ref->IsAttributeRequired($attribute) ) {
                    $cardinality = "1";
                }
                $associationName = $ref->getAttributeUserName($attribute);
                if ( $associationName == '' ) $associationName = 'association';

                $plantUml .= $classUml . '"'.$this->getClassName($object).'" "'.$cardinality.'" -- "*" "'.
                    $this->getClassName($ref).'": '.$associationName.PHP_EOL;
            }
        }

        return $plantUml;
    }

    protected function getClassString( $object, $buildReferences = true )
    {
        if ( in_array(get_class($object), $this->observerdClasses) ) return '';
        $this->observerdClasses[] = get_class($object);

        $references = '';
        $uml = 'class "'.$this->getClassName($object).'" {'.PHP_EOL;

        $attributes = array_diff(
            $object->getAttributesOrdered(),
            $object->getAttributesByGroup('system')
        );
        foreach( $attributes as $attribute ) {
            if ( !$object->IsAttributeStored($attribute) ) continue;
            if ( $object->IsReference($attribute) && $buildReferences ) {
                $ref = $object->getAttributeObject($attribute);
                $references .= $this->getClassString($ref, false);
                $references .= '"'.$this->getClassName($object).'" "*" -- "1" "'.
                    $this->getClassName($ref).'": '.$object->getAttributeUserName($attribute).PHP_EOL;
            }
            else {
                $uml .= '  '.$object->getAttributeUserName($attribute).
                    ': '.$object->getAttributeType($attribute).PHP_EOL;
            }
        }
        $uml .= '}'.PHP_EOL.PHP_EOL;

        return $uml . $references;
    }

    protected function getClassName($object) {
        $classRefName = get_class($object) == 'Metaobject' ? $object->getEntityRefName() : get_class($object);
        return $object->getDisplayName() . ' ['.$classRefName.']';
    }
}
