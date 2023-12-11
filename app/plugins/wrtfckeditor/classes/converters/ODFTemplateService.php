<?php
use Devprom\ProjectBundle\Service\Model\ModelService;

trait ODFTemplateService
{
    protected function postProcess( $outputPath )
    {
        $docExtractDir = SERVER_FILES_PATH . 'tmp/' . md5(uniqid('zip1'));
        mkdir($docExtractDir, 0777, true);

        $result = ZipSystem::unzip($outputPath, $docExtractDir);
        if ( $result != '' ) {
            \Logger::getLogger('System')->info($result);
        }

        $documentContent = file_get_contents($docExtractDir . '/content.xml');

        // make tables to be 100% width
        $documentContent = preg_replace(
            '/<style:table\-properties\s+/i', '<style:table-properties style:rel-width="100%" ',
            $documentContent
        );

        file_put_contents($docExtractDir . '/content.xml', $documentContent);

        ZipSystem::zipAll($outputPath, $docExtractDir);

        FileSystem::rmdirr($docExtractDir);
    }
}