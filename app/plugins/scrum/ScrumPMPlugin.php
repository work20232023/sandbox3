<?php
include "classes/Scrum.php";
include "views/EstimationStrategyScrumBuilder.php";
include "classes/VelocityReportsBuilder.php";
include "classes/events/ScrumReportedEvent.php";
include "classes/events/ScrumFeatureIssueConversionEvent.php";
include "classes/predicates/ProjectScrumPredicate.php";
include "classes/widgets/ScrumTourScriptBuilder.php";
include "classes/ChangeLogEntitiesScrumBuilder.php";
include "classes/FeatureScrumMetadataBuilder.php";
include "classes/IssueScrumMetadataBuilder.php";

class ScrumPMPlugin extends PluginPMBase
{
    var $enabled;
    
 	function checkEnabled()
 	{
        if ( isset($this->enabled) ) return $this->enabled;
        $this->enabled = $this->getBasePlugin()->checkEnabled();
        return $this->enabled;
    }

    function getModules()
    {
        if ( !getSession()->getProjectIt()->getMethodologyIt()->IsAgile() ) return array();

        $modules = array (
			'velocitychart' => array(
				'includes' => array( 'scrum/views/VelocityPage.php' ),
				'classname' => 'VelocityPage',
				'title' => text('scrum9'),
				'AccessEntityReferenceName' => 'pm_Version',
				'area' => FUNC_AREA_MANAGEMENT,
				'icon' => 'icon-signal'
			)
		);

        if ( !$this->checkEnabled() ) return $modules;
        	
        $modules['meetings'] = array(
			'includes' => array( 'scrum/views/ScrumPage.php' ),
			'classname' => 'ScrumPage',
			'title' => text('scrum1'),
			'description' => text('scrum18'),
			'AccessEntityReferenceName' => 'pm_Scrum',
			'area' => FUNC_AREA_MANAGEMENT
		);

        return $modules;
    }

    function getBuilders()
    {
        return array (
            new VelocityReportsBuilder(),
            new EstimationStrategyScrumBuilder(),
            new ScrumReportedEvent(),
            new ChangeLogEntitiesScrumBuilder(),
            new FeatureScrumMetadataBuilder(),
            new IssueScrumMetadataBuilder(),
            new ScrumFeatureIssueConversionEvent()
        );
    }

 	function getObjectAccess( $action, $role_ref_name, & $object_it )
 	{
 		if ( $object_it->object instanceof Scrum ) {
 			return $action == ACCESS_READ || $object_it->get('Participant') == getSession()->getParticipantIt()->getId();
 		}
 	}

	function getObjectActions( $object_it )
	{
		if ( $object_it->object instanceof Request ) {
			return $this->getIssueActions($object_it);
		}

        if ( $object_it->object instanceof Feature ) {
            return $this->getFeatureActions($object_it);
        }

		return array();
	}

	protected function getIssueActions( $object_it )
	{
		if ( !is_object($this->method_toepic) )
		{
            $this->buildScrumVpds();
			$this->method_toepic = new ObjectCreateNewWebMethod(getFactory()->getObject('Feature'));
            $this->method_intoepic = new ObjectCreateNewWebMethod(getFactory()->getObject('Feature'));
		}

		if ( !in_array($object_it->get('VPD'), $this->scrum_vpds) ) return array();
		if ( !$this->method_toepic->hasAccess() ) return array();

		$this->method_toepic->setVpd($object_it->get('VPD'));
		$this->method_intoepic->setVpd($object_it->get('VPD'));
		return array (
            array (
                'name' => text('scrum19'),
                'url' => $this->method_toepic->getJSCall(array(
                                'Request' => $object_it->getId()
                            ))
            ),
            array (
                'name' => text('scrum22'),
                'url' => $this->method_intoepic->getJSCall(array(
                    'IssueAssociated' => $object_it->getId()
                ))
            )
        );
	}

    protected function getFeatureActions( $object_it )
    {
        if ( !is_object($this->method_toissue) )
        {
            $this->buildScrumVpds();
            $this->method_toissue = new ObjectCreateNewWebMethod(getFactory()->getObject('Request'));
        }

        if ( !in_array($object_it->get('VPD'), $this->scrum_vpds) ) return array();
        if ( !$this->method_toissue->hasAccess() ) return array();

        $this->method_toissue->setVpd($object_it->get('VPD'));
        return array (
            array (
                'name' => text('scrum23'),
                'url' => $this->method_toissue->getJSCall(array(
                            'FromFeature' => $object_it->getId()
                        ))
            )
        );
    }

    function buildScrumVpds()
    {
        if ( !is_null($this->scrum_vpds) ) return;

        $this->scrum_vpds = getFactory()->getObject('Project')->getRegistryBase()
                ->Query([new ProjectScrumPredicate()])->fieldToArray('VPD');
    }

    function interceptMethodFormExtendModel( & $form )
    {
        if ( $form instanceof \FunctionForm && $_REQUEST['Request'] != '' ) {
            $form->getObject()->resetAttributeGroup('Request', 'trace');
        }
    }

    private $method_toissue = null;
    private $method_toepic = null;
	private $scrum_vpds = null;
}