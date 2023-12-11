<?php
namespace Devprom\ProjectBundle\Service\Widget;

class WidgetService
{
    static public function getTraceDisplayName( $object_it, $page_it )
    {
        $title = '';

        if ( $page_it->get('Suspected') > 0 ) {
            $title .= self::getHtmlBrokenIcon($page_it->getId(), getSession()->getApplicationUrl());
        }

        $uid = new \ObjectUID($object_it->get($object_it->object->getBaselineReference()));
        return $uid->getUidIcon( $page_it ) . $page_it->getDisplayNameExt($title, $object_it->get('SourceBaseline'));
    }

    static public function getRequestTraceDisplayName( $object_it, $page_it )
    {
        $title = '';

        if ( $page_it->get('Suspected') > 0 ) {
            $title .= self::getHtmlBrokenIcon($page_it->getId(), getSession()->getApplicationUrl($page_it));
        }

        $uid = new \ObjectUID($object_it->get('Baseline'));
        return $uid->getUidIcon( $page_it ) . $page_it->getDisplayNameExt($title, $object_it->get('Baseline'));
    }

    static public function getHtmlBrokenIcon($id, $url)
    {
        $method = "javascript: runMethod('".$url."methods.php?method=OpenBrokenTraceWebMethod', {'object' : '".$id."'}, '', '');";
        $tooltip_url = $url.'tooltip/explain/'.$id;

        return '<a class="with-tooltip" tabindex="-1" data-placement="right" data-original-title="" data-content="" info="'.$tooltip_url.'" href="'.$method.'">
            <img class="trace-state" src="/images/exclamation.png"></a>';
    }
}