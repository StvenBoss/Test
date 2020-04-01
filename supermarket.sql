/*
Navicat MySQL Data Transfer

Source Server         : DB01
Source Server Version : 50556
Source Host           : localhost:3306
Source Database       : supermarket

Target Server Type    : MYSQL
Target Server Version : 50556
File Encoding         : 65001

Date: 2020-03-30 14:39:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `address`
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `did` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(30) DEFAULT NULL,
  `province` varchar(10) DEFAULT NULL,
  `city` varchar(10) DEFAULT NULL,
  `township` varchar(10) DEFAULT NULL,
  `detial` varchar(50) DEFAULT NULL,
  `types` int(11) DEFAULT '1',
  PRIMARY KEY (`did`),
  KEY `FK_Reference_1` (`user_id`),
  CONSTRAINT `FK_Reference_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES ('1', '20190514112608', '陕西省', '西安市', '雁塔区', '立人科技园B座2楼', '1');
INSERT INTO `address` VALUES ('15', '20200327072332', '山东省', '济南市', '章丘区', 'zzz', '1');

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `aname` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------

-- ----------------------------
-- Table structure for `cart`
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `cid` int(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(30) NOT NULL,
  `fdid` varchar(32) NOT NULL,
  `count` int(11) NOT NULL,
  `abc` int(11) DEFAULT NULL,
  PRIMARY KEY (`cid`),
  KEY `FK_Reference_7` (`fdid`),
  KEY `FK_Reference_8` (`user_id`),
  CONSTRAINT `FK_Reference_7` FOREIGN KEY (`fdid`) REFERENCES `fresh_goods` (`fdid`),
  CONSTRAINT `FK_Reference_8` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES ('66', '20200327072332', '1d26d86f762611e9ba5954e1ade9802f', '1', '0');
INSERT INTO `cart` VALUES ('67', '20200327072332', '1d26d86f762611e9ba5954e1ade9802f', '1', '0');
INSERT INTO `cart` VALUES ('68', '20200327072332', '1d26d86f762611e9ba5954e1ade9802f', '1', '0');
INSERT INTO `cart` VALUES ('69', '20200327072332', '43fdcf0b762a11e9ba5954e1ade9802f', '1', '0');
INSERT INTO `cart` VALUES ('70', '20200327072332', '43fdcf0b762a11e9ba5954e1ade9802f', '1', '0');
INSERT INTO `cart` VALUES ('71', '20200327072332', '1d26d86f762611e9ba5954e1ade9802f', '1', '0');
INSERT INTO `cart` VALUES ('72', '20200327072332', '1d26d86f762611e9ba5954e1ade9802f', '2', '0');
INSERT INTO `cart` VALUES ('73', '20200327072332', '1d26d86f762611e9ba5954e1ade9802f', '1', '0');
INSERT INTO `cart` VALUES ('74', '20200327072332', '1d26d86f762611e9ba5954e1ade9802f', '1', '0');
INSERT INTO `cart` VALUES ('75', '20200327072332', '1d26d86f762611e9ba5954e1ade9802f', '1', '0');
INSERT INTO `cart` VALUES ('76', '20200327072332', '1d26d86f762611e9ba5954e1ade9802f', '1', '0');
INSERT INTO `cart` VALUES ('77', '20200327072332', '1d26d86f762611e9ba5954e1ade9802f', '1', '0');
INSERT INTO `cart` VALUES ('78', '20200327072332', '1d26d86f762611e9ba5954e1ade9802f', '1', '0');
INSERT INTO `cart` VALUES ('79', '20200327072332', '1d26d86f762611e9ba5954e1ade9802f', '1', '0');

-- ----------------------------
-- Table structure for `citys`
-- ----------------------------
DROP TABLE IF EXISTS `citys`;
CREATE TABLE `citys` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(30) NOT NULL,
  `pid` int(11) NOT NULL,
  PRIMARY KEY (`cid`),
  KEY `FK_Reference_2` (`pid`),
  CONSTRAINT `FK_Reference_2` FOREIGN KEY (`pid`) REFERENCES `province` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of citys
-- ----------------------------
INSERT INTO `citys` VALUES ('1', '西安市', '1');
INSERT INTO `citys` VALUES ('2', '咸阳市', '1');
INSERT INTO `citys` VALUES ('3', '宝鸡市', '1');
INSERT INTO `citys` VALUES ('4', '延安市', '1');

-- ----------------------------
-- Table structure for `courier`
-- ----------------------------
DROP TABLE IF EXISTS `courier`;
CREATE TABLE `courier` (
  `account` varchar(32) NOT NULL,
  `name` varchar(32) NOT NULL,
  `tel` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of courier
-- ----------------------------
INSERT INTO `courier` VALUES ('b91e32e07ae011e9be3352540078372a', '大猫', '13578562364');

-- ----------------------------
-- Table structure for `employee`
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `eid` int(11) NOT NULL AUTO_INCREMENT,
  `ename` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `tel` varchar(11) NOT NULL,
  PRIMARY KEY (`eid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employee
-- ----------------------------

-- ----------------------------
-- Table structure for `emp_role`
-- ----------------------------
DROP TABLE IF EXISTS `emp_role`;
CREATE TABLE `emp_role` (
  `eid` int(11) NOT NULL,
  `rid` int(11) NOT NULL,
  PRIMARY KEY (`eid`,`rid`),
  KEY `FK_Reference_12` (`rid`),
  CONSTRAINT `FK_Reference_11` FOREIGN KEY (`eid`) REFERENCES `employee` (`eid`),
  CONSTRAINT `FK_Reference_12` FOREIGN KEY (`rid`) REFERENCES `roles` (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of emp_role
-- ----------------------------

-- ----------------------------
-- Table structure for `evaluation`
-- ----------------------------
DROP TABLE IF EXISTS `evaluation`;
CREATE TABLE `evaluation` (
  `eid` int(11) NOT NULL,
  `user_id` varchar(30) NOT NULL,
  `fdid` varchar(32) NOT NULL,
  `detial` text NOT NULL,
  `grade` int(11) NOT NULL DEFAULT '5',
  `eva_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`eid`),
  KEY `FK_Reference_4` (`fdid`),
  KEY `FK_Reference_5` (`user_id`),
  CONSTRAINT `FK_Reference_4` FOREIGN KEY (`fdid`) REFERENCES `fresh_goods` (`fdid`),
  CONSTRAINT `FK_Reference_5` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of evaluation
-- ----------------------------

-- ----------------------------
-- Table structure for `fresh_goods`
-- ----------------------------
DROP TABLE IF EXISTS `fresh_goods`;
CREATE TABLE `fresh_goods` (
  `fdid` varchar(32) NOT NULL,
  `good_name` varchar(30) NOT NULL,
  `gtid` int(11) NOT NULL,
  `img` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `discount` int(11) NOT NULL DEFAULT '0',
  `preference` int(11) NOT NULL,
  `if_promotion` int(11) NOT NULL DEFAULT '0',
  `last_sales` int(11) NOT NULL,
  `current_sales` int(11) NOT NULL,
  `count_sales` int(11) NOT NULL,
  `summery` varchar(255) DEFAULT NULL,
  `attr1` varchar(20) DEFAULT NULL,
  `attr2` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`fdid`),
  KEY `FK_Reference_6` (`gtid`),
  CONSTRAINT `FK_Reference_6` FOREIGN KEY (`gtid`) REFERENCES `good_type` (`gtid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fresh_goods
-- ----------------------------
INSERT INTO `fresh_goods` VALUES ('0503a00e764411e9ba5954e1ade9802f', '【北大荒长粒香 5kg】x 东北大米 长粒香 5kg', '10', 'mm0101-mm0102-mm0103', '180', '80', '2', '0', '50', '20', '70', ' 北大荒 百年寒地 长粒香米', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('050b8dcc764411e9ba5954e1ade9802f', '【十月稻田红花生米1kg】十月稻田 花生米 \n', '10', 'mm0201-mm0202-mm0203', '106', '80', '2', '0', '30', '20', '50', '（中粒 红皮 生花生米 东北 五谷 ', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('0510b718764411e9ba5954e1ade9802f', '【新良新良面包粉2.5kg】新良原味面包粉\n', '10', 'mm0301-mm0102-mm0303', '109', '80', '2', '0', '60', '70', '130', ' 高筋面粉 烘焙原料 面包机专用小麦', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('0515f385764411e9ba5954e1ade9802f', '【王家粮仓泰国香米10KG】 原装大米 长粒籼米\n', '10', 'mm0401-mm0402-mm0403', '69', '100', '2', '0', '300', '200', '500', '泰国进口 王家粮仓 泰国香米', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('051b0aae764411e9ba5954e1ade9802f', '【KOKO柬埔寨茉莉香米】 长粒香米 大米10kg \n', '10', 'mm0501-mm0502-mm0503', '190', '100', '2', '0', '50', '70', '120', '盛宝 KOKO 柬埔寨香米', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('051feaac764411e9ba5954e1ade9802f', '【燕之坊八宝米 1kg】 高粱米 豇豆 红皮花生\n', '10', 'mm0601-mm0602-mm0603', '29', '70', '2', '0', '10', '10', '20', '燕之坊 八宝粥米  长糯米 黑米', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('05251f6b764411e9ba5954e1ade9802f', '【金沙河挂面】 方便速食拉面 清汤面 900g\n', '10', 'mm0701-mm0702-mm0703', '39', '70', '2', '0', '20', '20', '40', '金沙河面条 原味银丝挂面 龙须面', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('052a1f01764411e9ba5954e1ade9802f', '【十月稻田沁州黄小米2.5kg】 五谷杂粮 山西特 \n', '10', 'mm0801-mm0802-mm0803', '69', '100', '2', '0', '60', '10', '70', '十月稻田 沁州黄小米  黄小米', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('052f4c29764411e9ba5954e1ade9802f', '【十月稻田小米 1kg】十月稻田 黄小米 \n', '10', 'mm0901-mm0902-mm0903', '39', '60', '2', '0', '110', '220', '330', '（  月子米 小米粥  杂粮 真空装  粥', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('05343c31764411e9ba5954e1ade9802f', '【中裕面粉】 馒头粉 包子水饺通用粉 10k \n', '10', 'mm1001-mm1002-mm1003', '90', '100', '2', '0', '330', '220', '550', '中裕 ZHONGYU 中筋面粉 原味小麦粉', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('05397476764411e9ba5954e1ade9802f', '柴火大院 五常稻花香米 东北大米 10kg \n', '10', 'mm1101-mm1102-mm1103', '79', '79', '2', '0', '320', '220', '540', '【柴火大院五常稻花香米10kg】', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('05420052764411e9ba5954e1ade9802f', '五湖 秋田小町 东北大米 圆粒寿司米\n', '10', 'mm1201-mm1202-mm1203', '160', '80', '2', '0', '30', '20', '50', '【五湖秋田小町】', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('0546f4c1764411e9ba5954e1ade9802f', '金龙鱼 家用 包子饺子馒头饼手擀面\n', '10', 'mm1301-mm1302-mm1303', '69', '100', '2', '0', '50', '40', '90', '【金龙鱼小麦粉 高筋麦芯粉 面粉 5kg】', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('054c1e10764411e9ba5954e1ade9802f', '盛宝 泰金香 臻选茉莉香米 长粒米 大米10kg\n', '10', 'mm1401-mm1402-mm1403', '69', '65', '2', '0', '40', '440', '480', '【泰金香大米】', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('0551138d764411e9ba5954e1ade9802f', '金龙鱼 东北大米 寿司香米 粳米 鲜稻小町大米 5\n', '10', 'mm1501-mm1502-mm1503', '59', '100', '2', '0', '50', '200', '250', '【金龙鱼鲜稻小町大米 5KG】', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('055b4d57764411e9ba5954e1ade9802f', '金龙鱼 长粒香东北大米 5kg \n', '10', 'mm1601-mm1602-mm1603', '49', '90', '2', '0', '330', '230', '550', '【金龙鱼长粒香东北大米5kg】', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('05605d02764411e9ba5954e1ade9802f', '金龙鱼 家用 中筋面粉 多用途麦芯小麦粉5kg \n', '10', 'mm1701-mm1702-mm1703', '29', '100', '2', '0', '380', '240', '620', '【金龙鱼麦芯粉】', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('05657578764411e9ba5954e1ade9802f', '福临门 麦芯通用小麦粉 面粉 包子饺子馒头面粉5kg \n', '10', 'mm1801-mm1802-mm1803', '15', '85', '2', '0', '340', '240', '580', '【福临门面粉】', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('056a802a764411e9ba5954e1ade9802f', '孟乍隆苏吝府茉莉香米 泰国香米 原装进口大米10KG\n', '10', 'mm1901-mm1902-mm1903', '125', '100', '2', '0', '310', '210', '530', '【孟乍隆泰国茉莉香米】', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('056faa04764411e9ba5954e1ade9802f', '柴火大院 五常稻花香 东北大米5kg \n', '10', 'mm2001-mm2002-mm2003', '99', '75', '2', '0', '380', '210', '590', '【柴火大院五常稻花香大米】', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('0574af08764411e9ba5954e1ade9802f', '香雪 美味富强粉 面粉 中粮出品5kg \n', '10', 'mm2101-mm2102-mm2103', '66', '100', '2', '0', '340', '1980', '2320', '【香雪面粉】', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('057820fb764411e9ba5954e1ade9802f', '华润 五丰 五常大米 稻花香 东北大米10kg \n', '10', 'mm2201-mm2202-mm2203', '67', '78', '2', '0', '390', '200', '590', '【五丰五常大米五丰稻花香米】', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('057dfef6764411e9ba5954e1ade9802f', '太粮 靓虾王 香软米 10kg（油粘米 籼米 非东北大米）\n', '10', 'mm2301-mm2302-mm2303', '45', '78', '2', '0', '390', '200', '590', '【太粮籼米 油粘米】', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('05840577764411e9ba5954e1ade9802f', '金沙河面粉雪花小麦粉 包子馒头中筋烘焙白面粉 \n', '10', 'mm2401-mm2402-mm2403', '45', '78', '2', '0', '390', '200', '590', '【金沙河面粉饺子粉 通用】', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('05876153764411e9ba5954e1ade9802f', '裕道府 五常稻花香 东北大米 10kg\n', '10', 'mm2501-mm2502-mm2503', '90', '78', '2', '0', '390', '200', '590', '【裕道府稻花香米】', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('058c8271764411e9ba5954e1ade9802f', '福临门 泰玉香 一品茉莉香米 进口原粮 大米\n', '10', 'mm2601-mm2602-mm2603', '95', '78', '2', '0', '390', '200', '590', '【福临门泰玉香 一品茉莉香米】', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('058fc5c5764411e9ba5954e1ade9802f', '十月稻田 长粒香大米 东北大米 东北香米 10kg\n', '10', 'mm2701-mm2702-mm2703', '35', '78', '2', '0', '390', '200', '590', '【十月稻田长粒香大米 10kg】', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('06a895dd762911e9ba5954e1ade9802f', '百利甜酒 奶油利口酒力娇酒鸡尾酒750ml', '4', 'js0101-js0102-js0103', '145', '50', '1', '0', '50', '30', '80', '葡萄美酒夜光杯，欲饮琵琶马上催', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('06b8af54762911e9ba5954e1ade9802f', '张裕红酒 张裕特选级赤霞珠干红葡萄酒红酒圆桶单支', '4', 'js0201-js0202-js0203', '118', '80', '0', '0', '200', '60', '260', '张裕以蛇龙珠为主要原料，应用独有的系统酿制技术调配出张裕解百纳的独特典型性——香气浓郁，具有典型的胡椒、黑醋栗果实香气，特别是有一种“雨后割过的清新青草味”的典型性。\r\n', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('06c34141762911e9ba5954e1ade9802f', '国产红酒中粮长城出口型解百纳干红葡萄酒 750mlX6瓶', '4', 'js0301-js0302-js0303', '158', '100', '0', '0', '100', '60', '160', '2004年，在第五届中国布鲁塞尔国际葡萄酒及烈酒评酒会上，华夏葡萄园A区干红葡萄酒荣获唯一“特别金奖”，被国际评酒大师一致公认为“最佳中国红葡萄酒”。', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('06d20cd4762911e9ba5954e1ade9802f', '张裕红酒整箱张裕葡萄酒张裕赤霞珠干红【整箱6瓶】', '4', 'js0401-js0402-js0403', '498', '100', '0', '0', '152', '35', '187', '有世界知名的品酒专家这样评价张裕解百纳葡萄酒：“酒体丰满，清澈的红色，闪烁着斑斓的折光，其潜藏的草莓、樱桃的复合果香，随着藏酿而弥漫，劲力和细腻出色的匀衡，成熟酸味充盈口腔，十分甘美和浓郁，即使放下酒杯几分钟，依然齿颊留香，它那久久不散的香气和美味更使人难以忘怀。', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('06dc7183762911e9ba5954e1ade9802f', '拉菲2支装法国原装瓶进口干红尚品波尔多AOC葡萄酒礼盒', '4', 'js0501-js0502-js0503', '1488', '70', '0', '0', '190', '35', '225', '2013年09月起，拉菲罗斯柴尔德集团精选系列产品在中国大陆市场将统一启用集团五箭标志。为了更好地体现品牌形象，追求“卓越、精美、优雅”的精髓，此次实施标志统一的行为将使消费者更易识别拉菲罗斯柴尔德集团的产品。', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('06e6a32f762911e9ba5954e1ade9802f', '拉菲官方正品原装瓶进口巴斯克花园干红葡萄酒整箱6支装', '4', 'js0601-js0602-js0603', '2998', '100', '0', '0', '150', '35', '185', '2013年09月起，拉菲罗斯柴尔德集团精选系列产品在中国大陆市场将统一启用集团五箭标志。为了更好地体现品牌形象，追求“卓越、精美、优雅”的精髓，此次实施标志统一的行为将使消费者更易识别拉菲罗斯柴尔德集团的产品。', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('06f0ac66762911e9ba5954e1ade9802f', 'ASC智利进口小瓶红酒巴斯克干红葡萄酒整箱装187ml', '4', 'js0701-js0702-js0703', '419', '50', '0', '1', '165', '35', '195', '2013年09月起，拉菲罗斯柴尔德集团精选系列产品在中国大陆市场将统一启用集团五箭标志。为了更好地体现品牌形象，追求“卓越、精美、优雅”的精髓，此次实施标志统一的行为将使消费者更易识别拉菲罗斯柴尔德集团的产品。', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('06fa3d3e762911e9ba5954e1ade9802f', '中粮长城红酒特价干红葡萄酒橡木桶蛇龙珠6支整箱装正品', '4', 'js0801-js0802-js0803', '279', '30', '0', '0', '101', '35', '136', '2013年09月起，拉菲罗斯柴尔德集团精选系列产品在中国大陆市场将统一启用集团五箭标志。为了更好地体现品牌形象，追求“卓越、精美、优雅”的精髓，此次实施标志统一的行为将使消费者更易识别拉菲罗斯柴尔德集团的产品。', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('0702b1e6762911e9ba5954e1ade9802f', '中粮长城红酒特价干红葡萄酒窖酿赤霞珠6瓶国产整箱正品', '4', 'js0901-js0902-js0903', '299', '20', '0', '0', '106', '36', '142', '2013年09月起，拉菲罗斯柴尔德集团精选系列产品在中国大陆市场将统一启用集团五箭标志。为了更好地体现品牌形象，追求“卓越、精美、优雅”的精髓，此次实施标志统一的行为将使消费者更易识别拉菲罗斯柴尔德集团的产品。', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('070c3825762911e9ba5954e1ade9802f', '长城武龙解百纳干红葡萄酒整箱6支装国产红酒', '4', 'js1001-js1002-js1003', '288', '20', '0', '1', '1001', '36', '1037', '2013年09月起，拉菲罗斯柴尔德集团精选系列产品在中国大陆市场将统一启用集团五箭标志。为了更好地体现品牌形象，追求“卓越、精美、优雅”的精髓，此次实施标志统一的行为将使消费者更易识别拉菲罗斯柴尔德集团的产品。', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('10eb9f28762a11e9ba5954e1ade9802f', '5斤混装小番茄新鲜樱桃西红柿水果黄瓜小柿子', '2', 'sc0201-sc0202-sc0203', '49', '50', '0', '1', '201', '54', '255', '据了解，中国商业联合会与中华全国商业信息中心作为我国商品市场销售统计监测的部门，已经连续17年权威发布全国商品零售市场统计监测数据，被誉为中国商品销售宏观走势的“晴雨表”。而蒙牛凭借生态草原自然纯品质、绿色的企业发展理念，从众品牌和企业中脱颖而出，连续5年摘得中国乳品市场占有率冠军，成为中国乳业绿色发展典范，引领中国乳业整体复兴。', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('10faaddf762a11e9ba5954e1ade9802f', '圣女果小黄瓜5斤混装小番茄新鲜樱桃', '2', 'sc0301-sc0302-sc0303', '42', '90', '0', '1', '235', '54', '289', '据了解，中国商业联合会与中华全国商业信息中心作为我国商品市场销售统计监测的部门，已经连续17年权威发布全国商品零售市场统计监测数据，被誉为中国商品销售宏观走势的“晴雨表”。而蒙牛凭借生态草原自然纯品质、绿色的企业发展理念，从众品牌和企业中脱颖而出，连续5年摘得中国乳品市场占有率冠军，成为中国乳业绿色发展典范，引领中国乳业整体复兴。', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('1107f743762a11e9ba5954e1ade9802f', '76g迷你樱桃小手指萝卜生吃水果萝卜甜脆', '2', 'sc0401-sc0402-sc0403', '19.9', '100', '0', '1', '201', '54', '255', '据了解，中国商业联合会与中华全国商业信息中心作为我国商品市场销售统计监测的部门，已经连续17年权威发布全国商品零售市场统计监测数据，被誉为中国商品销售宏观走势的“晴雨表”。而蒙牛凭借生态草原自然纯品质、绿色的企业发展理念，从众品牌和企业中脱颖而出，连续5年摘得中国乳品市场占有率冠军，成为中国乳业绿色发展典范，引领中国乳业整体复兴。', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('1110fa71762a11e9ba5954e1ade9802f', '贝贝南瓜板栗味迷你小南瓜栗面南瓜5斤装包邮', '2', 'sc0501-sc0502-sc0503', '98', '90', '0', '1', '102', '50', '152', '据了解，中国商业联合会与中华全国商业信息中心作为我国商品市场销售统计监测的部门，已经连续17年权威发布全国商品零售市场统计监测数据，被誉为中国商品销售宏观走势的“晴雨表”。而蒙牛凭借生态草原自然纯品质、绿色的企业发展理念，从众品牌和企业中脱颖而出，连续5年摘得中国乳品市场占有率冠军，成为中国乳业绿色发展典范，引领中国乳业整体复兴。', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('111b9165762a11e9ba5954e1ade9802f', '珍珠小番茄应季小西红柿农家孕妇水果非海南千禧果', '2', 'sc0601-sc0602-sc0603', '45.9', '100', '0', '1', '201', '54', '255', '据了解，中国商业联合会与中华全国商业信息中心作为我国商品市场销售统计监测的部门，已经连续17年权威发布全国商品零售市场统计监测数据，被誉为中国商品销售宏观走势的“晴雨表”。而蒙牛凭借生态草原自然纯品质、绿色的企业发展理念，从众品牌和企业中脱颖而出，连续5年摘得中国乳品市场占有率冠军，成为中国乳业绿色发展典范，引领中国乳业整体复兴。', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('11255e8e762a11e9ba5954e1ade9802f', '潍坊萝卜 潍县青萝卜5斤装10现拔现发青萝卜', '2', 'sc0701-sc0702-sc0703', '45.9', '100', '0', '1', '201', '54', '255', '据了解，中国商业联合会与中华全国商业信息中心作为我国商品市场销售统计监测的部门，已经连续17年权威发布全国商品零售市场统计监测数据，被誉为中国商品销售宏观走势的“晴雨表”。而蒙牛凭借生态草原自然纯品质、绿色的企业发展理念，从众品牌和企业中脱颖而出，连续5年摘得中国乳品市场占有率冠军，成为中国乳业绿色发展典范，引领中国乳业整体复兴。', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('112f72cf762a11e9ba5954e1ade9802f', '小番茄带箱5斤包邮批发时令应季采摘果蔬小西红柿', '2', 'sc0801-sc0802-sc0803', '59.9', '100', '0', '1', '201', '54', '255', '据了解，中国商业联合会与中华全国商业信息中心作为我国商品市场销售统计监测的部门，已经连续17年权威发布全国商品零售市场统计监测数据，被誉为中国商品销售宏观走势的“晴雨表”。而蒙牛凭借生态草原自然纯品质、绿色的企业发展理念，从众品牌和企业中脱颖而出，连续5年摘得中国乳品市场占有率冠军，成为中国乳业绿色发展典范，引领中国乳业整体复兴。', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('11390d5e762a11e9ba5954e1ade9802f', '带泥农家自种蔬菜水果宝宝辅食5斤包邮批', '2', 'sc0901-sc0902-sc0903', '25', '100', '0', '0', '201', '54', '255', '据了解，中国商业联合会与中华全国商业信息中心作为我国商品市场销售统计监测的部门，已经连续17年权威发布全国商品零售市场统计监测数据，被誉为中国商品销售宏观走势的“晴雨表”。而蒙牛凭借生态草原自然纯品质、绿色的企业发展理念，从众品牌和企业中脱颖而出，连续5年摘得中国乳品市场占有率冠军，成为中国乳业绿色发展典范，引领中国乳业整体复兴。', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('1141c013762a11e9ba5954e1ade9802f', '农家孕妇水果非海南千禧果', '2', 'sc1001-sc1002-sc1003', '59.9', '80', '0', '0', '105', '55', '160', '据了解，中国商业联合会与中华全国商业信息中心作为我国商品市场销售统计监测的部门，已经连续17年权威发布全国商品零售市场统计监测数据，被誉为中国商品销售宏观走势的“晴雨表”。而蒙牛凭借生态草原自然纯品质、绿色的企业发展理念，从众品牌和企业中脱颖而出，连续5年摘得中国乳品市场占有率冠军，成为中国乳业绿色发展典范，引领中国乳业整体复兴。', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('1d26d86f762611e9ba5954e1ade9802f', '水果新鲜包邮一整箱陕西延安红富士脆甜10斤带箱批发', '1', 'sg0101-sg0102-sg0103', '138', '90', '2', '0', '370', '55', '425', '据了解，中国商业联合会与中华全国商业信息中心作为我国商品市场销售统计监测的部门，已经连续17年权威发布全国商品零售市场统计监测数据，被誉为中国商品销售宏观走势的“晴雨表”。而蒙牛凭借生态草原自然纯品质、绿色的企业发展理念，从众品牌和企业中脱颖而出，连续5年摘得中国乳品市场占有率冠军，成为中国乳业绿色发展典范，引领中国乳业整体复兴。', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('2027d690761611e9ba5954e1ade9802f', '百草味风琴手撕鱿鱼片80g 海鲜零食休闲 鱿鱼丝小吃', '7', 'ls0101-ls0102-ls0103', '20', '90', '1', '0', '100', '120', '220', '好吃不贵', 'V6FO7Q5 RWRX6LXYTXSI', 'M0M1H5FU5LEUQER0QWJD');
INSERT INTO `fresh_goods` VALUES ('24619506762111e9ba5954e1ade9802f', 'UHA-悠哈特浓牛奶糖500g混合口味糖果批发散装小零食\n', '6', 'tg0101-tg0402-tg0403', '178', '100', '0', '0', '50', '40', '90', '你已得到的，肯定已经超过你已经得到的', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('2469927a762111e9ba5954e1ade9802f', '不二家棒棒糖桶装60支儿童年货糖果礼盒水果糖零食\n', '6', 'tg0501-tg0502-tg0503', '55', '100', '0', '0', '44', '55', '99', '你已得到的，肯定已经超过你已经得到的', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('2ad9bf74763c11e9ba5954e1ade9802f', '【鲁花食用油】鲁花 食用油 5S \n', '11', 'ly2401-ly2402-ly2403', '45', '78', '0', '0', '390', '200', '590', '物理压榨 压榨一级 花生油4L （新老包装随机', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('2ae0881a763c11e9ba5954e1ade9802f', '【金龙鱼调和油】金龙鱼 食用油 \n', '11', 'ly2501-ly2502-ly2503', '90', '78', '0', '0', '390', '200', '590', '葵花籽清香型 食用植物调和油5L', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('2ae3f980763c11e9ba5954e1ade9802f', '【鲁花花生油】鲁花 食用油 5S物理压榨 \n', '11', 'ly2601-ly2602-ly2603', '95', '78', '0', '0', '390', '200', '590', '压榨一级 花生油 6.18L（京东定制）', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('2ae77441763c11e9ba5954e1ade9802f', '【金龙鱼金龙鱼纯正玉米油4L】金龙鱼 \n', '11', 'ly2701-ly2702-ly2703', '35', '78', '0', '0', '390', '200', '590', '食用油 非转基因 压榨 一级 纯正玉米', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('43fdcf0b762a11e9ba5954e1ade9802f', '一整箱陕西延安红富士脆甜10斤带箱批发', '1', 'sg0101-sg0102-sg0103', '138', '90', '2', '0', '370', '55', '425', '据了解，中国商业联合会与中华全国商业信息中心作为我国商品市场销售统计监测的部门，已经连续17年权威发布全国商品零售市场统计监测数据，被誉为中国商品销售宏观走势的“晴雨表”。而蒙牛凭借生态草原自然纯品质、绿色的企业发展理念，从众品牌和企业中脱颖而出，连续5年摘得中国乳品市场占有率冠军，成为中国乳业绿色发展典范，引领中国乳业整体复兴。', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('440c5ed9762a11e9ba5954e1ade9802f', '当季新鲜萍平果吃的栖霞红富士', '1', 'sg0201-sg0202-sg0203', '79.5', '100', '2', '0', '200', '55', '255', '苹果还被称为“智慧果”。苹果中所含溶解性的磷和铁，易于消化和吸收，对婴幼儿生长发育十分有益。科学家发现，苹果不但有多种维生素、矿物质、脂肪、糖类等构成大脑所必须的营养成分，而且含有利于儿童生长发育的细纤维和能增进儿童记忆力的锌。苹果不仅对儿童有益，对老年人更是食疗佳晶。每天食用3个苹果，对增进人体健康大有益处。', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('44178c2c762a11e9ba5954e1ade9802f', '新疆库尔勒香梨带箱10斤新鲜水果当季包邮', '1', 'sg0301-sg0302-sg0303', '198', '90', '2', '0', '100', '30', '130', '苹果还被称为“智慧果”。苹果中所含溶解性的磷和铁，易于消化和吸收，对婴幼儿生长发育十分有益。科学家发现，苹果不但有多种维生素、矿物质、脂肪、糖类等构成大脑所必须的营养成分，而且含有利于儿童生长发育的细纤维和能增进儿童记忆力的锌。苹果不仅对儿童有益，对老年人更是食疗佳晶。每天食用3个苹果，对增进人体健康大有益处。', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('4421da79762a11e9ba5954e1ade9802f', '新鲜当季水果红肉大果带箱5斤装包邮', '1', 'sg0401-sg0402-sg0403', '58', '60', '2', '0', '100', '30', '130', '苹果还被称为“智慧果”。苹果中所含溶解性的磷和铁，易于消化和吸收，对婴幼儿生长发育十分有益。科学家发现，苹果不但有多种维生素、矿物质、脂肪、糖类等构成大脑所必须的营养成分，而且含有利于儿童生长发育的细纤维和能增进儿童记忆力的锌。苹果不仅对儿童有益，对老年人更是食疗佳晶。每天食用3个苹果，对增进人体健康大有益处。', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('442bc9a6762a11e9ba5954e1ade9802f', '广西大芒果大青芒金煌芒甜心芒果净重9斤包邮', '1', 'sg0501-sg0502-sg0503', '90', '80', '2', '0', '165', '20', '185', '苹果还被称为“智慧果”。苹果中所含溶解性的磷和铁，易于消化和吸收，对婴幼儿生长发育十分有益。科学家发现，苹果不但有多种维生素、矿物质、脂肪、糖类等构成大脑所必须的营养成分，而且含有利于儿童生长发育的细纤维和能增进儿童记忆力的锌。苹果不仅对儿童有益，对老年人更是食疗佳晶。每天食用3个苹果，对增进人体健康大有益处。', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('4434bef0762a11e9ba5954e1ade9802f', '红富士苹果水果带箱10斤新鲜包邮当季丑苹果', '1', 'sg0601-sg0602-sg0603', '180', '70', '2', '0', '100', '55', '155', '苹果还被称为“智慧果”。苹果中所含溶解性的磷和铁，易于消化和吸收，对婴幼儿生长发育十分有益。科学家发现，苹果不但有多种维生素、矿物质、脂肪、糖类等构成大脑所必须的营养成分，而且含有利于儿童生长发育的细纤维和能增进儿童记忆力的锌。苹果不仅对儿童有益，对老年人更是食疗佳晶。每天食用3个苹果，对增进人体健康大有益处。', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('443f3d4a762a11e9ba5954e1ade9802f', '新疆阿克苏冰糖心苹果带箱10斤新鲜当季水果红富士', '1', 'sg0701-sg0702-sg0703', '168', '90', '2', '0', '35', '55', '90', '苹果还被称为“智慧果”。苹果中所含溶解性的磷和铁，易于消化和吸收，对婴幼儿生长发育十分有益。科学家发现，苹果不但有多种维生素、矿物质、脂肪、糖类等构成大脑所必须的营养成分，而且含有利于儿童生长发育的细纤维和能增进儿童记忆力的锌。苹果不仅对儿童有益，对老年人更是食疗佳晶。每天食用3个苹果，对增进人体健康大有益处。', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('4447ba4c762a11e9ba5954e1ade9802f', '越南芒果新鲜水果青芒当季玉芒甜心芒大带箱10斤', '1', 'sg0801-sg0802-sg0803', '168', '90', '2', '0', '100', '55', '155', '苹果还被称为“智慧果”。苹果中所含溶解性的磷和铁，易于消化和吸收，对婴幼儿生长发育十分有益。科学家发现，苹果不但有多种维生素、矿物质、脂肪、糖类等构成大脑所必须的营养成分，而且含有利于儿童生长发育的细纤维和能增进儿童记忆力的锌。苹果不仅对儿童有益，对老年人更是食疗佳晶。每天食用3个苹果，对增进人体健康大有益处。', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('44518f7d762a11e9ba5954e1ade9802f', '丑丑的青见柑橘水果新鲜包邮当季桔子橘子大带箱10斤', '1', 'sg0901-sg002-sg0903', '168', '90', '2', '0', '115', '60', '175', '苹果还被称为“智慧果”。苹果中所含溶解性的磷和铁，易于消化和吸收，对婴幼儿生长发育十分有益。科学家发现，苹果不但有多种维生素、矿物质、脂肪、糖类等构成大脑所必须的营养成分，而且含有利于儿童生长发育的细纤维和能增进儿童记忆力的锌。苹果不仅对儿童有益，对老年人更是食疗佳晶。每天食用3个苹果，对增进人体健康大有益处。', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('445b6506762a11e9ba5954e1ade9802f', '10斤新鲜当季水果桔子橘子丑八怪包邮', '1', 'sg1001-sg1002-sg1003', '168', '90', '2', '0', '100', '55', '155', '苹果还被称为“智慧果”。苹果中所含溶解性的磷和铁，易于消化和吸收，对婴幼儿生长发育十分有益。科学家发现，苹果不但有多种维生素、矿物质、脂肪、糖类等构成大脑所必须的营养成分，而且含有利于儿童生长发育的细纤维和能增进儿童记忆力的锌。苹果不仅对儿童有益，对老年人更是食疗佳晶。每天食用3个苹果，对增进人体健康大有益处。', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('4467dd75762a11e9ba5954e1ade9802f', '四川丑橘当季丑桔新鲜水果带箱10斤丑八怪包邮', '1', 'sg1101-sg1102-sg1103', '120', '30', '2', '0', '102', '55', '157', '苹果还被称为“智慧果”。苹果中所含溶解性的磷和铁，易于消化和吸收，对婴幼儿生长发育十分有益。科学家发现，苹果不但有多种维生素、矿物质、脂肪、糖类等构成大脑所必须的营养成分，而且含有利于儿童生长发育的细纤维和能增进儿童记忆力的锌。苹果不仅对儿童有益，对老年人更是食疗佳晶。每天食用3个苹果，对增进人体健康大有益处。', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('48048d57762811e9ba5954e1ade9802f', '雀巢 Nestle 丝滑拿铁口味 即饮雀巢咖啡饮料', '12', 'yp0401-yp0402-yp0403', '85', '100', '0', '0', '300', '330', '630', '好喝好喝', 'V6FO7Q5 RWRX6LXYTXSI', 'M0M1H5FU5LEUQER0QWJD');
INSERT INTO `fresh_goods` VALUES ('4bf23e5f763b11e9ba5954e1ade9802f', '【多力黄金三益葵花籽油】多力黄金3益葵花籽油2.5L\n', '11', 'ly0101-ly0102-ly0103', '180', '80', '0', '0', '50', '20', '70', ' 食用油小包装油  含维生', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('4bfa2509763b11e9ba5954e1ade9802f', '【金龙鱼芝麻油】金龙鱼 食用油 香油 400ML\n', '11', 'ly0201-ly0202-ly0203', '106', '80', '0', '0', '30', '20', '50', '凉拌调味烹饪火锅 纯芝麻 ', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('4bff19fe763b11e9ba5954e1ade9802f', '【野岭茶籽油】野岭山茶油有机2L物理压榨食用油 送礼\n', '11', 'ly0301-ly0102-ly0303', '109', '80', '0', '0', '60', '70', '130', '冷榨一级油茶籽油', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('4c09775e763b11e9ba5954e1ade9802f', '【仙餐牌食用油】仙餐 纯正 四川 菜籽油  5L 餐饮用油\n', '11', 'ly0401-ly0402-ly0403', '69', '100', '0', '0', '300', '200', '500', '非转基因压榨 食用油', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('4c0e9ec9763b11e9ba5954e1ade9802f', '【第一坊花生油】第一坊 冷榨花生油4L 食用油 \n', '11', 'ly0501-ly0502-ly0503', '190', '100', '0', '0', '50', '70', '120', '冷榨工艺 至纯净低油烟', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('4c152189763b11e9ba5954e1ade9802f', '【蓓琳娜橄榄油】蓓琳娜（BELLINA）\n', '11', 'ly0601-ly0602-ly0603', '29', '70', '0', '0', '10', '10', '20', 'PDO特级初榨橄榄油 2L 西班牙原装进口', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('4c1a8c04763b11e9ba5954e1ade9802f', '【日清色拉油 一级大豆油 1L】日清  色拉油 \n', '11', 'ly0701-ly0702-ly0703', '39', '70', '0', '0', '20', '20', '40', '一级大豆油1L  非转基因植物食', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('4c1f99fa763b11e9ba5954e1ade9802f', '【索米亚胡麻油清香型5L】索米亚 清香胡麻油 \n', '11', 'ly0801-ly0802-ly0803', '69', '100', '0', '0', '60', '10', '70', '宁夏传统小磨压榨 亚麻籽油食', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('4c2480d9763b11e9ba5954e1ade9802f', '【亚麻公社菜籽油】亚麻公社 亚麻籽油一级冷榨食用油\n', '11', 'ly0901-ly0902-ly0903', '39', '60', '0', '0', '110', '220', '330', '月子油适用孕妇婴儿宝', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('4c2981df763b11e9ba5954e1ade9802f', '【香满园物理压榨天府老巷菜籽油5L】香满园 \n', '11', 'ly1001-ly1002-ly1003', '90', '100', '0', '0', '330', '220', '550', '非转基因 物理压榨 天府老巷菜 ', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('4c2eba65763b11e9ba5954e1ade9802f', '【香满园芝麻油400ml】香满园 食用油 \n', '11', 'ly1101-ly1102-ly1103', '79', '79', '0', '0', '320', '220', '540', '凉拌调味烹饪火锅 芝麻油 香油 400ml', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('4c34d37a763b11e9ba5954e1ade9802f', '【红井源4.456L】红井源压榨一级纯香亚麻籽油\n', '11', 'ly1201-ly1202-ly1203', '160', '80', '0', '0', '30', '20', '50', '4.456L电商款健康油孕妇儿童用', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('4c38e2bc763b11e9ba5954e1ade9802f', '【九三食用油】九三 食用油 非转基因 \n', '11', 'ly1301-ly1302-ly1303', '69', '100', '0', '0', '50', '40', '90', '致青春系列 一级5L大豆油（九三出品甄', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('4c3e0ed3763b11e9ba5954e1ade9802f', '【金鼎金鼎 非转基因压榨葵花籽油食用油 5.436L】\n', '11', 'ly1401-ly1402-ly1403', '69', '65', '0', '0', '40', '440', '480', '金鼎 压榨葵花籽油 5.436L', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('4c5ad405763b11e9ba5954e1ade9802f', '【刀唛花生油6.18L】刀唛 Knife 食用油 \n', '11', 'ly1501-ly1502-ly1503', '59', '100', '0', '0', '50', '200', '250', '花生油6.18L 精炼压榨一级 香港品质', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('4c5fec2d763b11e9ba5954e1ade9802f', '【欧丽薇兰橄榄油】欧丽薇兰  \n', '11', 'ly1601-ly1602-ly1603', '49', '90', '0', '0', '330', '230', '550', '特级初榨橄榄油礼盒 750mlX2瓶 新老包装随机', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('4c650088763b11e9ba5954e1ade9802f', '【欧丽薇兰纯正橄榄油5l】欧丽薇兰 \n', '11', 'ly1701-ly1702-ly1703', '29', '100', '0', '0', '380', '240', '620', 'Olivoilà 食用油 压榨纯正橄榄油5l', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('4c6a09a6763b11e9ba5954e1ade9802f', '【胡姬花特香型花生油 6.18L】胡姬花 \n', '11', 'ly1801-ly1802-ly1803', '15', '85', '0', '0', '340', '240', '580', '食用油 压榨 特香型花生油 6.18L（京', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('4c6f1981763b11e9ba5954e1ade9802f', '【元宝大豆油】\n', '11', 'ly1901-ly1902-ly1903', '125', '100', '0', '0', '310', '210', '530', '元宝 食用油 大豆油 5L', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('4c7270f1763b11e9ba5954e1ade9802f', '【多力葵花籽油】多力葵花籽油5L+250ml \n', '11', 'ly2001-ly2002-ly2003', '99', '75', '0', '0', '380', '210', '590', '食用油  含维生素e', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('4c75e262763b11e9ba5954e1ade9802f', '【鲁花菜籽油】鲁花 食用油 \n', '11', 'ly2101-ly2102-ly2103', '66', '100', '0', '0', '340', '1980', '2320', '非转基因 物理压榨 特香菜籽油 5L', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('4c794d39763b11e9ba5954e1ade9802f', '【金龙鱼浓香花生油5L】金龙鱼 \n', '11', 'ly2201-ly2202-ly2203', '67', '78', '0', '0', '390', '200', '590', '食用油 压榨 浓香花生油5L', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('5488d1de762811e9ba5954e1ade9802f', '名仁 苏打水饮料 无糖无汽弱碱性水', '12', 'yp0701-yp0702-yp0703', '36', '100', '0', '0', '120', '130', '250', ' 为刚系少年圆梦 清爽走去大海', 'V6FO7Q5 RWRX6LXYTXSI', 'M0M1H5FU5LEUQER0QWJD');
INSERT INTO `fresh_goods` VALUES ('56008625761811e9ba5954e1ade9802f', '蒙牛特仑苏低脂牛奶整箱营养促销礼盒装老成人学生早餐多省包邮纯', '3', 'rzp0101-rzp0102-rzp0103', '74', '50', '0', '0', '160', '36', '196', '据了解，中国商业联合会与中华全国商业信息中心作为我国商品市场销售统计监测的部门，已经连续17年权威发布全国商品零售市场统计监测数据，被誉为中国商品销售宏观走势的“晴雨表”。而蒙牛凭借生态草原自然纯品质、绿色的企业发展理念，从众品牌和企业中脱颖而出，连续5年摘得中国乳品市场占有率冠军，成为中国乳业绿色发展典范，引领中国乳业整体复兴。', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('5754db20763c11e9ba5954e1ade9802f', '【福临门花生油】福临门 食用油\r\n', '11', 'ly2301-ly2302-ly2303', '45', '78', '0', '0', '390', '200', '590', '压榨一级花生油（京东定制）', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('5dfd1f04762911e9ba5954e1ade9802f', '拉菲进口传奇波尔多干红葡萄酒2016珍藏佳酿酒', '4', 'js1101-js1102-js1103', '168', '80', '0', '0', '200', '36', '236', '2013年09月起，拉菲罗斯柴尔德集团精选系列产品在中国大陆市场将统一启用集团五箭标志。为了更好地体现品牌形象，追求“卓越、精美、优雅”的精髓，此次实施标志统一的行为将使消费者更易识别拉菲罗斯柴尔德集团的产品。', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('5e08d2ba762911e9ba5954e1ade9802f', '马天尼起泡甜葡萄酒MARTINI ASTI起泡酒香槟气泡酒', '4', 'js1201-js1202-js1203', '370', '75', '0', '0', '210', '36', '246', '2013年09月起，拉菲罗斯柴尔德集团精选系列产品在中国大陆市场将统一启用集团五箭标志。为了更好地体现品牌形象，追求“卓越、精美、优雅”的精髓，此次实施标志统一的行为将使消费者更易识别拉菲罗斯柴尔德集团的产品。', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('669d48c9762811e9ba5954e1ade9802f', '椰汁正宗椰树牌椰子汁 植物蛋白饮料', '12', 'yp0801-yp0802-yp0803', '66', '100', '0', '0', '66', '100', '166', 'A变C不是梦', 'V6FO7Q5 RWRX6LXYTXSI', 'M0M1H5FU5LEUQER0QWJD');
INSERT INTO `fresh_goods` VALUES ('8c45578d761511e9ba5954e1ade9802f', '无糖型薄荷糖750g强劲清凉散装老式薄荷糖果木糖醇香体接吻糖', '6', 'tg0101-tg0102-tg0103', '169', '100', '0', '0', '30', '20', '50', '不含糖', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('950e5135762111e9ba5954e1ade9802f', '旺旺 旺仔牛奶糖1kg结婚庆婚礼喜糖糖果批发500g散装\n', '6', 'tg0601-tg0602-tg0603', '56', '100', '0', '0', '65', '20', '85', '你已得到的，肯定已经超过你已经得到的', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('951854bd762111e9ba5954e1ade9802f', '苏小糖牛轧糖厦门特产小零食糖果80后休闲食品140g\n', '6', 'tg0701-tg0702-tg0703', '69', '100', '0', '0', '111', '222', '333', '你已得到的，肯定已经超过你已经得到的', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('951d3d14762111e9ba5954e1ade9802f', '不二家官方旗舰店棒棒糖水果味60支桶装女生零食\n', '6', 'tg0801-tg0802-tg0803', '22', '100', '0', '0', '333', '24', '359', '你已得到的，肯定已经超过你已经得到的', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('952cc47d762111e9ba5954e1ade9802f', '阿尔卑斯糖混合水果味牛奶硬糖棒棒糖500g结婚喜\n', '6', 'tg0901-tg0902-tg0903', '445', '100', '0', '0', '55', '60', '115', '你已得到的，肯定已经超过你已经得到的', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('9531ef1c762111e9ba5954e1ade9802f', '酷莎有个圈圈的无糖薄荷糖老式强劲海盐清凉网红清新\n', '6', 'tg1001-tg1002-tg1003', '111', '100', '0', '0', '30', '20', '50', '你已得到的，肯定已经超过你已经得到的', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('9536d933762111e9ba5954e1ade9802f', '徐福记橡皮糖果500g小零食糖果汁软糖喜糖散装约40包\n', '6', 'tg1901-tg1902-tg1903', '68', '100', '0', '0', '50', '30', '80', '你已得到的，肯定已经超过你已经得到的', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('953bd388762111e9ba5954e1ade9802f', '宏源陈皮糖5斤装怀旧小零食酸甜话梅糖硬糖散装\n', '6', 'tg1101-tg1102-tg1103', '149', '100', '0', '0', '60', '30', '90', '你已得到的，肯定已经超过你已经得到的', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('9540fb16762111e9ba5954e1ade9802f', '大白兔奶糖500g散装原味X2袋 喜糖结婚\n', '6', 'tg1201-tg1202-tg1203', '69', '100', '0', '0', '50', '50', '100', '你已得到的，肯定已经超过你已经得到的', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('954619cd762111e9ba5954e1ade9802f', '雀巢宝路薄荷糖750g整包500克散装 薄荷味压片\n', '6', 'tg1301-tg1302-tg1303', '169', '100', '0', '0', '30', '20', '50', '你已得到的，肯定已经超过你已经得到的', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('954b3857762111e9ba5954e1ade9802f', '旺仔牛奶糖1000g散装 结婚喜糖批发旺旺糖果礼盒\n', '6', 'tg1401-tg1402-tg1403', '269', '100', '0', '0', '40', '10', '50', '你已得到的，肯定已经超过你已经得到的', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('95501f1c762111e9ba5954e1ade9802f', '阿尔卑斯硬糖1kg混合口味礼包零食喜糖结婚红色\n', '6', 'tg1501-tg1502-tg1503', '129', '100', '0', '0', '20', '20', '40', '你已得到的，肯定已经超过你已经得到的', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('95555484762111e9ba5954e1ade9802f', '徐福记酥心糖结婚庆喜糖果大礼包混合多口味散装\n', '6', 'tg1601-tg1602-tg1603', '269', '100', '0', '0', '10', '20', '30', '你已得到的，肯定已经超过你已经得到的', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('955a63fc762111e9ba5954e1ade9802f', '徐福记-3斤喜庆糖果大礼包硬糖水果糖婚庆结婚喜糖\n', '6', 'tg1701-tg1702-tg1703', '149', '100', '0', '0', '50', '70', '120', '你已得到的，肯定已经超过你已经得到的', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('955f8e9b762111e9ba5954e1ade9802f', '冠生园大白兔奶糖500g礼盒装结婚喜糖特产六一\n', '6', 'tg2401-tg2402-tg2403', '169', '100', '0', '0', '50', '20', '70', '你已得到的，肯定已经超过你已经得到的', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('9566511e762111e9ba5954e1ade9802f', '阿尔卑斯散装硬糖1kg混合口味喜糖批发聚会\n', '6', 'tg2001-tg2002-tg2003', '199', '100', '0', '0', '60', '70', '130', '你已得到的，肯定已经超过你已经得到的', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('9660813c762711e9ba5954e1ade9802f', '百草味风琴手撕鱿鱼片80g 海鲜零食休闲 鱿鱼丝小吃', '7', 'ls0101-ls0102-ls0103', '20', '90', '1', '0', '100', '120', '220', '好吃不贵', 'V6FO7Q5 RWRX6LXYTXSI', 'M0M1H5FU5LEUQER0QWJD');
INSERT INTO `fresh_goods` VALUES ('966a434f762711e9ba5954e1ade9802f', '百草味炭烧腰果190g 碳烧腰果仁每日坚果干果零食特产袋装', '7', 'ls0201-ls0202-ls0203', '30', '90', '2', '0', '150', '200', '350', '好吃不贵', 'V6FO7Q5 RWRX6LXYTXSI', 'M0M1H5FU5LEUQER0QWJD');
INSERT INTO `fresh_goods` VALUES ('966f56d7762711e9ba5954e1ade9802f', '百草味白芝麻猪肉脯180g 零食小吃肉脯特产猪肉', '7', 'ls0301-ls0302-ls0303', '50', '90', '1', '0', '210', '300', '510', '好吃不贵', 'V6FO7Q5 RWRX6LXYTXSI', 'M0M1H5FU5LEUQER0QWJD');
INSERT INTO `fresh_goods` VALUES ('96743a09762711e9ba5954e1ade9802f', '百草味麻薯 抹茶味210g 糕点小吃美食 爆浆麻糍早餐', '7', 'ls0401-ls0402-ls0403', '44', '90', '2', '0', '200', '300', '500', '好吃不贵', 'V6FO7Q5 RWRX6LXYTXSI', 'M0M1H5FU5LEUQER0QWJD');
INSERT INTO `fresh_goods` VALUES ('9683a487762711e9ba5954e1ade9802f', '百草味 五香牛肉粒100g 内蒙古手撕风干牛肉干休闲零食小吃', '7', 'ls0501-ls0502-ls0503', '55', '90', '1', '0', '500', '800', '1300', '好吃不贵', 'V6FO7Q5 RWRX6LXYTXSI', 'M0M1H5FU5LEUQER0QWJD');
INSERT INTO `fresh_goods` VALUES ('9688a23c762711e9ba5954e1ade9802f', '百草味精制猪肉脯100g 网红零食小吃靖江肉干肉铺熟食', '7', 'ls0601-ls0602-ls0603', '60', '90', '1', '0', '100', '200', '300', '好吃不贵', 'V6FO7Q5 RWRX6LXYTXSI', 'M0M1H5FU5LEUQER0QWJD');
INSERT INTO `fresh_goods` VALUES ('968db1dc762711e9ba5954e1ade9802f', '良品铺子甜辣鸭脖190g卤味休闲熟食鸭肉网红零食小吃', '7', 'ls0701-ls0702-ls0703', '35', '90', '1', '0', '150', '300', '450', '好吃不贵', 'V6FO7Q5 RWRX6LXYTXSI', 'M0M1H5FU5LEUQER0QWJD');
INSERT INTO `fresh_goods` VALUES ('9692ec6f762711e9ba5954e1ade9802f', '牛肉片100g休闲零食小吃内蒙古手撕风干大片牛肉干', '7', 'ls0801-ls0802-ls0803', '80', '90', '1', '0', '155', '300', '455', '好吃不贵', 'V6FO7Q5 RWRX6LXYTXSI', 'M0M1H5FU5LEUQER0QWJD');
INSERT INTO `fresh_goods` VALUES ('9697f436762711e9ba5954e1ade9802f', '小王子鲜米饼63克香脆仙贝饼干膨化休闲零食特产小吃', '7', 'ls0901-ls0902-ls0903', '15', '100', '2', '0', '200', '300', '500', '好吃不贵', 'V6FO7Q5 RWRX6LXYTXSI', 'M0M1H5FU5LEUQER0QWJD');
INSERT INTO `fresh_goods` VALUES ('969cf210762711e9ba5954e1ade9802f', '百草味 夏威夷果218g休闲零食特产每日坚果炒货干果仁', '7', 'ls1001-ls1002-ls1003', '55', '60', '2', '0', '50', '200', '250', '好吃不贵', 'V6FO7Q5 RWRX6LXYTXSI', 'M0M1H5FU5LEUQER0QWJD');
INSERT INTO `fresh_goods` VALUES ('970e91fb762011e9ba5954e1ade9802f', '冠生园大白兔奶糖500gx2散装糖果零食大礼包散\r\n', '6', 'tg1801-tg1802-tg1803', '123', '50', '0', '0', '55', '20', '75', '好吃不贵', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('a18998cc761611e9ba5954e1ade9802f', '中粮长城红酒特价干红葡萄酒窖酿赤霞珠6瓶国产整箱正品', '4', 'js0901-js0902-js0903', '299', '20', '0', '0', '106', '36', '142', '2013年09月起，拉菲罗斯柴尔德集团精选系列产品在中国大陆市场将统一启用集团五箭标志。为了更好地体现品牌形象，追求“卓越、精美、优雅”的精髓，此次实施标志统一的行为将使消费者更易识别拉菲罗斯柴尔德集团的产品。', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('b7ac64ce762c11e9ba5954e1ade9802f', '四美手工包子小笼包子肉包菜包冷冻速冻食品扬州特产\n', '5', 'sd0101-sd0102-sd0103', '18', '80', '1', '0', '50', '20', '70', '食以安为先，民以食为先。品质第一，纯正可口', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('b7b3af00762c11e9ba5954e1ade9802f', '知味观小笼包 灌汤包虾仁鲜肉2口味8盒速冻早点方便\n', '5', 'sd0201-sd0202-sd0203', '16', '80', '1', '0', '30', '20', '50', '食以安为先，民以食为先。品质第一，纯正可口', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('b7b6e3de762c11e9ba5954e1ade9802f', '避风塘鲜肉糯米烧卖干蒸速冻食品早餐成人款含香菇烧麦\n', '5', 'sd0301-sd0102-sd0303', '19', '80', '2', '0', '60', '70', '130', '食以安为先，民以食为先。品质第一，纯正可口', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('b7ba9726762c11e9ba5954e1ade9802f', '银河食品速冻鲜肉包子馒头 早餐点心学校酒店批发\n', '5', 'sd0401-sd0402-sd0403', '69', '40', '2', '0', '300', '200', '500', '食以安为先，民以食为先。品质第一，纯正可口', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('b7bdb570762c11e9ba5954e1ade9802f', '三全脆皮香蕉 10个装油炸banana 油炸小吃广式早茶\n', '5', 'sd0501-sd0502-sd0503', '19', '60', '1', '0', '50', '70', '120', '食以安为先，民以食为先。品质第一，纯正可口', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('b7c12bb1762c11e9ba5954e1ade9802f', '三全素水饺韭菜鸡蛋蔬菜饺子速冻清淡早晚餐皮薄\n', '5', 'sd0601-sd0602-sd0603', '29', '70', '1', '0', '10', '10', '20', '用我们万分的努力，换你健康的一餐', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('b7c47d7a762c11e9ba5954e1ade9802f', '思念速冻食品 清爽全素春卷烘焙原料早餐晚餐\n', '5', 'sd0701-sd0702-sd0703', '39', '70', '1', '0', '20', '20', '40', '用我们万分的努力，换你健康的一餐', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('b7c8071e762c11e9ba5954e1ade9802f', '大用食品1200g台湾无骨鸡柳香酥油炸棒速冻油炸食品\n', '5', 'sd0801-sd0802-sd0803', '69', '100', '1', '0', '60', '10', '70', '用我们万分的努力，换你健康的一餐', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('b7cb444e762c11e9ba5954e1ade9802f', '儿童营养早餐 速冻食品广式早茶点心卡通包子馒头\n', '5', 'sd0901-sd0902-sd0903', '39', '60', '1', '0', '110', '220', '330', '用我们万分的努力，换你健康的一餐', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('b7cef353762c11e9ba5954e1ade9802f', '舒汇红糖馒头手工馒头 速冻即食早餐方便食品 \n', '5', 'sd1001-sd1002-sd1003', '9', '40', '2', '0', '330', '220', '550', '放心看得见，健康吃得到。', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('b7d8d1a2762c11e9ba5954e1ade9802f', '沈大成老上海葱油饼老字号速冻大饼320g \n', '5', 'sd1101-sd1102-sd1103', '79', '79', '2', '0', '320', '220', '540', '放心看得见，健康吃得到。', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('b7dc8b11762c11e9ba5954e1ade9802f', '舒汇手撕红糖馒头手工馒头点心 儿童营养早餐\n', '5', 'sd1201-sd1202-sd1203', '16', '80', '2', '0', '30', '20', '50', '放心看得见，健康吃得到。', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('b7df9f3a762c11e9ba5954e1ade9802f', '乐肴居港式肉夹包叉烧包广式早茶点心早餐蒸煮速冻\n', '5', 'sd1301-sd1302-sd1303', '69', '20', '1', '0', '50', '40', '90', '放心看得见，健康吃得到。', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('b7e328c5762c11e9ba5954e1ade9802f', '乐肴居蛋黄流沙包儿童营养早餐速食点心速冻食品\n', '5', 'sd1401-sd1402-sd1403', '69', '65', '2', '0', '40', '440', '480', '美食快车，通向放心、健康！', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('b7e9f474762c11e9ba5954e1ade9802f', '广州酒家 黑芝麻核桃包2袋装广式点心早茶早餐\n', '5', 'sd1501-sd1502-sd1503', '59', '30', '2', '0', '50', '200', '250', '美食快车，通向放心、健康！', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('b7ed3d98762c11e9ba5954e1ade9802f', '狗不理包子早餐速冻包子手工猪肉包840g面食网红\n', '5', 'sd1601-sd1602-sd1603', '49', '90', '1', '0', '330', '230', '550', '美食快车，通向放心、健康！', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('b7f0a9d1762c11e9ba5954e1ade9802f', '冶春 扬州早餐速冻糯米方便速食松子烧卖\n', '5', 'sd1701-sd1702-sd1703', '29', '40', '2', '0', '380', '240', '620', '美食快车，通向放心、健康！', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('b7f3f035762c11e9ba5954e1ade9802f', '安井香脆油条安心食品油条速冻半成品健康放心\n', '5', 'sd1801-sd1802-sd1803', '15', '85', '2', '0', '340', '240', '580', '美食快车，通向放心、健康！', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('b7f76d1d762c11e9ba5954e1ade9802f', '安井红糖发糕700g三包装红枣糕传统手工糕点速冻食品\n', '5', 'sd1901-sd1902-sd1903', '125', '50', '2', '0', '310', '210', '530', '原生态原滋味，健康味美你来尝！', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('b7facffa762c11e9ba5954e1ade9802f', '安井金麦流沙包300gX3袋咸蛋黄爆汁包子馒头港式\n', '5', 'sd2001-sd2002-sd2003', '99', '75', '2', '0', '380', '210', '590', '原生态原滋味，健康味美你来尝！', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('b7fe51a1762c11e9ba5954e1ade9802f', '广州酒家 手制叉烧包337.5gX2方便速冻食品 早餐\n', '5', 'sd2101-sd2102-sd2103', '25', '60', '1', '0', '340', '1980', '2320', '原生态原滋味，健康味美你来尝！', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('b801bc1d762c11e9ba5954e1ade9802f', '安井香脆大油条半成品450gX3袋家用安心早餐香酥油条\n', '5', 'sd2201-sd2202-sd2203', '35', '78', '2', '0', '390', '200', '590', '原生态原滋味，健康味美你来尝！', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('b80d2e9d762711e9ba5954e1ade9802f', '大龙虾2斤鲜活生猛加拿大波士顿龙虾1000g海鲜水产', '8', 'hx0101-hx0102-hx0103', '199', '70', '1', '0', '50', '100', '150', '特大龙虾', 'V6FO7Q5 RWRX6LXYTXSI', 'M0M1H5FU5LEUQER0QWJD');
INSERT INTO `fresh_goods` VALUES ('b81416dc762711e9ba5954e1ade9802f', '冰鲜三文鱼中段日料刺身拼盘新鲜生鱼片即食海鲜三文鱼肉', '8', 'hx0201-hx0202-hx0203', '150', '80', '1', '0', '50', '80', '130', '新鲜三文鱼', 'V6FO7Q5 RWRX6LXYTXSI', 'M0M1H5FU5LEUQER0QWJD');
INSERT INTO `fresh_goods` VALUES ('b81799c4762711e9ba5954e1ade9802f', '鲜活老鼠斑500g-条 海鱼 肉质细嫩味道鲜美 可做观赏鱼', '8', 'hx0301-hx0302-hx0303', '180', '90', '1', '0', '30', '80', '110', '非常新鲜', 'V6FO7Q5 RWRX6LXYTXSI', 'M0M1H5FU5LEUQER0QWJD');
INSERT INTO `fresh_goods` VALUES ('b81cda31762711e9ba5954e1ade9802f', '海参即食好当家深海底播有机刺参500g威海海渗海鲜', '8', 'hx0401-hx0402-hx0403', '250', '50', '1', '0', '15', '15', '30', '非常新鲜', 'V6FO7Q5 RWRX6LXYTXSI', 'M0M1H5FU5LEUQER0QWJD');
INSERT INTO `fresh_goods` VALUES ('b821fa30762711e9ba5954e1ade9802f', '法国银鳕鱼深海鳕鱼片进口新鲜冷冻海鲜水产整条切片雪鱼', '8', 'hx0501-hx0502-hx0503', '110', '60', '1', '0', '20', '30', '50', '非常新鲜', 'V6FO7Q5 RWRX6LXYTXSI', 'M0M1H5FU5LEUQER0QWJD');
INSERT INTO `fresh_goods` VALUES ('b826fc94762711e9ba5954e1ade9802f', '即食海参大连辽刺参1500g海渗鲜活海鲜礼盒3斤装单个包装', '8', 'hx0601-hx0602-hx0603', '500', '70', '1', '0', '30', '30', '60', '非常新鲜', 'V6FO7Q5 RWRX6LXYTXSI', 'M0M1H5FU5LEUQER0QWJD');
INSERT INTO `fresh_goods` VALUES ('b82c0740762711e9ba5954e1ade9802f', '八爪鱼海鲜鲜活熟食小章鱼八抓鱼大爆头八爪鱼麻辣章鱼', '8', 'hx0701-hx0702-hx0703', '60', '30', '1', '0', '120', '130', '250', '非常nice', 'V6FO7Q5 RWRX6LXYTXSI', 'M0M1H5FU5LEUQER0QWJD');
INSERT INTO `fresh_goods` VALUES ('b83613f8762711e9ba5954e1ade9802f', '徽周六月黄小螃蟹鲜活大闸蟹', '8', 'hx0801-hx0802-hx0803', '53', '20', '1', '0', '100', '200', '300', '非常nice', 'V6FO7Q5 RWRX6LXYTXSI', 'M0M1H5FU5LEUQER0QWJD');
INSERT INTO `fresh_goods` VALUES ('b83d0c07762711e9ba5954e1ade9802f', '宁波海鲜特产醉螃蜞900g醉蟹蟛蜞咸蟹呛蟹白玉蟹小螃蟹', '8', 'hx0901-hx0902-hx0903', '55', '60', '1', '0', '150', '200', '350', '非常nice', 'V6FO7Q5 RWRX6LXYTXSI', 'M0M1H5FU5LEUQER0QWJD');
INSERT INTO `fresh_goods` VALUES ('b84269f1762711e9ba5954e1ade9802f', '渔家二少爷红膏呛蟹罐装醉蟹海鲜梭子蟹宁波舟山特产即食全螃蟹盖', '8', 'hx1001-hx1002-hx1003', '60', '50', '1', '0', '120', '200', '320', '非常nice', 'V6FO7Q5 RWRX6LXYTXSI', 'M0M1H5FU5LEUQER0QWJD');
INSERT INTO `fresh_goods` VALUES ('b8cdd4aa762911e9ba5954e1ade9802f', '家用做酸奶发酵菌剂自制益生菌粉发酵粉酸奶机', '3', 'rzp0201-rzp0202-rzp0203', '135', '80', '0', '0', '1000', '36', '1036', '据了解，中国商业联合会与中华全国商业信息中心作为我国商品市场销售统计监测的部门，已经连续17年权威发布全国商品零售市场统计监测数据，被誉为中国商品销售宏观走势的“晴雨表”。而蒙牛凭借生态草原自然纯品质、绿色的企业发展理念，从众品牌和企业中脱颖而出，连续5年摘得中国乳品市场占有率冠军，成为中国乳业绿色发展典范，引领中国乳业整体复兴。', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('b8dc45be762911e9ba5954e1ade9802f', '蒙牛旗舰店早餐奶核桃味牛奶250mlX16盒整箱', '3', 'rzp0301-rzp0302-rzp0303', '44.8', '20', '0', '1', '1050', '56', '1106', '据了解，中国商业联合会与中华全国商业信息中心作为我国商品市场销售统计监测的部门，已经连续17年权威发布全国商品零售市场统计监测数据，被誉为中国商品销售宏观走势的“晴雨表”。而蒙牛凭借生态草原自然纯品质、绿色的企业发展理念，从众品牌和企业中脱颖而出，连续5年摘得中国乳品市场占有率冠军，成为中国乳业绿色发展典范，引领中国乳业整体复兴。', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('b8e650ba762911e9ba5954e1ade9802f', '蒙牛纯甄常温酸奶200gX24盒点滴纯粹如此简单', '3', 'rzp0401-rzp0402-rzp0403', '132', '50', '0', '1', '1051', '56', '1107', '据了解，中国商业联合会与中华全国商业信息中心作为我国商品市场销售统计监测的部门，已经连续17年权威发布全国商品零售市场统计监测数据，被誉为中国商品销售宏观走势的“晴雨表”。而蒙牛凭借生态草原自然纯品质、绿色的企业发展理念，从众品牌和企业中脱颖而出，连续5年摘得中国乳品市场占有率冠军，成为中国乳业绿色发展典范，引领中国乳业整体复兴。', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('b8f0df93762911e9ba5954e1ade9802f', '德亚 全脂牛奶1LX12盒-整箱 德国原装进口牛奶', '3', 'rzp0501-rzp0502-rzp0503', '132', '60', '0', '1', '500', '56', '556', '据了解，中国商业联合会与中华全国商业信息中心作为我国商品市场销售统计监测的部门，已经连续17年权威发布全国商品零售市场统计监测数据，被誉为中国商品销售宏观走势的“晴雨表”。而蒙牛凭借生态草原自然纯品质、绿色的企业发展理念，从众品牌和企业中脱颖而出，连续5年摘得中国乳品市场占有率冠军，成为中国乳业绿色发展典范，引领中国乳业整体复兴。', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('b8fa9eac762911e9ba5954e1ade9802f', '伊利 纯牛奶 营养早餐礼盒装 250mlX24整箱', '3', 'rzp0601-rzp0602-rzp0603', '74.8', '40', '0', '0', '500', '57', '557', '据了解，中国商业联合会与中华全国商业信息中心作为我国商品市场销售统计监测的部门，已经连续17年权威发布全国商品零售市场统计监测数据，被誉为中国商品销售宏观走势的“晴雨表”。而蒙牛凭借生态草原自然纯品质、绿色的企业发展理念，从众品牌和企业中脱颖而出，连续5年摘得中国乳品市场占有率冠军，成为中国乳业绿色发展典范，引领中国乳业整体复兴。', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('b9049c6f762911e9ba5954e1ade9802f', '蒙牛旗舰店 低脂高钙牛奶250mlX16盒整箱', '3', 'rzp0701-rzp0702-rzp0703', '51.2', '90', '0', '0', '506', '54', '560', '据了解，中国商业联合会与中华全国商业信息中心作为我国商品市场销售统计监测的部门，已经连续17年权威发布全国商品零售市场统计监测数据，被誉为中国商品销售宏观走势的“晴雨表”。而蒙牛凭借生态草原自然纯品质、绿色的企业发展理念，从众品牌和企业中脱颖而出，连续5年摘得中国乳品市场占有率冠军，成为中国乳业绿色发展典范，引领中国乳业整体复兴。', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('b90d68d3762911e9ba5954e1ade9802f', '伊利 安慕希风味酸牛奶原味酸奶', '3', 'rzp0801-rzp0802-rzp0803', '106', '80', '0', '0', '400', '54', '454', '据了解，中国商业联合会与中华全国商业信息中心作为我国商品市场销售统计监测的部门，已经连续17年权威发布全国商品零售市场统计监测数据，被誉为中国商品销售宏观走势的“晴雨表”。而蒙牛凭借生态草原自然纯品质、绿色的企业发展理念，从众品牌和企业中脱颖而出，连续5年摘得中国乳品市场占有率冠军，成为中国乳业绿色发展典范，引领中国乳业整体复兴。', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('b916a545762911e9ba5954e1ade9802f', '原味草莓味成人学生早餐奶酸牛奶', '3', 'rzp0901-rzp0902-rzp0903', '53', '80', '0', '0', '400', '55', '455', '据了解，中国商业联合会与中华全国商业信息中心作为我国商品市场销售统计监测的部门，已经连续17年权威发布全国商品零售市场统计监测数据，被誉为中国商品销售宏观走势的“晴雨表”。而蒙牛凭借生态草原自然纯品质、绿色的企业发展理念，从众品牌和企业中脱颖而出，连续5年摘得中国乳品市场占有率冠军，成为中国乳业绿色发展典范，引领中国乳业整体复兴。', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('b91e49a2762911e9ba5954e1ade9802f', '原味酸奶200gx24盒装早餐牛奶整箱批发', '3', 'rzp1001-rzp1002-rzp1003', '118', '90', '0', '0', '400', '54', '454', '据了解，中国商业联合会与中华全国商业信息中心作为我国商品市场销售统计监测的部门，已经连续17年权威发布全国商品零售市场统计监测数据，被誉为中国商品销售宏观走势的“晴雨表”。而蒙牛凭借生态草原自然纯品质、绿色的企业发展理念，从众品牌和企业中脱颖而出，连续5年摘得中国乳品市场占有率冠军，成为中国乳业绿色发展典范，引领中国乳业整体复兴。', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('b92ac4b1762911e9ba5954e1ade9802f', '光明 莫斯利安酸牛奶原味200gx24盒酸奶', '3', 'rzp1101-rzp1102-rzp1103', '108', '80', '0', '0', '300', '54', '354', '据了解，中国商业联合会与中华全国商业信息中心作为我国商品市场销售统计监测的部门，已经连续17年权威发布全国商品零售市场统计监测数据，被誉为中国商品销售宏观走势的“晴雨表”。而蒙牛凭借生态草原自然纯品质、绿色的企业发展理念，从众品牌和企业中脱颖而出，连续5年摘得中国乳品市场占有率冠军，成为中国乳业绿色发展典范，引领中国乳业整体复兴。', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('bade7096762811e9ba5954e1ade9802f', '鸡翅膀烤翅烤鸡翅 炸鸡翅炸翅中 卤鸡翅卤翅膀', '9', 'rs0101-rs0102-rs0103', '55', '30', '1', '0', '55', '65', '120', '肉质鲜嫩', 'V6FO7Q5 RWRX6LXYTXSI', 'M0M1H5FU5LEUQER0QWJD');
INSERT INTO `fresh_goods` VALUES ('bae6bcf9762811e9ba5954e1ade9802f', ' 兔子肉 整只兔肉 鲜兔肉 生兔肉', '9', 'rs0201-rs0202-rs0203', '60', '20', '1', '0', '40', '50', '90', '肉质鲜嫩', 'V6FO7Q5 RWRX6LXYTXSI', 'M0M1H5FU5LEUQER0QWJD');
INSERT INTO `fresh_goods` VALUES ('baebdcde762811e9ba5954e1ade9802f', ' 澳洲牛肉安格斯谷饲牛助条肉500g袋装', '9', 'rs0301-rs0302-rs0303', '120', '60', '1', '0', '60', '60', '120', '肉质鲜嫩', 'V6FO7Q5 RWRX6LXYTXSI', 'M0M1H5FU5LEUQER0QWJD');
INSERT INTO `fresh_goods` VALUES ('baf0fe2f762811e9ba5954e1ade9802f', '生鲜土鸡老母鸡1000g-只 散养柴鸡500天走地鸡', '9', 'rs0401-rs0402-rs0403', '50', '80', '1', '0', '35', '75', '110', '肉质鲜嫩', 'V6FO7Q5 RWRX6LXYTXSI', 'M0M1H5FU5LEUQER0QWJD');
INSERT INTO `fresh_goods` VALUES ('baf7d011762811e9ba5954e1ade9802f', '首粮黑猪肉礼盒提货礼券生鲜肉类 ', '9', 'rs0501-rs0502-rs0503', '55', '70', '1', '0', '35', '75', '110', '肉质鲜嫩', 'V6FO7Q5 RWRX6LXYTXSI', 'M0M1H5FU5LEUQER0QWJD');
INSERT INTO `fresh_goods` VALUES ('bafcc2a2762811e9ba5954e1ade9802f', '澳洲进口原切霜降雪花牛肉150g  原味生牛肉生鲜 ', '9', 'rs0601-rs0602-rs0603', '80', '90', '1', '0', '40', '150', '190', '肉质鲜嫩', 'V6FO7Q5 RWRX6LXYTXSI', 'M0M1H5FU5LEUQER0QWJD');
INSERT INTO `fresh_goods` VALUES ('bb0208e4762811e9ba5954e1ade9802f', '新鲜柞蛹黄蛹大茧蛹知了猴冷藏野味 ', '9', 'rs0701-rs0702-rs0703', '77', '90', '1', '0', '67', '151', '218', '肉质鲜嫩', 'V6FO7Q5 RWRX6LXYTXSI', 'M0M1H5FU5LEUQER0QWJD');
INSERT INTO `fresh_goods` VALUES ('bb06dd12762811e9ba5954e1ade9802f', '梅花鹿肉1000克 新鲜鹿肉 非驴肉 东北特产 ', '9', 'rs0801-rs0802-rs0803', '75', '90', '1', '0', '40', '70', '110', '肉质鲜嫩', 'V6FO7Q5 RWRX6LXYTXSI', 'M0M1H5FU5LEUQER0QWJD');
INSERT INTO `fresh_goods` VALUES ('bb11291c762811e9ba5954e1ade9802f', '新鲜鹿肉 4500克 东北特产 生鲜鹿腿整只 ', '9', 'rs0901-rs0902-rs0903', '550', '90', '1', '0', '60', '70', '130', '肉质鲜嫩', 'V6FO7Q5 RWRX6LXYTXSI', 'M0M1H5FU5LEUQER0QWJD');
INSERT INTO `fresh_goods` VALUES ('bb163d4b762811e9ba5954e1ade9802f', '澳洲进口原肉整切微腌牛排套餐菲力板腱西 ', '9', 'rs1001-rs1002-rs1003', '400', '90', '1', '0', '60', '90', '150', '肉质鲜嫩', 'V6FO7Q5 RWRX6LXYTXSI', 'M0M1H5FU5LEUQER0QWJD');
INSERT INTO `fresh_goods` VALUES ('cf8e5f07762011e9ba5954e1ade9802f', '旺仔牛奶糖1kg结婚庆喜糖批发500g散装软糖果小包装零食品', '6', 'tg0201-tg0202-tg0203', '111', '90', '0', '0', '22', '55', '77', '你已得到的，肯定已经超过你已经得到', 'PB9TMHFWI7VK3680JDW1', 'HBM0KIY50KTGFJ74W RF');
INSERT INTO `fresh_goods` VALUES ('d800a5a1762711e9ba5954e1ade9802f', '苏打汽水 苏打水汽水饮料 0糖0卡路里气泡水', '12', 'yp0101-yp0102-yp0103', '30', '30', '0', '0', '400', '410', '810', '好喝好喝', 'V6FO7Q5 RWRX6LXYTXSI', 'M0M1H5FU5LEUQER0QWJD');
INSERT INTO `fresh_goods` VALUES ('d808e738762711e9ba5954e1ade9802f', '红牛维生素功能饮料250mlX24罐 整箱', '12', 'yp0201-yp0202-yp0203', '80', '50', '0', '0', '300', '400', '700', '好喝好喝', 'V6FO7Q5 RWRX6LXYTXSI', 'M0M1H5FU5LEUQER0QWJD');
INSERT INTO `fresh_goods` VALUES ('d80dc6f4762711e9ba5954e1ade9802f', '加多宝 凉茶植物饮料 茶饮料 310mlX24罐 整箱装', '12', 'yp0301-yp0302-yp0303', '60', '60', '0', '0', '500', '400', '900', '好喝好喝', 'V6FO7Q5 RWRX6LXYTXSI', 'M0M1H5FU5LEUQER0QWJD');
INSERT INTO `fresh_goods` VALUES ('d81a095b762711e9ba5954e1ade9802f', '北冰洋 桔汁味汽水 碳酸饮料 330mlX6听', '12', 'yp0501-yp0502-yp0503', '40', '85', '0', '0', '102', '105', '107', '好喝好喝', 'V6FO7Q5 RWRX6LXYTXSI', 'M0M1H5FU5LEUQER0QWJD');
INSERT INTO `fresh_goods` VALUES ('d81ee4c9762711e9ba5954e1ade9802f', '统一 海之言 柠檬口味 500mlX15瓶-箱 整箱装', '12', 'yp0601-yp0602-yp0603', '45', '70', '0', '0', '150', '151', '301', ' 为刚系少年圆梦 清爽走去大海', 'V6FO7Q5 RWRX6LXYTXSI', 'M0M1H5FU5LEUQER0QWJD');
INSERT INTO `fresh_goods` VALUES ('d82480c1762711e9ba5954e1ade9802f', '维他奶 维他柠檬茶饮料250mlX24盒 整箱装', '12', 'yp0901-yp0902-yp0903', '40', '50', '0', '0', '40', '80', '88', '好好喝', 'V6FO7Q5 RWRX6LXYTXSI', 'M0M1H5FU5LEUQER0QWJD');
INSERT INTO `fresh_goods` VALUES ('d82b8320762711e9ba5954e1ade9802f', '康师傅 蜂蜜柚子 风味果汁饮料 500mlX15瓶 箱装装', '12', 'yp1001-yp1002-yp1003', '35', '60', '0', '0', '50', '60', '110', '好好喝', 'V6FO7Q5 RWRX6LXYTXSI', 'M0M1H5FU5LEUQER0QWJD');

-- ----------------------------
-- Table structure for `good_type`
-- ----------------------------
DROP TABLE IF EXISTS `good_type`;
CREATE TABLE `good_type` (
  `gtid` int(11) NOT NULL AUTO_INCREMENT,
  `gtname` varchar(30) NOT NULL,
  PRIMARY KEY (`gtid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of good_type
-- ----------------------------
INSERT INTO `good_type` VALUES ('1', '水果');
INSERT INTO `good_type` VALUES ('2', '蔬菜');
INSERT INTO `good_type` VALUES ('3', '乳制品');
INSERT INTO `good_type` VALUES ('4', '酒水');
INSERT INTO `good_type` VALUES ('5', '速冻食品');
INSERT INTO `good_type` VALUES ('6', '糖果');
INSERT INTO `good_type` VALUES ('7', '零食');
INSERT INTO `good_type` VALUES ('8', '海鲜');
INSERT INTO `good_type` VALUES ('9', '肉类');
INSERT INTO `good_type` VALUES ('10', '米面');
INSERT INTO `good_type` VALUES ('11', '粮油');
INSERT INTO `good_type` VALUES ('12', '饮料');

-- ----------------------------
-- Table structure for `logistics`
-- ----------------------------
DROP TABLE IF EXISTS `logistics`;
CREATE TABLE `logistics` (
  `lid` int(11) NOT NULL,
  `account` varchar(32) DEFAULT NULL,
  `user_id` varchar(30) NOT NULL,
  `oid` varchar(32) NOT NULL,
  `pay_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `package_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `begin_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`lid`),
  KEY `FK_Reference_15` (`account`),
  KEY `FK_Reference_16` (`oid`),
  KEY `FK_Reference_17` (`user_id`),
  CONSTRAINT `FK_Reference_15` FOREIGN KEY (`account`) REFERENCES `courier` (`account`),
  CONSTRAINT `FK_Reference_16` FOREIGN KEY (`oid`) REFERENCES `orders` (`oid`),
  CONSTRAINT `FK_Reference_17` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of logistics
-- ----------------------------

-- ----------------------------
-- Table structure for `orders`
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `oid` varchar(32) NOT NULL,
  `user_id` varchar(30) NOT NULL,
  `order_time` varchar(30) CHARACTER SET utf8mb4 NOT NULL DEFAULT 'CURRENT_TIMESTAMP',
  `total_price` double(10,2) NOT NULL,
  `order_status` int(11) NOT NULL DEFAULT '1',
  `pay_type` varchar(20) NOT NULL,
  PRIMARY KEY (`oid`),
  KEY `FK_Reference_10` (`user_id`),
  CONSTRAINT `FK_Reference_10` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('25f3048795e74a59a416faded341a72d', '20200327072332', '2020-03-30 09-45-15', '276.00', '0', '支付宝');
INSERT INTO `orders` VALUES ('6e79394df1b14cc3968fbfa295aea072', '20200327072332', '2020-03-30 09-46-15', '123.11', '1', '支付宝');
INSERT INTO `orders` VALUES ('6fc2194e2b974eb1a1e6532c160d9a6a', '20200327072332', '2020-03-30 09-45-38', '138.00', '1', '支付宝');
INSERT INTO `orders` VALUES ('731c729fbcd94cf98d0f5333fe53d850', '20200327072332', '2020-03-30 09-47-37', '138.00', '1', '支付宝');
INSERT INTO `orders` VALUES ('978b8c4cf9d6485c82621330679a9b6d', '20200327072332', '2020-03-30 09-58-27', '276.00', '1', '支付宝');
INSERT INTO `orders` VALUES ('9c697a0a3c5a40cea468744fd1789d2b', '20200327072332', '2020-03-30 09-26-49', '138.00', '1', '支付宝');

-- ----------------------------
-- Table structure for `order_detial`
-- ----------------------------
DROP TABLE IF EXISTS `order_detial`;
CREATE TABLE `order_detial` (
  `did` int(11) NOT NULL AUTO_INCREMENT,
  `oid` varchar(32) NOT NULL,
  `fdid` varchar(32) NOT NULL,
  `count` int(11) NOT NULL,
  PRIMARY KEY (`did`),
  KEY `FK_Reference_9` (`oid`),
  CONSTRAINT `FK_Reference_9` FOREIGN KEY (`oid`) REFERENCES `orders` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_detial
-- ----------------------------

-- ----------------------------
-- Table structure for `permissions`
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `pid` int(11) NOT NULL,
  `pname` varchar(30) NOT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `province`
-- ----------------------------
DROP TABLE IF EXISTS `province`;
CREATE TABLE `province` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `pname` varchar(30) NOT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of province
-- ----------------------------
INSERT INTO `province` VALUES ('1', '陕西省');

-- ----------------------------
-- Table structure for `roles`
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `rid` int(11) NOT NULL,
  `rname` varchar(30) NOT NULL,
  `detial` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of roles
-- ----------------------------

-- ----------------------------
-- Table structure for `role_perm`
-- ----------------------------
DROP TABLE IF EXISTS `role_perm`;
CREATE TABLE `role_perm` (
  `rid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  PRIMARY KEY (`rid`,`pid`),
  KEY `FK_Reference_14` (`pid`),
  CONSTRAINT `FK_Reference_13` FOREIGN KEY (`rid`) REFERENCES `roles` (`rid`),
  CONSTRAINT `FK_Reference_14` FOREIGN KEY (`pid`) REFERENCES `permissions` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_perm
-- ----------------------------

-- ----------------------------
-- Table structure for `township`
-- ----------------------------
DROP TABLE IF EXISTS `township`;
CREATE TABLE `township` (
  `tid` int(11) NOT NULL,
  `tname` varchar(30) NOT NULL,
  `cid` int(11) NOT NULL,
  PRIMARY KEY (`tid`),
  KEY `FK_Reference_3` (`cid`),
  CONSTRAINT `FK_Reference_3` FOREIGN KEY (`cid`) REFERENCES `citys` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of township
-- ----------------------------
INSERT INTO `township` VALUES ('1', '新城区', '1');
INSERT INTO `township` VALUES ('2', '碑林区', '1');
INSERT INTO `township` VALUES ('3', '莲湖区', '1');
INSERT INTO `township` VALUES ('4', '灞桥区', '1');
INSERT INTO `township` VALUES ('5', '未央区', '1');
INSERT INTO `township` VALUES ('6', '雁塔区', '1');

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `user_id` varchar(30) NOT NULL,
  `user_name` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `email` varchar(32) NOT NULL,
  `tel` varchar(11) NOT NULL,
  `level` int(11) DEFAULT '1',
  `integral` int(11) DEFAULT '0',
  `if_new` int(11) DEFAULT '0',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('20190514112608', '张三', 'zhangsan', 'zhangsan@163.com', '13679189439', '1', '0', '1');
INSERT INTO `users` VALUES ('20190516203155', '东方不败', '222222', 'gg@163.com', '15536541234', '1', '0', '1');
INSERT INTO `users` VALUES ('20190516205310', '张无忌', '222222', 'hei@163.com', '17755421234', '1', '0', '1');
INSERT INTO `users` VALUES ('20190516205311', '路飞', '222222', 'lf@163.com', '13715546631', '1', '0', '1');
INSERT INTO `users` VALUES ('20190516205403', '吸氧羊', '222222', 'miemie@163.com', '1235468798', '1', '0', '1');
INSERT INTO `users` VALUES ('20190516205431', '路飞', '222222', 'lf@163.com', '13715546631', '1', '0', '0');
INSERT INTO `users` VALUES ('20190516205457', '蓝猫', '222222', '135445888@qq.com', '15315468536', '1', '0', '0');
INSERT INTO `users` VALUES ('20190516205513', '蔡文姬', '222222', 'cc@163.com', '18312546321', '1', '0', '0');
INSERT INTO `users` VALUES ('20190516205530', '索隆', '222222', 'sl@163.com', '15545876652', '1', '0', '0');
INSERT INTO `users` VALUES ('20190516205542', '乌索普', '222222', 'wspp@163.com', '13865421355', '1', '0', '0');
INSERT INTO `users` VALUES ('20190516205551', '卡普', '222222', 'kp@163.com', '18354568796', '1', '0', '0');
INSERT INTO `users` VALUES ('20190516205603', '黄猿', '222222', 'hy@163.com', '13754632156', '1', '0', '0');
INSERT INTO `users` VALUES ('20190516205613', '乔巴', '123', 'qb@163.com', '13154897845', '1', '0', '0');
INSERT INTO `users` VALUES ('20190516205624', '艾斯', '222222', 'aisi@163.com', '15487965456', '1', '0', '0');
INSERT INTO `users` VALUES ('20190516205633', '赤犬', '222222', 'cq@163.com', '13896421564', '1', '0', '0');
INSERT INTO `users` VALUES ('20190516205654', '多弗朗明哥', '222222', 'duoduo@163.com', '13548976523', '1', '0', '0');
INSERT INTO `users` VALUES ('20200327072332', '李四', '123456', '1234568224@qq.com', '12345678911', '1', '0', '0');
INSERT INTO `users` VALUES ('20200327101444', 'wangwu', '123456', '14@qq.com', '12345678911', '1', '0', '0');
