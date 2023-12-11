<?php
include_once SERVER_ROOT_PATH."pm/methods/DuplicateWebMethod.php";

class DuplicateIssuesWebMethod extends DuplicateWebMethod
{
	private $type_it = null;

	function __construct( $object_it = null, $type_it = null )
	{
		parent::__construct($object_it);
		$link_type = getFactory()->getObject('RequestLinkType');
		if ( is_object($type_it) ) {
		    $this->type_it = $type_it;
        }
		else {
            $this->type_it = $_REQUEST['LinkType'] != '' ? $link_type->getExact($_REQUEST['LinkType']) : $link_type->getEmptyIterator();
            if ( $this->type_it->getId() < 1 ) {
                $this->type_it = $link_type->getByRef('ReferenceName', 'duplicates');
            }
        }
	}

	function getCaption() {
		return text(2694);
	}

	function getMethodName() {
		return parent::getMethodName().':LinkType';
	}

	function getObject() {
		return getFactory()->getObject('Request');
	}
	
	function getReferences()
	{
		$references = [];
		
 	    $request = getFactory()->getObject('pm_ChangeRequest');
 	    $request->addFilter( new FilterInPredicate($this->getObjectIt()->idsToArray()) );
   	    $references[] = $request;
 	    
 	    if ( $this->type_it->get('ReferenceName') == 'duplicates' ) {
	 	    $trace = getFactory()->getObject('pm_ChangeRequestTrace');
			$trace->addFilter( new FilterAttributePredicate('ChangeRequest', $this->getObjectIt()->idsToArray()) );
			$references[] = $trace;
 	    }

		return $references;
	}

    function getAttributesDefaults( $iterator, $attributes = array() )
    {
        if ( count($attributes) < 1 ) {
            $attributes = array_merge(
                ['Caption', 'Priority'],
                \TextUtils::parseItems($this->type_it->get('SyncAttributes'))
            );
        }

        $override = parent::getAttributesDefaults($iterator, $attributes);

        if ( !in_array('Description', $attributes) ) {
            $uid = new ObjectUID();
            $override['Description'] = '{{'.$uid->getObjectUid($iterator).'}}';
        }

        return $override;
    }

 	function duplicate( $project_it, $parms )
 	{
		$context = parent::duplicate( $project_it, $parms );
 	 	$this->linkIssues($context->getIdsMap());
 	    return $context;
 	}

	function linkIssues( $map )
	{
		$request = getFactory()->getObject('pm_ChangeRequest');
		$link = getFactory()->getObject('pm_ChangeRequestLink');

		foreach( $this->getObjectIt()->idsToArray() as $source_id ) {
		    if ( $map[$request->getEntityRefName()][$source_id] > 0 ) {
                $link->add_parms( array(
                    'SourceRequest' => $source_id,
                    'TargetRequest' => $map[$request->getEntityRefName()][$source_id],
                    'LinkType' => $this->type_it->getId()
                ));
            }
		}
	}
}
