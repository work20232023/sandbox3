<?php
include "ScrumList.php";

class ScrumTable extends PMPageTable
{
	function getList( $mode = '' )
	{
		return new ScrumList( $this->getObject() );
	}

    function getFilters()
    {
        return array_merge(
            parent::getFilters(),
            [
                new \FilterObjectMethod(getFactory()->getObject('Participant'), '', 'participant')
            ]
        );
    }
} 