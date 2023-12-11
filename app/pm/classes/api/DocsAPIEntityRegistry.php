<?php

class DocsAPIEntityRegistry extends ObjectRegistryArray
{
    function createSQLIterator( $parms = array() )
    {
        $hiddenEntities = array(
            'pm_VersionBurndown',
            'pm_TextChanges',
            'pm_ScmFileChanges',
            'pm_CalendarInterval',
            'pm_ProjectUse',
            'pm_IterationMetric',
            'pm_ProjectMetric',
            'pm_VersionMetric',
            'pm_ReleaseMetrics',
            'pm_UserSetting',
            'pm_Predicate',
            'Priority',
            'pm_HelpDeactReason',
            'pm_ProjectTemplate',
            'pm_ProjectLink',
            'pm_IntegrationLink',
            'pm_AttributeValue',
            'entity',
            'ObjectChangeNotification',
            'ObjectEmailNotification',
            'pm_Searchable',
            'WikiPage',
            'pm_ChangeRequest',
            'pm_ProjectSettings',
            'cms_Snapshot',
            'cms_SnapshotItem',
            'cms_SnapshotItemValue',
            'cms_TempFile',
            'co_WebhookLog',
            'co_PHPScriptLog',
            'co_ScheduledJob',
            'cms_PluginModule',
            'cms_Update',
            'EmailQueue',
            'co_AccessRight',
            'cms_Language',
            'pm_Workspace',
            'pm_WorkspaceMenu',
            'pm_WorkspaceMenuItem',
            'cms_Resource'
        );
        $hiddenEntitiesSQL = '"'.join('","', $hiddenEntities).'"';

        $rs = DAL::Instance()->QueryAllRows("
            SELECT t.* FROM entity t
             WHERE t.ReferenceName NOT IN ({$hiddenEntitiesSQL}) ");

        $data = array();
        foreach( $rs as $row ) {
            $object = getFactory()->getObject($row['ReferenceName']);
            $id = strtolower(get_class($object));
            $data[$id] = array(
                'entityId' => $id,
                'ReferenceName' => $id,
                'Caption' => $object->getDisplayName()
            );
        }

        $objectIt = (new \ConfigurableObject())->getAll();
        while( !$objectIt->end() ) {
            if ( !array_key_exists($objectIt->get('ReferenceName'), $data) ) {
                $data[$objectIt->getId()] = array(
                    'entityId' => $objectIt->getId(),
                    'ReferenceName' => $objectIt->getId(),
                    'Caption' => $objectIt->get('Caption')
                );
            }
            $objectIt->moveNext();
        }

        return $this->createIterator(array_values($data));
    }
}