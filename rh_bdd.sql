-- phpMyAdmin SQL Dump
-- version 3.3.9.2
-- http://www.phpmyadmin.net
--
-- Serveur: 127.0.0.1
-- Généré le : Jeu 15 Décembre 2022 à 09:29
-- Version du serveur: 5.5.10
-- Version de PHP: 5.3.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `rh`
--

-- --------------------------------------------------------

--
-- Structure de la table `employer`
--

CREATE TABLE IF NOT EXISTS `employer` (
  `NoEmp` int(11) NOT NULL,
  `Nom` varchar(20) NOT NULL,
  `Prénom` varchar(20) NOT NULL,
  `Sexe` varchar(20) NOT NULL,
  `Salaire` int(11) NOT NULL,
  `TypeContrat` varchar(20) NOT NULL,
  `Fonction` varchar(20) NOT NULL,
  `Site` varchar(20) NOT NULL,
  `Date_embauche` date NOT NULL,
  `Date_De_Naissance` date NOT NULL,
  `NoSrv` int(11) NOT NULL,
  PRIMARY KEY (`NoEmp`),
  KEY `NoSrv` (`NoSrv`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `employer`
--

INSERT INTO `employer` (`NoEmp`, `Nom`, `Prénom`, `Sexe`, `Salaire`, `TypeContrat`, `Fonction`, `Site`, `Date_embauche`, `Date_De_Naissance`, `NoSrv`) VALUES
(256, 'tlalo', 'mopis', 'masculin', 1450, 'CDD', 'chercheur', 'creteil', '2014-04-16', '1997-02-11', 1),
(257, 'toli', 'iert', 'feminin', 1500, 'CDI', 'comptable', 'versaille', '2022-12-14', '2000-02-22', 2);

-- --------------------------------------------------------

--
-- Structure de la table `intervenir`
--

CREATE TABLE IF NOT EXISTS `intervenir` (
  `Num_Interv` int(11) NOT NULL,
  `NoProjet` int(11) NOT NULL,
  `NoEmp` int(11) NOT NULL,
  `NbHeure` int(11) NOT NULL,
  PRIMARY KEY (`Num_Interv`),
  KEY `NoProjet` (`NoProjet`,`NoEmp`),
  KEY `NoEmp` (`NoEmp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `intervenir`
--

INSERT INTO `intervenir` (`Num_Interv`, `NoProjet`, `NoEmp`, `NbHeure`) VALUES
(111, 16, 256, 39),
(222, 32, 257, 39);

-- --------------------------------------------------------

--
-- Structure de la table `projet`
--

CREATE TABLE IF NOT EXISTS `projet` (
  `NoProjet` int(11) NOT NULL,
  `LibelleProjet` varchar(20) NOT NULL,
  `NoSrv` int(11) NOT NULL,
  PRIMARY KEY (`NoProjet`),
  KEY `NoSrv` (`NoSrv`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `projet`
--

INSERT INTO `projet` (`NoProjet`, `LibelleProjet`, `NoSrv`) VALUES
(16, 'terminus', 1),
(32, 'trésorerie', 2);

-- --------------------------------------------------------

--
-- Structure de la table `service`
--

CREATE TABLE IF NOT EXISTS `service` (
  `NoSrv` int(11) NOT NULL,
  `NomSrv` varchar(20) NOT NULL,
  PRIMARY KEY (`NoSrv`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `service`
--

INSERT INTO `service` (`NoSrv`, `NomSrv`) VALUES
(1, 'serv1'),
(2, 'serv2');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `employer`
--
ALTER TABLE `employer`
  ADD CONSTRAINT `employer_ibfk_1` FOREIGN KEY (`NoSrv`) REFERENCES `service` (`NoSrv`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `intervenir`
--
ALTER TABLE `intervenir`
  ADD CONSTRAINT `intervenir_ibfk_2` FOREIGN KEY (`NoEmp`) REFERENCES `employer` (`NoEmp`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `intervenir_ibfk_1` FOREIGN KEY (`NoProjet`) REFERENCES `projet` (`NoProjet`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `projet`
--
ALTER TABLE `projet`
  ADD CONSTRAINT `projet_ibfk_1` FOREIGN KEY (`NoSrv`) REFERENCES `service` (`NoSrv`) ON DELETE CASCADE ON UPDATE CASCADE;
