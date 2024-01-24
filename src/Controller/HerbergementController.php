<?php

namespace App\Controller;

use DateTime;
use App\Entity\Photo;
use App\Entity\Commentaire;
use App\Entity\Herbergement;
use App\Form\CommentaireType;
use App\Form\HerbergementType;
use App\Repository\PhotoRepository;
use App\Repository\CategorieRepository;
use App\Repository\CommentaireRepository;
use App\Repository\HerbergementRepository;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\String\Slugger\SluggerInterface;
use Symfony\Component\Security\Core\User\UserInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\File\Exception\FileException;

class HerbergementController extends AbstractController
{
    #[Route('/add_hebergement', name: 'app_hebergement_add')]
    public function addHebergement(Request $request, HerbergementRepository $repo, SluggerInterface $slugger, PhotoRepository $repoPhoto): Response
    {

        $user = $this->getUser(); 

        if(!$user){
            $this->addFlash('error', 'Veuillez vous connecter avant d\'acceder a cette page'); 
            return $this->redirectToRoute('app_login'); 
        }

            // si l'utilisateur est connecté mais que son role n'est pas admin 
        if(!$this->isGranted('ROLE_ADMIN')){

            $this->addFlash('error', 'Vous n\'êtes pas autorisé à acceder a cette page !'); 
            return $this->redirectToRoute('app_home'); 


        }
       
        $hebergement = new Herbergement(); 
        $form = $this->createForm(HerbergementType::class, $hebergement) ;
        $form->handleRequest($request); 

        if($form->isSubmitted() && $form->isValid()){
            
            $files = $form->get('photoForm')->getData(); 

            foreach($files as $file)
            {
                $photo = new Photo();

                $fileName = $slugger->slug($hebergement->getTitre()) . uniqid() . '.' . $file->guessExtension(); 
    
    
                try{
                    $file->move($this->getParameter('hebergement_photos'), $fileName);
                }catch(FileException $e)
                {
                }

                $photo->setNom($fileName);
                $photo->setHebergement($hebergement);
                $repoPhoto->save($photo);
            }

            $repo->save($hebergement, 1); 

            return $this->redirectToRoute('app_hebergements'); 
        }


        return $this->render('herbergement/form.html.twig', [
            'formHebergement' => $form->createView(),
        ]);
    }



    #[Route('/hebergements', name: 'app_hebergements')]
    public function allhebergements(HerbergementRepository $repo, CategorieRepository $repoCat)
    {

        $hebergements = $repo->findAll(); 
        $categories = $repoCat->findAll(); 

        return $this->render('herbergement/allhebergements.html.twig', [
            'hebergements' => $hebergements,
            'categories' => $categories
        ]); 


    }

    #[Route('/hebergement_{id}', name: 'app_hebergement')]
    public function oneProduct($id, HerbergementRepository $repo, CommentaireRepository $repoCom, Request $request ) 
    {
        $hebergement = $repo->find($id);

        $commentaire = new Commentaire(); 

        $user = $this->getUser(); 




        $form = $this->createForm(CommentaireType::class, $commentaire);
        $form->handleRequest($request); 


        if($form->isSubmitted() && $form->isValid())
        {
            $commentaire->setHebergement($hebergement);
            $commentaire->setDateCreation(new DateTime('now'));
            $commentaire->setUser($user);
           
            $repoCom->save($commentaire, 1);

            return $this->redirectToRoute('app_hebergement', ['id' => $id]);
        }
        

   

        return $this->render('herbergement/oneHebergement.html.twig',[
            'hebergement' => $hebergement,
            'formCommentaire' => $form->createView(),

        ]);
    }






    #[Route('/update_hebergement_{id<\d+>}', name: 'app_hebergement_update')]
    public function update(Request $request, $id, HerbergementRepository $repo, SluggerInterface $slugger, PhotoRepository $repoPhoto)
    {
        // on passe par le repository lié à la class Article pour récuperer l'article ayant l'id passé dans l'url qui est recuperé dans la variable $id en parametre de la fonction update 
        $hebergement = $repo->find($id);

        $form = $this->createForm(HerbergementType::class, $hebergement) ;

        $form->handleRequest($request); 

        if($form->isSubmitted() && $form->isValid()){
            
            $files = $form->get('photoForm')->getData();

            if ($files) {
                
                foreach($files as $file)
                { 
                    $photo = new Photo();

                    $fileName = $slugger->slug($hebergement->getTitre()) . uniqid() . '.' . $file->guessExtension(); 
        
        
                    try{
                        $file->move($this->getParameter('hebergement_photos'), $fileName);
                    }catch(FileException $e)
                    {
                    }

                    $photo->setNom($fileName);
                    $photo->setHebergement($hebergement);
                    $repoPhoto->save($photo, 1);
                }

                $repo->save($hebergement, 1 ); 
            }

            return $this->redirectToRoute('app_hebergements'); 
        }


        return $this->render('herbergement/form.html.twig', [
            'formHebergement' => $form->createView(),
        ]);

    }



    #[Route('/delete_hebergement_{id<\d+>}', name: 'app_hebergement_delete')] 
    public function delete($id, HerbergementRepository $repo)
    {
        // on recupere l'article à supprimer ayant l'id passé dans l'url qui est recuperé dans la variable $id en parametre de la fonction delete
        $hebergement = $repo->find($id);
    
        $repo->remove($hebergement,1);
    
        return $this->redirectToRoute('app_hebergements');
    }


    

    
    
    








}
