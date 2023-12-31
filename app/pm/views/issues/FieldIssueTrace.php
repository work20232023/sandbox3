<?php
include_once SERVER_ROOT_PATH."pm/views/ui/ObjectTraceFormEmbedded.php";

class FieldIssueTrace extends FieldForm
{
 	private $trace = null;
 	private $type = '';
 	
 	function __construct( $task_it, $trace, $type = '' )
 	{
 		$this->object_it = $task_it;
 		$this->trace = $trace;
 		$this->type = $type;
 	}

 	function getObjectIt()
 	{
 		return $this->object_it;
 	}
 	
 	function draw( $view = null )
	{
		echo '<div class="'.(!$this->readOnly() ? "attwritable" : "attreadonly").'">';
			$this->drawBody();
		echo '</div>';
	}
	
 	function getFilters()
 	{
		return array (
            is_object($this->object_it)
                ? new FilterAttributePredicate( 'ChangeRequest', $this->object_it->getId())
                : new FilterEmptyPredicate()
		);
 	}
 	
 	function getForm( & $trace )
	{
		return new ObjectTraceFormEmbedded( $trace, 'ChangeRequest', $this->getName() );
	}
	
 	function render( $view )
	{
	    $this->drawBody( $view );    
	}
	
	function drawBody( $view = null )
	{
		$filters = $this->getFilters();
		
		if ( $this->type != '' ) $filters[] = new FilterAttributePredicate('Type', $this->type); 
		
		foreach( $filters as $filter )
		{
			$this->trace->addFilter($filter);
		}
		
 		$form = $this->getForm($this->trace);
 		
 		$form->setTraceObject( getFactory()->getObject($this->trace->getObjectClass()) );
 		
 		$form->setTraceType( $this->type );
 			
		$object_it = $this->getObjectIt();
		
 		if ( is_object($object_it) )
 		{
 			if ( !$this->getEditMode() ) $form->setObjectIt( $object_it );
            $form->setCreateParameters(
                array(
                    'Request' => $object_it->getId()
                )
            );
 		}
 		
 		$form->setReadonly( $this->readOnly() );
 		
 		$form->setTabIndex( $this->getTabIndex() );
 			
 		echo '<div>';
	 		$form->draw( $view );
 		echo '</div>';
	}
}