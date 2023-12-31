<?php

include "predicates/SettingGlobalPredicate.php";
include "predicates/SettingExportPredicate.php";
include "PMUserSettingsExportRegistry.php";

class PMUserSettings extends MetaobjectCacheable
{
 	function __construct( PMSession $session = null ) 
 	{
 		parent::__construct('pm_UserSetting');
 		$this->setAttributeType('Participant', 'INTEGER');
 	}
 	
 	function getSettingsValue( $settings_name, $user_id = 0 )
 	{
 		if ( $user_id == 0 ) $user_id = getSession()->getParticipantIt()->getId();
 		
	 	$value_it = $this->getByRefArray( array (
	 	        'Participant' => $user_id,
	 	        'Setting' => $settings_name
	 	));

	 	return $value_it->get('Value');
 	}
 	
 	function setSettingsValue( $settings_name, $value, $user_id = 0 ) 
 	{
 		$parms = array();
 		
 		if ( $user_id == 0 ) $user_id = getSession()->getParticipantIt()->getId(); 
 		if ( $user_id < 0 ) {
            $value_it = $this->getByRefArray( array (
                'Setting' => $settings_name
            ));
            while( !$value_it->end() ) {
                $this->delete($value_it->getId());
                $value_it->moveNext();
            }
            $value_it = $this->getEmptyIterator();
        }
        else {
            $value_it = $this->getByRefArray( array (
                'Participant' => $user_id,
                'Setting' => $settings_name
            ));
        }

		if ( $value_it->getId() != '' )
		{
			$parms['Value'] = $value;
			$this->modify_parms($value_it->getId(), $parms);
		}
		else 
		{
			$parms['Participant'] = $user_id;
			$parms['Setting'] = $settings_name;
			$parms['Value'] = $value;

			$this->add_parms($parms);
		}
 	}
}
