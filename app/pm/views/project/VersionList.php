<?php
include_once SERVER_ROOT_PATH . "pm/classes/comments/persisters/CommentRecentPersister.php";
include_once SERVER_ROOT_PATH . "pm/classes/plan/sorts/SortStageClause.php";
include_once SERVER_ROOT_PATH . 'pm/views/issues/RequestForm.php';
include_once SERVER_ROOT_PATH . 'pm/views/plan/ReleaseForm.php';
include_once SERVER_ROOT_PATH . 'pm/views/plan/IterationForm.php';
include_once SERVER_ROOT_PATH . 'pm/views/project/MilestoneForm.php';

class VersionList extends PMPageList
{
    function getIt( $object_it )
	{
        if ( !class_exists(getFactory()->getClass($object_it->get('State'))) ) {
            return $this->getObject()->getEmptyIterator();
        }

        return getFactory()->getObject($object_it->get('State'))->getRegistry()->Query(
            array(
                new FilterInPredicate($object_it->getId()),
                new CommentRecentPersister()
            )
        );
	}

	function extendModel()
    {
        parent::extendModel();
        $this->getObject()->addAttribute('Progress', '', translate('Прогресс'), true);
    }

	function drawCell( $source_it, $attr )
	{
		$object_it = $this->getIt( $source_it );

		switch ( $attr )
		{
            case 'Caption':
                if ( $this->getUidService()->hasUid($object_it) ) {
                    $this->getUidService()->drawUidInCaption($object_it);
                }
                else {
                    if ( $source_it->get('CaptionType') != '' ) {
                        echo $object_it->object->getDisplayName() . ' ';
                    }
                    echo $object_it->getDisplayName();
                }
                return;

            case 'Artefacts':
                $objects = preg_split('/,/', $source_it->get($attr));
                $uids = array();

				$branches = array();
				foreach( $objects as $object_info ) {
					list($class, $id, $type, $baseline) = preg_split('/:/', $object_info);
					if ($type == 'branch') $branches[] = $id;
				}
                foreach( $objects as $object_info )
                {
                    list($class, $id, $type, $baseline) = preg_split('/:/',$object_info);
					if ( $type != 'branch' && in_array($id, $branches) ) continue;
                    $class = getFactory()->getClass($class);
                    if ( $class == '' ) continue;
                    $ref_it = getFactory()->getObject($class)->getExact($id);
					if ( $type != 'branch' ) {
					    $this->getUidService()->setBaseline($baseline);
					    $baselineText = getFactory()->getObject('Snapshot')->getExact($baseline)->getDisplayName();
                        $ref_it = $ref_it->object->createCachedIterator(
                            array_map(function($row) use ($baselineText) {
                                    $row['DocumentVersion'] = $baselineText;
                                    return $row;
                                }, $ref_it->getRowset()
                            )
                        );
                    }
					$text = $this->getUidService()->getUidIconGlobal($ref_it, false);
                    $text .= '<span class="ref-name">'.$ref_it->getDisplayNameExt().'</span>';
                    $uids[] = $text;
					$this->getUidService()->setBaseline('');
                }
                echo '<span class="tracing-ref"><span>'.join('</span><span>',$uids).'</span></span>';
                return;

            case 'RecentComment':
                parent::drawCell($object_it, $attr);
                return;

            case 'Progress':
                $total = count(\TextUtils::parseIds($source_it->get('Increments'))) +
                    count(\TextUtils::parseIds($source_it->get('Tasks')));
                $resolved = $total - $source_it->get('UncompletedIssues') - $source_it->get('UncompletedTasks');

                $frame = new IssuesProgressFrame(
                    array(
                        'R' => array(
                            $total, $resolved
                        )
                    ), false
                );
                $frame->draw();
                return;
		}

        parent::drawCell( $source_it, $attr );
	}

	function getItemActions( $column_name, $object_it )
	{
		$it = $this->getIt( $object_it );
        $methodology_it = $it->getRef('Project')->getMethodologyIt();

		$actions = parent::getItemActions( $column_name, $it );

		switch ( $it->object->getClassName() )
		{
			case 'pm_Version':
				
				$new_actions = $this->getNewRelatedActions($it, $methodology_it);
                if ( count($new_actions) > 0 ) {
                    $actions[] = array();
                    $actions[] = array (
                        'name' => translate('Создать'),
                        'items' => $new_actions
                    );
                }

				$method = new ResetBurndownWebMethod();
				
				if ( $method->hasAccess() )
				{
					if ( $actions[array_pop(array_keys($actions))]['name'] != '' ) $actions[] = array();
				    array_push( $actions, array(
				        'url' => $method->url( $it ),
				        'name' => $method->getCaption() 
				    ));
				}
				
	            $module_it = getFactory()->getObject('PMReport')->getExact('tasksbyassignee');
	            if ( getFactory()->getAccessPolicy()->can_read($module_it) )
	            {
					if ( $actions[array_pop(array_keys($actions))]['name'] != '' ) $actions[] = array();
	                
				    $info = $module_it->buildMenuItem('issue-release='.$it->getId());
	                $actions[] = array(
	                    'url' => $info['url'],
	                    'name' => translate('Бэклог релиза')
	                );
	            }

				break;

			case 'pm_Release':

                $new_actions = $this->getNewRelatedActions($it, $methodology_it);
                if ( count($new_actions) > 0 ) {
                    $actions[] = array();
                    $actions[] = array (
                        'name' => translate('Создать'),
                        'items' => $new_actions
                    );
                }

				$method = new ResetBurndownWebMethod();
				
				if ( getFactory()->getAccessPolicy()->can_modify($it) && $method->hasAccess() )
				{
					if ( $actions[array_pop(array_keys($actions))]['name'] != '' ) $actions[] = array();
					array_push( $actions, array(
					    'url' => $method->url( $it ),
					    'name' => $method->getCaption() 
					));
				}

                $task_list_it = getFactory()->getObject('PMReport')->getExact('tasksbyassignee');
	            if ( getFactory()->getAccessPolicy()->can_read($task_list_it) )
	            {
					if ( $actions[array_pop(array_keys($actions))]['name'] != '' ) $actions[] = array();
	                
				    $info = $task_list_it->buildMenuItem('iteration='.$it->getId());
	                $actions[] = array(
	                    'url' => $info['url'],
	                    'name' => translate('Бэклог итерации')
	                );
	            }

				break;
		}

		return $actions;
	}

	function getNewRelatedActions( $object_it, $methodology_it )
    {
        $actions = array();
        if ( $object_it->object instanceof Release ) {
            $method = new ObjectCreateNewWebMethod(getFactory()->getObject('Iteration'));
            if ( getSession()->getProjectIt()->getMethodologyIt()->HasPlanning() && $method->hasAccess() ) {
                $actions[] = array(
                    'url' => $method->getJSCall( array('Version' => $object_it->getId()) ),
                    'name' => $method->getCaption()
                );
            }
            $issueParms = array(
                'PlannedRelease' => $object_it->getId()
            );
        }
        if ( $object_it->object instanceof Iteration ) {
            $issueParms = array(
                'Iteration' => $object_it->getId()
            );
            if ( $methodology_it->HasTasks() ) {
                $method = new ObjectCreateNewWebMethod(getFactory()->getObject('Task'));
                if ( $method->hasAccess() ) {
                    $actions[] = array (
                        'name' => $method->getCaption(),
                        'url' => $method->getJSCall(array('Release' => $object_it->getId()))
                    );
                }
            }
        }

        $method = new ObjectCreateNewWebMethod($object_it->object->getAttributeObject('Issues'));
        if ( $method->hasAccess() ) {
            $typeIt = getFactory()->getObject('pm_IssueType')->getAll();
            while( !$typeIt->end() ) {
                $actions[] = array (
                    'name' => $typeIt->getDisplayName(),
                    'url' => $method->getJSCall(
                        array_merge(
                            $issueParms,
                            array(
                                'Type' => $typeIt->getId()
                            )
                        )
                    )
                );
                $typeIt->moveNext();
            }
        }

        return $actions;
    }

	function getActions( $object_it )
	{
		$actions = $this->getItemActions('', $object_it);
		$it = $this->getIt( $object_it );
		
		switch ( $it->object->getClassName() )
		{
			case 'pm_Version':
				$form = new ReleaseForm($it->object);
				break;
			case 'pm_Release':
				$form = new IterationForm($it->object);
				break;
            case 'pm_Milestone':
                $form = new MilestoneForm($it->object);
                break;
            case 'pm_ChangeRequest':
                $form = new RequestForm($it->object);
                break;
            default:
                return array();
		}
		
	    $form->show($it);
		
	    $delete = $form->getDeleteActions($it);
        if ( count($delete) > 0 ) {
		    $actions = array_merge($actions, array(array()), $delete); 
        }
		
        return $actions;
	}
	
 	function getColumnWidth( $attr ) {
 		switch ( $attr ) {
 			case 'Progress':
 				return 160;
 			default:
 				return parent::getColumnWidth( $attr );
 		}
 	}

	function getGroupDefault() {
        return '';
    }

    function getSorts()
    {
        return array_merge(
            parent::getSorts(),
            array(
                new SortStageClause()
            )
        );
    }

    function getItemClass($it) {
        return get_class($this->getIt($it)->object);
    }
}
