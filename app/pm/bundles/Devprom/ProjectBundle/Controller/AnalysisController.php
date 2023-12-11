<?php

namespace Devprom\ProjectBundle\Controller;

use Devprom\CommonBundle\Controller\PageController;
use Devprom\ProjectBundle\Service\Search\SearchService;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

class AnalysisController extends PageController
{
    /** @var SearchService $service */
    protected $service;

    public function __construct()
    {
        $this->service = new SearchService;
    }

    public function affectsAction(Request $request): Response
    {
        $searchClass = $request->get('searchClass');
        $className = $request->get('classname');
        $objectId = (int)$request->get('object');
        $this->validate($className, $objectId);

        $objectIt = $this->service->findSimilar($className, $objectId,
            $searchClass, strtolower($className) == 'projectpage');

        return new Response($this->getTemplatingEngine()->render('pm/SearchResultsView.php', [
            'objectIt' => $objectIt,
        ]));
    }

    public function documentationAction(Request $request): Response
    {
        $className = $request->get('classname');
        $objectId = (int)$request->get('object');
        $this->validate($className, $objectId);

        $helpPageIt = $this->service->findSimilar($className, $objectId, 'HelpPage');
        $projectPageIt = $this->service->findSimilar($className, $objectId, 'ProjectPage', true);

        return new Response($this->getTemplatingEngine()->render('pm/DocumentationSearchResultsView.php', [
            'helpPageIt' => $helpPageIt,
            'projectPageIt' => $projectPageIt,
        ]));
    }

    public function similarAction(Request $request): Response
    {
        $className = $request->get('classname');
        $objectId = (int)$request->get('object');
        $this->validate($className, $objectId);

        $objectIt = $this->service->findSimilar($className, $objectId, $className);

        return new Response($this->getTemplatingEngine()->render('pm/SearchResultsView.php', [
            'objectIt' => $objectIt,
        ]));
    }

    protected function validate(string $className, int $objectId)
    {
        if (mb_strlen($className) === 0) {
            throw $this->createNotFoundException('Class name is undefined but required');
        }

        if ($objectId === 0) {
            throw $this->createNotFoundException('Object is undefined but required');
        }
    }
}
