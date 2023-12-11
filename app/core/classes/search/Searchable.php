<?php
include "persisters/SimilarityPersister.php";
include "predicates/SimilarSearchableFilter.php";
include "predicates/StaleSearchableFilter.php";
include "sorts/SimilaritySort.php";

class Searchable extends Metaobject
{
 	function __construct() {
 	    parent::__construct('pm_Searchable');
 	}
}
