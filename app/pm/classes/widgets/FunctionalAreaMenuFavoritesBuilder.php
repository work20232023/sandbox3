<?php
include_once "FunctionalAreaMenuProjectBuilder.php";

class FunctionalAreaMenuFavoritesBuilder extends FunctionalAreaMenuProjectBuilder
{
    public function build( FunctionalAreaMenuRegistry & $set )
    {
    	$menus = parent::build($set);
 	    
		$items = array();

		$this->buildQuickItems($items);
		$menus['quick']['items'] = array_merge($items, $menus['quick']['items']);

		$has_mytasks = false;
		foreach( $items as $item ) {
			if ( $item['uid'] == 'mytasks' ) {
				$has_mytasks = true;
				break;
			}
		}
		if ( !$has_mytasks ) {
			array_unshift($menus['quick']['items'], $this->getReport()->getExact('mytasks')->buildMenuItem());
		}
		$menus['quick']['items'][] = $this->getReport()->getExact('discussions')->buildMenuItem();
		$menus['quick']['items']['whatsnew'] = $this->getModule()->getExact('whatsnew')->buildMenuItem();
        $menus['quick']['items'][] = $this->getModule()->getExact('projects')->buildMenuItem();
        $menus['quick']['items']['search'] = $this->getModule()->getExact('search')->buildMenuItem();

		$set->setAreaMenus( FUNC_AREA_FAVORITES, $menus );
		
		return $menus;
    }
    
    protected function buildQuickItems( &$items )
    {
    	$report = getFactory()->getObject('PMReport');
    	$custom_it = getFactory()->getObject('pm_CustomReport')->getMyRegistry()->Query(
					array (
							new SortOrderedClause()
					)				
			);
		while ( !$custom_it->end() )
		{
		    $it = $report->getExact($custom_it->get('ReportBase'));
		    
			if ( $it->getId() == '' || !getFactory()->getAccessPolicy()->can_read($it) ) {
			    $custom_it->moveNext(); continue;
			}
		    
			$item = $report->getExact($custom_it->getId())->buildMenuItem();
			$item['order'] = 5; 
			$items[$custom_it->getId()] = $item;
			$items[$custom_it->getId()]['uid'] = $custom_it->get('ReportBase');
			
			$custom_it->moveNext();
		}
    }
}