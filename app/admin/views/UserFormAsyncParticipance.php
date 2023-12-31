<?php

class UserParticipanceForm extends UserParticipancePreForm
{
	function getCommandClass()
	{
		return 'addprojectparticipant';
	}

	function getAttributeClass( $attribute )
	{
		switch ( $attribute )
		{
			case 'ProjectRole':
				$object = getFactory()->getObject('ProjectRoleInherited');
				$object->setVpdContext( ModelProjectOriginationService::getOrigin($_REQUEST['project']) );
				return $object;
			default:
				return parent::getAttributeClass( $attribute );
		}
	}

	function getAttributeValue( $attribute )
	{
		switch ( $attribute )
		{
			case 'Project':
				return $_REQUEST['project'];
		}

		return parent::getAttributeValue( $attribute );
	}

	function IsAttributeVisible( $attribute )
	{
		switch ( $attribute )
		{
			case 'Participant':
				return false;
		}

		return true;
	}

	function IsAttributeModifiable( $attribute )
	{
		switch ( $attribute )
		{
			case 'SystemUser':
			case 'Project':
				return false;
		}

		return true;
	}

	function getButtonText()
	{
		return translate('Сохранить');
	}

	function getRedirectUrl()
	{
		return $this->user_it->getViewUrl();
	}
}
