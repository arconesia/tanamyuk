-- MySQL dump 10.13  Distrib 8.4.5, for macos15.2 (arm64)
--
-- Host: localhost    Database: tanamyuk
-- ------------------------------------------------------
-- Server version	11.7.2-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `achievements`
--

DROP TABLE IF EXISTS `achievements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `achievements` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(60) NOT NULL,
  `name` varchar(140) NOT NULL,
  `description` varchar(500) NOT NULL,
  `xp_bonus` int(10) unsigned NOT NULL DEFAULT 0,
  `icon` varchar(150) DEFAULT NULL,
  `criteria_type` enum('first_project','task_count','streak_days','problem_resolved','first_harvest','cycle_complete','custom') NOT NULL,
  `criteria_value` decimal(12,2) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `achievements_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `achievements`
--

LOCK TABLES `achievements` WRITE;
/*!40000 ALTER TABLE `achievements` DISABLE KEYS */;
INSERT INTO `achievements` VALUES (1,'TANAM_PERTAMA','Tanam Pertama','Memulai siklus budidaya pertama.',50,'seed','first_project',1.00,1,'2026-10-27 10:13:57'),(2,'RAJIN_MERAWAT','Rajin Merawat','Menyelesaikan 10 tugas budidaya.',100,'leaf','task_count',10.00,1,'2026-10-27 10:13:57'),(3,'KONSISTEN_7','Konsisten 7 Hari','Aktif merawat tanaman 7 hari berturut-turut.',100,'fire','streak_days',7.00,1,'2026-10-27 10:13:57'),(4,'DOKTER_TANAMAN','Dokter Tanaman','Menyelesaikan masalah pada tanaman.',100,'health','problem_resolved',1.00,1,'2026-10-27 10:13:57'),(5,'PANEN_PERTAMA','Panen Pertama','Mencatat hasil panen perdana.',200,'harvest','first_harvest',1.00,1,'2026-10-27 10:13:57');
/*!40000 ALTER TABLE `achievements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` bigint(20) NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
INSERT INTO `cache` VALUES ('tanamyuk-cache-roster:project:v3:64fb6d888c2d71e56a58c4e6d0b3efc4','O:26:\"Laravel\\Roster\\ProjectScan\":8:{s:8:\"basePath\";s:40:\"/Users/robbieshugara/Documents/tanamyuk/\";s:3:\"php\";O:35:\"Laravel\\Roster\\Ecosystems\\Ecosystem\":2:{s:9:\"\0*\0byName\";a:116:{s:10:\"brick/math\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:10:\"brick/math\";s:10:\"\0*\0version\";s:5:\"1.0.0\";s:9:\"\0*\0source\";E:43:\"Laravel\\Roster\\Enums\\PackageSource:Composer\";s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:57:\"/Users/robbieshugara/Documents/tanamyuk/vendor/brick/math\";}s:31:\"carbonphp/carbon-doctrine-types\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:31:\"carbonphp/carbon-doctrine-types\";s:10:\"\0*\0version\";s:5:\"3.2.1\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:78:\"/Users/robbieshugara/Documents/tanamyuk/vendor/carbonphp/carbon-doctrine-types\";}s:23:\"dflydev/dot-access-data\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:23:\"dflydev/dot-access-data\";s:10:\"\0*\0version\";s:5:\"3.0.3\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:70:\"/Users/robbieshugara/Documents/tanamyuk/vendor/dflydev/dot-access-data\";}s:18:\"doctrine/inflector\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:18:\"doctrine/inflector\";s:10:\"\0*\0version\";s:5:\"2.1.1\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:65:\"/Users/robbieshugara/Documents/tanamyuk/vendor/doctrine/inflector\";}s:14:\"doctrine/lexer\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:14:\"doctrine/lexer\";s:10:\"\0*\0version\";s:5:\"3.0.3\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:61:\"/Users/robbieshugara/Documents/tanamyuk/vendor/doctrine/lexer\";}s:29:\"dragonmantank/cron-expression\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:29:\"dragonmantank/cron-expression\";s:10:\"\0*\0version\";s:5:\"3.6.1\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:76:\"/Users/robbieshugara/Documents/tanamyuk/vendor/dragonmantank/cron-expression\";}s:23:\"egulias/email-validator\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:23:\"egulias/email-validator\";s:10:\"\0*\0version\";s:5:\"4.0.4\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:70:\"/Users/robbieshugara/Documents/tanamyuk/vendor/egulias/email-validator\";}s:18:\"fruitcake/php-cors\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:18:\"fruitcake/php-cors\";s:10:\"\0*\0version\";s:5:\"1.4.0\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:65:\"/Users/robbieshugara/Documents/tanamyuk/vendor/fruitcake/php-cors\";}s:27:\"graham-campbell/result-type\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:27:\"graham-campbell/result-type\";s:10:\"\0*\0version\";s:5:\"1.2.0\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:74:\"/Users/robbieshugara/Documents/tanamyuk/vendor/graham-campbell/result-type\";}s:17:\"guzzlehttp/guzzle\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:17:\"guzzlehttp/guzzle\";s:10:\"\0*\0version\";s:5:\"8.3.1\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:64:\"/Users/robbieshugara/Documents/tanamyuk/vendor/guzzlehttp/guzzle\";}s:19:\"guzzlehttp/promises\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:19:\"guzzlehttp/promises\";s:10:\"\0*\0version\";s:5:\"3.1.0\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:66:\"/Users/robbieshugara/Documents/tanamyuk/vendor/guzzlehttp/promises\";}s:15:\"guzzlehttp/psr7\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:15:\"guzzlehttp/psr7\";s:10:\"\0*\0version\";s:5:\"3.2.0\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:62:\"/Users/robbieshugara/Documents/tanamyuk/vendor/guzzlehttp/psr7\";}s:23:\"guzzlehttp/uri-template\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:23:\"guzzlehttp/uri-template\";s:10:\"\0*\0version\";s:5:\"2.0.1\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:70:\"/Users/robbieshugara/Documents/tanamyuk/vendor/guzzlehttp/uri-template\";}s:17:\"laravel/framework\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:17:\"laravel/framework\";s:10:\"\0*\0version\";s:7:\"13.39.0\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:1;s:13:\"\0*\0constraint\";s:6:\"^13.17\";s:7:\"\0*\0path\";s:64:\"/Users/robbieshugara/Documents/tanamyuk/vendor/laravel/framework\";}s:15:\"laravel/prompts\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:15:\"laravel/prompts\";s:10:\"\0*\0version\";s:6:\"0.3.26\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:62:\"/Users/robbieshugara/Documents/tanamyuk/vendor/laravel/prompts\";}s:28:\"laravel/serializable-closure\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:28:\"laravel/serializable-closure\";s:10:\"\0*\0version\";s:5:\"2.1.0\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:75:\"/Users/robbieshugara/Documents/tanamyuk/vendor/laravel/serializable-closure\";}s:14:\"laravel/tinker\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:14:\"laravel/tinker\";s:10:\"\0*\0version\";s:5:\"3.0.2\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:1;s:13:\"\0*\0constraint\";s:4:\"^3.0\";s:7:\"\0*\0path\";s:61:\"/Users/robbieshugara/Documents/tanamyuk/vendor/laravel/tinker\";}s:17:\"league/commonmark\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:17:\"league/commonmark\";s:10:\"\0*\0version\";s:6:\"2.10.4\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:64:\"/Users/robbieshugara/Documents/tanamyuk/vendor/league/commonmark\";}s:13:\"league/config\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:13:\"league/config\";s:10:\"\0*\0version\";s:5:\"1.2.0\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:60:\"/Users/robbieshugara/Documents/tanamyuk/vendor/league/config\";}s:16:\"league/flysystem\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:16:\"league/flysystem\";s:10:\"\0*\0version\";s:6:\"3.36.0\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:63:\"/Users/robbieshugara/Documents/tanamyuk/vendor/league/flysystem\";}s:22:\"league/flysystem-local\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:22:\"league/flysystem-local\";s:10:\"\0*\0version\";s:6:\"3.35.3\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:69:\"/Users/robbieshugara/Documents/tanamyuk/vendor/league/flysystem-local\";}s:26:\"league/mime-type-detection\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:26:\"league/mime-type-detection\";s:10:\"\0*\0version\";s:6:\"1.17.0\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:73:\"/Users/robbieshugara/Documents/tanamyuk/vendor/league/mime-type-detection\";}s:10:\"league/uri\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:10:\"league/uri\";s:10:\"\0*\0version\";s:5:\"7.9.0\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:57:\"/Users/robbieshugara/Documents/tanamyuk/vendor/league/uri\";}s:21:\"league/uri-interfaces\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:21:\"league/uri-interfaces\";s:10:\"\0*\0version\";s:5:\"7.9.0\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:68:\"/Users/robbieshugara/Documents/tanamyuk/vendor/league/uri-interfaces\";}s:15:\"monolog/monolog\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:15:\"monolog/monolog\";s:10:\"\0*\0version\";s:6:\"3.12.1\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:62:\"/Users/robbieshugara/Documents/tanamyuk/vendor/monolog/monolog\";}s:13:\"nesbot/carbon\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:13:\"nesbot/carbon\";s:10:\"\0*\0version\";s:6:\"3.15.1\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:60:\"/Users/robbieshugara/Documents/tanamyuk/vendor/nesbot/carbon\";}s:12:\"nette/schema\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:12:\"nette/schema\";s:10:\"\0*\0version\";s:5:\"1.4.0\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:59:\"/Users/robbieshugara/Documents/tanamyuk/vendor/nette/schema\";}s:11:\"nette/utils\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:11:\"nette/utils\";s:10:\"\0*\0version\";s:5:\"4.1.6\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:58:\"/Users/robbieshugara/Documents/tanamyuk/vendor/nette/utils\";}s:16:\"nikic/php-parser\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:16:\"nikic/php-parser\";s:10:\"\0*\0version\";s:5:\"5.9.0\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:63:\"/Users/robbieshugara/Documents/tanamyuk/vendor/nikic/php-parser\";}s:19:\"nunomaduro/termwind\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:19:\"nunomaduro/termwind\";s:10:\"\0*\0version\";s:5:\"2.4.0\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:66:\"/Users/robbieshugara/Documents/tanamyuk/vendor/nunomaduro/termwind\";}s:19:\"phpoption/phpoption\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:19:\"phpoption/phpoption\";s:10:\"\0*\0version\";s:6:\"1.10.0\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:66:\"/Users/robbieshugara/Documents/tanamyuk/vendor/phpoption/phpoption\";}s:9:\"psr/clock\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:9:\"psr/clock\";s:10:\"\0*\0version\";s:5:\"1.0.0\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:56:\"/Users/robbieshugara/Documents/tanamyuk/vendor/psr/clock\";}s:13:\"psr/container\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:13:\"psr/container\";s:10:\"\0*\0version\";s:5:\"2.0.2\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:60:\"/Users/robbieshugara/Documents/tanamyuk/vendor/psr/container\";}s:20:\"psr/event-dispatcher\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:20:\"psr/event-dispatcher\";s:10:\"\0*\0version\";s:5:\"1.0.0\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:67:\"/Users/robbieshugara/Documents/tanamyuk/vendor/psr/event-dispatcher\";}s:15:\"psr/http-client\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:15:\"psr/http-client\";s:10:\"\0*\0version\";s:5:\"1.0.3\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:62:\"/Users/robbieshugara/Documents/tanamyuk/vendor/psr/http-client\";}s:16:\"psr/http-factory\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:16:\"psr/http-factory\";s:10:\"\0*\0version\";s:5:\"1.1.0\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:63:\"/Users/robbieshugara/Documents/tanamyuk/vendor/psr/http-factory\";}s:16:\"psr/http-message\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:16:\"psr/http-message\";s:10:\"\0*\0version\";s:3:\"2.0\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:63:\"/Users/robbieshugara/Documents/tanamyuk/vendor/psr/http-message\";}s:7:\"psr/log\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:7:\"psr/log\";s:10:\"\0*\0version\";s:5:\"3.0.2\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:54:\"/Users/robbieshugara/Documents/tanamyuk/vendor/psr/log\";}s:16:\"psr/simple-cache\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:16:\"psr/simple-cache\";s:10:\"\0*\0version\";s:5:\"3.0.0\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:63:\"/Users/robbieshugara/Documents/tanamyuk/vendor/psr/simple-cache\";}s:9:\"psy/psysh\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:9:\"psy/psysh\";s:10:\"\0*\0version\";s:7:\"0.12.24\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:56:\"/Users/robbieshugara/Documents/tanamyuk/vendor/psy/psysh\";}s:17:\"ramsey/collection\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:17:\"ramsey/collection\";s:10:\"\0*\0version\";s:5:\"2.1.1\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:64:\"/Users/robbieshugara/Documents/tanamyuk/vendor/ramsey/collection\";}s:11:\"ramsey/uuid\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:11:\"ramsey/uuid\";s:10:\"\0*\0version\";s:5:\"4.9.4\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:58:\"/Users/robbieshugara/Documents/tanamyuk/vendor/ramsey/uuid\";}s:13:\"symfony/clock\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:13:\"symfony/clock\";s:10:\"\0*\0version\";s:6:\"7.4.21\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:60:\"/Users/robbieshugara/Documents/tanamyuk/vendor/symfony/clock\";}s:15:\"symfony/console\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:15:\"symfony/console\";s:10:\"\0*\0version\";s:6:\"7.4.21\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:62:\"/Users/robbieshugara/Documents/tanamyuk/vendor/symfony/console\";}s:20:\"symfony/css-selector\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:20:\"symfony/css-selector\";s:10:\"\0*\0version\";s:6:\"7.4.18\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:67:\"/Users/robbieshugara/Documents/tanamyuk/vendor/symfony/css-selector\";}s:29:\"symfony/deprecation-contracts\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:29:\"symfony/deprecation-contracts\";s:10:\"\0*\0version\";s:5:\"3.7.1\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:76:\"/Users/robbieshugara/Documents/tanamyuk/vendor/symfony/deprecation-contracts\";}s:21:\"symfony/error-handler\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:21:\"symfony/error-handler\";s:10:\"\0*\0version\";s:6:\"7.4.20\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:68:\"/Users/robbieshugara/Documents/tanamyuk/vendor/symfony/error-handler\";}s:24:\"symfony/event-dispatcher\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:24:\"symfony/event-dispatcher\";s:10:\"\0*\0version\";s:6:\"7.4.17\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:71:\"/Users/robbieshugara/Documents/tanamyuk/vendor/symfony/event-dispatcher\";}s:34:\"symfony/event-dispatcher-contracts\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:34:\"symfony/event-dispatcher-contracts\";s:10:\"\0*\0version\";s:5:\"3.7.1\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:81:\"/Users/robbieshugara/Documents/tanamyuk/vendor/symfony/event-dispatcher-contracts\";}s:14:\"symfony/finder\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:14:\"symfony/finder\";s:10:\"\0*\0version\";s:6:\"7.4.20\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:61:\"/Users/robbieshugara/Documents/tanamyuk/vendor/symfony/finder\";}s:23:\"symfony/http-foundation\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:23:\"symfony/http-foundation\";s:10:\"\0*\0version\";s:6:\"7.4.21\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:70:\"/Users/robbieshugara/Documents/tanamyuk/vendor/symfony/http-foundation\";}s:19:\"symfony/http-kernel\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:19:\"symfony/http-kernel\";s:10:\"\0*\0version\";s:6:\"7.4.21\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:66:\"/Users/robbieshugara/Documents/tanamyuk/vendor/symfony/http-kernel\";}s:14:\"symfony/mailer\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:14:\"symfony/mailer\";s:10:\"\0*\0version\";s:6:\"7.4.19\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:61:\"/Users/robbieshugara/Documents/tanamyuk/vendor/symfony/mailer\";}s:12:\"symfony/mime\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:12:\"symfony/mime\";s:10:\"\0*\0version\";s:6:\"7.4.19\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:59:\"/Users/robbieshugara/Documents/tanamyuk/vendor/symfony/mime\";}s:22:\"symfony/polyfill-ctype\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:22:\"symfony/polyfill-ctype\";s:10:\"\0*\0version\";s:6:\"1.37.0\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:69:\"/Users/robbieshugara/Documents/tanamyuk/vendor/symfony/polyfill-ctype\";}s:30:\"symfony/polyfill-intl-grapheme\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:30:\"symfony/polyfill-intl-grapheme\";s:10:\"\0*\0version\";s:6:\"1.43.0\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:77:\"/Users/robbieshugara/Documents/tanamyuk/vendor/symfony/polyfill-intl-grapheme\";}s:25:\"symfony/polyfill-intl-idn\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:25:\"symfony/polyfill-intl-idn\";s:10:\"\0*\0version\";s:6:\"1.43.0\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:72:\"/Users/robbieshugara/Documents/tanamyuk/vendor/symfony/polyfill-intl-idn\";}s:32:\"symfony/polyfill-intl-normalizer\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:32:\"symfony/polyfill-intl-normalizer\";s:10:\"\0*\0version\";s:6:\"1.43.0\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:79:\"/Users/robbieshugara/Documents/tanamyuk/vendor/symfony/polyfill-intl-normalizer\";}s:25:\"symfony/polyfill-mbstring\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:25:\"symfony/polyfill-mbstring\";s:10:\"\0*\0version\";s:6:\"1.43.0\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:72:\"/Users/robbieshugara/Documents/tanamyuk/vendor/symfony/polyfill-mbstring\";}s:22:\"symfony/polyfill-php80\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:22:\"symfony/polyfill-php80\";s:10:\"\0*\0version\";s:6:\"1.43.0\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:69:\"/Users/robbieshugara/Documents/tanamyuk/vendor/symfony/polyfill-php80\";}s:22:\"symfony/polyfill-php82\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:22:\"symfony/polyfill-php82\";s:10:\"\0*\0version\";s:6:\"1.43.0\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:69:\"/Users/robbieshugara/Documents/tanamyuk/vendor/symfony/polyfill-php82\";}s:22:\"symfony/polyfill-php83\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:22:\"symfony/polyfill-php83\";s:10:\"\0*\0version\";s:6:\"1.43.0\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:69:\"/Users/robbieshugara/Documents/tanamyuk/vendor/symfony/polyfill-php83\";}s:22:\"symfony/polyfill-php84\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:22:\"symfony/polyfill-php84\";s:10:\"\0*\0version\";s:6:\"1.43.0\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:69:\"/Users/robbieshugara/Documents/tanamyuk/vendor/symfony/polyfill-php84\";}s:22:\"symfony/polyfill-php85\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:22:\"symfony/polyfill-php85\";s:10:\"\0*\0version\";s:6:\"1.43.0\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:69:\"/Users/robbieshugara/Documents/tanamyuk/vendor/symfony/polyfill-php85\";}s:22:\"symfony/polyfill-php86\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:22:\"symfony/polyfill-php86\";s:10:\"\0*\0version\";s:6:\"1.43.0\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:69:\"/Users/robbieshugara/Documents/tanamyuk/vendor/symfony/polyfill-php86\";}s:21:\"symfony/polyfill-time\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:21:\"symfony/polyfill-time\";s:10:\"\0*\0version\";s:6:\"1.42.0\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:68:\"/Users/robbieshugara/Documents/tanamyuk/vendor/symfony/polyfill-time\";}s:21:\"symfony/polyfill-uuid\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:21:\"symfony/polyfill-uuid\";s:10:\"\0*\0version\";s:6:\"1.43.0\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:68:\"/Users/robbieshugara/Documents/tanamyuk/vendor/symfony/polyfill-uuid\";}s:15:\"symfony/process\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:15:\"symfony/process\";s:10:\"\0*\0version\";s:6:\"7.4.21\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:62:\"/Users/robbieshugara/Documents/tanamyuk/vendor/symfony/process\";}s:15:\"symfony/routing\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:15:\"symfony/routing\";s:10:\"\0*\0version\";s:6:\"7.4.21\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:62:\"/Users/robbieshugara/Documents/tanamyuk/vendor/symfony/routing\";}s:25:\"symfony/service-contracts\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:25:\"symfony/service-contracts\";s:10:\"\0*\0version\";s:5:\"3.7.3\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:72:\"/Users/robbieshugara/Documents/tanamyuk/vendor/symfony/service-contracts\";}s:14:\"symfony/string\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:14:\"symfony/string\";s:10:\"\0*\0version\";s:6:\"7.4.21\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:61:\"/Users/robbieshugara/Documents/tanamyuk/vendor/symfony/string\";}s:19:\"symfony/translation\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:19:\"symfony/translation\";s:10:\"\0*\0version\";s:6:\"7.4.17\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:66:\"/Users/robbieshugara/Documents/tanamyuk/vendor/symfony/translation\";}s:29:\"symfony/translation-contracts\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:29:\"symfony/translation-contracts\";s:10:\"\0*\0version\";s:5:\"3.7.1\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:76:\"/Users/robbieshugara/Documents/tanamyuk/vendor/symfony/translation-contracts\";}s:11:\"symfony/uid\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:11:\"symfony/uid\";s:10:\"\0*\0version\";s:6:\"7.4.21\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:58:\"/Users/robbieshugara/Documents/tanamyuk/vendor/symfony/uid\";}s:18:\"symfony/var-dumper\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:18:\"symfony/var-dumper\";s:10:\"\0*\0version\";s:6:\"7.4.21\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:65:\"/Users/robbieshugara/Documents/tanamyuk/vendor/symfony/var-dumper\";}s:33:\"tijsverkoyen/css-to-inline-styles\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:33:\"tijsverkoyen/css-to-inline-styles\";s:10:\"\0*\0version\";s:5:\"2.4.0\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:80:\"/Users/robbieshugara/Documents/tanamyuk/vendor/tijsverkoyen/css-to-inline-styles\";}s:16:\"vlucas/phpdotenv\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:16:\"vlucas/phpdotenv\";s:10:\"\0*\0version\";s:5:\"5.8.0\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:63:\"/Users/robbieshugara/Documents/tanamyuk/vendor/vlucas/phpdotenv\";}s:19:\"voku/portable-ascii\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:19:\"voku/portable-ascii\";s:10:\"\0*\0version\";s:5:\"2.1.1\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:66:\"/Users/robbieshugara/Documents/tanamyuk/vendor/voku/portable-ascii\";}s:15:\"composer/semver\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:15:\"composer/semver\";s:10:\"\0*\0version\";s:5:\"3.5.2\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:62:\"/Users/robbieshugara/Documents/tanamyuk/vendor/composer/semver\";}s:14:\"fakerphp/faker\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:14:\"fakerphp/faker\";s:10:\"\0*\0version\";s:6:\"1.24.1\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:1;s:13:\"\0*\0constraint\";s:5:\"^1.23\";s:7:\"\0*\0path\";s:61:\"/Users/robbieshugara/Documents/tanamyuk/vendor/fakerphp/faker\";}s:11:\"filp/whoops\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:11:\"filp/whoops\";s:10:\"\0*\0version\";s:6:\"2.18.7\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:58:\"/Users/robbieshugara/Documents/tanamyuk/vendor/filp/whoops\";}s:21:\"hamcrest/hamcrest-php\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:21:\"hamcrest/hamcrest-php\";s:10:\"\0*\0version\";s:5:\"3.0.0\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:68:\"/Users/robbieshugara/Documents/tanamyuk/vendor/hamcrest/hamcrest-php\";}s:22:\"laravel/agent-detector\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:22:\"laravel/agent-detector\";s:10:\"\0*\0version\";s:5:\"2.0.5\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:69:\"/Users/robbieshugara/Documents/tanamyuk/vendor/laravel/agent-detector\";}s:13:\"laravel/boost\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:13:\"laravel/boost\";s:10:\"\0*\0version\";s:6:\"2.10.3\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:1;s:13:\"\0*\0constraint\";s:5:\"^2.10\";s:7:\"\0*\0path\";s:60:\"/Users/robbieshugara/Documents/tanamyuk/vendor/laravel/boost\";}s:11:\"laravel/mcp\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:11:\"laravel/mcp\";s:10:\"\0*\0version\";s:5:\"1.1.2\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:58:\"/Users/robbieshugara/Documents/tanamyuk/vendor/laravel/mcp\";}s:12:\"laravel/pail\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:12:\"laravel/pail\";s:10:\"\0*\0version\";s:5:\"1.2.7\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:1;s:13:\"\0*\0constraint\";s:6:\"^1.2.5\";s:7:\"\0*\0path\";s:59:\"/Users/robbieshugara/Documents/tanamyuk/vendor/laravel/pail\";}s:11:\"laravel/pao\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:11:\"laravel/pao\";s:10:\"\0*\0version\";s:5:\"1.1.5\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:1;s:13:\"\0*\0constraint\";s:6:\"^1.0.6\";s:7:\"\0*\0path\";s:58:\"/Users/robbieshugara/Documents/tanamyuk/vendor/laravel/pao\";}s:12:\"laravel/pint\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:12:\"laravel/pint\";s:10:\"\0*\0version\";s:6:\"1.32.1\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:1;s:13:\"\0*\0constraint\";s:5:\"^1.27\";s:7:\"\0*\0path\";s:59:\"/Users/robbieshugara/Documents/tanamyuk/vendor/laravel/pint\";}s:14:\"laravel/roster\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:14:\"laravel/roster\";s:10:\"\0*\0version\";s:5:\"1.0.0\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:61:\"/Users/robbieshugara/Documents/tanamyuk/vendor/laravel/roster\";}s:15:\"mockery/mockery\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:15:\"mockery/mockery\";s:10:\"\0*\0version\";s:6:\"1.6.15\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:1;s:13:\"\0*\0constraint\";s:4:\"^1.6\";s:7:\"\0*\0path\";s:62:\"/Users/robbieshugara/Documents/tanamyuk/vendor/mockery/mockery\";}s:17:\"myclabs/deep-copy\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:17:\"myclabs/deep-copy\";s:10:\"\0*\0version\";s:6:\"1.14.0\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:64:\"/Users/robbieshugara/Documents/tanamyuk/vendor/myclabs/deep-copy\";}s:20:\"nunomaduro/collision\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:20:\"nunomaduro/collision\";s:10:\"\0*\0version\";s:5:\"8.9.5\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:1;s:13:\"\0*\0constraint\";s:4:\"^8.6\";s:7:\"\0*\0path\";s:67:\"/Users/robbieshugara/Documents/tanamyuk/vendor/nunomaduro/collision\";}s:16:\"phar-io/manifest\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:16:\"phar-io/manifest\";s:10:\"\0*\0version\";s:5:\"2.0.4\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:63:\"/Users/robbieshugara/Documents/tanamyuk/vendor/phar-io/manifest\";}s:15:\"phar-io/version\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:15:\"phar-io/version\";s:10:\"\0*\0version\";s:5:\"3.2.1\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:62:\"/Users/robbieshugara/Documents/tanamyuk/vendor/phar-io/version\";}s:25:\"phpunit/php-code-coverage\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:25:\"phpunit/php-code-coverage\";s:10:\"\0*\0version\";s:6:\"12.5.8\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:72:\"/Users/robbieshugara/Documents/tanamyuk/vendor/phpunit/php-code-coverage\";}s:25:\"phpunit/php-file-iterator\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:25:\"phpunit/php-file-iterator\";s:10:\"\0*\0version\";s:5:\"6.0.2\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:72:\"/Users/robbieshugara/Documents/tanamyuk/vendor/phpunit/php-file-iterator\";}s:19:\"phpunit/php-invoker\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:19:\"phpunit/php-invoker\";s:10:\"\0*\0version\";s:5:\"6.0.0\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:66:\"/Users/robbieshugara/Documents/tanamyuk/vendor/phpunit/php-invoker\";}s:25:\"phpunit/php-text-template\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:25:\"phpunit/php-text-template\";s:10:\"\0*\0version\";s:5:\"5.0.1\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:72:\"/Users/robbieshugara/Documents/tanamyuk/vendor/phpunit/php-text-template\";}s:17:\"phpunit/php-timer\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:17:\"phpunit/php-timer\";s:10:\"\0*\0version\";s:5:\"8.0.0\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:64:\"/Users/robbieshugara/Documents/tanamyuk/vendor/phpunit/php-timer\";}s:15:\"phpunit/phpunit\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:15:\"phpunit/phpunit\";s:10:\"\0*\0version\";s:7:\"12.5.42\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:1;s:13:\"\0*\0constraint\";s:8:\"^12.5.12\";s:7:\"\0*\0path\";s:62:\"/Users/robbieshugara/Documents/tanamyuk/vendor/phpunit/phpunit\";}s:20:\"sebastian/cli-parser\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:20:\"sebastian/cli-parser\";s:10:\"\0*\0version\";s:5:\"4.2.1\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:67:\"/Users/robbieshugara/Documents/tanamyuk/vendor/sebastian/cli-parser\";}s:20:\"sebastian/comparator\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:20:\"sebastian/comparator\";s:10:\"\0*\0version\";s:5:\"7.1.8\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:67:\"/Users/robbieshugara/Documents/tanamyuk/vendor/sebastian/comparator\";}s:20:\"sebastian/complexity\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:20:\"sebastian/complexity\";s:10:\"\0*\0version\";s:5:\"5.0.0\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:67:\"/Users/robbieshugara/Documents/tanamyuk/vendor/sebastian/complexity\";}s:14:\"sebastian/diff\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:14:\"sebastian/diff\";s:10:\"\0*\0version\";s:5:\"7.0.1\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:61:\"/Users/robbieshugara/Documents/tanamyuk/vendor/sebastian/diff\";}s:21:\"sebastian/environment\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:21:\"sebastian/environment\";s:10:\"\0*\0version\";s:5:\"8.1.2\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:68:\"/Users/robbieshugara/Documents/tanamyuk/vendor/sebastian/environment\";}s:18:\"sebastian/exporter\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:18:\"sebastian/exporter\";s:10:\"\0*\0version\";s:5:\"7.0.3\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:65:\"/Users/robbieshugara/Documents/tanamyuk/vendor/sebastian/exporter\";}s:22:\"sebastian/global-state\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:22:\"sebastian/global-state\";s:10:\"\0*\0version\";s:5:\"8.0.3\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:69:\"/Users/robbieshugara/Documents/tanamyuk/vendor/sebastian/global-state\";}s:23:\"sebastian/lines-of-code\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:23:\"sebastian/lines-of-code\";s:10:\"\0*\0version\";s:5:\"4.0.1\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:70:\"/Users/robbieshugara/Documents/tanamyuk/vendor/sebastian/lines-of-code\";}s:27:\"sebastian/object-enumerator\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:27:\"sebastian/object-enumerator\";s:10:\"\0*\0version\";s:5:\"7.0.0\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:74:\"/Users/robbieshugara/Documents/tanamyuk/vendor/sebastian/object-enumerator\";}s:26:\"sebastian/object-reflector\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:26:\"sebastian/object-reflector\";s:10:\"\0*\0version\";s:5:\"5.0.0\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:73:\"/Users/robbieshugara/Documents/tanamyuk/vendor/sebastian/object-reflector\";}s:27:\"sebastian/recursion-context\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:27:\"sebastian/recursion-context\";s:10:\"\0*\0version\";s:5:\"7.0.1\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:74:\"/Users/robbieshugara/Documents/tanamyuk/vendor/sebastian/recursion-context\";}s:14:\"sebastian/type\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:14:\"sebastian/type\";s:10:\"\0*\0version\";s:5:\"6.0.4\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:61:\"/Users/robbieshugara/Documents/tanamyuk/vendor/sebastian/type\";}s:17:\"sebastian/version\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:17:\"sebastian/version\";s:10:\"\0*\0version\";s:5:\"6.0.1\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:64:\"/Users/robbieshugara/Documents/tanamyuk/vendor/sebastian/version\";}s:28:\"staabm/side-effects-detector\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:28:\"staabm/side-effects-detector\";s:10:\"\0*\0version\";s:5:\"1.0.5\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:75:\"/Users/robbieshugara/Documents/tanamyuk/vendor/staabm/side-effects-detector\";}s:12:\"symfony/yaml\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:12:\"symfony/yaml\";s:10:\"\0*\0version\";s:6:\"7.4.21\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:59:\"/Users/robbieshugara/Documents/tanamyuk/vendor/symfony/yaml\";}s:17:\"theseer/tokenizer\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:17:\"theseer/tokenizer\";s:10:\"\0*\0version\";s:5:\"2.0.1\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:64:\"/Users/robbieshugara/Documents/tanamyuk/vendor/theseer/tokenizer\";}}s:11:\"\0*\0packages\";O:32:\"Laravel\\Roster\\PackageCollection\":2:{s:8:\"\0*\0items\";a:116:{i:0;r:5;i:1;r:13;i:2;r:21;i:3;r:29;i:4;r:37;i:5;r:45;i:6;r:53;i:7;r:61;i:8;r:69;i:9;r:77;i:10;r:85;i:11;r:93;i:12;r:101;i:13;r:109;i:14;r:117;i:15;r:125;i:16;r:133;i:17;r:141;i:18;r:149;i:19;r:157;i:20;r:165;i:21;r:173;i:22;r:181;i:23;r:189;i:24;r:197;i:25;r:205;i:26;r:213;i:27;r:221;i:28;r:229;i:29;r:237;i:30;r:245;i:31;r:253;i:32;r:261;i:33;r:269;i:34;r:277;i:35;r:285;i:36;r:293;i:37;r:301;i:38;r:309;i:39;r:317;i:40;r:325;i:41;r:333;i:42;r:341;i:43;r:349;i:44;r:357;i:45;r:365;i:46;r:373;i:47;r:381;i:48;r:389;i:49;r:397;i:50;r:405;i:51;r:413;i:52;r:421;i:53;r:429;i:54;r:437;i:55;r:445;i:56;r:453;i:57;r:461;i:58;r:469;i:59;r:477;i:60;r:485;i:61;r:493;i:62;r:501;i:63;r:509;i:64;r:517;i:65;r:525;i:66;r:533;i:67;r:541;i:68;r:549;i:69;r:557;i:70;r:565;i:71;r:573;i:72;r:581;i:73;r:589;i:74;r:597;i:75;r:605;i:76;r:613;i:77;r:621;i:78;r:629;i:79;r:637;i:80;r:645;i:81;r:653;i:82;r:661;i:83;r:669;i:84;r:677;i:85;r:685;i:86;r:693;i:87;r:701;i:88;r:709;i:89;r:717;i:90;r:725;i:91;r:733;i:92;r:741;i:93;r:749;i:94;r:757;i:95;r:765;i:96;r:773;i:97;r:781;i:98;r:789;i:99;r:797;i:100;r:805;i:101;r:813;i:102;r:821;i:103;r:829;i:104;r:837;i:105;r:845;i:106;r:853;i:107;r:861;i:108;r:869;i:109;r:877;i:110;r:885;i:111;r:893;i:112;r:901;i:113;r:909;i:114;r:917;i:115;r:925;}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:2:\"js\";O:37:\"Laravel\\Roster\\Ecosystems\\JsEcosystem\":3:{s:9:\"\0*\0byName\";a:121:{s:24:\"@alcalzone/ansi-tokenize\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:24:\"@alcalzone/ansi-tokenize\";s:10:\"\0*\0version\";s:5:\"0.3.1\";s:9:\"\0*\0source\";E:38:\"Laravel\\Roster\\Enums\\PackageSource:Npm\";s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:77:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/@alcalzone/ansi-tokenize\";}s:18:\"@laravel/multiplex\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:18:\"@laravel/multiplex\";s:10:\"\0*\0version\";s:5:\"0.4.5\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:1;s:13:\"\0*\0constraint\";s:6:\"^0.4.1\";s:7:\"\0*\0path\";s:71:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/@laravel/multiplex\";}s:12:\"ansi-escapes\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:12:\"ansi-escapes\";s:10:\"\0*\0version\";s:5:\"7.3.0\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:65:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/ansi-escapes\";}s:10:\"ansi-regex\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:10:\"ansi-regex\";s:10:\"\0*\0version\";s:5:\"6.4.0\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:63:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/ansi-regex\";}s:11:\"ansi-styles\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:11:\"ansi-styles\";s:10:\"\0*\0version\";s:5:\"7.0.0\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:64:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/ansi-styles\";}s:9:\"auto-bind\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:9:\"auto-bind\";s:10:\"\0*\0version\";s:5:\"5.0.1\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:62:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/auto-bind\";}s:5:\"chalk\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:5:\"chalk\";s:10:\"\0*\0version\";s:5:\"5.6.2\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:58:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/chalk\";}s:9:\"cli-boxes\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:9:\"cli-boxes\";s:10:\"\0*\0version\";s:5:\"4.0.1\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:62:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/cli-boxes\";}s:10:\"cli-cursor\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:10:\"cli-cursor\";s:10:\"\0*\0version\";s:5:\"4.0.0\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:63:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/cli-cursor\";}s:12:\"cli-truncate\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:12:\"cli-truncate\";s:10:\"\0*\0version\";s:5:\"6.1.1\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:65:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/cli-truncate\";}s:12:\"code-excerpt\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:12:\"code-excerpt\";s:10:\"\0*\0version\";s:5:\"4.0.0\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:65:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/code-excerpt\";}s:9:\"commander\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:9:\"commander\";s:10:\"\0*\0version\";s:6:\"15.0.0\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:62:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/commander\";}s:17:\"convert-to-spaces\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:17:\"convert-to-spaces\";s:10:\"\0*\0version\";s:5:\"2.0.1\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:70:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/convert-to-spaces\";}s:11:\"environment\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:11:\"environment\";s:10:\"\0*\0version\";s:5:\"1.1.0\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:64:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/environment\";}s:10:\"es-toolkit\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:10:\"es-toolkit\";s:10:\"\0*\0version\";s:6:\"1.53.0\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:63:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/es-toolkit\";}s:20:\"escape-string-regexp\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:20:\"escape-string-regexp\";s:10:\"\0*\0version\";s:5:\"2.0.0\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:73:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/escape-string-regexp\";}s:20:\"get-east-asian-width\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:20:\"get-east-asian-width\";s:10:\"\0*\0version\";s:5:\"1.7.0\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:73:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/get-east-asian-width\";}s:13:\"indent-string\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:13:\"indent-string\";s:10:\"\0*\0version\";s:5:\"5.0.0\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:66:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/indent-string\";}s:3:\"ink\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:3:\"ink\";s:10:\"\0*\0version\";s:5:\"7.1.1\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:56:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/ink\";}s:23:\"is-fullwidth-code-point\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:23:\"is-fullwidth-code-point\";s:10:\"\0*\0version\";s:5:\"5.1.0\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:76:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/is-fullwidth-code-point\";}s:8:\"is-in-ci\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:8:\"is-in-ci\";s:10:\"\0*\0version\";s:5:\"2.0.0\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:61:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/is-in-ci\";}s:8:\"mimic-fn\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:8:\"mimic-fn\";s:10:\"\0*\0version\";s:5:\"2.1.0\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:61:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/mimic-fn\";}s:7:\"onetime\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:7:\"onetime\";s:10:\"\0*\0version\";s:5:\"5.1.2\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:60:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/onetime\";}s:13:\"patch-console\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:13:\"patch-console\";s:10:\"\0*\0version\";s:5:\"2.0.0\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:66:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/patch-console\";}s:5:\"react\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:5:\"react\";s:10:\"\0*\0version\";s:6:\"19.3.1\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:58:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/react\";}s:16:\"react-reconciler\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:16:\"react-reconciler\";s:10:\"\0*\0version\";s:6:\"0.33.0\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:69:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/react-reconciler\";}s:14:\"restore-cursor\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:14:\"restore-cursor\";s:10:\"\0*\0version\";s:5:\"4.0.0\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:67:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/restore-cursor\";}s:9:\"scheduler\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:9:\"scheduler\";s:10:\"\0*\0version\";s:6:\"0.27.0\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:62:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/scheduler\";}s:11:\"signal-exit\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:11:\"signal-exit\";s:10:\"\0*\0version\";s:5:\"3.0.7\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:64:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/signal-exit\";}s:10:\"slice-ansi\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:10:\"slice-ansi\";s:10:\"\0*\0version\";s:5:\"9.0.1\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:63:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/slice-ansi\";}s:11:\"stack-utils\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:11:\"stack-utils\";s:10:\"\0*\0version\";s:5:\"2.0.6\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:64:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/stack-utils\";}s:12:\"string-width\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:12:\"string-width\";s:10:\"\0*\0version\";s:5:\"8.3.0\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:65:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/string-width\";}s:10:\"strip-ansi\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:10:\"strip-ansi\";s:10:\"\0*\0version\";s:5:\"7.2.0\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:63:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/strip-ansi\";}s:10:\"tagged-tag\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:10:\"tagged-tag\";s:10:\"\0*\0version\";s:5:\"1.0.0\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:63:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/tagged-tag\";}s:13:\"terminal-size\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:13:\"terminal-size\";s:10:\"\0*\0version\";s:5:\"4.0.1\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:66:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/terminal-size\";}s:9:\"type-fest\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:9:\"type-fest\";s:10:\"\0*\0version\";s:6:\"5.10.0\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:62:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/type-fest\";}s:11:\"widest-line\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:11:\"widest-line\";s:10:\"\0*\0version\";s:5:\"6.0.0\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:64:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/widest-line\";}s:9:\"wrap-ansi\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:9:\"wrap-ansi\";s:10:\"\0*\0version\";s:6:\"10.0.2\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:62:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/wrap-ansi\";}s:2:\"ws\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:2:\"ws\";s:10:\"\0*\0version\";s:6:\"8.22.0\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:55:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/ws\";}s:11:\"yoga-layout\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:11:\"yoga-layout\";s:10:\"\0*\0version\";s:5:\"3.2.1\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:64:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/yoga-layout\";}s:23:\"@jridgewell/gen-mapping\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:23:\"@jridgewell/gen-mapping\";s:10:\"\0*\0version\";s:6:\"0.3.13\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:76:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/@jridgewell/gen-mapping\";}s:21:\"@jridgewell/remapping\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:21:\"@jridgewell/remapping\";s:10:\"\0*\0version\";s:5:\"2.3.5\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:74:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/@jridgewell/remapping\";}s:23:\"@jridgewell/resolve-uri\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:23:\"@jridgewell/resolve-uri\";s:10:\"\0*\0version\";s:5:\"3.1.2\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:76:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/@jridgewell/resolve-uri\";}s:27:\"@jridgewell/sourcemap-codec\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:27:\"@jridgewell/sourcemap-codec\";s:10:\"\0*\0version\";s:5:\"1.6.0\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:80:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/@jridgewell/sourcemap-codec\";}s:25:\"@jridgewell/trace-mapping\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:25:\"@jridgewell/trace-mapping\";s:10:\"\0*\0version\";s:6:\"0.3.31\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:78:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/@jridgewell/trace-mapping\";}s:18:\"@oxc-project/types\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:18:\"@oxc-project/types\";s:10:\"\0*\0version\";s:7:\"0.155.0\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:71:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/@oxc-project/types\";}s:34:\"@rolldown/binding-android-arm-eabi\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:34:\"@rolldown/binding-android-arm-eabi\";s:10:\"\0*\0version\";s:6:\"1.2.15\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:87:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/@rolldown/binding-android-arm-eabi\";}s:31:\"@rolldown/binding-android-arm64\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:31:\"@rolldown/binding-android-arm64\";s:10:\"\0*\0version\";s:6:\"1.2.15\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:84:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/@rolldown/binding-android-arm64\";}s:30:\"@rolldown/binding-darwin-arm64\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:30:\"@rolldown/binding-darwin-arm64\";s:10:\"\0*\0version\";s:6:\"1.2.15\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:83:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/@rolldown/binding-darwin-arm64\";}s:28:\"@rolldown/binding-darwin-x64\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:28:\"@rolldown/binding-darwin-x64\";s:10:\"\0*\0version\";s:6:\"1.2.15\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:81:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/@rolldown/binding-darwin-x64\";}s:29:\"@rolldown/binding-freebsd-x64\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:29:\"@rolldown/binding-freebsd-x64\";s:10:\"\0*\0version\";s:6:\"1.2.15\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:82:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/@rolldown/binding-freebsd-x64\";}s:37:\"@rolldown/binding-linux-arm-gnueabihf\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:37:\"@rolldown/binding-linux-arm-gnueabihf\";s:10:\"\0*\0version\";s:6:\"1.2.15\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:90:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/@rolldown/binding-linux-arm-gnueabihf\";}s:33:\"@rolldown/binding-linux-arm64-gnu\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:33:\"@rolldown/binding-linux-arm64-gnu\";s:10:\"\0*\0version\";s:6:\"1.2.15\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:86:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/@rolldown/binding-linux-arm64-gnu\";}s:34:\"@rolldown/binding-linux-arm64-musl\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:34:\"@rolldown/binding-linux-arm64-musl\";s:10:\"\0*\0version\";s:6:\"1.2.15\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:87:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/@rolldown/binding-linux-arm64-musl\";}s:33:\"@rolldown/binding-linux-ppc64-gnu\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:33:\"@rolldown/binding-linux-ppc64-gnu\";s:10:\"\0*\0version\";s:6:\"1.2.15\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:86:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/@rolldown/binding-linux-ppc64-gnu\";}s:33:\"@rolldown/binding-linux-s390x-gnu\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:33:\"@rolldown/binding-linux-s390x-gnu\";s:10:\"\0*\0version\";s:6:\"1.2.15\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:86:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/@rolldown/binding-linux-s390x-gnu\";}s:31:\"@rolldown/binding-linux-x64-gnu\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:31:\"@rolldown/binding-linux-x64-gnu\";s:10:\"\0*\0version\";s:6:\"1.2.15\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:84:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/@rolldown/binding-linux-x64-gnu\";}s:32:\"@rolldown/binding-linux-x64-musl\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:32:\"@rolldown/binding-linux-x64-musl\";s:10:\"\0*\0version\";s:6:\"1.2.15\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:85:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/@rolldown/binding-linux-x64-musl\";}s:35:\"@rolldown/binding-openharmony-arm64\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:35:\"@rolldown/binding-openharmony-arm64\";s:10:\"\0*\0version\";s:6:\"1.2.15\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:88:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/@rolldown/binding-openharmony-arm64\";}s:34:\"@rolldown/binding-win32-arm64-msvc\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:34:\"@rolldown/binding-win32-arm64-msvc\";s:10:\"\0*\0version\";s:6:\"1.2.15\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:87:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/@rolldown/binding-win32-arm64-msvc\";}s:32:\"@rolldown/binding-win32-x64-msvc\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:32:\"@rolldown/binding-win32-x64-msvc\";s:10:\"\0*\0version\";s:6:\"1.2.15\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:85:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/@rolldown/binding-win32-x64-msvc\";}s:21:\"@rolldown/pluginutils\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:21:\"@rolldown/pluginutils\";s:10:\"\0*\0version\";s:5:\"1.0.1\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:74:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/@rolldown/pluginutils\";}s:17:\"@tailwindcss/node\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:17:\"@tailwindcss/node\";s:10:\"\0*\0version\";s:5:\"4.3.3\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:70:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/@tailwindcss/node\";}s:18:\"@tailwindcss/oxide\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:18:\"@tailwindcss/oxide\";s:10:\"\0*\0version\";s:5:\"4.3.3\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:71:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/@tailwindcss/oxide\";}s:32:\"@tailwindcss/oxide-android-arm64\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:32:\"@tailwindcss/oxide-android-arm64\";s:10:\"\0*\0version\";s:5:\"4.3.3\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:85:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/@tailwindcss/oxide-android-arm64\";}s:31:\"@tailwindcss/oxide-darwin-arm64\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:31:\"@tailwindcss/oxide-darwin-arm64\";s:10:\"\0*\0version\";s:5:\"4.3.3\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:84:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/@tailwindcss/oxide-darwin-arm64\";}s:29:\"@tailwindcss/oxide-darwin-x64\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:29:\"@tailwindcss/oxide-darwin-x64\";s:10:\"\0*\0version\";s:5:\"4.3.3\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:82:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/@tailwindcss/oxide-darwin-x64\";}s:30:\"@tailwindcss/oxide-freebsd-x64\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:30:\"@tailwindcss/oxide-freebsd-x64\";s:10:\"\0*\0version\";s:5:\"4.3.3\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:83:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/@tailwindcss/oxide-freebsd-x64\";}s:38:\"@tailwindcss/oxide-linux-arm-gnueabihf\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:38:\"@tailwindcss/oxide-linux-arm-gnueabihf\";s:10:\"\0*\0version\";s:5:\"4.3.3\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:91:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/@tailwindcss/oxide-linux-arm-gnueabihf\";}s:34:\"@tailwindcss/oxide-linux-arm64-gnu\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:34:\"@tailwindcss/oxide-linux-arm64-gnu\";s:10:\"\0*\0version\";s:5:\"4.3.3\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:87:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/@tailwindcss/oxide-linux-arm64-gnu\";}s:35:\"@tailwindcss/oxide-linux-arm64-musl\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:35:\"@tailwindcss/oxide-linux-arm64-musl\";s:10:\"\0*\0version\";s:5:\"4.3.3\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:88:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/@tailwindcss/oxide-linux-arm64-musl\";}s:32:\"@tailwindcss/oxide-linux-x64-gnu\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:32:\"@tailwindcss/oxide-linux-x64-gnu\";s:10:\"\0*\0version\";s:5:\"4.3.3\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:85:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/@tailwindcss/oxide-linux-x64-gnu\";}s:33:\"@tailwindcss/oxide-linux-x64-musl\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:33:\"@tailwindcss/oxide-linux-x64-musl\";s:10:\"\0*\0version\";s:5:\"4.3.3\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:86:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/@tailwindcss/oxide-linux-x64-musl\";}s:30:\"@tailwindcss/oxide-wasm32-wasi\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:30:\"@tailwindcss/oxide-wasm32-wasi\";s:10:\"\0*\0version\";s:5:\"4.3.3\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:83:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/@tailwindcss/oxide-wasm32-wasi\";}s:35:\"@tailwindcss/oxide-win32-arm64-msvc\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:35:\"@tailwindcss/oxide-win32-arm64-msvc\";s:10:\"\0*\0version\";s:5:\"4.3.3\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:88:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/@tailwindcss/oxide-win32-arm64-msvc\";}s:33:\"@tailwindcss/oxide-win32-x64-msvc\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:33:\"@tailwindcss/oxide-win32-x64-msvc\";s:10:\"\0*\0version\";s:5:\"4.3.3\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:86:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/@tailwindcss/oxide-win32-x64-msvc\";}s:17:\"@tailwindcss/vite\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:17:\"@tailwindcss/vite\";s:10:\"\0*\0version\";s:5:\"4.3.3\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:1;s:13:\"\0*\0constraint\";s:6:\"^4.0.0\";s:7:\"\0*\0path\";s:70:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/@tailwindcss/vite\";}s:5:\"cliui\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:5:\"cliui\";s:10:\"\0*\0version\";s:5:\"9.0.1\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:58:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/cliui\";}s:12:\"concurrently\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:12:\"concurrently\";s:10:\"\0*\0version\";s:6:\"10.0.6\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:1;s:13:\"\0*\0constraint\";s:7:\"^10.0.3\";s:7:\"\0*\0path\";s:65:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/concurrently\";}s:11:\"detect-libc\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:11:\"detect-libc\";s:10:\"\0*\0version\";s:5:\"2.1.2\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:64:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/detect-libc\";}s:11:\"emoji-regex\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:11:\"emoji-regex\";s:10:\"\0*\0version\";s:6:\"10.6.0\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:64:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/emoji-regex\";}s:16:\"enhanced-resolve\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:16:\"enhanced-resolve\";s:10:\"\0*\0version\";s:6:\"5.26.0\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:69:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/enhanced-resolve\";}s:8:\"escalade\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:8:\"escalade\";s:10:\"\0*\0version\";s:5:\"3.2.0\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:61:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/escalade\";}s:4:\"fdir\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:4:\"fdir\";s:10:\"\0*\0version\";s:5:\"6.5.0\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:57:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/fdir\";}s:8:\"fsevents\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:8:\"fsevents\";s:10:\"\0*\0version\";s:5:\"2.3.3\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:61:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/fsevents\";}s:15:\"get-caller-file\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:15:\"get-caller-file\";s:10:\"\0*\0version\";s:5:\"2.0.5\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:68:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/get-caller-file\";}s:11:\"graceful-fs\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:11:\"graceful-fs\";s:10:\"\0*\0version\";s:6:\"4.2.11\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:64:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/graceful-fs\";}s:4:\"jiti\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:4:\"jiti\";s:10:\"\0*\0version\";s:5:\"2.7.0\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:57:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/jiti\";}s:19:\"laravel-vite-plugin\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:19:\"laravel-vite-plugin\";s:10:\"\0*\0version\";s:5:\"3.2.0\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:1;s:13:\"\0*\0constraint\";s:4:\"^3.1\";s:7:\"\0*\0path\";s:72:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/laravel-vite-plugin\";}s:12:\"lightningcss\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:12:\"lightningcss\";s:10:\"\0*\0version\";s:6:\"1.32.0\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:65:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/lightningcss\";}s:26:\"lightningcss-android-arm64\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:26:\"lightningcss-android-arm64\";s:10:\"\0*\0version\";s:6:\"1.32.0\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:79:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/lightningcss-android-arm64\";}s:25:\"lightningcss-darwin-arm64\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:25:\"lightningcss-darwin-arm64\";s:10:\"\0*\0version\";s:6:\"1.32.0\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:78:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/lightningcss-darwin-arm64\";}s:23:\"lightningcss-darwin-x64\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:23:\"lightningcss-darwin-x64\";s:10:\"\0*\0version\";s:6:\"1.32.0\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:76:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/lightningcss-darwin-x64\";}s:24:\"lightningcss-freebsd-x64\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:24:\"lightningcss-freebsd-x64\";s:10:\"\0*\0version\";s:6:\"1.32.0\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:77:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/lightningcss-freebsd-x64\";}s:32:\"lightningcss-linux-arm-gnueabihf\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:32:\"lightningcss-linux-arm-gnueabihf\";s:10:\"\0*\0version\";s:6:\"1.32.0\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:85:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/lightningcss-linux-arm-gnueabihf\";}s:28:\"lightningcss-linux-arm64-gnu\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:28:\"lightningcss-linux-arm64-gnu\";s:10:\"\0*\0version\";s:6:\"1.32.0\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:81:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/lightningcss-linux-arm64-gnu\";}s:29:\"lightningcss-linux-arm64-musl\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:29:\"lightningcss-linux-arm64-musl\";s:10:\"\0*\0version\";s:6:\"1.32.0\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:82:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/lightningcss-linux-arm64-musl\";}s:26:\"lightningcss-linux-x64-gnu\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:26:\"lightningcss-linux-x64-gnu\";s:10:\"\0*\0version\";s:6:\"1.32.0\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:79:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/lightningcss-linux-x64-gnu\";}s:27:\"lightningcss-linux-x64-musl\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:27:\"lightningcss-linux-x64-musl\";s:10:\"\0*\0version\";s:6:\"1.32.0\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:80:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/lightningcss-linux-x64-musl\";}s:29:\"lightningcss-win32-arm64-msvc\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:29:\"lightningcss-win32-arm64-msvc\";s:10:\"\0*\0version\";s:6:\"1.32.0\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:82:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/lightningcss-win32-arm64-msvc\";}s:27:\"lightningcss-win32-x64-msvc\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:27:\"lightningcss-win32-x64-msvc\";s:10:\"\0*\0version\";s:6:\"1.32.0\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:80:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/lightningcss-win32-x64-msvc\";}s:12:\"magic-string\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:12:\"magic-string\";s:10:\"\0*\0version\";s:7:\"0.30.21\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:65:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/magic-string\";}s:6:\"nanoid\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:6:\"nanoid\";s:10:\"\0*\0version\";s:6:\"3.3.20\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:59:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/nanoid\";}s:10:\"picocolors\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:10:\"picocolors\";s:10:\"\0*\0version\";s:5:\"1.1.1\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:63:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/picocolors\";}s:9:\"picomatch\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:9:\"picomatch\";s:10:\"\0*\0version\";s:5:\"4.0.7\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:62:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/picomatch\";}s:7:\"postcss\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:7:\"postcss\";s:10:\"\0*\0version\";s:6:\"8.5.32\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:60:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/postcss\";}s:8:\"rolldown\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:8:\"rolldown\";s:10:\"\0*\0version\";s:6:\"1.2.15\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:61:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/rolldown\";}s:4:\"rxjs\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:4:\"rxjs\";s:10:\"\0*\0version\";s:5:\"7.8.2\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:57:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/rxjs\";}s:11:\"shell-quote\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:11:\"shell-quote\";s:10:\"\0*\0version\";s:6:\"1.12.0\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:64:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/shell-quote\";}s:13:\"source-map-js\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:13:\"source-map-js\";s:10:\"\0*\0version\";s:5:\"1.2.2\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:66:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/source-map-js\";}s:14:\"supports-color\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:14:\"supports-color\";s:10:\"\0*\0version\";s:6:\"10.2.2\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:67:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/supports-color\";}s:11:\"tailwindcss\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:11:\"tailwindcss\";s:10:\"\0*\0version\";s:5:\"4.3.3\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:1;s:13:\"\0*\0constraint\";s:6:\"^4.0.0\";s:7:\"\0*\0path\";s:64:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/tailwindcss\";}s:7:\"tapable\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:7:\"tapable\";s:10:\"\0*\0version\";s:5:\"2.3.3\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:60:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/tapable\";}s:10:\"tinyglobby\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:10:\"tinyglobby\";s:10:\"\0*\0version\";s:6:\"0.2.17\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:63:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/tinyglobby\";}s:9:\"tree-kill\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:9:\"tree-kill\";s:10:\"\0*\0version\";s:5:\"1.2.2\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:62:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/tree-kill\";}s:5:\"tslib\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:5:\"tslib\";s:10:\"\0*\0version\";s:5:\"2.8.1\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:58:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/tslib\";}s:4:\"vite\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:4:\"vite\";s:10:\"\0*\0version\";s:5:\"8.3.5\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:1;s:13:\"\0*\0constraint\";s:6:\"^8.0.0\";s:7:\"\0*\0path\";s:57:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/vite\";}s:23:\"vite-plugin-full-reload\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:23:\"vite-plugin-full-reload\";s:10:\"\0*\0version\";s:5:\"1.2.0\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:76:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/vite-plugin-full-reload\";}s:4:\"y18n\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:4:\"y18n\";s:10:\"\0*\0version\";s:5:\"5.0.8\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:57:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/y18n\";}s:5:\"yargs\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:5:\"yargs\";s:10:\"\0*\0version\";s:6:\"18.0.0\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:58:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/yargs\";}s:12:\"yargs-parser\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:12:\"yargs-parser\";s:10:\"\0*\0version\";s:6:\"22.0.0\";s:9:\"\0*\0source\";r:1057;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:65:\"/Users/robbieshugara/Documents/tanamyuk/node_modules/yargs-parser\";}}s:11:\"\0*\0packages\";O:32:\"Laravel\\Roster\\PackageCollection\":2:{s:8:\"\0*\0items\";a:121:{i:0;r:1054;i:1;r:1062;i:2;r:1070;i:3;r:1078;i:4;r:1086;i:5;r:1094;i:6;r:1102;i:7;r:1110;i:8;r:1118;i:9;r:1126;i:10;r:1134;i:11;r:1142;i:12;r:1150;i:13;r:1158;i:14;r:1166;i:15;r:1174;i:16;r:1182;i:17;r:1190;i:18;r:1198;i:19;r:1206;i:20;r:1214;i:21;r:1222;i:22;r:1230;i:23;r:1238;i:24;r:1246;i:25;r:1254;i:26;r:1262;i:27;r:1270;i:28;r:1278;i:29;r:1286;i:30;r:1294;i:31;r:1302;i:32;r:1310;i:33;r:1318;i:34;r:1326;i:35;r:1334;i:36;r:1342;i:37;r:1350;i:38;r:1358;i:39;r:1366;i:40;r:1374;i:41;r:1382;i:42;r:1390;i:43;r:1398;i:44;r:1406;i:45;r:1414;i:46;r:1422;i:47;r:1430;i:48;r:1438;i:49;r:1446;i:50;r:1454;i:51;r:1462;i:52;r:1470;i:53;r:1478;i:54;r:1486;i:55;r:1494;i:56;r:1502;i:57;r:1510;i:58;r:1518;i:59;r:1526;i:60;r:1534;i:61;r:1542;i:62;r:1550;i:63;r:1558;i:64;r:1566;i:65;r:1574;i:66;r:1582;i:67;r:1590;i:68;r:1598;i:69;r:1606;i:70;r:1614;i:71;r:1622;i:72;r:1630;i:73;r:1638;i:74;r:1646;i:75;r:1654;i:76;r:1662;i:77;r:1670;i:78;r:1678;i:79;r:1686;i:80;r:1694;i:81;r:1702;i:82;r:1710;i:83;r:1718;i:84;r:1726;i:85;r:1734;i:86;r:1742;i:87;r:1750;i:88;r:1758;i:89;r:1766;i:90;r:1774;i:91;r:1782;i:92;r:1790;i:93;r:1798;i:94;r:1806;i:95;r:1814;i:96;r:1822;i:97;r:1830;i:98;r:1838;i:99;r:1846;i:100;r:1854;i:101;r:1862;i:102;r:1870;i:103;r:1878;i:104;r:1886;i:105;r:1894;i:106;r:1902;i:107;r:1910;i:108;r:1918;i:109;r:1926;i:110;r:1934;i:111;r:1942;i:112;r:1950;i:113;r:1958;i:114;r:1966;i:115;r:1974;i:116;r:1982;i:117;r:1990;i:118;r:1998;i:119;r:2006;i:120;r:2014;}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:17:\"\0*\0packageManager\";E:41:\"Laravel\\Roster\\Enums\\JsPackageManager:Npm\";}s:6:\"stacks\";O:30:\"Laravel\\Roster\\Support\\EnumSet\":1:{s:8:\"\0*\0cases\";a:1:{i:0;E:32:\"Laravel\\Roster\\Enums\\Stack:Blade\";}}s:21:\"browserTestFrameworks\";O:30:\"Laravel\\Roster\\Support\\EnumSet\":1:{s:8:\"\0*\0cases\";a:0:{}}s:9:\"frontends\";O:30:\"Laravel\\Roster\\Support\\EnumSet\":1:{s:8:\"\0*\0cases\";a:0:{}}s:6:\"agents\";O:30:\"Laravel\\Roster\\Support\\EnumSet\":1:{s:8:\"\0*\0cases\";a:2:{i:0;E:37:\"Laravel\\Roster\\Enums\\Agent:ClaudeCode\";i:1;E:32:\"Laravel\\Roster\\Enums\\Agent:Codex\";}}s:7:\"editors\";O:30:\"Laravel\\Roster\\Support\\EnumSet\":1:{s:8:\"\0*\0cases\";a:0:{}}}',1793125796);
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` bigint(20) NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_locks_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commodities`
--

DROP TABLE IF EXISTS `commodities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commodities` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(30) NOT NULL,
  `name` varchar(100) NOT NULL,
  `category` varchar(100) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `image_url` varchar(500) DEFAULT NULL,
  `default_duration_days` int(10) unsigned DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `commodities_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commodities`
--

LOCK TABLES `commodities` WRITE;
/*!40000 ALTER TABLE `commodities` DISABLE KEYS */;
INSERT INTO `commodities` VALUES (1,'CABAI','Cabai','Sayur Buah','Budidaya cabai dari mulai sampai panen.','https://images.unsplash.com/photo-1588252303782-cb80119abd6d?auto=format&fit=crop&w=600&q=80',90,1,1,'2026-10-27 10:13:57','2026-10-27 10:13:57'),(2,'TOMAT','Tomat','Sayur Buah','Budidaya tomat untuk lahan terbatas.','https://images.unsplash.com/photo-1592924357228-91a4daadcfea?auto=format&fit=crop&w=600&q=80',90,1,2,'2026-10-27 10:13:57','2026-10-27 10:13:57'),(3,'PAKCOY','Pakcoy','Sayur Daun','Budidaya pakcoy sederhana.','https://images.unsplash.com/photo-1540420773420-3366772f4999?auto=format&fit=crop&w=600&q=80',45,1,3,'2026-10-27 10:13:57','2026-10-27 10:13:57');
/*!40000 ALTER TABLE `commodities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commodity_products`
--

DROP TABLE IF EXISTS `commodity_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commodity_products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `commodity_id` bigint(20) unsigned NOT NULL,
  `code` varchar(60) NOT NULL,
  `name` varchar(180) NOT NULL,
  `price` decimal(15,2) NOT NULL,
  `access_type` enum('lifetime','subscription') NOT NULL DEFAULT 'lifetime',
  `description` varchar(700) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `commodity_products_code_unique` (`code`),
  KEY `commodity_products_commodity_id_foreign` (`commodity_id`),
  CONSTRAINT `commodity_products_commodity_id_foreign` FOREIGN KEY (`commodity_id`) REFERENCES `commodities` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commodity_products`
--

LOCK TABLES `commodity_products` WRITE;
/*!40000 ALTER TABLE `commodity_products` DISABLE KEYS */;
INSERT INTO `commodity_products` VALUES (1,1,'CABAI-149','Program Budidaya Cabai',149000.00,'lifetime','Akses Cabai selamanya dan banyak siklus.',1,'2026-10-27 10:13:57','2026-10-27 10:13:57'),(2,2,'TOMAT-149','Program Budidaya Tomat',149000.00,'lifetime','Akses Tomat selamanya.',1,'2026-10-27 10:13:57','2026-10-27 10:13:57'),(3,3,'PAKCOY-99','Program Budidaya Pakcoy',99000.00,'lifetime','Akses Pakcoy selamanya.',1,'2026-10-27 10:13:57','2026-10-27 10:13:57');
/*!40000 ALTER TABLE `commodity_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cultivation_programs`
--

DROP TABLE IF EXISTS `cultivation_programs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cultivation_programs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `commodity_id` bigint(20) unsigned NOT NULL,
  `code` varchar(70) NOT NULL,
  `name` varchar(180) NOT NULL,
  `duration_days` int(10) unsigned NOT NULL,
  `description` varchar(700) DEFAULT NULL,
  `cover_image_url` varchar(500) DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cultivation_programs_code_unique` (`code`),
  KEY `cultivation_programs_commodity_id_foreign` (`commodity_id`),
  CONSTRAINT `cultivation_programs_commodity_id_foreign` FOREIGN KEY (`commodity_id`) REFERENCES `commodities` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cultivation_programs`
--

LOCK TABLES `cultivation_programs` WRITE;
/*!40000 ALTER TABLE `cultivation_programs` DISABLE KEYS */;
INSERT INTO `cultivation_programs` VALUES (1,1,'CABAI-SIMPLE-V1','Budidaya Cabai',90,'Mulai, Tanam, Rawat, Berbuah, Panen.','https://images.unsplash.com/photo-1588252303782-cb80119abd6d?auto=format&fit=crop&w=600&q=80',1,'2026-10-27 10:13:57','2026-10-27 10:13:57'),(2,2,'TOMAT-SIMPLE-V1','Budidaya Tomat',90,'Program sederhana Tomat.','https://images.unsplash.com/photo-1592924357228-91a4daadcfea?auto=format&fit=crop&w=600&q=80',1,'2026-10-27 10:13:57','2026-10-27 10:13:57'),(3,3,'PAKCOY-SIMPLE-V1','Budidaya Pakcoy',45,'Program sederhana Pakcoy.','https://images.unsplash.com/photo-1540420773420-3366772f4999?auto=format&fit=crop&w=600&q=80',1,'2026-10-27 10:13:57','2026-10-27 10:13:57');
/*!40000 ALTER TABLE `cultivation_programs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cultivation_projects`
--

DROP TABLE IF EXISTS `cultivation_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cultivation_projects` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `workspace_id` bigint(20) unsigned NOT NULL,
  `cultivation_program_id` bigint(20) unsigned NOT NULL,
  `created_by` bigint(20) unsigned NOT NULL,
  `project_code` varchar(60) NOT NULL,
  `name` varchar(180) NOT NULL,
  `cycle_no` int(10) unsigned NOT NULL DEFAULT 1,
  `location_name` varchar(180) DEFAULT NULL,
  `initial_plant_count` int(10) unsigned NOT NULL DEFAULT 0,
  `current_plant_count` int(10) unsigned NOT NULL DEFAULT 0,
  `start_date` date NOT NULL,
  `estimated_harvest_date` date DEFAULT NULL,
  `actual_end_date` date DEFAULT NULL,
  `status` enum('draft','active','paused','completed','cancelled') NOT NULL DEFAULT 'active',
  `target_yield_kg` decimal(12,2) DEFAULT NULL,
  `notes` varchar(1000) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cultivation_projects_project_code_unique` (`project_code`),
  KEY `cultivation_projects_cultivation_program_id_foreign` (`cultivation_program_id`),
  KEY `cultivation_projects_created_by_foreign` (`created_by`),
  KEY `idx_projects_workspace_status` (`workspace_id`,`status`),
  CONSTRAINT `cultivation_projects_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cultivation_projects_cultivation_program_id_foreign` FOREIGN KEY (`cultivation_program_id`) REFERENCES `cultivation_programs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cultivation_projects_workspace_id_foreign` FOREIGN KEY (`workspace_id`) REFERENCES `workspaces` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cultivation_projects`
--

LOCK TABLES `cultivation_projects` WRITE;
/*!40000 ALTER TABLE `cultivation_projects` DISABLE KEYS */;
INSERT INTO `cultivation_projects` VALUES (1,1,1,1,'CABAI-001','Cabai Rawit #001',1,'Pekarangan Rumah',50,47,'2026-09-20','2026-12-18',NULL,'active',25.00,'Siklus aktif utama di kebun Robbi.','2026-10-27 10:13:57','2026-10-27 10:13:57'),(2,1,1,1,'CABAI-002','Cabai Rawit #002',2,'Samping Rumah',30,30,'2026-10-20','2027-01-17',NULL,'active',15.00,'Siklus cabai kedua, ekspansi lahan samping.','2026-10-27 10:13:57','2026-10-27 10:13:57'),(3,2,2,2,'TOMAT-001','Tomat #001',1,'Halaman Belakang',20,20,'2026-10-10','2027-01-07',NULL,'active',30.00,'Siklus tomat pertama di kebun keluarga Sari.','2026-10-27 10:13:57','2026-10-27 10:13:57'),(4,1,3,1,'PAKCOY-001','Pakcoy #001',1,'Teras Rumah',24,24,'2026-10-21','2026-12-04',NULL,'active',6.00,'Trial pakcoy hidroponik modul vertikal.','2026-10-27 10:13:57','2026-10-27 10:13:57'),(5,1,1,1,'CABAI-000','Cabai Rawit Percobaan',0,'Pekarangan Rumah',40,35,'2026-04-01','2026-06-29','2026-06-28','completed',18.00,'Riwayat siklus selesai dan sukses panen.','2026-10-27 10:13:57','2026-10-27 10:13:57'),(6,1,1,1,'CABAI-637','Cabai Rawit Test Cycle 3',3,'Lahan Uji Coba',25,25,'2026-10-27','2027-01-25',NULL,'active',20.00,'Catatan tes otomatis','2026-10-27 10:31:09','2026-10-27 10:31:09'),(7,1,1,1,'CABAI-999','Cabai Rawit Test Cycle 3',3,'Lahan Uji Coba',25,25,'2026-10-27','2027-01-25',NULL,'active',20.00,'Catatan tes otomatis','2026-10-27 10:31:54','2026-10-27 10:31:54'),(8,1,1,1,'CABAI-728','Cabai Rawit Test Cycle 3',3,'Lahan Uji Coba',25,25,'2026-10-27','2027-01-25',NULL,'active',20.00,'Catatan tes otomatis','2026-10-27 10:42:11','2026-10-27 10:42:11'),(9,1,1,1,'CABAI-991','Cabai Rawit Test Cycle 3',3,'Lahan Uji Coba',25,25,'2026-10-27','2027-01-25',NULL,'active',20.00,'Catatan tes otomatis','2026-10-27 10:42:19','2026-10-27 10:42:19'),(10,1,1,1,'CABAI-392','Cabai Rawit Test Cycle 3',3,'Lahan Uji Coba',25,25,'2026-10-27','2027-01-25',NULL,'active',20.00,'Catatan tes otomatis','2026-10-27 10:43:03','2026-10-27 10:43:03'),(11,1,1,1,'CABAI-934','Cabai Rawit Test Cycle 3',3,'Lahan Uji Coba',25,25,'2026-10-27','2027-01-25',NULL,'active',20.00,'Catatan tes otomatis','2026-10-27 11:03:35','2026-10-27 11:03:35'),(12,1,1,1,'CABAI-745','Cabai Rawit Test Cycle 3',3,'Lahan Uji Coba',25,25,'2026-10-27','2027-01-25',NULL,'active',20.00,'Catatan tes otomatis','2026-10-27 11:07:16','2026-10-27 11:07:16');
/*!40000 ALTER TABLE `cultivation_projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expense_categories`
--

DROP TABLE IF EXISTS `expense_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expense_categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `name` varchar(120) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `expense_categories_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expense_categories`
--

LOCK TABLES `expense_categories` WRITE;
/*!40000 ALTER TABLE `expense_categories` DISABLE KEYS */;
INSERT INTO `expense_categories` VALUES (1,'BIBIT','Bibit & Benih','2026-10-27 10:13:57'),(2,'MEDIA','Media Tanam','2026-10-27 10:13:57'),(3,'WADAH','Polybag/Wadah','2026-10-27 10:13:57'),(4,'PUPUK','Pupuk & Nutrisi','2026-10-27 10:13:57'),(5,'PENGENDALIAN','Pengendalian Hama','2026-10-27 10:13:57'),(6,'LAINNYA','Operasional Lainnya','2026-10-27 10:13:57');
/*!40000 ALTER TABLE `expense_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` varchar(255) NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`),
  KEY `failed_jobs_connection_queue_failed_at_index` (`connection`,`queue`,`failed_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `harvest_sales`
--

DROP TABLE IF EXISTS `harvest_sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `harvest_sales` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cultivation_project_id` bigint(20) unsigned NOT NULL,
  `harvest_id` bigint(20) unsigned DEFAULT NULL,
  `sold_by` bigint(20) unsigned NOT NULL,
  `sale_date` date NOT NULL,
  `buyer_name` varchar(180) DEFAULT NULL,
  `qty_kg` decimal(12,2) NOT NULL,
  `price_per_kg` decimal(15,2) NOT NULL,
  `total_amount` decimal(15,2) NOT NULL,
  `payment_status` enum('unpaid','partial','paid') NOT NULL DEFAULT 'paid',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `harvest_sales_cultivation_project_id_foreign` (`cultivation_project_id`),
  KEY `harvest_sales_harvest_id_foreign` (`harvest_id`),
  KEY `harvest_sales_sold_by_foreign` (`sold_by`),
  CONSTRAINT `harvest_sales_cultivation_project_id_foreign` FOREIGN KEY (`cultivation_project_id`) REFERENCES `cultivation_projects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `harvest_sales_harvest_id_foreign` FOREIGN KEY (`harvest_id`) REFERENCES `harvests` (`id`) ON DELETE SET NULL,
  CONSTRAINT `harvest_sales_sold_by_foreign` FOREIGN KEY (`sold_by`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `harvest_sales`
--

LOCK TABLES `harvest_sales` WRITE;
/*!40000 ALTER TABLE `harvest_sales` DISABLE KEYS */;
INSERT INTO `harvest_sales` VALUES (1,5,1,1,'2026-06-10','Tetangga Komplek',7.50,35000.00,262500.00,'paid','2026-10-27 10:13:57'),(2,5,2,1,'2026-06-20','Warung Sayur Bu Siti',6.00,32000.00,192000.00,'paid','2026-10-27 10:13:57'),(3,5,3,1,'2026-06-28','Pelanggan Langganan',4.00,30000.00,120000.00,'paid','2026-10-27 10:13:57');
/*!40000 ALTER TABLE `harvest_sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `harvests`
--

DROP TABLE IF EXISTS `harvests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `harvests` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cultivation_project_id` bigint(20) unsigned NOT NULL,
  `harvest_no` int(10) unsigned NOT NULL,
  `recorded_by` bigint(20) unsigned NOT NULL,
  `harvest_date` date NOT NULL,
  `weight_kg` decimal(12,2) NOT NULL DEFAULT 0.00,
  `note` varchar(500) DEFAULT NULL,
  `photo_url` varchar(500) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_project_harvest` (`cultivation_project_id`,`harvest_no`),
  KEY `harvests_recorded_by_foreign` (`recorded_by`),
  CONSTRAINT `harvests_cultivation_project_id_foreign` FOREIGN KEY (`cultivation_project_id`) REFERENCES `cultivation_projects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `harvests_recorded_by_foreign` FOREIGN KEY (`recorded_by`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `harvests`
--

LOCK TABLES `harvests` WRITE;
/*!40000 ALTER TABLE `harvests` DISABLE KEYS */;
INSERT INTO `harvests` VALUES (1,5,1,1,'2026-06-10',7.50,'Panen pertama cabai merah segar.','https://images.unsplash.com/photo-1588252303782-cb80119abd6d?auto=format&fit=crop&w=600&q=80','2026-10-27 10:13:57'),(2,5,2,1,'2026-06-20',6.00,'Panen kedua kualitas bagus.','https://images.unsplash.com/photo-1588252303782-cb80119abd6d?auto=format&fit=crop&w=600&q=80','2026-10-27 10:13:57'),(3,5,3,1,'2026-06-28',4.00,'Panen terakhir penutup siklus.','https://images.unsplash.com/photo-1588252303782-cb80119abd6d?auto=format&fit=crop&w=600&q=80','2026-10-27 10:13:57');
/*!40000 ALTER TABLE `harvests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` smallint(5) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'0001_01_01_000002_create_jobs_table',1),(4,'2026_10_28_000001_create_workspaces_and_members_table',1),(5,'2026_10_28_000002_create_commodities_and_products_table',1),(6,'2026_10_28_000003_create_cultivation_programs_and_stages_table',1),(7,'2026_10_28_000004_create_cultivation_projects_and_members_table',1),(8,'2026_10_28_000005_create_project_notes_and_photos_table',1),(9,'2026_10_28_000006_create_problem_catalog_and_solutions_table',1),(10,'2026_10_28_000007_create_expenses_harvests_and_sales_table',1),(11,'2026_10_28_000008_create_gamification_and_notifications_table',1),(12,'2026_10_28_000009_create_tanamyuk_database_views',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `workspace_id` bigint(20) unsigned NOT NULL,
  `title` varchar(180) NOT NULL,
  `body` varchar(700) NOT NULL,
  `type` varchar(80) NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`data`)),
  `status` enum('queued','sent','read','failed') NOT NULL DEFAULT 'queued',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `sent_at` datetime DEFAULT NULL,
  `read_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_user_id_foreign` (`user_id`),
  KEY `notifications_workspace_id_foreign` (`workspace_id`),
  CONSTRAINT `notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `notifications_workspace_id_foreign` FOREIGN KEY (`workspace_id`) REFERENCES `workspaces` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (1,1,1,'Waktunya cek daun','Periksa kondisi daun Cabai Rawit #001 sore ini.','task_reminder','{\"project_id\":1,\"task_id\":2}','sent','2026-10-27 10:13:57','2026-10-27 15:50:00',NULL),(2,1,1,'Streak 12 hari','Anda aktif merawat tanaman selama 12 hari berturut-turut! 🔥','streak','{\"streak\":12}','read','2026-10-27 10:13:57','2026-10-27 08:00:00','2026-10-27 08:10:00'),(3,2,2,'Foto perkembangan','Jangan lupa catat perkembangan Tomat #001.','reminder','{\"project_id\":3}','queued','2026-10-27 10:13:57',NULL,NULL);
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) unsigned NOT NULL,
  `commodity_product_id` bigint(20) unsigned NOT NULL,
  `product_name` varchar(180) NOT NULL,
  `qty` int(10) unsigned NOT NULL DEFAULT 1,
  `unit_price` decimal(15,2) NOT NULL,
  `total_price` decimal(15,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `order_items_order_id_foreign` (`order_id`),
  KEY `order_items_commodity_product_id_foreign` (`commodity_product_id`),
  CONSTRAINT `order_items_commodity_product_id_foreign` FOREIGN KEY (`commodity_product_id`) REFERENCES `commodity_products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,1,1,'Program Budidaya Cabai',1,149000.00,149000.00,'2026-10-27 10:13:57'),(2,2,2,'Program Budidaya Tomat',1,149000.00,149000.00,'2026-10-27 10:13:57'),(3,3,3,'Program Budidaya Pakcoy',1,99000.00,99000.00,'2026-10-27 10:13:57');
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `workspace_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `order_no` varchar(50) NOT NULL,
  `subtotal` decimal(15,2) NOT NULL DEFAULT 0.00,
  `discount_amount` decimal(15,2) NOT NULL DEFAULT 0.00,
  `total_amount` decimal(15,2) NOT NULL DEFAULT 0.00,
  `status` enum('pending','paid','expired','cancelled','refunded') NOT NULL DEFAULT 'pending',
  `ordered_at` datetime NOT NULL DEFAULT current_timestamp(),
  `paid_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `orders_order_no_unique` (`order_no`),
  KEY `orders_workspace_id_foreign` (`workspace_id`),
  KEY `orders_user_id_foreign` (`user_id`),
  CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `orders_workspace_id_foreign` FOREIGN KEY (`workspace_id`) REFERENCES `workspaces` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,1,'TY-20261001-0001',149000.00,0.00,149000.00,'paid','2026-10-01 09:00:00','2026-10-01 09:02:00','2026-10-27 10:13:57'),(2,2,2,'TY-20261002-0002',149000.00,0.00,149000.00,'paid','2026-10-02 10:00:00','2026-10-02 10:04:00','2026-10-27 10:13:57'),(3,1,1,'TY-20261020-0003',99000.00,0.00,99000.00,'pending','2026-10-20 10:00:00',NULL,'2026-10-27 10:13:57');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) unsigned NOT NULL,
  `provider` varchar(50) NOT NULL,
  `provider_reference` varchar(120) DEFAULT NULL,
  `payment_method` varchar(80) DEFAULT NULL,
  `amount` decimal(15,2) NOT NULL,
  `status` enum('pending','paid','failed','expired','refunded') NOT NULL DEFAULT 'pending',
  `paid_at` datetime DEFAULT NULL,
  `raw_response` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`raw_response`)),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `payments_order_id_foreign` (`order_id`),
  CONSTRAINT `payments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,1,'midtrans','MID-TY-001','QRIS',149000.00,'paid','2026-10-01 09:02:00','{\"transaction_status\":\"settlement\"}','2026-10-27 10:13:57'),(2,2,'midtrans','MID-TY-002','VA_BCA',149000.00,'paid','2026-10-02 10:04:00','{\"transaction_status\":\"settlement\"}','2026-10-27 10:13:57'),(3,3,'midtrans','MID-TY-003','QRIS',99000.00,'pending',NULL,'{\"transaction_status\":\"pending\"}','2026-10-27 10:13:57');
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `problem_catalog`
--

DROP TABLE IF EXISTS `problem_catalog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `problem_catalog` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `commodity_id` bigint(20) unsigned NOT NULL,
  `code` varchar(60) NOT NULL,
  `name` varchar(160) NOT NULL,
  `symptom_label` varchar(180) NOT NULL,
  `summary` varchar(700) DEFAULT NULL,
  `image_url` varchar(500) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_problem_catalog_code` (`commodity_id`,`code`),
  CONSTRAINT `problem_catalog_commodity_id_foreign` FOREIGN KEY (`commodity_id`) REFERENCES `commodities` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `problem_catalog`
--

LOCK TABLES `problem_catalog` WRITE;
/*!40000 ALTER TABLE `problem_catalog` DISABLE KEYS */;
INSERT INTO `problem_catalog` VALUES (1,1,'DAUN_KUNING','Daun Menguning','Daun menguning','Terkait nutrisi, air atau akar.','https://images.unsplash.com/photo-1530595467537-0b5996c41f2d?auto=format&fit=crop&w=600&q=80',1,'2026-10-27 10:13:57'),(2,1,'DAUN_LUBANG','Daun Berlubang','Daun berlubang','Umumnya akibat hama ulat atau belalang.','https://images.unsplash.com/photo-1518531933037-91b2f5f229cc?auto=format&fit=crop&w=600&q=80',1,'2026-10-27 10:13:57'),(3,1,'DAUN_KERITING','Daun Keriting','Daun keriting','Bisa terkait hama kutu kebul atau thrips.','https://images.unsplash.com/photo-1530595467537-0b5996c41f2d?auto=format&fit=crop&w=600&q=80',1,'2026-10-27 10:13:57'),(4,1,'LAYU','Tanaman Layu','Tanaman layu','Periksa air, drainase dan penyakit layu fusarium.','https://images.unsplash.com/photo-1518531933037-91b2f5f229cc?auto=format&fit=crop&w=600&q=80',1,'2026-10-27 10:13:57'),(5,1,'BUNGA_RONTOK','Bunga Rontok','Bunga rontok','Bisa dipicu stres air atau kekurangan kalsium.','https://images.unsplash.com/photo-1530595467537-0b5996c41f2d?auto=format&fit=crop&w=600&q=80',1,'2026-10-27 10:13:57'),(6,2,'TOMAT_LAYU','Tomat Layu','Tomat layu','Periksa media dan akar.','https://images.unsplash.com/photo-1518531933037-91b2f5f229cc?auto=format&fit=crop&w=600&q=80',1,'2026-10-27 10:13:57');
/*!40000 ALTER TABLE `problem_catalog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `problem_solutions`
--

DROP TABLE IF EXISTS `problem_solutions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `problem_solutions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `problem_catalog_id` bigint(20) unsigned NOT NULL,
  `step_no` int(10) unsigned NOT NULL,
  `action_text` varchar(700) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_problem_solution_step` (`problem_catalog_id`,`step_no`),
  CONSTRAINT `problem_solutions_problem_catalog_id_foreign` FOREIGN KEY (`problem_catalog_id`) REFERENCES `problem_catalog` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `problem_solutions`
--

LOCK TABLES `problem_solutions` WRITE;
/*!40000 ALTER TABLE `problem_solutions` DISABLE KEYS */;
INSERT INTO `problem_solutions` VALUES (1,1,1,'Periksa kelembapan media tanam.','2026-10-27 10:13:57'),(2,1,2,'Periksa drainase dan kurangi penyiraman bila terlalu basah.','2026-10-27 10:13:57'),(3,2,1,'Periksa bagian bawah daun dan buang hama yang terlihat.','2026-10-27 10:13:57'),(4,3,1,'Periksa hama kutu dan semprotkan pestisida nabati.','2026-10-27 10:13:57'),(5,4,1,'Periksa kelembapan tanah dan busuk akar.','2026-10-27 10:13:57'),(6,5,1,'Jaga penyiraman stabil dan semprot kalsium boron.','2026-10-27 10:13:57'),(7,6,1,'Periksa media tomat dan drainase pot.','2026-10-27 10:13:57');
/*!40000 ALTER TABLE `problem_solutions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `program_stages`
--

DROP TABLE IF EXISTS `program_stages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `program_stages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cultivation_program_id` bigint(20) unsigned NOT NULL,
  `stage_no` int(10) unsigned NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `start_day` int(10) unsigned NOT NULL,
  `end_day` int(10) unsigned NOT NULL,
  `description` varchar(700) DEFAULT NULL,
  `xp_reward` int(10) unsigned NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_program_stage_no` (`cultivation_program_id`,`stage_no`),
  CONSTRAINT `program_stages_cultivation_program_id_foreign` FOREIGN KEY (`cultivation_program_id`) REFERENCES `cultivation_programs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `program_stages`
--

LOCK TABLES `program_stages` WRITE;
/*!40000 ALTER TABLE `program_stages` DISABLE KEYS */;
INSERT INTO `program_stages` VALUES (1,1,1,'MULAI','Mulai',1,7,'Persiapan dan persemaian benih.',100,'2026-10-27 10:13:57'),(2,1,2,'TANAM','Tanam',8,14,'Pindah tanam bibit ke polybag/lahan.',100,'2026-10-27 10:13:57'),(3,1,3,'RAWAT','Rawat',15,45,'Perawatan rutin, penyiraman & pemupukan vegetatif.',250,'2026-10-27 10:13:57'),(4,1,4,'BERBUAH','Berbuah',46,70,'Pembungaan dan pembesaran buah cabai.',250,'2026-10-27 10:13:57'),(5,1,5,'PANEN','Panen',71,90,'Pemetikan panen bertahap dan pasca panen.',500,'2026-10-27 10:13:57'),(6,2,1,'MULAI','Mulai',1,7,'Persiapan tomat.',100,'2026-10-27 10:13:57'),(7,3,1,'MULAI','Mulai',1,5,'Persiapan pakcoy.',80,'2026-10-27 10:13:57');
/*!40000 ALTER TABLE `program_stages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_expenses`
--

DROP TABLE IF EXISTS `project_expenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_expenses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cultivation_project_id` bigint(20) unsigned NOT NULL,
  `expense_category_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `expense_date` date NOT NULL,
  `description` varchar(250) NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `project_expenses_cultivation_project_id_foreign` (`cultivation_project_id`),
  KEY `project_expenses_expense_category_id_foreign` (`expense_category_id`),
  KEY `project_expenses_user_id_foreign` (`user_id`),
  CONSTRAINT `project_expenses_cultivation_project_id_foreign` FOREIGN KEY (`cultivation_project_id`) REFERENCES `cultivation_projects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `project_expenses_expense_category_id_foreign` FOREIGN KEY (`expense_category_id`) REFERENCES `expense_categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `project_expenses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_expenses`
--

LOCK TABLES `project_expenses` WRITE;
/*!40000 ALTER TABLE `project_expenses` DISABLE KEYS */;
INSERT INTO `project_expenses` VALUES (1,1,1,1,'2026-09-20','Benih cabai unggul',75000.00,'2026-10-27 10:13:57'),(2,1,2,1,'2026-09-20','Media tanam subur 5 karung',150000.00,'2026-10-27 10:13:57'),(3,1,3,1,'2026-09-20','Polybag tebal ukuran 40x40',100000.00,'2026-10-27 10:13:57'),(4,1,4,1,'2026-10-05','Pupuk NPK & Kalsium',150000.00,'2026-10-27 10:13:57'),(5,2,1,1,'2026-10-20','Benih cabai siklus kedua',80000.00,'2026-10-27 10:13:57'),(6,3,1,2,'2026-10-10','Benih tomat mawar',70000.00,'2026-10-27 10:13:57'),(7,4,1,1,'2026-10-21','Benih pakcoy nauli f1',35000.00,'2026-10-27 10:13:57'),(8,5,1,1,'2026-04-01','Benih cabai percobaan',70000.00,'2026-10-27 10:13:57');
/*!40000 ALTER TABLE `project_expenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_members`
--

DROP TABLE IF EXISTS `project_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_members` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cultivation_project_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `role` enum('manager','member','viewer') NOT NULL DEFAULT 'member',
  `joined_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_project_member` (`cultivation_project_id`,`user_id`),
  KEY `project_members_user_id_foreign` (`user_id`),
  CONSTRAINT `project_members_cultivation_project_id_foreign` FOREIGN KEY (`cultivation_project_id`) REFERENCES `cultivation_projects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `project_members_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_members`
--

LOCK TABLES `project_members` WRITE;
/*!40000 ALTER TABLE `project_members` DISABLE KEYS */;
INSERT INTO `project_members` VALUES (1,1,1,'manager','2026-09-20 08:00:00'),(2,1,3,'member','2026-09-20 08:10:00'),(3,2,1,'manager','2026-10-20 08:00:00'),(4,3,2,'manager','2026-10-10 08:00:00'),(5,4,1,'manager','2026-10-21 08:00:00'),(6,5,1,'manager','2026-04-01 08:00:00'),(7,6,1,'manager','2026-10-27 17:31:09'),(8,7,1,'manager','2026-10-27 17:31:54'),(9,8,1,'manager','2026-10-27 17:42:11'),(10,9,1,'manager','2026-10-27 17:42:19'),(11,10,1,'manager','2026-10-27 17:43:03'),(12,11,1,'manager','2026-10-27 18:03:35'),(13,12,1,'manager','2026-10-27 18:07:16');
/*!40000 ALTER TABLE `project_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_notes`
--

DROP TABLE IF EXISTS `project_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_notes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cultivation_project_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `note_date` date NOT NULL,
  `condition_status` enum('good','normal','attention') NOT NULL DEFAULT 'normal',
  `note_text` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `project_notes_cultivation_project_id_foreign` (`cultivation_project_id`),
  KEY `project_notes_user_id_foreign` (`user_id`),
  CONSTRAINT `project_notes_cultivation_project_id_foreign` FOREIGN KEY (`cultivation_project_id`) REFERENCES `cultivation_projects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `project_notes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_notes`
--

LOCK TABLES `project_notes` WRITE;
/*!40000 ALTER TABLE `project_notes` DISABLE KEYS */;
INSERT INTO `project_notes` VALUES (1,1,1,'2026-10-27','good','Tanaman sehat, beberapa mulai menunjukkan calon bunga.','2026-10-27 10:13:57'),(2,2,1,'2026-10-26','good','Bibit cabai mulai tumbuh merata.','2026-10-27 10:13:57'),(3,3,2,'2026-10-20','normal','Tomat tumbuh baik.','2026-10-27 10:13:57'),(4,4,1,'2026-10-26','good','Pakcoy mulai membentuk daun baru.','2026-10-27 10:13:57'),(5,5,1,'2026-06-28','good','Siklus selesai dan panen dicatat.','2026-10-27 10:13:57');
/*!40000 ALTER TABLE `project_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_photos`
--

DROP TABLE IF EXISTS `project_photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_photos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cultivation_project_id` bigint(20) unsigned NOT NULL,
  `project_note_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `photo_date` date NOT NULL,
  `file_url` varchar(500) NOT NULL,
  `caption` varchar(500) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `project_photos_cultivation_project_id_foreign` (`cultivation_project_id`),
  KEY `project_photos_project_note_id_foreign` (`project_note_id`),
  KEY `project_photos_user_id_foreign` (`user_id`),
  CONSTRAINT `project_photos_cultivation_project_id_foreign` FOREIGN KEY (`cultivation_project_id`) REFERENCES `cultivation_projects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `project_photos_project_note_id_foreign` FOREIGN KEY (`project_note_id`) REFERENCES `project_notes` (`id`) ON DELETE SET NULL,
  CONSTRAINT `project_photos_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_photos`
--

LOCK TABLES `project_photos` WRITE;
/*!40000 ALTER TABLE `project_photos` DISABLE KEYS */;
INSERT INTO `project_photos` VALUES (1,1,1,1,'2026-10-27','https://images.unsplash.com/photo-1592924357228-91a4daadcfea?auto=format&fit=crop&w=600&q=80','Cabai hari ke-38.','2026-10-27 10:13:57'),(2,2,2,1,'2026-10-26','https://images.unsplash.com/photo-1588252303782-cb80119abd6d?auto=format&fit=crop&w=600&q=80','Cabai siklus kedua.','2026-10-27 10:13:57'),(3,3,3,2,'2026-10-20','https://images.unsplash.com/photo-1592924357228-91a4daadcfea?auto=format&fit=crop&w=600&q=80','Tomat berkembang baik.','2026-10-27 10:13:57'),(4,4,4,1,'2026-10-26','https://images.unsplash.com/photo-1540420773420-3366772f4999?auto=format&fit=crop&w=600&q=80','Pakcoy hari ke-6.','2026-10-27 10:13:57'),(5,5,5,1,'2026-06-28','https://images.unsplash.com/photo-1588252303782-cb80119abd6d?auto=format&fit=crop&w=600&q=80','Dokumentasi akhir.','2026-10-27 10:13:57');
/*!40000 ALTER TABLE `project_photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_problem_actions`
--

DROP TABLE IF EXISTS `project_problem_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_problem_actions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `project_problem_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `action_date` datetime NOT NULL,
  `action_text` varchar(700) NOT NULL,
  `result_status` enum('done','improved','no_change','resolved') NOT NULL DEFAULT 'done',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `project_problem_actions_project_problem_id_foreign` (`project_problem_id`),
  KEY `project_problem_actions_user_id_foreign` (`user_id`),
  CONSTRAINT `project_problem_actions_project_problem_id_foreign` FOREIGN KEY (`project_problem_id`) REFERENCES `project_problems` (`id`) ON DELETE CASCADE,
  CONSTRAINT `project_problem_actions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_problem_actions`
--

LOCK TABLES `project_problem_actions` WRITE;
/*!40000 ALTER TABLE `project_problem_actions` DISABLE KEYS */;
INSERT INTO `project_problem_actions` VALUES (1,1,1,'2026-10-22 17:00:00','Mengurangi penyiraman dan mengecek drainase lubang polybag.','improved','2026-10-27 10:13:57'),(2,2,3,'2026-10-15 09:00:00','Membersihkan hama ulat secara manual dan menyemprot air tembakau.','resolved','2026-10-27 10:13:57'),(3,3,2,'2026-10-26 15:00:00','Mengecek kelembapan media tomat dan memindahkan ke tempat sedikit teduh.','done','2026-10-27 10:13:57');
/*!40000 ALTER TABLE `project_problem_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_problems`
--

DROP TABLE IF EXISTS `project_problems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_problems` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cultivation_project_id` bigint(20) unsigned NOT NULL,
  `problem_catalog_id` bigint(20) unsigned DEFAULT NULL,
  `reported_by` bigint(20) unsigned NOT NULL,
  `title` varchar(180) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `status` enum('open','monitoring','resolved') NOT NULL DEFAULT 'open',
  `detected_at` datetime NOT NULL,
  `resolved_at` datetime DEFAULT NULL,
  `photo_url` varchar(500) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `project_problems_cultivation_project_id_foreign` (`cultivation_project_id`),
  KEY `project_problems_problem_catalog_id_foreign` (`problem_catalog_id`),
  KEY `project_problems_reported_by_foreign` (`reported_by`),
  CONSTRAINT `project_problems_cultivation_project_id_foreign` FOREIGN KEY (`cultivation_project_id`) REFERENCES `cultivation_projects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `project_problems_problem_catalog_id_foreign` FOREIGN KEY (`problem_catalog_id`) REFERENCES `problem_catalog` (`id`) ON DELETE SET NULL,
  CONSTRAINT `project_problems_reported_by_foreign` FOREIGN KEY (`reported_by`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_problems`
--

LOCK TABLES `project_problems` WRITE;
/*!40000 ALTER TABLE `project_problems` DISABLE KEYS */;
INSERT INTO `project_problems` VALUES (1,1,1,1,'Daun menguning','Tiga tanaman bagian tepi menguning.','monitoring','2026-10-22 16:30:00',NULL,'https://images.unsplash.com/photo-1530595467537-0b5996c41f2d?auto=format&fit=crop&w=600&q=80','2026-10-27 10:13:57'),(2,1,2,3,'Daun berlubang','Beberapa daun berlubang karena ulat.','resolved','2026-10-15 08:00:00','2026-10-18 17:00:00','https://images.unsplash.com/photo-1518531933037-91b2f5f229cc?auto=format&fit=crop&w=600&q=80','2026-10-27 10:13:57'),(3,3,6,2,'Tomat layu','Beberapa tomat layu saat siang terik.','open','2026-10-26 13:00:00',NULL,'https://images.unsplash.com/photo-1518531933037-91b2f5f229cc?auto=format&fit=crop&w=600&q=80','2026-10-27 10:13:57');
/*!40000 ALTER TABLE `project_problems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_stage_progress`
--

DROP TABLE IF EXISTS `project_stage_progress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_stage_progress` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cultivation_project_id` bigint(20) unsigned NOT NULL,
  `program_stage_id` bigint(20) unsigned NOT NULL,
  `status` enum('locked','active','completed','skipped') NOT NULL DEFAULT 'locked',
  `completion_percent` decimal(5,2) NOT NULL DEFAULT 0.00,
  `started_at` datetime DEFAULT NULL,
  `completed_at` datetime DEFAULT NULL,
  `xp_earned` int(10) unsigned NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_project_stage` (`cultivation_project_id`,`program_stage_id`),
  KEY `project_stage_progress_program_stage_id_foreign` (`program_stage_id`),
  CONSTRAINT `project_stage_progress_cultivation_project_id_foreign` FOREIGN KEY (`cultivation_project_id`) REFERENCES `cultivation_projects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `project_stage_progress_program_stage_id_foreign` FOREIGN KEY (`program_stage_id`) REFERENCES `program_stages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_stage_progress`
--

LOCK TABLES `project_stage_progress` WRITE;
/*!40000 ALTER TABLE `project_stage_progress` DISABLE KEYS */;
INSERT INTO `project_stage_progress` VALUES (1,1,1,'completed',100.00,'2026-09-20 08:00:00','2026-09-26 18:00:00',100,'2026-10-27 10:13:57'),(2,1,2,'completed',100.00,'2026-09-27 08:00:00','2026-10-03 18:00:00',100,'2026-10-27 10:13:57'),(3,1,3,'active',38.00,'2026-10-04 08:00:00',NULL,120,'2026-10-27 10:13:57'),(4,1,4,'locked',0.00,NULL,NULL,0,'2026-10-27 10:13:57'),(5,1,5,'locked',0.00,NULL,NULL,0,'2026-10-27 10:13:57'),(6,2,1,'completed',100.00,'2026-10-20 08:00:00','2026-10-26 18:00:00',100,'2026-10-27 10:13:57'),(7,3,6,'completed',100.00,'2026-10-10 08:00:00','2026-10-16 18:00:00',100,'2026-10-27 10:13:57'),(8,4,7,'active',75.00,'2026-10-21 08:00:00',NULL,50,'2026-10-27 10:13:57'),(9,5,5,'completed',100.00,'2026-06-10 08:00:00','2026-06-28 18:00:00',500,'2026-10-27 10:13:57'),(10,6,1,'active',20.00,'2026-10-27 17:31:09',NULL,0,'2026-10-27 17:31:09'),(11,6,2,'locked',0.00,NULL,NULL,0,'2026-10-27 17:31:09'),(12,6,3,'locked',0.00,NULL,NULL,0,'2026-10-27 17:31:09'),(13,6,4,'locked',0.00,NULL,NULL,0,'2026-10-27 17:31:09'),(14,6,5,'locked',0.00,NULL,NULL,0,'2026-10-27 17:31:09'),(15,7,1,'active',20.00,'2026-10-27 17:31:54',NULL,0,'2026-10-27 17:31:54'),(16,7,2,'locked',0.00,NULL,NULL,0,'2026-10-27 17:31:54'),(17,7,3,'locked',0.00,NULL,NULL,0,'2026-10-27 17:31:54'),(18,7,4,'locked',0.00,NULL,NULL,0,'2026-10-27 17:31:54'),(19,7,5,'locked',0.00,NULL,NULL,0,'2026-10-27 17:31:54'),(20,8,1,'active',20.00,'2026-10-27 17:42:11',NULL,0,'2026-10-27 17:42:11'),(21,8,2,'locked',0.00,NULL,NULL,0,'2026-10-27 17:42:11'),(22,8,3,'locked',0.00,NULL,NULL,0,'2026-10-27 17:42:11'),(23,8,4,'locked',0.00,NULL,NULL,0,'2026-10-27 17:42:11'),(24,8,5,'locked',0.00,NULL,NULL,0,'2026-10-27 17:42:11'),(25,9,1,'active',20.00,'2026-10-27 17:42:19',NULL,0,'2026-10-27 17:42:19'),(26,9,2,'locked',0.00,NULL,NULL,0,'2026-10-27 17:42:19'),(27,9,3,'locked',0.00,NULL,NULL,0,'2026-10-27 17:42:19'),(28,9,4,'locked',0.00,NULL,NULL,0,'2026-10-27 17:42:19'),(29,9,5,'locked',0.00,NULL,NULL,0,'2026-10-27 17:42:19'),(30,10,1,'active',20.00,'2026-10-27 17:43:03',NULL,0,'2026-10-27 17:43:03'),(31,10,2,'locked',0.00,NULL,NULL,0,'2026-10-27 17:43:03'),(32,10,3,'locked',0.00,NULL,NULL,0,'2026-10-27 17:43:03'),(33,10,4,'locked',0.00,NULL,NULL,0,'2026-10-27 17:43:03'),(34,10,5,'locked',0.00,NULL,NULL,0,'2026-10-27 17:43:03'),(35,11,1,'active',20.00,'2026-10-27 18:03:35',NULL,0,'2026-10-27 18:03:35'),(36,11,2,'locked',0.00,NULL,NULL,0,'2026-10-27 18:03:35'),(37,11,3,'locked',0.00,NULL,NULL,0,'2026-10-27 18:03:35'),(38,11,4,'locked',0.00,NULL,NULL,0,'2026-10-27 18:03:35'),(39,11,5,'locked',0.00,NULL,NULL,0,'2026-10-27 18:03:35'),(40,12,1,'active',20.00,'2026-10-27 18:07:16',NULL,0,'2026-10-27 18:07:16'),(41,12,2,'locked',0.00,NULL,NULL,0,'2026-10-27 18:07:16'),(42,12,3,'locked',0.00,NULL,NULL,0,'2026-10-27 18:07:16'),(43,12,4,'locked',0.00,NULL,NULL,0,'2026-10-27 18:07:16'),(44,12,5,'locked',0.00,NULL,NULL,0,'2026-10-27 18:07:16');
/*!40000 ALTER TABLE `project_stage_progress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_tasks`
--

DROP TABLE IF EXISTS `project_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_tasks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cultivation_project_id` bigint(20) unsigned NOT NULL,
  `stage_task_id` bigint(20) unsigned DEFAULT NULL,
  `assigned_to` bigint(20) unsigned DEFAULT NULL,
  `title` varchar(180) NOT NULL,
  `instruction` varchar(500) DEFAULT NULL,
  `task_type` enum('watering','fertilizing','inspection','weeding','photo','planting','harvest','other') NOT NULL DEFAULT 'other',
  `due_at` datetime DEFAULT NULL,
  `status` enum('pending','done','skipped','overdue') NOT NULL DEFAULT 'pending',
  `xp_reward` int(10) unsigned NOT NULL DEFAULT 0,
  `completed_at` datetime DEFAULT NULL,
  `completed_by` bigint(20) unsigned DEFAULT NULL,
  `source` enum('system','manual') NOT NULL DEFAULT 'system',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_tasks_stage_task_id_foreign` (`stage_task_id`),
  KEY `project_tasks_assigned_to_foreign` (`assigned_to`),
  KEY `project_tasks_completed_by_foreign` (`completed_by`),
  KEY `idx_project_tasks_today` (`cultivation_project_id`,`status`,`due_at`),
  CONSTRAINT `project_tasks_assigned_to_foreign` FOREIGN KEY (`assigned_to`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `project_tasks_completed_by_foreign` FOREIGN KEY (`completed_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `project_tasks_cultivation_project_id_foreign` FOREIGN KEY (`cultivation_project_id`) REFERENCES `cultivation_projects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `project_tasks_stage_task_id_foreign` FOREIGN KEY (`stage_task_id`) REFERENCES `stage_tasks` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_tasks`
--

LOCK TABLES `project_tasks` WRITE;
/*!40000 ALTER TABLE `project_tasks` DISABLE KEYS */;
INSERT INTO `project_tasks` VALUES (1,1,3,1,'Siram tanaman','Jaga kelembapan media.','watering','2026-10-27 07:00:00','done',10,'2026-10-27 18:07:15',1,'system','2026-10-27 10:13:57','2026-10-27 11:07:15'),(2,1,4,1,'Periksa kondisi daun','Cek warna daun dan hama.','inspection','2026-10-27 16:00:00','pending',10,NULL,NULL,'system','2026-10-27 10:13:57','2026-10-27 10:13:57'),(3,1,5,1,'Berikan pupuk NPK','Gunakan pupuk sesuai dosis.','fertilizing','2026-10-27 08:00:00','pending',20,NULL,NULL,'system','2026-10-27 10:13:57','2026-10-27 10:13:57'),(4,2,3,1,'Siram bibit','Jaga kelembapan media.','watering','2026-10-27 07:00:00','done',10,'2026-10-27 07:10:00',1,'system','2026-10-27 10:13:57','2026-10-27 10:13:57'),(5,3,9,2,'Siapkan media tomat','Siapkan media tanam.','other','2026-10-10 08:00:00','done',20,'2026-10-10 09:00:00',2,'system','2026-10-27 10:13:57','2026-10-27 10:13:57'),(6,4,10,1,'Siapkan media pakcoy','Siapkan media tanam.','other','2026-10-21 08:00:00','done',20,'2026-10-21 08:45:00',1,'system','2026-10-27 10:13:57','2026-10-27 10:13:57'),(7,5,8,1,'Catat panen terakhir','Timbang hasil panen.','harvest','2026-06-28 08:00:00','done',100,'2026-06-28 08:30:00',1,'system','2026-10-27 10:13:57','2026-10-27 10:13:57'),(8,6,1,1,'Siapkan media tanam','Campurkan tanah, kompos dan sekam.','other','2026-10-27 08:00:00','pending',20,NULL,NULL,'system','2026-10-27 10:31:09','2026-10-27 10:31:09'),(9,7,1,1,'Siapkan media tanam','Campurkan tanah, kompos dan sekam.','other','2026-10-27 08:00:00','pending',20,NULL,NULL,'system','2026-10-27 10:31:54','2026-10-27 10:31:54'),(10,8,1,1,'Siapkan media tanam','Campurkan tanah, kompos dan sekam.','other','2026-10-27 08:00:00','pending',20,NULL,NULL,'system','2026-10-27 10:42:11','2026-10-27 10:42:11'),(11,9,1,1,'Siapkan media tanam','Campurkan tanah, kompos dan sekam.','other','2026-10-27 08:00:00','pending',20,NULL,NULL,'system','2026-10-27 10:42:19','2026-10-27 10:42:19'),(12,10,1,1,'Siapkan media tanam','Campurkan tanah, kompos dan sekam.','other','2026-10-27 08:00:00','pending',20,NULL,NULL,'system','2026-10-27 10:43:03','2026-10-27 10:43:03'),(13,11,1,1,'Siapkan media tanam','Campurkan tanah, kompos dan sekam.','other','2026-10-27 08:00:00','pending',20,NULL,NULL,'system','2026-10-27 11:03:35','2026-10-27 11:03:35'),(14,12,1,1,'Siapkan media tanam','Campurkan tanah, kompos dan sekam.','other','2026-10-27 08:00:00','pending',20,NULL,NULL,'system','2026-10-27 11:07:16','2026-10-27 11:07:16');
/*!40000 ALTER TABLE `project_tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reminders`
--

DROP TABLE IF EXISTS `reminders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reminders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `workspace_id` bigint(20) unsigned NOT NULL,
  `cultivation_project_id` bigint(20) unsigned DEFAULT NULL,
  `project_task_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `title` varchar(180) NOT NULL,
  `remind_at` datetime NOT NULL,
  `channel` enum('in_app','push','email','whatsapp') NOT NULL DEFAULT 'push',
  `is_enabled` tinyint(1) NOT NULL DEFAULT 1,
  `sent_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `reminders_workspace_id_foreign` (`workspace_id`),
  KEY `reminders_cultivation_project_id_foreign` (`cultivation_project_id`),
  KEY `reminders_project_task_id_foreign` (`project_task_id`),
  KEY `reminders_user_id_foreign` (`user_id`),
  CONSTRAINT `reminders_cultivation_project_id_foreign` FOREIGN KEY (`cultivation_project_id`) REFERENCES `cultivation_projects` (`id`) ON DELETE SET NULL,
  CONSTRAINT `reminders_project_task_id_foreign` FOREIGN KEY (`project_task_id`) REFERENCES `project_tasks` (`id`) ON DELETE SET NULL,
  CONSTRAINT `reminders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `reminders_workspace_id_foreign` FOREIGN KEY (`workspace_id`) REFERENCES `workspaces` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reminders`
--

LOCK TABLES `reminders` WRITE;
/*!40000 ALTER TABLE `reminders` DISABLE KEYS */;
INSERT INTO `reminders` VALUES (1,1,1,2,1,'Periksa kondisi daun','2026-10-27 15:55:00','push',1,NULL,'2026-10-27 10:13:57'),(2,1,1,3,1,'Beri pupuk Cabai Rawit #001','2026-10-27 07:55:00','push',1,'2026-10-27 07:55:00','2026-10-27 10:13:57'),(3,2,3,NULL,2,'Foto perkembangan tomat','2026-10-28 09:00:00','in_app',1,NULL,'2026-10-27 10:13:57');
/*!40000 ALTER TABLE `reminders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('0cuP94I49lRwuVjclPlt3zbaZBofIpiDw637regi',1,'127.0.0.1','curl/8.7.1','eyJfdG9rZW4iOiJqWnVjUHFoTW5ObEd1OUdTM2hzbWg3R2pTQ3lId2FyRk5LQzdlWDVMIiwibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiOjEsInBhc3N3b3JkX2hhc2hfd2ViIjoiMDc4MDViOGI5MjNjODgwNThmYWZjMDMyNzA3MThkZDM0MmVkYTBiNDE5MjQ3NmQxMzMwOGUwODMxZmI2ODNjOCIsImFjdGl2ZV93b3Jrc3BhY2VfaWQiOjEsIl9wcmV2aW91cyI6eyJ1cmwiOiJodHRwOlwvXC8xMjcuMC4wLjE6ODAwMFwvcGxhbnRzXC8xXC9yZXN1bHRzIiwicm91dGUiOiJwbGFudHMucmVzdWx0cyJ9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX19',1793124227),('1JxE8DyYT9bgNOR3dcviZOo3QYXCkiVJuC6cFfpS',1,'127.0.0.1','curl/8.7.1','eyJfdG9rZW4iOiJTVUJ5RlBwaWhCeWdlZ3Q0WGdrVjhFc0tvQUZUTlVQV2hBdXp5ZG1VIiwibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiOjEsInBhc3N3b3JkX2hhc2hfd2ViIjoiMDc4MDViOGI5MjNjODgwNThmYWZjMDMyNzA3MThkZDM0MmVkYTBiNDE5MjQ3NmQxMzMwOGUwODMxZmI2ODNjOCIsImFjdGl2ZV93b3Jrc3BhY2VfaWQiOjEsIl9wcmV2aW91cyI6eyJ1cmwiOiJodHRwOlwvXC8xMjcuMC4wLjE6ODAwMFwvcGxhbnRzXC8xXC9wcm9ibGVtcyIsInJvdXRlIjoicGxhbnRzLnByb2JsZW1zIn0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfX0=',1793122955),('4hiSZcAXDQYcvuZVhtfpf6B486St19ZpVrhvw6wx',NULL,'127.0.0.1','Symfony','eyJfdG9rZW4iOiIxdHZOUHBTdXBrWHJQVFc1SVV3cGxoQlZMQ3VmT2R5VEU2MWs1WUlhIiwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119fQ==',1793122244),('4VN6bxG7TTZfxR3ZPUxvwLaWQwY7DnKnqaz9tmvx',1,'127.0.0.1','curl/8.7.1','eyJfdG9rZW4iOiI2OUdTMkJkTmJoVzBobUdEeDEyaU1aWjRidnA3YTVIczV4OEdpRzVRIiwibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiOjEsInBhc3N3b3JkX2hhc2hfd2ViIjoiMDc4MDViOGI5MjNjODgwNThmYWZjMDMyNzA3MThkZDM0MmVkYTBiNDE5MjQ3NmQxMzMwOGUwODMxZmI2ODNjOCIsImFjdGl2ZV93b3Jrc3BhY2VfaWQiOjEsIl9wcmV2aW91cyI6eyJ1cmwiOiJodHRwOlwvXC8xMjcuMC4wLjE6ODAwMFwvY2hhbGxlbmdlcyIsInJvdXRlIjoiY2hhbGxlbmdlcy5pbmRleCJ9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX19',1793124227),('7mbU74JX0jcKSk6y1GrZZyPocWAVn7YcpD12nEkt',1,'127.0.0.1','curl/8.7.1','eyJfdG9rZW4iOiJLTXE4QmM0OW90QWhOZ2N5MW1yeW5NRDljU2pUS1BLTU5Ja0NCM2JMIiwibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiOjEsInBhc3N3b3JkX2hhc2hfd2ViIjoiMDc4MDViOGI5MjNjODgwNThmYWZjMDMyNzA3MThkZDM0MmVkYTBiNDE5MjQ3NmQxMzMwOGUwODMxZmI2ODNjOCIsImFjdGl2ZV93b3Jrc3BhY2VfaWQiOjEsIl9wcmV2aW91cyI6eyJ1cmwiOiJodHRwOlwvXC8xMjcuMC4wLjE6ODAwMFwvcGxhbnRzXC8xXC9wcm9ibGVtcyIsInJvdXRlIjoicGxhbnRzLnByb2JsZW1zIn0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfX0=',1793124227),('7S2ZlPumtCZonWzZOJEJ5VnlCnnQgahSW8YRYV9R',1,'127.0.0.1','curl/8.7.1','eyJfdG9rZW4iOiJOTkswSjc0S0g1SXQ0YzFQMVFBdjFsbmp6SFZyb3oxUnF4YkZLRGxwIiwibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiOjEsInBhc3N3b3JkX2hhc2hfd2ViIjoiMDc4MDViOGI5MjNjODgwNThmYWZjMDMyNzA3MThkZDM0MmVkYTBiNDE5MjQ3NmQxMzMwOGUwODMxZmI2ODNjOCIsImFjdGl2ZV93b3Jrc3BhY2VfaWQiOjEsIl9wcmV2aW91cyI6eyJ1cmwiOiJodHRwOlwvXC8xMjcuMC4wLjE6ODAwMFwvcGxhbnRzXC8xXC90aW1lbGluZSIsInJvdXRlIjoicGxhbnRzLnRpbWVsaW5lIn0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfX0=',1793124227),('8JQLWAYzblaCVhC1qXA9qkt2sWa9w7paXYExrMNa',1,'127.0.0.1','Symfony','eyJfdG9rZW4iOiJha3hKeVBaWGtQZUxkT2lpWmhXWUpwZ0IxRERaQXlyTEY5N08ydG1xIiwibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiOjEsInBhc3N3b3JkX2hhc2hfd2ViIjoiMDc4MDViOGI5MjNjODgwNThmYWZjMDMyNzA3MThkZDM0MmVkYTBiNDE5MjQ3NmQxMzMwOGUwODMxZmI2ODNjOCIsIl9wcmV2aW91cyI6eyJ1cmwiOiJodHRwOlwvXC9sb2NhbGhvc3QiLCJyb3V0ZSI6ImRhc2hib2FyZCJ9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX19',1793121981),('8Uf1Rzoziwlk2hxhWkTFpV1INP0uymeonv5sghrr',1,'127.0.0.1','curl/8.7.1','eyJfdG9rZW4iOiIwU0oxdkJmYTFRMEdCNHpBa29wUno1NGJkcWU2bW14Q1JqMEVLZkdCIiwibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiOjEsInBhc3N3b3JkX2hhc2hfd2ViIjoiMDc4MDViOGI5MjNjODgwNThmYWZjMDMyNzA3MThkZDM0MmVkYTBiNDE5MjQ3NmQxMzMwOGUwODMxZmI2ODNjOCIsImFjdGl2ZV93b3Jrc3BhY2VfaWQiOjEsIl9wcmV2aW91cyI6eyJ1cmwiOiJodHRwOlwvXC8xMjcuMC4wLjE6ODAwMFwvdGFuYW1hbiIsInJvdXRlIjpudWxsfSwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119fQ==',1793122968),('9QZy2PtSicFl5FMlKh8Wr9t1FWvNfvcji7bPc7JX',NULL,'127.0.0.1','Symfony','eyJfdG9rZW4iOiJLYkxVWlpuOUkxWkFBT1RQbnJibG16OVpkRDdNbWNiMlpiaGljSzhjIiwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119fQ==',1793122244),('9sPkwgm57GzRyEALFD5UGhIIWziIuH6AMstbOED1',1,'127.0.0.1','curl/8.7.1','eyJfdG9rZW4iOiJPNHhjZmVPcFkySURVeVJoakpFUFFXRWp1bjhmcVM1VXV3OGpWOHRxIiwibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiOjEsInBhc3N3b3JkX2hhc2hfd2ViIjoiMDc4MDViOGI5MjNjODgwNThmYWZjMDMyNzA3MThkZDM0MmVkYTBiNDE5MjQ3NmQxMzMwOGUwODMxZmI2ODNjOCIsImFjdGl2ZV93b3Jrc3BhY2VfaWQiOjEsIl9wcmV2aW91cyI6eyJ1cmwiOiJodHRwOlwvXC8xMjcuMC4wLjE6ODAwMFwvcGxhbnRzIiwicm91dGUiOiJwbGFudHMuaW5kZXgifSwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119fQ==',1793124436),('AgJpDmZs5TAWKkGHaRLyK9Kt4ijhke3HPyqLvirM',1,'127.0.0.1','Symfony','eyJfdG9rZW4iOiJTdDRHOFQ2OVZqWUxkWUY0bjk1bEJZWUVXM0FxMzF3b1UwYXA1ejBQIiwibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiOjEsInBhc3N3b3JkX2hhc2hfd2ViIjoiMDc4MDViOGI5MjNjODgwNThmYWZjMDMyNzA3MThkZDM0MmVkYTBiNDE5MjQ3NmQxMzMwOGUwODMxZmI2ODNjOCIsImFjdGl2ZV93b3Jrc3BhY2VfaWQiOjEsIl9wcmV2aW91cyI6eyJ1cmwiOiJodHRwOlwvXC9sb2NhbGhvc3Q6ODAwMCIsInJvdXRlIjoiZGFzaGJvYXJkIn0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfX0=',1793124215),('bfU9vpdmMJ5e9kOUuYnuItiJLy2pmPZjcZSox5k7',1,'127.0.0.1','Symfony','eyJfdG9rZW4iOiJFcUdLYjExcDJETmZSb0xGSW91NjhBRWJFeXhJMk1ONkJVWXg4R3FaIiwibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiOjEsInBhc3N3b3JkX2hhc2hfd2ViIjoiMDc4MDViOGI5MjNjODgwNThmYWZjMDMyNzA3MThkZDM0MmVkYTBiNDE5MjQ3NmQxMzMwOGUwODMxZmI2ODNjOCIsImFjdGl2ZV93b3Jrc3BhY2VfaWQiOjEsIl9wcmV2aW91cyI6eyJ1cmwiOiJodHRwOlwvXC9sb2NhbGhvc3Q6ODAwMCIsInJvdXRlIjoiZGFzaGJvYXJkIn0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfX0=',1793122983),('bLzMLc4FTLAK3dnReTPIANwmE7q7zk35eSfEcS3b',1,'127.0.0.1','Symfony','eyJfdG9rZW4iOiJYOFZ1SnV6aGNsY0oxTzdjRWdYSGx2OVhOdFlicUVLMzlraEFiM1JZIiwibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiOjEsInBhc3N3b3JkX2hhc2hfd2ViIjoiMDc4MDViOGI5MjNjODgwNThmYWZjMDMyNzA3MThkZDM0MmVkYTBiNDE5MjQ3NmQxMzMwOGUwODMxZmI2ODNjOCIsImFjdGl2ZV93b3Jrc3BhY2VfaWQiOjEsInN1Y2Nlc3MiOiJUdWdhcyBkaXViYWgga2VtYmFsaSBtZW5qYWRpIGJlbHVtIHNlbGVzYWkuIiwiX2ZsYXNoIjp7Im5ldyI6W10sIm9sZCI6WyJzdWNjZXNzIl19fQ==',1793124215),('bP7CkRPC0w0FLvTmvNTYoQ6HJ6d05dEG6Ud6eIcR',1,'127.0.0.1','Symfony','eyJfdG9rZW4iOiJ0ZGpxTHdVMFhFREZxQzVTTk8yWlR3N1FhbGlLTDZIdHZqYVFBaFJSIiwibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiOjEsInBhc3N3b3JkX2hhc2hfd2ViIjoiMDc4MDViOGI5MjNjODgwNThmYWZjMDMyNzA3MThkZDM0MmVkYTBiNDE5MjQ3NmQxMzMwOGUwODMxZmI2ODNjOCIsImFjdGl2ZV93b3Jrc3BhY2VfaWQiOjEsIl9wcmV2aW91cyI6eyJ1cmwiOiJodHRwOlwvXC9sb2NhbGhvc3Q6ODAwMCIsInJvdXRlIjoiZGFzaGJvYXJkIn0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfX0=',1793122939),('C1hSIeVlnwKhAPO0XB6ItKKb9n9eiREEnbc9s1FJ',1,'127.0.0.1','Symfony','eyJfdG9rZW4iOiI2TEQ3eTV1Z1BHTXhSbUlveHJ5NFBkWGM2V0N0dG1kYVlNaEJUQXg0IiwibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiOjEsInBhc3N3b3JkX2hhc2hfd2ViIjoiMDc4MDViOGI5MjNjODgwNThmYWZjMDMyNzA3MThkZDM0MmVkYTBiNDE5MjQ3NmQxMzMwOGUwODMxZmI2ODNjOCIsImFjdGl2ZV93b3Jrc3BhY2VfaWQiOjEsInN1Y2Nlc3MiOiJUdWdhcyBkaXViYWgga2VtYmFsaSBtZW5qYWRpIGJlbHVtIHNlbGVzYWkuIiwiX2ZsYXNoIjp7Im5ldyI6W10sIm9sZCI6WyJzdWNjZXNzIl19fQ==',1793122939),('cF1H93AQO4SP9vxHqdZXLcUTTLjFI40VANLYVEdu',1,'127.0.0.1','Symfony','eyJfdG9rZW4iOiJiZWRjaEhSbXM5YmowbEdqT3RiZ1E1SVRmMVltRUluTlFKbEpPSUpNIiwibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiOjEsInBhc3N3b3JkX2hhc2hfd2ViIjoiMDc4MDViOGI5MjNjODgwNThmYWZjMDMyNzA3MThkZDM0MmVkYTBiNDE5MjQ3NmQxMzMwOGUwODMxZmI2ODNjOCIsImFjdGl2ZV93b3Jrc3BhY2VfaWQiOjEsIl9wcmV2aW91cyI6eyJ1cmwiOiJodHRwOlwvXC9sb2NhbGhvc3Q6ODAwMCIsInJvdXRlIjoiZGFzaGJvYXJkIn0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfX0=',1793124215),('d0VfoD93ADiMQ5qEErz2x75L5Pyb1YPRWq41IkcO',1,'127.0.0.1','curl/8.7.1','eyJfdG9rZW4iOiJCV1o2N1VIMmg4a3U0Tmh5SjkyQkNMazlDSzlFUkx2SVppVEpDN2Y5IiwibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiOjEsInBhc3N3b3JkX2hhc2hfd2ViIjoiMDc4MDViOGI5MjNjODgwNThmYWZjMDMyNzA3MThkZDM0MmVkYTBiNDE5MjQ3NmQxMzMwOGUwODMxZmI2ODNjOCIsImFjdGl2ZV93b3Jrc3BhY2VfaWQiOjEsIl9wcmV2aW91cyI6eyJ1cmwiOiJodHRwOlwvXC8xMjcuMC4wLjE6ODAwMFwvcHJvZmlsZSIsInJvdXRlIjoicHJvZmlsZS5pbmRleCJ9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX19',1793122955),('d6oclBxAKpH69ryx9kCMOHT2TM0ls8WQj5RBvfOt',NULL,'127.0.0.1','Symfony','eyJfdG9rZW4iOiJqQnJRb3hMb1F0WWRDR090MUl4OHpjYllyakpKUjM3Q0ZWZUZmV2tFIiwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119fQ==',1793122078),('duUGRLLblcyEI3EPcdt1xbUN8YkjgWsdWaKYweCJ',1,'127.0.0.1','Symfony','eyJfdG9rZW4iOiJ3OVRkVXNSTUdSbU1Sd1RhZUJvMkYxY3JEenc4RWQ4S253VkU5cXhtIiwibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiOjEsInBhc3N3b3JkX2hhc2hfd2ViIjoiMDc4MDViOGI5MjNjODgwNThmYWZjMDMyNzA3MThkZDM0MmVkYTBiNDE5MjQ3NmQxMzMwOGUwODMxZmI2ODNjOCIsImFjdGl2ZV93b3Jrc3BhY2VfaWQiOjEsIl9wcmV2aW91cyI6eyJ1cmwiOiJodHRwOlwvXC9sb2NhbGhvc3Q6ODAwMCIsInJvdXRlIjoiZGFzaGJvYXJkIn0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfX0=',1793122256),('e5lEex6lxCOYwih3oV2TnrAdl0RSLPGnRCoRhWXO',NULL,'127.0.0.1','Symfony','eyJfdG9rZW4iOiJPWlRjRGM1SjlYdnZWMWtsM0JhMlBWZkRVeUM3ZHB2cHJzbUdVZGhLIiwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119fQ==',1793122256),('ea4nfwKBCJ76II3JcGZhulvMoT1ORsa5OtAZA11F',1,'127.0.0.1','Symfony','eyJfdG9rZW4iOiI2UnhhTGNqd0pucHlHMU5yN2Y2cVZJWWp0RzhRdXBtVHhzZGN0Y0pmIiwibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiOjEsInBhc3N3b3JkX2hhc2hfd2ViIjoiMDc4MDViOGI5MjNjODgwNThmYWZjMDMyNzA3MThkZDM0MmVkYTBiNDE5MjQ3NmQxMzMwOGUwODMxZmI2ODNjOCIsImFjdGl2ZV93b3Jrc3BhY2VfaWQiOjEsIl9wcmV2aW91cyI6eyJ1cmwiOiJodHRwOlwvXC9sb2NhbGhvc3Q6ODAwMCIsInJvdXRlIjoiZGFzaGJvYXJkIn0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfX0=',1793122314),('EfFwaJVQq6AkvRPZfftwnpfl7BvL1fIId9WfEyto',1,'127.0.0.1','curl/8.7.1','eyJfdG9rZW4iOiI1Ukx2YjJ4SDlKdHExMmpnbktmSERkdEZCTDBzZURiUFFxa3dwR2U2IiwibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiOjEsInBhc3N3b3JkX2hhc2hfd2ViIjoiMDc4MDViOGI5MjNjODgwNThmYWZjMDMyNzA3MThkZDM0MmVkYTBiNDE5MjQ3NmQxMzMwOGUwODMxZmI2ODNjOCIsImFjdGl2ZV93b3Jrc3BhY2VfaWQiOjEsIl9wcmV2aW91cyI6eyJ1cmwiOiJodHRwOlwvXC8xMjcuMC4wLjE6ODAwMFwvcGxhbnRzXC8xXC9ub3RlcyIsInJvdXRlIjoicGxhbnRzLm5vdGVzIn0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfX0=',1793124227),('eJ4PvuwMLcjUOWHGVAuiJJJUoyXAJmja2IRFH7PV',1,'127.0.0.1','Symfony','eyJfdG9rZW4iOiJIcVdRSVJSWUc4VUM0ME1HVWlIQnlydzJGdmswcUJPWWpFT3dibjd5IiwibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiOjEsInBhc3N3b3JkX2hhc2hfd2ViIjoiMDc4MDViOGI5MjNjODgwNThmYWZjMDMyNzA3MThkZDM0MmVkYTBiNDE5MjQ3NmQxMzMwOGUwODMxZmI2ODNjOCIsImFjdGl2ZV93b3Jrc3BhY2VfaWQiOjEsIl9wcmV2aW91cyI6eyJ1cmwiOiJodHRwOlwvXC9sb2NhbGhvc3Q6ODAwMCIsInJvdXRlIjoiZGFzaGJvYXJkIn0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfX0=',1793122931),('eXTBLNQMqhPRl2A65AsWBWVlWYQoum9UtHnhVT4g',1,'127.0.0.1','Symfony','eyJfdG9rZW4iOiJIN0NDaVNHNVB1QTVrNUJLQk84VEQxMk5ITURmUUFRYU40MkVuNldVIiwibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiOjEsInBhc3N3b3JkX2hhc2hfd2ViIjoiMDc4MDViOGI5MjNjODgwNThmYWZjMDMyNzA3MThkZDM0MmVkYTBiNDE5MjQ3NmQxMzMwOGUwODMxZmI2ODNjOCIsImFjdGl2ZV93b3Jrc3BhY2VfaWQiOjEsIl9wcmV2aW91cyI6eyJ1cmwiOiJodHRwOlwvXC9sb2NhbGhvc3Q6ODAwMCIsInJvdXRlIjoiZGFzaGJvYXJkIn0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfX0=',1793122244),('f1mzJejWuGOHKGaf0IWrpHlHlfSdSOY62p2rW3cR',1,'127.0.0.1','Symfony','eyJfdG9rZW4iOiJUNGlseFhWa1FVYlUxNWU0NUlCMUhSNVZsMXBBZWdPaVV6NFYzeGM4IiwibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiOjEsInBhc3N3b3JkX2hhc2hfd2ViIjoiMDc4MDViOGI5MjNjODgwNThmYWZjMDMyNzA3MThkZDM0MmVkYTBiNDE5MjQ3NmQxMzMwOGUwODMxZmI2ODNjOCIsImFjdGl2ZV93b3Jrc3BhY2VfaWQiOjEsIl9wcmV2aW91cyI6eyJ1cmwiOiJodHRwOlwvXC9sb2NhbGhvc3QiLCJyb3V0ZSI6ImRhc2hib2FyZCJ9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX19',1793122020),('f2El9cmmiZyNA1GG3FjhJWYhQgvMfAFEbT1BJQxD',1,'127.0.0.1','Symfony','eyJfdG9rZW4iOiI4SnE4ZGF1QlFoU0xDbGlGVW9MbkJ6R3ZRM1FvZlBka1BiNVJWSkNFIiwibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiOjEsInBhc3N3b3JkX2hhc2hfd2ViIjoiMDc4MDViOGI5MjNjODgwNThmYWZjMDMyNzA3MThkZDM0MmVkYTBiNDE5MjQ3NmQxMzMwOGUwODMxZmI2ODNjOCIsImFjdGl2ZV93b3Jrc3BhY2VfaWQiOjEsInN1Y2Nlc3MiOiJCdWRpZGF5YSBDYWJhaSBSYXdpdCBUZXN0IEN5Y2xlIDMgYmVyaGFzaWwgZGlidWF0ISIsIl9mbGFzaCI6eyJuZXciOltdLCJvbGQiOlsic3VjY2VzcyJdfX0=',1793122314),('f2zkOAs35Bv2AvZcw1lHCUXuAawlUGBjiZqSxkGP',1,'127.0.0.1','curl/8.7.1','eyJfdG9rZW4iOiIwa0ZZdUV2ajNFdnp4TzVyRFZmOWFUb011WWZIMlJpdDNON3ZvaTN3IiwibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiOjEsInBhc3N3b3JkX2hhc2hfd2ViIjoiMDc4MDViOGI5MjNjODgwNThmYWZjMDMyNzA3MThkZDM0MmVkYTBiNDE5MjQ3NmQxMzMwOGUwODMxZmI2ODNjOCIsImFjdGl2ZV93b3Jrc3BhY2VfaWQiOjEsIl9wcmV2aW91cyI6eyJ1cmwiOiJodHRwOlwvXC8xMjcuMC4wLjE6ODAwMFwvcGxhbnRzXC8xXC9ub3RlcyIsInJvdXRlIjoicGxhbnRzLm5vdGVzIn0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfX0=',1793122955),('f6u9nP1ws95rfuUWOxRl5N9QlWGCODlpjCNtRRl6',NULL,'127.0.0.1','Symfony','eyJfdG9rZW4iOiJqWG5wSzdkakpIaEdGZTgwczdSbjQ4RU9hNElqaVRjOGhQNFIzcVM5IiwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119fQ==',1793122256),('fqfqK1D5rn2dLbrbGgKJx4HKP3XUplW80gdu2mFW',1,'127.0.0.1','Symfony','eyJfdG9rZW4iOiJVdWNuUmJ4WDAwY3NnOUtOSTJveDQ0dGZlcUJSdjBHVFhvUlBmbDBiIiwibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiOjEsInBhc3N3b3JkX2hhc2hfd2ViIjoiMDc4MDViOGI5MjNjODgwNThmYWZjMDMyNzA3MThkZDM0MmVkYTBiNDE5MjQ3NmQxMzMwOGUwODMxZmI2ODNjOCIsImFjdGl2ZV93b3Jrc3BhY2VfaWQiOjEsIl9wcmV2aW91cyI6eyJ1cmwiOiJodHRwOlwvXC9sb2NhbGhvc3Q6ODAwMCIsInJvdXRlIjoiZGFzaGJvYXJkIn0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfX0=',1793122939),('Fylw75SPLLcoY6R6wnkwwaPf6HBG33jNj01Pnc3x',1,'127.0.0.1','curl/8.7.1','eyJfdG9rZW4iOiJDTFh2bDl6dDJZaWFsckFsRnFWbm02bU9SVm5hT2UwMzhRUWZ5MGRiIiwibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiOjEsInBhc3N3b3JkX2hhc2hfd2ViIjoiMDc4MDViOGI5MjNjODgwNThmYWZjMDMyNzA3MThkZDM0MmVkYTBiNDE5MjQ3NmQxMzMwOGUwODMxZmI2ODNjOCIsImFjdGl2ZV93b3Jrc3BhY2VfaWQiOjEsIl9wcmV2aW91cyI6eyJ1cmwiOiJodHRwOlwvXC8xMjcuMC4wLjE6ODAwMFwvY2hhbGxlbmdlcyIsInJvdXRlIjoiY2hhbGxlbmdlcy5pbmRleCJ9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX19',1793122955),('GdyJFx2MCSr1YJ3BCcAjmLZJlvGCQdFi7XmjbUBc',1,'127.0.0.1','curl/8.7.1','eyJfdG9rZW4iOiJ0c0dYYUpVdjVoVFN1U2tlUnFLUk9FMW02Nzg2RjhsQkVDYmpYY2NQIiwibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiOjEsInBhc3N3b3JkX2hhc2hfd2ViIjoiMDc4MDViOGI5MjNjODgwNThmYWZjMDMyNzA3MThkZDM0MmVkYTBiNDE5MjQ3NmQxMzMwOGUwODMxZmI2ODNjOCIsImFjdGl2ZV93b3Jrc3BhY2VfaWQiOjEsIl9wcmV2aW91cyI6eyJ1cmwiOiJodHRwOlwvXC8xMjcuMC4wLjE6ODAwMFwvcGxhbnRzIiwicm91dGUiOiJwbGFudHMuaW5kZXgifSwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119fQ==',1793122955),('gTU59xhHSAke4j4ZwfrRvF3K3XZWyghqYIg2dS9i',1,'127.0.0.1','Symfony','eyJfdG9rZW4iOiJjakVJdWlQNjd6d2hLcHhTQ1k0b3EyUmxNcm9OWDhwbTVqWDBZRFk4IiwibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiOjEsInBhc3N3b3JkX2hhc2hfd2ViIjoiMDc4MDViOGI5MjNjODgwNThmYWZjMDMyNzA3MThkZDM0MmVkYTBiNDE5MjQ3NmQxMzMwOGUwODMxZmI2ODNjOCIsImFjdGl2ZV93b3Jrc3BhY2VfaWQiOjEsInN1Y2Nlc3MiOiJUdWdhcyBzZWxlc2FpISArMTAgWFAgZGlkYXBhdGthbiBcdWQ4M2NcdWRmODkiLCJfZmxhc2giOnsibmV3IjpbXSwib2xkIjpbInN1Y2Nlc3MiXX19',1793124435),('hKRNEC2Cbw6BqoQJeNgaGyBuyF8mzJxKENUCndFZ',1,'127.0.0.1','curl/8.7.1','eyJfdG9rZW4iOiJxUVVYVHM1TzRTOFJ4NEJzU3BUN1dFV0ZkTVI5Q2laTjlFM0MxbzRQIiwibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiOjEsInBhc3N3b3JkX2hhc2hfd2ViIjoiMDc4MDViOGI5MjNjODgwNThmYWZjMDMyNzA3MThkZDM0MmVkYTBiNDE5MjQ3NmQxMzMwOGUwODMxZmI2ODNjOCIsImFjdGl2ZV93b3Jrc3BhY2VfaWQiOjEsIl9wcmV2aW91cyI6eyJ1cmwiOiJodHRwOlwvXC8xMjcuMC4wLjE6ODAwMFwvcGxhbnRzXC8xIiwicm91dGUiOiJwbGFudHMuc2hvdyJ9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX19',1793124227),('imB4yhBDvFNSx1NhDxPBh6VLYMpJ5brGED6MhXVs',1,'127.0.0.1','curl/8.7.1','eyJfdG9rZW4iOiJsRzBLdTB2d0N1VjNwdW5INnV1a2U3OENqSFhqaGN5aGFjUjZ1TURZIiwibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiOjEsInBhc3N3b3JkX2hhc2hfd2ViIjoiMDc4MDViOGI5MjNjODgwNThmYWZjMDMyNzA3MThkZDM0MmVkYTBiNDE5MjQ3NmQxMzMwOGUwODMxZmI2ODNjOCIsImFjdGl2ZV93b3Jrc3BhY2VfaWQiOjEsIl9wcmV2aW91cyI6eyJ1cmwiOiJodHRwOlwvXC8xMjcuMC4wLjE6ODAwMFwvcHJvZmlsZSIsInJvdXRlIjoicHJvZmlsZS5pbmRleCJ9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX19',1793124436),('JChi9sXZjmSKXLqmhT1YL1Z3tbISivgTE2EvolKR',1,'127.0.0.1','Symfony','eyJfdG9rZW4iOiJ6S1ZNWDk5ekN4OE5Eb0hkS09Fbk9pRUxWNWFna1JjUTJNeDk1VE9MIiwibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiOjEsInBhc3N3b3JkX2hhc2hfd2ViIjoiMDc4MDViOGI5MjNjODgwNThmYWZjMDMyNzA3MThkZDM0MmVkYTBiNDE5MjQ3NmQxMzMwOGUwODMxZmI2ODNjOCIsImFjdGl2ZV93b3Jrc3BhY2VfaWQiOjEsIl9wcmV2aW91cyI6eyJ1cmwiOiJodHRwOlwvXC9sb2NhbGhvc3Q6ODAwMCIsInJvdXRlIjoiZGFzaGJvYXJkIn0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfX0=',1793122983),('jNE6svF8W32uvhzrDitcwJA7BXHrmQciowBTbrE1',1,'127.0.0.1','Symfony','eyJfdG9rZW4iOiJwU3NVY3YwVHZTVmh3dkM4OVpEeGZKc0xjRHU1dGdpRnF1MWgxQW92IiwibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiOjEsInBhc3N3b3JkX2hhc2hfd2ViIjoiMDc4MDViOGI5MjNjODgwNThmYWZjMDMyNzA3MThkZDM0MmVkYTBiNDE5MjQ3NmQxMzMwOGUwODMxZmI2ODNjOCIsImFjdGl2ZV93b3Jrc3BhY2VfaWQiOjEsIl9wcmV2aW91cyI6eyJ1cmwiOiJodHRwOlwvXC9sb2NhbGhvc3Q6ODAwMCIsInJvdXRlIjoiZGFzaGJvYXJkIn0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfX0=',1793122244),('KOopONODLWm8pAEM3DDOEcbp3PSCmN3ynxKITfux',1,'127.0.0.1','curl/8.7.1','eyJfdG9rZW4iOiJpVmpVRkdrdzl2aTJNenhBMEFhREhmMUgyRnpDVzRDUzc5cGd0VmZqIiwibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiOjEsInBhc3N3b3JkX2hhc2hfd2ViIjoiMDc4MDViOGI5MjNjODgwNThmYWZjMDMyNzA3MThkZDM0MmVkYTBiNDE5MjQ3NmQxMzMwOGUwODMxZmI2ODNjOCIsImFjdGl2ZV93b3Jrc3BhY2VfaWQiOjEsIl9wcmV2aW91cyI6eyJ1cmwiOiJodHRwOlwvXC8xMjcuMC4wLjE6ODAwMFwvcGxhbnRzIiwicm91dGUiOiJwbGFudHMuaW5kZXgifSwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119fQ==',1793122968),('kQrc4ycoIJrYvcToU4C10fXGiVYSozgyJCmwMYPZ',1,'127.0.0.1','curl/8.7.1','eyJfdG9rZW4iOiJhNWpiVWl3U2pBQ1hJcDhoSHUxVG5KZFRIdDdJcUFQU2lwbXk0cWVOIiwibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiOjEsInBhc3N3b3JkX2hhc2hfd2ViIjoiMDc4MDViOGI5MjNjODgwNThmYWZjMDMyNzA3MThkZDM0MmVkYTBiNDE5MjQ3NmQxMzMwOGUwODMxZmI2ODNjOCIsImFjdGl2ZV93b3Jrc3BhY2VfaWQiOjEsIl9wcmV2aW91cyI6eyJ1cmwiOiJodHRwOlwvXC8xMjcuMC4wLjE6ODAwMFwvcGxhbnRzIiwicm91dGUiOiJwbGFudHMuaW5kZXgifSwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119fQ==',1793124227),('lc8u04SbY09AuPldXo1xcdF8RUzBpUl7IPpSHiqL',1,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36','eyJfdG9rZW4iOiJzQjQ5Rlc4SUpsbmNXN3gxODliT0dWZUJRSk5EbGtLdVBHYVh1SHFtIiwibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiOjEsInBhc3N3b3JkX2hhc2hfd2ViIjoiMDc4MDViOGI5MjNjODgwNThmYWZjMDMyNzA3MThkZDM0MmVkYTBiNDE5MjQ3NmQxMzMwOGUwODMxZmI2ODNjOCIsImFjdGl2ZV93b3Jrc3BhY2VfaWQiOjEsIl9wcmV2aW91cyI6eyJ1cmwiOiJodHRwOlwvXC9sb2NhbGhvc3Q6ODAwMFwvcHJvZmlsZSIsInJvdXRlIjoicHJvZmlsZS5pbmRleCJ9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX19',1793122502),('LXoPIxXNrgCDs2FlAFzmhHet5QqmtzmBiEiArjMf',1,'127.0.0.1','curl/8.7.1','eyJfdG9rZW4iOiJqRmlRaFRZRUZwSVNIZzJYeGYwYXphT0lRdHo5N0ZGVE05VExuT2E3IiwibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiOjEsInBhc3N3b3JkX2hhc2hfd2ViIjoiMDc4MDViOGI5MjNjODgwNThmYWZjMDMyNzA3MThkZDM0MmVkYTBiNDE5MjQ3NmQxMzMwOGUwODMxZmI2ODNjOCIsImFjdGl2ZV93b3Jrc3BhY2VfaWQiOjEsIl9wcmV2aW91cyI6eyJ1cmwiOiJodHRwOlwvXC8xMjcuMC4wLjE6ODAwMCIsInJvdXRlIjoiZGFzaGJvYXJkIn0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfX0=',1793124436),('LYxgKTHDSlA2gzidN82FqMKY29KrOGbC0tWIOdrx',1,'127.0.0.1','curl/8.7.1','eyJfdG9rZW4iOiI4bmFqZFdRbzVpZTIweVRhYndKTEEwQmNWN3BFQmtlOE9LVGQzbWs3IiwibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiOjEsInBhc3N3b3JkX2hhc2hfd2ViIjoiMDc4MDViOGI5MjNjODgwNThmYWZjMDMyNzA3MThkZDM0MmVkYTBiNDE5MjQ3NmQxMzMwOGUwODMxZmI2ODNjOCIsImFjdGl2ZV93b3Jrc3BhY2VfaWQiOjEsIl9wcmV2aW91cyI6eyJ1cmwiOiJodHRwOlwvXC8xMjcuMC4wLjE6ODAwMCIsInJvdXRlIjoiZGFzaGJvYXJkIn0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfX0=',1793122942),('mqDWVA46BDJzBwcGe69heemhsT6e4wt8sbMJT16q',1,'127.0.0.1','Symfony','eyJfdG9rZW4iOiI0S2poYXMzT3dhSWlrTFZzOXBhWTg4OHF4MklwbDlxQ3Vzam1ZUGtEIiwibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiOjEsInBhc3N3b3JkX2hhc2hfd2ViIjoiMDc4MDViOGI5MjNjODgwNThmYWZjMDMyNzA3MThkZDM0MmVkYTBiNDE5MjQ3NmQxMzMwOGUwODMxZmI2ODNjOCIsImFjdGl2ZV93b3Jrc3BhY2VfaWQiOjEsIl9wcmV2aW91cyI6eyJ1cmwiOiJodHRwOlwvXC9sb2NhbGhvc3Q6ODAwMCIsInJvdXRlIjoiZGFzaGJvYXJkIn0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfX0=',1793122931),('myCs9DHjeOrLQbxHK3QWwyediMrCZX1UmutEwWcT',1,'127.0.0.1','Symfony','eyJfdG9rZW4iOiI3a1c4Umg0UHlNQ2h1Y0ZNeTRYckpYNUJiQk5JbkhESjJwU0RNY1B6IiwibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiOjEsInBhc3N3b3JkX2hhc2hfd2ViIjoiMDc4MDViOGI5MjNjODgwNThmYWZjMDMyNzA3MThkZDM0MmVkYTBiNDE5MjQ3NmQxMzMwOGUwODMxZmI2ODNjOCIsImFjdGl2ZV93b3Jrc3BhY2VfaWQiOjEsInN1Y2Nlc3MiOiJCdWRpZGF5YSBDYWJhaSBSYXdpdCBUZXN0IEN5Y2xlIDMgYmVyaGFzaWwgZGlidWF0ISIsIl9mbGFzaCI6eyJuZXciOltdLCJvbGQiOlsic3VjY2VzcyJdfX0=',1793122939),('NAEVYBzzNTHwvAv69ecCSneyp7uRxJA2tSJ14nBE',1,'127.0.0.1','Symfony','eyJfdG9rZW4iOiJpYmtTTGJvSUtqWGdmdFVJUzZtb3lrT3M5b2ZIU0pLVkptNGZWUU1lIiwibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiOjEsInBhc3N3b3JkX2hhc2hfd2ViIjoiMDc4MDViOGI5MjNjODgwNThmYWZjMDMyNzA3MThkZDM0MmVkYTBiNDE5MjQ3NmQxMzMwOGUwODMxZmI2ODNjOCIsImFjdGl2ZV93b3Jrc3BhY2VfaWQiOjEsIl9wcmV2aW91cyI6eyJ1cmwiOiJodHRwOlwvXC9sb2NhbGhvc3Q6ODAwMCIsInJvdXRlIjoiZGFzaGJvYXJkIn0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfX0=',1793124435),('nKRhilu3fjaC97J69WucSFwyjcHoLVPZD6mXkXhd',1,'127.0.0.1','curl/8.7.1','eyJfdG9rZW4iOiJEeEVOcXdSNXhrU2dkWVk2Unh3bUMwWW5kUmZNV1VMb25KNGZ1SkJjIiwibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiOjEsInBhc3N3b3JkX2hhc2hfd2ViIjoiMDc4MDViOGI5MjNjODgwNThmYWZjMDMyNzA3MThkZDM0MmVkYTBiNDE5MjQ3NmQxMzMwOGUwODMxZmI2ODNjOCIsImFjdGl2ZV93b3Jrc3BhY2VfaWQiOjEsIl9wcmV2aW91cyI6eyJ1cmwiOiJodHRwOlwvXC8xMjcuMC4wLjE6ODAwMFwvcGxhbnRzXC8xXC9yZXN1bHRzIiwicm91dGUiOiJwbGFudHMucmVzdWx0cyJ9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX19',1793124436),('NN1LtJbksLgsoDeYxH9Wv4sCJd6SyaV2hJOySQLP',1,'127.0.0.1','curl/8.7.1','eyJfdG9rZW4iOiJkd0QzbUhPM2FqZ21oa1NQZ1c5d2ZQcmZhZTZlV0hRS1BjZ3RZcFBNIiwibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiOjEsInBhc3N3b3JkX2hhc2hfd2ViIjoiMDc4MDViOGI5MjNjODgwNThmYWZjMDMyNzA3MThkZDM0MmVkYTBiNDE5MjQ3NmQxMzMwOGUwODMxZmI2ODNjOCIsImFjdGl2ZV93b3Jrc3BhY2VfaWQiOjEsIl9wcmV2aW91cyI6eyJ1cmwiOiJodHRwOlwvXC8xMjcuMC4wLjE6ODAwMFwvcGxhbnRzXC8xIiwicm91dGUiOiJwbGFudHMuc2hvdyJ9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX19',1793124436),('OngUj9ZKvEBj5p05g94tYGODzgGDI5Y6QpoRJtz7',1,'127.0.0.1','Symfony','eyJfdG9rZW4iOiJSVEZzZ1lkWnJWOHpydW0wTk1HWXpQenpkd2lHaE8xbHU0NzF1ZlEwIiwibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiOjEsInBhc3N3b3JkX2hhc2hfd2ViIjoiMDc4MDViOGI5MjNjODgwNThmYWZjMDMyNzA3MThkZDM0MmVkYTBiNDE5MjQ3NmQxMzMwOGUwODMxZmI2ODNjOCIsImFjdGl2ZV93b3Jrc3BhY2VfaWQiOjEsIl9wcmV2aW91cyI6eyJ1cmwiOiJodHRwOlwvXC9sb2NhbGhvc3Q6ODAwMCIsInJvdXRlIjoiZGFzaGJvYXJkIn0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfX0=',1793122314),('Pw2gHwVev9aqc2xkHzoZzc73CQ6t98sioX4LzK5z',1,'127.0.0.1','Symfony','eyJfdG9rZW4iOiJ3c3NLVEY2cUNIQWprT3VvSTlPU2lyN21jRVRaaVVueEE5SmRxR29aIiwibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiOjEsInBhc3N3b3JkX2hhc2hfd2ViIjoiMDc4MDViOGI5MjNjODgwNThmYWZjMDMyNzA3MThkZDM0MmVkYTBiNDE5MjQ3NmQxMzMwOGUwODMxZmI2ODNjOCIsImFjdGl2ZV93b3Jrc3BhY2VfaWQiOjEsInN1Y2Nlc3MiOiJUdWdhcyBzZWxlc2FpISArMTAgWFAgZGlkYXBhdGthbiBcdWQ4M2NcdWRmODkiLCJfZmxhc2giOnsibmV3IjpbXSwib2xkIjpbInN1Y2Nlc3MiXX19',1793122931),('q379cNtwOiJQ2Uu9EqoTXA75KMfJGl4FWWtjNKoM',1,'127.0.0.1','Symfony','eyJfdG9rZW4iOiJYakxZQ2tGM1QwdXJiUzMyU28zQllNTUp1d0Y0ZHpBNVAwaGZCZ1lQIiwibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiOjEsInBhc3N3b3JkX2hhc2hfd2ViIjoiMDc4MDViOGI5MjNjODgwNThmYWZjMDMyNzA3MThkZDM0MmVkYTBiNDE5MjQ3NmQxMzMwOGUwODMxZmI2ODNjOCIsImFjdGl2ZV93b3Jrc3BhY2VfaWQiOjEsInN1Y2Nlc3MiOiJCdWRpZGF5YSBDYWJhaSBSYXdpdCBUZXN0IEN5Y2xlIDMgYmVyaGFzaWwgZGlidWF0ISIsIl9mbGFzaCI6eyJuZXciOltdLCJvbGQiOlsic3VjY2VzcyJdfX0=',1793124215),('raz1pHGZOAE9LuL7mKXJLA6Lo3UEEyfc72kMk6O5',1,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36','eyJfdG9rZW4iOiJ1Z2pPb3A4TGxGOE5IOVpMY3NqVHEzOWwyc0ZCcWFBVldFdXRjQzZxIiwibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiOjEsInBhc3N3b3JkX2hhc2hfd2ViIjoiMDc4MDViOGI5MjNjODgwNThmYWZjMDMyNzA3MThkZDM0MmVkYTBiNDE5MjQ3NmQxMzMwOGUwODMxZmI2ODNjOCIsImFjdGl2ZV93b3Jrc3BhY2VfaWQiOjEsIl9wcmV2aW91cyI6eyJ1cmwiOiJodHRwOlwvXC8xMjcuMC4wLjE6ODAwMFwvcGxhbnRzIiwicm91dGUiOiJwbGFudHMuaW5kZXgifSwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119fQ==',1793124319),('rLTgQV9K5uWe8lM5hC0uO3UMOnS5vrZsiI4tge2Z',1,'127.0.0.1','curl/8.7.1','eyJfdG9rZW4iOiJ0OXhieHh5N0swVURiV0N6cjFYZ1lSSEZoaHZRTGVBdWptRk9jYVNpIiwibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiOjEsInBhc3N3b3JkX2hhc2hfd2ViIjoiMDc4MDViOGI5MjNjODgwNThmYWZjMDMyNzA3MThkZDM0MmVkYTBiNDE5MjQ3NmQxMzMwOGUwODMxZmI2ODNjOCIsImFjdGl2ZV93b3Jrc3BhY2VfaWQiOjEsIl9wcmV2aW91cyI6eyJ1cmwiOiJodHRwOlwvXC8xMjcuMC4wLjE6ODAwMFwvcGxhbnRzXC8xIiwicm91dGUiOiJwbGFudHMuc2hvdyJ9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX19',1793122955),('Rn90SpzhcIOJu7cYdLLNtCiaX3Gp6XAsLG17aNNr',1,'127.0.0.1','Symfony','eyJfdG9rZW4iOiJZMGhaR1A2UWxGYXN1a3I5aktIY3ZWWFNTR0RucWZJY283bTlNTDQzIiwibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiOjEsInBhc3N3b3JkX2hhc2hfd2ViIjoiMDc4MDViOGI5MjNjODgwNThmYWZjMDMyNzA3MThkZDM0MmVkYTBiNDE5MjQ3NmQxMzMwOGUwODMxZmI2ODNjOCIsImFjdGl2ZV93b3Jrc3BhY2VfaWQiOjEsInN1Y2Nlc3MiOiJCdWRpZGF5YSBDYWJhaSBSYXdpdCBUZXN0IEN5Y2xlIDMgYmVyaGFzaWwgZGlidWF0ISIsIl9mbGFzaCI6eyJuZXciOltdLCJvbGQiOlsic3VjY2VzcyJdfX0=',1793124436),('S7n0b5a0Uq9pRbHxfeGN7JWeyubUievAADPBNg45',1,'127.0.0.1','curl/8.7.1','eyJfdG9rZW4iOiJwU2VEN2ZBSVVXMWZIdWNZcEw5T1YwcHNhdXJCVEI5YlVNYm1FVEZCIiwibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiOjEsInBhc3N3b3JkX2hhc2hfd2ViIjoiMDc4MDViOGI5MjNjODgwNThmYWZjMDMyNzA3MThkZDM0MmVkYTBiNDE5MjQ3NmQxMzMwOGUwODMxZmI2ODNjOCIsImFjdGl2ZV93b3Jrc3BhY2VfaWQiOjEsIl9wcmV2aW91cyI6eyJ1cmwiOiJodHRwOlwvXC8xMjcuMC4wLjE6ODAwMFwvcGxhbnRzXC8xXC9yZXN1bHRzIiwicm91dGUiOiJwbGFudHMucmVzdWx0cyJ9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX19',1793122955),('tBxKIz5QTr3R1ye1ToRFYXAHmCWxdfCWNzoCDgpP',1,'127.0.0.1','Symfony','eyJfdG9rZW4iOiJKSVZHTlA3ZG9qMGsyY3hCSnhWa1V3Z1pDcGliYXZzemRrVVJyQmtPIiwibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiOjEsInBhc3N3b3JkX2hhc2hfd2ViIjoiMDc4MDViOGI5MjNjODgwNThmYWZjMDMyNzA3MThkZDM0MmVkYTBiNDE5MjQ3NmQxMzMwOGUwODMxZmI2ODNjOCIsImFjdGl2ZV93b3Jrc3BhY2VfaWQiOjEsInN1Y2Nlc3MiOiJUdWdhcyBkaXViYWgga2VtYmFsaSBtZW5qYWRpIGJlbHVtIHNlbGVzYWkuIiwiX2ZsYXNoIjp7Im5ldyI6W10sIm9sZCI6WyJzdWNjZXNzIl19fQ==',1793122314),('tC4f9Dvo8S6KHxOYo8WAYhvhlaggkyFx7nMy6IuU',1,'127.0.0.1','Symfony','eyJfdG9rZW4iOiJoNUx1UzA0d1MwVENuU04yOGxTSkQyUUNmbDVSYUo1ODA5UzBRUjJEIiwibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiOjEsInBhc3N3b3JkX2hhc2hfd2ViIjoiMDc4MDViOGI5MjNjODgwNThmYWZjMDMyNzA3MThkZDM0MmVkYTBiNDE5MjQ3NmQxMzMwOGUwODMxZmI2ODNjOCIsImFjdGl2ZV93b3Jrc3BhY2VfaWQiOjEsIl9wcmV2aW91cyI6eyJ1cmwiOiJodHRwOlwvXC9sb2NhbGhvc3Q6ODAwMCIsInJvdXRlIjoiZGFzaGJvYXJkIn0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfX0=',1793122268),('UCiMLDRZFRruHIYsl6exCLlbr9GFlZ3eLRTkUbtz',1,'127.0.0.1','curl/8.7.1','eyJfdG9rZW4iOiJhRHkzdWgza0FCaUZ4Z0Qybm15YjNsSHhNVmtiVVhxdjhqbTRtakFxIiwibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiOjEsInBhc3N3b3JkX2hhc2hfd2ViIjoiMDc4MDViOGI5MjNjODgwNThmYWZjMDMyNzA3MThkZDM0MmVkYTBiNDE5MjQ3NmQxMzMwOGUwODMxZmI2ODNjOCIsImFjdGl2ZV93b3Jrc3BhY2VfaWQiOjEsIl9wcmV2aW91cyI6eyJ1cmwiOiJodHRwOlwvXC8xMjcuMC4wLjE6ODAwMFwvY2hhbGxlbmdlcyIsInJvdXRlIjoiY2hhbGxlbmdlcy5pbmRleCJ9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX19',1793124436),('uEuFnC6LlUNbWG74dnG0GZweLlb56S1Zf6Pl2RNa',1,'127.0.0.1','Symfony','eyJfdG9rZW4iOiI5NDZpZExjWUppN1VVb2xKUE5RR3N4SzFUQlVRc3Y0TGVLVjE4RkJuIiwibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiOjEsInBhc3N3b3JkX2hhc2hfd2ViIjoiMDc4MDViOGI5MjNjODgwNThmYWZjMDMyNzA3MThkZDM0MmVkYTBiNDE5MjQ3NmQxMzMwOGUwODMxZmI2ODNjOCIsImFjdGl2ZV93b3Jrc3BhY2VfaWQiOjEsIl9wcmV2aW91cyI6eyJ1cmwiOiJodHRwOlwvXC9sb2NhbGhvc3QiLCJyb3V0ZSI6ImRhc2hib2FyZCJ9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX19',1793122071),('ut6BgeXRSaLQZotJ9XhS76bVj1wMVMZAcuscY2YF',1,'127.0.0.1','Symfony','eyJfdG9rZW4iOiJ2NlRrY0hiQ0Nqenc0bUhzdGhJcnpTQTB5UlRsTVdIMFJMdFpTWlQzIiwibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiOjEsInBhc3N3b3JkX2hhc2hfd2ViIjoiMDc4MDViOGI5MjNjODgwNThmYWZjMDMyNzA3MThkZDM0MmVkYTBiNDE5MjQ3NmQxMzMwOGUwODMxZmI2ODNjOCIsImFjdGl2ZV93b3Jrc3BhY2VfaWQiOjEsIl9wcmV2aW91cyI6eyJ1cmwiOiJodHRwOlwvXC9sb2NhbGhvc3Q6ODAwMCIsInJvdXRlIjoiZGFzaGJvYXJkIn0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfX0=',1793122256),('v41DfOfTFHyMkUMzgn2NPWNQVzyROQeGCcZNqkmS',1,'127.0.0.1','Symfony','eyJfdG9rZW4iOiJLOU4zY0NuYktOdGcwMjhoREpyZnZSczdzNUdWREx0OGtXN1JVUDBtIiwibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiOjEsInBhc3N3b3JkX2hhc2hfd2ViIjoiMDc4MDViOGI5MjNjODgwNThmYWZjMDMyNzA3MThkZDM0MmVkYTBiNDE5MjQ3NmQxMzMwOGUwODMxZmI2ODNjOCIsImFjdGl2ZV93b3Jrc3BhY2VfaWQiOjEsInN1Y2Nlc3MiOiJCdWRpZGF5YSBDYWJhaSBSYXdpdCBUZXN0IEN5Y2xlIDMgYmVyaGFzaWwgZGlidWF0ISIsIl9mbGFzaCI6eyJuZXciOltdLCJvbGQiOlsic3VjY2VzcyJdfX0=',1793122983),('VJxCSq74fCcmaDAMTItHR4ghtJNGUX3HQzkcQf1h',1,'127.0.0.1','Symfony','eyJfdG9rZW4iOiJGQ0pWUGNpZ0dRWkpkQWtNWFpwUDBUYW14cWwwY2Myc1pheERDZlV3IiwibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiOjEsInBhc3N3b3JkX2hhc2hfd2ViIjoiMDc4MDViOGI5MjNjODgwNThmYWZjMDMyNzA3MThkZDM0MmVkYTBiNDE5MjQ3NmQxMzMwOGUwODMxZmI2ODNjOCIsIl9wcmV2aW91cyI6eyJ1cmwiOiJodHRwOlwvXC9sb2NhbGhvc3QiLCJyb3V0ZSI6ImRhc2hib2FyZCJ9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX19',1793121989),('X6YnKFWokR6faVjvlTTkG8G8Tz5FfLm5RtAdy6dY',1,'127.0.0.1','Symfony','eyJfdG9rZW4iOiJXNGh3WUc1eDhYS2JITW5MbUpSQjhGUTNaM1kwajVQZ05HZGczT1lwIiwibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiOjEsInBhc3N3b3JkX2hhc2hfd2ViIjoiMDc4MDViOGI5MjNjODgwNThmYWZjMDMyNzA3MThkZDM0MmVkYTBiNDE5MjQ3NmQxMzMwOGUwODMxZmI2ODNjOCIsImFjdGl2ZV93b3Jrc3BhY2VfaWQiOjEsInN1Y2Nlc3MiOiJUdWdhcyBzZWxlc2FpISArMTAgWFAgZGlkYXBhdGthbiBcdWQ4M2NcdWRmODkiLCJfZmxhc2giOnsibmV3IjpbXSwib2xkIjpbInN1Y2Nlc3MiXX19',1793122983),('X8U2HgcXHBuEGYImQ0Cx4kbuDP0JZKo4BhhmpyWx',1,'127.0.0.1','Symfony','eyJfdG9rZW4iOiJNdkYxZTNvT1pJOWJ0aW1aWFBhUG9aeUlsVk9UcUVQeHF1VlJVRmcwIiwibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiOjEsInBhc3N3b3JkX2hhc2hfd2ViIjoiMDc4MDViOGI5MjNjODgwNThmYWZjMDMyNzA3MThkZDM0MmVkYTBiNDE5MjQ3NmQxMzMwOGUwODMxZmI2ODNjOCIsImFjdGl2ZV93b3Jrc3BhY2VfaWQiOjEsInN1Y2Nlc3MiOiJCdWRpZGF5YSBDYWJhaSBSYXdpdCBUZXN0IEN5Y2xlIDMgYmVyaGFzaWwgZGlidWF0ISIsIl9mbGFzaCI6eyJuZXciOltdLCJvbGQiOlsic3VjY2VzcyJdfX0=',1793122931),('yEn3ZGBrIJ91WdK048DGSTfmks9DLLUwV1hLkqvB',1,'127.0.0.1','Symfony','eyJfdG9rZW4iOiJkUFFPVHFRQUYwaFh1a28wTVFKT2lqS3hJbU1ob2hRU1BsVXgxM1ZvIiwibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiOjEsInBhc3N3b3JkX2hhc2hfd2ViIjoiMDc4MDViOGI5MjNjODgwNThmYWZjMDMyNzA3MThkZDM0MmVkYTBiNDE5MjQ3NmQxMzMwOGUwODMxZmI2ODNjOCIsImFjdGl2ZV93b3Jrc3BhY2VfaWQiOjEsIl9wcmV2aW91cyI6eyJ1cmwiOiJodHRwOlwvXC9sb2NhbGhvc3Q6ODAwMCIsInJvdXRlIjoiZGFzaGJvYXJkIn0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfX0=',1793124435),('ymytE78GAnzKetIVrY392a1stYxYVYSRwziAaEuV',1,'127.0.0.1','curl/8.7.1','eyJfdG9rZW4iOiJuOXdlajY3UU9lWGRUZ3dKcm1zWkY0UWo3Y3VzRjdEWHIxVHpwYjJNIiwibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiOjEsInBhc3N3b3JkX2hhc2hfd2ViIjoiMDc4MDViOGI5MjNjODgwNThmYWZjMDMyNzA3MThkZDM0MmVkYTBiNDE5MjQ3NmQxMzMwOGUwODMxZmI2ODNjOCIsImFjdGl2ZV93b3Jrc3BhY2VfaWQiOjEsIl9wcmV2aW91cyI6eyJ1cmwiOiJodHRwOlwvXC8xMjcuMC4wLjE6ODAwMFwvcHJvZmlsZSIsInJvdXRlIjoicHJvZmlsZS5pbmRleCJ9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX19',1793124227),('Z4FcU3rbh4Pe66jSNckrt3ncw0bLrxTAsWdTcgeh',1,'127.0.0.1','curl/8.7.1','eyJfdG9rZW4iOiIyWFJ4M1FJS0xIY0pBVkU2SjV2dHNjaDdZbkN4dm4yU1Q0Nmp1ZjNmIiwibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiOjEsInBhc3N3b3JkX2hhc2hfd2ViIjoiMDc4MDViOGI5MjNjODgwNThmYWZjMDMyNzA3MThkZDM0MmVkYTBiNDE5MjQ3NmQxMzMwOGUwODMxZmI2ODNjOCIsImFjdGl2ZV93b3Jrc3BhY2VfaWQiOjEsIl9wcmV2aW91cyI6eyJ1cmwiOiJodHRwOlwvXC8xMjcuMC4wLjE6ODAwMCIsInJvdXRlIjoiZGFzaGJvYXJkIn0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfX0=',1793124227);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stage_tasks`
--

DROP TABLE IF EXISTS `stage_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stage_tasks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `program_stage_id` bigint(20) unsigned NOT NULL,
  `code` varchar(70) NOT NULL,
  `title` varchar(180) NOT NULL,
  `short_instruction` varchar(500) DEFAULT NULL,
  `task_type` enum('watering','fertilizing','inspection','weeding','photo','planting','harvest','other') NOT NULL DEFAULT 'other',
  `recurrence_type` enum('once','daily','weekly','interval') NOT NULL DEFAULT 'once',
  `recurrence_interval` int(10) unsigned DEFAULT NULL,
  `default_time` time DEFAULT NULL,
  `xp_reward` int(10) unsigned NOT NULL DEFAULT 10,
  `is_required` tinyint(1) NOT NULL DEFAULT 1,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_stage_task_code` (`program_stage_id`,`code`),
  CONSTRAINT `stage_tasks_program_stage_id_foreign` FOREIGN KEY (`program_stage_id`) REFERENCES `program_stages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stage_tasks`
--

LOCK TABLES `stage_tasks` WRITE;
/*!40000 ALTER TABLE `stage_tasks` DISABLE KEYS */;
INSERT INTO `stage_tasks` VALUES (1,1,'SIAPKAN_MEDIA','Siapkan media tanam','Campurkan tanah, kompos dan sekam.','other','once',NULL,'08:00:00',20,1,1,'2026-10-27 10:13:57'),(2,2,'PINDAH_TANAM','Pindah tanam','Pindahkan bibit sehat ke wadah tanam permanen.','planting','once',NULL,'16:00:00',50,1,1,'2026-10-27 10:13:57'),(3,3,'SIRAM','Siram tanaman','Jaga kelembapan media tanam.','watering','daily',1,'07:00:00',10,1,1,'2026-10-27 10:13:57'),(4,3,'CEK_DAUN','Periksa kondisi daun','Cek warna daun dan deteksi dini hama.','inspection','daily',1,'16:00:00',10,1,2,'2026-10-27 10:13:57'),(5,3,'PUPUK','Berikan pupuk NPK','Gunakan pupuk sesuai dosis yang dianjurkan.','fertilizing','interval',7,'07:00:00',20,1,3,'2026-10-27 10:13:57'),(6,3,'FOTO','Catat perkembangan','Ambil foto tanaman untuk jurnal mingguan.','photo','weekly',1,'09:00:00',20,0,4,'2026-10-27 10:13:57'),(7,4,'CEK_BUNGA','Periksa bunga dan buah','Pantau calon buah dan rontok bunga.','inspection','interval',3,'07:00:00',15,1,1,'2026-10-27 10:13:57'),(8,5,'CATAT_PANEN','Catat panen','Timbang dan catat hasil panen hari ini.','harvest','once',NULL,'08:00:00',100,1,1,'2026-10-27 10:13:57'),(9,6,'TOMAT_MEDIA','Siapkan media tomat','Siapkan media tanam tomat bernutrisi.','other','once',NULL,'08:00:00',20,1,1,'2026-10-27 10:13:57'),(10,7,'PAKCOY_MEDIA','Siapkan media pakcoy','Siapkan media tanam hidroponik / tanah.','other','once',NULL,'08:00:00',20,1,1,'2026-10-27 10:13:57');
/*!40000 ALTER TABLE `stage_tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_achievements`
--

DROP TABLE IF EXISTS `user_achievements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_achievements` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `workspace_id` bigint(20) unsigned NOT NULL,
  `achievement_id` bigint(20) unsigned NOT NULL,
  `cultivation_project_id` bigint(20) unsigned DEFAULT NULL,
  `unlocked_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_user_achievement` (`user_id`,`workspace_id`,`achievement_id`),
  KEY `user_achievements_workspace_id_foreign` (`workspace_id`),
  KEY `user_achievements_achievement_id_foreign` (`achievement_id`),
  KEY `user_achievements_cultivation_project_id_foreign` (`cultivation_project_id`),
  CONSTRAINT `user_achievements_achievement_id_foreign` FOREIGN KEY (`achievement_id`) REFERENCES `achievements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_achievements_cultivation_project_id_foreign` FOREIGN KEY (`cultivation_project_id`) REFERENCES `cultivation_projects` (`id`) ON DELETE SET NULL,
  CONSTRAINT `user_achievements_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_achievements_workspace_id_foreign` FOREIGN KEY (`workspace_id`) REFERENCES `workspaces` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_achievements`
--

LOCK TABLES `user_achievements` WRITE;
/*!40000 ALTER TABLE `user_achievements` DISABLE KEYS */;
INSERT INTO `user_achievements` VALUES (1,1,1,1,5,'2026-04-01 01:00:00'),(2,1,1,5,5,'2026-06-10 03:00:00'),(3,1,1,3,1,'2026-10-10 01:00:00'),(4,2,2,1,3,'2026-10-10 01:05:00'),(5,3,1,4,1,'2026-10-18 10:10:00');
/*!40000 ALTER TABLE `user_achievements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_preferences`
--

DROP TABLE IF EXISTS `user_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_preferences` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `language` varchar(10) NOT NULL DEFAULT 'id',
  `theme` enum('light','dark','system') NOT NULL DEFAULT 'light',
  `push_enabled` tinyint(1) NOT NULL DEFAULT 1,
  `email_enabled` tinyint(1) NOT NULL DEFAULT 1,
  `whatsapp_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_preferences_user_id_unique` (`user_id`),
  CONSTRAINT `user_preferences_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_preferences`
--

LOCK TABLES `user_preferences` WRITE;
/*!40000 ALTER TABLE `user_preferences` DISABLE KEYS */;
INSERT INTO `user_preferences` VALUES (1,1,'id','light',1,1,1,'2026-10-27 10:13:57','2026-10-27 10:13:57'),(2,2,'id','system',1,1,0,'2026-10-27 10:13:57','2026-10-27 10:13:57'),(3,3,'id','dark',1,0,0,'2026-10-27 10:13:57','2026-10-27 10:13:57');
/*!40000 ALTER TABLE `user_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_streaks`
--

DROP TABLE IF EXISTS `user_streaks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_streaks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `workspace_id` bigint(20) unsigned NOT NULL,
  `current_streak_days` int(10) unsigned NOT NULL DEFAULT 0,
  `longest_streak_days` int(10) unsigned NOT NULL DEFAULT 0,
  `last_activity_date` date DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_user_workspace_streak` (`user_id`,`workspace_id`),
  KEY `user_streaks_workspace_id_foreign` (`workspace_id`),
  CONSTRAINT `user_streaks_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_streaks_workspace_id_foreign` FOREIGN KEY (`workspace_id`) REFERENCES `workspaces` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_streaks`
--

LOCK TABLES `user_streaks` WRITE;
/*!40000 ALTER TABLE `user_streaks` DISABLE KEYS */;
INSERT INTO `user_streaks` VALUES (1,1,1,12,24,'2026-10-27','2026-10-27 10:13:57'),(2,2,2,8,8,'2026-10-27','2026-10-27 10:13:57'),(3,3,1,3,7,'2026-10-26','2026-10-27 10:13:57');
/*!40000 ALTER TABLE `user_streaks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_xp_transactions`
--

DROP TABLE IF EXISTS `user_xp_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_xp_transactions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `workspace_id` bigint(20) unsigned NOT NULL,
  `cultivation_project_id` bigint(20) unsigned DEFAULT NULL,
  `source_type` enum('task','stage','achievement','problem','harvest','streak','manual') NOT NULL,
  `source_id` bigint(20) unsigned DEFAULT NULL,
  `xp_amount` int(11) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `user_xp_transactions_user_id_foreign` (`user_id`),
  KEY `user_xp_transactions_workspace_id_foreign` (`workspace_id`),
  KEY `user_xp_transactions_cultivation_project_id_foreign` (`cultivation_project_id`),
  CONSTRAINT `user_xp_transactions_cultivation_project_id_foreign` FOREIGN KEY (`cultivation_project_id`) REFERENCES `cultivation_projects` (`id`) ON DELETE SET NULL,
  CONSTRAINT `user_xp_transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_xp_transactions_workspace_id_foreign` FOREIGN KEY (`workspace_id`) REFERENCES `workspaces` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_xp_transactions`
--

LOCK TABLES `user_xp_transactions` WRITE;
/*!40000 ALTER TABLE `user_xp_transactions` DISABLE KEYS */;
INSERT INTO `user_xp_transactions` VALUES (1,1,1,1,'task',1,10,'Selesai menyiram tanaman','2026-10-27 10:13:57'),(2,1,1,1,'stage',1,100,'Selesai tahap Mulai','2026-10-27 10:13:57'),(3,1,1,5,'achievement',1,50,'Badge Tanam Pertama','2026-10-27 10:13:57'),(4,1,1,5,'harvest',1,200,'Panen pertama berhasil','2026-10-27 10:13:57'),(5,2,2,3,'achievement',1,50,'Badge Tanam Pertama','2026-10-27 10:13:57'),(6,3,1,1,'problem',2,50,'Membantu menyelesaikan masalah','2026-10-27 10:13:57'),(7,1,1,6,'manual',NULL,50,'Memulai siklus baru: Cabai Rawit Test Cycle 3','2026-10-27 17:31:09'),(8,1,1,7,'manual',NULL,50,'Memulai siklus baru: Cabai Rawit Test Cycle 3','2026-10-27 17:31:54'),(9,1,1,1,'task',1,10,'Menyelesaikan tugas: Siram tanaman','2026-10-27 17:42:11'),(10,1,1,8,'manual',NULL,50,'Memulai siklus baru: Cabai Rawit Test Cycle 3','2026-10-27 17:42:11'),(11,1,1,9,'manual',NULL,50,'Memulai siklus baru: Cabai Rawit Test Cycle 3','2026-10-27 17:42:19'),(12,1,1,1,'task',1,10,'Menyelesaikan tugas: Siram tanaman','2026-10-27 17:43:03'),(13,1,1,10,'manual',NULL,50,'Memulai siklus baru: Cabai Rawit Test Cycle 3','2026-10-27 17:43:03'),(14,1,1,11,'manual',NULL,50,'Memulai siklus baru: Cabai Rawit Test Cycle 3','2026-10-27 18:03:35'),(15,1,1,1,'task',1,10,'Menyelesaikan tugas: Siram tanaman','2026-10-27 18:07:15'),(16,1,1,12,'manual',NULL,50,'Memulai siklus baru: Cabai Rawit Test Cycle 3','2026-10-27 18:07:16');
/*!40000 ALTER TABLE `user_xp_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) NOT NULL,
  `email` varchar(190) NOT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `avatar_url` varchar(500) DEFAULT NULL,
  `status` enum('active','inactive','suspended') NOT NULL DEFAULT 'active',
  `email_verified_at` datetime DEFAULT NULL,
  `last_login_at` datetime DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Robbi','robbi@tanamyuk.test','081234567890','$2y$12$McRBE8WE.QG6EvjZuGBGf.4gYbBTNPrdPnQYJYJUqZETyya4uKIUO','https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&w=250&q=80','active','2026-09-01 08:00:00','2026-10-27 22:00:00',NULL,'2026-10-27 10:13:57','2026-10-27 10:13:57'),(2,'Sari','sari@tanamyuk.test','081234567891','$2y$12$W4.4ukWBuJh2Wv8VuO9oieFMTCmMOzEP5TxmUSKzYypA5113uAO3e','https://images.unsplash.com/photo-1494790108377-be9c29b29330?auto=format&fit=crop&w=250&q=80','active','2026-09-02 08:00:00','2026-10-27 20:00:00',NULL,'2026-10-27 10:13:57','2026-10-27 10:13:57'),(3,'Budi','budi@tanamyuk.test','081234567892','$2y$12$eLhmoMKZe4aIjS23rHQayem1F1UCM87em0jOBVH6Xw6Jwmm43SCN.',NULL,'active','2026-09-03 08:00:00','2026-10-26 17:00:00',NULL,'2026-10-27 10:13:57','2026-10-27 10:13:57');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `v_dashboard_projects`
--

DROP TABLE IF EXISTS `v_dashboard_projects`;
/*!50001 DROP VIEW IF EXISTS `v_dashboard_projects`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_dashboard_projects` AS SELECT 
 1 AS `project_id`,
 1 AS `workspace_id`,
 1 AS `project_name`,
 1 AS `commodity_name`,
 1 AS `current_plant_count`,
 1 AS `start_date`,
 1 AS `estimated_harvest_date`,
 1 AS `status`,
 1 AS `current_stage_progress`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_project_results`
--

DROP TABLE IF EXISTS `v_project_results`;
/*!50001 DROP VIEW IF EXISTS `v_project_results`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_project_results` AS SELECT 
 1 AS `project_id`,
 1 AS `workspace_id`,
 1 AS `project_name`,
 1 AS `total_expense`,
 1 AS `total_harvest_kg`,
 1 AS `total_sales`,
 1 AS `profit_loss`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_user_gamification`
--

DROP TABLE IF EXISTS `v_user_gamification`;
/*!50001 DROP VIEW IF EXISTS `v_user_gamification`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_user_gamification` AS SELECT 
 1 AS `user_id`,
 1 AS `name`,
 1 AS `total_xp`,
 1 AS `total_badges`,
 1 AS `current_streak_days`,
 1 AS `longest_streak_days`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `workspace_commodity_access`
--

DROP TABLE IF EXISTS `workspace_commodity_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workspace_commodity_access` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `workspace_id` bigint(20) unsigned NOT NULL,
  `commodity_id` bigint(20) unsigned NOT NULL,
  `commodity_product_id` bigint(20) unsigned DEFAULT NULL,
  `source_order_item_id` bigint(20) unsigned DEFAULT NULL,
  `access_type` enum('lifetime','subscription','trial','admin_grant') NOT NULL DEFAULT 'lifetime',
  `starts_at` datetime NOT NULL,
  `ends_at` datetime DEFAULT NULL,
  `status` enum('active','expired','revoked') NOT NULL DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_workspace_commodity` (`workspace_id`,`commodity_id`),
  KEY `workspace_commodity_access_commodity_id_foreign` (`commodity_id`),
  KEY `workspace_commodity_access_commodity_product_id_foreign` (`commodity_product_id`),
  KEY `workspace_commodity_access_source_order_item_id_foreign` (`source_order_item_id`),
  CONSTRAINT `workspace_commodity_access_commodity_id_foreign` FOREIGN KEY (`commodity_id`) REFERENCES `commodities` (`id`) ON DELETE CASCADE,
  CONSTRAINT `workspace_commodity_access_commodity_product_id_foreign` FOREIGN KEY (`commodity_product_id`) REFERENCES `commodity_products` (`id`) ON DELETE SET NULL,
  CONSTRAINT `workspace_commodity_access_source_order_item_id_foreign` FOREIGN KEY (`source_order_item_id`) REFERENCES `order_items` (`id`) ON DELETE SET NULL,
  CONSTRAINT `workspace_commodity_access_workspace_id_foreign` FOREIGN KEY (`workspace_id`) REFERENCES `workspaces` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workspace_commodity_access`
--

LOCK TABLES `workspace_commodity_access` WRITE;
/*!40000 ALTER TABLE `workspace_commodity_access` DISABLE KEYS */;
INSERT INTO `workspace_commodity_access` VALUES (1,1,1,1,1,'lifetime','2026-10-01 09:02:00',NULL,'active','2026-10-27 10:13:57'),(2,2,2,2,2,'lifetime','2026-10-02 10:04:00',NULL,'active','2026-10-27 10:13:57'),(3,1,3,3,NULL,'trial','2026-10-20 10:00:00','2026-10-27 23:59:59','active','2026-10-27 10:13:57');
/*!40000 ALTER TABLE `workspace_commodity_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workspace_members`
--

DROP TABLE IF EXISTS `workspace_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workspace_members` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `workspace_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `role` enum('owner','admin','member','viewer') NOT NULL DEFAULT 'member',
  `status` enum('invited','active','inactive') NOT NULL DEFAULT 'active',
  `joined_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_workspace_user` (`workspace_id`,`user_id`),
  KEY `workspace_members_user_id_foreign` (`user_id`),
  CONSTRAINT `workspace_members_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `workspace_members_workspace_id_foreign` FOREIGN KEY (`workspace_id`) REFERENCES `workspaces` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workspace_members`
--

LOCK TABLES `workspace_members` WRITE;
/*!40000 ALTER TABLE `workspace_members` DISABLE KEYS */;
INSERT INTO `workspace_members` VALUES (1,1,1,'owner','active','2026-09-01 08:00:00','2026-10-27 10:13:57'),(2,1,3,'member','active','2026-09-05 08:00:00','2026-10-27 10:13:57'),(3,2,2,'owner','active','2026-09-02 08:00:00','2026-10-27 10:13:57');
/*!40000 ALTER TABLE `workspace_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workspaces`
--

DROP TABLE IF EXISTS `workspaces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workspaces` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `owner_user_id` bigint(20) unsigned NOT NULL,
  `name` varchar(150) NOT NULL,
  `slug` varchar(160) NOT NULL,
  `type` enum('personal','family','farmer_group','business') NOT NULL DEFAULT 'personal',
  `timezone` varchar(50) NOT NULL DEFAULT 'Asia/Jakarta',
  `currency` char(3) NOT NULL DEFAULT 'IDR',
  `status` enum('active','inactive','suspended') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `workspaces_slug_unique` (`slug`),
  KEY `workspaces_owner_user_id_foreign` (`owner_user_id`),
  CONSTRAINT `workspaces_owner_user_id_foreign` FOREIGN KEY (`owner_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workspaces`
--

LOCK TABLES `workspaces` WRITE;
/*!40000 ALTER TABLE `workspaces` DISABLE KEYS */;
INSERT INTO `workspaces` VALUES (1,1,'Kebun Robbi','kebun-robbi','personal','Asia/Jakarta','IDR','active','2026-10-27 10:13:57','2026-10-27 10:13:57'),(2,2,'Kebun Keluarga Sari','kebun-sari','family','Asia/Jakarta','IDR','active','2026-10-27 10:13:57','2026-10-27 10:13:57');
/*!40000 ALTER TABLE `workspaces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `v_dashboard_projects`
--

/*!50001 DROP VIEW IF EXISTS `v_dashboard_projects`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_dashboard_projects` AS select `p`.`id` AS `project_id`,`p`.`workspace_id` AS `workspace_id`,`p`.`name` AS `project_name`,`c`.`name` AS `commodity_name`,`p`.`current_plant_count` AS `current_plant_count`,`p`.`start_date` AS `start_date`,`p`.`estimated_harvest_date` AS `estimated_harvest_date`,`p`.`status` AS `status`,coalesce(max(case when `ps`.`status` = 'active' then `ps`.`completion_percent` end),100) AS `current_stage_progress` from (((`cultivation_projects` `p` join `cultivation_programs` `cp` on(`cp`.`id` = `p`.`cultivation_program_id`)) join `commodities` `c` on(`c`.`id` = `cp`.`commodity_id`)) left join `project_stage_progress` `ps` on(`ps`.`cultivation_project_id` = `p`.`id`)) group by `p`.`id`,`p`.`workspace_id`,`p`.`name`,`c`.`name`,`p`.`current_plant_count`,`p`.`start_date`,`p`.`estimated_harvest_date`,`p`.`status` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_project_results`
--

/*!50001 DROP VIEW IF EXISTS `v_project_results`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_project_results` AS select `p`.`id` AS `project_id`,`p`.`workspace_id` AS `workspace_id`,`p`.`name` AS `project_name`,coalesce(`e`.`total_expense`,0) AS `total_expense`,coalesce(`h`.`total_harvest_kg`,0) AS `total_harvest_kg`,coalesce(`s`.`total_sales`,0) AS `total_sales`,coalesce(`s`.`total_sales`,0) - coalesce(`e`.`total_expense`,0) AS `profit_loss` from (((`cultivation_projects` `p` left join (select `project_expenses`.`cultivation_project_id` AS `cultivation_project_id`,sum(`project_expenses`.`amount`) AS `total_expense` from `project_expenses` group by `project_expenses`.`cultivation_project_id`) `e` on(`e`.`cultivation_project_id` = `p`.`id`)) left join (select `harvests`.`cultivation_project_id` AS `cultivation_project_id`,sum(`harvests`.`weight_kg`) AS `total_harvest_kg` from `harvests` group by `harvests`.`cultivation_project_id`) `h` on(`h`.`cultivation_project_id` = `p`.`id`)) left join (select `harvest_sales`.`cultivation_project_id` AS `cultivation_project_id`,sum(`harvest_sales`.`total_amount`) AS `total_sales` from `harvest_sales` group by `harvest_sales`.`cultivation_project_id`) `s` on(`s`.`cultivation_project_id` = `p`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_user_gamification`
--

/*!50001 DROP VIEW IF EXISTS `v_user_gamification`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_user_gamification` AS select `u`.`id` AS `user_id`,`u`.`name` AS `name`,coalesce(`x`.`total_xp`,0) AS `total_xp`,coalesce(`a`.`total_badges`,0) AS `total_badges`,coalesce(`st`.`current_streak_days`,0) AS `current_streak_days`,coalesce(`st`.`longest_streak_days`,0) AS `longest_streak_days` from (((`users` `u` left join (select `user_xp_transactions`.`user_id` AS `user_id`,sum(`user_xp_transactions`.`xp_amount`) AS `total_xp` from `user_xp_transactions` group by `user_xp_transactions`.`user_id`) `x` on(`x`.`user_id` = `u`.`id`)) left join (select `user_achievements`.`user_id` AS `user_id`,count(0) AS `total_badges` from `user_achievements` group by `user_achievements`.`user_id`) `a` on(`a`.`user_id` = `u`.`id`)) left join `user_streaks` `st` on(`st`.`user_id` = `u`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-28 14:28:04
