<?php

class FieldListOfProjectRoles extends Field
{
	private $object_it = null;

	function __construct( $object_it ) {
		$this->object_it = $object_it;
	}

	function getText()
    {
        $roleIt = getFactory()->getObject('ProjectRole')->getRegistry()->Query(
            array(
                new FilterInPredicate($this->object_it->get('ProjectRole'))
            )
        );

        $html = join('<br/>', $roleIt->fieldToArray('Caption'));

        $permissionsUrl = getFactory()->getObject('Module')->getExact('permissions/settings')->getUrl(
            'user='.$this->object_it->get('SystemUser')
        );
        $html .= '<br/><br/><a class="dashed" target="_blank" href="'.$permissionsUrl.'">'.text(2454).'</a>';

        return $html;
    }

	function render( $view )
	{
		echo '<div class="input-block-level well well-text">';
            echo $this->getText();
		echo '</div>';
	}
}