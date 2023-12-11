<?php

class TagParentPersister extends ObjectSQLPersister
{
    private $tagIds = array();

    function map(& $parms)
    {
        if ( $parms['Tag'] == '' ) return;

        $tags = \TextUtils::parseIds($parms['Tag']);
        $parms['Tag'] = array_shift($tags);

        foreach( $tags as $tagId ) {
            $tagParms = $parms;
            $tagParms['Tag'] = $tagId;
            $this->getObject()->getRegistry()->Create($tagParms);
        }
    }
}
