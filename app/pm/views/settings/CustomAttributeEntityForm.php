<?php
include "CustomAttributeEntityField.php";
include "CustomAttributeTypeClassNameField.php";

class CustomAttributeEntityForm extends PMForm
{
 	function getAddCaption()
 	{
		return text(1079);
 	}
 	
 	function getCommandClass()
 	{
		return 'customattributeprocess';
 	}

    function extendModel()
    {
        parent::extendModel();
        $this->getObject()->setAttributeEditable('AttributeType', true);
    }

    function getAttributeType( $attribute )
	{
		switch( $attribute )
		{
		    case 'AttributeType':
		    	return parent::getAttributeType($attribute);
		    	
		    default:
		    	return 'custom';
		}
	}

	function getAttributeClass( $attribute )
	{
		switch ( $attribute )
		{
			default:
				return parent::getAttributeClass( $attribute );
		}
	}
	
	function IsAttributeRequired( $attribute )
	{
		switch( $attribute )
		{
			case 'EntityReferenceName':
			case 'AttributeType':
				return true;
				
			default:
				return false;
		}
	}

	function IsAttributeVisible( $attribute )
	{
		switch( $attribute )
		{
			case 'EntityReferenceName':
			case 'AttributeType':
			case 'AttributeTypeClassName':
				return true;
				
			default:
				return false;
		}
	}

	function getButtonText()
	{
		return translate('Продолжить');
	}

	function getWidth()
	{
		return '100%';
	}

	function IsCentered()
	{
		return false;
	}
	
	function drawCustomAttribute( $attribute, $value, $tab_index, $view )
	{
		switch ( $attribute ) 
		{
			case 'EntityReferenceName':
			    if ( $value == '' ) {
			        $entities = preg_split('/,/', $_REQUEST['customattributeentity']);
			        $value = $entities[0];
			    }
			    
				$this->drawEntities( $value, $tab_index );
				break;
				
			case 'AttributeTypeClassName':
                $field = new CustomAttributeTypeClassNameField($this->getObject());
                $field->setId($attribute);
                $field->setName($attribute);
                $field->setTabIndex($tab_index);
                $field->setNullOption(false);
                $field->draw();
				break;
				
			default:
				parent::drawCustomAttribute( $attribute, $value, $tab_index, $view );
		}
	}
	
 	function drawEntities( $value, $tab_index )
	{
		$field = new CustomAttributeEntityField($this->getObject());

		$default = $this->getAttributeDefault('EntityReferenceName');
		if ( $default == '' ) $default = 'request';
		$field->setId('EntityReferenceName');
		$field->setName('EntityReferenceName');
		$field->setValue($default);
		$field->setNullOption(false);
		$field->draw();
		
		$ref_type_it = getFactory()->getObject('PMCustomAttribute')
                        ->getAttributeObject('AttributeType')
                            ->getByRef('ReferenceName', 'reference');
		
		?>
		<script type="text/javascript">
			$(document).ready( function()
			{
                showAttributeTypeClassName(false);

				window.setTimeout( function() { 
					$('#AttributeTypeText').on("autocompleteselect", function(event,ui)
					{
						if ( !ui.item ) return;
						
						if ( ui.item.label == '<?=$ref_type_it->getDisplayName()?>' ) {
                            showAttributeTypeClassName(true);
						} else {
                            showAttributeTypeClassName(false);
						}
					});
				}, 500);
			});
			function showAttributeTypeClassName(visible) {
			    if ( visible ) {
                    $('#AttributeTypeClassName').show();
                    $('#AttributeTypeClassName').prev('label').show();
                }
			    else {
                    $('#AttributeTypeClassName').hide();
                    $('#AttributeTypeClassName').prev('label').hide();
                }
            }
		</script>
		<?php
	}

	function getRenderParms($view)
    {
        $this->getObject()->resetAttributeGroup('AttributeTypeClassName', 'system');
        return parent::getRenderParms($view); // TODO: Change the autogenerated stub
    }
}