<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20230404121550 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE photo ADD hebergement_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE photo ADD CONSTRAINT FK_14B7841823BB0F66 FOREIGN KEY (hebergement_id) REFERENCES herbergement (id)');
        $this->addSql('CREATE INDEX IDX_14B7841823BB0F66 ON photo (hebergement_id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE photo DROP FOREIGN KEY FK_14B7841823BB0F66');
        $this->addSql('DROP INDEX IDX_14B7841823BB0F66 ON photo');
        $this->addSql('ALTER TABLE photo DROP hebergement_id');
    }
}
