<?php
include_once SERVER_ROOT_PATH.'pm/views/wiki/editors/WikiEditorBuilder.php';
include_once SERVER_ROOT_PATH.'pm/methods/RevertWikiWebMethod.php';
include_once SERVER_ROOT_PATH . "pm/views/wiki/diff/WikiHtmlDiff.php";

class WikiHistoryList extends ProjectLogList
{
 	var $change_it;
 	
	function retrieve()
	{
		parent::retrieve();

		$object_it = $this->getTable()->getObjectIt();
		$filterValues = $this->getFilterValues();

        $registry = getFactory()->getObject('WikiPageChange')->getRegistry();
        $registry->setLimit(1024);

		$this->change_it = $registry->Query(
			array (
				new FilterAttributePredicate('WikiPage', $object_it->idsToArray()),
				new FilterModifiedBeforePredicate($filterValues['finish']),
				new FilterModifiedAfterPredicate($filterValues['start']),
				new SortAttributeClause('WikiPage'),
				new SortAttributeClause('RecordCreated.D')
			)
		);
	}

    protected function getShorten() {
        return false;
    }

	function getColumnFields()
	{
		$fields = parent::getColumnFields();
 		
		unset($fields[array_search('EntityName', $fields)]);
		unset($fields[array_search('Project', $fields)]);

		return $fields; 
	}
	
	function getGroupFields()
	{
		$fields = parent::getGroupFields();
 		
		unset($fields[array_search('EntityName', $fields)]);
		unset($fields[array_search('Project', $fields)]);

		return $fields; 
	}
	
    function getRecentChangeId( $object_it )
    {
        if ( strpos($object_it->getHtmlDecoded('ObjectUrl'), 'history?object') === false )
        {
            $ids = array();
            $this->change_it->moveTo('WikiPage', $object_it->get('ObjectId'));
            while( $this->change_it->get('WikiPage') == $object_it->get('ObjectId') ) {
                if ( $this->change_it->get('RecordCreated') >= $object_it->get('RecordCreatedMin') && $this->change_it->get('RecordCreated') <= $object_it->get('RecordCreated') ) {
                    $ids[] = $this->change_it->getId();
                }
                $this->change_it->moveNext();
            }
            return min($ids);
        }

        // obsolete way
        $history_url = explode(ChangeLogAggregatePersister::CONTENT_SEPARATOR,$object_it->getHtmlDecoded('ObjectUrl'));
        if ( count($history_url) < 1 ) $history_url = array($object_it->getHtmlDecoded('Content'));

        $ids = array();
        foreach( $history_url as $url ) {
            if ( preg_match('/\&version=([\d]+)/i', $url, $matches) && is_object($this->change_it) ) {
                $ids[] = $matches[1];
            }
        }
        if ( count($ids) < 1 ) return array();
        return min($ids);
    }

	function IsNeedToDisplayOperations( ) { return true; }
	
	function getActions( $object_it ) 
	{
		$actions = array();
		if ( !is_object($this->change_it) ) return $actions;

        $revisionBeforeChanges = $this->getRecentChangeId( $object_it );
		if ( $revisionBeforeChanges < 1 ) return $actions;
		
		$page_it = $object_it->getObjectIt();

		$method = new ObjectModifyWebMethod($page_it);
        $method->setObjectUrl($method->getObjectUrl() . '&revision=' . $revisionBeforeChanges);
		$actions[] = array( 
			'name' => text(1847),
			'url' => $method->getJSCall()
		);
		
		$method = new RevertWikiWebMethod();
		if ( getFactory()->getAccessPolicy()->can_modify($page_it) )
		{
			$actions[] = array();
			$actions[] = array(
				'name' => translate('Отменить'),
				'url' => $method->url( $page_it, $object_it, $revisionBeforeChanges )
			);
		}
		
		return $actions;
	}
}
 