<?php
$needShortSection = true;
$last_key = key( array_slice( $attributes, -1, 1, TRUE ) );

$top = array();
foreach( $attributes as $key => $attribute ) {
    if ( in_array($key, array('Caption','UID')) ) {
        $top[$key] = $attribute;
        unset($attributes[$key]);
    }
}

$invisible = array_filter( $attributes, function(&$value) {
    return !$value['visible'];
});

$shortVisible = array();
foreach( $attributes as $key => $attribute ) {
	if ( !in_array($key, $shortAttributes) ) continue;
	if ( !$attribute['visible'] ) continue;
	$shortVisible[$key] = $attribute;
}
$shortVisible = array_chunk(
    $shortVisible,
    ceil(count($shortVisible) / ($_REQUEST['screenWidth'] >= 1400 && count($source_parms) < 1 ? 4 : 2)),
    true
);

$singleRow1 = array();
foreach( $attributes as $key => $attribute ) {
    if ( !in_array('single-row-bottom', $attribute['groups']) ) continue;
    if ( !$attribute['visible'] ) continue;
    $singleRow1[$key] = $attribute;
    unset($attributes[$key]);
}
$singleRow1= array_chunk(
    $singleRow1,
    ceil(count($singleRow1) / ($_REQUEST['screenWidth'] >= 1400 && count($source_parms) < 1 ? 4 : 2)),
    true
);

$visible = array_filter( $attributes, function(&$value) {
	return $value['visible'];
});

$attributes_per_column = count($visible) > 12 && $formonly ? max(9, ceil(count($visible) / 2)) : count($visible);
$chunked_attributes = array_chunk($visible, $attributes_per_column, true);

?>

<?php if ( $warning != '' ) { ?>

<div class="alert alert-error form_warning"><?=$warning?></div>

<?php } ?>

<?php if ( $alert != '' ) { ?>

<div class="alert alert-info"><?=$alert?></div>

<?php } ?>

<?php
?>

<div class="control-set title-set">
	<? foreach($top as $key => $attribute ) { ?>
		<? if ( !$attribute['visible'] ) continue; ?>
		<div class="control-column">
			<div class="control-group row-fluid" id="fieldRow<?=$key?>">
				<label class="control-label" for="<?=$attribute['id']?>"><?=$attribute['name']?></label>
				<div class="controls">
					<? echo $view->render('core/PageFormAttribute.php', $attribute); ?>
				</div>
			</div>
		</div>
	<? } ?>
</div>

<div class="control-set">
	<?php foreach( $chunked_attributes as $index => $attributes ) { ?>

	<?php $style = ($formonly ? "width: ".ceil(100/count($chunked_attributes))."%;padding-left: ".($index > 0 ? '20px;' : 0).";" : ""); ?>

	<div class="control-column" style="<?=$style?>">
	
	<?php foreach( $attributes as $key => $attribute ) { ?>

        <?php if ( in_array($key, $shortAttributes) ) {
            if ( $needShortSection ) {
            ?>
            </div></div>
            <div class="control-set">
                <?php foreach( $shortVisible as $shortVisibleAttributes ) { ?>
                    <div class="control-column">
                        <?php foreach( $shortVisibleAttributes as $key => $attribute ) { ?>
                            <div class="control-group row-fluid" id="fieldRow<?=$key?>">
                                <label class="control-label" for="<?=$attribute['id']?>"><?=$attribute['name']?></label>
                                <div class="controls">
                                    <? echo $view->render('core/PageFormAttribute.php', $attribute); ?>
                                    <?php if ( $attribute['description'] != '' ) { ?>
                                        <span class="help-block"><?=$attribute['description']?></span>
                                    <?php } ?>
                                </div>
                            </div>
                        <?php } ?>
                    </div>
                <?php } ?>
            </div>
            <div class="control-set">
                <div class="control-column" style="<?=$style?>">
            <?php
            $needShortSection = false;
            }
            continue;
        }
        ?>

		<?php if ( $attribute['type'] == 'char' ) { ?>
	
			  <div class="control-group" id="fieldRow<?=$key?>">
			    <label class="control-label" for="<?=$attribute['id']?>"></label>
			    <div class="controls">
					<? echo $view->render('core/PageFormAttribute.php', $attribute); ?>
					
					<?php if ( $attribute['description'] != '' ) { ?>
						<span class="help-block"><?=$attribute['description']?></span>
					<?php } ?>
			    </div>
			  </div>
		
		<?php } else if ( is_object($attribute['field']) || $attribute['html'] != '' ) { ?>
		    
			  <div class="control-group row-fluid" id="fieldRow<?=$key?>">
			    <label class="control-label" for="<?=$attribute['id']?>"><?=$attribute['name']?></label>
			    <div class="controls">
					<? echo $view->render('core/PageFormAttribute.php', $attribute); ?>
			      
			        <?php if ( $attribute['description'] != '' ) { ?>
						<span class="help-block"><?=$attribute['description']?></span>
					<?php } ?>
			    </div>
			  </div>
	  	    
		<?php } ?>
		
	<?php } ?>
	
	</div>
	
<?php } ?>	

</div>

<div class="control-set">
    <?php foreach( $singleRow1 as $index => $attributes ) { ?>
        <div class="control-column">
            <?php foreach( $attributes as $key => $attribute ) { ?>
                <div class="control-group row-fluid" id="fieldRow<?=$key?>">
                    <label class="control-label" for="<?=$attribute['id']?>"><?=$attribute['name']?></label>
                    <div class="controls">
                        <? echo $view->render('core/PageFormAttribute.php', $attribute); ?>
                        <?php if ( $attribute['description'] != '' ) { ?>
                            <span class="help-block"><?=$attribute['description']?></span>
                        <?php } ?>
                    </div>
                </div>
            <?php } ?>
        </div>
    <?php } ?>
</div>


<?php foreach( $invisible as $key => $attribute ) { ?>
	<?php if ( !$attribute['required'] ) continue; ?>
	<input id="<?=$attribute['id']?>" type="hidden" name="<?=$key?>" value="<?=$attribute['value']?>" referenceName="<?=$attribute['referenceName']?>">
<?php } ?>

<?php if ( !$formonly) { ?>
<div class="control-group">
    <label class="control-label" for="buttons"></label>
    <div class="controls">
        <?php $form->drawButtons(); ?>
    </div>
</div>
<?php } ?>
