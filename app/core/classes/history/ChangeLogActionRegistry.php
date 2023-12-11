<?php

class ChangeLogActionRegistry extends ObjectRegistrySQL
{
    function createSQLIterator( $sql )
    {
        return $this->createIterator(
				array (
						array ( 'entityId' => 'added', 'ReferenceName' => 'added', 'Caption' => translate('Создание') ),
						array ( 'entityId' => 'modified', 'ReferenceName' => 'modified', 'Caption' => translate('Изменение') ),
						array ( 'entityId' => 'deleted', 'ReferenceName' => 'deleted', 'Caption' => translate('Удаление') ),
						array ( 'entityId' => 'commented', 'ReferenceName' => 'commented', 'Caption' => translate('Обсуждение') )
	        	)
		);
    }
}