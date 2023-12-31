<?php
include_once SERVER_ROOT_PATH."core/classes/auth/AuthenticationFactory.php";

class AuthenticationAppKeyFactory extends AuthenticationFactory
{
 	function ready()
 	{
 	    return $_REQUEST['appkey'] != '';
 	}
 	
 	function tokenRequired()
 	{
 	    return false;
 	}
 	
 	function credentialsRequired()
 	{
 	    return true;
 	}
 	
    static function getKey( $user_id )
	{
		return md5($user_id.EnvironmentSettings::getServerSalt());
	}

  	function authorize()
 	{
		if ( $_REQUEST['appkey'] == '' ) {
 			return parent::authorize();
		}

		$user_it = getFactory()->getObject('UserActive')->getAll();
		while ( !$user_it->end() )
		{
			if ( self::getKey( $user_it->getId() ) == $_REQUEST['appkey'] ) {
				$this->setUser( $user_it->copy() );
                $factory = new AuthenticationCookiesFactory($this->getUser());
                $factory->logon();
				return $user_it->copy();
			}
			$user_it->moveNext();
		}

        if ( self::getKey( INSTALLATION_UID ) == $_REQUEST['appkey'] ) {
            $user_it = $user_it->object->createCachedIterator(array(
                array(
                    'cms_UserId' => 9999999,
                    'Caption' => 'System'
                )
            ));
            $this->setUser($user_it);
            $factory = new AuthenticationCookiesFactory($this->getUser());
            $factory->logon();
            return $user_it->copy();
        }

        return parent::authorize();
 	}
}
