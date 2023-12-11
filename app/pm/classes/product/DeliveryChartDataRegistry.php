<?php

class DeliveryChartDataRegistry extends ObjectRegistrySQL
{
 	function getQueryClause(array $parms)
 	{
	 	$metastate = getFactory()->getObject('StateMeta');
		$metastate->setAggregatedStateObject(getFactory()->getObject('IssueState'));
 		$metastate->setStatesDelimiter("-");
 		
		$states = $metastate->getRegistry()->Query(array())->fieldToArray('ReferenceName');
		$submitted = array_shift($states);

		$items = array(
			" SELECT t.EstimatedStartDate, 
					 t.EstimatedFinishDate, 
					 (SELECT p.pm_ProjectId FROM pm_Project p WHERE p.VPD = t.VPD) Project, 
					 t.Caption, 
                     t.pm_FunctionId entityId, 
                     'Feature' ObjectClass, 
                     t.RecordCreated, 
                     t.RecordModified, 
                     t.VPD, 
					 IFNULL(CONCAT('Feature',(SELECT ft.ReferenceName FROM pm_FeatureType ft WHERE ft.pm_FeatureTypeId = t.Type)),'Feature') ObjectType, 
					 0 Priority, 
                     t.Importance, 
					 t.SortIndex, 
                     '' Custom1 
			   FROM pm_Function t 
 			  WHERE t.EstimatedStartDate IS NOT NULL ".getFactory()->getObject('Feature')->getVpdPredicate('t'),
				
			" SELECT t.EstimatedStartDate,
					 t.EstimatedFinishDate,
					 t.Project, 
                     t.Caption, 
                     t.pm_ChangeRequestId, 
                     'Request', 
                     t.RecordCreated, 
                     t.RecordModified, 
                     t.VPD, 
					 IFNULL(CONCAT('Request',(SELECT ft.ReferenceName FROM pm_IssueType ft WHERE ft.pm_IssueTypeId = t.Type)),'Request') ObjectType, 
                     t.Priority, 
                     0, 
                     CONCAT(
                        IFNULL((SELECT f.SortIndex FROM pm_Function f WHERE f.pm_FunctionId = t.Function), 'z'),
                        LPAD((SELECT p.OrderNum FROM Priority p WHERE p.PriorityId = t.Priority), 8, '0'),
                        LPAD(t.OrderNum, 8, '0')
                     ),
					 (SELECT LCASE(p.ReferenceName) FROM pm_IssueType p WHERE p.pm_IssueTypeId = t.Type) 
			   FROM pm_ChangeRequest t, 
			        pm_Project pr 
 			  WHERE pr.pm_ProjectId = t.Project 
 			    AND (t.EstimatedStartDate IS NOT NULL
 			            OR EXISTS (SELECT 1 FROM pm_Task s WHERE s.ChangeRequest = t.pm_ChangeRequestId AND s.EstimatedStartDate IS NOT NULL))
 			    AND t.FinishDate IS NULL ".getFactory()->getObject('Request')->getVpdPredicate('t'),

			" SELECT IFNULL(t.MilestoneDate, NOW()), 
                     t.MilestoneDate, 
					 (SELECT p.pm_ProjectId FROM pm_Project p WHERE p.VPD = t.VPD), 
					 t.Caption, 
					 t.pm_MilestoneId, 
					 'Milestone', 
					 t.RecordCreated, 
					 t.RecordModified, 
					 t.VPD, 
					 'Milestone' ObjectType, 
					 0, 
					 0, 
					 0 SortIndex, 
					 '' 
			   FROM pm_Milestone t 
 			  WHERE t.Passed = 'N' ".getFactory()->getObject('Request')->getVpdPredicate('t'),
		);
 		
 	    return "(".join(" UNION ", $items).")";
 	}
}