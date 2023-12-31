<?php

include "UpdateFormUpload.php";
include "UpdateTable.php";
include "RecoveryWizardFormBase.php";
include "UpdateFormApplication.php";
include "UpdateFormSystem.php";
include "UpdateFormDownload.php";
include "UpdateFormCheck.php";

class UpdatePage extends AdminPage
{
	function __construct()
	{
		parent::__construct();
	}
	
	function getObject()
	{
		return getFactory()->getObject('cms_Update');
	}
	
	function getTable()
	{
		return new UpdateTable($this->getObject());
	}

	function needDisplayForm()
	{
	    global $_REQUEST;
	    return $_REQUEST['action'] != '';    
	}
	
	function getEntityForm()
	{
		$object = $this->getObject();
		
		switch ( $_REQUEST['action'] )
		{
		    case 'upload':

				$module = getFactory()->getObject('Module');
		    	$module_it = $module->getExact('update-upload');
		    	if ( !getFactory()->getAccessPolicy()->can_read($module_it) ) return false;

				$module_it = $module->getExact('file-upload');
				if ( !getFactory()->getAccessPolicy()->can_read($module_it) ) return false;

		        return new UpdateUploadForm( $object );
		        
		    case 'updateapplication':
		        return new UpdateFormApplication( $object );
		    
		    case 'updatesystem':
		        return new UpdateFormSystem( $object );

		    case 'download':
		        return new UpdateFormDownload( $object );
		        
		    case 'check':
		        return new UpdateFormCheck( $object );
		        
		    default:
		        return null;
		}
	}
}
