<?php
include_once "ProjectTemplateSectionsRegistryBuilder.php";

class ProjectTemplateSectionsRegistryBuilderLatest extends ProjectTemplateSectionsRegistryBuilder
{
	private $session = null;
	
	public function __construct( PMSession $session )
	{
		$this->session = $session;
	}
	
    public function build ( ProjectTemplateSectionsRegistry & $registry )
    {
        $attributeValue = getFactory()->getObject('PMCustomAttributeValue');
        $attributeValue->addFilter( new CustomAttributeValueVpdPredicate() );

 		$items = array (
 			getFactory()->getObject('RequestTag'),
			getFactory()->getObject('RequestLink'),
 			getFactory()->getObject('WikiTag'),
 			getFactory()->getObject('TaskTraceTask'),
 			getFactory()->getObject('RequestTraceMilestone'),
 			getFactory()->getObject('Attachment'),
 			getFactory()->getObject('Activity'),
 			getFactory()->getObject('Comment'),
 			getFactory()->getObject('Snapshot'),
 			getFactory()->getObject('SnapshotItem'),
 			getFactory()->getObject('SnapshotItemValue'),
 			getFactory()->getObject('ChangeLogTemplate'),
            getFactory()->getObject('ComponentTraceRequest'),
            $attributeValue
 		);
    	foreach( $items as $object ) {
			$registry->addSectionItem('ProjectArtefacts', $object);
		}
    }
}