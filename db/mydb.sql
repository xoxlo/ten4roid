# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 11.2.2-MariaDB)
# Database: mydb
# Generation Time: 2024-02-15 08:31:51 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table board
# ------------------------------------------------------------

DROP TABLE IF EXISTS `board`;

CREATE TABLE `board` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL DEFAULT '',
  `content` text DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `board_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;

INSERT INTO `board` (`id`, `title`, `content`, `user_id`)
VALUES
	(4,'테스트','입니다 테스트',1),
	(5,'안녕하세요4','Spring boot 테스트',1),
	(7,'제목1','내용!!! 테스트',1),
	(11,'ㅎㅇ','안녕ㅎ세연',1),
	(19,'TEST','TEST',7),
	(20,'123','123',7),
	(22,'반갑습니다.',NULL,9),
	(23,'안녕하세요 !','반갑습니다.',12),
	(24,'안녕하세요 !','반갑습니다.',13),
	(25,'안녕하세요 !','반갑습니다.',17);

/*!40000 ALTER TABLE `board` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;

INSERT INTO `role` (`id`, `name`)
VALUES
	(1,'ROLE_USER'),
	(2,'ROLE_ADMIN');

/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT '',
  `password` varchar(100) DEFAULT '',
  `enabled` bit(1) DEFAULT b'0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;

INSERT INTO `user` (`id`, `username`, `password`, `enabled`)
VALUES
	(1,'songchangseok','$2a$10$GtSrkUx.lPa6ZGjAKZnTzOtzqx23eb.6YErQ/2hkN5pxS465u.b/C',b'1'),
	(7,'song123','$2a$10$YGTleCNl47JHR33zOo6BM.U3QIc//ZVgFft694hZfU2StwkHA34Se',b'1'),
	(8,'song2','$2a$10$KJoARZRyri27.PxldPP/i..ataEaa.aLHsiawb78ZxSPYqVzeCNam',b'1'),
	(9,'user1','$2a$10$.pYtDL9OMhGePcci6gc13euA7eEchlj/eBizsLlz6Mubua..SLV9.',b'1'),
	(10,'user2','$2a$10$DbUAR3BJd3Jqr/tFklBi5e1hR4YKYDd4IMjP2H35OzvS6XWf1fbIK',b'1'),
	(12,'user3','$2a$10$b2wVGpCdFF9MIDAINk0IZe8BOV116ao90c2IhrGoGaLTvjDPe0.6C',b'1'),
	(13,'user4','$2a$10$OWWmiGBk1ETj.G0e9ugjcOtSLzXqFMacObVeHxqBY7lcVpjrmU9d2',b'1'),
	(14,'user5','$2a$10$5SwjL6F9bYvHXMHLGH6f.eat/g0AXZgoxLy.bte4Q5VgC.PVrdVsm',b'1'),
	(17,'hihi','$2a$10$A4yg7KgOreuMKrFqW3JAJew8xCQpwbc/fZShjL4iQTfZXixhZEmgm',b'1');

/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user_role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_role`;

CREATE TABLE `user_role` (
  `user_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `user_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;

INSERT INTO `user_role` (`user_id`, `role_id`)
VALUES
	(7,1),
	(8,1),
	(9,1),
	(10,1),
	(12,1),
	(13,1),
	(14,1),
	(17,1),
	(1,2);

/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
