<div id="<?= $id ?>"><div class="document-loader"></div></div>

<script type="text/javascript">
    var data = [];
    bindTabHandler('documentationsection', $('#<?= $id ?>'), function() {
        $.get('<?= $url ?>', {}, function(data) {
            $('#<?= $id ?>').html(data);
            completeUIExt($('#<?= $id ?>'));
        });
    });
</script>
