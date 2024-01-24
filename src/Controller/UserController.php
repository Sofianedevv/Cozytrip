<?php

namespace App\Controller;

use UserPhotoType;
use App\Entity\User;
use App\Form\UserType;
use App\Form\UserPasswordType;
use App\Repository\UserRepository;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\File\UploadedFile;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;

class UserController extends AbstractController
{
    #[Route('/user/edition/{id}', name: 'user.edit')]
    public function edit(User $user, Request $request, EntityManagerInterface $manager, UserPasswordHasherInterface $hasher): Response
    {

        if(!$this->getUser()){
            return $this->redirectToRoute('app_login');
        }

        if($this->getUser() !== $user){
            return $this->redirectToRoute('app_home');
        }

        $form = $this->createForm(UserType::class, $user);

        $form->handleRequest($request);
        if($form->isSubmitted () && $form->isValid()) {

            if ($hasher->isPasswordValid($user, $form->get('plainPassword')->getData())){
                     $user = $form->getData();
                     $manager->persist($user);
                     $manager->flush();

                     $this->addFlash (
                     'success',
                     'Les informations de votre compte ont bien été modifiées. '
                     );

                     return $this->redirectToRoute( 'app_mon_profil');

                    } else {
                       $this->addFlash(
                       'warning',
                       'Le mot de passe renseigné est incorrect.' ) ;
                    }

        }

        return $this->render('user/edit.html.twig', [
            'form' => $form->createView(),
        ]);
    }





#[Route('/user/edition-mot-de-passe/{id}', name: 'user.edit.password', methods: ['GET', 'POST'])]
public function editPassword(User $user, Request $request, UserPasswordHasherInterface $hasher, ManagerRegistry $doctrine): Response
{
    $form = $this->createForm(UserPasswordType::class);

    $form->handleRequest($request);
    if ($form->isSubmitted() && $form->isValid()) {
        $plainPassword = $form->get('plainPassword')->getData();
        $newPassword = $form->get('newPassword')->getData();

        if ($hasher->isPasswordValid($user, $plainPassword)) {
            $hashedPassword = $hasher->hashPassword($user, $newPassword);
            $user->setPassword($hashedPassword);

            $entityManager = $doctrine->getManager();
            $entityManager->persist($user);
            $entityManager->flush();

            $this->addFlash(
                'success',
                'Le mot de passe a été modifié.'
            );

            return $this->redirectToRoute('app_home');
        } else {
            $this->addFlash(
                'warning',
                'Le mot de passe renseigné est incorrect.'
            );
        }
    }

    return $this->render('user/edit_password.html.twig', [
        'form' => $form->createView()
    ]);
}




#[Route("/profil", name: "app_mon_profil")]
public function showProfile(): Response
{
    $user = $this->getUser(); // Récupère l'utilisateur actuellement connecté

    if(!$user){
        $this->addFlash('error', 'Veuillez vous connecter pour acceder a cette page'); 
        return $this->redirectToRoute('app_login'); 
    }


    return $this->render('user/mon-profil.html.twig', [
        'user' => $user,
    ]);
}


#[Route('/user/edition-photo/{id}', name: 'user.edit.photo', methods: ['GET', 'POST'])]
public function editPhoto(User $user, Request $request, ManagerRegistry $doctrine): Response
{
    $form = $this->createForm(UserPhotoType::class);

    $form->handleRequest($request);
    if ($form->isSubmitted() && $form->isValid()) {
        /** @var UploadedFile $photoFile */
        $photoFile = $form->get('photo')->getData();

        if ($photoFile) {
            $newFilename = uniqid().'.'.$photoFile->guessExtension();

            try {
                $photoFile->move(
                    $this->getParameter('photos_directory'),
                    $newFilename
                );
            } catch (FileException $e) {
                // Handle the exception
            }

            $user->setPhoto($newFilename);

            $entityManager = $doctrine->getManager();
            $entityManager->persist($user);
            $entityManager->flush();

            $this->addFlash(
                'success',
                'La photo de profil a été modifiée.'
            );

            return $this->redirectToRoute('app_mon_profil');
        }
    }

    return $this->render('user/edit_photo.html.twig', [
        'form' => $form->createView()
    ]);
}


























}
