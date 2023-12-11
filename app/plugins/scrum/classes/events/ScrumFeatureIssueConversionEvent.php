<?php
use Devprom\CommonBundle\Service\Emails\RenderService;

class ScrumFeatureIssueConversionEvent extends SystemTriggersBase
{
	function process( $object_it, $kind, $content = array(), $visibility = 1) 
	{
        if ( $kind != TRIGGER_ACTION_ADD ) return;

        if ( $_REQUEST['Request'] != '' && $object_it->object->getEntityRefName() == 'pm_Function' )
        {
            $this->convertIssueToFeature($object_it,
                    getFactory()->getObject('Request')->getExact($_REQUEST['Request'])
                );
        }

        if ( $_REQUEST['FromFeature'] != '' && $object_it->object->getEntityRefName() == 'pm_ChangeRequest' )
        {
            $this->convertFeatureToIssue($object_it,
                    getFactory()->getObject('Feature')->getExact($_REQUEST['FromFeature'])
                );
        }
	}

    function convertIssueToFeature( $featureIt, $issueIt )
    {
        DAL::Instance()->Query(
            "UPDATE pm_Task SET ChangeRequest = NULL WHERE ChangeRequest = {$issueIt->getId()}"
        );
        DAL::Instance()->Query(
            " UPDATE Comment SET ObjectId = {$featureIt->getId()}, ObjectClass = 'Feature' 
                       WHERE ObjectId = {$issueIt->getId()} AND ObjectClass = 'Request' "
        );
        DAL::Instance()->Query(
            " UPDATE pm_Attachment SET ObjectId = {$featureIt->getId()}, ObjectClass = 'Feature' 
                       WHERE ObjectId = {$issueIt->getId()} AND ObjectClass = 'Request' "
        );

        $requestIt = getFactory()->getObject('Request')->getRegistry()->Query([
            new FilterAttributePredicate('Function', $featureIt->getId())
        ]);

        $linkRegistry = getFactory()->getObject('pm_ChangeRequestLink')->getRegistry();
        $linkIt = $linkRegistry->Query([
            new FilterAttributePredicate('TargetRequest', $issueIt->getId())
        ]);
        while( !$linkIt->end() )
        {
            $data = $linkIt->getData();
            unset($data[$linkIt->object->getIdAttribute()]);

            $requestIt->moveFirst();
            while( !$requestIt->end() )
            {
                $data['TargetRequest'] = $requestIt->getId();
                $linkRegistry->Create($data);

                $requestIt->moveNext();
            }

            $linkIt->moveNext();
        }

        getFactory()->getObject('Request')->delete($issueIt->getId());
    }

    function convertFeatureToIssue( $issueIt, $featureIt )
    {
        DAL::Instance()->Query(
            " UPDATE Comment SET ObjectId = {$issueIt->getId()}, ObjectClass = 'Request' 
                       WHERE ObjectId = {$featureIt->getId()} AND ObjectClass = 'Feature' "
        );
        DAL::Instance()->Query(
            " UPDATE pm_Attachment SET ObjectId = {$issueIt->getId()}, ObjectClass = 'Request' 
                       WHERE ObjectId = {$featureIt->getId()} AND ObjectClass = 'Feature' "
        );

        getFactory()->getObject('Feature')->delete($featureIt->getId());

    }
}