<?php

include "WidgetRegistry.php";

class Widget extends CacheableSet
{
    function __construct()
    {
        parent::__construct(new WidgetRegistry($this));
        $this->setAttributeCaption('ReferenceName', translate('Описание'));
        $this->setSortDefault(array(
            new SortAttributeClause('Caption')
        ));
    }

    function getDisplayName()
    {
        return text(2317);
    }
}
