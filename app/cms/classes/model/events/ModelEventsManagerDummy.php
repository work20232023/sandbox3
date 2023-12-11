<?php
// PHPLOCKITOPT NOOBFUSCATE
// PHPLOCKITOPT NOENCODE

class ModelEventsManagerDummy extends ModelEventsManager
{
    function registerNotificator( $notificator_object )
    {
    }

    public function executeEventsAfterBusinessTransaction( $object_it, $interface_name, $data = array() )
    {
    }
}