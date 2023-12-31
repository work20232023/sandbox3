<?php
use Devprom\ProjectBundle\Service\Wiki\WikiBaselineService;
define( 'REGEX_UID', '/(^|<[^as][^>]*>|<s[^t][^>]*>|[^>\[\/A-Z0-9{])\[?([A-Z]{1}-[0-9]+)\]?/mi' );
define( 'REGEX_INCLUDE_PAGE', '/\{\{([^}]+)\}\}/si' );
define( 'REGEX_INCLUDE_REVISION', '/\{\{([^:]+):([\d-]+)\}\}/si' );
define( 'REGEX_UPDATE_UID', '/(http|https):\/\/[^\/]+\/pm\/[^\/]+\/[A-Z]{1}-[0-9]+/i' );

class WikiParser
{
 	var $object_it;
 	var $code_array;
 	var $uml_array;
 	var $note_array;
 	var $important_array;
 	var $require_external_access = false;
 	var $external_access_user_authorization = false;
	private $href_resolver_func = null;
	private $title_resolver_func = null;
	private $display_hints = false;
    private $maxIncludePageDepth = 4;
    private $includePageDepth = 0;
    private $inlineSectionNumbering = true;
 	
	function __construct( $wiki_it )
	{
 		global $was_table, $header_row;

		$this->setObjectIt($wiki_it);
		$this->code_array = array();
		$this->uml_array = array();
		$this->note_array = array();
		$this->important_array = array();

		$this->title_resolver_func = function($info)
		{
     		if ( $info['completed'] ) {
     			$text = '[<strike>'.$info['uid'].'</strike>]';
     		}
     		else {
    			$text = '['.$info['uid'].']';
     		}
     	 	return $text.' '.$info['native'];
		};

		$was_table = false;
		$header_row = '';
	}
	
 	function parse( $content = null )
	{
		global $wiki_parser;
		$wiki_parser = $this;

		$result = html_entity_decode($content, ENT_QUOTES | ENT_HTML401, APP_ENCODING);

        $result = preg_replace_callback('/(^|[^=]"|[^="])((http:|https:)\/\/([\w\.\/:\-\?\%\=\#\&\;\+\,\(\)\[\]]+[\w\.\/:\-\?\%\=\#\&\;\+\,]{1}))/im', array($this, 'parseUrl'), $result );
        $result = preg_replace_callback('/\r?\n?\[code\]\r?\n?(.*?)\r?\n?\[\/code\]/si', preg_code_callback_store, $result);
		$result = preg_replace_callback('/\[uml\](.*?)\[\/uml\]/si', preg_uml_callback_store, $result);
		
		// insert content of included page
		$result = preg_replace_callback( REGEX_INCLUDE_PAGE, array($this, 'parseIncludePageCallback'), $result );

		$result = str_replace('<', '&lt;', $result);
		$result = str_replace('>', '&gt;', $result);
		$result = str_replace('[cut]', '<cut/>', $result);

		$result = preg_replace_callback('/\[note\](.*?)\[\/note\](\r?\n*|$)/si', preg_note_callback_store, $result);
		$result = preg_replace_callback('/\[important\](.*?)\[\/important\](\r?\n*|$)/si', preg_important_callback_store, $result);
		$result = preg_replace_callback('/\[note\]([0-9]+)\[\/note\](\r?\n*|$)/mi', preg_note_callback_restore, $result);
		$result = preg_replace_callback('/\[important\]([0-9]+)\[\/important\](\r?\n*|$)/mi', preg_important_callback_restore, $result);
		
		// align
		$result = preg_replace('/\[center\]([^\[\r\n]+)\[\/center\]([\n\r]+|$)/mi', '<center>\\1</center>', $result);
		$result = preg_replace('/\[left\]([^\[\r\n]+)\[\/left\]/mi', '\\1', $result);
		$result = preg_replace('/\[right\]([^\[\r\n]+)\[\/right\]([\r\n]+|$)/mi', 
			'<div style="float:right;">\\1</div><div style="clear:both;"></div>', $result);

		// italic
		$result = preg_replace('/(^|[\s\+>\-\*])_([^\s])([^_]+)([^\s])_([\s\+\-\*,\.;:\'"<]|$)/mi', '\\1<i>\\2\\3\\4</i>\\5', $result);
		
		// strike
		$result = preg_replace('/(^|[\s\_>\+\*])\-([^\s])(.+)([^\s])\-([\s\_<\+\*,\.;:\'"]|$)/mi', '\\1<del>\\2\\3\\4</del>\\5', $result);
		
		// underline
		$result = preg_replace('/(^|[\s\_>\-\*])\+([^\s])([^\+]+)([^\s])\+([\s_<\-\*,\.;:\'"]|$)/mi', '\\1<u>\\2\\3\\4</u>\\5', $result);
		
		// bold
		$result = preg_replace('/\*([^\s\*]+[^\*\r\n]+)\*/mi', '<b>\\1</b>', $result);

		// star list
		$result = preg_replace('/^\*\s*([^\*\r\n]+)(\r?\n*|$)/mi', '<li>\\1</li>', $result);
		$result = preg_replace('/\*{2}\s*([^\r\n]+)(\r?\n*|$)/mi', '<ul><li>\\1</li></ul>', $result);
		$result = preg_replace('/^(<li>(.+)<\/li>)([\r\n]*|$|[^<]+)/mi', '<ul>\\1</ul>'.chr(10).'\\3', $result);

		// numbered list
		$result = preg_replace('/^\#+[^\*]\s*([^\r\n]+)(\r?\n*|$)/mi', '<li> \\1</li>', $result);
		$result = preg_replace('/#\*\s*([^\r\n]+)(\r?\n*|$)/mi', '<ul><li>\\1</li></ul>', $result);
		$result = preg_replace('/^(<li>(.+)<\/li>)([\r\n]*|$|[^<]+)/mi', '<ol>\\1</ol>'.chr(10).'\\3', $result);

		if ( $this->hasPages() )
		{
			$result = preg_replace_callback('/(\[page=([^\[]+)\s+text=([^\[]+)\]|\[page=([^\[]+)\])/im', preg_page_callback, $result);
		}
		
		// parse tables
		$result = preg_replace('/<\/ul>\|/mi', '</ul>'.chr(10).'|', $result);
		$result = preg_replace('/<\/ol>\|/mi', '</ol>'.chr(10).'|', $result);
		
		$result = $this->parse_table( $result );

		// render a table
		//$result = preg_replace('/\|[\r\n]*$/', '|</table>', $result);
		//$result = preg_replace_callback('/(\|(.*)\|)(<\/table>|[\r\n]+([^\|]*))/mi', preg_table_callback, $result);

		// render an url
		$result = preg_replace_callback('/(\[url=([^\[]+)\s+text=([^\[]*)\]|\[url=([^\[]+)\])/im', preg_url_callback, $result);

		// render a note
		$result = preg_replace('/(\[note=([^\[\]]+)\])(\r?\n*|$)/si', '<div class="alert alert-warning">\\2</div>', $result);
		$result = preg_replace('/(\[important=([^\[\]]+)\])(\r?\n*|$)/si', '<div class="alert alert-error">\\2</div>', $result);

		// render a uid
		$result = preg_replace_callback(REGEX_UID, array($this, 'parseUidCallback'), $result);
		
		// font size
		$result = preg_replace('/^h(\d)\s*([^\r\n]+)/mi', '<h\\1>\\2</h\\1>', $result);

		// выполняем пустые строки
		$result = preg_replace('/^([^<\[].+)[\r\n]*$/im', '<p>\\1</p>', $result);
		$result = preg_replace('/^(.+[^>\]])[\r\n]*$/im', '<p>\\1</p>', $result);
		
		$result = preg_replace('/(!(\*)+|!(\+)+)/', '\\2', $result);
		$result = preg_replace('/(!(\*)+|!(\+)+|!(_)+|!(\-)+|!(h\d)+|!(http:|https:)+|!(\#)+)/', '\\2\\3\\4\\5\\6\\7\\8', $result);
		
		// после форматирования вставляем обратно блоки текста с исходным кодом
		$result = preg_replace_callback('/\[code\]([0-9]+)\[\/code\]/mi', preg_code_callback_restore, $result);
		$result = preg_replace_callback('/\[uml\]([0-9]+)\[\/uml\]/mi', preg_uml_callback_restore, $result);
		
		$result = preg_replace_callback('/\[image=([^\[]+)\]/im', array($this, 'replaceImageCallback'), $result);
		
		// returns line delimiters
		$result = preg_replace('/(\$\%)/s', '<br/>', $result);

		return $result;
	}

	function displayHints( $flag = true ) {
		$this->display_hints = $flag;
	}

	function getDisplayHints() {
		return $this->display_hints;
	}

	function parse_table( $text )
	{
		$rows = preg_split ( '/^\|/mi', $text );
		
		$table_begin = false;
		$current_table_columns = 0;
		$row = 1;

		while ( $row < count($rows) )
		{
			// get user defined styles of a table
			if ( !$table_begin )
			{
				$table_style = '';
				$column_style = '';

				$attributes = array();
				
				if ( preg_match('/\[table\s+([^\]]+)\]/', $rows[$row - 1], $attributes ) > 0 )
				{
					$rows[$row - 1] = str_replace($attributes[0], '', $rows[$row - 1]);
	
					$attributes = array_flip(array_map('trim', preg_split('/\s/', $attributes[1])));
					
					if ( isset($attributes['noborder']) )
					{
						$table_style .= 'border:none;';
						$column_style = 'background:none;border:none;';
					}
				}
			}

			// construct a table row
			$columns = preg_split('/\|/', $rows[$row]);
			
			$table_columns = array_slice( $columns, 0, count($columns) - 1 );
			
			if ( !$table_begin )
			{
    			$rows[$row] = '<tr><th class="wiki_table_header" style="'.$column_style.'">'.
    				join( $table_columns, '</th><th class="wiki_table_header" style="'.$column_style.'">').'</th></tr>';
			}
			else
			{
    			$rows[$row] = '<tr><td class="wiki_table_row" style="'.$column_style.'"><p>'.
    				join( $table_columns, '</p></td><td class="wiki_table_row" style="'.$column_style.'"><p>').'</p></td></tr>';
			}
			
			if ( !$table_begin )
			{
				$rows[$row] = '<table class="wiki_table table" style="'.$table_style.'">'.$rows[$row];
					
				$table_begin = true;
			}
			
			if ( preg_match('/^[\r\n]+$/', $columns[count($columns) - 1]) < 1 )
			{
				$rows[$row] = $rows[$row].'</table>'.
					$columns[count($columns) - 1];
					
				$table_begin = false;
			}

			$row++;
		}
		
		if ( $table_begin )
		{
			$rows[$row - 1] .= '</table>';
		}
		
		return join('', $rows);
	}
	
	function parse_substr( $content, $width, &$more_text ) 
	{
		$text = $this->parse($content);

		$cut_pos = strpos( $text, '<cut/>' );
		if ( $cut_pos > 0 )
		{
			$more_text = true;
			return substr( $text, 0, $cut_pos );
		}

		$initial_length = strlen($text);
		
		$table_pos = strpos( $text, 'table' );
		if ( $table_pos > 0 )
		{
			$text = substr( $text, 0, $table_pos - 1 );
		} 

		if ( $width < strlen($text) )
		{
			$pos = strpos( $text, '<p></p>', $width );
			
			if ( $pos === false )
			{
				$result = $text;
			}
			else
			{
				$result = substr( $text, 0, $pos );
			}
		}
		else
		{
			$result = $text;
		}
		
		$more_text = strlen($result) < $initial_length;
		
		return $result;
	}
	
	function getFileByName( $caption )
	{
		global $model_factory;

		$parts = preg_split('/\//', $caption);
		$file_object_it = $this->object_it;

		for($i = 0; $i < count($parts) - 1; $i++) 
		{
			if($parts[$i] == '..') {
				$file_object_it = $file_object_it->object->getExact($file_object_it->get('ParentPage'));
			} else {
				$file_object_it = $file_object_it->object->getByRef2('Caption', $parts[$i],
					'ParentPage', $file_object_it->getId());
			}
		}

        if ( is_subclass_of($file_object_it->object, 'WikiPage') )
		{
			$wiki_file = getFactory()->getObject('WikiPageFile');
			$wiki_file->addFilter( new FilterAttributePredicate('WikiPage', $file_object_it->getId()) );
			$field_name = 'ContentExt';
		}
		else
		{
			$wiki_file = getFactory()->getObject('pm_Attachment');
			$wiki_file->addFilter( new AttachmentObjectPredicate($file_object_it) );
			$field_name = 'FileExt';
		}

		$it = $wiki_file->getByRef('LCASE('.$field_name.')', 
			strtolower(trim($parts[count($parts) - 1])) );

		if ( $it->count() < 1 )
		{
			// try to get temporary stored filed (ajaxed file upload)
			$temp = getFactory()->getObject('cms_TempFile');
			$temp->addSort( new SortRecentClause() );
			
			$it = $temp->getByRef('LCASE(FileName)', strtolower(trim($parts[count($parts) - 1])) );
		}
		
		return $it;
	}
	
	function getFileByHref( $href )
	{
		global $model_factory;
		
		$object_it = $this->getObjectIt();
		
		$predicates = array();
		
		$file_class = '';
		
		switch ( $object_it->object->getClassName() )
		{
			case 'WikiPage':
				$file_class = 'WikiPageFile';
				$file_attribute = 'ContentExt';
				
				$predicates[] = new FilterAttributePredicate('WikiPage', $object_it->getId());
				
				break;
				
			default:
				$file_class = 'pm_Attachment';
				$file_attribute = 'FileExt';
				
			    $predicates[] = new AttachmentObjectPredicate($object_it);
				
				break;
		}
		
		$match = array();

		$href = html_entity_decode($href, ENT_QUOTES | ENT_HTML401, APP_ENCODING);
		
		if ( preg_match('/'.$file_class.'\/([^\/]+)\/([^\/\?]+)/i', $href, $match) )
		{
			$file = $model_factory->getObject($file_class);

			$parts = preg_split('/\./', $match[2]);
			
			$file_id = trim($parts[0], '&');
	
			if ( is_numeric($file_id) )
			{
			    return $file->getExact($file_id);
			}
			else
			{
			    foreach( $predicates as $predicate )
			    {
			        $file->addFilter( $predicate );
			    }
			    
			    return $file->getByRefArray( array (
			            $file_attribute => $match[2]
			    ));
			}
		}
		
		return null;
	}
	
	function _getFileUrl( $file_it ) 
	{
	    $url = $this->getFileUrl( $file_it );
		return $url;
	}
	
	function getFileUrl( $file_it ) 
	{
 		return _getServerUrl().$file_it->getFileUrl();
	}

	function _getPageUrl( $wiki_it = null ) 
	{
		return $this->getPageUrl( $wiki_it );
	}
	
	function getPageUrl( $wiki_it = null ) 
	{
		if ( is_callable($this->href_resolver_func) ) {
			return call_user_func($this->href_resolver_func, $wiki_it);
		}
		
		$uid = new ObjectUid;
	    $info = $uid->getUIDInfo( $wiki_it );
 		return $info['url'];
	}

 	function setHrefResolver( $func )
 	{
 		$this->href_resolver_func = $func; 
 	}
 	
 	function getHrefResolver()
 	{
 		return $this->href_resolver_func;
 	}
 	
 	function setReferenceTitleResolver( $func )
 	{
 		$this->title_resolver_func = $func;
 	}

 	function getTitleResolver() {
	    return $this->title_resolver_func;
    }

	function getObjectIt()
	{
		return $this->object_it;
	}
	
	function setObjectIt( $object_it )
	{
		if ( is_object($object_it) )
		{
			$this->object_it = $object_it->copyAll();
		}
	}

	function hasPages()
	{
		return true;
	}
	
	function hasImageTitle()
	{
		return true;
	}
	
	function hasUrlOnImage()
	{
		return true;
	}
	
	// set if alternative authorization scheme should be used (eg. no cookies, etc)
	function setRequiredExternalAccess( $flag = true )
	{
	    $this->require_external_access = $flag;
	}
	
	function getRequiredExternalAccess()
	{
	    return $this->require_external_access;
	}

	function setInlineSectionNumbering( $flag ) {
	    $this->inlineSectionNumbering = $flag;
    }

	// set if user should manualy authorize to download the file, eg. via basic http authorization
	function setExternalAccessUserAuthorization( $flag = true )
	{
	    $this->external_access_user_authorization = $flag;
	}

 	function getExternalAccessUserAuthorization()
	{
	    return $this->external_access_user_authorization;
	}
	
	function getUidInfo( $uid )
	{
		$parms = array(
		    new FilterVpdPredicate()
        );

	    $uid_resolver = new ObjectUID;
     	$object_it = $uid_resolver->getObjectIt($uid);

     	$remapUidForBaseline = is_object($this->getObjectIt())
            && $object_it->object->IsAttributeStored('UID') && $object_it->get('UID') != '';

        if ( $remapUidForBaseline ) {
            $documentVersion = $this->getObjectIt()->get('DocumentVersion');
            if ( $documentVersion != '' ) {
                $registry = new WikiPageRegistryContent($object_it->object);
                $registry->setPersisters(array(new EntityProjectPersister()));

                $parms[] = new WikiPageBranchFilter($documentVersion);
                $parms[] = new FilterTextExactPredicate('UID', $object_it->get('UID'));

                $result_it = $registry->Query($parms);
                if ( $result_it->getId() > 0 ) $object_it = $result_it;
            }
        }

		if ( $object_it->getId() > 0 ) {
			$info = $uid_resolver->getUidInfo($object_it,true);
			$info['object_it'] = $object_it;
			return $info;
		}
		else {
			return array();
		}
	}
	
    function parseUidCallback ( $match )
    {
     	$info = $this->getUidInfo( trim($match[2], '[]') );

    	if ( is_object($info['object_it']) ) {
     		$object_it = $info['object_it'];
     		$url = $this->getPageUrl($object_it);
     		if ( $url != '' ) $info['url'] = $url;
     		$class = strtolower(get_class($object_it->object));
     	}
     	else {
     		$class = '';
     	}
     	
     	if ( $info['url'] != '' )
     	{
     		if ( in_array($class,array('comment','question')) ) {
     			$text = '['.$info['uid'].']';
     		}
     		else if ( is_callable($this->title_resolver_func)) {
				$text = call_user_func($this->title_resolver_func, $info);
			}     		
     		
    		$url = '<a class="uid" href="'.$info['url'].'">'.$text.'</a>';
     		return str_replace($match[2], $url, preg_replace('/\[|\]/', '', $match[0]));
     	}
     	else
     	{
     		return $match[0];
     	}
    }

	function parseIncludePageCallback( $match )
    {
        $this->includePageDepth++;
        if ( $this->includePageDepth < $this->maxIncludePageDepth ) {
            $result = $this->parseIncludePageCallbackInt($match);
        }
        else {
            $result = $match[0];
        }
        $this->includePageDepth--;
		return $result;
    }

    function parseIncludePageCallbackInt( $match )
    {
        $info = $this->getUidInfo(trim($match[1], '[]'));
        $object_it = $info['object_it'];

        if ( !is_object($object_it) || $object_it->getId() < 1 ) {
            return $match[0];
        }
        if ( $object_it->object instanceof WikiPage ) {
            $contentAttribute = 'Content';
        }
        else if ( $object_it->object->getEntityRefName() == 'pm_ChangeRequest' ) {
            $contentAttribute = 'Description';
        }
        else {
            return $match[0];
        }

        $count = 0;

        $class_name = get_class($this);
        $parser = new $class_name($object_it->copy());

        $content = preg_replace_callback(
            REGEX_INCLUDE_PAGE,
                   array($this, 'parseIncludePageCallback'),
                    $parser->parse($object_it->getHtmlDecoded($contentAttribute)),
            -1, $count);

        if ( $object_it->object instanceof WikiPage )
        {
            $containerIt = $this->getObjectIt();
            $pageIt = (new WikiPageRegistryContent($object_it->object))->Query(
                array(
                    $object_it->object instanceof \TestScenario || is_object($containerIt) && $containerIt->get('TotalCount') > 0
                        ? new FilterInPredicate($object_it->getId())
                        : new ParentTransitiveFilter($object_it->getId()),
                    new FilterAttributePredicate('DocumentId', $object_it->get('DocumentId')),
                    new FilterNotInPredicate($object_it->getId()),
                    new SortDocumentClause()
                )
            );

            $removeSectionNumberHead = $object_it->get('SectionNumber');
            if ( $removeSectionNumberHead != '' ) $removeSectionNumberHead .= '.';

            while ( !$pageIt->end() ) {
                $content .= $this->buildDocumentStructure($removeSectionNumberHead, $pageIt, $contentAttribute);
                $pageIt->moveNext();
            }

            if ( $containerIt instanceof RequestIterator && class_exists('RequestTraceRequirement') ) {
                $traceIt = getFactory()->getObject('RequestTraceRequirement')->getRegistry()->Query(
                    array(
                        new RequestTraceObjectPredicate($object_it),
                        new FilterAttributePredicate('Type', REQUEST_TRACE_PRODUCT),
                        new FilterAttributeNotNullPredicate('Baseline'),
                        new SortAttributeClause('Baseline.D')
                    )
                );
                if ( $traceIt->get('Baseline') != '' ) {
                    $baselineService = new WikiBaselineService(getFactory(), getSession());
                    $baselineIt = $baselineService->getComparableBaselineIt($object_it->getRef('DocumentId'), $traceIt->get('Baseline'));

                    $compareToPageIt = $baselineService->getComparedPageIt($object_it, $baselineIt);
                    $baselineContent = $this->parse($compareToPageIt->getHtmlDecoded('Content'));

                    $pageIt->moveFirst();
                    while ( !$pageIt->end() ) {
                        $compareToPageIt = $baselineService->getComparedPageIt($pageIt, $baselineIt);
                        $baselineContent .= $this->buildDocumentStructure($removeSectionNumberHead, $compareToPageIt, $contentAttribute);
                        $pageIt->moveNext();
                    }

                    $diffBuilder = new WikiHtmlDiff($baselineContent,$content);
                    $content = $diffBuilder->build();
                }
            }
        }

        if ( $count > 0 || !$this->display_hints ) return $content;
        if ( $content != '' && $this->getObjectIt()->get('Includes') == '' ) {
            $uid = new ObjectUID();
            $content =
                '<div class="wiki-page-help">'.
                    str_replace('%1', $uid->getUidWithCaption($object_it), text(2114)).
                '</div>' . $content;
        }
        return '<div class="inline-page">' . $content . '</div>';
    }

    function buildDocumentStructure( $removeSectionNumberHead, $pageIt, $contentAttribute )
    {
        $content = '';
        $itemCount = 0;

        if ( $this->inlineSectionNumbering ) {
            $sectionNumber = substr_replace(
                    $pageIt->get('SectionNumber'),
                    '', 0,
                    strlen($removeSectionNumberHead)
                );
            $sectionNumber =
                trim($this->getObjectIt()->get('SectionNumber') . '.' . $sectionNumber, '.')
                . ' &nbsp; ';
        }
        $content .= '<h4>' . $sectionNumber . $pageIt->get('UID') . ' ' . $pageIt->get('Caption') . '</h4>';

        $class_name = get_class($this);
        $parser = new $class_name($pageIt->copy());

        $content .= preg_replace_callback(
                        REGEX_INCLUDE_PAGE,
                        array($this, 'parseIncludePageCallback'),
                        $parser->parse($pageIt->getHtmlDecoded($contentAttribute)),
                        -1,
                        $itemCount
                    );

        return $content;
    }

    function replaceImageCallback( $match )
    {
     	global $image_num;
	
		$image_num += 1;
		$image_width = '';
		$result = '';
		
		$width_array = array();
		if ( preg_match('/width=([0-9]+[\%]?)/i', $match[1], $width_array) > 0 )
		{
			$image_width = 'width="'.$width_array[1].'"';
			$match[1] = str_replace('width='.$width_array[1], '', $match[1]);
		}
	
		$text_array = array();
		if ( preg_match('/^(.*)\s+text=(.*)$/i', $match[1], $text_array) > 0 )
		{
			$image_name = $text_array[1];
			$image_caption = $text_array[2];
		}
		else
		{
			$image_name = $match[1];
		}
	
		if ( strpos($image_name, 'http:') !== false || strpos($image_name, 'https:') !== false )
		{
	 		$result = '<center><img class="wiki_page_image" alt="'.
	 			$image_caption.'" src="'.$image_name.'" '.$image_width.'/></center>';
	 			
	 		return $result;
		}
		
		$image_it = $this->getFileByName($image_name);
		
		if ( $image_it->count() > 0 ) 
		{
			$url = $this->_getFileUrl($image_it);
			
	 		if ( $this->hasUrlOnImage() && $image_width != '' )
	 		{
	 			$result .= '<a class="preview" href="'.$url.'" title="'.$image_caption.'">';
	 		}
	
	 		$result .= '<center><img class="wiki_page_image" alt="'.$image_caption.'" src="'.$url.'" '.$image_width.'></center>';
	
	 		if ( $this->hasUrlOnImage() && $image_width != '' )
	 		{
	 			$result .= '</a>';
	 		}
	 		
	 		if ( $this->hasImageTitle() && $image_caption != '' )
	 		{
			   $result .= '<div align=center class="image"> Рис. '.$image_num.'. '.$image_caption.'</div>';
	 		}
	 		
	 		return $result;
		}
		else
		{
			return $image_name; 
		}    	
    }

	function unparse_url($parsed_url) {
	  $scheme   = isset($parsed_url['scheme']) ? $parsed_url['scheme'] . '://' : ''; 
	  $host     = isset($parsed_url['host']) ? $parsed_url['host'] : ''; 
	  $port     = $parsed_url['scheme'] == 'http' && $parsed_url['port'] == 80 
	  				? ''
	  				: ($parsed_url['scheme'] == 'https' && $parsed_url['port'] == 443
	  						? ''
	  						: isset($parsed_url['port']) ? ':' . $parsed_url['port'] : ''); 
	  $user     = isset($parsed_url['user']) ? $parsed_url['user'] : ''; 
	  $pass     = isset($parsed_url['pass']) ? ':' . $parsed_url['pass']  : ''; 
	  $pass     = ($user || $pass) ? "$pass@" : ''; 
	  $path     = isset($parsed_url['path']) ? $parsed_url['path'] : ''; 
	  $query    = isset($parsed_url['query']) ? '?' . $parsed_url['query'] : ''; 
	  $fragment = isset($parsed_url['fragment']) ? '#' . $parsed_url['fragment'] : ''; 
	  return "$scheme$user$pass$host$port$path$query$fragment"; 
	}

	function parseImageSrcCallback( $match )
	{
		if ( preg_match('/\/file\//', $match[1], $result) ) {
			// replace server name
			$parts = parse_url($match[1]);
			if ( !preg_match('/file\/([^\/]+)\/([^\/]+)\/([\d]+).*/', $parts['path'], $result) ) {
				if ( !preg_match('/file\/([^\/]+)\/([\d]+).*/', $parts['path'], $result) ) return $match[0];
				$file_class = $result[1];
				$file_id = $result[2];
			}
			else {
				$file_class = $result[1];
				$file_id = $result[3];
			}
			if ( !class_exists(getFactory()->getClass($file_class)) ) return $match[0];

			$object = getFactory()->getObject($file_class);
			$file_it = $object->getExact($file_id);
			if ( $file_it->getId() == '' ) return $match[0];

			if ( $this->getRequiredExternalAccess() )
			{
				$finfo = new \finfo(FILEINFO_MIME_TYPE);
				foreach( $object->getAttributes() as $attribute => $data ) {
					if ( in_array($object->getAttributeType($attribute), array('file','image')) ) {
						$path = $file_it->getFilePath($attribute);
						return ' src="data:'.$finfo->file($path).';base64,'.\TextUtils::encodeImage($path).'"';
					}
				}
				return $match[0];
			}
			else
			{
				$parts['path'] = '/file/'.$file_class.'/'.$file_it->get('ProjectCodeName').'/'.$file_id;
				$url = _getServerUrl().$parts['path'];
				return ' src="'.$url.'"';
			}
		}

        if ( preg_match('/\/plantuml\/img\//', $match[1], $result) )
		{
			$url_components = parse_url($match[1]);
			$server_components = parse_url(EnvironmentSettings::getPlantUMLServer());

			$url_components['scheme'] = $server_components['scheme'];
			$url_components['host'] = $server_components['host'];
			$url_components['port'] = $server_components['port'] != '' ? ':'.$server_components['port'] : '';

			return ' src="'.$url_components['scheme'].'://'.
			    $url_components['host'].$url_components['port'].$url_components['path'].'?t='.time().'"';
		}

		// empty url
		if ( $match[1] == '' ) {
			return ' src="'._getServerUrl().'/images/warning.png"';
		}

		return $match[0];
	}

	function parseUrl( $match ) {
        $display_name = trim($match[2], "\.\,\;\:");
        $display_tag = str_replace($display_name, "", $match[2]);
        return $match[1].'<a target="_blank" href="'.trim($match[2], "\.\,\;\:").'">'.$display_name.'</a>'.$display_tag;
    }
 }
 
 function preg_font_callback ( $match )
 {
 	if ( $match[1] == 6 )
 	{
	 	return '<b>'.$match[2].'</b>';
 	}
 	else
 	{
	 	return '<font size="+'.(5 - $match[1]).'" style="line-height:110%;">'.$match[2].'</font>';
 	}
 }
 
 function preg_url_callback( $match ) 
 {
 	global $wiki_parser;
	
	if ( strpos($match[0], 'text') > 0 )
	{
		$link = $match[2];
		$caption = $match[3];
		if ( $caption == '' )
		{
			$caption = $link;
		}
	}
	else
	{
		$link = $match[4];
		$caption = $link;
	}

	if ( strpos( trim($link), 'javascript') === 0 )
	{
		// disable ability to run javascript from user pages
		return '[url='.$link.' text='.$caption.']';
	}
	else
	{
		return '<a href="'.$link.'">'.$caption.'</a>';
	}
 }

 function preg_page_callback( $match )
 {
 	global $wiki_parser, $model_factory;

	$uid = new ObjectUid;
	$wiki_page = $model_factory->getObject('WikiPage');

	if($match[2] == '') $match[2] = $match[4];

 	$object_it = $uid->getObjectIt($match[2]);
 	
 	if ( is_object($object_it) && $object_it->getId() > 0 )
 	{
 		$wiki_it = $object_it;
 		$path_parts = array();
 	}
 	else
 	{
		$path_parts = explode('/', $match[2]);
		$wiki_it = $wiki_parser->object_it;
 	}

	if ( is_object($wiki_it) )
	{
		if ( $wiki_it->object->getAttributeType('ParentPage') != '' )
		{
			for($i = 0; $i < count($path_parts); $i++) {
				if($path_parts[$i] == '..') {
					$wiki_it = $wiki_page->getExact($wiki_it->get('ParentPage'));
				} else {
					$parent_wiki_id = $wiki_it->getId();
					$wiki_it = $wiki_page->getByRef2('Caption', $path_parts[$i], 
						'ParentPage', $wiki_it->getId());
				}
				if($wiki_it->count() < 1) break;
			}
		}
	
		if($wiki_it->count() > 0) 
		{
	 		return '<a target="_self" href="'.$wiki_parser->_getPageUrl( $wiki_it ).'">'.($match[3] != '' ? $match[3] : $wiki_it->get('Caption')).'</a>';
		} 
		elseif ( isset($parent_wiki_id) ) 
		{
			$parent_it = $wiki_page->getExact($parent_wiki_id);
			
			if($parent_wiki_id > 0) {
	 			return '<span style="border-bottom:.5pt dashed navy;">'.$path_parts[count($path_parts)-1].
					'</span> <a title="Страница не найдена. Создать страницу?" target="_self" href="'.$parent_it->getViewUrl().'&wiki_parent='.$parent_wiki_id.
					'&wiki_mode=new&Caption='.$path_parts[count($path_parts)-1].'">?</a>';
			}
		}
	}
	return $match[2];
 }

 function preg_table_callback( $match ) 
 {
 	global $wiki_parser, $was_table, $header_row;
 	
 	if(!$was_table) {
 		$result = Chr(10).'<table class="wiki_table table">';
 		$was_table = true;
 		$header_row = true;
 	}

	$result .= '<tr>';
	$tds = preg_split('/\|/', $match[2]);
	
	for($i = 0; $i < count($tds); $i++) {
	    if ( $header_row )
	    {
    		$result .= '<th class="wiki_table_header">'.trim($tds[$i]).'</th>';
	    }
	    else
	    {
    		$result .= '<td class="wiki_table_row"><p>'.trim($tds[$i]).'</p></td>';
	    }
	}

	$result .= '</tr>';
	$header_row = false;

	if ( $match[4] != '' ) 
	{
		$result .= '</table>';
		$was_table = false;
	}
	else
	{
		$match[3] = str_replace(Chr(13), '', str_replace(Chr(10), '', $match[3]));
	}

	$result .= $match[3];
	
	return $result;
 }

 function preg_space_callback( $match ) 
 {
 	return str_repeat('&nbsp;', strlen($match[0]) );
 }

 function preg_code_callback_store( $match )
 {
 	global $wiki_parser;
 	
 	return '[code]'.array_push($wiki_parser->code_array, $match[1]).'[/code]';
 }

 function preg_code_callback_restore( $match )
 {
 	global $wiki_parser;

	$lines = preg_split('/'.chr(10).'/', $wiki_parser->code_array[$match[1] - 1]);
	$wiki_parser->code_array[$match[1] - 1] = "";
	
	foreach ( $lines as $line )
	{
		$line = " ".$line;
		$wiki_parser->code_array[$match[1] - 1] .= $line.chr(10); 
	}

 	return '<div style="float:left;width:100%;"><pre class="code">'.
 			htmlentities($wiki_parser->code_array[$match[1] - 1], ENT_QUOTES | ENT_HTML401, APP_ENCODING).
		'</pre></div><div style="clear:both;"></div>';
 }
 
  function preg_uml_callback_store( $match )
 {
 	global $wiki_parser;
 	
 	return '[uml]'.array_push($wiki_parser->uml_array, $match[1]).'[/uml]';
 }

 function preg_uml_callback_restore( $match )
 {
 	global $wiki_parser;

	$lines = preg_split('/'.chr(10).'/', $wiki_parser->uml_array[$match[1] - 1]);
	$wiki_parser->uml_array[$match[1] - 1] = "";
	
	foreach ( $lines as $line )
	{
		$line = " ".$line;
		$wiki_parser->uml_array[$match[1] - 1] .= $line.chr(10); 
	}
	
 	return '[image=http://www.plantuml.com/plantuml/img/'.
 		encodep(html_entity_decode($wiki_parser->uml_array[$match[1] - 1], ENT_QUOTES | ENT_HTML401, APP_ENCODING)).']';
 } 
 
 function preg_note_callback_store( $match )
 {
 	global $wiki_parser;
 	
 	return '[note]'.array_push($wiki_parser->note_array, $match[1]).'[/note]';
 }

 function preg_note_callback_restore( $match )
 {
 	global $wiki_parser;

	$lines = preg_split('/'.chr(10).'/', $wiki_parser->note_array[$match[1] - 1]);
	$wiki_parser->note_array[$match[1] - 1] = "";
	
	foreach ( $lines as $line )
	{
		$line = " ".$line;
		$wiki_parser->note_array[$match[1] - 1] .= $line.chr(10); 
	}
	
 	return '<div class="alert alert-warning">'.trim($wiki_parser->note_array[$match[1] - 1], ' '.chr(10)).'</div>';
 } 
 
 function preg_important_callback_store( $match )
 {
 	global $wiki_parser;
 	
 	return '[important]'.array_push($wiki_parser->important_array, $match[1]).'[/important]';
 }
 
 function preg_important_callback_restore( $match )
 {
 	global $wiki_parser;

	$lines = preg_split('/'.chr(10).'/', $wiki_parser->important_array[$match[1] - 1]);
	
	$wiki_parser->important_array[$match[1] - 1] = "";
	
	foreach ( $lines as $line )
	{
		$line = " ".$line;
		$wiki_parser->important_array[$match[1] - 1] .= $line.chr(10); 
	}
	
 	return '<div class="alert alert-error">'.trim($wiki_parser->important_array[$match[1] - 1], ' '.chr(10)).'</div>';
 } 
  

 // PlantUML injection
function encodep($text) { 
     //$data = utf8_encode($text); 
     $compressed = gzdeflate($text, 9); 
     return encode64($compressed); 
} 

function encode6bit($b) { 
     if ($b < 10) { 
          return chr(48 + $b); 
     } 
     $b -= 10; 
     if ($b < 26) { 
          return chr(65 + $b); 
     } 
     $b -= 26; 
     if ($b < 26) { 
          return chr(97 + $b); 
     } 
     $b -= 26; 
     if ($b == 0) { 
          return '-'; 
     } 
     if ($b == 1) { 
          return '_'; 
     } 
     return '?'; 
} 

function append3bytes($b1, $b2, $b3) { 
     $c1 = $b1 >> 2; 
     $c2 = (($b1 & 0x3) << 4) | ($b2 >> 4); 
     $c3 = (($b2 & 0xF) << 2) | ($b3 >> 6); 
     $c4 = $b3 & 0x3F; 
     $r = ""; 
     $r .= encode6bit($c1 & 0x3F); 
     $r .= encode6bit($c2 & 0x3F); 
     $r .= encode6bit($c3 & 0x3F); 
     $r .= encode6bit($c4 & 0x3F); 
     return $r; 
} 

function encode64($c) { 
     $str = ""; 
     $len = strlen($c); 
     for ($i = 0; $i < $len; $i+=3) { 
            if ($i+2==$len) { 
                  $str .= append3bytes(ord(substr($c, $i, 1)), ord(substr($c, $i+1, 1)), 0); 
            } else if ($i+1==$len) { 
                  $str .= append3bytes(ord(substr($c, $i, 1)), 0, 0); 
            } else { 
                  $str .= append3bytes(ord(substr($c, $i, 1)), ord(substr($c, $i+1, 1)), ord(substr($c, $i+2, 1)));
            } 
     } 
     return $str; 
}  

