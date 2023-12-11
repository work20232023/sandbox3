<?php

namespace Devprom\ServiceDeskBundle\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Criteria;
use Doctrine\ORM\Mapping as ORM;

/**
 * @author Kosta Korenkov <7r0ggy@gmail.com>
 *
 * @ORM\Entity
 * @ORM\Table(name="pm_State")
 */
class State extends BaseEntity {

    /**
     * @ORM\Column(type="integer", name="pm_StateId")
     * @ORM\Id
     * @var integer
     */
    private $id;

    /**
     * @ORM\Column(type="string", name="Caption")
     * @var string
     */
    private $name;

    /**
     * @ORM\Column(type="string", name="Description")
     * @var string
     */
    private $description;

    /**
     * @ORM\Column(type="string", name="ReferenceName")
     * @var string
     */
    private $referenceName;

    /**
     * @ORM\Column(type="string", name="ObjectClass")
     * @var string
     */
    private $objectClass;

    /**
     * @ORM\Column(type="string", name="IsTerminal")
     * @var string
     */
    private $terminal;

    /**
     * @ORM\Column(type="integer", name="OrderNum")
     * @var integer
     */
    private $orderNum;

    /**
     * @ORM\Column(type="string", name="IsNotChange")
     * @var string
     */
    private $notChange;

    /**
     * @ORM\OneToMany(targetEntity="Transition", mappedBy="sourceState", fetch="EAGER", cascade={"all"})
     * @var ArrayCollection
     */
    private $availableTransitions;

    public function __construct()
    {
        $this->availableTransitions = new ArrayCollection();
    }

    /**
     * @param ArrayCollection $availableTransitions
     */
    public function setAvailableTransitions($availableTransitions)
    {
        $this->availableTransitions = $availableTransitions;
    }

    /**
     * @return array
     */
    public function getAvailableTransitions()
    {
        return $this->availableTransitions->matching(
            Criteria::create()->where(Criteria::expr()->eq("canTransition", "Y"))
        )->toArray();
    }

    /**
     * @param int $id
     */
    public function setId($id)
    {
        $this->id = $id;
    }

    /**
     * @return int
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * @param string $name
     */
    public function setName($name)
    {
        $this->name = $name;
    }

    /**
     * @return string
     */
    public function getName()
    {
        return $this->name;
    }

    /**
     * @param string $name
     */
    public function setDescription($value)
    {
        $this->description = $value;
    }

    /**
     * @return string
     */
    public function getDescription()
    {
        return $this->description;
    }

    /**
     * @param string $objectClass
     */
    public function setObjectClass($objectClass)
    {
        $this->objectClass = $objectClass;
    }

    /**
     * @return string
     */
    public function getObjectClass()
    {
        return $this->objectClass;
    }

    /**
     * @param string $referenceName
     */
    public function setReferenceName($referenceName)
    {
        $this->referenceName = $referenceName;
    }

    /**
     * @return string
     */
    public function getReferenceName()
    {
        return $this->referenceName;
    }

    /**
     * @param int $orderNum
     */
    public function setOrderNum($orderNum)
    {
        $this->orderNum = $orderNum;
    }

    /**
     * @return int
     */
    public function getOrderNum()
    {
        return $this->orderNum;
    }


    /**
     * @param string $name
     */
    public function setTerminal($value)
    {
        $this->terminal = $value;
    }

    /**
     * @return string
     */
    public function getTerminal()
    {
        return $this->terminal;
    }

    /**
     * @param string $name
     */
    public function setTerminalNum($value)
    {
        $this->terminalNum = $value;
    }

    /**
     * @return string
     */
    public function getTerminalNum()
    {
        return $this->terminalNum;
    }

    /**
     * @param string $value
     */
    public function setNotChange($value)
    {
        $this->notChange = $value;
    }

    /**
     * @return string
     */
    public function getNotChange()
    {
        return $this->notChange;
    }

    function __toString()
    {
        return $this->getName();
    }
}