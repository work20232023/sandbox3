<?php

class ModelIterationFixedFinishDateMapping
{
    public function map($object, &$values)
    {
        $methodology_it = getSession()->getProjectIt()->getMethodologyIt();
        if ( !$methodology_it->HasFixedRelease() ) return;

        if ( $values['StartDate'] != '' )
        {
            $weeks = $methodology_it->get('ReleaseDuration');
            if ($weeks < 1) $weeks = 4;

            $values['FinishDate'] = date('Y-m-j', strtotime('-1 day',
                    strtotime($weeks . ' week', strtotime($values['StartDate'])))
            );
        }
    }
}
