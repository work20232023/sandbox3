<?php

include "ProjectTemplateIterator.php";
include "sorts/SortProjectTemplateLanguageClause.php";
include "predicates/ProjectTemplateExceptEditionPredicate.php";
include "ProjectTemplateRegistryAll.php";

class ProjectTemplate extends Metaobject
{
 	function __construct() 
 	{
 		parent::__construct('pm_ProjectTemplate', new ProjectTemplateRegistryAll($this) );

 		$this->setAttributeDefault( 'ProductEdition', 'custom' );
 		
		$this->setSortDefault(
 				array (
 						new SortAttributeClause('OrderNum')	
 				)
 		);
 	}
 	
 	function createIterator() 
 	{
 		return new ProjectTemplateIterator( $this );
 	}

	function getObjects( $section_name )
	{
		$sectionSet = getFactory()->getObject('ProjectTemplateSections');
		$section_it = $sectionSet->getAll();
		
		$section_it->moveTo( 'ReferenceName', $section_name );
		return $section_it->get('items');
	}
	
	function getTemplatePath( $file_name )
	{
		$dirname = SERVER_ROOT_PATH.'templates/project';
		if ( !is_dir($dirname) )
		{
 			mkdir ( $dirname ); 
		}
 		
 		return $dirname.'/'.$file_name;
	}
	
 	function dropTemplate( $file_name, $exported )
 	{
 		$file = fopen ( $this->getTemplatePath($file_name), 'w+' );
 		
	 	fwrite( $file, '<?xml version="1.0" encoding="utf-8"?>' );
	 	fwrite( $file, '<entities>' );

 		foreach ( $exported as $entity )
 		{
			$objects = $this->getObjects( $entity );
	
			foreach( $objects as $object )
			{
                if ( $object instanceof WikiPage ) {
                    $object->setRegistry(new \WikiPageRegistryContent());
                }

			    // export records related to the hosted project only
			    $object->addFilter( new FilterBaseVpdPredicate() );

			    // get all records and serialize it into xml subtree
		 		fwrite( $file, $object->serialize2Xml() );
			}
 		}
 		
	 	fwrite( $file, '</entities>' );
 		fclose ( $file );
 	}
 	
 	function isAttributeVisible( $attr )
 	{
 		switch ( $attr )
 		{
 			case 'IsDefault':
 				return false;
 				
 			default:
 				return parent::IsAttributeVisible( $attr );
 		}
 	}
}