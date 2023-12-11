<?php
namespace Devprom\ProjectBundle\Controller;
use Devprom\CommonBundle\Controller\PageController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\JsonResponse;
use Devprom\ProjectBundle\Service\Network\NetworkService;

class NetworkController extends PageController
{
    public function jsonAction(Request $request)
    {
    	if ( $request->get('classname') == "" ) {
    		throw $this->createNotFoundException('Class name is undefined but required');
    	}
		if ( $request->get('object') == "" ) {
			throw $this->createNotFoundException('Object is undefined but required');
		}

  		$service = new NetworkService(getSession(), $request->get('classname'), $request->get('object'));
    	return new JsonResponse($service->getVisData());
    }

    public function viewAction(Request $request)
    {
        if ( $request->get('classname') == "" ) {
            throw $this->createNotFoundException('Class name is undefined but required');
        }
        if ( $request->get('object') == "" ) {
            throw $this->createNotFoundException('Object is undefined but required');
        }

        return new Response(
            $this->getTemplatingEngine()->render(
                'pm/NetworkView.php',
                array (
                    'id' => md5(microtime().get_class($this)),
                    'networkUrl' => getSession()->getApplicationUrl().'network/'.$request->get('classname').'/'.$request->get('object')
                )
            )
        );
    }
}