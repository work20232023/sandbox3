<?php if ( count($sections) > 0 ) {
	$sections = array_values($sections);
	?>

<div class="tabs-block">
	<ul class="nav nav-tabs" id="rightTab">
		<?php
		foreach ( $sections as $key => $section )
		{
            $section->setId( $section->getId() . $tag );
			if ( $placement != "" ) {
				$section->setPlacement($placement);
			}
			?>
		
		<li class="<?=($key == array_shift(array_keys($sections)) ? 'active' : '')?>">
			<a href="#<?=$section->getId().$object_id?>" tabindex="-1" data-toggle="tab"><?=$section->getCaption()?></a>
		</li>
		
		<?php } ?>
	</ul>

	<div class="tab-content <?=$style_class?>" style="overflow: inherit;">
		<?php
		foreach ( $sections as $key => $section )
		{
			?>
		
		<div class="tab-pane <?=($key == array_shift(array_keys($sections)) ? 'active' : '')?> <?=$section->getId()?>" id="<?=$section->getId().$object_id?>">

		<?php 

        $section->render( $this, array('page_uid' => $page_uid, 'document_hint' => $document_hint) );
		
		?>
		
		</div>
		
		<?php } ?>
	</div>
</div>

<?php } ?>
