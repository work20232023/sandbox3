<?php

 include('c_form.php');
 include('c_list.php');

 ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 class ViewSimple
 {
 	var $form, $object;

 	function ViewSimple( $object ) 
	{
		$this->object = $object;
		$this->form = $this->createForm();
	}
	
	function createForm() {
		return new Form( $this->object );
	}
	
	function getCaption() {
		return $this->form->getCaption();
	}
	
	function draw()
	{
	?>
        <table width=70%>
        	<tr>
        		<td valign=top>
                <?
                 // отрисовываем форму редактирования объекта
                 $this->form->draw();
                ?>
        		</td>
        </table>
	<?
	}
 }

 ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 class ViewBasic extends ViewSimple
 {
 	var $list;

 	function ViewBasic( $object ) 
	{
		global $_REQUEST;
		
		parent::ViewSimple( $object );

		$this->list = $this->createListForm();
		
		if($_REQUEST['view'] == 'table' && $this->list->action != '') {
			exit(header('Location: '.$this->list->getUrl() ));
		}
	}

	function createListForm() {
		return new ListForm( $this->object );
	}
	
	function draw()
	{
	?>
        <table width=100%>
        	<tr>
        		<td width=40% valign=top>
                <?
                 // отрисовываем форму редактирования объекта
                 $this->form->draw();
                ?>
        		</td>
				<?
            	if(is_object($this->list)) 
            	{
				?>
        		<td width=20>
        		</td>
        		<td valign=top>
                <?
                 // отрисовываем список объектов
                 $this->list->draw();
                ?>
        		</td></tr>
				<?
            	}
        		?>
        </table>
	<?
	}
 }
 
 /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 class ViewComposite extends ViewBasic
 {
 	var $aggregates = array();
	var $container_id;
	
	function ViewComposite( $object ) 
	{
		parent::ViewBasic( $object );

        $this->container_id = $_REQUEST[$this->object->getClassName().'Id'];
		for($i = 0; $i < count($object->aggregates); $i++) {
			$this->addAggregatedObject( $object->aggregates[$i] );
		}
	}
	
	function addAggregatedObject( $object )
	{
        if($this->container_id != '')
        {
			$classname = $object->getClassName();
			$object = getFactory()->getObject($classname, $this->object->getExact($this->container_id));

			array_push( $this->aggregates, $object->createDefaultView() );
		}
	}
	
 	function draw()
	{
		parent::draw();
	?>
		<table width=100% cellpadding=0 cellspacing=0>
	<?
	   for($i = 0; $i < count($this->aggregates); $i++) 
   	   {	
       ?>
   		<tr>
   			<td>
    		<?
    		$this->aggregates[$i]->draw();
    		?>
	    	</td>
   		</tr>
       	<?
		}	
	?>
		</table>
	<?
	}
 }

 ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 class ViewTable
 {
 	var $list, $object, $view_num;

 	function ViewTable( $object = null ) 
	{
		$this->object = is_object($object) ? $object : $this->getObject();
	}
	
   	function __destruct()
 	{
 		$this->list = null;
 	}
	
	function getObject()
	{
		return $this->object;
	}
	
	function getList( $mode = '' )
	{
		return new ListTable( $this->object );
	}
	
	function getListRef()
	{
		return $this->list;
	}

	function setList( $list )
	{
		$this->list = $list;
		if ( !is_object($this->list) ) return;

		$view_num = 1;
		$this->view_num = $view_num;

		$this->list->setOffsetName('offset'.$this->view_num);
	}
	
	function _getCaption() 
	{
		return $this->getCaption();
	}
	
	function getCaption() 
	{
		if ( is_object($this->object) )
		{
			return translate($this->object->getDisplayName());
		}
		else
		{
			return '';
		}
	}
	
	function getAddLinkUrl() {
		return $this->object->getPageName();
	}
	
	function getAddLinkName() {
		return translate('Добавить');
	}

	function getTablePageUrl() {
		return $this->object->getPageTableName();
	}
	
	function IsNeedToAdd() 
	{
	    if ( is_object($this->getObject()) ) return getFactory()->getAccessPolicy()->can_create($this->getObject());

        return false;
	}
	
	function IsNeedToDelete() 
	{
		return getFactory()->getAccessPolicy()->can_delete($this->object);
	}

	function IsNeedNavigator() {
		return true;
	}
	
	function IsNeedLinks() {
		return true;
	}

	function getUserLinks() {
		return array();
	}

	function getUserActionLinks() {
		return array();
	}
	
	function getListIterator()
	{
		$list = $this->getList( $this->getMode() );
		$this->setList($list);

		if ( !is_object($list) ) return $this->getObject()->getEmptyIterator();

		$list->retrieve();
		return $list->getIteratorRef();
	}
	
	function getListIteratorRef()
	{
	    $list = $this->getListRef();
	    
	    return $list->getIteratorRef();
	}

	function IsVisibleWhenEmpty()
	{
		return true;
	}
	
	function getFilterOrientation()
	{
		return 'right';
	}
	
	function draw( $view = null )
	{
	}
	
	function drawFooter()
	{
	}
	
	function drawFilter()
	{
		echo '&nbsp;';
	}
 }
 
?>