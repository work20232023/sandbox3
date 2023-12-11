<?php
include_once "EmailNotificatorHandler.php";

class ChangeRequestHandler extends EmailNotificatorHandler
{
	function getUsers( $object_it, $prev_object_it, $action )
	{
		$result = array();
		
		switch ( $action )
		{
			case 'modify':
				if ( $prev_object_it->get('State') != $object_it->get('State') ) {
					if ( $object_it->get('Author') > 0 ) {
                        if ( $object_it->getRef('Project')->getMethodologyIt()->get('IsSupportUsed') == 'Y' ) {
                            // don't send email to author inside of support, other handler is used
                            break;
                        }
                        $result[] = $object_it->get('Author');
					}
					if ( $object_it->get('Owner') > 0 ) {
						array_push($result, $object_it->get('Owner'));
					}
				}

				if ( $prev_object_it->get('Owner') != $object_it->get('Owner') ) {
                    if ( $object_it->get('Owner') > 0 ) {
                        array_push($result, $object_it->get('Owner'));
                    }
                }
				break;

			case 'add':
				if ( $object_it->get('Owner') > 0 ) {
                    $result[] = $object_it->get('Owner');
				}

                $leads = $this->getProject($object_it)->getLeadIds();
                if ( count($leads) > 0 ) {
                    $result = array_merge($result,
                        getFactory()->getObject('Participant')->getRegistry()->Query(
                            array(
                                new FilterInPredicate($leads),
                                new FilterAttributePredicate('NotificationTrackingType', 'system')
                            )
                        )->fieldToArray('SystemUser')
                    );
                }
				break;
		}
		
		return $result;
	}	
}  
