<?php

namespace App\Controller;

use App\Repository\CategorieRepository;
use App\Repository\HerbergementRepository;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class HomeController extends AbstractController
{
    #[Route('/', name: 'app_home')]
    public function index(HerbergementRepository $repo, CategorieRepository $repoCat):  Response
    {
        $hebergements = $repo->findBy([], ['id' => 'DESC'], 4); 
        $categories = $repoCat->findAll();

        return $this->render('home/index.html.twig', [
            'hebergements' => $hebergements,
            'categories' => $categories
        ]);
      
    }





  
}
