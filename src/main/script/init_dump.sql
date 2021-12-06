-- MySQL dump 10.13  Distrib 5.7.34, for Win64 (x86_64)
--
-- Host: localhost    Database: library
-- ------------------------------------------------------
-- Server version	5.7.34-log

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
-- Table structure for table `answer`
--

DROP TABLE IF EXISTS `answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answer` (
  `answer_no` int(11) NOT NULL AUTO_INCREMENT,
  `enquiry_no` int(11) NOT NULL,
  `answer_title` varchar(1024) NOT NULL,
  `answer_content` varchar(8196) NOT NULL,
  `a_writer_id` varchar(20) NOT NULL,
  `a_writer_name` varchar(50) NOT NULL,
  `answer_hits` int(11) NOT NULL DEFAULT '0',
  `answer_reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`answer_no`),
  KEY `fk_answer_enquiry_no` (`enquiry_no`),
  KEY `answer_FK` (`a_writer_id`),
  CONSTRAINT `answer_FK` FOREIGN KEY (`a_writer_id`) REFERENCES `member` (`user_id`),
  CONSTRAINT `fk_answer_enquiry_no` FOREIGN KEY (`enquiry_no`) REFERENCES `enquiry` (`enquiry_no`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer`
--

LOCK TABLES `answer` WRITE;
/*!40000 ALTER TABLE `answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article` (
  `article_no` int(11) NOT NULL AUTO_INCREMENT,
  `article_title` varchar(50) NOT NULL,
  `article_content` varchar(8196) NOT NULL,
  `writer_id` varchar(20) NOT NULL,
  `writer_name` varchar(50) NOT NULL,
  `article_reg_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `article_views` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`article_no`),
  KEY `article_FK` (`writer_id`),
  CONSTRAINT `article_FK` FOREIGN KEY (`writer_id`) REFERENCES `member` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attach_file`
--

DROP TABLE IF EXISTS `attach_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attach_file` (
  `uuid` varchar(500) NOT NULL,
  `upload_path` varchar(200) NOT NULL,
  `file_name` varchar(100) NOT NULL,
  `file_type` char(1) DEFAULT '1',
  `article_no` int(11) NOT NULL,
  PRIMARY KEY (`uuid`),
  KEY `article_no` (`article_no`),
  CONSTRAINT `attach_file_ibfk_1` FOREIGN KEY (`article_no`) REFERENCES `article` (`article_no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attach_file`
--

LOCK TABLES `attach_file` WRITE;
/*!40000 ALTER TABLE `attach_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `attach_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendar`
--

DROP TABLE IF EXISTS `calendar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calendar` (
  `cal_no` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `user_id` varchar(20) NOT NULL,
  `title` varchar(1024) NOT NULL,
  `start` date NOT NULL,
  `end` date NOT NULL,
  `allDay` int(11) NOT NULL,
  `textColor` varchar(50) NOT NULL,
  `backgroundColor` varchar(50) NOT NULL,
  `borderColor` varchar(50) NOT NULL,
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`cal_no`),
  KEY `calendar_FK` (`user_id`),
  CONSTRAINT `calendar_FK` FOREIGN KEY (`user_id`) REFERENCES `member` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendar`
--

LOCK TABLES `calendar` WRITE;
/*!40000 ALTER TABLE `calendar` DISABLE KEYS */;
/*!40000 ALTER TABLE `calendar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enquiry`
--

DROP TABLE IF EXISTS `enquiry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enquiry` (
  `enquiry_no` int(11) NOT NULL AUTO_INCREMENT,
  `enquiry_title` varchar(1024) NOT NULL,
  `enquiry_content` varchar(8196) NOT NULL,
  `writer_id` varchar(20) NOT NULL,
  `writer_name` varchar(50) NOT NULL,
  `enquiry_hits` int(11) NOT NULL DEFAULT '0',
  `enquiry_reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`enquiry_no`),
  KEY `enquiry_FK` (`writer_id`),
  CONSTRAINT `enquiry_FK` FOREIGN KEY (`writer_id`) REFERENCES `member` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enquiry`
--

LOCK TABLES `enquiry` WRITE;
/*!40000 ALTER TABLE `enquiry` DISABLE KEYS */;
/*!40000 ALTER TABLE `enquiry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hope`
--

DROP TABLE IF EXISTS `hope`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hope` (
  `hope_no` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(20) NOT NULL,
  `book_title` varchar(100) NOT NULL,
  `book_author` varchar(200) NOT NULL,
  `book_publisher` varchar(50) NOT NULL,
  `book_pubdate` varchar(20) NOT NULL,
  `book_isbn` varchar(20) DEFAULT NULL,
  `note` varchar(100) DEFAULT NULL,
  `book_price` varchar(20) DEFAULT NULL,
  `hope_status` int(11) DEFAULT '0',
  `cancel_reason` varchar(100) DEFAULT NULL,
  `hope_reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`hope_no`),
  KEY `hope_FK` (`user_id`),
  CONSTRAINT `hope_FK` FOREIGN KEY (`user_id`) REFERENCES `member` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hope`
--

LOCK TABLES `hope` WRITE;
/*!40000 ALTER TABLE `hope` DISABLE KEYS */;
/*!40000 ALTER TABLE `hope` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan_history`
--

DROP TABLE IF EXISTS `loan_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loan_history` (
  `loan_no` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(20) NOT NULL,
  `user_email` varchar(40) NOT NULL,
  `book_title` varchar(100) NOT NULL,
  `book_author` varchar(200) NOT NULL,
  `book_isbn` varchar(20) NOT NULL,
  `book_cover` varchar(2000) DEFAULT NULL,
  `book_pubdate` varchar(20) NOT NULL,
  `book_publisher` varchar(50) NOT NULL,
  `loan_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `return_date` timestamp NULL DEFAULT NULL,
  `return_period` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `return_status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`loan_no`),
  KEY `loan_history_FK` (`user_id`),
  CONSTRAINT `loan_history_FK` FOREIGN KEY (`user_id`) REFERENCES `member` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan_history`
--

LOCK TABLES `loan_history` WRITE;
/*!40000 ALTER TABLE `loan_history` DISABLE KEYS */;
INSERT INTO `loan_history` VALUES (1,'admin','library.raon@gmail.com','이것이 리눅스다 (개정판) with RedHat CentOS 8 - 1대의 컴퓨터로 여러 대의 컴퓨터 환경을 구축하며 배우는 리눅스 서버 & 네트워크','우재남 지음','9791162242605','https://image.aladin.co.kr/product/23652/67/cover500/k932638839_1.jpg','2020-04-09','한빛미디어','2021-12-06 08:31:56','2021-12-06 08:33:13','2021-12-20 08:31:56',1),(2,'admin','library.raon@gmail.com','윤성우의 열혈 C++ 프로그래밍 - 개정판','윤성우 지음','9788996094043','https://image.aladin.co.kr/product/696/7/cover500/8996094048_1.jpg','2010-05-13','오렌지미디어','2021-12-06 08:32:56',NULL,'2021-12-20 08:32:56',0);
/*!40000 ALTER TABLE `loan_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member` (
  `user_id` varchar(20) NOT NULL,
  `user_pw` varchar(1024) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `user_birth` date DEFAULT NULL,
  `user_tel` varchar(30) NOT NULL,
  `user_email` varchar(40) NOT NULL,
  `user_zip` varchar(10) NOT NULL,
  `user_address` varchar(255) NOT NULL,
  `user_address_detail` varchar(255) NOT NULL,
  `user_able_loan` int(11) NOT NULL DEFAULT '10',
  `user_book_count` int(11) NOT NULL DEFAULT '0',
  `user_overdue_date` int(11) DEFAULT '0',
  `enabled` varchar(1) DEFAULT '1',
  `user_reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES ('admin','$2a$10$oyw6645fwRPh9BOpgsVzZuqkSQr1N/b8UGE25hiU0ww7kEQ/e.YPW','관리자','2021-12-06','01000000000','library.raon@gmail.com','63309','제주특별자치도 제주시 첨단로 242 (영평동)','1',10,1,1,'1','2021-12-06 08:18:23');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_auth`
--

DROP TABLE IF EXISTS `member_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member_auth` (
  `user_id` varchar(20) NOT NULL,
  `auth` varchar(100) NOT NULL,
  KEY `fk_member_auth_user_id` (`user_id`),
  CONSTRAINT `fk_member_auth_userid` FOREIGN KEY (`user_id`) REFERENCES `member` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_auth`
--

LOCK TABLES `member_auth` WRITE;
/*!40000 ALTER TABLE `member_auth` DISABLE KEYS */;
INSERT INTO `member_auth` VALUES ('admin','ROLE_MEMBER'),('admin','ROLE_ADMIN'),('admin','ROLE_MASTER');
/*!40000 ALTER TABLE `member_auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice`
--

DROP TABLE IF EXISTS `notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notice` (
  `notice_no` int(11) NOT NULL AUTO_INCREMENT,
  `notice_title` varchar(50) NOT NULL,
  `notice_content` varchar(8196) NOT NULL,
  `writer_id` varchar(20) NOT NULL,
  `writer_name` varchar(50) NOT NULL,
  `notice_reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `notice_views` int(11) NOT NULL DEFAULT '0',
  `notice_img` mediumblob,
  PRIMARY KEY (`notice_no`),
  KEY `notice_FK` (`writer_id`),
  CONSTRAINT `notice_FK` FOREIGN KEY (`writer_id`) REFERENCES `member` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice`
--

LOCK TABLES `notice` WRITE;
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
INSERT INTO `notice` VALUES (1,'[긴급공지] 코로나19 관련 달성군립도서관 방역패스 적용 안내 (12/6~)','<p><img alt=\"\" src=\"https://library.daegu.go.kr/data/board/689/459655/202112041032_oSJvawj.jpg\" style=\"height:665px; width:940px\" /></p>\r\n\r\n<p>12월 3일 정부의 특별방역대책 추가 조치에 따라 도서관이 방역패스 의무화 대상으로 지정되었습니다.</p>\r\n\r\n<p>따라서 도서관을 출입 또는 이용 시 예방접종 완료증명서나 코로나 검사(PCR) 음성확인서를 제시하여야 합니다.</p>\r\n\r\n<p>그리고 방역조치에 따라 지하1층 출입구만 개방하고 각층 출입문을 폐쇄예정이오니 많은 양해 바랍니다.</p>\r\n\r\n<p>본 방침은 12/6일부터 전국 도서관에 적용되며 도서관을 출입 또는 이용하고자 하시는 분들은 위의 사항을 숙지하여 이용에 참고하시기 바랍니다.</p>\r\n','admin','관리자','2021-12-06 08:31:17',1,NULL);
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice_attach_file`
--

DROP TABLE IF EXISTS `notice_attach_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notice_attach_file` (
  `uuid` varchar(500) NOT NULL,
  `upload_path` varchar(200) NOT NULL,
  `file_name` varchar(100) NOT NULL,
  `file_type` char(1) DEFAULT '1',
  `notice_no` int(11) NOT NULL,
  PRIMARY KEY (`uuid`),
  KEY `notice_no` (`notice_no`),
  CONSTRAINT `notice_attach_file_ibfk_1` FOREIGN KEY (`notice_no`) REFERENCES `notice` (`notice_no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice_attach_file`
--

LOCK TABLES `notice_attach_file` WRITE;
/*!40000 ALTER TABLE `notice_attach_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `notice_attach_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reading_room`
--

DROP TABLE IF EXISTS `reading_room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reading_room` (
  `seat_no` int(11) NOT NULL,
  `user_id` varchar(20) DEFAULT NULL,
  `checkin_time` timestamp NULL DEFAULT NULL,
  `checkout_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`seat_no`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reading_room`
--

LOCK TABLES `reading_room` WRITE;
/*!40000 ALTER TABLE `reading_room` DISABLE KEYS */;
INSERT INTO `reading_room` VALUES (1,NULL,NULL,NULL),(2,NULL,NULL,NULL),(3,NULL,NULL,NULL),(4,NULL,NULL,NULL),(5,NULL,NULL,NULL),(6,NULL,NULL,NULL),(7,NULL,NULL,NULL),(8,NULL,NULL,NULL),(9,NULL,NULL,NULL),(10,NULL,NULL,NULL),(11,NULL,NULL,NULL),(12,NULL,NULL,NULL),(13,NULL,NULL,NULL),(14,NULL,NULL,NULL),(15,NULL,NULL,NULL),(16,NULL,NULL,NULL),(17,NULL,NULL,NULL),(18,NULL,NULL,NULL),(19,NULL,NULL,NULL),(20,NULL,NULL,NULL),(21,NULL,NULL,NULL),(22,NULL,NULL,NULL),(23,NULL,NULL,NULL),(24,NULL,NULL,NULL),(25,NULL,NULL,NULL),(26,NULL,NULL,NULL),(27,NULL,NULL,NULL),(28,NULL,NULL,NULL),(29,NULL,NULL,NULL),(30,NULL,NULL,NULL),(31,NULL,NULL,NULL),(32,NULL,NULL,NULL),(33,NULL,NULL,NULL),(34,NULL,NULL,NULL),(35,NULL,NULL,NULL),(36,NULL,NULL,NULL),(37,NULL,NULL,NULL),(38,NULL,NULL,NULL),(39,NULL,NULL,NULL),(40,NULL,NULL,NULL),(41,NULL,NULL,NULL),(42,NULL,NULL,NULL),(43,NULL,NULL,NULL),(44,NULL,NULL,NULL),(45,NULL,NULL,NULL),(46,NULL,NULL,NULL),(47,NULL,NULL,NULL),(48,NULL,NULL,NULL),(49,NULL,NULL,NULL),(50,NULL,NULL,NULL),(51,NULL,NULL,NULL),(52,NULL,NULL,NULL),(53,NULL,NULL,NULL),(54,NULL,NULL,NULL),(55,NULL,NULL,NULL),(56,NULL,NULL,NULL),(57,NULL,NULL,NULL),(58,NULL,NULL,NULL),(59,NULL,NULL,NULL),(60,NULL,NULL,NULL),(61,NULL,NULL,NULL),(62,NULL,NULL,NULL),(63,NULL,NULL,NULL),(64,NULL,NULL,NULL),(65,NULL,NULL,NULL),(66,NULL,NULL,NULL),(67,NULL,NULL,NULL),(68,NULL,NULL,NULL),(69,NULL,NULL,NULL),(70,NULL,NULL,NULL),(71,NULL,NULL,NULL),(72,NULL,NULL,NULL),(73,NULL,NULL,NULL),(74,NULL,NULL,NULL),(75,NULL,NULL,NULL),(76,NULL,NULL,NULL),(77,NULL,NULL,NULL),(78,NULL,NULL,NULL),(79,NULL,NULL,NULL),(80,NULL,NULL,NULL),(81,NULL,NULL,NULL),(82,NULL,NULL,NULL),(83,NULL,NULL,NULL),(84,NULL,NULL,NULL),(85,NULL,NULL,NULL),(86,NULL,NULL,NULL),(87,NULL,NULL,NULL),(88,NULL,NULL,NULL),(89,NULL,NULL,NULL),(90,NULL,NULL,NULL),(91,NULL,NULL,NULL),(92,NULL,NULL,NULL),(93,NULL,NULL,NULL),(94,NULL,NULL,NULL),(95,NULL,NULL,NULL),(96,NULL,NULL,NULL),(97,NULL,NULL,NULL),(98,NULL,NULL,NULL),(99,NULL,NULL,NULL),(100,NULL,NULL,NULL),(101,NULL,NULL,NULL),(102,NULL,NULL,NULL),(103,NULL,NULL,NULL),(104,NULL,NULL,NULL),(105,NULL,NULL,NULL),(106,NULL,NULL,NULL),(107,NULL,NULL,NULL),(108,NULL,NULL,NULL),(109,NULL,NULL,NULL),(110,NULL,NULL,NULL),(111,NULL,NULL,NULL),(112,NULL,NULL,NULL),(113,NULL,NULL,NULL),(114,NULL,NULL,NULL),(115,NULL,NULL,NULL),(116,NULL,NULL,NULL),(117,NULL,NULL,NULL),(118,NULL,NULL,NULL),(119,NULL,NULL,NULL),(120,NULL,NULL,NULL),(121,NULL,NULL,NULL),(122,NULL,NULL,NULL),(123,NULL,NULL,NULL),(124,NULL,NULL,NULL);
/*!40000 ALTER TABLE `reading_room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recommend_book`
--

DROP TABLE IF EXISTS `recommend_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recommend_book` (
  `rec_no` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(20) NOT NULL,
  `book_title` varchar(100) NOT NULL,
  `book_author` varchar(200) NOT NULL,
  `book_isbn` varchar(20) NOT NULL,
  `book_cover` varchar(2000) NOT NULL,
  `book_pubdate` varchar(20) NOT NULL,
  `book_publisher` varchar(50) NOT NULL,
  `recommend_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`rec_no`),
  KEY `recommend_book_FK` (`user_id`),
  CONSTRAINT `recommend_book_FK` FOREIGN KEY (`user_id`) REFERENCES `member` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recommend_book`
--

LOCK TABLES `recommend_book` WRITE;
/*!40000 ALTER TABLE `recommend_book` DISABLE KEYS */;
/*!40000 ALTER TABLE `recommend_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `secession_member`
--

DROP TABLE IF EXISTS `secession_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `secession_member` (
  `user_id` varchar(20) NOT NULL,
  `user_email` varchar(40) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `secession_member`
--

LOCK TABLES `secession_member` WRITE;
/*!40000 ALTER TABLE `secession_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `secession_member` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-06 17:35:09
