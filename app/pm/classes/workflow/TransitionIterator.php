<?php

class TransitionIterator extends OrderedIterator
{
 	var $nondoablereason;

 	function getFullName()
 	{
 		$target_it = $this->getRef('TargetState');
 		return parent::getDisplayName().' > '.$target_it->getDisplayName();
 	}

 	function appliable()
 	{
 		if ( !defined('PERMISSIONS_ENABLED') ) return true;

 		$role_it = getFactory()->getObject('pm_TransitionRole')->getByRef('Transition', $this->getId());
 		if ( $role_it->count() < 1 ) {
 			return $this->checkDefaultAccess();
 		}

 		$role = getFactory()->getObject('pm_ProjectRole');
        $roles = getSession()->getRoles();
 		$role_it = $role_it->count() > 0
            ? $role->getExact($role_it->fieldToArray('ProjectRole'))
            : $role->getEmptyIterator();

        $foundRoles = array_keys($roles);
        $requiredRoles = $role_it->fieldToArray('ReferenceName');
        if ( count($requiredRoles) < 1 ) {
            return $this->checkDefaultAccess();
        }

        if ( $this->get('ProjectRolesLogic') == 'all' ) {
            if ( count(array_intersect($requiredRoles, $foundRoles)) == count($requiredRoles) ) {
                return $this->checkDefaultAccess();
            }
        }
        else {
            if ( count(array_intersect($requiredRoles, $foundRoles)) > 0 ) {
                return $this->checkDefaultAccess();
            }
        }

 		return false;
 	}

 	function doable( $object_it, $rules_it = null )
 	{
 		$this->nondoablereason = '';
        $checkResult = array();

        foreach (getFactory()->getPluginsManager()->getPluginsForSection('pm') as $plugin) {
            $result = $plugin->processTransition($this, $object_it, $this->nondoablereason);
            if (is_bool($result)) {
                return $result;
            }
        }

        if ( !is_object($rules_it) ) {
            $rules_it = WorkflowScheme::Instance()->getTransitionPredicateIt($this);
        }

 		while ( !$rules_it->end() ) {
            $result = $rules_it->check( $object_it, $this );
            $checkResult[] = $result ? 1 : 0;
            if ( !$result ) {
                $reason = $rules_it->getNegativeReason();
                if ( $reason != '' ) {
                    $this->nondoablereason .= $reason.PHP_EOL;
                }
                else {
                    $this->nondoablereason .= sprintf(text(3219), $rules_it->getDisplayName()).PHP_EOL;
                }
            }
            $rules_it->moveNext();
 		}

 		return $this->get('PredicatesLogic') == 'any'
            ? array_sum($checkResult) > 0 || count($checkResult) < 1
            : array_sum($checkResult) == count($checkResult);
 	}

 	function getNonDoableReason()
 	{
 		return $this->nondoablereason;
 	}

 	function checkDefaultAccess()
 	{
		return true;
 	}

    function getUserAlerts()
    {
        $alerts = array();

        $action_it = getFactory()->getObject('TransitionAction')->getRegistry()->Query(
            array (
                new FilterAttributePredicate('Transition', $this->getId()),
                new FilterAttributePredicate('IsNotifyUser', 'Y')
            )
        );
        while( !$action_it->end() ) {
            $alerts[] = $action_it->getActionOnlyName();
            $action_it->moveNext();
        }

        $action_it = getFactory()->getObject('StateAction')->getRegistry()->Query(
            array (
                new FilterAttributePredicate('State', $this->get('TargetState')),
                new FilterAttributePredicate('IsNotifyUser', 'Y')
            )
        );
        while( !$action_it->end() ) {
            $alerts[] = $action_it->getActionOnlyName();
            $action_it->moveNext();
        }

        return array_unique($alerts);
    }
}
