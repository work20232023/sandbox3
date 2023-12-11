<?php
namespace Devprom\ProjectBundle\Service\Model;
use Devprom\ProjectBundle\Service\Model\ModelService;

class ModelRESTRepresentationService
{
    private $modelService = null;
    private $session = null;

    function __construct( \SessionBase $session, ModelService $modelService ) {
        $this->session = $session;
        $this->modelService = $modelService;
    }

    function getUrlBase() {
        return \EnvironmentSettings::getServerUrl() . $this->session->getApplicationUrl() . 'api/latest/';
    }

    function getGETObjectUrl( \Metaobject $object ) {
        return $this->getUrlBase() . strtolower(get_class($object)) . '/items';
    }

    function getPUTObjectUrl( \Metaobject $object ) {
        $it = $this->getExampleObjectIt($object);
        return $this->getGETObjectUrl( $object ) . '/' . ($it->getId() != '' ? $it->getId() : '0');
    }

    function getApiKey() {
        return \AuthenticationAPIKeyFactory::getAuthKey($this->session->getUserIt());
    }

    function getExample( $object ) {
        return \JsonWrapper::encode(
            $this->modelService->get($object,
                $this->getExampleObjectIt($object)->getId()
            )
        );
    }

    protected function getExampleObjectIt( \Metaobject $object ) {
        return $object->getFirst();
    }
}
