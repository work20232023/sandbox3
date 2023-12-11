<?php
include_once "WikiConverterBuilder.php";

class WikiConverterBuilderCommon extends WikiConverterBuilder
{
    function build(WikiConverterRegistry $registry, Metaobject $page)
    {
        $registry->add(
            'WikiIteratorExportPdf',
            'PDF',
            [
                'UseUID' => 'uid',
                'UseNumbering' => 'numbering',
                'ExportChildren' => 'children',
                'ExportParents' => 'parents',
                'UsePaging' => 'paging'
            ]
        );

        $registry->add(
            'WikiIteratorExportHtml',
            'HTML',
            [
                'UseUID' => 'uid',
                'UseNumbering' => 'numbering',
                'ExportChildren' => 'children',
                'ExportParents' => 'parents'
            ]
        );
    }
}