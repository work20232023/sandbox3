<?php
include "DeliveryChart.php";

class DeliveryChartTable extends PMPageTable
{
	function getList() {
		return new DeliveryChart( $this->getObject() );
	}
	
	function getTemplate() {
		return 'pm/DeliveryChart.tpl.php';
	}
	
  	function getFilters()
	{
		$methodology_it = getSession()->getProjectIt()->getMethodologyIt();
		$filters = array (
			$this->buildFilterType(),
			$this->buildFilterPriority()
		);
		if ( $methodology_it->HasFeatures() ) {
			$filters[] = $this->buildFilterImportance();
		}
		$filter = $this->buildProjectFilter();
		if ( is_object($filter) ) $filters = array_merge(array($filter), $filters);

        $filters[] = new FilterDateIntervalWebMethod(translate('Дата начала'), 'startafter');
        $filters[] = new FilterDateIntervalWebMethod(translate('Дата начала'), 'startbefore');
        $filters[] = new FilterDateWebMethod(text(2267), 'finish');

		return $filters;
	}
	
	function getFilterPredicates( $values )
	{
		return array_merge (
            parent::getFilterPredicates( $values ),
            array (
                new DeliveryProductTypePredicate($values['type']),
                new FilterDateAfterPredicate('StartDate', $values['startafter']),
                new FilterDateBeforePredicate('StartDate', $values['startbefore'])
            )
		);
	}

	protected function buildFilterType()
	{
        $deliveryProduct = getFactory()->getObject('DeliveryProduct');

        $defaultProducts = [];
        $productIt = $deliveryProduct->getAll();
        while( !$productIt->end() ) {
            if ( stripos($productIt->get('ReferenceName'), 'Feature') !== false ) {
                $defaultProducts[] = $productIt->get('ReferenceName');
            }
            if ( stripos($productIt->get('ReferenceName'), 'Request') !== false ) {
                $defaultProducts[] = $productIt->get('ReferenceName');
            }
            $productIt->moveNext();
        }

        $method = new FilterObjectMethod( $deliveryProduct, translate('Детализация'), 'type');
		$method->setIdFieldName( 'ReferenceName' );
		$method->setHasNone(false);
        $method->setDefaultValue($defaultProducts);
		return $method;
	}
	
	protected function buildFilterPriority()
	{
		$method = new FilterObjectMethod( getFactory()->getObject('Priority'), translate('Приоритет'), 'priority');
		$method->setHasNone(false);
		return $method;
	}

	protected function buildFilterImportance()
	{
		$method = new FilterObjectMethod( getFactory()->getObject('Importance'), text('ee228'), 'importance');
		$method->setHasNone(false);
		return $method;
	}
	
    function buildFilterValuesByDefault(&$filters)
    {
        $values = parent::buildFilterValuesByDefault($filters);
        if ( !array_key_exists('start', $values) ) {
            $values['start'] = getSession()->getLanguage()->getPhpDate(strtotime('-1 year', strtotime(date('Y-m-j'))));
        }
        return $values;
    }

    protected function getFamilyModules( $module )
    {
        return array (
            'project-plan-hierarchy',
            'features-list'
        );
    }

    function getNewActions()
    {
        $actions = array();
        $methodology_it = getSession()->getProjectIt()->getMethodologyIt();

        $method = new ObjectCreateNewWebMethod(getFactory()->getObject('Iteration'));
        if ( $methodology_it->HasPlanning() && $method->hasAccess() ) {
            $actions[] = array(
                'name' => translate('Итерация'),
                'url' => $method->getJSCall()
            );
        }

        $method = new ObjectCreateNewWebMethod(getFactory()->getObject('Release'));
        if ( $methodology_it->HasReleases() && $method->hasAccess() ) {
            $actions[] = array(
                'name' => translate('Релиз'),
                'url' => $method->getJSCall()
            );
        }

        $method = new ObjectCreateNewWebMethod(getFactory()->getObject('Milestone'));
        if ( $method->hasAccess() ) {
            $actions[] = array(
                'name' => translate('Веха'),
                'url' => $method->getJSCall()
            );
        }
        return $actions;
    }
}