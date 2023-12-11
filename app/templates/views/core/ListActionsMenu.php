<?php
$listActions = [
    'check_visible',
    'all',
    'uncheck'
];
?>

<ul class="dropdown-menu text-left list-action-menu" role="menu" uid="<?=$uid;?>">
    <?foreach ($listActions as $listAction):?>
        <li><a href="javascript:checkRowsActions('<?=$table_id?>', '<?=$listAction;?>');"><?=text('listAction.' . $listAction)?></a></li>
    <?endforeach;?>
</ul>