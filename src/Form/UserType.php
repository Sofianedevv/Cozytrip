<?php

namespace App\Form;

use App\Entity\User;
use Constraints as Assert;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Validator\Constraints;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\Validator\Constraints\Regex;
use Symfony\Component\Validator\Constraints\Length;
use Symfony\Component\Validator\Constraints\NotBlank;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\PasswordType;
use Symfony\Component\Form\Extension\Core\Type\RepeatedType;

class UserType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
           
            ->add('nom')
            ->add('prenom')
            ->add('pseudo')
            ->add('plainPassword', RepeatedType::class, [
                // instead of being set onto the object directly,
                // this is read and encoded in the controller
                'type' => PasswordType::class,
                'options' => [
                    'attr' => [
                        "class" => 'password-field'
                    ]
                ], 
                'first_options' => ['label' => 'Mot de passe '],
                'second_options' => ['label' => 'Confirmez le mot de passe '],
                'invalid_message' => 'Les mots de passes ne sont pas identiques ! ',
                'mapped' => false,
                'attr' => ['autocomplete' => 'new-password'],
                'constraints' => [
                    new Regex('/^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/',
                     "Il faut un mot de passe de 8 caractères avec 1 majuscule, 1 minusule, 1 chiffre et 1 caractère spécial")
                ]
            ])
            ->add ('Modifier', SubmitType::class, [
                'attr' => [
                'class' => 'btn btn-primary mt-4'
                ]
                ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => User::class,
        ]);
    }
}
