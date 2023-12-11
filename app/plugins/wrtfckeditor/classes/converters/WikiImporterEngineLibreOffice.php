<?php
include_once SERVER_ROOT_PATH . "pm/classes/wiki/converters/WikiImporterEngine.php";

class WikiImporterEngineLibreOffice extends WikiImporterEngine
{
    private $outpath = '';

    protected function getHtml( $filePath )
    {
        $options = $this->getOptions();

        $outputPath = SERVER_FILES_PATH . 'tmp/' . md5(uniqid('libreofficeoutput'));
        mkdir($outputPath, 0777, true);

        $filterName = defined('LIBREOFFICE_FILTER') ? LIBREOFFICE_FILTER : "HTML (StarWriter)";
        $command = ' --headless --convert-to "html:'.$filterName.':UTF8" --outdir "'.$outputPath.'" "'.$filePath.'" 2>&1';
        Logger::getLogger('Commands')->info(get_class($this).': '.$command);

        try {
            \FileSystem::execLibreOffice($command);
        }
        catch( \Exception $e ) {
            Logger::getLogger('Commands')->error(get_class($this).': '.$e->getMessage());
            throw $e;
        }

        $info = pathinfo($filePath);
        $fileName = $outputPath . '/' . $info['filename'] . '.html';
        if ( !file_exists($fileName) ) return '';

        $content = file_get_contents($fileName);

        $this->outpath = $outputPath;
        $content = preg_replace_callback( '/<img\s+([^>]*)>/i', array($this, 'replaceImageCallback'), $content);
        $content = preg_replace_callback( '/<embed\s+([^>]*)>/i', array($this, 'replaceImageCallback'), $content);
        $content = preg_replace('/<embed/i', '<img', $content);

        // append table borders
        $content = preg_replace('/<table>/i', '<table border="1">', $content);
        $content = preg_replace_callback('/<table([^>]*)>/i', function($match) {
            return str_replace('border="0"', 'border="1"', $match[0]);
        }, $content);

        FileSystem::rmdirr($outputPath);

        if ( $options['ResetStyles'] != '' )
        {
            $content = str_replace('<font ', '<span ', $content);
            $content = str_replace('</font>', '</span>', $content);

            $result = \TextUtils::getUnstyledHtml(
                            \TextUtils::getValidHtml(
                                \TextUtils::getCleansedHtml(
                                    $content)
                                )
                            );
            return $result;
        }

        $styleSheets = array();
        $styleNodes = explode('<style type="text/css">', $content);
        array_shift($styleSheets);
        foreach( $styleNodes as $node ) {
            $parts = explode('</style>', $node);
            $styleSheets[] = $parts[0];
        }

        $htmldoc = new \InlineStyle\InlineStyle($content);
        $htmldoc->applyStylesheet($styleSheets);

        return preg_replace(
                    array (
                        '/(<table[^>]+)/i',
                        '/(&nbsp;|\xC2\xA0)/i'
                    ),
                    array (
                        '$1 border="1"',
                        ' '
                    ),
                    \TextUtils::getValidHtml(
                        \TextUtils::getCleansedHtml(
                            $htmldoc->getHTML()
                        )
                    )
                );
    }

    function replaceImageCallback( $match )
    {
        $attributes = $match[1];

        if ( preg_match( '/src="([^"]+)"/i', $attributes, $attrs ) ) $url = $attrs[1];
        if ( $url == '' ) return $match[0];
        if ( strpos($url, 'base64') !== false ) return $match[0];

        $filePath = realpath($this->outpath . "/" . basename($url));
        if ( !file_exists($filePath) ) return $match[0];

        $image = file_get_contents($filePath);
        if ( $image === false ) return $match[0];

        $finfo = new \finfo(FILEINFO_MIME_TYPE);
        $mime = $finfo->buffer($image);

        $src = 'data:'.$mime.';base64,'.\TextUtils::encodeImage($filePath);
        $match[0] = preg_replace('/src="[^"]+"/i', 'src="'.$src.'"', $match[0]);

        return $match[0];
    }
}