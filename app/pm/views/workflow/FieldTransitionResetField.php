<?php
include "FormTransitionResetFieldEmbedded.php";

class FieldTransitionResetField extends FieldForm
{
 	var $object_it;
 	var $state_it;
 	
 	function __construct ( $object_it ) {
 		$this->object_it = $object_it;
 	}
 	
 	function setStateIt( $state_it ) {
 	    $this->state_it = $state_it;
 	}
 	
 	function render( $view ) {
 	    $this->draw( $view );
 	}
 	
 	function draw( $view = null )
 	{
		$anchor = getFactory()->getObject( 'TransitionResetField' );
		$anchor->setStateIt( $this->state_it );
		
		if ( is_object($this->object_it) ) {
            $anchorIt = $anchor->getRegistry()->Query(
                array(
                    new FilterAttributePredicate('Transition', $this->object_it->getId())
                )
            );
		}
		else {
            $anchorIt = $anchor->getEmptyIterator();
		}

 		echo '<div class="'.(!$this->readOnly() ? "attwritable" : "attreadonly").'">';
	 		$form = new FormTransitionResetFieldEmbedded( $anchorIt, 'Transition' );
	 		$form->setReadonly( $this->readOnly() );
	 		$form->draw( $view );
 		echo '</div>';
 	}
}