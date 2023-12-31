<?php

namespace Devprom\AdministrativeBundle\Controller;

use Devprom\AdministrativeBundle\Controller\BaseController;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\RedirectResponse;

class InfoController extends BaseController
{
    public function indexAction()
    {
    	if ( is_object($response = $this->checkAccess()) ) return $response;
    	if ( defined('SERVER_INFO_HIDDEN') && SERVER_INFO_HIDDEN ) return new RedirectResponse('/admin');
    	
    	ob_start();
		
    	phpinfo();
		
    	$result = ob_get_contents();

    	ob_get_clean();

    	return new Response($result);
    }
}