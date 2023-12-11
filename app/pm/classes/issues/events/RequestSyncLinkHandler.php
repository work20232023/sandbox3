<?php
use Devprom\ProjectBundle\Service\Project\StoreMetricsService;

class RequestSyncLinkHandler extends SystemTriggersBase
{
    function modify($prev_object_it, $object_it)
    {
        if ( !$object_it->object instanceof Request ) return;

        $parms = $this->getRecordData();
        getFactory()->getEventsManager()->removeNotificator($this);

        $registry = $object_it->object->getRegistry();
        $linkedIt = $registry->Query(
            array(
                new RequestLinkTypeSyncAttributesPersister($object_it->getId()),
                new RequestLinkedHasSyncedAttributesFilter($object_it->getId())
            )
        );
        while( !$linkedIt->end() ) {
            $attributes = \TextUtils::parseItems($linkedIt->get('SyncAttributes'));
            $syncAttributes = array_intersect(array_keys($parms), $attributes);
            if ( count($syncAttributes) > 0 ) {
                $syncAttributes = array_flip($syncAttributes);
                foreach( $syncAttributes as $attribute => $value ) {
                    if ( $attribute == 'State' ) {
                        $stateIt = \WorkflowScheme::Instance()->getStateIt($linkedIt);
                        $stateIt->moveTo('ReferenceName', $parms[$attribute]);
                        if ( $stateIt->getId() == '' ) {
                            unset($syncAttributes[$attribute]);
                            continue;
                        }
                    }
                    $syncAttributes[$attribute] = $parms[$attribute];
                }
                $registry->Store($linkedIt, $syncAttributes);
            }
            $linkedIt->moveNext();
        }
    }

    function process( $object_it, $kind, $content = array(), $visibility = 1) {}
}