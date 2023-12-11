<?php

class AffectsRequirementsSection extends InfoSection
{
    var $object_it;

    function __construct($object_it)
    {
        parent::__construct();
        $this->object_it = $object_it;
        $this->setPlacement('bottom');
    }

    function getCaption()
    {
        return text(3701);
    }

    function getTemplate()
    {
        return 'pm/AffectsRequirementsSection.php';
    }

    function getRenderParms()
    {
        return array_merge(
            parent::getRenderParms(),
            [
                'id' => md5(microtime() . get_class($this)),
                'url' => getSession()->getApplicationUrl() . 'analysis/Requirement/' . get_class($this->object_it->object) . '/' . $this->object_it->getId(),
            ]
        );
    }

    function IsActive()
    {
        return true;
    }
}
