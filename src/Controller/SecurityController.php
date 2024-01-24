<?php

namespace App\Controller;

use App\Form\AdminType;
use App\Repository\UserRepository;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Security\Http\Authentication\AuthenticationUtils;

class SecurityController extends AbstractController
{
    #[Route(path: '/login', name: 'app_login')]
    public function login(AuthenticationUtils $authenticationUtils): Response
    {
        // if ($this->getUser()) {
        //     return $this->redirectToRoute('target_path');
        // }

        // get the login error if there is one
        $error = $authenticationUtils->getLastAuthenticationError();
        // last username entered by the user
        $lastUsername = $authenticationUtils->getLastUsername();

        return $this->render('security/login.html.twig', ['last_username' => $lastUsername, 'error' => $error]);
    }

    #[Route(path: '/logout', name: 'app_logout')]
    public function logout(): void
    {
        throw new \LogicException('This method can be blank - it will be intercepted by the logout key on your firewall.');
    }






    #[Route(path: '/passer-en-admin-{id<\d+>}', name: 'app_passer_en_admin')]
    public function passerEnAdmin($id, UserRepository $repo , Request $request){
        $user = $repo->find($id);

        if (!$user)  // aucun utilisateur na été trouvé
         {

            // on cree un msg a affiche a lutilisateur au cas ou il,passe dans ce if
            $this->addFlash('error', 'l\'utilisateur n\'existe pas !'); 

            return $this->redirectToRoute('app_home'); 

        }

        $secret = 'azerty'; 

        $form = $this->createForm(AdminType::class);

        $form->handleRequest($request); 

        if ($form->isSubmitted() && $form->isValid()) {

            $formSecret = $form->get('mdpForm')->getData(); 

            if ($secret == $formSecret) { //si le code saisi dans le formulaire coreespond au code secret on affect le role admin l'utilisateur
                $user->setRoles(['ROLE_ADMIN']); 
                $repo->save($user, 1); 
                $pseudo = $user->getPseudo(); 
                $this->addFlash('succes','felicitation $pseudo vous venez de passer en Admin'); 

                return $this->redirectToRoute('app_home'); 
            }else {
                $this->addFlash('error', 'vous etes pas autorisé a etre admin'); 
                return $this->redirectToRoute('app_home');
            }
        }

        return $this->render('security/passer-en-admin.html.twig', [
            'user' => $user, 
            'formAdmin'  => $form->createView()
        ]); 

    }

















}
