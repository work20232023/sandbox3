<?php if ( $attribute['type'] == 'char' ) { ?>
    <div class="control-group" id="fieldRow<?=$key?>">
        <div class="controls">
            <? echo $view->render('core/PageFormViewAttribute.php', $attribute); ?>

            <?php if ( $attribute['description'] != '' ) { ?>
                <span class="help-block"><?=$attribute['description']?></span>
            <?php } ?>
        </div>
    </div>
<?php } else if ( in_array($key, array('Description','Content')) ) { ?>
        <div class="control-group" id="fieldRow<?=$key?>">
            <div class="controls">
                <? echo $view->render('core/PageFormViewAttribute.php', $attribute); ?>
            </div>
        </div>
<?php } else if ( is_object($attribute['field']) || $attribute['html'] != '' ) { ?>
    <div class="control-group row-fluid<?=($attribute['type'] == 'text') ? ' text-scroll' : '';?>" id="fieldRow<?=$key?>" title="<?=(!$attribute['editmode'] && $attribute['description'] != '' ? htmlentities(strip_tags($attribute['description'])) : '')?>">
        <label class="control-label" for="<?=$attribute['id']?>">
            <?=$attribute['name']?>
        </label>
        <div class="controls">
            <? echo $view->render('core/PageFormViewAttribute.php', $attribute); ?>

            <?php if ( $attribute['editmode'] && $attribute['description'] != '' ) { ?>
                <span class="help-block"><?=$attribute['description']?></span>
            <?php } ?>
        </div>
    </div>
<?php } ?>