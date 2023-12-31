<?php
include_once SERVER_ROOT_PATH."core/classes/auth/AuthenticationFactory.php";
include_once SERVER_ROOT_PATH."core/classes/sprites/UserPicSpritesGenerator.php";

class AuthenticationOpenIDFactory extends AuthenticationFactory
{
 	function ready() {
		return $_SERVER['HTTP_OIDC_EMAIL'] != ''
            || $_COOKIE['mod_auth_openidc_session'] != '';
 	}
 	
 	function tokenRequired() {
 	    return true;
 	}
 	
 	function credentialsRequired() {
 	    return false;
 	}
 	
  	function authorize()
 	{
 		$user = getFactory()->getObject('cms_User');
	 	$user->addPersister( new UserDetailsPersister() );

        if ( $_SERVER['HTTP_OIDC_EMAIL'] != '' )
        {
            try {
                $user_it = $user->getByRefArray(array('LCASE(Email)' => strtolower($_SERVER['HTTP_OIDC_EMAIL'])));
                if ($user_it->getId() < 1) {
                    if (!defined('AUTH_OPENID_CREATEVISITOR')) {
                        return parent::authorize();
                    }

                    $user_it = $user->getRegistry()->Create(array(
                        'Caption' => $_SERVER['HTTP_OIDC_NAME'] != ''
                            ? $_SERVER['HTTP_OIDC_NAME']
                            : $_SERVER['HTTP_OIDC_EMAIL'],
                        'Email' => $_SERVER['HTTP_OIDC_EMAIL'],
                        'Login' => $_SERVER['HTTP_OIDC_EMAIL'],
                        'Skype' => $_SERVER['HTTP_OIDC_GROUPS']
                    ));

                    $generator = new \UserPicSpritesGenerator();
                    $generator->storeSprites();
                }
                else {
                    $user->getRegistry()->Store($user_it, array(
                        'Skype' => $_SERVER['HTTP_OIDC_GROUPS']
                    ));
                }
            }
            catch( \Exception $e ) {
                \Logger::getLogger('System')->error($e->getMessage() . $e->getTraceAsString());
            }
        }
        elseif ( $_COOKIE['mod_auth_openidc_session'] != '' ) {
            $storedIt = getFactory()->getObject('pm_ProjectUse')->getRegistry()->Query(
                array(
                    new FilterAttributePredicate('SessionHash', $_COOKIE['mod_auth_openidc_session'])
                )
            );
            if ( $storedIt->getId() == '' ) {
                return parent::authorize();
            }
            $user_it = $storedIt->getRef('Participant');
        }
	 	else {
            return parent::authorize();
        }

 		$this->setUser( $user_it );
		return $user_it;
 	}

 	function logon( $remember = false, $session_hash = '' )
    {
 	    return parent::logon($remember, $_COOKIE['mod_auth_openidc_session']);
    }

    function logoff()
    {
        \EnvironmentSettings::resetCookie('mod_auth_openidc_session');
        return parent::logoff();
    }

 	function validateUser( $user_it ) {
 	    return $user_it->get('LDAPUID') == '' && $user_it->get('Password') == '';
 	}
 	
  	function getTitle() {
 		return 'OpenID';
 	}
} 