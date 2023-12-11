<?php
include "TaskTypeIterator.php";
include "predicates/TaskTypeBaseIterationRelatedPredicate.php";
include "predicates/TaskTypeFixBugPredicate.php";
include "predicates/TaskTypeNonBugFixPredicate.php";
include "predicates/TaskTypeBaseCategoryPredicate.php";
include "predicates/TaskTypeStateRelatedPredicate.php";

class TaskType extends MetaobjectCacheable 
{
 	function __construct() 
 	{
		parent::__construct('pm_TaskType');
		$this->setSortDefault(new SortAttributeClause('Caption'));
 	}

    function createIterator() {
		return new TaskTypeIterator($this);
	}
	
	function getPage() {
	    return getSession()->getApplicationUrl($this).'project/dicts/TaskType?';
	}

	function getDefaultAttributeValue( $attr )
	{
		switch ( $attr ) {
			case 'ReferenceName':
				return uniqid('TaskType_');
			default:
				return parent::getDefaultAttributeValue( $attr );
		}
	}

	function add_parms( $parms )
	{
		if ( $parms['ReferenceName'] == '' && $parms['ParentTaskType'] > 0 ) {
			$base_it = getFactory()->getObject('TaskTypeBase')->getExact($parms['ParentTaskType']);
			$parms['ReferenceName'] = $base_it->get('ReferenceName');
		}
		return parent::add_parms( $parms );
	}

	function modify_parms( $id, $parms )
	{
		if ( $parms['ReferenceName'] == '' && $parms['ParentTaskType'] > 0 ) {
			$base_it = getFactory()->getObject('TaskTypeBase')->getExact($parms['ParentTaskType']);
			$parms['ReferenceName'] = $base_it->get('ReferenceName');
		}
		return parent::modify_parms( $id, $parms );
	}
}