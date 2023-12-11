<?php
namespace Devprom\ServiceDeskBundle\Entity;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity
 * @ORM\Table(name="pm_StateObject")
 */
class StateObject extends BaseEntity
{
    /**
     * @ORM\Id
     * @ORM\Column(type="integer", name="pm_StateObjectId")
     * @var integer
     */
    private $id;

    /**
     * @ORM\OneToOne(targetEntity="State")
     * @ORM\JoinColumn(name="State", referencedColumnName="pm_StateId")
     * @var State
     */
    private $state;

    /**
     * @param State $value
     */
    public function setState($value)
    {
        $this->state = $value;
    }

    /**
     * @return State
     */
    public function getState()
    {
        return $this->state;
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

    public function __toString()
    {
        return " " . $this->getId();
    }
}