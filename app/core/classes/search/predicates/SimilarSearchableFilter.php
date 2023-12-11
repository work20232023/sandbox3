<?php

class SimilarSearchableFilter extends FilterPredicate
{
    /** @var string $objectId */
    protected $objectClass;

    /** @var int $objectId */
    protected $objectId;

    /** @var string $searchObjectClass */
    protected $searchObjectClass;

    /**
     * @param string $objectClass Класс объекта
     * @param int $objectId ID объекта
     * @param ?string $searchObjectClass Класс искомых объектов
     */
    public function __construct(string $objectClass, int $objectId, ?string $searchObjectClass = null)
    {
        parent::__construct('dummy');

        $this->objectClass = $objectClass;
        if ( !class_exists($this->objectClass) ) $this->objectClass = 'Metaobject';

        $this->objectId = $objectId;

        $this->searchObjectClass = isset($searchObjectClass) ? $searchObjectClass : $objectClass;
        if ( !class_exists($this->searchObjectClass) ) $this->searchObjectClass = 'Metaobject';
    }

    public function _predicate($filter)
    {
        return " AND " . $this->getPK($this->getAlias()) . " IN (
            SELECT ObjectId
            FROM pm_Searchable AS s
            WHERE
                MATCH (s.SearchContent) AGAINST ((
                    SELECT SearchContent
                    FROM pm_Searchable
                    WHERE ObjectClass = '" . addslashes($this->objectClass) . "' AND ObjectId = {$this->objectId}
                ) IN NATURAL LANGUAGE MODE) AND s.ObjectClass = '" . addslashes($this->searchObjectClass) . "'
                AND (s.ObjectId != {$this->objectId} OR s.ObjectClass != \"" . addslashes($this->objectClass) . "\")
        ) ";
    }
}
