<?php
include "WikiDocumentRegistry.php";
include "WikiDocumentIterator.php";

class WikiDocument extends WikiPage
{
    function __construct() {
        parent::__construct(new WikiDocumentRegistry($this));
    }

    function createIterator() {
        return new WikiDocumentIterator($this);
    }
}