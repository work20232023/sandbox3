<?php
namespace Devprom\ProjectBundle\Controller;
use Devprom\CommonBundle\Controller\PageController;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\JsonResponse;
use Devprom\ProjectBundle\Service\TreeGridViewModel\TreeGridService;

include_once SERVER_ROOT_PATH."pm/views/ui/Common.php";
include_once SERVER_ROOT_PATH."pm/views/api/DocsAPIPage.php";

class DocsAPIController extends PageController
{
    public function indexAction(Request $request) {
        return $this->responsePage( new \DocsAPIPage() );
    }
}