<?php

namespace App\Controller;

use App\Entity\Reservation;
use App\Entity\Herbergement;
use App\Form\ReservationType;
use App\Repository\ReservationRepository;
use App\Repository\HerbergementRepository;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class ReservationController extends AbstractController
{
    #[Route('/hebergement/{id}/reserver', name: 'reservation_reserver')]
    public function reserver(Request $request, Herbergement $hebergement, HerbergementRepository $repoHeb, ReservationRepository $repoRes): Response
    {


        $user = $this->getUser(); 

        if(!$user){ 

            $this->addFlash('error', 'Veuillez vous connecter afin de réserver '); 
            return $this->redirectToRoute('app_login'); 
        }

        $reservation = new Reservation();
        $reservation->setHebergement($hebergement);
        $form = $this->createForm(ReservationType::class, $reservation);
        $form->handleRequest($request);

            if ($form->isSubmitted() && $form->isValid()) {

                $existingReservation = $repoRes->findExistingReservation($hebergement, $reservation->getDateDebut(), $reservation->getDateFin());
                if ($existingReservation) {
                    $this->addFlash('error', 'Les dates sélectionnées ne sont pas disponibles.');
                    return $this->redirectToRoute('reservation_reserver', ['id' => $hebergement->getId()]);
                }

                $reservation->setUser($this->getUser());

                $dateDebut = $form->get('dateDebut')->getData();
                $dateFin = $form->get('dateFin')->getData();
                $nbJours = $dateDebut->diff($dateFin)->days;  // La méthode diff() est une méthode disponible pour les objets de type DateTime en PHP et elle retourne un objet DateInterval représentant l'intervalle entre les deux dates.//
                $prixTotal = $nbJours * $hebergement->getPrix();
                
                // Créer la réservation et la sauvegarder
                $reservation = new Reservation();
                $reservation->setHebergement($hebergement)
                            ->setUser($this->getUser())
                            ->setDateDebut($dateDebut)
                            ->setDateFin($dateFin)
                            ->setPrixTotal($prixTotal);
            
                $repoRes->save($reservation, 1);
        
                            $this->addFlash('success', 'Réservation effectuée avec succès.');
                
                            return $this->redirectToRoute('app_home', ['id' => $hebergement->getId()]);
            }

        
        return $this->render('reservation/reserver.html.twig', [
            'form' => $form->createView(),
            'hebergement' => $hebergement
        ]);
    }







    #[Route('/mes-reservations', name: 'app_mes_reservations')]

        public function mesReservations(ReservationRepository $repoRes)
        {
            $user = $this->getUser();

            if(!$user){
                $this->addFlash('error', 'Veuillez vous connecter pour acceder a cette page'); 
                return $this->redirectToRoute('app_login'); 
            } 
            $reservations = $repoRes->findBy(['user' => $user]);

            return $this->render('reservation/mes_reservations.html.twig', [
                'reservations' => $reservations,
            ]);
        }















}