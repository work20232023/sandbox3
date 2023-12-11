<?php

class CacheSessionProjectTrigger extends SystemTriggersBase
{
	private $invalidateCache = false;
    private $invalidateProjectsCache = false;

	function process( $object_it, $kind, $content = array(), $visibility = 1) 
	{
        // clean session data
		switch( $object_it->object->getEntityRefName() )
		{
            case 'pm_ObjectAccess':
			case 'pm_ParticipantRole':
			case 'WikiPageType':
            case 'pm_Transition':
            case 'pm_TransitionPredicate':
            case 'pm_TransitionRole':
            case 'pm_StateAttribute':
                $this->invalidateCache = true;
			    break;

            case 'pm_ProjectRole':
            case 'pm_AccessRight':
            case 'cms_Resource':
            case 'cms_Snapshot':
            case 'pm_IssueType':
            case 'pm_TaskType':
            case 'pm_WorkspaceMenu':
            case 'pm_WorkspaceMenuItem':
            case 'pm_CustomReport':
            case 'pm_State':
			case 'pm_ProjectLink':
            case 'pm_Participant':
            case 'pm_Methodology':
            case 'pm_CustomAttribute':
                $this->invalidateProjectsCache = true;
				break;

            default:
                if ( $object_it->object instanceof RequestTemplate ) {
                    $this->invalidateCache = true;
                }
		}
	}

	function __destruct()
	{
        if ( $this->invalidateCache ) {
            getFactory()->invalidateCache();
            if ( function_exists('opcache_reset') ) opcache_reset();
        }

        if ( $this->invalidateProjectsCache ) {
            getFactory()->invalidateCache(array('sessions','projects', 'apps'));
            if ( function_exists('opcache_reset') ) opcache_reset();
        }
	}
}
 