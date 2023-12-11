<?php
include "DocsAPIEntityRegistry.php";

class DocsAPIEntity extends CacheableSet
{
 	function __construct() {
 		parent::__construct(new DocsAPIEntityRegistry($this));
        $this->setSortDefault(array(
            new SortAttributeClause('Caption')
        ));
        $this->setAttributeCaption('ReferenceName', text('Класс'));
        foreach( array('packageId','RecordCreated','RecordModified','IsOrdered','IsDictionary','OrderNum') as $attribute ) {
            $this->addAttributeGroup($attribute, 'system');
        }
 	}

    function IsPersistable() {
        return false;
    }

    function getPage() {
        return getSession()->getApplicationUrl($this).'apidocs/list?';
    }
}
