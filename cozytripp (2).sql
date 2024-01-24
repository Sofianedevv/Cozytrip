-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 24 jan. 2024 à 12:26
-- Version du serveur : 10.4.28-MariaDB
-- Version de PHP : 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `cozytripp`
--

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `photocategorie` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`id`, `nom`, `slug`, `photocategorie`) VALUES
(5, 'Hôtel', 'Hotel', '642d427f57e26.jpg'),
(7, 'Appartement', 'Appartement', '642d429f1db00.jpg'),
(8, 'Villa', 'Villa', '642d44759ea72.jpg'),
(10, 'Chalet', 'Chalet', '64a85f7991e25.jpg'),
(11, 'Bord de mer', 'Bord-de-mer', '64a860bd0c854.jpg'),
(12, 'Maison de campagne', 'Maison-de-campagne', '64a8621370d84.png'),
(13, 'Luxe', 'Luxe', '64a863591ef3e.jpg'),
(14, 'Piscine', 'Piscine', '64a863d02936c.webp'),
(15, 'Chambres d\'hôtes', 'Chambres-d-hotes', '64a88aa4e61f2.webp'),
(16, 'Riads', 'Riads', '64a8907367267.webp'),
(18, 'Hanoks', 'Hanoks', '64a893e78c299.jpg'),
(19, 'Trulli', 'Trulli', '64a89859ada8e.png');

-- --------------------------------------------------------

--
-- Structure de la table `commentaire`
--

CREATE TABLE `commentaire` (
  `id` int(11) NOT NULL,
  `hebergement_id` int(11) DEFAULT NULL,
  `contenu` longtext NOT NULL,
  `date_creation` datetime NOT NULL,
  `date_modification` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `commentaire`
--

INSERT INTO `commentaire` (`id`, `hebergement_id`, `contenu`, `date_creation`, `date_modification`, `user_id`) VALUES
(16, 4, '\'uy', '2023-04-07 09:32:04', NULL, 1),
(17, 5, 'ryuklruky', '2023-04-07 09:34:58', NULL, 1),
(18, 6, 'lbbiopuouiou', '2023-04-07 10:30:18', NULL, 1),
(19, 5, 'gfhft', '2023-06-27 01:53:48', NULL, 1),
(20, 5, 'gfhft', '2023-06-27 01:53:50', NULL, 1),
(21, 5, 'frferer', '2023-06-27 14:21:19', NULL, 1),
(22, 8, 'drhnjdth,', '2023-06-27 14:27:27', NULL, 1),
(23, 4, 'ergeraerv', '2023-06-30 02:35:36', '2023-07-07 19:04:51', 3),
(24, 5, 'popopopopopopopop', '2023-06-30 02:35:54', NULL, 3),
(25, 8, 'l:hh', '2023-07-06 13:18:39', NULL, 1),
(26, 8, 'ktugchgc', '2023-07-07 10:29:52', NULL, 1),
(27, 5, 'dqdb', '2023-07-07 10:42:21', NULL, 1),
(30, 5, 'fsffss', '2023-08-19 12:52:37', NULL, 1),
(31, 4, 'zefaefa', '2023-08-19 15:57:35', NULL, 1),
(32, 6, 'vrevervez', '2023-08-19 16:02:02', NULL, 1),
(34, 4, 'eeeeeeeeeeeeeeeee', '2023-08-19 16:02:34', '2023-08-19 16:02:42', 4),
(35, 26, 'Tres beau sejour', '2023-08-27 12:08:04', NULL, 6),
(36, 4, 'Je recommande', '2023-08-27 12:27:22', NULL, 7),
(37, 4, 'Super !', '2023-08-27 13:49:50', NULL, 2),
(38, 21, 'tres belle villa !!', '2023-12-18 16:07:36', NULL, 9),
(39, 35, 'Super !!', '2023-12-18 16:09:49', NULL, 9),
(40, 36, 'super !!', '2023-12-18 16:11:47', NULL, 9);

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20230403093755', '2023-04-03 11:38:11', 28),
('DoctrineMigrations\\Version20230403124209', '2023-04-03 14:42:18', 35),
('DoctrineMigrations\\Version20230404074009', '2023-04-04 09:40:25', 38),
('DoctrineMigrations\\Version20230404080354', '2023-04-04 10:04:00', 7),
('DoctrineMigrations\\Version20230404104101', '2023-04-04 12:41:09', 7),
('DoctrineMigrations\\Version20230404115738', '2023-04-04 13:57:41', 43),
('DoctrineMigrations\\Version20230404115807', '2023-04-04 13:58:09', 6),
('DoctrineMigrations\\Version20230404120728', '2023-04-04 14:07:31', 31),
('DoctrineMigrations\\Version20230404121514', '2023-04-04 14:15:16', 16),
('DoctrineMigrations\\Version20230404121550', '2023-04-04 14:15:53', 26),
('DoctrineMigrations\\Version20230405083616', '2023-04-05 10:36:26', 27),
('DoctrineMigrations\\Version20230405101404', '2023-04-05 12:14:11', 54),
('DoctrineMigrations\\Version20230405101658', '2023-04-05 12:17:05', 30),
('DoctrineMigrations\\Version20230405113325', '2023-04-05 13:33:33', 7),
('DoctrineMigrations\\Version20230405142242', '2023-04-05 16:22:48', 7),
('DoctrineMigrations\\Version20230406115423', '2023-04-06 13:54:34', 80),
('DoctrineMigrations\\Version20230406123829', '2023-04-06 14:38:36', 15),
('DoctrineMigrations\\Version20230406124146', '2023-04-06 14:41:50', 28),
('DoctrineMigrations\\Version20230406131559', '2023-04-06 15:16:04', 71),
('DoctrineMigrations\\Version20230407074840', '2023-04-07 09:48:47', 76),
('DoctrineMigrations\\Version20230407081120', '2023-04-07 10:11:27', 30),
('DoctrineMigrations\\Version20230707172256', '2023-07-07 19:38:49', 22),
('DoctrineMigrations\\Version20230708142112', '2023-07-08 16:24:52', 126),
('DoctrineMigrations\\Version20230708151233', '2023-07-08 17:12:38', 167),
('DoctrineMigrations\\Version20230827100300', '2023-08-27 12:03:15', 44),
('DoctrineMigrations\\Version20230827100639', '2023-08-27 12:06:42', 17),
('DoctrineMigrations\\Version20230827102141', '2023-08-27 12:22:00', 65);

-- --------------------------------------------------------

--
-- Structure de la table `herbergement`
--

CREATE TABLE `herbergement` (
  `id` int(11) NOT NULL,
  `titre` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `type` varchar(255) NOT NULL,
  `adresse` varchar(255) NOT NULL,
  `prix` double NOT NULL,
  `pays` varchar(255) NOT NULL,
  `categorie_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `herbergement`
--

INSERT INTO `herbergement` (`id`, `titre`, `description`, `type`, `adresse`, `prix`, `pays`, `categorie_id`) VALUES
(4, 'Hôtel Marina', 'Le Royal Marina propose des chambres élégamment décorées et un centre de bien-être avec une piscine intérieure, à seulement 450 mètres de la place du Taj.', 'Hôtel', 'Dubai', 300, '', NULL),
(5, 'Appartement Phocéen', 'Doté d\'une terrasse spacieuse, d\'un terrain de pétanque et d\'un magasin de concept, l\'Hôtel Maison Montgrand - Vieux Port vous propose 49 chambres et 13 appartements dans le centre de Marseille, à seulement 5 minutes à pied du Vieux-Port et à 4 km du stade Vélodrome.', 'Appartement', 'Marseille', 110, '', NULL),
(6, 'Villa blue', 'Villa pour 10 voyageurs 5 chambres6 lits 2 salles de bain et 1 toilette', 'Villa', 'Skiathos', 370, '', NULL),
(8, 'Villa Islandaise', 'La villa Islandaise Doté d\'un spa souterrain, d\'un lagon géothermal et d\'un restaurant qui réinvente les traditions culinaires islandaises, la villa Blue Lagoon Iceland est entouré des eaux riches en minéraux du Blue Lagoon.', 'Villa', 'Rekjavic', 700, '', NULL),
(13, 'Villa', 'vila test', 'Villa', 'Marseielle', 100, '', NULL),
(14, 'egaz\'g', 'zrgaz\'g', 'a\'zfez', '\"f', 300, '', NULL),
(15, 'egaz\'g', 'zrgaz\'g', 'a\'zfez', '\"f', 300, '', NULL),
(16, 'egaz\'g', 'zrgaz\'g', 'a\'zfez', '\"f', 300, '', NULL),
(18, 'Villa Arrecife', 'Envie d\'explorer le dominicain ? Commencez la journée par une randonnée sur l\'un des nombreux sentiers de Playa Moron. Faites le tour de la résidence sécurisée pour trouver des criques de sable isolées pour la baignade et le paddle. Lorsque vous serez prêt à vous détendre entre amis, la piscine de la maison de plage vous attendra. Passez la nuit à vous divertir dans le salon extérieur, à siroter des boissons dans le jacuzzi et à admirer une vue incroyable sur l\'océan.', 'Villa', 'République Dominiquaine', 3100, 'Caraîbes', NULL),
(19, 'aetbrzrtb', 'zrbtzrbg', 'zbrtb', 'ztzrtv', 44, 'zvtv', NULL),
(21, 'Villa Amaria', 'Le logement\r\nDes volets en bois sculptés cachent des intérieurs élégants dans ce chalet de Courchevel entièrement équipé. Le toit incliné et la vue imprenable dégagent un style classique de montagne, tandis que les sols expresso, les canapés argentés et un escalier sinueux ajoutent un bord moderne à près de 10 000 pieds carrés d\'espace. Prenez l\'équipement de la salle de stockage de ski dédiée pour les 8 minutes à pied de Bellecote, où les débutants peuvent profiter de pentes plus douces. \r\n\r\nCommencez la journée par quelques tours dans la piscine intérieure privée ou par une séance de gym à domicile, puis prenez vos bottes et vos bâtons et accédez à la piste. Après une journée dans les montagnes, laissez-vous tenter par une séance de bain à remous ou de hammam, défiez vos amis et votre famille sur la table de baby-foot et la console de jeux vidéo, ou rassemblez tout le monde pour un film dans le cinéma maison.', 'Villa', 'Saint-Bon-Tarentaise', 10000, 'France', 8),
(22, 'AMARIA', 'Le logement\r\nDes volets en bois sculptés cachent des intérieurs élégants dans ce chalet de Courchevel entièrement équipé. Le toit incliné et la vue imprenable dégagent un style classique de montagne, tandis que les sols expresso, les canapés argentés et un escalier sinueux ajoutent un bord moderne à près de 10 000 pieds carrés d\'espace. Prenez l\'équipement de la salle de stockage de ski dédiée pour les 8 minutes à pied de Bellecote, où les débutants peuvent profiter de pentes plus douces. \r\n\r\nCommencez la journée par quelques tours dans la piscine intérieure privée ou par une séance de gym à domicile, puis prenez vos bottes et vos bâtons et accédez à la piste. Après une journée dans les montagnes, laissez-vous tenter par une séance de bain à remous ou de hammam, défiez vos amis et votre famille sur la table de baby-foot et la console de jeux vidéo, ou rassemblez tout le monde pour un film dans le cinéma maison.', 'Villa', 'Saint-Bon-Tarentaise', 10000, 'France', 8),
(26, 'Riads Orange', 'La Suite Orange enchante avec des couleurs chaudes à partir de 1001 nuits. Les antiquités locales ajoutent à son charme. Cette suite confortable est située au 1er étage avec une vue à travers de grandes fenêtres sur la cour richement ornée. Il dispose d\'un lit double et d\'un coin salon qui peut offrir un lit supplémentaire. La chaleur de la suite est complétée par le ton joyeux de la salle de bain en tadelakt orange. Ventilateur. En hiver, le chauffage est fourni, et des couettes chaudes.', 'Riads', 'Fes', 120, 'Maroc', 16),
(27, 'La chambre en mosaïque', 'Mon logement est proche de l\'art et de la culture, des parcs, des souks, de la culture . Vous aimerez mon logement pour l\'emplacement, les hauts plafonds et l\'ambiance. Mon logement est parfait pour les couples, les aventuriers en solo et les familles (avec enfants).\r\nLe logement\r\nAvec les suites individuelles, vous pouvez vous détendre dans le «salon marocain» élégant avec un livre de la bibliothèque ou en utilisant l\'Internet. Montez à l\'étage pour profiter du jardin d\'hiver sur le toit avec sa cuisine à thé et son coin repas, ou détendez-vous sur la grande terrasse sur le toit avec sa flore luxuriante et sa vue imprenable sur la médina magique', 'Riads', 'Fes', 50, 'Maroc', 16),
(29, 'Suite Coriandre', 'Une suite agréable située au rez-de-chaussée du Riad Jamaï. Véritable riad rénové dans la médina de Fès, le patio offre une très belle architecture marocaine avec une piscine et de magnifiques arches sculptées. L\'accès au riad est simple.\r\nLe logement\r\nSuite Coriandre équipée d\'un lit king size dans la partie chambre. Une mezzanine propose un petit salon avec table, méridienne et fauteuil pour déguster un thé à la menthe. La salle de bain intègre une baignoire, un vasque et wc. La suite coriandre est située au rez-de-chaussée à côté de la piscine, discrète et tranquille elle est un bon compromis entre l\'espace et le confort.', 'Riads', 'Fes', 60, 'Maroc', 16),
(30, 'Joli Menzeh', 'La chambre est confortable et dispose d\'une salle de bain privée,avec vue sur la terrasse . La route est située au centre de la médina, à proximité de toutes les attractions, restaurants , marchés et parkings . Nous aidons nos clients à organiser les transferts , les activités et les visites autour de fès pour profiter du séjour.', 'Riads', 'Fes', 33, 'Maroc', 16),
(31, 'Séjour romantique', 'Un petit nid douillet (20m2), pour les amoureux, une jolie vue mer et une spacieuse salle d\'eau.\r\nUn studio équipé avec lave linge et lave vaisselle.\r\nDans une résidence familiale et sécurisée\r\nLa plage est à 50m (sans route à traverser), proche de la thalasso par la promenade M. Proust.\r\nCentre ville à environ 15 min à pied.\r\nAscenseur au sein de la résidence.\r\nPiscine chauffée ouverte en saison (15/06-15/09) et tennis ouvert à l\'année\r\nLe logement\r\nUn studio simple et fonctionnel.\r\nLe règlement intérieur sera respecté.\r\nLa résidence se trouve à environ 15 min à pied du centre ville et du Casino, par la promenade Marcel Proust.', 'appartement', 'Cabourg', 72, 'France', 11),
(32, 'Appartement en front de mer', 'Appartement en front de mer de 50m2 à Arromanches les bains sur les plages du débarquement. Grande terrasse privée de 120m2. Une grande pièce à vivre avec cuisine américaine . Une chambre principale vue sur mer avec un lit en 140, une 2eme chambre avec 2 lits en 90 et une salle de bain avec douche.\r\nAccès à la piscine chauffée de juin à septembre\r\nPendant les vacances scolaires, les locations se font à la semaine , du samedi au samedi. Sinon 3 jours minimum.', 'maison', 'Arromanches-les-Bains', 180, 'France', 11),
(33, 'Digue de Wimereux', 'Appartement tout juste rénové, situé dans une résidence calme. Il est idéalement placé sur la digue, à deux pas des restaurants et commerces du centre ville.\r\n\r\nLes baies vitrées et le balcon offrent un panorama d’exception sur la Manche. En toutes saisons, vous pourrez y apprécier de magnifiques couchers de soleil.\r\n\r\nIdéal pour venir trouver le repos. Aucune difficulté d’accès.\r\n\r\nLes + :\r\n- balcon avec vue sur mer\r\n- ascenseur\r\n- parking gratuit privé\r\n- interphone\r\n- literie neuve et de qualité', 'appartement', 'Wimereux', 100, 'France', 11),
(34, 'Adorable maison sur la plage', 'A louer maison toute équipée, idéalement située sur la plage de Sainte Marguerite Sur Mer (Haute Normandie) avec accès direct mer.\r\n50 m2, chambre vue mer (lit 160), cuisine toute équipée, salon avec canapé-lit deux places (140), salle d\'eau avec douche et toilettes, belle salle à manger face à la mer, terrasse et jardin. Parking\r\nMaison avec plancha, salon de jardin, bains de soleil, parasol, lavabo extérieur.\r\nUne boite a clé est a votre disposition\r\nTous commerces à proximité.\r\nLe logement\r\nLinge de maison et de toilette non fournis.Produits entretien fournis\r\nlaisser la maison propre et poubelles vidées.', 'maison', 'Sainte-Marguerite-sur-Mer,', 120, 'France', 11),
(35, 'Comfort Hotel', 'Situé à 3 minutes à pied du terminal de l\'aéroport, le Comfort Hotel Copenhagen Airport possède une salle de sport, une laverie et un bar. Il propose des chambres familiales et une salle de jeux pour enfants. L\'établissement possède également des salles de réunion. En outre, vous pourrez profiter d’une réception ouverte 24h/24.\r\n\r\nToutes les chambres sont équipées d’une télévision à écran plat. Les logements du Comfort Hotel Copenhagen Airport comprennent la climatisation et une salle de bains privative.', 'Hôtel', 'Copenhague', 120, 'France', 5),
(36, 'Wyndham Marina', 'Le Wyndham Dubai Marina est un établissement haut de gamme offrant une vue imprenable sur la mer d’Arabie et le port de plaisance de Dubaï.\r\n\r\nIl assure gratuitement un service de navette à destination de la plage, de centres commerciaux, de stations de métro et d’autres sites d’intérêt. Une connexion Wi-Fi gratuite est disponible dans tout l’hôtel.\r\n\r\nLes 493 chambres du Wyndham Dubai Marina sont climatisées et disposent d’un coin salon, d’une télévision à écran plat, d’un minibar, d’un bureau, d’un coffre-fort ainsi que d’un plateau/bouilloire. Leur salle de bains est pourvue d’une douche, d’une baignoire et d’articles de toilette gratuits.', 'Hôtel', 'Dubai', 230, 'Emirats Arabes Unis', 5),
(37, 'TRYP by Wyndham', 'Le TRYP by Wyndham Dubai est un hôtel lifestyle situé à Barsha Heights, à 600 mètres de la station de métro Dubai Internet City. Grâce à son emplacement central, vous pourrez accéder facilement aux principales destinations de Dubaï, notamment le site de l\'exposition universelle Expo 2020, situé à 23 minutes en voiture. Cet hôtel propose une connexion haut débit à Internet gratuite dans toutes les chambres et les parties communes. Vous pourrez vous détendre dans la piscine extérieure avec chaises longues, vous entraîner dans la salle de sport et profiter des restaurants uniques sur place.\r\n\r\nToutes les chambres disposent d’un systeme de duffision en streaming pour vous permettre de regarder les derniers contenus numériques. Ils comportent également un minibar, un coffre-fort, une douche et une baignoire. Cet établissement propose des grandes chambres familiales et des salles de sport.', 'Hôtel', 'Dubai', 240, 'Émirats arabes unis', 5),
(38, 'Coral Beach Resort', 'Situé à Myrtle Beach, le Coral Beach Resort est un complexe hôtelier en bord de mer doté de 10 piscines comprenant un parc aquatique, une rivière lente et des bains à remous. Le centre commercial et complexe de divertissement Broadway at the Beach, ainsi que le centre commercial Coastal Grand Mall sont accessibles en moins de 10 minutes de route.\r\n\r\nMunies d\'un balcon privé, les chambres du Coral Beach Resort comprennent un petit réfrigérateur et un micro-ondes. Certaines suites sont pourvues d\'une cuisine entièrement équipée.', 'Hôtel', 'Myrtle Beach', 170, 'Etats-unis', 5),
(39, 'Ocean Escape', 'Situé à Myrtle Beach, à moins de 2,6 km du parc d\'État de Myrtle Beach, l\'Ocean Escape dispose d\'une terrasse, de chambres non-fumeurs et d\'une connexion Wi-Fi gratuite dans tout l\'établissement. L\'établissement se trouve à environ 3,4 km de la promenade de Myrtle Beach, à 4,8 km du marché commun et à 6 km du centre de conventions de Myrtle Beach. Les chambres sont équipées d\'un balcon avec vue sur la mer. Tous les logements de l\'hôtel sont équipés de la climatisation, d\'un coin salon, d\'une télévision par câble, d\'une cuisine, d\'un coin repas et d\'une salle de bains privative avec articles de toilette gratuits, douche et baignoire. Chaque chambre de l\'Ocean Escape est équipée de linge de lit et de serviettes.', 'Hôtel', 'Myrtle Beach', 120, 'États-Unis', 5),
(40, 'Villa sur les rochers', 'Les Alpes françaises bénéficient d\'un cadre élégant d\'architecture contemporaine au Chalet on the Rocks. Perchée dans la forêt au-dessus de Chamonix, cette location de vacances magnifiquement conçue offre une vue imprenable sur le Mont-Blanc, l\'Aiguille du Midi et le Glacier des Bossons. Mieux encore, son emplacement vous met à deux pas du centre de Chamonix et à quelques minutes en voiture de certains des meilleurs skis de la région.', 'Villa', 'Chamonix-Mont-Blanc', 1429, 'France', 8),
(41, 'St Didier', 'Les paniers à fruits sculptés et les lions croisés ne sont que quelques-uns des détails qui ornent cette résidence du 16e arrondissement. La Tour Eiffel donne sur les toits avec vue depuis les espaces de vie extérieurs sur la terrasse privée. Des peintures et des sculptures animent chaque recoin du salon et de la salle à manger, et il y a même une table de billard. Il se trouve à 6 minutes du métro le plus proche et à 15 minutes des Champs-Elysées.', 'Luxe', 'Paris', 1303, 'France', 13),
(42, 'Campagne à Paris', 'Située au bras de la Seine, à l\'ouest de Paris, cette maison flottante a été conçue par l\'architecte français Bettinair Landini. En partie bateau, maison en partie, campagne à Paris a été conçu avec des fenêtres extra-larges pour montrer son emplacement incroyable. Avec des terrasses ensoleillées et de nombreuses salles à manger en plein air, vous passerez certainement la majeure partie de votre temps à la maison baignée de soleil. À proximité, Neuilly-sur-Seine est l\'un des quartiers les plus artistiques de France.', 'Luxe', 'Neuilly sur seine', 1300, 'France', 13),
(43, 'Villa Amaria', 'Des volets en bois sculptés cachent des intérieurs élégants dans ce chalet de Courchevel entièrement équipé. Le toit incliné et la vue imprenable dégagent un style classique de montagne, tandis que les sols expresso, les canapés argentés et un escalier sinueux ajoutent un bord moderne à près de 10 000 pieds carrés d\'espace. Prenez l\'équipement de la salle de stockage de ski dédiée pour les 8 minutes à pied de Bellecote, où les débutants peuvent profiter de pentes plus douces.', 'Villa', 'Saint-Bon-Tarentaise', 7000, 'France', 13),
(44, 'Appartement Royal', 'Une sensation de royauté vous envahit lorsque vous mettez les pieds dans ce luxueux appartement de Bruxelles. La lumière naturelle s\'écoule à travers une abondance de fenêtres, le cadre embrassez tout l\'étage, ce qui est à apprécier. Chacune des 4 chambres dispose d\'un lit king. La cerise sur le dessus ? Un majordome est à votre disposition pour vous assister tout au long de votre séjour. Des parcs verdoyants, des cafés cachés et des commerces chics sont à proximité.', 'appartement', 'Bruxelles', 550, 'Belgique', 7),
(45, 'Appart\'City Classic', 'L\'Appart\'City Classic Paris La Villette est situé à 5 minutes à pied de la Cité des sciences de La Villette et à 10 minutes de marche du Zénith.\r\n\r\nTous les appartements bien équipés disposent d\'un salon, d\'un bureau et d\'une télévision par satellite. Ils comprennent une salle de bains, ainsi qu\'une cuisine entièrement équipée munie d\'un réfrigérateur, de plaques de cuisson et d\'un micro-ondes.', 'appartement', 'Paris', 70, 'france', 7);

-- --------------------------------------------------------

--
-- Structure de la table `photo`
--

CREATE TABLE `photo` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `hebergement_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `photo`
--

INSERT INTO `photo` (`id`, `nom`, `hebergement_id`) VALUES
(7, 'Hotel-Marina642c171323402.jpg', 4),
(8, 'Hotel-Marina642c171323a6a.jpg', 4),
(9, 'Appartement-Phoceen642c182a567f9.jpg', 5),
(10, 'Appartement-Phoceen642c182a577c7.jpg', 5),
(11, 'Villa-blue642c18339e3b3.jpg', 6),
(12, 'Villa-blue642c1833a02f6.jpg', 6),
(13, 'Villa-blue642c1833a05c2.jpg', 6),
(14, 'Villa-Islandaise642c183bcaed8.jpg', 8),
(15, 'Villa-Islandaise642c183bcbe8f.jpg', 8),
(16, 'Hotel-Marina642c1eea549ab.jpg', 4),
(17, 'Hotel-Marina642c1eea55b06.jpg', 4),
(18, 'Hotel-Marina642c1eea55e40.jpg', 4),
(19, 'Hotel-Marina642c1eea56118.jpg', 4),
(20, 'Villa64a7ce41385b3.jpg', 13),
(21, 'Villa64a7ce4150195.jpg', 13),
(22, 'egaz-g64a842460482a.jpg', 14),
(23, 'egaz-g64a84292948e4.jpg', 15),
(24, 'egaz-g64a8429f704cc.jpg', 16),
(26, 'Villa-Arrecife64a97330804ff.png', 18),
(27, 'Villa-Arrecife64a97330a7461.png', 18),
(28, 'Villa-Arrecife64a97330a7b6c.png', 18),
(29, 'aetbrzrtb64a979cd12cd6.png', 19),
(31, 'Villa-Amaria64dfbd65c3f8b.webp', 21),
(32, 'Villa-Amaria64dfbd65f1c45.webp', 21),
(33, 'Villa-Amaria64dfbd8de3ae2.webp', 22),
(34, 'Villa-Amaria64dfbd8de4d42.webp', 22),
(35, 'AMARIA64e936de63c42.png', 22),
(54, 'Riads-Orange64e9e2695ecd2.webp', 26),
(55, 'Riads-Orange64e9e26960657.webp', 26),
(56, 'Riads-Orange64e9e26960c56.webp', 26),
(57, 'Riads-Orange64e9e26961386.webp', 26),
(58, 'Riads-Orange64e9e26961835.webp', 26),
(59, 'La-chambre-en-mosaique64e9e34a249f0.webp', 27),
(60, 'La-chambre-en-mosaique64e9e34a25fca.jpg', 27),
(61, 'La-chambre-en-mosaique64e9e34a26757.webp', 27),
(66, 'Suite-Coriandre64e9e4acdee45.jpg', 29),
(67, 'Suite-Coriandre64e9e4ace03a8.jpg', 29),
(68, 'Suite-Coriandre64e9e4ace0788.jpg', 29),
(69, 'Joli-Menzeh64e9e52655f6e.jpg', 30),
(70, 'Joli-Menzeh64e9e5265757c.jpg', 30),
(71, 'Joli-Menzeh64e9e52657b07.webp', 30),
(72, 'Sejour-romantique64e9e70a2bfb2.webp', 31),
(73, 'Sejour-romantique64e9e70a2d97b.webp', 31),
(74, 'Appartement-en-front-de-mer64e9e7c0ecb00.png', 32),
(75, 'Appartement-en-front-de-mer64e9e7c0edfa6.png', 32),
(76, 'Appartement-en-front-de-mer64e9e7c0ee5b6.png', 32),
(77, 'Digue-de-Wimereux64e9e89c64479.png', 33),
(78, 'Digue-de-Wimereux64e9e89c6595c.webp', 33),
(79, 'Digue-de-Wimereux64e9e89c65f50.png', 33),
(80, 'Adorable-maison-sur-la-plage64e9e924aefa0.png', 34),
(81, 'Adorable-maison-sur-la-plage64e9e924b05ea.png', 34),
(82, 'Comfort-Hotel64e9ea142a1fd.png', 35),
(83, 'Comfort-Hotel64e9ea142b4c7.png', 35),
(84, 'Comfort-Hotel64e9ea142ba78.png', 35),
(85, 'Wyndham-Marina64e9eba5bcaf3.png', 36),
(86, 'Wyndham-Marina64e9eba5be380.png', 36),
(87, 'Wyndham-Marina64e9eba5be971.png', 36),
(88, 'TRYP-by-Wyndham64e9ec32275f6.png', 37),
(89, 'TRYP-by-Wyndham64e9ec3228957.png', 37),
(90, 'TRYP-by-Wyndham64e9ec3228f16.png', 37),
(91, 'Coral-Beach-Resort64e9ecebb4bcb.png', 38),
(92, 'Coral-Beach-Resort64e9ecebb8536.png', 38),
(93, 'Coral-Beach-Resort64e9ecebb8b18.png', 38),
(94, 'Ocean-Escape64e9ed85ca234.png', 39),
(95, 'Ocean-Escape64e9ed85cb840.png', 39),
(96, 'Ocean-Escape64e9ed85cbeb3.png', 39),
(97, 'Villa-sur-les-rochers64e9ee91518f4.png', 40),
(98, 'Villa-sur-les-rochers64e9ee9152df2.png', 40),
(99, 'Villa-sur-les-rochers64e9ee9153550.png', 40),
(100, 'Villa-sur-les-rochers64e9ee9153c24.png', 40),
(101, 'Villa-sur-les-rochers64e9ee915423b.png', 40),
(102, 'St-Didier64e9ef648c151.png', 41),
(103, 'St-Didier64e9ef648d482.png', 41),
(104, 'St-Didier64e9ef648d97c.png', 41),
(105, 'Campagne-a-Paris64e9efed7b95b.png', 42),
(106, 'Campagne-a-Paris64e9efed7cd82.png', 42),
(107, 'Campagne-a-Paris64e9efed7d5ca.png', 42),
(108, 'Villa-Amaria64e9f071c6348.png', 43),
(109, 'Villa-Amaria64e9f071c7697.png', 43),
(110, 'Villa-Amaria64e9f071c7cca.png', 43),
(111, 'Appartement-Royal64e9f190ad5b6.png', 44),
(112, 'Appartement-Royal64e9f190aeafe.png', 44),
(113, 'Appartement-Royal64e9f190af0c1.png', 44),
(114, 'Appart-City-Classic64e9f23979933.png', 45),
(115, 'Appart-City-Classic64e9f2397ae30.png', 45);

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

CREATE TABLE `reservation` (
  `id` int(11) NOT NULL,
  `hebergement_id` int(11) DEFAULT NULL,
  `date_debut` datetime NOT NULL,
  `date_fin` datetime NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `prix_total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `reservation`
--

INSERT INTO `reservation` (`id`, `hebergement_id`, `date_debut`, `date_fin`, `user_id`, `prix_total`) VALUES
(22, 4, '2023-04-01 00:00:00', '2023-04-02 00:00:00', 1, 300),
(24, 4, '2023-04-07 00:00:00', '2023-04-13 00:00:00', 1, 1800),
(25, 4, '2023-04-07 00:00:00', '2023-04-13 00:00:00', 1, 1800),
(26, 4, '2023-04-07 00:00:00', '2023-04-13 00:00:00', 2, 1800),
(27, 5, '2023-12-06 00:00:00', '2023-12-07 00:00:00', 2, 110),
(28, 5, '2023-12-08 00:00:00', '2023-12-09 00:00:00', 1, 110),
(29, 4, '2025-05-22 00:00:00', '2025-05-28 00:00:00', 1, 1800),
(30, 4, '2026-05-07 00:00:00', '2026-06-18 00:00:00', 1, 12600),
(31, 6, '2023-05-18 00:00:00', '2023-05-19 00:00:00', 1, 370),
(32, 8, '2023-06-23 00:00:00', '2023-07-02 00:00:00', 1, 6300),
(33, 8, '2023-12-19 00:00:00', '2024-02-02 00:00:00', 1, 31500),
(34, 4, '2023-07-22 00:00:00', '2023-07-29 00:00:00', 1, 2100),
(35, 4, '2023-07-13 00:00:00', '2023-07-21 00:00:00', 1, 2400),
(36, 5, '2023-07-13 00:00:00', '2023-07-22 00:00:00', 1, 990),
(37, 8, '2023-07-09 00:00:00', '2023-07-21 00:00:00', 1, 8400),
(38, 4, '2023-10-20 00:00:00', '2023-10-21 00:00:00', 1, 300),
(39, 5, '2023-08-01 00:00:00', '2023-08-03 00:00:00', 1, 220),
(40, 4, '2023-09-01 00:00:00', '2023-09-02 00:00:00', 1, 300),
(41, 8, '2023-09-01 00:00:00', '2023-09-07 00:00:00', 1, 4200),
(42, 37, '2023-08-28 00:00:00', '2023-08-30 00:00:00', 6, 480),
(43, 21, '2024-06-22 00:00:00', '2024-06-28 00:00:00', 9, 60000),
(44, 35, '2023-12-27 00:00:00', '2023-12-31 00:00:00', 9, 480),
(45, 36, '2023-12-22 00:00:00', '2023-12-24 00:00:00', 9, 460);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) NOT NULL,
  `roles` longtext NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `pseudo` varchar(255) NOT NULL,
  `photo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `nom`, `prenom`, `pseudo`, `photo`) VALUES
(1, 'admin@hotmail.com', '[\"ROLE_ADMIN\"]', '$2y$13$6VetgCi./3rNVAFw5jc5S.sOdf95L1JXp5wv3DJcwAdM1aKx8GWdK', 'admin', 'admin', 'administrateur', '64eb34f54cf5f.png'),
(2, 'user@user.fr', '[]', '$2y$13$Wohzii8gkCYhGsFgSUb2/eQQwEqf8Tsm5YAxnK4r5mhvCCsj.ryly', 'user', 'user', 'user', '64eb384b045bc.jpg'),
(3, 'popo@hotmail.com', '[]', '$2y$13$Rf.Ay.y6hjdU5Mkm2EefU.lzmo6B93QJcnMvvXXLJWWCEenzeufIu', 'popo', 'nono', 'popo', NULL),
(4, 'polo@hotmail.com', '[]', '$2y$13$N4I8N.NQWF7LTKj3BAoCPOfe90bg0vBwA.0h7tdWDRNsl1gwnBxMu', 'Paul', 'pierre', 'MARCOPOLO', '64eb39b9dca1f.jpg'),
(5, 'qegt@hotmail.com', '[]', '$2y$13$EmY/hh7Jjjg83b9YPCi.eeOgfyatEWzbK.j84v6W.CqXbQOVQdC/S', 'etgze', 'egtze', 'etgzegt', NULL),
(6, 'so@so.fr', '[]', '$2y$13$0i2En1APhHfiReFFxVVhguRDkkPDALBahQTzf7lNTOxBqLRctuSc2', 'Chadili', 'Sofiane', 'Sofiane999', '64eb4955dc33a.png'),
(7, 'jacque@so.fr', '[]', '$2y$13$bfIhwcvL.Re7SeGAC0vlC.nT94AbznyMM1NaJx4XUr4TqH/dQV/JG', 'Jacque', 'Dupont', 'Jacque', '64eb327ad5c6d.png'),
(8, 'maximus@max.fr', '[]', '$2y$13$RY6zt3eacEaRnLNjD4kA2eM/0ymRQSZg2gpfGZV/u1LFfm5rUxObq', 'Maxime', 'Sirpo', 'Maximus', NULL),
(9, 'thierry@hotmail.com', '[]', '$2y$13$P.BgaN5n532vMTSWX8bmbuuJUrzgVZ5OHUJPJrhZR6EsCPMJJbwfS', 'Thierry', 'Lermite', 'Thierry', '64ec872075a8c.webp');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `commentaire`
--
ALTER TABLE `commentaire`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_67F068BC23BB0F66` (`hebergement_id`),
  ADD KEY `IDX_67F068BCA76ED395` (`user_id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `herbergement`
--
ALTER TABLE `herbergement`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_78B8677FBCF5E72D` (`categorie_id`);

--
-- Index pour la table `photo`
--
ALTER TABLE `photo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_14B7841823BB0F66` (`hebergement_id`);

--
-- Index pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_42C8495523BB0F66` (`hebergement_id`),
  ADD KEY `IDX_42C84955A76ED395` (`user_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT pour la table `commentaire`
--
ALTER TABLE `commentaire`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT pour la table `herbergement`
--
ALTER TABLE `herbergement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT pour la table `photo`
--
ALTER TABLE `photo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- AUTO_INCREMENT pour la table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commentaire`
--
ALTER TABLE `commentaire`
  ADD CONSTRAINT `FK_67F068BC23BB0F66` FOREIGN KEY (`hebergement_id`) REFERENCES `herbergement` (`id`),
  ADD CONSTRAINT `FK_67F068BCA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `herbergement`
--
ALTER TABLE `herbergement`
  ADD CONSTRAINT `FK_78B8677FBCF5E72D` FOREIGN KEY (`categorie_id`) REFERENCES `categorie` (`id`);

--
-- Contraintes pour la table `photo`
--
ALTER TABLE `photo`
  ADD CONSTRAINT `FK_14B7841823BB0F66` FOREIGN KEY (`hebergement_id`) REFERENCES `herbergement` (`id`);

--
-- Contraintes pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `FK_42C8495523BB0F66` FOREIGN KEY (`hebergement_id`) REFERENCES `herbergement` (`id`),
  ADD CONSTRAINT `FK_42C84955A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
