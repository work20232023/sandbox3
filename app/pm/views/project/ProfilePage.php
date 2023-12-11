<?php
include "ProfileForm.php";

class ProfilePage extends PMPage
{
 	function getTable()	{
		return null;		
 	}
 	
 	function needDisplayForm() {
 		return true;
 	}
 	
 	function getEntityForm()
 	{
		$object = getFactory()->getObject('pm_Participant');
		$form = new ProfileForm($object);
		$form->edit(getSession()->getParticipantIt());
		return $form;
 	}
}
