<?php

// exception handling and logging
$handlers = array();

if ( file_exists(DOCUMENT_ROOT.'conf/logger.xml') )
{
	try
	{
	 	Logger::configure(DOCUMENT_ROOT.'conf/logger.xml');
		Logger::initialize();
	 	$handlers[] = new ExceptionHandlerListenerLogger();
	}
	catch(Exception $e)
	{
		error_log('Unable initialize logger: '.$e->getMessage());
	}
}

if ( !defined('SEND_BUG_REPORTS') || SEND_BUG_REPORTS )
{
	$handlers[] = new ExceptionHandlerListenerRaven();
}

core\classes\ExceptionHandler::Instance($handlers);

// profiling
MetricsServer::Instance()->Start();
MetricsClient::Instance()->Start();

// database connection
if ( !DeploymentState::IsInstalled() ) {
     DALDummy::Instance()->Connect( '' );
}
else {
    DALMySQLi::Instance()->Connect(new MySQLConnectionInfo( DB_HOST, DB_NAME, DB_USER, DB_PASS ));
}

if ( EnvironmentSettings::getProxyServer() != '' ) {
    $proxyParms = array(
        'proxy' => 'tcp://'.EnvironmentSettings::getProxyServer(),
        'request_fulluri' => true
    );
    if ( EnvironmentSettings::getProxyAuth() != '' ) {
        $auth = base64_encode(EnvironmentSettings::getProxyAuth());
        $proxyParms['header'] = array(
            "Proxy-Authorization: Basic ".$auth,
            "Authorization: Basic ".$auth,
        );
    }
    stream_context_set_default(
        array(
            'http'=> $proxyParms,
            'https'=> $proxyParms
        )
    );
}

ini_set('session.cookie_httponly', '1');