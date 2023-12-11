<?php
include_once SERVER_ROOT_PATH . "pm/classes/project/MetricIssueBuilder.php";
include_once SERVER_ROOT_PATH . "pm/classes/issues/persisters/RequestMetricsDeliveryDatePersister.php";

class MetricIssueBuilderDeliveryDate extends MetricIssueBuilder
{
    public function buildAll( $registry, $queryParms )
    {
        $processedIds = $this->processIssues(
            $registry->Query(
                array_merge($queryParms, array(
                    new \RequestMetricsDeliveryDatePersister()
                ))
            )
        );
        if ( count($processedIds) < 1 ) return;

        $this->processIssues(
            $registry->Query(
                array(
                    new \RequestDependencyFilter($processedIds),
                    new \RequestMetricsDeliveryDatePersister()
                )
            )
        );
    }

    private function processIssues( $issue_it )
    {
        $processedIds = array();

        while( !$issue_it->end() )
        {
            if ( $issue_it->get('MetricDeliveryDate') != $issue_it->get('DeliveryDate') ) {
                $newDate = $issue_it->get('MetricDeliveryDate') != ''
                    ? "'{$issue_it->get('MetricDeliveryDate')}'"
                    : 'NULL';
                $newMethod = $issue_it->get('MetricDeliveryDateMethod') != ''
                    ? $issue_it->get('MetricDeliveryDateMethod')
                    : '0';

                DAL::Instance()->Query(
                    " UPDATE pm_ChangeRequest 
                         SET DeliveryDate = {$newDate}, 
                             DeliveryDateMethod = '{$newMethod}' 
                       WHERE pm_ChangeRequestId = {$issue_it->getId()}"
                );

                $processedIds[] = $issue_it->getId();
            }
            $issue_it->moveNext();
        }

        return $processedIds;
    }
}