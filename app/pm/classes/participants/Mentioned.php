<?php
include "MentionedIterator.php";
include "MentionedRegistry.php";

class Mentioned extends Metaobject
{
    private $attributesObject = null;

 	function __construct() {
 		parent::Metaobject('entity', new MentionedRegistry($this));
 	}
 	
 	function createIterator() {
 		return new MentionedIterator( $this );
 	}

    function getVpds() {
        return getFactory()->getObject('ProjectRole')->getVpds();
    }

    function setAttributesObject( $object ) {
         $this->attributesObject = $object;
    }

    function getAttributesObject() {
         return $this->attributesObject;
    }

    function getUsers( array $mentions, \IteratorBase $objectIt = null, array $queryParms = array() )
    {
        if ( is_object($objectIt) ) {
            $this->setAttributesObject($objectIt->object);
        }

        $attributeMentions = array();
        if ( is_object($this->attributesObject) ) {
            foreach( $this->attributesObject->getAttributesByEntity('cms_User') as $attribute ) {
                $title = str_replace(' ','',
                    mb_strtolower($this->attributesObject->getAttributeUserName($attribute)));
                $attributeMentions[$title] = $attribute;
            }
        }

        $user_ids = array();
        $mention_it = $this->getRegistry()->Query($queryParms);
        while( !$mention_it->end() ) {
            if ( in_array($mention_it->getId(), $mentions) ) {
                if ( array_key_exists($mention_it->getId(), $attributeMentions) && is_object($objectIt) ) {
                    $user_ids[] = $objectIt->get($attributeMentions[$mention_it->getId()]);
                }
                else {
                    $user_ids[] = $mention_it->get('User');
                }
            }
            $mention_it->moveNext();
        }

        return \TextUtils::parseIds(join(',',$user_ids));
    }
}