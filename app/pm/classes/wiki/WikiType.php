<?php
include "WikiTypeRegistry.php";

class WikiType extends Metaobject
{
 	function __construct() 
 	{
 		parent::__construct('entity', new WikiTypeRegistry($this));
 	}

    function getVpds() {
        return array();
    }
}
