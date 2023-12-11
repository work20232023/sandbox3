<?php

namespace Devprom\ServiceDeskBundle;

use Symfony\Component\HttpKernel\Bundle\Bundle;
use Symfony\Component\Translation\Translator;

include_once SERVER_ROOT_PATH."admin/classes/templates/SystemTemplate.php";

class DevpromServiceDeskBundle extends Bundle
{
    public function boot()
    {
        parent::boot();

        if ( is_dir(\SystemTemplate::getPath().'ru') ) {
            $this->container->get('twig.loader')->prependPath(\SystemTemplate::getPath() . 'ru');
        }
        if ( is_dir(\SystemTemplate::getPath().'en') ) {
            $this->container->get('twig.loader')->prependPath(\SystemTemplate::getPath() . 'en');
        }

        $this->setUpDevpromTranslations();
    }

    public function getParent()
    {
        return "FOSUserBundle";
    }

    protected function setUpDevpromTranslations()
    {
        /** @var Translator $translator */
        $translator = $this->container->get('translator');
        $translator->addResource('php', SERVER_ROOT_PATH . "lang/en/resource.php", "en", "messages");

        // to override branding strings
        $yamls = array(
            'baseTranslations/client.en.yml' => 'client',
            'baseTranslations/emails.en.yml' => 'emails',
            'translations/messages.en.php' => 'messages'
        );
        $translator->addLoader('yaml', new \Symfony\Component\Translation\Loader\YamlFileLoader());
        foreach( array('en','ru') as $language ) {
            foreach( $yamls as $string => $namespace) {
                $fileName = str_replace('.en.',".".$language.".",$string);
                $resourceType = strpos($fileName, '.yml') !== false ? 'yaml' : 'php';

                $filePath = \SystemTemplate::getPath().$language.'/'.basename($fileName);
                if ( file_exists($filePath) ) {
                    $translator->addResource($resourceType, $filePath, $language, $namespace);
                }
                else {
                    $filePath = SERVER_ROOT_PATH."co/bundles/Devprom/ServiceDeskBundle/Resources/".$fileName;
                    if ( file_exists($filePath) ) {
                        $translator->addResource($resourceType, $filePath, $language, $namespace);
                    }
                }
            }
        }

        $en_strings = array (
        		SERVER_ROOT_PATH . "plugins/dobassist/language/en/array.php" => 'client'
        );
        foreach( $en_strings as $string => $namespace) {
        	if ( file_exists($string) ) $translator->addResource('php', $string, "en", $namespace);
        }
        $ru_strings = array (
        		SERVER_ROOT_PATH . "plugins/dobassist/language/ru/array.php" => 'client'
        );
        foreach( $ru_strings as $string => $namespace ) {
        	if ( file_exists($string) ) $translator->addResource('php', $string, "ru", $namespace);
        }
    }
}
