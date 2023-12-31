<?php

include_once SERVER_ROOT_PATH."pm/classes/report/ReportsBuilder.php";

class ReportsKanbanBuilder extends ReportsBuilder
{
	private $session = null;
	
	public function __construct( PMSession $session )
	{
		$this->session = $session;
	}
	
    public function build( ReportRegistry & $object )
    {
     	$project_it = $this->session->getProjectIt();
		$module = getFactory()->getObject('Module');

     	if ( !$project_it->IsPortfolio() ) {
			$module_it = $module->getExact('issues-chart');
			$object->addReport( array (
					'name' => 'commulativeflow',
					'title' => text('kanban18'),
					'category' => FUNC_AREA_MANAGEMENT,
					'query' => 'group=history&aggby=State&state=all&modifiedafter=last-month',
					'type' => 'chart',
					'description' => text('kanban30'),
					'module' => $module_it->getId()
			));
		}

     	$module_it = $module->getExact('kanban/avgleadtime');
		$object->addReport( array (
	        'name' => 'avgleadtime',
			'title' => text('kanban19'),
			'category' => FUNC_AREA_MANAGEMENT,
		    'query' => 'modifiedafter=last-month&type=all&priority=all&chartdata=hide&chartlegend=hide&aggregator=AVG&group=FinishDate&aggby=LifecycleDuration&state='.
		        join(',',getFactory()->getObject('Request')->getTerminalStates()).'&modifiedafter=last-month',
	        'type' => 'chart',
			'description' => $module_it->get('Description'),
	        'module' => $module_it->getId() 
		));

        $module_it = $module->getExact('issues-chart');
        $object->addReport( array (
            'name' => 'blockreasonschart',
            'title' => text('kanban32'),
            'category' => FUNC_AREA_MANAGEMENT,
            'query' => 'group=BlockReason&state=all&modifiedafter=last-month',
            'type' => 'chart',
            'description' => text('kanban33'),
            'module' => $module_it->getId()
        ));

     	if ( $project_it->getMethodologyIt()->get('IsKanbanUsed') == 'Y' ) {
            $module_it = $module->getExact('kanban/requests');
            if ( getFactory()->getAccessPolicy()->can_read($module_it) ) {
                $object->addReport( array (
                    'name' => 'kanbanboard',
                    'title' => text('kanban17'),
                    'description' => $module_it->get('Description'),
                    'category' => FUNC_AREA_MANAGEMENT,
                    'module' => $module_it->getId()
                ));
            }
        }
	}
}