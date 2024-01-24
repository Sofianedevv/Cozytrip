<?php

namespace App\Form;

use App\Entity\Categorie;
use App\Entity\Herbergement;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;

class HerbergementType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('titre')
            ->add('description')
            ->add('photoForm', FileType::class, [
                'mapped'=> false, 
                'required' => true, 
                'multiple' => true
            ])
            ->add('type')
            ->add('adresse')
            ->add('pays')
            ->add('prix')
            ->add('categorie', EntityType::class, [
                'class' => Categorie::class, 
                'choice_label' =>'nom', 
                'label' => 'Choisissez une catégorie'
            ])
            ->add('envoyer', SubmitType::class)

        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Herbergement::class,
            
         
            
        ]);
    }
}
