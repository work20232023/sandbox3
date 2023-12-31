<?php

class LicenseIterator extends OrderedIterator
{
    const OPTIONS_COEFF = 1000;

	function valid()
	{
		if ($this->checkV1()) return false;
		return openssl_verify(
			trim($this->getHtmlDecoded('LicenseValue')) . INSTALLATION_UID,
			base64_decode(trim($this->get('LicenseKey'))),
			file_get_contents(SERVER_ROOT_PATH . 'templates/config/license.pub'),
			OPENSSL_ALGO_SHA512) == 1;
	}

	function allowCreate(& $object)
	{
		return true;
	}

	function getName()
	{
		return '';
	}

	function restrictionMessage($license_key = '')
	{
		return '';
	}

	function getOptions()
	{
		if ($this->checkV1()) {
			return array('users' => $this->get('LicenseValue'));
		}
		return json_decode($this->getHtmlDecoded('LicenseValue'), true);
	}

	function getTimestamp()
	{
		$options = $this->getOptions();
		return $options['timestamp'];
	}

	function getLeftDays()
	{
		if ( $this->getTimestamp() == '' ) return '';
		$dt1 = DateTime::createFromFormat("Y-m-d", $this->getTimestamp());
		$dt2 = new DateTime();
		$interval = $dt2->diff($dt1);
		return ($interval->invert ? -1 : 1) * $interval->days;
	}

	function getUsers()
	{
		$options = $this->getOptions();
		if ( $options['users'] > 0 ) return $options['users'];

		$licensedUsers = 0;
		foreach( preg_split('/,/', $options['options']) as $option ) {
		    list($permission, $users) = preg_split('/:/', $option);
		    if ( $users > 0 ) $licensedUsers += $users;
        }
		return $licensedUsers;
	}

    function getDays()
    {
        $options = $this->getOptions();
        return $options['days'] > 0 ? $options['days'] : 0;
    }

	function checkV1()
	{
		return is_numeric($this->get('LicenseValue')) || $this->get('LicenseValue') == '';
	}

	function getScheme()
	{
		return 2;
	}

	function getSupportIncluded()
	{
		return true;
	}

    function getUnlimitedOptionsString()
    {
        $options = $this->getOptions();
        if ( $options['users'] >= 10 * self::OPTIONS_COEFF ) return 'N';

        $resultOptions = [];
        foreach( preg_split('/,/', $options['options']) as $option ) {
            list($permission, $users) = preg_split('/:/', $option);
            if ( $users >= 10 * self::OPTIONS_COEFF ) $resultOptions[] = $permission;
        }

        return join(',',$resultOptions);
    }
}
