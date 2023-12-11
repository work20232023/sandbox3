<?php

class FilterNotInPredicate extends FilterPredicate
{
 	function _predicate( $filter )
 	{
 		$ids = \TextUtils::parseIds($filter);
 		if ( count($ids) < 1 ) return ' AND 1 = 1 ';

        return " AND t.{$this->getObject()->getIdAttribute()} NOT IN (".join(',',$ids).") ";
 	}
}
