<?php
include "ModuleCategoryRegistry.php";

class ModuleCategory extends Metaobject
{
 	function __construct()
 	{
 		parent::__construct('entity', new ModuleCategoryRegistry());
 	}
}

