<?php

include (dirname(__FILE__).'/../common.php'); 

use Devprom\Component\HttpFoundation\DevpromRequest;
use Devprom\Component\HttpKernel\AdminApplicationKernel;

$kernel = new AdminApplicationKernel('prod', false);
$kernel->loadClassCache('classes', '.php.cache');

try
{
	$request = DevpromRequest::createFromGlobals();
	$response = $kernel->handle($request);
	if ( is_object($response) )
	{
		$response->send();
		$kernel->terminate($request, $response);
	}
}
catch( \LogicException $e )
{
}
catch( Symfony\Component\HttpKernel\Exception\NotFoundHttpException $e )
{
	try {
		$message = $e->getMessage().PHP_EOL.$e->getTraceAsString();
		Logger::getLogger('System')->error($message);
	}
	catch( Exception $e ) {
		error_log($message);
	}

	header($_SERVER["SERVER_PROTOCOL"]." 301 Moved Permanently");
	exit(header('Location: /'));
}
