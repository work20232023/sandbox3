<?php

namespace Devprom\ServiceDeskBundle\Controller;

use Devprom\ServiceDeskBundle\Entity\KnowledgeBase;
use Devprom\ServiceDeskBundle\Service\KnowledgeService;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;

/**
 * @Route("/")
 */
class KnowledgeController extends Controller
{
    /**
     * @Route("/", name="docs_list")
     * @Method("GET")
     * @Template("DevpromServiceDeskBundle:Knowledge:index.html.twig")
     */
    public function indexAction(Request $request)
    {
        /** @var KnowledgeService $service */
        $service = $this->get('knowledge_service');
        $vpds = $this->getProjectVpds();

        $themes = $service->getThemes($vpds);
        if (count($themes) < 1) {
            return $this->redirect($this->generateUrl('issue_list'));
        }

        $articles = $service->getArticles($vpds);
        foreach ($themes as $theme) {
            $found = array_filter($articles, static function ($value) use ($theme) {
                return $value->getParent() == $theme;
            });
            $theme->setSingle(count($found) < 1);
        }

        return [
            'roots' => $service->getRoots($vpds),
            'themes' => $themes,
            'hierarchy' => $service->getHierarchy(array_merge($themes, $articles)),
        ];
    }

    /**
     * @Route("/docs/{article}", name="docs_article", requirements={"article"=".+"})
     * @Method("GET")
     * @Template("DevpromServiceDeskBundle:Knowledge:show.html.twig")
     */
    public function showAction($article)
    {
        /** @var KnowledgeService $service */
        $service = $this->get('knowledge_service');
        $article = html_entity_decode($article);
        $articles = $service->getArticles($this->getProjectVpds());
        if (count($articles) < 1) {
            return $this->redirect($this->generateUrl('issue_list'));
        }

        $vpds = $this->getProjectVpds();
        $roots = $service->getRoots($vpds);
        $themes = $service->getThemes($vpds);
        $rootIds = array_map(static function ($root) { return $root->getId(); }, $roots);
        $themeIds = array_map(static function ($theme) { return $theme->getId(); }, $themes);

        foreach ($articles as $articleEntity) {
            if (stripslashes(html_entity_decode($articleEntity->getName())) !== $article) {
                continue;
            }

            $parents = [];
            $theme = null;
            $root = null;

            $parent = $articleEntity;
            while (($parent = $parent->getParent()) !== null) {
                if (in_array($parent->getId(), $rootIds)) {
                    $root = $parent;
                } elseif (in_array($parent->getId(), $themeIds)) {
                    $theme = $parent;
                } else {
                    $parents[] = $parent;
                }
            }

            $parent = $articleEntity->getParent();
            $articles = isset($parent) ? $service->getAllChildren($parent) : $service->getAllChildren($articleEntity);

            return [
                'root' => $root,
                'theme' => $theme,
                'parents' => array_reverse($parents),
                'article' => $articleEntity,
                'hierarchy' => $service->getHierarchy($articles),
            ];
        }

        return $this->redirect($this->generateUrl('docs_list'));
    }

    /**
     * @Route("/articles", name="docs_search")
     * @Method("GET")
     * @Template("DevpromServiceDeskBundle:Knowledge:search.html.twig")
     */
    public function searchAction( Request $request )
    {
        $searchQuery = $request->get('q');
        if ( $searchQuery == '' ) {
            return $this->redirect($this->generateUrl('docs_list'));
        }

        $service = $this->get('knowledge_service');
        $themes = $service->getThemes($this->getProjectVpds());
        $articles = $service->searchArticles($themes, $searchQuery, $request->getLocale());

        if ( count($articles) < 1 ) {
            return $this->redirect($this->generateUrl('docs_list'));
        }
        if ( count($articles) == 1 ) {
            return $this->redirect($this->generateUrl('docs_article', array('article' => $articles[0]->getName())));
        }

        return array(
            'query' => $searchQuery,
            'articles' => $articles
        );
    }

    protected function getProjectVpds()
    {
        $customer_vpds = array();
        if ( is_object($this->getUser()) ) {
            if ( $this->getUser()->getCompany() ) {
                foreach($this->getUser()->getCompany()->getProjects() as $project_ref) {
                    $customer_vpds[] = $project_ref->getProject()->getVpd();
                }
            }
            if ( count($customer_vpds) < 1 ) {
                $customer_vpds = $this->container->getParameter('commonProjectVpds');
            }
        }
        return array_merge( $customer_vpds,
            $this->container->getParameter('publicKBProjectVpds')
        );
    }
}
