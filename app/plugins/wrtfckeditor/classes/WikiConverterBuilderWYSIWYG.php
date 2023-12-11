<?php
// PHPLOCKITOPT NOENCODE
// PHPLOCKITOPT NOOBFUSCATE

include_once SERVER_ROOT_PATH . "pm/classes/wiki/converters/WikiConverterBuilder.php";
include "converters/WikiConverterPanDocMSWord.php";
include "converters/WikiConverterPanDocODF.php";
include "converters/WikiConverterLibreOfficeMSWord.php";
include "converters/WikiConverterLibreOfficeODF.php";

class WikiConverterBuilderWYSIWYG extends WikiConverterBuilder
{
    private $pandocEnabled = null;
    private $libreOffice = null;

    function __sleep()
    {
        $this->checkPandocInstalled();
        $this->checkLibreOfficeInstalled();
        return array(
            'pandocEnabled',
            'libreOffice'
        );
    }

    function build(WikiConverterRegistry $registry, Metaobject $page)
    {
        if ($this->checkLibreOfficeInstalled())
        {
            $registry->add(
                'WikiConverterLibreOfficeODF',
                text('wrtfckeditor6'),
                [
                    'UseUID' => 'uid',
                    'UseNumbering' => 'numbering',
                    'ExportChildren' => 'children',
                    'ExportParents' => 'parents',
                    'UseSyntax' => 'syntax'
                ]
            );
            $registry->add(
                'WikiConverterLibreOfficeMSWord',
                text('wrtfckeditor5'),
                [
                    'UseUID' => 'uid',
                    'UseNumbering' => 'numbering',
                    'ExportChildren' => 'children',
                    'ExportParents' => 'parents',
                    'UseSyntax' => 'syntax',
                    'File' => ''
                ]
            );
        }
        else if ($this->checkPandocInstalled())
        {
            $registry->add(
                'WikiConverterPanDocODF',
                text('wrtfckeditor6'),
                [
                    'UseUID' => 'uid',
                    'UseNumbering' => 'numbering',
                    'ExportChildren' => 'children',
                    'ExportParents' => 'parents',
                    'UseSyntax' => 'syntax'
                ]
            );
            $registry->add(
                'WikiConverterPanDocMSWord',
                text('wrtfckeditor5'),
                [
                    'UseUID' => 'uid',
                    'UseNumbering' => 'numbering',
                    'ExportChildren' => 'children',
                    'ExportParents' => 'parents',
                    'UseSyntax' => 'syntax',
                    'File' => ''
                ]
            );
        }
    }

    protected function checkPandocInstalled()
    {
        try {
            if (!is_null($this->pandocEnabled)) return $this->pandocEnabled;
            return $this->pandocEnabled = strpos(\FileSystem::execPanDoc(), 'pandoc') !== false;
        } catch( \Exception $e ) {
            \Logger::getLogger('Commands')->debug($e->getMessage());
            return false;
        }
    }

    protected function checkLibreOfficeInstalled()
    {
        try {
            if (!is_null($this->libreOffice)) return $this->libreOffice;
            return $this->libreOffice = stripos(\FileSystem::execLibreOffice(), 'office') !== false;
        } catch( \Exception $e ) {
            \Logger::getLogger('Commands')->debug($e->getMessage());
            return false;
        }
    }
}
