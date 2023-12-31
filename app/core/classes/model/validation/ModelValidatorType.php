<?php

abstract class ModelValidatorType
{
	abstract public function applicable( $type_name );
	abstract public function validate( & $value, array $groups = array() );

	public function getMessage() {
		return '';
	}
}