<?php
namespace Devprom\ProjectBundle\Service\TreeviewModel;
include_once SERVER_ROOT_PATH."pm/classes/product/FeatureModelExtendedBuilder.php";

class HierarchyService
{
	private $object = null;
	private $predicates = array();
	private $selectableObject = null;
    private $crossProject = false;
    private $root = 0;

	public function __construct( $object, $root, $selectableClass, $hasCrossProject = false )
	{
		getSession()->addBuilder( new \FeatureModelExtendedBuilder() );
		
    	$this->object = $object;
        $this->crossProject = $hasCrossProject;
        $this->root = $root;

    	$this->predicates = $root > 0
    		? array (
    				new \FilterAttributePredicate(
                        array_shift($object->getAttributesByGroup('hierarchy-parent')), $root),
    				new \FilterVpdPredicate(),
    				new \SortObjectHierarchyClause()
    			)
    		: ( $this->crossProject
                    ? array (
                            new \ObjectRootFilter(),
                            new \ProjectAccessibleActiveVpdPredicate(),
                            new \FilterNoVpdPredicate(getSession()->getProjectIt()->get('VPD')),
                            new \SortObjectHierarchyClause()
                        )
                    : array (
                            new \ObjectRootFilter(),
                            new \FilterVpdPredicate(),
                            new \SortObjectHierarchyClause()
                        )
                );

    	if ( class_exists($selectableClass) ) {
    	    $this->selectableObject = getFactory()->getObject($selectableClass);
        }
	}

    public function getData()
    {
    	$uid = new \ObjectUID();
    	$data = array();

        $object_it = $this->object->getRegistry()->Query($this->predicates);
        $checkableObjectIt = is_object($this->selectableObject)
            ? $this->selectableObject->getRegistryBase()->Query($this->predicates)
            : $object_it;

     	while ( !$object_it->end() )
 		{
    		$title = $object_it->getDisplayName();
    		$uid_info = $uid->getUidInfo($object_it);
    		$uid_text = '['.$uid_info['uid'].']';
    		if ( $uid_info['alien'] ) $uid_text .= ' {'.$uid_info['project'].'}';

            $checkableObjectIt->moveToId($object_it->getId());
            $data[] = array (
                'title' => $uid_text.' '.$title,
                'folder' => $object_it->get('ChildrenCount') > 0,
                'key' => $object_it->getId(),
                'expanded' => false,
                'lazy' => $object_it->get('ChildrenCount') > 0,
                'unselectable' => $checkableObjectIt->getId() == '',
                'data' => array(
                    'caption' => $object_it->getHtmlDecoded('Caption')
                )
            );

 			$object_it->moveNext();
 		}

        if ( $this->root < 1 && !$this->crossProject ) {
            $data[] = array(
                'title' => text(2505),
                'folder' => true,
                'key' => '',
                'expanded' => false,
                'lazy' => true,
                'unselectable' => true,
                'data' => array(
                    'crossNode' => true
                )
            );
        }

 		return $data;
    }
}