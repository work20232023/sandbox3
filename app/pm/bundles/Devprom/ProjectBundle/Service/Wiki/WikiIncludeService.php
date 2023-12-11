<?php
namespace Devprom\ProjectBundle\Service\Wiki;

class WikiIncludeService
{
    private $factory = null;
    private $session = null;

    function __construct( $factory, $session ) {
        $this->factory = $factory;
        $this->session = $session;
    }

    function includePagesInto( $object, $pages, $parentPage, $orderNum, $singlePageMode = true )
    {
        $ids = \TextUtils::parseIds($pages);
        if ( count($ids) < 1 ) return;

        $include_it = $object->getRegistry()->Query(
            array (
                $singlePageMode
                    ? new \ParentTransitiveFilter($ids)
                    : new \FilterInPredicate($ids),
                new \ProjectAccessibleVpdPredicate(),
                new \FilterAttributeNullPredicate('Includes'),
                new \SortDocumentClause()
            )
        );

        if ( $include_it->count() < 1 ) return;
        if ( $orderNum == '' ) $orderNum = 10;

        $uid = new \ObjectUID();
        $maps = array();
        while( !$include_it->end() )
        {
            $id = getFactory()->createEntity($object, array (
                    'Caption' => $include_it->getHtmlDecoded('Caption'),
                    'Content' => "{{".$uid->getObjectUID($include_it)."}}",
                    'Includes' => $include_it->getId(),
                    'PageType' => $include_it->get('PageType'),
                    'ParentPage' => $maps[$include_it->get('ParentPage')] != ''
                        ? $maps[$include_it->get('ParentPage')]
                        : $parentPage,
                    'OrderNum' => $orderNum
                ))->getId();

            // specify ParentPage attribute type
            $object->setAttributeType('ParentPage', 'REF_' . get_class($object) . 'Id');

            $maps[$include_it->getId()] = $id;

            $orderNum += 10;
            $include_it->moveNext();
        }

        return true;
    }
}