-- MySQL dump 10.13  Distrib 5.1.62, for Win64 (unknown)
--
-- Host: localhost    Database: db_boot_base
-- ------------------------------------------------------
-- Server version	5.1.62-community

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
-- Table structure for table `ylrc_database_bak`
--

DROP TABLE IF EXISTS `ylrc_database_bak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ylrc_database_bak` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `filename` varchar(32) NOT NULL,
  `filepath` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ylrc_database_bak`
--

LOCK TABLES `ylrc_database_bak` WRITE;
/*!40000 ALTER TABLE `ylrc_database_bak` DISABLE KEYS */;
INSERT INTO `ylrc_database_bak` VALUES (10,'2020-03-22 19:36:47','2020-03-22 19:36:47','db_boot_base_20200322193647.sql','D:/workspace_devloper/baseproject/base/src/main/resources/backup/'),(11,'2020-03-22 19:37:54','2020-03-22 19:37:54','db_boot_base_20200322193754.sql','D:/workspace_devloper/baseproject/base/src/main/resources/backup/'),(12,'2020-03-22 19:40:04','2020-03-22 19:40:04','db_boot_base_20200322194004.sql','D:/workspace_devloper/baseproject/base/src/main/resources/backup/'),(14,'2020-03-22 19:40:14','2020-03-22 19:40:14','db_boot_base_20200322194014.sql','D:/workspace_devloper/baseproject/base/src/main/resources/backup/'),(15,'2020-03-22 19:40:19','2020-03-22 19:40:19','db_boot_base_20200322194019.sql','D:/workspace_devloper/baseproject/base/src/main/resources/backup/'),(17,'2020-03-22 19:43:34','2020-03-22 19:43:34','db_boot_base_20200322194334.sql','D:/workspace_devloper/baseproject/base/src/main/resources/backup/'),(18,'2020-03-22 19:43:39','2020-03-22 19:43:39','db_boot_base_20200322194339.sql','D:/workspace_devloper/baseproject/base/src/main/resources/backup/'),(20,'2020-03-22 19:43:49','2020-03-22 19:43:49','db_boot_base_20200322194349.sql','D:/workspace_devloper/baseproject/base/src/main/resources/backup/'),(21,'2020-03-22 19:43:54','2020-03-22 19:43:54','db_boot_base_20200322194354.sql','D:/workspace_devloper/baseproject/base/src/main/resources/backup/'),(22,'2020-03-22 19:43:59','2020-03-22 19:43:59','db_boot_base_20200322194359.sql','D:/workspace_devloper/baseproject/base/src/main/resources/backup/'),(23,'2020-03-22 19:44:04','2020-03-22 19:44:04','db_boot_base_20200322194404.sql','D:/workspace_devloper/baseproject/base/src/main/resources/backup/'),(24,'2020-03-22 19:44:09','2020-03-22 19:44:09','db_boot_base_20200322194409.sql','D:/workspace_devloper/baseproject/base/src/main/resources/backup/'),(25,'2020-03-22 19:44:14','2020-03-22 19:44:14','db_boot_base_20200322194414.sql','D:/workspace_devloper/baseproject/base/src/main/resources/backup/'),(26,'2020-03-22 19:44:19','2020-03-22 19:44:19','db_boot_base_20200322194419.sql','D:/workspace_devloper/baseproject/base/src/main/resources/backup/'),(27,'2020-03-22 19:44:24','2020-03-22 19:44:24','db_boot_base_20200322194424.sql','D:/workspace_devloper/baseproject/base/src/main/resources/backup/'),(28,'2020-03-22 19:44:29','2020-03-22 19:44:29','db_boot_base_20200322194429.sql','D:/workspace_devloper/baseproject/base/src/main/resources/backup/'),(29,'2020-03-22 19:44:34','2020-03-22 19:44:34','db_boot_base_20200322194434.sql','D:/workspace_devloper/baseproject/base/src/main/resources/backup/'),(30,'2020-03-22 19:44:39','2020-03-22 19:44:39','db_boot_base_20200322194439.sql','D:/workspace_devloper/baseproject/base/src/main/resources/backup/'),(31,'2020-03-23 17:46:49','2020-03-23 17:46:49','db_boot_base_20200323174649.sql','D:/workspace_devloper/baseproject/base/src/main/resources/backup/'),(32,'2021-03-21 01:00:00','2021-03-21 01:00:00','db_boot_base_20210321010000.sql','E:/ylrc_workspace/spring-boot-base/src/main/resources/backup/');
/*!40000 ALTER TABLE `ylrc_database_bak` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ylrc_menu`
--

DROP TABLE IF EXISTS `ylrc_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ylrc_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `name` varchar(18) NOT NULL,
  `url` varchar(128) DEFAULT NULL,
  `icon` varchar(32) DEFAULT NULL,
  `sort` int(11) NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `is_bitton` bit(1) NOT NULL,
  `is_show` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKsbtnjocfrq29e8taxdwo21gic` (`parent_id`),
  CONSTRAINT `FKsbtnjocfrq29e8taxdwo21gic` FOREIGN KEY (`parent_id`) REFERENCES `ylrc_menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ylrc_menu`
--

LOCK TABLES `ylrc_menu` WRITE;
/*!40000 ALTER TABLE `ylrc_menu` DISABLE KEYS */;
INSERT INTO `ylrc_menu` VALUES (2,'2020-03-14 14:26:03','2020-03-14 18:24:53','系统设置','','mdi-settings',0,NULL,'\0',''),(3,'2020-03-14 16:58:55','2020-12-31 10:33:52','菜单管理','/admin/menu/list','mdi-view-list',1,2,'\0',''),(5,'2020-03-14 17:04:44','2020-12-31 10:33:27','新增','/admin/menu/add','mdi-plus',2,3,'\0',''),(7,'2020-03-14 17:07:43','2020-12-31 10:34:15','角色管理','/admin/role/list','mdi-account-settings-variant',5,2,'\0',''),(8,'2020-03-14 18:28:48','2020-12-31 10:33:59','编辑','edit(\'/admin/menu/edit\')','mdi-grease-pencil',3,3,'',''),(9,'2020-03-14 18:30:00','2020-12-31 10:34:07','删除','del(\'/admin/menu/delete\')','mdi-close',4,3,'',''),(10,'2020-03-15 12:12:00','2020-12-31 10:34:25','添加','/admin/role/add','mdi-account-plus',6,7,'\0',''),(11,'2020-03-15 12:12:36','2020-12-31 10:34:35','编辑','edit(\'/admin/role/edit\')','mdi-account-edit',7,7,'',''),(12,'2020-03-15 12:13:19','2020-12-31 10:34:45','删除','del(\'/admin/role/delete\')','mdi-account-remove',8,7,'',''),(13,'2020-03-15 12:14:52','2020-12-31 10:34:54','用户管理','/admin/user/list','mdi-account-multiple',9,2,'\0',''),(14,'2020-03-15 12:15:22','2020-12-31 10:35:01','添加','/admin/user/add','mdi-account-plus',10,13,'\0',''),(15,'2020-03-16 17:18:14','2020-12-31 10:35:10','编辑','edit(\'/admin/user/edit\')','mdi-account-edit',11,13,'',''),(16,'2020-03-16 17:19:01','2020-12-31 10:35:19','删除','del(\'/admin/user/delete\')','mdi-account-remove',12,13,'',''),(19,'2020-03-22 11:24:36','2020-03-22 11:26:00','上传图片','/upload/upload_photo','mdi-arrow-up-bold-circle',0,13,'\0','\0'),(20,'2020-03-22 14:09:35','2020-03-22 14:09:47','日志管理','/system/operator_log_list','mdi-tag-multiple',13,2,'\0',''),(21,'2020-03-22 14:11:39','2020-03-22 14:11:39','删除','del(\'/system/delete_operator_log\')','mdi-tag-remove',14,20,'',''),(22,'2020-03-22 14:12:57','2020-03-22 14:46:55','清空日志','delAll(\'/system/delete_all_operator_log\')','mdi-delete-circle',15,20,'',''),(23,'2020-03-22 14:46:40','2020-03-22 14:47:09','数据备份','/database_bak/list','mdi-database',16,2,'\0',''),(24,'2020-03-22 14:48:07','2020-03-22 15:13:41','备份','add(\'/database_bak/add\')','mdi-database-plus',17,23,'',''),(25,'2020-03-22 14:49:03','2020-03-22 14:49:03','删除','del(\'/database_bak/delete\')','mdi-database-minus',18,23,'',''),(26,'2020-03-22 19:36:20','2020-03-22 19:36:20','还原','restore(\'/database_bak/restore\')','mdi-database-minus',19,23,'','');
/*!40000 ALTER TABLE `ylrc_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ylrc_operater_log`
--

DROP TABLE IF EXISTS `ylrc_operater_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ylrc_operater_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `content` varchar(1024) NOT NULL,
  `operator` varchar(18) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=265 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ylrc_operater_log`
--

LOCK TABLES `ylrc_operater_log` WRITE;
/*!40000 ALTER TABLE `ylrc_operater_log` DISABLE KEYS */;
INSERT INTO `ylrc_operater_log` VALUES (172,'2020-03-22 14:49:22','2020-03-22 14:49:22','编辑角色【超级管理员】','猿来入此'),(173,'2020-03-22 14:58:14','2020-03-22 14:58:14','用户【猿来入此】于【2020-03-22 14:58:13】登录系统！','猿来入此'),(174,'2020-03-22 15:09:49','2020-03-22 15:09:49','用户【猿来入此】于【2020-03-22 15:09:49】登录系统！','猿来入此'),(175,'2020-03-22 15:11:09','2020-03-22 15:11:09','用户【猿来入此】于【2020-03-22 15:11:08】登录系统！','猿来入此'),(176,'2020-03-22 15:13:41','2020-03-22 15:13:41','编辑菜单信息【Menu [name=备份, parent=Menu [name=null, parent=null, url=null, icon=null, sort=0, isButton=false, isShow=true], url=add(\'/database_bak/add\'), icon=mdi-database-plus, sort=17, isButton=true, isShow=true]】','猿来入此'),(177,'2020-03-22 16:16:31','2020-03-22 16:16:31','用户【猿来入此】于【2020-03-22 16:16:31】登录系统！','猿来入此'),(178,'2020-03-22 16:31:23','2020-03-22 16:31:23','用户【猿来入此】于【2020-03-22 16:31:23】登录系统！','猿来入此'),(179,'2020-03-22 16:56:25','2020-03-22 16:56:25','用户【猿来入此】于【2020-03-22 16:56:25】登录系统！','猿来入此'),(180,'2020-03-22 17:00:42','2020-03-22 17:00:42','用户【猿来入此】于【2020-03-22 17:00:42】登录系统！','猿来入此'),(181,'2020-03-22 17:13:01','2020-03-22 17:13:01','数据库成功备份，备份文件信息：DatabaseBak [filename=db_boot_base_20200322.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]','猿来入此'),(182,'2020-03-22 17:15:04','2020-03-22 17:15:04','数据库成功备份，备份文件信息：DatabaseBak [filename=db_boot_base_20200322171504.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]','猿来入此'),(183,'2020-03-22 17:15:14','2020-03-22 17:15:14','数据库成功备份，备份文件信息：DatabaseBak [filename=db_boot_base_20200322171514.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]','猿来入此'),(184,'2020-03-22 17:21:02','2020-03-22 17:21:02','用户【猿来入此】于【2020-03-22 17:21:02】登录系统！','猿来入此'),(185,'2020-03-22 17:21:15','2020-03-22 17:21:15','添加角色【dsadsasadsa】','猿来入此'),(186,'2020-03-22 18:09:55','2020-03-22 18:09:55','数据库成功备份，备份文件信息：DatabaseBak [filename=db_boot_base_20200322180955.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]','猿来入此'),(187,'2020-03-22 18:59:16','2020-03-22 18:59:16','数据库成功备份，备份文件信息：DatabaseBak [filename=db_boot_base_20200322185916.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]','猿来入此'),(188,'2020-03-22 18:59:41','2020-03-22 18:59:41','数据库成功还原，还原文件信息：DatabaseBak [filename=db_boot_base_20200322180955.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]','猿来入此'),(189,'2020-03-22 19:12:03','2020-03-22 19:12:03','数据库成功备份，备份文件信息：DatabaseBak [filename=db_boot_base_20200322191203.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]','猿来入此'),(190,'2020-03-22 19:12:59','2020-03-22 19:12:59','数据库成功还原，还原文件信息：DatabaseBak [filename=db_boot_base_20200322191203.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]','猿来入此'),(191,'2020-03-22 19:35:07','2020-03-22 19:35:07','用户【猿来入此】于【2020-03-22 19:35:07】登录系统！','猿来入此'),(192,'2020-03-22 19:35:21','2020-03-22 19:35:21','数据库成功备份，备份文件信息：DatabaseBak [filename=db_boot_base_20200322193521.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]','猿来入此'),(193,'2020-03-22 19:36:20','2020-03-22 19:36:20','添加菜单信息【Menu [name=还原, parent=Menu [name=null, parent=null, url=null, icon=null, sort=0, isButton=false, isShow=true], url=restore(\'/database_bak/restore\'), icon=mdi-database-minus, sort=19, isButton=true, isShow=true]】','猿来入此'),(194,'2020-03-22 19:36:34','2020-03-22 19:36:34','编辑角色【超级管理员】','猿来入此'),(195,'2020-03-22 19:36:47','2020-03-22 19:36:47','数据库成功备份，备份文件信息：DatabaseBak [filename=db_boot_base_20200322193647.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]','猿来入此'),(196,'2020-03-22 19:37:21','2020-03-22 19:37:21','数据库成功还原，还原文件信息：DatabaseBak [filename=db_boot_base_20200322193647.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]','猿来入此'),(197,'2020-03-22 19:37:54','2020-03-22 19:37:54','数据库成功备份，备份文件信息：DatabaseBak [filename=db_boot_base_20200322193754.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]','猿来入此'),(198,'2020-03-22 19:38:15','2020-03-22 19:38:15','数据库成功还原，还原文件信息：DatabaseBak [filename=db_boot_base_20200322193754.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]','猿来入此'),(199,'2020-03-22 19:43:34','2020-03-22 19:43:34','数据库成功备份，备份文件信息：DatabaseBak [filename=db_boot_base_20200322194334.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]','未知(获取登录用户失败)'),(200,'2020-03-22 19:43:39','2020-03-22 19:43:39','数据库成功备份，备份文件信息：DatabaseBak [filename=db_boot_base_20200322194339.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]','未知(获取登录用户失败)'),(201,'2020-03-22 19:43:44','2020-03-22 19:43:44','数据库成功备份，备份文件信息：DatabaseBak [filename=db_boot_base_20200322194344.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]','未知(获取登录用户失败)'),(202,'2020-03-22 19:43:49','2020-03-22 19:43:49','数据库成功备份，备份文件信息：DatabaseBak [filename=db_boot_base_20200322194349.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]','未知(获取登录用户失败)'),(203,'2020-03-22 19:43:52','2020-03-22 19:43:52','用户【猿来入此】于【2020-03-22 19:43:52】登录系统！','猿来入此'),(204,'2020-03-22 19:43:54','2020-03-22 19:43:54','数据库成功备份，备份文件信息：DatabaseBak [filename=db_boot_base_20200322194354.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]','未知(获取登录用户失败)'),(205,'2020-03-22 19:43:59','2020-03-22 19:43:59','数据库成功备份，备份文件信息：DatabaseBak [filename=db_boot_base_20200322194359.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]','未知(获取登录用户失败)'),(206,'2020-03-22 19:44:04','2020-03-22 19:44:04','数据库成功备份，备份文件信息：DatabaseBak [filename=db_boot_base_20200322194404.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]','未知(获取登录用户失败)'),(207,'2020-03-22 19:44:09','2020-03-22 19:44:09','数据库成功备份，备份文件信息：DatabaseBak [filename=db_boot_base_20200322194409.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]','未知(获取登录用户失败)'),(208,'2020-03-22 19:44:14','2020-03-22 19:44:14','数据库成功备份，备份文件信息：DatabaseBak [filename=db_boot_base_20200322194414.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]','未知(获取登录用户失败)'),(209,'2020-03-22 19:44:19','2020-03-22 19:44:19','数据库成功备份，备份文件信息：DatabaseBak [filename=db_boot_base_20200322194419.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]','未知(获取登录用户失败)'),(210,'2020-03-22 19:44:24','2020-03-22 19:44:24','数据库成功备份，备份文件信息：DatabaseBak [filename=db_boot_base_20200322194424.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]','未知(获取登录用户失败)'),(211,'2020-03-22 19:44:29','2020-03-22 19:44:29','数据库成功备份，备份文件信息：DatabaseBak [filename=db_boot_base_20200322194429.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]','未知(获取登录用户失败)'),(212,'2020-03-22 19:44:34','2020-03-22 19:44:34','数据库成功备份，备份文件信息：DatabaseBak [filename=db_boot_base_20200322194434.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]','未知(获取登录用户失败)'),(213,'2020-03-22 19:44:39','2020-03-22 19:44:39','数据库成功备份，备份文件信息：DatabaseBak [filename=db_boot_base_20200322194439.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]','未知(获取登录用户失败)'),(214,'2020-03-22 21:11:19','2020-03-22 21:11:19','用户【猿来入此】于【2020-03-22 21:11:19】登录系统！','猿来入此'),(215,'2020-03-22 21:18:12','2020-03-22 21:18:12','用户【猿来入此】于【2020-03-22 21:18:11】登录系统！','猿来入此'),(216,'2020-03-22 21:36:47','2020-03-22 21:36:47','用户【猿来入此】于【2020-03-22 21:36:47】登录系统！','猿来入此'),(217,'2020-03-22 21:43:51','2020-03-22 21:43:51','用户【猿来入此】于【2020-03-22 21:43:51】登录系统！','猿来入此'),(218,'2020-03-23 17:41:23','2020-03-23 17:41:23','用户【猿来入此】于【2020-03-23 17:41:23】登录系统！','猿来入此'),(219,'2020-03-23 17:41:49','2020-03-23 17:41:49','添加菜单信息【Menu [name=sdadsa递四方速递, parent=null, url=https://www.yuanlrc.com/, icon=mdi-alarm-snooze, sort=0, isButton=false, isShow=true]】','猿来入此'),(220,'2020-03-23 17:42:02','2020-03-23 17:42:02','编辑菜单信息【Menu [name=sdadsa递四方速递, parent=Menu [name=null, parent=null, url=null, icon=null, sort=0, isButton=false, isShow=true], url=https://www.yuanlrc.com/, icon=mdi-alarm-snooze, sort=3, isButton=false, isShow=false]】','猿来入此'),(221,'2020-03-23 17:42:09','2020-03-23 17:42:09','删除菜单信息，菜单ID【27】','猿来入此'),(222,'2020-03-23 17:42:32','2020-03-23 17:42:32','编辑角色【sdfds水电费多少】','猿来入此'),(223,'2020-03-23 17:42:45','2020-03-23 17:42:45','编辑角色【sdfds水电费多少】','猿来入此'),(224,'2020-03-23 17:42:56','2020-03-23 17:42:56','删除角色ID【7】','猿来入此'),(225,'2020-03-23 17:43:16','2020-03-23 17:43:16','添加角色【撒旦撒】','猿来入此'),(226,'2020-03-23 17:43:29','2020-03-23 17:43:29','删除角色ID【8】','猿来入此'),(227,'2020-03-23 17:44:11','2020-03-23 17:44:11','添加用户，用户名：打撒大撒','猿来入此'),(228,'2020-03-23 17:44:29','2020-03-23 17:44:29','编辑用户，用户名：打撒大撒22','猿来入此'),(229,'2020-03-23 17:44:37','2020-03-23 17:44:37','添加用户，用户ID：6','猿来入此'),(230,'2020-03-23 17:44:55','2020-03-23 17:44:55','添加用户，用户ID：4','猿来入此'),(231,'2020-03-23 17:45:47','2020-03-23 17:45:47','编辑用户，用户名：小刘同志','猿来入此'),(232,'2020-03-23 17:46:49','2020-03-23 17:46:49','数据库成功备份，备份文件信息：DatabaseBak [filename=db_boot_base_20200323174649.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]','猿来入此'),(233,'2020-03-23 17:47:16','2020-03-23 17:47:16','数据库成功还原，还原文件信息：DatabaseBak [filename=db_boot_base_20200323174649.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]','猿来入此'),(234,'2020-03-23 17:48:15','2020-03-23 17:48:15','用户【测试账号】于【2020-03-23 17:48:15】登录系统！','测试账号'),(235,'2020-03-23 17:49:00','2020-03-23 17:49:00','编辑角色【测试角色】','测试账号'),(236,'2020-03-23 17:49:50','2020-03-23 17:49:50','用户【猿来入此】于【2020-03-23 17:49:50】登录系统！','猿来入此'),(237,'2020-03-23 17:50:03','2020-03-23 17:50:03','编辑用户，用户名：小刘同志','猿来入此'),(238,'2020-03-23 17:50:19','2020-03-23 17:50:19','编辑用户，用户名：小刘同志','猿来入此'),(239,'2020-03-23 17:50:56','2020-03-23 17:50:56','用户【猿来入此】于【2020-03-23 17:50:56】登录系统！','猿来入此'),(240,'2020-12-31 10:33:04','2020-12-31 10:33:04','用户【猿来入此】于【2020-12-31 10:33:04】登录系统！','猿来入此'),(241,'2020-12-31 10:33:20','2020-12-31 10:33:20','编辑菜单信息【Menu [name=菜单管理, parent=Menu [name=null, parent=null, url=null, icon=null, sort=0, isButton=false, isShow=true], url=admin/menu/list, icon=mdi-view-list, sort=1, isButton=false, isShow=true]】','猿来入此'),(242,'2020-12-31 10:33:27','2020-12-31 10:33:27','编辑菜单信息【Menu [name=新增, parent=Menu [name=null, parent=null, url=null, icon=null, sort=0, isButton=false, isShow=true], url=/admin/menu/add, icon=mdi-plus, sort=2, isButton=false, isShow=true]】','猿来入此'),(243,'2020-12-31 10:33:52','2020-12-31 10:33:52','编辑菜单信息【Menu [name=菜单管理, parent=Menu [name=null, parent=null, url=null, icon=null, sort=0, isButton=false, isShow=true], url=/admin/menu/list, icon=mdi-view-list, sort=1, isButton=false, isShow=true]】','猿来入此'),(244,'2020-12-31 10:33:59','2020-12-31 10:33:59','编辑菜单信息【Menu [name=编辑, parent=Menu [name=null, parent=null, url=null, icon=null, sort=0, isButton=false, isShow=true], url=edit(\'/admin/menu/edit\'), icon=mdi-grease-pencil, sort=3, isButton=true, isShow=true]】','猿来入此'),(245,'2020-12-31 10:34:07','2020-12-31 10:34:07','编辑菜单信息【Menu [name=删除, parent=Menu [name=null, parent=null, url=null, icon=null, sort=0, isButton=false, isShow=true], url=del(\'/admin/menu/delete\'), icon=mdi-close, sort=4, isButton=true, isShow=true]】','猿来入此'),(246,'2020-12-31 10:34:15','2020-12-31 10:34:15','编辑菜单信息【Menu [name=角色管理, parent=Menu [name=null, parent=null, url=null, icon=null, sort=0, isButton=false, isShow=true], url=/admin/role/list, icon=mdi-account-settings-variant, sort=5, isButton=false, isShow=true]】','猿来入此'),(247,'2020-12-31 10:34:26','2020-12-31 10:34:26','编辑菜单信息【Menu [name=添加, parent=Menu [name=null, parent=null, url=null, icon=null, sort=0, isButton=false, isShow=true], url=/admin/role/add, icon=mdi-account-plus, sort=6, isButton=false, isShow=true]】','猿来入此'),(248,'2020-12-31 10:34:35','2020-12-31 10:34:35','编辑菜单信息【Menu [name=编辑, parent=Menu [name=null, parent=null, url=null, icon=null, sort=0, isButton=false, isShow=true], url=edit(\'/admin/role/edit\'), icon=mdi-account-edit, sort=7, isButton=true, isShow=true]】','猿来入此'),(249,'2020-12-31 10:34:45','2020-12-31 10:34:45','编辑菜单信息【Menu [name=删除, parent=Menu [name=null, parent=null, url=null, icon=null, sort=0, isButton=false, isShow=true], url=del(\'/admin/role/delete\'), icon=mdi-account-remove, sort=8, isButton=true, isShow=true]】','猿来入此'),(250,'2020-12-31 10:34:54','2020-12-31 10:34:54','编辑菜单信息【Menu [name=用户管理, parent=Menu [name=null, parent=null, url=null, icon=null, sort=0, isButton=false, isShow=true], url=/admin/user/list, icon=mdi-account-multiple, sort=9, isButton=false, isShow=true]】','猿来入此'),(251,'2020-12-31 10:35:01','2020-12-31 10:35:01','编辑菜单信息【Menu [name=添加, parent=Menu [name=null, parent=null, url=null, icon=null, sort=0, isButton=false, isShow=true], url=/admin/user/add, icon=mdi-account-plus, sort=10, isButton=false, isShow=true]】','猿来入此'),(252,'2020-12-31 10:35:10','2020-12-31 10:35:10','编辑菜单信息【Menu [name=编辑, parent=Menu [name=null, parent=null, url=null, icon=null, sort=0, isButton=false, isShow=true], url=edit(\'/admin/user/edit\'), icon=mdi-account-edit, sort=11, isButton=true, isShow=true]】','猿来入此'),(253,'2020-12-31 10:35:19','2020-12-31 10:35:19','编辑菜单信息【Menu [name=删除, parent=Menu [name=null, parent=null, url=null, icon=null, sort=0, isButton=false, isShow=true], url=del(\'/admin/user/delete\'), icon=mdi-account-remove, sort=12, isButton=true, isShow=true]】','猿来入此'),(254,'2020-12-31 10:37:28','2020-12-31 10:37:28','用户【猿来入此】于【2020-12-31 10:37:28】登录系统！','猿来入此'),(255,'2020-12-31 10:46:22','2020-12-31 10:46:22','用户【猿来入此】于【2020-12-31 10:46:22】登录系统！','猿来入此'),(256,'2020-12-31 10:46:39','2020-12-31 10:46:39','添加菜单信息【Menu [name=编辑, parent=null, url=del(\'/college/delete\'), icon=mdi-battery-charging-80, sort=0, isButton=false, isShow=true]】','猿来入此'),(257,'2020-12-31 10:46:46','2020-12-31 10:46:46','编辑菜单信息【Menu [name=测试, parent=null, url=del(\'/college/delete\'), icon=mdi-battery-charging-80, sort=0, isButton=false, isShow=true]】','猿来入此'),(258,'2020-12-31 10:46:51','2020-12-31 10:46:51','删除菜单信息，菜单ID【28】','猿来入此'),(259,'2021-03-20 08:40:37','2021-03-20 08:40:37','用户[猿来入此]与[2021-03-20 08:40:37]登录系统','猿来入此'),(260,'2021-03-20 08:40:48','2021-03-20 08:40:48','编辑角色【超级管理员】','未知(获取登录用户失败)'),(261,'2021-03-20 08:44:35','2021-03-20 08:44:35','删除角色ID【4】','未知(获取登录用户失败)'),(262,'2021-03-20 23:41:05','2021-03-20 23:41:05','用户[猿来入此]与[2021-03-20 23:41:04]登录系统','猿来入此'),(263,'2021-03-20 23:48:37','2021-03-20 23:48:37','用户[猿来入此]与[2021-03-20 23:48:37]登录系统','猿来入此'),(264,'2021-03-21 01:00:00','2021-03-21 01:00:00','数据库成功备份，备份文件信息：DatabaseBak [filename=db_boot_base_20210321010000.sql, filepath=E:/ylrc_workspace/spring-boot-base/src/main/resources/backup/]','未知(获取登录用户失败)');
/*!40000 ALTER TABLE `ylrc_operater_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ylrc_role`
--

DROP TABLE IF EXISTS `ylrc_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ylrc_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `name` varchar(18) NOT NULL,
  `remark` varchar(128) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ylrc_role`
--

LOCK TABLES `ylrc_role` WRITE;
/*!40000 ALTER TABLE `ylrc_role` DISABLE KEYS */;
INSERT INTO `ylrc_role` VALUES (1,'2020-03-15 13:16:38','2020-03-22 19:36:34','超级管理员','超级管理员拥有最高权限。',1),(2,'2020-03-15 13:18:57','2020-03-21 22:18:43','普通管理员','普通管理员只有部分权限',1);
/*!40000 ALTER TABLE `ylrc_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ylrc_role_authorities`
--

DROP TABLE IF EXISTS `ylrc_role_authorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ylrc_role_authorities` (
  `role_id` bigint(20) NOT NULL,
  `authorities_id` bigint(20) NOT NULL,
  KEY `FKhj7ap1o1cjrl7enr9arf5f2qp` (`authorities_id`),
  KEY `FKg3xdaexmr0x1qx8omhvjtk46d` (`role_id`),
  CONSTRAINT `FKg3xdaexmr0x1qx8omhvjtk46d` FOREIGN KEY (`role_id`) REFERENCES `ylrc_role` (`id`),
  CONSTRAINT `FKhj7ap1o1cjrl7enr9arf5f2qp` FOREIGN KEY (`authorities_id`) REFERENCES `ylrc_menu` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ylrc_role_authorities`
--

LOCK TABLES `ylrc_role_authorities` WRITE;
/*!40000 ALTER TABLE `ylrc_role_authorities` DISABLE KEYS */;
INSERT INTO `ylrc_role_authorities` VALUES (1,2),(1,3),(1,5),(1,8),(1,9),(1,7),(1,10),(1,11),(1,12),(1,13),(1,14),(1,15),(1,16),(1,19),(1,20),(1,21),(1,22),(1,23),(1,24),(1,25),(1,26);
/*!40000 ALTER TABLE `ylrc_role_authorities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ylrc_user`
--

DROP TABLE IF EXISTS `ylrc_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ylrc_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `email` varchar(32) DEFAULT NULL,
  `head_pic` varchar(128) DEFAULT NULL,
  `mobile` varchar(12) DEFAULT NULL,
  `password` varchar(32) NOT NULL,
  `sex` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `username` varchar(18) NOT NULL,
  `role_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_btsosjytrl4hu7fnm1intcpo8` (`username`),
  KEY `FKg09b8o67eu61st68rv6nk8npj` (`role_id`),
  CONSTRAINT `FKg09b8o67eu61st68rv6nk8npj` FOREIGN KEY (`role_id`) REFERENCES `ylrc_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ylrc_user`
--

LOCK TABLES `ylrc_user` WRITE;
/*!40000 ALTER TABLE `ylrc_user` DISABLE KEYS */;
INSERT INTO `ylrc_user` VALUES (1,'2020-03-18 19:18:53','2020-03-22 12:43:54','ylrc@qq.com','20200322/1584850135123.jpg','13356565656','123456',1,1,'猿来入此',1),(2,'2020-03-18 19:20:36','2020-03-21 22:18:55','llq@qq.com','20200318/1584530412075.jpg','13918655656','123456',1,1,'测试账号',2);
/*!40000 ALTER TABLE `ylrc_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-21 12:00:00
