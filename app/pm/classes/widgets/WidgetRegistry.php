<?php

class WidgetRegistry extends ObjectRegistryArray
{
	function createSQLIterator( $parms = array() )
 	{
 		$data = array();

 		$policy = getFactory()->getAccessPolicy();
 		$resource_it = getFactory()->getObject('ContextResource')->getAll();
		$module_it = getFactory()->getObject('Module')->getAll();

		while( !$module_it->end() )
		{
		    if ( $module_it->get('Area') == '' || !$policy->can_read($module_it) ) {
                $module_it->moveNext();
                continue;
            }

			$resource_it->moveToId($module_it->getId());
			if ( $resource_it->getId() == '' ) $resource_it->moveToId($module_it->getId().':'.array_shift(preg_split('/_/', getSession()->getProjectIt()->get('Tools'))));

			$data[$module_it->getDisplayName()] = array (
				'entityId' => $module_it->getId(),
				'Caption' => $module_it->getDisplayName(),
				'ReferenceName' => $resource_it->getId() != '' ? $resource_it->getHtmlDecoded('Caption') : $module_it->getHtmlDecoded('Description'),
                'url' => $module_it->getUrl()
			);
			$module_it->moveNext();
		}

		$report_it = getFactory()->getObject('PMReport')->getAll();
 		while( !$report_it->end() )
 		{
            if ( !$policy->can_read($report_it) ) {
                $report_it->moveNext();
                continue;
            }

 			$resource_it->moveToId($report_it->getId());
			$description = $resource_it->getHtmlDecoded('Caption');

			if ( $description == '' ) {
				$resource_it->moveToId($report_it->get('Module'));
				$description = $resource_it->getHtmlDecoded('Caption');
			}

			if ( $description == '' ) {
				$description = $report_it->getHtmlDecoded('Description');
			}
 			
 			$data[$report_it->getDisplayName()] = array (
                'entityId' => $report_it->getId(),
                'Caption' => $report_it->getDisplayName(),
                'ReferenceName' => $description,
                'url' => $report_it->getUrl()
 			);
 			$report_it->moveNext();
 		}

        return $this->createIterator( $data );
 	}
}