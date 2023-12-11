<?php
include "ProductInfoForm.php";

class ProductInfoPage extends CoPage
{
 	function needDisplayForm() {
 		return true;
 	}
 	
 	function getEntityForm() {
 		$form = new ProductInfoForm(getFactory()->getObject('ProductInfoPost'));
		$form->show(1);
		return $form;
 	}
}
