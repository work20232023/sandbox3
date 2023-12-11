<?php

use Devprom\ProjectBundle\Service\Wiki\WikiBaselineService;

include_once SERVER_ROOT_PATH . 'pm/classes/wiki/converters/WikiImporter.php';

class ImportDocumentForm extends PMPageForm
{
    protected function extendModel()
    {
    	parent::extendModel();

		$visible    = [];
		$object     = $this->getObject();
        $system     = $object->getAttributesByGroup('system');

        $object->setAttributeRequired('Caption', false);

		foreach($object->getAttributes() as $attribute => $info) {
            $object->resetAttributeGroup($attribute, 'additional');

			if (in_array($attribute, $visible) || in_array($attribute, $system) || $object->IsAttributeRequired($attribute)) {
                continue;
            }

            $object->setAttributeVisible($attribute, false);
		}

		if ($_REQUEST['ParentPage'] != '') {
            $object->setAttributeVisible('ParentPage', true);

            $parentPageIt = $object->getExact($_REQUEST['ParentPage']);

            if ($parentPageIt->get('ParentPage') == '') {
                $object->addAttributeGroup('PageType', 'system');
            }
        }

        $object->addAttribute('DocumentFile', 'FILE', translate('Файл'), true, false, text(2218), 1);
        $object->addAttribute('Format', 'VARCHAR', '', false, false);
        $object->addAttribute('Mode', 'VARCHAR', '', false, false);
        $object->addAttribute('ResetStyles', 'CHAR', text(3143), true, false);
        $object->setAttributeDefault('ResetStyles', 'Y');
        $object->addAttribute('IsAttachmentOriginal', 'CHAR', text(3622), true, false);
        $object->setAttributeDefault('IsAttachmentOriginal', 'N');

        if (!in_array('PageType', $system)) {
            $typeIt = $object->getAttributeObject('PageType')->getAll();

            if ($typeIt->count() > 0) {
                $object->setAttributeVisible('PageType', true);
            }
        }
    }

    function createFieldObject($name)
    {
        switch ($name) {
            case 'DocumentVersion':
                $field = new FieldAutoCompleteObject(getFactory()->getObject('Baseline'));
                $field->setAppendable();
                return $field;

            default:
                return parent::createFieldObject($name);
        }
    }

	function process()
	{
		if ( $this->getAction() != 'add' ) return parent::process();

		try {
		    $filePath = $_FILES['DocumentFile']['tmp_name'];
            $fileName = $_FILES['DocumentFile']['name'];

			if ( !is_uploaded_file($filePath) ) {
				throw new Exception(\FileSystem::translateError($_FILES['DocumentFile']['error']));
			}

            $fileContent = file_get_contents($filePath);

            if ( $fileContent == '' ) {
                throw new Exception(text(2486));
            }

			if (!TextUtils::isEmptyString($_REQUEST['ParentPage'])) {
                $parent_it = $this->getObject()->getExact($_REQUEST['ParentPage']);
            }
            else {
                $parent_it = $this->getObject()->getEmptyIterator();
            }

            $options = [
                'PageType'          => $_REQUEST['PageType'],
                'State'             => $_REQUEST['State'],
                'DocumentVersion'   => $_REQUEST['DocumentVersion'],
                'ResetStyles'       => $_REQUEST['ResetStyles'],
                'Mode'              => $_REQUEST['Mode'],
                'Mapping'           => $_REQUEST['Mapping'],
            ];

			$importObject = getFactory()->getObject(get_class($this->getObject()));

			if ( $_REQUEST['Format'] == 'list' ) {
                $builder = new WikiImporterListBuilder($importObject);
            }
            else {
                $builder = new WikiImporterContentBuilder($importObject);
            }

			$importer = new WikiImporter($importObject);
            $importer_it = $importer->getAll();

            if (isset($options['Mode']) && $options['Mode'] === TestingDocsTable::EXEL_IMPORT_MODE) {
                $importer_it->moveTo('EngineClassName', TestingDocsTable::EXEL_IMPORT_MODE);
            }

            while (!$importer_it->end()) {
                $engineClass = $importer_it->get('EngineClassName');

                if (class_exists($engineClass)) {
                    $engine = new $engineClass;
                    $engine->setOptions($options);

                    if ($engine->import($builder, $fileName, $fileContent, $parent_it)) {
                        $documentIt = $engine->getDocumentIt();

                        if ($_REQUEST['DocumentVersion'] != '' ) {
                            $service = new WikiBaselineService(getFactory(), getSession());
                            $service->storeInitialBaseline($documentIt);
                        }

                        if ($_REQUEST['IsAttachmentOriginal']) {
                            $attachment = getFactory()->getObject('WikiPageFile');
                            foreach( $attachment->getAttributesByType('file') as $attribute )
                            {
                                $_FILES[$attribute] = $_FILES['DocumentFile'];

                                $attachment->getRegistry()->Create(
                                    array(
                                        'Caption' => $fileName,
                                        'ObjectClass' => get_class($documentIt->object),
                                        'ObjectId' => $documentIt->getId(),
                                        'WikiPage' => $documentIt->getId()
                                    )
                                );
                            }
                        }

                        $this->redirectOnAdded($documentIt);

                        return true;
                    }
                }

                $importer_it->moveNext();
            }

			throw new Exception(text(2217));
		}
		catch( Exception $e ) {
            \Logger::getLogger('System')->error($e->getMessage() . $e->getTraceAsString());

			$this->setRequiredAttributesWarning();
			$this->setWarningMessage($e->getMessage());
			$this->edit('');
			return false;
		}
	}

	function getCaption()
    {
        return $this->getObject()->getDocumentName();
    }
}
