<?php
include_once SERVER_ROOT_PATH."admin/classes/checkpoints/CheckpointSupportPayed.php";

class UpdateList extends PageList
{
    const RecentUpdateId = 999999990;

	function IsNeedToSelect( ) { return false; }
	
 	function getIterator() 
	{
	    $it = parent::getIterator();

	    $data = file_get_contents(DOCUMENT_ROOT.CheckpointSupportPayed::UPDATES_FILE);
	    if ( $data == '' ) return $it;

	    $data = CheckpointUpdatesAvailable::getNewUpdatesOnly(JsonWrapper::decode($data));
	    if ( count($data) < 1 ) return $it;

	    $rowset = $it->getRowset();
	    foreach( $data as $index => $update_info )
	    {
			if ( $update_info['description'] != '' ) $update_info['description'] = '<br/>'.$update_info['description'];

	        array_unshift($rowset, array(
	            'cms_UpdateId' => self::RecentUpdateId + $index,
	            'Caption' => $update_info['version'],
	            'Description' =>
					(defined('UPDATES_URL')
						? str_replace('%1', UPDATES_URL, text(2065))
						: '').$update_info['description'],
	            'DownloadUrl' => $update_info['download_url']
	        ));
	    }	   

	    return $it->object->createCachedIterator($rowset);
	}

	function extendModel()
    {
        $this->getObject()->setAttributeCaption('RecordCreated', translate('Дата установки'));
        $this->getObject()->setAttributeVisible('RecordCreated', true);
        parent::extendModel();
    }

	function drawCell( $object_it, $attr )
	{
		switch ( $attr )
		{
			case 'RecordCreated':

				echo $object_it->getDateTimeFormat('RecordCreated');
				
				break;
				
			case 'Description':
				
				echo $object_it->getHtml('Description');
				
				break;
	
			default:
			    
				parent::drawCell( $object_it, $attr );
		}
	}

	function IsNeedToDisplay( $attr )
	{
		return $attr == 'Caption' || $attr == 'Description' || $attr == 'RecordCreated';
	}
	
	function getItemActions( $column_name, $object_it )
	{
		$actions = array();

		$module_it = getFactory()->getObject('Module')->getExact('update-upload');
		if ( !getFactory()->getAccessPolicy()->can_read($module_it) ) return $actions;

	    if ( $object_it->getId() >= self::RecentUpdateId ) {
	        $actions = array(
                array( 'name' => translate('Установить'), 'click' => 'javascript: window.location=\'?action=download&parms='.$object_it->get('Caption').'\'' ),
	        );
	    }
    
		$plugins = getFactory()->getPluginsManager();
		$plugins_interceptors = is_object($plugins) ? $plugins->getPluginsForSection(getSession()->getSite()) : array();
		foreach( $plugins_interceptors as $plugin ) {
			$plugin->interceptMethodListGetActions( $this, $actions );
		}
		
		return $actions;
	}

	function getRenderParms()
	{
		$parms = parent::getRenderParms();
		$parms['table_class_name'] .= ' visible-operations';
		return $parms;
	}
}
