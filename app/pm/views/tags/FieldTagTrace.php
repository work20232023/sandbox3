<?php
include_once "TagFormEmbedded.php";

class FieldTagTrace extends FieldForm
{
 	var $anchor = null;
 	var $field = '';
 	
 	function __construct( $anchor, $field )
 	{
 		$this->anchor = $anchor;
 		$this->field = $field;
 		parent::__construct();
 	}

 	function draw( $view = null )
	{
		echo '<div class="'.(!$this->readOnly() ? "attwritable" : "attreadonly").'">';
			$this->drawBody();
		echo '</div>';
	}
	
	function getField()
	{
	    return $this->field;    
	}
	
	function getAnchorIt()
	{
		return $this->anchor;
	}
	
	function getTagObject()
	{
		return null;
	}
	
	function getForm() {
	    return new TagFormEmbedded($this->getTagObject(), $this->getField(), $this->getName());
	}
	
 	function render( $view )
	{
	    if ( $this->readOnly() ) {
            $this->drawReadonly($view);
        }
        else {
            $this->drawBody( $view );
        }
	}
	
	function drawBody( $view = null )
	{
 		$form = $this->getForm();
 			
 		if ( is_object($this->anchor) && !$this->getEditMode() ) $form->setObjectIt( $this->anchor );
 		$form->setReadonly( $this->readOnly() );
 		$form->setTabIndex( $this->getTabIndex() );
 		
 		echo '<div>';
	 		$form->draw( $view );
 		echo '</div>';
	}

	function drawReadonly( $view )
    {
        $tags_url = 'javascript:filterLocation.setup(\'tag=%\',1)';
        $entity_it = $this->getTagObject()->getAll();

        $tagIds = $entity_it->fieldToArray('Tag');
        foreach( $entity_it->fieldToArray('Caption') as $key => $name )
        {
            $name = '<a href="'.preg_replace('/%/', $tagIds[$key], $tags_url).'">'.$name.'</a>';
            $html[] = '<span class="label label-info label-tag">'.$name.'</span>';
        }
        echo join(' ', $html);
    }
}