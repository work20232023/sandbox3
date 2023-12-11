<?php
include_once SERVER_ROOT_PATH.'pm/views/common/PageSettingBuilder.php';

class VersionPageSettingBuilder extends PageSettingBuilder
{
    function build( PageSettingSet & $settings )
    {
        $projectIt = getSession()->getProjectIt();

        $setting = new PageListSetting('VersionTree');
        $setting->setGroup( ($projectIt->IsPortfolio() || $projectIt->IsProgram()) ? 'Project' : 'none' );
        $setting->setVisibleColumns( array('Caption', 'RecentComment','Planned', 'Fact', 'Progress') );
        $settings->add( $setting );

        $setting = new PageTableSetting('VersionTable');
        $settings->add( $setting );
    }
}