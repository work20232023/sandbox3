<?php
include "fields/FieldProductInfoLines.php";

class ProductInfoForm extends PageForm
{
	function IsNeedButtonSave() {
		return false;
	}

	function IsAttributeVisible($attr_name) {
		return $attr_name == "Caption";
	}

	function getFieldValue($field)
    {
        if ( $field == 'ReferenceName' ) return '';
        return parent::getFieldValue($field);
    }

    function createFieldObject( $name )
	{
		switch ( $name )
		{
			case 'Caption':
				return new FieldProductInfoLines($this->getObjectIt());
			default:
				return parent::createFieldObject( $name );
		}
	}

	function createField($name)
	{
		$field = parent::createField($name);
		switch ($name) {
			case 'Log':
			case 'MappingSettings':
				$field->setRows(34);
				break;
		}
		return $field;
	}

	function getBodyTemplate() {
		return "pm/MethodologyFormBody.php";
	}

	function render($view, $parms)
	{
		setcookie(COOKIE_VERSION_LEARNT, $_SERVER['APP_VERSION'], mktime(0, 0, 0, 1, 1, date('Y') + 1), '/');
        getFactory()->getCacheService()->invalidate('sessions');

		parent::render($view, $parms);
	}

	function getCaption() {
        return text('producttour3');
    }
}