<?php

include_once SERVER_ROOT_PATH."core/classes/widgets/ScriptBuilder.php";

class ProductTourJSBuilder extends ScriptBuilder
{
	private $session = null;
	
	public function __construct( $session )
	{
		$this->session = $session;
	}
	
    public function build( ScriptRegistry $object )
    {
 		$language = strtolower($this->session->getLanguageUid());
    	$path = SERVER_ROOT_PATH."plugins/producttour/resources/js/";
    	
    	$object->addScriptFile($path."bootstrap-tour.js");
    	$object->addScriptFile($path."locals/".$language."/titles.js");
    	$object->addScriptFile($path."locals/".$language."/content.js");
    	$object->addScriptFile($path."locals.js");
    	$object->addScriptFile($path."tour-core.js");
    	
    	// devprom features tour
   		$content = file_get_contents($path."tour-ui.js");
   		$content = preg_replace('/%PORTFOLIO%/', !defined('PERMISSIONS_ENABLED') ? 'all' : 'my', $content);
   		$file_name = tempnam(sys_get_temp_dir(), 'producttour');
   		file_put_contents($file_name, $content);
   		$object->addScriptFile($file_name);
        unlink($file_name);
    }
}