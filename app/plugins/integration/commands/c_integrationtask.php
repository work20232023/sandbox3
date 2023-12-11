<?php
include_once SERVER_ROOT_PATH . 'tasks/commands/TaskCommand.php';
include_once SERVER_ROOT_PATH . 'pm/classes/sessions/PMSession.php';
include_once SERVER_ROOT_PATH . 'plugins/integration/classes/IntegrationService.php';

class IntegrationTask extends TaskCommand
{
 	function execute()
	{
		global $session;

		$this->logStart();

		$parameters = $this->getData()->getParameters();
		$itemsToProcess = $parameters['limit'] > 0 ? $parameters['limit'] : 60;

		$queryParms = array (
            new FilterAttributePredicate('IsActive', 'Y'),
            new ProjectActiveVpdPredicate(),
            new EntityProjectPersister()
        );

		$chunk = $this->getChunk();
		if ( count($chunk) > 0 ) {
            $queryParms[] = new FilterInPredicate($chunk);
        }

		$integration_it = getFactory()->getObject('Integration')->getRegistry()->Query($queryParms);
		while( !$integration_it->end() )
		{
            if ( $integration_it->get('Project') == '' ) {
                $integration_it->moveNext();
                continue;
            }
		    $project_it = getFactory()->getObject('Project')->getExact($integration_it->get('Project'));
            if ( $project_it->getId() < 1 ) {
                $integration_it->moveNext();
                continue;
            }

			$session = new \PMSession(
                $project_it,
				new \AuthenticationFactory(
					getFactory()->getObject('User')->createCachedIterator(
						array (
							array (
								'Caption' => $integration_it->getDisplayName()
							)
						)
					)
				)
			);
			// reset all cached data/metadata
			getFactory()->resetCache();
			getFactory()->setAccessPolicy(new AccessPolicy(getFactory()->getCacheService()));
            getFactory()->getEventsManager()->removeNotificator( new \EmailNotificator() );

			$service = new IntegrationService(
			    $integration_it, \Logger::getLogger('Commands'), $parameters['delay'] != '' ? $parameters['delay'] : 0
            );

			$service->setItemsToProcess($itemsToProcess);
			$service->process();

            $maxLogLength = min(filesize($service->getLogFilePath()) - 100, 1 * 1024 * 20);

			$integration_it->object->modify_parms(
				$integration_it->getId(),
				array (
					'Log' => file_get_contents($service->getLogFilePath(), null, null, -$maxLogLength)
				)
			);

			$integration_it->moveNext();
		}

		$this->logFinish();
	}
}
