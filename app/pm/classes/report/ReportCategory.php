<?php
include "ReportCategoryRegistry.php";

class ReportCategory extends Metaobject
{
 	function __construct( ReportCategoryRegistry $registry = null )
 	{
 		parent::__construct('cms_ReportCategory', is_object($registry) ? $registry : new ReportCategoryRegistry($this));
 	}
}
