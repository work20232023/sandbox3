<?php
include_once "IteratorExport.php";

class IteratorExportHtml extends IteratorExport
{
    function get( $fieldName )
    {
        $attribute_type = $this->getIterator()->object->getAttributeDbType( $fieldName );

        if ( $attribute_type == 'wysiwyg' ) {
            return $this->getIterator()->getHtmlDecoded( $fieldName );
        }

        if( $this->getIterator()->object->IsReference($fieldName) )
        {
            $entity_it = $this->getIterator()->getRef($fieldName);
            $names = array();
            while( !$entity_it->end() ) {
                $names[] = $this->getUidService()->getUidWithCaption($entity_it);
                $entity_it->moveNext();
            }
            return $names;
        }
        else {
            return parent::get( $fieldName );
        }
    }

    function buildHtml( $tableClass = 'printable' )
    {
        $uid = new ObjectUID;

        $fields = $this->getFields();

        $keys = array_keys($fields);

        $result = '<!DOCTYPE html><html><head><meta charset="UTF-8"></head>';
        $result .= '<body style="background:white;"><table class="table table-bordered '.$tableClass.'"><tr>';

        foreach ( $fields as $key => $field )
        {
            $result .= '<th class="">'.$field.'</th>';
        }
        $result .= '</tr>';

        $it = $this->getIterator();
        $parser = WikiEditorBuilder::build()->getHtmlParser();

        while( !$it->end() )
        {
            $result .= '<tr>';

            for ( $j = 0; $j < count($keys); $j++ )
            {
                $width = '';
                switch ( $keys[$j] )
                {
                    case 'UID':
                        $info = $uid->getUIDInfo($it->getCurrentIt());
                        $text = $info['uid'];
                        $width = ' width="80" ';
                        break;

                    default:
                        $value = $this->get($keys[$j]);
                        if ( is_array($value) ) {
                            $text = join('<br/>', $value);
                        }
                        else {
                            $attribute_type = $it->object->getAttributeDbType( $keys[$j] );
                            switch( $attribute_type ) {
                                case 'wysiwyg':
                                    $parser->setObjectIt($it->getCurrentIt());
                                    $text = $parser->parse($value);
                                    break;
                                default:
                                    $text = htmlentities($value);
                            }
                        }
                }

                $result .= '<td '.$width.'>'.$text.'</td>';
            }

            $result .= '</tr>';

            $it->moveNext();
        }

        $result .= '</table></body></html>';

        $htmldoc = new \InlineStyle\InlineStyle($result);
        $htmldoc->applyStylesheet(array(
            file_get_contents(SERVER_ROOT_PATH.'styles/bootstrap/css/bootstrap.css'),
            file_get_contents(SERVER_ROOT_PATH.'styles/newlook/main.css'),
            file_get_contents(SERVER_ROOT_PATH.'styles/newlook/extended.css')
        ));
        return $htmldoc->getHTML();
    }

	function export()
	{
	 	header("Expires: Thu, 1 Jan 1970 00:00:00 GMT"); // Date in the past
		header("Last-Modified: " . gmdate("D, d M Y H:i:s") . " GMT"); // always modified
		header("Cache-control: no-store");
		header('Content-Type: text/html; charset='.APP_ENCODING);

        if ( defined('UI_EXTENSION') && !UI_EXTENSION ) {
        }
        else {
            header(EnvironmentSettings::getDownloadHeader($this->getName().'.html'));
        }

 		echo $this->buildHtml();
 	}
}