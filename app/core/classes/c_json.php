<?php

class JsonWrapper
{
	static function encode( $data )
	{
		if ( function_exists('json_encode') )
		{
			if ( function_exists('json_last_error') )
			{
				return JsonWrapper::_encode_native( $data );
			}
			else
			{
				return _json_encode_prior53( $data );
			}
		}
		else
		{
			return _json_encode_prior53( $data );
		}
	}
	
	static function decode( $string )
	{
	    return @json_decode($string, true, 512);
	}
	
	function _encode_native( $data)
	{
		return @json_encode($data, JSON_HEX_TAG | JSON_HEX_APOS | JSON_HEX_QUOT | JSON_HEX_AMP);
	}

	static function buildJSONTree( array &$elements, $parentId = '' )
    {
        $branch = array();
        foreach ($elements as $key => $element) {
            $filterByParent = in_array($parentId,\TextUtils::parseItems($element['parent']))
                || $parentId == $element['parent'];

            if ( $filterByParent && !in_array($element['key'], \TextUtils::parseItems($element['parent'])) ) {
                $children = self::buildJSONTree($elements, $element['key']);
                if (count($children)>0) {
                    $element['children'] = $children;
                }
                $branch[] = $element;
            }
        }
        return $branch;
    }
	
}

// http://www.php.net/manual/en/function.json-encode.php#82904
function _json_encode_prior53( $data )
{
    if( is_array($data) || is_object($data) ) { 
        $islist = is_array($data) && ( empty($data) || array_keys($data) === range(0,count($data)-1) ); 
        
        if( $islist ) { 
            $json = '[' . implode(',', array_map('_json_encode_prior53', $data) ) . ']'; 
        } else { 
            $items = Array(); 
            foreach( $data as $key => $value ) { 
                $items[] = _json_encode_prior53("$key") . ':' . _json_encode_prior53($value); 
            } 
            $json = '{' . implode(',', $items) . '}'; 
        } 
    } elseif( is_string($data) ) { 
        # Escape non-printable or Non-ASCII characters. 
        # I also put the \\ character first, as suggested in comments on the 'addclashes' page. 
        $string = '"' . addcslashes($data, "\\\"\n\r\t/" . chr(8) . chr(12)) . '"'; 
        $json    = ''; 
        $len    = strlen($string); 
        # Convert UTF-8 to Hexadecimal Codepoints. 
        for( $i = 0; $i < $len; $i++ ) { 
            
            $char = $string[$i]; 
            $c1 = ord($char); 
            
            # Single byte; 
            if( $c1 <128 ) { 
                $json .= ($c1 > 31) ? $char : sprintf("\\u%04x", $c1); 
                continue; 
            } 
            
            # Double byte 
            $c2 = ord($string[++$i]); 
            if ( ($c1 & 32) === 0 ) { 
                $json .= sprintf("\\u%04x", ($c1 - 192) * 64 + $c2 - 128); 
                continue; 
            } 
            
            # Triple 
            $c3 = ord($string[++$i]); 
            if( ($c1 & 16) === 0 ) { 
                $json .= sprintf("\\u%04x", (($c1 - 224) <<12) + (($c2 - 128) << 6) + ($c3 - 128)); 
                continue; 
            } 
                
            # Quadruple 
            $c4 = ord($string[++$i]); 
            if( ($c1 & 8 ) === 0 ) { 
                $u = (($c1 & 15) << 2) + (($c2>>4) & 3) - 1; 
            
                $w1 = (54<<10) + ($u<<6) + (($c2 & 15) << 2) + (($c3>>4) & 3); 
                $w2 = (55<<10) + (($c3 & 15)<<6) + ($c4-128); 
                $json .= sprintf("\\u%04x\\u%04x", $w1, $w2); 
            } 
        } 
    } else { 
        # int, floats, bools, null 
        $json = strtolower(var_export( $data, true )); 
    } 
    return $json; 
}
