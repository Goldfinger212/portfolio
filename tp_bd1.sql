-- phpMyAdmin SQL Dump
-- version 3.3.9.2
-- http://www.phpmyadmin.net
--
-- Serveur: 127.0.0.1
-- Généré le : Jeu 08 Décembre 2022 à 10:37
-- Version du serveur: 5.5.10
-- Version de PHP: 5.3.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `location_voiture2023`
--

-- --------------------------------------------------------

--
-- Structure de la table `clients`
--

CREATE TABLE IF NOT EXISTS `clients` (
  `code_clients` varchar(20) NOT NULL,
  `nom_prenom` varchar(20) NOT NULL,
  `date_naissance` date NOT NULL,
  `profession` varchar(20) NOT NULL,
  `num_tel` varchar(20) NOT NULL,
  `adresse` varchar(20) NOT NULL,
  `code_postal` int(11) NOT NULL,
  `ville` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  PRIMARY KEY (`code_clients`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `clients`
--

INSERT INTO `clients` (`code_clients`, `nom_prenom`, `date_naissance`, `profession`, `num_tel`, `adresse`, `code_postal`, `ville`, `email`) VALUES
('clientA0', 'gon_ta', '0000-00-00', 'chaufeur de bus', '625485789', '54 rue laurent_bazar', 91547, 'postal', 'gont@gmail.com'),
('clientA5', 'louis', '2000-12-14', 'chaufeur de voiture', '0625485788', '54_rue_laurent_lasse', 91545, 'postalase', 'louis@gmail.com');

-- --------------------------------------------------------

--
-- Structure de la table `location`
--

CREATE TABLE IF NOT EXISTS `location` (
  `id_location` varchar(20) NOT NULL,
  `duree_location` int(11) NOT NULL,
  `date_location` date NOT NULL,
  `prix_location` int(11) NOT NULL,
  `code_client` varchar(20) NOT NULL,
  `immatriculation` varchar(20) NOT NULL,
  `caution` int(11) NOT NULL,
  PRIMARY KEY (`id_location`),
  KEY `immatriculation` (`immatriculation`),
  KEY `code_client` (`code_client`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `location`
--

INSERT INTO `location` (`id_location`, `duree_location`, `date_location`, `prix_location`, `code_client`, `immatriculation`, `caution`) VALUES
('L145', 3, '2004-12-16', 5874, 'clientA0', 'TUR 22 none', 0),
('L589', 1, '2016-12-15', 87985, 'clientA5', 'TUR 21 none', 0);

-- --------------------------------------------------------

--
-- Structure de la table `réparation`
--

CREATE TABLE IF NOT EXISTS `réparation` (
  `Num_réparation` int(11) NOT NULL,
  `date_réparation` date NOT NULL,
  `duree_réparation` varchar(100) NOT NULL,
  `cout_réparation` varchar(255) NOT NULL,
  `responsable_rép` varchar(255) NOT NULL,
  `immatriculation` varchar(255) NOT NULL,
  PRIMARY KEY (`Num_réparation`),
  KEY `immatriculation` (`immatriculation`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `réparation`
--


-- --------------------------------------------------------

--
-- Structure de la table `voitures`
--

CREATE TABLE IF NOT EXISTS `voitures` (
  `immatriculation` varchar(20) NOT NULL,
  `marque` varchar(20) NOT NULL,
  `modele` varchar(20) NOT NULL,
  `kilometrage` int(11) NOT NULL,
  `carburant` varchar(20) NOT NULL,
  `couleur` varchar(20) NOT NULL,
  `nbr_place` int(11) NOT NULL,
  `nbr_porte` int(11) NOT NULL,
  `prix_achat` varchar(20) NOT NULL,
  `etat` varchar(20) NOT NULL,
  PRIMARY KEY (`immatriculation`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `voitures`
--

INSERT INTO `voitures` (`immatriculation`, `marque`, `modele`, `kilometrage`, `carburant`, `couleur`, `nbr_place`, `nbr_porte`, `prix_achat`, `etat`) VALUES
('TUR 21 none', 'bmw', 'gyu', 20, 'diesel', 'noir', 4, 4, '1000000', 'neuf'),
('TUR 22 none', 'bmw', 'ieher', 20, 'diesel', 'bleu', 4, 4, '5000', 'usée');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `location`
--
ALTER TABLE `location`
  ADD CONSTRAINT `location_ibfk_2` FOREIGN KEY (`immatriculation`) REFERENCES `voitures` (`immatriculation`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `location_ibfk_1` FOREIGN KEY (`code_client`) REFERENCES `clients` (`code_clients`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `réparation`
--
ALTER TABLE `réparation`
  ADD CONSTRAINT `r@0pparation_ibfk_1` FOREIGN KEY (`immatriculation`) REFERENCES `voitures` (`immatriculation`) ON DELETE CASCADE ON UPDATE CASCADE;
