<?php

class StatePredicate extends FilterPredicate
{
 	function _predicate( $filter )
 	{
        $object = $this->getObject();
        if ( ! $object instanceof MetaobjectStatable ) return " AND 1 = 1 ";

        $metaStates = array('N','I','Y');
        $states = array_intersect(preg_split('/[-,]/', $filter), $metaStates);
        $statesString = join($states,"','");

        if ( $statesString != "" )
        {
            $stateableClassNames = array(
                $this->getObject()->getStatableClassName()
            );
            if ( $this->getObject()->getStatableClassName() == 'request' ) {
                $stateableClassNames[] = 'issue';
            }
            $stateableClassNamesString = join("','", $stateableClassNames);

            return " AND ({$this->getAlias()}.State, {$this->getAlias()}.VPD) IN (
                       SELECT s.ReferenceName, s.VPD FROM pm_State s 
                        WHERE s.IsTerminal IN ('{$statesString}') 
                          AND s.ObjectClass IN ('{$stateableClassNamesString}') ) ";
        }

 		$states = \WorkflowScheme::Instance()->getNonTerminalStates($object);
        $terminalStatesString = join($object->getTerminalStates(), "','");

		switch ( $filter )
		{
			case 'notresolved':
			case 'notterminal':
                if ( $terminalStatesString == "" ) return " AND 1 = 1 ";
				return " AND IFNULL({$this->getAlias()}.State,'{$states[0]}') NOT IN ('{$terminalStatesString}') ";

			case 'terminal':
                if ( $terminalStatesString == "" ) return " AND 1 = 2 ";
				return " AND IFNULL({$this->getAlias()}.State,'{$states[0]}') IN ('{$terminalStatesString}') ";
				
			default:
				$states = array_filter(preg_split('/[,-]/', $filter), function($state) {
					return preg_match('/[A-Za-z0-9_]/', $state);
				});
                $statesString = join($states,"','");

		 		if ( $statesString != "" ) {
		 			return " AND {$this->getAlias()}.State IN ('{$statesString}')";
		 		}
		 		else {
		 			return " AND 1 = 2 ";
		 		}
		}
 	}
 	
 	function get( $filter )
 	{
 		$instance = new StatePredicate( $filter );
 		return $instance->getPredicate();
 	}
} 