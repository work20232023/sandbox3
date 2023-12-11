<?php
require_once SERVER_ROOT_PATH.'ext/xml/xml2Array.php';

class ProductInfoPostRegistry extends ObjectRegistrySQL
{
	const PRODUCT_INFO_FILE = 'conf/rss.xml';

 	function createSQLIterator( $sql )
 	{
		$xml = file_get_contents(DOCUMENT_ROOT.self::PRODUCT_INFO_FILE);
		if ( $xml == "" ) return $this->getObject()->getEmptyIterator();

		$xml_array = new xml2Array;
		$xml_data = $xml_array->xmlParse($xml);

		$rows = array();
		foreach( $xml_data['children'] as $key => $entry ) {
			if ( strtolower($entry['name']) == 'entry' ) {
				$row = array();
				foreach( $entry['children'] as $key => $attribute ) {
					if ( strtolower($attribute['name']) == 'title' ) {
						$row['Caption'] = $attribute['tagData'];
					}
					if ( strtolower($attribute['name']) == 'content' ) {
						$row['ReferenceName'] = $attribute['tagData'];
					}
				}
				if ( $row['Caption'] != '' ) {
					$row['entityId'] = count($rows) + 1;
					$rows[] = $row;
				}
			}
		}
 		return $this->createIterator(array_slice($rows, 0, 3));
 	}
}