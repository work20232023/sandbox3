<?php
include_once SERVER_ROOT_PATH.'core/classes/system/GlobalLock.php';
include_once SERVER_ROOT_PATH.'admin/install/InstallationFactory.php';

class TogglePluginWebMethod extends WebMethod
{
	var $filename, $plugin;

	function TogglePluginWebMethod ( $filename = '' )
	{
		$this->filename = $filename;
        $this->setRedirectUrl('function() {window.location.reload();}');
			
		parent::WebMethod();
	}

	function getCaption()
	{
		global $plugins;
			
		if ( $plugins->pluginEnabled($this->filename) )
		{
			return translate('Отключить');
		}
		else
		{
			return translate('Подключить');
		}
	}

	function execute_request()
	{
		$this->execute($_REQUEST['file']);
	}

	function execute( $file_name )
	{
		$globalLock = new \GlobalLock();
		$installation_factory = InstallationFactory::getFactory();

        // clear old cache
        $clear_cache_action = new ClearCache();
        $clear_cache_action->install();

		PluginsFactory::Instance()->enablePlugin(
		    $file_name, !PluginsFactory::Instance()->pluginEnabled($file_name)
        );
        $globalLock->release();
	}
}
