<?php

class SimilarityPersister extends ObjectSQLPersister
{
    /** @var string $objectId */
    protected $objectClass;

    /** @var int $objectId */
    protected $objectId;

    /**
     * @param string $objectClass Класс объекта
     * @param int $objectId ID объекта
     */
    public function __construct(string $objectClass, int $objectId)
    {
        parent::__construct();

        $this->objectClass = $objectClass;
        $this->objectId = $objectId;
    }

    public function getSelectColumns($alias)
    {
        return [
            " (
                SELECT
                    LEAST(MATCH (s.SearchContent) AGAINST ((
                        SELECT SearchContent
                        FROM pm_Searchable
                        WHERE ObjectClass = '" . addslashes($this->objectClass) . "' AND ObjectId = {$this->objectId}
                    ) IN NATURAL LANGUAGE MODE) / (CHAR_LENGTH(s.SearchContent) - CHAR_LENGTH(REPLACE(s.SearchContent, ' ', '')) + 1), 1.0) AS Similarity
                FROM pm_Searchable AS s
                WHERE s.ObjectClass = '" . addslashes(get_class($this->getObject())) . "' AND s.ObjectId = " . $this->getPK('t') . "
            ) AS Similarity ",
        ];
    }
}
