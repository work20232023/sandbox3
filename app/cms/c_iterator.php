<?php
// PHPLOCKITOPT NOENCODE
// PHPLOCKITOPT NOOBFUSCATE
use Devprom\ProjectBundle\Service\Model\ModelService;

class IteratorBase
{
 	var $rs = [];
 	var $data = [];
	var $object = null;
	var $pos = 0;
	var $hashes = [];
	var $count = 0;
	var $stop = [];
	var $id_field = '';
    var $entityRefName = '';
	
	function IteratorBase( $object ) 
	{
		$this->setObject($object);
		$this->id_field = $object->getIdAttribute();
	}
	
	public function __sleep()
	{
        if ( !is_array($this->rs) ) {
            $this->setRowset( $this->getRowset() );
        }
		return array('rs', 'id_field', 'entityRefName');
	}
	
	public function __wakeup()
	{
        $this->object = new Metaobject($this->entityRefName);
		$id_attr = $this->getIdAttribute();
		
		if ( !is_array($this->rs) ) $this->rs = array();
		 
		foreach( $this->rs as $key => $row )
		{
			$this->hashes[$id_attr][$row[$id_attr]] = $key;
		}
		
	    $this->count = count($this->rs);
	    
	    $this->pos = 0;
	    
	    $this->fetch();
	}
	
	public function setObject( $object )
	{
		$this->object = $object;
        $this->entityRefName = $object->getEntityRefName();
	}
	
	function getPos() {
		return $this->pos;
	}
	
	function moveFirst() 
	{
		$this->pos = 0;
		
		if ( $this->count() > 0 && !is_array($this->rs) ) {
			DAL::Instance()->Seek($this->rs, $this->pos);
		}
		
		$this->fetch();
	}
	
	function moveNext() 
	{
		$this->pos++;
		
		return $this->fetch();
	}

	function moveToPos( $pos ) 
	{
		$this->pos = $pos;
		
		if ( !is_array($this->rs) )
		{
			if ( $this->count() > 0 ) {
				DAL::Instance()->Seek($this->rs, $pos);
			}
			$this->fetch();
		}

		if ( is_array($this->rs) )
		{
			$this->fetch();
		}
	}
	
	function setStop( $field, $value )
	{
		$this->resetStop();
		
		$this->moveTo($field, $value);

		$this->stop['attr'] = $field;
		$this->stop['value'] = $value;
	}
	
	function resetStop()
	{
		$this->stop = array();
	}
	
 	function buildPositionHash( $fields )
 	{
 		$this->stop = array();
 		$pos = $this->getPos();
 		
		foreach ( $fields as $field ) {
 			$this->hashes[$field] = array();
		}
		
 		$this->moveFirst();
 		while ( !$this->end() ) {
 			foreach ( $fields as $field ) {
                if ( !isset($this->hashes[$field][$this->data[$field]]) ) {
                    $this->hashes[$field][$this->data[$field]] = $this->getPos();
                }
 			}
 			$this->moveNext();
 		}

 		$this->moveToPos( $pos );
 	}

	function moveTo( $attr, $value )
	{
		if ( !is_array($this->rs) )
		{
			if ( is_array($this->hashes[$attr]) ) {
                if ( isset($this->hashes[$attr][$value]) ) {
                    $this->moveToPos( $this->hashes[$attr][$value] );
                } else {
                    $this->pos = $this->count();
                }
			} else {
                $this->moveFirst();
                while ( !$this->end() ) {
                    if ( $this->data[$attr] == $value ) break;
                    $this->moveNext();
                }
            }
		}
		elseif ( !is_null($this->rs) )
		{
			if ( isset($this->hashes[$attr][$value]) )
			{
				$this->pos = $this->hashes[$attr][$value];
				$this->data = $this->rs[$this->pos];
			}
			else
			{
				$result = array_filter($this->rs, function( $row ) use ($attr, $value) { 
			        return $row[$attr] != '' && $row[$attr] == $value;
			    });
			    $this->moveToPos( array_shift(array_keys($result)) );
			}
		}
		return $this;
	}

	function moveToId( $value )
	{
		$this->moveTo( $this->id_field, $value );
		return $this;
	}

	function count() 
	{
	    return $this->count;
	}
	
	function hasAttribute( $attribute )
	{
		return is_array($this->data) && array_key_exists($attribute, $this->data);
	}

	function get_native( $attribute )	
	{
		return $this->data[$attribute];
	}

	function get( $attribute )	
	{
        if ( $this->data[$attribute] == '' && in_array('computed', $this->object->getAttributeGroups($attribute)) )
        {
            $result = ModelService::computeFormula(
                $this->copy(), $this->object->getDefaultAttributeValue($attribute)
            );
            $lines = array();
            foreach ($result as $computedItem) {
                if (!is_object($computedItem)) {
                    $lines[] = TextUtils::stripAnyTags($computedItem);
                } else {
                    $lines[] = $computedItem->getDisplayName();
                }
            }
            return join(', ', $lines);
        }

		return $this->data[$attribute];
	}

	function defined( $attribute )
    {
        return array_key_exists($attribute, $this->data );
    }

	function getHtml( $attribute )	
	{
        $text = preg_replace_callback('/text\(([a-zA-Z\d]+)\)/i', iterator_text_callback, $this->get( $attribute ) );
		return $text;
	}
	
	function getHtmlDecoded( $attribute ) {
		return \TextUtils::decodeHtml($this->get_native($attribute));
	}

	function setData( $data )
	{	
		$this->data = $data;
	}
	
	function getData()
	{	
		return $this->data;
	}

	function getRowset()
	{	
	    if ( !is_array($this->rs) )
	    {
    		$data = array();

    		$this->moveFirst();

    		while( !$this->end() )
    		{
    			$data[] = $this->getData();

    			$this->moveNext();
    		}

    		$this->moveFirst();

    		return $data;
	    }
	    else
	    {
	        return $this->rs;
	    }
	}

	function getResource()
	{
		return $this->rs;	
	}
	
	function setRowset( $rs )
	{
		$this->rs = $rs;
		$this->count = 0;
		
		if ( !is_array($this->rs) ) {
		    $this->count = DAL::Instance()->RowsNum($this->rs);
		}
		else if( is_array($rs) ) {
			$this->hashes = array();
			$id_attr = $this->getIdAttribute();
		    $this->count = count($this->rs);
			
			foreach( $this->rs as $key => $row ) {
				$this->hashes[$id_attr][$row[$id_attr]] = $key; 
			}
		}
		else {
			$this->hashes = array();
			$this->rs = array();
		}
		
		$this->pos = 0;
		$this->fetch();
		
		return $this;
	}
	
	function copy()
	{
	    return $this->object->createCachedIterator( array( $this->getData() ) );
	}
	
 	function copyAll()
	{
	    return $this->object->createCachedIterator( $this->getRowset() );
	}
	
	function setPos( $pos )
	{
		$this->pos = $pos;
	}
	
	function fetch() 
	{
		if ( !is_array($this->rs) ) {
			$this->data = DAL::Instance()->QueryArray($this->rs);
			if ( is_bool($this->data) ) return false;
			$this->data = array_map('stripslashes', $this->data);
		}
		else {
			$this->data = count($this->rs) > 0 ? $this->rs[$this->pos] : array();
			if ( is_null($this->data) ) return false;
		}
		return ($this->pos + 1) < $this->count();
	}

	function end() 
	{
		$end = $this->pos >= $this->count() || $this->count() < 1;
		
		if ( $this->stop['attr'] != '' )
		{
			return $this->get_native($this->stop['attr']) != $this->stop['value'] || $end;
		}
		else
		{
			return $end;
		}
	}

 	function getIdAttribute() 
	{
		return $this->id_field;
	}
	
	function getId() 
	{
		return $this->data[$this->id_field];
	}
	
	function getUniqueId()
	{
        $uid = '';
		$unique_array = $this->object->getUniqueAttributes();
		for ( $i = 0; $i < count($unique_array); $i++ )
		{
			$uid .= $this->data[$unique_array[$i]];
		}
		return md5($uid);
	}	
	
	function getAlternativeKey()
	{
	    $attributes = array_keys($this->object->getAttributes());
	    
	    $key = array();
	    
	    foreach( $attributes as $attribute )
	    {
	        if ( $attribute == 'RecordCreated' ) continue;
	        if ( $attribute == 'RecordModified' ) continue;
	        if ( $attribute == 'OrderNum' ) continue;
	        if ( !$this->object->IsAttributeStored($attribute) ) continue;
	        
	        $key[$attribute] = $this->data[$attribute];
	    }
	    
	    return $key;
	}
	
	function getWordsOnly( $attr, $length = 10 )
	{
 		return $this->getWordsOnlyValue($this->get($attr), $length);
 	}
	
	function getWordsOnlyValue( $value, $length = 10 )
	{
		if ( $length < 1 ) return $value;
		
		if ( strpos($value, 'href="') !== false ) return $value;
		if ( strpos($value, 'url=') !== false ) return $value;
		
 		$result = array();
 		
 		if ( preg_match('/([^\s\,\!\:\;\+\-]+|[\s\r\,\!\:\;\+\-]*){1,'.($length*2).'}/i', $value, $result) === false )
 		{
 			$result[0] = $value;
 		}
 		else
 		{
 			if ( strlen(trim($result[0])) < strlen(trim($value)) )
 			{
 				$result[0] = trim($result[0]).'...';
 			}
 		}

		return $result[0];
	}

	function getObjectDisplayName() {
	    return $this->object->getDisplayName();
    }

	function  getDisplayName()
	{
		$caption = $this->get("Caption");
		
		if ( $caption == '' ) $caption = $this->get(2);
		
		return $caption;
	}

    function getDisplayNameExt( $prefix = '' )
    {
        $displayAttributes = array(
            $prefix, $this->getDisplayName()
        );
        foreach( $this->object->getAttributesByGroup('display-name') as $attribute ) {
            if ( $this->get($attribute) == '' ) continue;
            $value = $this->get($attribute);
            $groups = $this->object->getAttributeGroups($attribute);
            if ( count(array_intersect(['astronomic-time', 'daily-hours'], $groups)) > 0 ) {
                $value = getSession()->getLanguage()->getDurationWording(abs($value), 24);
            }
            $displayAttributes[] = "[<span att-ref=\"{$attribute}\" title=\"{$this->object->getAttributeUserName($attribute)}\">{$value}</span>]";
        }

        $title = join(' ', $displayAttributes);

        if ( $this->get('TagNames') != '' ) {
            $tags = array_map(function($value) {
                return ' <span class="label label-info label-tag">'.$value.'</span> ';
            }, preg_split('/,/', $this->get('TagNames')));
            $title = join('',$tags) . $title;
        }

        return $title;
    }

    function getDisplayNameSearch( $prefix = '' ) {
        return trim($prefix . ' ' . $this->getDisplayName());
    }

	function getDescription() {
		if($this->get("Description") != '') return $this->get("Description");
		return $this->get(3);
	}
	
	function isImage( $attribute ) {
		$parts = preg_split('/\//', $this->getImageMime( $attribute ));
		return $parts[0] == 'image';
	}

	function getImageMime( $attribute )	{
		return $this->get($attribute.'Mime');
	}

	function getFileMime( $attribute )	{
		return $this->get($attribute.'Mime');
	}

	function getFileSizeKb($attribute)
	{
		$path = $this->getFilePath($attribute);
		if ( !file_exists($path) ) return 0;
		
		return round(filesize($path) / 1024, 1);
	}

	function getFileSizeMb($attribute) 
	{
		return round(filesize($this->getFileSizeKb($attribute)) / 1024, 1);
	}
	
	function getFileName($attribute) 
	{
		return $this->get($attribute.'Ext');
	}

	function getFilePath($attribute) 
	{
		return SERVER_FILES_PATH.$this->object->getClassName().
			'/'.basename($this->get($attribute.'Path'));
	}

	function getFileUrl() 
	{
		if ( $this->get('ProjectCodeName') != "" ) {
			return \EnvironmentSettings::getServerUrl() .
                '/file/'.$this->object->getClassName().'/'.$this->get('ProjectCodeName').'/'.$this->getId();
		}
		else {
			return \EnvironmentSettings::getServerUrl() .
                '/file/'.$this->object->getClassName().'/'.$this->getId();
		}
	}
	
	function getCreated() {
		return $this->data['RecordCreated'];
	}

	function getDateFormatted($attribute)
	{
		return getSession()->getLanguage()->getDateFormatted(
            $this->object->getAttributeType($attribute) == 'date'
                ? $this->get_native($attribute)
                : SystemDateTime::convertToClientTime($this->get_native($attribute))
        );
	}

	function getDateFormattedShort($attribute)
	{
		return getSession()->getLanguage()->getDateFormattedShort(
            $this->object->getAttributeType($attribute) == 'date'
                ? $this->get_native($attribute)
                : SystemDateTime::convertToClientTime($this->get_native($attribute))
        );
	}

	function getDateFormatUser($attribute, $format)
	{
		return getSession()->getLanguage()->getDateUserFormatted(
		    $this->object->getAttributeType($attribute) == 'date'
                ? $this->get_native($attribute)
                : SystemDateTime::convertToClientTime($this->get_native($attribute)),
            $format );
	}

	function getDateTimeFormat($attribute) 
	{
		return getSession()->getLanguage()->getDateTimeFormatted(	$this->get_native($attribute) );
	}

	function getTimeFormat($attribute) 
	{
		return getSession()->getLanguage()->getTimeFormatted(	$this->get_native($attribute) );
	}
	
	function getHintFormat( $attribute ) {
		return str_replace('"', '\'\'', $this->get_native($attribute));
	}
	
	function getRef( $attribute, $object = null ) 
	{
		if ( is_null($object) ) {
		    $object = $this->object->getAttributeObject( $attribute );
		    if ( is_null($object) ) return $this->object->getEmptyIterator();
		}
        if ( trim($this->data[$attribute]) == '' ) {
            return $object->getEmptyIterator();
        }
        $ids = \TextUtils::parseItems($this->data[$attribute]);
		return $object->getExact(count($ids) > 1 ? $ids : $this->data[$attribute]);
	}
	
	function modify( $parms ) 
	{
		try
		{
			Logger::getLogger('System')->error('OBSOLETE. IteratorBase::modify - do not use the method, it will be removed in future updates');
		}
		catch(Exception $e)
		{
		}
		return $this->object->modify_parms( $this->getId(), $parms );
	}
	
	function delete()
	{
	    if ( $this->getId() == '' ) throw new Exception('Can\'t delete empty object');
	    
		return $this->object->delete( $this->getId() );
	}
	
 	function getAddUrl() 
	{
	    $this->object->setVpdContext($this);
	    
		$url = $this->object->getPageNameObject();
		
		$this->object->setVpdContext();
		
		return $url;
	}
	
	function getEditUrl() 
	{
	    $this->object->setVpdContext($this);
	    
	    $url = $this->object->getPageNameEditMode($this->getId());
	    
	    $this->object->setVpdContext();
	    
	    return $url;
	}
	
	function getViewUrl() 
	{
	    $this->object->setVpdContext($this);
	    
		$url = $this->object->getPageNameViewMode($this->getId());
		
		$this->object->setVpdContext();
		
		return $url;
	}
	
	function getUidUrl()
	{
		return $this->getViewUrl();
	}
	
	function getCommentsUrl() {
		return $this->getUidUrl().'#comments';
	}
	
	function toArray( $field_name )
	{
		$array = array();
		for($i = 0; $i < $this->count(); $i++)
 		{
 			array_push($array, $this->get($field_name));
 			$this->moveNext();
 		}
		return $array;
	}
	
 	function getCurrentIt() 
 	{
 		return $this->object->createCachedIterator(array($this->getData()));
 	}
 	
 	function getClass( $class_name )
 	{
 		return getFactory()->getObject($class_name);
 	}
 	
 	function idsToArray()
 	{
 		$result = array();
 		$pos = $this->pos;
 		
 		$this->moveFirst();
		while ( !$this->end() )
		{
			if ( $this->getId() != '' ) {
				array_push( $result, $this->getId() );
			}
			$this->moveNext(); 		
		}

		if ( count($result) < 1 ) {
			array_push($result, 0);
		}

		if ( $pos < $this->count() ) {
 			$this->moveToPos($pos);
		}
 		return array_unique($result);
 	}

    function fieldToArray( $field ) {
        $pos = $this->getPos();

        $result = array_unique(
            array_map(
                function($row) use($field) {
                    return $row[$field];
                },
                $this->getRowset()
            )
        );

        $this->moveToPos( $pos );
        return $result;
 	}

    function getSumByField( $field ) {
        return array_sum(
                array_map(
                    function($row) use($field) {
                        return floatval($row[$field]);
                    },
                    $this->getRowset()
                )
            );
    }

	function Utf8ToWin($fcontents)
	{
		return $fcontents;
	}

	static function wintoutf8($s)
 	{
 		return $s;
 	}   

 	function serialize2Xml( $skipTypes = array(), $useAttributes = array() )
 	{
 		$this->moveFirst();
		$xml = '';
		while ( !$this->end() )
		{
		    if ( $this->getId() == '' ) {
                $this->moveNext();
                continue;
            }

			$xml .= '<object id="'.$this->getId().'">';
			
			$keys = count($useAttributes) > 0
                ? $useAttributes
                : array_keys($this->object->getAttributes());
			
			for( $i = 0; $i < count($keys); $i++ )
			{
                if ( !$this->object->IsAttributeStored($keys[$i]) ) continue;

				$value = $this->get($keys[$i]);
				$encoding = '';
				
				$type = $this->object->getAttributeType($keys[$i]);
                if ( in_array($type, $skipTypes) ) continue;
				
				switch ( $type )
				{
					case 'wysiwyg':
                        $value = preg_replace_callback( '/<img\s+([^>]*)>/i', array('HtmlImageConverter', 'replaceImageCallback'), $value);
				    case 'text':
				    case 'varchar':
				    case 'password':
				        if ( $value != '' ) {
    						$value = '<![CDATA['.base64_encode($value).']]>';
    						$encoding = ' encoding="base64"';
    					}
    					break;

				    case 'file':
				        if ( file_exists( $this->getFilePath($keys[$i]) ) ) {
    						$value = '<![CDATA['.base64_encode(file_get_contents($this->getFilePath($keys[$i]))).']]>';
    						$encoding = ' encoding="base64"';
				        }
    					break;
				}
				
				$xml .= '<attr name="'.$keys[$i].'" type="'.$type.'"'.$encoding.'>';
				if ( $value != '' ) $xml .= $value;
				$xml .= '</attr>';
			}

			$xml .= '<attr name="RecordCreated" type="datetime">'.$this->get('RecordCreated').'</attr>';
			$xml .= '<attr name="RecordModified" type="datetime">'.$this->get('RecordModified').'</attr>';
            $xml .= '<attr name="VPD" type="char">'.$this->get('VPD').'</attr>';
			$xml .= '</object>';
			
			$this->moveNext();
		}
		
		return $xml;
 	}
}

 // упорядоченный итератор
 class OrderedIterator extends IteratorBase
 {
 	function OrderedIterator ( $object )
 	{
 		parent::IteratorBase( $object );
 	}

	function getOrderNum()	{
		return $this->get('OrderNum');
	}

	function hasReferencedRecords()
	{
		$references = getFactory()->getModelReferenceRegistry()->getBackwardReferences($this->object);
		
		// delete objects have references to the given one
		foreach ( $references as $attribute_path => $class_name )
		{
            $parts = preg_split('/::/', $attribute_path);
		    
		    $attribute = $parts[1];

            $class_name = getFactory()->getClass($class_name);

            if ( !class_exists($class_name, false) ) continue;

		    $object = getFactory()->getObject($class_name);
		    
			$items = $object->getByRefArrayCount( array($attribute => $this->getId()) );
			
			if ( $items > 0 ) return true;
		}
		
		return false;
	}
}
 
 // итератор по дереву
 class TreeIterator extends OrderedIterator
 {
	function getParentId()
	{
		return $this->get('parent'.$this->object->getClassName().'id');
	}
	
	function getParentIdsArray()
	{
		$parent_ids = array();
		$object_it = $this;
		do {
			$parent_id = $object_it->getParentId();
			if(!is_null($parent_id)) {
    			$object_it = $this->object->getExact($parent_id);
    			array_push($parent_ids, $parent_id);
			}
		}
		while(!is_null($parent_id));
		
		return $parent_ids;
	}
 }

 /////////////////////////////////////////////////////////////////////////////
 class HashIterator extends OrderedIterator
 {
 	var $iterator, $hash_table;
 	
 	function HashIterator( $object, $hash_fields, $iterator )
 	{
 		parent::OrderedIterator($object);
 		$this->iterator = $iterator;
 		$this->iterator->moveFirst();
 		
 		for( $i = 0; $i < $this->iterator->count(); $i++ )
 		{
 			$values = array();
 			for ( $j = 0; $j < count($hash_fields); $j++ )
 			{
 				array_push($values, $this->iterator->get($hash_fields[$j]));	
 			}
 			
 			$this->hash_table[md5(join(':', $values))] = $this->iterator->data;
 			$this->iterator->moveNext();
 		}
 	}
 	
 	function find( $parms )
 	{
 		$hash = md5(join(':', $parms));
 		$this->data = $this->hash_table[$hash];
 		
 		if ( $this->data == '' )
 		{
 			$this->data = array();
 			return false;
 		}
 		
 		return true;
 	}
 }

/////////////////////////////////////////////////////////////////////////////////////////////////////////////
function sharelink_shrinker_callback( $match )
{
    return '<a target="_blank" href="'.$match[0].'">'.$match[0].'</a>';
}

 /////////////////////////////////////////////////////////////////////////////////////////////////////////////
 function iterator_text_callback( $match )
 {
 	$result = text($match[1]);

 	return $result == $match[1] ? $match[0] : $result;
 }
