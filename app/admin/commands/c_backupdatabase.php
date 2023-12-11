<?php
include_once "MaintenanceCommand.php";
include SERVER_ROOT_PATH.'admin/classes/maintenance/BackupAndRecoveryOnWindows.php';

class BackupDatabase extends MaintenanceCommand
{
	function validate() {
		return true;
	}

	function create()
	{
	    try {
            $sql_path = SERVER_BACKUP_PATH.'devprom/';

            if ( !is_dir($sql_path) ) {
                mkdir($sql_path, 0700, true);
            }

            getConfiguration()->getBackupAndRecoveryStrategy()->backup_database($sql_path.'devprom.sql');
        }
        catch( \Exception $e ) {
	        $this->replyError($e->getMessage());
        }

		$this->replyRedirect( '?action=backupapplication&parms='.SanitizeUrl::parseUrl($_REQUEST['parms']) );
	}
}
