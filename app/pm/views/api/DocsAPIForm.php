<?php
use Devprom\ProjectBundle\Service\Model\ModelRESTRepresentationService;
use Devprom\ProjectBundle\Service\Model\ModelUMLRepresentationService;
use \Devprom\ProjectBundle\Service\Model\ModelService;

class DocsAPIForm extends PMPageForm
{
    function getTemplate() {
        return "pm/" . strtolower(getSession()->getLanguageUid()) . "/DocsAPIForm.php";
    }

    function getRenderParms()
    {
        $className = getFactory()->getClass($_REQUEST['entityId']);
        if ( !class_exists($className) ) $className = 'task';

        $object = getFactory()->getObject($className);
        $modelRep = new ModelRESTRepresentationService(getSession(),
            new ModelService(null, null, null, null, true));

        $fieldExample = new JSONViewerField();
        $fieldExample->setValue($modelRep->getExample($object));

        $keys = array_diff(
            $object->getAttributesOrdered(),
            $object->getAttributesByGroup('system')
        );
        $entitiesIt = $this->getObject()->getAll();

        $attributes = array();
        foreach( $keys as $attribute ) {
            if ( $attribute == 'RecentComment' ) {
                $attributes['comments'] = array(
                    'title' => translate('Комментарии'),
                    'description' => $object->getAttributeDescription($attribute),
                    'editable' => false,
                    'required' => false,
                    'type' => 'REF_CommentId',
                    'reference' => ['title' => translate('Комментарий'), 'id' => 'Comment']
                );
                continue;
            }

            $refArray = array();
            if ( $object->IsReference($attribute) ) {
                $ref = $object->getAttributeObject($attribute);
                $refArray['title'] = $ref->getDisplayName();
                $entitiesIt->moveTo('ReferenceName', strtolower(get_class($ref)));
                if ( $entitiesIt->getId() != '' ) {
                    $refArray['id'] = $entitiesIt->get('ReferenceName');
                }
            }

            $attributes[$attribute] = array(
                'title' => $object->getAttributeUserName($attribute),
                'description' => $object->getAttributeDescription($attribute),
                'editable' => $object->getAttributeEditable($attribute) && $object->IsAttributeStored($attribute),
                'required' => $object->IsAttributeRequired($attribute),
                'type' => $object->getAttributeType($attribute),
                'reference' => $refArray
            );
        }

        uasort($attributes, function($left, $right) {
            return $left['title'] > $right['title'] ? 1 : -1;
        });

        $tableRs = DAL::Instance()->QueryAllRows("SHOW CREATE TABLE {$object->getEntityRefName()}");

        return array_merge(
            parent::getRenderParms(),
            array(
                'api_key' => $modelRep->getApiKey(),
                'get_url' => $modelRep->getGETObjectUrl($object),
                'put_url' => $modelRep->getPUTObjectUrl($object),
                'entity_title' => $object->getDisplayName(),
                'field_example_json' => $fieldExample,
                'attributes' => $attributes,
                'sql_table' => $tableRs[0][1],
                'plant_uml' => \TextUtils::getPlantUMLUrl(
                                    (new ModelUMLRepresentationService(getSession()))
                                        ->getUMLString($object)),
                'object_class' => get_class($object)
            )
        );
    }
}