<?php

class SimilaritySort extends SortClauseBase
{
    public function clause()
    {
        return " Similarity DESC ";
    }
}
