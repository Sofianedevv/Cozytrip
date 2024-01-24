<?php

namespace App\Controller;

use App\Form\ContactType;
use Symfony\Component\Mime\Email;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Mailer\MailerInterface;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class ContactController extends AbstractController
{
    #[Route('/contact', name: 'app_contact')]
    public function index(Request $request, MailerInterface $mailer): Response
    {

        $form = $this->createForm(ContactType::class);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()){

            $data = $form->getData(); 

            $address = $data['votre_email'];
            $content = $data['message'];
                
                $email = (new Email())
                ->from($address)
                ->to('admin@dev.cozytrip.fr')
                ->subject('Demande de contact')
                ->html($content);

                $mailer->send($email);

                $this->addFlash('success', 'Votre message a bien été envoyé !');

            return $this->redirectToRoute('app_contact'); 



        }


        return $this->render('contact/index.html.twig', [
            'controller_name' => 'ContactController',
            'formulaire' => $form
        ]);
    }
}
