<?php
include_once SERVER_ROOT_PATH."cms/classes/model/ObjectModelBuilder.php";

class WorkflowTransitionAttributesModelBuilder extends ObjectModelBuilder 
{
	private $transition_it = null;
	private $attributes = array();
    private $data = array();

	public function __construct( $transition_it, $attributes = array(), $data = array() )
	{
		$this->transition_it = $transition_it;
		$this->attributes = $attributes;
        $this->data = $data;
	}

    protected function hasValueAlready( \Metaobject $object, $attributeIt )
    {
        $validator = new \ModelValidator(
            array_merge(
                $object->getValidators(),
                [ new \ModelValidatorObligatory([$attributeIt->get('ReferenceName')]) ]
            )
        );

        // validate field value
        $message    = $validator->validate( $object, array(
            $attributeIt->get('ReferenceName') => $this->data[$attributeIt->get('ReferenceName')]
        ));

        $skipValueAttributes = array_merge(
            ['Tasks','Fact'],
            $object->getAttributesByGroup('checklist')
        );

        return $this->data[$attributeIt->get('ReferenceName')] != ''
            && $message == ''
            && !in_array($attributeIt->get('ReferenceName'), $skipValueAttributes);
    }

    public function build( Metaobject $object )
    {
    	if ( ! $object instanceof MetaobjectStatable ) return;
 	    if ( $object->getStateClassName() == '' ) return;
        $visibleAttributes = array();
        $skipAttributes = $object->getAttributesByGroup('system');
 	    
 	    foreach( $object->getAttributes() as $attribute => $data ) {
 	    	$object->setAttributeVisible($attribute, false);
 	    }

 	    if ( $this->transition_it->getId() == '' ) return;

        // allow trace attribute be visible in case of filled value
        $this->data = array_diff_key(
            $this->data,
            array_merge(
                array( 'Tasks' => '', 'Fact' => '' ),
                array_flip($object->getAttributesByGroup('trace'))
            )
        );

        // apply attributes settings for the target state and transition
        $attributeSettings = getFactory()->getObject('StateAttribute');
        $attribute_it = $attributeSettings->createCachedIterator(
            array_merge(
                WorkflowScheme::Instance()->getStateAttributeIt(
                    $object, $this->transition_it->get('TargetStateReferenceName'))->getRowset(),
                $attributeSettings->getRegistry()->Query(
                        array(
                            new FilterAttributePredicate('Transition', $this->transition_it->getId()),
                            new FilterBaseVpdPredicate()
                        )
                    )->getRowset()
            )
        );

        while( !$attribute_it->end() )
		{
            if ( in_array($attribute_it->get('ReferenceName'), $skipAttributes) ) {
                $attribute_it->moveNext();
                continue;
            }

            $object->setAttributeRequired(
				$attribute_it->get('ReferenceName'), $attribute_it->get('IsRequired') == 'Y'
			);

            $hasValue = $this->hasValueAlready($object, $attribute_it);
            if ( $hasValue && $attribute_it->get('IsAskForValue') != 'Y' ) {
                $attribute_it->moveNext();
                continue;
            }

            $object->setAttributeVisible(
                $attribute_it->get('ReferenceName'),
                $attribute_it->get('IsAskForValue') == 'Y'
                        || (($attribute_it->get('IsRequired') == 'Y'
                                || $attribute_it->get('IsVisible') == 'Y' && $attribute_it->get('IsReadonly') != 'Y' ) && !$hasValue)
			);

            if ( $object->getAttributeEditable($attribute_it->get('ReferenceName')) ) {
                $object->setAttributeEditable(
                    $attribute_it->get('ReferenceName'), $attribute_it->get('IsReadonly') != 'Y'
                );
            }
            if ( $attribute_it->get('IsVisible') == 'Y' ) {
                $visibleAttributes[] = $attribute_it->get('ReferenceName');
            }
			$attribute_it->moveNext();
		}

		if ( $this->transition_it->get('IsReasonRequired') != TransitionReasonTypeRegistry::None ) {
			$object->addAttribute('TransitionComment', 'WYSIWYG', text(1197), true, true,
                str_replace('%1', getFactory()->getObject('Module')->getExact('dicts-texttemplate')->getUrl(), text(606))
            );
            if ( $this->transition_it->get('IsReasonRequired') == TransitionReasonTypeRegistry::Required ) {
                $object->setAttributeRequired('TransitionComment', true);
            }
            $object->addAttribute('TransitionNotification', 'CHAR', '', true, false);
		}
		
		foreach( $this->attributes as $attribute ) {
			$object->setAttributeVisible($attribute, true);
		}

        foreach( $visibleAttributes as $attribute ) {
            $groups = array_filter($object->getAttributeGroups($attribute), function($value) {
                return !in_array($value, array('trace','additional'));
            });
            if ( is_array($groups) ) $object->setAttributeGroups($attribute, $groups);
        }
    }
}