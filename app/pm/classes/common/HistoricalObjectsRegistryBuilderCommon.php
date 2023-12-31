<?php

include_once "HistoricalObjectsRegistryBuilder.php";

class HistoricalObjectsRegistryBuilderCommon extends HistoricalObjectsRegistryBuilder
{
    public function build ( HistoricalObjectsRegistry & $registry )
    {
 		$registry->add( 'Request', array( 
			'Priority',
			'State',
			'Owner',
			'Author',
			'LastTransition',
			'Type',
			'Function'
 		));

 		$registry->add( 'Task', array (
			'Priority',
			'State',
			'Assignee',
			'TaskType',
			'LastTransition'
		));
    }
}