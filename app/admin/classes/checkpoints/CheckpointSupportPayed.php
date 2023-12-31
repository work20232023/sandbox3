<?php
include_once SERVER_ROOT_PATH."admin/classes/CheckpointEntryDynamic.php";

class CheckpointSupportPayed extends CheckpointEntryDynamic
{
    const UPDATES_FILE = 'conf/new-updates.json';
    const UPDATES_URL = 'https://myalm.ru/download?json';
    const FILE = 'conf/support-payed.dat';
    const URL = 'https://myalm.ru/download?payed';

    function execute()
    {
        $updates = $this->getAllUpdates();

        if ( file_put_contents(DOCUMENT_ROOT.self::UPDATES_FILE, JsonWrapper::encode($updates)) === false ) {
            $this->debug('Unable to write the file: '.DOCUMENT_ROOT.self::UPDATES_FILE);
        }

        $license_it = getFactory()->getObject('LicenseInstalled')->getAll();

        if ( !method_exists($license_it, 'getSupportIncluded') ) {
            $this->setValue('1');
            return;
        }
        if ( $license_it->getSupportIncluded() ) {
            $this->setValue('1');
            return;
        }

        $days = $this->getLeftDays();

        file_put_contents(DOCUMENT_ROOT.self::FILE, $days);
        $this->setValue($days <= 0 ? '0' : '1');
    }

    protected function getLeftDays()
    {
        $date = $this->getSupportPayedDate();
        if ( $date == '' ) {
            $days = -1;
        } else {
            $dt1 = new DateTime($date);
            $dt2 = new DateTime();
            $interval = $dt2->diff($dt1);
            $days = ($interval->invert ? -1 : 1) * $interval->days;
            $days++;
        }
        return $days;
    }
    
    protected function getSupportPayedDate()
    {
        $url = defined('SERVICE_URL')
            ? str_replace('myalm.ru', SERVICE_URL, self::URL)
            : self::URL;

        $curl = CurlBuilder::getCurl();
        curl_setopt($curl, CURLOPT_URL, $url.'&iid='.INSTALLATION_UID);
		curl_setopt($curl, CURLOPT_FOLLOWLOCATION, true);
		curl_setopt($curl, CURLOPT_HEADER, false);
		curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
		curl_setopt($curl, CURLOPT_HTTPGET, true);
		curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($curl, CURLOPT_TIMEOUT, 30);
		curl_setopt($curl, CURLOPT_REFERER, EnvironmentSettings::getServerUrl());

        $result = curl_exec($curl);
		if ( $result === false ) {
		    $this->debug( curl_error($curl) );
		}
        curl_close($curl);

		$data = JsonWrapper::decode($result);
		$this->debug('Support date payed till: '.$data['till']);

		return $data['till'];
    }

    protected function getAllUpdates()
    {
        $updatesUrl = defined('SERVICE_URL')
            ? str_replace('devprom.ru', SERVICE_URL, self::UPDATES_URL)
            : self::UPDATES_URL;

        $this->debug('Download updates json: '.$updatesUrl);

        $license_it = getFactory()->getObject('LicenseInstalled')->getAll();
        $users_count = getFactory()->getObject('User')->getRegistry()->Count();

        $curl = CurlBuilder::getCurl();
        curl_setopt($curl, CURLOPT_URL,
            $updatesUrl.'&version='.$_SERVER['APP_VERSION'].'&iid='.INSTALLATION_UID.'&license='.$license_it->get('LicenseType').'&users='.$users_count);
        curl_setopt($curl, CURLOPT_FOLLOWLOCATION, true);
        curl_setopt($curl, CURLOPT_HEADER, false);
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($curl, CURLOPT_HTTPGET, true);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($curl, CURLOPT_TIMEOUT, 30);
        curl_setopt($curl, CURLOPT_REFERER, EnvironmentSettings::getServerUrl());

        $result = curl_exec($curl);
        if ( $result === false ) {
            $this->debug( curl_error($curl) );
        }
        curl_close($curl);

        $data = JsonWrapper::decode($result);
        $this->debug('Updates found: '.count($data));
        return $data;
    }

    static function getPayedDays()
    {
        $days = @file_get_contents(DOCUMENT_ROOT.self::FILE);
        return $days == '' ? 0 : $days;
    }

    function getTitle()
    {
        return text(2057);
    }

    function getDescription()
    {
        return text(2058);
    }

    function getWarning()
    {
        return text(2254);
    }
}
