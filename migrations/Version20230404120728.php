<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20230404120728 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE herbergement ADD categorie_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE herbergement ADD CONSTRAINT FK_78B8677FBCF5E72D FOREIGN KEY (categorie_id) REFERENCES categorie (id)');
        $this->addSql('CREATE INDEX IDX_78B8677FBCF5E72D ON herbergement (categorie_id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE herbergement DROP FOREIGN KEY FK_78B8677FBCF5E72D');
        $this->addSql('DROP INDEX IDX_78B8677FBCF5E72D ON herbergement');
        $this->addSql('ALTER TABLE herbergement DROP categorie_id');
    }
}
