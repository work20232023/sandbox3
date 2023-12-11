<?php
include_once "ObjectRegistrySQL.php";

class ObjectRegistryArray extends ObjectRegistrySQL
{
    function Query( $parms = array() )
    {
        $rowset = parent::Query($parms)->getRowset();

        foreach( $parms as $parm )
        {
            if ( $parm instanceof FilterInPredicate )
            {
                $id_key = $this->getObject()->getIdAttribute();
                $id_value = \TextUtils::parseFilterItems($parm->getValue());

                if ( count($id_value) > 0 ) {
                    $rowset = array_filter( $rowset, function(&$row) use($id_key, $id_value) {
                        return in_array($row[$id_key], $id_value);
                    });
                }
                else {
                    $rowset = array();
                }
            }

            if ( $parm instanceof FilterAttributePredicate )
            {
                $id_key = $parm->getAttribute();
                $id_value = \TextUtils::parseFilterItems($parm->getValue());

                if ( count($id_value) > 0 ) {
                    $rowset = array_filter($rowset, function (&$row) use ($id_key, $id_value) {
                        return in_array($row[$id_key], $id_value);
                    });
                }
            }

            if ( $parm instanceof FilterSearchAttributesPredicate )
            {
                if ( count(\TextUtils::parseFilterItems($parm->getValue())) < 1 ) continue;
                $attributes = $parm->getAttributes();

                $searchPattern = $parm->getWordsMode() == FilterSearchAttributesPredicate::WORDS_MODE_EXACT
                    ? "'%s'" : "%s";

                $words = $parm->getWordsMode() == FilterSearchAttributesPredicate::WORDS_MODE_EXACT
                    ? array($parm->getValue())
                    : SearchRules::getSearchItems($parm->getValue(), getSession()->getLanguageUid());

                $rowset = array_filter($rowset, function($value) use ($words, $attributes, $searchPattern) {
                    $data = array();
                    foreach( $attributes as $attribute ) {
                        $data[] = "'{$value[$attribute]}'";
                    }
                    $title = join('; ',$data);

                    return array_sum(
                            array_map(
                                function($item) use ($title, $searchPattern) {
                                    return mb_stripos($title, sprintf($searchPattern, $item)) !== false;
                                },
                                $words
                            )
                        ) == count($words);
                });
            }

            if ( $parm instanceof SortAttributeClause )
            {
                $attribute = $parm->getAttributeName();
                if ( $parm->getSortType() == 'ASC' ) {
                    usort($rowset, function( $left, $right ) use($attribute) {
                        return $left[$attribute] > $right[$attribute];
                    });
                }
                else {
                    usort($rowset, function( $left, $right ) use($attribute) {
                        return $left[$attribute] <= $right[$attribute];
                    });
                }
            }
        }
        return $this->createIterator(array_values($rowset));
    }

    function QueryById( $ids )
    {
        return $this->Query([ new FilterInPredicate($ids) ]);
    }

    public function QueryKeys( $parms = array(), $do_exec = true )
    {
        return $this->Query($parms);
    }

    public function Count( $parms = array() )
    {
        return $this->Query($parms)->count();
    }

    function Store(OrderedIterator $object_it, array $data)
    {
        return $this->getObject()->getEmptyIterator();
    }

    function Create(array $data)
    {
    }
}