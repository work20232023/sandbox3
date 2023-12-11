<?php
include_once "WikiConverterLibreOffice.php";
include "ODFTemplateService.php";

class WikiConverterLibreOfficeODF extends WikiConverterLibreOffice
{
    use ODFTemplateService;

    protected function getToParms() {
        return 'odt:"writer8"';
    }

    protected function getExtension() {
        return ".odt";
    }

    protected function getMime() {
        return "application/vnd.oasis.opendocument.text";
    }
}
