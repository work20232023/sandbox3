<?php
include_once SERVER_ROOT_PATH."pm/classes/project/CloneLogic.php";

abstract class EntityModifyProjectTrigger extends SystemTriggersBase
{
    abstract protected function checkEntity( $object_it );
    abstract static function getObjectReferences( $object_it );

    function process( $object_it, $kind, $content = array(), $visibility = 1)
    {
        if ( $kind != TRIGGER_ACTION_MODIFY ) return;
        if ( !$this->checkEntity($object_it) ) return;
        $data = $this->getRecordData();

        if ( array_key_exists('Project', $content) ) {
            $project_it = getFactory()->getObject('Project')->getExact($content['Project']);
            if ( $project_it->get('VPD') == $object_it->get('VPD') ) return;
        }
        else {
            if ( !array_key_exists('Project', $data) ) return;
            if ( $data['Project'] == $object_it->get('Project') ) return;
            $project_it = getFactory()->getObject('Project')->getExact($data['Project']);
        }

        $references = $this->getObjectReferences($object_it);
        if ( !is_array($references) ) return;
        $references = array_merge($references, $this->getSnapshotReferences($object_it));

        $this->moveEntity( $object_it, $project_it, $references, $data );
    }

    protected function getSnapshotReferences( $objectIt )
    {
        $references = array();

        $snapshotIt = getFactory()->getObject('cms_Snapshot')->getRegistry()->Query(
            [
                new FilterAttributePredicate('ObjectClass', get_class($objectIt->object)),
                new FilterAttributePredicate('ObjectId', $objectIt->getId())
            ]
        );
        $references[] = $snapshotIt;

        $ids = $snapshotIt->fieldToArray('cms_SnapshotId');
        if ( count($ids) > 0 ) {
            $itemIt = getFactory()->getObject('cms_SnapshotItem')->getRegistry()->Query(
                [new FilterAttributePredicate('Snapshot', $ids)]
            );
            $references[] = $itemIt;

            $ids = $itemIt->fieldToArray('cms_SnapshotItemId');
            if ( count($ids) > 0 ) {
                $references[] = getFactory()->getObject('cms_SnapshotItemValue')->getRegistry()->Query(
                    [new FilterAttributePredicate('SnapshotItem', $ids)]
                );
            }
        }

        return $references;
    }

    protected function moveEntity( & $object_it, & $target_it, & $references, $content )
    {
        global $session;

        $wasProjectIt = getSession()->getProjectIt();
        $this->sourceProjectProcess = $wasProjectIt->get('Tools');

        $session = new PMSession($target_it);

        foreach( $references as $referenceIt ) {
            $referenceIt->moveFirst();
            $referenceIt->object->removeNotificator('ChangeLogNotificator');
            $referenceIt->object->removeNotificator('EmailNotificator');
            $this->setProject($referenceIt, $target_it, $content);
        }

        $this->updateChangeLog( $object_it, $wasProjectIt, $target_it );

        $session = new PMSession($wasProjectIt);
    }

    protected function setProject( $object_it, $target_it, $content )
    {
        $state = new StateBase();

        $storedObject = getFactory()->getObject(get_class($object_it->object));
        $storedObject->removeNotificator('AbstractServicedeskEmailNotificator');

        $methodology = getFactory()->getObject('Methodology');
        $targetEstimationValue = $methodology->getByRef('VPD', $target_it->get('VPD'))->get('RequestEstimationRequired');

        while( !$object_it->end() ) {
            $parms = array (
                'Project' => $target_it->getId(),
                'VPD' => $target_it->get('VPD')
            );
            foreach( array_keys($object_it->object->getAttributes()) as $attribute )
            {
                if ( $object_it->get($attribute) == '' ) {
                    $parms[$attribute] = '';
                    continue;
                }

                if ( in_array($attribute, array('ParentPage','DocumentId')) ) {
                    $ref_it = $object_it->object->getRegistryBase()->Query(
                        array (
                            new FilterInPredicate($object_it->get($attribute))
                        )
                    );
                    if ( $ref_it->getId() == '' ) {
                        if ( $object_it->object instanceof ProjectPage ) {
                            $parms[$attribute] = $object_it->object->getRegistry()->Query(
                                array (
                                    new WikiRootFilter(),
                                    new FilterVpdPredicate($target_it->get('VPD'))
                                )
                            )->getId();
                        }
                        else {
                            $parms[$attribute] = '';
                        }
                    }
                    continue;
                }

                if ( in_array($attribute, array('Estimation','EstimationLeft')) ) {
                    $estimationValue = $methodology->getByRef('VPD', $object_it->get('VPD'))->get('RequestEstimationRequired');
                    if ( $estimationValue != $targetEstimationValue ) {
                        $parms[$attribute] = 'NULL';
                    }
                }

                if ( $attribute == 'Function' ) {
                    $targetFeaturesCount = getFactory()->getObject('Feature')->getRegistry()->Count(
                        array(
                            new FilterVpdPredicate($target_it->get('VPD'))
                        )
                    );
                    if ( $targetFeaturesCount > 0 ) {
                        $parms[$attribute] = 'NULL';
                    }
                }

                if ( $object_it->object->IsReference($attribute) ) {
                    $ref = $object_it->object->getAttributeObject($attribute);
                    if ( $ref->getVpdValue() == '' ) {
                        $parms[$attribute] = $object_it->get($attribute);
                        continue;
                    }
                    $keys = $ref->getAttributesByGroup('alternative-key');
                    if ( count($keys) > 0 ) {
                        $queryParms = array(
                            new FilterVpdPredicate($target_it->get('VPD'))
                        );
                        $refIt = $ref->getRegistryBase()->Query(
                            array(
                                new FilterInPredicate($object_it->get($attribute))
                            )
                        );
                        $useAlternativeKeys = true;
                        foreach( $keys as $key ) {
                            if ( $refIt->get($key) == '' ) {
                                $useAlternativeKeys = false;
                                break;
                            }
                            $queryParms[] = new FilterAttributePredicate($key, $refIt->get($key));
                        }
                        if ( $useAlternativeKeys ) {
                            $ref_it = $ref->getRegistryBase()->Query($queryParms);
                            $parms[$attribute] = $ref_it->getId();
                        }
                    }
                }
            }

            if ( $object_it->object instanceof MetaobjectStatable) {
                $state_it = $state->getRegistry()->Query(
                    array(
                        new StateClassPredicate($object_it->object->getStatableClassName()),
                        new FilterAttributePredicate('ReferenceName', $object_it->get('State')),
                        new FilterVpdPredicate($target_it->get('VPD'))
                    )
                );
                // reset state if there is no such state in the target project
                if ( $state_it->getId() == '' ) {
                    $state_it = $state->getRegistry()->Query(
                        array(
                            new StateClassPredicate($object_it->object->getStatableClassName()),
                            new FilterVpdPredicate($target_it->get('VPD'))
                        )
                    );
                    $parms['State'] = $state_it->get('ReferenceName');
                }
            }

            $storedObject->disableVpd();
            $storedObject->getRegistry()->Store(
                $storedObject->createCachedIterator(array($object_it->getData())),
                $parms
            );

            $object_it->moveNext();
        }
    }

    protected function updateChangeLog( $object_it, $source_it, $target_it )
    {
        // store message the issue has been moved
        $message = str_replace( '%1', $source_it->getDisplayName(),
            str_replace('%2', $target_it->getDisplayName(), text(1122)) );

        $change_parms = array(
            'Caption' => $object_it->getDisplayName(),
            'ObjectId' => $object_it->getId(),
            'EntityName' => $object_it->object->getDisplayName(),
            'ClassName' => strtolower(get_class($object_it->object)),
            'ChangeKind' => 'deleted',
            'Content' => $message,
            'VisibilityLevel' => 1,
            'SystemUser' => getSession()->getUserIt()->getId(),
            'VPD' => $source_it->get('VPD')
        );

        $change = getFactory()->getObject('ObjectChangeLog');
        $change->add_parms( $change_parms );

        // move related changes into target project
        $change_it = $change->getRegistry()->Query(
            array (
                new ChangeLogItemFilter($object_it),
                new FilterAttributePredicate('ChangeKind', 'modified,commented' )
            )
        );
        if ( $change_it->count() > 0 ) {
            DAL::Instance()->Query(
                " UPDATE ObjectChangeLog SET VPD = '{$target_it->get('VPD')}' 
                   WHERE ObjectChangeLogId IN (".join(',',$change_it->idsToArray()).")"
            );
        }

        $change_parms['ChangeKind'] = 'added';
        $change_parms['VPD'] = $target_it->get('VPD');
        $change->add_parms( $change_parms );
    }

    private $sourceProjectProcess = '';
}
 