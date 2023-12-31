<?php
include_once SERVER_ROOT_PATH."core/views/charts/FlotChartWidget.php";

class PlanChartWidget extends FlotChartWidget
{
    private $iterator = null;
    private $projects = array();
    private $groupByProjects = false;
    private $start = '';
    private $finish = '';
    private $startDataField = 'EstimatedStartDate';
    private $finishDataField = 'EstimatedFinishDate';

    public function __construct( $iterator, $start, $finish )
    {
        $this->iterator = $iterator;
        $this->start = $start;
        $this->finish = $finish;

        $this->projects = $this->iterator->fieldToArray('Project');
        if ( count($this->projects) < 1 ) $this->projects = array(getSession()->getProjectIt()->getId());

        $projectIt = getFactory()->getObject('Project')->getExact($this->projects);
        $this->projectStart = min($projectIt->fieldToArray('EstimatedStartDate'));
        $this->projectFinish = max($projectIt->fieldToArray('EstimatedFinishDate'));

        $this->groupByProjects = count($this->projects) > 1 || getSession()->getProjectIt()->getMethodologyIt()->get('IsReleasesUsed') != 'I';
        parent::__construct();
    }

    function setStartDataField( $name ) {
        $this->startDataField = $name;
    }

    function setFinishDataField( $name ) {
        $this->finishDataField = $name;
    }

    public function draw( $chart_id )
    {
        ?>
        <link rel="stylesheet" href="/scripts/vis/vis.min.css?v=<?=$_SERVER['APP_VERSION']?>" />
        <script src="/scripts/vis/moment-with-locales.min.js?v=<?=$_SERVER['APP_VERSION']?>" type="text/javascript" charset="UTF-8"></script>
        <script src="/scripts/vis/vis.min.js?v=<?=$_SERVER['APP_VERSION']?>" type="text/javascript" charset="UTF-8"></script>
        <script src="/scripts/vis/handlebars-v4.1.0.js?v=<?=$_SERVER['APP_VERSION']?>" type="text/javascript" charset="UTF-8"></script>
        <script id="uid-template" type="text/x-handlebars-template">
            <a class="with-tooltip" placement="bottom" info="/pm/{{project}}/tooltip/{{objectclass}}/{{objectid}}" href="/pm/{{project}}/{{letter}}-{{objectid}}">[{{letter}}-{{objectid}}]</a>
            {{{ content }}}
        </script>
        <script id="base-template" type="text/x-handlebars-template">
            {{{ title }}}
        </script>

        <script id="release-template" type="text/x-handlebars-template">
            <div style="display:table-cell;vertical-align:top;line-height: 1.7;">
                {{{ title }}} <br/>
                {{#if velocity}}
                {{{velocity}}}
                {{#if maximum}}
                <div><?=text(1020)?>: {{{maximum}}}</div>
                {{/if}}
                {{#if estimation}}
                <div style="{{estimationStyle}}"><?=text(1021)?>: {{{estimation}}}</div>
                {{/if}}
                {{/if}}
            </div>
            {{#if burndown}}
            <div style="display:table-cell;vertical-align:top;padding-left: 12px;">
                <?php
                $url = '/pm/{{project}}/issues/chart/releaseburndown?report=releaseburndown&basemodule=issues-chart&release={{objectid}}';
                $releaseBurndownId = 'chart'.md5($url);
                echo '<div id="'.$releaseBurndownId.'{{objectid}}" class="plot" url="'.$url.'" style="height:90px;width:210px;"></div>';
                ?>
            </div>
            {{/if}}
        </script>

        <script id="iteration-template-long" type="text/x-handlebars-template">
            <div style="display:table-cell;vertical-align:top;line-height: 1.7;">
                {{{ title }}} <br/>
                {{#if velocity}}
                {{{velocity}}}
                {{#if maximum}}
                <div><?=text(1020)?>: {{{maximum}}}</div>
                {{/if}}
                {{#if estimation}}
                <div style="{{estimationStyle}}"><?=text(1021)?>: {{{estimation}}}</div>
                {{/if}}
                {{/if}}
            </div>
            {{#if burndown}}
            <div style="display:table-cell;vertical-align:top;padding-left: 12px;">
                <?php
                $url = '/pm/{{project}}/tasks/chart/iterationburndown?report=iterationburndown&basemodule=tasks-chart&iteration={{objectid}}';
                $iterationLongBurndownId = 'chart'.md5($url);
                echo '<div id="'.$iterationLongBurndownId.'{{objectid}}" class="plot" url="'.$url.'" style="height:90px;width:210px;"></div>';
                ?>
            </div>
            {{/if}}
        </script>

        <script id="iteration-template" type="text/x-handlebars-template">
            {{{ title }}}
            {{#if burndown}}
            <?php
            $url = '/pm/{{project}}/tasks/chart/iterationburndown?report=iterationburndown&basemodule=tasks-chart&iteration={{objectid}}';
            $iterationBurndownId = 'chart'.md5($url);
            echo '<div id="'.$iterationBurndownId.'{{objectid}}" class="plot" url="'.$url.'" style="height:90px;width:210px;"></div>';
            ?>
            {{/if}}
            {{#if velocity}}
            <br/> {{{velocity}}}
            {{#if maximum}}
            <div><?=text(1020)?>: {{{maximum}}}</div>
            {{/if}}
            {{#if estimation}}
            <div style="{{estimationStyle}}"><?=text(1021)?>: {{{estimation}}}</div>
            {{/if}}
            {{/if}}
        </script>
        <?php
        $items = $this->getItems();
        $groups = $this->getGroups();
        $firstItem = array_shift(array_values($items));

        foreach( $items as $item ) {
            if ( $item['objectclass'] == 'Iteration' && $item['burndown'] == 1 ) {
                $flot = new FlotChartBurndownWidget();
                $flot->setLegend(false);
                $flot->setUrl( getSession()->getApplicationUrl().'chartburndown.php?release_id='.$item['objectid'].'&json=1' );
                $flot->draw($iterationBurndownId.$item['objectid']);
                $flot->draw($iterationLongBurndownId.$item['objectid']);
            }
            if ( $item['objectclass'] == 'Release' && $item['burndown'] == 1 ) {
                $flot = new FlotChartBurndownWidget();
                $flot->setLegend(false);
                $flot->setUrl( getSession()->getApplicationUrl().'chartburndownversion.php?version='.$item['objectid'].'&json=1' );
                $flot->draw($releaseBurndownId.$item['objectid']);
            }
        }
        ?>
        <script type="text/javascript">
            var planTemplates = {
                'uid-template': Handlebars.compile(document.getElementById('uid-template').innerHTML),
                'base-template': Handlebars.compile(document.getElementById('base-template').innerHTML),
                'iteration-template': Handlebars.compile(document.getElementById('iteration-template').innerHTML),
                'iteration-template-long': Handlebars.compile(document.getElementById('iteration-template-long').innerHTML),
                'release-template': Handlebars.compile(document.getElementById('release-template').innerHTML)
            };
            var container = document.getElementById('<?=$chart_id?>');
            var options = {
                start: '<?=$this->start?>',
                end: '<?=$this->finish?>',
                editable: {
                    add: false,
                    updateGroup: false,
                    remove: false,
                    updateTime: true
                },
                margin: {
                    item: {
                        horizontal: -1
                    }
                },
                groupOrder: 'index',
                locales: {
                    // create a new locale (text strings should be replaced with localized strings)
                    ru: {
                        current: '<?='Текущее'?>',
                        time: '<?='время'?>',
                    },
                    en: {
                        current: 'Current',
                        time: 'time',
                    }
                },
                locale: '<?=strtolower(getSession()->getLanguageUid())?>',
                template: function (item) {
                    var template = planTemplates[item.template];
                    return template(item);
                },
                onMove: function(item, callback) {
                    callback(item);
                    if ( typeof item.modifyUrl != 'undefined' ) {
                        item.modifyUrl = item.modifyUrl.replace('{{start}}', (new Date(item.start)).toString('yyyy-MM-dd'));
                        if ( typeof item.end != 'undefined' ) {
                            item.modifyUrl = item.modifyUrl.replace('{{end}}', (new Date(item.end)).toString('yyyy-MM-dd'));
                        }
                        window.location = item.modifyUrl;
                        $(document).trigger("trackerItemSelected", [0, false, item.objectclass]);
                        $(document).trigger("trackerItemSelected", [item.objectid, false, item.objectclass]);
                    }
                },
                zoomKey: '<?=(count($groups) > 3 ? 'ctrlKey' : '')?>',
                verticalScroll: <?=(count($groups) > 3 ? 'true' : 'false')?>,
                maxHeight: 'calc(100vh - 190px)'
            };

            var dataSet = new vis.DataSet(<?=JsonWrapper::encode($items)?>);
            var timeline = new vis.Timeline( container,
                dataSet,
                new vis.DataSet(<?=JsonWrapper::encode($groups)?>),
                options
            );
            timeline.on('doubleClick', function( data ) {
                var item = dataSet.get(data.item);
                if ( item != undefined && typeof item.url != 'undefined' ) {
                    window.location.replace(item.url);
                }
            });
            timeline.on('click', function( data ) {
                if ( data.item ) return;
                if ( data.what && data.what == 'background' ) {
                    if ( data.group.charAt(0) == 'R' ) {
                        $(document).trigger("trackerItemSelected", [data.group.substring(1), false, 'Release']);
                    }
                }
            });
            timeline.on('select', function (properties) {
                if ( properties.items.length < 1 ) return;
                var parts = (properties.items + "").split(':');
                $(document).trigger("trackerItemSelected", [parts[1], false, parts[0]]);
            });
            timeline.addCustomTime('<?=$this->projectStart?>', 'project-start');
            timeline.setCustomTimeTitle('<?=text(3322)?>', 'project-start');
            timeline.addCustomTime('<?=$this->projectFinish?>', 'project-finish');
            timeline.setCustomTimeTitle('<?=text(3323)?>', 'project-finish');

            <? if ( count($firstItem) > 0 ) { ?>
            setTimeout(function() {
                $(document).trigger('trackerItemSelected', [<?=$firstItem['objectid']?>, false, '<?=$firstItem['objectclass']?>']);
            }, 500);
            <? } ?>
        </script>
        <?php
    }

    protected function getProjectIt( $project_ids )
    {
        $registry = getFactory()->getObject('Project')->getRegistry();
        $registry->setPersisters(array());
        return $registry->Query(
            array (
                new FilterInPredicate($project_ids),
                new SortAttributeClause('Importance'),
                new SortAttributeClause($this->startDataField),
                new SortAttributeClause('Caption')
            )
        );
    }

    protected function getGroups()
    {
        $groups = array();
        $releaseTitle = '<span class="ref-name">' . translate('Релиз') . '</span> ';

        $project_it = $this->getProjectIt($this->projects);
        while( !$project_it->end() )
        {
            $projectTitle = count($this->projects) > 1
                ? '<a href="/pm/'.$project_it->get('CodeName').'/plan/hierarchy">'.$project_it->getDisplayName().'</a>'
                : '';
            $foundRelease = false;
            $methodologyIt = $project_it->getMethodologyIt();

            $this->iterator->moveFirst();
            while( !$this->iterator->end() ) {
                if ( $this->iterator->get('ObjectClass') == 'Milestone' && $this->iterator->get('VPD') == $project_it->get('VPD') ) {
                    $id = 'P'.$project_it->getId();
                    $groups[$id] = array (
                        'id' => $id,
                        'content' => $projectTitle == '' ? translate('Вехи') : $projectTitle . ': '.translate('Вехи'),
                        'start' => $this->iterator->get('StartDate')
                    );
                    $foundRelease = true;
                }
                $this->iterator->moveNext();
            }

            if ( $methodologyIt->HasPlanning() ) {
                $this->iterator->moveFirst();
                while( !$this->iterator->end() ) {
                    if ( $this->iterator->get('ObjectClass') == 'Release' && $this->iterator->get('VPD') == $project_it->get('VPD') ) {
                        $id = 'R'.$this->iterator->get('entityId');
                        $groups[$id] = array (
                            'id' => $id,
                            'content' => $projectTitle == ''
                                ? $releaseTitle . $this->iterator->get('Caption')
                                : $projectTitle . ': ' . $releaseTitle . $this->iterator->get('Caption'),
                            'start' => $this->iterator->get('StartDate')
                        );
                        $foundRelease = true;
                    }
                    $this->iterator->moveNext();
                }

                if ( !$foundRelease ) {
                    $this->iterator->moveFirst();
                    $releases = array();
                    while( !$this->iterator->end() ) {
                        if ( $this->iterator->get('ObjectClass') == 'Iteration' && $this->iterator->get('VPD') == $project_it->get('VPD') ) {
                            if ( $this->iterator->get('Release') > 0 ) {
                                $releases[] = $this->iterator->get('Release');
                            }
                        }
                        $this->iterator->moveNext();
                    }

                    if ( count($releases) > 0 ) {
                        $releaseIt = getFactory()->getObject('Release')->getRegistry()->Query(
                            array(
                                new FilterInPredicate($releases)
                            )
                        );
                        while( !$releaseIt->end() ) {
                            $id = 'R'.$releaseIt->getId();
                            $groups[$id] = array (
                                'id' => $id,
                                'content' => $projectTitle == ''
                                    ? $releaseTitle . $releaseIt->get('Caption')
                                    : $projectTitle . ': ' . $releaseTitle . $releaseIt->get('Caption'),
                                'start' => $releaseIt->get('StartDate')
                            );
                            $foundRelease = true;
                            $releaseIt->moveNext();
                        }
                    }
                }
            }

            if ( !$foundRelease ) {
                $id = 'P'.$project_it->getId();
                $groups[$id] = array (
                    'id' => $id,
                    'content' => '<a href="/pm/'.$project_it->get('CodeName').'/plan/hierarchy">'.$project_it->getDisplayName().'</a>',
                    'start' => $project_it->get('EstimatedStartDate')
                );
            }
            $project_it->moveNext();
        }

        usort( $groups, function($left, $right) {
            return strcmp($left['start'], $right['start']);
        });
        foreach( array_values($groups) as $key => $item ) {
            $groups[$key]['index'] = $key + 1;
        }

        return array_values($groups);
    }

    protected function getItems()
    {
        if ( count($this->projects) > 0 ) {
            $project_it = $this->getProjectIt($this->projects);
            while( !$project_it->end() ) {
                $groups[$project_it->getId()] = $project_it->get('CodeName');
                $project_it->moveNext();
            }
        }

        $ids = $this->iterator->idsToArray();
        if ( count($ids) < 1 ) $ids = array(0);
        $release_it = getFactory()->getObject('Release')->getRegistry()->Query(
            array(
                new FilterInPredicate($ids)
            )
        );
        $iteration_it = getFactory()->getObject('Iteration')->getRegistry()->Query(
            array(
                new FilterInPredicate($ids)
            )
        );
        $milestone_it = getFactory()->getObject('Milestone')->getRegistry()->Query(
            array(
                new FilterInPredicate($ids)
            )
        );
        $issues = array_filter(
            preg_split('/,/',join(',',$milestone_it->fieldToArray('TraceRequests'))),
            function( $value ) {
                return $value > 0;
            }
        );
        if ( count($issues) < 1 ) $issues = array(0);
        $request_it = getFactory()->getObject('Request')->getRegistry()->Query(
            array(
                new StatePredicate('notresolved'),
                new FilterInPredicate($issues)
            )
        );

        $items = array();
        while( !$this->iterator->end() )
        {
            $item = array (
                'id' => $this->iterator->get('ObjectClass').':'.$this->iterator->getId(),
                'content' => $this->iterator->getHtmlDecoded('Caption'),
                'start' => date('Y-m-d\TH:i:s',
                    strtotime('+9 hours',
                        strtotime($this->iterator->getDateFormatUser($this->startDataField, '%Y-%m-%d')))),
                'startText' => $this->iterator->getDateFormattedShort($this->startDataField),
                'end' => date('Y-m-d\TH:i:s',
                    strtotime('+20 hours',
                        strtotime($this->iterator->getDateFormatUser($this->finishDataField, '%Y-%m-%d')))),
                'endText' => $this->iterator->getDateFormattedShort($this->finishDataField),
                'objectid' => $this->iterator->getId(),
                'objectclass' => $this->iterator->get('ObjectClass'),
                'template' => 'base-template',
                'project' => $groups[$this->iterator->get('Project')]
            );

            switch( $this->iterator->get('ObjectClass') )
            {
                case 'Release':
                    $release_it->moveToId($this->iterator->getId());
                    $methodology_it = $release_it->getRef('Project')->getMethodologyIt();

                    $item['className'] = 'hie-release';

                    if ( $methodology_it->HasPlanning() ) {
                        $item['type'] = 'background';
                        $item['template'] = 'base-template';
                    }
                    else {
                        $item['title'] = '<span class="ref-name">' . translate('Релиз') . '</span> ' . $item['content'];
                        $item['template'] = 'release-template';
                        if ( $release_it->IsFinished() ) {
                            $item['className'] .= ' stage-finished';
                        }
                        else {
                            if ( $release_it->getFinishOffsetDays() > 0 ) {
                                $item['className'] .= ' deadline-offset';
                            }
                        }
                    }

                    $item['group'] = $methodology_it->HasPlanning() ? 'R'.$release_it->getId() : 'P'.$this->iterator->get('Project');

                    if ( $methodology_it->HasVelocity() ) {
                        $item = array_merge( $item,
                            $this->getReleaseMetrics($release_it, $methodology_it)
                        );
                    }

                    $method = new ObjectModifyWebMethod($release_it);
                    $item['url'] = $method->getJSCall();

                    $method = new ModifyAttributeWebMethod($release_it, 'StartDate', '{{start}}');
                    $method->setCallback('donothing');
                    $item['modifyUrl'] = $method->getJSCall(
                        array (
                            'parms' => array (
                                'FinishDate' => '{{end}}',
                                'action_mode' => 'method'
                            )
                        )
                    );

                    break;

                case 'Iteration':
                    $iteration_it->moveToId($this->iterator->getId());
                    $methodology_it = $iteration_it->getRef('Project')->getMethodologyIt();

                    $item['title'] = '<span class="ref-name">' . translate('Итерация') . '</span> ' . $item['content'];
                    if ( $iteration_it->get('Version') != '' ) {
                        $releaseIt = $iteration_it->getRef('Version');
                        if ( $releaseIt->get('VPD') != $iteration_it->get('VPD') ) {
                            $projectIt = $iteration_it->getRef('Project');
                            $item['title'] = '{'.$projectIt->getDisplayName().'} '.$item['title'];
                        }
                    }

                    $item['template'] = $iteration_it->get('PlannedDurationInWorkingDays') > 5 || $iteration_it->IsFinished()
                        ? 'iteration-template-long' : 'iteration-template';
                    $item['group'] = $methodology_it->HasReleases() ? 'R'.$this->iterator->get('Release') : 'P'.$this->iterator->get('Project');
                    $item['className'] = 'hie-iteration';

                    if ( $iteration_it->IsFinished() ) {
                        $item['className'] .= ' stage-finished';
                    }
                    else {
                        if ( $iteration_it->getFinishOffsetDays() > 0 ) {
                            $item['className'] .= ' deadline-offset';
                        }
                    }

                    if ( $methodology_it->IsAgile() ) {
                        $item = array_merge( $item,
                            $this->getIterationMetrics($iteration_it, $methodology_it)
                        );
                    }

                    $method = new ObjectModifyWebMethod($iteration_it);
                    $item['url'] = $method->getJSCall();

                    $method = new ModifyAttributeWebMethod($iteration_it, 'StartDate', '{{start}}');
                    $method->setCallback('donothing');
                    $item['modifyUrl'] = $method->getJSCall(
                        array (
                            'parms' => array (
                                'FinishDate' => '{{end}}',
                                'action_mode' => 'method'
                            )
                        )
                    );

                    break;

                case 'Milestone':
                    unset($item['end']);
                    unset($item['endText']);

                    $milestone_it->moveToId($this->iterator->getId());
                    $openIssues = count(array_intersect(
                            $request_it->idsToArray(),
                            preg_split('/,/', $milestone_it->get('TraceRequests'))
                        )) > 0;
                    $item['className'] = join(' ',
                        array(
                            $milestone_it->get('Overdue') > 0 && !$openIssues  ? 'issues complete' : 'hie-milestone',
                            strlen($item['content']) > 20 ? 'overflow' : ''
                        )
                    );
                    $item['letter'] = 'M';
                    $item['start'] = $this->iterator->getDateFormatUser($this->finishDataField, '%Y-%m-%dT%H:%M:%S');
                    $item['template'] = 'uid-template';
                    $item['group'] = 'P'.$this->iterator->get('Project');

                    $method = new ObjectModifyWebMethod($milestone_it);
                    $item['url'] = $method->getJSCall();

                    $method = new ModifyAttributeWebMethod($milestone_it, 'MilestoneDate', '{{start}}');
                    $method->setCallback('donothing');
                    $item['modifyUrl'] = $method->getJSCall();
                    $item['content'] = $milestone_it->getDisplayNameExt();

                    unset($item['end']);
                    break;
            }
            $items[] = $item;
            $this->iterator->moveNext();
        }
        $this->iterator->moveFirst();

        return $items;
    }

    protected function getIterationMetrics( $object_it, $methodology_it )
    {
        $strategy = $methodology_it->getIterationEstimationStrategy();

        list( $capacity, $maximum, $actual_velocity, $estimation ) = $object_it->getRealBurndownMetrics();
        if ( $estimation == '' ) $estimation = 0;

        $show_limit = SystemDateTime::date() <= $object_it->get($this->finishDataField) || $object_it->get('UncompletedTasks') > 0;
        return array (
            'velocity' => str_replace('%1',
                $strategy->getDimensionText(round($object_it->getVelocity(), 0)),
                $strategy->getVelocityText($object_it->object)),
            'maximum' => $maximum > 0 ? $strategy->getDimensionText(round($maximum, 1)) : 0,
            'estimation' => $estimation > 0 ? $strategy->getDimensionText(round($estimation,0)) : 0,
            'estimationStyle' => ($show_limit && $estimation > $maximum ? 'color:red;' : ''),
            'burndown' => $methodology_it->IsAgile() && $object_it->IsCurrent() ? 1 : 0
        );
    }

    protected function getReleaseMetrics( $object_it, $methodology_it )
    {
        $strategy = $methodology_it->getEstimationStrategy();

        list( $capacity, $maximum, $actual_velocity, $estimation ) = $object_it->getRealBurndownMetrics();
        $show_limit = SystemDateTime::date() <= $object_it->get($this->finishDataField) || $object_it->get('UncompletedIssues') > 0;

        return array (
            'velocity' => str_replace('%1',
                $strategy->getDimensionText(round($object_it->getVelocity(), 0)),
                $strategy->getVelocityText($object_it->object)),
            'maximum' => $maximum > 0 ? $strategy->getDimensionText(round($maximum, 1)) : '0',
            'estimation' => $estimation > 0 ? $strategy->getDimensionText(round($estimation)) : '0',
            'estimationStyle' => ($show_limit && $maximum > 0 && $estimation > $maximum ? 'color:red;' : ''),
            'burndown' => $methodology_it->IsAgile() && $object_it->IsCurrent() ? 1 : 0
        );
    }
}