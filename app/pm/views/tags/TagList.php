<?php

class TagList extends PMPageList
{
	function drawCell( $object_it, $attr )
	{
		switch ( $attr )
		{
			case 'Caption':
				echo $object_it->getDisplayName();
				break;

            case 'OrderNum':
            case 'RecordModified':
            case 'RecordCreated':
                parent::drawCell($object_it, $attr);
                break;

            default:
                if ( $object_it->getId() != '' && $object_it->get($attr) > 0 )
                {
                    $className = getFactory()->getClass($attr);
                    if ( class_exists($className) )
                    {
                        $widget_it = $this->getTable()->getReferencesListWidget(getFactory()->getObject($className), $attr);

                        $url = $widget_it->getUrl(
                            'tag='.$object_it->getId()
                        );

                        echo $object_it->get($attr);
                        echo ' &nbsp; <a class="dashed" target="_blank" href="'.$url.'">' . text(2084) . '</a>';
                    }
                }
		}
	}

	function getGroupFields() {
		return array_intersect(
            parent::getGroupFields(),
            array(
                'Project'
            )
        );
	}
}
