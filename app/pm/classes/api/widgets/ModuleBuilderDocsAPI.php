<?php
include_once SERVER_ROOT_PATH."core/classes/widgets/ModuleBuilder.php";

class ModuleBuilderDocsAPI extends ModuleBuilder
{
    public function build( ModuleRegistry & $object )
    {
        $modules = array();

        $item = array();
        $item['cms_PluginModuleId'] = 'apidocs-list';
        $item['Caption'] = text(3400);
        $item['Url'] = 'apidocs/list';
        $item['Icon'] = 'icon-stop';
        $modules[] = $item;

        foreach( $modules as $module ) {
        	$module['Area'] = FunctionalAreaMenuSettingsBuilder::AREA_UID;
            $object->addModule( $module );
        }
    }
}