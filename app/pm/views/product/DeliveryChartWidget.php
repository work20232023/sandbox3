<?php

include_once SERVER_ROOT_PATH."core/views/charts/FlotChartWidget.php";

class DeliveryChartWidget extends FlotChartWidget
{
	private $iterator = null;
	
	public function __construct( $iterator )
	{
		$this->iterator = $iterator;

        $this->projects = $this->iterator->fieldToArray('Project');
        if ( count($this->projects) < 1 ) $this->projects = array(getSession()->getProjectIt()->getId());

        $projectIt = getFactory()->getObject('Project')->getExact($this->projects);
        $this->projectStart = min($projectIt->fieldToArray('EstimatedStartDate'));
        $this->projectFinish = max($projectIt->fieldToArray('EstimatedFinishDate'));

		parent::__construct();
	}
	
    public function draw( $chart_id )
    {
    	$start = strftime('%Y-%m-%d', strtotime('-7 day', strtotime(SystemDateTime::date('Y-m-d'))));
    	$finish = strftime('%Y-%m-%d', strtotime('+1 month', strtotime(SystemDateTime::date('Y-m-d'))));
    	
    	?>
	   	<script id="uid-template" type="text/x-handlebars-template">
			<a class="with-tooltip" placement="bottom" info="/pm/{{project}}/tooltip/{{objectclass}}/{{objectid}}" href="/pm/{{project}}/{{letter}}-{{objectid}}">[{{letter}}-{{objectid}}]</a>
			{{content}} 
  		</script>
	   	<script id="base-template" type="text/x-handlebars-template">
			{{content}} 
  		</script>
	    <script type="text/javascript">
    		var deliveryTemplates = {
    				'uid-template': Handlebars.compile(document.getElementById('uid-template').innerHTML),
    				'base-template': Handlebars.compile(document.getElementById('base-template').innerHTML)
    		};
			var dataSet = new vis.DataSet(<?=JsonWrapper::encode($this->getItems())?>);
			
			var container = document.getElementById('<?=$chart_id?>');
			var options = {
                start: '<?=$start?>',
				end: '<?=$finish?>',
                editable: false,
                margin: {
                    item: {
                        horizontal: -1
                    }
                },
                groupOrder: 'index',
				locales: {
					    // create a new locale (text strings should be replaced with localized strings)
					    ru: {
					      current: '<?='Текущее'?>',
					      time: '<?='время'?>',
					    },
					    en: {
						      current: 'Current',
						      time: 'time',
						}
					  },
				locale: '<?=strtolower(getSession()->getLanguageUid())?>',
				template: function (item) {
					    var template = deliveryTemplates[item.template];
					    return template(item);                  
				}
			};

            $(container).html('');
			var timeline = new vis.Timeline( container, dataSet,
				new vis.DataSet(<?=JsonWrapper::encode($this->getGroups())?>),
				options
			);
			timeline.on('doubleClick', function( data ) {
				var item = dataSet.get(data.item);
				if ( item != undefined && typeof item.url != 'undefined' ) {
					window.location.replace(item.url);
				}
			});
            timeline.on('select', function (data) {
                if ( data.items.length < 1 ) return;
                var item = dataSet.get(data.items[0]);
                $(document).trigger("trackerItemSelected", [item.objectid, false, item.objectclass]);
            });

            timeline.addCustomTime('<?=$this->projectStart?>', 'project-start');
            timeline.setCustomTimeTitle('<?=text(3322)?>', 'project-start');
            timeline.addCustomTime('<?=$this->projectFinish?>', 'project-finish');
            timeline.setCustomTimeTitle('<?=text(3323)?>', 'project-finish');

	   	</script>
	   	<?php
    }
    
    protected function getGroups()
    {
        $groups = array();
    	
    	$project_ids = $this->iterator->fieldToArray('Project');
    	if ( count($project_ids) > 0 ) {
	    	$project_it = getFactory()->getObject('Project')->getRegistry()->Query(
	    			array (
	    					new FilterInPredicate($project_ids),
	    					new SortAttributeClause('Importance'),
	    					new SortAttributeClause('Caption')
	    			)
	    	);
	    	while( !$project_it->end() )
	    	{
	    		$groups[] = array (
	    				'id' => $project_it->getId(),
	    				'content' => IteratorBase::wintoutf8($project_it->getDisplayName())
	    		);
	    		$project_it->moveNext(); 
	    	}
    	}
    	return $groups;
    }
    
    protected function getItems()
    {
    	$priority_it = getFactory()->getObject('Priority')->getRegistry()->Query();
    	$importance_it = getFactory()->getObject('Importance')->getRegistry()->Query();

        $project_ids = $this->iterator->fieldToArray('Project');
    	if ( count($project_ids) > 0 ) {
	    	$project_it = getFactory()->getObject('Project')->getRegistry()->Query(
	    			array (
	    					new FilterInPredicate($project_ids)
	    			)
	    	);
	    	while( !$project_it->end() )
	    	{
	    		$groups[$project_it->getId()] = $project_it->get('CodeName');
	    		$project_it->moveNext(); 
	    	}
    	}

		$milestone_it = getFactory()->getObject('Milestone')->getRegistry()->Query(
			array(
				new FilterInPredicate($this->iterator->idsToArray())
			)
		);
		$feature_it = getFactory()->getObject('Feature')->getRegistry()->Query(
			array(
				new FilterInPredicate($this->iterator->idsToArray())
			)
		);
		$request_it = getFactory()->getObject('Request')->getRegistry()->Query(
			array(
				new FilterInPredicate($this->iterator->idsToArray())
			)
		);

    	$items = array();
    	$issue_final_states = $this->getTerminalStates();
    	
    	while( !$this->iterator->end() )
    	{
    		$item = array (
                'id' => $this->iterator->get('ObjectClass').':'.$this->iterator->getId(),
                'content' => IteratorBase::wintoutf8($this->iterator->getHtmlDecoded('Caption')),
                'start' => $this->iterator->getDateFormatUser('EstimatedStartDate', '%Y-%m-%d'),
                'end' => $this->iterator->getDateFormatUser('EstimatedFinishDate', '%Y-%m-%d'),
                'group' => $this->iterator->get('Project'),
                'objectid' => $this->iterator->getId(),
                'objectclass' => $this->iterator->get('ObjectClass'),
                'template' => 'base-template',
                'project' => $groups[$this->iterator->get('Project')]
    		);

            if ( $item['start'] == '' || $item['end'] == '' ) {
                $this->iterator->moveNext();
                continue;
            }

			switch( $this->iterator->get('ObjectClass') ) 
			{
			    case 'Feature':
			    	$importance_it->moveToId($this->iterator->get('Importance'));
			    	$item['style'] = join(';', 
							array (
								'border-color:'.$importance_it->get('RelatedColor')
							)
					); 
			    	$item['className'] = join(' ', 
			    			array(
			    				'function',
			    				strlen($item['content']) > 20 ? 'overflow' : '',
			    				'priority-'
			    			)
			    	);
			    	$item['letter'] = 'F';
			    	$item['template'] = 'uid-template';

					$feature_it->moveToId($this->iterator->getId());
					$method = new ObjectModifyWebMethod($feature_it);
					$item['url'] = $method->getJSCall();
			    	break;
			    	
			    case 'Milestone':
			    	$item['className'] = join(' ', 
			    		array(
			    			'demo',
			    			strlen($item['content']) > 20 ? 'overflow' : ''
			    		)
			    	);
			    	$item['letter'] = 'M';
			    	$item['template'] = 'uid-template';
			    	unset($item['end']);

					$milestone_it->moveToId($this->iterator->getId());
					$method = new ObjectModifyWebMethod($milestone_it);
					$item['url'] = $method->getJSCall();
			    	break;

			    case 'Request':
			    	$priority_it->moveToId($this->iterator->get('Priority'));
			    	$item['style'] = join(';', 
							array (
								'border-color:'.$priority_it->get('RelatedColor')
							)
					); 
			    	$item['className'] = join(' ',
			    			array(
			    				'issues', 
			    				strlen($item['content']) > 20 ? 'overflow' : '', 
			    				'priority-1',
			    				'issues-'.$this->iterator->get('Custom1'), // icon
								in_array($this->iterator->get('State'), $issue_final_states) ? 'complete' : ''
			    			)
			    	);
			    	$item['letter'] = 'I';
			    	$item['template'] = 'uid-template';

					$request_it->moveToId($this->iterator->getId());
					$method = new ObjectModifyWebMethod($request_it);
					$item['url'] = $method->getJSCall();
			    	break;
			}

			$items[] = $item;
    		
			$this->iterator->moveNext();
    	}
    	$this->iterator->moveFirst();
    	
    	return $items;
    }
    
    protected function getTerminalStates()
    {
	 	$metastate = getFactory()->getObject('StateMeta');
		$metastate->setAggregatedStateObject(getFactory()->getObject('IssueState'));
 		$metastate->setStatesDelimiter("-");
		return preg_split('/[,-]/',array_pop($metastate->getRegistry()->Query(array())->fieldToArray('ReferenceName')));
    }
}