<?php
include "ProductInfoPostRegistry.php";

class ProductInfoPost extends Metaobject
{
    function __construct() {
        parent::__construct('entity', new ProductInfoPostRegistry($this));
    }
}