<?php
include_once SERVER_ROOT_PATH."pm/classes/comments/persisters/CommentRecentPersister.php";
include "ScrumIterator.php";
include "ScrumGrouppedRegistry.php";

class Scrum extends Metaobject
{
 	function __construct( $registry = null ) 
 	{
 		parent::Metaobject('pm_Scrum', $registry);
		$this->setSortDefault( new SortAttributeClause('RecordCreated.D') );

        $this->addAttribute('RecentComment', 'WYSIWYG', translate('Комментарий'), false);
        $this->addPersister( new CommentRecentPersister() );
        $this->setAttributeEditable('Participant', false);
 	}
 	
 	function createIterator() {
 		return new ScrumIterator( $this );
 	}
 	
 	function getAttributeUserName( $attr ) {
 		switch ( $attr )
 		{
 			case 'GroupDate':
 				return translate('Дата');
 			default:
 				return parent::getAttributeUserName( $attr );
 		}
 	}

 	function getDefaultAttributeValue( $name )
	{
		if ( $name == 'Participant' ) {
			return getSession()->getParticipantIt()->getId();
		}
		return parent::getDefaultAttributeValue( $name );
	}

    function getPage() {
        return getSession()->getApplicationUrl($this).'module/scrum/meetings?';
    }
}
