<?php
include_once SERVER_ROOT_PATH."pm/classes/widgets/FunctionalAreaMenuSettingsBuilder.php";

class FunctionalAreaMenuIntegrationSettingsBuilder extends FunctionalAreaMenuSettingsBuilder
{
    public function build( FunctionalAreaMenuRegistry & $set )
    {
 		$menus = $set->getAreaMenus( FunctionalAreaMenuSettingsBuilder::AREA_UID );
 		if ( count($menus) < 1 ) return;

        $menus['quick']['items'][] = $this->getModule()->getExact('integration/list')->buildMenuItem();
 		$set->setAreaMenus( FunctionalAreaMenuSettingsBuilder::AREA_UID, $menus );
    }
}