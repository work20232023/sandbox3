<?php
include "ResourceRegistry.php";
include "ResourceSystemRegistry.php";

class Resource extends Metaobject
{
    protected $languageUid = '';

 	function __construct( ObjectRegistrySQL $registry = null ) 
 	{
 	    global $session;
        if ( is_object($session) ) {
            $this->setLanguageUid($session->getLanguageUid());
        }
 		parent::__construct('cms_Resource', $registry);
 		$this->setAttributeVisible( 'OrderNum', false );
 	}

 	function setLanguageUid( $uid ) {
 	    $this->languageUid = $uid;
    }

    function getLanguageUid() {
        return $this->languageUid;
    }
}