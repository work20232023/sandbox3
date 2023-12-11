<?php
include_once SERVER_ROOT_PATH."pm/methods/DuplicateIssuesWebMethod.php";

class RequestFormDuplicate extends RequestForm
{
	private $source_it = null;
	private $duplicateMethod = null;
    private $linkTypeIt = null;
    private $defaults = array();

	public function __construct( $object )
	{
        $this->source_it = (new Metaobject('pm_ChangeRequest'))->getExact($_REQUEST['Request']);
        $this->linkTypeIt = getFactory()->getObject('RequestLinkType')->getByRef('ReferenceName', 'implemented');
		parent::__construct($object);
	}
	
	public function extendModel()
	{
		parent::extendModel();
		
		$object = $this->getObject();
		$object->addAttribute('LinkType', 'REF_RequestLinkTypeId', translate('Тип связи'), true, false, '', 1);

		$this->duplicateMethod = new DuplicateIssuesWebMethod($this->source_it);
        $this->defaults =
            $this->duplicateMethod->getAttributesDefaults(
                $this->source_it,
                array_merge(
                    array('Caption', 'Priority'),
                    \TextUtils::parseItems($this->linkTypeIt->get('SyncAttributes'))
                )
            );
	}
	
	function getFieldValue( $attribute )
	{
		switch( $attribute ) {
			case 'LinkType':
				return $this->linkTypeIt->getId();

            case 'Type':
                if ( $_REQUEST['Project'] > 0 ) {
                    $typeIt = getFactory()->getObject('RequestType')
                        ->getByRef('ReferenceName', $this->source_it->getRef('Type')->get('ReferenceName'));
                    return $typeIt->getId();
                }
                return '';

            case 'Project':
                return parent::getFieldValue( $attribute );

			default:
                if ( array_key_exists($attribute, $this->defaults) ) {
                    return $this->defaults[$attribute];
                }
                return parent::getFieldValue( $attribute );
		}
	}

	function getSourceIt()
	{
        $result = array();
	    if ( $_REQUEST['Request'] != '' ) {
            $result[] = array($this->source_it, 'Description');
		}
		return array_merge(parent::getSourceIt(), $result);
	}

    function process()
	{
		if ( $this->getAction() != 'add' ) return parent::process();
		if ( $this->source_it->getId() == '' ) return parent::process();

		try {
            if ( !$this->persist() ) return false;
            $this->duplicateMethod->linkIssues(
                array(
                    'pm_ChangeRequest' => array (
                        $this->source_it->getId() => $this->getObjectIt()->getId()
                    )
                )
            );
            $this->redirectOnAdded($this->getObjectIt());
			return true;
		}
		catch( Exception $e ) {
			$this->setRequiredAttributesWarning();
			$this->setWarningMessage($e->getMessage());
			$this->edit('');
			return false;
		}
	}
}