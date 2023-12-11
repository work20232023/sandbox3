<?php
use Caxy\HtmlDiff\HtmlDiff;
use Caxy\HtmlDiff\HtmlDiffConfig;

include "ImageDiff.php";

class WikiHtmlDiff extends HtmlDiff
{
    private $images = array();

    public function __construct($oldText, $newText, $encoding = 'UTF-8', $specialCaseTags = null, $groupDiffs = null)
    {
        $newText = preg_replace_callback('/src="([^"]+)"/i', array($this, 'hashImages'), $newText);
        $oldText = preg_replace_callback('/src="([^"]+)"/i', array($this, 'hashImages'), $oldText);

        parent::__construct($oldText, $newText, $encoding, $specialCaseTags, $groupDiffs);
    }

    public function setConfig(HtmlDiffConfig $config)
    {
        $config->setPurifierEnabled(false);
        parent::setConfig($config);
    }

    protected function diffElementsByAttribute($oldText, $newText, $attribute, $element)
    {
        switch( $element ) {
            case 'img':
                switch( $attribute ) {
                    case 'src':
                        $oldHash = $this->getAttributeFromTag($oldText, $attribute);
                        $newHash = $this->getAttributeFromTag($newText, $attribute);

                        $result = $this->diffImages(
                            HtmlImageConverter::decodeBase64Image($this->images[$oldHash]),
                            HtmlImageConverter::decodeBase64Image($this->images[$newHash])
                        );

                        if ( $result == "" ) {
                            return parent::diffElementsByAttribute($oldText, $newText, $attribute, $element);
                        }

                        $resultHash = crc32($result);
                        $this->images[$resultHash] = $result;

                        return "<img src=\"{$resultHash}\">";
                }
        }
        return parent::diffElementsByAttribute($oldText, $newText, $attribute, $element);
    }

    protected function diffImages( $oldImage, $newImage )
    {
        $resultImage = ImageDiff::binary($oldImage, $newImage);
        if ( $resultImage == "" ) return $resultImage;
        return HtmlImageConverter::encodeBase64Image($resultImage);
    }

    public function build()
    {
        try {
            $html = parent::build();

            $self = $this;
            $html = preg_replace_callback('/src="(-?[\d]+)"/i',
                        function($match) use($self) {
                            return "src=\"{$self->images[$match[1]]}\"";
                        }, $html
                    );

            return $html;
        }
        catch(\Exception $e) {
            \Logger::getLogger('System')->error($e->getMessage().$e->getTraceAsString());
            return "";
        }
    }

    protected function purifyHtml($html) {
        return $html;
    }

    function hashImages( $match )
    {
        $hash = crc32($match[1]);
        $this->images[$hash] = $match[1];
        return "src=\"{$hash}\" ";
    }
}