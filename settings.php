<?php

// PHPLOCKITOPT NOENCODE

// Customer UIN
define('CUSTOMER_UID', '?CUUID');

include('settings_server.php');
include('settings_const.php');

define('SERVER_FILES_PATH', SERVER_ROOT.'/files/');
define('SERVER_BACKUP_PATH', SERVER_ROOT.'/backup/');
define('SERVER_UPDATE_PATH', SERVER_ROOT.'/update/');
define('SERVER_CORPDB_PATH', SERVER_ROOT.'/mysql/data/');
define('SERVER_CORPMYSQL_PATH', SERVER_ROOT.'/mysql/bin/mysql.exe');
define('SERVER_SENDMAIL_PATH', SERVER_ROOT.'/smtp/sendmail.ini');

$level = error_reporting();
        
if ( $level & E_NOTICE || $level & E_DEPRECATED )
{
	error_reporting(E_ERROR & ~E_NOTICE & ~E_STRICT & ~E_DEPRECATED);
}
