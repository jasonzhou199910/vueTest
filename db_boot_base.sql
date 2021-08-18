/*
Navicat MySQL Data Transfer

Source Server         : 本地链接
Source Server Version : 50162
Source Host           : localhost:3306
Source Database       : db_boot_base

Target Server Type    : MYSQL
Target Server Version : 50162
File Encoding         : 65001

Date: 2021-05-27 00:03:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `ylrc_database_bak`
-- ----------------------------
DROP TABLE IF EXISTS `ylrc_database_bak`;
CREATE TABLE `ylrc_database_bak` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `filename` varchar(32) NOT NULL,
  `filepath` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ylrc_database_bak
-- ----------------------------
INSERT INTO `ylrc_database_bak` VALUES ('10', '2020-03-22 19:36:47', '2020-03-22 19:36:47', 'db_boot_base_20200322193647.sql', 'D:/workspace_devloper/baseproject/base/src/main/resources/backup/');
INSERT INTO `ylrc_database_bak` VALUES ('11', '2020-03-22 19:37:54', '2020-03-22 19:37:54', 'db_boot_base_20200322193754.sql', 'D:/workspace_devloper/baseproject/base/src/main/resources/backup/');
INSERT INTO `ylrc_database_bak` VALUES ('12', '2020-03-22 19:40:04', '2020-03-22 19:40:04', 'db_boot_base_20200322194004.sql', 'D:/workspace_devloper/baseproject/base/src/main/resources/backup/');
INSERT INTO `ylrc_database_bak` VALUES ('14', '2020-03-22 19:40:14', '2020-03-22 19:40:14', 'db_boot_base_20200322194014.sql', 'D:/workspace_devloper/baseproject/base/src/main/resources/backup/');
INSERT INTO `ylrc_database_bak` VALUES ('15', '2020-03-22 19:40:19', '2020-03-22 19:40:19', 'db_boot_base_20200322194019.sql', 'D:/workspace_devloper/baseproject/base/src/main/resources/backup/');
INSERT INTO `ylrc_database_bak` VALUES ('17', '2020-03-22 19:43:34', '2020-03-22 19:43:34', 'db_boot_base_20200322194334.sql', 'D:/workspace_devloper/baseproject/base/src/main/resources/backup/');
INSERT INTO `ylrc_database_bak` VALUES ('18', '2020-03-22 19:43:39', '2020-03-22 19:43:39', 'db_boot_base_20200322194339.sql', 'D:/workspace_devloper/baseproject/base/src/main/resources/backup/');
INSERT INTO `ylrc_database_bak` VALUES ('20', '2020-03-22 19:43:49', '2020-03-22 19:43:49', 'db_boot_base_20200322194349.sql', 'D:/workspace_devloper/baseproject/base/src/main/resources/backup/');
INSERT INTO `ylrc_database_bak` VALUES ('21', '2020-03-22 19:43:54', '2020-03-22 19:43:54', 'db_boot_base_20200322194354.sql', 'D:/workspace_devloper/baseproject/base/src/main/resources/backup/');
INSERT INTO `ylrc_database_bak` VALUES ('22', '2020-03-22 19:43:59', '2020-03-22 19:43:59', 'db_boot_base_20200322194359.sql', 'D:/workspace_devloper/baseproject/base/src/main/resources/backup/');
INSERT INTO `ylrc_database_bak` VALUES ('23', '2020-03-22 19:44:04', '2020-03-22 19:44:04', 'db_boot_base_20200322194404.sql', 'D:/workspace_devloper/baseproject/base/src/main/resources/backup/');
INSERT INTO `ylrc_database_bak` VALUES ('24', '2020-03-22 19:44:09', '2020-03-22 19:44:09', 'db_boot_base_20200322194409.sql', 'D:/workspace_devloper/baseproject/base/src/main/resources/backup/');
INSERT INTO `ylrc_database_bak` VALUES ('25', '2020-03-22 19:44:14', '2020-03-22 19:44:14', 'db_boot_base_20200322194414.sql', 'D:/workspace_devloper/baseproject/base/src/main/resources/backup/');
INSERT INTO `ylrc_database_bak` VALUES ('26', '2020-03-22 19:44:19', '2020-03-22 19:44:19', 'db_boot_base_20200322194419.sql', 'D:/workspace_devloper/baseproject/base/src/main/resources/backup/');
INSERT INTO `ylrc_database_bak` VALUES ('27', '2020-03-22 19:44:24', '2020-03-22 19:44:24', 'db_boot_base_20200322194424.sql', 'D:/workspace_devloper/baseproject/base/src/main/resources/backup/');
INSERT INTO `ylrc_database_bak` VALUES ('28', '2020-03-22 19:44:29', '2020-03-22 19:44:29', 'db_boot_base_20200322194429.sql', 'D:/workspace_devloper/baseproject/base/src/main/resources/backup/');
INSERT INTO `ylrc_database_bak` VALUES ('29', '2020-03-22 19:44:34', '2020-03-22 19:44:34', 'db_boot_base_20200322194434.sql', 'D:/workspace_devloper/baseproject/base/src/main/resources/backup/');
INSERT INTO `ylrc_database_bak` VALUES ('30', '2020-03-22 19:44:39', '2020-03-22 19:44:39', 'db_boot_base_20200322194439.sql', 'D:/workspace_devloper/baseproject/base/src/main/resources/backup/');
INSERT INTO `ylrc_database_bak` VALUES ('31', '2020-03-23 17:46:49', '2020-03-23 17:46:49', 'db_boot_base_20200323174649.sql', 'D:/workspace_devloper/baseproject/base/src/main/resources/backup/');
INSERT INTO `ylrc_database_bak` VALUES ('32', '2021-03-21 01:00:00', '2021-03-21 01:00:00', 'db_boot_base_20210321010000.sql', 'E:/ylrc_workspace/spring-boot-base/src/main/resources/backup/');

-- ----------------------------
-- Table structure for `ylrc_menu`
-- ----------------------------
DROP TABLE IF EXISTS `ylrc_menu`;
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
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ylrc_menu
-- ----------------------------
INSERT INTO `ylrc_menu` VALUES ('2', '2020-03-14 14:26:03', '2021-04-20 12:17:10', '系统设置', '', 'el-icon-lollipop', '1', null, '', '');
INSERT INTO `ylrc_menu` VALUES ('3', '2020-03-14 16:58:55', '2021-04-20 12:39:07', '菜单管理', '/admin/menu/list', 'el-icon-lollipop', '1', '2', '', '');
INSERT INTO `ylrc_menu` VALUES ('5', '2020-03-14 17:04:44', '2020-12-31 10:33:27', '添加', 'admin/menu/add', 'mdi-plus', '2', '3', '', '');
INSERT INTO `ylrc_menu` VALUES ('7', '2020-03-14 17:07:43', '2020-12-31 10:34:15', '角色管理', '/admin/role/list', 'mdi-account-settings-variant', '5', '2', '', '');
INSERT INTO `ylrc_menu` VALUES ('8', '2020-03-14 18:28:48', '2020-12-31 10:33:59', '编辑', 'admin/menu/edit', 'mdi-grease-pencil', '3', '3', '', '');
INSERT INTO `ylrc_menu` VALUES ('9', '2020-03-14 18:30:00', '2020-12-31 10:34:07', '删除', 'admin/menu/menuDelete', 'mdi-close', '4', '3', '', '');
INSERT INTO `ylrc_menu` VALUES ('10', '2020-03-15 12:12:00', '2020-12-31 10:34:25', '添加', '/admin/role/add', 'mdi-account-plus', '6', '7', '', '');
INSERT INTO `ylrc_menu` VALUES ('11', '2020-03-15 12:12:36', '2020-12-31 10:34:35', '编辑', '/admin/role/edit', 'mdi-account-edit', '7', '7', '', '');
INSERT INTO `ylrc_menu` VALUES ('12', '2020-03-15 12:13:19', '2020-12-31 10:34:45', '删除', 'del(\'/admin/role/delete\')', 'mdi-account-remove', '8', '7', '', '');
INSERT INTO `ylrc_menu` VALUES ('13', '2020-03-15 12:14:52', '2020-12-31 10:34:54', '用户管理', '/admin/user/list', 'mdi-account-multiple', '9', '2', '', '');
INSERT INTO `ylrc_menu` VALUES ('14', '2020-03-15 12:15:22', '2020-12-31 10:35:01', '添加', 'admin/user/add', 'mdi-account-plus', '10', '13', '', '');
INSERT INTO `ylrc_menu` VALUES ('15', '2020-03-16 17:18:14', '2020-12-31 10:35:10', '编辑', 'admin/user/edit', 'mdi-account-edit', '11', '13', '', '');
INSERT INTO `ylrc_menu` VALUES ('16', '2020-03-16 17:19:01', '2020-12-31 10:35:19', '删除', '/admin/user/delete', 'mdi-account-remove', '12', '13', '', '');
INSERT INTO `ylrc_menu` VALUES ('19', '2020-03-22 11:24:36', '2020-03-22 11:26:00', '上传图片', '/upload/upload_photo', 'mdi-arrow-up-bold-circle', '0', '13', '', '');
INSERT INTO `ylrc_menu` VALUES ('20', '2020-03-22 14:09:35', '2020-03-22 14:09:47', '日志管理', '/admin/log/list', 'mdi-tag-multiple', '13', '2', '', '');
INSERT INTO `ylrc_menu` VALUES ('21', '2020-03-22 14:11:39', '2020-03-22 14:11:39', '删除', 'del(\'/system/delete_operator_log\')', 'mdi-tag-remove', '14', '20', '', '');
INSERT INTO `ylrc_menu` VALUES ('22', '2020-03-22 14:12:57', '2020-03-22 14:46:55', '清空日志', 'delAll(\'/system/delete_all_operator_log\')', 'mdi-delete-circle', '15', '20', '', '');
INSERT INTO `ylrc_menu` VALUES ('23', '2020-03-22 14:46:40', '2020-03-22 14:47:09', '数据备份', '/database_bak/list', 'mdi-database', '16', '2', '', '');
INSERT INTO `ylrc_menu` VALUES ('24', '2020-03-22 14:48:07', '2020-03-22 15:13:41', '备份', 'add(\'/database_bak/add\')', 'mdi-database-plus', '17', '23', '', '');
INSERT INTO `ylrc_menu` VALUES ('25', '2020-03-22 14:49:03', '2020-03-22 14:49:03', '删除', 'del(\'/database_bak/delete\')', 'mdi-database-minus', '18', '23', '', '');
INSERT INTO `ylrc_menu` VALUES ('26', '2020-03-22 19:36:20', '2021-04-21 11:39:02', '还原测试', 'restore(\'/database_bak/restore\')', 'mdi-database-minus', '19', '23', '', '');
INSERT INTO `ylrc_menu` VALUES ('27', '2021-04-21 11:34:11', '2021-04-21 11:44:56', '校园管理', '6', 'el-icon-menu', '20', null, '', '');
INSERT INTO `ylrc_menu` VALUES ('28', '2021-04-21 11:36:03', '2021-04-21 12:09:22', '学生列表', '/admin/student/list', 'el-icon-user', '21', '27', '', '');
INSERT INTO `ylrc_menu` VALUES ('29', '2021-04-21 11:39:57', '2021-04-21 12:04:31', '添加', '/admin/student/add', 'el-icon-plus', '22', '28', '', '');
INSERT INTO `ylrc_menu` VALUES ('30', '2021-04-21 11:40:23', '2021-04-21 12:08:53', '编辑', 'admin/student/edit', 'el-icon-minus', '23', '28', '', '');
INSERT INTO `ylrc_menu` VALUES ('31', '2021-04-21 11:41:22', '2021-04-21 12:09:08', '删除', '/admin/student/delete', 'el-icon-close', '24', '28', '', '');
INSERT INTO `ylrc_menu` VALUES ('32', '2021-04-24 12:41:11', '2021-04-24 12:45:10', '校园店铺列表', '/admin/store/list', 'el-icon-refrigerator', '25', '27', '', '');
INSERT INTO `ylrc_menu` VALUES ('33', '2021-04-24 12:42:00', '2021-04-24 12:42:53', '添加', 'admin/store/add', 'el-icon-plus', '25', '32', '', '');
INSERT INTO `ylrc_menu` VALUES ('34', '2021-04-24 12:42:24', '2021-04-24 12:42:58', '编辑', 'admin/store/edit', 'el-icon-minus', '26', '32', '', '');
INSERT INTO `ylrc_menu` VALUES ('35', '2021-04-24 12:42:44', '2021-04-24 12:43:04', '删除', 'admin/store/delete', 'el-icon-close', '27', '32', '', '');
INSERT INTO `ylrc_menu` VALUES ('37', '2021-04-27 12:13:53', '2021-04-27 12:22:24', '跑腿代购列表', '/admin/runErrands/list', 'el-icon-bank-card', '28', '27', '', '');
INSERT INTO `ylrc_menu` VALUES ('38', '2021-04-27 12:14:38', '2021-04-27 12:18:17', '添加', 'admin/runErrands/add', 'el-icon-plus', '28', '37', '', '');
INSERT INTO `ylrc_menu` VALUES ('39', '2021-04-27 12:14:58', '2021-04-27 12:18:23', '编辑', 'admin/runErrands/edit', 'el-icon-minus', '29', '37', '', '');
INSERT INTO `ylrc_menu` VALUES ('40', '2021-04-27 12:15:24', '2021-04-27 12:18:31', '删除', 'admin/runErrands/delete', 'el-icon-close', '30', '37', '', '');
INSERT INTO `ylrc_menu` VALUES ('41', '2021-04-28 12:20:09', '2021-04-28 12:26:31', '个人信息管理', '7', 'el-icon-s-custom', '31', null, '', '');
INSERT INTO `ylrc_menu` VALUES ('42', '2021-04-28 12:22:12', '2021-04-28 12:23:21', '个人信息', '/admin/personal/page', 'el-icon-user', '32', '41', '', '');
INSERT INTO `ylrc_menu` VALUES ('43', '2021-04-28 12:22:44', '2021-04-28 12:23:27', '修改密码', '/admin/password/page', 'el-icon-view', '33', '41', '', '');
INSERT INTO `ylrc_menu` VALUES ('44', '2021-05-26 07:38:47', '2021-05-26 07:39:18', '接单列表', '/admin/runOrder/list', 'el-icon-bank-card', '34', '27', '', '');
INSERT INTO `ylrc_menu` VALUES ('45', '2021-05-26 07:40:03', '2021-05-26 07:40:03', '完成', 'admin/runOrder/add', 'el-icon-aim', '35', '44', '', '');

-- ----------------------------
-- Table structure for `ylrc_operater_log`
-- ----------------------------
DROP TABLE IF EXISTS `ylrc_operater_log`;
CREATE TABLE `ylrc_operater_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `content` varchar(1024) NOT NULL,
  `operator` varchar(18) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=696 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ylrc_operater_log
-- ----------------------------
INSERT INTO `ylrc_operater_log` VALUES ('202', '2020-03-22 19:43:49', '2020-03-22 19:43:49', '数据库成功备份，备份文件信息：DatabaseBak [filename=db_boot_base_20200322194349.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('203', '2020-03-22 19:43:52', '2020-03-22 19:43:52', '用户【猿来入此】于【2020-03-22 19:43:52】登录系统！', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('204', '2020-03-22 19:43:54', '2020-03-22 19:43:54', '数据库成功备份，备份文件信息：DatabaseBak [filename=db_boot_base_20200322194354.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('205', '2020-03-22 19:43:59', '2020-03-22 19:43:59', '数据库成功备份，备份文件信息：DatabaseBak [filename=db_boot_base_20200322194359.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('206', '2020-03-22 19:44:04', '2020-03-22 19:44:04', '数据库成功备份，备份文件信息：DatabaseBak [filename=db_boot_base_20200322194404.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('207', '2020-03-22 19:44:09', '2020-03-22 19:44:09', '数据库成功备份，备份文件信息：DatabaseBak [filename=db_boot_base_20200322194409.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('208', '2020-03-22 19:44:14', '2020-03-22 19:44:14', '数据库成功备份，备份文件信息：DatabaseBak [filename=db_boot_base_20200322194414.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('209', '2020-03-22 19:44:19', '2020-03-22 19:44:19', '数据库成功备份，备份文件信息：DatabaseBak [filename=db_boot_base_20200322194419.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('210', '2020-03-22 19:44:24', '2020-03-22 19:44:24', '数据库成功备份，备份文件信息：DatabaseBak [filename=db_boot_base_20200322194424.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('211', '2020-03-22 19:44:29', '2020-03-22 19:44:29', '数据库成功备份，备份文件信息：DatabaseBak [filename=db_boot_base_20200322194429.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('212', '2020-03-22 19:44:34', '2020-03-22 19:44:34', '数据库成功备份，备份文件信息：DatabaseBak [filename=db_boot_base_20200322194434.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('213', '2020-03-22 19:44:39', '2020-03-22 19:44:39', '数据库成功备份，备份文件信息：DatabaseBak [filename=db_boot_base_20200322194439.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('214', '2020-03-22 21:11:19', '2020-03-22 21:11:19', '用户【猿来入此】于【2020-03-22 21:11:19】登录系统！', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('215', '2020-03-22 21:18:12', '2020-03-22 21:18:12', '用户【猿来入此】于【2020-03-22 21:18:11】登录系统！', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('216', '2020-03-22 21:36:47', '2020-03-22 21:36:47', '用户【猿来入此】于【2020-03-22 21:36:47】登录系统！', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('217', '2020-03-22 21:43:51', '2020-03-22 21:43:51', '用户【猿来入此】于【2020-03-22 21:43:51】登录系统！', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('218', '2020-03-23 17:41:23', '2020-03-23 17:41:23', '用户【猿来入此】于【2020-03-23 17:41:23】登录系统！', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('219', '2020-03-23 17:41:49', '2020-03-23 17:41:49', '添加菜单信息【Menu [name=sdadsa递四方速递, parent=null, url=https://www.yuanlrc.com/, icon=mdi-alarm-snooze, sort=0, isButton=false, isShow=true]】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('220', '2020-03-23 17:42:02', '2020-03-23 17:42:02', '编辑菜单信息【Menu [name=sdadsa递四方速递, parent=Menu [name=null, parent=null, url=null, icon=null, sort=0, isButton=false, isShow=true], url=https://www.yuanlrc.com/, icon=mdi-alarm-snooze, sort=3, isButton=false, isShow=false]】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('221', '2020-03-23 17:42:09', '2020-03-23 17:42:09', '删除菜单信息，菜单ID【27】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('222', '2020-03-23 17:42:32', '2020-03-23 17:42:32', '编辑角色【sdfds水电费多少】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('223', '2020-03-23 17:42:45', '2020-03-23 17:42:45', '编辑角色【sdfds水电费多少】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('224', '2020-03-23 17:42:56', '2020-03-23 17:42:56', '删除角色ID【7】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('225', '2020-03-23 17:43:16', '2020-03-23 17:43:16', '添加角色【撒旦撒】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('226', '2020-03-23 17:43:29', '2020-03-23 17:43:29', '删除角色ID【8】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('227', '2020-03-23 17:44:11', '2020-03-23 17:44:11', '添加用户，用户名：打撒大撒', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('228', '2020-03-23 17:44:29', '2020-03-23 17:44:29', '编辑用户，用户名：打撒大撒22', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('229', '2020-03-23 17:44:37', '2020-03-23 17:44:37', '添加用户，用户ID：6', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('230', '2020-03-23 17:44:55', '2020-03-23 17:44:55', '添加用户，用户ID：4', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('231', '2020-03-23 17:45:47', '2020-03-23 17:45:47', '编辑用户，用户名：小刘同志', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('232', '2020-03-23 17:46:49', '2020-03-23 17:46:49', '数据库成功备份，备份文件信息：DatabaseBak [filename=db_boot_base_20200323174649.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('233', '2020-03-23 17:47:16', '2020-03-23 17:47:16', '数据库成功还原，还原文件信息：DatabaseBak [filename=db_boot_base_20200323174649.sql, filepath=D:/workspace_devloper/baseproject/base/src/main/resources/backup/]', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('234', '2020-03-23 17:48:15', '2020-03-23 17:48:15', '用户【测试账号】于【2020-03-23 17:48:15】登录系统！', '测试账号');
INSERT INTO `ylrc_operater_log` VALUES ('235', '2020-03-23 17:49:00', '2020-03-23 17:49:00', '编辑角色【测试角色】', '测试账号');
INSERT INTO `ylrc_operater_log` VALUES ('236', '2020-03-23 17:49:50', '2020-03-23 17:49:50', '用户【猿来入此】于【2020-03-23 17:49:50】登录系统！', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('237', '2020-03-23 17:50:03', '2020-03-23 17:50:03', '编辑用户，用户名：小刘同志', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('238', '2020-03-23 17:50:19', '2020-03-23 17:50:19', '编辑用户，用户名：小刘同志', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('239', '2020-03-23 17:50:56', '2020-03-23 17:50:56', '用户【猿来入此】于【2020-03-23 17:50:56】登录系统！', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('240', '2020-12-31 10:33:04', '2020-12-31 10:33:04', '用户【猿来入此】于【2020-12-31 10:33:04】登录系统！', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('241', '2020-12-31 10:33:20', '2020-12-31 10:33:20', '编辑菜单信息【Menu [name=菜单管理, parent=Menu [name=null, parent=null, url=null, icon=null, sort=0, isButton=false, isShow=true], url=admin/menu/list, icon=mdi-view-list, sort=1, isButton=false, isShow=true]】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('242', '2020-12-31 10:33:27', '2020-12-31 10:33:27', '编辑菜单信息【Menu [name=新增, parent=Menu [name=null, parent=null, url=null, icon=null, sort=0, isButton=false, isShow=true], url=/admin/menu/add, icon=mdi-plus, sort=2, isButton=false, isShow=true]】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('243', '2020-12-31 10:33:52', '2020-12-31 10:33:52', '编辑菜单信息【Menu [name=菜单管理, parent=Menu [name=null, parent=null, url=null, icon=null, sort=0, isButton=false, isShow=true], url=/admin/menu/list, icon=mdi-view-list, sort=1, isButton=false, isShow=true]】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('244', '2020-12-31 10:33:59', '2020-12-31 10:33:59', '编辑菜单信息【Menu [name=编辑, parent=Menu [name=null, parent=null, url=null, icon=null, sort=0, isButton=false, isShow=true], url=edit(\'/admin/menu/edit\'), icon=mdi-grease-pencil, sort=3, isButton=true, isShow=true]】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('245', '2020-12-31 10:34:07', '2020-12-31 10:34:07', '编辑菜单信息【Menu [name=删除, parent=Menu [name=null, parent=null, url=null, icon=null, sort=0, isButton=false, isShow=true], url=del(\'/admin/menu/delete\'), icon=mdi-close, sort=4, isButton=true, isShow=true]】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('246', '2020-12-31 10:34:15', '2020-12-31 10:34:15', '编辑菜单信息【Menu [name=角色管理, parent=Menu [name=null, parent=null, url=null, icon=null, sort=0, isButton=false, isShow=true], url=/admin/role/list, icon=mdi-account-settings-variant, sort=5, isButton=false, isShow=true]】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('247', '2020-12-31 10:34:26', '2020-12-31 10:34:26', '编辑菜单信息【Menu [name=添加, parent=Menu [name=null, parent=null, url=null, icon=null, sort=0, isButton=false, isShow=true], url=/admin/role/add, icon=mdi-account-plus, sort=6, isButton=false, isShow=true]】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('248', '2020-12-31 10:34:35', '2020-12-31 10:34:35', '编辑菜单信息【Menu [name=编辑, parent=Menu [name=null, parent=null, url=null, icon=null, sort=0, isButton=false, isShow=true], url=edit(\'/admin/role/edit\'), icon=mdi-account-edit, sort=7, isButton=true, isShow=true]】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('249', '2020-12-31 10:34:45', '2020-12-31 10:34:45', '编辑菜单信息【Menu [name=删除, parent=Menu [name=null, parent=null, url=null, icon=null, sort=0, isButton=false, isShow=true], url=del(\'/admin/role/delete\'), icon=mdi-account-remove, sort=8, isButton=true, isShow=true]】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('250', '2020-12-31 10:34:54', '2020-12-31 10:34:54', '编辑菜单信息【Menu [name=用户管理, parent=Menu [name=null, parent=null, url=null, icon=null, sort=0, isButton=false, isShow=true], url=/admin/user/list, icon=mdi-account-multiple, sort=9, isButton=false, isShow=true]】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('251', '2020-12-31 10:35:01', '2020-12-31 10:35:01', '编辑菜单信息【Menu [name=添加, parent=Menu [name=null, parent=null, url=null, icon=null, sort=0, isButton=false, isShow=true], url=/admin/user/add, icon=mdi-account-plus, sort=10, isButton=false, isShow=true]】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('252', '2020-12-31 10:35:10', '2020-12-31 10:35:10', '编辑菜单信息【Menu [name=编辑, parent=Menu [name=null, parent=null, url=null, icon=null, sort=0, isButton=false, isShow=true], url=edit(\'/admin/user/edit\'), icon=mdi-account-edit, sort=11, isButton=true, isShow=true]】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('253', '2020-12-31 10:35:19', '2020-12-31 10:35:19', '编辑菜单信息【Menu [name=删除, parent=Menu [name=null, parent=null, url=null, icon=null, sort=0, isButton=false, isShow=true], url=del(\'/admin/user/delete\'), icon=mdi-account-remove, sort=12, isButton=true, isShow=true]】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('254', '2020-12-31 10:37:28', '2020-12-31 10:37:28', '用户【猿来入此】于【2020-12-31 10:37:28】登录系统！', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('255', '2020-12-31 10:46:22', '2020-12-31 10:46:22', '用户【猿来入此】于【2020-12-31 10:46:22】登录系统！', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('256', '2020-12-31 10:46:39', '2020-12-31 10:46:39', '添加菜单信息【Menu [name=编辑, parent=null, url=del(\'/college/delete\'), icon=mdi-battery-charging-80, sort=0, isButton=false, isShow=true]】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('257', '2020-12-31 10:46:46', '2020-12-31 10:46:46', '编辑菜单信息【Menu [name=测试, parent=null, url=del(\'/college/delete\'), icon=mdi-battery-charging-80, sort=0, isButton=false, isShow=true]】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('258', '2020-12-31 10:46:51', '2020-12-31 10:46:51', '删除菜单信息，菜单ID【28】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('259', '2021-03-20 08:40:37', '2021-03-20 08:40:37', '用户[猿来入此]与[2021-03-20 08:40:37]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('260', '2021-03-20 08:40:48', '2021-03-20 08:40:48', '编辑角色【超级管理员】', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('261', '2021-03-20 08:44:35', '2021-03-20 08:44:35', '删除角色ID【4】', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('262', '2021-03-20 23:41:05', '2021-03-20 23:41:05', '用户[猿来入此]与[2021-03-20 23:41:04]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('263', '2021-03-20 23:48:37', '2021-03-20 23:48:37', '用户[猿来入此]与[2021-03-20 23:48:37]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('264', '2021-03-21 01:00:00', '2021-03-21 01:00:00', '数据库成功备份，备份文件信息：DatabaseBak [filename=db_boot_base_20210321010000.sql, filepath=E:/ylrc_workspace/spring-boot-base/src/main/resources/backup/]', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('265', '2021-03-21 01:35:05', '2021-03-21 01:35:05', '用户[猿来入此]与[2021-03-21 01:35:05]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('266', '2021-03-21 02:14:54', '2021-03-21 02:14:54', '用户[猿来入此]与[2021-03-21 02:14:54]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('267', '2021-03-21 02:31:47', '2021-03-21 02:31:47', '用户[猿来入此]与[2021-03-21 02:31:47]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('268', '2021-03-21 02:32:51', '2021-03-21 02:32:51', '用户[猿来入此]与[2021-03-21 02:32:51]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('269', '2021-03-21 02:37:38', '2021-03-21 02:37:38', '添加用户，用户名：猿来入此t', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('270', '2021-03-21 02:40:26', '2021-03-21 02:40:26', '添加用户，用户名：猿来此wa', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('271', '2021-03-21 08:01:24', '2021-03-21 08:01:24', '用户[猿来入此]与[2021-03-21 08:01:24]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('272', '2021-03-21 08:02:24', '2021-03-21 08:02:24', '添加用户，用户名：猿走此出', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('273', '2021-03-21 09:21:43', '2021-03-21 09:21:43', '编辑用户，用户名：猿来入此', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('274', '2021-03-21 09:27:10', '2021-03-21 09:27:10', '编辑用户，用户名：猿来入此t', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('275', '2021-03-21 10:11:58', '2021-03-21 10:11:58', '添加用户，用户ID：8', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('276', '2021-03-21 12:15:19', '2021-03-21 12:15:19', '用户[猿来入此]与[2021-03-21 12:15:19]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('277', '2021-03-21 12:36:12', '2021-03-21 12:36:12', '用户[猿来入此]与[2021-03-21 12:36:12]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('278', '2021-03-21 12:36:15', '2021-03-21 12:36:15', '用户[猿来入此]与[2021-03-21 12:36:15]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('279', '2021-03-21 12:36:25', '2021-03-21 12:36:25', '用户[猿来入此]与[2021-03-21 12:36:25]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('280', '2021-03-21 12:36:37', '2021-03-21 12:36:37', '用户[猿来入此]与[2021-03-21 12:36:37]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('281', '2021-03-21 12:37:47', '2021-03-21 12:37:47', '用户[猿来入此]与[2021-03-21 12:37:47]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('282', '2021-03-22 08:36:15', '2021-03-22 08:36:15', '用户[猿来入此]与[2021-03-22 08:36:15]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('283', '2021-03-22 10:12:29', '2021-03-22 10:12:29', '用户[猿来入此]与[2021-03-22 10:12:29]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('284', '2021-03-22 10:23:52', '2021-03-22 10:23:52', '编辑用户，用户名：测试账号', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('285', '2021-03-22 12:01:56', '2021-03-22 12:01:56', '用户[猿来入此]与[2021-03-22 12:01:56]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('286', '2021-03-22 12:17:24', '2021-03-22 12:17:24', '用户[猿来入此]与[2021-03-22 12:17:24]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('287', '2021-03-23 08:58:13', '2021-03-23 08:58:13', '用户[猿来入此]与[2021-03-23 08:58:13]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('288', '2021-03-23 10:53:18', '2021-03-23 10:53:18', '用户[猿来入此]与[2021-03-23 10:53:18]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('289', '2021-03-23 10:53:21', '2021-03-23 10:53:21', '用户[猿来入此]与[2021-03-23 10:53:21]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('290', '2021-03-23 11:37:11', '2021-03-23 11:37:11', '用户[猿来入此]与[2021-03-23 11:37:11]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('291', '2021-03-23 12:15:12', '2021-03-23 12:15:12', '用户[猿来入此]与[2021-03-23 12:15:12]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('292', '2021-03-23 12:28:02', '2021-03-23 12:28:02', '用户[猿来入此]与[2021-03-23 12:28:02]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('293', '2021-03-23 12:30:28', '2021-03-23 12:30:28', '添加角色【测试一波】', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('294', '2021-03-23 12:36:19', '2021-03-23 12:36:19', '编辑角色【超级管理员】', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('295', '2021-03-23 12:36:57', '2021-03-23 12:36:57', '编辑角色【普通管理员】', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('296', '2021-03-23 12:37:02', '2021-03-23 12:37:02', '编辑角色【普通管理员】', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('297', '2021-03-23 12:37:06', '2021-03-23 12:37:06', '编辑角色【超级管理员】', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('298', '2021-03-23 12:37:47', '2021-03-23 12:37:47', '删除角色ID【3】', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('299', '2021-03-24 10:35:27', '2021-03-24 10:35:27', '用户[猿来入此]与[2021-03-24 10:35:27]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('300', '2021-03-24 10:43:57', '2021-03-24 10:43:57', '用户[猿来入此]与[2021-03-24 10:43:57]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('301', '2021-03-24 10:53:38', '2021-03-24 10:53:38', '用户[猿来入此]与[2021-03-24 10:53:38]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('302', '2021-03-24 11:06:06', '2021-03-24 11:06:06', '添加菜单信息【Menu [name=测试一波, parent=null, url=/admin/user, icon=el-icon-ice-cream-square, sort=2, isButton=false, isShow=true]】', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('303', '2021-03-24 11:06:12', '2021-03-24 11:06:12', '删除菜单信息，菜单ID【27】', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('304', '2021-03-24 11:09:45', '2021-03-24 11:09:45', '添加菜单信息【Menu [name=sdsa, parent=null, url=dsadsad, icon=el-icon-lollipop, sort=1, isButton=false, isShow=true]】', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('305', '2021-03-24 11:09:50', '2021-03-24 11:09:50', '删除菜单信息，菜单ID【28】', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('306', '2021-03-24 11:11:52', '2021-03-24 11:11:52', '添加菜单信息【Menu [name=sadas, parent=null, url=sadsad, icon=el-icon-lollipop, sort=1, isButton=false, isShow=true]】', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('307', '2021-03-24 11:11:57', '2021-03-24 11:11:57', '删除菜单信息，菜单ID【29】', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('308', '2021-03-28 10:59:11', '2021-03-28 10:59:11', '用户[猿来入此]与[2021-03-28 10:59:10]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('309', '2021-03-28 11:25:12', '2021-03-28 11:25:12', '用户[猿来入此]与[2021-03-28 11:25:12]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('310', '2021-03-28 11:25:25', '2021-03-28 11:25:25', '用户[猿来入此]与[2021-03-28 11:25:25]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('311', '2021-03-28 11:27:35', '2021-03-28 11:27:35', '用户[猿来入此]与[2021-03-28 11:27:35]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('312', '2021-03-28 11:27:59', '2021-03-28 11:27:59', '用户[猿来入此]与[2021-03-28 11:27:58]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('313', '2021-03-28 11:30:05', '2021-03-28 11:30:05', '用户[猿来入此]与[2021-03-28 11:30:05]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('314', '2021-03-28 11:34:33', '2021-03-28 11:34:33', '用户[猿来入此]与[2021-03-28 11:34:33]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('315', '2021-03-28 11:34:42', '2021-03-28 11:34:42', '用户[猿来入此]与[2021-03-28 11:34:42]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('316', '2021-03-28 12:05:22', '2021-03-28 12:05:22', '用户[猿来入此]与[2021-03-28 12:05:22]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('317', '2021-03-30 11:49:21', '2021-03-30 11:49:21', '用户[猿来入此]与[2021-03-30 11:49:21]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('318', '2021-03-30 11:51:42', '2021-03-30 11:51:42', '用户[猿来入此]与[2021-03-30 11:51:42]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('319', '2021-03-30 11:57:20', '2021-03-30 11:57:20', '用户[猿来入此]与[2021-03-30 11:57:20]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('320', '2021-03-30 12:08:20', '2021-03-30 12:08:20', '用户[猿来入此]与[2021-03-30 12:08:20]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('321', '2021-03-30 12:14:29', '2021-03-30 12:14:29', '用户[猿来入此]与[2021-03-30 12:14:29]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('322', '2021-03-30 12:20:20', '2021-03-30 12:20:20', '用户[猿来入此]与[2021-03-30 12:20:20]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('323', '2021-03-30 12:28:12', '2021-03-30 12:28:12', '用户[猿来入此]与[2021-03-30 12:28:12]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('324', '2021-03-30 12:32:09', '2021-03-30 12:32:09', '用户[猿来入此]与[2021-03-30 12:32:09]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('325', '2021-03-31 11:32:53', '2021-03-31 11:32:53', '用户[猿来入此]与[2021-03-31 11:32:53]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('326', '2021-03-31 11:34:17', '2021-03-31 11:34:17', '用户[猿来入此]与[2021-03-31 11:34:17]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('327', '2021-03-31 11:35:24', '2021-03-31 11:35:24', '用户[猿来入此]与[2021-03-31 11:35:24]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('328', '2021-03-31 11:46:01', '2021-03-31 11:46:01', '用户[猿来入此]与[2021-03-31 11:46:01]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('329', '2021-04-05 11:34:42', '2021-04-05 11:34:42', '用户[猿来入此]与[2021-04-05 11:34:42]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('330', '2021-04-06 12:01:43', '2021-04-06 12:01:43', '用户[猿来入此]与[2021-04-06 12:01:43]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('331', '2021-04-08 12:03:27', '2021-04-08 12:03:27', '用户[猿来入此]与[2021-04-08 12:03:27]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('332', '2021-04-11 11:25:06', '2021-04-11 11:25:06', '用户[猿来入此]与[2021-04-11 11:25:06]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('333', '2021-04-11 12:15:02', '2021-04-11 12:15:02', '用户[猿来入此]与[2021-04-11 12:15:02]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('334', '2021-04-11 12:23:50', '2021-04-11 12:23:50', '用户[猿来入此]与[2021-04-11 12:23:50]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('335', '2021-04-11 12:24:23', '2021-04-11 12:24:23', '添加用户，用户名：远走此处', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('336', '2021-04-11 12:27:42', '2021-04-11 12:27:42', '编辑用户，用户名：远走此处', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('337', '2021-04-11 12:39:10', '2021-04-11 12:39:10', '用户[猿来入此]与[2021-04-11 12:39:10]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('338', '2021-04-11 12:41:46', '2021-04-11 12:41:46', '用户[猿来入此]与[2021-04-11 12:41:46]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('339', '2021-04-11 12:42:57', '2021-04-11 12:42:57', '用户[猿来入此]与[2021-04-11 12:42:57]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('340', '2021-04-11 12:48:56', '2021-04-11 12:48:56', '用户[猿来入此]与[2021-04-11 12:48:56]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('341', '2021-04-11 12:50:42', '2021-04-11 12:50:42', '用户[猿来入此]与[2021-04-11 12:50:42]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('342', '2021-04-11 12:51:17', '2021-04-11 12:51:17', '用户[猿来入此]与[2021-04-11 12:51:17]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('343', '2021-04-13 11:30:17', '2021-04-13 11:30:17', '用户[猿来入此]与[2021-04-13 11:30:17]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('344', '2021-04-13 11:30:23', '2021-04-13 11:30:23', '添加用户，用户ID：8', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('345', '2021-04-13 11:37:17', '2021-04-13 11:37:17', '添加菜单信息【Menu [name=测试一波, parent=Menu [name=系统设置, parent=null, url=, icon=mdi-settings, sort=0, isButton=false, isShow=true], url=/admin/role/adasd, icon=el-icon-ice-cream-square, sort=1, isButton=false, isShow=true]】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('346', '2021-04-13 11:39:16', '2021-04-13 11:39:16', '删除菜单信息，菜单ID【27】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('347', '2021-04-13 11:48:42', '2021-04-13 11:48:42', '用户[猿来入此]与[2021-04-13 11:48:42]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('348', '2021-04-13 11:52:24', '2021-04-13 11:52:24', '用户[猿来入此]与[2021-04-13 11:52:24]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('349', '2021-04-13 11:56:34', '2021-04-13 11:56:34', '编辑菜单信息【Menu [name=还原测试, parent=null, url=restore(\'/database_bak/restore\'), icon=mdi-database-minus, sort=10, isButton=false, isShow=true]】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('350', '2021-04-13 11:57:33', '2021-04-13 11:57:33', '编辑菜单信息【Menu [name=还原测试, parent=null, url=restore(\'/database_bak/restore\'), icon=mdi-database-minus, sort=10, isButton=false, isShow=true]】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('351', '2021-04-13 12:03:24', '2021-04-13 12:03:24', '编辑菜单信息【Menu [name=还原测试, parent=null, url=restore(\'/database_bak/restore\'), icon=mdi-database-minus, sort=10, isButton=false, isShow=true]】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('352', '2021-04-13 12:03:33', '2021-04-13 12:03:33', '用户[猿来入此]与[2021-04-13 12:03:33]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('353', '2021-04-13 12:04:03', '2021-04-13 12:04:03', '编辑菜单信息【Menu [name=还原测试, parent=Menu [name=数据备份, parent=Menu [name=系统设置, parent=null, url=, icon=mdi-settings, sort=0, isButton=false, isShow=true], url=/database_bak/list, icon=mdi-database, sort=16, isButton=false, isShow=true], url=restore(\'/database_bak/restore\'), icon=mdi-database-minus, sort=10, isButton=false, isShow=true]】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('354', '2021-04-13 12:26:40', '2021-04-13 12:26:40', '用户[猿来入此]与[2021-04-13 12:26:40]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('355', '2021-04-18 12:14:01', '2021-04-18 12:14:01', '用户[猿来入此]与[2021-04-18 12:14:01]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('356', '2021-04-18 12:36:52', '2021-04-18 12:36:52', '添加角色【测试】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('357', '2021-04-18 12:37:29', '2021-04-18 12:37:29', '添加角色【测试测试】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('358', '2021-04-19 12:05:49', '2021-04-19 12:05:49', '用户[猿来入此]与[2021-04-19 12:05:49]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('359', '2021-04-19 12:06:38', '2021-04-19 12:06:38', '用户[猿来入此]与[2021-04-19 12:06:38]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('360', '2021-04-19 12:16:19', '2021-04-19 12:16:19', '用户[猿来入此]与[2021-04-19 12:16:19]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('361', '2021-04-19 12:17:10', '2021-04-19 12:17:10', '编辑角色【测试】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('362', '2021-04-19 12:17:56', '2021-04-19 12:17:56', '编辑角色【测试】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('363', '2021-04-19 12:19:20', '2021-04-19 12:19:20', '用户[猿来入此]与[2021-04-19 12:19:20]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('364', '2021-04-19 12:20:51', '2021-04-19 12:20:51', '编辑角色【测试】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('365', '2021-04-19 12:22:27', '2021-04-19 12:22:27', '编辑角色【测试】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('366', '2021-04-19 12:23:57', '2021-04-19 12:23:57', '用户[猿来入此]与[2021-04-19 12:23:57]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('367', '2021-04-19 12:24:16', '2021-04-19 12:24:16', '编辑角色【测试】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('368', '2021-04-19 12:24:37', '2021-04-19 12:24:37', '编辑角色【超级管理员】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('369', '2021-04-19 12:26:52', '2021-04-19 12:26:52', '添加用户，用户名：金库测试', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('370', '2021-04-19 12:27:19', '2021-04-19 12:27:19', '编辑用户，用户名：金库测试把', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('371', '2021-04-19 12:30:45', '2021-04-19 12:30:45', '编辑用户，用户名：金库测试把', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('372', '2021-04-20 11:47:16', '2021-04-20 11:47:16', '用户[猿来入此]与[2021-04-20 11:47:16]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('373', '2021-04-20 11:59:29', '2021-04-20 11:59:29', '用户[猿来入此]与[2021-04-20 11:59:29]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('374', '2021-04-20 12:04:00', '2021-04-20 12:04:00', '用户[猿来入此]与[2021-04-20 12:04:00]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('375', '2021-04-20 12:04:51', '2021-04-20 12:04:51', '用户[猿来入此]与[2021-04-20 12:04:51]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('376', '2021-04-20 12:06:26', '2021-04-20 12:06:26', '用户[猿来入此]与[2021-04-20 12:06:26]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('377', '2021-04-20 12:08:18', '2021-04-20 12:08:18', '用户[猿来入此]与[2021-04-20 12:08:18]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('378', '2021-04-20 12:09:06', '2021-04-20 12:09:06', '用户[猿来入此]与[2021-04-20 12:09:06]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('379', '2021-04-20 12:12:38', '2021-04-20 12:12:38', '编辑角色【超级管理员】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('380', '2021-04-20 12:16:34', '2021-04-20 12:16:34', '编辑菜单信息【Menu [name=菜单管理, parent=Menu [name=系统设置, parent=null, url=, icon=mdi-settings, sort=0, isButton=false, isShow=true], url=/admin/menu/list, icon=el-icon-ice-cream-square, sort=1, isButton=false, isShow=true]】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('381', '2021-04-20 12:17:37', '2021-04-20 12:17:37', '用户[猿来入此]与[2021-04-20 12:17:37]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('382', '2021-04-20 12:17:39', '2021-04-20 12:17:39', '用户[猿来入此]与[2021-04-20 12:17:39]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('383', '2021-04-20 12:21:42', '2021-04-20 12:21:42', '用户[猿来入此]与[2021-04-20 12:21:42]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('384', '2021-04-20 12:25:39', '2021-04-20 12:25:39', '用户[猿来入此]与[2021-04-20 12:25:39]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('385', '2021-04-20 12:27:08', '2021-04-20 12:27:08', '用户[猿来入此]与[2021-04-20 12:27:08]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('386', '2021-04-20 12:30:29', '2021-04-20 12:30:29', '编辑菜单信息【Menu [name=系统设置, parent=null, url=, icon=el-icon-lollipop, sort=1, isButton=false, isShow=true]】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('387', '2021-04-20 12:38:02', '2021-04-20 12:38:02', '编辑菜单信息【Menu [name=系统设置, parent=null, url=, icon=el-icon-lollipop, sort=1, isButton=false, isShow=true]】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('388', '2021-04-20 12:38:12', '2021-04-20 12:38:12', '用户[猿来入此]与[2021-04-20 12:38:12]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('389', '2021-04-20 12:38:40', '2021-04-20 12:38:40', '编辑菜单信息【Menu [name=系统设置, parent=null, url=, icon=el-icon-lollipop, sort=1, isButton=false, isShow=true]】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('390', '2021-04-20 12:39:07', '2021-04-20 12:39:07', '编辑菜单信息【Menu [name=菜单管理, parent=Menu [name=系统设置, parent=null, url=, icon=el-icon-lollipop, sort=1, isButton=false, isShow=true], url=/admin/menu/list, icon=el-icon-lollipop, sort=1, isButton=false, isShow=true]】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('391', '2021-04-21 11:32:38', '2021-04-21 11:32:38', '用户[猿来入此]与[2021-04-21 11:32:38]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('392', '2021-04-21 11:34:11', '2021-04-21 11:34:11', '添加菜单信息【Menu [name=校园管理, parent=null, url=, icon=el-icon-menu, sort=10, isButton=false, isShow=true]】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('393', '2021-04-21 11:36:03', '2021-04-21 11:36:03', '添加菜单信息【Menu [name=学生列表, parent=Menu [name=校园管理, parent=null, url=, icon=el-icon-menu, sort=10, isButton=false, isShow=true], url=/admin/student/list, icon=el-icon-user, sort=10, isButton=false, isShow=true]】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('394', '2021-04-21 11:36:58', '2021-04-21 11:36:58', '编辑菜单信息【Menu [name=校园管理, parent=null, url=, icon=el-icon-menu, sort=10, isButton=false, isShow=true]】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('395', '2021-04-21 11:37:13', '2021-04-21 11:37:13', '编辑菜单信息【Menu [name=还原测试, parent=Menu [name=数据备份, parent=Menu [name=系统设置, parent=null, url=, icon=el-icon-lollipop, sort=1, isButton=false, isShow=true], url=/database_bak/list, icon=mdi-database, sort=16, isButton=false, isShow=true], url=restore(\'/database_bak/restore\'), icon=mdi-database-minus, sort=10, isButton=false, isShow=true]】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('396', '2021-04-21 11:38:50', '2021-04-21 11:38:50', '编辑菜单信息【Menu [name=还原测试, parent=Menu [name=数据备份, parent=Menu [name=系统设置, parent=null, url=, icon=el-icon-lollipop, sort=1, isButton=false, isShow=true], url=/database_bak/list, icon=mdi-database, sort=16, isButton=false, isShow=true], url=restore(\'/database_bak/restore\'), icon=mdi-database-minus, sort=10, isButton=false, isShow=true]】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('397', '2021-04-21 11:39:02', '2021-04-21 11:39:02', '编辑菜单信息【Menu [name=还原测试, parent=Menu [name=数据备份, parent=Menu [name=系统设置, parent=null, url=, icon=el-icon-lollipop, sort=1, isButton=false, isShow=true], url=/database_bak/list, icon=mdi-database, sort=16, isButton=false, isShow=true], url=restore(\'/database_bak/restore\'), icon=mdi-database-minus, sort=19, isButton=false, isShow=true]】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('398', '2021-04-21 11:39:14', '2021-04-21 11:39:14', '编辑菜单信息【Menu [name=校园管理, parent=null, url=, icon=el-icon-menu, sort=20, isButton=false, isShow=true]】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('399', '2021-04-21 11:39:22', '2021-04-21 11:39:22', '编辑菜单信息【Menu [name=学生列表, parent=Menu [name=校园管理, parent=null, url=, icon=el-icon-menu, sort=20, isButton=false, isShow=true], url=/admin/student/list, icon=el-icon-user, sort=21, isButton=false, isShow=true]】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('400', '2021-04-21 11:39:57', '2021-04-21 11:39:57', '添加菜单信息【Menu [name=添加, parent=Menu [name=学生列表, parent=Menu [name=校园管理, parent=null, url=, icon=el-icon-menu, sort=20, isButton=false, isShow=true], url=/admin/student/list, icon=el-icon-user, sort=21, isButton=false, isShow=true], url=/admin/student/add, icon=el-icon-plus, sort=1, isButton=false, isShow=true]】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('401', '2021-04-21 11:40:23', '2021-04-21 11:40:23', '添加菜单信息【Menu [name=编辑, parent=Menu [name=学生列表, parent=Menu [name=校园管理, parent=null, url=, icon=el-icon-menu, sort=20, isButton=false, isShow=true], url=/admin/student/list, icon=el-icon-user, sort=21, isButton=false, isShow=true], url=/admin/student/edit, icon=el-icon-minus, sort=10, isButton=false, isShow=true]】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('402', '2021-04-21 11:40:34', '2021-04-21 11:40:34', '编辑菜单信息【Menu [name=编辑, parent=Menu [name=学生列表, parent=Menu [name=校园管理, parent=null, url=, icon=el-icon-menu, sort=20, isButton=false, isShow=true], url=/admin/student/list, icon=el-icon-user, sort=21, isButton=false, isShow=true], url=/admin/student/edit, icon=el-icon-minus, sort=22, isButton=false, isShow=true]】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('403', '2021-04-21 11:40:41', '2021-04-21 11:40:41', '编辑菜单信息【Menu [name=添加, parent=Menu [name=学生列表, parent=Menu [name=校园管理, parent=null, url=, icon=el-icon-menu, sort=20, isButton=false, isShow=true], url=/admin/student/list, icon=el-icon-user, sort=21, isButton=false, isShow=true], url=/admin/student/add, icon=el-icon-plus, sort=22, isButton=false, isShow=true]】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('404', '2021-04-21 11:40:48', '2021-04-21 11:40:48', '编辑菜单信息【Menu [name=编辑, parent=Menu [name=学生列表, parent=Menu [name=校园管理, parent=null, url=, icon=el-icon-menu, sort=20, isButton=false, isShow=true], url=/admin/student/list, icon=el-icon-user, sort=21, isButton=false, isShow=true], url=/admin/student/edit, icon=el-icon-minus, sort=23, isButton=false, isShow=true]】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('405', '2021-04-21 11:41:22', '2021-04-21 11:41:22', '添加菜单信息【Menu [name=删除, parent=Menu [name=学生列表, parent=Menu [name=校园管理, parent=null, url=, icon=el-icon-menu, sort=20, isButton=false, isShow=true], url=/admin/student/list, icon=el-icon-user, sort=21, isButton=false, isShow=true], url=/admin/student/delete, icon=el-icon-close, sort=23, isButton=false, isShow=true]】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('406', '2021-04-21 11:41:29', '2021-04-21 11:41:29', '编辑菜单信息【Menu [name=删除, parent=Menu [name=学生列表, parent=Menu [name=校园管理, parent=null, url=, icon=el-icon-menu, sort=20, isButton=false, isShow=true], url=/admin/student/list, icon=el-icon-user, sort=21, isButton=false, isShow=true], url=/admin/student/delete, icon=el-icon-close, sort=24, isButton=false, isShow=true]】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('407', '2021-04-21 11:41:41', '2021-04-21 11:41:41', '编辑角色【超级管理员】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('408', '2021-04-21 11:44:56', '2021-04-21 11:44:56', '编辑菜单信息【Menu [name=校园管理, parent=null, url=6, icon=el-icon-menu, sort=20, isButton=false, isShow=true]】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('409', '2021-04-21 11:55:37', '2021-04-21 11:55:37', '编辑菜单信息【Menu [name=添加, parent=Menu [name=学生列表, parent=Menu [name=校园管理, parent=null, url=6, icon=el-icon-menu, sort=20, isButton=false, isShow=true], url=/admin/student/list, icon=el-icon-user, sort=21, isButton=false, isShow=true], url=/admin/student/add, icon=el-icon-plus, sort=22, isButton=false, isShow=true]】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('410', '2021-04-21 11:55:48', '2021-04-21 11:55:48', '编辑菜单信息【Menu [name=编辑, parent=Menu [name=学生列表, parent=Menu [name=校园管理, parent=null, url=6, icon=el-icon-menu, sort=20, isButton=false, isShow=true], url=/admin/student/list, icon=el-icon-user, sort=21, isButton=false, isShow=true], url=/admin/student/edit, icon=el-icon-minus, sort=23, isButton=false, isShow=true]】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('411', '2021-04-21 11:57:32', '2021-04-21 11:57:32', '编辑菜单信息【Menu [name=添加, parent=Menu [name=学生列表, parent=Menu [name=校园管理, parent=null, url=6, icon=el-icon-menu, sort=20, isButton=false, isShow=true], url=/admin/student/list, icon=el-icon-user, sort=21, isButton=false, isShow=true], url=/admin/student/add, icon=el-icon-plus, sort=22, isButton=false, isShow=true]】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('412', '2021-04-21 12:00:41', '2021-04-21 12:00:41', '编辑菜单信息【Menu [name=添加, parent=Menu [name=学生列表, parent=Menu [name=校园管理, parent=null, url=6, icon=el-icon-menu, sort=20, isButton=false, isShow=true], url=/admin/student/list, icon=el-icon-user, sort=21, isButton=false, isShow=true], url=/admin/student/add, icon=el-icon-plus, sort=22, isButton=false, isShow=true]】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('413', '2021-04-21 12:01:44', '2021-04-21 12:01:44', '编辑菜单信息【Menu [name=添加, parent=Menu [name=学生列表, parent=Menu [name=校园管理, parent=null, url=6, icon=el-icon-menu, sort=20, isButton=false, isShow=true], url=/admin/student/list, icon=el-icon-user, sort=21, isButton=false, isShow=true], url=/admin/student/add, icon=el-icon-plus, sort=22, isButton=false, isShow=true]】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('414', '2021-04-21 12:02:44', '2021-04-21 12:02:44', '编辑菜单信息【Menu [name=添加, parent=Menu [name=学生列表, parent=Menu [name=校园管理, parent=null, url=6, icon=el-icon-menu, sort=20, isButton=false, isShow=true], url=/admin/student/list, icon=el-icon-user, sort=21, isButton=false, isShow=true], url=/admin/student/add, icon=el-icon-plus, sort=22, isButton=false, isShow=true]】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('415', '2021-04-21 12:04:07', '2021-04-21 12:04:07', '用户[猿来入此]与[2021-04-21 12:04:07]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('416', '2021-04-21 12:04:31', '2021-04-21 12:04:31', '编辑菜单信息【Menu [name=添加, parent=Menu [name=学生列表, parent=Menu [name=校园管理, parent=null, url=6, icon=el-icon-menu, sort=20, isButton=false, isShow=true], url=/admin/student/list, icon=el-icon-user, sort=21, isButton=false, isShow=true], url=/admin/student/add, icon=el-icon-plus, sort=22, isButton=true, isShow=true]】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('417', '2021-04-21 12:04:43', '2021-04-21 12:04:43', '编辑菜单信息【Menu [name=添加, parent=Menu [name=学生列表, parent=Menu [name=校园管理, parent=null, url=6, icon=el-icon-menu, sort=20, isButton=false, isShow=true], url=/admin/student/list, icon=el-icon-user, sort=21, isButton=false, isShow=true], url=/admin/student/add, icon=el-icon-plus, sort=22, isButton=true, isShow=true]】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('418', '2021-04-21 12:05:09', '2021-04-21 12:05:09', '编辑菜单信息【Menu [name=添加, parent=Menu [name=学生列表, parent=Menu [name=校园管理, parent=null, url=6, icon=el-icon-menu, sort=20, isButton=false, isShow=true], url=/admin/student/list, icon=el-icon-user, sort=21, isButton=false, isShow=true], url=/admin/student/add, icon=el-icon-plus, sort=22, isButton=true, isShow=true]】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('419', '2021-04-21 12:07:47', '2021-04-21 12:07:47', '编辑菜单信息【Menu [name=学生列表, parent=Menu [name=校园管理, parent=null, url=6, icon=el-icon-menu, sort=20, isButton=false, isShow=true], url=/admin/student/list, icon=el-icon-user, sort=21, isButton=true, isShow=true]】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('420', '2021-04-21 12:08:20', '2021-04-21 12:08:20', '编辑菜单信息【Menu [name=学生列表, parent=Menu [name=校园管理, parent=null, url=6, icon=el-icon-menu, sort=20, isButton=false, isShow=true], url=/admin/student/list, icon=el-icon-user, sort=21, isButton=false, isShow=false]】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('421', '2021-04-21 12:08:36', '2021-04-21 12:08:36', '编辑菜单信息【Menu [name=学生列表, parent=Menu [name=校园管理, parent=null, url=6, icon=el-icon-menu, sort=20, isButton=false, isShow=true], url=/admin/student/list, icon=el-icon-user, sort=21, isButton=true, isShow=true]】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('422', '2021-04-21 12:08:53', '2021-04-21 12:08:53', '编辑菜单信息【Menu [name=编辑, parent=Menu [name=学生列表, parent=Menu [name=校园管理, parent=null, url=6, icon=el-icon-menu, sort=20, isButton=false, isShow=true], url=/admin/student/list, icon=el-icon-user, sort=21, isButton=true, isShow=true], url=/admin/student/edit, icon=el-icon-minus, sort=23, isButton=true, isShow=true]】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('423', '2021-04-21 12:09:08', '2021-04-21 12:09:08', '编辑菜单信息【Menu [name=删除, parent=Menu [name=学生列表, parent=Menu [name=校园管理, parent=null, url=6, icon=el-icon-menu, sort=20, isButton=false, isShow=true], url=/admin/student/list, icon=el-icon-user, sort=21, isButton=true, isShow=true], url=/admin/student/delete, icon=el-icon-close, sort=24, isButton=true, isShow=true]】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('424', '2021-04-21 12:09:22', '2021-04-21 12:09:22', '编辑菜单信息【Menu [name=学生列表, parent=Menu [name=校园管理, parent=null, url=6, icon=el-icon-menu, sort=20, isButton=false, isShow=true], url=/admin/student/list, icon=el-icon-user, sort=21, isButton=false, isShow=true]】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('425', '2021-04-22 11:21:45', '2021-04-22 11:21:45', '用户[猿来入此]与[2021-04-22 11:21:44]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('426', '2021-04-22 11:48:06', '2021-04-22 11:48:06', '用户[猿来入此]与[2021-04-22 11:48:06]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('427', '2021-04-22 12:01:23', '2021-04-22 12:01:23', '添加角色【学生】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('428', '2021-04-22 12:03:53', '2021-04-22 12:03:53', '用户[猿来入此]与[2021-04-22 12:03:53]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('429', '2021-04-22 12:04:43', '2021-04-22 12:04:43', '添加学生，学生名：张三', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('430', '2021-04-22 12:12:16', '2021-04-22 12:12:16', '用户[猿来入此]与[2021-04-22 12:12:16]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('431', '2021-04-22 12:18:51', '2021-04-22 12:18:51', '用户[猿来入此]与[2021-04-22 12:18:51]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('432', '2021-04-22 12:18:55', '2021-04-22 12:18:55', '删除学生，学生ID：1', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('433', '2021-04-22 12:19:31', '2021-04-22 12:19:31', '添加学生，学生名：张三', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('434', '2021-04-22 12:25:31', '2021-04-22 12:25:31', '用户[猿来入此]与[2021-04-22 12:25:31]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('435', '2021-04-22 12:25:48', '2021-04-22 12:25:48', '编辑学生，学生名：张三', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('436', '2021-04-24 12:03:07', '2021-04-24 12:03:07', '用户[猿来入此]与[2021-04-24 12:03:07]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('437', '2021-04-24 12:03:19', '2021-04-24 12:03:19', '编辑学生，学生名：张三', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('438', '2021-04-24 12:03:19', '2021-04-24 12:03:19', '编辑学生，学生名：张三', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('439', '2021-04-24 12:40:44', '2021-04-24 12:40:44', '用户[猿来入此]与[2021-04-24 12:40:44]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('440', '2021-04-24 12:41:11', '2021-04-24 12:41:11', '添加菜单信息【Menu [name=校园店铺列表, parent=Menu [name=校园管理, parent=null, url=6, icon=el-icon-menu, sort=20, isButton=false, isShow=true], url=/admin/store/list, icon=el-icon-refrigerator, sort=20, isButton=false, isShow=false]】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('441', '2021-04-24 12:41:19', '2021-04-24 12:41:19', '编辑菜单信息【Menu [name=校园店铺列表, parent=Menu [name=校园管理, parent=null, url=6, icon=el-icon-menu, sort=20, isButton=false, isShow=true], url=/admin/store/list, icon=el-icon-refrigerator, sort=25, isButton=false, isShow=false]】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('442', '2021-04-24 12:41:25', '2021-04-24 12:41:25', '编辑菜单信息【Menu [name=校园店铺列表, parent=Menu [name=校园管理, parent=null, url=6, icon=el-icon-menu, sort=20, isButton=false, isShow=true], url=/admin/store/list, icon=el-icon-refrigerator, sort=25, isButton=true, isShow=true]】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('443', '2021-04-24 12:42:00', '2021-04-24 12:42:00', '添加菜单信息【Menu [name=添加, parent=Menu [name=校园店铺列表, parent=Menu [name=校园管理, parent=null, url=6, icon=el-icon-menu, sort=20, isButton=false, isShow=true], url=/admin/store/list, icon=el-icon-refrigerator, sort=25, isButton=true, isShow=true], url=admin/store/add, icon=el-icon-plus, sort=25, isButton=false, isShow=false]】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('444', '2021-04-24 12:42:24', '2021-04-24 12:42:24', '添加菜单信息【Menu [name=编辑, parent=Menu [name=校园店铺列表, parent=Menu [name=校园管理, parent=null, url=6, icon=el-icon-menu, sort=20, isButton=false, isShow=true], url=/admin/store/list, icon=el-icon-refrigerator, sort=25, isButton=true, isShow=true], url=admin/store/edit, icon=el-icon-minus, sort=26, isButton=false, isShow=false]】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('445', '2021-04-24 12:42:44', '2021-04-24 12:42:44', '添加菜单信息【Menu [name=删除, parent=Menu [name=校园店铺列表, parent=Menu [name=校园管理, parent=null, url=6, icon=el-icon-menu, sort=20, isButton=false, isShow=true], url=/admin/store/list, icon=el-icon-refrigerator, sort=25, isButton=true, isShow=true], url=admin/store/delete, icon=el-icon-close, sort=27, isButton=false, isShow=false]】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('446', '2021-04-24 12:42:53', '2021-04-24 12:42:53', '编辑菜单信息【Menu [name=添加, parent=Menu [name=校园店铺列表, parent=Menu [name=校园管理, parent=null, url=6, icon=el-icon-menu, sort=20, isButton=false, isShow=true], url=/admin/store/list, icon=el-icon-refrigerator, sort=25, isButton=true, isShow=true], url=admin/store/add, icon=el-icon-plus, sort=25, isButton=true, isShow=true]】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('447', '2021-04-24 12:42:58', '2021-04-24 12:42:58', '编辑菜单信息【Menu [name=编辑, parent=Menu [name=校园店铺列表, parent=Menu [name=校园管理, parent=null, url=6, icon=el-icon-menu, sort=20, isButton=false, isShow=true], url=/admin/store/list, icon=el-icon-refrigerator, sort=25, isButton=true, isShow=true], url=admin/store/edit, icon=el-icon-minus, sort=26, isButton=true, isShow=true]】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('448', '2021-04-24 12:43:04', '2021-04-24 12:43:04', '编辑菜单信息【Menu [name=删除, parent=Menu [name=校园店铺列表, parent=Menu [name=校园管理, parent=null, url=6, icon=el-icon-menu, sort=20, isButton=false, isShow=true], url=/admin/store/list, icon=el-icon-refrigerator, sort=25, isButton=true, isShow=true], url=admin/store/delete, icon=el-icon-close, sort=27, isButton=true, isShow=true]】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('449', '2021-04-24 12:43:16', '2021-04-24 12:43:16', '编辑角色【超级管理员】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('450', '2021-04-24 12:44:59', '2021-04-24 12:44:59', '用户[猿来入此]与[2021-04-24 12:44:59]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('451', '2021-04-24 12:45:10', '2021-04-24 12:45:10', '编辑菜单信息【Menu [name=校园店铺列表, parent=Menu [name=校园管理, parent=null, url=6, icon=el-icon-menu, sort=20, isButton=false, isShow=true], url=/admin/store/list, icon=el-icon-refrigerator, sort=25, isButton=false, isShow=false]】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('452', '2021-04-24 12:47:32', '2021-04-24 12:47:32', '添加菜单信息【Menu [name=测试一波, parent=Menu [name=校园店铺列表, parent=Menu [name=校园管理, parent=null, url=6, icon=el-icon-menu, sort=20, isButton=false, isShow=true], url=/admin/store/list, icon=el-icon-refrigerator, sort=25, isButton=false, isShow=false], url=/admin/sdsadsadsa, icon=el-icon-ice-cream-square, sort=1, isButton=true, isShow=true]】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('453', '2021-04-24 12:47:37', '2021-04-24 12:47:37', '删除菜单信息，菜单ID【36】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('454', '2021-04-25 11:27:40', '2021-04-25 11:27:40', '用户[猿来入此]与[2021-04-25 11:27:40]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('455', '2021-04-25 11:30:57', '2021-04-25 11:30:57', '用户[猿来入此]与[2021-04-25 11:30:57]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('456', '2021-04-25 12:17:00', '2021-04-25 12:17:00', '用户[猿来入此]与[2021-04-25 12:17:00]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('457', '2021-04-26 11:03:12', '2021-04-26 11:03:12', '用户[猿来入此]与[2021-04-26 11:03:11]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('458', '2021-04-26 11:28:45', '2021-04-26 11:28:45', '添加店铺，店铺名：猿来如此店铺', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('459', '2021-04-26 11:34:33', '2021-04-26 11:34:33', '添加店铺，店铺名：猿来入此', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('460', '2021-04-26 11:36:42', '2021-04-26 11:36:42', '添加店铺，店铺名：猿来如此大超市', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('461', '2021-04-26 11:37:20', '2021-04-26 11:37:20', '用户[猿来入此]与[2021-04-26 11:37:20]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('462', '2021-04-26 11:38:43', '2021-04-26 11:38:43', '添加店铺，店铺名：小可可超市', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('463', '2021-04-26 12:07:38', '2021-04-26 12:07:38', '用户[猿来入此]与[2021-04-26 12:07:38]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('464', '2021-04-26 12:08:46', '2021-04-26 12:08:46', '编辑店铺，店铺名：小牛牛超市', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('465', '2021-04-26 12:12:55', '2021-04-26 12:12:55', '添加店铺，店铺名：妞妞超市', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('466', '2021-04-26 12:13:02', '2021-04-26 12:13:02', '删除店铺，店铺ID：4', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('467', '2021-04-27 11:46:32', '2021-04-27 11:46:32', '用户[猿来入此]与[2021-04-27 11:46:32]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('468', '2021-04-27 12:13:10', '2021-04-27 12:13:10', '用户[猿来入此]与[2021-04-27 12:13:10]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('469', '2021-04-27 12:13:53', '2021-04-27 12:13:53', '添加菜单信息【Menu [name=跑腿代购管理, parent=Menu [name=校园管理, parent=null, url=6, icon=el-icon-menu, sort=20, isButton=false, isShow=true], url=admin/run_errands/list, icon=el-icon-bank-card, sort=30, isButton=true, isShow=true]】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('470', '2021-04-27 12:14:02', '2021-04-27 12:14:02', '编辑菜单信息【Menu [name=跑腿代购管理, parent=Menu [name=校园管理, parent=null, url=6, icon=el-icon-menu, sort=20, isButton=false, isShow=true], url=admin/run_errands/list, icon=el-icon-bank-card, sort=28, isButton=true, isShow=true]】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('471', '2021-04-27 12:14:38', '2021-04-27 12:14:38', '添加菜单信息【Menu [name=添加, parent=Menu [name=跑腿代购管理, parent=Menu [name=校园管理, parent=null, url=6, icon=el-icon-menu, sort=20, isButton=false, isShow=true], url=admin/run_errands/list, icon=el-icon-bank-card, sort=28, isButton=true, isShow=true], url=admin/run_errands/add, icon=el-icon-plus, sort=28, isButton=true, isShow=true]】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('472', '2021-04-27 12:14:58', '2021-04-27 12:14:58', '添加菜单信息【Menu [name=编辑, parent=Menu [name=跑腿代购管理, parent=Menu [name=校园管理, parent=null, url=6, icon=el-icon-menu, sort=20, isButton=false, isShow=true], url=admin/run_errands/list, icon=el-icon-bank-card, sort=28, isButton=true, isShow=true], url=admin/run_errands/edit, icon=el-icon-minus, sort=29, isButton=true, isShow=true]】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('473', '2021-04-27 12:15:24', '2021-04-27 12:15:24', '添加菜单信息【Menu [name=删除, parent=Menu [name=跑腿代购管理, parent=Menu [name=校园管理, parent=null, url=6, icon=el-icon-menu, sort=20, isButton=false, isShow=true], url=admin/run_errands/list, icon=el-icon-bank-card, sort=28, isButton=true, isShow=true], url=admin/run_errands/delete, icon=el-icon-close, sort=30, isButton=true, isShow=true]】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('474', '2021-04-27 12:15:33', '2021-04-27 12:15:33', '编辑菜单信息【Menu [name=跑腿代购管理, parent=Menu [name=校园管理, parent=null, url=6, icon=el-icon-menu, sort=20, isButton=false, isShow=true], url=admin/run_errands/list, icon=el-icon-bank-card, sort=28, isButton=false, isShow=true]】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('475', '2021-04-27 12:15:44', '2021-04-27 12:15:44', '编辑角色【超级管理员】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('476', '2021-04-27 12:17:42', '2021-04-27 12:17:42', '用户[猿来入此]与[2021-04-27 12:17:42]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('477', '2021-04-27 12:18:11', '2021-04-27 12:18:11', '编辑菜单信息【Menu [name=跑腿代购管理, parent=Menu [name=校园管理, parent=null, url=6, icon=el-icon-menu, sort=20, isButton=false, isShow=true], url=admin/runErrands/list, icon=el-icon-bank-card, sort=28, isButton=false, isShow=true]】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('478', '2021-04-27 12:18:17', '2021-04-27 12:18:17', '编辑菜单信息【Menu [name=添加, parent=Menu [name=跑腿代购管理, parent=Menu [name=校园管理, parent=null, url=6, icon=el-icon-menu, sort=20, isButton=false, isShow=true], url=admin/runErrands/list, icon=el-icon-bank-card, sort=28, isButton=false, isShow=true], url=admin/runErrands/add, icon=el-icon-plus, sort=28, isButton=true, isShow=true]】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('479', '2021-04-27 12:18:23', '2021-04-27 12:18:23', '编辑菜单信息【Menu [name=编辑, parent=Menu [name=跑腿代购管理, parent=Menu [name=校园管理, parent=null, url=6, icon=el-icon-menu, sort=20, isButton=false, isShow=true], url=admin/runErrands/list, icon=el-icon-bank-card, sort=28, isButton=false, isShow=true], url=admin/runErrands/edit, icon=el-icon-minus, sort=29, isButton=true, isShow=true]】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('480', '2021-04-27 12:18:31', '2021-04-27 12:18:31', '编辑菜单信息【Menu [name=删除, parent=Menu [name=跑腿代购管理, parent=Menu [name=校园管理, parent=null, url=6, icon=el-icon-menu, sort=20, isButton=false, isShow=true], url=admin/runErrands/list, icon=el-icon-bank-card, sort=28, isButton=false, isShow=true], url=admin/runErrands/delete, icon=el-icon-close, sort=30, isButton=true, isShow=true]】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('481', '2021-04-27 12:18:54', '2021-04-27 12:18:54', '用户[猿来入此]与[2021-04-27 12:18:54]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('482', '2021-04-27 12:21:32', '2021-04-27 12:21:32', '编辑菜单信息【Menu [name=跑腿代购管理, parent=Menu [name=校园管理, parent=null, url=6, icon=el-icon-menu, sort=20, isButton=false, isShow=true], url=/admin/runErrands/list, icon=el-icon-bank-card, sort=28, isButton=false, isShow=true]】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('483', '2021-04-27 12:22:24', '2021-04-27 12:22:24', '编辑菜单信息【Menu [name=跑腿代购列表, parent=Menu [name=校园管理, parent=null, url=6, icon=el-icon-menu, sort=20, isButton=false, isShow=true], url=/admin/runErrands/list, icon=el-icon-bank-card, sort=28, isButton=false, isShow=true]】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('484', '2021-04-27 12:43:23', '2021-04-27 12:43:23', '用户[猿来入此]与[2021-04-27 12:43:23]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('485', '2021-04-27 12:45:33', '2021-04-27 12:45:33', '用户[猿来入此]与[2021-04-27 12:45:33]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('486', '2021-04-27 12:50:55', '2021-04-27 12:50:55', '用户[猿来入此]与[2021-04-27 12:50:55]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('487', '2021-04-27 12:56:47', '2021-04-27 12:56:47', '添加跑腿代购，跑腿代购标题：实打实打算', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('488', '2021-04-28 11:53:26', '2021-04-28 11:53:26', '用户[猿来入此]与[2021-04-28 11:53:25]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('489', '2021-04-28 12:00:41', '2021-04-28 12:00:41', '添加跑腿代购，跑腿代购标题：帮忙取下快递', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('490', '2021-04-28 12:03:42', '2021-04-28 12:03:42', '删除跑腿代购，跑腿代购ID：1', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('491', '2021-04-28 12:07:32', '2021-04-28 12:07:32', '删除跑腿代购，跑腿代购ID：2', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('492', '2021-04-28 12:08:41', '2021-04-28 12:08:41', '添加跑腿代购，跑腿代购标题：帮忙代购一个键盘', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('493', '2021-04-28 12:12:07', '2021-04-28 12:12:07', '用户[猿来入此]与[2021-04-28 12:12:07]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('494', '2021-04-28 12:13:49', '2021-04-28 12:13:49', '用户[猿来入此]与[2021-04-28 12:13:49]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('495', '2021-04-28 12:13:59', '2021-04-28 12:13:59', '编辑跑腿代购，跑腿代购标题：帮忙代购一个键盘', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('496', '2021-04-28 12:20:09', '2021-04-28 12:20:09', '添加菜单信息【Menu [name=个人信息管理, parent=null, url=, icon=el-icon-s-custom, sort=40, isButton=false, isShow=true]】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('497', '2021-04-28 12:20:15', '2021-04-28 12:20:15', '编辑菜单信息【Menu [name=个人信息管理, parent=null, url=, icon=el-icon-s-custom, sort=31, isButton=false, isShow=true]】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('498', '2021-04-28 12:22:12', '2021-04-28 12:22:12', '添加菜单信息【Menu [name=个人信息, parent=Menu [name=个人信息管理, parent=null, url=, icon=el-icon-s-custom, sort=31, isButton=false, isShow=true], url=/admin/personal/page, icon=el-icon-user, sort=1, isButton=false, isShow=true]】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('499', '2021-04-28 12:22:44', '2021-04-28 12:22:44', '添加菜单信息【Menu [name=修改密码, parent=Menu [name=个人信息管理, parent=null, url=, icon=el-icon-s-custom, sort=31, isButton=false, isShow=true], url=/admin/password/page, icon=el-icon-view, sort=32, isButton=false, isShow=true]】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('500', '2021-04-28 12:23:21', '2021-04-28 12:23:21', '编辑菜单信息【Menu [name=个人信息, parent=Menu [name=个人信息管理, parent=null, url=, icon=el-icon-s-custom, sort=31, isButton=false, isShow=true], url=/admin/personal/page, icon=el-icon-user, sort=32, isButton=false, isShow=true]】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('501', '2021-04-28 12:23:27', '2021-04-28 12:23:27', '编辑菜单信息【Menu [name=修改密码, parent=Menu [name=个人信息管理, parent=null, url=, icon=el-icon-s-custom, sort=31, isButton=false, isShow=true], url=/admin/password/page, icon=el-icon-view, sort=33, isButton=false, isShow=true]】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('502', '2021-04-28 12:23:50', '2021-04-28 12:23:50', '编辑角色【超级管理员】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('503', '2021-04-28 12:26:12', '2021-04-28 12:26:12', '用户[猿来入此]与[2021-04-28 12:26:12]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('504', '2021-04-28 12:26:31', '2021-04-28 12:26:31', '编辑菜单信息【Menu [name=个人信息管理, parent=null, url=7, icon=el-icon-s-custom, sort=31, isButton=false, isShow=true]】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('505', '2021-04-28 12:35:55', '2021-04-28 12:35:55', '用户[猿来入此]与[2021-04-28 12:35:55]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('506', '2021-05-02 23:32:17', '2021-05-02 23:32:17', '用户[猿来入此]与[2021-05-02 23:32:17]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('507', '2021-05-02 23:32:17', '2021-05-02 23:32:17', '用户[猿来入此]与[2021-05-02 23:32:17]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('508', '2021-05-03 00:09:47', '2021-05-03 00:09:47', '用户[猿来入此]与[2021-05-03 00:09:47]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('509', '2021-05-03 10:41:34', '2021-05-03 10:41:34', '用户[猿来入此]与[2021-05-03 10:41:34]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('510', '2021-05-03 11:13:26', '2021-05-03 11:13:26', '学生[张三]与[2021-05-03 11:13:24]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('511', '2021-05-03 11:21:43', '2021-05-03 11:21:43', '学生[张三]与[2021-05-03 11:21:43]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('512', '2021-05-03 11:39:15', '2021-05-03 11:39:15', '学生[张三]与[2021-05-03 11:39:15]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('513', '2021-05-03 11:46:16', '2021-05-03 11:46:16', '学生[张三]与[2021-05-03 11:46:16]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('514', '2021-05-03 11:47:51', '2021-05-03 11:47:51', '用户[猿来入此]与[2021-05-03 11:47:51]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('515', '2021-05-03 11:52:09', '2021-05-03 11:52:09', '用户[猿来入此]与[2021-05-03 11:52:08]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('516', '2021-05-03 11:54:13', '2021-05-03 11:54:13', '用户[猿来入此]与[2021-05-03 11:54:13]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('517', '2021-05-03 11:54:35', '2021-05-03 11:54:35', '用户[猿来入此]与[2021-05-03 11:54:35]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('518', '2021-05-03 11:55:44', '2021-05-03 11:55:44', '用户[猿来入此]与[2021-05-03 11:55:44]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('519', '2021-05-03 11:57:25', '2021-05-03 11:57:25', '用户[猿来入此]与[2021-05-03 11:57:25]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('520', '2021-05-03 12:00:16', '2021-05-03 12:00:16', '用户[猿来入此]与[2021-05-03 12:00:16]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('521', '2021-05-03 12:00:55', '2021-05-03 12:00:55', '学生[张三]与[2021-05-03 12:00:55]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('522', '2021-05-03 12:04:39', '2021-05-03 12:04:39', '用户[猿来入此]与[2021-05-03 12:04:39]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('523', '2021-05-03 12:05:07', '2021-05-03 12:05:07', '编辑角色【学生】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('524', '2021-05-03 12:05:22', '2021-05-03 12:05:22', '学生[张三]与[2021-05-03 12:05:22]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('525', '2021-05-03 12:11:47', '2021-05-03 12:11:47', '用户[猿来入此]与[2021-05-03 12:11:47]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('526', '2021-05-03 12:13:24', '2021-05-03 12:13:24', '用户[猿来入此]与[2021-05-03 12:13:24]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('527', '2021-05-03 12:15:05', '2021-05-03 12:15:05', '用户[猿来入此]与[2021-05-03 12:15:05]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('528', '2021-05-03 12:16:50', '2021-05-03 12:16:50', '学生[张三]与[2021-05-03 12:16:49]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('529', '2021-05-03 22:30:58', '2021-05-03 22:30:58', '用户[猿来入此]与[2021-05-03 22:30:57]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('530', '2021-05-04 11:24:19', '2021-05-04 11:24:19', '用户[猿来入此]与[2021-05-04 11:24:19]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('531', '2021-05-04 11:31:46', '2021-05-04 11:31:46', '用户[猿来入此]与[2021-05-04 11:31:46]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('532', '2021-05-04 11:41:18', '2021-05-04 11:41:18', '用户[猿来入此]与[2021-05-04 11:41:18]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('533', '2021-05-04 11:42:39', '2021-05-04 11:42:39', '用户[猿来入此]与[2021-05-04 11:42:38]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('534', '2021-05-04 12:23:45', '2021-05-04 12:23:45', '用户[猿来入此]与[2021-05-04 12:23:45]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('535', '2021-05-04 12:32:59', '2021-05-04 12:32:59', '用户[猿来入此]与[2021-05-04 12:32:59]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('536', '2021-05-04 12:35:52', '2021-05-04 12:35:52', '用户[猿来入此]与[2021-05-04 12:35:52]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('537', '2021-05-04 12:37:59', '2021-05-04 12:37:59', '用户[猿来入此]与[2021-05-04 12:37:59]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('538', '2021-05-04 12:39:29', '2021-05-04 12:39:29', '用户[猿来入此]与[2021-05-04 12:39:29]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('539', '2021-05-04 12:43:02', '2021-05-04 12:43:02', '用户[猿来入此]与[2021-05-04 12:43:02]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('540', '2021-05-04 12:48:29', '2021-05-04 12:48:29', '用户[猿来入此]与[2021-05-04 12:48:29]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('541', '2021-05-04 12:58:37', '2021-05-04 12:58:37', '用户[猿来入此]与[2021-05-04 12:58:37]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('542', '2021-05-04 13:00:49', '2021-05-04 13:00:49', '用户[猿来入此]与[2021-05-04 13:00:49]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('543', '2021-05-04 13:04:22', '2021-05-04 13:04:22', '用户[猿来入此]与[2021-05-04 13:04:22]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('544', '2021-05-04 13:08:14', '2021-05-04 13:08:14', '用户[猿来入此]与[2021-05-04 13:08:13]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('545', '2021-05-04 13:09:52', '2021-05-04 13:09:52', '用户[猿来入此]与[2021-05-04 13:09:52]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('546', '2021-05-04 13:13:29', '2021-05-04 13:13:29', '学生[张三]与[2021-05-04 13:13:29]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('547', '2021-05-04 13:13:29', '2021-05-04 13:13:29', '学生[张三]与[2021-05-04 13:13:29]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('548', '2021-05-04 13:13:55', '2021-05-04 13:13:55', '用户[猿来入此]与[2021-05-04 13:13:55]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('549', '2021-05-04 13:14:28', '2021-05-04 13:14:28', '编辑角色【学生】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('550', '2021-05-04 13:14:42', '2021-05-04 13:14:42', '学生[张三]与[2021-05-04 13:14:42]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('551', '2021-05-04 14:18:17', '2021-05-04 14:18:17', '学生[张三]与[2021-05-04 14:18:17]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('552', '2021-05-04 14:18:49', '2021-05-04 14:18:49', '学生[张三]与[2021-05-04 14:18:49]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('553', '2021-05-04 14:20:38', '2021-05-04 14:20:38', '学生[张三]与[2021-05-04 14:20:38]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('554', '2021-05-04 14:24:30', '2021-05-04 14:24:30', '学生[张三]与[2021-05-04 14:24:30]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('555', '2021-05-04 14:35:06', '2021-05-04 14:35:06', '学生[张三]与[2021-05-04 14:35:06]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('556', '2021-05-04 14:35:58', '2021-05-04 14:35:58', '用户[猿来入此]与[2021-05-04 14:35:58]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('557', '2021-05-04 14:36:32', '2021-05-04 14:36:32', '编辑角色【学生】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('558', '2021-05-04 14:36:50', '2021-05-04 14:36:50', '学生[张三]与[2021-05-04 14:36:50]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('559', '2021-05-04 14:37:21', '2021-05-04 14:37:21', '用户[猿来入此]与[2021-05-04 14:37:21]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('560', '2021-05-04 14:37:43', '2021-05-04 14:37:43', '编辑角色【学生】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('561', '2021-05-04 14:37:59', '2021-05-04 14:37:59', '学生[张三]与[2021-05-04 14:37:59]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('562', '2021-05-04 18:15:28', '2021-05-04 18:15:28', '学生[张三]与[2021-05-04 18:15:28]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('563', '2021-05-04 18:21:22', '2021-05-04 18:21:22', '学生[张三]与[2021-05-04 18:21:22]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('564', '2021-05-05 10:44:26', '2021-05-05 10:44:26', '学生[张三]与[2021-05-05 10:44:26]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('565', '2021-05-05 10:44:57', '2021-05-05 10:44:57', '学生[张三]与[2021-05-05 10:44:57]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('566', '2021-05-05 10:45:57', '2021-05-05 10:45:57', '用户[猿来入此]与[2021-05-05 10:45:57]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('567', '2021-05-05 10:46:14', '2021-05-05 10:46:14', '学生[张三]与[2021-05-05 10:46:14]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('568', '2021-05-09 00:50:32', '2021-05-09 00:50:32', '用户[猿来入此]与[2021-05-09 00:50:32]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('569', '2021-05-09 10:37:58', '2021-05-09 10:37:58', '用户[猿来入此]与[2021-05-09 10:37:58]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('570', '2021-05-09 10:46:38', '2021-05-09 10:46:38', '删除跑腿代购，跑腿代购ID：3', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('571', '2021-05-09 11:02:37', '2021-05-09 11:02:37', '学生[张三]与[2021-05-09 11:02:37]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('572', '2021-05-09 11:10:49', '2021-05-09 11:10:49', '用户[猿来入此]与[2021-05-09 11:10:49]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('573', '2021-05-09 11:11:17', '2021-05-09 11:11:17', '学生[张三]与[2021-05-09 11:11:17]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('574', '2021-05-11 12:08:00', '2021-05-11 12:08:00', '用户[猿来入此]与[2021-05-11 12:08:00]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('575', '2021-05-11 12:08:12', '2021-05-11 12:08:12', '学生[张三]与[2021-05-11 12:08:12]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('576', '2021-05-11 12:15:23', '2021-05-11 12:15:23', '用户[猿来入此]与[2021-05-11 12:15:23]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('577', '2021-05-11 12:16:03', '2021-05-11 12:16:03', '添加学生，学生名：懒洋洋', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('578', '2021-05-11 12:22:33', '2021-05-11 12:22:33', '学生[张三]与[2021-05-11 12:22:33]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('579', '2021-05-11 12:22:48', '2021-05-11 12:22:48', '学生[张三]与[2021-05-11 12:22:48]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('580', '2021-05-11 12:23:25', '2021-05-11 12:23:25', '学生[张三]与[2021-05-11 12:23:25]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('581', '2021-05-11 12:33:46', '2021-05-11 12:33:46', '学生[张三]与[2021-05-11 12:33:46]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('582', '2021-05-11 12:35:27', '2021-05-11 12:35:27', '学生[张三]与[2021-05-11 12:35:27]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('583', '2021-05-11 12:36:35', '2021-05-11 12:36:35', '学生[张三]与[2021-05-11 12:36:35]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('584', '2021-05-16 11:06:40', '2021-05-16 11:06:40', '用户[猿来入此]与[2021-05-16 11:06:40]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('585', '2021-05-16 11:06:50', '2021-05-16 11:06:50', '学生[张三]与[2021-05-16 11:06:50]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('586', '2021-05-16 11:07:37', '2021-05-16 11:07:37', '用户[猿来入此]与[2021-05-16 11:07:37]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('587', '2021-05-16 11:08:30', '2021-05-16 11:08:30', '学生[张三]与[2021-05-16 11:08:30]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('588', '2021-05-16 11:10:27', '2021-05-16 11:10:27', '用户[猿来入此]与[2021-05-16 11:10:27]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('589', '2021-05-16 11:11:42', '2021-05-16 11:11:42', '用户[猿来入此]与[2021-05-16 11:11:42]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('590', '2021-05-16 11:12:10', '2021-05-16 11:12:10', '学生[张三]与[2021-05-16 11:12:10]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('591', '2021-05-16 11:14:48', '2021-05-16 11:14:48', '学生[张三]与[2021-05-16 11:14:48]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('592', '2021-05-16 11:40:04', '2021-05-16 11:40:04', '学生[张三]与[2021-05-16 11:40:04]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('593', '2021-05-16 11:52:18', '2021-05-16 11:52:18', '学生[张三]与[2021-05-16 11:52:18]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('594', '2021-05-16 11:54:53', '2021-05-16 11:54:53', '学生[张三]与[2021-05-16 11:54:53]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('595', '2021-05-16 11:57:04', '2021-05-16 11:57:04', '用户[猿来入此]与[2021-05-16 11:57:04]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('596', '2021-05-18 10:42:26', '2021-05-18 10:42:26', '学生[张三]与[2021-05-18 10:42:26]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('597', '2021-05-18 10:42:33', '2021-05-18 10:42:33', '学生[张三]与[2021-05-18 10:42:33]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('598', '2021-05-18 10:42:43', '2021-05-18 10:42:43', '学生[张三]与[2021-05-18 10:42:43]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('599', '2021-05-18 10:46:26', '2021-05-18 10:46:26', '学生[张三]与[2021-05-18 10:46:25]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('600', '2021-05-18 10:46:50', '2021-05-18 10:46:50', '学生[张三]与[2021-05-18 10:46:50]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('601', '2021-05-18 10:47:27', '2021-05-18 10:47:27', '用户[猿来入此]与[2021-05-18 10:47:27]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('602', '2021-05-18 10:48:44', '2021-05-18 10:48:44', '学生[张三]与[2021-05-18 10:48:44]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('603', '2021-05-18 10:49:15', '2021-05-18 10:49:15', '学生[张三]与[2021-05-18 10:49:15]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('604', '2021-05-18 10:49:29', '2021-05-18 10:49:29', '学生[张三]与[2021-05-18 10:49:29]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('605', '2021-05-18 11:00:07', '2021-05-18 11:00:07', '学生[张三]与[2021-05-18 11:00:07]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('606', '2021-05-18 11:04:18', '2021-05-18 11:04:18', '学生[张三]与[2021-05-18 11:04:18]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('607', '2021-05-18 11:21:01', '2021-05-18 11:21:01', '学生[张三]与[2021-05-18 11:21:01]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('608', '2021-05-18 11:24:00', '2021-05-18 11:24:00', '学生[张三]与[2021-05-18 11:24:00]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('609', '2021-05-18 11:26:09', '2021-05-18 11:26:09', '学生[张三]与[2021-05-18 11:26:09]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('610', '2021-05-18 11:28:40', '2021-05-18 11:28:40', '学生[张三]与[2021-05-18 11:28:40]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('611', '2021-05-18 11:31:32', '2021-05-18 11:31:32', '学生[张三]与[2021-05-18 11:31:32]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('612', '2021-05-18 11:35:09', '2021-05-18 11:35:09', '学生[张三]与[2021-05-18 11:35:09]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('613', '2021-05-18 11:37:55', '2021-05-18 11:37:55', '学生[张三]与[2021-05-18 11:37:55]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('614', '2021-05-18 11:40:33', '2021-05-18 11:40:33', '学生[张三]与[2021-05-18 11:40:33]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('615', '2021-05-18 11:48:32', '2021-05-18 11:48:32', '学生[张三]与[2021-05-18 11:48:32]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('616', '2021-05-18 11:48:50', '2021-05-18 11:48:50', '学生[张三]与[2021-05-18 11:48:50]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('617', '2021-05-18 11:51:32', '2021-05-18 11:51:32', '学生[张三]与[2021-05-18 11:51:32]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('618', '2021-05-18 11:54:02', '2021-05-18 11:54:02', '添加跑腿代购，跑腿代购标题：取快递', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('619', '2021-05-23 11:37:19', '2021-05-23 11:37:19', '学生[张三]与[2021-05-23 11:37:19]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('620', '2021-05-23 11:37:26', '2021-05-23 11:37:26', '用户[猿来入此]与[2021-05-23 11:37:26]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('621', '2021-05-23 11:37:32', '2021-05-23 11:37:32', '学生[张三]与[2021-05-23 11:37:32]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('622', '2021-05-23 12:02:08', '2021-05-23 12:02:08', '学生[张三]与[2021-05-23 12:02:08]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('623', '2021-05-23 12:03:22', '2021-05-23 12:03:22', '添加跑腿代购，跑腿代购标题：取外卖', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('624', '2021-05-23 12:05:15', '2021-05-23 12:05:15', '添加跑腿代购，跑腿代购标题：测试', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('625', '2021-05-23 12:05:36', '2021-05-23 12:05:36', '删除跑腿代购，跑腿代购ID：6', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('626', '2021-05-23 12:05:57', '2021-05-23 12:05:57', '添加跑腿代购，跑腿代购标题：测试一波', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('627', '2021-05-23 12:06:33', '2021-05-23 12:06:33', '删除跑腿代购，跑腿代购ID：7', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('628', '2021-05-26 05:52:02', '2021-05-26 05:52:02', '学生[张三]与[2021-05-26 05:52:02]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('629', '2021-05-26 05:52:56', '2021-05-26 05:52:56', '学生[张三]与[2021-05-26 05:52:56]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('630', '2021-05-26 05:53:26', '2021-05-26 05:53:26', '学生[张三]与[2021-05-26 05:53:26]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('631', '2021-05-26 05:53:34', '2021-05-26 05:53:34', '学生[张三]与[2021-05-26 05:53:34]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('632', '2021-05-26 05:54:14', '2021-05-26 05:54:14', '学生[张三]与[2021-05-26 05:54:14]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('633', '2021-05-26 05:55:46', '2021-05-26 05:55:46', '学生[张三]与[2021-05-26 05:55:46]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('634', '2021-05-26 05:59:07', '2021-05-26 05:59:07', '学生[张三]与[2021-05-26 05:59:07]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('635', '2021-05-26 05:59:49', '2021-05-26 05:59:49', '学生[张三]与[2021-05-26 05:59:49]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('636', '2021-05-26 06:00:02', '2021-05-26 06:00:02', '用户[猿来入此]与[2021-05-26 06:00:02]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('637', '2021-05-26 06:00:30', '2021-05-26 06:00:30', '学生[张三]与[2021-05-26 06:00:30]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('638', '2021-05-26 06:01:30', '2021-05-26 06:01:30', '学生[张三]与[2021-05-26 06:01:30]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('639', '2021-05-26 06:02:36', '2021-05-26 06:02:36', '学生[张三]与[2021-05-26 06:02:36]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('640', '2021-05-26 06:02:41', '2021-05-26 06:02:41', '学生[张三]与[2021-05-26 06:02:41]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('641', '2021-05-26 06:02:52', '2021-05-26 06:02:52', '用户[猿来入此]与[2021-05-26 06:02:52]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('642', '2021-05-26 06:03:43', '2021-05-26 06:03:43', '学生[张三]与[2021-05-26 06:03:43]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('643', '2021-05-26 06:03:48', '2021-05-26 06:03:48', '学生[张三]与[2021-05-26 06:03:48]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('644', '2021-05-26 06:06:25', '2021-05-26 06:06:25', '学生[张三]与[2021-05-26 06:06:25]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('645', '2021-05-26 06:07:15', '2021-05-26 06:07:15', '学生[张三]与[2021-05-26 06:07:15]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('646', '2021-05-26 06:09:02', '2021-05-26 06:09:02', '学生[张三]与[2021-05-26 06:09:02]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('647', '2021-05-26 06:09:23', '2021-05-26 06:09:23', '学生[张三]与[2021-05-26 06:09:23]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('648', '2021-05-26 06:11:27', '2021-05-26 06:11:27', '学生[张三]与[2021-05-26 06:11:27]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('649', '2021-05-26 06:12:15', '2021-05-26 06:12:15', '学生[张三]与[2021-05-26 06:12:15]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('650', '2021-05-26 06:13:00', '2021-05-26 06:13:00', '学生[张三]与[2021-05-26 06:13:00]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('651', '2021-05-26 06:15:37', '2021-05-26 06:15:37', '学生[张三]与[2021-05-26 06:15:37]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('652', '2021-05-26 06:17:00', '2021-05-26 06:17:00', '学生[张三]与[2021-05-26 06:17:00]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('653', '2021-05-26 06:17:17', '2021-05-26 06:17:17', '学生[张三]与[2021-05-26 06:17:17]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('654', '2021-05-26 06:17:34', '2021-05-26 06:17:34', '学生[张三]与[2021-05-26 06:17:34]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('655', '2021-05-26 06:19:14', '2021-05-26 06:19:14', '学生[张三]与[2021-05-26 06:19:14]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('656', '2021-05-26 06:20:08', '2021-05-26 06:20:08', '学生[张三]与[2021-05-26 06:20:08]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('657', '2021-05-26 06:21:19', '2021-05-26 06:21:19', '学生[张三]与[2021-05-26 06:21:19]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('658', '2021-05-26 06:23:03', '2021-05-26 06:23:03', '学生[张三]与[2021-05-26 06:23:03]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('659', '2021-05-26 06:23:55', '2021-05-26 06:23:55', '学生[张三]与[2021-05-26 06:23:55]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('660', '2021-05-26 06:24:26', '2021-05-26 06:24:26', '学生[张三]与[2021-05-26 06:24:26]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('661', '2021-05-26 06:24:48', '2021-05-26 06:24:48', '学生[张三]与[2021-05-26 06:24:48]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('662', '2021-05-26 06:25:00', '2021-05-26 06:25:00', '用户[猿来入此]与[2021-05-26 06:25:00]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('663', '2021-05-26 06:25:52', '2021-05-26 06:25:52', '学生[张三]与[2021-05-26 06:25:52]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('664', '2021-05-26 06:35:53', '2021-05-26 06:35:53', '学生[张三]与[2021-05-26 06:35:53]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('665', '2021-05-26 06:36:13', '2021-05-26 06:36:13', '学生[张三]与[2021-05-26 06:36:13]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('666', '2021-05-26 06:39:01', '2021-05-26 06:39:01', '学生[张三]与[2021-05-26 06:39:01]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('667', '2021-05-26 06:40:04', '2021-05-26 06:40:04', '学生[张三]与[2021-05-26 06:40:04]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('668', '2021-05-26 06:40:52', '2021-05-26 06:40:52', '添加跑腿代购，跑腿代购标题：测试数据', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('669', '2021-05-26 06:41:35', '2021-05-26 06:41:35', '学生[张三]与[2021-05-26 06:41:35]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('670', '2021-05-26 06:41:42', '2021-05-26 06:41:42', '删除跑腿代购，跑腿代购ID：8', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('671', '2021-05-26 06:57:49', '2021-05-26 06:57:49', '学生[张三]与[2021-05-26 06:57:49]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('672', '2021-05-26 06:58:30', '2021-05-26 06:58:30', '添加订单，订单编号：o2BB5119A296B4191', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('673', '2021-05-26 07:03:23', '2021-05-26 07:03:23', '学生[张三]与[2021-05-26 07:03:23]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('674', '2021-05-26 07:03:58', '2021-05-26 07:03:58', '添加订单，订单编号：oACD78D7E63D3437C', '未知(获取登录用户失败)');
INSERT INTO `ylrc_operater_log` VALUES ('675', '2021-05-26 07:24:30', '2021-05-26 07:24:30', '学生[张三]与[2021-05-26 07:24:30]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('676', '2021-05-26 07:37:43', '2021-05-26 07:37:43', '用户[猿来入此]与[2021-05-26 07:37:43]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('677', '2021-05-26 07:38:47', '2021-05-26 07:38:47', '添加菜单信息【Menu [name=接单列表, parent=Menu [name=校园管理, parent=null, url=6, icon=el-icon-menu, sort=20, isButton=false, isShow=true], url=/admin/run_order/list, icon=el-icon-bank-card, sort=30, isButton=true, isShow=true]】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('678', '2021-05-26 07:39:18', '2021-05-26 07:39:18', '编辑菜单信息【Menu [name=接单列表, parent=Menu [name=校园管理, parent=null, url=6, icon=el-icon-menu, sort=20, isButton=false, isShow=true], url=/admin/run_order/list, icon=el-icon-bank-card, sort=34, isButton=false, isShow=true]】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('679', '2021-05-26 07:40:03', '2021-05-26 07:40:03', '添加菜单信息【Menu [name=完成, parent=Menu [name=接单列表, parent=Menu [name=校园管理, parent=null, url=6, icon=el-icon-menu, sort=20, isButton=false, isShow=true], url=/admin/run_order/list, icon=el-icon-bank-card, sort=34, isButton=false, isShow=true], url=admin/run_order/add, icon=el-icon-aim, sort=35, isButton=true, isShow=true]】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('680', '2021-05-26 07:40:45', '2021-05-26 07:40:45', '编辑角色【学生】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('681', '2021-05-26 07:40:54', '2021-05-26 07:40:54', '学生[张三]与[2021-05-26 07:40:54]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('682', '2021-05-26 07:45:02', '2021-05-26 07:45:02', '学生[张三]与[2021-05-26 07:45:02]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('683', '2021-05-26 07:58:37', '2021-05-26 07:58:37', '学生[张三]与[2021-05-26 07:58:37]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('684', '2021-05-26 08:00:50', '2021-05-26 08:00:50', '学生[张三]与[2021-05-26 08:00:50]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('685', '2021-05-26 08:33:05', '2021-05-26 08:33:05', '学生[张三]与[2021-05-26 08:33:05]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('686', '2021-05-26 12:07:50', '2021-05-26 12:07:50', '学生[张三]与[2021-05-26 12:07:50]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('687', '2021-05-26 12:13:32', '2021-05-26 12:13:32', '学生[张三]与[2021-05-26 12:13:32]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('688', '2021-05-26 12:20:59', '2021-05-26 12:20:59', '学生[张三]与[2021-05-26 12:20:59]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('689', '2021-05-26 12:40:56', '2021-05-26 12:40:56', '学生[张三]与[2021-05-26 12:40:56]登录系统', '张三');
INSERT INTO `ylrc_operater_log` VALUES ('690', '2021-05-26 12:59:45', '2021-05-26 12:59:45', '用户[猿来入此]与[2021-05-26 12:59:45]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('691', '2021-05-26 13:02:11', '2021-05-26 13:02:11', '用户[猿来入此]与[2021-05-26 13:02:11]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('692', '2021-05-26 13:02:23', '2021-05-26 13:02:23', '用户[猿来入此]与[2021-05-26 13:02:23]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('693', '2021-05-26 13:02:44', '2021-05-26 13:02:44', '编辑角色【超级管理员】', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('694', '2021-05-26 13:02:50', '2021-05-26 13:02:50', '用户[猿来入此]与[2021-05-26 13:02:50]登录系统', '猿来入此');
INSERT INTO `ylrc_operater_log` VALUES ('695', '2021-05-26 13:03:00', '2021-05-26 13:03:00', '学生[张三]与[2021-05-26 13:03:00]登录系统', '张三');

-- ----------------------------
-- Table structure for `ylrc_order_auth`
-- ----------------------------
DROP TABLE IF EXISTS `ylrc_order_auth`;
CREATE TABLE `ylrc_order_auth` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `mac` varchar(32) DEFAULT NULL,
  `order_sn` varchar(18) NOT NULL,
  `phone` varchar(12) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ylrc_order_auth
-- ----------------------------

-- ----------------------------
-- Table structure for `ylrc_recharge_record`
-- ----------------------------
DROP TABLE IF EXISTS `ylrc_recharge_record`;
CREATE TABLE `ylrc_recharge_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `money` decimal(19,2) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `student_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKg83ujyukvju7m56dshyei48ol` (`student_id`),
  CONSTRAINT `FKg83ujyukvju7m56dshyei48ol` FOREIGN KEY (`student_id`) REFERENCES `ylrc_student` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ylrc_recharge_record
-- ----------------------------
INSERT INTO `ylrc_recharge_record` VALUES ('2', '2021-05-16 11:54:59', '2021-05-16 11:54:59', '100.00', '1', '2');
INSERT INTO `ylrc_recharge_record` VALUES ('3', '2021-05-16 11:56:26', '2021-05-16 11:56:26', '200.00', '1', '2');
INSERT INTO `ylrc_recharge_record` VALUES ('4', '2021-05-18 11:49:21', '2021-05-18 11:49:21', '200.00', '1', '2');
INSERT INTO `ylrc_recharge_record` VALUES ('5', '2021-05-18 11:51:36', '2021-05-18 11:51:36', '300.00', '1', '2');
INSERT INTO `ylrc_recharge_record` VALUES ('6', '2021-05-18 11:52:55', '2021-05-18 11:52:55', '100.00', '1', '2');

-- ----------------------------
-- Table structure for `ylrc_role`
-- ----------------------------
DROP TABLE IF EXISTS `ylrc_role`;
CREATE TABLE `ylrc_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `name` varchar(18) NOT NULL,
  `remark` varchar(128) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ylrc_role
-- ----------------------------
INSERT INTO `ylrc_role` VALUES ('1', '2020-03-15 13:16:38', '2021-05-26 13:02:44', '超级管理员', '超级管理员拥有最高权限。', '1');
INSERT INTO `ylrc_role` VALUES ('2', '2020-03-15 13:18:57', '2021-03-23 12:37:02', '普通管理员', '普通管理员只有部分权限', '1');
INSERT INTO `ylrc_role` VALUES ('3', '2021-04-18 12:36:52', '2021-04-19 12:24:15', '测试', '测试', '1');
INSERT INTO `ylrc_role` VALUES ('4', '2021-04-18 12:37:29', '2021-04-18 12:37:29', '测试测试', '', '1');
INSERT INTO `ylrc_role` VALUES ('5', '2021-04-22 12:01:22', '2021-05-26 07:40:45', '学生', '', '1');

-- ----------------------------
-- Table structure for `ylrc_role_authorities`
-- ----------------------------
DROP TABLE IF EXISTS `ylrc_role_authorities`;
CREATE TABLE `ylrc_role_authorities` (
  `role_id` bigint(20) NOT NULL,
  `authorities_id` bigint(20) NOT NULL,
  KEY `FKhj7ap1o1cjrl7enr9arf5f2qp` (`authorities_id`),
  KEY `FKg3xdaexmr0x1qx8omhvjtk46d` (`role_id`),
  CONSTRAINT `FKg3xdaexmr0x1qx8omhvjtk46d` FOREIGN KEY (`role_id`) REFERENCES `ylrc_role` (`id`),
  CONSTRAINT `FKhj7ap1o1cjrl7enr9arf5f2qp` FOREIGN KEY (`authorities_id`) REFERENCES `ylrc_menu` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ylrc_role_authorities
-- ----------------------------
INSERT INTO `ylrc_role_authorities` VALUES ('4', '7');
INSERT INTO `ylrc_role_authorities` VALUES ('4', '10');
INSERT INTO `ylrc_role_authorities` VALUES ('4', '11');
INSERT INTO `ylrc_role_authorities` VALUES ('4', '12');
INSERT INTO `ylrc_role_authorities` VALUES ('3', '12');
INSERT INTO `ylrc_role_authorities` VALUES ('3', '7');
INSERT INTO `ylrc_role_authorities` VALUES ('3', '13');
INSERT INTO `ylrc_role_authorities` VALUES ('3', '14');
INSERT INTO `ylrc_role_authorities` VALUES ('3', '15');
INSERT INTO `ylrc_role_authorities` VALUES ('3', '16');
INSERT INTO `ylrc_role_authorities` VALUES ('5', '27');
INSERT INTO `ylrc_role_authorities` VALUES ('5', '32');
INSERT INTO `ylrc_role_authorities` VALUES ('5', '38');
INSERT INTO `ylrc_role_authorities` VALUES ('5', '39');
INSERT INTO `ylrc_role_authorities` VALUES ('5', '40');
INSERT INTO `ylrc_role_authorities` VALUES ('5', '37');
INSERT INTO `ylrc_role_authorities` VALUES ('5', '41');
INSERT INTO `ylrc_role_authorities` VALUES ('5', '42');
INSERT INTO `ylrc_role_authorities` VALUES ('5', '43');
INSERT INTO `ylrc_role_authorities` VALUES ('5', '45');
INSERT INTO `ylrc_role_authorities` VALUES ('5', '44');
INSERT INTO `ylrc_role_authorities` VALUES ('1', '2');
INSERT INTO `ylrc_role_authorities` VALUES ('1', '5');
INSERT INTO `ylrc_role_authorities` VALUES ('1', '8');
INSERT INTO `ylrc_role_authorities` VALUES ('1', '9');
INSERT INTO `ylrc_role_authorities` VALUES ('1', '3');
INSERT INTO `ylrc_role_authorities` VALUES ('1', '10');
INSERT INTO `ylrc_role_authorities` VALUES ('1', '11');
INSERT INTO `ylrc_role_authorities` VALUES ('1', '12');
INSERT INTO `ylrc_role_authorities` VALUES ('1', '7');
INSERT INTO `ylrc_role_authorities` VALUES ('1', '14');
INSERT INTO `ylrc_role_authorities` VALUES ('1', '15');
INSERT INTO `ylrc_role_authorities` VALUES ('1', '16');
INSERT INTO `ylrc_role_authorities` VALUES ('1', '19');
INSERT INTO `ylrc_role_authorities` VALUES ('1', '13');
INSERT INTO `ylrc_role_authorities` VALUES ('1', '21');
INSERT INTO `ylrc_role_authorities` VALUES ('1', '22');
INSERT INTO `ylrc_role_authorities` VALUES ('1', '20');
INSERT INTO `ylrc_role_authorities` VALUES ('1', '27');
INSERT INTO `ylrc_role_authorities` VALUES ('1', '29');
INSERT INTO `ylrc_role_authorities` VALUES ('1', '30');
INSERT INTO `ylrc_role_authorities` VALUES ('1', '31');
INSERT INTO `ylrc_role_authorities` VALUES ('1', '28');
INSERT INTO `ylrc_role_authorities` VALUES ('1', '33');
INSERT INTO `ylrc_role_authorities` VALUES ('1', '34');
INSERT INTO `ylrc_role_authorities` VALUES ('1', '35');
INSERT INTO `ylrc_role_authorities` VALUES ('1', '32');
INSERT INTO `ylrc_role_authorities` VALUES ('1', '41');
INSERT INTO `ylrc_role_authorities` VALUES ('1', '42');
INSERT INTO `ylrc_role_authorities` VALUES ('1', '43');

-- ----------------------------
-- Table structure for `ylrc_run_errands`
-- ----------------------------
DROP TABLE IF EXISTS `ylrc_run_errands`;
CREATE TABLE `ylrc_run_errands` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `arrival_time` datetime DEFAULT NULL,
  `commission` decimal(19,2) DEFAULT NULL,
  `mobile` varchar(16) NOT NULL,
  `persion` varchar(10) NOT NULL,
  `require_ment` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `title` varchar(11) NOT NULL,
  `type` varchar(11) DEFAULT NULL,
  `student_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKml80upuifnk9503g8crxgbqjn` (`student_id`),
  CONSTRAINT `FKml80upuifnk9503g8crxgbqjn` FOREIGN KEY (`student_id`) REFERENCES `ylrc_student` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ylrc_run_errands
-- ----------------------------
INSERT INTO `ylrc_run_errands` VALUES ('4', '2021-05-18 11:54:02', '2021-05-26 08:34:06', '2021-05-18 13:00:00', '5.00', '15518166987', '懒洋洋', '帮忙取下快递 在静三 手机号联系我！我给你说取货码', '3', '取快递', '快递', '2');
INSERT INTO `ylrc_run_errands` VALUES ('5', '2021-05-23 12:03:00', '2021-05-23 12:03:00', '2021-05-23 13:00:00', '5.00', '15518166987', '小可可', '帮忙取个外卖把帮忙取个外卖把帮忙取个外卖把帮忙取个外卖把帮忙取个外卖把帮忙取个外卖把帮忙取个外卖把', '1', '取外卖', '取外卖', '2');

-- ----------------------------
-- Table structure for `ylrc_run_order`
-- ----------------------------
DROP TABLE IF EXISTS `ylrc_run_order`;
CREATE TABLE `ylrc_run_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `order_no` varchar(128) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `runerrands_id` bigint(20) DEFAULT NULL,
  `student_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKhk2qk9dlhevpjigyp0hw991j` (`runerrands_id`),
  KEY `FK5et3hr62a8k4tvpynnirc347s` (`student_id`),
  CONSTRAINT `FK5et3hr62a8k4tvpynnirc347s` FOREIGN KEY (`student_id`) REFERENCES `ylrc_student` (`id`),
  CONSTRAINT `FKhk2qk9dlhevpjigyp0hw991j` FOREIGN KEY (`runerrands_id`) REFERENCES `ylrc_run_errands` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ylrc_run_order
-- ----------------------------
INSERT INTO `ylrc_run_order` VALUES ('1', '2021-05-26 07:03:54', '2021-05-26 08:33:50', 'oACD78D7E63D3437C', '3', '4', '2');

-- ----------------------------
-- Table structure for `ylrc_store`
-- ----------------------------
DROP TABLE IF EXISTS `ylrc_store`;
CREATE TABLE `ylrc_store` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `address` varchar(32) NOT NULL,
  `area` varchar(11) NOT NULL,
  `deposit` decimal(19,2) NOT NULL,
  `info` varchar(255) DEFAULT NULL,
  `lease_term` varchar(255) NOT NULL,
  `mobile` varchar(16) NOT NULL,
  `name` varchar(16) NOT NULL,
  `person` varchar(11) NOT NULL,
  `photo` varchar(64) DEFAULT NULL,
  `rent` decimal(19,2) NOT NULL,
  `store_status` int(11) DEFAULT NULL,
  `store_type` varchar(16) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4tufkdoq5n4csvx5c7uwmcdn` (`user_id`),
  CONSTRAINT `FK4tufkdoq5n4csvx5c7uwmcdn` FOREIGN KEY (`user_id`) REFERENCES `ylrc_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ylrc_store
-- ----------------------------
INSERT INTO `ylrc_store` VALUES ('5', '2021-04-26 12:12:55', '2021-04-26 12:12:55', '上海市松江区莲花大道妞妞便利店', '125', '10000.00', '上海市松江区莲花大道妞妞便利店上海市松江区莲花大道妞妞便利店', '一年半', '15518169687', '妞妞超市', '妞妞', '20210426/1619449924733.jpg', '5000.00', '3', '超市', '1');

-- ----------------------------
-- Table structure for `ylrc_student`
-- ----------------------------
DROP TABLE IF EXISTS `ylrc_student`;
CREATE TABLE `ylrc_student` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `card` varchar(32) NOT NULL,
  `email` varchar(32) DEFAULT NULL,
  `head_pic` varchar(128) DEFAULT NULL,
  `mobile` varchar(12) DEFAULT NULL,
  `name` varchar(18) NOT NULL,
  `password` varchar(32) NOT NULL,
  `sex` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `student_number` varchar(40) NOT NULL,
  `role_id` bigint(20) DEFAULT NULL,
  `balance` decimal(19,2) DEFAULT NULL,
  `deposit_status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_5st1ia99f0se82s3nk5896lgv` (`name`),
  KEY `FKe83orkk340l35tp3o39b4v859` (`role_id`),
  CONSTRAINT `FKe83orkk340l35tp3o39b4v859` FOREIGN KEY (`role_id`) REFERENCES `ylrc_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ylrc_student
-- ----------------------------
INSERT INTO `ylrc_student` VALUES ('2', '2021-04-22 12:19:31', '2021-05-18 11:52:55', '412723200011029030', '844891239@qq.com', '20210504/1620105532672.jpg', '15518169875', '张三', '123456', '1', '1', '1710272236', '5', '590.00', '1');
INSERT INTO `ylrc_student` VALUES ('3', '2021-05-11 12:16:03', '2021-05-11 12:16:03', '412723199802269040', '115432031@qq.com', '20210511/1620746133079.jpeg', '15518166987', '懒洋洋', '123456', '1', '1', '1710272235', '5', '0.00', '0');

-- ----------------------------
-- Table structure for `ylrc_user`
-- ----------------------------
DROP TABLE IF EXISTS `ylrc_user`;
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ylrc_user
-- ----------------------------
INSERT INTO `ylrc_user` VALUES ('1', '2020-03-18 19:18:53', '2021-05-04 13:14:06', '115432031@qq.com', '20210504/1620102786069.jpg', '15518166369', '123456', '2', '1', '猿来入此', '1');
INSERT INTO `ylrc_user` VALUES ('2', '2020-03-18 19:20:36', '2021-03-22 10:23:52', 'llq@qq.com', '20210322/1616419431358.jpeg', '13918655656', '123456', '1', '1', '测试账号', '2');
INSERT INTO `ylrc_user` VALUES ('6', '2021-03-21 02:37:38', '2021-03-21 09:27:09', '115432031@qq.com', '20210321/1616329620152.jpeg', '15518166123', '123456', '1', '1', '猿来入此t', '2');
INSERT INTO `ylrc_user` VALUES ('7', '2021-03-21 02:40:26', '2021-03-21 02:40:26', '115432031@qq.com', '', '15518166123', '123456', '1', '1', '猿来此wa', '1');
INSERT INTO `ylrc_user` VALUES ('8', '2021-04-19 12:26:52', '2021-04-19 12:30:45', '844891239@qq.com', '20210419/1618846020895.jpg', '15518166987', '123456789', '1', '1', '金库测试把', '4');
