<?php
define('COOKIE_VERSION_LEARNT', 'product-tour-version-learnt');

include "model/ProductInfoPost.php";
include "PMPlugin.php";
include "COPlugin.php";
include "AdminPlugin.php";

// define common plugin attributes
class ProductTourPlugin extends PluginBase
{
	// this is plugin's unique internal name
 	function getNamespace()
 	{
 		return 'producttour';
 	}
 
 	// 
  	function getFileName()
 	{
 		return 'producttour.php';
 	}
 	
 	// plugin's title
 	function getCaption()
 	{
 		return text('producttour1');
 	}
 	
 	// plugin's order number in the list of plugins, is using to define dependencies between plugins
 	function getIndex()
 	{
 	    return parent::getIndex() + 10;
 	}
 	
 	// returns plugins extentions for the corresponding application:
 	// PM - project management
 	// Admin - administration
 	// CO - common section
 	//
 	function getSectionPlugins()
 	{
 		return array( new ProductTourAdmin(), new ProductTourCo(), new ProductTourPM() );
 	}
 	
 	function IsUpdatedWithCore()
 	{
 		return false;
 	}

	function getHeaderMenus()
	{
		if ( filesize(DOCUMENT_ROOT.'conf/rss.xml') < 64 ) return array();

		$now = TextUtils::versionToString($_SERVER['APP_VERSION']);
		$learnt = TextUtils::versionToString($_COOKIE[COOKIE_VERSION_LEARNT]);

		if ( $learnt < $now ) {
			return array(
				array (
					'caption' => '',
					'title' => text('producttour2'),
					'class' => 'btn-link',
					'url' => "javascript: javascript: workflowModify({'form_url':'/co/module/producttour/updates','class_name':'','entity_ref':'','object_id':'','can_delete':'false','can_modify':'false','delete_reason':null}, donothing);",
					'icon' => 'icon-white icon-gift'
				),
			);
		}

		return array();
	}
}