<?php
include_once SERVER_ROOT_PATH."core/views/BulkFormBase.php";
class BulkFormAdmin extends BulkFormBase
{
 	function getCommandClass()
 	{
		return 'bulkcompleteadmin';
 	}

    function getActionAttributes()
    {
        $attributes = parent::getActionAttributes();

        if ( $this->getObject() instanceof Project && strpos($_REQUEST['operation'], 'BulkDelete') !== false ) {
            $attributes[] = 'IsCanBackup';
        }

        return $attributes;
    }

    function getAttributeType( $attr )
    {
        switch ( $attr )
        {
            case 'IsCanBackup':
                return 'char';
            default:
                return parent::getAttributeType( $attr );
        }
    }

    function getName( $attr )
    {
        switch ( $attr )
        {
            case 'IsCanBackup':
                return text(3621);
            default:
                return parent::getName( $attr );
        }
    }

    function getAttributeValue( $attribute )
    {
        switch ($attribute) {
            case 'IsCanBackup':
                return 'Y';
            default:
                return parent::getAttributeValue($attribute);
        }
    }
}