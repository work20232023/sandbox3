<div class="history-user">
    <ul class="breadcrumb hidden-print">
        <li class="page-title">
            <div class="btn-group">
                <div class="btn transparent-btn">
                    <span class="title"><?=$entity_title?> (<?=$object_class?>)</span>
                </div>
            </div>
        </li>
    </ul>

    <div class="accordion-wrap">
        <div class="accordion-heading">
            <a class="to-drop-btn">
                <span class="caret"></span> Attributes details
            </a>
        </div>
        <div class="accordion-body in">

            <table class="table table-bordered">
                <tr>
                    <th>Title</th>
                    <th>System name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Editable</th>
                    <th>Description</th>
                </tr>
                <?php foreach( $attributes as $attribute => $info ) { ?>
                    <tr>
                        <td><?=$info['title']?></td>
                        <td><?=$attribute?></td>
                        <td>
                            <?php
                            if ( count($info['reference']) > 0 ) {
                                if ( $info['reference']['id'] != '' ) {
                                    $script = "$(document).trigger('trackerItemSelected', ['{$info['reference']['id']}', false, 'DocsAPIEntity']);";
                                    echo '<a onclick="'.$script.'">'.$info['reference']['title'].'</a>';
                                }
                                else {
                                    echo $info['reference']['title'];
                                }
                            }
                            else {
                                echo $info['type'];
                            }
                            ?>
                        </td>
                        <td><?=($info['required'] ? translate('Да') : translate('Нет'))?></td>
                        <td><?=($info['editable'] ? translate('Да') : translate('Нет'))?></td>
                        <td width="50%"><?=$info['description']?></td>
                    </tr>
                <?php } ?>
            </table>
        </div>
    </div>

    <div class="accordion-wrap">
        <div class="accordion-heading">
            <a class="to-drop-btn">
                <span class="caret"></span> REST API: getting collection
            </a>
        </div>
        <div class="accordion-body in">
            <code class="hljs hljs-code language-bash">curl -X GET -H "Devprom-Auth-Key: <?=$api_key?>" \
    -H "Content-Type:application/json" <a href="<?=$get_url?>"><?=$get_url?></a></code>

            <br/>
            <p>Available filters as query parameters</p>
            <table class="table table-bordered">
                <tr><td>limit</td><td>per page limit of records</td></tr>
                <tr><td>page</td><td>page number</td></tr>
                <tr><td>extended</td><td>expand references to entities data</td></tr>
                <tr><td>in</td><td>get records using given ids, e.g. issues?in=1,2,3</td></tr>
                <tr><td>state</td><td>get records with given state, e.g. issues?state=planned</td></tr>
                <tr><td>output</td><td>output format of WYSIWYG fields: html (by default), text - all tags will be removed</td></tr>
            </table>
        </div>
    </div>

    <div class="accordion-wrap">
        <div class="accordion-heading">
            <a class="to-drop-btn">
                <span class="caret"></span> REST API: reading record
            </a>
        </div>
        <div class="accordion-body in">
            <code class="hljs hljs-code language-bash">curl -X GET -H "Devprom-Auth-Key: <?=$api_key?>>" \
    -H "Content-Type:application/json" <a href="<?=$put_url?>"><?=$put_url?></a></code>

            <h6>Response example</h6>
            <?php
                $field_example_json->render($view);
            ?>
            <br/>

        </div>
    </div>

    <div class="accordion-wrap">
        <div class="accordion-heading">
            <a class="to-drop-btn">
                <span class="caret"></span> REST API: creating record
            </a>
        </div>
        <div class="accordion-body in">
            <code class="hljs hljs-code language-bash">curl -X POST -H "Devprom-Auth-Key: <?=$api_key?>>" \
    -H "Content-Type:application/json" <a href="<?=$get_url?>"><?=$get_url?></a></code>

            <br/>
            JSON representation will be returned as result
            <br/>
            <br/>
        </div>
    </div>

    <div class="accordion-wrap">
        <div class="accordion-heading">
            <a class="to-drop-btn">
                <span class="caret"></span> REST API: updating record
            </a>
        </div>
        <div class="accordion-body in">
            <code class="hljs hljs-code language-bash">curl -X PUT -H "Devprom-Auth-Key: <?=$api_key?>>" \
    -H "Content-Type:application/json" <a href="<?=$put_url?>"><?=$put_url?></a></code>

            <br/>
            JSON representation will be returned as result
            <br/>
            <br/>
        </div>
    </div>

    <div class="accordion-wrap">
        <div class="accordion-heading">
            <a class="to-drop-btn">
                <span class="caret"></span> REST API: deleting record
            </a>
        </div>
        <div class="accordion-body in">
            <code class="hljs hljs-code language-bash">curl -X DELETE -H "Devprom-Auth-Key: <?=$api_key?>>" \
    -H "Content-Type:application/json" <a href="<?=$put_url?>"><?=$put_url?></a></code>
        </div>
        <br/>
        <br/>
    </div>

    <div class="accordion-wrap">
        <div class="accordion-heading">
            <a class="to-drop-btn">
                <span class="caret"></span> Database structure
            </a>
        </div>
        <div class="accordion-body in">
            <code class="hljs hljs-code language-sql"><?=$sql_table?></code>

            <br/>
            <br/>
        </div>
    </div>

    <div class="accordion-wrap">
        <div class="accordion-heading">
            <a class="to-drop-btn">
                <span class="caret"></span> Object model
            </a>
        </div>
        <div class="accordion-body in">
            <img src="<?=$plant_uml?>">

            <br/>
            <br/>
        </div>
    </div>

    <div class="accordion-wrap">
        <div class="accordion-heading">
            <a class="to-drop-btn">
                <span class="caret"></span> Scripts usage example
            </a>
        </div>
        <div class="accordion-body in">
            <code class="hljs hljs-code language-php">// Создать экземпляр объекта, в результате возвращается итератор по объекту
$objectIt = getFactory()->createEntity(
    getFactory()->getObject('<?=$object_class?>'),
    array (
        'Caption' => 'Название объекта'
    )
);

// Прочитать данные объекта с ИД = 1
$objectIt = getFactory()->getObject('<?=$object_class?>')->getExact(1);
var_dump($objectIt->get('Caption'));

// Получить ссылку на связанный объект
$referenceIt = $objectIt->getRef('Priority');

// Найти объекты по заданному атрибуту, отсортировать по названию
$objectIt = getFactory()->getObject('<?=$object_class?>')->getRegistry()->Query(
    array(
        new FilterAttributePredicate('Caption', 'Название'),
        new SortAttributeClause('Caption.A')
    )
);
var_dump($objectIt->count());

// Изменить объект по ИД = 1
$objectIt = getFactory()->getObject('<?=$object_class?>')->getExact(1);
$modifiedObjectIt = getFactory()->modifyEntity( $objectIt,
    array (
        'Caption' => 'Название объекта'
    )
);
var_dump($modifiedObjectIt->get('Caption'));</code>
            <br/>
            <br/>
            <br/>
            <br/>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function() {
        $('code.hljs-code').each(function(i, e) {hljs.highlightBlock(e)});
    });
</script>