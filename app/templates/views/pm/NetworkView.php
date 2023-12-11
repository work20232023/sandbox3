<link rel="stylesheet" href="/scripts/vis/vis.min.css?v=<?=$_SERVER['APP_VERSION']?>" />
<script src="/scripts/vis/vis.min.js?v=<?=$_SERVER['APP_VERSION']?>" type="text/javascript" charset="UTF-8"></script>

<div id="<?=$id?>"><div class="document-loader"></div></div>

<script type="text/javascript">
    var data = [];
    <?php
        echo $view->render('pm/NetworkBody.php', array(
            'networkUrl' => $networkUrl,
            'id' => $id
        ));
    ?>
</script>
