<?php
include_once "TagBase.php";
include "CustomTagIterator.php";
include "predicates/CustomTagFilter.php";
include "persisters/CustomTagDetailsPersister.php";

class CustomTag extends TagBase
{
 	var $object;
 	
 	function __construct() 
 	{
 		$this->object = $this->getObject();
 		parent::__construct('pm_CustomTag');
 		$this->addPersister( new CustomTagDetailsPersister() );
        $this->setAttributeRequired('ObjectClass', true);
        $this->setAttributeDefault('ObjectClass', $this->getObjectClass());
        $this->addPersister( new TagParentPersister() );
        $this->setSortDefault(
            array(
                new TagCaptionSortClause()
            )
        );
 	}

	function createIterator() {
		return new CustomTagIterator($this);
	}
	
	function getObject() {
		return null;
	}
	
	function getObjectClass() {
	    return strtolower(get_class($this->object));
	}
	
	function setObject( $object ) {
		$this->object = $object;
	}
	
	function getGroupKey() {
		return 'ObjectId';
	}
	
 	function getPageNameObject( $object_id = '' ) {
 		return $this->object->getPage().'&tag='.$object_id;
 	}

 	function getByAK( $object_id, $tag_id )
 	{
 		return $this->getByRefArray(
			array( 'ObjectId' => $object_id, 
				   'Tag' => $tag_id,
				   'ObjectClass' => $this->getObjectClass() )
			);
 	}
 	
 	function bindToObject( $object_id, $tag_id )
 	{
 		$this->add_parms(
 			array( 'ObjectId' => $object_id,
				   'Tag' => $tag_id,
				   'ObjectClass' => $this->getObjectClass() )
			);
 	}
}
 