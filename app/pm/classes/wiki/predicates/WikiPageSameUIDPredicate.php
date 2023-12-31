<?php

class WikiPageSameUIDPredicate extends FilterPredicate
{
    function _predicate( $filter )
    {
        $ids = \TextUtils::parseIds($filter);
        if ( count($ids) < 1 ) return " AND 1 = 2 ";
        return " AND EXISTS (
                    SELECT 1 FROM WikiPage p 
                     WHERE p.WikiPageId IN (".join(",",$ids).") 
                       AND t.UID = p.UID
                    UNION
                    SELECT 1 FROM WikiPage p, WikiPage i
                     WHERE p.WikiPageId IN (".join(",",$ids).")
                       AND i.WikiPageId = t.Includes 
                       AND i.UID = p.UID
                    ) ";
    }
}
