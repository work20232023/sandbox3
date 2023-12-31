<?php

class ReportSpentTimeList extends PMStaticPageList
{
 	var $days_map;
 	var $user_it, $request_it, $task_it;
 	private $group = '';
    private $userReportUrl = '';

    function buildMethods()
    {
        parent::buildMethods();

        $values = $this->getFilterValues();
        $report_it = getFactory()->getObject('PMReport')->getExact('tasksplanbyfact');
        if ( $report_it->getId() != '' ) {
            $this->userReportUrl = $report_it->getUrl('taskassignee=%1&modifiedafter='.$values['start']);
        }
    }

    function extendModel()
    {
        $object = $this->getObject();
        $predicates = array();
        $filterValues = $this->getTable()->getPredicateFilterValues();

        $plugins = getFactory()->getPluginsManager();
        $plugins_interceptors = is_object($plugins) ? $plugins->getPluginsForSection($this->getTable()->getSection()) : array();
        foreach( $plugins_interceptors as $plugin ) {
            $plugin->interceptMethodListGetPredicates( $this, $predicates, $filterValues);
        }

       $this->group = $this->getGroup();
        if ( !in_array($this->group, array('', 'none')) ) {
            $object->setGroup($this->group);
        }

        $rows_object = $this->getTable()->getRowsObject();
        $rows_object->addFilter(
            new FilterSearchAttributesPredicate(
                $filterValues['search'], $rows_object->getSearchableAttributes()
            )
        );

        if ( $_REQUEST['ids'] != '' ) {
            $ids = $this->getIds($filterValues);
            if ( count($ids) < 1 ) $ids[] = '0';
            $rows_object->addFilter(new FilterInPredicate($ids));
        }

        $object->setRowsObject($rows_object);
        $attribute = $this->getGroup();

        if ( !$object->IsReference($attribute) && $rows_object->IsReference($attribute) ) {
            $object->addAttribute(
                $attribute,
                $rows_object->getAttributeDbType($attribute),
                $rows_object->getAttributeUserName($attribute),
                true,
                in_array($attribute, array('Owner','Assignee')) ? true : false
            );
        }

        $this->it = $object->getRegistry()->Query(
            array_merge(
                $predicates,
                $this->getTable()->getFilterPredicates($filterValues),
                array(
                    new FilterVpdPredicate()
                ),
                $this->getSorts()
            )
        );
        $this->days_map = $this->it->getDaysMap();

        foreach( $this->days_map as $dayId => $dayName ) {
            $object->addAttribute('Day'.$dayId, 'FLOAT', $dayName, true);
        }

        $object->setAttributeCaption('Caption', $this->getTable()->getRowsObject()->getDisplayName());
        $object->addAttribute('Total', 'FLOAT', translate('Итого'), true);
        $object->addAttribute('TotalPlanned', 'FLOAT', translate('Трудоемкость'), true);

        foreach( array('Total','TotalPlanned') as $attribute ) {
            $object->addAttributeGroup($attribute, 'workload');
            $object->addAttributeGroup($attribute, 'hours');
        }

        parent::extendModel();
    }

    function getIterator()
 	{
		$items = array_filter($this->it->fieldToArray('ItemId'), function( $value ) {
		    return $value > 0;
		});
		
		$this->row_it = count($items) > 0
			? $this->getTable()->getRowsObject()->getRegistry()->Query( array(new FilterInPredicate($items)) )
			: $this->getTable()->getRowsObject()->getEmptyIterator();

        if ( $this->getTable()->getRowsObject()->IsReference($this->getGroup()) ) {
            $this->report_group_it = $this->getTable()->getRowsObject()->getAttributeObject($this->getGroup())->getAll();
        }
        else if ( $this->getObject()->IsReference($this->getGroup()) ) {
            $this->report_group_it = $this->getObject()->getAttributeObject($this->getGroup())->getAll();
        }
        else {
            $this->report_group_it = $this->getTable()->getRowsObject()->getEmptyIterator();
        }

        $this->it->moveFirst();
		return $this->it;
	}
	
    function getColumnVisibility( $attr )
    {
        switch ( $attr )
        {
            case 'Caption':
            case 'Total':
            case 'TotalCosts':
            case 'TotalPlanned':
                return true;
            default:
                return strpos($attr, 'Day') !== false;
        }
    }

	function getGroupDefault()
	{
	}
	
	function getGroupFields()
	{
		$rows_object = $this->getTable()->getRowsObject();

        $attributes = array();
        $skip_attributes = array_merge(
            $rows_object->getAttributesByGroup('system'),
            $rows_object->getAttributesByGroup('workflow'),
            $rows_object->getAttributesByGroup('trace')
        );

		if ( $rows_object instanceof Request )
		{
			foreach($rows_object->getAttributes() as $attribute => $info) {
                if ( in_array($attribute,array('Type','Attachment','Watchers','Tasks','OpenTasks','Deadlines','DueWeeks','ClosedInVersion','SubmittedVersion')) ) continue;
				if ( !$rows_object->IsReference($attribute) ) continue;
				if ( in_array($attribute, $skip_attributes) ) continue;
				$attributes[$rows_object->getAttributeUserName($attribute)] = $attribute;
			}
            foreach( array('TypeBase') as $attribute ) {
                $attributes[$rows_object->getAttributeUserName($attribute)] = $attribute;
            }
			return $attributes;
		}
        elseif ( $rows_object instanceof Task ) {
            foreach($rows_object->getAttributes() as $attribute => $info) {
				if ( in_array($attribute,array('TaskType','Attachment','Watchers','TraceTask','DueWeeks','TraceInversedTask')) ) continue;
                if ( !$rows_object->IsReference($attribute) ) continue;
                if ( in_array($attribute, $skip_attributes) ) continue;
                $attributes[$rows_object->getAttributeUserName($attribute)] = $attribute;
            }
            foreach( array('TaskTypeBase') as $attribute ) {
                $attributes[$rows_object->getAttributeUserName($attribute)] = $attribute;
            }
            return $attributes;
        }
		else
		{
			$fields = array('SystemUser', 'Project');
			switch( $this->getTable()->getReportBase() ) {
				case 'activitiesreportusers':
					$fields = array_diff($fields, array('SystemUser'));
					break;
				case 'activitiesreportproject':
					$fields = array_diff($fields, array('Project'));
					break;
			}
			return $fields;
		}
	}
	
	function getColumnWidth( $attr )
	{
		if( $attr == 'Caption' )
		{
			return '';
		}
		elseif( $attr == 'Total' || $attr == 'TotalPlanned' )
		{
			return 40;
		}
		else 
		{
			return 30;
		}
	}

	function getOffsetLevel( $kind ) 
	{
		if ( $this->group == $kind ) return 0;
    	return in_array($this->group, array('', 'none')) ? 0 : 2;
	}

	function drawGroupRow( $group, $group_field_value, $object_it, $columns, $guid )
	{
        if ( $object_it->get('Group') == '' ) return;

        if ( $this->IsNeedToDisplayNumber() ) {
            echo '<td style="background-color:white;padding-left: 0;">
                    <div class="plus-minus-toggle" data-toggle="collapse" href="#gor' . $guid . '"></div>
                 </td>';
        }
		foreach( $this->getObject()->getAttributes() as $attribute => $data )
		{
			if ( !in_array($attribute, array('Caption','Total','TotalPlanned','TotalCosts')) && strpos($attribute, 'Day') === false ) continue;
			echo '<td id="'.strtolower($attribute).'" style="background-color:white;font-weight:bold;'.($attribute == 'Total' ? 'text-align:right;' : '').'">';
                $this->drawCell($object_it, $attribute);
			echo '</td>';
		}
		echo '<td id="operations" style="background-color:white;font-weight:bold;"></td>';
	}
	
	function drawCell( $object_it, $attr ) 
	{
	    switch( $attr ) {
            case 'Caption':
                if ( $object_it->get('Group') != '' ) {
                    $this->report_group_it->moveToId($object_it->get('ItemId'));
                    $uid = new ObjectUID;
                    $uid->drawUidInCaption($this->report_group_it);

                    if ( $this->userReportUrl != '' && $this->report_group_it->object instanceof User ) {
                        echo ' &nbsp; <a target="_blank" href="'.str_replace('%1', $this->report_group_it->getId(), $this->userReportUrl).'" style="font-weight:normal;">';
                        echo text(2274);
                        echo '</a>';
                    }
                }
                else {
                    $this->row_it->moveToId( $object_it->get('ItemId') );
                    if ( $this->row_it->getId() != '' )
                    {
                        $uid = new ObjectUID;
                        echo '<div class="hover-holder" style="padding-left:'.($this->getOffsetLevel($object_it->get('Item')) * 12).'px;">';
                        $uid->drawUidInCaption($this->row_it);

                        if ( $this->userReportUrl != '' && $this->row_it->object instanceof User ) {
                            echo ' &nbsp; <a class="dashed dashed-hidden" target="_blank" href="'.str_replace('%1', $this->row_it->getId(), $this->userReportUrl).'">';
                            echo text(2274);
                            echo '</a>';
                        }
                        echo '</div>';
                    }
                }
                break;
            case 'Total':
            case 'TotalCosts':
            case 'TotalPlanned':
                if ( $object_it->get($attr) > 0 ) {
                    parent::drawCell($object_it, $attr);
                }
                else {
                    echo '<span style="color:silver;">0</span>';
                }
                break;
            default:
                $hours = round($object_it->get($attr), \EnvironmentSettings::getFloatPrecision());
                if ( $hours > 0 ) {
                    $comment_attr = preg_replace('/Day(\d+)/', 'Comment\\1', $attr);
                    $actions = array();
                    if ( is_array($object_it->get($comment_attr)) ) {
                        foreach ($object_it->get($comment_attr) as $task) {
                            if ($task['Text'] == '') continue;
                            if ( $task['Task'] > 0 ) {
                                $actions[$task['Task']] = array(
                                    'url' => $this->getUidService()->getObjectUrl('T-' . $task['Task']),
                                    'name' => 'T-' . $task['Task'] . ' ' . substr($task['Text'], 0, 120)
                                );
                            }
                            else {
                                $actions[$task['Issue']] = array(
                                    'url' => $this->getUidService()->getObjectUrl('I-' . $task['Issue']),
                                    'name' => 'I-' . $task['Issue'] . ' ' . substr($task['Text'], 0, 120)
                                );
                            }
                        }
                    }
                    if ( count($actions) > 0 ) {
                        echo $this->getRenderView()->render('core/SpentTimeMenu.php', array (
                            'title' => $hours,
                            'items' => $actions,
                            'id' => $object_it->getId().$attr
                        ));
                    }
                    else {
                        echo $hours;
                    }
                }
                else {
                    echo '<span style="color:#dfdfdf;">0</span>';
                }
                echo '&nbsp;';
        }
	}

	function getColumnAlignment ( $attr ) {
	    return $attr == 'Total' ? 'right' : 'left';
	}

	function IsNeedToDisplayRow($object_it) {
		return $object_it->get('Group') == '' || in_array($this->group, array('','none'));
	}

    function getTotalIt( $attributes )
    {
        $values = array();
        $rowset = array_filter(
            $this->getIteratorRef()->getRowset(),
            function( $row ) {
                return $row['Group'] < 1;
            }
        );

        foreach( $attributes as $attribute ) {
            $value = array_sum(
                array_map(function($row) use($attribute) {
                    return $row[$attribute];
                }, $rowset)
            );
            if ( $value != '' ) $values[$attribute] = $value;
        }

        return $this->getObject()->createCachedIterator(array($values));
    }

    function getSettingsViewParms()
    {
        return array_filter(
            parent::getSettingsViewParms(),
            function($key) {
                return $key == 'group';
            },
            ARRAY_FILTER_USE_KEY);
    }

    function IsNeedToSelect() {
        return false;
    }
}