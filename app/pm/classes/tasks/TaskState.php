<?php
include_once SERVER_ROOT_PATH."pm/classes/workflow/StateBase.php";

class TaskState extends StateBase
{
    function __construct()
    {
        parent::__construct();
        $this->addAttributeGroup('AssignedLimit', 'limits');
        $this->setAttributeVisible('AssignedLimit', true);
        $this->setAttributeDescription('AssignedLimit', text(3326));
        $this->resetAttributeGroup('AssignedLimit', 'system');
    }

    function getObjectClass() {
 		return 'task';
 	}
 	
 	function getDisplayName() {
 		return text(1108);
 	}
}
