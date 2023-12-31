<?php
include_once "ProjectTemplateSectionsRegistryBuilder.php";

class ProjectTemplateSectionsRegistryBuilderCommon extends ProjectTemplateSectionsRegistryBuilder
{
	private $session = null;
	
	public function __construct( PMSession $session )
	{
		$this->session = $session;
	}
	
    public function build ( ProjectTemplateSectionsRegistry & $registry )
    {
    	$this->buildSettings($registry);

        $this->buildDictionaries($registry);

    	$this->buildWidgets($registry);
    	
    	$this->buildPermissions($registry);
    	
    	$this->buildWorkflow($registry);

 		$registry->addSection(getFactory()->getObject('pm_CustomAttribute'), 'Attributes', array(), true, text(1080));

        $this->buildKnowledgebase($registry);

 		$this->buildArtefacts($registry);
	}
   
	private function buildSettings( & $registry )
    {
   	  	$project = getFactory()->getObject('pm_Project');
	 	$project->addFilter( new ProjectCurrentPredicate() );

	 	// methodology settings
		$methodology = getFactory()->getObject('pm_Methodology');
		$methodology->addFilter( new FilterAttributePredicate('Project', $this->session->getProjectIt()->getId() ) );

	 	$items = array(
	 		$project,
	 		$methodology
	 	);
 		$registry->addSection($registry, 'pm_Project', $items, true, text(734));
    }

    private function buildDictionaries( & $registry )
    {
        $items = array(
            getFactory()->getObject('ProjectRoleInherited'),
            getFactory()->getObject('pm_IssueType'),
            getFactory()->getObject('TaskType'),
            getFactory()->getObject('TextTemplate'),
            getFactory()->getObject('ExportTemplate'),
            getFactory()->getObject('ComponentType')
        );

        $registry->addSection($registry, 'Dictionaries', $items, true, text(2844));
    }

    private function buildWidgets( & $registry )
    {
   		$items = array();
   		
   		$report = getFactory()->getObject('pm_CustomReport');
   		$report->addFilter( new CustomReportMyPredicate() );
   		
   		$items[] = $report;
   		
	 	// navigation settings
	 	$workspace = getFactory()->getObject('Workspace');
	 	$workspace_it = $workspace->getRegistry()->getDefault(getSession()->getProjectIt());
	 	$workspace->addFilter( new FilterInPredicate($workspace_it->idsToArray()) );
	 	$items[] = $workspace;

	 	$workspace_menu = getFactory()->getObject('pm_WorkspaceMenu');
	 	$workspace_menu->addFilter( new FilterAttributePredicate('Workspace', $workspace_it->idsToArray()) );
	 	$workspace_menu->addSort( new SortOrderedClause() );
	 	$items[] = $workspace_menu;
	 	
	 	$workspace_item = getFactory()->getObject('pm_WorkspaceMenuItem');
	 	$workspace_item->addSort( new SortOrderedClause() );
	 	$workspace_item->addFilter( new FilterAttributePredicate('WorkspaceMenu', $workspace_menu->getAll()->idsToArray()) );
	 	$items[] = $workspace_item;

	 	// settings for reports and modules
	 	$usersettings = getFactory()->getObject('PMUserSettings');
	 	$usersettings->setRegistry( new PMUserSettingsExportRegistry() );
	 	$items[] = $usersettings;

        $items[] = getFactory()->getObject('DashboardItem');

 		$registry->addSection($registry, 'Widgets', $items, true, text(1832));
    }
   
    private function buildPermissions( & $registry )
    {
	 	$items = array (
            getFactory()->getObject('ProjectRole'),
            getFactory()->getObject('pm_AccessRight')
	 	);
 		$registry->addSection($registry, 'Permissions', $items, true, text(739));
   }

   private function buildWorkflow( & $registry )
   {
 		$items = array (
            getFactory()->getObject('IssueAutoAction'),
	 		getFactory()->getObject('pm_State'),
	 		getFactory()->getObject('pm_Transition'),
	 		getFactory()->getObject('pm_TransitionRole'),
	 		getFactory()->getObject('pm_TransitionPredicate'),
	 		getFactory()->getObject('pm_TransitionResetField'),
            getFactory()->getObject('pm_TransitionAction'),
	 		getFactory()->getObject('pm_StateAction'),
	 		getFactory()->getObject('pm_StateAttribute'),
            getFactory()->getObject('TaskTypeState')
        );
 		$registry->addSection($registry, 'Workflow', $items, true, text(894));
    }

    private function buildKnowledgebase( & $registry )
    {
        $registry->addSection($registry, 'Knowledgebase', array(
                getFactory()->getObject('ProjectPage')
            ), true, text(2836));
    }

	private function buildArtefacts( & $registry )
    {
 		$items = array (
 			getFactory()->getObject('Release'),
 			getFactory()->getObject('Iteration'),
 			getFactory()->getObject('Milestone'),
 			getFactory()->getObject('Tag'),
 			getFactory()->getObject('Component')
 		);

		$registry->addSection($registry, 'ProjectArtefacts', $items, true, text(1834));
    }
}