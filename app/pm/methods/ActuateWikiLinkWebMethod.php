<?php

include_once SERVER_ROOT_PATH."core/methods/WebMethod.php";

class ActuateWikiLinkWebMethod extends WebMethod
{
	private $object_it;
	
	private $baseline_it;
	
	function __construct( $object_it = null, $baseline_it = null )
	{
		parent::__construct();
		
		$this->setObjectIt($object_it);
		
		$this->setBaselineIt($baseline_it);
	}
	
	function setObjectIt( $object_it )
	{
		$this->object_it = $object_it;
	}
	
	function getObjectIt()
	{
		return $this->object_it;
	}
	
	function setBaselineIt( $baseline_it )
	{
		$this->baseline_it = $baseline_it;
	}
	
	function getBaselineIt()
	{
		return $this->baseline_it;
	}
	
	function getCaption() 
	{
		if ( is_object($this->baseline_it) )
		{
			return str_replace('%1', $this->baseline_it->getDisplayName(), text(1562));
		} 
		else
		{
			return text(1561);
		}
	}
	
	function getJSCall( $parms = array() )
	{
		return parent::getJSCall( array( 
			'LinkId' => $this->object_it->getId(),
			'LinkClass' => get_class($this->object_it->object),
		    'Baseline' => is_object($this->baseline_it) ? $this->baseline_it->getId() : ''
		));
	}
	
	function execute_request()
 	{
 		$class = getFactory()->getClass($_REQUEST['LinkClass']);
 		
 		if ( !class_exists($class) ) throw new Exception('Unknown class name: '.$_REQUEST['LinkClass']);
 		if ( $_REQUEST['LinkId'] < 1 ) throw new Exception('Trace identifier is missed');
 		
 		$link_it = getFactory()->getObject($class)->getExact($_REQUEST['LinkId']);
        if ( $link_it->getId() < 1 ) throw new Exception('Wrong trace identifier is given: '.$_REQUEST['LinkId']);

 		$this->setObjectIt( $link_it );

 		if ( $_REQUEST['Baseline'] > 0 )
 		{
	 		$baseline_it = getFactory()->getObject('Snapshot')->getExact($_REQUEST['Baseline']);
	 		if ( $baseline_it->getId() < 1 ) throw new Exception('Wrong baseline identifier is given: '.$_REQUEST['Baseline']);
	 		
	 		$this->setBaselineIt( $baseline_it );
 		}

 		$parms = array (
            'IsActual' => 'Y',
            'SourceBaseline' => ''
 		);
 		if ( is_object($baseline_it) ) {
 		    $parms['Baseline'] = $baseline_it->getId();
        }
 		
 		$link_it->object->modify_parms($link_it->getId(), $parms);

 		// check if there are more non-actual pages in the document
        $nonActualCount = getFactory()->getObject('WikiPage')->getRegistryBase()->Count(
            array(
                new PMWikiLinkedStateFilter('nonactual'),
                new FilterAttributePredicate('DocumentId', $link_it->get('TargetDocumentId'))
            )
        );
        if ( $nonActualCount < 1 ) {
            $this->redirect(
                $link_it->getRef('TargetPage')->getUIDUrl()
            );
        }
 	}

     function hasAccess()
     {
         return getFactory()->getAccessPolicy()->can_modify($this->getObjectIt());
     }
}