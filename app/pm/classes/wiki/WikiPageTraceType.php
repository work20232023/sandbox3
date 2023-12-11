<?php

include_once SERVER_ROOT_PATH."pm/classes/common/PMObjectCacheable.php";
include_once "WikiPageTraceTypeRegistry.php";

class WikiPageTraceType extends PMObjectCacheable
{
	public function __construct()
	{
		parent::__construct('entity', new WikiPageTraceTypeRegistry());
	}
}