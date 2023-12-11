<?php

class PMFormEmbedded extends FormEmbedded
{
    var $customtypes;

    function __construct( $object = null, $anchor_field = null, $form_field = '' )
    {
        $this->customtypes = array();
        $this->customkinds = array();

        if ( is_object($object) ) {
            $it = getFactory()->getObject('pm_CustomAttribute')->getByEntity($object);
            while ( !$it->end() ) {
                $this->customtypes[$it->get('ReferenceName')] = $it->getRef('AttributeType')->get('ReferenceName');
                $it->moveNext();
            }
        }

        parent::__construct( $object, $anchor_field, $form_field );
    }

    function extendModel()
    {
        parent::extendModel();

        $objectIt = $this->getObjectIt();
        $discriminatorField = array_shift(
            $this->getObject()->getAttributesByGroup('customattribute-descriptor'));

        if ( is_object($objectIt) && $objectIt->get($discriminatorField) != '' )
        {
            $it = getFactory()->getObject('pm_CustomAttribute')->getByEntity($this->getObject());
            while ( !$it->end() ) {
                if ( $it->get('ObjectKind') != '' ) {
                    $this->getObject()->setAttributeVisible(
                            $it->get('ReferenceName'),
                            $it->get('ObjectKind') == $objectIt->getRef($discriminatorField)->get('ReferenceName')
                    );
                }
                $it->moveNext();
            }
        }
    }

    function createField( $attr )
    {
        switch ( $attr )
        {
            default:
                foreach ( $this->customtypes as $refname => $type ) {
                    if ( $attr == $refname && $type == 'dictionary' ) {
                        return new FieldCustomDictionary( $this->getObject(), $refname );
                    }
                }
                if ( $this->getObject()->getAttributeType($attr) == 'wysiwyg') {
                    $field = new FieldWYSIWYG();

                    $object_it = $this->getObjectIt();
                    is_object($object_it) ? $field->setObjectIt($object_it)
                            : $field->setObject($this->getObject());

                    $editor = $field->getEditor();
                    $editor->setMode( WIKI_MODE_MINIMAL | WIKI_MODE_INLINE );
                    $editor->setMinRows(5);
                    $field->setHasBorder(true);

                    return $field;
                }
                return parent::createField( $attr );
        }
    }

    function getListItemsTitle() {
        return text(1936);
    }

    function drawAddButton( $view, $tabindex )
    {
        parent::drawAddButton( $view, $tabindex );

        if( $this->getIteratorRef()->count() > 0 )
        {
            $target = defined('SKIP_TARGET_BLANK') && SKIP_TARGET_BLANK ? '' : '_blank';
            $url = $this->getListUrl();

            if ( $url != '' ) {
                echo '<a class="dashed embedded-add-button items-list" target="'.$target.'" href="'.$url.'" tabindex="-1">';
                    echo $this->getListItemsTitle();
                echo '</a>';
            }
        }

        ?>
        <script type="text/javascript">
            function initializeEmbedded<?=$this->getFormId()?>() {
            <?php
                $discriminatorField = array_shift(
                    $this->getObject()->getAttributesByGroup('customattribute-descriptor'));

                if ( $discriminatorField != '' )
                {
                    $kinds = [];
                    $it = getFactory()->getObject('pm_CustomAttribute')->getByEntity($this->getObject());
                    while ( !$it->end() ) {
                        if ( $it->get('ObjectKind') != '' ) {
                            $kinds[$it->get('ReferenceName') . $this->getFormId()] = $it->get('ObjectKind');
                        }
                        $it->moveNext();
                    }
                    if ( count($kinds) > 0 ) {
                        ?>
                            completeUICustomFields(
                                'embeddedForm<?=$this->getFormId()?>',
                                '*[name=\'<?=($this->getPrefix() . $discriminatorField)?>\']',
                                <?=json_encode(array_keys($kinds))?>,
                                <?=json_encode(array_values($kinds))?>
                            );
                        <?php
                    }
                }
            ?>
            }
       </script>
        <?php
    }

    function getListUrl()
    {
        $object = $this->getIteratorRef()->object;
        $ids = $this->getIteratorRef()->idsToArray();

        return WidgetUrlBuilder::Instance()
                    ->buildWidgetUrlIds(get_class($object), $ids, 'ids');
    }
}