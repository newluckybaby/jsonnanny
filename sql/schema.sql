CREATE DATABASE  IF NOT EXISTS `jsonnanny` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `jsonnanny`;
-- MySQL dump 10.13  Distrib 5.5.24, for osx10.5 (i386)
--
-- Host: localhost    Database: jsonnanny
-- ------------------------------------------------------
-- Server version	5.5.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cases`
--

DROP TABLE IF EXISTS `cases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cases` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `path` varchar(128) COLLATE utf8_unicode_ci NOT NULL COMMENT 'blob content',
  `title` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `owner` int(11) NOT NULL,
  `date` datetime NOT NULL COMMENT 'the last modified date',
  `latest` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cid_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cases`
--

LOCK TABLES `cases` WRITE;
/*!40000 ALTER TABLE `cases` DISABLE KEYS */;
/*!40000 ALTER TABLE `cases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feeds`
--

DROP TABLE IF EXISTS `feeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feeds` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `opr` int(11) NOT NULL COMMENT 'the man of event',
  `stuff` int(11) NOT NULL,
  `stuff_type` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `event` varchar(45) COLLATE utf8_unicode_ci NOT NULL COMMENT 'event action',
  `desc` mediumtext COLLATE utf8_unicode_ci NOT NULL COMMENT 'description',
  `date` datetime NOT NULL COMMENT 'created date',
  PRIMARY KEY (`id`),
  UNIQUE KEY `fid_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feeds`
--

LOCK TABLES `feeds` WRITE;
/*!40000 ALTER TABLE `feeds` DISABLE KEYS */;
/*!40000 ALTER TABLE `feeds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice`
--

DROP TABLE IF EXISTS `notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notice` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity` mediumtext COLLATE utf8_unicode_ci NOT NULL COMMENT 'notification content',
  `date` datetime NOT NULL COMMENT 'created date',
  PRIMARY KEY (`id`),
  UNIQUE KEY `nid_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice`
--

LOCK TABLES `notice` WRITE;
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notify`
--

DROP TABLE IF EXISTS `notify`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notify` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `owner` int(11) NOT NULL,
  `users` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `schemas` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `cases` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rid_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notify`
--

LOCK TABLES `notify` WRITE;
/*!40000 ALTER TABLE `notify` DISABLE KEYS */;
/*!40000 ALTER TABLE `notify` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schemas`
--

DROP TABLE IF EXISTS `schemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schemas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `path` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'the repo path',
  `owner` int(11) NOT NULL COMMENT 'the owner of repo',
  `title` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'the title of repo',
  `latest` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT 'the latest modified version',
  `state` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT 'current state',
  `date` datetime NOT NULL COMMENT 'created date',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sid_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schemas`
--

LOCK TABLES `schemas` WRITE;
/*!40000 ALTER TABLE `schemas` DISABLE KEYS */;
/*!40000 ALTER TABLE `schemas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'user unique id',
  `tag` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT 'user unique id alternative',
  `pwd` varchar(32) COLLATE utf8_unicode_ci NOT NULL COMMENT 'user password',
  `nick` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT 'nickname in english',
  `cjknick` varchar(128) COLLATE utf8_unicode_ci NOT NULL COMMENT 'nickname in non-english',
  `email` varchar(45) COLLATE utf8_unicode_ci NOT NULL COMMENT 'user email',
  `gravatar` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'gravatar email',
  `date` datetime NOT NULL COMMENT 'register or import date',
  `apikey` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'apikey for user',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'024893','fc5e038d38a57032085441e7fe7010b0','wuyu','无语','wuyu@taobao.com','sodabiscuit@gmail.com','2012-12-23 23:56:12','abc');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-01-15 17:26:07
