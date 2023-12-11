<?php

class StageIterator extends OrderedIterator
{
 	function getObjectIt()
	{
        return getFactory()->getObject($this->get('State'))->getExact( $this->getId() );
	}
}
