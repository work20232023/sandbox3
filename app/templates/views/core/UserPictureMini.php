<?php 
$size = 18;
list($row, $column) = \EnvironmentSettings::getSpritePosition($size, $id);
$timestamp = getSession()->getUserPicTimestamp();
?>
<span class="<?=$class?>" title="<?=$title?>" style="background: url('/images/userpics-mini.png?v=<?=$timestamp?>') no-repeat <?=(-1 * $column * $size)?>px <?=(-1 * $row * $size)?>px;"></span>
<?php
if ( $date != '' ) {
    echo ' &nbsp; ' . $date;
}
