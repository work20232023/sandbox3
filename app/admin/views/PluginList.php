<?php

include (dirname(__FILE__).'/../methods/c_plugin_methods.php');
include_once SERVER_ROOT_PATH.'cms/c_iterator_file.php';

class PluginList extends StaticPageList
{
	function getIterator()
	{
		$it = new IteratorFile( $this->getObject(), dirname(__FILE__).'/../../plugins' );
		$rowset = $it->getRowset();
		
		foreach( $rowset as $row => $data ) {
			if ( in_array($data['Caption'], array('plugins.php','_factory.php','_methods.php')) ) {
				unset($rowset[$row]);
			}
            if ( pathinfo($data['Caption'], PATHINFO_EXTENSION) != 'php' ) {
                unset($rowset[$row]);
            }
		}
		
		return $this->getObject()->createCachedIterator(array_values($rowset));
	}

	function extendModel()
    {
        parent::extendModel();

        foreach( $this->getObject()->getAttributes() as $attribute => $data ) {
            if ( $attribute == 'Caption' ) continue;
            $this->getObject()->setAttributeVisible($attribute, false);
        }
        $this->getObject()->addAttribute('Description', '', translate('Назначение'), true);
        $this->getObject()->addAttribute('File', '', translate('Файл'), true);
    }

	function IsNeedToDisplay( $attr )
	{
		return $attr == 'Caption' || $attr == 'Description' || $attr == 'File';
	}

	function drawCell( $object_it, $attr )
	{
        $namespaces = getFactory()->getPluginsManager()->getNamespaces();

		if( $attr == 'Caption' )
		{
			foreach ( $namespaces as $namespace )
			{
				if ( $namespace->getFileName() == $object_it->getDisplayName() )
				{
					echo $namespace->getCaption();
					return;
				}
			}
			
			echo $object_it->getDisplayName();
		}

		foreach ( $namespaces as $namespace )
		{
			if ( $namespace->getFileName() == $object_it->getDisplayName() )
			{
				if( $attr == 'Description' )
				{
					echo $namespace->getDescription();
					break;
				}
			}
		}

		if( $attr == 'File' )
		{
			echo $object_it->getDisplayName();
		}
	}

	function IsNeedToDisplayOperations()
	{
		return true;
	}

	function IsNeedToModify()
	{
		return false;
	}

	function getItemActions( $column_name, $object_it )
	{
		$filename = $object_it->getDisplayName();
		$method = new TogglePluginWebMethod($filename);

        $actions = array(
            array(
		    'click' => $method->getJSCall( array('file' => $filename, 'action' => md5(time())) ),
		    'name' => $method->getCaption()
		    )
        );

		return $actions;
	}

	function getRowColor( $object_it, $attr )
	{
		if ( !getFactory()->getPluginsManager()->pluginEnabled($object_it->getDisplayName()) )
		{
			return 'silver';
		}
		else
		{
			return 'black';
		}
	}

	function getGroupFields()
	{
		return array();
	}
}
