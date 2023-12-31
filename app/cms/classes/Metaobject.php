<?php

// PHPLOCKITOPT NOENCODE
// PHPLOCKITOPT NOOBFUSCATE

include SERVER_ROOT_PATH.'cms/c_object.php';
include SERVER_ROOT_PATH.'cms/c_entity.php'; 
include SERVER_ROOT_PATH.'cms/c_iterator_xml.php';
include_once SERVER_ROOT_PATH."core/classes/model/persisters/ObjectSQLPasswordPersister.php";

include "ObjectMetadataBuilder.php";
include "ObjectMetadataModelBuilder.php";
include "model/sorts/SortAttributeClause.php";
include "model/sorts/SortReferenceNameClause.php";
include "ObjectReferenceParser.php";
include "GroupAttributeClause.php";

define( 'GETTER_ALL', 'all' );
define( 'GETTER_LATEST', 'latest' );
define( 'GETTER_FIRST', 'first' );
define( 'GETTER_COUNT', 'count' );
 
class Metaobject extends StoredObjectDB
{
 	var $entity;
	var $reference_parsers;
	
	private $entity_ref_name = '';
	private $entity_title = '';
	
 	function Metaobject( $entity_refname, ObjectRegistrySQL $registry = null, $metadata_cache_category = '' )
	{
	    global $entity_cache, $session;
	    
		parent::__construct( $registry );
		
		if ( !is_object($entity_cache) ) $entity_cache = new EntityGenerated();
		
		$this->entity = $entity_cache->getByReference( $entity_refname );
		
		if ( $this->entity->getId() < 1 ) throw new Exception('Unknown entity: '.$entity_refname);
		
		$this->entity_ref_name = $this->entity->get('ReferenceName');
		$this->entity_title = $this->entity->getDisplayName();
		$this->reference_parsers = array();
		$this->resetFilters();

		if ( $metadata_cache_category == '' ) {
			$metadata_cache_category = getFactory()->getEntityOriginationService()->getCacheCategory($this);
		}

		$metadata = getFactory()->getMetadataRegistry()->getMetadata($this, $metadata_cache_category);
		$metadata->setObject($this);

		$this->setPersisters( $metadata->getPersisters() ); 
		$attributes = $metadata->getAttributes();

		$this->setAttributes($attributes);
		foreach( $attributes as $key => $attribute )
		{
			if ( $attribute['dbtype'] == 'PASSWORD' )
			{
				$this->addPersister( new ObjectSQLPasswordPersister() );
			}

			if ( $key == 'OrderNum' )
			{
			    $this->setSortDefault( new SortOrderedClause() );
			}
		}

		if ( is_object($session) ) {
            foreach( $session->getBuilders('ObjectModelBuilder') as $builder ) {
                $builder->build( $this );
            }
        }
	}
	
	function getEntity()
	{
		return $this->entity;
	}
	
	function addReferenceParser( $parser )
	{
		foreach( $this->reference_parsers as $item )
		{
			if( get_class($item) == get_class($parser) ) return;
		}
		
		$parser->setObject( $this );
		array_push( $this->reference_parsers, $parser);
	}
	
	function IsReference( $attr )
	{
		$pos = stripos($this->getAttributeDbType( $attr ), 'REF_');
		return $pos !== false;
	}
	
	function getReferenceClassName( $attr )
	{
		$type = $this->getAttributeType($attr);
		
		$type = $this->getAttributeClassName( 
			$attr, substr($type, 4, strlen($type) - 6) );
			
		return $type;
	}
	
	function getClassName() 
	{
	    return $this->entity_ref_name;
	}
	
	function getEntityRefName() 
	{
	    return $this->entity_ref_name;
	}

	function getDisplayName() 
	{
		return preg_replace_callback (
			'/text\(([a-zA-Z\d]+)\)/i', iterator_text_callback, $this->entity_title
		);
	}

	function getEmptyValueName() {
 	    return '';
    }
	
	function getPage() 
	{
		return '?';
	}

	function getPageName() {
		global $_REQUEST;
		$offset = $_REQUEST['offset'];
		return $this->getPage().'class=metaobject&entity='.$this->getClassName().(isset($offset) ? '&offset='.$offset : '');
	}

    function getPageFormPopup() {
 	    return $this->IsDictionary();
    }

	function getPageTableName() {
		global $_REQUEST;
		$offset = $_REQUEST['offset'];
		return $this->getPage().'class=metaobject&entity='.$this->getClassName().'&view=table'.(isset($offset) ? '&offset='.$offset : '');
	}

	function getPageTableFiltered( $field, $value ) {
		global $_REQUEST;
		$offset = $_REQUEST['offset'];
		return $this->getPage().'class=metaobject&entity='.$this->getClassName().'&view=table'.
			   '&filter='.$field.'&filtervalue='.$value.(isset($offset) ? '&offset='.$offset : '');
	}
	
	function IsDeletedCascade( $object )
	{
		return true;
	}
	
	function IsUpdatedCascade( $object )
	{
		return true;
	}
	
	function IsOrdered()
	{
		return $this->entity->get('IsOrdered') == 'Y';
	}

	function IsDictionary()
    {
        return $this->entity->get('IsDictionary') == 'Y';
    }

    function IsPersistable()
    {
        return true;
    }

	function DeletesCascade( $object )
	{
		return true;
	}

	//----------------------------------------------------------------------------------------------------------
 	function getAttributeUserName( $name ) 
 	{
 		switch ( $name )
 		{
 			case $this->getClassName().'Id':
 				return 'Идентификатор';

 			default:
 				return parent::getAttributeUserName( $name );
 		}
	}

	//----------------------------------------------------------------------------------------------------------
	function getAttributeClassName( $name, $class_name ) 
	{
		return $class_name;
	}

	//----------------------------------------------------------------------------------------------------------
	function getAttributeClass( $attribute )
	{
		$att_type = $this->getAttributeDbType( $attribute );
		return substr($att_type, 4, strlen($att_type) - 6);
	}
	
	//----------------------------------------------------------------------------------------------------------
	function getAttributeObject( $attribute )
	{
		$att_type = $this->getAttributeDbType( $attribute );
		
		if ( $att_type == '' ) {
		    throw new Exception('There is no attribute "'.$attribute.'" in the class "'.get_class($this).'"');
		}

		if ( !$this->IsReference( $attribute ) ) {
		    throw new Exception('Attribute "'.$attribute.'" of the class "'.get_class($this).'" is not a reference');
		}
		
	    foreach ( $this->reference_parsers as $parser ) {
			$object = $parser->parse( $attribute, $att_type );
			if ( is_object($object) ) return $object;
		}

        try {
            $attributeClass = getFactory()->getClass($this->getAttributeClass($attribute));
            return getFactory()->getObject($attributeClass);
        }
        catch(\Exception $e) {
            throw new Exception('Attribute "'.$attribute.'" ('.$this->getAttributeDbType($attribute).') of the class "'.get_class($this).'" points to unknown class "'.$attributeClass.'"');
        }
	}
	
	//----------------------------------------------------------------------------------------------------------
	function createIterator() {
		return new OrderedIterator( $this );
	}

	//----------------------------------------------------------------------------------------------------------
	function createUnionIterator() {
		return new UnionIterator( $this );
	}

	//----------------------------------------------------------------------------------------------------------
	function createUnionIteratorFromArray( $iterator_array ) {
		$union_it = $this->createUnionIterator();
		for($i = 0; $i < count($iterator_array); $i++) {
			$union_it->addLink($iterator_array[$i]);
		}
		$union_it->moveFirst();
		return $union_it;
	}

	//----------------------------------------------------------------------------------------------------------
	function createSQLUnionIterator( $sql_query_array )
	{
		$union_it = $this->createUnionIterator();
		for($i = 0; $i < count($sql_query_array); $i++) {
			$union_it->addLink($this->createSQLIterator($sql_query_array[$i]));
		}
		$union_it->moveFirst();
		return $union_it;
	}

	//----------------------------------------------------------------------------------------------------------
	function createXMLIterator( $path )
	{
		return new IteratorXml( $this, $path );
	}

	//----------------------------------------------------------------------------------------------------------
	function serialize2Xml()
	{
		$class_name = strtolower(get_class($this));
		
		if ( $class_name == 'metaobject' )
		{
			$class_name = $this->getClassName();
		}
		
		$xml = '<entity class="'.$class_name.'" encoding="'.APP_ENCODING.'">';
		
		$object_it = $this->getAll();
		$xml .= $object_it->serialize2Xml(); 
				
		return $xml . '</entity>';
	}
	
	function RemoteLoad( $token, $id )
	{
		global $soap;
		return $soap->load( $token, get_class($this), $id );
	}

	function RemoteAdd( $token, $parms )
	{
		global $soap;
		return $soap->add( $token, get_class($this), $parms );
	}

	function RemoteAddBatch( $token, $parms )
	{
		global $soap;
		return $soap->addBatch( $token, get_class($this), $parms );
	}
	
	function RemoteStore( $token, $id, $parms )
	{
		global $soap;
		return $soap->store( $token, get_class($this), $id, $parms );
	}

	function RemoteStoreBatch( $token, $parms )
	{
		global $soap;
		return $soap->storeBatch( $token, get_class($this), $parms );
	}
	
	function RemoteDelete( $token, $id )
	{
		global $soap;
		return $soap->delete( $token, get_class($this), $id );
	}

	function RemoteDeleteBatch( $token, $parms )
	{
		global $soap;
		
		return $soap->deleteBatch( $token, get_class($this), $parms );
	}
	
	function RemoteGetAll( $token )
	{
		global $soap;
		return $soap->getAll( $token, get_class($this) );
	}

	function RemoteFind( $token, $parms )
	{
		global $soap;
		return $soap->find( $token, get_class($this), $parms );
	}

	protected function beforeDelete($deleted_it)
	{
		global $array_to_delete, $deleted_list;

		if ( $deleted_it->getId() < 1 ) return;
		if ( !$this->IsPersistable() ) return;

		parent::beforeDelete($deleted_it);

		$key = $this->getEntityRefName().','.$deleted_it->getId();

		// check if object has been deleted already
		if( !is_array($array_to_delete) ) $array_to_delete = array();
		if( in_array($key, $array_to_delete) ) return;

		$array_to_delete[] = $key;

		if ( UndoLog::Instance()->valid($deleted_it) ) {
		    UndoLog::Instance()->put($deleted_it);
        }

        $this->deleteReferences($deleted_it, $deleted_list);
	}

    function deleteReferences($deleted_it, &$deleted_list)
    {
        $self_it = $deleted_it;

        // get items references to the current one
        $references = getFactory()->getModelReferenceRegistry()->getBackwardReferences($this);

        // delete objects have references to the given one
        foreach ( $references as $attribute_path => $class_name )
        {
            $parts = preg_split('/::/', $attribute_path);
            $attribute = $parts[1];

            $class_name = getFactory()->getClass($class_name);
            if ( !class_exists($class_name, false) ) continue;

            $object = getFactory()->getObject($class_name);
            if ( !$object->IsAttributeStored($attribute) ) continue;
            if ( !$object->IsPersistable() ) continue;

            if ( $this->DeletesCascade($object) && $object->IsDeletedCascade($this) ) {
                $object_it = $object->getRegistryBase()->Query(
                    array (
                        new FilterAttributePredicate($attribute,$deleted_it->getId()),
                        new SortKeyClause()
                    )
                );
                while( $object_it->getId() != '' ) {
                    $deleted_list[] = $object_it->copy();
                    $object->deleteInternal( $object_it );
                    $object_it->moveNext();
                }
            }
            elseif ( $object->IsUpdatedCascade($this) ) {
                $reference_it = $object->getRegistryBase()->Query(
                    array (
                        new FilterAttributePredicate($attribute,$deleted_it->getId()),
                        new SortKeyClause()
                    )
                );
                $this->UpdatesCascade( $attribute, $self_it, $reference_it );
            }
        }
    }

	//----------------------------------------------------------------------------------------------------------
	function delete( $object_id, $record_version = '' )
	{
		global $deleted_list;
		$deleted_list = array();

		getFactory()->resetCachedIterator( $this );
		$object_it = $this->getExact($object_id);
		if ( $object_it->getId() == '' ) return 0;

		$result = $this->deleteInternal( $object_it, $record_version );
		$deleted_list[] = $object_it->copy();

		getFactory()->resetCachedIterator($this);
		foreach( $deleted_list as $object_it ) {
			getFactory()->getEventsManager()->notify_object_delete($object_it);
		}

		return $result;
	}
	
	function UpdatesCascade( $attribute, & $self_it, & $reference_it )
	{
		while( $reference_it->getId() != '' ) {
            if ( UndoLog::Instance()->valid($reference_it) ) {
                UndoLog::Instance()->putReference($reference_it, $attribute);
            }
            $reference_it->object->removeNotificator( 'EmailNotificator' );
			$reference_it->object->modify_parms($reference_it->getId(), array( $attribute => '' ));
			$reference_it->moveNext();
		}
	}

    function formatValueForDB( $name, $value )
    {
        if ( $this->IsReference($name) && is_numeric($value) && $value > 0 ) {
            $ref = $this->getAttributeObject($name);
            if ( $ref->getEntityRefName() != 'entity' ) {
                $ref_it = $ref->getRegistryBase()->Query(
                    array(
                        new FilterInPredicate($value)
                    )
                );
                if ( is_object($ref_it) && $ref_it->getId() == '' ) return 'NULL';
            }
        }
        return parent::formatValueForDB( $name, $value );
    }

    public function getSearchableAttributes()
    {
        $searchAttributes = array();
        if ( $this->getAttributeType('Caption') != '' ) {
            $searchAttributes[] = 'Caption';
        }
        $object = $this;
        return array_unique(array_diff(
            array_filter(
                array_merge( $searchAttributes,
                    $this->getAttributesByType('wysiwyg'),
                    $this->getAttributesByType('text'),
                    $this->getAttributesByType('varchar'),
                    $this->getAttributesByType('file')
                ),
                function( $item ) use ($object) {
                    return $object->IsAttributeStored($item);
                }
            ),
            $this->getAttributesByGroup('system')
        ));
    }

	public function __sleep()
	{
		throw new Exception('Unable serialize Metaobject');
	}
}
