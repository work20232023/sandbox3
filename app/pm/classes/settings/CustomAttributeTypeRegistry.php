<?php

class CustomAttributeTypeRegistry extends ObjectRegistrySQL
{
	function createSQLIterator( $sql )
	{
		return $this->createIterator([
		   [
			   'entityId' => 1,
			   'ReferenceName' => 'integer',
			   'Caption' => translate('Число')
		   ],
		   [
			   'entityId' => 2,
			   'ReferenceName' => 'dictionary',
			   'Caption' => translate('Справочник')
		   ],
		   [
			   'entityId' => 3,
			   'ReferenceName' => 'date',
			   'Caption' => translate('Дата')
		   ],
		   [
			   'entityId' => 4,
			   'ReferenceName' => 'string',
			   'Caption' => translate('Строка текста')
		   ],
		   [
			   'entityId' => 5,
			   'ReferenceName' => 'text',
			   'Caption' => translate('Текстовое поле')
		   ],
		   [
			   'entityId' => 6,
			   'ReferenceName' => 'wysiwyg',
			   'Caption' => translate('Редактор WYSIWYG')
		   ],
		   [
			   'entityId' => 7,
			   'ReferenceName' => 'reference',
			   'Caption' => translate('Ссылка')
		   ],
		   [
			   'entityId' => 8,
			   'ReferenceName' => 'computed',
			   'Caption' => text(2132)
		   ],
		   [
			   'entityId' => 9,
			   'ReferenceName' => 'char',
			   'Caption' => text(2542)
		   ],
		   [
			   'entityId' => 10,
			   'ReferenceName' => 'datetime',
			   'Caption' => translate('Дата/время')
		   ],
		   [
			   'entityId' => 11,
			   'ReferenceName' => 'checklist',
			   'Caption' => translate('Чеклист')
		   ]
	   ]);
	}
}