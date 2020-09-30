-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  Dim 27 sep. 2020 à 12:29
-- Version du serveur :  5.7.24
-- Version de PHP :  7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `midaproject`
--

-- --------------------------------------------------------

--
-- Structure de la table `agreement_sellings`
--

DROP TABLE IF EXISTS `agreement_sellings`;
CREATE TABLE IF NOT EXISTS `agreement_sellings` (
  `id_agreement` bigint(20) NOT NULL,
  `advanced` double NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `final_price` double NOT NULL,
  `state` enum('CREE','ANNULE','CONCLU','') DEFAULT 'CREE',
  `updated_date` datetime DEFAULT NULL,
  `lawyer_id` bigint(20) DEFAULT NULL,
  `visit_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id_agreement`),
  UNIQUE KEY `UK_n86nsjjmp3m991x3shs76ebu3` (`visit_id`),
  KEY `FKntav8nc17n6d1om0wul5hoinb` (`lawyer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `agreement_sellings`
--

INSERT INTO `agreement_sellings` (`id_agreement`, `advanced`, `created_date`, `final_price`, `state`, `updated_date`, `lawyer_id`, `visit_id`) VALUES
(39, 250000, NULL, 300000, 'CONCLU', '2020-08-07 12:15:04', 6, 38),
(43, 230000, NULL, 345000, 'ANNULE', '2020-08-07 15:38:04', 6, 42);

-- --------------------------------------------------------

--
-- Structure de la table `apartments`
--

DROP TABLE IF EXISTS `apartments`;
CREATE TABLE IF NOT EXISTS `apartments` (
  `id_apartment` bigint(20) NOT NULL,
  `number` int(11) NOT NULL,
  `price` varchar(255) DEFAULT NULL,
  `rooms` int(11) NOT NULL,
  `state_apart` bit(1) NOT NULL,
  `surface` int(11) NOT NULL,
  `updated_date` datetime DEFAULT NULL,
  `building_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_apartment`),
  KEY `FKr2gnfdtdjbc8uyss7rlsf9jxk` (`building_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `apartments`
--

INSERT INTO `apartments` (`id_apartment`, `number`, `price`, `rooms`, `state_apart`, `surface`, `updated_date`, `building_id`) VALUES
(4, 1, '300000', 3, b'0', 180, '2020-08-07 12:50:22', 3),
(16, 11, '280000', 2, b'1', 100, '2020-07-05 08:54:13', 3);

-- --------------------------------------------------------

--
-- Structure de la table `buildings`
--

DROP TABLE IF EXISTS `buildings`;
CREATE TABLE IF NOT EXISTS `buildings` (
  `id_building` bigint(20) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_building`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `buildings`
--

INSERT INTO `buildings` (`id_building`, `address`, `name`) VALUES
(3, 'lomé,baguida', 'Palais rose');

-- --------------------------------------------------------

--
-- Structure de la table `cancellations`
--

DROP TABLE IF EXISTS `cancellations`;
CREATE TABLE IF NOT EXISTS `cancellations` (
  `id_cancel` bigint(20) NOT NULL,
  `cancelled_date` datetime DEFAULT NULL,
  `reason` text,
  `agreement_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id_cancel`),
  UNIQUE KEY `UK_kocv8l87bbhcrqpfy8l5s7wjv` (`agreement_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `cancellations`
--

INSERT INTO `cancellations` (`id_cancel`, `cancelled_date`, `reason`, `agreement_id`) VALUES
(44, '2020-08-07 15:38:04', 'deoooo', 43);

-- --------------------------------------------------------

--
-- Structure de la table `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `id_customer` bigint(20) NOT NULL,
  `address_customer` varchar(255) DEFAULT NULL,
  `cin` varchar(255) DEFAULT NULL,
  `firstname1` varchar(255) DEFAULT NULL,
  `firstname2` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `work` varchar(255) DEFAULT NULL,
  `user_customer_id` bigint(20) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id_customer`),
  KEY `FK25yskrsgrpexko4mkhk0sfw77` (`user_customer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `customers`
--

INSERT INTO `customers` (`id_customer`, `address_customer`, `cin`, `firstname1`, `firstname2`, `surname`, `tel`, `work`, `user_customer_id`, `created_date`) VALUES
(34, 'Atakpamé', 'CCC677', 'Armand', 'Afivi', 'AKA', '+22945678534', 'coiffeuse', 23, '2020-08-06 19:15:04'),
(37, 'Lomé,Agbalepedo', 'CCC699G', 'Myramice', 'afiwa', 'AYIVOR', '+22892630646', 'chomeuse', 23, '2020-08-07 12:10:43'),
(41, 'Lomé,Atikoumé', 'DFJHH', 'GAB', 'GAB', 'BLAKIME', '+22898566423', 'Chercheur et Entrepreneur', 23, '2020-08-07 15:35:35');

-- --------------------------------------------------------

--
-- Structure de la table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
CREATE TABLE IF NOT EXISTS `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `hibernate_sequence`
--

INSERT INTO `hibernate_sequence` (`next_val`) VALUES
(45),
(45),
(45),
(45),
(45),
(45),
(45),
(45);

-- --------------------------------------------------------

--
-- Structure de la table `lawyers`
--

DROP TABLE IF EXISTS `lawyers`;
CREATE TABLE IF NOT EXISTS `lawyers` (
  `id_lawyer` bigint(20) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `autorisation_num` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `tel1` varchar(255) DEFAULT NULL,
  `tel2` varchar(255) DEFAULT NULL,
  `tel3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_lawyer`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `lawyers`
--

INSERT INTO `lawyers` (`id_lawyer`, `address`, `autorisation_num`, `firstname`, `surname`, `tel1`, `tel2`, `tel3`) VALUES
(6, 'Lomé,avénou', '33TY', 'Kristian', 'LABAN', '+22857899945', '+22857899988', '+22897899945');

-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
(1, 'ADMIN'),
(2, 'AGENT');

-- --------------------------------------------------------

--
-- Structure de la table `roles_users`
--

DROP TABLE IF EXISTS `roles_users`;
CREATE TABLE IF NOT EXISTS `roles_users` (
  `role_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  KEY `FKsmos02hm32191ogexm2ljik9x` (`role_id`),
  KEY `FKlkcn1l0gnfshcn4rnmak73ta` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `roles_users`
--

INSERT INTO `roles_users` (`role_id`, `user_id`) VALUES
(1, 23),
(2, 21),
(2, 35),
(2, 36),
(2, 40);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id_user` bigint(20) NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `pass` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id_user`, `created_date`, `address`, `email`, `firstname`, `surname`, `pass`) VALUES
(36, '2020-08-07 11:59:51', 'Lomé,sanguera', 'sekm@gmail.com', 'Mireille', 'ADJAOUTE', '$2a$10$8LmvbOqCkJ7qhUQcr4QjSuAL2lBYhbLIJ0HbpGCR1f1UON0Z1J0Ea'),
(23, '2020-08-04 14:57:46', 'Lomé,avedji', 'kezHa@gmail.com', 'Hambiya', 'KEZIRE', '$2a$10$hzCgLcdAROQPVFo0gYxa3.N9un/Z5BhC.wCL96ZEbt1KcY0XsPgjG'),
(40, '2020-08-07 15:33:47', 'Lomé,sanguera', 'ap@gmail.com', 'ap', 'Aki', '$2a$10$E2vf1MN1k.dMlyvWdiN50e0EM5173KWSyuILtHGHj4j//Qc2g9VDW'),
(35, '2020-08-06 19:33:42', 'Lomé,avedji', 'emile@gmail.com', 'Emile', 'AVEKO', '$2a$10$CHflR7Yxoxnyas1nqxW0Y.d8VzrhL/uw9Rr6E5ePO03H1RfxGn6.W');

-- --------------------------------------------------------

--
-- Structure de la table `visits`
--

DROP TABLE IF EXISTS `visits`;
CREATE TABLE IF NOT EXISTS `visits` (
  `id` bigint(20) NOT NULL,
  `date_visit` datetime DEFAULT NULL,
  `is_interessed` bit(1) NOT NULL,
  `remark` text,
  `apart_id` bigint(20) NOT NULL,
  `customer_id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKpmiri35vtkjd8dkv0ujstqx85` (`apart_id`),
  KEY `FKqi3oh1lhfuae6hgu52joagnxt` (`customer_id`),
  KEY `FK5kmnbgokfpcalwrminoedrb68` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `visits`
--

INSERT INTO `visits` (`id`, `date_visit`, `is_interessed`, `remark`, `apart_id`, `customer_id`, `user_id`) VALUES
(38, '2020-08-07 12:13:09', b'0', 'pas chic', 16, 37, 23),
(42, '2020-08-07 15:36:43', b'0', 'splendide', 4, 34, 23);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
