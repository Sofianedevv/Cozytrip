<?php

namespace App\Controller;

use DateTime;
use App\Form\CommentaireType;
use App\Repository\CommentaireRepository;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class CommentaireController extends AbstractController
{
    #[Route('/modifier_commentaire_{id}', name: 'app_commentaire_modifier')]
    public function update($id, Request $request , CommentaireRepository $repoCom) : Response
    {
        $commentaire = $repoCom->find($id) ;


        if (!$commentaire) {
            // Si $commentaire est null, renvoyer une réponse avec un message d'erreur approprié
            return new Response('Commentaire non trouvé', Response::HTTP_NOT_FOUND);
        }

        $hebergement = $commentaire->getHebergement(); 


        $form = $this->createForm(CommentaireType::class, $commentaire);

        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid())
        {
            $commentaire->setHebergement($hebergement);
            $commentaire->setDateModification(new DateTime('now'));
            $repoCom->save($commentaire, 1);

            return $this->redirectToRoute('app_hebergement', ['id' => $hebergement->getId()]);
        } 

        return $this->render('herbergement/oneHebergement.html.twig' , [
            'formCommentaire' => $form->createView() , 
            'hebergement' => $hebergement
        ]);
    }





    #[Route('/supprimer_commentaire_{id}', name: 'app_commentaire_supprimer')]
    public function delete($id, CommentaireRepository $repoCom){

        $commentaire = $repoCom->find($id); 
        if (!$commentaire) {
            // Si $commentaire est null, renvoyer une réponse avec un message d'erreur approprié
            return new Response('Commentaire non trouvé', Response::HTTP_NOT_FOUND);
        }
        $hebergement = $commentaire->getHebergement(); 

        $repoCom->remove($commentaire, 1); 

        return $this->redirectToRoute('app_hebergement', ['id' => $hebergement->getId()]);





    }
}
