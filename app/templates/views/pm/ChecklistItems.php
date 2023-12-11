<div class='btn-group ChecklistWrapper <?=($required ? 'required' : '')?>'>
    <?php
        foreach($items as $key => $item) {
            $isCheck = ($item['value'] === 'on');   
    ?>
        <div class="form-list">
            <?php if($isCheck) {echo "<strike>";} ?>

                <label class="checkbox" name="checklist-label">
                    <input 
                        action-data="<?php if (!$editMode) {echo $item['action'];} ?>" 
                        type='checkbox' 
                        name="<? echo $key;?>"
                        <?=($isCheck ? ' checked' : '')?> >
                    <?php echo trim($item['name']); ?>
                </lable>

            <?php if($isCheck) {echo "</strike>";} ?>
        </div>

        <?php if ( $editMode ) { ?>
            <input type="hidden" name="<?=$attribute?>-form" value="-">
        <?php } ?>
    <?php } ?>

    <?php if(null !== $actionForAll) {?>
        <input id="actionForFullChecklist" type="hidden" data="<?php echo $actionForAll; ?>">
    <?php  } ?>
</div>

<script type="text/javascript">
    $('label[name="checklist-label"]').children().change(function(event) {
        var method = $(this).attr('action-data');
        if ( method != '' ) {
            eval(method);
        }
        if ($(this).is(':checked')) {
            $(this).parent().wrap('<strike></strike>');
        } else {
            $(this).parent().unwrap();
        }
    });
</script>