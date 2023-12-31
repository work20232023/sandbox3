<?php
include "StateBaseIterator.php";
include "StateBaseRegistry.php";
include "predicates/StateClassPredicate.php";
include "predicates/StateNeighborsPredicate.php";
include "predicates/StateObjectPredicate.php";
include "predicates/StateSharedVpdPredicate.php";
include "predicates/StateTerminalPredicate.php";
include "predicates/ObjectStatePredicate.php";
include "predicates/StateHasNoTransitionsPredicate.php";
include "predicates/StateHasNoObjectsPredicate.php";
include "StateBaseModelBuilder.php";
include "persisters/StateQueueLengthPersister.php";
include "validators/StateModelValidator.php";
include "sorts/StateOrderedSortClause.php";

class StateBase extends Metaobject
{
 	function __construct() 
 	{
 		parent::__construct('pm_State', new StateBaseRegistry($this));

        foreach( array('ReferenceName','ObjectClass') as $attribute ) {
            $this->addAttributeGroup($attribute, 'alternative-key');
        }
        $this->addAttributeGroup('AssignedLimit', 'system');
        $this->defaultsort = " OrderNum ASC ";
 	}
 	
 	function createIterator() 
 	{
 		return new StateBaseIterator( $this );
 	}

 	function getValidators() {
        return array(
            new StateModelValidator()
        );
    }

    function getObjectClass()
 	{
 		return '';
 	}

	function getDefaultAttributeValue( $attr )
	{
 		switch ( $attr )
 		{
 			case 'ObjectClass':
 				return $this->getObjectClass();
 				
 			case 'ReferenceName':
 				return uniqid('State_');

            case 'IsTerminal':
                $firstState = $this->getRegistry()->Count(
                    array(
                        new FilterAttributePredicate('IsTerminal', 'N')
                    )
                );
                return $firstState > 0 ? 'I' : 'N';

 			default:
 				return parent::getDefaultAttributeValue( $attr ); 
 		}
	}
	
	function getExact( $id )
	{
		if ( is_numeric( $id ) || is_array( $id ) )
		{
			return parent::getExact($id);
		}
		else
		{
			return $this->getByRef('ReferenceName', $id);
		}
	}
	
	function getPage()
	{
		return getSession()->getApplicationUrl($this).'project/workflow/'.get_class($this).'?';
	}

 	function getPageNameObject( $object_id = '' )
	{
		return parent::getPageNameObject().'&entity='.get_class($this);
	}
	
 	function add_parms( $parms )
	{
	    $result = parent::add_parms( $parms );
	    
	    if ( $result > 0 )
	    {
	        // check objects without any state defined
	        $class = getFactory()->getClass($parms['ObjectClass']);
	        
			if ( class_exists($class, false) )
			{
				$object = getFactory()->getObject($class);
				
				$object_it = $object->getByRefArray( array (
				    'State' => 'NULL' 
				));
				
				while ( !$object_it->end() )
				{
					$object->getRegistry()->Store($object_it, array( 
					    'State' => $parms['ReferenceName'] 
					));

					$object_it->moveNext();
				}
			}
	    }
	    
	    return $result;
	}
 	
	function modify_parms( $id, $parms )
	{
		$was_state_it = $this->getExact( $id );
		
		$result = parent::modify_parms( $id, $parms );
		if ( $result < 1 ) return $result;

		$now_state_it = $this->getExact( $id );
		
		if ( $was_state_it->get('ReferenceName') != $now_state_it->get('ReferenceName') ) {
			$class = getFactory()->getClass($this->getObjectClass());
			if ( class_exists($class, false) )
			{
                $this->updateObjectState(
                    $class,
                    $now_state_it->get('ReferenceName'),
                    $was_state_it->get('ReferenceName'),
                    $now_state_it->get('VPD')
                );
			}
		}

		if ( $was_state_it->get('Caption') != $now_state_it->get('Caption') ) {
			$transition_it = getFactory()->getObject('Transition')->getRegistry()->Query(
				array (
					new TransitionStateRelatedPredicate($id)
				)
			);
			while( !$transition_it->end() ) {
				if ( $transition_it->get('Caption') == $was_state_it->get('Caption') ) {
					$transition_it->object->modify_parms($transition_it->getId(),
						array (
							'Caption' => $now_state_it->get('Caption')
						)
					);
				}
				$transition_it->moveNext();
			}
		}

		return $result;
	}

	function delete($object_id, $record_version = '')
    {
        $wasStateIt = $this->getExact($object_id);

        $result = parent::delete($object_id, $record_version);

        $class = getFactory()->getClass($wasStateIt->get('ObjectClass'));
        if ( class_exists($class, false) )
        {
            $stateIt = $this->getAll();
            if ( $stateIt->count() > 0 )
            {
                DAL::Instance()->Query(
                    "UPDATE pm_StateObject SET State = {$stateIt->getId()}, Transition = NULL WHERE State = {$object_id}"
                );

                $this->updateObjectState(
                    $class,
                    $stateIt->get('ReferenceName'),
                    $wasStateIt->get('ReferenceName'),
                    $wasStateIt->get('VPD')
                );
            }
        }

        return $result;
    }

    function updateObjectState( $className, $newState, $wasState, $vpd )
    {
        DAL::Instance()->Query(
            " UPDATE ".getFactory()->getObject($className)->getEntityRefName()." 
                 SET State = '".DAL::Instance()->Escape($newState)."' 
               WHERE State = '".DAL::Instance()->Escape($wasState)."' 
                 AND VPD = '{$vpd}' {$this->getObjectStateUpdateClausePredicate()} "
        );
    }

    function getObjectStateUpdateClausePredicate() {
 	    return "";
    }
}