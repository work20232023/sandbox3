<?php
include_once SERVER_ROOT_PATH."ext/locale/LinguaStemRu.php";

class FilterSearchAttributesPredicate extends FilterPredicate
{
    const WORDS_MODE_ALL = 'all';
    const WORDS_MODE_ANY = 'any';
    const WORDS_MODE_EXACT = 'exact';

    private $wordsMode;
	private $attributes;

	function __construct( $phrase, $attributes, $wordsMode = self::WORDS_MODE_ALL )
	{
		$this->attributes = $attributes;
        $this->wordsMode = $wordsMode;
		parent::__construct($phrase);
	}

    function check( $filter ) {
        return addslashes($filter);
    }

    function setWordsMode( $value ) {
        $this->wordsMode = $value;
    }

    function getWordsMode() {
        return $this->wordsMode;
    }

    function getAttributes() {
        return $this->attributes;

    }
 	function _predicate( $filter )
 	{
		$predicates = array();
        $objectClass = get_class($this->getObject());

		$isNumericFilter = is_numeric($filter);
		if ( $isNumericFilter ) {
            $this->attributes[] = $this->getObject()->getIdAttribute();
        }

        $skipMatch = $this->getObject()->getRegistry() instanceof WikiPageRegistryVersion
            || $this->getObject()->getEntityRefName() == 'ObjectChangeLog';

        $wysiwygAttributes = array_values(array_intersect(
                $this->getObject()->getAttributesByType('wysiwyg'),
                $this->attributes
            ));

        if ( count($wysiwygAttributes) > 0 && !$skipMatch )
        {
            $searchString = trim($this->getObject()->formatValueForDb($wysiwygAttributes[0], trim($filter)), "'");

            $words = array_map(
                function($word) {
                    return preg_replace('/@/', '*', trim(addslashes($word),'+-').'*');
                },
                SearchRules::getSearchItems($searchString, getSession()->getLanguageUid())
            );
            if ( count($words) > 0 ) {
                switch( $this->wordsMode ) {
                    case self::WORDS_MODE_ALL:
                        $againstSearchString = '+'.join(' +',$words);
                        break;
                    case self::WORDS_MODE_EXACT:
                        $againstSearchString = '"'.$searchString.'"';
                        break;
                    default:
                        $againstSearchString = '+'.join(' ',$words);
                        break;
                }
                $predicates[] = " {$this->getPK('t')} IN (
                                              SELECT s.ObjectId FROM pm_Searchable s 
                                               WHERE s.ObjectClass = '{$objectClass}'
                                                 AND MATCH (s.SearchContent) AGAINST ('{$againstSearchString}' IN BOOLEAN MODE)) ";
            }
        }

		foreach( $this->attributes as $attribute )
        {
            if ( in_array($attribute, $wysiwygAttributes) ) continue;

            $searchString = trim($this->getObject()->formatValueForDb($attribute, trim($filter)), "'");

            if ( $this->getObject()->getAttributeType($attribute) == 'file' ) {
                $attribute = $attribute . 'Ext';
            }

            if ( $attribute == $this->getObject()->getIdAttribute() ) {
                if ( $isNumericFilter ) {
                    $predicates[] = $this->getAlias().".".$attribute." = {$searchString} ";
                }
            }
            else if ( $attribute == 'UID' ) {
                if ( in_array($this->getObject()->getEntityRefName(), array('WikiPage', 'pm_ChangeRequest')) ) {
                    $predicates[] = $this->getAlias().".UID LIKE '%".addslashes(\DAL::Instance()->Escape($filter))."%' ";
                }
            }
            else {
                if ( $searchString == '' ) continue;

                $searchString = preg_replace('/%/', '', $searchString);
                switch( $this->wordsMode ) {
                    case self::WORDS_MODE_ALL:
                        $andPredicates = array();
                        foreach( SearchRules::getSearchItems($searchString, getSession()->getLanguageUid()) as $word ) {
                            $andPredicates[] = $this->getAlias().".".$attribute." LIKE ('%".addslashes($word)."%') ";
                        }
                        if ( count($andPredicates) < 1 ) {
                            $andPredicates[] = $this->getAlias().".".$attribute." LIKE ('%".addslashes($searchString)."%') ";
                        }
                        $predicates[] = ' (' . join(' AND ', $andPredicates) . ') ';
                        break;
                    case self::WORDS_MODE_EXACT:
                        $predicates[] = $this->getAlias().".".$attribute." LIKE ('%".addslashes($searchString)."%') ";
                        break;
                    default:
                        foreach( SearchRules::getSearchItems($searchString, getSession()->getLanguageUid()) as $word ) {
                            $predicates[] = $this->getAlias().".".$attribute." LIKE ('%".addslashes($word)."%') ";
                        }
                        break;
                }
            }
		}

        $clauses = array();
        if ( $isNumericFilter ) {
            $clauses[] = " av.StringValue = '{$filter}' ";
        }
        else {
            foreach( SearchRules::getSearchItems($filter, getSession()->getLanguageUid()) as $word ) {
                $clauses[] = " av.StringValue LIKE '%".addslashes($word)."%' OR av.TextValue LIKE '%".addslashes($word)."%' ";
            }
        }

        if ( count($clauses) > 0 ) {
            $predicates[] = " EXISTS (SELECT 1 FROM pm_CustomAttribute at, pm_AttributeValue av
                                      WHERE at.EntityReferenceName = '".strtolower(get_class($this->getObject()))."'
                                        AND at.pm_CustomAttributeId = av.CustomAttribute
                                        AND av.ObjectId = t.{$this->getObject()->getIdAttribute()}
                                        AND (".join(" OR ", $clauses).") ) ";
        }

        return count($predicates) < 1 ? " AND 1 = 2 " : " AND (".join(' OR ', $predicates).") ";
 	}
}
