<?php
include_once "MaintenanceCommand.php";
include_once SERVER_ROOT_PATH.'admin/install/InstallationFactory.php';
include_once SERVER_ROOT_PATH.'admin/classes/maintenance/BackupAndRecoveryOnWindows.php';

class RecoveryApplication extends MaintenanceCommand
{
	function validate() {
		return true;
	}
	
	function create()
	{
	    $recovery = getConfiguration()->getBackupAndRecoveryStrategy();
	    try {
            $dbFilePath = str_replace("\\", '/', SERVER_BACKUP_PATH."devprom/devprom.sql");

            $commands = [
                "DROP DATABASE IF EXISTS ".DB_NAME,
                "SET character_set_server=".APP_CHARSET,
                "SET character_set_database=".APP_CHARSET,
                "SET collation_database=".APP_CHARSET."_general_ci",
                "SET NAMES '".APP_CHARSET."' COLLATE '".APP_CHARSET."_general_ci'",
                "SET CHARACTER SET ".APP_CHARSET,
                "CREATE DATABASE ".DB_NAME,
                "USE ".DB_NAME,
                "SOURCE {$dbFilePath} ;"
            ];

            $recovery->recovery_database(join("; ", $commands));
            $recovery->recovery_htdocs();
        }
        catch( \Exception $e )
        {
	        $this->replyError($e->getMessage());
            return;
        }

	    // clear old cache
	    InstallationFactory::getFactory();
	    $clear_cache_action = new ClearCache();
	    $clear_cache_action->install();
	    
	    // reset opcache after application files have been restored
	    if ( function_exists('opcache_reset') ) opcache_reset();

	    $recovery->recovery_clean($_REQUEST['parms']);
	    
		$this->replyRedirect( '?' );
	}
}