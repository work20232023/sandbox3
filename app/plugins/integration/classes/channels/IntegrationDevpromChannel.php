<?php
use Devprom\ProjectBundle\Service\Model\ModelService;

class IntegrationDevpromChannel extends IntegrationChannel
{
    public function __construct($object_it, $logger)
    {
        parent::__construct($object_it, $logger);
        $this->model = new ModelService(
            new \ModelValidator(
                array (
                    new \ModelValidatorObligatory(),
                    new \ModelValidatorTypes()
                )
            ),
            new \ModelDataTypeMapper(),
            array(),
            null,
            true
        );
        $this->model->setSkipFields(array('VPD','RecordVersion'));
        $this->issueClassName = getSession()->IsRDD() ? 'Increment' : 'Request';
    }

    public function getKeyField() {
        return 'Id';
    }

    function getTimestamp() {
        return SystemDateTime::date();
    }

    public function getItems( $timestamp, $limit )
    {
        $registry = new \ChangeLogGranularityRegistry();
        $registry->setGranularity(\ChangeLogGranularityRegistry::HOUR);
        $registry->setLimit($limit);

        if ( $timestamp == '' ) {
            $timestamp = strftime('%Y-%m-%d %H:%M:%S', strtotime('-1 day', strtotime($this->getTimestamp())));
        }
        $this->getLogger()->info('Looking for changes since '.$timestamp);

        $registry->setObject(new \ChangeLog());
        $log_it = $registry->Query(
            array (
                new FilterVpdPredicate(),
                new ChangeLogStartServerFilter($timestamp),
                new \SortAttributeClause('ObjectChangeLogId.A')
            )
        );

        $connectorName = $this->getObjectIt()->getDisplayName();
        $mapping = $this->getMapping();
        $attachment = getFactory()->getObject('Attachment');
        $requestLink = getFactory()->getObject('RequestLink');

        $items = array();
        $lastTimestamp = '';
        while( !$log_it->end() )
        {
            $class = getFactory()->getClass($log_it->get('ClassName'));
            if ( !class_exists($class) || $class == 'metaobject' ) {
                $log_it->moveNext();
                continue;
            }

            $object = getFactory()->getObject($class);
            $class = get_class($object);
            if ( !is_array($mapping[$class]) ) {
                $log_it->moveNext();
                continue;
            }

            if ( $log_it->get('ChangeKind') != 'deleted' ) {
                $object_it = $object->getExact($log_it->get('ObjectId'));
                if ( $object_it->getId() == '' ) {
                    // skip non-existent item
                    $log_it->moveNext();
                    continue;
                }
            }

            if ( $log_it->get('Author') == $connectorName ) {
                // skip item created by the connector
                $log_it->moveNext();
                continue;
            }

            $key = $class.$log_it->get('ObjectId');

            if ( $log_it->get('ChangeKind') == 'commented' ) {
                preg_match('/O-(\d+)/', $log_it->get('Content'), $matches);
                $items[$key.'Comment'] = array (
                    'class' => get_class(getFactory()->getObject($class)).'Comment',
                    'id' => $matches[1],
                    'action' => 'add',
                    'parentId' => $log_it->get('ObjectId'),
                    'author' => $log_it->getRef('SystemUser')->get('Email')
                );
                $log_it->moveNext();
                continue;
            }

            if ( !array_key_exists($key, $items) ) {
                $items[$key] = array (
                    'class' => $class,
                    'id' => $log_it->get('ObjectId'),
                    'action' => $log_it->get('ChangeKind') == 'deleted'
                        ? 'delete'
                        : ($log_it->get('ChangeKind') == 'added' ? 'add' : 'update'),
                    'attributes' => preg_split('/,/',$log_it->get('Attributes')),
                    'author' => $log_it->getRef('SystemUser')->get('Email')
                );
            }

            if ( $items[$key]['id'] < 1 ) {
                $log_it->moveNext();
                continue;
            }

            $attachment_it = $attachment->getRegistry()->Query(
                array (
                    new FilterAttributePredicate('ObjectId', $items[$key]['id']),
                    new FilterAttributePredicate('ObjectClass', strtolower($items[$key]['class'])),
                    new FilterModifiedAfterPredicate($timestamp)
                )
            );
            while( !$attachment_it->end() ) {
                $items[] = array (
                    'class' => $items[$key]['class'].'Attachment',
                    'id' => $attachment_it->getId(),
                    'parentId' => $attachment_it->get('ObjectId')
                );
                $attachment_it->moveNext();
            }

            if ( $class == 'Request' ) {
                $link_it = $requestLink->getRegistry()->Query(
                    array (
                        new FilterAttributePredicate('SourceRequest', $items[$key]['id']),
                        new FilterModifiedAfterPredicate($timestamp)
                    )
                );
                while( !$link_it->end() ) {
                    $items[] = array (
                        'class' => 'RequestLink',
                        'id' => $link_it->getId(),
                        'parentId' => $link_it->get('SourceRequest')
                    );
                    $link_it->moveNext();
                }
            }

            $lastTimestamp = $log_it->get('RecordCreated');
            $log_it->moveNext();
        }

        $activityIt = getFactory()->getObject('Activity')->getRegistry()->Query(
            array (
                new FilterVpdPredicate(),
                new FilterModifiedAfterPredicate($timestamp)
            )
        );
        while( !$activityIt->end() ) {
            $items[] = array (
                'class' => 'Activity',
                'id' => $activityIt->getId(),
                'parentId' => $activityIt->get('Issue') != ''
                                    ? $activityIt->get('Issue') : $activityIt->get('Task')
            );
            $activityIt->moveNext();
        }

        return array($items, $lastTimestamp);
    }

    public function readItem($mapping, $class, $id, $parms = array())
    {
        try {
            return $this->model->get($class, $id, $this->getWysiwygMode());
        }
        catch (\Exception $e) {
            $this->getLogger()->error($e->getMessage().PHP_EOL.$e->getTraceAsString());
            return array (
                'Id' => $id
            );
        }
    }

    public function writeItem($mapping, $class, $id, $data, $queueItem)
    {
        $this->getLogger()->debug('Devprom writeItem: '.var_export($data,true));

        if ( $class == 'Request' ) $class = $this->issueClassName;

        if ( $class == 'User' && $data['Email'] != '' ) {
            // skip update user if there is one
            $userIt = getFactory()->getObject('User')->getByRef('Email', $data['Email']);
            if ( $userIt->getId() != '' ) {
                $this->getLogger()->info('Skip user exists already: '.$data['Email']);
                return array();
            }
        }

        $result = $this->model->set($class, $data, $id);

        if ( $id == $result['Id'] ) {
            $this->getLogger()->info('Item has been updated: '.$result['Id']);
        }
        else {
            $this->getLogger()->info('Item has been created: '.$result['Id']);
        }

        if ( in_array($class, array('Issue','Request','Task')) )
        {
            $userId = $result['Owner']['Id'] > 0 ? $result['Owner']['Id'] : $result['Assignee']['Id'];
            if ( $userId > 0 && defined('PERMISSIONS_ENABLED') ) {
                // make assignee participant of the project
                $participantObject = getFactory()->getObject('Participant');
                $participantIt = $participantObject->getRegistry()->Query([
                       new FilterAttributePredicate('SystemUser', $userId),
                       new FilterAttributePredicate('Project', getSession()->getProjectIt()->getId())
                   ]);

                if ( $participantIt->getId() == '' ) {
                    $participantIt = $participantObject->getRegistry()->Create(
                        array(
                            'SystemUser' => $userId
                        )
                    );
                    getFactory()->getObject('pm_ParticipantRole')->getRegistry()->Create(
                        array(
                            'Participant' => $participantIt->getId(),
                            'Capacity' => 8,
                            'ProjectRole' =>
                                getFactory()->getObject('ProjectRole')->getRegistry()->Query(
                                        [ new ProjectRoleBaseRoleNamePredicate('lead') ]
                                    )->getId()
                        )
                    );
                }
            }
        }

        return array($result);
    }

    public function deleteItem($mapping, $class, $id)
    {
    }

    public function storeLink( $mapping, $class, $id, $link, $title )
    {
    }

    public function buildDictionaries()
    {
    }

    private $model = null;
    private $issueClassName = '';
}