<?php

class FieldProductInfoLines extends Field
{
	private $object_it = null;

	function __construct( $object_it ) {
		$this->object_it = $object_it;
	}

	function render( $view )
	{
		while( !$this->object_it->end() ) {
			echo '<h4 class="title bs">'.$this->object_it->getHtmlDecoded('Caption').'</h4>';
			echo '<div class="product-info">';
				echo $this->object_it->getHtmlDecoded('ReferenceName');
			echo '</div>';
			$this->object_it->moveNext();
			if ( !$this->object_it->end() ) {
				echo '<br/>';
			}
		}
	}
}