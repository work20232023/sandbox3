set APP_ROOT=%~dp0/../ext
set TEST_ROOT=%~dp0
set DEV_ROOT=%TEST_ROOT%../../../devops/dev

set PATH=%TEST_ROOT%../../../devops/dev/php;%PATH%

chcp 1251

call %APP_ROOT%\vendor\bin\phpunit.bat -c config.xml
