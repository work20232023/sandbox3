<?php

class ParticipantRoleIterator extends OrderedIterator
{
     function getDisplayName()
     {
         return $this->getRef('ProjectRole')->getDisplayName();
     }
}
