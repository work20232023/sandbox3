<?php

class FieldSettingsButton extends Field
{
	private $url = '';
	
	function __construct( $url )
	{
		$this->url = $url;
		parent::__construct();
	}
	
    function render( $view )
    {
        echo '<a action="setup" class="btn btn-warning pull-left" href="'.$this->url.'">'.text('admin.settings.setup').'</a>';
    }
}