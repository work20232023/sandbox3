<?php
include SERVER_ROOT_PATH."admin/views/ui/DateFormatDictionary.php";

class SystemDictionaryForm extends PageForm
{
	function createFieldObject( $attr )
	{
		switch ( $attr ) {
			case 'DateFormatClass':
				return new DateFormatDictionary();

			default:
				return parent::createFieldObject( $attr );

            case 'SyncAttributes':
                $subject = getFactory()->getObject('pm_ChangeRequest');
                $attributes = array_diff(
                        $subject->getAttributesOrdered(),
                        array(
                            'DeliveryDateMethod',
                            'EmailMessageId',
                            'StartDate',
                            'FinishDate',
                            'FactTasks',
                            'Fact',
                            'FactToday',
                            'EstimatedFinishDate',
                            'EstimatedStartDate',
                            'DeliveryDate',
                            'LifecycleDuration',
                            'SupportChannelEmail'
                        )
                    );
                $rowset = array();
                foreach( $attributes as $attribute ) {
                    if ( !$subject->getAttributeEditable($attribute) ) continue;
                    $rowset[] = array(
                        'entityId' => $attribute,
                        'Caption' => $subject->getAttributeUserName($attribute)
                    );
                }
                $rowset[] = array(
                    'entityId' => 'Deadlines',
                    'Caption' => text(2264)
                );
                usort($rowset, function( $left, $right ) {
                    return $left['Caption'] > $right['Caption'];
                });

                $object = new Metaobject('entity');
                $field = new FieldDictionary($object->createCachedIterator($rowset));
                $field->setMultiple(true);
                return $field;
        }
	}
}
