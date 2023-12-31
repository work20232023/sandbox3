<?php
include "SystemSettingsIterator.php";
include "persisters/SystemSettingsPersister.php";
include "persisters/SystemSettingsAdminProjectPersister.php";
include "mappers/SystemSettingsTimezoneMapping.php";

class SystemSettings extends Metaobject
{
 	function __construct() 
 	{
		parent::__construct('cms_SystemSettings');
		$this->addPersister( new SystemSettingsPersister() );
		$this->addPersister( new SystemSettingsAdminProjectPersister() );
	}

	function createIterator() {
		return new SystemSettingsIterator( $this );
	}

	function IsDeletedCascade( $object ) {
		return false;
	}

	function getMappers()
    {
        return array_merge( parent::getMappers(),
            array(
                new SystemSettingsTimezoneMapping
            )
        );
    }
}