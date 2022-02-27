/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 50736
 Source Host           : localhost:3306
 Source Schema         : expressage

 Target Server Type    : MySQL
 Target Server Version : 50736
 File Encoding         : 65001

 Date: 28/02/2022 01:00:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for expressage
-- ----------------------------
DROP TABLE IF EXISTS `expressage`;
CREATE TABLE `expressage`  (
  `expressage_id` int(11) NOT NULL AUTO_INCREMENT,
  `expressage_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `expressage_recipient_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `expressage_recipient_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `expressage_logistics_company` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `expressage_delivery_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `expressage_dormitory_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `expressage_message` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `expressage_delivery_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `expressage_recipient_status` tinyint(255) NULL DEFAULT NULL,
  `expressage_pay_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `delivery_id` int(11) NULL DEFAULT NULL,
  `uid` int(11) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`expressage_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of expressage
-- ----------------------------
INSERT INTO `expressage` VALUES (12, '232333', '顶顶顶顶', '222222', '京东', '下午4:00前', '5号楼', '取货地址：5号楼门卫', '已配送', 1, '待支付', 4, 1, '2022-02-27 00:56:49', '2022-02-27 01:08:25');
INSERT INTO `expressage` VALUES (13, '55554', '张三', '8888888', '京东', '下午六点', '5号楼', '取货地址：五号楼门卫', '已配送', 1, '待支付', 4, 1, '2022-02-27 22:51:52', '2022-02-27 23:19:44');

-- ----------------------------
-- Table structure for expressagecompany
-- ----------------------------
DROP TABLE IF EXISTS `expressagecompany`;
CREATE TABLE `expressagecompany`  (
  `expressagecompany_id` int(11) NOT NULL AUTO_INCREMENT,
  `expressagecompany_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`expressagecompany_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of expressagecompany
-- ----------------------------
INSERT INTO `expressagecompany` VALUES (7, '京东');
INSERT INTO `expressagecompany` VALUES (8, '中通');

-- ----------------------------
-- Table structure for expressagenews
-- ----------------------------
DROP TABLE IF EXISTS `expressagenews`;
CREATE TABLE `expressagenews`  (
  `expressage_news_id` int(11) NOT NULL AUTO_INCREMENT,
  `expressage_news_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `expressage_news_info` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`expressage_news_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for expressagestatus
-- ----------------------------
DROP TABLE IF EXISTS `expressagestatus`;
CREATE TABLE `expressagestatus`  (
  `status_id` int(11) NOT NULL AUTO_INCREMENT,
  `expressage_id` int(11) NOT NULL,
  `start_status_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `delivery_status_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `compelete_delivery` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `recipient_status_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `compelete_pay_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`status_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of expressagestatus
-- ----------------------------
INSERT INTO `expressagestatus` VALUES (6, 12, '2022-02-27 00:56:49', '2022-02-27 01:04:06', '2022-02-27 01:07:59', '2022-02-27 01:08:57', NULL);
INSERT INTO `expressagestatus` VALUES (7, 13, '2022-02-27 22:51:52', '2022-02-27 23:18:15', '2022-02-27 23:19:00', '2022-02-27 23:19:44', NULL);

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `href` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parent_id` int(11) NULL DEFAULT NULL,
  `menu_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `role` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (1, NULL, 0, '快递信息', NULL);
INSERT INTO `menu` VALUES (2, NULL, 0, '用户信息', NULL);
INSERT INTO `menu` VALUES (3, NULL, 0, '系统设置', NULL);
INSERT INTO `menu` VALUES (4, '/expressage/myexpressage', 1, '我的快递', '1,2');
INSERT INTO `menu` VALUES (5, '/expressage/myinfo', 2, '我的信息', '1,2');
INSERT INTO `menu` VALUES (6, '/expressage/userlist', 2, '全部用户', '0');
INSERT INTO `menu` VALUES (7, '/expressage/expressage/addexpressageinfo.jsp', 1, '添加快递信息', '2');
INSERT INTO `menu` VALUES (8, '/expressage/Login.jsp', 3, '退出系统', '0,1,2');
INSERT INTO `menu` VALUES (9, '/expressage/companylist', 1, '快递公司', '0,1');
INSERT INTO `menu` VALUES (13, '/expressage/expressagelist?type=1', 1, '待配送快递', '1');
INSERT INTO `menu` VALUES (14, '/expressage/expressagelist?type=0', 1, '全部快递列表', '0');
INSERT INTO `menu` VALUES (15, '/expressage/expressage/addCompany.jsp', 1, '添加快递公司', '0');
INSERT INTO `menu` VALUES (18, '/expressage/companylist', 1, '快递公司列表', '0');
INSERT INTO `menu` VALUES (19, '/expressage/expressage/adduser.jsp', 2, '添加用户', '0');
INSERT INTO `menu` VALUES (21, '/expressage/expressagelist?expressage_logistics_company=京东&type=2', 9, '京东', '0,1');
INSERT INTO `menu` VALUES (22, '/expressage/expressage/addNews.jsp', 3, '添加新闻', '0');
INSERT INTO `menu` VALUES (23, '/expressage/newsList', 3, '新闻列表', '0');
INSERT INTO `menu` VALUES (24, '/expressage/expressagelist?expressage_logistics_company=中通&type=2', 9, '中通', '0,1');

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message`  (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `message_info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `uid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `read_status` tinyint(255) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`message_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES (4, '你好：取件码232333的快递已到达5号楼门卫，请及时查收，谢谢！', '1', 0, '2022-02-27 01:07:58', '2022-02-27 01:07:58');
INSERT INTO `message` VALUES (5, '你好：取件码55554的快递已到达五号楼门卫，请及时查收，谢谢！', '1', 0, '2022-02-27 23:19:00', '2022-02-27 23:19:00');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `order_amount` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `order_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `expressage_id` int(11) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `order_status` tinyint(255) NULL DEFAULT NULL,
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (29, '1645895306003', '0', '收货人：顶顶顶顶 取货码：232333', 12, '2022-02-27 01:08:26', '2022-02-27 01:08:26', NULL);
INSERT INTO `orders` VALUES (30, '1645895337801', '0', '收货人：顶顶顶顶 取货码：232333', 12, '2022-02-27 01:08:57', '2022-02-27 01:08:57', NULL);
INSERT INTO `orders` VALUES (31, '1645895453564', '0', '收货人：顶顶顶顶 取货码：232333', 12, '2022-02-27 01:10:53', '2022-02-27 01:10:53', NULL);
INSERT INTO `orders` VALUES (32, '1645895456085', '0', '收货人：顶顶顶顶 取货码：232333', 12, '2022-02-27 01:10:56', '2022-02-27 01:10:56', NULL);
INSERT INTO `orders` VALUES (33, '1645895460259', '0', '收货人：顶顶顶顶 取货码：232333', 12, '2022-02-27 01:11:00', '2022-02-27 01:11:00', NULL);
INSERT INTO `orders` VALUES (34, '1645975202537', '0', '收货人：张三 取货码：55554', 13, '2022-02-27 23:20:02', '2022-02-27 23:20:02', 0);
INSERT INTO `orders` VALUES (35, '1645979629021', '0', '收货人：张三 取货码：55554', 13, '2022-02-28 00:33:49', '2022-02-28 00:33:49', 0);
INSERT INTO `orders` VALUES (36, '1645979660766', '0.01', '收货人：张三 取货码：55554', 13, '2022-02-28 00:34:20', '2022-02-28 00:38:18', 1);
INSERT INTO `orders` VALUES (37, '1645979694417', '0', '收货人：张三 取货码：55554', 13, '2022-02-28 00:34:54', '2022-02-28 00:36:55', 1);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `uid` int(12) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `role` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE,
  INDEX `userId`(`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'zhangsan', '123456', 2);
INSERT INTO `users` VALUES (2, 'admin', '123456', 0);
INSERT INTO `users` VALUES (4, 'kuaidiyuan1', '123456', 1);
INSERT INTO `users` VALUES (5, 'kuaidiyuan2', '123456', 1);
INSERT INTO `users` VALUES (9, 'kuaidiyuan3', '123456', 1);

-- ----------------------------
-- Triggers structure for table expressage
-- ----------------------------
DROP TRIGGER IF EXISTS `expressage_status`;
delimiter ;;
CREATE TRIGGER `expressage_status` AFTER INSERT ON `expressage` FOR EACH ROW begin
insert into expressagestatus(expressage_id,start_status_time) select expressage_id,create_time from expressage order by expressage_id desc limit 0,1;
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table users
-- ----------------------------
DROP TRIGGER IF EXISTS `username_unique_before_insert`;
delimiter ;;
CREATE TRIGGER `username_unique_before_insert` BEFORE INSERT ON `users` FOR EACH ROW BEGIN
        declare counts int;
        select count(1) into counts from users where username=new.username;
        if counts >0 then 
                SIGNAL SQLSTATE 'HY000' SET MESSAGE_TEXT='用户名重复';
        end if;
                
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
