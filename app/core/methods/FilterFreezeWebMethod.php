<?php

include_once "WebMethod.php";

class FilterFreezeWebMethod extends WebMethod
{
 	var $method_name, $filters_name, $filter, $subject;
 	
 	private $filter_values = null;
 	private $extendToCommon = true;

 	function FilterFreezeWebMethod()
 	{
		$this->subject = 0; // current session user
		parent::WebMethod();
 	}
 	
	function setFilter( $filter )
	{
		$this->filter = $filter;
		$this->filter_values = null;
 		$this->Initialize();
	}
	
	function setValues( $values )
	{
		$this->filter_values = $values;
	}
	
	function getFilter()
	{
		return $this->filter;
	}
	
	function setSubject( $subject )
	{
		$this->subject = $subject;
	}

	function extendToCommon( $value = true ) {
 	    $this->extendToCommon = $value;
    }

	function Initialize()
	{ 	
 		$this->filters_name = md5($this->filter);
	}
	
	function getCaption() {
		return text(2684);
	}
	
	function url( $element_selector, $persisted, $redirect = "donothing", $subject = '' )
	{
		$this->redirect = $redirect;
        if ( $subject == '' ) $subject = $this->subject;
		
		return parent::getJSCall( 
			array( 'filter' => $this->filter,
				   'items' => 'function() { return filterLocation.getParametersString(); }',
				   'values' => $persisted
						? 'function() { return filterLocation.getEmptyValuesString(); }'
						: 'function() { return filterLocation.getValuesString(); }',
				   'subject' => $subject )
			);
	}

    function urlCommon( $redirect = "donothing" )
    {
        $this->redirect = $redirect;
        return parent::getJSCall(
            array( 'filter' => $this->filter,
                'items' => 'function() { return filterLocation.getParametersString(); }',
                'values' => 'function() { return filterLocation.getValuesString(); }',
                'subject' => -1 )
        );
    }

	function getRedirectUrl()
	{
		return $this->redirect;
	}
	
	function getDescription()
	{
		return text(646);
	}
	
	function compareStored( $values )
	{
		$object = getSession()->getUserSettings();
		
		$stored = $object->getSettingsValue($this->filters_name, $this->subject);
		if ( in_array($stored, array('','-')) ) return false;
		
		$filters = preg_split('/;/', $stored);
		
		$stored_values = array();
		foreach( $filters as $filter_item ) {
		    list( $filter_name, $filter_value ) = preg_split('/=/', $filter_item);
		    $stored_values[$filter_name] = $filter_value;
		}
		
		foreach( $values as $key => $value ) {
		    if ( count(array_diff(preg_split('/[-,;]/',$stored_values[$key]), preg_split('/[-,;]/',$value))) > 0 ) {
		    	return false;
		    }
		}
		
		return true;
	}
	
	function getQueryString()
	{
		$filters = preg_split('/;/',
			getSession()->getUserSettings()->getSettingsValue($this->filters_name, $this->subject));
		
		if ( count($filters) == 1 && $this->extendToCommon )
			$filters = preg_split('/,/',
				getSession()->getUserSettings()->getSettingsValue($this->filters_name, $this->subject));

		return trim(join($filters, '&'),' -&,');
	}
	
	function getValue( $filter )
	{
		if ( is_null($this->filter_values) )
		{
			$this->filter_values = array();

			$settings = getSession()->getUserSettings();
			if ( !is_object($settings) ) return '';

			$value = $settings->getSettingsValue($this->filters_name);
			if ( in_array($value, array('','-')) && $this->extendToCommon ) {
				$value = $settings->getSettingsValue($this->filters_name, -1);
			}
			
			if ( $value == '' ) return '';
			
			$filters = preg_split( '/;/', $value );
			if ( count($filters) == 1 ) $filters = preg_split( '/,/', $value );

			foreach ( $filters as $value ) {
				list($f_name, $f_value) = preg_split('/=/', $value);
				$this->filter_values[$f_name] = $f_value;
			}
		}

		return $this->filter_values[$filter];
	}
	
 	function execute_request()
 	{
		global $_REQUEST;
 		
 		$this->setFilter( $_REQUEST['filter'] );

		if ( $_REQUEST['items'] == '' )
		{
			getSession()->getUserSettings()->setSettingsValue($this->filters_name, "-", $_REQUEST['subject'] == '' ? null : $_REQUEST['subject']);
		}
		else
		{
	 		$items = preg_split('/,/', $_REQUEST['items']);
	 		
	 		$values = preg_split('/;/', IteratorBase::utf8towin($_REQUEST['values']));
	 		
	 		if ( count($values) == 1 ) $values = preg_split('/,/', $_REQUEST['values']);
	
	 		$combined = array();
	 		
	 		foreach ( $items as $index => $item )
	 		{
	 			$combined[] = $item.'='.$values[$index];
	 		}
	 		
	 		$values = array_filter( $values, function( $value ) {
	 			return $value != '';
	 		});

	 		getSession()->getUserSettings()->setSettingsValue(
	 				$this->filters_name,
	 				count($values) > 0 ? join(";", $combined) : "-", 
	 				$_REQUEST['subject'] == '' ? null : $_REQUEST['subject']
	 		); 
		}
 	}
}
 