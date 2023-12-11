<?php

include_once ('../../c_json.php');

class ModelChecklistMapper
{
	public function map(Metaobject $object, array &$values): void
    {
        foreach ($object->getAttributesByGroup('checklist') as $attribute)
        {
            if ( array_key_exists($attribute . '-form', $values) ) {
                // modal form based data
                $items = preg_split('/[\r\n]+/', $object->getDefaultAttributeValue($attribute));
                $checkValues = [];

                foreach( $items as $key => $itemName ) {
                    $itemKey = $attribute . '-' . ($key+1);
                    $checkValues[] = array (
                        'name' => $itemName,
                        'value' => $values[$itemKey] == 'on' ? 'on' : 'off',
                        'order' => $key + 1
                    );
                }

                $values[$attribute] = JsonWrapper::encode($checkValues);
            }
            else if ( $values[$attribute] != "" && $values[$object->getIdAttribute()] ) {
                // partial data case (modifyAttribute)
                $allValues  = $object->getExact($values[$object->getIdAttribute()])->get($attribute);

                if ( $allValues == '' ) {
                    $allValues = self::formatEmptyData(
                        preg_split('/[\r\n]+/', $object->getDefaultAttributeValue($attribute))
                    );
                }

                $values[$attribute] = JsonWrapper::encode(
                    self::getChangeData(
                        JsonWrapper::decode(html_entity_decode($values[$attribute])),
                        JsonWrapper::decode(html_entity_decode($allValues))
                    )
                );
            }
        }
    }

    private static function formatEmptyData(array $values): string
    {
        $result = [];

        foreach ($values as $key => $row) {
            $result[] = ['name' => trim($row), 'value' => 'off', 'order' => $key +1];
        }

        return JsonWrapper::encode($result);
    }

    private static function getChangeData(?array $value, ?array $allValues): ?array
    {
        foreach ($allValues as $key => $row) {
            if ($row['order'] == $value['order']) {
                $allValues[$key]['value'] = $value['value'] == 'off' ? 'on' : 'off';
            }
        }

        return $allValues;
    }
}