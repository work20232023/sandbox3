<?php

include_once 'Installable.php';
include_once 'ApplyServicedeskMigrations.php';
include_once 'ChangeConfigurationPath.php';
include_once 'CheckLicense.php';
include_once 'ClearCache.php';
include_once 'CopyConfigurationFiles.php';
include_once 'SetupCalendar.php';
include_once 'SetupMySQLIni.php';
include_once 'SetupPhpIni.php';
include_once 'UpgradeCustomerUIDLocation.php';
include_once 'UpgradeMySQL.php';
include_once 'UpgradeUserPictures.php';
include_once 'UpgradeModel.php';
include_once 'SetupPhpOpCache.php';
include_once 'SetupUserGroups.php';
include_once 'SDKSetup.php';
include_once 'MigrateDatabaseUTF8.php';
include_once 'MigrateTablesTrueUTF8.php';
include_once 'MigrateDatabaseInnoDB.php';
include_once "CacheParameters.php";
include_once "DownloadProductChangesInfo.php";

class InstallationFactory
{
    protected static $singleInstance = null;
    
    protected static $installables = array();

	function __construct()
	{
	}

	// static method to getinstance of factory
    public static function getFactory()
    {
        if ( is_object(static::$singleInstance) ) return static::$singleInstance;
        
        static::$singleInstance = new static();

		static::$installables = static::buildInstallables();
	
        return static::$singleInstance;
    }
    
    protected static function buildInstallables()
    {
        return array (
        	new MigrateDatabaseUTF8(),
			new MigrateDatabaseInnoDB(),
	        new MigrateTablesTrueUTF8(),
	        new ApplyServicedeskMigrations(),
	        new ChangeConfigurationPath(),
	        new CheckLicense(),
	        new CopyConfigurationFiles(),
	        new SetupCalendar(),
	        new SetupMySQLIni(),
	        new SetupPhpIni(),
        	new SetupPhpOpCache(),
	        new UpgradeCustomerUIDLocation(),
	        new UpgradeMySQL(),
        	new UpgradeUserPictures(),
        	new SetupUserGroups(),
        	new SDKSetup(),
            new UpgradeModel(),
			new CacheParameters(),
	        new ClearCache(),
			new DownloadProductChangesInfo()
        );
    }
    
    public function getInstallables()
    {
        return static::$installables;
    }

	// installation process
	function install( &$issues )
	{
		if ( !is_array($issues) ) $issues = array();

		foreach( $this->getInstallables() as $installable )
		{
		    $installable->setFactory( $this );
		        	    
			$this->info( 'Installation step: '.get_class($installable) );
			
			if ( $installable->skip() )
			{
				$this->info( 'skipped.' );
				
				continue;
			}
				
			if ( !$installable->check() )
			{
				array_push($issues, get_class($installable));
				
				$result = $installable->result();
				
				$this->error( 'check failed: '.$result );
				
				$issues = array_merge( $issues, $result );

				continue;
			}

			if ( !$installable->install() )
			{
				array_push($issues, get_class($installable));

				$result = $installable->result();

				$this->error( 'execution failed: '.$result );
				
				$issues = array_merge( $issues, $result );
			}
				
			$installable->cleanup();

			$this->info( 'completed.' );
		}

		return count($issues) < 1;
	}
	
	function getLogger()
	{
 		try 
 		{
 			if ( !is_object($this->logger) )
 			{
 				$this->logger = Logger::getLogger('System');
 			}
 			
 			return $this->logger;
 		}
 		catch( Exception $e)
 		{
 			error_log('Unable initialize logger: '.$e->getMessage());
 		}
	}
	
	function error( $message )
	{
		try 
 		{
 			Logger::getLogger('Install')->error($message);
 		}
 		catch( Exception $e)
 		{
 			error_log($message);
 		}
	}
	
	function info( $message )
	{
		try 
 		{
 			Logger::getLogger('Install')->info($message);
 		}
 		catch( Exception $e)
 		{
 			error_log($message);
 		}
	}
}
