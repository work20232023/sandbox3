<?php
include_once SERVER_ROOT_PATH . "pm/classes/wiki/converters/WikiImporterEngine.php";

class WikiImporterEngineTxt extends WikiImporterEngine
{
    protected function getHtml( $filePath ) {
        $content = '';

        try {
            $extension = substr($filePath, strrpos($filePath, '.') + 1);
            if ($extension !== 'txt') return '';

            $text = file_get_contents($filePath);

            $content = str_replace(PHP_EOL, '<br>', $text);

        } catch( \Exception $e ) {
            \Logger::getLogger('System')->error($e->getMessage().$e->getTraceAsString());
        }

        return $content;
    }
}