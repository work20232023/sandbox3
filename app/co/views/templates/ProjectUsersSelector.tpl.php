<?=text(2328)?>

<input class="users-search" type="text" placeholder="<?=text(2329)?>">

<div class="users-container">
    <label for="select_all_users">
        <input type="checkbox" id="select_all_users" name="select_all_users"/> &nbsp;
        Выделить всех
    </label>
    <table class="table users-table">
        <tbody>
        <?if ($list) {?>
            <?foreach ($groups as $item) {?>
                <tr>
                    <td>
                        <label for="user-<?=$item['id']?>">
                            <input type="checkbox" id="user-<?=$item['id']?>" name="_user_<?=$item['id']?>"/> &nbsp;
                            <?php
                            echo $view->render('core/UserPictureMini.php', array (
                                'id' => $item['id'],
                                'image' => 'userpics-mini',
                                'class' => 'user-mini'
                            ));
                            ?>
                            <span class="user-title">
                                <?=$item['name']?>
                            </span>
                        </label>
                    </td>
                </tr>
            <? } ?>
        <? } else { ?>
            <? foreach( $groups as $key => $group ) {?>
                <tr>
                    <td>
                        <input type="checkbox" id="group-<?=$key?>" name="_group_<?=$key?>" class = "groupCheckbox" data-group-id = "<?=$key?>"/> &nbsp;
                        <label data-group-id = "<?=$key?>" class = "toggleGroup"><?=$group['name'];?> <span class="caret"></span></label>
                    </td>
                </tr>
                <?foreach ($group['items'] as $item) {?>
                    <tr class = "group<?=$key;?> children">
                        <td>
                            <label for="user-<?=$item['id']?>">
                                <input type="checkbox" id="user-<?=$item['id']?>" name="_user_<?=$item['id']?>"/> &nbsp;
                                <?php
                                echo $view->render('core/UserPictureMini.php', array (
                                    'id' => $item['id'],
                                    'image' => 'userpics-mini',
                                    'class' => 'user-mini'
                                ));
                                ?>
                                <span class="user-title">
                                    <?=$item['name']?>
                                </span>
                            </label>
                        </td>
                    </tr>
                <? } ?>
            <? } ?>
        <? } ?>
        </tbody>
    </table>
</div>

<script type="text/javascript">
    $(document).ready(function() {
        $('input.users-search')
            .on('keyup', function(e) {
                var items = $('.users-table').find('tr');
                items.hide();
                var text = $(this).val();
                var visibleItems = items.filter(function(i, el) {
                    return $(el).text().match(new RegExp(text, "ig"));
                });
                visibleItems.show();
            });

        $('.toggleGroup').on('click', function () {
            $(this).toggleClass('target');
            let groupId = $(this).attr('data-group-id');

            $('.table.users-table').find('.group' + groupId).slideToggle(300);
        });

        $('.groupCheckbox').click(function(){
            let groupId = $(this).attr('data-group-id');

            if ($(this).is(':checked')){
                $('.table.users-table').find('.group' + groupId + ' input:checkbox').prop('checked', true);
            } else {
                $('.table.users-table').find('.group' + groupId + ' input:checkbox').prop('checked', false);
            }
        });

        $('#select_all_users').click(function () {
            if ($(this).is(':checked')){
                $('.users-table').find('input:checkbox').prop('checked', true);
            } else {
                $('.users-table').find('input:checkbox').prop('checked', false);
            }
        });
    });
</script>