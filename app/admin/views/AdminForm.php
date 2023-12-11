<?php

class AdminForm extends AjaxForm
{
	function AdminForm( $object )
	{
		parent::__construct( $object );
	}

	function getSite()
	{
		return 'admin';
	}
	
	function getWidth()
	{
		return '100%';
	}

	function IsCentered()
	{
		return false;
	}
}
