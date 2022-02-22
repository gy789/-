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

 Date: 23/02/2022 00:22:44
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
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of expressage
-- ----------------------------
INSERT INTO `expressage` VALUES (2, '32323', 'eeee', '15645', '0', '2333', '33', NULL, '已配送', 0, '待支付', 4, 1, '2022-02-18 17:05:17', '2022-02-20 21:14:27');
INSERT INTO `expressage` VALUES (3, '211', '第三方', '1561651', '2', '得到的', '2', NULL, '已配送', 1, '待支付', 5, 1, '2022-02-18 21:54:36', '2022-02-20 20:23:34');
INSERT INTO `expressage` VALUES (4, '5555', '颠三倒四', '1561651', '0', '得到的', '2', '取货地址：3号楼会客室', '已配送', 1, '待支付', 4, 1, '2022-02-19 18:37:54', '2022-02-22 00:21:01');
INSERT INTO `expressage` VALUES (5, '343', '从是抽象方法付付 ', '4343', '2', '得到的', '2', NULL, '已配送', 1, '支付成功', 5, 1, '2022-02-19 18:41:38', '2022-02-20 20:23:37');
INSERT INTO `expressage` VALUES (6, '34555', '孤独感放到', '4343', '0', '得到的', '2', NULL, '已配送', 0, '待支付', 4, 1, '2022-02-19 18:42:57', '2022-02-20 21:05:55');
INSERT INTO `expressage` VALUES (7, '211', '范德萨范德萨发的', '333', '2', '得到的', '44', NULL, '已配送', 0, '待支付', 4, 1, '2022-02-19 22:07:51', '2022-02-20 22:40:29');
INSERT INTO `expressage` VALUES (9, '23232', '孤独感放到第三方', '43434', NULL, '得到的', '44', NULL, '待配送', 0, '待支付', NULL, 1, '2022-02-22 21:15:48', '2022-02-22 21:15:48');
INSERT INTO `expressage` VALUES (10, '343333', '第三方丰东股份dd', '156165122', NULL, '得到的', '55', '取货地址：4号楼门卫', '已配送', 1, '待支付', 4, 1, '2022-02-22 21:23:11', '2022-02-22 21:24:29');

-- ----------------------------
-- Table structure for expressagecompany
-- ----------------------------
DROP TABLE IF EXISTS `expressagecompany`;
CREATE TABLE `expressagecompany`  (
  `expressagecompany_id` int(11) NOT NULL AUTO_INCREMENT,
  `expressagecompany_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`expressagecompany_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of expressagecompany
-- ----------------------------
INSERT INTO `expressagecompany` VALUES (1, '京东');
INSERT INTO `expressagecompany` VALUES (2, '圆通');
INSERT INTO `expressagecompany` VALUES (3, '中通');

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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of expressagestatus
-- ----------------------------
INSERT INTO `expressagestatus` VALUES (2, 2, '2022-02-21 22:25:14', '2022-02-21 22:36:34', NULL, NULL, NULL);
INSERT INTO `expressagestatus` VALUES (3, 9, '2022-02-22 21:15:48', NULL, NULL, NULL, NULL);
INSERT INTO `expressagestatus` VALUES (4, 10, '2022-02-22 21:23:11', '2022-02-22 21:23:37', '2022-02-22 21:24:03', '2022-02-22 21:24:29', NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (1, NULL, 0, '快递信息', NULL);
INSERT INTO `menu` VALUES (2, NULL, 0, '用户信息', NULL);
INSERT INTO `menu` VALUES (3, NULL, 0, '系统设置', NULL);
INSERT INTO `menu` VALUES (4, '/expressage/myexpressage', 1, '我的快递', '1,2');
INSERT INTO `menu` VALUES (5, NULL, 2, '我的信息', '1,2');
INSERT INTO `menu` VALUES (6, NULL, 2, '全部用户', '0');
INSERT INTO `menu` VALUES (7, '/expressage/expressage/addexpressageinfo.jsp', 1, '添加快递信息', '2');
INSERT INTO `menu` VALUES (8, '/expressage/Login.jsp', 3, '退出系统', '0,1,2');
INSERT INTO `menu` VALUES (9, '/expressage/companylist', 1, '快递公司', '0,1');
INSERT INTO `menu` VALUES (10, NULL, 9, '京东', '1');
INSERT INTO `menu` VALUES (11, NULL, 9, '中通', '1');
INSERT INTO `menu` VALUES (12, NULL, 9, '圆通', '1');
INSERT INTO `menu` VALUES (13, '/expressage/expressagelist?type=1', 1, '待配送快递', '1');
INSERT INTO `menu` VALUES (14, '/expressage/expressagelist?type=0', 1, '全部快递列表', '0');

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message`  (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `message_info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `uid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `read_status` tinyint(255) NULL DEFAULT NULL,
  PRIMARY KEY (`message_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES (1, '取货地址：4号楼门卫', '4', 0);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `uid` int(12) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `role` int(11) NOT NULL,
  PRIMARY KEY (`uid`) USING BTREE,
  INDEX `userId`(`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'zhangsan', '123456', 2);
INSERT INTO `users` VALUES (2, 'admin', '123456', 0);
INSERT INTO `users` VALUES (3, 'lisi', '123456', 1);
INSERT INTO `users` VALUES (4, 'kuaidiyuan1', '123456', 1);
INSERT INTO `users` VALUES (5, 'kuaidiyuan2', '123456', 1);

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

SET FOREIGN_KEY_CHECKS = 1;
