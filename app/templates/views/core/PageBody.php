<?php $view->extend('core/Page.php'); ?>

<div id="main" role="main" class="container-fluid container-fluid-internal">
    <div class="row-fluid">
        <div class="row-fluid hidden-print page-title">
            <div class="page-title-col">
                <?php
                $navigation_parms['bodyExpanded'] = $bodyExpanded;
                echo $view->render($caption_template, $navigation_parms);
                ?>
            </div>
            <div class="page-title-col" style="vertical-align: top;">
                <?php if ( $context_template != '' ) echo $view->render($context_template, $context); ?>
            </div>
            <div class="page-title-col text-right">
                <?php
                echo $view->render('core/PageMenu.php', array_merge($navigation_parms, array(
                    'checkpoint_alerts' => $checkpoint_alerts,
                    'checkpoint_url' => $checkpoint_url,
                    'areas' => $navigation_parms['areas'],
                    'search_url' => $search_url
                )));
                ?>
            </div>
        </div> <!-- end row -->
    </div>
	<div class="contained">
		<?php
		if ( !$bodyExpanded && count($navigation_parms['areas']) > 0 )
		{
			?>
			<!-- aside -->
			<aside class="hidden-print" style="margin:0;min-height:0;width:160px;">
				<!-- aside item: Menu -->
                <? if ( count($navigation_parms['areas']) > 1 ) { ?>
                <div id="main-sidebar">
                    <?php
                        echo $view->render('core/PageTabs.php', array(
                            'pages' => $navigation_parms['areas'],
                            'adjust_menu' => $navigation_parms['adjust_menu'],
                            'settings_menu' => $navigation_parms['settings_menu'],
                            'active_area_uid' => $active_area_uid
                        ));
                    ?>
                </div>
                <? } ?>

                <div id="sidebar" class="<?=(count($navigation_parms['areas']) > 1 ? "" : "no-areas")?>">
                <?php
                    foreach( $navigation_parms['areas'] as $area ) {
                        if ( $area['uid'] == 'stg' ) continue;
                        echo $view->render('core/VerticalMenu.php', array(
                            'items' => $area['menus'],
                            'area_id' => count($navigation_parms['areas']) > 1 ? $area['uid'] : $active_area_uid,
                            'active_area_uid' => $active_area_uid,
                            'active_url' => $active_url,
                            'application_url' => $application_url,
                            'search_url' => $search_url
                        ));
                    }
                ?>
                </div>
			</aside> <!-- aside -->
			<?php
		}
		elseif ( $bodyExpanded && count($navigation_parms['areas']) > 0 )
		{
			?>
			<aside class="hidden-print" style="margin:0;width:45px;">
				<!-- aside item: Menu -->
				<div id="sidebar">
				<?php
                    $area = $navigation_parms['areas']['favs'];
					echo $view->render('core/VerticalShortMenu.php', array(
						'items' => $area['menus'],
						'area_id' => $area['uid'],
						'active_url' => $active_url,
						'application_url' => $application_url,
                        'adjust_menu' => $navigation_parms['adjust_menu'],
                        'settings_menu' => $navigation_parms['settings_menu'],
					));

				?>
				</div>
			</aside> <!-- aside -->
			<?php
		}
		else { ?>
			<?php $style = "margin-left:20px;"; ?>
		<?php } ?>
		
        <div id="page-content" class="container-fluid">
            <section class="content content-internal <?=($bodyExpanded ? 'content-expanded' : '')?> <?=$section_class?>" style="<?=$style?>" uid="<?=$uid?>" module="<?=$module?>" report="<?=$report?>">
                <div class="row-fluid" style="padding-top: 50px;">
                    <?php $view['slots']->output('_content') ?>
               	</div> <!-- end row-fluid -->
            </section>
        </div>
		
	</div>
</div>
