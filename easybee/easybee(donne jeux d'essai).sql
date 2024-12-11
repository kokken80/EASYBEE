-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 05 déc. 2024 à 12:20
-- Version du serveur : 8.3.0
-- Version de PHP : 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `easybee`
--

-- --------------------------------------------------------

--
-- Structure de la table `bondelivraison`
--

CREATE TABLE IF NOT EXISTS `bondelivraison` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dateLivraison` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=132 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `bondelivraison`
--

INSERT INTO `bondelivraison` (`id`, `dateLivraison`) VALUES
(110, '2025-06-25'),
(109, '2025-06-15'),
(108, '2025-06-12'),
(107, '2025-06-08'),
(106, '2025-06-05'),
(105, '2025-04-20'),
(104, '2025-04-10'),
(103, '2025-04-08'),
(102, '2025-03-28'),
(101, '2025-03-19'),
(100, '2025-03-10'),
(112, '2025-10-05'),
(113, '2025-10-07'),
(114, '2025-10-16'),
(115, '2025-10-18'),
(116, '2025-10-19'),
(117, '2025-11-19'),
(118, '2025-11-29'),
(119, '2025-12-09'),
(120, '2025-12-21'),
(121, '2025-12-26'),
(122, '2026-01-01'),
(123, '2026-08-03'),
(124, '2026-08-10'),
(125, '2025-08-16'),
(126, '2026-09-01'),
(127, '2026-09-05'),
(128, '2026-09-10'),
(129, '2026-09-20'),
(130, '2026-09-29');

-- --------------------------------------------------------

--
-- Structure de la table `caisse`
--

DROP TABLE IF EXISTS `caisse`;
CREATE TABLE IF NOT EXISTS `caisse` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nomCaisse` varchar(100) NOT NULL,
  `idParametre` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idParametre` (`idParametre`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `caisse`
--

INSERT INTO `caisse` (`id`, `nomCaisse`, `idParametre`) VALUES
(1, 'Caisse 1', 1),
(2, 'Caisse 2', 2),
(3, 'Caisse 3', 3),
(4, 'Caisse 4', 4),
(5, 'Caisse 5', 5);

-- --------------------------------------------------------

--
-- Structure de la table `categorieproduit`
--

DROP TABLE IF EXISTS `categorieproduit`;
CREATE TABLE IF NOT EXISTS `categorieproduit` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nomCategorie` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `categorieproduit`
--

INSERT INTO `categorieproduit` (`id`, `nomCategorie`) VALUES
(1, 'Fruits'),
(2, 'Légumes'),
(3, 'Boissons'),
(4, 'Produits laitiers'),
(5, 'Boulangerie');

-- --------------------------------------------------------

--
-- Structure de la table `cmdapprodepot`
--

DROP TABLE IF EXISTS `cmdapprodepot`;
CREATE TABLE IF NOT EXISTS `cmdapprodepot` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dateCommande` date DEFAULT NULL,
  `statutCommande` varchar(50) DEFAULT NULL,
  `idSalarie` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idSalarie` (`idSalarie`)
) ENGINE=MyISAM AUTO_INCREMENT=3232 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `cmdapprodepot`
--

INSERT INTO `cmdapprodepot` (`id`, `dateCommande`, `statutCommande`, `idSalarie`) VALUES
(1, '2024-12-20', 'Préparée', 1),
(2, '2024-12-21', 'Préparée', 2),
(3, '2024-12-21', 'Préparée', 2),
(4, '2024-12-22', 'Préparée', 3),
(5, '2024-12-23', 'Préparée', 4),
(6, '2024-12-24', 'Préparée', 5),
(7, '2024-12-25', 'Préparée', 1),
(8, '2024-12-26', 'Préparée', 2),
(9, '2024-12-27', 'Préparée', 3),
(10, '2024-12-28', 'Préparée', 4),
(11, '2024-12-29', 'Préparée', 5),
(12, '2024-12-30', 'Préparée', 1),
(13, '2024-12-31', 'Préparée', 2),
(14, '2025-01-01', 'Préparée', 3),
(15, '2025-01-02', 'Préparée', 4),
(16, '2025-01-03', 'Préparée', 5),
(17, '2025-01-04', 'Préparée', 1),
(18, '2025-01-05', 'Préparée', 2),
(19, '2025-01-06', 'Préparée', 3),
(20, '2025-01-07', 'Préparée', 4),
(21, '2025-01-08', 'Préparée', 5),
(22, '2025-01-09', 'Préparée', 1),
(23, '2025-01-10', 'Préparée', 2),
(24, '2025-01-11', 'Préparée', 3),
(25, '2025-01-12', 'Préparée', 4),
(0, '2024-12-01', 'Préparée', 3),
(26, '2025-01-12', 'Libre', 1),
(27, '2025-01-13', 'Libre', 2),
(28, '2025-01-14', 'Libre', 3),
(29, '2025-01-15', 'Libre', 4),
(30, '2025-01-16', 'Libre', 5),
(31, '2025-01-17', 'Libre', 1),
(32, '2025-01-18', 'Libre', 2),
(33, '2025-01-19', 'Libre', 3),
(34, '2025-01-20', 'Libre', 4),
(35, '2025-01-21', 'Libre', 5),
(36, '2025-01-22', 'Libre', 1),
(37, '2025-01-23', 'Libre', 2),
(38, '2025-01-24', 'Libre', 3),
(39, '2025-01-25', 'Libre', 4),
(40, '2025-01-26', 'Libre', 5),
(41, '2025-01-27', 'En cours', 1),
(42, '2025-01-28', 'En cours', 2),
(43, '2025-01-29', 'En cours', 3),
(44, '2025-01-30', 'En cours', 4),
(45, '2025-01-31', 'En cours', 5),
(46, '2025-02-01', 'En cours', 1),
(47, '2025-02-02', 'En cours', 2),
(48, '2025-02-03', 'En cours', 3),
(49, '2025-02-04', 'En cours', 4),
(50, '2025-02-05', 'En cours', 5),
(51, '2025-02-06', 'En cours', 1),
(52, '2025-02-07', 'En cours', 2),
(53, '2025-02-08', 'En cours', 3),
(54, '2025-02-09', 'En cours', 4),
(55, '2025-02-10', 'En cours', 5),
(56, '2025-02-11', 'Complète', 1),
(57, '2025-02-12', 'Complète', 2),
(58, '2025-02-13', 'Complète', 3),
(59, '2025-02-14', 'Partielle', 4),
(60, '2025-02-15', 'Partielle', 5),
(61, '2025-02-16', 'Annulée', 1),
(62, '2025-02-17', 'Annulée', 2),
(63, '2025-02-18', 'Annulée', 3),
(64, '2025-02-19', 'Annulée', 4),
(65, '2025-02-20', 'Annulée', 5);

-- --------------------------------------------------------

--
-- Structure de la table `detaillivraison`
--

DROP TABLE IF EXISTS `detaillivraison`;
CREATE TABLE IF NOT EXISTS `detaillivraison` (
  `idBonLivraison` int NOT NULL,
  `idProduit` int NOT NULL,
  `idCmdeAppropDepot` int DEFAULT NULL,
  `qtePrepa` int DEFAULT NULL,
  `qteRecep` int DEFAULT NULL,
  PRIMARY KEY (`idBonLivraison`,`idProduit`),
  KEY `idProduit` (`idProduit`),
  KEY `idCmdeAppropDepot` (`idCmdeAppropDepot`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `detaillivraison`
--

INSERT INTO `detaillivraison` (`idBonLivraison`, `idProduit`, `idCmdeAppropDepot`, `qtePrepa`, `qteRecep`) VALUES
(123, 17, 23, 5, 5),
(100, 3, 0, 5, 5),
(100, 7, 0, 15, 15),
(100, 9, 0, 12, 12),
(101, 5, 1, 8, 8),
(101, 6, 1, 4, 4),
(101, 8, 1, 12, 12),
(102, 1, 2, 20, 20),
(102, 5, 2, 15, 15),
(102, 7, 2, 8, 8),
(103, 3, 3, 12, 12),
(103, 6, 3, 8, 8),
(103, 8, 3, 10, 10),
(103, 9, 3, 5, 5),
(104, 1, 4, 30, 30),
(104, 3, 4, 12, 12),
(104, 4, 4, 15, 15),
(104, 5, 4, 20, 20),
(104, 7, 4, 10, 10),
(105, 2, 5, 5, 5),
(105, 6, 5, 10, 10),
(105, 9, 5, 15, 15),
(106, 3, 6, 20, 20),
(106, 4, 6, 12, 12),
(106, 7, 6, 8, 8),
(106, 10, 6, 6, 6),
(107, 1, 7, 18, 18),
(107, 2, 7, 14, 14),
(107, 3, 7, 10, 10),
(107, 5, 7, 6, 6),
(107, 6, 7, 8, 8),
(108, 2, 8, 10, 10),
(108, 5, 8, 8, 8),
(108, 10, 8, 5, 5),
(109, 1, 9, 20, 20),
(109, 2, 9, 15, 15),
(109, 4, 9, 10, 10),
(109, 6, 9, 7, 7),
(109, 8, 9, 4, 4),
(109, 9, 9, 2, 2),
(110, 1, 10, 18, 18),
(110, 4, 10, 14, 14),
(110, 6, 10, 9, 9),
(110, 9, 10, 5, 5),
(111, 1, 11, 25, 25),
(111, 5, 11, 16, 16),
(111, 7, 11, 9, 9),
(111, 9, 11, 11, 11),
(111, 10, 11, 7, 7),
(112, 2, 12, 10, 10),
(112, 6, 12, 12, 12),
(112, 8, 12, 7, 7),
(113, 1, 13, 18, 18),
(113, 4, 13, 14, 14),
(113, 5, 13, 8, 8),
(113, 9, 13, 6, 6),
(114, 1, 14, 20, 20),
(114, 2, 14, 15, 15),
(114, 3, 14, 10, 10),
(114, 6, 14, 7, 7),
(114, 8, 14, 4, 4),
(114, 9, 14, 5, 5),
(115, 1, 15, 15, 15),
(115, 3, 15, 12, 12),
(115, 4, 15, 10, 10),
(115, 6, 15, 8, 8),
(115, 7, 15, 5, 5),
(116, 2, 16, 16, 16),
(116, 4, 16, 14, 14),
(116, 6, 16, 10, 10),
(116, 10, 16, 5, 5),
(117, 3, 17, 25, 25),
(117, 6, 17, 15, 15),
(117, 8, 17, 10, 10),
(118, 1, 18, 20, 20),
(118, 4, 18, 15, 15),
(118, 6, 18, 8, 8),
(118, 9, 18, 5, 5),
(119, 1, 19, 18, 18),
(119, 5, 19, 10, 10),
(119, 7, 19, 8, 8),
(120, 3, 20, 20, 20),
(120, 6, 20, 15, 15),
(120, 9, 20, 10, 10),
(120, 10, 20, 5, 5),
(121, 2, 21, 12, 12),
(121, 5, 21, 18, 18),
(121, 6, 21, 7, 7),
(121, 7, 21, 10, 10),
(121, 10, 21, 5, 5),
(122, 1, 22, 20, 20),
(122, 3, 22, 15, 15),
(122, 9, 22, 10, 10),
(123, 2, 23, 18, 18),
(123, 4, 23, 14, 14),
(123, 6, 23, 8, 8),
(123, 8, 23, 5, 5),
(124, 1, 24, 22, 22),
(124, 3, 24, 14, 14),
(124, 5, 24, 10, 10),
(124, 7, 24, 5, 5),
(124, 9, 24, 3, 3),
(125, 1, 25, 25, 25),
(125, 4, 25, 12, 12),
(125, 6, 25, 8, 8),
(125, 8, 25, 5, 5),
(125, 9, 25, 4, 4),
(125, 10, 25, 3, 3),
(112, 23, 12, 10, 10),
(112, 17, 12, 7, 7),
(111, 22, 11, 6, 6),
(111, 13, 11, 8, 8),
(111, 12, 11, 5, 5),
(113, 14, 13, 4, 4),
(112, 25, 12, 5, 5),
(112, 24, 12, 6, 6),
(114, 13, 14, 6, 6),
(113, 21, 13, 8, 8),
(113, 19, 13, 6, 6),
(113, 16, 13, 9, 9),
(115, 11, 15, 8, 8),
(114, 17, 14, 7, 7),
(114, 22, 14, 8, 8),
(114, 20, 14, 5, 5),
(116, 25, 16, 10, 10),
(115, 16, 15, 7, 7),
(115, 23, 15, 5, 5),
(115, 14, 15, 6, 6),
(117, 13, 17, 6, 6),
(116, 20, 16, 8, 8),
(116, 19, 16, 6, 6),
(116, 12, 16, 9, 9),
(118, 22, 18, 10, 10),
(117, 24, 17, 9, 9),
(117, 21, 17, 5, 5),
(117, 18, 17, 7, 7),
(119, 14, 19, 6, 6),
(118, 23, 18, 4, 4),
(118, 19, 18, 12, 12),
(118, 17, 18, 5, 5),
(120, 18, 20, 5, 5),
(119, 21, 19, 8, 8),
(119, 12, 19, 7, 7),
(119, 16, 19, 10, 10),
(121, 24, 21, 6, 6),
(120, 22, 20, 4, 4),
(120, 13, 20, 8, 8),
(120, 25, 20, 9, 9),
(125, 20, 25, 9, 9),
(125, 19, 25, 6, 6),
(125, 24, 25, 5, 5),
(106, 11, 6, 5, 5),
(106, 14, 6, 7, 7),
(106, 18, 6, 3, 3),
(106, 20, 6, 9, 9),
(105, 23, 5, 10, 10),
(105, 24, 5, 5, 5),
(105, 25, 5, 6, 6),
(105, 26, 5, 3, 3),
(104, 19, 4, 6, 6),
(104, 20, 4, 8, 8),
(104, 21, 4, 7, 7),
(104, 22, 4, 9, 9),
(103, 15, 3, 4, 4),
(103, 16, 3, 10, 10),
(103, 17, 3, 5, 5),
(103, 18, 3, 12, 12),
(102, 11, 2, 5, 5),
(102, 12, 2, 7, 7),
(102, 13, 2, 8, 8),
(102, 14, 2, 6, 6),
(130, 3, 60, 9, 9),
(130, 1, 60, 4, 4),
(130, 7, 60, 3, 3),
(130, 2, 60, 8, 8),
(129, 8, 59, 15, 15),
(129, 10, 59, 5, 5),
(128, 10, 58, 9, 9),
(128, 1, 58, 6, 6),
(128, 3, 59, 5, 5),
(127, 2, 57, 10, 10),
(126, 8, 56, 8, 8),
(126, 7, 56, 7, 7),
(126, 6, 56, 6, 6),
(111, 11, 11, 10, 10),
(110, 18, 10, 6, 6),
(110, 20, 10, 12, 12),
(110, 16, 10, 9, 9),
(110, 14, 10, 8, 8),
(109, 25, 9, 10, 10),
(109, 23, 9, 8, 8),
(109, 19, 9, 6, 6),
(109, 17, 9, 5, 5),
(108, 24, 8, 7, 7),
(108, 16, 8, 10, 10),
(108, 15, 8, 4, 4),
(108, 13, 8, 9, 9),
(107, 22, 7, 12, 12),
(107, 21, 7, 10, 10),
(107, 12, 7, 6, 6),
(107, 19, 7, 8, 8),
(124, 25, 24, 10, 10),
(124, 18, 24, 7, 7),
(125, 17, 25, 8, 8),
(122, 16, 22, 10, 10),
(121, 14, 21, 8, 8),
(121, 11, 21, 10, 10),
(121, 19, 21, 7, 7),
(122, 12, 22, 9, 9),
(122, 21, 22, 8, 8),
(122, 13, 22, 7, 7),
(123, 11, 23, 12, 12),
(124, 15, 24, 6, 6),
(123, 22, 23, 8, 8),
(124, 16, 24, 9, 9),
(123, 14, 23, 10, 10);

-- --------------------------------------------------------

--
-- Structure de la table `detailsproduit`
--

DROP TABLE IF EXISTS `detailsproduit`;
CREATE TABLE IF NOT EXISTS `detailsproduit` (
  `idCommande` int NOT NULL,
  `idProduit` int NOT NULL,
  `qteCmd` int DEFAULT NULL,
  PRIMARY KEY (`idCommande`,`idProduit`),
  KEY `idProduit` (`idProduit`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `detailsproduit`
--

INSERT INTO `detailsproduit` (`idCommande`, `idProduit`, `qteCmd`) VALUES
(1, 5, 8),
(0, 9, 12),
(1, 6, 4),
(0, 3, 5),
(0, 7, 15),
(0, 2, 10),
(1, 8, 12),
(1, 1, 20),
(1, 7, 8),
(2, 1, 20),
(2, 5, 15),
(2, 7, 8),
(3, 3, 12),
(3, 6, 8),
(3, 8, 10),
(3, 9, 5),
(4, 1, 30),
(4, 3, 12),
(4, 4, 15),
(4, 5, 20),
(4, 7, 10),
(5, 2, 5),
(5, 6, 10),
(5, 9, 15),
(6, 3, 20),
(6, 4, 12),
(6, 7, 8),
(6, 10, 6),
(7, 1, 18),
(7, 2, 14),
(7, 3, 10),
(7, 5, 6),
(7, 6, 8),
(8, 2, 10),
(8, 5, 8),
(8, 10, 5),
(9, 1, 20),
(9, 2, 15),
(9, 4, 10),
(9, 6, 7),
(9, 8, 4),
(9, 9, 2),
(10, 1, 18),
(10, 4, 14),
(10, 6, 9),
(10, 9, 5),
(11, 1, 25),
(11, 5, 16),
(11, 7, 9),
(11, 9, 11),
(11, 10, 7),
(12, 2, 10),
(12, 6, 12),
(12, 8, 7),
(13, 1, 18),
(13, 4, 14),
(13, 5, 8),
(13, 9, 6),
(14, 1, 20),
(14, 2, 15),
(14, 3, 10),
(14, 6, 7),
(14, 8, 4),
(14, 9, 5),
(15, 1, 15),
(15, 3, 12),
(15, 4, 10),
(15, 6, 8),
(15, 7, 5),
(16, 2, 16),
(16, 4, 14),
(16, 6, 10),
(16, 10, 5),
(17, 3, 25),
(17, 6, 15),
(17, 8, 10),
(18, 1, 20),
(18, 4, 15),
(18, 6, 8),
(18, 9, 5),
(19, 1, 18),
(19, 5, 10),
(19, 7, 8),
(20, 3, 20),
(20, 6, 15),
(20, 9, 10),
(20, 10, 5),
(21, 2, 12),
(21, 5, 18),
(21, 6, 7),
(21, 7, 10),
(21, 10, 5),
(22, 1, 20),
(22, 3, 15),
(22, 9, 10),
(23, 2, 18),
(23, 4, 14),
(23, 6, 8),
(23, 8, 5),
(24, 1, 22),
(24, 3, 14),
(24, 5, 10),
(24, 7, 5),
(24, 9, 3),
(25, 1, 25),
(25, 4, 12),
(25, 6, 8),
(25, 8, 5),
(25, 9, 4),
(25, 10, 3),
(26, 2, 10),
(26, 5, 12),
(27, 3, 5),
(27, 8, 7),
(27, 9, 4),
(28, 1, 10),
(28, 4, 12),
(28, 6, 6),
(28, 7, 8),
(29, 6, 8),
(29, 7, 4),
(30, 10, 12),
(30, 1, 8),
(31, 4, 6),
(31, 6, 5),
(32, 5, 10),
(32, 2, 7),
(32, 8, 5),
(33, 3, 15),
(33, 7, 10),
(34, 6, 4),
(34, 1, 7),
(35, 9, 15),
(35, 10, 12),
(36, 2, 8),
(36, 4, 7),
(37, 1, 4),
(37, 6, 6),
(38, 5, 8),
(38, 8, 10),
(39, 2, 20),
(39, 5, 15),
(39, 9, 12),
(40, 7, 10),
(40, 3, 12),
(50, 1, 5),
(49, 6, 10),
(49, 9, 18),
(49, 4, 14),
(49, 3, 12),
(48, 8, 5),
(48, 7, 6),
(48, 1, 8),
(47, 6, 3),
(47, 2, 4),
(46, 10, 30),
(45, 5, 6),
(45, 6, 8),
(46, 7, 18),
(46, 8, 22),
(46, 9, 15),
(45, 4, 7),
(44, 3, 3),
(44, 1, 2),
(43, 7, 15),
(43, 6, 12),
(42, 5, 4),
(42, 4, 6),
(42, 3, 5),
(41, 1, 3),
(43, 8, 10),
(41, 2, 2),
(43, 9, 20),
(51, 9, 6),
(51, 10, 4),
(51, 1, 8),
(52, 2, 20),
(52, 3, 25),
(52, 4, 30),
(53, 5, 2),
(53, 6, 3),
(54, 7, 6),
(54, 8, 7),
(54, 9, 5),
(55, 10, 15),
(55, 1, 20),
(55, 2, 25),
(56, 6, 6),
(56, 7, 7),
(56, 8, 8),
(57, 2, 10),
(58, 3, 5),
(58, 1, 6),
(58, 10, 9),
(59, 10, 7),
(59, 8, 18),
(60, 2, 10),
(60, 7, 3),
(60, 1, 6),
(60, 3, 9),
(61, 7, 6),
(61, 10, 7),
(62, 2, 3),
(62, 3, 8),
(62, 6, 2),
(63, 1, 4),
(63, 5, 7),
(64, 6, 12),
(64, 2, 10),
(65, 7, 3),
(65, 10, 6),
(65, 3, 5),
(50, 10, 3),
(25, 24, 5),
(25, 19, 6),
(25, 20, 9),
(25, 17, 8),
(24, 18, 7),
(24, 25, 10),
(24, 16, 9),
(24, 15, 6),
(23, 17, 5),
(23, 14, 10),
(23, 22, 8),
(23, 11, 12),
(22, 13, 7),
(4, 22, 9),
(4, 21, 7),
(4, 20, 8),
(4, 19, 6),
(3, 18, 12),
(3, 17, 5),
(3, 16, 10),
(3, 15, 4),
(2, 14, 6),
(2, 13, 8),
(2, 12, 7),
(2, 11, 5),
(22, 12, 9),
(22, 21, 8),
(22, 16, 10),
(21, 14, 8),
(21, 11, 10),
(21, 19, 7),
(21, 24, 6),
(20, 22, 4),
(20, 13, 8),
(20, 25, 9),
(20, 18, 5),
(19, 21, 8),
(19, 12, 7),
(19, 16, 10),
(19, 14, 6),
(18, 23, 4),
(18, 19, 12),
(18, 17, 5),
(18, 22, 10),
(17, 24, 9),
(17, 21, 5),
(17, 18, 7),
(17, 13, 6),
(16, 20, 8),
(16, 19, 6),
(16, 12, 9),
(16, 25, 10),
(15, 16, 7),
(15, 23, 5),
(15, 14, 6),
(15, 11, 8),
(14, 17, 7),
(14, 22, 8),
(14, 20, 5),
(14, 13, 6),
(13, 21, 8),
(13, 19, 6),
(13, 16, 9),
(13, 14, 4),
(12, 25, 5),
(12, 24, 6),
(12, 23, 10),
(12, 17, 7),
(11, 22, 6),
(11, 13, 8),
(11, 12, 5),
(11, 11, 10),
(10, 18, 6),
(10, 20, 12),
(5, 23, 10),
(10, 16, 9),
(10, 14, 8),
(9, 25, 10),
(9, 23, 8),
(9, 19, 6),
(9, 17, 5),
(8, 24, 7),
(8, 16, 10),
(8, 15, 4),
(8, 13, 9),
(7, 22, 12),
(7, 21, 10),
(7, 19, 8),
(7, 12, 6),
(6, 20, 9),
(6, 18, 3),
(6, 14, 7),
(6, 11, 5),
(5, 26, 3),
(5, 25, 6),
(5, 24, 5),
(26, 11, 8),
(26, 12, 10),
(26, 13, 6),
(26, 14, 7),
(26, 15, 5),
(26, 16, 4),
(26, 17, 9),
(27, 18, 5),
(27, 19, 7),
(27, 20, 8),
(27, 21, 6),
(27, 22, 9),
(27, 23, 10),
(27, 24, 4),
(28, 25, 6),
(28, 11, 8),
(28, 12, 7),
(28, 13, 10),
(28, 14, 5),
(28, 15, 6),
(28, 16, 4),
(29, 17, 5),
(29, 18, 6),
(29, 19, 7),
(29, 20, 10),
(29, 21, 6),
(29, 22, 8),
(29, 23, 9),
(30, 14, 8),
(30, 15, 6),
(30, 16, 9),
(30, 17, 7),
(30, 18, 10),
(30, 19, 6),
(30, 20, 5),
(31, 21, 9),
(31, 22, 8),
(31, 23, 6),
(31, 24, 7),
(31, 25, 6),
(31, 16, 5),
(31, 14, 4),
(32, 11, 7),
(32, 12, 10),
(32, 13, 6),
(32, 14, 8),
(32, 15, 5),
(32, 16, 4),
(32, 17, 9),
(33, 18, 6),
(33, 19, 7),
(33, 20, 10),
(33, 21, 5),
(33, 22, 9),
(33, 23, 8),
(33, 24, 5),
(34, 25, 8),
(34, 11, 6),
(34, 12, 9),
(34, 13, 7),
(34, 14, 5),
(34, 15, 6),
(34, 16, 4),
(35, 17, 5),
(35, 18, 8),
(35, 19, 6),
(35, 20, 9),
(35, 21, 7),
(35, 22, 6),
(35, 23, 5),
(36, 14, 10),
(36, 15, 5),
(36, 16, 9),
(36, 17, 7),
(36, 18, 8),
(36, 19, 6),
(36, 20, 5),
(37, 21, 7),
(37, 22, 6),
(37, 23, 8),
(37, 24, 9),
(37, 25, 5),
(37, 16, 4),
(37, 14, 10),
(38, 11, 6),
(38, 12, 9),
(38, 13, 7),
(38, 14, 5),
(38, 15, 8),
(38, 16, 7),
(38, 17, 6),
(39, 18, 9),
(39, 19, 10),
(39, 20, 8),
(39, 21, 6),
(39, 22, 7),
(39, 23, 8),
(39, 24, 5),
(40, 11, 7),
(40, 12, 8),
(40, 13, 6),
(40, 14, 9),
(40, 16, 5),
(40, 17, 10),
(40, 20, 4),
(41, 15, 6),
(41, 16, 9),
(41, 17, 5),
(41, 18, 7),
(41, 19, 8),
(41, 21, 10),
(41, 24, 6),
(42, 11, 8),
(42, 12, 6),
(42, 13, 9),
(42, 14, 7),
(42, 16, 10),
(42, 17, 5),
(42, 20, 6),
(43, 18, 6),
(43, 19, 7),
(43, 20, 10),
(43, 21, 8),
(43, 22, 5),
(43, 23, 6),
(43, 24, 4),
(44, 15, 9),
(44, 16, 8),
(44, 17, 5),
(44, 18, 7),
(44, 19, 10),
(44, 21, 4),
(44, 25, 6),
(45, 12, 7),
(45, 13, 8),
(45, 14, 6),
(45, 15, 5),
(45, 16, 9),
(45, 17, 10),
(45, 22, 7),
(46, 11, 6),
(46, 12, 8),
(46, 13, 9),
(46, 14, 5),
(46, 15, 7),
(46, 18, 6),
(46, 19, 8),
(47, 20, 9),
(47, 21, 6),
(47, 22, 7),
(47, 23, 8),
(47, 24, 9),
(47, 25, 6),
(47, 14, 10),
(48, 15, 8),
(48, 16, 6),
(48, 17, 7),
(48, 18, 5),
(48, 19, 9),
(48, 20, 6),
(48, 21, 4),
(49, 12, 8),
(49, 13, 6),
(49, 14, 7),
(49, 15, 5),
(49, 16, 9),
(49, 17, 6),
(49, 20, 7),
(50, 18, 6),
(50, 19, 7),
(50, 20, 10),
(50, 21, 8),
(50, 22, 5),
(50, 23, 6),
(50, 24, 4),
(51, 15, 7),
(51, 16, 8),
(51, 17, 10),
(51, 18, 5),
(51, 19, 9),
(51, 20, 6),
(51, 23, 4),
(52, 12, 10),
(52, 13, 6),
(52, 14, 7),
(52, 15, 5),
(52, 16, 9),
(52, 17, 7),
(52, 18, 4),
(53, 21, 8),
(53, 22, 9),
(53, 23, 6),
(53, 24, 7),
(53, 25, 10),
(53, 15, 5),
(53, 16, 4),
(54, 14, 6),
(54, 15, 7),
(54, 16, 9),
(54, 17, 5),
(54, 18, 8),
(54, 19, 10),
(54, 20, 6),
(55, 12, 8),
(55, 13, 7),
(55, 14, 5),
(55, 15, 9),
(55, 16, 6),
(55, 17, 10),
(55, 18, 4);

-- --------------------------------------------------------

--
-- Structure de la table `operationcaisse`
--

DROP TABLE IF EXISTS `operationcaisse`;
CREATE TABLE IF NOT EXISTS `operationcaisse` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dateOperation` date DEFAULT NULL,
  `heureOperation` time DEFAULT NULL,
  `totalPaiement` decimal(10,2) DEFAULT NULL,
  `idCaisse` int DEFAULT NULL,
  `idSalarie` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idCaisse` (`idCaisse`),
  KEY `idSalarie` (`idSalarie`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `operationcaisse`
--

INSERT INTO `operationcaisse` (`id`, `dateOperation`, `heureOperation`, `totalPaiement`, `idCaisse`, `idSalarie`) VALUES
(1, '2024-11-29', '12:00:00', 300.40, 5, 5),
(2, '2024-11-28', '09:00:00', 500.00, 4, 4),
(3, '2024-11-27', '16:30:00', 125.30, 3, 3),
(4, '2024-11-26', '14:00:00', 200.50, 2, 2),
(5, '2024-11-25', '10:00:00', 150.75, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `parametrecaisse`
--

DROP TABLE IF EXISTS `parametrecaisse`;
CREATE TABLE IF NOT EXISTS `parametrecaisse` (
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `parametrecaisse`
--

INSERT INTO `parametrecaisse` (`id`) VALUES
(1);

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

DROP TABLE IF EXISTS `produit`;
CREATE TABLE IF NOT EXISTS `produit` (
  `id` int NOT NULL AUTO_INCREMENT,
  `codeProduit` varchar(30) NOT NULL,
  `stockMag` int DEFAULT NULL,
  `stockMiniMag` int DEFAULT NULL,
  `designationProduit` varchar(100) NOT NULL,
  `prixPdt` decimal(10,2) DEFAULT NULL,
  `stockEntrepot` int DEFAULT NULL,
  `idCategorie` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idCategorie` (`idCategorie`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`id`, `codeProduit`, `stockMag`, `stockMiniMag`, `designationProduit`, `prixPdt`, `stockEntrepot`, `idCategorie`) VALUES
(1, 'P001', 200, 20, 'Coca-Cola', 1.80, 600, 3),
(2, 'P002', 120, 12, 'Salades', 1.50, 400, 2),
(3, 'P003', 80, 8, 'Carottes', 1.20, 200, 2),
(4, 'P004', 50, 5, 'Bananes', 3.00, 300, 1),
(5, 'P005', 100, 10, 'Pommes', 2.50, 500, 1),
(6, 'P006', 150, 15, 'Pepsi', 1.70, 500, 3),
(7, 'P007', 90, 9, 'Lait entier', 1.10, 300, 4),
(8, 'P008', 110, 11, 'Yaourt nature', 0.80, 400, 4),
(9, 'P009', 60, 6, 'Pain de campagne', 2.00, 200, 5),
(10, 'P010', 50, 5, 'Croissants', 1.50, 150, 5),
(11, 'P011', 120, 10, 'Oranges', 2.20, 400, 1),
(12, 'P012', 80, 8, 'Pommes de terre', 1.30, 300, 1),
(13, 'P013', 50, 5, 'Courgettes', 1.80, 150, 2),
(14, 'P014', 90, 10, 'Tomates', 2.00, 250, 2),
(15, 'P015', 200, 20, 'Sprite', 1.50, 600, 3),
(16, 'P016', 150, 15, 'Fanta', 1.60, 500, 3),
(17, 'P017', 120, 10, 'Lait demi-écrémé', 1.00, 400, 4),
(18, 'P018', 80, 8, 'Fromage râpé', 2.50, 200, 4),
(19, 'P019', 100, 10, 'Pain de mie', 1.60, 500, 5),
(20, 'P020', 50, 5, 'Baguettes', 1.00, 200, 5),
(21, 'P021', 110, 11, 'Pêches', 2.40, 450, 1),
(22, 'P022', 70, 7, 'Mangues', 3.50, 200, 1),
(23, 'P023', 150, 15, 'Oignons', 1.10, 350, 2),
(24, 'P024', 100, 10, 'Poivrons', 2.30, 300, 2),
(25, 'P025', 200, 20, 'Coca-Cola Zéro', 1.80, 550, 3),
(26, 'P026', 180, 18, 'Limonade', 1.90, 500, 3),
(27, 'P027', 130, 13, 'Beurre doux', 2.80, 400, 4),
(28, 'P028', 90, 9, 'Yaourt à la grecque', 1.40, 250, 4),
(29, 'P029', 60, 6, 'Pain complet', 1.90, 200, 5),
(30, 'P030', 150, 15, 'Pain de campagne', 2.20, 450, 5);

-- --------------------------------------------------------

--
-- Structure de la table `salarie`
--

DROP TABLE IF EXISTS `salarie`;
CREATE TABLE IF NOT EXISTS `salarie` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idType` int DEFAULT NULL,
  `matriculeSalarie` varchar(20) DEFAULT NULL,
  `nomSalarie` varchar(50) DEFAULT NULL,
  `prenomSalarie` varchar(50) DEFAULT NULL,
  `identifiant` varchar(50) DEFAULT NULL,
  `motDePasse` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `identifiant` (`identifiant`),
  KEY `idType` (`idType`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `salarie`
--

INSERT INTO `salarie` (`id`, `idType`, `matriculeSalarie`, `nomSalarie`, `prenomSalarie`, `identifiant`, `motDePasse`) VALUES
(1, 1, 'M10001', 'Dupont', 'Jean', 'jdupont', 'tTK?ydM6B$'),
(2, 2, 'M10002', 'Durand', 'Marie', 'mdurant', '5?yx#s?bJj'),
(3, 1, 'M10003', 'Lemoine', 'Paul', 'plemoine', 'Lm?Yt$QN5&'),
(4, 2, 'M10004', 'Bernard', 'Sophie', 'sbernard', '$xSdD9escK'),
(5, 1, 'M10005', 'Martin', 'Pierre', 'pmartin', 'zR#Jhk5!PH');

-- --------------------------------------------------------

--
-- Structure de la table `tarificationproduit`
--

DROP TABLE IF EXISTS `tarificationproduit`;
CREATE TABLE IF NOT EXISTS `tarificationproduit` (
  `idProduit` int NOT NULL,
  `tauxTVA` decimal(5,2) DEFAULT NULL,
  `prixUnitaire` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`idProduit`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `tarificationproduit`
--

INSERT INTO `tarificationproduit` (`idProduit`, `tauxTVA`, `prixUnitaire`) VALUES
(1, 5.00, 2.50),
(3, 5.00, 1.20),
(2, 5.00, 3.00),
(4, 5.00, 1.50),
(5, 5.00, 1.80),
(6, 5.00, 1.70),
(7, 5.00, 1.10),
(8, 5.00, 0.80),
(9, 5.00, 2.00),
(10, 5.00, 1.50);

-- --------------------------------------------------------

--
-- Structure de la table `typesalarie`
--

DROP TABLE IF EXISTS `typesalarie`;
CREATE TABLE IF NOT EXISTS `typesalarie` (
  `id` int NOT NULL AUTO_INCREMENT,
  `libelleType` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `typesalarie`
--

INSERT INTO `typesalarie` (`id`, `libelleType`) VALUES
(1, 'vendeur'),
(2, 'preparateur');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
