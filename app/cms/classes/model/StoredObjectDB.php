<?php
// PHPLOCKITOPT NOENCODE
// PHPLOCKITOPT NOOBFUSCATE

include "ObjectRegistrySQL.php";
include "ObjectRegistryArray.php";
include "ObjectRegistryMemory.php";
include "predicates/FilterPredicate.php";
include "predicates/FilterAdditionalObjectsPredicate.php";
include "predicates/FilterAttributePredicate.php";
include "predicates/FilterBaseVpdPredicate.php";
include "predicates/FilterInPredicate.php";
include "predicates/FilterNotInPredicate.php";
include "predicates/FilterModifiedAfterPredicate.php";
include "predicates/FilterModifiedSinceSecondsPredicate.php";
include "predicates/FilterCreatedSinceSecondsPredicate.php";
include "predicates/FilterModifiedMoreThanSecondsPredicate.php";
include "predicates/FilterModifiedBeforePredicate.php";
include "predicates/FilterNextSiblingsPredicate.php";
include "predicates/FilterNextKeyPredicate.php";
include "predicates/FilterPrevSiblingsPredicate.php";
include "predicates/FilterNoVpdPredicate.php";
include "predicates/FilterSubmittedAfterPredicate.php";
include "predicates/FilterSubmittedBeforePredicate.php";
include "predicates/FilterSubmittedDatePredicate.php";
include "predicates/FilterVpdPredicate.php";
include "predicates/FilterHasNoAttributePredicate.php";
include "predicates/FilterSearchAttributesPredicate.php";
include "predicates/FilterTextExactPredicate.php";
include "predicates/FilterDateAfterPredicate.php";
include "predicates/FilterDateBeforePredicate.php";
include "predicates/FilterAttributeNullPredicate.php";
include "predicates/FilterAttributeNotNullPredicate.php";
include "predicates/FilterAttributeGreaterPredicate.php";
include "predicates/FilterAttributeLesserPredicate.php";
include "predicates/FilterAttributeHiePredicate.php";
include "predicates/FilterDummyPredicate.php";
include "predicates/FilterEmptyPredicate.php";
include "predicates/ParentTransitiveFilter.php";
include "sorts/SortClauseBase.php";
include "sorts/SortCaptionClause.php";
include "sorts/SortOrderedClause.php";
include "sorts/SortIndexClause.php";
include "sorts/SortRecentClause.php";
include "sorts/SortKeyClause.php";
include "sorts/SortUIDClause.php";
include "sorts/SortRevOrderedClause.php";
include "sorts/SortVPDClause.php";
include "sorts/SortRecentModifiedClause.php";

class StoredObjectDB extends AbstractObject
{
	var $aggregates = array();
 	var $vpd_enabled;
 	var $disabled_notificators;
 	var $vpd_context;
 	var $notification_enabled;
 	var $default_sorts = array();
 	private $registry = null;
 	private $persisters = array();
 	private $filters = array();
	
	//----------------------------------------------------------------------------------------------------------
	function StoredObjectDB( ObjectRegistrySQL $registry = null ) 
	{
		$this->setRegistry(is_object($registry) ? $registry : new ObjectRegistrySQL());
		$this->resetFilters();
		$this->resetPersisters();

		$this->vpd_enabled = true;
		$this->notification_enabled = true;
		$this->disabled_notificators = array();
		$this->vpd_context = '';
	}
	
	function getEntityRefName()
	{
		return $this->getClassName();
	}
	
	function getOrderStep()
	{
	    return 1;
	}
	
	//----------------------------------------------------------------------------------------------------------
	function getDefaultAttributeValue( $name ) 
	{
	    switch ( $name )
	    {
	        case 'OrderNum':
				if ( $this->IsDictionary() || $this->IsAttributeRequired($name) ) {
					if ( in_array($this->getVpdValue(), array('','-')) ) {
                        $it = $this->createSQLIterator(
                            "SELECT MAX(t.OrderNum) OrderNum FROM ".$this->getEntityRefName()." t "
                        );
					}
					else {
                        $it = $this->createSQLIterator(
                            "SELECT MAX(t.OrderNum) OrderNum FROM ".$this->getEntityRefName()." t WHERE t.VPD = '".$this->getVpdValue()."'"
                        );
                    }
					return $it->get( 'OrderNum' ) == '' ? 1 : $it->get( 'OrderNum' ) + $this->getOrderStep();
				}
				return 0;

	        default:
	            return parent::getDefaultAttributeValue( $name );
	    }
	}
	
	function isString( $attribute )
	{
		$type = $this->getAttributeType($attribute);
		
		return $type == '' || $type == 'text' || $type == 'datetime' || $type == 'date' || 
			$type == 'char' || $type == 'varchar';
	}

	//----------------------------------------------------------------------------------------------------------
	function getDataPredicate( $getter_kind ) 
	{
		return '1 = 1';
	}
	
	function checkSelectOnly( $sql )
	{
		/*
		$lowered = strtolower($sql);
		
		$result = strpos( $lowered, 'delete' ) > 0 ||
			strpos( $lowered, 'update' ) > 0 || strpos( $lowered, 'insert' ) > 0 ||
			strpos( $lowered, 'truncate' ) > 0 || strpos( $lowered, 'merge' ) > 0;
			
		if ( $result )
		{
			die();
		}
		*/
	}
	
	function checkInsertOnly( $sql )
	{
	}

	function checkUpdateOnly( $sql )
	{
	}

	function checkDeleteOnly( $sql )
	{
	}

  	//----------------------------------------------------------------------------------------------------------
	function getEmptyIterator() 
	{
	    return $this->createCachedIterator(array());
	}
	
	//----------------------------------------------------------------------------------------------------------
	function createCachedIterator( $rowset ) 
	{
		$iterator = $this->createIterator();

		$iterator->setRowset($rowset);
		
		return $iterator;
	}
		
	function setVpdContext( $context = null )
	{
		if ( is_string($context) ) {
			$this->vpd_context = $context;
			return; 
		}
		if ( is_a($context, 'OrderedIterator') ) {
			$this->vpd_context = $context->get('VPD');
			return; 
		}
		if ( is_a($context, 'SotredObjectDB') ) {
			$this->vpd_context = $context->getVpdValue();
			return; 
		}
		$this->vpd_context = '';
	}
	
	function getVpdContext()
	{
		return $this->vpd_context;
	}

	function getVpdValue()
	{
		$origin = getFactory()->getEntityOriginationService()->getSelfOrigin($this);
		
		if ( $origin == '' ) return '';
		
		return $this->vpd_context != '' ? $this->vpd_context : $origin;
	}
	
	function getVpds()
	{
        if ( $this->getVpdValue() == '' ) return array();

    	if ( $this->vpd_context != '' )
    	{
    		$vpds = array( $this->vpd_context );
    	}
    	else
    	{
        	$vpds = getFactory()->getEntityOriginationService()->getAvailableOrigins($this);
    	}

        return count($vpds) > 0 ? $vpds : array();
	}
	
	function getVpdPredicate( $alias = 't' )
	{
	    $vpds = $this->getVpds();
	    
	    if ( count($vpds) < 1 ) return "";
	    
    	if ( $alias != '' ) $alias .= ".";
    	
    	$sql = " AND ".$alias."VPD IN ('".join($vpds, "','")."') ";
        
        return $sql;
	}

	function getRecordCount( $alias = 't' ) {
	    return $this->getRegistry()->Count();
	}
	
	//----------------------------------------------------------------------------------------------------------
	function getExact( $objectid ) 
	{
        $objectid = \TextUtils::parseItems($objectid);
	    if ( count($objectid) < 1 ) return $this->getEmptyIterator();
        return $this->getRegistry()->QueryById($objectid);
	}

	public function setRegistry( $registry )
	{
		$this->registry = $registry;
		$this->registry->setObject($this);
	}
	
	public function getRegistry()
	{
		if ( !is_object($this->registry) ) return $this->registry;

        $registry = clone $this->registry;
        $registry->setObject($this);
        $registry->setFilters($this->getFilters());
        $registry->setSorts($this->getSortDefault());
        $registry->setPersisters( $this->persisters );

        return $registry;
	}

    public function getRegistryBase( array $attributes = [] )
    {
        if ( !is_object($this->registry) ) return $this->registry;

        $registry = clone $this->registry;
        $registry->setObject($this);
        $registry->setFilters(array());
        $registry->setGroups(array());
        $registry->setSorts($this->getSortDefault());
        
        $displayNameAttributes = array_merge(
            $this->getAttributesByGroup('display-name'),
            $attributes
        );

        $registry->setPersisters(
                array_filter($this->persisters, function($persister) use ($displayNameAttributes)
                {
                    if ( $persister->IsPersisterImportant() ) return true;
                    return count(array_intersect($displayNameAttributes, $persister->getAttributes())) > 0;
                })
            );

        return $registry;
    }

	function createSQLIterator( $sql )
	{
		return $this->registry->createSQLIterator( $sql );
	}
	
	// to be removed
	function getAll() {
		return $this->getRegistry()->Query(array(
		    new FilterVpdPredicate()
        ));
	}

	//----------------------------------------------------------------------------------------------------------
	function getByRef( $reference_field, $reference_object) 
	{
		return $this->getByRefArray( array( $reference_field => $reference_object ) );
	}

	//----------------------------------------------------------------------------------------------------------
	function getByRef2( $reference_field, $reference_object, $reference_field2, $reference_object2) 
	{
		return $this->getByRefArray(
			array( $reference_field => $reference_object,
				   $reference_field2 => $reference_object2 ) );
	}

	//----------------------------------------------------------------------------------------------------------
	function getByRefArrayWhere( $field_values, $limited_records = 0, $alias = 't') 
	{
		$reference_field = array_keys($field_values);
		$sql = '';
		
		for($i = 0; $i < count($reference_field); $i++) 
		{
			$field_name = $reference_field[$i];
			
			if ( strpos($field_name, "(") === false && !is_numeric($field_name) ) {
				$field_name = $alias.".".$field_name;
			}
			
			if( is_array($field_values[$reference_field[$i]]) ) 
			{
				if ( count($field_values[$reference_field[$i]]) < 1 )
				{
					$field_values[$reference_field[$i]] = array(0);
				}
				else
				{
					for ( $p = 0; $p < count($field_values[$reference_field[$i]]); $p++ )
					{
						$field_values[$reference_field[$i]][$p] =  
							$this->formatValueForDb($reference_field[$i], $field_values[$reference_field[$i]][$p]);
					}
				}
				
				$sql .= $field_name.' IN ('.join(',', $field_values[$reference_field[$i]]).')';
			} 
			elseif( is_object($field_values[$reference_field[$i]]) && is_subclass_of($field_values[$reference_field[$i]], 'OrderedIterator') ) 
			{
				$array_values = $field_values[$reference_field[$i]]->idsToArray();
				
				if ( count($array_values) < 1 )
				{
					array_push($array_values, 0);
				}
				
				if( $this->isString($reference_field[$i]) ) 
				{
					$sql .= $field_name." IN ('".join("','", $array_values)."')";
				} 
				else 
				{
					$sql .= $field_name.' IN ('.join(',', $array_values).')';
				}
			} 
			else 
			{
				if(strtolower($field_values[$reference_field[$i]]) == 'null' or 
					$field_values[$reference_field[$i]] == '') 
				{
					$sql .= "IF(".$field_name." = '', NULL, ".$field_name.")".' IS NULL';
				}
				elseif(strtolower($field_values[$reference_field[$i]]) == 'not null')
				{ 
					$sql .= "IF(".$field_name." = '', NULL, ".$field_name.")".' IS NOT NULL';
				}
				else
				{
					$field_values[$reference_field[$i]] = DAL::Instance()->Escape($field_values[$reference_field[$i]]);
					
					if ( $this->getAttributeType($reference_field[$i]) == 'integer' && !is_numeric($field_values[$reference_field[$i]]) )
					{
						$regexp = str_replace('-', '[^[:alnum:]]+', 
							addslashes(preg_quote($this->utf8towin(trim($field_values[$reference_field[$i]])))) );
							
						$sql .= " TRIM(Caption) REGEXP '^".$regexp."$' ";
					}
					else
					{
						$field_values[$reference_field[$i]] = 
							$this->formatValueForDB($reference_field[$i], $field_values[$reference_field[$i]]);
						
						if( $this->isString($reference_field[$i]) ) {
							$sql .= "BINARY ".$field_name." = ".$field_values[$reference_field[$i]];
						}
						else
						{
							$sql .= $field_name.' = '.$field_values[$reference_field[$i]];
						}
					}
				}
			}

			if( $i < count($reference_field) - 1 ) {
				$sql .= ' AND ';
			}
		}					   
		
		if ( count($reference_field) < 1 )
		{
			$sql .= ' 1 = 1 ';
		}
		
		if ( !in_array('VPD', array_keys($field_values)) )
		{
			$sql .= $this->getVpdPredicate($alias);
		}

		$sql .= $this->registry->getFilterPredicate(array());

		return $sql;
	}
	
	//----------------------------------------------------------------------------------------------------------
	function getByRefArray( $field_values, $limited_records = 0, $offset_page = 0) 
	{
		$sql = 'SELECT '.$this->getRegistry()->getSelectClause(array(), 't').' FROM '.$this->getRegistry()->getQueryClause(array()).' t WHERE ';
		$sql .= $this->getByRefArrayWhere( $field_values, $limited_records );
		
		$limited_records = DAL::Instance()->Escape($limited_records);
		$offset_page = DAL::Instance()->Escape($offset_page);

		$group = $this->getGroupClause('t');

		if ( $group != '' )
		{
			$sql .= ' GROUP BY '.$group;
		}
		
		$sort = $this->registry->getSortClause(array(), 't');
		
		if ( $sort != '' )
		{
			$sql .= ' ORDER BY '.$sort;
		}
		else
		{
			if(isset($this->defaultsort)) $sql .= ' ORDER BY '.$this->defaultsort;
		}
		
		if($limited_records > 0) $sql .= ' LIMIT '.$limited_records.' OFFSET '.($offset_page * $limited_records);

		return $this->createSQLIterator($sql);
	}

	//----------------------------------------------------------------------------------------------------------
	function getByRefArrayCount( $field_values, $alias = 't' ) 
	{
		$sql = 'SELECT COUNT(1) FROM '.$this->getRegistry()->getQueryClause(array()).' '.$alias.' WHERE ';

		$sql .= $this->getByRefArrayWhere( $field_values, 0, $alias );

		$this->checkSelectOnly($sql);

		$data = DAL::Instance()->QueryArray($sql);

   		return $data[0] == '' ? 0 : $data[0];
	}

	//----------------------------------------------------------------------------------------------------------
	function getByRefArrayLatest( $field_values)
	{
		$this->defaultsort = 'RecordModified DESC';
		return $this->getByRefArray( $field_values, 1 );
	}
	 
	// to be removed
	function getFirst( $limit = 1, $sorts = null )
	{
		$registry = $this->getRegistry();
		$registry->setLimit( $limit );
		
		return $registry->Query(array(
            new SortAttributeClause('RecordCreated'),
            new FilterVpdPredicate()
        ));
	}
	
	//----------------------------------------------------------------------------------------------------------
	function getLatest( $limit = 10, $offset = 0 )
	{
		$registry = $this->getRegistry();
		$registry->setLimit( $limit );
		return $registry->Query(array(
                    new SortRecentClause(),
                    new FilterVpdPredicate()
                ));
	}

	function getAggregated( $aggs = array(), $filters = array(), $sorts = array(), $persisters = array() )
	{
		$outer_columns = array();
		$inner_columns = array();
		$agg_attrs = array();
		$agg_columns = array();

		$usedPersisters = array();
        $registry = $this->getRegistry();
        $persisters = array_merge($registry->getPersisters(), $persisters);

        if ( count($filters) < 1 ) {
            if ( $this->getVpdValue() != '' ) {
                $filters[] = new FilterVpdPredicate();
            }
        }

		foreach ( $aggs as $aggregate )
		{
            $aggregate->setObject($this);

			foreach( $persisters as $persister ) {
				if ( !$persister instanceof ObjectPersister ) continue;
                if ( $persister->IsPersisterImportant() ) continue;
				if ( count(array_intersect(array($aggregate->getAggregatedAttribute(), $aggregate->getAttribute()), $persister->getAttributes())) < 1 ) continue;
				$usedPersisters[get_class($persister)] = $persister;
			}

			// custom attributes are part of inner select already, just skip it
			if ( $this->getAttributeOrigin($aggregate->getAttribute()) != ORIGIN_CUSTOM ) {
				$column = trim($aggregate->getInnerColumn());
				if ( $column != '' ) $inner_columns[$column] = $column;
			}
			
			$column = trim($aggregate->getColumn(), ' `');
			if ( $column != '' ) $outer_columns[$column] = $column;

			$column = trim($aggregate->getAggregatedInnerColumn(), ' `');
			if ( $column != '' ) $agg_attrs[$column] = $column;
			
			$column = trim($aggregate->getAggregateColumn(), ' `');
			if ( $column != '' ) $agg_columns[$column] = $column;
			
			$alias = $aggregate->getAlias();
		}

		$registry = $this->getRegistryBase();

		$inner_columns = array_unique(array_merge( array_unique($inner_columns), array_unique($agg_attrs) ));
		
		$select_clause = $registry->getSelectClause($usedPersisters, $alias, false);
		foreach( $inner_columns as $key => $column ) {
			$column = str_replace($alias.'.', '', $column);
			if ( strpos( $select_clause, ') '.$column.' ' ) > 0 || strpos( $select_clause, '`'.$column.'`' ) > 0 ) {
			    unset($inner_columns[$key]);
			} 
		}

		$sort_clause = $registry->getSortClause($sorts, $alias);

		$inner_select = ($select_clause != ''
			? join(',', array_merge($inner_columns, array($select_clause))) 
			: join(',', $inner_columns));

		$sql = " SELECT ".join(',', $outer_columns).", ".join(',', $agg_columns).
			   "   FROM (SELECT ".$inner_select.
			   "		   FROM ".$registry->getQueryClause(array())." t, (SELECT @row_num:=0) foo " .
			   "          WHERE 1 = 1 {$registry->getFilterPredicate($filters)} ".
			   ($sort_clause != '' ? " ORDER BY ".$sort_clause : "").
			   "		) t ".
			   "  GROUP BY ".join(',', $outer_columns);

		return $this->createSQLIterator( $sql );
	}
	
	//----------------------------------------------------------------------------------------------------------
	function getAggregatedHistory( $aggs = array(), $predicates = array() )
	{
		$agg_predicate = '';
		$object_predicate = '';

		$aggregate = array_pop($aggs);
        $aggregate->setObject($this);

        foreach( $predicates as $filter )
        {
            $filter->setObject($this);

			if ( $filter instanceof FilterModifiedAfterPredicate || $filter instanceof FilterModifiedBeforePredicate ) {
                $filter->setAlias('h');
                $agg_predicate .= $filter->getPredicate();
                continue;
            }

            $filter->setAlias('t');
            $filter_sql = $filter->getPredicate();

            if ( strpos($filter_sql, $aggregate->getColumn().' ') !== false ) {
                $object_predicate .= str_replace( $aggregate->getColumn(), 'h.AttributeValue', $filter_sql );
            }
            $object_predicate .= $filter_sql;
        }

		if ( $object_predicate != '' )
		{
		    $sql = " SELECT UNIX_TIMESTAMP(FROM_DAYS(TO_DAYS(t.RecordCreated))) DayDate, " .
				   "		".$aggregate->getColumn().", " .
				   " 		".$aggregate->getAggregateColumn().
				   "   FROM (SELECT h.RecordCreated, h.RecordModified, h.AttributeValue ".$aggregate->getAttribute().
				   "           FROM ".$this->getEntityRefName()." t," .
				   " 	    		cms_EntityCluster h ".
				   "  		  WHERE 1 = 1 ".
									$this->getVpdPredicate('t').
									$agg_predicate.$object_predicate.
                   "    		AND h.VPD = t.VPD " .
				   "    		AND h.ObjectClass = '".get_class($this)."' " .
				   "    		AND h.ObjectAttribute = '".$aggregate->getAttribute()."'" .
				   "    		AND h.ObjectIds LIKE CONCAT('%,',t.".$this->getEntityRefName()."Id,',%') ".
				   " 		) t ".
				   "  GROUP BY 1, 2";
		}
		else
		{
            $sql = " SELECT UNIX_TIMESTAMP(FROM_DAYS(TO_DAYS(t.RecordCreated))) DayDate, " .
				   "		".$aggregate->getColumn().", " .
				   " 		SUM(t.TotalCount) ".$aggregate->getAggregateAlias().
				   "   FROM (SELECT h.RecordCreated, h.RecordModified, ".
				   "                h.TotalCount, h.AttributeValue ".$aggregate->getAttribute().
				   "           FROM cms_EntityCluster h ".
				   "  		  WHERE 1 = 1 ".$agg_predicate.
				   "    		AND h.ObjectClass = '".get_class($this)."' " .
				   "    		AND h.ObjectAttribute = '".$aggregate->getAttribute()."' ".
				   " 		) t ".
				   "  GROUP BY 1, 2";
		}
        if ( $this->registry->getLimit() > 0 ) {
            $sql .= " LIMIT ".$this->registry->getLimit();
        }
		return $this->createSQLIterator( $sql );
	}

	//----------------------------------------------------------------------------------------------------------
	function getAttributeRDBMSDefinition( $attribute_name )
	{
	   $attribute_type = $this->getAttributeType($attribute_name);
	   $sql = '';

       if($attribute_type == 'price') {
        $sql .= " Price INTEGER, PriceCode varchar(32)";
        return $sql;
       }
       if($attribute_type == 'richtext') {
        $sql .= $attribute_name.' TEXT';
        return $sql;
       }
       if($attribute_type == 'varchar') {
        $sql .= $attribute_name.' VARCHAR(32)';
        return $sql;
       }
       if(is_subclass_of($attribute_type, 'StoredObjectDB')) {
        $sql .= $attribute_name.' INTEGER';
        return $sql;
       }
       else {
        $sql .= $attribute_name.' '.$this->getAttributeType();
		return $sql;
       }
	}
	
	//----------------------------------------------------------------------------------------------------------
	function Install()
	{
	    global $model_factory;
	    
		$sql = '  CREATE TABLE '.$this->getEntityRefName().
			     ' ('.$this->getEntityRefName().'Id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY, VPD VARCHAR(32), RecordVersion INTEGER DEFAULT 0,';
		
		$keys = array_keys($this->getAttributes());
		for($i=0; $i < count($keys); $i++) 
		{
			$sql .= $this->getAttributeRDBMSDefinition($keys[$i]).',';
		}
		$sql = substr($sql, 0, strlen($sql) - 1).' ) ENGINE=MyISAM DEFAULT CHARSET='.APP_CHARSET.' ';

        DAL::Instance()->Query($sql);

		if(is_object($model_factory))
			if($model_factory->sql_log_enabled) {
				$sql = str_replace('\'', '\\\'', $sql);
				$sql_log = "INSERT INTO SystemLogSQL (SQLContent, RecordCreated) VALUES ('".$sql."', NOW())";
				$r3 = DAL::Instance()->Query($sql_log);
			}
	}
	
	//----------------------------------------------------------------------------------------------------------
	function UnInstall() 
	{
	    global $model_factory;
	    
		$sql = 'DROP TABLE '.$this->getEntityRefName();
   		
		$r2 = DAL::Instance()->Query($sql);

		if(is_object($model_factory))
			if($model_factory->sql_log_enabled) {
				$sql = str_replace('\'', '\\\'', $sql);
				$sql_log = "INSERT INTO SystemLogSQL (SQLContent, RecordCreated) VALUES ('".$sql."', NOW())";
				$r3 = DAL::Instance()->Query($sql_log);
			}
	}

    function storeFile( $name, $it, $parms = array() )
    {
        if ( is_uploaded_file($_FILES[$name]['tmp_name']) || file_exists($_FILES[$name]['tmp_name']) )
        {
            if ( $_FILES[$name]['name'] == '' ) {
                $file_name = 'unnamed';
            }
            else
            {
                $file_name = $_FILES[$name]['name'];
                $file_name = preg_replace('/\[/', '(', $file_name);
                $file_name = preg_replace('/\]/', ')', $file_name);
            }

            // каждый файл размещается в подкаталоге с именем класса
            if(!file_exists(SERVER_FILES_PATH)) mkdir(SERVER_FILES_PATH);
            $filepath = SERVER_FILES_PATH.$this->getClassName();
            if(!file_exists($filepath)) mkdir($filepath);
            $filepath .= '/'.$name.$it->getId();

            // копируем файл в подкаталог
            copy( $_FILES[$name]['tmp_name'], $filepath);

            $fileSizeAddition = '';
            if ( $this->getAttributeType('FileSize') != '' ) {
                $fileSizeAddition = "FileSize = ".max(0, filesize($filepath)).",";
            }

            $sql = "UPDATE ".$this->getClassName()." SET ".$name."Path = '".
                DAL::Instance()->Escape($filepath)."',
    			".$fileSizeAddition." 
    			".$name."Mime = '".DAL::Instance()->Escape($_FILES[$name]['type'])."',
				".$name."Ext = '".DAL::Instance()->Escape($file_name).
                "' WHERE ".$this->getClassName()."Id = ".$it->getId();

            $r2 = DAL::Instance()->Query($sql);
            getFactory()->resetCachedIterator($it->object);

            unlink($_FILES[$name]['tmp_name']);
        }
        else if ( $parms['FileExt'] != '' ) {
            DAL::Instance()->Query(
                "UPDATE ".$this->getClassName()." SET  
                ".$name."Path = '".DAL::Instance()->Escape($parms['FilePath'])."',
                ".$name."Mime = '".DAL::Instance()->Escape($parms['FileMime'])."',
				".$name."Ext = '".DAL::Instance()->Escape($parms['FileExt']).
                "' WHERE ".$this->getClassName()."Id = ".$it->getId()
            );
        }
    }

	function getValidators() {
	    return array();
    }

    function getMappers() {
        return array();
    }

	//----------------------------------------------------------------------------------------------------------
 	function add_parms( $parms )
	{
       	// Формируем запрос для вставки записи в таблицу
		$sql = "INSERT INTO ".$this->getEntityRefName()." ( RecordCreated,RecordModified,VPD,";
		
		if ( $parms[$this->getEntityRefName().'Id'] > 0 )
		{
		    $sql .= $this->getEntityRefName().'Id,';
		}

		if ( $parms['RecordCreated'] == '' ) {
			$parms['RecordCreated'] = SystemDateTime::date();
		}
		if ( $parms['RecordModified'] == '' ) {
			$parms['RecordModified'] = SystemDateTime::date();
		}
        $values = " VALUES ( ".
        	($parms['RecordCreated'] != '' ? "'".$parms['RecordCreated']."'" : "NOW()").", ".
        	($parms['RecordModified'] != '' ? "'".$parms['RecordModified']."'" : "NOW()").", ";

		if ( array_key_exists('VPD', $parms) )
		{
			$values = $values."'".DAL::Instance()->Escape($parms['VPD'])."',";
		}
		else
		{
			$vpd_hash = 'NULL';
			
	        if ( $this->getVpdValue() != '' )
	        {
	        	$vpd_hash = $this->getVpdValue();
	        	
	        	if ( $vpd_hash == '' )
	        	{
	        		$vpd_hash = 'NULL';
	        	}
	        	else
	        	{
	        		$vpd_hash = "'".$vpd_hash."'";
	        	}
	        }
	        
			$values = $values.$vpd_hash.","; 
		}
		
		if ( $parms[$this->getEntityRefName().'Id'] > 0 )
		{
		    $values .= $parms[$this->getEntityRefName().'Id'].',';
		}

		$imageattributes = array();
		$fileattributes = array();
		
		$keys = array_keys($this->getAttributes());
		for($i=0; $i < count($keys); $i++) 
		{
			if ( $keys[$i] == 'RecordModified' || $keys[$i] == 'RecordCreated' ) continue;
			
			if( !$this->IsAttributeStored($keys[$i]) ) continue;
			
			if($this->getAttributeType($keys[$i]) == 'image') {
				array_push($imageattributes, $keys[$i]);
				continue;
			}
			if($this->getAttributeType($keys[$i]) == 'file') {
				array_push($fileattributes, $keys[$i]);
				continue;
			}
			if($this->getAttributeType($keys[$i]) == 'price') {
				$sql .= $keys[$i].','.$keys[$i].'Code,';
				$values .= $this->formatValueForDB($keys[$i], $parms[$keys[$i]]).', \''.$parms[$keys[$i].'Code'].'\',';
				continue;
			}

			if($this->getAttributeType($keys[$i]) == 'char' && 
			   !array_key_exists($keys[$i], $parms) && $parms[$keys[$i].'OnForm'] != '') 
			{
				$parms[$keys[$i]] = 'N';
			}

			$defaultValue = $this->getDefaultAttributeValue($keys[$i]);
			if ( !array_key_exists($keys[$i], $parms) && $defaultValue != '' ) {
				$parms[$keys[$i]] = $defaultValue;
			}

			if( isset($parms[$keys[$i]]) ) {
				$sql .= "`".$keys[$i].'`,';
				$values .= $this->formatValueForDB($keys[$i], $parms[$keys[$i]]).',';
			}
		}
		
		$values = substr($values, 0, strlen($values) - 1)." ) ";
		$sql = substr($sql, 0, strlen($sql) - 1)." ) ".$values;

		$this->checkInsertOnly($sql);

		getFactory()->info( JsonWrapper::encode($parms) );
		
		$r2 = DAL::Instance()->Query($sql);
		
		if ( $r2 === false )
		{
		    getFactory()->error('Query: Failed');
		}
		else 
		{
		    getFactory()->info('Query: Ok');
		}

		if ( $parms[$this->getEntityRefName().'Id'] > 0 )
		{
		    $id = $parms[$this->getEntityRefName().'Id'];
		}
		elseif( $r2 === true )
		{		    
    		$d = DAL::Instance()->QueryArray('SELECT LAST_INSERT_ID()');
    		$id = $d[0];
		}

		getFactory()->resetCachedIterator($this);
		
		foreach ( $this->persisters as $persister ) {
			$persister->add( $id, $parms );
		}

        if ( count($imageattributes) > 0 || count($fileattributes) > 0  )
        {
            getFactory()->resetCachedIterator($this);
			$new_object_it = $this->getExact($id);
			
			// загружаем изображения
			for($i=0; $i < count($imageattributes); $i++) {
				$this->storeFile( $imageattributes[$i], $new_object_it, $parms );
			}
			// загружаем файлы
			for($i=0; $i < count($fileattributes); $i++) {
				$this->storeFile( $fileattributes[$i], $new_object_it, $parms );
			}
		}

		if ( $this->getNotificationEnabled() && $id > 0 )
		{
            getFactory()->resetCachedIterator($this);
    		$new_object_it = $this->getRegistry()->QueryById($id);
    		if ( $new_object_it->getId() > 0 ) {
    			getFactory()->getEventsManager()->notify_object_add($new_object_it, $parms);
    		}
		}

		getFactory()->resetCachedIterator($this);
		
		return $id;
	}
	
	protected function beforeDelete( $object_it )
	{
		foreach ( $this->persisters as $persister ) {
			$persister->beforeDelete( $object_it );
		}
	}

	//----------------------------------------------------------------------------------------------------------
	function delete( $id, $record_version = '' )
	{
		getFactory()->resetCachedIterator( $this );

		$object_it = $this->getExact($id);
		if ( $object_it->getId() == '' ) return 0;

		$rows = $this->deleteInternal( $object_it, $record_version );

		getFactory()->resetCachedIterator($this);
		if ( $this->getNotificationEnabled() ) {
			getFactory()->getEventsManager()->notify_object_delete($object_it);
		}

		return $rows;
	}

	protected function deleteInternal( $object_it, $record_version = '' )
	{
		$this->beforeDelete($object_it);

		if ( $record_version != '' ) {
			$parms['RecordVersion'] = DAL::Instance()->Escape(
				addslashes($record_version));
		}
		else {
			$parms['RecordVersion'] = $object_it->get('RecordVersion') != ''
				? $object_it->get('RecordVersion') : 0;
		}

		// удаляем запись
		$id = DAL::Instance()->Escape( $object_it->getId() );

		$sql = "DELETE FROM ".$this->getEntityRefName().
			" WHERE ".$this->getEntityRefName()."Id IN (".join(',',preg_split('/,/', $id)).")".
			"   AND RecordVersion = ".$parms['RecordVersion'];

		$this->checkDeleteOnly($sql);

		$r2 = DAL::Instance()->Query($sql);

		$affected_rows = DAL::Instance()->GetAffectedRows();
		if ( $affected_rows < 1 ) return $affected_rows;

		foreach ( $this->persisters as $persister ) {
			$persister->afterDelete( $object_it );
		}

		return $affected_rows;
	}
	
	//----------------------------------------------------------------------------------------------------------
	function deleteAll()
	{
		getFactory()->getEventsManager()->notify_object_delete( $this->getEmptyIterator() );
		
		$sql = "DELETE FROM ".$this->getEntityRefName()." WHERE 1 = 1 ";
		
        $vpds = $this->getVpds();
        	
        if ( count($vpds) > 0 ) $sql .= " AND VPD IN ('".join("','",$vpds)."') ";
		
		$r2 = DAL::Instance()->Query($sql);

		getFactory()->resetCachedIterator($this);

		getFactory()->getEventsManager()->notify_object_delete( $this->getEmptyIterator() );
	}	

	//----------------------------------------------------------------------------------------------------------
	function modify_parms( $id, $parms )
	{
		if ( count($parms) < 1 ) throw new Exception('There are no attributes to be updated');

		if ( $id instanceof OrderedIterator ) {
			$prev_object_it = $id;
		}
		else {
			$prev_object_it = $this->getExact($id);
			if ( $prev_object_it->getId() == '' ) {
			    throw new Exception('There is no object "'.$id.'" of the entity "'.get_class($this).'"');
            }
		}

		$imageattributes = array();
		$fileattributes = array();

		$keys = array_keys($this->getAttributes());

		for($i=0; $i < count($keys); $i++) 
		{
			if($this->getAttributeType($keys[$i]) == 'image') {
				array_push($imageattributes, $keys[$i]);
				continue;
			}
			
			if($this->getAttributeType($keys[$i]) == 'file') {
				array_push($fileattributes, $keys[$i]);
				continue;
			}
		}

        $now_object_it = $this->getRegistry()->Store( $prev_object_it, $parms );
		
		if ( count($imageattributes) > 0 || count($fileattributes) > 0 ) {
		    foreach( $imageattributes as $attribute ) {
		        $this->storeFile( $attribute, $now_object_it );
		    }
		    foreach( $fileattributes as $attribute ) {
		        $this->storeFile( $attribute, $now_object_it );
		    }
		}
		
		return is_object($now_object_it) ? $now_object_it->count() : 0;
	}

	//----------------------------------------------------------------------------------------------------------
	function modify( $object_id ) 
	{
		return $this->modify_parms($object_id, $_REQUEST);
	}
	
	//----------------------------------------------------------------------------------------------------------
	function formatValueForDB( $name, $value )
	{
		if ( \TextUtils::isNullValue($value) ) return 'NULL';
		
		switch ( $name )
		{
			case 'VPD':
				$attribute_type = 'varchar';
				break;
				
			default:
				$attribute_type = $this->getAttributeType($name);
				if ( $attribute_type == '' ) {
					$attribute_type = strpos($name, "(") !== false ? 'varchar' : 'integer';
				}
		}

		switch( strtolower($attribute_type) )
		{
			case 'date':
			case 'datetime':
				if ( strtolower($value) == 'now()' ) return $value;
				if ( $value == 0 ) return 'NULL';
				if ( strpos($value, '0000-00-00') !== false ) return 'NULL';
				return "'" . DAL::Instance()->Escape($value) . "'";
				
			case 'float':
			case 'integer':
                $value = str_replace(',', '.', $value);
                if ( $value != '' && !is_numeric($value) ) $value = '';
				return htmlspecialchars($value, ENT_QUOTES | ENT_HTML401, APP_ENCODING);

            default:
                return "'".trim(htmlspecialchars(
                    DAL::Instance()->Escape(addslashes($value)),
                        ENT_QUOTES | ENT_HTML401, APP_ENCODING))."'";
		}
	}
	
	//----------------------------------------------------------------------------------------------------------
	function getUniqueAttributes()
	{
		if ( array_key_exists('Caption', $this->getAttributes()) )
			return array('Caption');
		
		$keys = array_keys($this->getAttributes());
		return array($keys[1]);
	}
	
	function disableVpd()
	{
		$this->vpd_enabled = false;
	}
	
	function enableVpd()
	{
		$this->vpd_enabled = true;
	}
	
	function removeNotificator( $base_class_name )
	{
		array_push($this->disabled_notificators, $base_class_name);
	}
	
	function getDisabledNotificators()
	{
		return $this->disabled_notificators;
	}
	
	function resetDisabledNotificators()
	{
		return $this->disabled_notificators = array();
	}
	
	function getNotificationEnabled()
	{
	    return $this->notification_enabled;
	}
	
 	function setNotificationEnabled( $enabled = true )
	{
	    $this->notification_enabled = $enabled;
	}
	
	function addFilter( $filter )
	{
		if ( !$filter->defined($filter->getValue()) ) return;
		$this->filters[] = $filter;
	}
	
	function resetFilters()
	{
        $this->filters = array();
	}
	
	function getFilters()
	{
		return $this->filters;
	}
	
	function setFilters( $filters )
	{
        $this->filters = $filters;
	}
	
	function setSortDefault( $clause )
	{
	    if ( !is_array($clause) ) $clause = array( $clause );
	    
	    $this->default_sorts = $clause;
	    
	    $sorts = array();
	    foreach ( $clause as $key => $item )
	    {
	        $clause[$key]->setObject( $this );
	        $clause[$key]->setAlias( 't' );

	        $clauseSql = trim($clause[$key]->clause());
	        if ( $clauseSql == '' ) continue;
	        $sorts[] = $clauseSql;
	    }
	    
	    $this->defaultsort = join(',', $sorts);
	}
	
	function getSortDefault()
	{
		return $this->default_sorts;
	}
	
	function addSort( $clause )
	{
		$clause->setObject( $this );
		
		$sorts = $this->registry->getSorts();
		
		$sorts[] = $clause;
		
		$this->registry->setSorts($sorts);
	}
	
 	function getGroupClause( $alias = 't' )
	{
		return $this->registry->getGroupClause($alias);
	}
	
	function addPersister( $persister )
	{
		if ( isset($this->persisters[$persister->getId()]) ) return;
		
		$persister->setObject($this);
		
		$this->persisters[$persister->getId()] = $persister;
	}
	
	function setPersisters( $persisters )
	{
		$this->persisters = $persisters;
		
		foreach( $this->persisters as $key => $persister )
		{
			$this->persisters[$key]->setObject($this);
		}
	}
	
	function getPersisters()
	{
		return $this->persisters;
	}

	function resetPersisters()
	{
		$this->persisters = array();
	}
	
	function setLimit( $limit )
	{
		$this->limit = $limit;
	}
	
	function getLimitClause()
	{
		if ( !is_numeric( $this->limit ) ) return;
		if ( $this->limit > 0 ) return ' LIMIT '.$this->limit;
	}

    public function getBulkAttributes()
    {
        $nonBulkAttributes = array_diff(
            array_merge(
                $this->getAttributesByGroup('system'),
                $this->getAttributesByGroup('nonbulk'),
                $this->getAttributesByGroup('astronomic-time'),
                $this->getAttributesByType('wysiwyg'),
                $this->getAttributesByType('checklist'),
                $this->getAttributesByType('text'),
                $this->getAttributesByType('varchar'),
                $this->getAttributesByType('datetime'),
                $this->getAttributesByType('image'),
                $this->getAttributesByType('file'),
                array (
                    'OrderNum'
                )
            ),
            $this->getAttributesByGroup('bulk')
        );
        $attributes = array_diff(
            $this->getAttributesOrdered(),
            $nonBulkAttributes
        );
        foreach( $attributes as $key => $attribute ) {
            if ( !$this->getAttributeEditable($attribute) ) {
                unset($attributes[$key]);
            }
            if ( !$this->IsAttributePersisted($attribute) ) {
                unset($attributes[$key]);
            }
            if ( !getFactory()->getAccessPolicy()->can_modify_attribute($this,$attribute) ) {
                unset($attributes[$key]);
            }
        }
        return array_values($attributes);
    }

	public function __sleep()
	{
		throw new Exception('Unable serialize StoredObjectDB');
	}
}