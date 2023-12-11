<?php

class WikiPageEstimationPersister extends ObjectSQLPersister
{
    function getAttributes() {
        return array('EstimationHie', 'EstimationChildren', 'LatestDuration', 'AverageDuration');
    }

    function getSelectColumns( $alias )
 	{
        $columns = array(
            "  IFNULL(
                 (SELECT SUM(
                            IF(c.Includes IS NULL, c.Estimation, 
                                (SELECT i.Estimation FROM WikiPage i WHERE i.WikiPageId = c.Includes))) 
                   FROM WikiPage c 
                  WHERE c.DocumentId = t.DocumentId 
                    AND c.ParentPath LIKE CONCAT({$alias}.ParentPath, '%')) ,0) EstimationHie ",

            "  IFNULL(
                 (SELECT SUM(
                            IF(c.Includes IS NULL, c.Estimation, 
                                (SELECT i.Estimation FROM WikiPage i WHERE i.WikiPageId = c.Includes))) 
                   FROM WikiPage c 
                  WHERE c.DocumentId = t.DocumentId 
                    AND c.ParentPath LIKE CONCAT({$alias}.ParentPath, '%')
                    AND c.WikiPageId <> {$alias}.WikiPageId) ,0) EstimationChildren ",

            " (SELECT SUM(l.Duration) 
 			     FROM pm_TestCaseExecution l, WikiPage c
 			    WHERE c.DocumentId = {$alias}.DocumentId 
                  AND c.ParentPath LIKE CONCAT({$alias}.ParentPath, '%')
                  AND l.TestCase IN (c.WikiPageId, c.Includes)
                  AND l.Duration > 0
 			      AND l.pm_TestCaseExecutionId = (SELECT MAX(l2.pm_TestCaseExecutionId) 
 			                               FROM pm_TestCaseExecution l2 
 			                              WHERE l2.TestCase = l.TestCase) ) LatestDuration ",

            " (SELECT SUM(o.Duration)
                 FROM (SELECT AVG(l.Duration) Duration, l.TestCase
                         FROM pm_TestCaseExecution l
                        WHERE l.Duration > 0
                        GROUP BY l.TestCase) o, 
                      WikiPage c
                WHERE c.DocumentId = {$alias}.DocumentId 
                  AND c.ParentPath LIKE CONCAT({$alias}.ParentPath, '%')
                  AND o.TestCase IN (c.WikiPageId, c.Includes) ) AverageDuration "
        );

        return $columns;
 	}
}
