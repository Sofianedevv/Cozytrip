<?php

namespace App\Entity;

use App\Repository\CategorieRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: CategorieRepository::class)]
class Categorie
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 255)]
    private ?string $nom = null;

    #[ORM\Column(length: 255)]
    private ?string $slug = null;

    #[ORM\OneToMany(mappedBy: 'categorie', targetEntity: Herbergement::class)]
    private Collection $herbergements;

    #[ORM\Column(length: 255)]
    private ?string $Photocategorie = null;

    public function __construct()
    {
        $this->herbergements = new ArrayCollection();
    }


    public function getId(): ?int
    {
        return $this->id;
    }

    public function getNom(): ?string
    {
        return $this->nom;
    }

    public function setNom(string $nom): self
    {
        $this->nom = $nom;

        return $this;
    }

    public function getSlug(): ?string
    {
        return $this->slug;
    }

    public function setSlug(string $slug): self
    {
        $this->slug = $slug;

        return $this;
    }

    /**
     * @return Collection<int, Herbergement>
     */
    public function getHerbergements(): Collection
    {
        return $this->herbergements;
    }

    public function addHerbergement(Herbergement $herbergement): self
    {
        if (!$this->herbergements->contains($herbergement)) {
            $this->herbergements->add($herbergement);
            $herbergement->setCategorie($this);
        }

        return $this;
    }

    public function removeHerbergement(Herbergement $herbergement): self
    {
        if ($this->herbergements->removeElement($herbergement)) {
            // set the owning side to null (unless already changed)
            if ($herbergement->getCategorie() === $this) {
                $herbergement->setCategorie(null);
            }
        }

        return $this;
    }

    public function getPhotocategorie(): ?string
    {
        return $this->Photocategorie;
    }

    public function setPhotocategorie(string $Photocategorie): self
    {
        $this->Photocategorie = $Photocategorie;

        return $this;
    }

    
}
