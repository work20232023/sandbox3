<?php

class StateObject extends Metaobject
{
 	function __construct()
    {
 		parent::__construct('pm_StateObject');
 	}

    function IsDeletedCascade($object)
    {
        return false;
    }
}