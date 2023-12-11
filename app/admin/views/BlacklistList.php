<?php

class BlacklistList extends PageList
{
	function IsNeedToDisplayLinks( )
	{
		return false;
	}

	function IsNeedToModify( $object_it )
	{
		return false;
	}

	function IsNeedToDelete()
	{
		return false;
	}
	
	function getItemActions( $column_name, $object_it )
	{
		$actions = [];
		if ( $object_it->get('SystemUser') < 1 ) return $actions;

        $method = new UnBlockUserWebMethod;
        if ( $method->hasAccess() )
        {
            $actions[] = array(
                'name' => $method->getCaption(),
                'click' => $method->getJSCall(array('user' => $object_it->getRef('SystemUser')->getId()))
            );
        }

		return $actions;
	}

	function extendModel()
    {
        parent::extendModel();
        $this->getObject()->addAttribute('Date', '', translate('Дата'), true);
    }

	function drawCell( $object_it, $attr )
	{
		if( $attr == 'Date' )
		{
			echo $object_it->getDateTimeFormat('RecordCreated');
			return;
		}

		parent::drawCell( $object_it, $attr );
	}

	function getGroupDefault()
	{
		return '';
	}
}
