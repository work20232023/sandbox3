<?php
// PHPLOCKITOPT NOENCODE
// PHPLOCKITOPT NOOBFUSCATE

include_once "BusinessRulePredicate.php";

class IssueExactTypeRule extends BusinessRulePredicate
{
 	private $type_name = '';
 	private $type_id = '';
 	private $type_ref = '';
 	
 	function __construct( $type_it = null )
 	{
		if ( $type_it instanceof OrderedIterator ) {
			$this->type_id = $type_it->getId();
			$this->type_ref = $type_it->get('ReferenceName');
			$this->type_name = $type_it->getDisplayName();
		}
		else {
			$this->type_name = $this->getObject()->getDisplayName();
		}
 	}

	public function __sleep() {
		return array('type_name','type_ref','type_id');
	}

 	function getId() {
 		return md5(strtolower(get_class($this)).$this->type_ref);
 	}
 	
 	function getObject() {
 		return getFactory()->getObject('Request');
 	}
 	
 	function getDisplayName() {
 	    $textTemplate = getSession()->IsRDD() ? text(2843) : text(1157);
 		return sprintf(str_replace('%1', $this->type_name, $textTemplate), $this->type_name);
 	}
 	
 	function check( $object_it, $transitionIt ) {
 		return $object_it->get('Type') == $this->type_id;
 	}
}
