<?php
include_once SERVER_ROOT_PATH."pm/classes/common/CustomizableObjectBuilder.php";

class CustomizableObjectBuilderIntegration extends CustomizableObjectBuilder
{
    protected $plugin;
    
    function __construct( PluginPMBase $plugin, PMSession $session )
    {
        $this->plugin = $plugin;
        parent::__construct( $session );
    }
    
    public function build(CustomizableObjectRegistry & $set, $useTypes)
    {
        if ( is_object($this->plugin) && !$this->plugin->checkEnabled() ) return;

		$set->add( 'Integration' );
    }
}