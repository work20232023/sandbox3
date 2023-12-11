<?php

class FunctionFilterStateWebMethod extends FilterWebMethod
{
    function getCaption()
    {
        return translate('Состояние');
    }

    function getValues()
    {
        return array (
            'all' => translate('Все'),
            'open' => text(3001),
            'closed'  => text(3002)
        );
    }

    function getStyle()
    {
        return 'width:125px;';
    }

    function getValueParm()
    {
        return 'state';
    }

    function getValue()
    {
        $value = parent::getValue();

        if ( $value == '' )
        {
            return 'all';
        }

        return $value;
    }

    function getType()
    {
        return 'singlevalue';
    }
}