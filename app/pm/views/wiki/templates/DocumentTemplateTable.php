<?php
include "DocumentTemplateList.php";

class DocumentTemplateTable extends PMPageTable
{
	function getList() {
		return new DocumentTemplateList($this->getObject());
	}

	function getNewActions() {
		return array();
	}

	function getExportActions() {
        return array();
    }

    function getImportActions() {
        return array();
    }
}