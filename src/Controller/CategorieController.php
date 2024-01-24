<?php

namespace App\Controller;

use App\Entity\Categorie;
use App\Form\CategorieType;
use App\Repository\CategorieRepository;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\String\Slugger\SluggerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class CategorieController extends AbstractController
{
    #[Route('/add_categorie', name: 'app_categorie_add')]
    public function add(CategorieRepository $repo, Request $request, SluggerInterface $slugger): Response
    {
        

        $categorie = new Categorie();
        $form = $this->createForm(CategorieType::class, $categorie);

        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid())
        {


            // on récupere la donnée saisie dans le champs categories du formulaire
            $categories = $form->get('categories')->getData();

            // dd($categories);

            // explode permet de transformer une chaine de caractére en un tableau ARRAY, chaque fois qu'il trouve le separateur indiqué en premier parametre il en fait une valeur dans le tableau
            $categoriesTab = explode(',', $categories);

           
            //  dd($categoriesTab);

            foreach($categoriesTab as $valeur)
            {
                $categorie = new Categorie();

                $categorie->setNom($valeur);
                $slug = $slugger->slug($categorie->getNom());
                $categorie->setSlug($slug);

                $photoCatFile = $form->get('photoCat')->getData();



                if ($photoCatFile) {
                    $photoCatFileName = uniqid().'.'.$photoCatFile->guessExtension();
                    try {
                        $photoCatFile->move(
                            $this->getParameter('hebergement_photos'),
                            $photoCatFileName
                        );
                    } catch (FileException $e) {
                        // handle the exception if something goes wrong
                    }
                    $categorie->setPhotocategorie($photoCatFileName);


                }

                
                $repo->save($categorie); // sans le deuxieme parametre (1) le flush est par defaut à false et donc cela fera uniquement un persist
            }



            $repo->flush();

            return $this->redirectToRoute('app_home');
        }


        return $this->render('categorie/formCategorie.html.twig', [
            'formCategorie' => $form->createView()
        ]);
    }





      
    #[Route('/hebergement/categorie/{slug}', name: 'app_hebergement_categorie')]
    public function hebergementByCategorie(CategorieRepository $repo, $slug){

        $categorie = $repo->findOneBy(['slug' => $slug]); 

        $hebergements = $categorie->getHerbergements(); 

        $categories = $repo->findAll(); 
       


        

        return $this->render('herbergement/allhebergements.html.twig', [
            'hebergements' => $hebergements,
            'categories' => $categories
        ]);



    }
}
