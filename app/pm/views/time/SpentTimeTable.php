<?php
include "SpentTimeList.php";
include "SpentTimeChart.php";

class SpentTimeTable extends PMPageTable
{
	function getList($mode = '')
    {
        switch ( $mode ) {
            case 'chart':
                return new SpentTimeChart($this->getObject());
            default:
                return new SpentTimeList($this->getObject());
        }
	}

	function getNewActions() {
		return array();
	}
	
 	function getFilterPredicates( $values )
 	{
 	    return array_merge(
 	        parent::getFilterPredicates($values),
            array(
                new ActivityIssuePredicate($values['issue']),
                new FilterDateAfterPredicate('ReportDate', $values['start']),
                new FilterDateBeforePredicate('ReportDate', $values['finish']),
                new FilterAttributePredicate( 'IsApproved', $this->getFilterUsers($values['approved'],$values) )
            )
        );
 	}

    function buildAttributesPredicates( $values )
    {
        unset($values['issue']);
        return parent::buildAttributesPredicates( $values );
    }

 	function getFilters()
    {
        return array_merge(
            parent::getFilters(),
            array(
                $this->buildStartFilter(),
                new ViewFinishDateWebMethod(),
                $this->buildParticipantFilter(),
                $this->buildApprovedFilter()
            )
        );
    }

    function buildStartFilter() {
        $filter = new ViewStartDateWebMethod();
        return $filter;
    }

    function buildApprovedFilter() {
        $filter = new FilterCheckMethod($this->getObject()->getAttributeUserName('IsApproved'), 'approved');
        return $filter;
    }

    function buildParticipantFilter() {
	    return new FilterObjectMethod(getFactory()->getObject('WorkerUser'), '', 'participant');
    }

    function buildFilterValuesByDefault(&$filters)
    {
        $values = parent::buildFilterValuesByDefault($filters);
        if ( !array_key_exists('start', $values) && $_REQUEST['ids'] == '' ) {
            $values['start'] = getSession()->getLanguage()->getPhpDate(
                strtotime('-3 weeks', strtotime(date('Y-m-j'))));
        }
        return $values;
    }

    protected function getChartModules( $module )
    {
        return array (
            'tasksplanbyfact',
            'activitieschart'
        );
    }

 	function getFamilyModules($module)
    {
        return array(
            'project-spenttime'
        );
    }

    protected function getChartsModuleName() {
        return 'worklog-chart';
    }
}
