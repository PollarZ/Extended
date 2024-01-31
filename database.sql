CREATE DATABASE IF NOT EXISTS `extended` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci */;
USE `extended`;

DROP TABLE IF EXISTS `accounts`;
CREATE TABLE IF NOT EXISTS `accounts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Whitelist` tinyint(1) NOT NULL DEFAULT 0,
  `Characters` int(10) NOT NULL DEFAULT 1,
  `Gemstone` int(20) NOT NULL DEFAULT 0,
  `Premium` int(20) NOT NULL DEFAULT 0,
  `Banned` int(20) NOT NULL DEFAULT 0,
  `Discord` varchar(50) NOT NULL DEFAULT '0',
  `License` varchar(50) NOT NULL DEFAULT '0',
  `Login` int(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `license` (`License`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `characters`;
CREATE TABLE IF NOT EXISTS `characters` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `License` varchar(50) DEFAULT NULL,
  `Phone` varchar(10) DEFAULT NULL,
  `Name` varchar(50) DEFAULT 'Individuo',
  `Lastname` varchar(50) DEFAULT 'Indigente',
  `Sex` varchar(1) NOT NULL DEFAULT 'M',
  `Skin` varchar(50) NOT NULL DEFAULT 'mp_m_freemode_01',
  `Bank` int(20) NOT NULL DEFAULT 5000,
  `Blood` int(1) NOT NULL DEFAULT 1,
  `Prison` int(10) NOT NULL DEFAULT 0,
  `Deleted` int(1) NOT NULL DEFAULT 0,
  `Avatar` varchar(254) NOT NULL DEFAULT 'https://source.unsplash.com/random/',
  `Badge` int(3) NOT NULL DEFAULT 0,
  `Medic` int(20) NOT NULL DEFAULT 0,
  `Created` int(20) NOT NULL DEFAULT 0,
  `Login` int(20) NOT NULL DEFAULT 0,
  `paypal` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `license` (`License`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `chests`;
CREATE TABLE IF NOT EXISTS `chests` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `Weight` int(10) NOT NULL DEFAULT 500,
  `Slots` int(20) NOT NULL DEFAULT 50,
  `Permission` varchar(50) NOT NULL DEFAULT 'Admin',
  `Premium` int(20) NOT NULL DEFAULT 0,
  `Bank` int(20) NOT NULL DEFAULT 0,
  `Logs` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `dependents`;
CREATE TABLE IF NOT EXISTS `dependents` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Passport` int(10) NOT NULL DEFAULT 0,
  `Dependent` int(10) NOT NULL DEFAULT 0,
  `Name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Passport` (`Passport`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `entitydata`;
CREATE TABLE IF NOT EXISTS `entitydata` (
  `Name` varchar(100) NOT NULL,
  `Information` longtext DEFAULT NULL,
  PRIMARY KEY (`Name`),
  KEY `Information` (`Name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `entitydata` (`Name`, `Information`) VALUES
('Permissions:Admin', '{\"1\":1}');

DROP TABLE IF EXISTS `fines`;
CREATE TABLE IF NOT EXISTS `fines` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Passport` int(10) NOT NULL DEFAULT 0,
  `Name` varchar(50) NOT NULL,
  `Date` varchar(50) NOT NULL,
  `Hour` varchar(50) NOT NULL,
  `Price` int(20) NOT NULL,
  `Message` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Passport` (`Passport`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `hwid`;
CREATE TABLE IF NOT EXISTS `hwid` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Account` int(10) NOT NULL DEFAULT 1,
  `Token` varchar(250) NOT NULL DEFAULT '0',
  `Banned` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `investments`;
CREATE TABLE IF NOT EXISTS `investments` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `Passport` int(10) NOT NULL DEFAULT 0,
  `Liquid` int(20) NOT NULL DEFAULT 0,
  `Monthly` int(20) NOT NULL DEFAULT 0,
  `Deposit` int(20) NOT NULL DEFAULT 0,
  `Last` int(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `Passport` (`Passport`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `invoices`;
CREATE TABLE IF NOT EXISTS `invoices` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `Passport` int(10) NOT NULL DEFAULT 0,
  `Received` int(10) NOT NULL DEFAULT 0,
  `Type` varchar(50) NOT NULL,
  `Reason` longtext NOT NULL,
  `Holder` varchar(50) NOT NULL,
  `Price` int(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `Passport` (`Passport`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `painel`;
CREATE TABLE IF NOT EXISTS `painel` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `Passport` int(10) NOT NULL DEFAULT 0,
  `Permission` varchar(50) NOT NULL,
  `Type` varchar(50) NOT NULL,
  `Price` int(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Permission` (`Permission`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `playerdata`;
CREATE TABLE IF NOT EXISTS `playerdata` (
  `Passport` int(10) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Information` longtext DEFAULT NULL,
  PRIMARY KEY (`Passport`,`Name`),
  KEY `Passport` (`Passport`),
  KEY `Information` (`Name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `police_courses`;
CREATE TABLE IF NOT EXISTS `police_courses` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Passport` int(20) DEFAULT 0,
  `Police` int(20) DEFAULT 0,
  `Type` varchar(255) DEFAULT 'Segurança',
  `Date` varchar(255) DEFAULT '00/00/0000',
  PRIMARY KEY (`id`),
  KEY `Passport` (`Passport`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `police_messages`;
CREATE TABLE IF NOT EXISTS `police_messages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) DEFAULT 'Individuo Indigente',
  `Message` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `police_prisons`;
CREATE TABLE IF NOT EXISTS `police_prisons` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Passport` int(20) DEFAULT 1,
  `Police` int(20) NOT NULL DEFAULT 0,
  `Crimes` longtext DEFAULT NULL,
  `Notes` longtext DEFAULT NULL,
  `Fines` int(20) DEFAULT 0,
  `Services` int(20) DEFAULT 0,
  `Date` varchar(255) NOT NULL DEFAULT '00/00/0000 ás 00:00',
  PRIMARY KEY (`id`),
  KEY `Passport` (`Passport`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `police_wanted`;
CREATE TABLE IF NOT EXISTS `police_wanted` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Passport` int(20) DEFAULT 1,
  `Police` int(20) NOT NULL DEFAULT 0,
  `Crime` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Passport` (`Passport`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `propertys`;
CREATE TABLE IF NOT EXISTS `propertys` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `Name` varchar(20) NOT NULL DEFAULT 'Homes0001',
  `Interior` varchar(20) NOT NULL DEFAULT 'Middle',
  `Item` int(3) NOT NULL DEFAULT 3,
  `Tax` int(20) NOT NULL DEFAULT 0,
  `Passport` int(11) NOT NULL DEFAULT 0,
  `Serial` varchar(10) NOT NULL,
  `Vault` int(6) NOT NULL DEFAULT 1,
  `Fridge` int(6) NOT NULL DEFAULT 1,
  `Garage` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `Passport` (`Passport`),
  KEY `Name` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `races`;
CREATE TABLE IF NOT EXISTS `races` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `Race` int(5) NOT NULL DEFAULT 0,
  `Passport` int(10) NOT NULL DEFAULT 0,
  `Vehicle` varchar(50) NOT NULL DEFAULT 'Sultan RS',
  `Points` int(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `Passport` (`Passport`),
  KEY `Race` (`Race`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `taxs`;
CREATE TABLE IF NOT EXISTS `taxs` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `Passport` int(10) NOT NULL DEFAULT 0,
  `Name` varchar(50) NOT NULL,
  `Date` varchar(50) NOT NULL,
  `Hour` varchar(50) NOT NULL,
  `Price` int(20) NOT NULL,
  `Message` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Passport` (`Passport`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `transactions`;
CREATE TABLE IF NOT EXISTS `transactions` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `Passport` int(10) NOT NULL DEFAULT 0,
  `Type` varchar(50) NOT NULL,
  `Date` varchar(50) NOT NULL,
  `Price` int(20) NOT NULL,
  `Balance` int(20) NOT NULL,
  `Timeset` int(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `Passport` (`Passport`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `vehicles`;
CREATE TABLE IF NOT EXISTS `vehicles` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `Passport` int(10) NOT NULL DEFAULT 0,
  `Vehicle` varchar(100) DEFAULT NULL,
  `Tax` int(20) NOT NULL DEFAULT 0,
  `Plate` varchar(10) DEFAULT NULL,
  `Rental` int(20) NOT NULL DEFAULT 0,
  `Arrest` tinyint(1) NOT NULL DEFAULT 0,
  `Block` tinyint(1) NOT NULL DEFAULT 0,
  `Engine` int(4) NOT NULL DEFAULT 1000,
  `Body` int(4) NOT NULL DEFAULT 1000,
  `Health` int(4) NOT NULL DEFAULT 1000,
  `Fuel` int(3) NOT NULL DEFAULT 100,
  `Nitro` int(5) NOT NULL DEFAULT 0,
  `Work` tinyint(1) NOT NULL DEFAULT 0,
  `Doors` longtext DEFAULT NULL,
  `Windows` longtext DEFAULT NULL,
  `Tyres` longtext DEFAULT NULL,
  `Drift` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `Passport` (`Passport`),
  KEY `Vehicle` (`Vehicle`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `warehouse`;
CREATE TABLE IF NOT EXISTS `warehouse` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `Weight` int(20) NOT NULL DEFAULT 100,
  `Password` varchar(50) NOT NULL,
  `Passport` int(10) NOT NULL DEFAULT 0,
  `Tax` int(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `Passport` (`Passport`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `smartphone_instagram_posts`;
CREATE TABLE IF NOT EXISTS `smartphone_instagram_posts` (
    `id` bigint(20) NOT NULL AUTO_INCREMENT,
    `profile_id` bigint(20) NOT NULL,
    `post_id` bigint(20) DEFAULT NULL,
    `image` varchar(255) DEFAULT NULL,
    `content` varchar(255) DEFAULT NULL,
    `created_at` bigint(20) NOT NULL,
    `comments` varchar(50) DEFAULT NULL,
    PRIMARY KEY (id),
    KEY `profile_id_index` (`profile_id`),
    KEY `post_id_index` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;