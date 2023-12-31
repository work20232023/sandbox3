<?php
include_once "WebMethod.php";

class BulkDeleteWebMethod extends WebMethod
{
    private $object = null;

	function __construct( $object = null ) {
		parent::__construct();
		if ( $object instanceof Metaobject ) {
            $this->object = $object;
        }
	}
	
 	function getCaption() {
 		return translate('Удалить');
 	}

	function getDescription() {
		return text(911); 	
	}

	function url( $object = null, $ids = '' )
	{
		if ( $ids == '' ) $ids = '0';
        if ( !is_object($object) ) $object = $this->object;
 		return "javascript:processBulk('".$this->getCaption()."','?formonly=true&operation=Method:BulkDeleteWebMethod:class=".strtolower(get_class($object))."', ".$ids.", ".$this->getRedirectUrl().")";
	}
	
 	function execute_request()
 	{
		if ( $_REQUEST['class'] == '' || $_REQUEST['ids'] == '' ) throw new Exception('Required parameters missed');
		
		$class = getFactory()->getClass($_REQUEST['class']);
		if ( !class_exists($class) ) throw new Exception('Unknown class name given: '.$class);

        $object = getFactory()->getObject($class);

		$ids = TextUtils::parseIds(trim($_REQUEST['ids'], '-'));
		$parms = array(
		    new \FilterInPredicate($ids),
            new \FilterVpdPredicate()
        );

        if ( count($object->getAttributesByGroup('hierarchy-parent')) > 0 ) {
            $parms[] = new \SortIndexClause();
        }

		$object_it = $object->getRegistry()->Query($parms);

        if ( $object instanceof Project ) {
            if (in_array($_REQUEST['IsCanBackup'], array('Y', 1, 'on', 'On'))) {
                $this->redirect(
                    '/admin/backups.php?action=backupdatabase&parms=project,'. join('-',$object_it->idsToArray())
                );
                return;
            }
        }

		while ( !$object_it->end() )
        {
            $accessPolicy = getFactory()->getAccessPolicy();
		    if ( !$accessPolicy->can_delete($object_it) )
            {
                throw new Exception(
                    $accessPolicy->getReason() != ''
                                ? $accessPolicy->getReason()
                                : text(1927)
                            );
            }

			$object_it->delete();

			\ZipSystem::sendResponse();
			$object_it->moveNext();
		}

		if ( class_exists('UndoWebMethod') ) {
			$method = new UndoWebMethod(ChangeLog::getTransaction());
			$method->setCookie();
		}
	}

	function hasAccess()
    {
        if ( !is_object($this->object) ) return parent::hasAccess();
        return getFactory()->getAccessPolicy()->can_delete($this->object);
    }
}