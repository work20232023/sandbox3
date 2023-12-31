<?php

include dirname(__FILE__).'/../app/bootstrap.php';

include_once SERVER_ROOT_PATH.'core/methods/AutocompleteWebMethod.php';
include_once SERVER_ROOT_PATH.'core/methods/ProcessEmbeddedWebMethod.php';
include_once SERVER_ROOT_PATH.'core/methods/DeleteEmbeddedWebMethod.php';
include_once SERVER_ROOT_PATH.'core/methods/ExcelExportWebMethod.php';
include_once SERVER_ROOT_PATH.'core/methods/BoardExportWebMethod.php';
include_once SERVER_ROOT_PATH.'core/methods/HtmlExportWebMethod.php';
include_once SERVER_ROOT_PATH.'core/methods/PrintPDFExportWebMethod.php';
include_once SERVER_ROOT_PATH.'core/methods/FilterFreezeWebMethod.php';
include_once SERVER_ROOT_PATH.'core/methods/BulkDeleteWebMethod.php';
include_once SERVER_ROOT_PATH."core/methods/DeleteObjectWebMethod.php";
include_once SERVER_ROOT_PATH."core/methods/ModifyAttributeWebMethod.php";
include_once SERVER_ROOT_PATH."core/methods/AutoSaveFieldWebMethod.php";
include_once SERVER_ROOT_PATH."core/methods/FilterObjectMethod.php";
include_once SERVER_ROOT_PATH."core/methods/FilterTextWebMethod.php";
include_once SERVER_ROOT_PATH."admin/methods/BlockUserWebMethod.php";
include_once SERVER_ROOT_PATH."admin/methods/UnBlockUserWebMethod.php";
include_once SERVER_ROOT_PATH."admin/methods/ToggleSystemCheckWebMethod.php";
include_once('methods/c_plugin_methods.php');
include_once('methods/c_project_methods.php');

if ( !getSession()->getUserIt()->IsAdministrator() ) exit(header('Location: /'));
if ( !class_exists($_REQUEST['method'], false) ) throw new Exception('There is no such method');

$method = new $_REQUEST['method'];
 
if ( !is_a($method, 'WebMethod') ) throw new Exception('Unknown method class: '.SanitizeUrl::parseUrl($_REQUEST['method']));

\FeatureTouch::Instance()->touch(strtolower(get_class($method)));
$method->exportHeaders();
$method->execute_request();
