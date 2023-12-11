<?php
include_once SERVER_ROOT_PATH.'pm/views/common/PageSettingBuilder.php';

class AutoActionPageSettingBuilder extends PageSettingBuilder
{
    public function build( PageSettingSet & $settings )
    {
        $setting = new PageListSetting('AutoActionList');
        $columns = array('Caption', 'EventType', 'Conditions', 'Actions', 'OrderNum');
        $setting->setVisibleColumns($columns);
        $settings->add( $setting );
    }
}