<?php

class WidgetUrlBuilder
{
    public static function Instance()
    {
        if ( is_object(static::$singleInstance) ) return static::$singleInstance;
        static::$singleInstance = new static();
        return static::$singleInstance;
    }

    public static function Destroy() {
        static::$singleInstance = null;
    }

    public function buildWidgetUrlIt( $objectIt, $idsKey = 'ids', $widgetIt = null )
    {
        return $this->buildWidgetUrlIds(
            get_class($objectIt->object),
            $objectIt->idsToArray(),
            $idsKey,
            $widgetIt
        );
    }

    public function buildWidgetUrlIds( $className, $ids, $idsKey = 'ids', $widgetIt = null )
    {
        if ( !is_object($widgetIt) ) {
            $widgetIt = getFactory()->getObject('ObjectsListWidget')
                            ->getByRef('Caption', $className)->getWidgetIt();
        }

        if ( $widgetIt->getId() != '' ) {
            $ids = array_filter($ids, function($item) {
                return $item > 0;
            });

            return $widgetIt->getUrl(
                $idsKey . '=' . (count($ids) < 1 ? '0' : \TextUtils::buildIds($ids)) . '&target=accessible'
            );
        }
        return '';
    }

    private function __construct() {
        if ( class_exists('Portfolio') ) {
            $portfolio = getFactory()->getObject('Portfolio');
            self::$projectIt = $portfolio->getByRef('CodeName', 'my');
            if ( self::$projectIt->getId() == '' ) {
                self::$projectIt = $portfolio->getByRef('CodeName', 'all');
            }
        }
    }

    protected static $singleInstance = null;
    protected static $projectIt = null;
}