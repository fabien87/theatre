-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mar. 29 mai 2018 à 06:56
-- Version du serveur :  5.7.19
-- Version de PHP :  7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `theatreprojet`
--

-- --------------------------------------------------------

--
-- Structure de la table `evenement`
--

DROP TABLE IF EXISTS `evenement`;
CREATE TABLE IF NOT EXISTS `evenement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lieu` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `evenement`
--

INSERT INTO `evenement` (`id`, `nom`, `lieu`, `date`) VALUES
(2, 'Le premier evenement', 'Limoges', '2015-04-07 04:05:00'),
(3, 'Deuxième evenement', 'Limoges', '2013-01-01 04:06:00'),
(4, 'Troisième évenement', 'Paris', '2019-05-06 08:08:00');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `team_domain` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nom` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prenom` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `user_id`, `team_domain`, `nom`, `prenom`, `user_name`, `token`, `admin`) VALUES
(2, 2, 'Bachelor3IL2018', 'Roby', 'Fabien', 'faro', 'a364594ba80f44a2c334fc156559be7ab8b50e354955b7ef9fcb797e28efd5a5', 0),
(3, 3, 'bachelor3il2018', 'Menieur', 'Dylan', 'Dyme', '', 0),
(5, 1, 'Bachelor3IL2018', 'FOUCARD', 'Maxime', 'foumax', '', 0);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur_evenement`
--

DROP TABLE IF EXISTS `utilisateur_evenement`;
CREATE TABLE IF NOT EXISTS `utilisateur_evenement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `disponibilite` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `commentaire` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `souhait` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `horaireDispo` datetime NOT NULL,
  `vehicule` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `placeHebergement` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `eventId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_6B889D3264B64DCC` (`userId`),
  KEY `IDX_6B889D322B2EBB6C` (`eventId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `utilisateur_evenement`
--

INSERT INTO `utilisateur_evenement` (`id`, `disponibilite`, `commentaire`, `souhait`, `horaireDispo`, `vehicule`, `placeHebergement`, `userId`, `eventId`) VALUES
(6, 'Disponible', 'test commentaire', 'test souhaite', '1970-01-01 19:16:00', 'Oui', 3, 5, 2),
(7, 'Disponible', 'Aucun commantaire', '1M', '1970-01-01 15:00:00', 'Non', 1, 2, 4);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `utilisateur_evenement`
--
ALTER TABLE `utilisateur_evenement`
  ADD CONSTRAINT `FK_6B889D322B2EBB6C` FOREIGN KEY (`eventId`) REFERENCES `evenement` (`id`),
  ADD CONSTRAINT `FK_6B889D3264B64DCC` FOREIGN KEY (`userId`) REFERENCES `utilisateur` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
