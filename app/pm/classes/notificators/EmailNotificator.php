<?php

use Devprom\CommonBundle\Service\Emails\RenderService;

include_once SERVER_ROOT_PATH.'cms/c_mail.php';
include_once SERVER_ROOT_PATH."cms/classes/ObjectFactoryNotificator.php";
include "EmailNotificatorHandler.php";
include "CommentHandler.php";
include "ChangeRequestHandler.php";
include "QuestionHandler.php";
include "TaskHandler.php";
include "DigestHandler.php";

class EmailNotificator extends ObjectFactoryNotificator
{
 	private $handlers;
    private $common_handler;
    private $notification_reason;
	
	function __construct() {
		parent::__construct();
        $this->buildHandlers();
	}

	function __wakeup() {
        $this->buildHandlers();
    }

    protected function buildHandlers()
    {
        $this->common_handler = new EmailNotificatorHandler;
        $this->handlers = array(
            'Comment' => new CommentHandler(),
            'pm_ChangeRequest' => new ChangeRequestHandler(),
            'pm_Question' => new QuestionHandler(),
            'pm_Task' => new TaskHandler(),
            'ObjectChangeLog' => new DigestHandler()
        );
        $this->notification_reason = array();
    }

	function add( $object_it ) 
	{
		$this->process( 'add', $object_it, $object_it->object->getEmptyIterator() );
	}

 	function modify( $prev_object_it, $object_it ) 
	{
		$this->process( 'modify', $object_it, $prev_object_it );
	}

 	function delete( $object_it ) 
	{
		$this->process( 'delete', $object_it->object->getEmptyIterator(), $object_it );
	}
	 
 	public function & getHandler( $object_it ) 
 	{
	    if ( $object_it->object->getClassName() == 'WikiPage' && !is_a( $object_it->object, 'WikiPage' ) ) {
	        return $this->common_handler; 
	    }
		    
		return array_key_exists($object_it->object->getClassName(), $this->handlers) 
					? $this->handlers[$object_it->object->getClassName()] : $this->common_handler; 
 	}
	
	public function sendMail( $action, $object_it, $prev_object_it, $usersToNotify = array(), $notifyReason = '', $exceptUsers = [] )
	{
		$queues = array();
		
		$recipients = array_unique(
            $this->getEmailRecipientArray(
                $object_it, array_diff($usersToNotify, $exceptUsers), $notifyReason
            )
        );

		if( count($recipients) < 1 ) {
			$this->info('There are no recipients');
			return $queues;
		}

		$render_service = new RenderService(
				getSession(),
                SERVER_ROOT_PATH."pm/bundles/Devprom/ProjectBundle/Resources/views/Emails"
    		);

		$entityIt = $this->getHandler($object_it)->getEntityIt($object_it);
        $emailId = $entityIt->get('EmailMessageId') != ''
                        ? $entityIt->getHtmlDecoded('EmailMessageId')
                        : md5(get_class($entityIt) . $entityIt->getId()) . '@alm';

		$keys = array_keys($recipients);
		for($i = 0; $i < count($keys); $i++) 
		{
			$recipient = $recipients[$keys[$i]];
			$recipientAddress = $this->getAddress($recipient);

			$parms = $this->getRenderParms($action, $object_it, $prev_object_it, $recipient);
			if ( count($parms['fields']) < 1 ) continue;

            $queueIt = (new Metaobject('EmailQueue'))->getRegistry()->Query(
                array(
                    new FilterAttributePredicate('EmailMessageId', $emailId),
                    new FilterAttributePredicate('Recipient', $recipientAddress)
                )
            );
            if ( $queueIt->getId() != '' ) {
                $wasParms = \JsonWrapper::decode($queueIt->getHtmlDecoded('Parameters'));
                if ( is_array($wasParms) ) {
                    $newParms = $parms;
                    $parms = $wasParms;
                    foreach( $parms['fields'] as $key => $value ) {
                        if ( !is_array($parms['fields'][$key]) ) continue;
                        if ( !is_array($newParms['fields'][$key]) ) continue;
                        $parms['fields'][$key]['value'] = $newParms['fields'][$key]['value'];
                    }
                    foreach( $newParms['fields'] as $key => $value ) {
                        if ( array_key_exists($key, $parms['fields']) ) continue;
                        $parms['fields'][$key] = $value;
                    }
                    if ( is_array($newParms['comments']) ) {
                        $parms['comments'] = $newParms['comments'];
                    }
                }
            }

			$mail = new HtmlMailBox();
			$mail->appendAddress($recipientAddress);
			$mail->setSubject( $this->getSubject( $object_it, $prev_object_it, $action, $recipient ) );
	   		$mail->setBody($render_service->getContent($parms['template'], $parms));
            $mail->setInReplyMessageId($emailId);
            $mail->setParameters(\JsonWrapper::encode($parms));

	   		$attachments = array();
	   		foreach( $object_it->object->getAttributesByGroup('email-attachments') as $attribute ) {
	   		    if ( $object_it->get($attribute) == '' ) continue;
	   		    $attachmentIt = $object_it->getRef($attribute);
	   		    while( !$attachmentIt->end() ) {
                    $attachments[] = array(
                        'path' => $attachmentIt->getFilePath('File'),
                        'title' => $attachmentIt->getFileName('File')
                    );
                    $attachmentIt->moveNext();
                }
            }
            $mail->setAttachments($attachments);

			$queues[] = $mail->send();
		} 
		
		return $queues;
	}

	protected function notifyUsersOnChanges( $action, $object_it, $prev_object_it, $usersToNotify )
    {
        $handler = $this->getHandler( $object_it );

        // include participants who wants to receive all notifications
        $participant = getFactory()->getObject('Participant');
        $participants =
            $participant->getRegistry()->QueryKeys(
                array(
                    new ParticipantActivePredicate(),
                    new FilterVpdPredicate(),
                    new FilterAttributePredicate('NotificationTrackingType', 'any-changes')
                )
            )->idsToArray();

        $self = getSession()->getUserIt()->getId();
        $users =
            array_merge(
                $usersToNotify,
                $participant->getRegistry()->Query(
                    array(
                        new FilterInPredicate($participants)
                    )
                )->fieldToArray('SystemUser')
            );

        $users = array_unique(array_filter(
            array_merge(
                $users, $handler->getUsers( $object_it, $prev_object_it, $action )
            ),
            function( $id ) use ($self) {
                return is_numeric($id) && $id > 0 && $id != $self;
            }
        ));
        if ( count($users) < 1 ) return;

        if ( $object_it->object instanceof Comment ) {
            $object_it = $object_it->getAnchorIt();
            $action = 'commented';
        }

        $notification = getFactory()->getObject('ObjectChangeNotification');
        $notification->setNotificationEnabled(false);
        $registry = $notification->getRegistry();

        foreach( $users as $userId ) {
            $registry->Create(
                array(
                    'ObjectId' => $object_it->getId(),
                    'ObjectClass' => get_class($object_it->object),
                    'SystemUser' => $userId,
                    'Action' => $action
                )
            );
        }
    }

	protected function process( $action, $object_it, $prev_object_it ) 
	{
		if ( !is_object($object_it->object->entity) ) return;

		$doNotification = false;
		switch ( $object_it->object->entity->get('ReferenceName') )
		{ 
			case 'pm_ChangeRequest' :
			case 'pm_Question':
                $doNotification = true;
				break;

            case 'Comment' :
                if ( $action == 'add' ) {
                    $doNotification = true;
                }
                break;

			case 'pm_Task':
				if ( getSession()->getProjectIt()->getMethodologyIt()->HasTasks() ) {
                    $doNotification = true;
				}
				break;
				
			case 'WikiPage' :
				$type_it = getFactory()->getObject('WikiType')->getExact($object_it->get('ReferenceName'));
				switch ( $type_it->get('ReferenceName') )
				{
					case 'Requirements':
						if ( $action == 'modify' ) {
                            $doNotification = true;
						}
						break;

					default:
						if ( $action != 'delete' ) {
                            $doNotification = true;
						}
				}
				break;

			default:
				return;
		}

		if ( ! $doNotification ) return;

        $usersToNotify = $mentionedUsers = $this->getMentions($object_it);
        if ( count($mentionedUsers) > 0 )
        {
            $this->sendMail($action, $object_it, $prev_object_it, $mentionedUsers, text(3332));
        }
        else
        {
            $handlerUsers = array_merge(
                $this->getConcernedUsers(),
                $this->getHandlerUsers($object_it, $prev_object_it, $action)
            );

            $exceptUsers = [getSession()->getUserIt()->getId()];

            if ( count($handlerUsers) > 0 )
            {
                // filter users want to receive emails directly
                $handlerUsers =
                    getFactory()->getObject('Participant')->getRegistryBase()->Query(
                        array(
                            new ParticipantActivePredicate(),
                            new FilterVpdPredicate(),
                            new FilterAttributePredicate('SystemUser', $handlerUsers),
                            new FilterAttributePredicate('NotificationEmailType', 'direct')
                        )
                    )->fieldToArray('SystemUser');

                $this->sendMail($action, $object_it, $prev_object_it, $handlerUsers, text(1065), $exceptUsers);
            }

            $usersToNotify = array_merge($usersToNotify, $handlerUsers);

            $watcherUsers = array_diff($this->getWatchers($object_it), $handlerUsers);
            if ( count($watcherUsers) > 0 )
            {
                $this->sendMail($action, $object_it, $prev_object_it, $watcherUsers, text(3333), $exceptUsers);
            }

            $usersToNotify = array_merge($usersToNotify, $watcherUsers);
        }

        if ( in_array($action, array('add', 'modify')) )
        {
            $this->notifyUsersOnChanges($action, $object_it, $prev_object_it, $usersToNotify);
        }
	}
		
	protected function getAddress( $recipient )
	{ 
		if ( is_object($recipient) )
		{
			return $recipient->getDisplayName().' <'.$recipient->get('Email').'>';
		}
		else
		{
			return $recipient;
		}
	}
	
	protected function addRecipient( $object_it, &$emails )
	{
		$title = $object_it->get('Caption');
		if ( strpos($title, ",") !== false )
		{
			$title = '"'.trim($object_it->get('Caption'),'"').'"';
		}
		return $emails[] = $title.' <'.$object_it->get('Email').'>';
	}
	
	protected function getRenderParms( $action, $object_it, $prev_object_it, $recipient )
	{
		$handler = $this->getHandler( $object_it );
		return array_merge(
				array (
						'template' => $handler->getTemplate(),
						'reason' => $this->notification_reason[$recipient]
				),
				$handler->getRenderParms($action, $object_it, $prev_object_it)
		); 
	}
	
	protected function getSender( $object_it, $action )
	{
		$user_it = getSession()->getUserIt();
		if ( $user_it->get('Email') != '' ) {
			return $this->quoteEmail($user_it->get('Caption')).' <'.$user_it->get('Email').'>';
		}
		else {
			return getFactory()->getObject('cms_SystemSettings')->getAll()->getHtmlDecoded('AdminEmail');
		}
	}

	protected function getEmailRecipientArray( $object_it, $usersToNotify, $notifyReason )
	{
		$project_it = getSession()->getProjectIt();
        $participant = getFactory()->getObject('Participant');

		$handler = $this->getHandler( $object_it );

		// process users
		$user = getFactory()->getObject('cms_User');
		if ( count($usersToNotify) > 0 ) {
		    $systemuser_it = $user->getRegistry()->Query(
				array (
					new UserStatePredicate('nonblocked'),
					new FilterInPredicate($usersToNotify)
				)
			);
		}
		else {
		    $systemuser_it = $user->getEmptyIterator();
		}

        // make email addresses
        $participantsRowset = array();
        $emails = array();
		while( !$systemuser_it->end() )
		{
			// check if user is a participant
			$it = $participant->getRegistry()->Query(
                array(
                    new ParticipantActivePredicate(),
                    new FilterAttributePredicate('SystemUser', $systemuser_it->getId()),
                    new FilterAttributePredicate('Project', $project_it->getId())
                )
            );
			if ( $it->count() < 1 ) {
				$caption = $this->addRecipient($systemuser_it, $emails);
                $this->notification_reason[$caption] = $notifyReason;
			}
			else {
                $participantsRowset[] = $it->getData();
			}
			$systemuser_it->moveNext();
		}

		// process participants
        $participant_it = $participant->createCachedIterator($participantsRowset);

        while( !$participant_it->end() )
		{
			// exclude those who have no access to view object
			if ( !$handler->participantHasAccess($participant_it, $object_it) ) {
				$this->info($participant_it->getDisplayName().' skipped as access restricted');
				$participant_it->moveNext();
				continue;
			}

            // exclude those who have no access to view object
            if ( method_exists($object_it, 'getAnchorIt') && !$handler->participantHasAccess($participant_it, $object_it->getAnchorIt()) ) {
                $this->info($participant_it->getDisplayName().' skipped as access restricted');
                $participant_it->moveNext();
                continue;
            }

			$caption = $this->addRecipient($participant_it, $emails);
			
			// remember the reason addressee will receive the notification
			$this->notification_reason[$caption] = str_replace( '%1',
                _getServerUrl().'/pm/'.$project_it->get('CodeName').'/profile', $notifyReason );
			
			$participant_it->moveNext();
		}

		return $emails;
	}

	protected function getWatchers( $object_it )
	{
		$users = array();

		if ( is_a($object_it->object, 'Comment') ) {
            $object_it = $object_it->getAnchorIt();
        }
        if ( is_a($object_it->object, 'WikiPage') ) {
            $object_it = $object_it->getParentsIt();
        }

		$watcher_it = getFactory()->getObject2('pm_Watcher', $object_it)->getAll();
		while ( !$watcher_it->end() )
		{
			// skip current user or external emails
			if ( $watcher_it->get('SystemUser') == getSession()->getUserIt()->getId() ) {
				$watcher_it->moveNext();
				continue;
			}
            if ( $watcher_it->get('Email') != '' ) {
                $watcher_it->moveNext();
                continue;
            }
            $users[] = $watcher_it->get('SystemUser');
			$watcher_it->moveNext();
		}

		return $users;
	}

	protected function getMentions( $object_it )
	{
		$matches = array();

		// get any available text
        $texts = '';
        foreach( $object_it->object->getAttributesByType('wysiwyg') as $attribute ) {
            $texts .= $object_it->getHtmlDecoded($attribute);
        }

		if ( !preg_match_all('/@(\w*)/u', $texts, $matches) ) return array();
		array_shift($matches);
		$matches = array_shift($matches);

        $mentionedIt = $object_it;
        if ( $mentionedIt->object instanceof Comment ) {
            $mentionedIt = $mentionedIt->getAnchorIt();
        }

        return getFactory()->getObject('Mentioned')->getUsers($matches, $mentionedIt);
	}

    protected function getHandlerUsers( $object_it, $prev_object_it, $action )
    {
        $handler = $this->getHandler( $object_it );

        // users defined by handler logic
        return array_filter($handler->getUsers( $object_it, $prev_object_it, $action ), function( $id ) {
            return is_numeric($id) && $id > 0;
        });
    }

    protected function getConcernedUsers()
    {
        // users who want to receive all notifications
        return getFactory()->getObject('Participant')->getRegistryBase()->Query(
                array(
                    new ParticipantActivePredicate(),
                    new FilterVpdPredicate(),
                    new FilterAttributePredicate('NotificationTrackingType', 'any-changes')
                )
            )->fieldToArray('SystemUser');
    }

	protected function getSubject( $object_it, $prev_object_it, $action, $recipient )
	{
		return $this->getHandler($object_it)->getSubject( "", $object_it, $prev_object_it, $action, $recipient );
	}

 	protected function quoteEmail( $email )
 	{
 		if ( strpos($email,",") !== false ) {
 			$email = '"'.trim($email, '"').'"'; 
 		}
 		return $email;
 	}
 	
 	protected function info( $message )
 	{
 		try {
 			Logger::getLogger('Commands')->info("EmailNotificator: ".$message);
 		}
 		catch( Exception $e )
 		{
 		}
 	}
}