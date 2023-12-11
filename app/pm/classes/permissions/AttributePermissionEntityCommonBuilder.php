<?php

class AttributePermissionEntityCommonBuilder extends AttributePermissionEntityBuilder
{
    public function build( AttributePermissionEntityRegistry & $registry )
    {
        $items = array(
            'task',
            'feature',
            'component',
            'milestone',
            'iteration',
            'release',
            'activity',
            'autoaction',
        );
        foreach( $items as $item ) {
            $registry->add($item);
        }

        if ( !getSession()->IsRDD() ) {
            $registry->add('request');
        }
   }
}
