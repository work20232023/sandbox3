<?php

class ProductTourCo extends PluginCoBase
{
	// returns modules of the plugin
    function getModules()
    {
        return array(
            'updates' =>
                array(
                    'includes' => array( 'producttour/views/ProductInfoPage.php' ),
                    'classname' => 'ProductInfoPage'
                )
        );
    }
    
  	function getHeaderMenus() {
        if ( defined('SKIP_PRODUCT_TOUR') ) return array();
 		return $this->getBasePlugin()->getHeaderMenus();
 	}
}