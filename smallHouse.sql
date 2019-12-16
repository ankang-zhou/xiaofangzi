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
) ENGINE=InnoDB AUTO_INCREMENT=400 DEFAULT CHARSET=utf8;

/*Data for the table `t_address` */

insert  into `t_address`(`address_id`,`address_name`,`parent_id`) values (1,'北京市',0),(2,'天津市',0),(3,'上海市',0),(4,'重庆市',0),(5,'河北省',0),(6,'山西省',0),(7,'台湾省',0),(8,'辽宁省',0),(9,'吉林省',0),(10,'黑龙江省',0),(11,'江苏省',0),(12,'浙江省',0),(13,'安徽省',0),(14,'福建省',0),(15,'江西省',0),(16,'山东省',0),(17,'河南省',0),(18,'湖北省',0),(19,'湖南省',0),(20,'广东省',0),(21,'甘肃省',0),(22,'四川省',0),(23,'贵州省',0),(24,'海南省',0),(25,'云南省',0),(26,'青海省',0),(27,'陕西省',0),(28,'广西壮族自治区',0),(29,'西藏自治区',0),(30,'宁夏回族自治区',0),(31,'新疆维吾尔自治区',0),(32,'内蒙古自治区',0),(33,'澳门特别行政区',0),(34,'香港特别行政区',0),(35,'北京',1),(36,'上海',3),(37,'天津',2),(38,'重庆',4),(39,'辽阳市',8),(40,'大连市',8),(41,'鞍山市',8),(42,'抚顺市',8),(43,'本溪市',8),(44,'丹东市',8),(45,'锦州市',8),(46,'葫芦岛市',8),(47,'营口市',8),(48,'盘锦市',8),(49,'阜新市',8),(50,'辽阳市',8),(51,'铁岭市',8),(52,'朝阳市',8),(53,'凌源市',8),(54,'北票市',8),(55,'长春市',9),(56,'吉林市',9),(57,'四平市',9),(58,'辽源市',9),(59,'通化市',9),(60,'白山市',9),(61,'延边朝鲜族自州',9),(62,'白城市',9),(63,'松原市',9),(64,'哈尔滨市',10),(65,'齐齐哈尔市',10),(66,'鹤岗市',10),(67,'双鸭山市',10),(68,'鸡西市',10),(69,'大庆市',10),(70,'伊春市',10),(71,'牡丹江市',10),(72,'佳木斯市',10),(73,'七台河市',10),(74,'黑河市',10),(75,'绥化市',10),(76,'大兴安岭地区',10),(77,'石家庄市',5),(78,'唐山市',5),(79,'秦皇岛市',5),(80,'邯郸市',5),(81,'邢台市',5),(82,'保定市',5),(83,'张家口市',5),(84,'承德市',5),(85,'廊坊市',5),(86,'衡水市',5),(87,'沧州市',5),(88,'太原市',6),(89,'大同市',6),(90,'阳泉市',6),(91,'长治市',6),(92,'晋城市',6),(93,'朔州市',6),(94,'晋中市',6),(95,'运城市',6),(96,'忻州市',6),(97,'临汾市',6),(98,'吕梁地区',6),(99,'郑州市',17),(100,'开封市',17),(101,'洛阳市',17),(102,'平顶山市',17),(103,'焦作市',17),(104,'鹤壁市',17),(105,'新乡市',17),(106,'安阳市',17),(107,'濮阳市',17),(108,'许昌市',17),(109,'漯河市',17),(110,'三门峡市',17),(111,'南阳市',17),(112,'商丘市',17),(113,'信阳市',17),(114,'周口市',17),(115,'驻马店市',17),(116,'济源市',17),(117,'济南市',16),(118,'青岛市',16),(119,'淄博市',16),(120,'枣庄市',16),(121,'东营市',16),(122,'潍坊市',16),(123,'烟台市',16),(124,'威海市',16),(125,'济宁市',16),(126,'泰安市',16),(127,'日照市',16),(128,'莱芜市',16),(129,'临沂市',16),(130,'德州市',16),(131,'聊城市',16),(132,'滨州市',16),(133,'菏泽市',16),(134,'南京市',11),(135,'徐州市',11),(136,'连云港市',11),(137,'淮安市',11),(138,'宿迁市',11),(139,'盐城市',11),(140,'扬州市',11),(141,'泰州市',11),(142,'南通市',11),(143,'镇江市',11),(144,'常州市',11),(145,'无锡市',11),(146,'苏州市',11),(147,'银川市',30),(148,'石嘴山市',30),(149,'吴忠市',30),(150,'固原市',30),(151,'南宁市',28),(152,'柳州市',28),(153,'桂林市',28),(154,'梧州市',28),(155,'北海市',28),(156,'防城港市',28),(157,'钦州市',28),(158,'贵港市',28),(159,'玉林市',28),(160,'百色市',28),(161,'贺州市',28),(162,'河池市',28),(163,'来宾市',28),(164,'崇左市',28),(165,'乌鲁木齐市',31),(166,'克拉玛依市',31),(167,'吐鲁番地区',31),(168,'哈密地区',31),(169,'和田地区',31),(170,'阿克苏地区',31),(171,'喀什地区',31),(172,'克孜勒苏柯尔克孜自治州',31),(173,'巴音郭楞州',31),(174,'昌吉州',31),(175,'博尔塔拉州',31),(176,'伊犁哈萨克自治州',31),(177,'塔城地区',31),(178,'阿勒泰州',31),(179,'石河子市',31),(180,'阿拉尔市',31),(181,'图木舒克市',31),(182,'五家渠市',31),(183,'拉萨市',29),(184,'昌都地区',29),(185,'山南地区',29),(186,'日喀则地区',29),(187,'阿里地区',29),(188,'林芝地区',29),(189,'香港',34),(190,'澳门',33),(191,'基隆市',7),(192,'新竹市',7),(193,'台中市',7),(194,'嘉义市',7),(195,'台南市',7),(196,'宜兰县',7),(197,'台北县',7),(198,'桃园县',7),(199,'新竹县',7),(200,'苗栗县',7),(201,'台中县',7),(202,'南投县',7),(203,'彰化县',7),(204,'云林县',7),(205,'嘉义县',7),(206,'台南县',7),(207,'高雄县',7),(208,'屏东县',7),(209,'台东县',7),(210,'花莲县',7),(211,'澎湖县',7),(212,'南昌市',15),(213,'萍乡市',15),(214,'九江市',15),(215,'新余市',15),(216,'鹰潭市',15),(217,'赣州市',15),(218,'吉安市',15),(219,'宜春市',15),(220,'抚州市',15),(221,'上饶市',15),(222,'合肥市',13),(223,'芜湖市',13),(224,'蚌埠市',13),(225,'淮南市',13),(226,'马鞍山市',13),(227,'淮北市',13),(228,'铜陵市',13),(229,'安庆市',13),(230,'黄山市',13),(231,'滁州市',13),(232,'阜阳市',13),(233,'宿州市',13),(234,'巢湖市',13),(235,'六安市',13),(236,'亳州市',13),(237,'池州市',13),(238,'宣城市',13),(239,'福州市',14),(240,'厦门市',14),(241,'三明市',14),(242,'莆田市',14),(243,'泉州市',14),(244,'漳州市',14),(245,'南平市',14),(246,'龙岩市',14),(247,'宁德市',14),(248,'杭州市',12),(249,'宁波市',12),(250,'温州市',12),(251,'嘉兴市',12),(252,'绍兴市',12),(253,'金华市',12),(254,'衢州市',12),(255,'舟山市',12),(256,'台州市',12),(257,'丽水市',12),(258,'海口市',24),(259,'三亚市',24),(260,'广州市',20),(261,'深圳市',20),(262,'珠海市',20),(263,'汕头市',20),(264,'韶关市',20),(265,'惠州市',20),(266,'河源市',20),(267,'梅州市',20),(268,'汕尾市',20),(269,'东莞市',20),(270,'中山市',20),(271,'江门市',20),(272,'佛山市',20),(273,'阳江市',20),(274,'湛江市',20),(275,'茂名市',20),(276,'肇庆市',20),(277,'清远市',20),(278,'潮州市',20),(279,'揭阳市',20),(280,'云浮市',20),(281,'贵阳市',23),(282,'六盘水市',23),(283,'遵义市',23),(284,'安顺市',23),(285,'铜仁地区',23),(286,'毕节地区',23),(287,'黔西南布依族苗族自治州',23),(288,'黔东南南苗族侗族自治州',23),(289,'黔南布依族苗族自治州',23),(290,'成都市',22),(291,'自贡市',22),(292,'攀枝花市',22),(293,'泸州市',22),(294,'德阳市',22),(295,'绵阳市',22),(296,'广元市',22),(297,'遂宁市',22),(298,'内江市',22),(299,'乐山市',22),(300,'南充市',22),(301,'宜宾市',22),(302,'广安市',22),(303,'达州市',22),(304,'眉山市',22),(305,'雅安市',22),(306,'巴中市',22),(307,'资阳市',22),(308,'阿坝藏族羌族自治州',22),(309,'甘孜藏族自治州',22),(310,'凉山彝族自治州',22),(311,'丽江地区',25),(312,'文山壮族苗族自治州',25),(313,'红河哈尼族彝族自治州',25),(314,'西双版纳傣族自治州',25),(315,'楚雄彝族自治州',25),(316,'大理白族自治州',25),(317,'德宏傣族景颇族自治州',25),(318,'怒江傈僳族自治州',25),(319,'迪庆藏族自治州',25),(320,'昆明市',25),(321,'玉溪市',25),(322,'保山市',25),(323,'昭通市',25),(324,'思茅地区',25),(325,'临沧地区',25),(326,'西安市',27),(327,'铜川市',27),(328,'宝鸡市',27),(329,'咸阳市',27),(330,'渭南市',27),(331,'延安市',27),(332,'汉中市',27),(333,'榆林市',27),(334,'安康市',27),(335,'商洛市',27),(336,'荆门市',18),(337,'鄂州市',18),(338,'孝感市',18),(339,'黄冈市',18),(340,'咸宁市',18),(341,'随州市',18),(342,'恩施土家族苗族自治州',18),(343,'仙桃市',18),(344,'天门市',18),(345,'潜江市',18),(346,'神农架林区',18),(347,'武汉市',18),(348,'黄石市',18),(349,'襄樊市',18),(350,'十堰市',18),(351,'荆州市',18),(352,'宜昌市',18),(353,'长沙市',19),(354,'株洲市',19),(355,'湘潭市',19),(356,'衡阳市',19),(357,'邵阳市',19),(358,'岳阳市',19),(359,'常德市',19),(360,'张家界市',19),(361,'益阳市',19),(362,'郴州市',19),(363,'永州市',19),(364,'怀化市',19),(365,'娄底市',19),(366,'湘西土家族苗族自治州',19),(367,'西宁市',26),(368,'海东地区',26),(369,'海北藏族自治州',26),(370,'黄南藏族自治州',26),(371,'海南藏族自治州',26),(372,'洛藏族自治州',26),(373,'玉树藏族自治州',26),(374,'海西蒙古族藏族自治州',26),(375,'兰州市',21),(376,'金昌市',21),(377,'白银市',21),(378,'天水市',21),(379,'嘉峪关市',21),(380,'武威市',21),(381,'张掖市',21),(382,'平凉市',21),(383,'酒泉市',21),(384,'庆阳市',21),(385,'定西地区',21),(386,'陇南地区',21),(387,'甘南藏族自治州',21),(388,'临夏回族自治州',21),(389,'呼和浩特市',32),(390,'包头市',32),(391,'乌海市',32),(392,'赤峰市',32),(393,'鄂尔多斯市',32),(394,'呼伦贝尔市',32),(395,'乌兰察布盟',32),(396,'锡林郭勒盟',32),(397,'巴彦淖尔盟',32),(398,'阿拉善盟',32),(399,'兴安盟',32);

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
  `music_id` int(11) DEFAULT NULL COMMENT '背景音乐id',
  `theme_id` int(11) DEFAULT NULL COMMENT '背景图片id',
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
  `user_name` varchar(20) DEFAULT NULL COMMENT '用户姓名',
  `user_password` varchar(20) NOT NULL COMMENT '用户密码',
  `user_eamil` varchar(20) NOT NULL COMMENT '用户邮件',
  `user_nickName` varchar(20) NOT NULL COMMENT '用户昵称',
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
