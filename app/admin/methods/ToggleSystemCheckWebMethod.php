<?php
include_once SERVER_ROOT_PATH.'admin/classes/CheckpointFactory.php';

class ToggleSystemCheckWebMethod extends WebMethod
{
	var $entry;

	function __construct ( $check_uid = '' )
	{
		$this->entry = null;
        $this->setRedirectUrl('function() {window.location.reload();}');

		$factory = getCheckpointFactory();
		$checkpoint = $factory->getCheckpoint( 'CheckpointSystem' );
			
		foreach( $checkpoint->getEntries() as $entry )
		{
			if ( $entry->getUid() == $check_uid ) {
				$this->entry = $entry;
				break;
			}
		}

		parent::__construct();
	}

	function getCaption()
	{
		if ( is_object($this->entry) && $this->entry->enabled() )
		{
			return translate('Отключить');
		}
		else
		{
			return translate('Включить');
		}
	}

	function getJSCall($parms = array())
	{
		return parent::getJSCall(
		array('uid' => $this->entry->getUid() )
		);
	}

	function execute_request()
	{
		global $_REQUEST;
		$this->execute($_REQUEST['uid']);
	}

	function execute( $uid )
	{
		$factory = getCheckpointFactory();
		$checkpoint = $factory->getCheckpoint( 'CheckpointSystem' );
			
		foreach( $checkpoint->getEntries() as $entry )
		{
			if ( $entry->getUid() == $uid )
			{
				if ( $entry->enabled() )
				{
					$entry->disable();
				}
				else
				{
					$entry->enable();
				}
					
				break;
			}
		}
			
		$checkpoint->storeEntries();
	}
}
