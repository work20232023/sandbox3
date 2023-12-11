<?php

namespace Devprom\ProjectBundle\Service\Workflow;

class WorkflowService
{
	const RESOLVE = 'resolve';
	
	public function __construct( $object, $logger = null )
	{
		$this->logger = is_object($logger) ? $logger : \Logger::getLogger('System');  
		
		if ( !$object instanceof \MetaobjectStatable ) throw new \Exception('Statable object is required');
		 
		$this->object = $object;
		
		if ( $this->object->getStateClassName() == '' ) throw new \Exception('State class is not defined');
		
		$this->state_object = getFactory()->getObject($this->object->getStateClassName());
	}

	public function getStateObject()
	{
		return $this->state_object;
	}
	
	public function moveToState( $object_it, $target_state_ref_name, $comment = '', $parms = array(), $fire_event = true )
	{
		if ( $object_it->getId() == '' ) {
            throw new \Exception('Nothing to move');
        }

        if ( $object_it->get('State') == '' ) {
            $object_it = $object_it->object->getExact($object_it->getId());
        }

	    $source_it = $this->state_object->getRegistry()->Query(
            array (
                new \FilterAttributePredicate('ReferenceName', $object_it->get('State')),
                new \FilterVpdPredicate($object_it->get('VPD')),
                new \SortOrderedClause()
            )
    	);

    	$this->logger->info( "[WorkflowService] Source state is ".$source_it->getId() );

		$target_state_ref_name = !is_array($target_state_ref_name) ? preg_split('/,/',$target_state_ref_name) : $target_state_ref_name;
	    $target_it = $this->state_object->getRegistry()->Query(
    			array (
                    in_array(self::RESOLVE, $target_state_ref_name)
                            ? new \FilterAttributePredicate('IsTerminal', 'Y')
                            : new \FilterAttributePredicate('ReferenceName', $target_state_ref_name),
                    new \FilterVpdPredicate($object_it->get('VPD')),
                    new \SortOrderedClause()
    			)
        	);
	    if ( $target_it->getId() == '' ) {
            throw new \Exception('Target state "'.join(',',$target_it->fieldToArray('Caption')).'" is undefined');
        }
	    
	    $this->logger->info( "[WorkflowService] Target states are ".join(',',$target_it->idsToArray()) );
	    
	    $transition_it = getFactory()->getObject('Transition')->getRegistry()->Query(
            array (
                new \FilterAttributePredicate('SourceState', $source_it->getId()),
                new \FilterAttributePredicate('TargetState', $target_it->idsToArray())
            )
	    );
	    if ( $transition_it->getId() == '' ) {
            throw new \Exception(sprintf(text(3401), $source_it->getDisplayName(), $target_it->getDisplayName()));
	    }

	    if ( !$transition_it->doable($object_it) ) {
            throw new \Exception(sprintf(text(3402), $transition_it->getNonDoableReason()));
        }

        return $this->moveByTransition( $object_it, $transition_it, $comment, $parms, $fire_event );
	}

    public function moveByTransition( $object_it, $transition_it, $comment = '', $parms = array(), $fire_event = true )
    {
        if ( $object_it->getId() == '' ) throw new \Exception('Nothing to move');

        $state_it = $transition_it->getRef('TargetState');
        if ( $state_it->getId() == '' ) {
            throw new \Exception("State is not found");
        }

        if ( !$fire_event ) {
            getFactory()->getEventsManager()->removeNotificator( new \ApplyBusinessActionsEventHandler );
        }

        getFactory()->modifyEntity($object_it, array_merge( $parms,
                array(
                    'State' => $state_it->get('ReferenceName'),
                    'Transition' => $transition_it->getId(),
                    'TransitionComment' => $comment
                )
            ), array(), array(), !$fire_event);

        return true;
    }

	static function getImage( $stateObject )
    {
        $uml = "";

        $stateObject->setAttributeType('IsTerminal', 'char');
        $state_it = $stateObject->getRegistry()->Query(
            array(
                new \FilterBaseVpdPredicate(),
                new \StateOrderedSortClause()
            )
        );

        if ( $state_it->count() < 1 ) return '';

        while( !$state_it->end() ) {
            $stateRefName = preg_replace('/\s+/', '', $state_it->get('ReferenceName'));
            $uml .= "state \"{$state_it->getDisplayName()}\" as {$stateRefName}" . PHP_EOL;
            $state_it->moveNext();
        }

        $state_it->moveFirst();
        $stateRefName = preg_replace('/\s+/', '', $state_it->get('ReferenceName'));

        $uml .= "[*] -down-> {$stateRefName}" . PHP_EOL;

        while( !$state_it->end() ) {
            $sourceStateIt = $state_it;
            $transitionIt = $state_it->getTransitionIt();
            while( !$transitionIt->end() ) {
                $targetIt = $transitionIt->getRef('TargetState');
                $targetRefName = preg_replace('/\s+/', '', $targetIt->get('ReferenceName'));
                $stateRefName = preg_replace('/\s+/', '', $sourceStateIt->get('ReferenceName'));
                if ( $targetRefName == '' || $stateRefName == '' ) {
                    $transitionIt->moveNext();
                    continue;
                }
                $uml .= "{$stateRefName} -down-> {$targetRefName} : \"{$transitionIt->getDisplayName()}\"" . PHP_EOL;
                $transitionIt->moveNext();
            }
            if ( $state_it->get('IsTerminal') == 'Y' ) {
                $stateRefName = preg_replace('/\s+/', '', $state_it->get('ReferenceName'));
                $uml .= "{$stateRefName} -down-> [*]" . PHP_EOL;
            }
            $state_it->moveNext();
        }

        return '<img class="workflow-image" src="'.\TextUtils::getPlantUMLUrl($uml).'">';
    }
	
	private $object = null;
	private $state_object = null;
	private $logger = null;
}