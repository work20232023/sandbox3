<?php

namespace Devprom\ProjectBundle\Service\Search;

use FilterVpdPredicate;
use IteratorBase;
use ProjectAccessibleActiveVpdPredicate;
use SimilarityPersister;
use SimilaritySort;
use SimilarSearchableFilter;

class SearchService
{
    public function findSimilar(string $objectClass, int $objectId, string $searchObjectClass, bool $searchOnlyInTheSameProject = false): IteratorBase
    {
        $objectRegistry = getFactory()->getObject($searchObjectClass)->getRegistry();
        /** @var IteratorBase $objectIt */
        return $objectRegistry->Query([
            new SimilarityPersister($objectClass, $objectId),
            new SimilarSearchableFilter($objectClass, $objectId, $searchObjectClass),
            $searchOnlyInTheSameProject ? new FilterVpdPredicate() : new ProjectAccessibleActiveVpdPredicate(),
            new SimilaritySort,
        ]);
    }
}
