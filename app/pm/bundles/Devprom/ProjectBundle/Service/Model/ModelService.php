<?php
namespace Devprom\ProjectBundle\Service\Model;

class ModelService
{
    const OUTPUT_TEXT = 'text';
    const OUTPUT_HTML = 'html';
    const OUTPUT_ASIS = 'asis';

    private $recursive = false;

	public function __construct( $validator_serivce = null, $mapping_service = null, $filter_resolver = array(), $uidService = null, $recursive = false )
	{
		$this->validator_service = $validator_serivce;
		$this->mapping_service = $mapping_service;
		$this->filter_resolver = $filter_resolver;
        $this->uidService = is_object($uidService) ? $uidService : new \ObjectUID();
        $this->recursive = $recursive;
	}
	
	public function set( $entity, $data, $id = '', $output = self::OUTPUT_TEXT )
	{
		$object = is_object($entity) ? $entity : $this->getObject($entity);
        if ( count($data) < 1 ) return array();

		foreach( $data as $key => $value )
		{
			if ( is_array($value) && $object->IsReference($key) )
            {
                if ( $value !== array_values($value) ) {
                    // resolve embedded object into reference
                    $ref = $object->getAttributeObject($key);
                    $data[$key] = $ref->getRegistry()->Query($this->buildSearchQuery($ref, $value))->getId();

                    if ( $data[$key] == '' ) {
                        if ( $value['Email'] != '' ) {
                            $data['ExternalAuthor'] = $value['Caption'];
                            $data['ExternalEmail'] = $value['Email'];
                            $data[$key] = 0;
                        }
                        else {
                            $data[$key] = array_shift($value);
                        }
                    }
                }
                else {
                    $data[$key] = join(', ',
                                        array_map(function($item) { return $item['Id']; }, $value)
                                    );
                }
			}
			else {
				if ( $key == 'Id' || is_null($value) || strtolower($value) == 'null' ) {
					unset($data[$key]);
				}
			}
		}

        if ( $id != '' ) {
            $data[$object->getIdAttribute()] = $id;
            $object_it = $object->getRegistry()->Query(array(new \FilterInPredicate($id)));
        }
        else {
            // check an object exists already (search by Id or alternative key)
            $key_filters = array();
            foreach( $object->getAttributesByGroup('alternative-key') as $key ) {
                if ( $data[$key] != '' ) {
                    $key_filters[] = new \FilterAttributePredicate($key, $data[$key]);
                }
            }
            $object_it = count($key_filters) > 0
                ? $object->getRegistry()->Query(
                    array_merge(
                        $key_filters,
                        array(
                            new \FilterBaseVpdPredicate()
                        )
                    )
                )
                : $object->getEmptyIterator();
        }

		if ( $object_it->getId() < 1 )
		{
			if ( !getFactory()->getAccessPolicy()->can_create($object) ) {
				throw new \Exception('Lack of permissions to create object of '.get_class($object));
			}

			$objectIt = getFactory()->createEntity($object, $data);

			$result = $objectIt->getId();
			if ( $result < 1 ) throw new \Exception('Unable create new record of '.get_class($object));

			return $this->get($entity, $result, $output);
		}
		else
		{
			if ( !getFactory()->getAccessPolicy()->can_modify($object_it) ) {
				throw new \Exception('Lack of permissions to modify object of '.get_class($object));
			}
			if ( $this->modify($object_it, $data) < 1 ) {
				throw new \Exception('Unable update the record ('.$object_it->getId().') of '.get_class($object));
			}

			return $this->get($entity, $object_it->getId(), $output);
		}
	}
	
	public function get( $entity, $id = '', $output = self::OUTPUT_TEXT )
	{
        $ids = \TextUtils::parseIds($id);
        if ( count($ids) < 1 ) return array();

		$object = is_object($entity) ? $entity : $this->getObject($entity);
        if ( !getFactory()->getAccessPolicy()->can_read($entity) ) {
            return array();
        }

        $object_it = getFactory()->getEntities($object, $ids);

		if ( $object_it->getId() < 1 ) {
			throw new \Exception('There is no record ('.$id.') of '.get_class($object));
		}
		return $this->sanitizeData($object_it->object, $this->getData($object_it, $this->recursive), $output);
	}
	
	public function find( $entity, $limit = 0, $page = 0, $output = self::OUTPUT_TEXT )
	{
		$object = is_object($entity) ? $entity : $this->getObject($entity);
        if ( !getFactory()->getAccessPolicy()->can_read($object) ) {
            return array();
        }

		$registry = $object->getRegistry();
		if ( $limit > 0 ) {
            $registry->setLimit($limit);
            if ( $page > 0 ) $registry->setOffset($limit * $page);
        }

		$query = array(
			new \FilterVpdPredicate()
		);
		foreach($this->filter_resolver as $resolver ) {
			$query = array_merge( $query, $resolver->resolve() );
		}
		
		$result = array();

        if ( in_array($object->getEntityRefName(), array('entity','ObjectChangeLog')) ) {
            // special case for custom data built entities
            $object_it = $object->getRegistry()->Query($query);
        }
        else {
            $object_it = getFactory()->getEntities($object, $registry->QueryKeys($query)->idsToArray());
        }

		while( !$object_it->end() ) {
			$result[] = $this->sanitizeData($object, $this->getData($object_it, $this->recursive), $output);
			$object_it->moveNext();
		}

		return $result;
	}

	public function delete( $entity, $id, $output = self::OUTPUT_TEXT )
	{
		$object = is_object($entity) ? $entity : $this->getObject($entity);

		$object_it = $object->getExact($id);

		if ( !getFactory()->getAccessPolicy()->can_delete($object_it) )
		{
			throw new \Exception('Lack of permissions to delete object of '.get_class($object_it->object));
		}

		$object_it->delete();

		return $this->sanitizeData(
			$object_it->object,
			$object_it->object->getEmptyIterator()->getData(),
            $output
		);
	}

	static public function queryXPath( $object_it, $xpath )
	{
		$attributes = array_intersect(
		    array_keys($object_it->getData()),
            array_keys($object_it->object->getAttributes())
        );

		$xml = '';
		while( !$object_it->end() )
		{
            $it = $object_it->copy();

            $data = $it->getData();
            foreach( $it->object->getAttributesByGroup('computed') as $attribute ) {
                $items = array();
                $result = self::computeFormula( $it,
                    $it->object->getDefaultAttributeValue($attribute)
                );
                foreach( $result as $computedItem ) {
                    if ( !is_object($computedItem) ) {
                        $items[] = $computedItem;
                    }
                    else {
                        $items[] = $computedItem->getId();
                    }
                }
                $data[$attribute] = join(',',$items);
            }
            $it = $it->object->createCachedIterator(array($data));

			$xml .= '<Object id="'.$it->getId().'">';
			foreach( $attributes as $attribute )
			{
			    $attributeType = $it->object->getAttributeType($attribute);
				if ( in_array($attributeType, array('integer','float')) ) {
					$xml .= '<'.$attribute.'>'.$it->get($attribute).'</'.$attribute.'>';
				}
				else {
				    $values = array();
					if ( $it->object->IsReference($attribute) )
					{
					    $refIt = $it->getRef($attribute);
					    if ( $refIt->get('ParentPath') != '' ) {
					        $parents = \TextUtils::parseIds($refIt->get('ParentPath'));
					        if ( count($parents) < 1 ) continue;
                            $refIt = $refIt->object->getRegistry()->Query(
                                array(
                                    new \FilterInPredicate($parents)
                                )
                            );
                        }
                        while( !$refIt->end() ) {
                            $values[] = $refIt->getDisplayName();
                            $refIt->moveNext();
                        }
					    if ( $refIt->count() == 0 ) {
                            $values[] = $refIt->object->getEmptyValueName();
                        }
					}
					else {
					    if ( $attribute == 'State' ) {
                            $values[] = $it->getStateIt()->getDisplayName();
                        }
                        else {
                            $values[] = $it->getHtmlDecoded($attribute);
                        }
					}
                    $xml .= '<'.$attribute.'><![CDATA['.implode(explode(']]>', mb_strtolower(join(',', $values))), ']]]]><![CDATA[>').']]></'.$attribute.'>';
				}
			}
			$xml .= '</Object>';
			$object_it->moveNext();
		}

		$ids = array();
		try {
			$xml_object = new \SimpleXMLElement('<?xml version="1.0" encoding="utf-8"?><Collection>'.$xml.'</Collection>');
			foreach( $xml_object->xpath('/Collection/Object['.$xpath.']') as $item ) {
				foreach( $item->attributes() as $attribute => $value ) {
					if ( $attribute == 'id' ) $ids[] = (string) $value;
				}
			}
		}
		catch( \Exception $ex ) {
			\Logger::getLogger('System')->error('queryXPath: '.$ex->getMessage());
			\Logger::getLogger('System')->error('XML body: '.$xml);
		}

		$id_attribute = $object_it->object->getIdAttribute();
		
		return $object_it->object->createCachedIterator(
		    array_values(
				array_filter( $object_it->getRowset(), function($row) use($id_attribute, $ids) {
						return in_array($row[$id_attribute], $ids);
				})
			)
        );
	}
	
	protected function modify( $object_it, $data )
	{
		if ( $object_it->object instanceof \MetaobjectStatable )
		{
			if ( array_key_exists('Completed', $data) ) {
				$targetState = $data['Completed']
					? array_shift($object_it->object->getTerminalStates())
					: array_shift($object_it->object->getNonTerminalStates());
				$data['State'] = $targetState;
			}
		}

		foreach( $data as $key => $value ) {
			if ( $value == $object_it->getHtmlDecoded($key) ) unset($data[$key]);
		}

		if ( count($data) < 1 ) return 1; // do not modify if there were no changes

        $data['WasRecordVersion'] = $object_it->get('RecordVersion');
        $modifiedIt = getFactory()->modifyEntity($object_it, $data);
		$result = $modifiedIt->getId();

        return $result;
	}

	protected function getData( $object_it, $recursive = false, $level = 0, &$references = array() )
	{
		$dataset = $object_it->getData();

        if ( $this->uidService->hasUid($object_it) ) {
            $info = $this->uidService->getUIDInfo($object_it);
            $dataset['URL'] = $info['url'];
            $dataset['UID'] = $info['uid'];
        }

        if ( !$recursive ) return $dataset;

		foreach( $object_it->object->getAttributes() as $attribute => $info )
		{
            if ( $attribute == 'RecentComment' ) {
                $recursiveData = array();
                $commentIt = getFactory()->getObject('Comment')->getAllForObject($object_it, array(new \SortKeyClause()));
                while( !$commentIt->end() ) {
                    $recursiveData[] = $this->getData($commentIt, true, $level, $references);
                    $commentIt->moveNext();
                }
                if ( count($recursiveData) == 1 ) {
                    $recursiveData = array_shift($recursiveData);
                }
                $dataset['comments'] = $recursiveData;
                continue;
            }

			if ( !$object_it->object->IsReference($attribute) ) continue;

            if ( $level > 0 ) {
                $dataset[$attribute] = array();
                continue;
            }
			if ( $object_it->get($attribute) == '' ) {
                $dataset[$attribute] = array(
                    $object_it->object->getAttributeObject($attribute)->getIdAttribute() => ''
                );
                if ( substr($attribute, -1, 1) == 's' ) {
                    $dataset[$attribute] = array( 0 => $dataset[$attribute] );
                }
                continue;
            };

			$ref_it = $object_it->getRef($attribute);
            if ( in_array(get_class($ref_it->object), $this->skipRecursion) ) continue;

            if ( $recursive )
            {
                $recursiveData = array();
                while( !$ref_it->end() ) {
                    $recursiveData[] = $this->getData($ref_it, true, $level + 1, $references);
                    $ref_it->moveNext();
                }
                if ( count($recursiveData) == 1 ) {
                    $recursiveData = array_shift($recursiveData);
                }
                $dataset[$attribute] = $recursiveData;
            }
            else {
                $dataset[$attribute] = $ref_it->count() > 1 ? $ref_it->getRowset() : $ref_it->getData();
            }
		}

		return $dataset;
	}

	protected function sanitizeData( $object, $data, $output = self::OUTPUT_TEXT )
	{
		$id_attribute = $object->getIdAttribute();
		$system_attributes =
			array_merge(
				$object->getAttributesByGroup('system'),
				array (
					'Photo',
					'PhotoPath',
					'PhotoExt',
					'Password'
				)
			);
		$attributes = array_merge(
			array_keys($object->getAttributes()),
			array(
				$id_attribute,
				'Attributes',
                'comments'
			)
		);
		if ( is_a($object, 'MetaobjectStatable') ) $terminal_states = $object->getTerminalStates();

		$result = array();
		
		foreach( $data as $attribute => $value )
		{
			if ( !in_array($attribute, $attributes) ) continue;
			if ( in_array($attribute, $system_attributes) ) continue;
			if ( $id_attribute == $attribute ) $attribute = "Id";

			$type = $object->getAttributeType($attribute);

			if ( in_array($type, array('datetime')) ) {
				$result[$attribute] = \SystemDateTime::convertToClientTime($value);
			}
			else {
                if ( is_array($value) && $attribute == 'comments') {
                    $comment = getFactory()->getObject('Comment');
                    if ( !array_key_exists('Id', $value) ) {
                        foreach( $value as $item ) {
                            $result[$attribute][] = $this->sanitizeData($comment, $item, $output);
                        }
                    }
                    else {
                        $result[$attribute] = $this->sanitizeData($comment, $value, $output);
                    }
                }
				else if ( is_array($value) && $object->IsReference($attribute) ) {
					$ref = $object->getAttributeObject($attribute);
					if ( !array_key_exists($ref->getIdAttribute(), $value) ) {
						foreach( $value as $item ) {
							$result[$attribute][] = $this->sanitizeData($ref, $item, $output);
						}
					}
					else {
						$result[$attribute] = $this->sanitizeData($ref, $value, $output);
					}
				}
				else {
					$result[$attribute] = stripslashes(
					    html_entity_decode($value, ENT_QUOTES | ENT_HTML401, APP_ENCODING)
                    );

					if ( in_array($type, array('wysiwyg')) && $output != self::OUTPUT_ASIS )
					{
                        $editor = \WikiEditorBuilder::build($result['ContentEditor']);
                        $editor->setObject($object);
                        $parser = $editor->getHtmlParser();
                        $parser->setObjectIt( $object->createCachedIterator(array($data)) );
                        $result[$attribute] = $parser->parse($result[$attribute]);

						if ( $output == self::OUTPUT_TEXT ) {
							$html2text = new \Html2Text\Html2Text($result[$attribute], array('width'=>0));
							$result[$attribute] = $html2text->getText();
						}
					}
				}
			}
			
			if ( $attribute == 'State' && is_array($terminal_states) ) {
				$result['Completed'] = in_array($value, $terminal_states);
			}
			
			if ( $attribute == 'Attributes' ) {
				// hard hack. make unique modified attributes for REST API /changes service
				$result[$attribute] = join(',',array_unique(preg_split('/,/', $result[$attribute])));
			}
		}
		
		foreach( $attributes as $attribute )
		{
			if ( in_array($attribute, $system_attributes) ) continue;
			if ( !in_array($object->getAttributeType($attribute), array('file','image')) ) continue;
		
			$path = $data[$attribute.'Path'];
			if ( !file_exists($path) ) continue;
			
			$result[$attribute] = base64_encode(file_get_contents($path));
			$result[$attribute.'Mime'] = $data[$attribute.'Mime'];
		}

		foreach( $this->skipFields as $field ) {
			unset($result[$field]);
		}

		foreach( array('UID', 'URL', 'ProjectCodeName') as $key ) {
            if ( array_key_exists($key, $data) ) {
                $result[$key] = $data[$key];
            }
        }

        if ( array_key_exists('Id', $result) ) {
            $result['self'] = $this->getSelfUrl($object, $result);
        }
		return $result;
	}
	
	protected function getObject( $entity_name )
	{
		$class_name = getFactory()->getClass($entity_name);
		
		if ( $class_name == '' ) throw new \Exception('Unknown class name: '.$entity_name);

		$object = getFactory()->getObject($class_name);

		if ( $object instanceof \WikiPage ) {
            $registry = new \WikiPageRegistryContent($object);
            $registry->setPersisters($object->getPersisters());
            $object->setRegistry($registry);
        }

        foreach( getSession()->getBuilders('RestAttributesModelBuilder') as $builder ) {
            $builder->build($object);
        }

		return $object;
	}
	
	protected function buildSearchQuery( $object, $data )
	{
		// convert data into database format
        $this->mapping_service->map($object, $data);

        $query = array();
		if ( $data['Id'] != '' ) {
			$query[] = new \FilterInPredicate($data['Id']);
		}
		if ( count($query) < 1 ) {
			foreach( $object->getAttributesByGroup('alternative-key') as $key ) {
			    if ( $data[$key] == '' ) continue;
                $query[] = new \FilterAttributePredicate($key, $data[$key]);
			}
		}
		if ( count($query) < 1 ) {
			foreach( $data as $attribute => $value )
			{
                if ( $value  == '' ) continue;
                if ( $attribute == 'UID' ) {
                    $query[] = new \FilterTextExactPredicate('UID', $value);
                    continue;
                }
				if ( $object->getAttributeDbType($attribute) == '' ) continue;
				if ( $object->getAttributeOrigin($attribute) == ORIGIN_CUSTOM ) continue;
				if ( !$object->IsAttributeStored($attribute) ) continue;

				$predicate = new \FilterAttributePredicate($attribute, $value);
				$predicate->setHasMultipleValues(false);
				$query[] = $predicate;
			}
		}

        if ( count($query) < 1 ) {
            $query[] = new \FilterInPredicate('-123');
        }
        elseif ( $object->getVpdValue() != '' ) {
            $query[] = new \FilterBaseVpdPredicate();
        }

		return $query;
	}

	public function setSkipFields( $fieldsArray ) {
		$this->skipFields = $fieldsArray;
	}

	protected function getSelfUrl( $object, $data )
    {
        $id = $data['Id'];
        $className = strtolower(get_class($object));

        $url = $this->getObjectUrl($data['ProjectCodeName'] != '' ? $data['ProjectCodeName'] : $object) . $className . '/items';
        if ( $id != '' ) $url .= '/' . $id;
        return $url;
    }

    static function computeFormula( $objectIt, $formula, $resolveReferences = true )
    {
        $userIt = getSession()->getUserIt();
        $result = array();
        $referenceIt = null;
        $uid = new \ObjectUID();

        $text = preg_replace_callback('/\{([^\}]+)\}/',
            function($match) use ($objectIt, &$referenceIt, &$result, $uid, $userIt, $resolveReferences, $formula)
            {
                $mathFormulaUsed = substr($formula, 0, 1) == '=';
                list($path,$default) = preg_split('/,/', $match[1]);
                if ( $default == '' && $mathFormulaUsed ) $default = '0';

                $attributes = preg_split('/\./', $path);
                foreach( $attributes as $attributeIndex => $caption )
                {
                    $object = $objectIt->object;
                    if ( strcasecmp($caption, translate('ИД')) == 0 || strcasecmp($caption, 'ИД') == 0 ) {
                        $refName = $object->getIdAttribute();
                    }
                    else if ( strcasecmp($caption, translate('Пользователь')) == 0 ) {
                        $referenceIt = $userIt->copy();
                        return '{'.join('.',array_slice($attributes, $attributeIndex+1)).'}';
                    }
                    else {
                        $refName = $object->getAttributeByCaption($caption);
                        if ( $refName == '' ) $refName = $caption;
                    }
                    if ( $object->IsReference($refName) ) {
                        if ( $objectIt->get($refName) != '' ) {
                            $ids = \TextUtils::parseIds($objectIt->get($refName));
                            if ( count($ids) > 1 ) {
                                $referenceIt = $objectIt->getRef($refName);
                                return '{'.join('.',array_slice($attributes, $attributeIndex+1)).'}';
                            }
                            else {
                                $objectIt = $objectIt->getRef($refName);
                                if ( $attributeIndex >= count($attributes) - 1 ) {
                                    return $resolveReferences
                                                ? $uid->getUidWithCaption($objectIt)
                                                : $objectIt->getId();
                                }
                                continue;
                            }
                        }
                        else {
                            return $default;
                        }
                    }
                    else {
                        if ( $refName == $object->getIdAttribute() ) {
                            $id = $objectIt->get($refName);
                            if ( $id == '' ) return "{".$caption."}";
                            return $id;
                        }
                        else if ( $refName == 'State' && $objectIt->object instanceof \MetaobjectStatable ) {
                            return $objectIt->getStateIt()->getDisplayName();
                        }
                        else {
                            switch( $object->getAttributeType($refName) ) {
                                case '':
                                    $value = '0';
                                    break;
                                case 'integer':
                                case 'float':
                                    $value = $objectIt->get($refName) == '' ? '0' : floatval($objectIt->get($refName));
                                    break;
                                case 'date':
                                    if ( $mathFormulaUsed ) {
                                        $value = strtotime($objectIt->get($refName));
                                    }
                                    else {
                                        $value = getSession()->getLanguage()->getDateFormatted($objectIt->get($refName));

                                    }
                                    break;
                                case 'datetime':
                                    if ( $mathFormulaUsed ) {
                                        $value = strtotime($objectIt->get($refName));
                                    }
                                    else {
                                        $value = getSession()->getLanguage()->getDateTimeFormatted($objectIt->get($refName));
                                    }
                                    break;
                                default:
                                    $value = $objectIt->getHtmlDecoded($refName);
                            }
                            return $value != '' ? $value : $default;
                        }
                    }
                }
                return $match[0];
            },
            $formula
        );
        $text = trim($text, ' -');

        if ( is_object($referenceIt) ) {
            while( !$referenceIt->end() ) {
                $result = array_merge( $result,
                    strpos($text, '{}') === false
                        ? self::computeFormula($referenceIt, $text)
                        : array( $resolveReferences
                                    ? $uid->getUidWithCaption($referenceIt)
                                    : $referenceIt->getId() )
                );
                $referenceIt->moveNext();
            }
        }
        else {
            $result[] = $text;
        }

        $result = array_map(function($value) {
                $matches = array();
                if ( substr($value, 0, 1) == '=' ) {
                    $value = trim($value, '= ');
                    preg_match_all('/(?![\s\d\.,\(\)\-\+\*\^\/])/', $value, $matches);
                    if ( $value != '' && count($matches[0]) == 1 ) {
                        return eval(" return $value; ");
                    }
                }
                return $value;
            }, $result);

        if ( is_numeric(array_shift(array_values($result))) ) {
            return array(
                array_sum($result)
            );
        }

        $result = array_map(function($value) {
            return preg_replace('/(\s){2,}/', '\\1',
                        preg_replace('/(\-){2,}/', '\\1',
                            preg_replace('/(_){2,}/', '\\1',
                                preg_replace('/(\.){2,}/', '\\1', $value))));
        }, $result);

        return array_filter(array_unique($result), function($value) {
            return $value != '';
        });
    }

    protected function getObjectUrl( $object ) {
        return \EnvironmentSettings::getServerUrl().getSession()->getApplicationUrl($object).'api/latest/';
    }

	private $validator_service = null;
	private $mapping_service = null;
	private $filter_resolver = null;
	private $skipFields = array('VPD','Project','RecordVersion');
    private $skipRecursion = array('LanguageEntity', 'DeadlineSwimlane');
}