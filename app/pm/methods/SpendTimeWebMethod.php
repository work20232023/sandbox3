<?php

include_once SERVER_ROOT_PATH.'core/methods/ObjectCreateNewWebMethod.php';

class SpendTimeWebMethod extends ObjectCreateNewWebMethod
{
 	private $object_it;
 	
 	function __construct( $object_it = null )
 	{
 		parent::__construct( 
 				is_object($object_it) && $object_it->object->getEntityRefName() == 'pm_ChangeRequest'
 				? getFactory()->getObject('ActivityRequest') 
 				: getFactory()->getObject('ActivityTask') 
		);

 		$this->setAnchorIt($object_it);
 	}

 	function setAnchorIt( $object_it )
 	{
 		$this->object_it = $object_it;
 	}
 		
	function getCaption() 
	{
		return translate('Списать время');
	}
	
	function hasAccess()
	{
		return getFactory()->getAccessPolicy()->can_create(getFactory()->getObject('pm_Activity'));
	}
	
	function getNewObjectUrl()
	{
		return getSession()->getApplicationUrl($this->object_it).'time/'.
			strtolower(get_class($this->object_it->object)).'/'.$this->object_it->getId();
	}
}
