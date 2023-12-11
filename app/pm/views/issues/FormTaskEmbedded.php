<?php
include_once SERVER_ROOT_PATH."pm/views/tasks/FieldTaskTypeDictionary.php";
include_once SERVER_ROOT_PATH."pm/views/project/FieldParticipantDictionary.php";
 
class FormTaskEmbedded extends PMFormEmbedded
{
 	var $tasks_added;

 	function __construct($object = null, $anchor_field = null, $form_field = '')
 	{
 	    if ( !is_object($object) ) $object = getFactory()->getObject('pm_Task');
        parent::__construct($object, $anchor_field, $form_field);
 	}

    public function extendModel()
    {
        parent::extendModel();

        $object = $this->getObject();

        $builder = new TaskModelExtendedBuilder();
        $builder->build($object);

        $visibleAttributes = array_diff(
                array_intersect(
                    $object->getAttributesVisible(),
                    array (
                        'Caption', 'Planned', 'Assignee', 'TaskType'
                    )
                ),
                $object->getAttributesByGroup('system')
            );

        foreach( array_keys($object->getAttributes()) as $attribute ) {
            $groups = $object->getAttributeGroups($attribute);
            if ( $object->IsAttributeRequired($attribute) ) {
                if ( $object->IsAttributeVisible($attribute) && $this->getFieldValue($attribute) == '' ) {
                    $visibleAttributes[] = $attribute;
                }
                continue;
            }
            if ( $object->getAttributeOrigin($attribute) == 'custom' && !in_array('additional', $groups) ) continue;
            $object->setAttributeVisible( $attribute, false );
            $object->setAttributeRequired( $attribute, false );
        }

        $model_builder = new WorkflowStateAttributesModelBuilder(
            \WorkflowScheme::Instance()->getStateIt($object), $visibleAttributes
        );
        $model_builder->build($object);

        $object->setAttributeRequired( 'OrderNum', true );
    }

 	function processAdded( $object_it ){
        $this->tasks_added[] = $object_it->getId();
 	}

 	function getAddedTasks() {
 	    return $this->tasks_added;
    }
 	
 	function getFieldValue( $attr )
 	{
 		switch( $attr )
 		{
            case 'Release':
            case 'State':
            case 'Author':
                return parent::getFieldValue( $attr );
 			default:
                 if ( is_object($this->getObjectIt()) ) {
                     return $this->getObjectIt()->get($attr);
                 }
 				return parent::getFieldValue( $attr );
 		}
 	}

    function IsAttributeObject( $attr ) {
        switch ($attr) {
            case 'Planned':
                return true;
            default:
                return parent::IsAttributeObject( $attr );
        }
    }

	function createField( $attr )
	{
		switch ( $attr )
		{
			case 'TaskType':
				$tasktype = $this->getAttributeObject( $attr ); 
				$tasktype->addFilter( new FilterBaseVpdPredicate() );
				
				return new FieldTaskTypeDictionary( $tasktype );

			case 'Assignee':
				return new FieldParticipantDictionary( $this->getFieldValue('Release') );

            case 'Planned':
                return new FieldHours();

            default:
				return parent::createField( $attr );			
		}
	}
}
