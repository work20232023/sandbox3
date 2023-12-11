<?php

 /////////////////////////////////////////////////////////////////////////////////////////////////////
 class ListForm
 {
 	var $object;
	var $maxonpage = 5;
	var $itemactions = array();
	var $it_reorder;
	var $action;
	 private $offset = null;
	
	function ListForm( $object )
	{
		global $_REQUEST;

		$this->object = $object;
		
		$action = $_REQUEST[$this->object->getClassName().'action'];
		
		$this->action = $action; 
	}

   	function __destruct()
 	{
 		$this->object = null;
 	}
	
	function getMaxOnPage()
	{
		return 20;
	}
	
	function getObject()
	{
		return $this->object;
	}
	
	//---------------------------------------------------------------------------------------------------------
	function getPageUrl( $id )
	{
		return $this->object->getPageName();
	}
	
	//---------------------------------------------------------------------------------------------------------
	function addItemAction( $refname, $actionname, $deactionname) 
	{
		$this->itemactions = array_merge( $this->itemactions, 
			array($refname => array( $actionname, $deactionname )) );
	}
	
	//---------------------------------------------------------------------------------------------------------
	function getIterator() 
	{
		global $_REQUEST;
		$offset = $_REQUEST['offset'];
		
    	$it = $this->object->getAll();
    	$it->moveToPos( $offset );
		
		return $it;
	}
	
	//---------------------------------------------------------------------------------------------------------
	function getUrl() {
		return $this->object->getPageName();
	}
	
	function getUserColumns() {
		return array();
	}

	function drawUserColumn( $ref_name, $object_it ) {
	}
	
	//---------------------------------------------------------------------------------------------------------
	function draw( $view )
	{
		global $_REQUEST;
		$offset = $_REQUEST['offset'];
		
		$it = $this->getIterator();
	?>
        <table width=100% cellpadding=0 cellspacing=0>
        	<tr>
        		<td valign=top>
        		<table cellspacing=0 cellpadding=0 width=100%>
        			<tr>
        				<td align=right valign=top height=26>
						<?
							$this->drawHeader( $it );
						?>
        				</td>
        			</tr>
        			<tr><td valign=top>
        				<table width=100% cellpadding=0 cellspacing=0>
							<tr>
								<td style="background:#eaeaea;border:1px solid #d5d5df;height:24px">
									<table width=100%>
										<tr>
            								<td align=center>Название</td>
            								<td align=center width=115 style="border-left:.5pt solid #d5d5df;padding-left:3pt;">Операции</td>
										</tr>
									</table>
								</td>
							</tr>
        			<?
						if($it->count() == 0) 
						{
						?>
						<tr>
							<td style="border:.5pt solid #d5d5df;padding:2pt;">Нет записей</td>
						</tr>
						<?						
						}
						else 
						{
        				for($i=0; $i < min($it->count() - $offset, $this->getMaxOnPage()); $i++)
        				{
        			?>
            			<tr><td style="border:.5pt solid #d5d5df;">
            				<table width=100% cellpadding=0 cellspacing=0>
            					<tr><td style="text-align:justify;">
        							<table width=100% cellpadding=0 cellspacing=0>
        								<tr>
        									<td valign=top>
												<table width=100% cellpadding=0 cellspacing=0>
													<tr>
													<?
														if($_REQUEST[$this->object->getClassName().'Id'] == $it->getId()) {
														?>
														<td width=5 style="font-family:wingdings;font-size:13pt;color:#6F32EA;padding-top:3pt;">
															р
														</td>
														<?
														}
													?>
														<td>
													<?
														$this->drawItem( $it );
													?>
														</td>
													</tr>
												</table>
        									</td>
											<?
												$this->drawReorderColumn( $i, $it );
												$this->drawActionColumn( $it );
											?>
        								</tr>
        							</table>
        						</td></tr>
            				</table>
            			</td></tr>
        			<?
        					$it->moveNext();
        				}
						}
        			?>
        				</table>
        			</td></tr>
        		</table>
        		</td>
        	</tr>
        </table>
	<?
	}

	//---------------------------------------------------------------------------------------------------------
	function drawHeader( $it, $title )
	{
	?>
        <table width=100% cellpadding=0 cellspacing=0>
        	<tr>
				<td align=left>
					Список объектов
				</td>
        		<td align=right valign=top>
				<?
					if($this->getItemsCount($it) > 0) {
					?>
					Страницы: 
					<?
					}
				?>
				</td>
        		<?
        			$this->drawNavigator( $it );
        		?>
        	</tr>
        </table>
	<?	
	}

	//---------------------------------------------------------------------------------------------------------
	function drawReorderColumn( $i, $it )
	{
		global $_REQUEST;
		$offset = $_REQUEST['offset'];
		
	?>
    	<td style="width:14pt;padding:1.5pt;" valign=top>
    		<table style="table-layout:fixed" width=100%>
    			<tr>
    				<td valign=top width=22>
    		<?
    			if(($offset + $i) - 1 >= 0 && $this->object->isOrdered()) 
    			{
    				$this->it_reorder->moveToPos( $offset + $i - 1 );
    			?>
        		<form action="<? echo $this->getUrl(); ?>" method="post">
        			<input type="hidden" name="<? echo $this->object->getClassName(); ?>action" value="list.move">
        			<input type="hidden" name="oldid" value="<? echo $this->it_reorder->getId(); ?>">
        			<input type="hidden" name="oldordernum" value="<? echo $it->getOrderNum(); ?>">
        			<input type="hidden" name="newid" value="<? echo $it->getId(); ?>">
        			<input type="hidden" name="newordernum" value="<? echo $this->it_reorder->getOrderNum(); ?>">
        			<input type="submit" value="с" style="font-family:wingdings;color:gray;width:13pt;height:13pt;cursor:hand;">
        		</form>
    			<?
    			}
    			?>
    				</td>
    				<td valign=bottom width=20> 
    			<?
    			if(($offset + $i + 1) < $it->count() && $this->object->isOrdered())
    			{
    				$this->it_reorder->moveToPos( $offset + $i + 1 );
    			?>
        		<form action="<? echo $this->getUrl(); ?>" method="post">
        			<input type="hidden" name="<? echo $this->object->getClassName(); ?>action" value="list.move">
        			<input type="hidden" name="oldid" value="<? echo $it->getId(); ?>">
        			<input type="hidden" name="oldordernum" value="<? echo $this->it_reorder->getOrderNum(); ?>">
        			<input type="hidden" name="newid" value="<? echo $this->it_reorder->getId(); ?>">
        			<input type="hidden" name="newordernum" value="<? echo $it->getOrderNum(); ?>">
        			<input type="submit" value="т" style="font-family:wingdings;color:gray;width:13pt;height:13pt;cursor:hand;">
        		</form>
    			<?
    			}
    		?>
    				</td>
    			</tr>
    		</table>
    	</td>
	<?
	}
	
	//---------------------------------------------------------------------------------------------------------
	function drawActionColumn( $it )
	{
	?>
        <td valign=top width=120 align=center style="background:#f7f7f7;border-left:.5pt solid #eaeaea;padding-top:1pt;padding-bottom:2pt;">
        	<table cellpadding=0 cellspacing=0>
        		<tr><td>
					<table width=100% cellpadding=0 cellspacing=0>
						<tr>
							<td>
                    			<form action="<? echo $this->object->getPageNameEditMode($it->getId()); ?>" method="post">
                    				<input type="hidden" name="<? echo $this->object->getClassName(); ?>action" value="show">
                    				<input type="hidden" name="<? echo $this->object->getClassName().'Id'; ?>" value="<? echo $it->getId(); ?>">
                    				<input style="width:40pt;" type="submit" value="Редакт.">
                    			</form>
							</td>
							<td width=4></td>
							<td>
                    			<form action="<? echo $this->getUrl(); ?>" method="post">
                    				<input type="hidden" name="<? echo $this->object->getClassName(); ?>action" value="list.delete">
                    				<input type="hidden" name="<? echo $this->object->getClassName().'Id'; ?>" value="<? echo $it->getId(); ?>">
                    				<input style="width:40pt;" type="submit" value="Удал." onclick="return confirm('Вы действительно хотите удалить запись?');">
                    			</form>
							</td>
						</tr>
					</table>
        		</td></tr>
				<?
					$keys = array_keys($this->itemactions);
					for($k = 0; $k < count($keys); $k++)
					{
				?>
        		<tr><td>
        			<form action="<? echo $this->getUrl(); ?>" method="post">
        				<input type="hidden" name="<? echo $this->object->getClassName(); ?>action" value="list.action">
        				<input type="hidden" name="list_action_name" value="<? echo $keys[$k]; ?>">
        				<input type="hidden" name="list_action" value="<? echo $it->get($keys[$k]) == 'Y' ? 'N' : 'Y'; ?>">
        				<input type="hidden" name="<? echo $this->object->getClassName().'Id'; ?>" value="<? echo $it->getId(); ?>">
        				<input style="width:100%" type="submit" value="<? echo $it->get($keys[$k]) == 'Y' ? $this->itemactions[$keys[$k]][1] : $this->itemactions[$keys[$k]][0]; ?>">
        			</form>
        		</td></tr>
				<?													
					}
				?>
        	</table>
        </td>
	<?
	}
	
	//---------------------------------------------------------------------------------------------------------
	function drawItem( $object_it )	{}
	
	//---------------------------------------------------------------------------------------------------------
	function drawNavigator( $view, $b_top_navigator, $rowsLimit = '' )
	{
		global $_REQUEST;
		$offset = $_REQUEST['offset'];
		$freshnews = 0;
		// название страницы
		$pagename = $this->getTable()->getPage()->getUrl();
		// общее число страниц
        $pages = ($object_it->count() - $freshnews) / $this->getMaxOnPage();
        
        if ( $pages < 1 ) return;
        
        echo '<div class="btn-toolbar"><div class="btn-group">';
        
		// выводим номера страниц
        for ($i = 0; $i < $pages; $i++)
        {
			$pageurl = $pagename.(strpos($pagename, '?') !== false ? '&' : '?').'offset='.($i * $this->getMaxOnPage() + $freshnews);
        	$current = $i * $this->getMaxOnPage() == ($offset - $freshnews);
        	
        	$class_name = $current ? "btn btn-info" : "btn";
        	 
			echo '<button class="'.$class_name.'" href="'.$pageurl.'">'.($i+1).'</button>';
        }
        
        echo '</div></div>';
	}
 }

 /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 //-----------------------------------------------------------------------------------------------------------------//
 /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

 class ListFormWithActivation extends ListForm
 {
 	function ListFormWithActivation( $object )
	{
		parent::ListForm( $object );

		$this->addItemAction( 'IsActive', 'Опубликовать', 'Снять' );
	}
 
 	function drawItem( $object_it )
	{
	?>
		<table cellpadding=2 cellspacing=2>
			<tr><td> <? echo $object_it->getDisplayName(); ?> </td></tr>
		</table>
	<?
	}
 }
 
 /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 //-----------------------------------------------------------------------------------------------------------------//
 /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 
 class ListFormWithSearch extends ListForm
 {
 	function getUrl()
	{
		global $_REQUEST;
		$search = $_REQUEST['search'];
		$parentUrl = parent::getUrl();
		return $parentUrl.(strpos($parentUrl, '?') > 0 ? '&' : '?').'search='.$search;
	}

 	function getNoSearchUrl()
	{
		return parent::getUrl();
	}
	
	//---------------------------------------------------------------------------------------------------------
	function getIterator() 
	{
		$offset = $_REQUEST['offset'];

        $it = $this->object->getAll();
    	$it->moveToPos( $offset );
		
		return $it;
	}

	function getItemsCount( $it ) {
		return $it->count();
	}
	
	//---------------------------------------------------------------------------------------------------------
	function drawHeader( $it ) 
	{
		global $_REQUEST;
		$search = $_REQUEST['search'];
	?>
		<table width=100% cellpadding=0 cellspacing=0>
			<tr>
				<td height=26 valign=top>
					<table width=100% cellpadding=0 cellspacing=0>
						<tr>
							<td valign=top>
            					<form action="<? echo $this->getNoSearchUrl(); ?>" method=post>
                					<table width=100% cellpadding=0 cellspacing=0>
                						<tr>
                							<td width=45 valign=top>Поиск: </td>
                							<td valign=top><input name="search" style="width:100%;margin-top:-1pt;" value="<? echo $search; ?>"/></td>
											<td width=4></td>
                							<td width=44 valign=top><input type="submit" style="width:40pt;margin-top:0pt;" value="Найти"/></td>
                						</tr>
                					</table>
            					</form>
							</td>
							<td width=4></td>
							<td width=20 valign=top>
            					<form action="<? echo $this->getNoSearchUrl(); ?>" method=post>
        							<input type="hidden" name="search" value="">
        							<input title="Сбросить" style="width:16pt;margin-top:0pt;" type="submit" value="X">
            					</form>
							</td>
						</tr>
					</table>
				</td>
				<td></td>
				<td align=right valign=top>
					<table cellpadding=0 cellspacing=0><tr>
						<td valign=top>Страницы: </td>
							<? $this->drawNavigator( $it ); ?>
						<td></td>
					</tr></table>
				</td>
			</tr>
		</table>
	<?	
	}
 
 	function drawReorderColumn( $i, $it ) {}
 }
 
 /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 //-----------------------------------------------------------------------------------------------------------------//
 /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

 class TreeForm extends ListForm
 {
 	var $path_to_parent = array();
	
 	//---------------------------------------------------------------------------------------------------------
	function drawHeader() {}
	
	//---------------------------------------------------------------------------------------------------------
	function getPageUrl( $id ) {
		return parent::getPageUrl().'&tree_level='.$id;
	}
	
 	//---------------------------------------------------------------------------------------------------------
	function draw()
	{
		global $_REQUEST;

		// в режиме редактирования определим путь до родителя
		if(isset($_REQUEST[$this->object->getClassName().'Id']) || isset($_REQUEST['tree_level'])) 
		{
			$object_id = $_REQUEST[$this->object->getClassName().'Id'];
			if($object_id == '') $object_id = $_REQUEST['tree_level'];
			
			do {
				$object_it = $this->object->getExact($object_id);
				$parent_id = $object_it->getParentId();
				array_push($this->path_to_parent, $parent_id);
				$object_id = $parent_id;
			}
			while(!is_null($parent_id));
		}
		
		$it = $this->getIterator();
	?>
		<script>
			function toggleTreeItem( name )
			{
				var l = document.getElementById(name);
				var i = document.getElementById('img'+name);
			  	if(l.style.display == 'none') {
			  		l.style.display = 'block';
					i.src = 'images/treeminus.png';
			  	} else {
			  		l.style.display = 'none';
					i.src = 'images/treeplus.png';
			  	}			
			}
		</script>
        <table width=100% cellpadding=0 cellspacing=0>
        	<tr>
        		<td valign=top>
        		<table cellspacing=0 cellpadding=0 width=100%>
        			<tr>
        				<td align=right valign=top height=26>
						<?
							$this->drawHeader( $it );
						?>
        				</td>
        			</tr>
        			<tr><td valign=top style="border-bottom:.5pt solid #d5d5df;">
        				<table width=100% cellpadding=0 cellspacing=0 style="border-collapse:collapse;">
							<tr>
								<td style="background:#eaeaea;border:.5pt solid #d5d5df;">
									<table width=100%>
										<tr>
            								<td align=center>Описание</td>
            								<td align=center width=115 style="border-left:.5pt solid #d5d5df;padding-left:3pt;">Операции</td>
										</tr>
									</table>
								</td>
							</tr>
        			<?
        				for($i=0; $i < min($it->count() - $_REQUEST['offset'], $this->getMaxOnPage()); $i++)	{
							$this->drawTreeItem( $i, $it, 0 );
        					$it->moveNext();
        				}
        			?>
        				</table>
        			</td></tr>
        		</table>
        		</td>
        	</tr>
        </table>
	<?
	}
 }

 /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 class ListTable extends ListForm
 {
 	var $offset, $offset_name, $it, $table_id, $columns, $delete_checks;
	
	function ListTable( $object )
	{
		global $list_view_id;
		
		$list_view_id++;
		$this->table_id = strtolower(get_class($this)).$list_view_id;

		parent::ListForm( $object );
		
    	$this->delete_checks = array();
	}

   	function __destruct()
 	{
 		$this->it = null;
 	}
	
 	function getIterator() 
	{
	    return $this->object->getAll();
	}

	 function getItemsCount( $it ) {
		 return $it->count();
	 }

	function setIterator( & $iterator )
	{
	    $this->it = $iterator;
	}
	
	function & getIteratorRef()
	{
		return $this->it;
	}
	
	function setOffsetName( $offset_name )
	{
		$this->offset_name = $offset_name;
	}
	
	function getOffsetName()
	{
		return $this->offset_name;
	}
	
	function getOffset()
	{
		if ( is_numeric($this->offset) ) return $this->offset;

		$offset = $_REQUEST[$this->offset_name];
		if($offset == '') $offset = 0;

		$this->offset = $offset;
		$this->offset = $this->offset <= $this->getItemsCount($this->getIteratorRef())
			&& $this->offset >= $this->getMaxOnPage() ? $this->offset : 0;

		return $this->offset;
	}

	 function setOffset( $offset ) {
		 $_REQUEST[$this->offset_name] = $offset;
	 }
	
	function getId()
	{
		return $this->table_id;
	}
	
	//---------------------------------------------------------------------------------------------------------
	function retrieve()
	{
		$this->it = $this->getIterator();
	}
	
	function getMaxOnPage()
	{
		return 20;
	}
	
	//---------------------------------------------------------------------------------------------------------
	function getUrl() {
		return $this->object->getPageTableName();
	}

	//---------------------------------------------------------------------------------------------------------
	function IsNeedToDisplay( $attr )
	{
		switch ( $attr )
		{
			default:
				if ( $this->object->getAttributeType($attr) == 'char' ) return false;
                return in_array($attr, $this->getColumnsRef());
		}
	}

	//---------------------------------------------------------------------------------------------------------
	function IsNeedToDisplayNumber()
	{
		return $_REQUEST['dashboard'] == '';
	}

	//---------------------------------------------------------------------------------------------------------
	function IsNeedToDisplayLinks()
	{
		return true;
	}

	//---------------------------------------------------------------------------------------------------------
	function IsNeedToDisplayOperations()
	{
		return true;
	}

	//---------------------------------------------------------------------------------------------------------
	function IsNeedToDelete()
	{
		return getFactory()->getAccessPolicy()->can_delete($this->object);
	}
	
	function IsNeedToSelect() {
		return $_REQUEST['dashboard'] == '';
	}

	function IsNeedToSelectRow( $object_it ) {
		return true;
	}

	//---------------------------------------------------------------------------------------------------------
	function IsNeedToDeleteRow( $object_it )
	{
	    if ( count($this->delete_checks) < 1 ) $this->buildDeleteChecks();
		return $this->delete_checks[$object_it->getId()];
	}

	function buildDeleteChecks()
    {
        $it = $this->getIteratorRef();
        while( !$it->end() ) {
            $this->delete_checks[$it->getId()] = getFactory()->getAccessPolicy()->can_delete($it);
            $it->moveNext();
        }
        $it->moveFirst();
        return $this->delete_checks;
    }

	//---------------------------------------------------------------------------------------------------------
	function IsNeedToModify( $object_it )
	{
		return getFactory()->getAccessPolicy()->can_modify($object_it);
	}

	//---------------------------------------------------------------------------------------------------------
	function IsNeedToDisplayRow( $object_it )
	{
		return true;
	}

	//---------------------------------------------------------------------------------------------------------
	function HasRows()
	{
		if ( !isset($this->it) ) return false;
		return $this->getItemsCount($this->it);
	}
	
	//---------------------------------------------------------------------------------------------------------
	function getCellComment( $object_it, $attr )
	{
		return '';
	}

	//---------------------------------------------------------------------------------------------------------
	function drawHeader( $attr, $title )
	{
		echo translate($this->getColumnName($attr));
	}
	
	//---------------------------------------------------------------------------------------------------------
	function drawCell( $object_it, $attr )
	{
		switch ( strtolower($this->object->getAttributeDbType($attr)) )
		{
			case 'char':
				echo $object_it->get($attr) == 'Y' ? translate('Да') : 
					( $object_it->get($attr) != '' ? translate('Нет') : '' );
				break;
				
			case 'date':
				echo $object_it->getDateFormatted($attr);
				break;

			case 'datetime':
				echo $object_it->getDateTimeFormat($attr);
				break;
				
			default:
				echo Field::getHtmlValue($object_it->get($attr));
		}
	}

	//---------------------------------------------------------------------------------------------------------
	function drawRefCell( $entity_it, $object_it, $attr )
	{
	}

	function drawNumberColumn( $object_it, $index )
	{
		echo $index;
	}
	
	//---------------------------------------------------------------------------------------------------------
	function moreThanOnePage()
	{
		return $this->getItemsCount($this->it) / $this->getMaxOnPage() > 1;
	}

	//---------------------------------------------------------------------------------------------------------
	function getPages()
	{
        return $this->getItemsCount($this->it) / $this->getMaxOnPage();
	}
	
	//---------------------------------------------------------------------------------------------------------
	function drawNavigator( $view, $b_top_navigator, $rowsLimit = '' )
	{

		// общее число страниц
        $pages = $this->getPages();
        $totalItems = $this->getItemsCount($this->getIteratorRef());
        $offset_page = max(1, $this->getOffset() / $this->getMaxOnPage() - 3);
        if ( $totalItems < 5 ) return false;

		echo '<div class="hover-holder">';
		if ( $this->moreThanOnePage() ) {
            echo '<div class="pull-left pagination">';
            echo '<ul>';
            // выводим номера страниц
            if ($offset_page > 2) {
                $this->drawNavigatorItem(0);
            } else {
                $offset_page = 0;
            }

            // выводим номера страниц
            for ($i = 0; $i < min($pages, 7); $i++) {
                if ($i + $offset_page >= $pages) {
                    break;
                }
                $this->drawNavigatorItem($i + $offset_page);
            }

            if ($i + $offset_page < $pages) {
                $this->drawNavigatorItem($pages - 1);
            }
            echo '</ul></div>';
        }
       	
        echo '<div class="pull-left">';
            echo '<div class="btn-group">';
                echo '<div class="btn">';
                    echo preg_replace('/%1/', $totalItems, text(1884));
                echo '</div>';
            echo '</div>';
            echo $view->render('pm/AttributeButton.php', array (
                'data' => $rowsLimit > 9000 ? text(2627) : str_replace('%1', $rowsLimit, text(2626)),
                'items' => $this->getRowsActions(),
                'random' => 'pagination'
            ));
		echo '</div>';
		echo '<div class="clearfix"></div>';
		echo '</div>';
	}
	
	//---------------------------------------------------------------------------------------------------------
	function drawNavigatorItem( $i )
	{
    	$current = $i * $this->getMaxOnPage() == $this->getOffset();
    	$class_name = $current ? "active" : "";
		echo '<li class="'.$class_name.'"><a href="javascript: filterLocation.setup(\''.$this->offset_name.'='.($i * $this->getMaxOnPage()).'\',1);">'.round($i+1).'</a></li>';
	}	
	
	//---------------------------------------------------------------------------------------------------------
	function getColumnFields()
	{
		return array();
	}

	//---------------------------------------------------------------------------------------------------------
	function getColumnsRef()
	{
	    if ( count($this->columns) < 1 ) {
	        $this->columns = array_unique($this->getColumnFields());
        }
		return $this->columns;
	}

	//---------------------------------------------------------------------------------------------------------
	function getColumnName( $attr ) 
	{
		return translate($this->object->getAttributeUserName($attr));
	}

	//---------------------------------------------------------------------------------------------------------
	function getColumnWidth( $attr ) 
	{
	    switch($attr) {
            case 'Actions':
                return 90;
            case 'Caption':
//                return '40%';
            default:
                return '';
        }
	}
	
	//---------------------------------------------------------------------------------------------------------
	function getColumnAlignment( $attr ) 
	{
		return 'left';
	}

	//---------------------------------------------------------------------------------------------------------
	function getColumnVisibility( $attr )
	{
		if ( is_numeric($attr) )
		{
			return true;
		}
		else
		{
			return $this->IsNeedToDisplay( $attr );
		}
	}

	//---------------------------------------------------------------------------------------------------------
	function getColumnsOrder() {
		return array();
	}
	
	//---------------------------------------------------------------------------------------------------------
	function getRowColor( $object_it, $attr ) 
	{
		return 'black';
	}
	
	//---------------------------------------------------------------------------------------------------------
	function getItemActions( $column_name, $object_it ) 
	{
		$actions = array();
				
		if ( !$this->IsNeedToModify( $object_it ) ) return $actions;
		
		array_push( $actions, array(
		    'url' => $object_it->getEditUrl(), 
		    'name' => translate('Изменить')) 
		);
		
		return $actions;
	}

	//---------------------------------------------------------------------------------------------------------
	function drawItemActions( $column_name, $object_it ) 
	{
		$actions = $this->getItemActions($column_name, $object_it);
		
		if ( count($actions) > 0 )
		{
			echo '<div class="selection">';
			$method = new SelectActionWebMethod;
			$method->drawSelect($actions, '--');
			echo '</div>';
		}
	}

	//---------------------------------------------------------------------------------------------------------
	function getGroupFields() 
	{
		return array();
	}
	
	//---------------------------------------------------------------------------------------------------------
	function getGroupDefault() 
	{
		$groups = $this->getGroupFields();

		if ( count($groups) > 0 )
		{
			return $groups[0];
		}
		else
		{
			return '';
		}
	}

	//---------------------------------------------------------------------------------------------------------
	function getGroup() 
	{
		return $this->getGroupDefault();
	}
	
	//---------------------------------------------------------------------------------------------------------
	function getGroupActions( $ref_it ) {
		return array();
	}

	//---------------------------------------------------------------------------------------------------------
	function getGroupBackground( $object_it, $attr_it ) {
		return 'white';
	}

	//---------------------------------------------------------------------------------------------------------
	function drawGroup( $group_field, $object_it ) {
		return '';
	}
	
	//---------------------------------------------------------------------------------------------------------
	function getNumbersColumnWidth()
	{
		return 15;
	}
	
	function getNoItemsMessage()
	{
        $buttons = array();

        $table = $this->getTable();
        if ( is_object($table) && $_REQUEST['dashboard'] == '' ) {
            foreach( $table->getActions() as $action ) {
                if ( strpos($action['uid'], 'import') !== false ) {
                    $buttons[] = '<a class="btn append-btn btn-sm btn-success" style="visibility:inherit;" href="'.$action['url'].'"><i class="icon-plus icon-white"></i>'.$action['name'].'</a>';
                }
            }
        }
        if ( count($buttons) > 0 ) {
            return text(1312) . '<br/><br/>' . join(' ', $buttons);
        }

		return translate('Нет элементов');
	}
	
	function getCurrentAction()
	{
		global $_REQUEST;
		return $_REQUEST[$this->object->getClassName().'action'];
	}
	
	function isMarkedToDelete( $object_it )
	{
		global $_REQUEST;
		return $_REQUEST['to_delete_'.$object_it->getId()] == 'on';
	}

     function getRowsActions()
     {
         if ( !$this->HasRows() ) return array();
         if ( $_REQUEST['rows'] == '' ) $_REQUEST['rows'] = $this->getMaxOnPage();

         $rows_actions = array();
         $rows = array( 5, 10, 20, 30, 45, 60, 100, 300, 500 );

         foreach ( $rows as $value )
         {
             $script = "javascript: filterLocation.setup( 'rows=".$value."', 1 ); ";
             $rows_actions[] = array ( 'url' => $script, 'name' => $value );
         }

         $script = "javascript: filterLocation.setup( 'rows=all', 1 ); ";

         $rows_actions[] =
             array (
                 'url' => $script,
                 'name' => '&infin;'
             );

         return $rows_actions;
     }
 }
