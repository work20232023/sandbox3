<?php
include "DocsAPIList.php";
include "DocsAPITreeGrid.php";

class DocsAPIPageTable extends PMPageTable
{
	function getList( $mode = '' ) {
        return new DocsAPIList( $this->getObject() );
	}

    function getActions() {
		return array();
	}

    function getNewActions() {
        return array();
    }

    function getExportActions() {
        return array();
    }

    function getDefaultRowsOnPage() {
        return 300;
    }

    function getCaption() {
        return text(3400);
    }

    function buildSearchPredicate($values)
    {
        return new FilterSearchAttributesPredicate(
            $values['search'],
            $this->getObject()->getSearchableAttributes(),
            FilterSearchAttributesPredicate::WORDS_MODE_EXACT
        );
    }

    function getDetailsParms() {
        return array (
            'active' => 'form'
        );
    }
}