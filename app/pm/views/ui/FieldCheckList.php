<?php

include_once ('../../../core/classes/c_json.php');

class FieldCheckList extends Field
{
    private const LIST_KEY_NAME     = 'name';
    private const LIST_KEY_ORDER    = 'order';
    private const LIST_KEY_VALUE    = 'value';
    private const LIST_KEY_READ_ONLY= 'isReadOnly';
    private const LIST_KEY_EDIT_MODE = 'editMode';
    private const LIST_KEY_ACTION   = 'action';

    private $elements   = [];
    private $object  = null;
    private $attribute  = '';
    private $editMode   = false;

    public function __construct($object = null, $attribute = '', bool $editMode)
    {        
        $this->object = $object;
		$this->attribute = $attribute;
		$this->editMode = $editMode;
    }

    public function setObjectIt( $objectIt )
    {
	    $this->object = $objectIt;
    }

    public function getElements(): array
    {
        $items = preg_split('/[\r\n]+/',
            $this->object->object->getDefaultAttributeValue($this->attribute));

        $values = JsonWrapper::decode(html_entity_decode($this->getValue()));

        foreach ($items as $key => $item) {
            $userValue = array_shift(array_filter($values, function($e) use($item) {
                return $e[self::LIST_KEY_NAME] == $item;
            }));

            $value = 'off';
            if ( count($userValue) > 0 ) {
                $value = $userValue[self::LIST_KEY_VALUE] == 'on' ? 'on' : 'off';
            }

            $this->addElement(trim($item), ($key + 1), $value);
        }

        return $this->elements;
    }

    public function addElement(string $name, int $order, string $value = 'off'): void
    {
        if (empty(trim($name))) {
            return;
        }

        $this->elements[] = [
            self::LIST_KEY_NAME => $name,
            self::LIST_KEY_VALUE => $value,
            self::LIST_KEY_ORDER => $order
        ];
    }

    public function draw($view = null): void
    {
        $result     = [];
        $items      = $this->getElements();
        $editMode   = $this->editMode;

        foreach ($items as $item)
        {
            $method = new ModifyAttributeWebMethod(
                $this->object,
                $this->attribute,
                JsonWrapper::encode($item)
            );
            $method->setCallback('donothing');

            $result[$this->attribute . '-' . $item['order']] = [
                self::LIST_KEY_NAME     => $item['name'],
                self::LIST_KEY_ORDER    => $item['order'],
                self::LIST_KEY_VALUE    => $item['value'],
                self::LIST_KEY_READ_ONLY=> $editMode,
                self::LIST_KEY_ACTION   => $method->getJSCall()
            ];
        }

        echo $view->render('pm/ChecklistItems.php', [
            'attribute' => $this->attribute,
            'items' => $result,
            self::LIST_KEY_EDIT_MODE => $this->editMode,
            'required' => $this->getRequired()
        ]);
    }
}