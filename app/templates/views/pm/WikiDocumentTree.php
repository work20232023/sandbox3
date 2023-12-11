<div class="wiki-page-tree hidden-print" style="<?=($leftPaneVisible ? '' : 'display:none;')?>">
    <div class="tabs-block" style="display: inline">
        <?php foreach ( $sections as $key => $section ) { ?>
            <div class="tab-pane <?=($key == array_shift(array_keys($sections)) ? 'active' : '')?> <?=$section->getId()?>" id="<?=$section->getId().$object_id?>">
                <?php
                    $section->render( $this, array(
                        'page_uid' => $page_uid,
                        'document_id' => $widget_id,
                        'object_id' => $object_id
                    ));
                ?>
            </div>
        <?php } ?>
    </div>
</div>
