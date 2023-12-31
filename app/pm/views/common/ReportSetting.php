<?php

class ReportSetting extends PageListSetting
{
    function __construct( $report_uid )
    {
        $this->report_uid = $report_uid;
    }
    
    function getReport()
    {
        return $this->report_uid;
    }

    function setRowsNumber( $rows )
    {
        $this->rows = $rows;
    }
    
    function getRowsNumber()
    {
        return $this->rows;
    }
    
    function setSorts( $sorts_array )
    {
        $index = '';
        foreach( $sorts_array as $sort ) {
            $this->sorts['sort'.$index] = $sort;
            $index = $index == '' ? 2 : $index + 1;
        }
    }
    
    function getSorts()
    {
        return $this->sorts;
    }
    
    function setSections( $sections_array )
    {
    	$this->sections = $sections_array;
    }
    
    function getSections()
    {
    	return $this->sections;
    }
    
    protected $sorts = array();
    protected $rows;
    protected $report_uid;
    protected $sections = array();
}