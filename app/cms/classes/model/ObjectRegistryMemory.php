<?php

class ObjectRegistryMemory extends ObjectRegistryArray
{
    private static $memoryDb;

    function Query($parms = array())
    {
        $data = self::$memoryDb[get_class($this->getObject())];
        if ( !is_array($data) ) $data = array();
        return $this->getObject()->createCachedIterator(
            array_values($data)
        );
    }

    function Store(OrderedIterator $object_it, array $data)
    {
        self::$memoryDb[get_class($this->getObject())][$object_it->getId()] = array_merge(
            $object_it->getData(),
            $data
        );
        return $this->getObject()->getEmptyIterator();
    }

    function Create(array $data)
    {
        $id = count(self::$memoryDb[get_class($this->getObject())]) + 1;
        self::$memoryDb[get_class($this->getObject())][$id] = array_merge(
            array (
                $this->getObject()->getIdAttribute() => $id
            ),
            $data
        );
        return $this->getObject()->createCachedIterator(
            array(
                self::$memoryDb[get_class($this->getObject())][$id]
            )
        );
    }

    public function Delete( OrderedIterator $object_it )
    {
        unset(self::$memoryDb[get_class($this->getObject())][$object_it->getId()]);
   }
}