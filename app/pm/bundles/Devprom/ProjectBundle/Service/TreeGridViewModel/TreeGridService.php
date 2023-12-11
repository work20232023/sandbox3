<?php
namespace Devprom\ProjectBundle\Service\TreeGridViewModel;
use Devprom\ProjectBundle\Service\Widget\WidgetService;
use function Webmozart\Assert\Tests\StaticAnalysis\consume;

include_once SERVER_ROOT_PATH."pm/classes/product/FeatureModelExtendedBuilder.php";

class TreeGridService
{
    const TRACES_LIMIT = 10;
    const TRACES_MAX = 100;
    private $uidService = null;
    private $projectIt = null;

    function __construct() {
        getSession()->addBuilder( new \FeatureModelExtendedBuilder() );
        $this->uidService = new \ObjectUID();
        $this->projectIt = getSession()->getProjectIt();
    }

    function getTreeGridJsonView( $listView, $view, $titleField, $childrenField, $parentField, $showTraces = 'trace' )
    {
        if ( $_REQUEST['roots'] == '0' && $_REQUEST['search'] != '' ) {
            unset($_REQUEST['roots']);
        }
        if ( $_REQUEST['roots'] != '0' ) {
            $_REQUEST['rows'] = 'all';
            $_REQUEST['offset1'] = '0';
        }

        $_REQUEST['roots'] = array_shift(explode(':', $_REQUEST['roots']));

        $filterValues = $listView->getFilterValues();
        $baselineFilter = $showTraces == 'trace-baselines' && count(\TextUtils::parseFilterItems($filterValues['branch'])) > 0;
        if ( $baselineFilter ) $showTraces = '';

        $traceAttributes = $showTraces != '' ? $listView->getObject()->getAttributesByGroup($showTraces) : array();

        $listView->setQueryAttributes($traceAttributes);
        $listView->setOffsetName('offset1');
        $listView->extendModel();
        $listView->setRenderView($view);
        $listView->retrieve();
        $json = array();
        $groups = array();
        $listColumns = [];

        $it = $listView->getIteratorRef();
        $listView->shiftNextPage($it, $listView->getOffset());

        $parentClass = get_class($it->object);
        if ( $_REQUEST['roots'] == '0' && $listView->getGroup() != '' ) {
            $parentField = $listView->getGroup();
            $groupSort = $filterValues['group'];
            if ( $parentField == 'TestCase' ) $parentField = 'ParentTestScenario';
            if ( $it->object->IsReference($parentField) ) {
                $groupObject = $it->object->getAttributeObject($parentField);
                $groupObject->setRegistry(new \ObjectRegistrySQL($groupObject));
                $parentClass = get_class($groupObject);
                $groups = $this->buildGroupReferenceCells($it, $groupObject, $parentField, $groupSort);
            }
            else {
                $parentClass = $parentField;
                $groups = $this->buildGroupCells($it, $parentField, $groupSort);
            }
        }

        foreach( array_unique(array_merge(array('UID'), $listView->getColumnsRef())) as $key ) {
            if ( $key == 'Children' ) continue;
            if ( !$listView->getColumnVisibility($key) ) continue;
            $listColumns[] = $key;
        }

        $listView->shiftNextPage($it, $listView->getOffset());

        while( !$it->end() )
        {
            $itemId = get_class($it->object).$it->getId();
            $parentId = $it->get($parentField);

            $hasTraces = false;
            foreach( $traceAttributes as $attribute ) {
                if ( $it->get($attribute) == '' ) continue;
                if ( !$it->object->IsReference($attribute) ) continue;
                $hasTraces = true;
                break;
            }

            $cells = array();
            $this->buildListCells($it, $listView, $listColumns, $cells);

            $cells['title'] = $cells[strtolower($titleField)];
            $cells['caption'] = ($it->getId() != '' ? $it->getDisplayName() : $cells['title']);
            $cells['key'] = $itemId;
            $cells['id'] = $it->getId() . ':' . get_class($it->object);
            $cells['self-id'] = $it->getId();
            $cells['lazy'] = $cells['folder'] = $it->get($childrenField) > 0 || $hasTraces;
            $cells['parent'] = $parentId;
            $cells['parentkey'] = $parentId;
            $cells['icon'] = false;
            $cells['section'] = $it->get('SectionNumber') . ' ';
            $cells['class'] = $listView->getItemClass($it);
            $cells['checkbox-field'] = '<input class=checkbox tabindex="-1" type="checkbox" name="to_delete_'.$it->getId().'">';
            $cells['modified'] = $it->get('AffectedDate');
            $cells['object-state'] = $it->get('State');
            $cells['project'] = $it->get('ProjectCodeName');

            ob_start();
            ?>
            <div class="btn-group btn-group-actions operation last">
                <a class="btn btn-xs dropdown-toggle actions-button btn-secondary" data-toggle="dropdown" href="" data-target="#actions<?=$it->getId()?>">
                    <i class="icon-pencil icon-white"></i>
                    <span class="caret"></span>
                </a>
                <?php
                    echo $view->render('core/PopupMenu.php', array('items' => $listView->getActions($it->getCurrentIt())));
                ?>
            </div>
            <?php
            $cells['actions'] = ob_get_contents();
            ob_end_clean();

            $parents = \TextUtils::parseItems($cells['parent']);
            foreach( $parents as $parent ) {
                $cells['parent'] = $parentClass.$parent;
                $cells['parentkey'] = $parentClass.$parent;
                $json[] = $cells;
            }
            if ( count($parents) < 1 ) {
                $json[] = $cells;
            }

            $it->moveNext();
        }

        $widgets = $this->getWidgets();
        $ids = \TextUtils::parseIds(
            $_REQUEST['roots'] != ''
                ? $_REQUEST['roots']
                : $_REQUEST[strtolower($parentClass)]
        );
        $parentIt = count($ids) > 0
            ? $it->object->getRegistryBase($traceAttributes)->Query([ new \FilterInPredicate($ids) ])
            : $it->object->getEmptyIterator();

        $tracesJson = array();

         while( !$parentIt->end() ) {
            $itemId = get_class($parentIt->object).$parentIt->getId();
            foreach( $traceAttributes as $attribute ) {
                if ( $parentIt->get($attribute) == '' ) continue;
                if ( !$parentIt->object->IsReference($attribute) ) continue;

                $ids = \TextUtils::parseIds($parentIt->get($attribute));

                $refObject = $parentIt->object->getAttributeObject($attribute);
                if ( !getFactory()->getAccessPolicy()->can_read($refObject) ) continue;

                $refRegistry = $refObject->getRegistryBase($refObject->getAttributesByGroup('workitems'));
                $refRegistry->setLimit(self::TRACES_LIMIT);
                $widget_it = $widgets[get_class($refObject)];

                $refIt = $refRegistry->Query(array(
                    new \FilterInPredicate($parentIt->get($attribute))
                ));
                if ( $refIt->count() < 1 ) continue;

                $selfKey = $attribute . $parentIt->getId();
                $cells = array();

                $cells['caption'] = $parentIt->object->getAttributeUserName($attribute);
                if ( count($ids) <= self::TRACES_MAX ) {
                    $cells['caption'] .= ' ('.count($ids).')';
                }
                else {
                    $cells['caption'] .= ' ' . sprintf(text(2936), self::TRACES_MAX);
                }

                if ( is_object($widget_it) && $widget_it->getId() != '' ) {
                    $urlIds = count($ids) <= self::TRACES_MAX ? $ids : array();
                    $url = \WidgetUrlBuilder::Instance()->buildWidgetUrlIds(get_class($refObject), $urlIds, 'ids', $widget_it);
                    $cells['caption'] .= ' &nbsp; <a class="dashed" target="_blank" href="'.$url.'">'.translate('список').'</a>';
                }

                $cells['title'] = $cells['caption'];
                $cells['icon'] = false;
                $cells['key'] = $selfKey;
                $cells['folder'] = true;
                $cells['section'] = ' ';
                $cells['parentkey'] = $itemId;
                $cells['modified'] = time();
                $tracesJson[$selfKey] = $cells;

                $tracesJson = array_merge($tracesJson,
                    $this->getTraceCells($view, $refIt, $selfKey, $ids, $listView, $listColumns)
                );
            }
            $parentIt->moveNext();
        }

        if ( count($groups) > 0 ) {
            $json = \JsonWrapper::buildJSONTree(array_merge($groups, $json), '');
        }
        return array_merge( array_values($json),
                \JsonWrapper::buildJSONTree($tracesJson, '')
            );
    }

    protected function getTraceCells( $view, $refIt, $parentId, $ids, $listView, $listColumns, $limit = self::TRACES_LIMIT )
    {
        $workItemAttributes = $refIt->object->getAttributesByGroup('workitems');

        $json = array();
        $visited = array();

        while( !$refIt->end() && count($json) <= $limit )
        {
            $title = $this->uidService->getUidWithCaption(
                    $refIt, 15, '', $refIt->get('VPD') != $this->projectIt->get('VPD'));

            if ( $refIt->get('Suspected') > 0 ) {
                $title = WidgetService::getHtmlBrokenIcon($refIt->getId(), getSession()->getApplicationUrl($refIt)) . $title;
            }

            $cells = array();
            $this->buildListCells($refIt, $listView, $listColumns, $cells, ['UID']);

            $key = get_class($refIt->object).$refIt->getId().$parentId;
            $cells['caption'] = $title;
            $cells['title'] = $cells['caption'];
            $cells['icon'] = false;
            $cells['key'] = $key;
            $cells['folder'] = false;
            $cells['parent'] = $parentId;
            $cells['section'] = ' ';
            $cells['class'] = strtolower(get_class($refIt->object));
            $cells['id'] = $key;
            $cells['self-id'] = $refIt->getId();

            $actions = array(
                'modify' => array(
                    'name' => translate('Открыть'),
                    'url' => $refIt->getUidUrl()
                )
            );

            if ( $refIt->object instanceof \WikiPage )
            {
                $method = new \ObjectModifyWebMethod($refIt);
                $actions['open'] = [
                    'name' => translate('Изменить'),
                    'url' => $method->getJSCall()
                ];
            }

            $method = new \DeleteObjectWebMethod($refIt);
            if( $method->hasAccess() ) {
                $actions[] = array();
                $actions[] = array(
                    'name' => $method->getCaption(),
                    'url' => $method->getJSCall()
                );
            }

            ob_start();
            ?>
            <div class="btn-group btn-group-actions operation last">
                <a class="btn btn-xs dropdown-toggle actions-button btn-secondary" data-toggle="dropdown" href="" data-target="#actions<?=$key?>">
                    <i class="icon-pencil icon-white"></i>
                    <span class="caret"></span>
                </a>
                <?php
                    echo $view->render('core/PopupMenu.php', array ('items' => $actions));
                ?>
            </div>
            <?php
            $html = ob_get_contents();
            ob_end_clean();

            $cells['actions'] = $html;
            $json[$key] = $cells;
            $visited[] = get_class($refIt->object).$refIt->getId();

            foreach( $workItemAttributes as $workItemAttribute )
            {
                if ( $refIt->get($workItemAttribute) == '' ) continue;

                $selfKey = $workItemAttribute . $key;
                $cells = array();
                $cells['caption'] = $refIt->object->getAttributeUserName($workItemAttribute);
                $cells['title'] = $cells['caption'];
                $cells['icon'] = false;
                $cells['key'] = $selfKey;
                $cells['folder'] = true;
                $cells['section'] = ' ';
                $cells['parent'] = $key;
                $cells['modified'] = time();
                $json[$selfKey] = $cells;

                $json = array_merge($json,
                            $this->buildIteratorCells(
                                $refIt->getRef($workItemAttribute), $selfKey, $visited,
                                $listView, $listColumns
                            )
                        );
            }

            $refIt->moveNext();
        }

        if ( count($json) < count($ids) )
        {
            $widgets = $this->getWidgets();
            $widget_it = $widgets[get_class($refIt->object)];

            $queryString = 'filter=skip';
            if ( count($ids) <= self::TRACES_MAX ) {
                $queryString .= '&ids='.\TextUtils::buildIds($ids);
            }
            $url = $widget_it->getUrl($queryString);

            $text = count($ids) > $limit && count($ids) <= self::TRACES_MAX
                ? str_replace('%1', count($ids) - $limit, text(2028))
                : text(2034);

            $key = get_class($refIt->object).'0';
            $cells = array();
            $cells['caption'] = '<a class="dashed" target="_blank" href="'.$url.'">'.$text.'</a>';
            $cells['title'] = $cells['caption'];
            $cells['icon'] = false;
            $cells['key'] = $key;
            $cells['folder'] = false;
            $cells['parent'] = $parentId;
            $cells['section'] = ' ';
            $json[$key] = $cells;
        }

        return $json;
    }

    protected function buildIteratorCells($objectIt, $parentId, &$visited, $listView, $listColumns, $recursiveAttributesGroup = 'workitems')
    {
        $cells = [];
        $workItemAttributes = $objectIt->object->getAttributesByGroup($recursiveAttributesGroup);

        while( !$objectIt->end() )
        {
            if ( in_array(get_class($objectIt->object).$objectIt->getId(), $visited) ) {
                $objectIt->moveNext();
                continue;
            }
            $visited[] = get_class($objectIt->object).$objectIt->getId();

            $key = get_class($objectIt->object).$objectIt->getId().$parentId;

            $cell = [];
            $this->buildListCells($objectIt, $listView, $listColumns, $cell, ['UID']);

            $cell['caption'] = $this->uidService->getUidWithCaption(
                $objectIt, 15, '', $objectIt->get('VPD') != $this->projectIt->get('VPD'));
            $cell['title'] = $cell['caption'];
            $cell['icon'] = false;
            $cell['key'] = $key;
            $cell['folder'] = false;
            $cell['parent'] = $parentId;
            $cell['section'] = ' ';
            $cell['class'] = strtolower(get_class($objectIt->object));
            $cell['id'] = $key;
            $cell['self-id'] = $objectIt->getId();

            $cells[$key] = $cell;

            foreach( $workItemAttributes as $workItemAttribute )
            {
                if ( $objectIt->get($workItemAttribute) == '' ) continue;
                $cell = array();
                $selfKey = $workItemAttribute . $key;

                $cell['caption'] = $objectIt->object->getAttributeUserName($workItemAttribute);
                $cell['title'] = $cell['caption'];
                $cell['icon'] = false;
                $cell['key'] = $selfKey;
                $cell['folder'] = true;
                $cell['section'] = ' ';
                $cell['parent'] = $key;
                $cell['modified'] = time();
                $cells[$selfKey] = $cell;

                $cells = array_merge($cells,
                            $this->buildIteratorCells(
                                $objectIt->getRef($workItemAttribute), $selfKey, $visited,
                                $listView, $listColumns
                            )
                        );
            }

            $objectIt->moveNext();
        }

        return $cells;
    }

    protected function buildGroupReferenceCells($it, $groupObject, $groupField, $groupSort)
    {
        $groups = array();
        $parentClass = get_class($groupObject);

        $ids = \TextUtils::parseIds(join(',',$it->fieldToArray($groupField)));
        if ( count($ids) < 1 ) return $groups;

        $sorts = array();
        list($dummy, $groupOrder) = explode('.', $groupSort);
        foreach( $groupObject->getSortDefault() as $sort ) {
            if ( !$sort instanceof \SortAttributeClause ) continue;
            $sorts[] = new \SortAttributeClause($sort->getAttributeName() . '.' . $groupOrder);
        }

        if ( $groupObject instanceof \MetaobjectCacheable ) {
            $groupIt = $groupObject->createCachedIterator(
                            array_values(array_filter($groupObject->getAll()->getRowset(),
                                function($row) use ($ids, $groupObject) {
                                    return in_array($row[$groupObject->getIdAttribute()], $ids);
                                }))
                        );
        }
        else {
            $groupIt = $groupObject->getRegistry()->Query(array_merge(
                array(
                    new \FilterInPredicate($ids)
                ), $sorts
            ));
            $parentField = array_shift($groupObject->getAttributesByGroup('hierarchy-parent'));
            if ( $parentField != '' ) {
                $ids = \TextUtils::parseIds(join(',',$groupIt->fieldToArray('ParentPath')));
                if ( count($ids) < 1 ) return $groups;
                $groupIt = $groupObject->getRegistry()->Query(array_merge(
                    array(
                        new \FilterInPredicate($ids)
                    ), $sorts
                ));
            }
        }

        while( !$groupIt->end() ) {
            $selfKey = $parentClass . $groupIt->getId();
            $cells = array();
            $cells['caption'] = $groupIt->getDisplayName();
            $cells['title'] = $cells['caption'];
            $cells['icon'] = false;
            $cells['key'] = $selfKey;
            $cells['folder'] = true;
            $cells['section'] = ' ';
            $cells['id'] = $selfKey;
            $cells['self-id'] = $groupIt->getId();
            $cells['class'] = $parentClass;
            if ( $parentField != '' && $groupIt->get($parentField) != '' ) {
                $parentId = $parentClass . $groupIt->get($parentField);
                $cells['parent'] = $parentId;
                $cells['parentkey'] = $parentId;
            }
            $groups[$selfKey] = $cells;
            $groupIt->moveNext();
        }

        return $groups;
    }

    protected function buildGroupCells($it, $groupField, $groupSort)
    {
        $groups = array();

        if ( $groupField == 'State' && $it->object instanceof \MetaobjectStatable) {
            $stateIt = \WorkflowScheme::Instance()->getStateIt($it->object);
        }

        foreach( $it->fieldToArray($groupField) as $groupValue ) {
            $selfKey = $groupField . $groupValue;
            if ( is_object($stateIt) ) $stateIt->moveTo('ReferenceName', $groupValue);
            if ( $it->object->getAttributeType($groupField) == 'date' ) {
                $groupValue = getSession()->getLanguage()->getDateFormattedShort($groupValue);
            }
            if ( $it->object->getAttributeType($groupField) == 'datetime' ) {
                $groupValue = getSession()->getLanguage()->getDateTimeFormatted($groupValue);
            }
            $cells = array();
            $cells['caption'] = $groupValue;
            $cells['title'] = is_object($stateIt) ? $stateIt->getDisplayName() : $cells['caption'];
            $cells['icon'] = false;
            $cells['key'] = $selfKey;
            $cells['folder'] = true;
            $cells['section'] = ' ';
            $groups[$selfKey] = $cells;
        }

        if ( $groupSort != '' ) {
            list($dummy, $sortDirection) = explode('.', $groupSort);
            if ( $sortDirection == 'A' ) {
                uasort($groups, function($left, $right) {
                    return $left['caption'] > $right['caption'];
                });
            }
            else {
                uasort($groups, function($left, $right) {
                    return $left['caption'] < $right['caption'];
                });
            }
        }

        return $groups;
    }

    protected function getWidgets()
    {
        if ( is_array($this->reference_widgets) ) return $this->reference_widgets;

        $it = getFactory()->getObject('ObjectsListWidget')->getAll();
        while( !$it->end() ) {
            $this->reference_widgets[$it->get('Caption')] = $it->getWidgetIt();
            $it->moveNext();
        }

        return $this->reference_widgets;
    }

    protected function buildListCells($it, $listView, $listColumns, &$cells, $skipColumns = [])
    {
        $plugins = getFactory()->getPluginsManager();
        $plugins_interceptors = is_object($plugins) ? $plugins->getPluginsForSection(getSession()->getSite()) : array();

        foreach( $listColumns as $key )
        {
            if ( in_array($key, $skipColumns) ) continue; // because UID is part of display name already

            ob_start();

            $skipDrawAttribute = false;
            foreach( $plugins_interceptors as $plugin ) {
                if ( $plugin->interceptMethodListDrawCell( $listView, $it, $key ) ) {
                    $skipDrawAttribute = true;
                    break;
                }
            }

            if ( !$skipDrawAttribute ) {
                $it->object->IsReference($key)
                    ? $listView->drawRefCell( $it->getRef($key), $it, $key)
                    : $listView->drawCell( $it, $key );
            }

            $html = ob_get_contents();
            ob_end_clean();

            $cells[strtolower($key)] = $html;
        }
    }
}