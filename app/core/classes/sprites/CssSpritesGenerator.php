<?php

class CssSpritesGenerator
{
	static function storeSpriteFile( $sprite_file_name, $image_files, $max_width, $max_height, $default_file )
	{
		$sprites_on_row = floor(\EnvironmentSettings::getSpritesMaxWidth() / $max_width);
		 
		$sprite_width = min($sprites_on_row, max(array_keys($image_files))) * $max_width;

		$sprite_height = max($max_height, ceil(max(array_keys($image_files)) / $sprites_on_row) * $max_height);
		
		$im = imagecreatetruecolor($sprite_width, $sprite_height);
        if ( $im === false ) {
            getFactory()->error("Can't create image {$sprite_width} x {$sprite_height} ");
        }
		
		imagesavealpha($im, true);
		
		$alpha = imagecolorallocatealpha($im, 0, 0, 0, 127);
		
		imagefill($im,0,0,$alpha);
 
		foreach( $image_files as $index => $file )
		{
			if ( !file_exists($file) ) $file = $default_file;

			$finfo = new \finfo(FILEINFO_MIME_TYPE);
			$mime = $finfo->file($file);
			$im2 = false;

			if ( stripos($mime, 'png') !== false ) {
				$im2 = @imagecreatefrompng($file);
			}
			if ( stripos($mime, 'jpeg') !== false || stripos($mime, 'jpg') !== false ) {
				$im2 = @imagecreatefromjpeg($file);
			}
			if ( stripos($mime, 'gif') !== false ) {
				$im2 = @imagecreatefromgif($file);
			}
			if ( stripos($mime, 'bmp') !== false ) {
				$im2 = @imagecreatefromwbmp($file);
			}
			
			if ( $im2 === false ) {
				$im2 = @imagecreatefrompng($default_file);
				list($width, $height, $type, $attr) = getimagesize($default_file);
			}
			else {
				list($width, $height, $type, $attr) = getimagesize($file);
			}
			
			$row = floor($index / $sprites_on_row);
			$column = $index - $row * $sprites_on_row - 1;

			$result = imagecopyresampled($im,$im2,($max_width*$column),($max_height*$row),0,0,$max_width,$max_height, $width, $height);
            if ( !$result ) {
                getFactory()->error("Can't place avatar image on canvas");
            }
		}

		imagefilter($im,IMG_FILTER_BRIGHTNESS,35);
		imagepng($im,$sprite_file_name);
		imagedestroy($im);
	}
}