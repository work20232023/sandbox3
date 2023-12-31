<?php
// PHPLOCKITOPT NOENCODE
// PHPLOCKITOPT NOOBFUSCATE

include_once SERVER_ROOT_PATH.'cms/c_mail.php';
use Devprom\ApplicationBundle\Service\Mailer\DevpromSwiftMessage;

class ProcessEmailQueue extends TaskCommand
{
 	function execute()
	{
		global $kernel;

		$this->logStart();

		getFactory()->setAccessPolicy( new \AccessPolicy() );
		$mailer = $kernel->getContainer()->get('mailer');

        if ( defined('ALLOW_SELF_SIGNED_CERTIFICATES') && ALLOW_SELF_SIGNED_CERTIFICATES ) {
            $transport = $mailer->getTransport();
            if($transport instanceof \Swift_Transport_EsmtpTransport)
            {
                $transport->setStreamOptions([
                    'ssl' => [
                        'allow_self_signed' => true,
                        'verify_peer' => false,
                        'verify_peer_name' => false
                    ]
                ]);
            }
        }

        $supportEmails = array();
        // skip recipients who are support mailboxes to avoid notification cycles
        $mailbox_it = getFactory()->getObject('co_RemoteMailbox')->getRegistry()->Query();
        $supportEmails = array_merge( $supportEmails,
            array_filter($mailbox_it->fieldToArray('EmailAddress'),
                function($email) {
                    return $email != '';
                }
            )
        );
        foreach( $mailbox_it->fieldToArray('SenderAddress') as $senderAddress ) {
            foreach( preg_split('/,/', $senderAddress) as $senderAddressItem ) {
                if ( $senderAddressItem != '' ) {
                    $supportEmails[] = $senderAddressItem;
                }
            }
        }

        $settings_it = getFactory()->getObject('SystemSettings')->getAll();
        if ( $settings_it->get('AdminEmail') != '' ) {
            $supportEmails[] = $settings_it->get('AdminEmail');
            $account_email = $settings_it->get('AdminEmail');
        }
        else {
            $mailerSettingsIt = getFactory()->getObject('MailerSettings')->getAll();
            $account_email = $mailerSettingsIt->get('MailServerUser');
        }

		$user = getFactory()->getObject('cms_User');
		$queue = getFactory()->getObject('EmailQueue');
		$address = getFactory()->getObject('EmailQueueAddress');

		$job = getFactory()->getObject('co_ScheduledJob');
		$job_it = $job->getExact($_REQUEST['job']);
		$parameters = $job_it->getParameters();
		$process_items = $parameters['limit'] > 0 ? $parameters['limit'] : 10;

		$queueRegistry = $queue->getRegistry();
        $queueRegistry->setLimit($process_items);
		$queue_it = $queueRegistry->Query(
		    array(
                new SortRecentClause(),
                new FilterModifiedMoreThanSecondsPredicate(60)
            )
        );
		$this->getLogger()->info('Emails to be processed: '.$queue_it->count());

		while ( !$queue_it->end() )
		{
		    $bodyData = \JSONWrapper::decode($queue_it->getHtmlDecoded('Description'));

			$body = $bodyData['native'];
			$bodyText = $bodyData['text'];

			$from_address = $queue_it->getHtmlDecoded('FromAddress');
			$address_it = $address->getByRef('EmailQueue', $queue_it->getId());
			while ( !$address_it->end() )
			{
			    try {
                    $to_address = $address_it->getHtmlDecoded('ToAddress');

                    $body = str_replace('<%EMAIL%>', $to_address, $body);
                    if ($address_it->get('cms_UserId') > 0) {
                        $user_it = $user->getExact($address_it->get('cms_UserId'));
                        $body = str_replace('%USERNAME%', $user_it->getDisplayName(), $body);
                    }

                    $address->delete($address_it->getId());

                    list($from_email, $from_name) = HtmlMailBox::parseAddressString($from_address);
                    list($to_email, $to_name) = HtmlMailBox::parseAddressString($to_address);

                    $messageToBeSent = DevpromSwiftMessage::newInstance()
                        ->setContentType(HtmlMailBox::getContentType())
                        ->setTo($to_email, $to_name != '' ? $to_name : null)
                        ->setSubject($queue_it->getHtmlDecoded('Caption'))
                        ->setReplyTo($from_email, $from_name != '' ? $from_name : null);

                    if ( defined('EMAIL_BCC') && EMAIL_BCC != '' ) {
                        $messageToBeSent->setBcc(array(EMAIL_BCC));
                    }

                    if ( $queue_it->get('EmailMessageId') != '' ) {
                        $messageToBeSent->setId(uniqid($queue_it->getId()) . EMAIL_MSG_ID_SEPARATOR
                            . trim($queue_it->getHtmlDecoded('EmailMessageId'),'<>'));
                    }

                    $attachments = unserialize($queue_it->getHtmlDecoded('Attachments'));
                    if (is_array($attachments) && count($attachments) > 0) {
                        $messageToBeSent->setBody($bodyText, 'text/html');
                        foreach ($attachments as $attachment) {
                            $messageToBeSent->attach(
                                Swift_Attachment::fromPath($attachment['path'])->setFilename($attachment['title'])
                            );
                        }
                    } else {
                        $messageToBeSent->setBodyNative($body);
                    }
                    $messageToBeSent->getHeaders()->addTextHeader('Auto-Submitted', 'auto-generated');
                    $messageToBeSent->getHeaders()->addTextHeader('X-Auto-Response-Suppress', 'All');

                    try {
                        if ($from_email == $to_email) throw new \Exception("do not send itself " . $from_email);
                        if (in_array($to_email, $supportEmails)) throw new \Exception("do not send to support addresses " . $to_email);

                        $senderEmail = $from_email;
                        if ($account_email != '' && !HtmlMailBox::compareDomains($senderEmail, $account_email)) {
                            $senderEmail = $account_email;
                        }

                        $messageToBeSent->setFrom($senderEmail, $from_name != '' ? $from_name : null)
                            ->setSender($senderEmail, $from_name != '' ? $from_name : null);

                        $mailer->send($messageToBeSent);
                    } catch (\Swift_SwiftException $e) {
                        $this->getLogger()->info("Unable send email from " . $senderEmail . ", retry using account email");
                        try {
                            $messageToBeSent->setFrom($account_email, $from_name != '' ? $from_name : null)
                                ->setSender($account_email, $from_name != '' ? $from_name : null);

                            $mailer->send($messageToBeSent);
                        } catch (\Exception $e) {
                            $this->getLogger()->error("Unable send email: " . $e->getMessage() . PHP_EOL . $e->getTraceAsString());
                        }
                    } catch (\Exception $e) {
                        $this->getLogger()->error("Skip sending email: " . $e->getMessage() . PHP_EOL . $e->getTraceAsString());
                    }
                }
                catch (\Exception $e) {
                    $this->getLogger()->error("Skip sending email: " . $e->getMessage() . PHP_EOL . $e->getTraceAsString());
                }

				$address_it->moveNext();
			}

			$queue->delete($queue_it->getId());
			$queue_it->moveNext();
		}

		$this->logFinish();
	}
}
