/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 5.5.48 : Database - xiaofangzi
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`xiaofangzi` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `xiaofangzi`;

/*Table structure for table `t_address` */

DROP TABLE IF EXISTS `t_address`;

CREATE TABLE `t_address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '地址id',
  `address_name` varchar(40) DEFAULT NULL COMMENT '地址名称',
  `parent_id` int(11) NOT NULL COMMENT '父级id',
  PRIMARY KEY (`address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_address` */

/*Table structure for table `t_admin` */

DROP TABLE IF EXISTS `t_admin`;

CREATE TABLE `t_admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `admin_name` varchar(20) NOT NULL COMMENT '管理员账号',
  `password` varchar(20) NOT NULL COMMENT '管理员密码',
  `nickname` varchar(40) DEFAULT '小房子' COMMENT '管理员昵称',
  `photo` varchar(200) DEFAULT NULL COMMENT '管理员头像',
  `admin_rank` int(11) DEFAULT NULL COMMENT '管理员级别 1,2',
  `admin_state` int(11) DEFAULT NULL COMMENT '管理员状态 0:不存在 1:存在',
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `t_admin` */

insert  into `t_admin`(`admin_id`,`admin_name`,`password`,`nickname`,`photo`,`admin_rank`,`admin_state`) values (1,'admin','xiao1995','大房子','touxiang.jsp',NULL,NULL);

/*Table structure for table `t_article` */

DROP TABLE IF EXISTS `t_article`;

CREATE TABLE `t_article` (
  `article_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文章id',
  `article_title` varchar(100) NOT NULL COMMENT '文章标题',
  `article_content` text NOT NULL COMMENT '文章内容',
  `type_id` int(11) NOT NULL COMMENT '类型id',
  `admin_id` int(11) NOT NULL COMMENT '管理员id',
  `article_time` datetime NOT NULL COMMENT '发布时间',
  `article_pageview` int(11) DEFAULT '1' COMMENT '浏览人数',
  `article_like` int(11) DEFAULT '1' COMMENT '点赞',
  `article_state` int(11) DEFAULT '1' COMMENT '文章状态 0:隐藏 1:显示',
  `article_photo` varchar(100) DEFAULT NULL COMMENT '文章图片',
  PRIMARY KEY (`article_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_article` */

/*Table structure for table `t_comment` */

DROP TABLE IF EXISTS `t_comment`;

CREATE TABLE `t_comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论id',
  `comment_content` varchar(100) NOT NULL COMMENT '评论内容',
  `comment_time` datetime NOT NULL COMMENT '评论时间',
  `article_id` int(11) NOT NULL COMMENT '文章id',
  `tourist_id` int(11) DEFAULT NULL COMMENT '游客id',
  `comment_state` int(11) DEFAULT '1' COMMENT '评论状态0:删除 1:显示',
  `comment_revert` int(11) DEFAULT NULL COMMENT '回复人id',
  `comment_reply` int(11) DEFAULT NULL COMMENT '被回复人id',
  `admin_id` int(11) DEFAULT NULL COMMENT '管理员id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_comment` */

/*Table structure for table `t_head` */

DROP TABLE IF EXISTS `t_head`;

CREATE TABLE `t_head` (
  `head_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '头像id',
  `head_url` varchar(100) DEFAULT NULL COMMENT '头像路径',
  PRIMARY KEY (`head_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_head` */

/*Table structure for table `t_music` */

DROP TABLE IF EXISTS `t_music`;

CREATE TABLE `t_music` (
  `music_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '音乐id',
  `music_name` varchar(20) NOT NULL COMMENT '歌曲名',
  `music_url` varchar(40) NOT NULL COMMENT '音乐路径',
  `music_state` int(11) DEFAULT '0' COMMENT '音乐状态 0:无 1:有',
  PRIMARY KEY (`music_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_music` */

/*Table structure for table `t_theme` */

DROP TABLE IF EXISTS `t_theme`;

CREATE TABLE `t_theme` (
  `theme_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主题id',
  `theme_name` varchar(20) NOT NULL COMMENT '主题名称',
  `theme_url` varchar(50) NOT NULL COMMENT '主题图片路径',
  `theme_state` int(11) DEFAULT '0' COMMENT '主题状态 0:无 1:有',
  PRIMARY KEY (`theme_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_theme` */

/*Table structure for table `t_tourist` */

DROP TABLE IF EXISTS `t_tourist`;

CREATE TABLE `t_tourist` (
  `tourist_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '游客id',
  `tourist_nickName` varchar(20) NOT NULL COMMENT '游客昵称',
  `tourist_email` varchar(20) DEFAULT NULL COMMENT '游客邮箱',
  `head_id` varchar(40) NOT NULL COMMENT '头像id',
  PRIMARY KEY (`tourist_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_tourist` */

/*Table structure for table `t_type` */

DROP TABLE IF EXISTS `t_type`;

CREATE TABLE `t_type` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '类型id',
  `type_name` varchar(20) DEFAULT NULL COMMENT '类型名称',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_type` */

/*Table structure for table `t_user` */

DROP TABLE IF EXISTS `t_user`;

CREATE TABLE `t_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `user_name` varchar(20) NOT NULL COMMENT '用户姓名',
  `user_password` varchar(20) NOT NULL COMMENT '用户密码',
  `user_eamil` varchar(20) DEFAULT NULL COMMENT '用户邮件',
  `user_nickName` varchar(20) DEFAULT NULL COMMENT '用户昵称',
  `user_age` int(11) DEFAULT NULL COMMENT '用户年龄',
  `user_sex` int(11) DEFAULT NULL COMMENT '用户性别',
  `user_head` varchar(100) DEFAULT NULL COMMENT '用户头像',
  `user_vip` int(11) DEFAULT '0' COMMENT '用户会员 0:无 1:有',
  `user_state` int(11) DEFAULT '1' COMMENT '用户状态 1:存在0:不存在',
  `user_address` varchar(50) DEFAULT NULL COMMENT '用户地址',
  `user_profession` varchar(20) DEFAULT NULL COMMENT '用户职业',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_user` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
