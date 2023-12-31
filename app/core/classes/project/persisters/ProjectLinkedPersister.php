<?php

class ProjectLinkedPersister extends ObjectSQLPersister
{
 	function getSelectColumns( $alias )
 	{
 	    $columns = array();
 	    
		$sql = " CONCAT_WS(',', 
		           (SELECT GROUP_CONCAT(CAST(pr.pm_ProjectId AS CHAR)) 
			          FROM pm_Project pr, pm_ProjectLink pl 
			         WHERE pl.Target = pr.pm_ProjectId
			           AND pl.Source = {$this->getPK($alias)} ), 
			       (SELECT GROUP_CONCAT(CAST(pr.pm_ProjectId AS CHAR)) 
			          FROM pm_Project pr, pm_ProjectLink pl 
			         WHERE pl.Source = pr.pm_ProjectId
			           AND pl.Target = {$this->getPK($alias)} )
			     ) LinkedProject ";
 	    
 		$columns[] = $sql;

 		$columns[] =
          " (SELECT GROUP_CONCAT(CAST(pr.pm_ProjectId AS CHAR)) 
               FROM co_ProjectGroupLink pg1, co_ProjectGroupLink pg2, pm_Project pr 
              WHERE pg1.ProjectGroup = pg2.ProjectGroup
                AND pg1.Project = {$this->getPK($alias)}
                AND pg2.Project = pr.pm_ProjectId) PortfolioProject ";
 	    
 		return $columns;
 	}
}