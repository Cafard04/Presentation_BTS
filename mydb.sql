-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 16 nov. 2021 à 15:41
-- Version du serveur :  10.4.14-MariaDB
-- Version de PHP : 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `mydb`
--

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Légumes'),
(2, 'Livre'),
(3, 'Épicerie');

-- --------------------------------------------------------

--
-- Structure de la table `commands`
--

CREATE TABLE `commands` (
  `id` int(11) NOT NULL,
  `provider_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `commands`
--

INSERT INTO `commands` (`id`, `provider_id`) VALUES
(1, 1),
(5, 1),
(10, 1),
(8, 2),
(11, 2),
(4, 3),
(9, 3),
(12, 3);

-- --------------------------------------------------------

--
-- Structure de la table `commands_products`
--

CREATE TABLE `commands_products` (
  `product_id` int(11) NOT NULL,
  `command_id` int(11) NOT NULL,
  `qtt` decimal(10,3) DEFAULT NULL,
  `price` decimal(10,3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `commands_products`
--

INSERT INTO `commands_products` (`product_id`, `command_id`, `qtt`, `price`) VALUES
(1, 1, '20.000', '300.000'),
(1, 10, '20.000', '240.000'),
(2, 5, '13.000', '169.000'),
(3, 4, '12.000', '4800.000'),
(3, 8, '12.000', '24.000'),
(3, 9, '1.000', '400.000'),
(3, 11, '1.000', '2.000'),
(3, 12, '10.000', '4000.000');

-- --------------------------------------------------------

--
-- Structure de la table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `category_id` int(11) NOT NULL,
  `stock` decimal(10,3) NOT NULL DEFAULT 0.000,
  `unit_id` int(11) NOT NULL,
  `tva_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `products`
--

INSERT INTO `products` (`id`, `name`, `category_id`, `stock`, `unit_id`, `tva_id`) VALUES
(1, 'Poireaux', 1, '200.000', 2, 1),
(2, 'Tomates', 1, '125.000', 2, 1),
(3, 'Patates', 1, '123.000', 3, 1),
(9, 'Les Misérables - V.Hugo', 2, '50.000', 2, 4),
(10, 'Chocolat noir', 3, '1000000.000', 3, 4);

-- --------------------------------------------------------

--
-- Structure de la table `products_providers`
--

CREATE TABLE `products_providers` (
  `provider_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `tva_id` int(11) NOT NULL DEFAULT 1,
  `price` decimal(10,3) NOT NULL DEFAULT -1.000
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `products_providers`
--

INSERT INTO `products_providers` (`provider_id`, `product_id`, `tva_id`, `price`) VALUES
(1, 1, 1, '12.000'),
(1, 2, 1, '13.000'),
(2, 3, 1, '2.000'),
(3, 3, 1, '400.000');

-- --------------------------------------------------------

--
-- Structure de la table `providers`
--

CREATE TABLE `providers` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `providers`
--

INSERT INTO `providers` (`id`, `name`) VALUES
(1, 'Paul\'s company'),
(2, 'Eddy\'s company'),
(3, 'Karen\'s company');

-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
(1, 'Administrateur'),
(2, 'Employé');

-- --------------------------------------------------------

--
-- Structure de la table `tvas`
--

CREATE TABLE `tvas` (
  `id` int(11) NOT NULL,
  `name` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `tvas`
--

INSERT INTO `tvas` (`id`, `name`) VALUES
(1, 20),
(2, 10),
(4, 5.5);

-- --------------------------------------------------------

--
-- Structure de la table `units`
--

CREATE TABLE `units` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `units`
--

INSERT INTO `units` (`id`, `name`) VALUES
(1, 'grammes'),
(2, 'unitaire'),
(3, 'kg');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `role_id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `create_time`, `role_id`, `name`, `last_name`) VALUES
(1, 'karen@karen.com', '$2y$10$GaUGQi0Ik2qcxv7jYVgQXO8T9fx2MqtBA7iUT2yK74dk8PSG28xYm', '2021-04-05 08:43:39', 1, 'Karen', 'Chauvin'),
(3, 'eddy@eddy.com', '$2y$10$02iR4TNBbDn18PKXYNDjvObqWd8jThphznoAlpBIYMul1QfPVXNNa', '2021-04-08 13:01:29', 1, 'Eddy', 'Allais'),
(4, 'boubou@boubou.com', '$2y$10$O5vwRh.7NeRESaG0AoHt6ei9Cq.1R.wAKMY9oliUBcGOe7ghkMtIq', '2021-04-08 13:06:41', 2, 'Bou', 'bou');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `commands`
--
ALTER TABLE `commands`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_commands_providers1_idx` (`provider_id`);

--
-- Index pour la table `commands_products`
--
ALTER TABLE `commands_products`
  ADD PRIMARY KEY (`product_id`,`command_id`),
  ADD KEY `fk_products_has_commands_commands1_idx` (`command_id`),
  ADD KEY `fk_products_has_commands_products1_idx` (`product_id`);

--
-- Index pour la table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_product_category1_idx` (`category_id`),
  ADD KEY `fk_products_units1_idx` (`unit_id`),
  ADD KEY `fk_products_tvas1` (`tva_id`);

--
-- Index pour la table `products_providers`
--
ALTER TABLE `products_providers`
  ADD PRIMARY KEY (`provider_id`,`product_id`),
  ADD KEY `fk_providers_has_products_products1_idx` (`product_id`),
  ADD KEY `fk_providers_has_products_providers1_idx` (`provider_id`),
  ADD KEY `fk_products_providers_tvas1_idx` (`tva_id`);

--
-- Index pour la table `providers`
--
ALTER TABLE `providers`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `tvas`
--
ALTER TABLE `tvas`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_role1_idx` (`role_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `commands`
--
ALTER TABLE `commands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `providers`
--
ALTER TABLE `providers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT pour la table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `tvas`
--
ALTER TABLE `tvas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `units`
--
ALTER TABLE `units`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commands`
--
ALTER TABLE `commands`
  ADD CONSTRAINT `fk_commands_providers1` FOREIGN KEY (`provider_id`) REFERENCES `providers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `commands_products`
--
ALTER TABLE `commands_products`
  ADD CONSTRAINT `fk_products_has_commands_commands1` FOREIGN KEY (`command_id`) REFERENCES `commands` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_products_has_commands_products1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_product_category1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_products_tvas1` FOREIGN KEY (`tva_id`) REFERENCES `tvas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_products_units1` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `products_providers`
--
ALTER TABLE `products_providers`
  ADD CONSTRAINT `fk_products_providers_tvas1` FOREIGN KEY (`tva_id`) REFERENCES `tvas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_providers_has_products_products1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_providers_has_products_providers1` FOREIGN KEY (`provider_id`) REFERENCES `providers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_user_role1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
