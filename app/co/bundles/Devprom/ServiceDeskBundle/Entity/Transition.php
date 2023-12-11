<?php

namespace Devprom\ServiceDeskBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Validator\Constraints as Assert;

/**
 * @author Roman Burdilovskiy <rburdilovskiy@gmail.com>

 * @ORM\Entity
 * @ORM\Table(name="pm_Transition")
 */
class Transition extends BaseEntity
{
    /**
     * @ORM\Id
     * @ORM\Column(type="integer", name="pm_TransitionId")
     * @ORM\GeneratedValue
     * @var integer
     */
    private $id;

    /**
     * @ORM\Column(type="string", name="Caption")
     * @Assert\NotBlank
     * @var string
     */
    private $caption;

    /**
     * @ORM\Column(type="integer", name="OrderNum")
     * @var integer
     */
    protected $orderNum;

    /**
     * @ORM\Column(type="string", name="Description")
     * @Assert\NotBlank
     * @var string
     */
    private $description;

    /**
     * @ORM\Column(type="string", name="IsReasonRequired")
     * @var string
     */
    private $reasonRequired;

    /**
     * @ORM\Column(type="string", name="IsCanTransition")
     * @var string
     */
    private $canTransition;

    /**
     * @ORM\Column(type="string", name="PredicatesLogic")
     * @var string
     */
    private $predicatesLogic;

    /**
     * @ORM\Column(type="string", name="ProjectRolesLogic")
     * @var string
     */
    private $projectRolesLogic;

    /**
     * @ORM\ManyToOne(targetEntity="State", inversedBy="availableTransitions")
     * @ORM\JoinColumn(name="SourceState", referencedColumnName="pm_StateId")
     * @var State
     */
    private $sourceState;

    /**
     * @ORM\Column(type="integer", name="TargetState")
     * @var integer
     */
    protected $targetState;

    /**
     * @param int $id
     */
    public function setId($id)
    {
        $this->id = $id;
    }

    /**
     * @return integer
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * @param string $caption
     */
    public function setCaption($caption)
    {
        $this->caption = $caption;
    }

    /**
     * @return string
     */
    public function getCaption()
    {
        return $this->caption;
    }

    /**
     * @param $value
     */
    public function setOrderNum($value)
    {
        $this->orderNum = $value;
    }

    /**
     * @return integer
     */
    public function getOrderNum()
    {
        return $this->orderNum;
    }

    /**
     * @param string $description
     */
    public function setDescription($description)
    {
        $this->description = $description;
    }

    /**
     * @return string
     */
    public function getDescription()
    {
        return $this->description;
    }

    /**
     * @param string $reasonRequired
     */
    public function setReasonRequired($reasonRequired)
    {
        $this->reasonRequired = $reasonRequired;
    }

    /**
     * @return string
     */
    public function getReasonRequired()
    {
        return $this->reasonRequired;
    }

    /**
     * @param string $canTransition
     */
    public function setCanTransition($canTransition)
    {
        $this->canTransition = $canTransition;
    }

    /**
     * @return string
     */
    public function getCanTransition()
    {
        return $this->canTransition;
    }

    /**
     * @param string $predicatesLogic
     */
    public function setPredicatesLogic($predicatesLogic)
    {
        $this->predicatesLogic = $predicatesLogic;
    }

    /**
     * @return string
     */
    public function getPredicatesLogic()
    {
        return $this->predicatesLogic;
    }

    /**
     * @param string $projectRolesLogic
     */
    public function setProjectRolesLogic($projectRolesLogic)
    {
        $this->projectRolesLogic = $projectRolesLogic;
    }

    /**
     * @return string
     */
    public function getProjectRolesLogic()
    {
        return $this->projectRolesLogic;
    }

    /**
     * @param State $sourceState
     */
    public function setSourceState($sourceState)
    {
        $this->sourceState = $sourceState;
    }

    /**
     * @return State
     */
    public function getSourceState()
    {
        return $this->sourceState;
    }

    /**
     * @param $value
     */
    public function setTargetState($value)
    {
        $this->targetState = $value;
    }

    /**
     * @return integer
     */
    public function getTargetState()
    {
        return $this->targetState;
    }
}