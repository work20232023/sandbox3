<?php
namespace Devprom\ServiceDeskBundle\Controller;
use FOS\UserBundle\Controller\SecurityController as BaseController;

class SecurityController extends BaseController
{
    protected function renderLogin(array $data) {
        return $this->render('Security/login.html.twig', $data);
    }
}