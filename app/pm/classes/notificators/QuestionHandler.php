<?php
include_once "EmailNotificatorHandler.php";

class QuestionHandler extends EmailNotificatorHandler
{
	function getUsers( $object_it, $prev_object_it, $action )
	{
		$result = array();
		
		switch( $action )
		{
			case 'add':
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
				
			default:
				if ( $object_it->get('Author') > 0 ) {
                    $result[] = $object_it->get('Author');
				}
				break;
		}

        if ( $object_it->get('Owner') != '' ) {
            $result[] = $object_it->get('Owner');
        }

		return $result;
	}	
}  
