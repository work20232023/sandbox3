<?php

/**
 * @var ?IteratorBase $objectIt
 */

$uidService = new ObjectUID;
$hasLowSimilarityResults = false;

?>
<?php if (isset($objectIt) && $objectIt->count() > 0) : ?>
    <?php while (!$objectIt->end()) : ?>
        <?php
        $url = $objectIt->getViewUrl();
        $title = $uidService->getUidWithCaption($objectIt);
        $similarity = $objectIt->get('Similarity');
        if ( $similarity < 0.5 ) {
            $objectIt->moveNext();
            continue;
        }
        if (!$hasLowSimilarityResults && $similarity < 0.7) {
            $hasLowSimilarityResults = true;
            echo '<div class="low-similarity-results">';
        }
        ?>
        <p>
            <a href="<?= $url ?>" target="_blank"><?= $title ?></a>
            <span class="label label-info"><?= sprintf(text(3705), round(100 * $similarity)) ?></span>
        </p>
        <?php $objectIt->moveNext(); ?>
    <?php endwhile; ?>
    <?php
    if ($hasLowSimilarityResults) {
        echo '</div>';
        echo '<a class="show-low-similarity-results" href="#">' . text(3706) . '</a>';
    }
    ?>
<?php else : ?>
    <p><?= text(1253) ?></p>
<?php endif; ?>
<script type="text/javascript">
    var $showLowSimilarityResults = $('.show-low-similarity-results');
    $showLowSimilarityResults.each(function (index, element) {
        var $element = $(element);
        var $lowSimilarityResults = $element.parent().find('.low-similarity-results');
        $lowSimilarityResults.hide();
        $element.on('click', function () {
            $element.hide();
            $lowSimilarityResults.show();
        });
    });
</script>
