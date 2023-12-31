<?php

namespace Devprom\AdministrativeBundle\Controller;
use Devprom\AdministrativeBundle\Controller\BaseController;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\RedirectResponse;

class SystemTemplateController extends BaseController
{
    public function indexAction()
    {
    	if ( is_object($response = $this->checkAccess()) ) return $response;
    	
    	include SERVER_ROOT_PATH.'admin/views/templates/SystemTemplatePage.php';
    	return $this->responsePage(new \SystemTemplatePage);
    }
}