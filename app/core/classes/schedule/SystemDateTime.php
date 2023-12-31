<?php

class SystemDateTime
{
	static public function date( $format = 'Y-m-d H:i:s' )
	{
		return self::serverDate($format);
	}

	static public function convertToClientTime( $date, $format = 'Y-m-d H:i:s' )
	{
		if ( $date == '' ) return $date;
		
		$offset = EnvironmentSettings::getUTCOffset();

		$utc_offset = -1 * (($offset > 0) - ($offset < 0)) * $offset;
		
		try
		{
            if ( strpos($date, '00:00:00') > 0 ) {
                $time = new DateTime($date);
                return $time->format($format);
            }

			// convert from server's time to UTC+0
			$time = new DateTime($date." ".$utc_offset." hours", new DateTimeZone("UTC"));
			
			// convert from UTC+0 to client's time
			$time->setTimezone(EnvironmentSettings::getClientTimeZone());

			return $time->format($format);
		}
		catch( Exception $e )
		{
			try
			{
				$time = new DateTime($date." ".$utc_offset." hours", new DateTimeZone("UTC"));
	
				return $time->format($format);
			}
			catch( Exception $e )
			{
				return "";
			}
		}
	}
	
	static public function convertToServerTime( $date, $format = 'Y-m-d H:i:s', $tz = null )
	{
		if ( $date == '' ) return $date;
		if ( !$tz ) $tz = EnvironmentSettings::getClientTimeZone();

		try
		{
			// convert from client's time to UTC+0
			$time = new DateTime($date, $tz);
			
			$time->setTimezone(new DateTimeZone("UTC"));

			// convert from UTC+0 to server's time
			$time->add(DateInterval::createFromDateString(EnvironmentSettings::getUTCOffset()." hours"));

			return $time->format($format);
		}
		catch( Exception $e )
		{
			try
			{
				$time = new DateTime($date, new DateTimeZone("UTC"));
	
				// convert from UTC+0 to server's time
				$time->add(DateInterval::createFromDateString(EnvironmentSettings::getUTCOffset()." hours"));
				
				return $time->format($format);
			}
			catch( Exception $e )
			{
				return "";
			}
		}
	}

    static public function convertToUTC0( $date, $format = 'Y-m-d H:i:s', $tz = null )
    {
        if ( $date == '' ) return $date;
        if ( !$tz ) $tz = EnvironmentSettings::getClientTimeZone();

        try {
            // convert from client's time to UTC+0
            $time = new DateTime($date, $tz);

            $time->setTimezone(new DateTimeZone("UTC"));

            return $time->format($format);
        }
        catch( Exception $e ) {
            try {
                $time = new DateTime($date, new DateTimeZone("UTC"));
                return $time->format($format);
            }
            catch( Exception $e )
            {
                return "";
            }
        }
    }

	static private function serverDate( $format = 'Y-m-d H:i:s' )
	{
		$time = new DateTime(EnvironmentSettings::getUTCOffset()." hours", new DateTimeZone("UTC")); 
		
		return $time->format($format);
	}

	static public function getTimeParseRegex() {
		return text(2115);
	}

    static public function parseHours( $value )
    {
        $match = array();
        if ( preg_match(self::getTimeParseRegex(), $value, $match) and count($match) > 1 ) {
            $value = 0;
            $value += $match[2] * 8 * 60;
            $value += $match[4] * 60;
            $value += $match[6];
            return round($value / 60, 4);
        }
        return $value;
    }

	static public function parseRelativeDateTime( $value, $language )
    {
        $value = preg_replace(
            '/last-month/',
            $language->getPhpDate( strtotime('-1 month', strtotime(date('Y-m-j'))) ),
            $value
        );
        $value = preg_replace(
            '/last-week/',
            $language->getPhpDate( strtotime('-1 week', strtotime(date('Y-m-j'))) ),
            $value
        );
        $value = preg_replace(
            '/last-quarter/',
            $language->getPhpDate( strtotime('-3 month', strtotime(date('Y-m-j'))) ),
            $value
        );
        $value = preg_replace(
            '/last-year/',
            $language->getPhpDate( strtotime('-1 year', strtotime(date('Y-m-j'))) ),
            $value
        );
        $value = preg_replace(
            '/next-week/',
            $language->getPhpDate( strtotime('1 week', strtotime(date('Y-m-j'))) ),
            $value
        );
        $value = preg_replace(
            '/now\(\)/',
            $language->getPhpDate( strtotime(date('Y-m-j')) ),
            $value
        );
        $value = preg_replace(
            '/today/',
            $language->getPhpDate( strtotime(date('Y-m-j')) ),
            $value
        );

        return $value;
    }
}