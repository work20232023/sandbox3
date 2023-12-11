<?php

class SnapshotIterator extends OrderedIterator
{
	function getAnchorIt()
	{
		if ( $this->get('ObjectClass') == '' || $this->get('ObjectId') < 1 ) {
			return $this->object->getEmptyIterator();
		}
		else {
            if ( !class_exists($this->get('ObjectClass')) ) {
                return $this->object->getEmptyIterator();
            }
			return getFactory()->getObject($this->get('ObjectClass'))->getExact($this->get('ObjectId'));
		}
	}
}
