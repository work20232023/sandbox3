<div class="hidden-print hover-holder" style="display:table;width:100%;">
	<div class="content-filter" style="width:<?=(count($documents) > 0 ? '60%' : '100%')?>;">
		<?php foreach( $actions as $index => $action ) { ?>
			<?php if ( count($action['items']) < 1 ) continue; ?>
		
			<div class="btn-group pull-left">
			   	<a uid="<?=$action['uid']?>" class="btn dropdown-toggle btn-sm <?=($action['class'] == '' ? 'btn-inverse' : $action['class'])?>" href="" data-toggle="dropdown">
			   		<?=$action['name']?>
			   		<span class="caret"></span>
			   	</a>
			   	<? echo $view->render('core/PopupMenu.php', array ('items' => $action['items'])); ?>
			</div>
		<?php } ?>

        <?php
        $compareMoreActions = array();
        if ( count($reset_comparison) > 0 ) $compareMoreActions[] = $reset_comparison;
        if ( count($baselines_widget) > 0 ) $compareMoreActions[] = $baselines_widget;
        if ( count($compareMoreActions) > 0 ) {
        ?>
            <div class="btn-group pull-left">
                <a class="btn btn-cell dropdown-toggle btn-light" uid="compare-more-actions" href=""
                   data-toggle="dropdown" style="padding-left:0;">
                    <span class="label">...</span>
                </a>
                <? echo $view->render('core/PopupMenu.php', array('items' => $compareMoreActions, 'uid' => 'compare-more-actions')); ?>
            </div>
        <?php
        }

        echo $html;
        ?>
	</div>
</div>