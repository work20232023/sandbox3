<?php

class ProductTourAdmin extends PluginAdminBase
{
  	function getHeaderMenus() {
		if ( defined('SKIP_PRODUCT_TOUR') ) return array();
 		return $this->getBasePlugin()->getHeaderMenus();
 	}
}