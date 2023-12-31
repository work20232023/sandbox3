<?php
include_once "MaintenanceCommand.php";
include SERVER_ROOT_PATH.'admin/classes/maintenance/BackupAndRecoveryOnWindows.php';

class RecoveryFiles extends MaintenanceCommand
{
	function validate() {
		return true;
	}

	function create()
	{
        try {
            getConfiguration()->
                getBackupAndRecoveryStrategy()->
                    recovery_files($_REQUEST['parms']);
        }
        catch( \Exception $e ) {
            $this->replyError($e->getMessage());
        }

		$this->replyRedirect( '?action=recoveryapplication&parms='.SanitizeUrl::parseUrl($_REQUEST['parms']) );
	}
}
