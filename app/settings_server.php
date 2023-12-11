<?php

// PHPLOCKITOPT NOENCODE

// MySQL server connection settings
define('DB_HOST', '?HOST');
define('DB_USER', '?USER');
define('DB_PASS', '?PASS');
define('DB_NAME', '?NAME');
	
// MySQL encryption algorithm
define('MYSQL_ENCRYPTION_ALGORITHM', 'AES'); 

// Server root folder
define('SERVER_ROOT', '?ROOT');

// Authorization options
define('AUTHORIZATION_FACTORY', 'AuthorizationCookiesFactory');

// Visualize application performance metrics
define('METRICS_VISIBLE', false);

// Automatically send bug reports
define('SEND_BUG_REPORTS', true);

// UTC offset of server time
define('DEFAULT_UTC_OFFSET','+00');

// Skip debugging info
define('ALLOW_DEBUG',false);

// External utilities
define('ZIP_HELP_COMMAND', 'zip --help 2>&1');
define('ZIP_APPEND_COMMAND', 'nohup zip -q -rm %1 %2 %3 & ');
define('UNZIP_HELP_COMMAND', 'unzip --help 2>&1');
define('UNZIP_COMMAND', 'unzip -q %1');
define('MYSQLDUMP_HELP_COMMAND', 'mysqldump --help 2>&1');
define('MYSQL_HELP_COMMAND', 'mysql --help 2>&1');
define('MYSQL_INSTALL_COMMAND', 'mysql --host=%1 --user=%2 --password=%3 -e "source %4" 2>&1 ');
define('MYSQL_BACKUP_COMMAND', 'mysqldump --max_allowed_packet=768M --set-charset --default-character-set=utf8 --host=%1 --port=3306 --user=%2 --password=%3 --lock-tables=false --single-transaction=true --add-drop-table --force %4 > %5 ');
define('MYSQL_UPDATE_COMMAND', 'mysql --verbose --host=%1 --user=%2 --password=%3 --database=%4 -e "source %5" ');
define('MYSQL_APPLY_COMMAND', 'mysql --host=%1 --user=%2 --password=%3 --database=%4 -e "source %5" ');

// Address will be used to open application pages by users
define('SERVER_NAME','');

define('SERVER_PORT','');

// Address will be used to execute background tasks
define('SERVER_INTERNAL_NAME','');

//define('MAX_FILE_SIZE',''); // Maximum allowed file size (in bytes) to be uploaded via forms

// Addresses of external services
define('PLANTUML_SERVER_URL', 'http://plantuml.myalm.ru');
define('MATH_TEX_IMG', '//mathjax.myalm.ru/?math=');
define('MATH_JAX_LIB_SRC', '//mathjax.myalm.ru/mathjax/MathJax.js?config=TeX-AMS_HTML');

// Allows anybody invite users into the system
define('INVITE_USERS_ANYBODY',true);

// Delete mail in support mailbox
define('MAILBOX_DELETE_MAIL',true);

// Wait timeouts
define('PAGE_WAIT_SECONDS', 60);

// DevOps incidents aggregator
define('DEVOPSSRV', 'http://api.devopsboard.com');
define('DEVOPSKEY', 'af4078b6e4630da32f3c164d121ea2b1');
define('UPDATES_URL', 'http://myalm.ru/news/tag/%D0%9E%D0%B1%D0%BD%D0%BE%D0%B2%D0%BB%D0%B5%D0%BD%D0%B8%D0%B5');
define('HELP_COMMUNITY_URL','http://club.devprom.ru');
define('HELP_SUPPORT_URL','http://support.devprom.ru/issue/new');
define('MAX_PLUS_ACTIONS', 7);
define('SD_EMAIL_ONCHANGE_ATTRIBUTES', array('Caption', 'Description', 'State'));
define('SERVER_INFO_HIDDEN',true);
define('SERVICE_URL', 'myalm.ru');
define('DOC_CACHED_PAGES', 10);
define('ISSUE_DUP_PRESERVE_ATTRS', array('Severity', 'Priority'));
//define('DATEFORMAT_SHORT','j-m-Y');//define('CKEDITOR_EXTRAPLUGINS','markdown');
//define('HELP_DOCS_URL','http://docs.myalm.ru');
define('WYSIWYG_EDITABLE', true);
define('SKIP_BACKUP_BEFORE_UPDATE', false);
define('MAX_DAILY_HOURS', 24);
define('DEADLINE_REPORT_DUE_DAYS', 4);


// SSO (OpenID, OAuth) settings
//define('AUTH_OPENID_USED', true);
//define('AUTH_OPENID_ONLY', true);
//define('AUTH_OPENID_CREATEVISITOR', true);