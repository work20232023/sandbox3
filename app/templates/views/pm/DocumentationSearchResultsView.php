<?php

/**
 * @var ?IteratorBase $helpPageIt
 * @var ?IteratorBase $projectPageIt
 */

?>
<?php if (
    isset($helpPageIt) && $helpPageIt->count() > 0
    && isset($projectPageIt) && $projectPageIt->count() > 0
) : ?>
    <?php $accordionId = bin2hex(random_bytes(8)); ?>
    <div class="accordion-wrap">
        <?php if (isset($helpPageIt) && $helpPageIt->count() > 0) : ?>
            <div class="accordion-heading">
                <a class="to-drop-btn" href="#similarProjectPage<?= $accordionId ?>" data-toggle="collapse" tabindex="-1">
                    <span class="caret"></span>
                    <?= text(3703) ?>
                </a>
            </div>
            <div id="similarProjectPage<?= $accordionId ?>" class="accordion-body in collapse">
                <?= $view->render('pm/SearchResultsView.php', ['objectIt' => $helpPageIt]) ?>
            </div>
        <?php endif; ?>

        <?php if (isset($projectPageIt) && $projectPageIt->count() > 0) : ?>
            <div class="accordion-heading">
                <a class="to-drop-btn" href="#similarHelpPage<?= $accordionId ?>" data-toggle="collapse" tabindex="-1">
                    <span class="caret"></span>
                    <?= text(3704) ?>
                </a>
            </div>
            <div id="similarHelpPage<?= $accordionId ?>" class="accordion-body in collapse">
                <?= $view->render('pm/SearchResultsView.php', ['objectIt' => $projectPageIt]) ?>
            </div>
        <?php endif; ?>
    </div>
<?php elseif (isset($helpPageIt) && $helpPageIt->count() > 0) : ?>
    <?= $view->render('pm/SearchResultsView.php', ['objectIt' => $helpPageIt]) ?>
<?php elseif (isset($projectPageIt) && $projectPageIt->count() > 0) : ?>
    <?= $view->render('pm/SearchResultsView.php', ['objectIt' => $projectPageIt]) ?>
<?php else : ?>
    <p><?= text(1253) ?></p>
<?php endif; ?>
