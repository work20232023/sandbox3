<?php

class ModuleIterator extends CacheableIterator
{
	function get( $attribute )
	{
		return preg_replace_callback('/text\(([a-zA-Z\d]+)\)/i', iterator_text_callback, parent::get($attribute));
	}

 	function buildMenuItem( $query_string = '' )
 	{
 	    if ( !getFactory()->getAccessPolicy()->can_read($this) ) return array();

 	    return array( 
			'name' => $this->getDisplayName(), 
			'url' => strpos($query_string, '/') !== false 
 	    				? $this->get('Url').$query_string.'?' 
 	    				: $this->get('Url').($query_string != '' ? '?clear&'.trim($query_string, '?') : ''),
			'uid' => preg_replace('/\//', '-', $this->getId()),
			'icon' => $this->get('Icon'),
 	        'module' => $this->getId()
		);
 	}

	function getUrl( $query_string = '', $projectIt = null )
	{
		$info = $this->buildMenuItem(trim($query_string,'?&'));
		return $info['url'];
	}
}