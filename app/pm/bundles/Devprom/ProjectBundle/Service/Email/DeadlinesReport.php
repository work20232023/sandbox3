<?php
namespace Devprom\ProjectBundle\Service\Email;

use Devprom\CommonBundle\Service\Emails\RenderService;

include_once SERVER_ROOT_PATH.'cms/c_mail.php';
include_once SERVER_ROOT_PATH."pm/classes/tasks/TaskViewModelBuilder.php";

class DeadlinesReport
{
    private $session = null;
    private $template = 'deadlines.twig';

    function __construct( $session = null ) {
        $this->session = $session;
    }

    function send( $userIt )
    {
        $renderService = new RenderService(
            $this->session, SERVER_ROOT_PATH."pm/bundles/Devprom/ProjectBundle/Resources/views/Emails"
        );

        $systemIt = getFactory()->getObject('cms_SystemSettings')->getAll();

        $mail = new \HtmlMailBox();
        $mail->appendAddress( $userIt->get('Email') );
        $mail->setSubject( $systemIt->getDisplayName() . ': ' . text(2620) );

        $data = $this->getReportParms($userIt);
        if ( count($data['deadlines']) < 1 ) return;

        $mail->setBody(
            $renderService->getContent(
                $this->template, $data
            )
        );
        $mail->send();
    }

    protected function getReportParms( $userIt )
    {
        $result = array(
            'log_url' =>
                defined('PERMISSIONS_ENABLED')
                    ? \EnvironmentSettings::getServerUrl().'/pm/my/tasks/list/nearesttasks'
                    : \EnvironmentSettings::getServerUrl().'/pm/all/tasks/list/nearesttasks',
            'profile_url' => \EnvironmentSettings::getServerUrl().'/profile',
            'deadlines' => array()
        );

        $object = getFactory()->getObject('WorkItem');

        $builders = array_merge(
            $this->session->getBuilders('TaskViewModelBuilder'),
            array(
                new \TaskModelExtendedBuilder()
            )
        );
        foreach( $builders as $builder ) {
            $builder->build($object);
        }

        $maxDays = defined('DEADLINE_REPORT_DUE_DAYS') ? DEADLINE_REPORT_DUE_DAYS : 4;
        $uid = new \ObjectUID();
        $now = strtotime(\SystemDateTime::date());
        $dateTime = strftime('%Y-%m-%d', strtotime("{$maxDays} days", $now));
        $minTime = strftime('%Y-%m-%d', strtotime('-14 days', $now));

        $objectIt = $object->getRegistry()->Query(
            array(
                new \FilterAttributePredicate('Assignee', $userIt->getId()),
                new \FilterDateAfterPredicate('DueDate', $minTime),
                new \FilterDateBeforePredicate('DueDate', $dateTime),
                new \WorkItemStatePredicate('initial,progress'),
                new \SortAttributeClause('DueDate.A'),
                new \SortAttributeClause('Priority.A')
            )
        );

        while( !$objectIt->end() ) {
            $dateText = $objectIt->getDateFormattedShort('DueDate');
            $artefactIt = $objectIt->getObjectIt();

            $uidInfo = $uid->getUIDInfo($artefactIt, true);
            $result['deadlines'][$dateText][] = array(
                'id' => '<a href="'.$uidInfo['url'].'">'.$uidInfo['uid'].'</a>',
                'title' => '{'.$uidInfo['project'] . '} ' . $uidInfo['caption']
            );
            $objectIt->moveNext();
        }

        return $result;
    }
}