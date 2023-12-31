<?php
include_once SERVER_ROOT_PATH."pm/methods/CloneWikiPageWebMethod.php";
include_once SERVER_ROOT_PATH."pm/methods/DocNewChildWebMethod.php";
include SERVER_ROOT_PATH."pm/methods/WikiRemoveStyleWebMethod.php";
include_once SERVER_ROOT_PATH."pm/classes/wiki/WikiPageModelExtendedBuilder.php";
include_once SERVER_ROOT_PATH."pm/classes/wiki/WikiPageModelBaselineBuilder.php";
include_once SERVER_ROOT_PATH."pm/classes/comments/CommentStatModelBuilder.php";
include "PMWikiTable.php";
include "PMWikiDocument.php";
include "WikiPageBoard.php";
include "WikiTreeSectionNew.php";
include "WikiDocumentSettingBuilder.php";
include "WikiPageSettingBuilder.php";
include "history/WikiHistoryTable.php";
include "history/WikiVersionTable.php";
include "history/WikiHistorySettingBuilder.php";
include "import/ImportDocumentForm.php";
include "WikiIncludeForm.php";
include "WikiChangeForm.php";

class PMWikiUserPage extends PMPage
{
 	function __construct()
 	{
        if ( in_array($_REQUEST['view'], ['docs','board']) ) {
            getSession()->addBuilder( new CommentStatModelBuilder(['WikiPage']) );
        }

 		parent::__construct();

        if( $_REQUEST['view'] == 'importdoc' )
        {
        }
        elseif ( $this->needDisplayForm() )
        {
            if (  $this->getFormRef() instanceof PMWikiForm ) {
                $sections = $this->getInfoSections();
                array_unshift($sections,
                    new PageSectionAttributes($this->getObject(), 'efforts', translate('Трудозатраты')));
                $this->setInfoSections($sections);

                $object_it = $this->getObjectIt();
                if (is_object($object_it) && $object_it->getId() > 0) {
                    $this->addInfoSection(new PageSectionComments($object_it, $this->getCommentObject()));
                    if ( $object_it->object->getStateClassName() != '' ) {
                        $this->addInfoSection(new StatableLifecycleSection($object_it));
                    }
                    $this->addInfoSection(new PMLastChangesSection ($object_it));
                    $this->addInfoSection(new NetworkSection($object_it));
                    $this->addInfoSection(new SimilarSection($object_it));
                }
            }
        }
        else if ( in_array($_REQUEST['view'],array('docs','list','tree')) ) {
            $table = $this->getTableRef();
            if ( $table instanceof PMWikiDocument ) {
                $this->addInfoSection(new WikiTreeSectionNew($table,$_REQUEST['baseline']));
            }
        }

        getSession()->addBuilder( new WikiDocumentSettingBuilder($this->getObject()) );
        getSession()->addBuilder( new WikiPageSettingBuilder() );
        getSession()->addBuilder( new WikiHistorySettingBuilder($this->getObjectIt()) );
 	}
 	
 	function getStateObject()
 	{
 		return null;
 	}
 	
 	function getTableBase()
 	{
 		return new PMWikiTable($this->getObject(), $this->getStateObject(), $this->getForm());
 	}
 	
 	function getDocumentTableBase( $object )
 	{
 		return new PMWikiDocument($object, $this->getStateObject(), $this->getForm());
 	}

 	function getTable()
 	{
 		switch( $_REQUEST['view'] )
 		{
 			case 'history':
 				return new WikiHistoryTable($this->getObject());

            case 'compare':
                return new WikiVersionTable($this->getObject());

 			case 'docs':
	 	        if ( $_REQUEST['document'] < 1 ) return $this->getTableBase();

            case 'tree':
	 	        return $this->getDocumentTableBase( $this->getObject() );

 			default:
 				return $this->getTableBase();
 		}
 	}
 	
 	function needDisplayForm()
 	{
 		return in_array($_REQUEST['view'], ['import','importdoc']) ? true : parent::needDisplayForm();
 	}
 	
 	function getForm() 
 	{
 	    switch( $_REQUEST['view'] ) {
            case 'importdoc':
                return new ImportDocumentForm($this->getObject());
            default:
                if ( $_REQUEST['revision'] != '' ) return new WikiChangeForm($this->getObject());
                if ( $_REQUEST['Include'] != '' ) return new WikiIncludeForm($this->getObject());
        }
 		return parent::getForm();
 	}

 	function export()
 	{
 		global $_REQUEST;
 		
 		switch ( $_REQUEST['export'] )
 		{
 			case 'tree':
 				echo \JsonWrapper::encode($this->exportWikiTree());
 				break;

 			default:
 				parent::export();
 		}
 	}

 	function exportForm( $object_it ) {
 	    Page::export();
    }

	function getExportPersisters() {
 	    $values = [
            new WikiPageDetailsPersister(),
            new EntityProjectPersister(),
            new CommentStatPersister()
        ];

		return $values;
	}
 	
    function exportWikiTree()
 	{
		$object = $this->getObject();
        $registry = $object->getRegistryBase();
        $rootIds = TextUtils::parseIds($_REQUEST['root']);

        $object_it = count($rootIds) > 0
            ? $registry->Query([ new FilterInPredicate($rootIds) ])
            : $object->getEmptyIterator();

		$open_path = [];
 		if ( $_REQUEST['open'] > 0 ) {
 			$open_it = $registry->Query([ new FilterInPredicate($_REQUEST['open']) ]);
 			$open_path = $open_it->getParentsArray();
 			if ( $object_it->getId() < 1 ) $object_it = $open_it;
 		}
 		else {
 			$open_path[] = $object_it->getId(); 
 		}

 		$json = [];

 		$snapshot_it = $_REQUEST['baseline'] != ''
 				? getFactory()->getObject('Snapshot')->getExact($_REQUEST['baseline'])
 				: getFactory()->getObject('Snapshot')->getEmptyIterator();

 		if ( $snapshot_it->getId() > 0 )
 		{
 			$registry = new WikiPageRegistryVersion($object);
			$registry->setDocumentIt($object_it);
			$registry->setSnapshotIt($snapshot_it);
            $registry->setPersisters(
                array_merge(
                    $registry->getPersisters(),
                    $this->getExportPersisters()
                    )
                );
 			$this->getFormRef()->setReadonly();
 		}
 		else
 		{
 			$registry = $object->getRegistry();
            $registry->setPersisters($this->getExportPersisters());
 		}

 		$filterValues = $this->getTableRef()->getFilterValues();

        $predicates = $this->getTableRef()->getFilterPredicates($filterValues);
        $plugins = getFactory()->getPluginsManager();
        $plugins_interceptors = is_object($plugins) ? $plugins->getPluginsForSection($this->getTableRef()->getSection()) : array();
        foreach( $plugins_interceptors as $plugin ) {
            $plugin->interceptMethodListGetPredicates( $this->getTableRef()->getList(), $predicates, $filterValues );
        }

        if ( $_REQUEST['treeoptions'] != '' ) $filterValues['treeoptions'] = $_REQUEST['treeoptions'];
 		$displayOptions = preg_split('/-/', $filterValues['treeoptions']);

 		$filteredIds = $registry->QueryKeys(
                array_merge(
                    $predicates,
                    [new FilterAttributePredicate('DocumentId', $object_it->fieldToArray('DocumentId'))]
                )
            )->idsToArray();

        while( !$object_it->end() ) {
            $children_it = (new WikiPageRegistry($object, $this->getExportPersisters()))->Query(
                array(
                    new WikiDocumentFilter($object_it),
                    new SortDocumentClause()
                )
            );
            while ( !$children_it->end() ) {
                if ( $children_it->get('DocumentId') < 1 ) {
                    // not existed page (eg. there is no page in the snapshot)
                    $children_it->moveNext();
                    continue;
                }
                $json[] = $this->exportWikiNodeNew(
                    $children_it, $open_path, count($children_it->getParentsArray()), $displayOptions, $filteredIds );
                $children_it->moveNext();
            }
            $object_it->moveNext();
        }

        return \JSONWrapper::buildJSONTree($json, '');
 	}
 	
    function exportWikiNodeNew( $object_it, $open_path, $level, $options, &$filteredIds )
    {
        // display version (revision) number for the root only
        $caption = $object_it->get('ParentPage') == ''
            ? ($object_it->get('DocumentVersion') != '' ? '['.$object_it->get('DocumentVersion').'] ' : '') . $object_it->getTreeDisplayName($options)
            : $object_it->getTreeDisplayName($options);

        $extraClasses = '';
        if ( $object_it->get('TotalCount') > 0 )
        {
            if ( $object_it->get('ContentPresents') == 'Y' ) {
                $extraClasses .= ' folder_page';
            }
            else {
                $extraClasses .= ' folder';
            }
        }
        else {
            $extraClasses .= ' wiki_document';
        }

        if ( !in_array($object_it->getId(), $filteredIds) ) {
            $extraClasses .= ' filtered';
        }

        return array (
            'title' => $caption,
            'active' => $object_it->getId() == array_pop($open_path),
            'folder' => $object_it->get('TotalCount') > 0,
            'key' => $object_it->getId(),
            'expanded' => in_array($object_it->getId(), $open_path) || $level < 2,
            'extraClasses' => $extraClasses,
            'children' => array(),
            'parent' => $object_it->get('ParentPage'),
            'data' => array(
                'project' => $object_it->get('ProjectCodeName')
            )
        );
    }

	function getPageUid()
	{
		switch ( $_REQUEST['view'] )
		{
			case 'docs':
				if ( $_REQUEST['document'] > 0 ) return 'doc-mode';
				break;
		}
		return parent::getPageUid();
	}

    function buildExportIterator( $object, $ids, $iteratorClassName, $queryParms )
    {
        if ( !$object instanceof WikiPage ) {
            return parent::buildExportIterator($object, $ids, $iteratorClassName, $queryParms);
        }

        $exportOptions = preg_split('/-/', $_REQUEST['options']);

        $baselineId = $_REQUEST['baseline'];
        if ( $baselineId == '' ) {
            $baselineOption = array_shift(array_filter($exportOptions, function($item) {
                return strpos($item, 'baseline') !== false;
            }));
            if ( $baselineOption != '' ) {
                list($option, $baselineId) = \TextUtils::parseItems($baselineOption);
            }
        }

        $registry = $object->getRegistry();

        if ( $baselineId != '' )
        {
            $version_it = getFactory()->getObject('Snapshot')->getExact($baselineId);
            if ( $version_it->getId() != '' ) {
                $documentIt = $registry->getObject()->getExact(
                    array_unique(
                        $registry->Query(
                            array(
                                new FilterInPredicate($ids),
                                new FilterVpdPredicate()
                            )
                        )->fieldToArray('DocumentId')
                    )
                );
                $registry = new WikiPageRegistryVersion($registry->getObject());
                $registry->setDocumentIt($documentIt);
                $registry->setSnapshotIt($version_it);

                $queryParms = array_filter($queryParms, function($item) {
                    return !$item instanceof SortAttributeClause;
                });
            }
        }

        return $registry->Query(
            array_merge(
                array(
                    count(array_intersect(array('children','parents'), $exportOptions)) > 0
                        ? new WikiPageHieExportFilter($ids, $exportOptions)
                        : new FilterInPredicate($ids),
                    new SortDocumentClause()
                ),
                $queryParms
            )
        );
    }

    function getWaitFilters( $table, $classes )
    {
        $filters = parent::getWaitFilters($table, $classes);

        if ( $table instanceof PMWikiDocument && $table->getDocumentIt()->getId() > 0 ) {
            $filters[] = new WikiDocumentWaitFilter($table->getDocumentIt()->getId());
        }

        return $filters;
    }

    function getRecentChangedObjectIds( $filters )
    {
        $table = $this->getTableRef();

        if ( $table instanceof WikiHistoryTable ) {
            return (new ObjectRegistrySQL($table->getObject()))->QueryKeys(
                        array_merge(
                            $table->getFilterPredicates($table->getFilterValues()),
                            array (
                                new FilterModifiedSinceSecondsPredicate(5 * 60),
                                new FilterVpdPredicate(),
                                new SortKeyClause('DESC')
                            )
                        )
                    )->idsToArray();
        }

        return parent::getRecentChangedObjectIds( $filters );
    }

    function getDemoDataIt( $object )
    {
        return $object->createCachedIterator(
            array(
                array(
                    'Caption' => translate('Раздел'),
                    'Content' => text(2500),
                    'OrderNum' => '1',
                    'Author' => getSession()->getUserIt()->getId()
                ),
                array(
                    'Caption' => translate('Подраздел'),
                    'Content' => text(2500),
                    'OrderNum' => '1.1',
                    'Author' => getSession()->getUserIt()->getId()
                )
            )
        );
    }
}