<?php
include_once SERVER_ROOT_PATH . "pm/methods/FilterStateMethod.php";
include_once SERVER_ROOT_PATH . "pm/methods/WikiFilterActualLinkWebMethod.php";
include "PMWikiList.php";
include "PMWikiChart.php";

class PMWikiTable extends PMPageTable
{
    private $state_object = null;
    private $form = null;
    private $compareto_it = null;
    
 	function __construct( $object, $state_object, $form )
 	{
 	    $this->state_object = $state_object;
 	    
 	    $this->form = $form;

 	    parent::__construct( $object );
 	}

 	function getForm()
 	{
 	    return $this->form;
 	}
 	
	function getStateObject() {
	    return $this->state_object;
	}

	function getDocumentObject() {
        return getFactory()->getObject('WikiDocument');
    }
	
 	function getSortAttributeClause( $field )
	{
		$parts = preg_split('/\./', $field);
		
		if ( $parts[0] == 'DocumentId' ) return new SortDocumentClause();
        if ( $parts[0] == 'SectionNumber' ) {
            return $parts[1] == 'D' ? new SortDocumentDescClause() : new SortDocumentClause();
        }
		
		return parent::getSortAttributeClause( $field );
	}
	
 	function Statable( $object = null )
	{
		if ( is_object($object) )
		{
			return $object->IsStatable();
		}
		
		return false;
	}
	
	function getList( $type = '', $iterator = null )
	{
		switch ( $type )
		{
			case 'chart':
		 		return new PMWikiChart( $this->getObject(), $iterator );
		 	default:
		 		return new PMWikiList( $this->getObject() );
		}
	}
	
	function buildFiltersName()
	{
        return md5($_REQUEST['view'].parent::buildFiltersName());
	}

	function getCommonFilters()
	{
		$filters = array();

		if ( $this->getObject()->IsStatable() ) {
			$filters[] = $this->buildFilterState();
		}
		$filters[] = $this->buildTagsFilter();
		$filters[] = new FilterObjectMethod(
			getFactory()->getObject('WorkerUser'),
            translate($this->getObject()->getAttributeUserName('Author')),
            'author'
		);
        $filters[] = $this->buildFunctionFilter();

        $type_it = $this->getObject()->getTypeIt();
        if ( is_object($type_it) ) {
            $filters[] = $this->buildTypeFilter($type_it);
        }

		return $filters;
	}

    function buildTagsFilter()
    {
        $tag = getFactory()->getObject('WikiTag');
        $tag->addFilter( new WikiTagReferenceFilter($this->getObject()->getReferenceName()) );
 	    $filter = new FilterObjectMethod($tag, translate('Тэги'), 'tag');
        $filter->setIdFieldName('Tag');
        return $filter;
    }
	
	function getFilters()
	{
		$object = $this->getObject();

		$filters = array( $this->buildFilterDocument() );

		$filters[] = $this->buildByDateFilter();
		$filters[] = new WikiFilterActualLinkWebMethod();

        $filters[] = new ViewSubmmitedAfterDateWebMethod();
        $filters[] = new ViewSubmmitedBeforeDateWebMethod();
		$filters[] = new ViewModifiedAfterDateWebMethod();
        $filters[] = new ViewModifiedBeforeDateWebMethod();

		$parent_filter = new FilterReferenceWebMethod($object, translate('Входит в'), 'parent');
		$filters[] = $parent_filter;

		$filter = $this->buildCompareBaselineFilter();
		if ( is_object($filter) ) $filters[] = $filter;

		return array_merge(
			$this->getCommonFilters(),
			$filters,
			parent::getFilters()
		);
	}

	function getCommonPredicates( $values )
    {
        return array (
            new WikiPageFeaturePredicate($values['feature']),
            new PMWikiStageFilter( $values['version'] ),
            new StatePredicate( $values['state'] ),
            new FilterAttributePredicate( 'Author', $values['author'] ),
            new ParentTransitiveFilter( $values['parent'] ),
            new WikiTagFilter( $values['tag'] ),
            new WikiRelatedIssuesPredicate( $_REQUEST['issues'] ),
            $this->buildLinkStateFilter($values),
            new WikiPageBranchFilter($values['branch']),
            new WikiPageBaselineFilter($values['baseline']),
            $this->getTypePredicate($values)
        );
    }

	function getFilterPredicates( $values )
	{
		$predicates = array_merge(
		    $this->getCommonPredicates($values),
            array(
                new WikiRelatedIssuesPredicate( $_REQUEST['issues'] ),
                $this->buildLinkStateFilter($values)
            )
        );
		if ( !in_array($values['bydate'], array('','all','hide')) ) {
			$persister = new WikiPageHistoryPersister();
			$persister->setSinceDate($values['bydate']);
			$this->getObject()->addPersister( $persister );
			$predicates[] = new FilterSubmittedBeforePredicate($values['bydate']);
		}
		return array_merge(parent::getFilterPredicates( $values ), $predicates);
	}

    function getTypePredicate( $values ) {
        return new FilterAttributePredicate( 'PageType', $values['type'] );
    }

	function buildLinkStateFilter( $values ) {
        return new PMWikiLinkedStateFilter( $values['linkstate'] );
    }

	function getNewActions()
	{
		$actions = array();

		$method = new ObjectCreateNewWebMethod($this->getObject());
		if ( !$method->hasAccess() ) return $actions;

		$actions['create'] = array( 
	        'name' => $this->getObject()->getSectionName(),
			'url' => $method->getJSCall(),
			'uid' => 'create' 
		);

		return $actions;
	}
	
	function getExportActions()
	{
	    $actions =
            array_merge(
                array_filter(
                    parent::getExportActions(),
                    function($item) {
                        return !in_array($item['uid'], array('export-excel', 'export-excel-all'));
                    }
                ),
                $this->getForm()->getExportActions( $this->getExportPageIt() )
            );

        $allParms = $parms = array(
            'options' => 'selected'
        );

        $allParms['options'] .= '-extraFields:' . join(':', array(
                'ParentPage',
                'Caption',
                'Content',
                'SectionNumber'
            ));

		$method = new ExcelExportWebMethod();
		$actions[] = array(
			'uid' => 'export-excel-text',
			'name' => 'Excel',
			'url' => $method->url( $this->getCaption(), 'IteratorExportExcel', $allParms)
		);

        $actions[] = array(
            'uid' => 'export-excel-visible',
            'name' => text(2201),
            'url' => $method->url( $this->getCaption(), 'IteratorExportExcel', $parms)
        );

        return $actions;
	}

	function getExportPageIt()
    {
	    return $this->getObject()->getEmptyIterator();
    }
	
	function getActions()
	{
		$actions = array();
		
		$module_it = getFactory()->getObject('Module')->getExact('attachments');
		if ( getFactory()->getAccessPolicy()->can_read($module_it) )
		{
			$item = $module_it->buildMenuItem('class='.get_class($this->getObject()));
			$actions[] = array();
			$actions[] = array(
					'name' => text(1373),
					'url' => $item['url']
			);
		}

		return array_merge($actions, parent::getActions());
	}

	function buildFilterDocument()
	{
	    $docObject = $this->getDocumentObject();
        $document_filter = new FilterObjectMethod( $docObject, $docObject->getDisplayName(),'document' );
        $document_filter->setLazyLoad(true);
        $document_filter->setHasNone(false);
        return $document_filter;
	}

	function buildByDateFilter()
	{
		$date = new FilterDateWebMethod();
		$date->setValueParm( 'bydate' );
		$date->setCaption(text(2122));
		return $date;
	}

	function buildTypeFilter( $type_it )
	{
		$filter = new FilterObjectMethod( $type_it->object, translate('Тип'), 'type' );
		$filter->setIdFieldName( 'ReferenceName' );
		return $filter;
	}

    function buildFunctionFilter() {
 	    $filter = new FilterObjectMethod(getFactory()->getObject('Feature'));
        $filter->setLazyLoad(true);
        return $filter;
    }

    function buildCompareBaselineFilter() {
        $filter = new FilterObjectMethod($this->getBaselineObject(), text(1566), 'compareto');
        $filter->setHasAny(false);
        $filter->setHasAll(false);
        $filter->setType( 'singlevalue' );
        $filter->setIdFieldName('CompareToSnapshotId');
        $filter->setLazyLoad(true);
        return $filter;
    }

    function buildBranchFilter()
    {
        $object = $this->getBaselineObject()->getRegistry()->Query(
            array(
                new FilterAttributePredicate('Type', 'branch')
            )
        );
        return new FilterObjectMethod($object, translate('Ветка'), 'branch');
    }

    function buildBaselineFilter() {
        $filter = new FilterObjectMethod($this->getBaselineObject(), '', 'baseline');
        return $filter;
    }

    function getSortFields()
	{
		$fields = parent::getSortFields();
		$fields[] = 'SectionNumber';
		return $fields;
	}

	function getBaselineObject() {
        return getFactory()->getObject('WikiPageBaseline');
    }

    function addRootTreePredicates( &$predicates, $values )
    {
        if ( $_REQUEST['export'] != '' ) return;
        if ( count(\TextUtils::parseFilterItems($_REQUEST['search'])) > 0 ) return;
        if ( count(\TextUtils::parseFilterItems($values['branch'])) > 0 && $_REQUEST['roots'] == '0' ) return;

        if ( !in_array($_REQUEST['roots'], ['0','']) ) {
            $predicates[] = new PMWikiSourceFilter('-1');
        }
    }

    function addTreePredicates( &$predicates, $values )
    {
        if ( $_REQUEST['export'] != '' ) return;
        if ( count(\TextUtils::parseFilterItems($_REQUEST['search'])) > 0 ) return;
        if ( !array_key_exists('roots', $_REQUEST) ) return;

        $registry = new \WikiPageRegistry($this->getObject());
        $objectIt = $registry->Query(
            array_merge(
                $predicates,
                array(
                    new FilterVpdPredicate()
                )
            )
        );
        if ( $objectIt->count() < 1 ) {
            $predicates = array(
                new FilterInPredicate(array(0))
            );
            return;
        }

        $objectIt = $registry->Query(
            array(
                new FilterInPredicate(join(',',$objectIt->fieldToArray('ParentPath'))),
                $_REQUEST['roots'] == '0'
                    ? new WikiRootFilter()
                    : new FilterAttributePredicate('ParentPage', $_REQUEST['roots']),
                new SortDocumentClause()
            )
        );
        if ( $objectIt->count() < 1 ) {
            $predicates = array(
                new FilterInPredicate(array(0))
            );
            return;
        }

        $predicates = array(
            new FilterInPredicate($objectIt->idsToArray())
        );
    }

    function getCompareToSnapshot( $values )
    {
        if ( is_object($this->compareto_it) ) return $this->compareto_it->copyAll();
        return $this->compareto_it = $this->buildCompareToSnapshot($values);
    }

    function buildCompareToSnapshot($values)
    {
        $documentIt = $this->getObject()->getEmptyIterator();

        $branchIds = \TextUtils::parseIds($values['branch']);
        if ( count($branchIds) > 0 ) {
            $branchIt = $this->getBaselineObject()->getRegistry()->Query(
                array(
                    new FilterAttributePredicate('Type', 'branch'),
                    new FilterInPredicate($branchIds)
                )
            );
            $documentIt = $this->getObject()->getExact($branchIt->fieldToArray('ObjectId'));
        }

        $comparedIds = \TextUtils::parseItems($values['compareto']);
        if ( count($comparedIds) > 0 ) {
            $snapshot = new WikiPageComparableSnapshot($documentIt);
            return $snapshot->getExact($comparedIds);
        }
        return $this->getObject()->getEmptyIterator();
    }

    function getFilterParms()
    {
        return array_merge(
            parent::getFilterParms(),
            array(
                'TraceSourceRequirement',
                'TraceTargetRequirement'
            )
        );
    }

}