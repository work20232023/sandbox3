<?php
include "DocsAPIPageTable.php";
include "DocsAPIForm.php";

class DocsAPIPage extends PMPage
{
 	function getObject() {
 		return new DocsAPIEntity();
 	}
 	
 	function getTable() {
		return new DocsAPIPageTable($this->getObject());
 	}
 	
 	function getEntityForm() {
        return new DocsAPIForm($this->getObject());
 	}

}