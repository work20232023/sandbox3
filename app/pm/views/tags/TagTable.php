<?php
include "TagList.php";

class TagTable extends SettingsTableBase
{
	function getList() {
		return new TagList( $this->getObject() );
	}
}
