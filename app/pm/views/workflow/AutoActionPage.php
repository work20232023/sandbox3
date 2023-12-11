<?php
include "AutoActionForm.php";
include "AutoActionTable.php";
include "AutoActionPageSettingBuilder.php";
        
class AutoActionPage extends PMPage
{
    function __construct()
    {
        getSession()->addBuilder( new AutoActionPageSettingBuilder() );

        parent::__construct();

        if ( $this->needDisplayForm() ) {
            $this->addInfoSection( new PageSectionAttributes($this->getObject(),'actions',text(2444)) );
            $this->addInfoSection( new PageSectionAttributes($this->getObject(),'comment',text(2477)) );
            $methodologyIt = getSession()->getProjectIt()->getMethodologyIt();
            if ( $methodologyIt->HasTasks() ) {
                $this->addInfoSection( new PageSectionAttributes($this->getObject(),'task',text(2478)) );
            }
            $this->addInfoSection( new PageSectionAttributes($this->getObject(),'email','Email') );
            $this->addInfoSection( new PageSectionAttributes($this->getObject(),'webhook','Webhook') );
        }
    }

    function getObject() {
		return getFactory()->getObject('IssueAutoAction');
	}
	
    function getTable() {
        return new AutoActionTable($this->getObject());
    }

    function getEntityForm() {
        return new AutoActionForm($this->getObject());
    }
}
