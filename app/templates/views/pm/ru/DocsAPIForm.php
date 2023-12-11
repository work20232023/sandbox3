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
                <span class="caret"></span> Описание атрибутов
            </a>
        </div>
        <div class="accordion-body in">

            <table class="table table-bordered">
                <tr>
                    <th>Название</th>
                    <th>Системное имя</th>
                    <th>Тип</th>
                    <th>Обязательный</th>
                    <th>Редактируемый</th>
                    <th>Описание</th>
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
                <span class="caret"></span> REST API: получение коллекции
            </a>
        </div>
        <div class="accordion-body in">
            <code class="hljs hljs-code language-bash">curl -X GET -H "Devprom-Auth-Key: <?=$api_key?>" \
    -H "Content-Type:application/json" <a href="<?=$get_url?>"><?=$get_url?></a></code>

            <br/>
            <p>Возможные фильтры, передаются в строке запроса</p>
            <table class="table table-bordered">
                <tr><td>limit</td><td>количество записей в одной странице при постраничном выводе</td></tr>
                <tr><td>page</td><td>номер страницы, при использовании постраничного вывода данных (limit)</td></tr>
                <tr><td>extended</td><td>преобразовать ссылки в json-объекты, например, чтобы узнать Email автора пожелания</td></tr>
                <tr><td>updatedAfter</td><td>получить записи измененные после updatedAfter (формат: YYYY-MM-DD HH:MM:SS, временная зона UTC+0)</td></tr>
                <tr><td>updatedBefore</td><td>получить записи измененные до updatedBefore (формат: YYYY-MM-DD HH:MM:SS, временная зона UTC+0)</td></tr>
                <tr><td>createdAfter</td><td>получить записи созданные после createdAfter (формат: YYYY-MM-DD HH:MM:SS, временная зона UTC+0)</td></tr>
                <tr><td>createdBefore</td><td>получить записи созданные до createdBefore (формат: YYYY-MM-DD HH:MM:SS, временная зона UTC+0)</td></tr>
                <tr><td>in</td><td>получить записи с идентификаторами, перечисленными через запятую, например, issues?in=1,2,3</td></tr>
                <tr><td>state</td><td>получить записи со статусами, системные имена которых перечислены через запятую, например, issues?state=planned</td></tr>
                <tr><td>output</td><td>формат данных, хранимых в атрибутах типа WYSIWYG: html (по умолчанию), text - удаляются все HTML-теги</td></tr>
            </table>
        </div>
    </div>

    <div class="accordion-wrap">
        <div class="accordion-heading">
            <a class="to-drop-btn">
                <span class="caret"></span> REST API: чтение элемента
            </a>
        </div>
        <div class="accordion-body in">
            <code class="hljs hljs-code language-bash">curl -X GET -H "Devprom-Auth-Key: <?=$api_key?>>" \
    -H "Content-Type:application/json" <a href="<?=$put_url?>"><?=$put_url?></a></code>

            <h6>Пример ответа</h6>
            <?php
                $field_example_json->render($view);
            ?>
            <br/>

        </div>
    </div>

    <div class="accordion-wrap">
        <div class="accordion-heading">
            <a class="to-drop-btn">
                <span class="caret"></span> REST API: создание элемента
            </a>
        </div>
        <div class="accordion-body in">
            <code class="hljs hljs-code language-bash">curl -X POST -H "Devprom-Auth-Key: <?=$api_key?>>" \
    -H "Content-Type:application/json" <a href="<?=$get_url?>"><?=$get_url?></a></code>

            <br/>
            В результате успешного выполнения запроса будет возвращен созданный элемент
            <br/>
            <br/>
        </div>
    </div>

    <div class="accordion-wrap">
        <div class="accordion-heading">
            <a class="to-drop-btn">
                <span class="caret"></span> REST API: обновление элемента
            </a>
        </div>
        <div class="accordion-body in">
            <code class="hljs hljs-code language-bash">curl -X PUT -H "Devprom-Auth-Key: <?=$api_key?>>" \
    -H "Content-Type:application/json" <a href="<?=$put_url?>"><?=$put_url?></a></code>

            <br/>
            В результате успешного выполнения запроса будет возвращен обновленный элемент
            <br/>
            <br/>
        </div>
    </div>

    <div class="accordion-wrap">
        <div class="accordion-heading">
            <a class="to-drop-btn">
                <span class="caret"></span> REST API: удаление элемента
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
                <span class="caret"></span> Структура данных в СУБД
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
                <span class="caret"></span> Объектная модель
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
                <span class="caret"></span> Примеры использования в скриптах
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