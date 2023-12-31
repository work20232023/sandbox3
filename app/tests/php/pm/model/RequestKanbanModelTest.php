<?php

include_once SERVER_ROOT_PATH."pm/classes/issues/Request.php";
include_once SERVER_ROOT_PATH."pm/classes/issues/IssueState.php";
include_once SERVER_ROOT_PATH."pm/classes/tasks/Task.php";
include_once SERVER_ROOT_PATH."tests/php/pm/DevpromKanbanTestCase.php";

class RequestKanbanModelTest extends DevpromKanbanTestCase
{
    function getMetadataBuilders()
    {
        return array_merge( parent::getMetadataBuilders(), array(
            new RequestMetadataBuilder()
        ));
    }
    
    function setUp()
    {
        global $model_factory;
        
        parent::setUp();
        
        // entity mocks

        $entity = $this->getMockBuilder(Request::class)
            ->setConstructorArgs(array())
            ->setMethods(['getExact','moveToState','getStates', 'getTerminalStates'])
            ->getMock();

        $entity->expects($this->any())->method('getStates')->will( $this->returnValue(
            array (
                'submitted',
                'resolved'
            )
        ));
        $entity->expects($this->any())->method('getTerminalStates')->will( $this->returnValue(
            array (
                'resolved'
            )
        ));
        $entity->expects($this->any())->method('getExact')->will( $this->returnValueMap(
                array (
                        array ( '1', $entity->createCachedIterator(array(
                            array( 
                                    'pm_ChangeRequestId' => '1', 
                                    'Caption' => 'FirstRequest', 
                                    'PlannedRelease' => '1' 
                                 )
                        )))
                ) 
        ));
        
        $task = $this->getMockBuilder(Task::class)
            ->setConstructorArgs(array())
            ->setMethods(['createSQLIterator'])
            ->getMock();

        $task->expects($this->any())->method('createSQLIterator')->will( $this->returnValue(
                 $task->createCachedIterator(array (
                         array (
                                 'pm_TaskId' => '1',
                                 'ChangeRequest' => '1'
                               )
                 ))
        ));
        
        $model_factory->expects($this->any())->method('createInstance')->will( $this->returnValueMap(
                array (
                    array ( 'Request', null, $entity ),
                    array ( 'Task', null, $task ),
                    array ( 'Release', null, $task ),
                    array ( 'TaskType', null, $task )
                ) 
        ));
    }
    
    function testRequestIsClosedByModification()
    {
        global $model_factory;
        
        $this->getDALMock()->expects($this->atLeastOnce())->method('Query')->with(
                $this->logicalOr(
                    $this->stringContains('SELECT'),
                    $this->logicalAnd(
                        $this->stringContains('UPDATE'),
                        $this->stringContains("`State` = 'resolved'")
                       )
                    )
                );

        $object = $model_factory->getObject('Request');
        
        $object->modify_parms( '1', array( 'State' => 'resolved' ) );
    }
}