<?php

class CustomAttributeTypeIterator extends CacheableIterator
{
	private const DB_TYPES = [
		PMCustomAttribute::KEY_CHECKLIST 	=> PMCustomAttribute::DB_TYPE_VARCHAR,
		PMCustomAttribute::KEY_STRING	 	=> PMCustomAttribute::DB_TYPE_VARCHAR,
		PMCustomAttribute::KEY_COMPUTED 	=> PMCustomAttribute::DB_TYPE_VARCHAR,
		PMCustomAttribute::KEY_CHAR 		=> PMCustomAttribute::DB_TYPE_CHAR,
		PMCustomAttribute::KEY_DICTIONARY 	=> 'REF_PMCustomDictionaryId',
		PMCustomAttribute::KEY_INTEGER 		=> PMCustomAttribute::DB_TYPE_FLOAT
	];

	private const COLUMN_VALUES = [
		PMCustomAttribute::KEY_PASSWORD 	=> PMCustomAttribute::PASSWORD_VALUE,
		PMCustomAttribute::KEY_TEXT 		=> PMCustomAttribute::TEXT_VALUE,
		PMCustomAttribute::KEY_WYSIWYG 		=> PMCustomAttribute::TEXT_VALUE,
		PMCustomAttribute::KEY_CHECKLIST 	=> PMCustomAttribute::STRING_VALUE
	];

 	public function getDbType(string $defaultValue = ''): string
 	{
 		$type = strtolower($this->get(PMCustomAttribute::REFERENCE_NAME));

		if (!array_key_exists($type, self::DB_TYPES)) {
			return $type;
		}

		if ($type === PMCustomAttribute::KEY_COMPUTED && substr($defaultValue, 0, 1) === '=') {
			return PMCustomAttribute::DB_TYPE_FLOAT;
		}

		return self::DB_TYPES[$type];
 	}

 	public function getValueColumn(): string
 	{
 		$type = strtolower($this->get(PMCustomAttribute::REFERENCE_NAME));
 		
		if (!array_key_exists($type, self::COLUMN_VALUES)) {
			return PMCustomAttribute::STRING_VALUE;
		}

		return self::COLUMN_VALUES[$type];
 	}
}