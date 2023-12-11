<?php
include_once SERVER_ROOT_PATH."cms/classes/ObjectMetadataEntityBuilder.php";
include "persisters/WikiPageDependencyPersister.php";
include "persisters/WikiPageDetailsPersister.php";
include 'persisters/DocumentVersionPersister.php';
include "persisters/WikiPageIsIncludedPersister.php";
include "persisters/WikiPageFeaturePersister.php";
include "persisters/WikiPageFeatureTracesPersister.php";

class WikiPageMetadataBuilder extends ObjectMetadataEntityBuilder 
{
    public function build( ObjectMetadata $metadata )
    {
    	if ( !$metadata->getObject() instanceof WikiPage) return;
    	
    	$object = $metadata->getObject();

        $metadata->setAttributeCaption('Content', translate('Текст'));
        $metadata->setAttributeOrderNum('Content', 30);
		$metadata->setAttributeType('ParentPage', 'REF_'.get_class($object).'Id');
        $metadata->setAttributeVisible('ParentPage');
        $metadata->setAttributeVisible('Content');
		$metadata->addAttributeGroup('Author', 'nonbulk');
		$metadata->addAttributeGroup('Content', 'nonbulk');
		$metadata->setAttributeOrderNum('PageType', 12);
        $metadata->setAttributeVisible('PageType', true);
        $metadata->addAttributeGroup('PageType', 'type');
        $metadata->addAttributeGroup('PageType', 'customattribute-descriptor');

		$metadata->addAttribute('DocumentId', 'REF_'.get_class($object).'Id', $object->getDocumentName(), false);
        $metadata->setAttributeEditable('DocumentId', false);

        $metadata->addAttribute('Modifier', 'REF_UserId', translate('Изменил'), false, true);
        $metadata->setAttributeRequired('Modifier', true);
        $metadata->setAttributeEditable('Modifier', false);

		foreach( array('DocumentId','ParentPage') as $attribute ) {
			$metadata->addAttributeGroup($attribute, 'skip-network');
		}
        foreach( array('ParentPage') as $attribute ) {
            $metadata->addAttributeGroup($attribute, 'skip-chart');
        }

		$metadata->addAttributeGroup('Dependency', 'trace');
		$metadata->setAttributeDescription('Dependency', text(2131));
        $metadata->addAttributeGroup('Dependency', 'trace-reuse');
        $metadata->setAttributeEditable('Dependency', false);
		$metadata->addPersister( new WikiPageDependencyPersister() );
		$metadata->addPersister( new WikiPageDetailsPersister() );

		$metadata->setAttributeEditable('SectionNumber', false);
        $metadata->addAttribute('ChildNumber', 'VARCHAR', text('child.number'), false);
        $metadata->addAttributeGroup('ChildNumber', 'system');
        $metadata->setAttributeEditable('ChildNumber', false);

        $metadata->addAttribute('IncludedIn', 'REF_'.get_class($object).'Id', translate('Включено в'), true);
        $metadata->addAttributeGroup('IncludedIn', 'trace');
        $metadata->addAttributeGroup('IncludedIn', 'trace-reuse');
        $metadata->setAttributeEditable('IncludedIn', false);
        $metadata->addPersister( new WikiPageIsIncludedPersister() );

        $metadata->addAttribute('DocumentVersion', 'VARCHAR', translate('Бейзлайн'), true, true, '', 40);
        $metadata->addAttributeGroup('DocumentVersion', 'display-name');
        $metadata->addAttributeGroup('DocumentVersion', 'bulk');
        $metadata->addPersister( new DocumentVersionPersister() );

        if ( $object instanceof ProjectPage ) {
            $metadata->addAttributeGroup('DocumentVersion', 'system');
            $metadata->setAttributeVisible('DocumentVersion', false);
        }
        else {
            $methodology_it = getSession()->getProjectIt()->getMethodologyIt();
            if( $methodology_it->HasFeatures() && getFactory()->getAccessPolicy()->can_read(getFactory()->getObject('Feature')) )
            {
                $metadata->addAttribute( 'Feature', 'REF_pm_FunctionId', translate('Функции'), true, false);
                $metadata->addPersister( new WikiPageFeaturePersister() );
                $metadata->addAttributeGroup('Feature', 'bulk');
                $metadata->addAttributeGroup('Feature', 'additional');
                $metadata->addAttributeGroup('Feature', 'trace-vertical');

                $metadata->addAttribute( 'FeatureIssues', 'REF_RequestId', text(3010), false, false);
                $metadata->addPersister( new WikiPageFeatureTracesPersister() );
            }
        }

        $metadata->addAttribute('RecentComment', 'WYSIWYG', translate('Комментарий'), false);
        $metadata->addAttributeGroup('RecentComment', 'non-form');

        $system_attributes = array(
            'UserField1',
            'UserField2',
            'UserField3',
            'IsTemplate',
            'IsDraft',
            'ReferenceName',
            'IsArchived',
            'ContentEditor',
            'Includes',
            'ParentPath',
            'IsDocument',
            'IDProject',
            'DataHash'
        );
        foreach( $system_attributes as $attribute ) {
            $metadata->addAttributeGroup($attribute, 'system');
        }
        foreach ( array('Caption','Content','DocumentVersion') as $attribute ) {
            $metadata->addAttributeGroup($attribute, 'tooltip');
        }
        foreach ( array('ParentPage', 'Content', 'DocumentId','SectionNumber') as $attribute ) {
            $metadata->addAttributeGroup($attribute, 'skip-tooltip');
        }
        $metadata->addAttributeGroup('ParentPage', 'hierarchy-parent');

        if ( $metadata->getObject()->getStateClassName() != '' ) {
            $metadata->addAttribute('Workflow', 'TEXT', text(2044), false);
        }
        $metadata->addAttribute('Attachments', 'REF_WikiPageFileId', translate('Приложения'), true);
        $metadata->addAttribute('Tags', 'REF_TagId', translate('Тэги') );
        $metadata->addAttribute('Watchers', 'REF_WatcherId', translate('Наблюдатели'));

        $className = get_class($metadata->getObject());
        $metadata->addAttribute('UsedBy', "REF_{$className}Id", text(2154), true, false, text(2155), 205);
        $metadata->setAttributeEditable('UsedBy', false);

        $metadata->addAttributeGroup('UsedBy', 'trace');
        $metadata->addAttributeGroup('UsedBy', 'trace-reuse');

        foreach( array('Tags', 'Attachments','Watchers',) as $attribute ) {
            $metadata->addAttributeGroup($attribute, 'skip-chart');
        }
        foreach( array('Tags', 'Attachments', 'Watchers', 'Author','DocumentVersion') as $attribute ) {
            $metadata->addAttributeGroup($attribute, 'additional');
            $metadata->setAttributeRequired($attribute, false);
        }
        $metadata->addAttributeGroup('State', 'additional');
        $metadata->setAttributeOrderNum('Author', 400);
	}
}