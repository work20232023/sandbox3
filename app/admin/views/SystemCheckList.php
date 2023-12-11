<?php
include_once SERVER_ROOT_PATH."admin/methods/ToggleSystemCheckWebMethod.php";

class SystemCheckList extends StaticPageList
{
	function drawCell( $object_it, $attr )
	{
		parent::drawCell( $object_it, $attr );
	}

	function IsNeedToModify()
	{
		return false;
	}

	function IsNeedToDisplayOperations()
	{
		return true;
	}

	function IsNeedToDisplay( $attr )
	{
		switch( $attr )
		{
		    case 'CheckResult': return true;
		    default: return parent::IsNeedToDisplay( $attr );
		}
	}
	
	function getItemActions( $column_name, $object_it )
	{
		$method = new ToggleSystemCheckWebMethod($object_it->getId());

        $actions = [
            array(
                'click' => $method->getJSCall(),
                'name' => $method->getCaption()
            )
        ];

		return $actions;
	}

	function getGroupFields()
	{
		return array();
	}
	
	function getRowColor( $object_it, $attr )
	{
		if ( $object_it->get('IsEnabled') == 'N' )
		{
			return 'silver';
		}

		if ( $object_it->get('CheckResult') == 'N' )
		{
			return 'red';
		}

		return parent::getRowColor( $object_it, $attr );
	}
}
