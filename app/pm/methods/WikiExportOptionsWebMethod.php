<?php
include_once SERVER_ROOT_PATH.'pm/methods/WikiExportBaseWebMethod.php';

class WikiExportOptionsWebMethod extends WikiExportBaseWebMethod
{
    function url($page_it = null, $class, $parameters = array(), $title = '', $baseline = '', $compare = '')
    {
        $parms = array(
            get_class($this),
            "class=" . $class,
            "entity=" . strtolower(get_class($page_it->object)),
            'objects=%ids%',
            'baseline=' . $baseline,
            'compare=' . $compare,
            'ExportTemplate'
        );

        $parms = array_merge($parms, array_keys(array_merge($this->getOptions(), $parameters)));

        return "javascript:processBulk('" . translate('Экспорт') . ': ' . $title . "','?formonly=true&operation=Method:" . join(":", $parms) . "', '" . (is_object($page_it) ? $page_it->getId() : '%ids%') . "', '');";
    }

    function getOptions()
    {
        return [];
    }

    function execute_request()
    {
        ob_start();
        parent::execute_request();
        $url = ob_get_contents();
        ob_end_clean();

        $options = array();
        if ( $_REQUEST['ExportTemplate'] != '' ) {
            $template_it = getFactory()->getObject('ExportTemplate')->getExact($_REQUEST['ExportTemplate']);
            if ( $template_it->getId() > 0 ) {
                $options = explode('-', $template_it->getHtmlDecoded('Options'));
                $options[] = 'template='.$template_it->getId();
            }
        }

        $converterEntity = new WikiConverter(getFactory()->getObject($_REQUEST['object']));
        $converterIt = $converterEntity->getAll();
        $converterIt->moveTo('EngineClassName', $_REQUEST['class']);

        $data = array();
        foreach( array_merge($converterIt->get('EngineParameters'), $this->getOptions()) as $requestKey => $optionName ) {
            $data[$requestKey] = $_REQUEST[$requestKey];
            if ( in_array($_REQUEST[$requestKey], array('Y','on')) ) {
                $options[] = $optionName;
            }
            else {
                foreach( $options as $key => $option ) {
                    if ( $option == $optionName ) {
                        unset($options[$key]);
                    }
                }
            }
        }

        if ( $_REQUEST['baseline'] != '' ) {
            $options[] = 'baseline,'.$_REQUEST['baseline'];
        }
        if ( $_REQUEST['compare'] != '' ) {
            $options[] = 'compare,'.$_REQUEST['compare'];
        }

        if ( file_exists($_FILES['File']['tmp_name']) ) {
            $template_it = getFactory()->getObject('ExportTemplate')->
                                getRegistry()->Create(
                                    array (
                                        'Caption' => array_shift(explode('.',$_FILES['File']['name'])),
                                        'Options' => join('-',$options)
                                    )
                                );
            $options[] = 'template='.$template_it->getId();
        }

        if (!empty($_REQUEST['Mapping'])) {
            $mappingIt = getFactory()->getObject('Mapping')->getExact($_REQUEST['Mapping']);
            if ($mappingIt->getId() > 0) {
                $options[] = 'mapping=' . $mappingIt->getId();
            }
        }

        $url = '?' . $url . '&' . http_build_query(
            array_merge(
                array(
                    'options' => join('-',$options)
                ),
                $data
            )
        );

        $this->redirect($url);
    }
}
