<?php
include_once "BusinessActionWorkflow.php";

class BusinessActionResetAttribute extends BusinessActionWorkflow
{
 	function getId() {
 		return '32bea6cf-2e20-4020-89a2-38d36abee248';
 	}
	
	function apply( $object_it )
 	{
        $attribute = $this->getParameters();
        if ( !$object_it->object->hasAttribute($attribute) ) {
            $attribute = $object_it->object->getAttributeByCaption($attribute);
            if ( !$object_it->object->hasAttribute($attribute) ) return;
        }

 	    $object_it->object->modify_parms($object_it->getId(),
 	    		array(
                    $attribute => ''
 	    		)
 	    	);
 		return true;
 	}

 	function getDisplayName() {
 		return text('ba.reset.attribute');
 	}
}