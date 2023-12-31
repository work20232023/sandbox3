<?php

class ProjectStatePredicate extends FilterPredicate
{
 	function _predicate( $filter )
 	{
		 switch( $filter )
		 {
			case 'all':
				 return " AND 1 = 1 ";

			case 'current':
		 		return " AND t.IsClosed = 'N' " .
		 			   " AND EXISTS ( SELECT 1 FROM pm_Version v " .
		 			   "			   WHERE v.Project = t.pm_ProjectId" .
		 			   "				 AND TO_DAYS(NOW()) BETWEEN " .
		 			   "					(SELECT m.MetricValue FROM pm_VersionMetric m" .
		 			   "	   				  WHERE v.pm_VersionId = m.Version" .
		 			   "		 			    AND m.Metric = 'EstimatedStart') AND ".
		 			   "					(SELECT m.MetricValue FROM pm_VersionMetric m" .
		 			   "	   				  WHERE v.pm_VersionId = m.Version" .
		 			   "		 			    AND m.Metric = 'EstimatedFinish')" .
		 			   "			) ";

			case 'closed':
                return " AND t.IsClosed = 'Y' ";

		 	default:
                return " AND t.IsClosed = 'N' ";
		 }
 	}
}