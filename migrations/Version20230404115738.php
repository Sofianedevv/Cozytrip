<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20230404115738 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE photo (id INT AUTO_INCREMENT NOT NULL, hebergement_id INT DEFAULT NULL, INDEX IDX_14B7841823BB0F66 (hebergement_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE photo ADD CONSTRAINT FK_14B7841823BB0F66 FOREIGN KEY (hebergement_id) REFERENCES herbergement (id)');
        $this->addSql('ALTER TABLE herbergement DROP FOREIGN KEY FK_78B8677FBCF5E72D');
        $this->addSql('DROP INDEX IDX_78B8677FBCF5E72D ON herbergement');
        $this->addSql('ALTER TABLE herbergement DROP categorie_id');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE photo DROP FOREIGN KEY FK_14B7841823BB0F66');
        $this->addSql('DROP TABLE photo');
        $this->addSql('ALTER TABLE herbergement ADD categorie_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE herbergement ADD CONSTRAINT FK_78B8677FBCF5E72D FOREIGN KEY (categorie_id) REFERENCES categorie (id)');
        $this->addSql('CREATE INDEX IDX_78B8677FBCF5E72D ON herbergement (categorie_id)');
    }
}
