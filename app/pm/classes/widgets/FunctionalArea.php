<?php

include_once SERVER_ROOT_PATH."pm/classes/common/CacheableSet.php";
include "FunctionalAreaRegistry.php";

class FunctionalArea extends CacheableSet
{
    function __construct()
    {
        parent::__construct(new FunctionalAreaRegistry($this));
    }
}
