<?php

use ZBateson\MailMimeParser\MailMimeParser;
use ZBateson\MailMimeParser\Header\HeaderConsts;

include_once SERVER_ROOT_PATH . "pm/classes/wiki/converters/WikiImporterEngine.php";

class WikiImporterEngineMail extends WikiImporterEngine
{
    protected function getHtml( $filePath ) {
        $content = '';

        try {
            $extension = substr($filePath, strrpos($filePath, '.') + 1);
            if (!in_array(mb_strtolower($extension), [
                'eml',
                'msg'
            ])) {
                return '';
            }

            $mailParser = new MailMimeParser();

            $fileHandle = fopen($filePath, 'r');
            $message = $mailParser->parse($fileHandle, false);

            $content = '<table border="1"><tr><td>Кому:</td><td>'
                . $message->getHeaderValue(HeaderConsts::TO)
                . "</td></tr><tr><td>От:</td><td>"
                . $message->getHeaderValue(HeaderConsts::FROM) .
                "</td></tr><tr><td>Тема:</td><td>"
                . $message->getHeaderValue(HeaderConsts::SUBJECT)
                . "</td></tr></table><br>" . $message->getTextContent();

            fclose($fileHandle);
        } catch( \Exception $e ) {
            \Logger::getLogger('System')->error($e->getMessage().$e->getTraceAsString());
        }

        return $content;
    }
}