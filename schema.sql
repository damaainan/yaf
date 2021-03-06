-- --------------------------------------------------------
-- Host:                         wess
-- Server version:               5.1.73-log - Source distribution
-- Server OS:                    redhat-linux-gnu
-- HeidiSQL Version:             8.3.0.4694
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for shop
CREATE DATABASE IF NOT EXISTS `shop` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `shop`;


-- Dumping structure for table shop.shop_admin
CREATE TABLE IF NOT EXISTS `shop_admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(16) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(40) NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `is_del` bit(1) DEFAULT NULL,
  PRIMARY KEY (`admin_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- Dumping data for table shop.shop_admin: 5 rows
/*!40000 ALTER TABLE `shop_admin` DISABLE KEYS */;
INSERT INTO `shop_admin` (`admin_id`, `username`, `email`, `password`, `create_time`, `is_del`) VALUES
	(1, 'yantze', 'yantze@126.com', 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', '2014-05-19 21:21:54', b'0'),
	(7, 'admin', 'yantze@111.com', 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', '2014-05-24 03:21:18', b'1'),
	(8, 'yangzhi', '123456789', 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', '2014-05-24 03:30:58', b'0'),
	(10, '杨志', '123', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '2014-05-26 11:10:02', b'0'),
	(11, 'demo', 'demo@db.com', '89e495e7941cf9e40e6980d14a16bf023ccd4c91', '2014-05-28 00:50:52', b'0');
/*!40000 ALTER TABLE `shop_admin` ENABLE KEYS */;


-- Dumping structure for table shop.shop_category
CREATE TABLE IF NOT EXISTS `shop_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `cate_name` varchar(45) NOT NULL,
  `parent_id` varchar(45) NOT NULL,
  `category_layer` int(6) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Dumping data for table shop.shop_category: ~6 rows (approximately)
/*!40000 ALTER TABLE `shop_category` DISABLE KEYS */;
INSERT INTO `shop_category` (`category_id`, `cate_name`, `parent_id`, `category_layer`) VALUES
	(1, '休闲零食', '0', 000100),
	(2, '坚果炒货', '1', 000101),
	(3, '肉干肉脯', '1', 000102),
	(4, '开心零食', '0', 000200),
	(5, '糖果巧克力', '4', 000201),
	(6, '饼干蛋糕', '4', 000202);
/*!40000 ALTER TABLE `shop_category` ENABLE KEYS */;


-- Dumping structure for table shop.shop_fav
CREATE TABLE IF NOT EXISTS `shop_fav` (
  `fav_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_uuid` varchar(36) NOT NULL,
  `product_uuid` varchar(36) NOT NULL,
  `fav_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `comment` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`fav_id`),
  UNIQUE KEY `fav_id_UNIQUE` (`fav_id`),
  KEY `user_uuid_idx` (`user_uuid`),
  CONSTRAINT `fk_fav_user_uuid` FOREIGN KEY (`user_uuid`) REFERENCES `shop_user` (`user_uuid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;

-- Dumping data for table shop.shop_fav: ~11 rows (approximately)
/*!40000 ALTER TABLE `shop_fav` DISABLE KEYS */;
INSERT INTO `shop_fav` (`fav_id`, `user_uuid`, `product_uuid`, `fav_time`, `comment`) VALUES
	(79, '62EDF0BA-3060-4D89-3010-0CD37F2EC6B8', 'A85ED768-D9CE-6DEB-913E-B8D84F29F4BA', '2015-02-11 17:16:33', NULL),
	(81, '62EDF0BA-3060-4D89-3010-0CD37F2EC6B8', '2714EA2A-49B8-A04C-672B-1E0EEF71E995', '2015-02-11 17:16:35', NULL),
	(83, '62EDF0BA-3060-4D89-3010-0CD37F2EC6B8', 'F6449A13-AAE2-E61E-C3C7-C1BA2CC24373', '2015-02-11 17:16:38', NULL),
	(85, '62EDF0BA-3060-4D89-3010-0CD37F2EC6B8', 'A85ED768-D9CE-6DEB-913E-B8D84F29F4BA', '2015-02-11 17:16:40', NULL),
	(87, '62EDF0BA-3060-4D89-3010-0CD37F2EC6B8', '2714EA2A-49B8-A04C-672B-1E0EEF71E995', '2015-02-11 17:16:42', NULL),
	(89, '62EDF0BA-3060-4D89-3010-0CD37F2EC6B8', 'F6449A13-AAE2-E61E-C3C7-C1BA2CC24373', '2015-02-11 17:16:44', NULL),
	(91, '62EDF0BA-3060-4D89-3010-0CD37F2EC6B8', 'F6449A13-AAE2-E61E-C3C7-C1BA2CC24373', '2015-02-11 17:16:46', NULL),
	(93, '62EDF0BA-3060-4D89-3010-0CD37F2EC6B8', 'AAD46A77-3A61-E498-7311-38C7103F8A2C', '2015-02-11 17:16:50', NULL),
	(95, '62EDF0BA-3060-4D89-3010-0CD37F2EC6B8', '31E2921D-5C2F-482B-3373-BBFDD615BFD9', '2015-02-11 17:16:53', NULL),
	(97, '62EDF0BA-3060-4D89-3010-0CD37F2EC6B8', '71CAF7BA-76AE-C4A4-F29D-B31E0C19BC1C', '2015-02-11 17:16:55', NULL),
	(99, '62EDF0BA-3060-4D89-3010-0CD37F2EC6B8', '9ADB0846-BD35-25DF-28BC-B65FD1254DDE', '2015-02-11 17:16:58', NULL);
/*!40000 ALTER TABLE `shop_fav` ENABLE KEYS */;


-- Dumping structure for table shop.shop_group_privilege
CREATE TABLE IF NOT EXISTS `shop_group_privilege` (
  `privilege_id` int(11) NOT NULL,
  `privilege_name` varchar(50) NOT NULL,
  `privilege_desc` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='分组权限';

-- Dumping data for table shop.shop_group_privilege: 0 rows
/*!40000 ALTER TABLE `shop_group_privilege` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_group_privilege` ENABLE KEYS */;


-- Dumping structure for table shop.shop_history
CREATE TABLE IF NOT EXISTS `shop_history` (
  `history_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_uuid` varchar(36) NOT NULL,
  `product_uuid` varchar(36) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`history_id`),
  UNIQUE KEY `history_id_UNIQUE` (`history_id`),
  KEY `user_uuid_idx` (`user_uuid`),
  CONSTRAINT `fk_history_user_uuid` FOREIGN KEY (`user_uuid`) REFERENCES `shop_user` (`user_uuid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table shop.shop_history: ~0 rows (approximately)
/*!40000 ALTER TABLE `shop_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_history` ENABLE KEYS */;


-- Dumping structure for table shop.shop_option
CREATE TABLE IF NOT EXISTS `shop_option` (
  `option_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `value` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`option_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table shop.shop_option: ~2 rows (approximately)
/*!40000 ALTER TABLE `shop_option` DISABLE KEYS */;
INSERT INTO `shop_option` (`option_id`, `name`, `value`) VALUES
	(1, 'sitename', '零食大王'),
	(2, 'sitedesc', '我们的零食很好吃');
/*!40000 ALTER TABLE `shop_option` ENABLE KEYS */;


-- Dumping structure for table shop.shop_order
CREATE TABLE IF NOT EXISTS `shop_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_uuid` varchar(36) NOT NULL,
  `product_uuid` varchar(36) NOT NULL,
  `reg_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `order_serial` varchar(50) NOT NULL,
  `amount` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`),
  KEY `product_uuid_idx` (`product_uuid`),
  KEY `user_uuid_idx` (`user_uuid`),
  CONSTRAINT `fk_order_product_uuid` FOREIGN KEY (`product_uuid`) REFERENCES `shop_product` (`product_uuid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_user_uuid` FOREIGN KEY (`user_uuid`) REFERENCES `shop_user` (`user_uuid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=178 DEFAULT CHARSET=utf8;

-- Dumping data for table shop.shop_order: ~75 rows (approximately)
/*!40000 ALTER TABLE `shop_order` DISABLE KEYS */;
INSERT INTO `shop_order` (`order_id`, `user_uuid`, `product_uuid`, `reg_time`, `order_serial`, `amount`) VALUES
	(49, '62EDF0BA-3060-4D89-3010-0CD37F2EC6B8', '3DB4D533-DB32-2D26-858A-7D0B3184ED34', '2014-06-12 08:02:17', '14025127759820347', 0),
	(54, '62EDF0BA-3060-4D89-3010-0CD37F2EC6B8', '017D1BF7-0AD9-6850-C01F-B095E96A5E00', '2014-06-12 08:25:27', '14025127759820347', 0),
	(55, '62EDF0BA-3060-4D89-3010-0CD37F2EC6B8', '017D1BF7-0AD9-6850-C01F-B095E96A5E00', '2014-06-12 11:56:03', '14025453529813332', 0),
	(56, '62EDF0BA-3060-4D89-3010-0CD37F2EC6B8', '3DB4D533-DB32-2D26-858A-7D0B3184ED34', '2014-06-12 11:56:20', '14025453529813332', 0),
	(57, '62EDF0BA-3060-4D89-3010-0CD37F2EC6B8', '017D1BF7-0AD9-6850-C01F-B095E96A5E00', '2014-06-12 11:57:04', '14025453529813332', 0),
	(58, '62EDF0BA-3060-4D89-3010-0CD37F2EC6B8', '017D1BF7-0AD9-6850-C01F-B095E96A5E00', '2014-06-12 12:12:25', '14025454479846145', 0),
	(59, '62EDF0BA-3060-4D89-3010-0CD37F2EC6B8', '017D1BF7-0AD9-6850-C01F-B095E96A5E00', '2014-06-13 08:54:50', '14026208849818339', 0),
	(60, '62EDF0BA-3060-4D89-3010-0CD37F2EC6B8', '017D1BF7-0AD9-6850-C01F-B095E96A5E00', '2014-06-13 08:54:58', '14026208849818339', 0),
	(61, '62EDF0BA-3060-4D89-3010-0CD37F2EC6B8', '017D1BF7-0AD9-6850-C01F-B095E96A5E00', '2014-06-13 08:55:10', '14026208849818339', 0),
	(62, '62EDF0BA-3060-4D89-3010-0CD37F2EC6B8', '017D1BF7-0AD9-6850-C01F-B095E96A5E00', '2014-06-18 15:59:06', '14030783419844205', 0),
	(63, '62EDF0BA-3060-4D89-3010-0CD37F2EC6B8', '017D1BF7-0AD9-6850-C01F-B095E96A5E00', '2014-06-19 11:05:09', '14031459979840931', 0),
	(64, '62EDF0BA-3060-4D89-3010-0CD37F2EC6B8', '017D1BF7-0AD9-6850-C01F-B095E96A5E00', '2014-06-19 11:06:27', '14031459979840931', 0),
	(65, '62EDF0BA-3060-4D89-3010-0CD37F2EC6B8', '017D1BF7-0AD9-6850-C01F-B095E96A5E00', '2014-06-19 11:08:04', '14031459979840931', 0),
	(66, '62EDF0BA-3060-4D89-3010-0CD37F2EC6B8', '77989D34-084E-F85C-06B1-58BE5B043372', '2014-06-19 11:08:26', '14031459979840931', 0),
	(67, '62EDF0BA-3060-4D89-3010-0CD37F2EC6B8', '77989D34-084E-F85C-06B1-58BE5B043372', '2014-06-19 11:08:43', '14031459979840931', 0),
	(68, '62EDF0BA-3060-4D89-3010-0CD37F2EC6B8', '017D1BF7-0AD9-6850-C01F-B095E96A5E00', '2014-06-19 11:10:11', '14031459979840931', 0),
	(75, '62EDF0BA-3060-4D89-3010-0CD37F2EC6B8', '12163A7E-0C61-6E11-567B-18971683E15C', '2014-06-20 19:47:07', '14032579579882069', 0),
	(78, '62EDF0BA-3060-4D89-3010-0CD37F2EC6B8', '3DB4D533-DB32-2D26-858A-7D0B3184ED34', '2014-06-20 22:04:58', '14032652609850583', 0),
	(79, '62EDF0BA-3060-4D89-3010-0CD37F2EC6B8', '8B1B27FA-B232-9705-2DAA-B8C82A7E0945', '2014-06-21 09:27:32', '14033140509844562', 0),
	(80, '62EDF0BA-3060-4D89-3010-0CD37F2EC6B8', '8B1B27FA-B232-9705-2DAA-B8C82A7E0945', '2014-06-21 09:27:56', '14033140509844562', 0),
	(81, '62EDF0BA-3060-4D89-3010-0CD37F2EC6B8', 'FC44E720-4A4F-5425-F059-3859924D2A52', '2014-06-21 09:28:19', '14033140509844562', 0),
	(83, '62EDF0BA-3060-4D89-3010-0CD37F2EC6B8', 'FC44E720-4A4F-5425-F059-3859924D2A52', '2014-06-21 09:29:35', '14033141349823358', 0),
	(84, '62EDF0BA-3060-4D89-3010-0CD37F2EC6B8', '64CDD23D-FF1B-DB3C-685E-2F473A366E17', '2014-06-21 09:29:41', '14033141349823358', 0),
	(86, '62EDF0BA-3060-4D89-3010-0CD37F2EC6B8', 'FC44E720-4A4F-5425-F059-3859924D2A52', '2014-06-21 14:46:42', '14033314509824221', 0),
	(87, '62EDF0BA-3060-4D89-3010-0CD37F2EC6B8', 'D5E1060E-88FE-0C4C-E849-9CE001F5CF13', '2014-06-21 14:46:45', '14033314509824221', 0),
	(89, '62EDF0BA-3060-4D89-3010-0CD37F2EC6B8', 'D5E1060E-88FE-0C4C-E849-9CE001F5CF13', '2014-06-21 14:50:14', '14033334139876409', 0),
	(90, '62EDF0BA-3060-4D89-3010-0CD37F2EC6B8', 'D5E1060E-88FE-0C4C-E849-9CE001F5CF13', '2014-06-21 14:50:35', '14033334139876409', 0),
	(92, '62EDF0BA-3060-4D89-3010-0CD37F2EC6B8', 'D5E1060E-88FE-0C4C-E849-9CE001F5CF13', '2014-06-22 00:39:54', '14033687819822943', 0),
	(96, '62EDF0BA-3060-4D89-3010-0CD37F2EC6B8', 'D5E1060E-88FE-0C4C-E849-9CE001F5CF13', '2014-06-24 05:24:59', '14035585389818116', 0),
	(97, '62EDF0BA-3060-4D89-3010-0CD37F2EC6B8', 'D5E1060E-88FE-0C4C-E849-9CE001F5CF13', '2014-06-24 05:28:01', '14035585389818116', 0),
	(98, '62EDF0BA-3060-4D89-3010-0CD37F2EC6B8', 'FC44E720-4A4F-5425-F059-3859924D2A52', '2014-06-24 05:32:54', '14035591749885652', 0),
	(99, '62EDF0BA-3060-4D89-3010-0CD37F2EC6B8', 'FC44E720-4A4F-5425-F059-3859924D2A52', '2014-06-24 05:33:01', '14035591749885652', 0),
	(100, '62EDF0BA-3060-4D89-3010-0CD37F2EC6B8', 'FC44E720-4A4F-5425-F059-3859924D2A52', '2014-06-24 05:33:02', '14035591749885652', 0),
	(101, '62EDF0BA-3060-4D89-3010-0CD37F2EC6B8', 'FC44E720-4A4F-5425-F059-3859924D2A52', '2014-06-24 05:33:03', '14035591749885652', 0),
	(102, '62EDF0BA-3060-4D89-3010-0CD37F2EC6B8', 'FC44E720-4A4F-5425-F059-3859924D2A52', '2014-06-24 05:33:07', '14035591869895513', 0),
	(106, '62EDF0BA-3060-4D89-3010-0CD37F2EC6B8', 'FC44E720-4A4F-5425-F059-3859924D2A52', '2014-06-24 13:54:30', '14035884649866161', 0),
	(107, '62EDF0BA-3060-4D89-3010-0CD37F2EC6B8', '8B1B27FA-B232-9705-2DAA-B8C82A7E0945', '2014-06-24 16:39:45', '14035987299866432', 0),
	(109, '62EDF0BA-3060-4D89-3010-0CD37F2EC6B8', '313185E2-B881-078A-D00D-76B0D2C6EAFD', '2014-06-24 19:10:49', '14036082499895521', 0),
	(110, '62EDF0BA-3060-4D89-3010-0CD37F2EC6B8', '313185E2-B881-078A-D00D-76B0D2C6EAFD', '2014-06-24 19:11:09', '14036082619834623', 0),
	(111, '62EDF0BA-3060-4D89-3010-0CD37F2EC6B8', 'FC44E720-4A4F-5425-F059-3859924D2A52', '2014-06-24 22:43:04', '14036082619834623', 0),
	(112, '62EDF0BA-3060-4D89-3010-0CD37F2EC6B8', 'F866E83B-DE55-D28F-9055-1D7EDD425E75', '2014-06-24 22:43:27', '14036209909822821', 0),
	(114, '62EDF0BA-3060-4D89-3010-0CD37F2EC6B8', '8B1B27FA-B232-9705-2DAA-B8C82A7E0945', '2014-06-25 13:11:04', '14036730609855062', 0),
	(115, '62EDF0BA-3060-4D89-3010-0CD37F2EC6B8', '8B1B27FA-B232-9705-2DAA-B8C82A7E0945', '2014-06-25 13:11:09', '14036730679822664', 0),
	(116, '62EDF0BA-3060-4D89-3010-0CD37F2EC6B8', 'FC44E720-4A4F-5425-F059-3859924D2A52', '2014-06-25 21:54:57', '14037044379864636', 0),
	(117, '62EDF0BA-3060-4D89-3010-0CD37F2EC6B8', '313185E2-B881-078A-D00D-76B0D2C6EAFD', '2014-06-26 08:50:46', '14037438099866570', 0),
	(119, '62EDF0BA-3060-4D89-3010-0CD37F2EC6B8', '8B1B27FA-B232-9705-2DAA-B8C82A7E0945', '2014-06-26 13:58:09', '14037622899847120', 0),
	(120, '62EDF0BA-3060-4D89-3010-0CD37F2EC6B8', '8B1B27FA-B232-9705-2DAA-B8C82A7E0945', '2014-06-26 13:58:16', '14037622949817298', 0),
	(121, '62EDF0BA-3060-4D89-3010-0CD37F2EC6B8', '768C15EF-19E0-2323-7616-9A42300611AB', '2014-06-26 13:58:27', '14037622949817298', 0),
	(122, '62EDF0BA-3060-4D89-3010-0CD37F2EC6B8', '8B1B27FA-B232-9705-2DAA-B8C82A7E0945', '2014-08-08 11:08:05', '14074672439826737', 0),
	(123, '62EDF0BA-3060-4D89-3010-0CD37F2EC6B8', '9DC48BCB-7C54-7DF1-941B-473D8B1C13C6', '2014-08-08 11:08:22', '14074672439826737', 0),
	(124, '62EDF0BA-3060-4D89-3010-0CD37F2EC6B8', 'C35F6327-3A04-3620-A211-519708E46F16', '2014-08-08 11:08:30', '14074672439826737', 0),
	(125, '62EDF0BA-3060-4D89-3010-0CD37F2EC6B8', 'FC44E720-4A4F-5425-F059-3859924D2A52', '2014-11-17 07:47:58', '14161816789810266', 0),
	(133, '62EDF0BA-3060-4D89-3010-0CD37F2EC6B8', 'FC44E720-4A4F-5425-F059-3859924D2A52', '2014-11-17 07:51:49', '14161816899833090', 0),
	(135, '62EDF0BA-3060-4D89-3010-0CD37F2EC6B8', 'FC44E720-4A4F-5425-F059-3859924D2A52', '2014-11-17 07:52:44', '14161816899833090', 0),
	(137, '62EDF0BA-3060-4D89-3010-0CD37F2EC6B8', 'FC44E720-4A4F-5425-F059-3859924D2A52', '2014-11-17 07:53:56', '14161816899833090', 0),
	(139, '62EDF0BA-3060-4D89-3010-0CD37F2EC6B8', '8B1B27FA-B232-9705-2DAA-B8C82A7E0945', '2014-11-17 07:56:57', '14161816899833090', 0),
	(141, '62EDF0BA-3060-4D89-3010-0CD37F2EC6B8', '768C15EF-19E0-2323-7616-9A42300611AB', '2014-11-17 08:31:02', '14161816899833090', 0),
	(143, '62EDF0BA-3060-4D89-3010-0CD37F2EC6B8', '8B1B27FA-B232-9705-2DAA-B8C82A7E0945', '2014-11-17 08:42:00', '14161816899833090', 0),
	(145, '62EDF0BA-3060-4D89-3010-0CD37F2EC6B8', '8B1B27FA-B232-9705-2DAA-B8C82A7E0945', '2014-11-17 08:43:47', '14161850279875068', 0),
	(147, '62EDF0BA-3060-4D89-3010-0CD37F2EC6B8', '8B1B27FA-B232-9705-2DAA-B8C82A7E0945', '2014-11-17 08:43:50', '14161850279875068', 0),
	(149, '62EDF0BA-3060-4D89-3010-0CD37F2EC6B8', '8B1B27FA-B232-9705-2DAA-B8C82A7E0945', '2014-11-17 08:44:00', '14161850279875068', 0),
	(151, '62EDF0BA-3060-4D89-3010-0CD37F2EC6B8', '8B1B27FA-B232-9705-2DAA-B8C82A7E0945', '2014-11-17 08:44:09', '14161850279875068', 0),
	(153, '62EDF0BA-3060-4D89-3010-0CD37F2EC6B8', '8B1B27FA-B232-9705-2DAA-B8C82A7E0945', '2014-11-17 08:44:13', '14161850279875068', 0),
	(155, '62EDF0BA-3060-4D89-3010-0CD37F2EC6B8', '8B1B27FA-B232-9705-2DAA-B8C82A7E0945', '2014-11-17 08:44:17', '14161850279875068', 0),
	(157, '62EDF0BA-3060-4D89-3010-0CD37F2EC6B8', '8B1B27FA-B232-9705-2DAA-B8C82A7E0945', '2014-11-17 08:44:36', '14161850279875068', 0),
	(159, '62EDF0BA-3060-4D89-3010-0CD37F2EC6B8', '8B1B27FA-B232-9705-2DAA-B8C82A7E0945', '2014-11-17 08:46:38', '14161850279875068', 0),
	(161, '62EDF0BA-3060-4D89-3010-0CD37F2EC6B8', '8B1B27FA-B232-9705-2DAA-B8C82A7E0945', '2014-11-17 08:47:02', '14161850279875068', 0),
	(163, '62EDF0BA-3060-4D89-3010-0CD37F2EC6B8', '8B1B27FA-B232-9705-2DAA-B8C82A7E0945', '2014-11-17 08:50:43', '14161850279875068', 0),
	(165, '62EDF0BA-3060-4D89-3010-0CD37F2EC6B8', 'AAD46A77-3A61-E498-7311-38C7103F8A2C', '2015-02-11 14:15:43', '14236353439890980', 0),
	(167, '62EDF0BA-3060-4D89-3010-0CD37F2EC6B8', '8B1B27FA-B232-9705-2DAA-B8C82A7E0945', '2015-02-11 16:16:11', '14236425719823705', 0),
	(169, '62EDF0BA-3060-4D89-3010-0CD37F2EC6B8', 'FC44E720-4A4F-5425-F059-3859924D2A52', '2015-02-11 16:28:46', '14236353519879007', 0),
	(171, '62EDF0BA-3060-4D89-3010-0CD37F2EC6B8', '58930FBD-382E-D723-5B9F-E88A2F31C5C6', '2015-02-11 16:28:52', '14236353519879007', 0),
	(173, '62EDF0BA-3060-4D89-3010-0CD37F2EC6B8', 'A85ED768-D9CE-6DEB-913E-B8D84F29F4BA', '2015-02-11 17:18:48', '14236353519879007', 0),
	(175, '62EDF0BA-3060-4D89-3010-0CD37F2EC6B8', '2714EA2A-49B8-A04C-672B-1E0EEF71E995', '2015-02-11 17:18:54', '14236353519879007', 0),
	(177, '62EDF0BA-3060-4D89-3010-0CD37F2EC6B8', '8B1B27FA-B232-9705-2DAA-B8C82A7E0945', '2015-02-11 18:10:58', '14236494589865569', 0);
/*!40000 ALTER TABLE `shop_order` ENABLE KEYS */;


-- Dumping structure for table shop.shop_order_status
CREATE TABLE IF NOT EXISTS `shop_order_status` (
  `order_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_serial` varchar(50) NOT NULL,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY (`order_status_id`),
  UNIQUE KEY `order_serial` (`order_serial`),
  KEY `order_status_order_id_idx` (`order_serial`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- Dumping data for table shop.shop_order_status: ~21 rows (approximately)
/*!40000 ALTER TABLE `shop_order_status` DISABLE KEYS */;
INSERT INTO `shop_order_status` (`order_status_id`, `order_serial`, `status`) VALUES
	(4, '14025127759820347', '已成功送到'),
	(7, '14025349519894410', '已成功送到'),
	(8, '14025349529884275', '已成功送到'),
	(9, '14025453529813332', '已成功送到'),
	(10, '14025454479846145', '已成功送到'),
	(11, '14032579579882069', '已成功送到'),
	(12, '14033140509844562', '已成功送到'),
	(13, '14033314509824221', '已成功送到'),
	(14, '14033332109869326', '已成功送到'),
	(15, '14035219399873587', '已成功送到'),
	(16, '14035591749885652', '已成功送到'),
	(17, '14035987299866432', '已成功送到'),
	(18, '14036082499895521', '已成功送到'),
	(19, '14036082619834623', '已成功送到'),
	(20, '14036719949855512', '已成功送到'),
	(21, '14036730609855062', '已成功送到'),
	(22, '14037438099866570', '已成功送到'),
	(23, '14037622899847120', '已成功送到'),
	(24, '14074672439826737', '已成功送到'),
	(25, '14161816789810266', '已成功送到'),
	(27, '14236353439890980', '已成功送到');
/*!40000 ALTER TABLE `shop_order_status` ENABLE KEYS */;


-- Dumping structure for table shop.shop_product
CREATE TABLE IF NOT EXISTS `shop_product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_uuid` varchar(36) NOT NULL,
  `product_name` varchar(45) NOT NULL,
  `reg_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `money` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `money_type` varchar(10) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `is_del` bit(1) NOT NULL,
  PRIMARY KEY (`product_id`),
  KEY `product_uuid_index` (`product_uuid`),
  KEY `pk_category_id` (`category_id`),
  CONSTRAINT `fk_category_id` FOREIGN KEY (`category_id`) REFERENCES `shop_category` (`category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- Dumping data for table shop.shop_product: ~23 rows (approximately)
/*!40000 ALTER TABLE `shop_product` DISABLE KEYS */;
INSERT INTO `shop_product` (`product_id`, `product_uuid`, `product_name`, `reg_time`, `money`, `amount`, `money_type`, `category_id`, `is_del`) VALUES
	(1, '12163A7E-0C61-6E11-567B-18971683E15C', 'yang', '2014-06-20 23:01:01', 123456, 91, 'RMB', 2, b'1'),
	(14, '017D1BF7-0AD9-6850-C01F-B095E96A5E00', 'yan', '2014-06-20 23:01:11', 45, 1234, 'RMB', 2, b'1'),
	(15, '77989D34-084E-F85C-06B1-58BE5B043372', '糖', '2014-06-20 23:01:20', 8, 8, 'RMB', 1, b'1'),
	(16, '3DB4D533-DB32-2D26-858A-7D0B3184ED34', '杨志', '2014-06-20 23:01:29', 1, 1, 'Doller', 3, b'1'),
	(17, '8B1B27FA-B232-9705-2DAA-B8C82A7E0945', '哙哙旗舰店 吉利火星即食桶装爆米花60g*16桶 组合装', '2014-06-20 22:26:28', 96, 1, 'rmb', 1, b'0'),
	(18, 'FC44E720-4A4F-5425-F059-3859924D2A52', '益达木糖醇无糖口香糖清爽草莓味40粒瓶装56g', '2014-06-20 22:29:17', 11, 1, 'rmb', 1, b'0'),
	(19, 'D5E1060E-88FE-0C4C-E849-9CE001F5CF13', '哙哙旗舰店 裕源乐合琥珀核桃仁100克*3罐优惠装', '2014-06-20 22:29:58', 40, 1, 'rmb', 2, b'0'),
	(20, '58930FBD-382E-D723-5B9F-E88A2F31C5C6', '黄飞红麻辣花生210g', '2014-06-20 22:31:08', 9, 1, 'rmb', 2, b'0'),
	(21, '64CDD23D-FF1B-DB3C-685E-2F473A366E17', '加州原野美国开心果100g(新老包装随机发放）', '2014-06-20 22:31:35', 10, 1, 'rmb', 2, b'0'),
	(22, '9DC48BCB-7C54-7DF1-941B-473D8B1C13C6', '福建特产 友臣 金丝肉松饼208g', '2014-06-20 23:07:14', 10, 1, 'rmb', 6, b'0'),
	(23, '1D16EB77-85FC-D5D2-C6A8-B0F64C67A4D0', '好丽友提拉米苏12枚276g', '2014-06-20 23:07:17', 20, 1, 'rmb', 6, b'0'),
	(24, 'F866E83B-DE55-D28F-9055-1D7EDD425E75', '蜜兰诺 松塔 12粒装 192克（新老包装随机发送） 盒装', '2014-06-20 23:07:19', 17, 1, 'rmb', 6, b'0'),
	(25, '768C15EF-19E0-2323-7616-9A42300611AB', '猴姑酥性饼干720g(30包)15天装 胃不好猴姑饼干', '2014-06-20 23:07:22', 99, 1, 'rmb', 6, b'0'),
	(26, 'AAD46A77-3A61-E498-7311-38C7103F8A2C', '嘉士柏牛轧糖500g台湾特产手工花生牛轧糖 竹盐 芝麻牛扎糖 花生口味', '2014-06-20 23:08:09', 18, 1, 'rmb', 5, b'0'),
	(27, '31E2921D-5C2F-482B-3373-BBFDD615BFD9', '麦德好燕麦巧克力 麦德好正宗营养麦片巧克力糖1000g', '2014-06-20 23:08:22', 33, 1, 'rmb', 5, b'0'),
	(28, '71CAF7BA-76AE-C4A4-F29D-B31E0C19BC1C', '费列罗Ferrero进口巧克力DIY心形礼盒27粒【顺丰-代写卡】', '2014-06-20 23:08:37', 108, 1, 'rmb', 5, b'0'),
	(29, '9ADB0846-BD35-25DF-28BC-B65FD1254DDE', '加拿大进口费列罗（FerreroRocher）榛果威化金莎巧克力T48粒钻石装礼盒600g', '2014-06-20 23:08:55', 138, 1, 'rmb', 5, b'0'),
	(30, 'A85ED768-D9CE-6DEB-913E-B8D84F29F4BA', '良品铺子 麻辣灯影牛肉丝250g*2包 四川特产牛肉干 牛肉丝', '2014-06-20 23:11:43', 56, 1, 'rmb', 3, b'0'),
	(31, 'E089B39E-FF7E-E736-DFE3-4B258F15CC7A', '重庆特产 有友泡凤爪山椒味100g*5袋', '2015-02-11 16:03:13', 20, 1, 'rmb', 3, b'1'),
	(32, '2714EA2A-49B8-A04C-672B-1E0EEF71E995', '武汉特产 周黑鸭鸭脖210g', '2014-06-20 23:18:22', 30, 1, 'rmb', 3, b'0'),
	(33, 'F6449A13-AAE2-E61E-C3C7-C1BA2CC24373', '良品铺子 秘制牛肉干140g*2包 卤汁牛肉 肉干肉脯', '2014-06-20 23:12:28', 50, 1, 'rmb', 3, b'0'),
	(34, '313185E2-B881-078A-D00D-76B0D2C6EAFD', '彩虹渔场台湾手工花生牛轧糖800g 原味芝麻 花粉巧克力 四种口味618好货钜惠古厝甜头', '2014-06-20 23:15:10', 109, 1, 'rmb', 4, b'0'),
	(35, 'C35F6327-3A04-3620-A211-519708E46F16', '麦斯威尔咖啡礼盒（香醇咖啡150g+咖啡搭档250g+对杯）', '2014-06-20 23:15:23', 66, 1, 'rmb', 4, b'0');
/*!40000 ALTER TABLE `shop_product` ENABLE KEYS */;


-- Dumping structure for table shop.shop_user
CREATE TABLE IF NOT EXISTS `shop_user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_uuid` varchar(36) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  `email` varchar(40) NOT NULL,
  `phone` int(10) unsigned DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `money` int(10) unsigned NOT NULL DEFAULT '0',
  `is_del` bit(1) NOT NULL DEFAULT b'0',
  `user_group` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`,`user_uuid`),
  KEY `user_uuid_idx` (`user_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- Dumping data for table shop.shop_user: ~11 rows (approximately)
/*!40000 ALTER TABLE `shop_user` DISABLE KEYS */;
INSERT INTO `shop_user` (`user_id`, `user_uuid`, `username`, `password`, `email`, `phone`, `create_time`, `money`, `is_del`, `user_group`) VALUES
	(1, '123456df', 'ddd', 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', '', 123456789, '2014-05-24 10:55:49', 1, b'0', NULL),
	(2, '', 'yantze', 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', '111', NULL, NULL, 0, b'0', NULL),
	(3, '', 'yang', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '123', NULL, NULL, 0, b'0', NULL),
	(4, '', 'yang', '7c4a8d09ca3762af61e59520943dc26494f8941b', '123456', NULL, NULL, 0, b'0', NULL),
	(5, '', 'ya', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '123', NULL, NULL, 0, b'0', NULL),
	(6, 'B2D4CCEE-C8AC-AD3C-E469-8A91C80BE80D', 'yax', '9c969ddf454079e3d439973bbab63ea6233e4087', '123', NULL, NULL, 0, b'1', NULL),
	(7, '7206F219-7857-0A0B-183B-DED68F09C436', 'yax', 'b60d121b438a380c343d5ec3c2037564b82ffef3', '123', NULL, '2014-05-24 22:57:30', 0, b'1', NULL),
	(8, '612C61D4-A88C-F2E6-ACEE-A5E2B3C3912D', 'yax', '40fa37ec00c761c7dbb6ebdee6d4a260b922f5f4', '123', NULL, '2014-05-24 22:58:11', 0, b'0', NULL),
	(9, 'CEA658B6-6212-99E6-3001-675492E2C5CB', 'user', 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 'yantze@111.com', NULL, '2014-05-25 05:42:51', 0, b'1', NULL),
	(10, '95728FD6-8854-54F0-20CB-371540A5EC27', 'yang', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '123', NULL, '2014-05-25 20:56:55', 0, b'0', NULL),
	(11, '62EDF0BA-3060-4D89-3010-0CD37F2EC6B8', 'demo', '89e495e7941cf9e40e6980d14a16bf023ccd4c91', 'demo@db.com', NULL, '2014-05-28 00:45:00', 0, b'0', NULL);
/*!40000 ALTER TABLE `shop_user` ENABLE KEYS */;


-- Dumping structure for table shop.shop_user_groups
CREATE TABLE IF NOT EXISTS `shop_user_groups` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(50) NOT NULL,
  `group_privilege` varchar(50) NOT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1150 DEFAULT CHARSET=utf8 COMMENT='用户组表';

-- Dumping data for table shop.shop_user_groups: 0 rows
/*!40000 ALTER TABLE `shop_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_user_groups` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
