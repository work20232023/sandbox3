<?php
use Devprom\ProjectBundle\Service\Model\ModelService;

include_once SERVER_ROOT_PATH."pm/views/wiki/parsers/WikiParser.php";
include_once SERVER_ROOT_PATH . "pm/views/wiki/diff/WikiHtmlDiff.php";
define( 'REGEX_MATH_TEX', '/<span\s+class="math-tex"[^>]*>([^<]+)<\/span>/i' );
define( 'REGEX_IFRAME_UPDATE', '/<iframe\s+([^>]+)>/i' );
define( 'REGEX_UPDATE_UID_TITLE', '/<a\s+([^<]+)<\/a>/i' );
define( 'REGEX_WIDGET_URL', '/alm-widget-module="([^"]+)"/i' );
define( 'REGEX_WIDGET_PARMS', '/alm-widget-parms="([^"]+)"/i' );

class WrtfCKEditorPageParser extends WikiParser
{
    private $tableRowIndex = 0;
    private $codeBlocks = array();
    private $imageBlocks = array();
    private $imageRestoreCallback = null;

    function __construct($wiki_it) {
        parent::__construct($wiki_it);
        $this->imageRestoreCallback = function( $data ) {
            return $data;
        };
    }

    function parse( $content = null )
    {
        $this->tableRowIndex = 0;

        $callbacks = array(
            CODE_ISOLATE => array($this, 'codeIsolate'),
            IMAGE_ISOLATE => array($this, 'imageIsolate'),
            REGEX_UID => array($this, 'parseUidCallback'),
            REGEX_UPDATE_UID_TITLE => array($this, 'updateUIDTitle'),
            REGEX_UPDATE_UID => array($this, 'parseUpdateUidCallback'),
            REGEX_IFRAME_UPDATE => array($this, 'parseIframeAttributes'),
            REGEX_WIDGET_URL => array($this, 'parseWidgetUrl'),
            REGEX_WIDGET_PARMS => array($this, 'parseWidgetParms'),
            TextUtils::REGEX_SHARE => array(TextUtils::class, 'shrinkLongShare')
        );

        if ( is_object($this->getObjectIt()) ) {
            $customUIDRule = $this->getObjectIt()->object->getDefaultAttributeValue('UID');
            if ( $customUIDRule != '' ) {
                $customUIDRule = preg_replace('/\\\{(ИД|Id|Номер|Number)\\\}/', '\d+', preg_quote($customUIDRule));
                $callbacks['/(^|<[^as][^>]*>|<s[^t][^>]*>|[^>\[\/A-Z0-9])\[?('.$customUIDRule.')\]?/mi'] = array($this, 'parseUidCallback');
            }
        }

        $callbacks = array_merge($callbacks,
            array(
                IMAGE_RESTORE => array($this, 'imageRestore'),
                '/\s+src="([^d][^"]+)"/i' => array($this, 'parseImageSrcCallback'),
                CODE_RESTORE => array($this, 'codeRestore')
            )
        );

        if ( function_exists('preg_replace_callback_array') ) {
            return preg_replace_callback_array($callbacks, $content);
        }
        else {
            foreach( $callbacks as $regexp => $callback ) {
                $content = preg_replace_callback($regexp, $callback, $content);
            }
            return $content;
        }
    }

    function parseMathTex( $match ) {
        $url = EnvironmentSettings::getMathJaxServer();
        return '<img src="'.$url.rawurlencode(trim(html_entity_decode($match[1], ENT_QUOTES | ENT_HTML401, APP_ENCODING ))).'">';
    }

    function resetCodeBlocks() {
        $this->codeBlocks = array();
    }

    function getCodeBlocks() {
        return $this->codeBlocks;
    }

    function codeIsolate( $match ) {
        return '<code'.$match[1].'>'.array_push($this->codeBlocks, $match[2]).'</code>';
    }

    function codeRestore( $match ) {
        return '<code'.$match[1].'>'.$this->codeBlocks[$match[2] - 1].'</code>';
    }

    function imageIsolate( $match ) {
        return '<img'.array_push($this->imageBlocks, $match[0]).'/>';
    }

    function setImageRestoreCallback( callable $callable ) {
        $this->imageRestoreCallback = $callable;
    }

    function imageRestore( $match ) {
        return call_user_func($this->imageRestoreCallback, $this->imageBlocks[$match[1] - 1]);
    }

    function parseIframeAttributes( $match )
    {
        $timeKey = 't_2e89d51a7127';
        if ( strpos($match[0], $timeKey) > 0 ) {
            return preg_replace('/'.$timeKey.'=[^&]+/i', uniqid(), $match[0]);
        }
        else {
            return preg_replace('/src="([^&]+)([^"]+)"/i', 'src="\\1&'.$timeKey.'='.uniqid().'&\\2"', $match[0]);
        }
    }

    function parseWidgetUrl( $match )
    {
        if ( $this->getObjectIt()->object instanceof PMCustomAttribute ) return $match[0];

        $moduleIt = getFactory()->getObject('Module')->getExact($match[1]);
        if ( $moduleIt->getId() == '' ) {
            $moduleIt = getFactory()->getObject('PMReport')->getExact($match[1]);
            if ( $moduleIt->getId() == '' ) {
                return $match[0];
            }
        }
        return $match[0] . " alm-widget-url=\"{$moduleIt->getUrl('w')}\" ";
    }

    function parseWidgetParms( $match )
    {
        if ( $this->getObjectIt()->object instanceof PMCustomAttribute ) return $match[0];

        $items = array();
        foreach( ModelService::computeFormula($this->getObjectIt(), $match[1]) as $computedItem ) {
            $items[] = $computedItem;
        }
        $result = join(',',$items);
        return $match[0] . " alm-widget-query=\"{$result}\" ";
    }

    function parseUpdateUidCallback ( $match )
    {
        $url_parts = parse_url($match[0]);
        $uid = basename($url_parts['path']);

        $uid_info = $this->getUidInfo($uid);
        if ( count($uid_info) < 1 ) return $match[0];

        if ( is_object($uid_info['object_it']) ) {
            $object_it = $uid_info['object_it'];
            $url = $this->getPageUrl($object_it);
            if ( $url != '' ) $uid_info['url'] = $url;
        }
        return $uid_info['url'];
    }

    function updateUIDTitle( $match )
    {
        if ( strpos($match[1], 'class="uid"') === false ) return $match[0];

        list($attributes, $title) = preg_split('/>/', $match[1]);
        if ( $title == '' ) return $match[0];

        $urlMatches = array();
        if ( !preg_match('/\/([A-Z]{1}-[0-9]+)/i', $attributes, $urlMatches)) return $match[0];

        $info = $this->getUidInfo($urlMatches[1]);
        if ( $info['caption'] == '' ) return $match[0];

        $callback = $this->getTitleResolver();
        if ( is_callable($callback) ) {
            $title = $callback($info);
        }
        else {
            $title = '[' . $info['uid'] . '] '. $info['native'];
        }
        return '<a ' . $attributes . '>' . $title . '</a>';
    }
}
