<?php

include_once "MaintenanceCommand.php";
include_once SERVER_ROOT_PATH.'admin/classes/StrategyUpdate.php';
include_once SERVER_ROOT_PATH.'admin/install/InstallationFactory.php';

class UpdateApplication extends MaintenanceCommand
{
	function validate()
	{
		return true;
	}

	function create()
	{
		$strategy = new StrategyUpdate($_REQUEST['parms']);

		try {
            $this->updateCode($strategy);

            if ( function_exists('opcache_reset') ) opcache_reset();

            // clear old cache
            InstallationFactory::getFactory();
            foreach( array(new ClearCache(), new CacheParameters()) as $command ) {
                $command->install();
            }

            // rebuild cached list of plugins
            getFactory()->getPluginsManager()->buildPluginsList();

            if ( function_exists('opcache_reset') ) opcache_reset();

            $this->updateDatabase($strategy);

            $strategy->getUpdate()->update_clean();

            // go to the next step
            $strategy->release();

            DAL::Instance()->Reconnect();

            $this->replyRedirect( '?action=updatesystem&parms='.SanitizeUrl::parseUrl($_REQUEST['parms']) );
        }
        catch( \Exception $e ) {
		    $this->replyError($e->getMessage());
        }
	}
	
	private function updateCode( & $strategy )
	{
	    $update = $strategy->getUpdate();

	    // updates application scripts
	    $update->update_htdocs();	    
	}
	
	private function updateDatabase( & $strategy )
	{
		$update = $strategy->getUpdate();

	    $update_file_name = $strategy->getFileName();
	     
	    $update_version = '';
	    $update->update_getinfo( $update_version );
	    
	    $update_cls = getFactory()->getObject('cms_Update');
	    
	    if ( $update_version == "" ) {
	        $update_it = $update_cls->getLatest();
	        $update_version = $update_it->getDisplayName();
	    }
	    
	    $update->update_database(SERVER_UPDATE_PATH.'devprom/update.sql');

	    $update_it = $update_cls->getByRef('Caption', trim($update_version));
	    
	    if ( $update_it->getId() != '' ) {
    	    $parms = array();
    	    $parms['FileName'] = $update_file_name;
    	    $parms['LogFileName'] = $update_file_name.'.log';
    	    $update_cls->modify_parms($update_it->getId(),$parms);
	    }
	    
	    $update->writeLog( "INSTALLED UPDATES:" );
	    	
	    $update_it = $update_cls->getAll();
	    while( !$update_it->end() ) {
	        $update->writeLog( $update_it->get('Caption') );
	        $update_it->moveNext();
	    }		
	}
}