<?php
include_once "PMSession.php";

class SessionBuilderProject extends SessionBuilder
{
    protected function buildSession(array $parms, $cacheService = null)
    {
        global $session;

        $session = new COSession();

        // specific case when project roles passed via authentication provider (e.g. OpenID)
        $userGroups = $session->getUserIt()->get('Skype');
        if ( $userGroups != '' )
        {
            $doRebuildTheCache = $this->processProjectRoles(
                preg_split('/[,;]\s*/', $userGroups), $session->getUserIt());

            if ( $doRebuildTheCache ) {
                getFactory()->getCacheService()->invalidate();
            }
        }

        $session = $this->newSession($parms['project'], $cacheService);

        // cache context
        $session->getProjectIt()->getMethodologyIt();

        return $session;
    }

    protected function processProjectRoles( $userGroups, $userIt )
    {
        // get roles the user has in projects where participates in
        $currentRoles = [];
        $projectRoleIds = [];
        $doRebuildTheCache = false;

        $participantIt = getFactory()->getObject('Participant')
            ->getByRef('SystemUser', $userIt->getId());

        if ( $participantIt->count() > 0 )
        {
            $projectRoleIds = getFactory()->getObject('ParticipantRole')
                ->getByRef('Participant', $participantIt->idsToArray())
                    ->fieldToArray('ProjectRole');

            $currentRoles = getFactory()->getObject('ProjectRole')
                ->getExact($projectRoleIds)->fieldToArray('ReferenceName');

            // detect roles to be revoked
            $tobeRevokedRoles = array_diff($currentRoles, $userGroups);

            if ( count($tobeRevokedRoles) > 0 ) {
                $roleIds = getFactory()->getObject('ProjectRole')->getRegistry()->Query(
                        array(
                            new FilterAttributePredicate('ReferenceName', $tobeRevokedRoles)
                        )
                    )->idsToArray();
                $participantRoleIt = getFactory()->getObject('ParticipantRole')->getRegistry()->Query(
                        array(
                            new FilterAttributePredicate('ProjectRole', $roleIds),
                            new FilterAttributePredicate('Participant', $participantIt->idsToArray())
                        )
                    );
                while( !$participantRoleIt->end() )
                {
                    $doRebuildTheCache = true;
                    $participantRoleIt->object->delete($participantRoleIt->getId());

                    $leftRolesCount = $participantRoleIt->object->getRegistry()->Count(array(
                        new FilterAttributePredicate('Participant', $participantRoleIt->get('Participant'))
                    ));
                    if ( $leftRolesCount < 1 ) {
                        $participantIt->object->delete($participantRoleIt->get('Participant'));
                    }

                    $participantRoleIt->moveNext();
                }
            }
        }

        // append roles user should be granted to
        $parms = [
            new FilterAttributePredicate('ReferenceName', $userGroups)
        ];
        if ( count($projectRoleIds) > 0 ) {
            $parms[] = new FilterNotInPredicate($projectRoleIds);
        }

        $tobeGrantedRoleIt = getFactory()->getObject('ProjectRole')->getRegistry()->Query($parms);

        while( !$tobeGrantedRoleIt->end() ) {
            $projectIt = getFactory()->getObject('Project')->getByRef('VPD', $tobeGrantedRoleIt->get('VPD'));
            $participantIt = getFactory()->getObject('Participant')->getRegistry()->Query(
                    array(
                        new FilterVpdPredicate($tobeGrantedRoleIt->get('VPD')),
                        new FilterAttributePredicate('SystemUser', $userIt->getId())
                    )
                );
            if( $participantIt->getId() == '' ) {
                $participantIt = getFactory()->getObject('Participant')->getRegistry()->Create(
                        array(
                            'SystemUser' => $userIt->getId(),
                            'Project' => $projectIt->getId(),
                            'VPD' => $projectIt->get('VPD')
                        )
                    );
            }
            getFactory()->getObject('ParticipantRole')->getRegistry()->Create(
                array(
                    'ProjectRole' => $tobeGrantedRoleIt->getId(),
                    'Project' => $projectIt->getId(),
                    'Participant' => $participantIt->getId(),
                    'VPD' => $participantIt->get('VPD')
                )
            );
            $doRebuildTheCache = true;
            $tobeGrantedRoleIt->moveNext();
        }

        return $doRebuildTheCache;
    }

    protected function newSession( $project, $cacheService )
    {
        $cache = new ProjectAccessible();
        $cache_it = $cache->getByRef('CodeName', $project);

        if ( $cache_it->getId() < 1 )
        {
            // build portfolios
            $portfolio_it = getFactory()->getObject('Portfolio')->getAll();
            while( !$portfolio_it->end() )
            {
                if ( !getFactory()->getAccessPolicy()->can_read($portfolio_it) ) {
                    $portfolio_it->moveNext(); continue;
                }
                if ( $project == $portfolio_it->get('CodeName') ) {
                    // build session object for the given portfolio
                    return $portfolio_it->getSession();
                }
                $portfolio_it->moveNext();
            }
            if ( in_array($project, array('my','all')) ) {
                $firstProjectIt = getFactory()->getObject('Project')->getRegistry()->Query(
                    array(
                        new ProjectParticipatePredicate(),
                        new ProjectStatePredicate('active')
                    )
                );
                if ( $firstProjectIt->getId() == '' ) {
                    $portfolio_it->moveTo('CodeName', 'all');
                    if ( $portfolio_it->get('CodeName') == 'all' ) {
                        return $portfolio_it->getSession();
                    }
                }
                return new PMSession($firstProjectIt, null, null, $cacheService);
            }
            else {
                return new PMSession($cache->getEmptyIterator(), null, null, $cacheService);
            }
        }
        else {
            return new PMSession($cache_it, null, null, $cacheService);
        }
    }
}