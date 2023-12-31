<?php
include_once SERVER_ROOT_PATH."core/methods/WebMethod.php";

class CompareDocumentsWebMethod extends WebMethod
{
	private $object = null;
	
	public function __construct( $object = null )
	{
		$this->object = $object;
	}
	
	function getCaption()
	{
		return text(1713);
	}
	
	function getJSCall( $parms = array() ) {
		return parent::getJSCall( array(
				'class' => get_class($this->object)
		));
	}
	
	function execute_request()
 	{
 		$ids = array_filter(\TextUtils::parseIds($_REQUEST['objects']), function($value) {
 			return $value > 0;
 		});
 		
 		if ( count($ids) != 2 )
 		{
 			echo JsonWrapper::encode(
 					array('message' => text(1714))
 			);
 			
 			return;
 		}
 		
 		$class = getFactory()->getClass($_REQUEST['class']);
 		
 		if ( !class_exists($class) ) return;
 		
 		$document_it = getFactory()->getObject($class)->getExact($ids[0]);

 		$snapshot = new WikiPageComparableSnapshot($document_it);
 		
 		$snapshot_it = $snapshot->getAll();
 		
 		$snapshot_it->moveTo('ObjectId', $ids[1]);
 		
 		if ( $snapshot_it->getId() == '' )
 		{
 			echo JsonWrapper::encode(
 					array('message' => text(1715))
 			);
 			
 			return;
 		}
 		
 		echo $document_it->getViewUrl().'&compareto='.$snapshot_it->getId();
 	}
}