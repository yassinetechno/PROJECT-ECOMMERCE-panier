-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 14 fév. 2024 à 20:23
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `ecommerce`
--

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `id` int(11) NOT NULL,
  `libelle` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_creation` datetime NOT NULL DEFAULT current_timestamp(),
  `icone` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`id`, `libelle`, `description`, `date_creation`, `icone`) VALUES
(12, 'vêtements', 'Catégorie pour vêtements', '2024-02-13 21:22:22', 'fa-solid fa-shirt');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `id` int(11) NOT NULL,
  `id_client` int(11) NOT NULL,
  `total` decimal(10,0) NOT NULL,
  `valide` int(11) NOT NULL DEFAULT 0,
  `date_creation` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`id`, `id_client`, `total`, `valide`, `date_creation`) VALUES
(24, 3, 25200, 0, '2022-12-03 17:36:29'),
(25, 3, 75, 0, '2022-12-03 20:20:42'),
(26, 3, 75, 0, '2022-12-03 20:22:00'),
(27, 3, 75, 0, '2022-12-03 20:27:57'),
(28, 3, 75, 0, '2022-12-03 20:28:24'),
(29, 3, 99450, 1, '2022-12-04 13:51:39'),
(30, 7, 28000, 0, '2024-02-13 13:50:21'),
(31, 7, 63200, 1, '2024-02-13 15:04:29'),
(32, 7, 14000, 0, '2024-02-13 21:30:33'),
(33, 7, 21600, 1, '2024-02-13 21:34:30');

-- --------------------------------------------------------

--
-- Structure de la table `ligne_commande`
--

CREATE TABLE `ligne_commande` (
  `id` int(11) NOT NULL,
  `id_produit` int(11) NOT NULL,
  `id_commande` int(11) NOT NULL,
  `prix` decimal(10,0) NOT NULL,
  `quantite` int(11) NOT NULL,
  `total` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `ligne_commande`
--

INSERT INTO `ligne_commande` (`id`, `id_produit`, `id_commande`, `prix`, `quantite`, `total`) VALUES
(10, 7, 24, 300, 4, 1200),
(11, 13, 25, 75, 1, 75),
(12, 13, 26, 75, 1, 75),
(13, 13, 27, 75, 1, 75),
(14, 13, 28, 75, 1, 75),
(15, 6, 29, 6000, 5, 30000),
(16, 11, 29, 7000, 3, 21000),
(17, 12, 29, 12000, 4, 48000),
(18, 13, 29, 75, 6, 450),
(19, 11, 30, 7000, 4, 28000),
(20, 11, 31, 7000, 8, 56000),
(21, 15, 31, 7200, 1, 7200),
(22, 11, 32, 7000, 2, 14000),
(23, 15, 33, 7200, 3, 21600);

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `id` int(11) NOT NULL,
  `libelle` varchar(100) NOT NULL,
  `prix` decimal(10,0) NOT NULL,
  `discount` int(11) NOT NULL,
  `id_categorie` int(11) NOT NULL,
  `date_creation` datetime NOT NULL,
  `description` varchar(255) NOT NULL,
  `image` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`id`, `libelle`, `prix`, `discount`, `id_categorie`, `date_creation`, `description`, `image`) VALUES
(6, 'SAMSUNG S8', 6000, 0, 6, '2022-11-17 00:00:00', 'Samsung TV', '6376527e74813Television-43″-SAMSUNG-43AU9075-Smart-4K-Crystal-UHD-–-Serie-9-–-Bluetooth-–-Recepteur-Integre.jpg'),
(7, 'Coconut', 300, 0, 8, '2022-11-17 00:00:00', 'Maquillage', '6376546d32bd5images.jfif'),
(8, 'Rouge a lèvres', 200, 0, 8, '2022-11-17 00:00:00', 'Rouge a lèvres', '63765918499b1produit.png'),
(10, 'Danone', 2, 24, 3, '2022-11-17 00:00:00', 'Danone ', '637658729b712Danone-Logo.png'),
(11, 'LG OLED evo C2 Smart TV Resolution 4K 42 pouces', 7000, 0, 6, '2022-11-18 00:00:00', 'Noir parfait (contraste infini), Fidélité des couleurs à 100 %', '6377c736816d6medium01.webp'),
(12, 'LG NANO79 Smart TV Resolution 4K 86 pouces', 12000, 6, 6, '2022-11-18 00:00:00', 'Téléviseur 4K NanoCell IPS avec Local Dimming pour des couleurs pures et des angles de vision larges\r\n\r\nProcesseur α7 Gen4 4K avec réduction du bruit en deux étapes et AI Sound, AI Picture\r\n', '6377c776dfe8f350-1.webp'),
(13, 'Semillas Graines de fraises', 75, 0, 1, '2022-11-18 00:00:00', 'Marque: Semillas | Produits similaires par Semillas', '6377cb360a23f1.jpg'),
(15, 'VETEMENT', 7500, 4, 7, '2024-02-13 00:00:00', '', '65cb7221c8307img5.jpg'),
(16, 'VETEMENT', 6000, 6, 7, '2024-02-13 00:00:00', 'GGGGG', '65cb74759480eimg7.jpg'),
(17, 'VETEMENT', 6000, 0, 7, '2024-02-13 00:00:00', 'YJH', '65cb74939df5eimg1.jpg'),
(18, 'pigama1', 6000, 11, 12, '2024-02-13 00:00:00', 'vêtements', '65cbcfc1a7c42img1.jpg'),
(19, 'pigama2', 6000, 0, 12, '2024-02-13 00:00:00', 'belle', '65cbd3a7c08b0img8.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id` int(11) NOT NULL,
  `login` varchar(100) NOT NULL,
  `password` varchar(150) NOT NULL,
  `date_creation` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `login`, `password`, `date_creation`) VALUES
(7, 'y', 'yyy', '2024-02-12'),
(8, 't', 'yyy', '2024-02-13'),
(9, 'y', 'yyy', '2024-02-13'),
(10, 'yassine', '12345', '2024-02-13');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_client` (`id_client`);

--
-- Index pour la table `ligne_commande`
--
ALTER TABLE `ligne_commande`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_produit` (`id_produit`),
  ADD KEY `id_commande` (`id_commande`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_categorie` (`id_categorie`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `commande`
--
ALTER TABLE `commande`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT pour la table `ligne_commande`
--
ALTER TABLE `ligne_commande`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT pour la table `produit`
--
ALTER TABLE `produit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `ligne_commande`
--
ALTER TABLE `ligne_commande`
  ADD CONSTRAINT `ligne_commande_ibfk_1` FOREIGN KEY (`id_produit`) REFERENCES `produit` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `ligne_commande_ibfk_2` FOREIGN KEY (`id_commande`) REFERENCES `commande` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
