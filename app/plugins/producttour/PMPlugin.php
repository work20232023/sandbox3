<?php
include "classes/ProductTourJSBuilder.php";
include "classes/ProductTourCSSBuilder.php";

class ProductTourPM extends PluginPMBase
{
	// returns builders which extend application behavior 
	public function getBuilders()
	{
		if ( defined('SKIP_PRODUCT_TOUR') ) return array();
		return array(
				new ProductTourJSBuilder(getSession()),
				new ProductTourCSSBuilder()
		);
	}

	function getHeaderMenus()
	{
		if ( defined('SKIP_PRODUCT_TOUR') ) return array();
		return $this->getBasePlugin()->getHeaderMenus();
	}
}