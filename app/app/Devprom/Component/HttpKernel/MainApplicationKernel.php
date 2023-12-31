<?php

namespace Devprom\Component\HttpKernel;

use Symfony\Component\HttpKernel\Kernel;
use Symfony\Component\Config\Loader\LoaderInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpKernel\HttpKernelInterface;

include_once SERVER_ROOT_PATH."co/classes/SessionBuilderCommon.php";

class MainApplicationKernel extends Kernel
{
    public function registerBundles()
    {
        $bundles = array(
            new \Symfony\Bundle\SwiftmailerBundle\SwiftmailerBundle(),
            new \Symfony\Bundle\MonologBundle\MonologBundle(),
            new \Symfony\Bundle\FrameworkBundle\FrameworkBundle(),
            new \Symfony\Bundle\TwigBundle\TwigBundle(),
            new \JMS\SerializerBundle\JMSSerializerBundle(),
            new \FOS\RestBundle\FOSRestBundle(),
            new \Devprom\WelcomeBundle\WelcomeBundle(),
        	new \Devprom\ApplicationBundle\ApplicationBundle(),
            new \Devprom\CommonBundle\CommonBundle(),
            new \Nelmio\CorsBundle\NelmioCorsBundle()
        );

        return $bundles;
    }
    
    public function registerContainerConfiguration(LoaderInterface $loader)
    {
        $loader->load(SERVER_ROOT_PATH . 'co/bundles/Devprom/ApplicationBundle/Resources/config/config.yml');
        $dynamicSettingsFile = SERVER_ROOT_PATH . 'co/bundles/Devprom/ApplicationBundle/Resources/config/settings.yml';
        if (file_exists($dynamicSettingsFile)) $loader->load($dynamicSettingsFile);
    }

    public function getRootDir()
    {
    	return SERVER_ROOT_PATH."co/bundles/Devprom/ApplicationBundle";
    }

    public function getLogDir()
    {
        return defined('SERVER_LOGS_PATH') ? SERVER_LOGS_PATH : dirname($this->getCacheDir()) . '/logs';
    }

    public function getCacheDir()
    {
    	return CACHE_PATH.'/symfony2app';
    }

    public function getCharset()
    {
        return APP_ENCODING;
    }

    function initializeContainer()
    {
        try {
            parent::initializeContainer();
        }
        catch( \Exception $e ) {
            error_log($e->getMessage().PHP_EOL.$e->getTraceAsString());
        }
    }

    public function boot()
    {
        global $session, $model_factory;

        $caching = \CacheEngineFS::Instance();
        $model_factory = new \ModelFactoryExtended(
            \PluginsFactory::Instance(), $caching, 'global', new \AccessPolicy($caching)
        );
        $session = $this->buildSession($caching);

        parent::boot();

        if ( $_REQUEST['isMobile'] == '1' ) {
            exit(header('Location: /mobile'));
        }
    }

    protected function buildSession($caching) {
        return \SessionBuilderCommon::Instance()->openSession(array(), $caching);
    }

    public function handle(Request $request, $type = HttpKernelInterface::MASTER_REQUEST, $catch = true)
    {
        $lock = new \CacheLock();
        return parent::handle($request, $type, $catch);
    }
}
