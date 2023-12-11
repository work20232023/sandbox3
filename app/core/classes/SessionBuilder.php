<?php
use Symfony\Component\HttpFoundation\Session\Session;
use Symfony\Component\HttpFoundation\Session\Storage\NativeSessionStorage;
use Symfony\Component\HttpFoundation\Session\Storage\Handler\NullSessionHandler;

class SessionBuilder
{
    const CACHE_KEY = 'sessions';
    const max_requests = 30;
    protected static $singleInstance = null;
    protected static $nativeSession = null;

    public static function Instance()
    {
        if ( is_object(static::$singleInstance) ) return static::$singleInstance;
        static::$nativeSession = new Session(
            new NativeSessionStorage(
                array(
                    "name" => "devprom-app",
                    "cookie_httponly" => "1"
                ),
                new NullSessionHandler()
            )
        );
        static::$nativeSession->start();
        return static::$singleInstance = new static();
    }

    public function openSession( array $parms = array(), $cacheService = null )
    {
        global $session;

        if ( is_dir($this->dirName) ) {
            try {
                if ( iterator_count(new FilesystemIterator($this->dirName, FilesystemIterator::SKIP_DOTS)) > $this->maxRequestsPerSession ) {
                    exit(header('Location: /503'));
                }
            }
            catch( \Exception $e ) {}
        }

        $nativeSessionId = md5(get_class($this).serialize($parms).self::$nativeSession->getId());
        if ( self::$nativeSession->getId() != "" ) {
            $session = getFactory()->getCacheService()->get($nativeSessionId, self::CACHE_KEY);
            if ( is_object($session) && $session->getUserIt()->getId() != '' ) return $session;
        }

        $session = $this->buildSession($parms, $cacheService);
        $session->setId( $nativeSessionId );

        $session->getUserIt();

        // manage user groups passed via authentication provider (e.g. OpenID)
        $userGroups = $session->getUserIt()->get('Skype');
        if ( $userGroups != '' )
        {
            $this->processUserGroups(
                preg_split('/[,;]\s*/', $userGroups), $session);
        }

        $this->persist($session);

        return $session;
    }

    public function persist( $session )
    {
        getFactory()->getCacheService()->set($session->getId(), $session, self::CACHE_KEY);
    }

    public function close()
    {
        global $session;

        self::$nativeSession->invalidate(1);

        setcookie('devprom-app', '', 0, '/' );

        if ( is_object($session) ) {
            $session->close();
            $this->invalidate($session->getId());
        }

        \EnvironmentSettings::resetCookie('devprom');
        \EnvironmentSettings::resetCookie('session');

        $session = null;
    }

    public function invalidate( $sessionId )
    {
        if ( $sessionId == "" ) {
            getFactory()->getCacheService()->invalidate(self::CACHE_KEY);
        }
        else {
            getFactory()->getCacheService()->reset($sessionId, self::CACHE_KEY);
        }
    }

    protected function __construct()
    {
        $this->maxRequestsPerSession = defined('MAX_REQUESTS_PER_SESSION') ? MAX_REQUESTS_PER_SESSION : self::max_requests;
        $this->dirName = SERVER_FILES_PATH . 'sessions/' . static::$nativeSession->getId();
        $this->fileName = tempnam($this->dirName, 'session');

        @mkdir($this->dirName, 0777, true);
        file_put_contents($this->fileName, '');
    }

    function __destruct()
    {
        if ( file_exists($this->fileName) ) unlink($this->fileName);
    }

    protected function buildSession( array $parms, $cacheService = null )
    {
        return new SessionBase();
    }

    protected function processUserGroups( $groups, $session )
    {
        if ( !class_exists('UserGroup') ) return;

        $linkRegistry = getFactory()->getObject('UserGroupLink')->getRegistry();

        $userIt = $session->getUserIt();
        $currentGroups = $userIt->getRef('GroupId')->fieldToArray('ReferenceName');

        // detect groups to be revoked
        $tobeRevokedGroups = array_diff($currentGroups, $groups);
        if ( count($tobeRevokedGroups) > 0 )
        {
            $revokeGroupIt = getFactory()->getObject('UserGroup')->getRegistry()->Query([
                new \FilterAttributePredicate('ReferenceName', $tobeRevokedGroups)
            ]);

            while( !$revokeGroupIt->end() )
            {
                $linkIt = $linkRegistry->Query([
                    new \FilterAttributePredicate('UserGroup', $revokeGroupIt->getId()),
                    new \FilterAttributePredicate('SystemUser', $userIt->getId())
                ]);
                if ( $linkIt->getId() != '' ) {
                    $linkRegistry->Delete($linkIt);
                }
                $revokeGroupIt->moveNext();
            }
        }

        // detect groups to be granted
        $tobeGrantedGroups = array_diff($groups, $currentGroups);
        if ( count($tobeGrantedGroups) > 0 )
        {
            $grantGroupIt = getFactory()->getObject('UserGroup')->getRegistry()->Query([
                new \FilterAttributePredicate('ReferenceName', $tobeGrantedGroups)
            ]);

            while( !$grantGroupIt->end() )
            {
                $linkRegistry->Create([
                    'UserGroup' => $grantGroupIt->getId(),
                    'SystemUser' => $userIt->getId()
                ]);

                $grantGroupIt->moveNext();
            }
        }

        // reload user and assign it to session
        getFactory()->resetCachedIterator($userIt->object);
        $session->setUserIt($userIt->object->getExact($userIt->getId()));
    }

    private $maxRequestsPerSession;
    private $fileName = '';
    private $dirName = '';
}