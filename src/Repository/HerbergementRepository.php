<?php

namespace App\Repository;

use App\Entity\Herbergement;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @extends ServiceEntityRepository<Herbergement>
 *
 * @method Herbergement|null find($id, $lockMode = null, $lockVersion = null)
 * @method Herbergement|null findOneBy(array $criteria, array $orderBy = null)
 * @method Herbergement[]    findAll()
 * @method Herbergement[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class HerbergementRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Herbergement::class);
    }

    public function save(Herbergement $entity, bool $flush = false): void
    {
        $this->getEntityManager()->persist($entity);

        if ($flush) {
            $this->getEntityManager()->flush();
        }
    }

    public function remove(Herbergement $entity, bool $flush = false): void
    {
        $this->getEntityManager()->remove($entity);

        if ($flush) {
            $this->getEntityManager()->flush();
        }
    }

    public function saveReservation(Reservation $reservation): void
{
    $this->_em->persist($reservation);
    $this->_em->flush();
}


   public function paginationQuery()
   {
       return $this->createQueryBuilder('a')
           ->orderBy('a.id', 'ASC')
           ->getQuery()
       ;
   }

//    public function findOneBySomeField($value): ?Herbergement
//    {
//        return $this->createQueryBuilder('h')
//            ->andWhere('h.exampleField = :val')
//            ->setParameter('val', $value)
//            ->getQuery()
//            ->getOneOrNullResult()
//        ;
//    }
}
