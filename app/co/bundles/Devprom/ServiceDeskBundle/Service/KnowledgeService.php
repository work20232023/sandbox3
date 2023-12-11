<?php

namespace Devprom\ServiceDeskBundle\Service;
include_once SERVER_ROOT_PATH."ext/locale/LinguaStemRu.php";

use Devprom\ServiceDeskBundle\Entity\KnowledgeBase;
use Doctrine\ORM\EntityManager;
use Doctrine\ORM\Query\ResultSetMappingBuilder;
use FOS\UserBundle\Model\UserInterface;

class KnowledgeService
{
    /** @var  EntityManager */
    private $em;
    private $tokenStorage;

    public function __construct($em, $tokenStorage)
    {
        $this->em = $em;
        $this->tokenStorage = $tokenStorage;
    }

    /** @return KnowledgeBase[] */
    public function getThemes(array $vpds): array
    {
        $restricted = $this->restrictedArticles($vpds);
        $repository = $this->em->getRepository('DevpromServiceDeskBundle:KnowledgeBase');
        return $repository->createQueryBuilder('t')
            ->where('t.parent IN (:parents) AND t.id NOT IN (:restricted)')
            ->setParameter('parents', $this->getRoots($vpds))
            ->setParameter('restricted', $restricted)
            ->orderBy('t.sortIndex')
            ->getQuery()
            ->getResult();
    }

    /** @return KnowledgeBase[] */
    public function getArticles(array $vpds): array
    {
        $themes = $this->getThemes($vpds);
        return $this->getAllChildren($themes);
    }

    /**
     * @param KnowledgeBase|KnowledgeBase[] $parents
     * @return KnowledgeBase[]
     */
    public function getAllChildren($parents): array
    {
        $articles = [];
        $currentLevelArticles = $parents;

        do {
            $articles[] = $currentLevelArticles = $this->getDirectChildren($currentLevelArticles);
        } while (!empty($currentLevelArticles));

        return array_merge(...$articles);
    }

    /**
     * @param KnowledgeBase|KnowledgeBase[] $parents
     * @return KnowledgeBase[]
     */
    public function getDirectChildren($parents): array
    {
        $parents = is_array($parents) ? $parents : [$parents];
        $repository = $this->em->getRepository('DevpromServiceDeskBundle:KnowledgeBase');
        return $repository->findBy(['parent' => $parents], ['sortIndex' => 'ASC']);
    }

    public function getHierarchy(array $articles): array
    {
        $hierarchy = [];

        // Create node for each article
        foreach ($articles as $article) {
            $articleId = $article->getId();
            $hierarchy[$articleId] = [
                'article' => $article,
                'children' => [],
            ];
        }

        // Try find parent for each node and set a reference to the child
        $articleWithParentIds = [];
        foreach ($articles as $article) {
            $parent = $article->getParent();
            if (!isset($parent)) {
                continue;
            }

            $parentId = $parent->getId();
            if (!isset($hierarchy[$parentId])) {
                continue;
            }

            $articleId = $article->getId();
            $hierarchy[$parentId]['children'][] = &$hierarchy[$articleId];
            $articleWithParentIds[] = $articleId;
        }

        // Remove parented nodes at the top level
        foreach ($articleWithParentIds as $articleId) {
            unset($hierarchy[$articleId]);
        }

        return $hierarchy;
    }

    /** @return KnowledgeBase[] */
    public function getRoots($vpds): array
    {
        $restricted = $this->restrictedArticles($vpds);
        $repository = $this->em->getRepository('DevpromServiceDeskBundle:KnowledgeBase');

        return $repository->createQueryBuilder('t')
            ->where(
                '
                t.vpd IN (:vpdarray) AND t.parent IS NULL AND t.referenceName = 1
                AND EXISTS (SELECT 1 FROM \Devprom\ServiceDeskBundle\Entity\KnowledgeBase c
                             WHERE c.parent = t.id AND c.id NOT IN (:restricted))
                AND EXISTS (SELECT 1 FROM \Devprom\ServiceDeskBundle\Entity\Project p
                             WHERE p.vpd = t.vpd AND COALESCE(p.knowledgeBaseServiceDesk,\'N\') = \'Y\') '
            )
            ->setParameter('vpdarray', $vpds)
            ->setParameter('restricted', $restricted)
            ->getQuery()
            ->getResult();
    }

    function searchArticles( $themes, $query, $locale = 'en' )
    {
        $searchItems = \SearchRules::getSearchItems(\DAL::Instance()->Escape($query), $locale);
        $anyWords = array_map(
            function($word) {
                return $word.'*';
            },
            $searchItems
        );
        $allWords = array_map(
            function($word) {
                return '+'.$word;
            },
            $anyWords
        );

        $rsm = new ResultSetMappingBuilder($this->em);
        $rsm->addRootEntityFromClassMetadata('\Devprom\ServiceDeskBundle\Entity\KnowledgeBase', 'e');
        $sql = "
                SELECT " . $rsm->generateSelectClause(array('e' => 't')) . "
                  FROM WikiPage t
                 WHERE t.ParentPage IN (:themes)
                   AND t.ReferenceName = 1
                   AND EXISTS (
                          SELECT 1 FROM pm_Searchable s 
                           WHERE s.ObjectId = t.WikiPageId 
                             AND s.ObjectClass = 'ProjectPage'
                             AND MATCH (s.SearchContent) AGAINST (:search IN BOOLEAN MODE))
                   AND NOT EXISTS (SELECT 1 FROM pm_ObjectAccess a, pm_ProjectRole r
                                    WHERE INSTR(t.ParentPath, CONCAT(',',a.ObjectId,',')) > 0
                                      AND a.ProjectRole = r.pm_ProjectRoleId
                                      AND a.ObjectClass = 'projectpage' AND a.AccessType = 'none'
                                      AND r.ReferenceName = 'guest')
            ";

        $items = $this->em->createNativeQuery($sql, $rsm)
            ->setParameter('themes', $themes)
            ->setParameter('search', join(' ',$allWords))
            ->getResult();

        if ( count($items) < 1 ) {
            $items = $this->em->createNativeQuery($sql, $rsm)
                ->setParameter('themes', $themes)
                ->setParameter('search', join(' ',$anyWords))
                ->setParameter('regexp', join('|',$searchItems))
                ->getResult();
        }

        return $items;
    }

    function restrictedArticles( $vpds )
    {
        $rsm = new ResultSetMappingBuilder($this->em);
        $rsm->addRootEntityFromClassMetadata('\Devprom\ServiceDeskBundle\Entity\KnowledgeBase', 'e');
        $sql = "
                SELECT " . $rsm->generateSelectClause(array('e' => 't')) . "
                  FROM WikiPage t
                 WHERE t.VPD IN (:vpds)
                   AND t.ReferenceName = 1
                   AND EXISTS (SELECT 1 FROM pm_ObjectAccess a, pm_ProjectRole r
                                WHERE INSTR(t.ParentPath, CONCAT(',',a.ObjectId,',')) > 0
                                  AND a.ProjectRole = r.pm_ProjectRoleId
                                  AND a.ObjectClass = 'projectpage' AND a.AccessType = 'none'
                                  AND r.ReferenceName = 'guest')
            ";
        $result = $this->em->createNativeQuery($sql, $rsm)
            ->setParameter('vpds', $vpds)
            ->getResult();
        if ( count($result) < 1 ) return array(0);
        return $result;
    }

    /**
     * @param $attachmentId
     * @return KnowledgeBaseAttachment
     */
    public function getAttachmentById($attachmentId) {
        return $this->em->getRepository("DevpromServiceDeskBundle:KnowledgeBaseAttachment")->find($attachmentId);
    }
}
