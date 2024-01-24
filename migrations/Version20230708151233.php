<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20230708151233 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE herbergement_categorie DROP FOREIGN KEY FK_E135160FBCF5E72D');
        $this->addSql('ALTER TABLE herbergement_categorie DROP FOREIGN KEY FK_E135160FD6EA2CFB');
        $this->addSql('DROP TABLE herbergement_categorie');
        $this->addSql('ALTER TABLE herbergement ADD categorie_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE herbergement ADD CONSTRAINT FK_78B8677FBCF5E72D FOREIGN KEY (categorie_id) REFERENCES categorie (id)');
        $this->addSql('CREATE INDEX IDX_78B8677FBCF5E72D ON herbergement (categorie_id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE herbergement_categorie (herbergement_id INT NOT NULL, categorie_id INT NOT NULL, INDEX IDX_E135160FBCF5E72D (categorie_id), INDEX IDX_E135160FD6EA2CFB (herbergement_id), PRIMARY KEY(herbergement_id, categorie_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB COMMENT = \'\' ');
        $this->addSql('ALTER TABLE herbergement_categorie ADD CONSTRAINT FK_E135160FBCF5E72D FOREIGN KEY (categorie_id) REFERENCES categorie (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE herbergement_categorie ADD CONSTRAINT FK_E135160FD6EA2CFB FOREIGN KEY (herbergement_id) REFERENCES herbergement (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE herbergement DROP FOREIGN KEY FK_78B8677FBCF5E72D');
        $this->addSql('DROP INDEX IDX_78B8677FBCF5E72D ON herbergement');
        $this->addSql('ALTER TABLE herbergement DROP categorie_id');
    }
}
