<?php

 class ProjectMetricDatesPersister extends ObjectSQLPersister
 {
 	function getSelectColumns( $alias )
 	{
        $columns = [
            " (SELECT pr.Rating FROM pm_Project pr WHERE t.VPD = pr.VPD) ProjectVelocity "
        ];

        $columns[] =
            " UNIX_TIMESTAMP(
                COALESCE(
                    (SELECT MAX(m.MetricValueDate) 
                       FROM pm_Release r, pm_IterationMetric m 
                      WHERE r.VPD = t.VPD AND m.Iteration = r.pm_ReleaseId AND m.Metric = 'EstimatedFinish'),
                    (SELECT MAX(r.FinishDate) 
                       FROM pm_Release r 
                      WHERE r.VPD = t.VPD),
                    (SELECT MAX(m.MetricValueDate) 
                       FROM pm_Version v, pm_VersionMetric m 
                      WHERE v.VPD = t.VPD AND m.Version = v.pm_VersionId AND m.Metric = 'EstimatedFinish'),
                    (SELECT MAX(v.FinishDate) 
                       FROM pm_Version v 
                      WHERE v.VPD = t.VPD),
                    (SELECT UNIX_TIMESTAMP(FROM_DAYS(TO_DAYS(IFNULL(FROM_DAYS(TO_DAYS(GREATEST(IFNULL(MAX(pr.FinishDate),NOW()), NOW()))
                            + IF(IFNULL(MAX(pr.Rating),0) <= 0, 0, GREATEST(0, ROUND(IFNULL(SUM(r.Estimation), 1) / MAX(pr.Rating), 1)))),NOW()))))
                         FROM pm_Project pr, pm_ChangeRequest r
                        WHERE t.VPD = pr.VPD
                          AND r.Project = pr.pm_ProjectId
                          AND r.PlannedRelease IS NULL
                          AND NOT EXISTS (SELECT 1 FROM pm_Task s WHERE s.ChangeRequest = r.pm_ChangeRequestId AND s.Release IS NOT NULL)
                          AND r.FinishDate IS NULL) 
                )
             ) EstimatedFinishDate ";

        $columns[] =
            " UNIX_TIMESTAMP(
                COALESCE(
                    (SELECT MAX(m.MetricValueDate) 
                       FROM pm_Release r, pm_IterationMetric m 
                      WHERE r.VPD = t.VPD AND m.Iteration = r.pm_ReleaseId AND m.Metric = 'EstimatedStart'),
                    (SELECT MAX(r.StartDate) 
                       FROM pm_Release r 
                      WHERE r.VPD = t.VPD),
                    (SELECT MAX(m.MetricValueDate) 
                       FROM pm_Version v, pm_VersionMetric m 
                      WHERE v.VPD = t.VPD AND m.Version = v.pm_VersionId AND m.Metric = 'EstimatedStart'),
                    (SELECT MAX(v.StartDate) 
                       FROM pm_Version v 
                      WHERE v.VPD = t.VPD),
                    UNIX_TIMESTAMP(IFNULL(t.StartDate, NOW())) 
                )
              ) EstimatedStartDate ";

        return $columns;
 	}
 }
