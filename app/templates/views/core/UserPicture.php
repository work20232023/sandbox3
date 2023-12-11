<?php 

if ( $image == '' ) $image = 'userpics';

switch ( $image )
{
    case 'userpics':
    	$size = 45;
    	break;
	case 'userpics-middle':
		$size = 30;
		break;
	case 'userpics-mini':
		$size = 18;
		break;
}

list($row, $column) = \EnvironmentSettings::getSpritePosition($size, $id);
$timestamp = getSession()->getUserPicTimestamp();

?>
<div class="<?=$class?>" title="<?=$title?>" style="background: url('/images/<?=$image?>.png?v=<?=$timestamp?>') no-repeat <?=(-1 * $column * $size)?>px <?=(-1 * $row * $size)?>px;"></div>