<?php

class WikiDocumentUIDFilter extends FilterPredicate
{
 	function _predicate( $filter )
 	{
 	    $filter = array_filter( preg_split('/,/', $filter), function( $value ) {
 	        return $value != '';
 	    });
 	    if ( count($filter) < 1 ) return " AND 1 = 2 ";

		$idsFilter = array_filter($filter, function($value) { return is_numeric($value);} );
		$document_it = (new ObjectRegistrySQL($this->getObject()))->Query(
			array (
				count($idsFilter) > 0
					? new FilterInPredicate($idsFilter)
					: new FilterTextExactPredicate('UID', $filter)
			)
		);
		$ids = $document_it->idsToArray();
 	    if ( count($ids) < 1 ) return " AND 1 = 2 ";

		$likes = array();
 	    foreach( $ids as $id ) {
 	        $likes[] = " t.ParentPath LIKE '%,".$id.",%' ";
 	    }
		return " AND (".join("OR", $likes).") ";
 	}
}
