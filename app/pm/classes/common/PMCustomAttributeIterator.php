<?php

class PMCustomAttributeIterator extends CacheableIterator
{
 	public function toReferenceNames(): array
 	{
 		$names = [];

 		while (!$this->end()) {
 			$names[] = $this->get('ReferenceName'); 
 			$this->moveNext();
 		}

 		return $names;
 	}

 	public function toDictionary(): array
 	{
 		$lov = [];

 		foreach(preg_split('/\n\r?/', $this->get('ValueRange')) as $line) {
 			if (empty(trim($line))) {
                continue;
            }

 			$parts = preg_split('/:/', $line );
 			$lov[trim($parts[0], ' '.chr(10))] = html_entity_decode(trim($parts[1]));
 		}

 		return $lov;
 	}

 	public function getEntityDisplayName() 
    {
 		return $this->object->getEntityDisplayName(
            $this->get('EntityReferenceName'), $this->get('ObjectKind')
        );
 	}

	public function getDbType(): string
    {
        $db_type = $this->getRef(PMCustomAttribute::ATTRIBUTE_TYPE)->getDbType(
            $this->getHtmlDecoded(PMCustomAttribute::DEFAULT_VALUE)
        );

        if (empty($db_type)) {
            $db_type = 'VARCHAR';
        }

        if ($db_type === 'reference') {
            return "REF_" . $this->get('AttributeTypeClassName') . "Id";
        }

        return $db_type;
    }

    public function getGroups(): array
    {
        $groups         = ['permissions'];
        $type_it        = $this->getRef(PMCustomAttribute::ATTRIBUTE_TYPE);
        $referenceName  = $type_it->get(PMCustomAttribute::REFERENCE_NAME);

        switch($referenceName) {
            case PMCustomAttribute::KEY_DICTIONARY:
            case PMCustomAttribute::KEY_COMPUTED:
            case PMCustomAttribute::KEY_CHECKLIST:
                $groups[] = $referenceName;
        }

        if ($this->get('IsMultiple') == 'Y') {
            $groups[] = 'multiselect';
        }

        if ($this->get('IsNotificationVisible') == 'N') {
            $groups[] = 'skip-notification';
        }

        foreach(\TextUtils::parseItems($this->get('Groups')) as $group) {
            if (preg_match('/[0-9a-z\-_]+/i', $group)) {
                $groups[] = $group;
            }
        }

        if ($this->get('ShowMainTab') != 'Y' && !in_array('trace', $groups)) {
            $groups[] = 'additional';
        }
        
        return $groups;
    }
}