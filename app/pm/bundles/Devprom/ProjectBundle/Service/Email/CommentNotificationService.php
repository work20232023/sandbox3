<?php
namespace Devprom\ProjectBundle\Service\Email;

class CommentNotificationService
{
    public function getEmails($anchorIt, $commentIt = null)
    {
        $emails = array();
        if ( !is_object($anchorIt) ) return $emails;

        $items = getFactory()->getEventsManager()->getNotificators('ServicedeskCommentEmailNotificator');
        if ( count($items) > 0 && $anchorIt->object instanceof \Request ) {
            foreach( $items as $notificator ) {
                $emails = array_merge($emails, $notificator->getEmails($anchorIt, $commentIt));
            }
        }
        return $emails;
    }

    public function getPrivate( $transitionIt ) {
        if ( $transitionIt->getId() != '' ) {
            if ( $transitionIt->getRef('TargetState')->get('SkipEmailNotification') == 'Y' ) {
                return true;
            }
        }
        return false;
    }
}