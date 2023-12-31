<?php

include "APIAccessPolicy.php";
include "AuthenticationSOAPFactory.php";
include "model/DataModelRegistryBuilderCommon.php";
include "model/v1/TestExecutionAPIModelBuilder.php";
include "model/v1/RequestAPIModelBuilder.php";
include "model/v1/TaskAPIModelBuilder.php";
include "model/v1/CommentAPIModelBuilder.php";
include "model/v1/UserAPIModelBuilder.php";
include "model/v1/ParticipantAPIModelBuilder.php";
include "model/v1/ParticipantRoleAPIModelBuilder.php";
include "versioning/ModelVersionAttributesBuilder.php";

class SOAPSession extends SessionBase
{
	function __construct()
	{
		parent::__construct( new AuthenticationSOAPFactory() );
		
		getLanguage();
	}
	
	function getProject()
	{
	    return $this->getAuthenticationFactory()->getProject();
	}
	
	function getCacheKey()
 	{
 		return 'soap';	
 	}

	public function getSite()
	{
		return 'co';
	}

 	function createBuilders()
 	{
 	    return array_merge(
			parent::createBuilders(),
			array (
				new IterationMetadataBuilder(),
				new ReleaseMetadataBuilder(),
				new TaskMetadataBuilder(),
				new TaskTypeMetadataBuilder(),
				new MilestoneMetadataBuilder(),
				new ModelVersionAttributesBuilder(),
				new DataModelRegistryBuilderCommon(),
				new ProjectArtifactMetadataBuilder(),
				new TestExecutionAPIModelBuilder(),
                new RequestMetadataBuilder(),
				new RequestAPIModelBuilder(),
                new TaskAPIModelBuilder(),
                new CommentAPIModelBuilder(),
                new UserAPIModelBuilder(),
                new ParticipantAPIModelBuilder(),
                new ParticipantRoleAPIModelBuilder()
			)
 	    );
 	}
}
