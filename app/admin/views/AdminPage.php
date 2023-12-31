<?php
include "ui/BulkFormAdmin.php";
include "AdminPageNavigation.php";

class AdminPage extends Page
{
	function getBulkForm( $entityForm )
	{
		return new BulkFormAdmin($this->getObject(), $entityForm);
	}

	function buildNavigationParms() {
        return new AdminPageNavigation($this);
    }

    function getRenderParms()
	{
		return array_merge(
		    parent::getRenderParms(),
            array (
			    'caption_template' => 'admin/PageTitle.php'
		    )
        );
	}
	
	function getTabsTemplate()
	{
		return 'admin/PageTabs.php'; 	
	}
	
 	function getMetrics()
 	{
 		if ( !DeploymentState::IsInstalled() ) return '';
 		
 		return parent::getMetrics();
 	}
 	
 	function getCheckpointAlerts()
 	{
 		if ( !DeploymentState::IsInstalled() ) return array();
 		
 		return parent::getCheckpointAlerts();
 	}
 	
 	function hasAccess()
    {
        if ( \DeploymentState::Instance()->IsReadyToBeUsed() && !getSession()->getUserIt()->IsAdministrator() ) return false;
        return parent::hasAccess();
    }
}