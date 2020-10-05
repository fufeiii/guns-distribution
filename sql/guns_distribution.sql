/*
 Navicat Premium Data Transfer
*/

DROP DATABASE IF EXISTS `guns_distribution`;
CREATE DATABASE `guns_distribution` DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_general_ci;
USE `guns_distribution`;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for database_info
-- ----------------------------
DROP TABLE IF EXISTS `database_info`;
CREATE TABLE `database_info`  (
  `db_id` bigint(20) NOT NULL COMMENT '主键id',
  `db_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据库名称（英文名称）',
  `jdbc_driver` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'jdbc的驱动类型',
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据库连接的账号',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据库连接密码',
  `jdbc_url` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'jdbc的url',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注，摘要',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`db_id`) USING BTREE,
  UNIQUE INDEX `NAME_UNIQUE`(`db_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '数据库信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of database_info
-- ----------------------------
INSERT INTO `database_info` VALUES (1313037130070564866, 'master', 'com.mysql.cj.jdbc.Driver', 'root', 'root', 'jdbc:mysql://47.116.1.66:3306/guns_distribution?autoReconnect=true&useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=CONVERT_TO_NULL&useSSL=false&serverTimezone=CTT', '主数据源，项目启动数据源！', '2020-10-05 16:43:41');

-- ----------------------------
-- Table structure for dist_account
-- ----------------------------
DROP TABLE IF EXISTS `dist_account`;
CREATE TABLE `dist_account`  (
  `member_id` bigint(20) NOT NULL COMMENT '会员表主键',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `version` int(11) NOT NULL COMMENT '乐观锁',
  `money_total` decimal(32, 8) NOT NULL COMMENT '总金额',
  `money_available` decimal(32, 8) NOT NULL COMMENT '可用金额',
  `money_frozen` decimal(32, 8) NOT NULL COMMENT '冻结金额',
  `integral_total_history` int(11) NOT NULL COMMENT '历史总积分',
  `integral_total` int(11) NOT NULL COMMENT '总积分',
  `integral_available` int(11) NOT NULL COMMENT '可用积分',
  `integral_frozen` int(11) NOT NULL COMMENT '冻结积分',
  `state` int(11) NOT NULL COMMENT '账户状态',
  PRIMARY KEY (`member_id`) USING BTREE,
  CONSTRAINT `fk_member_id` FOREIGN KEY (`member_id`) REFERENCES `dist_member` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员账户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dist_account
-- ----------------------------
INSERT INTO `dist_account` VALUES (129, '2020-10-05 12:55:33', NULL, 6, 8.14000000, 8.14000000, 0.00000000, 0, 0, 0, 0, 0);
INSERT INTO `dist_account` VALUES (130, '2020-10-05 12:55:51', NULL, 10, 28.38000000, 28.38000000, 0.00000000, 0, 0, 0, 0, 0);
INSERT INTO `dist_account` VALUES (131, '2020-10-05 12:56:08', NULL, 9, 51.64000000, 51.64000000, 0.00000000, 0, 0, 0, 0, 0);
INSERT INTO `dist_account` VALUES (132, '2020-10-05 12:56:22', NULL, 2, 5.00000000, 5.00000000, 0.00000000, 0, 0, 0, 0, 0);
INSERT INTO `dist_account` VALUES (133, '2020-10-05 12:56:40', NULL, 3, 10.00000000, 10.00000000, 0.00000000, 0, 0, 0, 0, 0);
INSERT INTO `dist_account` VALUES (134, '2020-10-05 12:56:56', NULL, 2, 5.00000000, 5.00000000, 0.00000000, 0, 0, 0, 0, 0);
INSERT INTO `dist_account` VALUES (135, '2020-10-05 12:57:15', NULL, 5, 8.00000000, 8.00000000, 0.00000000, 0, 0, 0, 0, 0);
INSERT INTO `dist_account` VALUES (136, '2020-10-05 12:57:35', NULL, 1, 0.00000000, 0.00000000, 0.00000000, 0, 0, 0, 0, 0);
INSERT INTO `dist_account` VALUES (137, '2020-10-05 12:59:14', NULL, 6, 48.29000000, 38.19000000, 10.10000000, 0, 0, 0, 0, 0);
INSERT INTO `dist_account` VALUES (138, '2020-10-05 12:59:29', NULL, 2, 0.00000000, 0.00000000, 0.00000000, 0, 0, 0, 0, 1);
INSERT INTO `dist_account` VALUES (139, '2020-10-05 13:06:42', NULL, 4, 31.21000000, 31.21000000, 0.00000000, 0, 0, 0, 0, 0);
INSERT INTO `dist_account` VALUES (140, '2020-10-05 13:07:04', NULL, 3, 27.44000000, 27.44000000, 0.00000000, 0, 0, 0, 0, 0);
INSERT INTO `dist_account` VALUES (141, '2020-10-05 13:07:17', NULL, 3, 38.66000000, 38.66000000, 0.00000000, 0, 0, 0, 0, 0);
INSERT INTO `dist_account` VALUES (142, '2020-10-05 13:08:48', NULL, 1, 0.00000000, 0.00000000, 0.00000000, 0, 0, 0, 0, 0);
INSERT INTO `dist_account` VALUES (143, '2020-10-05 14:54:33', NULL, 3, 0.00000000, 0.00000000, 0.00000000, 0, 0, 0, 0, 0);

-- ----------------------------
-- Table structure for dist_account_record
-- ----------------------------
DROP TABLE IF EXISTS `dist_account_record`;
CREATE TABLE `dist_account_record`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `platform_username` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '平台标识',
  `member_username` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户标识',
  `account_type` int(11) NULL DEFAULT NULL COMMENT '账户类型',
  `before_change_total` decimal(32, 8) NULL DEFAULT NULL COMMENT '变动前总数',
  `after_change_total` decimal(32, 8) NULL DEFAULT NULL COMMENT '变动后总数',
  `change_amount` decimal(32, 8) NULL DEFAULT NULL COMMENT '变动数',
  `change_type` int(11) NULL DEFAULT NULL COMMENT '变动类型',
  `change_record_id` bigint(20) NULL DEFAULT NULL COMMENT '记录主键',
  `memo` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '账户明细记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dist_account_record
-- ----------------------------
INSERT INTO `dist_account_record` VALUES (1312979794597523458, '2020-10-05 12:55:51', 'aigou', 'aigou1', 0, 0.00000000, 5.00000000, 5.00000000, 0, 1312979794144538626, NULL);
INSERT INTO `dist_account_record` VALUES (1312979867939123202, '2020-10-05 12:56:08', 'aigou', 'aigou2', 0, 0.00000000, 5.00000000, 5.00000000, 0, 1312979867523887106, NULL);
INSERT INTO `dist_account_record` VALUES (1312979924662890497, '2020-10-05 12:56:22', 'aigou', 'aigou2', 0, 5.00000000, 10.00000000, 5.00000000, 0, 1312979924277014529, NULL);
INSERT INTO `dist_account_record` VALUES (1312980000311357441, '2020-10-05 12:56:40', 'aigou', 'aigou4', 0, 0.00000000, 5.00000000, 5.00000000, 0, 1312979999929675777, NULL);
INSERT INTO `dist_account_record` VALUES (1312980069718700034, '2020-10-05 12:56:57', 'aigou', 'aigou5', 0, 0.00000000, 5.00000000, 5.00000000, 0, 1312980069274103809, NULL);
INSERT INTO `dist_account_record` VALUES (1312980150576492545, '2020-10-05 12:57:15', 'aigou', 'aigou3', 0, 0.00000000, 5.00000000, 5.00000000, 0, 1312980149653745666, NULL);
INSERT INTO `dist_account_record` VALUES (1312980233078452225, '2020-10-05 12:57:36', 'aigou', 'aigou7', 0, 0.00000000, 5.00000000, 5.00000000, 0, 1312980232692576258, NULL);
INSERT INTO `dist_account_record` VALUES (1312980368894210050, '2020-10-05 12:58:08', 'aigou', 'aigou7', 0, 5.00000000, 8.00000000, 3.00000000, 0, 1312980368512528385, NULL);
INSERT INTO `dist_account_record` VALUES (1312980371624701954, '2020-10-05 12:58:08', 'aigou', 'aigou3', 0, 5.00000000, 7.00000000, 2.00000000, 0, 1312980371230437378, NULL);
INSERT INTO `dist_account_record` VALUES (1312980374371971074, '2020-10-05 12:58:08', 'aigou', 'aigou2', 0, 10.00000000, 11.00000000, 1.00000000, 0, 1312980373990289410, NULL);
INSERT INTO `dist_account_record` VALUES (1312980651871318017, '2020-10-05 12:59:14', 'aigou', 'aigou3', 0, 7.00000000, 12.00000000, 5.00000000, 0, 1312980648687841281, NULL);
INSERT INTO `dist_account_record` VALUES (1312980715662487553, '2020-10-05 12:59:29', 'aigou', 'aigou5', 0, 5.00000000, 10.00000000, 5.00000000, 0, 1312980713565335554, NULL);
INSERT INTO `dist_account_record` VALUES (1312980885066231810, '2020-10-05 13:00:11', 'aigou', 'aigou3', 0, 12.00000000, 18.06000000, 6.06000000, 0, 1312980884676161538, NULL);
INSERT INTO `dist_account_record` VALUES (1312980887738003458, '2020-10-05 13:00:11', 'aigou', 'aigou2', 0, 11.00000000, 15.04000000, 4.04000000, 0, 1312980887364710402, NULL);
INSERT INTO `dist_account_record` VALUES (1312980890694987777, '2020-10-05 13:00:11', 'aigou', 'aigou1', 0, 5.00000000, 7.02000000, 2.02000000, 0, 1312980890309111810, NULL);
INSERT INTO `dist_account_record` VALUES (1312981329943474177, '2020-10-05 13:01:58', 'aigou', 'aigou1', 0, 7.02000000, 7.02000000, 1.01000000, 2, 1312981329545015297, '账户：aigou1，发起提现申请，金额：1.01，冻结：1.01');
INSERT INTO `dist_account_record` VALUES (1312982056380149761, '2020-10-05 13:04:50', 'aigou', 'aigou3', 0, 18.06000000, 24.45000000, 6.39000000, 0, 1312982055960719361, NULL);
INSERT INTO `dist_account_record` VALUES (1312982059106447361, '2020-10-05 13:04:50', 'aigou', 'aigou2', 0, 15.04000000, 19.30000000, 4.26000000, 0, 1312982058703794178, NULL);
INSERT INTO `dist_account_record` VALUES (1312982061786607618, '2020-10-05 13:04:50', 'aigou', 'aigou1', 0, 7.02000000, 9.15000000, 2.13000000, 0, 1312982061400731650, NULL);
INSERT INTO `dist_account_record` VALUES (1312982527123664897, '2020-10-05 13:06:43', 'aigou', 'aigou9', 0, 0.00000000, 5.00000000, 5.00000000, 0, 1312982526750371841, NULL);
INSERT INTO `dist_account_record` VALUES (1312982616491700225, '2020-10-05 13:07:04', 'aigou', 'aigou11', 0, 0.00000000, 5.00000000, 5.00000000, 0, 1312982616097435650, NULL);
INSERT INTO `dist_account_record` VALUES (1312982674587004930, '2020-10-05 13:07:17', 'aigou', 'aigou12', 0, 0.00000000, 5.00000000, 5.00000000, 0, 1312982674117242881, NULL);
INSERT INTO `dist_account_record` VALUES (1312982789443825665, '2020-10-05 13:07:45', 'aigou', 'aigou9', 0, 5.00000000, 8.33000000, 3.33000000, 0, 1312982789045366785, NULL);
INSERT INTO `dist_account_record` VALUES (1312982792182706177, '2020-10-05 13:07:45', 'aigou', 'aigou3', 0, 24.45000000, 26.67000000, 2.22000000, 0, 1312982791784247297, NULL);
INSERT INTO `dist_account_record` VALUES (1312982794955141121, '2020-10-05 13:07:45', 'aigou', 'aigou2', 0, 19.30000000, 20.41000000, 1.11000000, 0, 1312982794514739202, NULL);
INSERT INTO `dist_account_record` VALUES (1312983056235114497, '2020-10-05 13:08:48', 'aigou', 'aigou13', 0, 0.00000000, 5.00000000, 5.00000000, 0, 1312983055593385986, NULL);
INSERT INTO `dist_account_record` VALUES (1312983249777078273, '2020-10-05 13:09:35', 'aigou', 'aigou13', 0, 5.00000000, 38.66000000, 33.66000000, 0, 1312983249387008002, NULL);
INSERT INTO `dist_account_record` VALUES (1312983252641787906, '2020-10-05 13:09:35', 'aigou', 'aigou12', 0, 5.00000000, 27.44000000, 22.44000000, 0, 1312983252260106242, NULL);
INSERT INTO `dist_account_record` VALUES (1312983255619743745, '2020-10-05 13:09:35', 'aigou', 'aigou11', 0, 5.00000000, 16.22000000, 11.22000000, 0, 1312983255225479170, NULL);
INSERT INTO `dist_account_record` VALUES (1312984721600294913, '2020-10-05 13:15:26', 'aigou', 'aigou9', 0, 8.33000000, 38.30000000, 29.97000000, 0, 1312984721218613250, NULL);
INSERT INTO `dist_account_record` VALUES (1312984724276260865, '2020-10-05 13:15:26', 'aigou', 'aigou3', 0, 26.67000000, 46.65000000, 19.98000000, 0, 1312984723898773505, NULL);
INSERT INTO `dist_account_record` VALUES (1312984726931255297, '2020-10-05 13:15:26', 'aigou', 'aigou2', 0, 20.41000000, 30.40000000, 9.99000000, 0, 1312984726528602113, NULL);
INSERT INTO `dist_account_record` VALUES (1312984866878402562, '2020-10-05 13:16:00', 'aigou', 'aigou11', 0, 16.22000000, 31.21000000, 14.99000000, 0, 1312984866488332289, NULL);
INSERT INTO `dist_account_record` VALUES (1312984869587922946, '2020-10-05 13:16:00', 'aigou', 'aigou9', 0, 38.30000000, 48.29000000, 9.99000000, 0, 1312984869176881153, NULL);
INSERT INTO `dist_account_record` VALUES (1312984874700779522, '2020-10-05 13:16:00', 'aigou', 'aigou3', 0, 46.65000000, 51.64000000, 4.99000000, 0, 1312984874302320642, NULL);
INSERT INTO `dist_account_record` VALUES (1313009666422222850, '2020-10-05 14:54:33', 'aigou', 'aigou6', 0, 0.00000000, 5.00000000, 5.00000000, 0, 1313009665965043714, NULL);
INSERT INTO `dist_account_record` VALUES (1313017332506832898, '2020-10-05 15:25:01', 'aigou', 'aigou1', 0, 9.15000000, 8.14000000, 1.01000000, 1, 1312981329545015297, '用户提现取出1元，手续费0.01元');
INSERT INTO `dist_account_record` VALUES (1313017401855455233, '2020-10-05 15:25:18', 'aigou', 'aigou2', 0, 30.40000000, 30.40000000, 2.02000000, 2, 1313017399070437378, '账户：aigou2，发起提现申请，金额：2.02，冻结：2.02');
INSERT INTO `dist_account_record` VALUES (1313017475993972737, '2020-10-05 15:25:36', 'aigou', 'aigou7', 0, 8.00000000, 8.00000000, 5.05000000, 2, 1313017475582930946, '账户：aigou7，发起提现申请，金额：5.05，冻结：5.05');
INSERT INTO `dist_account_record` VALUES (1313017568402878465, '2020-10-05 15:25:58', 'aigou', 'aigou7', 0, 8.00000000, 8.00000000, 5.05000000, 3, 1313017475582930946, NULL);
INSERT INTO `dist_account_record` VALUES (1313018333062246402, '2020-10-05 15:29:00', 'aigou', 'aigou9', 0, 48.29000000, 48.29000000, 10.10000000, 2, 1313018332651204609, '账户：aigou9，发起提现申请，金额：10.10，冻结：10.10');
INSERT INTO `dist_account_record` VALUES (1313018517791977474, '2020-10-05 15:29:44', 'aigou', 'aigou2', 0, 30.40000000, 28.38000000, 2.02000000, 1, 1313017399070437378, '用户提现取出2元，手续费0.02元');

-- ----------------------------
-- Table structure for dist_member
-- ----------------------------
DROP TABLE IF EXISTS `dist_member`;
CREATE TABLE `dist_member`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `version` int(11) NOT NULL COMMENT '乐观锁',
  `platform_username` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '平台标识',
  `member_username` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户标识',
  `member_nickname` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户昵称',
  `member_avatar` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户头像',
  `fir_parent` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '直属父级 第一层级父级标识',
  `sec_parent` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '第二层级父级标识',
  `thr_parent` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '第三层级父级标识',
  `parent_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '父级全路径 余留字段备用',
  `member_type` int(11) NOT NULL COMMENT '用户身份',
  `member_rank` int(11) NOT NULL COMMENT '用户段位',
  `state` int(11) NOT NULL COMMENT '用户状态',
  `memo` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_member_username`(`member_username`) USING BTREE,
  INDEX `idx_parent_username`(`fir_parent`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 144 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dist_member
-- ----------------------------
INSERT INTO `dist_member` VALUES (129, '2020-10-05 12:55:33', NULL, 1, 'aigou', 'aigou1', '艾购1', '', '', NULL, NULL, NULL, 0, 0, 0, '');
INSERT INTO `dist_member` VALUES (130, '2020-10-05 12:55:51', NULL, 1, 'aigou', 'aigou2', '艾购2', '', 'aigou1', NULL, NULL, 'aigou1', 0, 0, 0, '');
INSERT INTO `dist_member` VALUES (131, '2020-10-05 12:56:08', NULL, 1, 'aigou', 'aigou3', '艾购3', '', 'aigou2', 'aigou1', NULL, 'aigou2.aigou1', 0, 0, 0, '');
INSERT INTO `dist_member` VALUES (132, '2020-10-05 12:56:22', NULL, 1, 'aigou', 'aigou4', '艾购4', '', 'aigou2', 'aigou1', NULL, 'aigou2.aigou1', 0, 0, 0, '');
INSERT INTO `dist_member` VALUES (133, '2020-10-05 12:56:40', NULL, 1, 'aigou', 'aigou5', '艾购5', '', 'aigou4', 'aigou2', 'aigou1', 'aigou4.aigou2.aigou1', 0, 0, 0, '');
INSERT INTO `dist_member` VALUES (134, '2020-10-05 12:56:56', NULL, 1, 'aigou', 'aigou6', '艾购6', '', 'aigou5', 'aigou4', 'aigou2', 'aigou5.aigou4.aigou2', 0, 0, 0, '');
INSERT INTO `dist_member` VALUES (135, '2020-10-05 12:57:14', NULL, 1, 'aigou', 'aigou7', '艾购7', '', 'aigou3', 'aigou2', 'aigou1', 'aigou3.aigou2.aigou1', 0, 0, 0, '');
INSERT INTO `dist_member` VALUES (136, '2020-10-05 12:57:35', NULL, 1, 'aigou', 'aigou8', '艾购8', '', 'aigou7', 'aigou3', 'aigou2', 'aigou7.aigou3.aigou2', 0, 0, 0, '');
INSERT INTO `dist_member` VALUES (137, '2020-10-05 12:59:13', NULL, 1, 'aigou', 'aigou9', '艾购9', '', 'aigou3', 'aigou2', 'aigou1', 'aigou3.aigou2.aigou1', 0, 0, 0, '');
INSERT INTO `dist_member` VALUES (138, '2020-10-05 12:59:28', NULL, 1, 'aigou', 'aigou10', '艾购10', '', 'aigou5', 'aigou4', 'aigou2', 'aigou5.aigou4.aigou2', 0, 0, 0, '');
INSERT INTO `dist_member` VALUES (139, '2020-10-05 13:06:42', NULL, 1, 'aigou', 'aigou11', '艾购11', '', 'aigou9', 'aigou3', 'aigou2', 'aigou9.aigou3.aigou2', 0, 0, 0, '');
INSERT INTO `dist_member` VALUES (140, '2020-10-05 13:07:03', NULL, 1, 'aigou', 'aigou12', '艾购12', '', 'aigou11', 'aigou9', 'aigou3', 'aigou11.aigou9.aigou3', 0, 0, 0, '');
INSERT INTO `dist_member` VALUES (141, '2020-10-05 13:07:17', NULL, 1, 'aigou', 'aigou13', '艾购13', '', 'aigou12', 'aigou11', 'aigou9', 'aigou12.aigou11.aigou9', 0, 0, 0, '');
INSERT INTO `dist_member` VALUES (142, '2020-10-05 13:08:48', NULL, 1, 'aigou', 'aigou14', '艾购14', '', 'aigou13', 'aigou12', 'aigou11', 'aigou13.aigou12.aigou11', 0, 0, 0, '');
INSERT INTO `dist_member` VALUES (143, '2020-10-05 14:54:32', NULL, 1, 'aigou', 'aigou15', '艾购15', '', 'aigou6', 'aigou5', 'aigou4', 'aigou6.aigou5.aigou4', 0, 0, 0, '');

-- ----------------------------
-- Table structure for dist_platform
-- ----------------------------
DROP TABLE IF EXISTS `dist_platform`;
CREATE TABLE `dist_platform`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `version` int(11) NOT NULL COMMENT '乐观锁',
  `platform_username` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '平台标识',
  `platform_nickname` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '平台名称',
  `state` int(11) NOT NULL COMMENT '状态',
  `memo` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `sys_id` bigint(20) NOT NULL COMMENT '系统管理员id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_platform_username`(`platform_username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '平台' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dist_platform
-- ----------------------------
INSERT INTO `dist_platform` VALUES (1312014353360351233, '2020-10-02 20:59:33', NULL, 1, 'aigou', '艾购AiGou', 0, '', 1312014352508907522);

-- ----------------------------
-- Table structure for dist_profit_event
-- ----------------------------
DROP TABLE IF EXISTS `dist_profit_event`;
CREATE TABLE `dist_profit_event`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `create_time` datetime(0) NOT NULL COMMENT '创建事件',
  `platform_username` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '平台标识',
  `profit_type` int(11) NOT NULL COMMENT '分润类型',
  `trigger_member_username` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '事件触发人',
  `event_number` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '事件编号，交易分润时为商户订单编号',
  `event_price` decimal(32, 8) NULL DEFAULT NULL COMMENT '事件金额，目前仅交易分润记录订单金额',
  `memo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '分润事件。存在分润事件，不一定产生分润记录，产生分润记录一定存在分润事件。' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dist_profit_event
-- ----------------------------
INSERT INTO `dist_profit_event` VALUES (1312979791846060033, '2020-10-05 12:55:51', 'aigou', 1, 'aigou2', 'INVITE_1601873751016', NULL, 'aigou1等, 1人获得分润');
INSERT INTO `dist_profit_event` VALUES (1312979864449462274, '2020-10-05 12:56:08', 'aigou', 1, 'aigou3', 'INVITE_1601873768324', NULL, 'aigou2等, 1人获得分润');
INSERT INTO `dist_profit_event` VALUES (1312979922016284674, '2020-10-05 12:56:22', 'aigou', 1, 'aigou4', 'INVITE_1601873782052', NULL, 'aigou2等, 1人获得分润');
INSERT INTO `dist_profit_event` VALUES (1312979997480202242, '2020-10-05 12:56:40', 'aigou', 1, 'aigou5', 'INVITE_1601873800045', NULL, 'aigou4等, 1人获得分润');
INSERT INTO `dist_profit_event` VALUES (1312980066866573314, '2020-10-05 12:56:57', 'aigou', 1, 'aigou6', 'INVITE_1601873816588', NULL, 'aigou5等, 1人获得分润');
INSERT INTO `dist_profit_event` VALUES (1312980144767381505, '2020-10-05 12:57:15', 'aigou', 1, 'aigou7', 'INVITE_1601873835159', NULL, 'aigou3等, 1人获得分润');
INSERT INTO `dist_profit_event` VALUES (1312980230457012226, '2020-10-05 12:57:36', 'aigou', 1, 'aigou8', 'INVITE_1601873855592', NULL, 'aigou7等, 1人获得分润');
INSERT INTO `dist_profit_event` VALUES (1312980366570565633, '2020-10-05 12:58:08', 'aigou', 0, 'aigou8', 'aigou8_order123', 100.00000000, 'aigou7, aigou3, aigou2等, 3人获得分润');
INSERT INTO `dist_profit_event` VALUES (1312980645181403137, '2020-10-05 12:59:14', 'aigou', 1, 'aigou9', 'INVITE_1601873954469', NULL, 'aigou3等, 1人获得分润');
INSERT INTO `dist_profit_event` VALUES (1312980706682482689, '2020-10-05 12:59:29', 'aigou', 1, 'aigou10', 'INVITE_1601873969132', NULL, 'aigou5等, 1人获得分润');
INSERT INTO `dist_profit_event` VALUES (1312980881928892418, '2020-10-05 13:00:11', 'aigou', 0, 'aigou9', 'aigou9_order123', 202.00000000, 'aigou3, aigou2, aigou1等, 3人获得分润');
INSERT INTO `dist_profit_event` VALUES (1312982054018756609, '2020-10-05 13:04:50', 'aigou', 0, 'aigou7', 'aigou7_order123', 213.00000000, 'aigou3, aigou2, aigou1等, 3人获得分润');
INSERT INTO `dist_profit_event` VALUES (1312982524514807809, '2020-10-05 13:06:43', 'aigou', 1, 'aigou11', 'INVITE_1601874402538', NULL, 'aigou9等, 1人获得分润');
INSERT INTO `dist_profit_event` VALUES (1312982613887037442, '2020-10-05 13:07:04', 'aigou', 1, 'aigou12', 'INVITE_1601874423844', NULL, 'aigou11等, 1人获得分润');
INSERT INTO `dist_profit_event` VALUES (1312982669776138241, '2020-10-05 13:07:17', 'aigou', 1, 'aigou13', 'INVITE_1601874437169', NULL, 'aigou12等, 1人获得分润');
INSERT INTO `dist_profit_event` VALUES (1312982787149541378, '2020-10-05 13:07:45', 'aigou', 0, 'aigou11', 'aigou11_order123', 111.00000000, 'aigou9, aigou3, aigou2等, 3人获得分润');
INSERT INTO `dist_profit_event` VALUES (1312983051743014913, '2020-10-05 13:08:48', 'aigou', 1, 'aigou14', 'INVITE_1601874528237', NULL, 'aigou13等, 1人获得分润');
INSERT INTO `dist_profit_event` VALUES (1312983246450995202, '2020-10-05 13:09:35', 'aigou', 0, 'aigou14', 'aigou14_order123', 1122.00000000, 'aigou13, aigou12, aigou11等, 3人获得分润');
INSERT INTO `dist_profit_event` VALUES (1312984719289233409, '2020-10-05 13:15:26', 'aigou', 0, 'aigou11', 'aigou11_order123', 999.00000000, 'aigou9, aigou3, aigou2等, 3人获得分润');
INSERT INTO `dist_profit_event` VALUES (1312984864219213826, '2020-10-05 13:16:00', 'aigou', 0, 'aigou12', 'aigou12_order123', 499.99000000, 'aigou11, aigou9, aigou3等, 3人获得分润');
INSERT INTO `dist_profit_event` VALUES (1313009663381352450, '2020-10-05 14:54:33', 'aigou', 1, 'aigou15', 'INVITE_1601880872942', NULL, 'aigou6等, 1人获得分润');

-- ----------------------------
-- Table structure for dist_profit_param
-- ----------------------------
DROP TABLE IF EXISTS `dist_profit_param`;
CREATE TABLE `dist_profit_param`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `version` int(11) NOT NULL COMMENT '乐观锁',
  `platform_username` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '平台标识',
  `account_type` int(11) NOT NULL COMMENT '账户类型',
  `profit_type` int(11) NOT NULL COMMENT '分润类型',
  `calculate_mode` int(11) NOT NULL COMMENT '计算方式',
  `profit_level` int(11) NOT NULL COMMENT '分润等级',
  `profit_ratio` decimal(32, 8) NOT NULL COMMENT '分润比例',
  `member_type` int(11) NOT NULL COMMENT '用户类型',
  `member_rank` int(11) NOT NULL COMMENT '用户段位',
  `state` int(11) NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '分润参数' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dist_profit_param
-- ----------------------------
INSERT INTO `dist_profit_param` VALUES (1312016989199396865, '2020-10-02 21:10:01', NULL, 1, 'aigou', 0, 0, 0, 1, 0.03000000, 0, 0, 0);
INSERT INTO `dist_profit_param` VALUES (1312017040961302530, '2020-10-02 21:10:13', NULL, 1, 'aigou', 0, 0, 0, 2, 0.02000000, 0, 0, 0);
INSERT INTO `dist_profit_param` VALUES (1312017079783780353, '2020-10-02 21:10:23', NULL, 1, 'aigou', 0, 0, 0, 3, 0.01000000, 0, 0, 0);
INSERT INTO `dist_profit_param` VALUES (1312017729993175041, '2020-10-02 21:12:58', NULL, 1, 'aigou', 0, 1, 1, 1, 5.00000000, 0, 0, 0);
INSERT INTO `dist_profit_param` VALUES (1312017835014352897, '2020-10-02 21:13:23', NULL, 2, 'aigou', 0, 2, 1, 0, 2.00000000, 0, 1, 0);

-- ----------------------------
-- Table structure for dist_profit_record
-- ----------------------------
DROP TABLE IF EXISTS `dist_profit_record`;
CREATE TABLE `dist_profit_record`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `event_id` bigint(20) NOT NULL COMMENT '事件主键',
  `account_type` int(11) NOT NULL COMMENT '账户类型',
  `impact_member_username` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '获利人',
  `income_amount` decimal(32, 8) NOT NULL COMMENT '获利数',
  `memo` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_event_id`(`event_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '分润记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dist_profit_record
-- ----------------------------
INSERT INTO `dist_profit_record` VALUES (1312979794144538626, '2020-10-05 12:55:51', 1312979791846060033, 0, 'aigou1', 5.00000000, NULL);
INSERT INTO `dist_profit_record` VALUES (1312979867523887106, '2020-10-05 12:56:08', 1312979864449462274, 0, 'aigou2', 5.00000000, NULL);
INSERT INTO `dist_profit_record` VALUES (1312979924277014529, '2020-10-05 12:56:22', 1312979922016284674, 0, 'aigou2', 5.00000000, NULL);
INSERT INTO `dist_profit_record` VALUES (1312979999929675777, '2020-10-05 12:56:40', 1312979997480202242, 0, 'aigou4', 5.00000000, NULL);
INSERT INTO `dist_profit_record` VALUES (1312980069274103809, '2020-10-05 12:56:57', 1312980066866573314, 0, 'aigou5', 5.00000000, NULL);
INSERT INTO `dist_profit_record` VALUES (1312980149653745666, '2020-10-05 12:57:15', 1312980144767381505, 0, 'aigou3', 5.00000000, NULL);
INSERT INTO `dist_profit_record` VALUES (1312980232692576258, '2020-10-05 12:57:36', 1312980230457012226, 0, 'aigou7', 5.00000000, NULL);
INSERT INTO `dist_profit_record` VALUES (1312980368512528385, '2020-10-05 12:58:08', 1312980366570565633, 0, 'aigou7', 3.00000000, NULL);
INSERT INTO `dist_profit_record` VALUES (1312980371230437378, '2020-10-05 12:58:08', 1312980366570565633, 0, 'aigou3', 2.00000000, NULL);
INSERT INTO `dist_profit_record` VALUES (1312980373990289410, '2020-10-05 12:58:08', 1312980366570565633, 0, 'aigou2', 1.00000000, NULL);
INSERT INTO `dist_profit_record` VALUES (1312980648687841281, '2020-10-05 12:59:14', 1312980645181403137, 0, 'aigou3', 5.00000000, NULL);
INSERT INTO `dist_profit_record` VALUES (1312980713565335554, '2020-10-05 12:59:29', 1312980706682482689, 0, 'aigou5', 5.00000000, NULL);
INSERT INTO `dist_profit_record` VALUES (1312980884676161538, '2020-10-05 13:00:11', 1312980881928892418, 0, 'aigou3', 6.06000000, NULL);
INSERT INTO `dist_profit_record` VALUES (1312980887364710402, '2020-10-05 13:00:11', 1312980881928892418, 0, 'aigou2', 4.04000000, NULL);
INSERT INTO `dist_profit_record` VALUES (1312980890309111810, '2020-10-05 13:00:11', 1312980881928892418, 0, 'aigou1', 2.02000000, NULL);
INSERT INTO `dist_profit_record` VALUES (1312982055960719361, '2020-10-05 13:04:50', 1312982054018756609, 0, 'aigou3', 6.39000000, NULL);
INSERT INTO `dist_profit_record` VALUES (1312982058703794178, '2020-10-05 13:04:50', 1312982054018756609, 0, 'aigou2', 4.26000000, NULL);
INSERT INTO `dist_profit_record` VALUES (1312982061400731650, '2020-10-05 13:04:50', 1312982054018756609, 0, 'aigou1', 2.13000000, NULL);
INSERT INTO `dist_profit_record` VALUES (1312982526750371841, '2020-10-05 13:06:43', 1312982524514807809, 0, 'aigou9', 5.00000000, NULL);
INSERT INTO `dist_profit_record` VALUES (1312982616097435650, '2020-10-05 13:07:04', 1312982613887037442, 0, 'aigou11', 5.00000000, NULL);
INSERT INTO `dist_profit_record` VALUES (1312982674117242881, '2020-10-05 13:07:17', 1312982669776138241, 0, 'aigou12', 5.00000000, NULL);
INSERT INTO `dist_profit_record` VALUES (1312982789045366785, '2020-10-05 13:07:45', 1312982787149541378, 0, 'aigou9', 3.33000000, NULL);
INSERT INTO `dist_profit_record` VALUES (1312982791784247297, '2020-10-05 13:07:45', 1312982787149541378, 0, 'aigou3', 2.22000000, NULL);
INSERT INTO `dist_profit_record` VALUES (1312982794514739202, '2020-10-05 13:07:45', 1312982787149541378, 0, 'aigou2', 1.11000000, NULL);
INSERT INTO `dist_profit_record` VALUES (1312983055593385986, '2020-10-05 13:08:48', 1312983051743014913, 0, 'aigou13', 5.00000000, NULL);
INSERT INTO `dist_profit_record` VALUES (1312983249387008002, '2020-10-05 13:09:35', 1312983246450995202, 0, 'aigou13', 33.66000000, NULL);
INSERT INTO `dist_profit_record` VALUES (1312983252260106242, '2020-10-05 13:09:35', 1312983246450995202, 0, 'aigou12', 22.44000000, NULL);
INSERT INTO `dist_profit_record` VALUES (1312983255225479170, '2020-10-05 13:09:35', 1312983246450995202, 0, 'aigou11', 11.22000000, NULL);
INSERT INTO `dist_profit_record` VALUES (1312984721218613250, '2020-10-05 13:15:26', 1312984719289233409, 0, 'aigou9', 29.97000000, NULL);
INSERT INTO `dist_profit_record` VALUES (1312984723898773505, '2020-10-05 13:15:26', 1312984719289233409, 0, 'aigou3', 19.98000000, NULL);
INSERT INTO `dist_profit_record` VALUES (1312984726528602113, '2020-10-05 13:15:26', 1312984719289233409, 0, 'aigou2', 9.99000000, NULL);
INSERT INTO `dist_profit_record` VALUES (1312984866488332289, '2020-10-05 13:16:00', 1312984864219213826, 0, 'aigou11', 14.99000000, NULL);
INSERT INTO `dist_profit_record` VALUES (1312984869176881153, '2020-10-05 13:16:00', 1312984864219213826, 0, 'aigou9', 9.99000000, NULL);
INSERT INTO `dist_profit_record` VALUES (1312984874302320642, '2020-10-05 13:16:00', 1312984864219213826, 0, 'aigou3', 4.99000000, NULL);
INSERT INTO `dist_profit_record` VALUES (1313009665965043714, '2020-10-05 14:54:33', 1313009663381352450, 0, 'aigou6', 5.00000000, NULL);

-- ----------------------------
-- Table structure for dist_rank_param
-- ----------------------------
DROP TABLE IF EXISTS `dist_rank_param`;
CREATE TABLE `dist_rank_param`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `version` int(11) NOT NULL COMMENT '乐观锁',
  `platform_username` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '平台标识',
  `member_rank` int(11) NOT NULL COMMENT '用户段位',
  `begin_integral` int(11) NOT NULL COMMENT '开始积分',
  `end_integral` int(11) NOT NULL COMMENT '结束积分',
  `state` int(11) NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '段位配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dist_rank_param
-- ----------------------------
INSERT INTO `dist_rank_param` VALUES (1312021547149434881, '2020-10-02 21:28:08', NULL, 1, 'aigou', 0, 0, 100, 0);
INSERT INTO `dist_rank_param` VALUES (1312021617651490818, '2020-10-02 21:28:24', NULL, 1, 'aigou', 1, 101, 250, 0);
INSERT INTO `dist_rank_param` VALUES (1312021725361217537, '2020-10-02 21:28:50', NULL, 1, 'aigou', 2, 251, 450, 0);
INSERT INTO `dist_rank_param` VALUES (1312021802884538370, '2020-10-02 21:29:09', NULL, 1, 'aigou', 3, 451, 700, 0);
INSERT INTO `dist_rank_param` VALUES (1312021871243304961, '2020-10-02 21:29:25', NULL, 1, 'aigou', 4, 701, 999999, 0);

-- ----------------------------
-- Table structure for dist_withdraw_record
-- ----------------------------
DROP TABLE IF EXISTS `dist_withdraw_record`;
CREATE TABLE `dist_withdraw_record`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `handle_time` datetime(0) NULL DEFAULT NULL COMMENT '处理时间',
  `version` int(11) NOT NULL COMMENT '乐观锁',
  `platform_username` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '平台标识',
  `member_username` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户标识',
  `withdraw_number` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '提现单号',
  `withdraw_amount` decimal(32, 8) NULL DEFAULT NULL COMMENT '提现金额',
  `memo` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `fee_amount` decimal(32, 8) NULL DEFAULT NULL COMMENT '手续费',
  `dispose_state` int(11) NULL DEFAULT NULL COMMENT '处理状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '提现申请记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dist_withdraw_record
-- ----------------------------
INSERT INTO `dist_withdraw_record` VALUES (1312981329545015297, '2020-10-05 13:01:58', '2020-10-05 15:24:41', 3, 'aigou', 'aigou1', 'aigou1_20201005130157627', 1.00000000, '通过', 0.01000000, 2);
INSERT INTO `dist_withdraw_record` VALUES (1313017399070437378, '2020-10-05 15:25:17', '2020-10-05 15:29:23', 3, 'aigou', 'aigou2', 'aigou2_20201005152517273', 2.00000000, '通过', 0.02000000, 2);
INSERT INTO `dist_withdraw_record` VALUES (1313017475582930946, '2020-10-05 15:25:36', '2020-10-05 15:25:58', 2, 'aigou', 'aigou7', 'aigou7_20201005152535520', 5.00000000, '恶意刷单', 0.05000000, 3);
INSERT INTO `dist_withdraw_record` VALUES (1313018332651204609, '2020-10-05 15:29:00', NULL, 1, 'aigou', 'aigou9', 'aigou9_20201005152859861', 10.00000000, NULL, 0.10000000, 0);

-- ----------------------------
-- Table structure for excel_export_deploy
-- ----------------------------
DROP TABLE IF EXISTS `excel_export_deploy`;
CREATE TABLE `excel_export_deploy`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'excel导出配置名称',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文件名称',
  `nid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '唯一标识',
  `template` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '模版路径',
  `data_source` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据源',
  `status` tinyint(3) NULL DEFAULT NULL COMMENT '0开启1关闭',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `E_E_D_NID`(`nid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'excel导出配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of excel_export_deploy
-- ----------------------------
INSERT INTO `excel_export_deploy` VALUES (1, '测试导出excel', '#{name}导出文件', 'test', '/uploadFiles/excelExportTemplate/1240266064118456322.xlsx', 'import cn.stylefeng.roses.core.data.SqlExe;\n\nimport javax.servlet.http.HttpServletRequest;\nimport java.util.HashMap;\nimport java.util.List;\nimport java.util.Map;\n\npublic class Engine {\n    public Map<String, Object> run(HttpServletRequest request) {\n        Map<String, Object> map = new HashMap<String, Object>();\n        // 通过request 可获取前台传来的参数\n        // 通过 GroovyTool.findManyRowData(sql, dataSource) 可获得对应的数据源\n        // 可像正常的使用java一样调用java类、方法以及Spring的bean\n        List<Map<String, Object>> list = SqlExe.selectList(\"SELECT * FROM `sys_dict`\", null);\n        map.put(\"name\", \"系统字典属性内容\");\n        map.put(\"list\", list);\n        System.out.println(\"123123123\");\n        return map;\n    }\n}', 0);

-- ----------------------------
-- Table structure for oauth_user_info
-- ----------------------------
DROP TABLE IF EXISTS `oauth_user_info`;
CREATE TABLE `oauth_user_info`  (
  `oauth_id` bigint(20) NOT NULL COMMENT '主键id',
  `user_id` bigint(20) NOT NULL COMMENT '用户主键id',
  `nick_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `avatar` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
  `blog` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户网址',
  `company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在公司',
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '位置',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户备注（各平台中的用户个人介绍）',
  `gender` int(11) NULL DEFAULT NULL COMMENT '性别，1-男，0-女',
  `source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户来源',
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户授权的token',
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '第三方平台的用户唯一di',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_user` bigint(20) NULL DEFAULT NULL COMMENT '创建用户',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_user` bigint(20) NULL DEFAULT NULL COMMENT '更新用户',
  PRIMARY KEY (`oauth_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '第三方用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oauth_user_info
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `code` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '属性编码标识',
  `dict_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否是字典中的值',
  `dict_type_id` bigint(20) NULL DEFAULT NULL COMMENT '字典类型的编码',
  `value` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '属性值，如果是字典中的类型，则为dict的code',
  `remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_user` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_user` bigint(20) NULL DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '参数配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1143324237579165697, '验证码开关', 'GUNS_KAPTCHA_OPEN', 'Y', 1106120265689055233, 'DISABLE', '是否开启验证码', '2019-06-24 12:46:43', 1, '2019-06-25 09:04:42', 1);
INSERT INTO `sys_config` VALUES (1143386834613694465, '阿里云短信的keyId', 'GUNS_SMS_ACCESSKEY_ID', 'N', NULL, 'xxxkey', '阿里云短信的密钥key', '2019-06-25 13:13:59', 1, '2019-06-25 13:19:21', 1);
INSERT INTO `sys_config` VALUES (1143386953933254657, '阿里云短信的secret', 'GUNS_SMS_ACCESSKEY_SECRET', 'N', NULL, 'xxxsecret', '阿里云短信的secret', '2019-06-25 13:14:28', 1, NULL, NULL);
INSERT INTO `sys_config` VALUES (1143387023449649154, '阿里云短信的签名', 'GUNS_SMS_SIGN_NAME', 'N', NULL, 'xxxsign', '阿里云短信的签名', '2019-06-25 13:14:44', 1, NULL, NULL);
INSERT INTO `sys_config` VALUES (1143387131109044225, '阿里云短信登录的模板号', 'GUNS_SMS_LOGIN_TEMPLATE_CODE', 'N', NULL, 'SMS_XXXXXX', '阿里云短信登录的模板号', '2019-06-25 13:15:10', 1, NULL, NULL);
INSERT INTO `sys_config` VALUES (1143387225019510785, '验证码短信失效时间', 'GUNS_SMS_INVALIDATE_MINUTES', 'N', NULL, '2', '验证码短信失效时间', '2019-06-25 13:15:32', 1, NULL, NULL);
INSERT INTO `sys_config` VALUES (1143468689664876546, '管理系统名称', 'GUNS_SYSTEM_NAME', 'N', NULL, '分销中心', '系统名称', '2019-06-25 18:39:15', 1, '2020-08-14 23:22:03', 1);
INSERT INTO `sys_config` VALUES (1143468867767607297, '默认系统密码', 'GUNS_DEFAULT_PASSWORD', 'N', NULL, '111111', '默认系统密码', '2019-06-25 18:39:57', 1, NULL, NULL);
INSERT INTO `sys_config` VALUES (1143469008025133058, 'OAuth2登录用户的账号标识', 'GUNS_OAUTH2_PREFIX', 'N', NULL, 'oauth2', 'OAuth2登录用户的账号标识', '2019-06-25 18:40:31', 1, NULL, NULL);
INSERT INTO `sys_config` VALUES (1145207130463191041, '顶部导航条是否开启', 'GUNS_DEFAULT_ADVERT', 'Y', 1106120265689055233, 'DISABLE', '顶部Guns广告是否开启', '2019-06-30 13:47:11', 1, '2020-01-01 17:22:52', 1);
INSERT INTO `sys_config` VALUES (1145915627211370498, 'Guns发布的编号', 'GUNS_SYSTEM_RELEASE_VERSION', 'N', NULL, '20200318', '用于防止浏览器缓存相关的js和css', '2019-07-02 12:42:30', 1, NULL, NULL);
INSERT INTO `sys_config` VALUES (1145915627211370499, '文件上传路径', 'GUNS_FILE_UPLOAD_PATH', 'N', NULL, 'D:/tmp/', '文件上传默认目录', '2019-08-30 09:10:40', 1, NULL, NULL);
INSERT INTO `sys_config` VALUES (1145915627211370500, 'BPMN文件上传路径', 'GUNS_BPMN_FILE_UPLOAD_PATH', 'N', NULL, 'D:/tmp/', '工作流文件上传默认目录', '2019-08-30 09:10:40', 1, NULL, NULL);
INSERT INTO `sys_config` VALUES (1145915627211370501, '获取系统的密钥过期时间', 'GUNS_JWT_SECRET_EXPIRE', 'N', NULL, '86400', '获取系统地密钥过期时间（单位：秒），默认1天', '2019-10-16 23:02:39', 1, '2020-08-08 17:20:58', 1);
INSERT INTO `sys_config` VALUES (1145915627211370502, '获取token的header标识', 'GUNS_TOKEN_HEADER_NAME', 'N', NULL, 'Authorization', '获取token的header标识', '2019-10-16 23:02:39', 1, NULL, NULL);
INSERT INTO `sys_config` VALUES (1145915627211370503, '获取租户是否开启的标识', 'GUNS_TENANT_OPEN', 'Y', 1106120265689055233, 'DISABLE', '获取租户是否开启的标识，默认是关的', '2019-10-16 23:02:39', 1, NULL, NULL);
INSERT INTO `sys_config` VALUES (1145915627211370504, '系统的密钥', 'GUNS_JWT_SECRET', 'N', NULL, 'kpvc689sjt7x4sd0hchh6ow1bpcweoqi', '暂不清楚', '2019-10-16 23:02:39', 1, '2020-08-08 17:20:58', 1);
INSERT INTO `sys_config` VALUES (1294555100462792705, '分销模块父级路径长度', 'GUNS_DIST_PARENT_PATH_LENGTH', 'N', NULL, '3', '【关键参数】规定parent_path字段记录的上级会员的个数', '2020-08-15 16:42:42', 1, '2020-09-12 17:43:55', 1);
INSERT INTO `sys_config` VALUES (1299652449673437186, '分销提现百分比', 'GUNS_DIST_WITHDRAW_RATIO', 'N', NULL, '1', '【关键参数】收取百分之一的手续费。请勿随意乱动', '2020-08-29 18:17:45', 1, '2020-09-12 17:43:05', 1);

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL COMMENT '主键id',
  `pid` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `pids` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '父级ids',
  `simple_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '简称',
  `full_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '全称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本（乐观锁保留字段）',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `create_user` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_user` bigint(20) NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (24, 0, '[0],', '总公司', '总公司', '', NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dept` VALUES (25, 24, '[0],[24],', '运营部', '运营部', '', NULL, 2, '2020-08-01 11:50:25', NULL, 1, NULL);

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict`  (
  `dict_id` bigint(20) NOT NULL COMMENT '字典id',
  `dict_type_id` bigint(20) NOT NULL COMMENT '所属字典类型的id',
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字典编码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字典名称',
  `parent_id` bigint(20) NOT NULL COMMENT '上级代码id',
  `parent_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所有上级id',
  `status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'ENABLE' COMMENT '状态（字典）',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `description` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字典的描述',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `create_user` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_user` bigint(20) NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`dict_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '基础字典' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES (1106120532442595330, 1106120208097067009, 'M', '男', 0, '[0]', 'ENABLE', NULL, '', '2019-03-14 17:11:00', NULL, 1, NULL);
INSERT INTO `sys_dict` VALUES (1106120574163337218, 1106120208097067009, 'F', '女', 0, '[0]', 'ENABLE', NULL, '', '2019-03-14 17:11:10', NULL, 1, NULL);
INSERT INTO `sys_dict` VALUES (1106120645697191938, 1106120265689055233, 'ENABLE', '启用', 0, '[0]', 'ENABLE', NULL, '', '2019-03-14 17:11:27', NULL, 1, NULL);
INSERT INTO `sys_dict` VALUES (1106120699468169217, 1106120265689055233, 'DISABLE', '禁用', 0, '[0]', 'ENABLE', NULL, '', '2019-03-14 17:11:40', NULL, 1, NULL);
INSERT INTO `sys_dict` VALUES (1106120784318939137, 1106120322450571266, 'ENABLE', '启用', 0, '[0]', 'ENABLE', NULL, '', '2019-03-14 17:12:00', NULL, 1, NULL);
INSERT INTO `sys_dict` VALUES (1106120825993543682, 1106120322450571266, 'FREEZE', '冻结', 0, '[0]', 'ENABLE', 1, '', '2019-03-14 17:12:10', '2019-03-16 10:56:36', 1, 1);
INSERT INTO `sys_dict` VALUES (1106120875872206849, 1106120322450571266, 'DELETED', '已删除', 0, '[0]', 'ENABLE', -1221, '', '2019-03-14 17:12:22', '2019-03-16 10:56:53', 1, 1);
INSERT INTO `sys_dict` VALUES (1106120935070613505, 1106120388036902914, 'Y', '删除', 0, '[0]', 'ENABLE', 23333, '', '2019-03-14 17:12:36', '2019-03-16 10:58:53', 1, 1);
INSERT INTO `sys_dict` VALUES (1106120968910258177, 1106120388036902914, 'N', '未删除', 0, '[0]', 'ENABLE', 1212211221, '', '2019-03-14 17:12:44', '2019-03-16 10:59:03', 1, 1);
INSERT INTO `sys_dict` VALUES (1149218674746355713, 1149217131989069826, 'BASE_SYSTEM', '基础功能', 0, '[0]', 'ENABLE', 1, '系统管理平台', '2019-07-11 15:27:38', '2020-01-01 17:14:45', 1, 1);
INSERT INTO `sys_dict` VALUES (1160533174626959361, 1160532704105742337, '00101', '办公审批', 0, '[0]', 'ENABLE', 10, '', '2019-08-11 20:47:25', NULL, 1, NULL);
INSERT INTO `sys_dict` VALUES (1160533264645111810, 1160532704105742337, '00102', '行政审批', 0, '[0]', 'ENABLE', 20, '', '2019-08-11 20:47:47', NULL, 1, NULL);
INSERT INTO `sys_dict` VALUES (1160533377727741954, 1160532775455047681, 'KEY_LEAVE', '请假流程标识', 0, '[0]', 'ENABLE', 10, '', '2019-08-11 20:48:14', NULL, 1, NULL);
INSERT INTO `sys_dict` VALUES (1160533455343337474, 1160532775455047681, 'KEY_FINANCE', '财务流程标识', 0, '[0]', 'ENABLE', 20, '', '2019-08-11 20:48:32', NULL, 1, NULL);
INSERT INTO `sys_dict` VALUES (1160533574843252737, 1160532886713155585, '00401', '事假', 0, '[0]', 'ENABLE', 10, '', '2019-08-11 20:49:01', NULL, 1, NULL);
INSERT INTO `sys_dict` VALUES (1160533625615302658, 1160532886713155585, '00402', '婚假', 0, '[0]', 'ENABLE', 20, '', '2019-08-11 20:49:13', NULL, 1, NULL);
INSERT INTO `sys_dict` VALUES (1160533707215486977, 1160532886713155585, '00403', '产假', 0, '[0]', 'ENABLE', 30, '', '2019-08-11 20:49:32', NULL, 1, NULL);
INSERT INTO `sys_dict` VALUES (1160533765403066370, 1160532886713155585, '00404', '病假', 0, '[0]', 'ENABLE', 40, '', '2019-08-11 20:49:46', NULL, 1, NULL);
INSERT INTO `sys_dict` VALUES (1160533863834992641, 1160532886713155585, '00405', '公假', 0, '[0]', 'ENABLE', 50, '', '2019-08-11 20:50:09', NULL, 1, NULL);
INSERT INTO `sys_dict` VALUES (1160533945309347841, 1160532886713155585, '00406', '年假', 0, '[0]', 'ENABLE', 60, '', '2019-08-11 20:50:29', NULL, 1, NULL);
INSERT INTO `sys_dict` VALUES (1160534007389241346, 1160532886713155585, '00407', '其他', 0, '[0]', 'ENABLE', 70, '', '2019-08-11 20:50:44', NULL, 1, NULL);
INSERT INTO `sys_dict` VALUES (1212300736972668929, 1149217131989069826, 'ENT_FUNC', '企业功能', 0, '[0]', 'ENABLE', 20, '企业功能', '2020-01-01 17:13:14', NULL, 1, NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_type_id` bigint(20) NOT NULL COMMENT '字典类型id',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字典类型编码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字典类型名称',
  `description` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字典描述',
  `system_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '是否是系统字典，Y-是，N-否',
  `status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'ENABLE' COMMENT '状态(字典)',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '添加时间',
  `create_user` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `update_user` bigint(20) NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`dict_type_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1106120208097067009, 'SEX', '性别', '', 'Y', 'ENABLE', 4, '2019-03-14 17:09:43', 1, NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (1106120265689055233, 'STATUS', '状态', '', 'Y', 'ENABLE', 3, '2019-03-14 17:09:57', 1, NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (1106120322450571266, 'ACCOUNT_STATUS', '账号状态', '', 'Y', 'ENABLE', 40, '2019-03-14 17:10:10', 1, '2019-08-11 20:46:38', 1);
INSERT INTO `sys_dict_type` VALUES (1106120388036902914, 'DEL_FLAG', '是否删除', '', 'Y', 'ENABLE', 2, '2019-03-14 17:10:26', 1, '2019-03-27 16:26:31', 1);
INSERT INTO `sys_dict_type` VALUES (1149217131989069826, 'SYSTEM_TYPE', '系统分类', '系统所有分类的维护', 'Y', 'ENABLE', 50, '2019-07-11 15:21:30', 1, '2019-08-11 20:46:47', 1);
INSERT INTO `sys_dict_type` VALUES (1160532704105742337, 'FLOW_CATEGARY', '工作流分类', '工作流分类', 'Y', 'ENABLE', 60, '2019-08-11 20:45:33', 1, NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (1160532775455047681, 'FLOW_KEY', '工作流标识', '工作流标识', 'Y', 'ENABLE', 70, '2019-08-11 20:45:50', 1, NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (1160532886713155585, 'LEAVE_TYPE', '请假类型', '请假类型', 'Y', 'ENABLE', 80, '2019-08-11 20:46:17', 1, '2019-08-11 20:46:23', 1);

-- ----------------------------
-- Table structure for sys_file_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_file_info`;
CREATE TABLE `sys_file_info`  (
  `file_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键id',
  `file_bucket` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件仓库（oss仓库）',
  `file_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文件名称',
  `file_suffix` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件后缀',
  `file_size_kb` bigint(20) NULL DEFAULT NULL COMMENT '文件大小kb',
  `final_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文件唯一标识id',
  `file_path` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '存储路径',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `create_user` bigint(20) NULL DEFAULT NULL COMMENT '创建用户',
  `update_user` bigint(20) NULL DEFAULT NULL COMMENT '修改用户',
  PRIMARY KEY (`file_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文件信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_file_info
-- ----------------------------
INSERT INTO `sys_file_info` VALUES ('1167385745179131905', NULL, '请假流程.bpmn20.xml', 'xml', 6, '1167385745179131905.xml', '/Users/stylefeng/tmp/gunsTempFiles/1167385745179131905.xml', '2019-08-30 18:37:05', NULL, 1, NULL);

-- ----------------------------
-- Table structure for sys_login_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_log`;
CREATE TABLE `sys_login_log`  (
  `login_log_id` bigint(20) NOT NULL COMMENT '主键',
  `log_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日志名称',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '管理员id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `succeed` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否执行成功',
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '具体消息',
  `ip_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录ip',
  PRIMARY KEY (`login_log_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '登录记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_login_log
-- ----------------------------
INSERT INTO `sys_login_log` VALUES (1270370147344965633, '登录日志', 1, '2020-06-09 23:00:20', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1270671488898379777, '登录日志', 1, '2020-06-10 18:57:46', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1279430481514901506, '登录日志', 1, '2020-07-04 23:02:52', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1279764356065681409, '登录日志', 1, '2020-07-05 21:09:34', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1279764539285454850, '登录日志', 1, '2020-07-05 21:10:18', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1279769645431197697, '登录日志', 1, '2020-07-05 21:30:35', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1279797718520250370, '登录日志', 1, '2020-07-05 23:22:08', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1281617417692352514, '登录日志', 1, '2020-07-10 23:52:58', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1281618017888788481, '登录日志', 1, '2020-07-10 23:55:21', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1281619072697536514, '登录日志', 1, '2020-07-10 23:59:33', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1281619555612958722, '登录日志', 1, '2020-07-11 00:01:28', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1281621073678315521, '登录日志', 1, '2020-07-11 00:07:30', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1281622497577443330, '登录日志', 1, '2020-07-11 00:13:09', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1281878137768038402, '登录日志', 1, '2020-07-11 17:08:59', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1281946254238138370, '登录日志', 1, '2020-07-11 21:39:39', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1281954159339249665, '登录日志', 1, '2020-07-11 22:11:04', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1282175237890281474, '登录日志', 1, '2020-07-12 12:49:33', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1282685242389356545, '登录日志', 1, '2020-07-13 22:36:08', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1282687535138525186, '登录日志', 1, '2020-07-13 22:45:14', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1282687551227875330, '退出日志', 1, '2020-07-13 22:45:18', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1282687557905207298, '登录日志', 1, '2020-07-13 22:45:20', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1282688658356359170, '退出日志', 1, '2020-07-13 22:49:42', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1282688664702341121, '登录日志', 1, '2020-07-13 22:49:44', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1282688754695327746, '退出日志', 1, '2020-07-13 22:50:05', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1282688768771411970, '登录日志', 1, '2020-07-13 22:50:08', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1282688928230477826, '登录日志', 1, '2020-07-13 22:50:46', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1282703072962834434, '登录日志', 1, '2020-07-13 23:46:59', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1283388005213622274, '登录日志', 1, '2020-07-15 21:08:39', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1283388035060289538, '退出日志', 1, '2020-07-15 21:08:46', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1283388072205045762, '登录日志', 1, '2020-07-15 21:08:55', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1283388985804181505, '登录日志', 1, '2020-07-15 21:12:33', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1283389794742730753, '登录日志', 1, '2020-07-15 21:15:46', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1283390619380740097, '登录日志', 1, '2020-07-15 21:19:03', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1283413647560908801, '登录日志', 1, '2020-07-15 22:50:33', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1283415515984834561, '登录日志', 1, '2020-07-15 22:57:58', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1284373340248657921, '登录日志', 1, '2020-07-18 14:24:01', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1284380828725497858, '登录日志', 1, '2020-07-18 14:53:47', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1284382716455940097, '登录日志', 1, '2020-07-18 15:01:17', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1284386727036764161, '登录日志', 1, '2020-07-18 15:17:13', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1284396283703898114, '登录日志', 1, '2020-07-18 15:55:12', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1284397190990651394, '登录日志', 1, '2020-07-18 15:58:48', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1284397706747346945, '登录日志', 1, '2020-07-18 16:00:51', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1284398760872394753, '登录日志', 1, '2020-07-18 16:05:02', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1284411670487138305, '登录日志', 1, '2020-07-18 16:56:20', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1284422751490183170, '登录日志', 1, '2020-07-18 17:40:22', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1284424034037108738, '登录日志', 1, '2020-07-18 17:45:28', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1284427012164915201, '登录日志', 1, '2020-07-18 17:57:18', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1284429415786221569, '登录日志', 1, '2020-07-18 18:06:51', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1284431381715230722, '登录日志', 1, '2020-07-18 18:14:40', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1284433869348589569, '登录日志', 1, '2020-07-18 18:24:33', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1284436698075275266, '登录日志', 1, '2020-07-18 18:35:47', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1284437428169383937, '登录日志', 1, '2020-07-18 18:38:41', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1284437668880556033, '登录日志', 1, '2020-07-18 18:39:39', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1284442371043426306, '登录日志', 1, '2020-07-18 18:58:20', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1284453423827140609, '登录日志', 1, '2020-07-18 19:42:15', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1284458012844564482, '登录日志', 1, '2020-07-18 20:00:29', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1284478216634937345, '登录日志', 1, '2020-07-18 21:20:46', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1284481181831733249, '登录日志', 1, '2020-07-18 21:32:33', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1284481809186344962, '登录日志', 1, '2020-07-18 21:35:02', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1284484972413009921, '登录日志', 1, '2020-07-18 21:47:37', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1284492571845898241, '登录日志', 1, '2020-07-18 22:17:48', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1284497694760398849, '登录日志', 1, '2020-07-18 22:38:10', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1284498473139331074, '登录日志', 1, '2020-07-18 22:41:15', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1284507764734836738, '登录日志', 1, '2020-07-18 23:18:11', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1284509018320121858, '登录日志', 1, '2020-07-18 23:23:10', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1284511331730403330, '登录日志', 1, '2020-07-18 23:32:21', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1284516008303869953, '登录日志', 1, '2020-07-18 23:50:56', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1284521042802495489, '登录日志', 1, '2020-07-19 00:10:57', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1284522047409500161, '登录日志', 1, '2020-07-19 00:14:56', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1284674118016425985, '登录日志', 1, '2020-07-19 10:19:12', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1284675546998964225, '登录日志', 1, '2020-07-19 10:24:53', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1284676626939994114, '登录日志', 1, '2020-07-19 10:29:11', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1284711740822528002, '登录日志', 1, '2020-07-19 12:48:42', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1284715223458041857, '登录日志', 1, '2020-07-19 13:02:33', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1284723689010503682, '登录日志', 1, '2020-07-19 13:36:11', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1284725576560562177, '登录日志', 1, '2020-07-19 13:43:41', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1284870766831157250, '登录日志', 1, '2020-07-19 23:20:37', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1286664024339001346, '登录日志', 1, '2020-07-24 22:06:23', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1286900216938704897, '登录日志', 1, '2020-07-25 13:44:56', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1286915890176147457, '登录日志', 1, '2020-07-25 14:47:13', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1286923312533950466, '登录日志', 1, '2020-07-25 15:16:42', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1286930817339195394, '登录日志', 1, '2020-07-25 15:46:32', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1286941413342203906, '登录日志', 1, '2020-07-25 16:28:38', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1286949053808033794, '登录日志', 1, '2020-07-25 16:58:59', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1287018777174654977, '登录日志', 1, '2020-07-25 21:36:03', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1287018782883102721, '登录日志', 1, '2020-07-25 21:36:04', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1287023127578132482, '登录日志', 1, '2020-07-25 21:53:20', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1287030582424940546, '登录日志', 1, '2020-07-25 22:22:57', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1287051287208214529, '登录日志', 1, '2020-07-25 23:45:14', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1287223195987894273, '登录日志', 1, '2020-07-26 11:08:20', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1287224021242355714, '登录日志', 1, '2020-07-26 11:11:37', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1287226072169029634, '登录日志', 1, '2020-07-26 11:19:46', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1287390817954127873, '登录日志', 1, '2020-07-26 22:14:24', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1287391756060491778, '登录日志', 1, '2020-07-26 22:18:08', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1287392245548445698, '登录日志', 1, '2020-07-26 22:20:05', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1287392897154494465, '登录日志', 1, '2020-07-26 22:22:40', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1287393105087160321, '登录日志', 1, '2020-07-26 22:23:30', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1288457886640406530, '登录日志', 1, '2020-07-29 20:54:33', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1288458753955426306, '登录日志', 1, '2020-07-29 20:58:00', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1288465438237315073, '登录日志', 1, '2020-07-29 21:24:34', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1289188365266067458, '登录日志', 1, '2020-07-31 21:17:13', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1289198343867658241, '登录日志', 1, '2020-07-31 21:56:52', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1289198348053573633, '登录日志', 1, '2020-07-31 21:56:53', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1289198775667019777, '登录日志', 1, '2020-07-31 21:58:35', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1289214826911899650, '登录日志', 1, '2020-07-31 23:02:22', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1289407608335200258, '登录日志', 1, '2020-08-01 11:48:25', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1289420175212335105, '登录日志', 1, '2020-08-01 12:38:21', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1289420643787370498, '登录日志', 1, '2020-08-01 12:40:12', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1289437553446928385, '登录日志', 1, '2020-08-01 13:47:24', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1289438765705637890, '登录日志', 1, '2020-08-01 13:52:13', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1289440617369174018, '登录日志', 1, '2020-08-01 13:59:34', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1289444085169442817, '登录日志', 1, '2020-08-01 14:13:21', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1289445561811918850, '登录日志', 1, '2020-08-01 14:19:13', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1289445785880027138, '退出日志', 1, '2020-08-01 14:20:07', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1289445828263469058, '登录日志', 1289445687838171138, '2020-08-01 14:20:17', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1289445856612769794, '登录日志', 1289445687838171138, '2020-08-01 14:20:24', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1289446378581319681, '登录日志', 1289445687838171138, '2020-08-01 14:22:28', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1289446411699544066, '登录日志', 1289445687838171138, '2020-08-01 14:22:36', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1289446695297409025, '登录日志', 1289445687838171138, '2020-08-01 14:23:44', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1289447620502151169, '登录日志', 1289445687838171138, '2020-08-01 14:27:24', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1289447900866207745, '登录日志', 1, '2020-08-01 14:28:31', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1289448419995213825, '退出日志', 1, '2020-08-01 14:30:35', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1289448502128074754, '登录日志', 1289445687838171138, '2020-08-01 14:30:54', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1289448542678605825, '退出日志', 1289445687838171138, '2020-08-01 14:31:04', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1289448552858181633, '登录日志', 1, '2020-08-01 14:31:06', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1289469145045377026, '登录日志', 1, '2020-08-01 15:52:56', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1289471070277001218, '登录日志', 1, '2020-08-01 16:00:35', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1289471436859170817, '登录日志', 1, '2020-08-01 16:02:02', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1289518718006599682, '登录日志', 1, '2020-08-01 19:09:55', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1289520877704052738, '登录日志', 1, '2020-08-01 19:18:30', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1289523321100140545, '登录日志', 1, '2020-08-01 19:28:13', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1289553177380687873, '登录日志', 1, '2020-08-01 21:26:51', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1289555106307596290, '登录日志', 1, '2020-08-01 21:34:31', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1289563831307145218, '登录日志', 1, '2020-08-01 22:09:11', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1289565286860595202, '登录日志', 1, '2020-08-01 22:14:58', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1289566387492130817, '登录日志', 1, '2020-08-01 22:19:20', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1289567928341028866, '登录日志', 1, '2020-08-01 22:25:28', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1289571037947682817, '登录日志', 1, '2020-08-01 22:37:49', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1289572216547065858, '登录日志', 1, '2020-08-01 22:42:30', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1289572701232500737, '登录日志', 1, '2020-08-01 22:44:26', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1289573775133716482, '登录日志', 1, '2020-08-01 22:48:42', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1289577378686791681, '登录日志', 1, '2020-08-01 23:03:01', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1289578351635320833, '登录日志', 1, '2020-08-01 23:06:53', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1289579100968628226, '登录日志', 1, '2020-08-01 23:09:52', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1289585533395234817, '登录日志', 1, '2020-08-01 23:35:25', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1289586654884945922, '登录日志', 1, '2020-08-01 23:39:53', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1289587745592819713, '登录日志', 1, '2020-08-01 23:44:13', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1289588627046735873, '登录日志', 1, '2020-08-01 23:47:43', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1289589564742094849, '登录日志', 1, '2020-08-01 23:51:26', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1289590157820936194, '登录日志', 1, '2020-08-01 23:53:48', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1289593628762636289, '登录日志', 1, '2020-08-02 00:07:35', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1289594479916892161, '登录日志', 1, '2020-08-02 00:10:58', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1289596419262431233, '登录日志', 1, '2020-08-02 00:18:41', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1289597361877803009, '登录日志', 1, '2020-08-02 00:22:25', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1289753339743031298, '登录日志', 1, '2020-08-02 10:42:13', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1289754394337837057, '登录日志', 1, '2020-08-02 10:46:25', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1289755516632911873, '登录日志', 1, '2020-08-02 10:50:52', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1289757821595860994, '登录日志', 1, '2020-08-02 11:00:02', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1289758038307160066, '退出日志', 1, '2020-08-02 11:00:54', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1289758110671486978, '登录日志', 1289758012566716417, '2020-08-02 11:01:11', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1289758153461776385, '退出日志', 1289758012566716417, '2020-08-02 11:01:21', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1289758171312734210, '登录日志', 1, '2020-08-02 11:01:25', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1289763804435034113, '登录日志', 1, '2020-08-02 11:23:48', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1289777432362012673, '登录日志', 1, '2020-08-02 12:17:57', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1289778827068821505, '登录日志', 1, '2020-08-02 12:23:30', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1289781665773666306, '登录日志', 1, '2020-08-02 12:34:47', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1289782342633721857, '登录日志', 1, '2020-08-02 12:37:28', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1289784796515401729, '登录日志', 1, '2020-08-02 12:47:13', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1289786799639519233, '登录日志', 1, '2020-08-02 12:55:11', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1289788914332127234, '登录日志', 1, '2020-08-02 13:03:35', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1289790786514206722, '登录日志', 1, '2020-08-02 13:11:01', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1289791892287954946, '登录日志', 1, '2020-08-02 13:15:25', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1289822145584570369, '登录日志', 1, '2020-08-02 15:15:38', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1289823309533310978, '登录日志', 1, '2020-08-02 15:20:15', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1289824097349455873, '登录日志', 1, '2020-08-02 15:23:23', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1289831996259852289, '登录日志', 1, '2020-08-02 15:54:46', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1289832713720700930, '登录日志', 1, '2020-08-02 15:57:38', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1289837859951370241, '登录日志', 1, '2020-08-02 16:18:04', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1289838693133111297, '登录日志', 1, '2020-08-02 16:21:23', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1289841479715495937, '登录日志', 1, '2020-08-02 16:32:28', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1289845066755493889, '登录日志', 1, '2020-08-02 16:46:43', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1289845577848205314, '登录日志', 1, '2020-08-02 16:48:45', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1289845950289838081, '登录日志', 1, '2020-08-02 16:50:13', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1289848735760670722, '登录日志', 1, '2020-08-02 17:01:17', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1289851746008551426, '登录日志', 1, '2020-08-02 17:13:15', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1291022058121121793, '登录日志', 1, '2020-08-05 22:43:39', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1292026644432719874, '登录日志', 1, '2020-08-08 17:15:31', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1292369877226553346, '登录日志', 1, '2020-08-09 15:59:24', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1292474098273787905, '登录日志', 1, '2020-08-09 22:53:33', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1292476730694524930, '登录日志', 1, '2020-08-09 23:04:00', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1292480571586502658, '登录日志', 1, '2020-08-09 23:19:16', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1292828042200133634, '登录日志', 1, '2020-08-10 22:20:00', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1292828105148248065, '退出日志', 1, '2020-08-10 22:20:15', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1292828209766772737, '登录日志', 1, '2020-08-10 22:20:39', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1292828260324913154, '退出日志', 1, '2020-08-10 22:20:52', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1292829130101956610, '登录日志', 1, '2020-08-10 22:24:19', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1293194324019859457, '登录日志', 1, '2020-08-11 22:35:28', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1293194370710851585, '登录日志', 1, '2020-08-11 22:35:39', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1293194413287231489, '登录日志', 1, '2020-08-11 22:35:49', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1293194839197831169, '登录日志', 1, '2020-08-11 22:37:31', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1293198350027407362, '登录日志', 1, '2020-08-11 22:51:28', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1293198517510160386, '登录日志', 1, '2020-08-11 22:52:08', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1293198532580294658, '登录日志', 1, '2020-08-11 22:52:11', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1293199027336200193, '登录日志', 1, '2020-08-11 22:54:09', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1293199633224355842, '登录日志', 1, '2020-08-11 22:56:34', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1293201297855557634, '登录日志', 1, '2020-08-11 23:03:11', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1293201346656284673, '登录日志', 1, '2020-08-11 23:03:22', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1293201689381269505, '登录日志', 1, '2020-08-11 23:04:44', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1293202187765248001, '登录日志', 1, '2020-08-11 23:06:43', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1293204902163578882, '登录日志', 1, '2020-08-11 23:17:30', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1293207308800630786, '登录日志', 1, '2020-08-11 23:27:04', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1293207576510484482, '登录日志', 1, '2020-08-11 23:28:08', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1293207686581604353, '登录日志', 1, '2020-08-11 23:28:34', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1293207880719159298, '登录日志', 1, '2020-08-11 23:29:20', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1293207989389381633, '登录日志', 1, '2020-08-11 23:29:46', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1293210752093528066, '登录日志', 1, '2020-08-11 23:40:45', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1293211195154698242, '登录日志', 1, '2020-08-11 23:42:30', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1293541975097630721, '登录日志', 1, '2020-08-12 21:36:54', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1293904835850035202, '登录日志', 1, '2020-08-13 21:38:47', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1293905879338344449, '退出日志', 1, '2020-08-13 21:42:56', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1293906040584167426, '登录日志', 1, '2020-08-13 21:43:34', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1293906110008287234, '退出日志', 1, '2020-08-13 21:43:51', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1293906117922938882, '登录日志', 1, '2020-08-13 21:43:53', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1293906180514537473, '退出日志', 1, '2020-08-13 21:44:08', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1293906186130710529, '登录日志', 1, '2020-08-13 21:44:09', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1293906254694998018, '退出日志', 1, '2020-08-13 21:44:25', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1293906259862380546, '登录日志', 1, '2020-08-13 21:44:27', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1293934797193760770, '退出日志', 1, '2020-08-13 23:37:50', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1293934870971568130, '登录日志', 1293908664679161857, '2020-08-13 23:38:08', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1294292050954436610, '退出日志', 1293908664679161857, '2020-08-14 23:17:26', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1294292057875038209, '登录日志', 1, '2020-08-14 23:17:28', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1294293381693849602, '退出日志', 1, '2020-08-14 23:22:44', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1294293421703315458, '登录日志', 1293908664679161857, '2020-08-14 23:22:53', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1294297440576356353, '退出日志', 1293908664679161857, '2020-08-14 23:38:51', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1294297459983400962, '登录日志', 1, '2020-08-14 23:38:56', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1294454406980374529, '退出日志', 1, '2020-08-15 10:02:35', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1294454437024174082, '登录日志', 1293908664679161857, '2020-08-15 10:02:42', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1294494463246213121, '退出日志', 1293908664679161857, '2020-08-15 12:41:45', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1294494483563421698, '登录日志', 1293908664679161857, '2020-08-15 12:41:50', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1294495021302554625, '退出日志', 1293908664679161857, '2020-08-15 12:43:58', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1294495025425555457, '登录日志', 1, '2020-08-15 12:43:59', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1294495055364497409, '退出日志', 1, '2020-08-15 12:44:06', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1294495061257494529, '登录日志', 1, '2020-08-15 12:44:08', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1294496689310150657, '退出日志', 1, '2020-08-15 12:50:36', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1294496709832880130, '登录日志', 1293908664679161857, '2020-08-15 12:50:41', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1294508386305519618, '退出日志', 1293908664679161857, '2020-08-15 13:37:05', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1294508390755676162, '登录日志', 1, '2020-08-15 13:37:06', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1294508404370386945, '退出日志', 1, '2020-08-15 13:37:09', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1294508435089469442, '登录日志', 1293908664679161857, '2020-08-15 13:37:16', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1294554615227957249, '退出日志', 1293908664679161857, '2020-08-15 16:40:47', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1294554623150997505, '登录日志', 1, '2020-08-15 16:40:48', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1294555626969579521, '退出日志', 1, '2020-08-15 16:44:48', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1294555657755770882, '登录日志', 1293908664679161857, '2020-08-15 16:44:55', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1294595241529171970, '退出日志', 1293908664679161857, '2020-08-15 19:22:13', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1294613157758754818, '登录日志', 1, '2020-08-15 20:33:24', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1294615124816027649, '退出日志', 1, '2020-08-15 20:41:13', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1294616399322406913, '登录日志', 1, '2020-08-15 20:46:17', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1294616438945996801, '退出日志', 1, '2020-08-15 20:46:27', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1294617758327234561, '登录日志', 1, '2020-08-15 20:51:41', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1294617878179471361, '退出日志', 1, '2020-08-15 20:52:10', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1294617887549546497, '登录日志', 1, '2020-08-15 20:52:12', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1294618022065070082, '退出日志', 1, '2020-08-15 20:52:44', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1294618040629059585, '登录日志', 1, '2020-08-15 20:52:48', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1294618081250893826, '退出日志', 1, '2020-08-15 20:52:58', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1294620116494966786, '登录日志', 1, '2020-08-15 21:01:03', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1294620189308084226, '退出日志', 1, '2020-08-15 21:01:21', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1294620211617587201, '登录日志', 1293908664679161857, '2020-08-15 21:01:26', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1294621048674836481, '退出日志', 1293908664679161857, '2020-08-15 21:04:46', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1294621055050178562, '登录日志', 1, '2020-08-15 21:04:47', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1294621091083444226, '退出日志', 1, '2020-08-15 21:04:56', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1294621096481513474, '登录日志', 1, '2020-08-15 21:04:57', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1294621109085396993, '退出日志', 1, '2020-08-15 21:05:00', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1294621127951376386, '登录日志', 1293908664679161857, '2020-08-15 21:05:04', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1294645267995406337, '退出日志', 1293908664679161857, '2020-08-15 22:41:00', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1294645316951322625, '登录日志', 1, '2020-08-15 22:41:12', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1294645572766117889, '退出日志', 1, '2020-08-15 22:42:13', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1294645593536311297, '登录日志', 1293908664679161857, '2020-08-15 22:42:18', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1294645679892836353, '退出日志', 1293908664679161857, '2020-08-15 22:42:38', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1294645685982965762, '登录日志', 1, '2020-08-15 22:42:40', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1294645994499190786, '退出日志', 1, '2020-08-15 22:43:53', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1294646011049914370, '登录日志', 1293908664679161857, '2020-08-15 22:43:57', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1294947857660436482, '退出日志', 1293908664679161857, '2020-08-16 18:43:23', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1294947866086793217, '登录日志', 1, '2020-08-16 18:43:25', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1294953724896141314, '退出日志', 1, '2020-08-16 19:06:42', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1294953763110445057, '登录日志', 1293908664679161857, '2020-08-16 19:06:51', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1295365694291988482, '登录日志', 1, '2020-08-17 22:23:43', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1295365871283228673, '退出日志', 1, '2020-08-17 22:24:25', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1295365887020257281, '登录日志', 1293908664679161857, '2020-08-17 22:24:29', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1295387196097949697, '登录日志', 1, '2020-08-17 23:49:09', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1295387246454763521, '退出日志', 1, '2020-08-17 23:49:21', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1295387264515436546, '登录日志', 1293908664679161857, '2020-08-17 23:49:26', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1295750221040521218, '登录日志', 1, '2020-08-18 23:51:41', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1295750250266431490, '退出日志', 1, '2020-08-18 23:51:48', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1295750278519263233, '登录日志', 1293908664679161857, '2020-08-18 23:51:55', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1295753618921709569, '登录日志', 1293908664679161857, '2020-08-19 00:05:11', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1295754603068948481, '登录日志', 1293908664679161857, '2020-08-19 00:09:06', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1295758968773275650, '退出日志', 1293908664679161857, '2020-08-19 00:26:27', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1295758989316976642, '登录日志', 1293908664679161857, '2020-08-19 00:26:32', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1295759133722669057, '登录日志', 1293908664679161857, '2020-08-19 00:27:06', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1295764179415826434, '登录日志', 1293908664679161857, '2020-08-19 00:47:09', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1296072115446988802, '登录日志', 1293908664679161857, '2020-08-19 21:10:47', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1296073056673972225, '登录日志', 1293908664679161857, '2020-08-19 21:14:31', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1296081317431160833, '登录日志', 1293908664679161857, '2020-08-19 21:47:21', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1296444247435640834, '登录日志', 1293908664679161857, '2020-08-20 21:49:30', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1296813748706705410, '登录日志', 1293908664679161857, '2020-08-21 22:17:46', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1296831398627299330, '退出日志', 1293908664679161857, '2020-08-21 23:27:54', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1296831407536001025, '登录日志', 1, '2020-08-21 23:27:56', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1296831596246126594, '退出日志', 1, '2020-08-21 23:28:41', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1296831627908927490, '登录日志', 1293908664679161857, '2020-08-21 23:28:49', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1296833430130073602, '退出日志', 1293908664679161857, '2020-08-21 23:35:58', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1296833591472365569, '登录日志', 1, '2020-08-21 23:36:37', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1296837480980488194, '退出日志', 1, '2020-08-21 23:52:04', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1296837501415137281, '登录日志', 1293908664679161857, '2020-08-21 23:52:09', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1296838310920007682, '退出日志', 1293908664679161857, '2020-08-21 23:55:22', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1296838317513453569, '登录日志', 1, '2020-08-21 23:55:24', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1296838566051131393, '退出日志', 1, '2020-08-21 23:56:23', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1296838588666818562, '登录日志', 1293908664679161857, '2020-08-21 23:56:28', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1296838980037324801, '退出日志', 1293908664679161857, '2020-08-21 23:58:02', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1296838987482214402, '登录日志', 1, '2020-08-21 23:58:03', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1296839001034010626, '退出日志', 1, '2020-08-21 23:58:07', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1296839005731631105, '登录日志', 1, '2020-08-21 23:58:08', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1296839098522218498, '退出日志', 1, '2020-08-21 23:58:30', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1296839104067088386, '登录日志', 1, '2020-08-21 23:58:31', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1296839179732332545, '退出日志', 1, '2020-08-21 23:58:49', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1296839193456095233, '登录日志', 1293908664679161857, '2020-08-21 23:58:52', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1296840964723257346, '退出日志', 1293908664679161857, '2020-08-22 00:05:55', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1296840971459309570, '登录日志', 1, '2020-08-22 00:05:56', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1296843805353390081, '退出日志', 1, '2020-08-22 00:17:12', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1296843819748241409, '登录日志', 1293908664679161857, '2020-08-22 00:17:15', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1296843857710886913, '退出日志', 1293908664679161857, '2020-08-22 00:17:25', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1296843865222885378, '登录日志', 1, '2020-08-22 00:17:26', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1296844138645368834, '退出日志', 1, '2020-08-22 00:18:32', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1296844153463844865, '登录日志', 1293908664679161857, '2020-08-22 00:18:35', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1296844313501708289, '退出日志', 1293908664679161857, '2020-08-22 00:19:13', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1296844320497807362, '登录日志', 1, '2020-08-22 00:19:15', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1296844653483601921, '退出日志', 1, '2020-08-22 00:20:34', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1296844659326267394, '登录日志', 1, '2020-08-22 00:20:36', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1297076349906776066, '退出日志', 1, '2020-08-22 15:41:15', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1297076364205158402, '登录日志', 1293908664679161857, '2020-08-22 15:41:18', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1297076380734910465, '退出日志', 1293908664679161857, '2020-08-22 15:41:22', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1297076393456234498, '登录日志', 1293908664679161857, '2020-08-22 15:41:25', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1297433503146807297, '登录日志', 1293908664679161857, '2020-08-23 15:20:27', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1299339844236984321, '登录日志', 1, '2020-08-28 21:35:34', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1299340029822353409, '退出日志', 1, '2020-08-28 21:36:18', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1299340035979591681, '登录日志', 1, '2020-08-28 21:36:20', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1299341253376327681, '退出日志', 1, '2020-08-28 21:41:10', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1299341331302301698, '登录日志', 1293908664679161857, '2020-08-28 21:41:29', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1299651794028224514, '退出日志', 1293908664679161857, '2020-08-29 18:15:09', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1299651798818119681, '登录日志', 1, '2020-08-29 18:15:10', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1299654313680855042, '退出日志', 1, '2020-08-29 18:25:09', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1299654319171198978, '登录日志', 1, '2020-08-29 18:25:11', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1299654337588387841, '退出日志', 1, '2020-08-29 18:25:15', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1299654356022353922, '登录日志', 1293908664679161857, '2020-08-29 18:25:20', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1299914580910235650, '退出日志', 1293908664679161857, '2020-08-30 11:39:22', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1299914587931500546, '登录日志', 1, '2020-08-30 11:39:24', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1299915368034295810, '退出日志', 1, '2020-08-30 11:42:30', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1299915384245280770, '登录日志', 1293908664679161857, '2020-08-30 11:42:34', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1299916020798021634, '退出日志', 1293908664679161857, '2020-08-30 11:45:05', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1299916033259298817, '登录日志', 1293908664679161857, '2020-08-30 11:45:08', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1299916077219799042, '退出日志', 1293908664679161857, '2020-08-30 11:45:19', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1299916340026499074, '登录日志', 1293908664679161857, '2020-08-30 11:46:21', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1299916393977831425, '退出日志', 1293908664679161857, '2020-08-30 11:46:34', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1299916415209398274, '登录日志', 1, '2020-08-30 11:46:39', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1299916598127190018, '退出日志', 1, '2020-08-30 11:47:23', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1299916613688057857, '登录日志', 1293908664679161857, '2020-08-30 11:47:27', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1300043674004090881, '退出日志', 1293908664679161857, '2020-08-30 20:12:20', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1300043682313007105, '登录日志', 1, '2020-08-30 20:12:22', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1300045308788600833, '退出日志', 1, '2020-08-30 20:18:50', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1300045342565330945, '登录日志', 1293908664679161857, '2020-08-30 20:18:58', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1300045474652352513, '退出日志', 1293908664679161857, '2020-08-30 20:19:29', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1300045482294374402, '登录日志', 1, '2020-08-30 20:19:31', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1300045777330106369, '登录日志', 1293908664679161857, '2020-08-30 20:20:42', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1300046661069844482, '退出日志', 1, '2020-08-30 20:24:12', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1300047695720857602, '登录日志', 1293908664679161857, '2020-08-30 20:28:19', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1300094414735044610, '退出日志', 1293908664679161857, '2020-08-30 23:33:58', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1300094420607070209, '登录日志', 1, '2020-08-30 23:33:59', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1300095302174273537, '退出日志', 1, '2020-08-30 23:37:29', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1300095320029425665, '登录日志', 1293908664679161857, '2020-08-30 23:37:34', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1300095366175158274, '退出日志', 1293908664679161857, '2020-08-30 23:37:45', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1300095373976563714, '登录日志', 1, '2020-08-30 23:37:46', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1300095535293689858, '退出日志', 1, '2020-08-30 23:38:25', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1300095541484482561, '登录日志', 1, '2020-08-30 23:38:26', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1300095553513746434, '退出日志', 1, '2020-08-30 23:38:29', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1300095565173911553, '登录日志', 1293908664679161857, '2020-08-30 23:38:32', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1301144729899098114, '登录日志', 1293908664679161857, '2020-09-02 21:07:32', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1301154516917411841, '退出日志', 1293908664679161857, '2020-09-02 21:46:26', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1301154563704872961, '登录日志', 1, '2020-09-02 21:46:37', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1301160881849212929, '退出日志', 1, '2020-09-02 22:11:43', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1301160900723580929, '登录日志', 1293908664679161857, '2020-09-02 22:11:48', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1301536007824367617, '登录日志', 1293908664679161857, '2020-09-03 23:02:20', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1301771164745478145, '退出日志', 1293908664679161857, '2020-09-04 14:36:46', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1301771172509134850, '登录日志', 1, '2020-09-04 14:36:48', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1301775863091572738, '退出日志', 1, '2020-09-04 14:55:26', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1301775884029538305, '登录日志', 1293908664679161857, '2020-09-04 14:55:31', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1301783341984395265, '退出日志', 1293908664679161857, '2020-09-04 15:25:09', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1301783347726397442, '登录日志', 1, '2020-09-04 15:25:11', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1301784870300753922, '退出日志', 1, '2020-09-04 15:31:14', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1301784887497400321, '登录日志', 1293908664679161857, '2020-09-04 15:31:18', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1301825751330353153, '登录日志', 1293908664679161857, '2020-09-04 18:13:41', '成功', NULL, '27.8.13.247');
INSERT INTO `sys_login_log` VALUES (1301826388461907969, '登录日志', 1, '2020-09-04 18:16:12', '成功', NULL, '183.70.36.71');
INSERT INTO `sys_login_log` VALUES (1301879800712949761, '登录日志', 1293908664679161857, '2020-09-04 21:48:27', '成功', NULL, '183.228.8.186');
INSERT INTO `sys_login_log` VALUES (1301880151037997058, '登录日志', 1293908664679161857, '2020-09-04 21:49:50', '成功', NULL, '27.8.13.247');
INSERT INTO `sys_login_log` VALUES (1301889416599560194, '登录日志', 1, '2020-09-04 22:26:40', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1301889431795523585, '退出日志', 1, '2020-09-04 22:26:43', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1301889446764994561, '登录日志', 1293908664679161857, '2020-09-04 22:26:47', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1301892515120627714, '登录日志', 1293908664679161857, '2020-09-04 22:38:58', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1302176110359924737, '退出日志', 1293908664679161857, '2020-09-05 17:25:53', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1302176126847733762, '登录日志', 1, '2020-09-05 17:25:57', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1302176312546349058, '退出日志', 1, '2020-09-05 17:26:41', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1302176330497970177, '登录日志', 1293908664679161857, '2020-09-05 17:26:45', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1302187354483671041, '退出日志', 1293908664679161857, '2020-09-05 18:10:33', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1302187366760398850, '登录日志', 1, '2020-09-05 18:10:36', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1302187467633410049, '退出日志', 1, '2020-09-05 18:11:00', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1302187482628046850, '登录日志', 1293908664679161857, '2020-09-05 18:11:04', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1302553820395479042, '登录日志', 1, '2020-09-06 18:26:46', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1302553830247899137, '登录日志', 1, '2020-09-06 18:26:48', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1302553840544915458, '退出日志', 1, '2020-09-06 18:26:51', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1302553857762533377, '登录日志', 1293908664679161857, '2020-09-06 18:26:55', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1302987798948712449, '登录日志', 1, '2020-09-07 23:11:14', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1302987820452909057, '退出日志', 1, '2020-09-07 23:11:19', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1302987828774408193, '登录日志', 1, '2020-09-07 23:11:21', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1302988358972182529, '退出日志', 1, '2020-09-07 23:13:28', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1302988375237693442, '登录日志', 1293908664679161857, '2020-09-07 23:13:32', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1302988676992700418, '退出日志', 1293908664679161857, '2020-09-07 23:14:44', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1302988682856337410, '登录日志', 1, '2020-09-07 23:14:45', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1302989289264615426, '退出日志', 1, '2020-09-07 23:17:10', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1302989334965751810, '登录日志', 1293908664679161857, '2020-09-07 23:17:20', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1304046251586740226, '登录日志', 1293908664679161857, '2020-09-10 21:17:09', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1304411261387210753, '登录日志', 1293908664679161857, '2020-09-11 21:27:34', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1304714007273304066, '退出日志', 1293908664679161857, '2020-09-12 17:30:34', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1304714014449758209, '登录日志', 1, '2020-09-12 17:30:36', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1304719048096903170, '退出日志', 1, '2020-09-12 17:50:36', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1304719072079933442, '登录日志', 1293908664679161857, '2020-09-12 17:50:42', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1304719724805885954, '退出日志', 1293908664679161857, '2020-09-12 17:53:18', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1304719845434068993, '登录日志', 1, '2020-09-12 17:53:46', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1304721618488004610, '退出日志', 1, '2020-09-12 18:00:49', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1304721636020195329, '登录日志', 1293908664679161857, '2020-09-12 18:00:53', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1304732616829718530, '退出日志', 1293908664679161857, '2020-09-12 18:44:31', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1304732621149851650, '登录日志', 1, '2020-09-12 18:44:32', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1304732706411663362, '退出日志', 1, '2020-09-12 18:44:53', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1304732718805831681, '登录日志', 1293908664679161857, '2020-09-12 18:44:56', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1304798376579129346, '退出日志', 1293908664679161857, '2020-09-12 23:05:50', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1304798382065278978, '登录日志', 1, '2020-09-12 23:05:51', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1304798467868155905, '退出日志', 1, '2020-09-12 23:06:11', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1304798474033782786, '登录日志', 1, '2020-09-12 23:06:13', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1304798746332192769, '退出日志', 1, '2020-09-12 23:07:18', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1304798759707828225, '登录日志', 1293908664679161857, '2020-09-12 23:07:21', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1307136438164332545, '登录日志', 1293908664679161857, '2020-09-19 09:56:27', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1307502097524072450, '登录日志', 1293908664679161857, '2020-09-20 10:09:27', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1308020142503923714, '登录日志', 1293908664679161857, '2020-09-21 20:27:58', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1308401420336144386, '登录日志', 1293908664679161857, '2020-09-22 21:43:02', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1308765761019363330, '登录日志', 1293908664679161857, '2020-09-23 21:50:48', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1309488276272439297, '登录日志', 1293908664679161857, '2020-09-25 21:41:49', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1310242844207747074, '登录日志', 1293908664679161857, '2020-09-27 23:40:12', '成功', NULL, '27.8.11.108');
INSERT INTO `sys_login_log` VALUES (1310244335375093762, '登录日志', 1293908664679161857, '2020-09-27 23:46:07', '成功', NULL, '27.8.11.108');
INSERT INTO `sys_login_log` VALUES (1310244342979366913, '登录日志', 1293908664679161857, '2020-09-27 23:46:09', '成功', NULL, '27.8.11.108');
INSERT INTO `sys_login_log` VALUES (1311537208376737794, '登录日志', 1293908664679161857, '2020-10-01 13:23:32', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1311876212951355394, '登录日志', 1, '2020-10-02 11:50:37', '成功', NULL, '27.8.163.51');
INSERT INTO `sys_login_log` VALUES (1311876362620985345, '退出日志', 1293908664679161857, '2020-10-02 11:51:13', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1311876369898102786, '登录日志', 1, '2020-10-02 11:51:15', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1311876609162174466, '退出日志', 1, '2020-10-02 11:52:12', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1311876627164127233, '登录日志', 1, '2020-10-02 11:52:16', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1312010985493499905, '登录日志', 1, '2020-10-02 20:46:10', '成功', NULL, '27.8.163.51');
INSERT INTO `sys_login_log` VALUES (1312011931627819010, '退出日志', 1, '2020-10-02 20:49:55', '成功', NULL, '27.8.163.51');
INSERT INTO `sys_login_log` VALUES (1312011942801444866, '登录日志', 1312010612770869250, '2020-10-02 20:49:58', '成功', NULL, '27.8.163.51');
INSERT INTO `sys_login_log` VALUES (1312011965702344706, '登录日志', 1312010612770869250, '2020-10-02 20:50:03', '成功', NULL, '27.8.163.51');
INSERT INTO `sys_login_log` VALUES (1312012553747959810, '登录日志', 1312010612770869250, '2020-10-02 20:52:23', '成功', NULL, '27.8.163.51');
INSERT INTO `sys_login_log` VALUES (1312012598647984130, '登录日志', 1312010612770869250, '2020-10-02 20:52:34', '成功', NULL, '27.8.163.51');
INSERT INTO `sys_login_log` VALUES (1312014375531442178, '退出日志', 1, '2020-10-02 20:59:38', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1312014387166441473, '登录日志', 1312014352508907522, '2020-10-02 20:59:41', '成功', NULL, '127.0.0.1');
INSERT INTO `sys_login_log` VALUES (1312219187292147713, '退出日志', 1, '2020-10-03 10:33:29', '成功', NULL, '27.8.163.51');
INSERT INTO `sys_login_log` VALUES (1312219204174221313, '登录日志', 1312014352508907522, '2020-10-03 10:33:33', '成功', NULL, '27.8.163.51');
INSERT INTO `sys_login_log` VALUES (1312622060844904449, '登录日志', 1312014352508907522, '2020-10-04 13:14:21', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1312984601618034690, '登录日志', 1312014352508907522, '2020-10-05 13:14:58', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1312985892171833345, '登录日志', 1312014352508907522, '2020-10-05 13:20:05', '成功', NULL, '27.15.91.46');
INSERT INTO `sys_login_log` VALUES (1313007051063975937, '登录日志', 1312014352508907522, '2020-10-05 14:44:10', '成功', NULL, '27.15.91.46');
INSERT INTO `sys_login_log` VALUES (1313008088722190338, '登录日志', 1312014352508907522, '2020-10-05 14:48:18', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1313037179991171074, '退出日志', 1312014352508907522, '2020-10-05 16:43:53', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1313037188128120833, '登录日志', 1, '2020-10-05 16:43:55', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1313037451819819010, '退出日志', 1, '2020-10-05 16:44:58', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1313037478373957633, '登录日志', 1312014352508907522, '2020-10-05 16:45:05', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1313037507176243202, '退出日志', 1312014352508907522, '2020-10-05 16:45:11', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1313037516063973377, '登录日志', 1, '2020-10-05 16:45:14', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1313037647148556289, '退出日志', 1, '2020-10-05 16:45:45', '成功', NULL, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES (1313037684079403010, '登录日志', 1312014352508907522, '2020-10-05 16:45:54', '成功', NULL, '0:0:0:0:0:0:0:1');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL COMMENT '主键id',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单编号',
  `pcode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单父编号',
  `pcodes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '当前菜单的所有父菜单编号',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'url地址',
  `sort` int(65) NULL DEFAULT NULL COMMENT '菜单排序号',
  `levels` int(65) NULL DEFAULT NULL COMMENT '菜单层级',
  `menu_flag` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否是菜单(字典)',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'ENABLE' COMMENT '菜单状态(字典)',
  `new_page_flag` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否打开新页面的标识(字典)',
  `open_flag` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否打开(字典)',
  `system_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统分类(字典)',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `create_user` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_user` bigint(20) NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (105, 'system', '0', '[0],', '系统管理', 'layui-icon layui-icon-set', '#', 20, 1, 'Y', NULL, 'ENABLE', NULL, '1', 'BASE_SYSTEM', NULL, '2019-03-29 16:32:27', NULL, 1);
INSERT INTO `sys_menu` VALUES (106, 'mgr', 'system', '[0],[system],', '用户管理', '', '/mgr', 10, 2, 'Y', NULL, 'ENABLE', NULL, '0', 'BASE_SYSTEM', NULL, '2019-06-30 13:48:07', NULL, 1);
INSERT INTO `sys_menu` VALUES (107, 'mgr_add', 'mgr', '[0],[system],[mgr],', '添加用户', NULL, '/mgr/add', 1, 3, 'N', NULL, 'ENABLE', NULL, '0', 'BASE_SYSTEM', NULL, '2019-06-30 13:48:07', NULL, 1);
INSERT INTO `sys_menu` VALUES (108, 'mgr_edit', 'mgr', '[0],[system],[mgr],', '修改用户', NULL, '/mgr/edit', 2, 3, 'N', NULL, 'ENABLE', NULL, '0', 'BASE_SYSTEM', NULL, '2019-06-30 13:48:07', NULL, 1);
INSERT INTO `sys_menu` VALUES (109, 'mgr_delete', 'mgr', '[0],[system],[mgr],', '删除用户', NULL, '/mgr/delete', 3, 3, 'N', NULL, 'ENABLE', NULL, '0', 'BASE_SYSTEM', NULL, '2019-06-30 13:48:07', NULL, 1);
INSERT INTO `sys_menu` VALUES (110, 'mgr_reset', 'mgr', '[0],[system],[mgr],', '重置密码', NULL, '/mgr/reset', 4, 3, 'N', NULL, 'ENABLE', NULL, '0', 'BASE_SYSTEM', NULL, '2019-06-30 13:48:07', NULL, 1);
INSERT INTO `sys_menu` VALUES (111, 'mgr_freeze', 'mgr', '[0],[system],[mgr],', '冻结用户', NULL, '/mgr/freeze', 5, 3, 'N', NULL, 'ENABLE', NULL, '0', 'BASE_SYSTEM', NULL, '2019-06-30 13:48:07', NULL, 1);
INSERT INTO `sys_menu` VALUES (112, 'mgr_unfreeze', 'mgr', '[0],[system],[mgr],', '解除冻结用户', NULL, '/mgr/unfreeze', 6, 3, 'N', NULL, 'ENABLE', NULL, '0', 'BASE_SYSTEM', NULL, '2019-06-30 13:48:07', NULL, 1);
INSERT INTO `sys_menu` VALUES (113, 'mgr_setRole', 'mgr', '[0],[system],[mgr],', '分配角色', NULL, '/mgr/setRole', 7, 3, 'N', NULL, 'ENABLE', NULL, '0', 'BASE_SYSTEM', NULL, '2019-06-30 13:48:07', NULL, 1);
INSERT INTO `sys_menu` VALUES (114, 'role', 'system', '[0],[system],', '角色管理', '', '/role', 20, 2, 'Y', NULL, 'ENABLE', NULL, '0', 'BASE_SYSTEM', NULL, '2019-06-30 13:48:12', NULL, 1);
INSERT INTO `sys_menu` VALUES (115, 'role_add', 'role', '[0],[system],[role],', '添加角色', NULL, '/role/add', 1, 3, 'N', NULL, 'ENABLE', NULL, '0', 'BASE_SYSTEM', NULL, '2019-06-30 13:48:12', NULL, 1);
INSERT INTO `sys_menu` VALUES (116, 'role_edit', 'role', '[0],[system],[role],', '修改角色', NULL, '/role/edit', 2, 3, 'N', NULL, 'ENABLE', NULL, '0', 'BASE_SYSTEM', NULL, '2019-06-30 13:48:12', NULL, 1);
INSERT INTO `sys_menu` VALUES (117, 'role_remove', 'role', '[0],[system],[role],', '删除角色', NULL, '/role/remove', 3, 3, 'N', NULL, 'ENABLE', NULL, '0', 'BASE_SYSTEM', NULL, '2019-06-30 13:48:12', NULL, 1);
INSERT INTO `sys_menu` VALUES (118, 'role_setAuthority', 'role', '[0],[system],[role],', '配置权限', NULL, '/role/setAuthority', 4, 3, 'N', NULL, 'ENABLE', NULL, '0', 'BASE_SYSTEM', NULL, '2019-06-30 13:48:12', NULL, 1);
INSERT INTO `sys_menu` VALUES (119, 'menu', 'system', '[0],[system],', '菜单管理', '', '/menu', 50, 2, 'Y', NULL, 'ENABLE', NULL, '0', 'BASE_SYSTEM', NULL, '2019-06-30 13:48:25', NULL, 1);
INSERT INTO `sys_menu` VALUES (120, 'menu_add', 'menu', '[0],[system],[menu],', '添加菜单', NULL, '/menu/add', 1, 3, 'N', NULL, 'ENABLE', NULL, '0', 'BASE_SYSTEM', NULL, '2019-06-30 13:48:25', NULL, 1);
INSERT INTO `sys_menu` VALUES (121, 'menu_edit', 'menu', '[0],[system],[menu],', '修改菜单', NULL, '/menu/edit', 2, 3, 'N', NULL, 'ENABLE', NULL, '0', 'BASE_SYSTEM', NULL, '2019-06-30 13:48:25', NULL, 1);
INSERT INTO `sys_menu` VALUES (122, 'menu_remove', 'menu', '[0],[system],[menu],', '删除菜单', NULL, '/menu/remove', 3, 3, 'N', NULL, 'ENABLE', NULL, '0', 'BASE_SYSTEM', NULL, '2019-06-30 13:48:25', NULL, 1);
INSERT INTO `sys_menu` VALUES (128, 'log', 'system', '[0],[system],', '业务日志', '', '/log', 70, 2, 'Y', NULL, 'ENABLE', NULL, '0', 'BASE_SYSTEM', NULL, '2019-06-30 13:48:39', NULL, 1);
INSERT INTO `sys_menu` VALUES (130, 'druid', 'system', '[0],[system],', '监控管理', '', '/druid', 80, 2, 'Y', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:50:06', NULL, 1);
INSERT INTO `sys_menu` VALUES (131, 'dept', 'system', '[0],[system],', '部门管理', '', '/dept', 30, 2, 'Y', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:48:53', NULL, 1);
INSERT INTO `sys_menu` VALUES (132, 'dict', 'system', '[0],[system],', '字典管理', '', '/dictType', 40, 2, 'Y', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:49:04', NULL, 1);
INSERT INTO `sys_menu` VALUES (133, 'loginLog', 'system', '[0],[system],', '登录日志', '', '/loginLog', 60, 2, 'Y', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:49:29', NULL, 1);
INSERT INTO `sys_menu` VALUES (134, 'log_clean', 'log', '[0],[system],[log],', '清空日志', NULL, '/log/delLog', 3, 3, 'N', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:48:39', NULL, 1);
INSERT INTO `sys_menu` VALUES (135, 'dept_add', 'dept', '[0],[system],[dept],', '添加部门', NULL, '/dept/add', 1, 3, 'N', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:48:53', NULL, 1);
INSERT INTO `sys_menu` VALUES (136, 'dept_update', 'dept', '[0],[system],[dept],', '修改部门', NULL, '/dept/update', 1, 3, 'N', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:48:53', NULL, 1);
INSERT INTO `sys_menu` VALUES (137, 'dept_delete', 'dept', '[0],[system],[dept],', '删除部门', NULL, '/dept/delete', 1, 3, 'N', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:48:53', NULL, 1);
INSERT INTO `sys_menu` VALUES (138, 'dict_add', 'dict', '[0],[system],[dict],', '添加字典', NULL, '/dictType/addItem', 1, 3, 'N', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:49:04', NULL, 1);
INSERT INTO `sys_menu` VALUES (139, 'dict_update', 'dict', '[0],[system],[dict],', '修改字典', NULL, '/dictType/editItem', 1, 3, 'N', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:49:04', NULL, 1);
INSERT INTO `sys_menu` VALUES (140, 'dict_delete', 'dict', '[0],[system],[dict],', '删除字典', NULL, '/dictType/delete', 1, 3, 'N', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:49:04', NULL, 1);
INSERT INTO `sys_menu` VALUES (141, 'notice', 'system', '[0],[system],', '通知管理', '', '/notice', 90, 2, 'Y', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:49:44', NULL, 1);
INSERT INTO `sys_menu` VALUES (142, 'notice_add', 'notice', '[0],[system],[notice],', '添加通知', NULL, '/notice/add', 1, 3, 'N', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:49:44', NULL, 1);
INSERT INTO `sys_menu` VALUES (143, 'notice_update', 'notice', '[0],[system],[notice],', '修改通知', NULL, '/notice/update', 2, 3, 'N', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:49:44', NULL, 1);
INSERT INTO `sys_menu` VALUES (144, 'notice_delete', 'notice', '[0],[system],[notice],', '删除通知', NULL, '/notice/delete', 3, 3, 'N', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:49:44', NULL, 1);
INSERT INTO `sys_menu` VALUES (145, 'sys_message', 'dashboard', '[0],[dashboard],', '消息通知', 'layui-icon layui-icon-tips', '/system/notice', 30, 2, 'Y', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2020-08-22 00:15:27', NULL, 1);
INSERT INTO `sys_menu` VALUES (149, 'api_mgr', 'dev_tools', '[0],[dev_tools],', '接口文档', 'fa-leaf', '/doc.html', 30, 2, 'Y', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2020-09-12 17:59:14', NULL, 1);
INSERT INTO `sys_menu` VALUES (150, 'to_menu_edit', 'menu', '[0],[system],[menu],', '菜单编辑跳转', '', '/menu/menu_edit', 4, 3, 'N', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:48:25', NULL, 1);
INSERT INTO `sys_menu` VALUES (151, 'menu_list', 'menu', '[0],[system],[menu],', '菜单列表', '', '/menu/list', 5, 3, 'N', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:48:25', NULL, 1);
INSERT INTO `sys_menu` VALUES (152, 'to_dept_update', 'dept', '[0],[system],[dept],', '修改部门跳转', '', '/dept/dept_update', 4, 3, 'N', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:48:53', NULL, 1);
INSERT INTO `sys_menu` VALUES (153, 'dept_list', 'dept', '[0],[system],[dept],', '部门列表', '', '/dept/list', 5, 3, 'N', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:48:53', NULL, 1);
INSERT INTO `sys_menu` VALUES (154, 'dept_detail', 'dept', '[0],[system],[dept],', '部门详情', '', '/dept/detail', 6, 3, 'N', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:48:53', NULL, 1);
INSERT INTO `sys_menu` VALUES (155, 'to_dict_edit', 'dict', '[0],[system],[dict],', '修改菜单跳转', '', '/dict/dict_edit', 4, 3, 'N', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:49:04', NULL, 1);
INSERT INTO `sys_menu` VALUES (156, 'dict_list', 'dict', '[0],[system],[dict],', '字典列表', '', '/dict/list', 5, 3, 'N', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:49:04', NULL, 1);
INSERT INTO `sys_menu` VALUES (157, 'dict_detail', 'dict', '[0],[system],[dict],', '字典详情', '', '/dict/detail', 6, 3, 'N', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:49:04', NULL, 1);
INSERT INTO `sys_menu` VALUES (158, 'log_list', 'log', '[0],[system],[log],', '日志列表', '', '/log/list', 2, 3, 'N', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:48:39', NULL, 1);
INSERT INTO `sys_menu` VALUES (159, 'log_detail', 'log', '[0],[system],[log],', '日志详情', '', '/log/detail', 3, 3, 'N', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:48:39', NULL, 1);
INSERT INTO `sys_menu` VALUES (160, 'del_login_log', 'loginLog', '[0],[system],[loginLog],', '清空登录日志', '', '/loginLog/delLoginLog', 1, 3, 'N', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:49:29', NULL, 1);
INSERT INTO `sys_menu` VALUES (161, 'login_log_list', 'loginLog', '[0],[system],[loginLog],', '登录日志列表', '', '/loginLog/list', 2, 3, 'N', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:49:29', NULL, 1);
INSERT INTO `sys_menu` VALUES (162, 'to_role_edit', 'role', '[0],[system],[role],', '修改角色跳转', '', '/role/role_edit', 5, 3, 'N', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:48:12', NULL, 1);
INSERT INTO `sys_menu` VALUES (163, 'to_role_assign', 'role', '[0],[system],[role],', '角色分配跳转', '', '/role/role_assign', 6, 3, 'N', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:48:12', NULL, 1);
INSERT INTO `sys_menu` VALUES (164, 'role_list', 'role', '[0],[system],[role],', '角色列表', '', '/role/list', 7, 3, 'N', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:48:12', NULL, 1);
INSERT INTO `sys_menu` VALUES (165, 'to_assign_role', 'mgr', '[0],[system],[mgr],', '分配角色跳转', '', '/mgr/role_assign', 8, 3, 'N', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:48:07', NULL, 1);
INSERT INTO `sys_menu` VALUES (166, 'to_user_edit', 'mgr', '[0],[system],[mgr],', '编辑用户跳转', '', '/mgr/user_edit', 9, 3, 'N', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:48:07', NULL, 1);
INSERT INTO `sys_menu` VALUES (167, 'mgr_list', 'mgr', '[0],[system],[mgr],', '用户列表', '', '/mgr/list', 10, 3, 'N', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-06-30 13:48:07', NULL, 1);
INSERT INTO `sys_menu` VALUES (171, 'dev_tools', '0', '[0],', '开发管理', 'layui-icon layui-icon-code-circle', '#', 30, 1, 'Y', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2019-05-11 13:40:27', NULL, 1);
INSERT INTO `sys_menu` VALUES (172, 'dashboard', '0', '[0],', '主控面板', 'layui-icon layui-icon-home', '#', 1, 1, 'Y', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', NULL, '2020-08-22 00:15:28', NULL, 1);
INSERT INTO `sys_menu` VALUES (1110777136265838594, 'demos_show', '0', '[0],', '高级组件', 'layui-icon-diamond', '#', 60, 1, 'Y', NULL, 'ENABLE', NULL, NULL, 'ENT_FUNC', '2019-03-27 13:34:41', '2020-01-01 18:23:50', 1, 1);
INSERT INTO `sys_menu` VALUES (1110777366856089602, 'excel_import', 'EXCEL_PROCESS', '[0],[EXCEL_PROCESS],', 'excel导入', 'layui-icon-rate-solid', '/excel/import', 10, 2, 'Y', NULL, 'ENABLE', NULL, NULL, 'ENT_FUNC', '2019-03-27 13:35:36', '2020-01-01 18:22:18', 1, 1);
INSERT INTO `sys_menu` VALUES (1110777491464667137, 'excel_export', 'EXCEL_PROCESS', '[0],[EXCEL_PROCESS],', 'excel导出', 'layui-icon-rate-solid', '/excel/export', 20, 2, 'Y', NULL, 'ENABLE', NULL, NULL, 'ENT_FUNC', '2019-03-27 13:36:06', '2020-01-01 18:22:18', 1, 1);
INSERT INTO `sys_menu` VALUES (1110787391943098370, 'advanced_form', 'demos_show', '[0],[demos_show],', '高级表单', '', '/egForm', 30, 2, 'Y', NULL, 'ENABLE', NULL, NULL, 'ENT_FUNC', '2019-03-27 14:15:26', '2020-01-01 18:23:50', 1, 1);
INSERT INTO `sys_menu` VALUES (1110839216310329346, 'pdf_view', 'demos_show', '[0],[demos_show],', '文档预览', '', '/loadPdfFile', 40, 2, 'Y', NULL, 'ENABLE', NULL, NULL, 'ENT_FUNC', '2019-03-27 17:41:22', '2020-01-01 18:23:50', 1, 1);
INSERT INTO `sys_menu` VALUES (1111545968697860098, 'console', 'dashboard', '[0],[dashboard],', '项目介绍', '', '/system/console', 10, 2, 'Y', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', '2019-03-29 16:29:45', '2020-08-22 00:15:28', 1, 1);
INSERT INTO `sys_menu` VALUES (1111546189892870145, 'console2', 'dashboard', '[0],[dashboard],', '统计报表', '', '/system/console2', 20, 2, 'Y', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', '2019-03-29 16:30:38', '2020-08-22 00:15:28', 1, 1);
INSERT INTO `sys_menu` VALUES (1139827152854716418, 'data_source', '0', '[0],', '数据容器', 'layui-icon-template-1', '/databaseInfo', 40, 1, 'Y', NULL, 'ENABLE', NULL, NULL, 'ENT_FUNC', '2019-06-15 17:29:05', '2020-01-01 18:23:17', 1, 1);
INSERT INTO `sys_menu` VALUES (1142957882422112257, 'SYS_CONFIG', 'dev_tools', '[0],[dev_tools],', '参数配置', 'fa-star', '/sysConfig', 30, 2, 'Y', '', 'ENABLE', '', '', 'BASE_SYSTEM', '2019-06-24 08:49:28', '2020-01-01 18:33:09', 1, 1);
INSERT INTO `sys_menu` VALUES (1142957882422112258, 'SYS_CONFIG_ADD', 'SYS_CONFIG', '[0],[dev_tools],[SYS_CONFIG],', '参数配置添加', 'fa-star', '', 999, 3, 'N', '', 'ENABLE', '', '', 'BASE_SYSTEM', '2019-06-24 08:49:28', '2020-01-01 18:33:09', 1, 1);
INSERT INTO `sys_menu` VALUES (1142957882422112259, 'SYS_CONFIG_EDIT', 'SYS_CONFIG', '[0],[dev_tools],[SYS_CONFIG],', '参数配置修改', 'fa-star', '', 999, 3, 'N', '', 'ENABLE', '', '', 'BASE_SYSTEM', '2019-06-24 08:49:28', '2020-01-01 18:33:09', 1, 1);
INSERT INTO `sys_menu` VALUES (1142957882426306562, 'SYS_CONFIG_DELETE', 'SYS_CONFIG', '[0],[dev_tools],[SYS_CONFIG],', '参数配置删除', 'fa-star', '', 999, 3, 'N', '', 'ENABLE', '', '', 'BASE_SYSTEM', '2019-06-24 08:49:28', '2020-01-01 18:33:09', 1, 1);
INSERT INTO `sys_menu` VALUES (1144441072852684801, 'SYS_POSITION', 'system', '[0],[system],', '职位管理', 'fa-star', '/position', 35, 2, 'Y', '', 'ENABLE', '', '', 'BASE_SYSTEM', '2019-06-28 11:03:09', '2019-06-28 11:06:42', 1, 1);
INSERT INTO `sys_menu` VALUES (1144441072852684802, 'SYS_POSITION_ADD', 'SYS_POSITION', '[0],[system],[SYS_POSITION],', '职位表添加', 'fa-star', '', 999, 3, 'N', '', 'ENABLE', '', '', 'BASE_SYSTEM', '2019-06-28 11:03:09', '2019-06-28 11:06:42', 1, 1);
INSERT INTO `sys_menu` VALUES (1144441072852684803, 'SYS_POSITION_EDIT', 'SYS_POSITION', '[0],[system],[SYS_POSITION],', '职位表修改', 'fa-star', '', 999, 3, 'N', '', 'ENABLE', '', '', 'BASE_SYSTEM', '2019-06-28 11:03:09', '2019-06-28 11:06:42', 1, 1);
INSERT INTO `sys_menu` VALUES (1144441072852684804, 'SYS_POSITION_DELETE', 'SYS_POSITION', '[0],[system],[SYS_POSITION],', '职位表删除', 'fa-star', '', 999, 3, 'N', '', 'ENABLE', '', '', 'BASE_SYSTEM', '2019-06-28 11:03:09', '2019-06-28 11:06:42', 1, 1);
INSERT INTO `sys_menu` VALUES (1149955324929765378, 'system_info', 'dashboard', '[0],[dashboard],', '系统监控', 'layui-icon-star-fill', '/system/systemInfo', 40, 2, 'Y', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', '2019-07-13 16:14:49', '2020-08-22 00:15:28', 1, 1);
INSERT INTO `sys_menu` VALUES (1212299504967204865, 'EXCEL_PROCESS', '0', '[0],', 'excel处理', 'layui-icon-template', '#', 10, 1, 'Y', NULL, 'ENABLE', NULL, NULL, 'ENT_FUNC', '2020-01-01 17:08:20', '2020-01-01 18:22:18', 1, 1);
INSERT INTO `sys_menu` VALUES (1270366385825935361, 'DIST_ACCOUNT', 'DIST_MEMBER_MANAGE', '[0],[DIST_MEMBER_MANAGE],', '账户管理', 'fa-star', '/distAccount', 3, 2, 'Y', '', 'ENABLE', '', '', 'BASE_SYSTEM', '2020-06-09 22:45:23', '2020-08-30 11:47:20', 1, 1);
INSERT INTO `sys_menu` VALUES (1270366385997901826, 'DIST_MEMBER', 'DIST_MEMBER_MANAGE', '[0],[DIST_MEMBER_MANAGE],', '会员管理', 'fa-star', '/distMember', 1, 2, 'Y', '', 'ENABLE', '', '', 'BASE_SYSTEM', '2020-06-09 22:45:23', '2020-08-30 11:39:52', 1, 1);
INSERT INTO `sys_menu` VALUES (1270366385997901827, 'DIST_MEMBER_ADD', 'DIST_MEMBER', '[0],[DIST_MEMBER_MANAGE],[DIST_MEMBER],', '会员添加', 'fa-star', '', 999, 3, 'N', '', 'ENABLE', '', '', 'BASE_SYSTEM', '2020-06-09 22:45:23', '2020-08-30 11:39:52', 1, 1);
INSERT INTO `sys_menu` VALUES (1270366385997901828, 'DIST_MEMBER_EDIT', 'DIST_MEMBER', '[0],[DIST_MEMBER_MANAGE],[DIST_MEMBER],', '会员修改', 'fa-star', '', 999, 3, 'N', '', 'ENABLE', '', '', 'BASE_SYSTEM', '2020-06-09 22:45:23', '2020-08-30 11:39:52', 1, 1);
INSERT INTO `sys_menu` VALUES (1270366385997901829, 'DIST_MEMBER_DELETE', 'DIST_MEMBER', '[0],[DIST_MEMBER_MANAGE],[DIST_MEMBER],', '会员删除', 'fa-star', '', 999, 3, 'N', '', 'ENABLE', '', '', 'BASE_SYSTEM', '2020-06-09 22:45:23', '2020-08-30 11:39:52', 1, 1);
INSERT INTO `sys_menu` VALUES (1270366386065010689, 'DIST_PLATFORM', 'DIST_MEMBER_MANAGE', '[0],[DIST_MEMBER_MANAGE],', '平台管理', 'fa-star', '/distPlatform', 2, 2, 'Y', '', 'ENABLE', '', '', 'BASE_SYSTEM', '2020-06-09 22:45:23', '2020-08-30 11:39:52', 1, 1);
INSERT INTO `sys_menu` VALUES (1270366386065010690, 'DIST_PLATFORM_ADD', 'DIST_PLATFORM', '[0],[DIST_MEMBER_MANAGE],[DIST_PLATFORM],', '平台添加', 'fa-star', '/distPlatform/addItem', 999, 3, 'N', '', 'ENABLE', '', '', 'BASE_SYSTEM', '2020-06-09 22:45:23', '2020-08-30 11:39:52', 1, 1);
INSERT INTO `sys_menu` VALUES (1270366386065010691, 'DIST_PLATFORM_EDIT', 'DIST_PLATFORM', '[0],[DIST_MEMBER_MANAGE],[DIST_PLATFORM],', '平台修改', 'fa-star', '', 999, 3, 'N', '', 'ENABLE', '', '', 'BASE_SYSTEM', '2020-06-09 22:45:23', '2020-08-30 11:39:52', 1, 1);
INSERT INTO `sys_menu` VALUES (1270366386065010692, 'DIST_PLATFORM_DELETE', 'DIST_PLATFORM', '[0],[DIST_MEMBER_MANAGE],[DIST_PLATFORM],', '平台删除', 'fa-star', '', 999, 3, 'N', '', 'ENABLE', '', '', 'BASE_SYSTEM', '2020-06-09 22:45:23', '2020-08-30 11:39:52', 1, 1);
INSERT INTO `sys_menu` VALUES (1270366386190839809, 'DIST_PROFIT_PARAM', 'DIST_PROFIT_CONFIG', '[0],[DIST_PROFIT_CONFIG],', '分润参数', 'fa-star', '/distProfitParam', 1, 2, 'Y', '', 'ENABLE', '', '', 'BASE_SYSTEM', '2020-06-09 22:45:23', '2020-08-22 00:11:31', 1, 1);
INSERT INTO `sys_menu` VALUES (1270366386190839810, 'DIST_PROFIT_PARAM_ADD', 'DIST_PROFIT_PARAM', '[0],[DIST_PROFIT_CONFIG],[DIST_PROFIT_PARAM],', '分润参数添加', 'fa-star', '', 999, 3, 'N', '', 'ENABLE', '', '', 'BASE_SYSTEM', '2020-06-09 22:45:23', '2020-08-22 00:11:32', 1, 1);
INSERT INTO `sys_menu` VALUES (1270366386190839811, 'DIST_PROFIT_PARAM_EDIT', 'DIST_PROFIT_PARAM', '[0],[DIST_PROFIT_CONFIG],[DIST_PROFIT_PARAM],', '分润参数修改', 'fa-star', '', 999, 3, 'N', '', 'ENABLE', '', '', 'BASE_SYSTEM', '2020-06-09 22:45:23', '2020-08-22 00:11:32', 1, 1);
INSERT INTO `sys_menu` VALUES (1270366386190839812, 'DIST_PROFIT_PARAM_DELETE', 'DIST_PROFIT_PARAM', '[0],[DIST_PROFIT_CONFIG],[DIST_PROFIT_PARAM],', '分润参数删除', 'fa-star', '', 999, 3, 'N', '', 'ENABLE', '', '', 'BASE_SYSTEM', '2020-06-09 22:45:23', '2020-08-22 00:11:32', 1, 1);
INSERT INTO `sys_menu` VALUES (1270674446276964354, 'DIST_PROFIT_CONFIG', '0', '[0],', '分销参数', 'layui-icon-template-1', '#', 6, 1, 'Y', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', '2020-06-10 19:09:31', '2020-08-22 00:11:33', 1, 1);
INSERT INTO `sys_menu` VALUES (1279765513257369601, 'DIST_MEMBER_MANAGE', '0', '[0],', '用户管理', 'layui-icon-user', '#', 3, 1, 'Y', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', '2020-07-05 21:14:10', '2020-08-30 11:39:52', 1, 1);
INSERT INTO `sys_menu` VALUES (1279766092016795649, 'DIST_PROFIT_CENTER', '0', '[0],', '分润中心', 'layui-icon-chart-screen', '#', 9, 1, 'Y', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', '2020-07-05 21:16:28', '2020-08-22 00:11:12', 1, 1);
INSERT INTO `sys_menu` VALUES (1289581144177684481, 'simulation_operation', 'dev_tools', '[0],[dev_tools],', '模拟操作', 'layui-icon-star-fill', '/mock', 1, 2, 'Y', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', '2020-08-01 23:17:59', '2020-09-12 23:07:16', 1, 1);
INSERT INTO `sys_menu` VALUES (1289828284640579586, 'DIST_PROFIT_RECORD', 'DIST_PROFIT_CENTER', '[0],[DIST_PROFIT_CENTER],', '分润记录', 'layui-icon-star-fill', '/distProfitRecord', 2, 2, 'Y', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', '2020-08-02 15:40:02', '2020-08-30 20:13:33', 1, 1);
INSERT INTO `sys_menu` VALUES (1294298215725678594, 'DIST_MEMBER_ACCOUNT', 'DIST_MEMBER', '[0],[DIST_MEMBER_MANAGE],[DIST_MEMBER],', '会员账户', 'layui-icon-star-fill', '', 3, 3, 'N', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', '2020-08-14 23:41:56', '2020-08-30 11:39:52', 1, 1);
INSERT INTO `sys_menu` VALUES (1296835121596407810, 'DIST_RANKE_PARAM', 'DIST_PROFIT_CONFIG', '[0],[DIST_PROFIT_CONFIG],', '段位参数', 'layui-icon-star-fill', '/distRankParam', 2, 2, 'Y', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', '2020-08-21 23:42:42', '2020-08-22 00:11:33', 1, 1);
INSERT INTO `sys_menu` VALUES (1296835798540296193, 'DIST_RANKE_PARAM_ADD', 'DIST_RANKE_PARAM', '[0],[DIST_PROFIT_CONFIG],[DIST_RANKE_PARAM],', '段位参数增加', 'layui-icon-star-fill', '/distRankParam//addItem', NULL, 3, 'N', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', '2020-08-21 23:45:23', '2020-08-22 00:11:33', 1, 1);
INSERT INTO `sys_menu` VALUES (1296836240330530817, 'DIST_RANK_PARAM_EDIT', 'DIST_RANKE_PARAM', '[0],[DIST_PROFIT_CONFIG],[DIST_RANKE_PARAM],', '段位参数修改', 'layui-icon-star-fill', '/distRankParam/editItem', NULL, 3, 'N', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', '2020-08-21 23:47:08', '2020-08-22 00:11:33', 1, 1);
INSERT INTO `sys_menu` VALUES (1296836240330530818, 'DIST_RANK_PARAM_DETELE', 'DIST_RANKE_PARAM', '[0],[DIST_PROFIT_CONFIG],[DIST_RANKE_PARAM],', '段位参数删除', 'layui-icon-star-fill', '/distRankParam/delete', NULL, 3, 'N', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', '2020-08-21 23:47:08', '2020-08-22 00:11:33', 1, 1);
INSERT INTO `sys_menu` VALUES (1296841700173492226, 'DIST_WITHDRAW', 'DIST_PROFIT_CENTER', '[0],[DIST_PROFIT_CENTER],', '分润提现', 'layui-icon-star-fill', '/distWithdrawRecord', 3, 2, 'Y', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', '2020-08-22 00:08:50', '2020-08-22 00:11:12', 1, 1);
INSERT INTO `sys_menu` VALUES (1299915115524612098, 'DIST_ACCOUNT_RECORD', 'DIST_MEMBER_MANAGE', '[0],[DIST_MEMBER_MANAGE],', '账户变动', 'layui-icon-star-fill', '/distAccountRecord', 4, 2, 'Y', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', '2020-08-30 11:41:29', NULL, 1, NULL);
INSERT INTO `sys_menu` VALUES (1300045146670362625, 'DIST_PROFIT_EVENT', 'DIST_PROFIT_CENTER', '[0],[DIST_PROFIT_CENTER],', '分润事件', 'layui-icon-star-fill', '/distProfitEvent', 2, 2, 'Y', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', '2020-08-30 20:18:11', '2020-08-30 20:21:03', 1, 1);
INSERT INTO `sys_menu` VALUES (1300095232238448642, 'DIST_MEMBER_TEAM', 'DIST_MEMBER_MANAGE', '[0],[DIST_MEMBER_MANAGE],', '会员层级', 'layui-icon-star-fill', '#', 1, 2, 'Y', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', '2020-08-30 23:37:13', '2020-09-07 23:11:45', 1, 1);
INSERT INTO `sys_menu` VALUES (1301774643555741697, 'DIST_CONSOLE', 'dashboard', '[0],[dashboard],', '分销总览', 'layui-icon-star-fill', '/distDashboard/workplace', 50, 2, 'Y', NULL, 'ENABLE', NULL, NULL, 'BASE_SYSTEM', '2020-09-04 14:50:35', '2020-10-05 16:45:39', 1, 1);

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` bigint(20) NOT NULL COMMENT '主键',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '内容',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_user` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `update_user` bigint(20) NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '通知表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (6, '欢迎', 'hi，Guns旗舰版发布了！', '2017-01-11 08:53:20', 1, '2018-12-28 23:24:48', 1);
INSERT INTO `sys_notice` VALUES (8, '你好', '你好，世界！', '2017-05-10 19:28:57', 1, '2018-12-28 23:28:26', 1);

-- ----------------------------
-- Table structure for sys_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_operation_log`;
CREATE TABLE `sys_operation_log`  (
  `operation_log_id` bigint(20) NOT NULL COMMENT '主键',
  `log_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日志类型(字典)',
  `log_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日志名称',
  `user_id` bigint(65) NULL DEFAULT NULL COMMENT '用户id',
  `class_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类名称',
  `method` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '方法名称',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `succeed` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否成功(字典)',
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '备注',
  PRIMARY KEY (`operation_log_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '操作日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_operation_log
-- ----------------------------
INSERT INTO `sys_operation_log` VALUES (1240637477484531714, '业务日志', '清空业务日志', 1, 'cn.stylefeng.guns.sys.modular.system.controller.LogController', 'delLog', '2020-03-19 21:53:19', '成功', '主键id=null');
INSERT INTO `sys_operation_log` VALUES (1270674447258431489, '业务日志', '菜单新增', 1, 'cn.stylefeng.guns.sys.modular.system.controller.MenuController', 'add', '2020-06-10 19:09:31', '成功', '菜单名称=分销配置');
INSERT INTO `sys_operation_log` VALUES (1270674518796480513, '业务日志', '修改菜单', 1, 'cn.stylefeng.guns.sys.modular.system.controller.MenuController', 'edit', '2020-06-10 19:09:48', '成功', '菜单名称=分润参数表;;;');
INSERT INTO `sys_operation_log` VALUES (1279765514331111425, '业务日志', '菜单新增', 1, 'cn.stylefeng.guns.sys.modular.system.controller.MenuController', 'add', '2020-07-05 21:14:10', '成功', '菜单名称=会员管理');
INSERT INTO `sys_operation_log` VALUES (1279766093090537473, '业务日志', '菜单新增', 1, 'cn.stylefeng.guns.sys.modular.system.controller.MenuController', 'add', '2020-07-05 21:16:28', '成功', '菜单名称=交易中心');
INSERT INTO `sys_operation_log` VALUES (1279766463275614210, '异常日志', '', 1, NULL, NULL, '2020-07-05 21:17:56', '失败', 'RequestEmptyException()\r\n');
INSERT INTO `sys_operation_log` VALUES (1279766482590384129, '业务日志', '菜单新增', 1, 'cn.stylefeng.guns.sys.modular.system.controller.MenuController', 'add', '2020-07-05 21:18:01', '成功', '菜单名称=统计中心');
INSERT INTO `sys_operation_log` VALUES (1279766540740214785, '业务日志', '修改菜单', 1, 'cn.stylefeng.guns.sys.modular.system.controller.MenuController', 'edit', '2020-07-05 21:18:15', '成功', '菜单名称=会员;;;');
INSERT INTO `sys_operation_log` VALUES (1279766588806938626, '业务日志', '修改菜单', 1, 'cn.stylefeng.guns.sys.modular.system.controller.MenuController', 'edit', '2020-07-05 21:18:26', '成功', '菜单名称=平台;;;');
INSERT INTO `sys_operation_log` VALUES (1279766666795827202, '业务日志', '修改菜单', 1, 'cn.stylefeng.guns.sys.modular.system.controller.MenuController', 'edit', '2020-07-05 21:18:45', '成功', '菜单名称=外部交易记录;;;');
INSERT INTO `sys_operation_log` VALUES (1279767043612098562, '业务日志', '配置权限', 1, 'cn.stylefeng.guns.sys.modular.system.controller.RoleController', 'setAuthority', '2020-07-05 21:20:15', '成功', '角色名称=超级管理员,资源名称=系统管理,用户管理,添加用户,修改用户,删除用户,重置密码,冻结用户,解除冻结用户,分配角色,分配角色跳转,编辑用户跳转,用户列表,角色管理,添加角色,修改角色,删除角色,配置权限,修改角色跳转,角色分配跳转,角色列表,菜单管理,添加菜单,修改菜单,删除菜单,菜单编辑跳转,菜单列表,业务日志,清空日志,日志列表,日志详情,监控管理,部门管理,添加部门,修改部门,删除部门,修改部门跳转,部门列表,部门详情,字典管理,添加字典,修改字典,删除字典,修改菜单跳转,字典列表,字典详情,登录日志,清空登录日志,登录日志列表,通知管理,添加通知,修改通知,删除通知,职位管理,职位表添加,职位表修改,职位表删除,开发管理,接口文档,参数配置,参数配置添加,参数配置修改,参数配置删除,主控面板,消息通知,项目介绍,统计报表,系统监控,高级组件,高级表单,文档预览,数据容器,excel处理,excel导入,excel导出,分销配置,分润参数表,分润参数表添加,分润参数表修改,分润参数表删除,会员管理,会员,会员表;添加,会员表;修改,会员表;删除,平台,平台表添加,平台表修改,平台表删除,交易中心,外部交易记录,外部交易记录表添加,外部交易记录表修改,外部交易记录表删除');
INSERT INTO `sys_operation_log` VALUES (1279767059525287938, '异常日志', '', 1, NULL, NULL, '2020-07-05 21:20:19', '失败', 'java.lang.NullPointerException\r\n	at cn.stylefeng.guns.base.pojo.node.MenuNode.compareTo(MenuNode.java:120)\r\n	at java.util.ComparableTimSort.countRunAndMakeAscending(ComparableTimSort.java:320)\r\n	at java.util.ComparableTimSort.sort(ComparableTimSort.java:188)\r\n	at java.util.Arrays.sort(Arrays.java:1312)\r\n	at java.util.Arrays.sort(Arrays.java:1506)\r\n	at java.util.ArrayList.sort(ArrayList.java:1454)\r\n	at java.util.Collections.sort(Collections.java:141)\r\n	at cn.stylefeng.guns.base.pojo.node.MenuNode.buildTitle(MenuNode.java:139)\r\n	at cn.stylefeng.guns.sys.modular.system.service.UserService.getUserMenuNodes(UserService.java:233)\r\n	at cn.stylefeng.guns.sys.modular.system.service.UserService.getUserIndexInfo(UserService.java:308)\r\n	at cn.stylefeng.guns.sys.modular.system.service.UserServiceTTFastClassBySpringCGLIBTT7548ebca.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\r\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:684)\r\n	at cn.stylefeng.guns.sys.modular.system.service.UserServiceTTEnhancerBySpringCGLIBTTb88334e3.getUserIndexInfo(<generated>)\r\n	at cn.stylefeng.guns.sys.modular.system.controller.LoginController.index(LoginController.java:82)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:497)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:190)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:138)\r\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:104)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:892)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:797)\r\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1039)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:942)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1005)\r\n	at org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:897)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:634)\r\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:882)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:741)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:53)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:103)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at cn.stylefeng.roses.core.xss.XssFilter.doFilter(XssFilter.java:31)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:124)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:320)\r\n	at org.springframework.security.web.access.intercept.FilterSecurityInterceptor.invoke(FilterSecurityInterceptor.java:127)\r\n	at org.springframework.security.web.access.intercept.FilterSecurityInterceptor.doFilter(FilterSecurityInterceptor.java:91)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:119)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:137)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.authentication.AnonymousAuthenticationFilter.doFilter(AnonymousAuthenticationFilter.java:111)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestFilter.doFilter(SecurityContextHolderAwareRequestFilter.java:170)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.savedrequest.RequestCacheAwareFilter.doFilter(RequestCacheAwareFilter.java:63)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at cn.stylefeng.guns.sys.core.auth.filter.JwtAuthorizationTokenFilter.doFilterInternal(JwtAuthorizationTokenFilter.java:78)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.web.filter.CorsFilter.doFilterInternal(CorsFilter.java:96)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.header.HeaderWriterFilter.doFilterInternal(HeaderWriterFilter.java:74)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.context.SecurityContextPersistenceFilter.doFilter(SecurityContextPersistenceFilter.java:105)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.context.request.async.WebAsyncManagerIntegrationFilter.doFilterInternal(WebAsyncManagerIntegrationFilter.java:56)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.FilterChainProxy.doFilterInternal(FilterChainProxy.java:215)\r\n	at org.springframework.security.web.FilterChainProxy.doFilter(FilterChainProxy.java:178)\r\n	at org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:357)\r\n	at org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:270)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:99)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:92)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.HiddenHttpMethodFilter.doFilterInternal(HiddenHttpMethodFilter.java:93)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:200)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:202)\r\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:96)\r\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:490)\r\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:139)\r\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:92)\r\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:74)\r\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:343)\r\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:408)\r\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\r\n	at org.apache.coyote.AbstractProtocolTConnectionHandler.process(AbstractProtocol.java:853)\r\n	at org.apache.tomcat.util.net.NioEndpointTSocketProcessor.doRun(NioEndpoint.java:1587)\r\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\r\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1142)\r\n	at java.util.concurrent.ThreadPoolExecutorTWorker.run(ThreadPoolExecutor.java:617)\r\n	at org.apache.tomcat.util.threads.TaskThreadTWrappingRunnable.run(TaskThread.java:61)\r\n	at java.lang.Thread.run(Thread.java:745)\r\n');
INSERT INTO `sys_operation_log` VALUES (1279767116202917890, '异常日志', '', 1, NULL, NULL, '2020-07-05 21:20:32', '失败', 'java.lang.NullPointerException\r\n	at cn.stylefeng.guns.base.pojo.node.MenuNode.compareTo(MenuNode.java:120)\r\n	at java.util.ComparableTimSort.countRunAndMakeAscending(ComparableTimSort.java:320)\r\n	at java.util.ComparableTimSort.sort(ComparableTimSort.java:188)\r\n	at java.util.Arrays.sort(Arrays.java:1312)\r\n	at java.util.Arrays.sort(Arrays.java:1506)\r\n	at java.util.ArrayList.sort(ArrayList.java:1454)\r\n	at java.util.Collections.sort(Collections.java:141)\r\n	at cn.stylefeng.guns.base.pojo.node.MenuNode.buildTitle(MenuNode.java:139)\r\n	at cn.stylefeng.guns.sys.modular.system.service.UserService.getUserMenuNodes(UserService.java:233)\r\n	at cn.stylefeng.guns.sys.modular.system.service.UserService.getUserIndexInfo(UserService.java:308)\r\n	at cn.stylefeng.guns.sys.modular.system.service.UserServiceTTFastClassBySpringCGLIBTT7548ebca.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\r\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:684)\r\n	at cn.stylefeng.guns.sys.modular.system.service.UserServiceTTEnhancerBySpringCGLIBTTb88334e3.getUserIndexInfo(<generated>)\r\n	at cn.stylefeng.guns.sys.modular.system.controller.LoginController.index(LoginController.java:82)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:497)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:190)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:138)\r\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:104)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:892)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:797)\r\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1039)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:942)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1005)\r\n	at org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:897)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:634)\r\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:882)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:741)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:53)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:103)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at cn.stylefeng.roses.core.xss.XssFilter.doFilter(XssFilter.java:31)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:124)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:320)\r\n	at org.springframework.security.web.access.intercept.FilterSecurityInterceptor.invoke(FilterSecurityInterceptor.java:127)\r\n	at org.springframework.security.web.access.intercept.FilterSecurityInterceptor.doFilter(FilterSecurityInterceptor.java:91)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:119)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:137)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.authentication.AnonymousAuthenticationFilter.doFilter(AnonymousAuthenticationFilter.java:111)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestFilter.doFilter(SecurityContextHolderAwareRequestFilter.java:170)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.savedrequest.RequestCacheAwareFilter.doFilter(RequestCacheAwareFilter.java:63)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at cn.stylefeng.guns.sys.core.auth.filter.JwtAuthorizationTokenFilter.doFilterInternal(JwtAuthorizationTokenFilter.java:78)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.web.filter.CorsFilter.doFilterInternal(CorsFilter.java:96)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.header.HeaderWriterFilter.doFilterInternal(HeaderWriterFilter.java:74)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.context.SecurityContextPersistenceFilter.doFilter(SecurityContextPersistenceFilter.java:105)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.context.request.async.WebAsyncManagerIntegrationFilter.doFilterInternal(WebAsyncManagerIntegrationFilter.java:56)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.FilterChainProxy.doFilterInternal(FilterChainProxy.java:215)\r\n	at org.springframework.security.web.FilterChainProxy.doFilter(FilterChainProxy.java:178)\r\n	at org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:357)\r\n	at org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:270)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:99)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:92)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.HiddenHttpMethodFilter.doFilterInternal(HiddenHttpMethodFilter.java:93)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:200)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:202)\r\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:96)\r\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:490)\r\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:139)\r\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:92)\r\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:74)\r\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:343)\r\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:408)\r\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\r\n	at org.apache.coyote.AbstractProtocolTConnectionHandler.process(AbstractProtocol.java:853)\r\n	at org.apache.tomcat.util.net.NioEndpointTSocketProcessor.doRun(NioEndpoint.java:1587)\r\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\r\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1142)\r\n	at java.util.concurrent.ThreadPoolExecutorTWorker.run(ThreadPoolExecutor.java:617)\r\n	at org.apache.tomcat.util.threads.TaskThreadTWrappingRunnable.run(TaskThread.java:61)\r\n	at java.lang.Thread.run(Thread.java:745)\r\n');
INSERT INTO `sys_operation_log` VALUES (1279767137673560066, '异常日志', '', 1, NULL, NULL, '2020-07-05 21:20:37', '失败', 'java.lang.NullPointerException\r\n	at cn.stylefeng.guns.base.pojo.node.MenuNode.compareTo(MenuNode.java:120)\r\n	at java.util.ComparableTimSort.countRunAndMakeAscending(ComparableTimSort.java:320)\r\n	at java.util.ComparableTimSort.sort(ComparableTimSort.java:188)\r\n	at java.util.Arrays.sort(Arrays.java:1312)\r\n	at java.util.Arrays.sort(Arrays.java:1506)\r\n	at java.util.ArrayList.sort(ArrayList.java:1454)\r\n	at java.util.Collections.sort(Collections.java:141)\r\n	at cn.stylefeng.guns.base.pojo.node.MenuNode.buildTitle(MenuNode.java:139)\r\n	at cn.stylefeng.guns.sys.modular.system.service.UserService.getUserMenuNodes(UserService.java:233)\r\n	at cn.stylefeng.guns.sys.modular.system.service.UserService.getUserIndexInfo(UserService.java:308)\r\n	at cn.stylefeng.guns.sys.modular.system.service.UserServiceTTFastClassBySpringCGLIBTT7548ebca.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\r\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:684)\r\n	at cn.stylefeng.guns.sys.modular.system.service.UserServiceTTEnhancerBySpringCGLIBTTb88334e3.getUserIndexInfo(<generated>)\r\n	at cn.stylefeng.guns.sys.modular.system.controller.LoginController.index(LoginController.java:82)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:497)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:190)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:138)\r\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:104)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:892)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:797)\r\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1039)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:942)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1005)\r\n	at org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:897)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:634)\r\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:882)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:741)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:53)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:103)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at cn.stylefeng.roses.core.xss.XssFilter.doFilter(XssFilter.java:31)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:124)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:320)\r\n	at org.springframework.security.web.access.intercept.FilterSecurityInterceptor.invoke(FilterSecurityInterceptor.java:127)\r\n	at org.springframework.security.web.access.intercept.FilterSecurityInterceptor.doFilter(FilterSecurityInterceptor.java:91)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:119)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:137)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.authentication.AnonymousAuthenticationFilter.doFilter(AnonymousAuthenticationFilter.java:111)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestFilter.doFilter(SecurityContextHolderAwareRequestFilter.java:170)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.savedrequest.RequestCacheAwareFilter.doFilter(RequestCacheAwareFilter.java:63)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at cn.stylefeng.guns.sys.core.auth.filter.JwtAuthorizationTokenFilter.doFilterInternal(JwtAuthorizationTokenFilter.java:78)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.web.filter.CorsFilter.doFilterInternal(CorsFilter.java:96)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.header.HeaderWriterFilter.doFilterInternal(HeaderWriterFilter.java:74)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.context.SecurityContextPersistenceFilter.doFilter(SecurityContextPersistenceFilter.java:105)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.context.request.async.WebAsyncManagerIntegrationFilter.doFilterInternal(WebAsyncManagerIntegrationFilter.java:56)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.FilterChainProxy.doFilterInternal(FilterChainProxy.java:215)\r\n	at org.springframework.security.web.FilterChainProxy.doFilter(FilterChainProxy.java:178)\r\n	at org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:357)\r\n	at org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:270)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:99)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:92)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.HiddenHttpMethodFilter.doFilterInternal(HiddenHttpMethodFilter.java:93)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:200)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:202)\r\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:96)\r\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:490)\r\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:139)\r\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:92)\r\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:74)\r\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:343)\r\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:408)\r\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\r\n	at org.apache.coyote.AbstractProtocolTConnectionHandler.process(AbstractProtocol.java:853)\r\n	at org.apache.tomcat.util.net.NioEndpointTSocketProcessor.doRun(NioEndpoint.java:1587)\r\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\r\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1142)\r\n	at java.util.concurrent.ThreadPoolExecutorTWorker.run(ThreadPoolExecutor.java:617)\r\n	at org.apache.tomcat.util.threads.TaskThreadTWrappingRunnable.run(TaskThread.java:61)\r\n	at java.lang.Thread.run(Thread.java:745)\r\n');
INSERT INTO `sys_operation_log` VALUES (1282700586541715458, '业务日志', '修改菜单', 1, 'cn.stylefeng.guns.sys.modular.system.controller.MenuController', 'edit', '2020-07-13 23:37:06', '成功', '菜单名称=分润参数;;;字段名称:菜单名称,旧值:分润参数表,新值:分润参数');
INSERT INTO `sys_operation_log` VALUES (1282704336782127106, '异常日志', '', 1, NULL, NULL, '2020-07-13 23:52:00', '失败', 'org.springframework.web.HttpRequestMethodNotSupportedException: Request method \'POST\' not supported\r\n	at org.springframework.web.servlet.mvc.method.RequestMappingInfoHandlerMapping.handleNoMatch(RequestMappingInfoHandlerMapping.java:200)\r\n	at org.springframework.web.servlet.handler.AbstractHandlerMethodMapping.lookupHandlerMethod(AbstractHandlerMethodMapping.java:419)\r\n	at org.springframework.web.servlet.handler.AbstractHandlerMethodMapping.getHandlerInternal(AbstractHandlerMethodMapping.java:365)\r\n	at org.springframework.web.servlet.handler.AbstractHandlerMethodMapping.getHandlerInternal(AbstractHandlerMethodMapping.java:65)\r\n	at org.springframework.web.servlet.handler.AbstractHandlerMapping.getHandler(AbstractHandlerMapping.java:401)\r\n	at org.springframework.web.servlet.DispatcherServlet.getHandler(DispatcherServlet.java:1232)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1015)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:942)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1005)\r\n	at org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:908)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:660)\r\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:882)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:741)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:53)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:103)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at cn.stylefeng.roses.core.xss.XssFilter.doFilter(XssFilter.java:31)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:124)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:320)\r\n	at org.springframework.security.web.access.intercept.FilterSecurityInterceptor.invoke(FilterSecurityInterceptor.java:127)\r\n	at org.springframework.security.web.access.intercept.FilterSecurityInterceptor.doFilter(FilterSecurityInterceptor.java:91)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:119)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:137)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.authentication.AnonymousAuthenticationFilter.doFilter(AnonymousAuthenticationFilter.java:111)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestFilter.doFilter(SecurityContextHolderAwareRequestFilter.java:170)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.savedrequest.RequestCacheAwareFilter.doFilter(RequestCacheAwareFilter.java:63)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at cn.stylefeng.guns.sys.core.auth.filter.JwtAuthorizationTokenFilter.doFilterInternal(JwtAuthorizationTokenFilter.java:78)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.web.filter.CorsFilter.doFilterInternal(CorsFilter.java:96)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.header.HeaderWriterFilter.doFilterInternal(HeaderWriterFilter.java:74)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.context.SecurityContextPersistenceFilter.doFilter(SecurityContextPersistenceFilter.java:105)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.context.request.async.WebAsyncManagerIntegrationFilter.doFilterInternal(WebAsyncManagerIntegrationFilter.java:56)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.FilterChainProxy.doFilterInternal(FilterChainProxy.java:215)\r\n	at org.springframework.security.web.FilterChainProxy.doFilter(FilterChainProxy.java:178)\r\n	at org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:357)\r\n	at org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:270)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:99)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:92)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.HiddenHttpMethodFilter.doFilterInternal(HiddenHttpMethodFilter.java:93)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:200)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:202)\r\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:96)\r\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:490)\r\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:139)\r\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:92)\r\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:74)\r\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:343)\r\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:408)\r\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\r\n	at org.apache.coyote.AbstractProtocolTConnectionHandler.process(AbstractProtocol.java:853)\r\n	at org.apache.tomcat.util.net.NioEndpointTSocketProcessor.doRun(NioEndpoint.java:1587)\r\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\r\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1142)\r\n	at java.util.concurrent.ThreadPoolExecutorTWorker.run(ThreadPoolExecutor.java:617)\r\n	at org.apache.tomcat.util.threads.TaskThreadTWrappingRunnable.run(TaskThread.java:61)\r\n	at java.lang.Thread.run(Thread.java:745)\r\n');
INSERT INTO `sys_operation_log` VALUES (1282704438393335809, '异常日志', '', 1, NULL, NULL, '2020-07-13 23:52:24', '失败', 'org.springframework.web.HttpRequestMethodNotSupportedException: Request method \'POST\' not supported\r\n	at org.springframework.web.servlet.mvc.method.RequestMappingInfoHandlerMapping.handleNoMatch(RequestMappingInfoHandlerMapping.java:200)\r\n	at org.springframework.web.servlet.handler.AbstractHandlerMethodMapping.lookupHandlerMethod(AbstractHandlerMethodMapping.java:419)\r\n	at org.springframework.web.servlet.handler.AbstractHandlerMethodMapping.getHandlerInternal(AbstractHandlerMethodMapping.java:365)\r\n	at org.springframework.web.servlet.handler.AbstractHandlerMethodMapping.getHandlerInternal(AbstractHandlerMethodMapping.java:65)\r\n	at org.springframework.web.servlet.handler.AbstractHandlerMapping.getHandler(AbstractHandlerMapping.java:401)\r\n	at org.springframework.web.servlet.DispatcherServlet.getHandler(DispatcherServlet.java:1232)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1015)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:942)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1005)\r\n	at org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:908)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:660)\r\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:882)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:741)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:53)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:103)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at cn.stylefeng.roses.core.xss.XssFilter.doFilter(XssFilter.java:31)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:124)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:320)\r\n	at org.springframework.security.web.access.intercept.FilterSecurityInterceptor.invoke(FilterSecurityInterceptor.java:127)\r\n	at org.springframework.security.web.access.intercept.FilterSecurityInterceptor.doFilter(FilterSecurityInterceptor.java:91)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:119)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:137)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.authentication.AnonymousAuthenticationFilter.doFilter(AnonymousAuthenticationFilter.java:111)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestFilter.doFilter(SecurityContextHolderAwareRequestFilter.java:170)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.savedrequest.RequestCacheAwareFilter.doFilter(RequestCacheAwareFilter.java:63)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at cn.stylefeng.guns.sys.core.auth.filter.JwtAuthorizationTokenFilter.doFilterInternal(JwtAuthorizationTokenFilter.java:78)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.web.filter.CorsFilter.doFilterInternal(CorsFilter.java:96)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.header.HeaderWriterFilter.doFilterInternal(HeaderWriterFilter.java:74)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.context.SecurityContextPersistenceFilter.doFilter(SecurityContextPersistenceFilter.java:105)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.context.request.async.WebAsyncManagerIntegrationFilter.doFilterInternal(WebAsyncManagerIntegrationFilter.java:56)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.FilterChainProxy.doFilterInternal(FilterChainProxy.java:215)\r\n	at org.springframework.security.web.FilterChainProxy.doFilter(FilterChainProxy.java:178)\r\n	at org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:357)\r\n	at org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:270)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:99)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:92)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.HiddenHttpMethodFilter.doFilterInternal(HiddenHttpMethodFilter.java:93)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:200)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:202)\r\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:96)\r\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:490)\r\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:139)\r\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:92)\r\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:74)\r\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:343)\r\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:408)\r\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\r\n	at org.apache.coyote.AbstractProtocolTConnectionHandler.process(AbstractProtocol.java:853)\r\n	at org.apache.tomcat.util.net.NioEndpointTSocketProcessor.doRun(NioEndpoint.java:1587)\r\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\r\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1142)\r\n	at java.util.concurrent.ThreadPoolExecutorTWorker.run(ThreadPoolExecutor.java:617)\r\n	at org.apache.tomcat.util.threads.TaskThreadTWrappingRunnable.run(TaskThread.java:61)\r\n	at java.lang.Thread.run(Thread.java:745)\r\n');
INSERT INTO `sys_operation_log` VALUES (1283390763887095810, '业务日志', '修改菜单', 1, 'cn.stylefeng.guns.sys.modular.system.controller.MenuController', 'edit', '2020-07-15 21:19:37', '成功', '菜单名称=分销配置;;;字段名称:菜单排序号,旧值:3,新值:1');
INSERT INTO `sys_operation_log` VALUES (1289190884969029633, '业务日志', '添加角色', 1, 'cn.stylefeng.guns.sys.modular.system.controller.RoleController', 'add', '2020-07-31 21:27:14', '成功', '角色名称=分销平台');
INSERT INTO `sys_operation_log` VALUES (1289193086433370113, '业务日志', '删除菜单', 1, 'cn.stylefeng.guns.sys.modular.system.controller.MenuController', 'remove', '2020-07-31 21:35:59', '成功', '菜单名称=账户表添加');
INSERT INTO `sys_operation_log` VALUES (1289193210609934338, '业务日志', '修改角色', 1, 'cn.stylefeng.guns.sys.modular.system.controller.RoleController', 'edit', '2020-07-31 21:36:28', '成功', '角色名称=分销平台;;;');
INSERT INTO `sys_operation_log` VALUES (1289193259276443650, '业务日志', '修改角色', 1, 'cn.stylefeng.guns.sys.modular.system.controller.RoleController', 'edit', '2020-07-31 21:36:40', '成功', '角色名称=分销平台商;;;字段名称:角色名称,旧值:分销平台,新值:分销平台商');
INSERT INTO `sys_operation_log` VALUES (1289193618971566082, '业务日志', '配置权限', 1, 'cn.stylefeng.guns.sys.modular.system.controller.RoleController', 'setAuthority', '2020-07-31 21:38:05', '成功', '角色名称=超级管理员,资源名称=系统管理,用户管理,添加用户,修改用户,删除用户,重置密码,冻结用户,解除冻结用户,分配角色,分配角色跳转,编辑用户跳转,用户列表,角色管理,添加角色,修改角色,删除角色,配置权限,修改角色跳转,角色分配跳转,角色列表,菜单管理,添加菜单,修改菜单,删除菜单,菜单编辑跳转,菜单列表,业务日志,清空日志,日志列表,日志详情,监控管理,部门管理,添加部门,修改部门,删除部门,修改部门跳转,部门列表,部门详情,字典管理,添加字典,修改字典,删除字典,修改菜单跳转,字典列表,字典详情,登录日志,清空登录日志,登录日志列表,通知管理,添加通知,修改通知,删除通知,职位管理,职位表添加,职位表修改,职位表删除,开发管理,接口文档,参数配置,参数配置添加,参数配置修改,参数配置删除,主控面板,消息通知,项目介绍,统计报表,系统监控,高级组件,高级表单,文档预览,数据容器,excel处理,excel导入,excel导出,分销配置,分润参数管理,分润参数表添加,分润参数表修改,分润参数表删除,账号管理,会员管理,会员表;修改,平台管理,平台表添加,平台表修改,交易中心');
INSERT INTO `sys_operation_log` VALUES (1289198543252287489, '业务日志', '修改菜单', 1, 'cn.stylefeng.guns.sys.modular.system.controller.MenuController', 'edit', '2020-07-31 21:57:40', '成功', '菜单名称=平台添加;;;字段名称:url地址,旧值:,新值:/distPlatform/addItem');
INSERT INTO `sys_operation_log` VALUES (1289408015165911042, '业务日志', '删除部门', 1, 'cn.stylefeng.guns.sys.modular.system.controller.DeptController', 'delete', '2020-08-01 11:50:02', '成功', '部门名称=');
INSERT INTO `sys_operation_log` VALUES (1289408028201807873, '业务日志', '删除部门', 1, 'cn.stylefeng.guns.sys.modular.system.controller.DeptController', 'delete', '2020-08-01 11:50:05', '成功', '部门名称=');
INSERT INTO `sys_operation_log` VALUES (1289408040713416706, '业务日志', '删除部门', 1, 'cn.stylefeng.guns.sys.modular.system.controller.DeptController', 'delete', '2020-08-01 11:50:08', '成功', '部门名称=');
INSERT INTO `sys_operation_log` VALUES (1289408114084376578, '业务日志', '添加部门', 1, 'cn.stylefeng.guns.sys.modular.system.controller.DeptController', 'add', '2020-08-01 11:50:25', '成功', '部门简称=运营部');
INSERT INTO `sys_operation_log` VALUES (1289448404421763073, '业务日志', '配置权限', 1, 'cn.stylefeng.guns.sys.modular.system.controller.RoleController', 'setAuthority', '2020-08-01 14:30:31', '成功', '角色名称=分销平台商,资源名称=账号管理,会员管理,会员添加,会员修改,会员删除');
INSERT INTO `sys_operation_log` VALUES (1289449051762253825, '业务日志', '修改菜单', 1, 'cn.stylefeng.guns.sys.modular.system.controller.MenuController', 'edit', '2020-08-01 14:33:05', '成功', '菜单名称=账号管理;;;字段名称:菜单排序号,旧值:2,新值:1');
INSERT INTO `sys_operation_log` VALUES (1289449081445343233, '业务日志', '修改菜单', 1, 'cn.stylefeng.guns.sys.modular.system.controller.MenuController', 'edit', '2020-08-01 14:33:12', '成功', '菜单名称=分销配置;;;字段名称:菜单排序号,旧值:1,新值:2');
INSERT INTO `sys_operation_log` VALUES (1289449189310259201, '业务日志', '修改菜单', 1, 'cn.stylefeng.guns.sys.modular.system.controller.MenuController', 'edit', '2020-08-01 14:33:38', '成功', '菜单名称=平台管理;;;字段名称:菜单排序号,旧值:999,新值:1');
INSERT INTO `sys_operation_log` VALUES (1289564000656363521, '业务日志', '修改菜单', 1, 'cn.stylefeng.guns.sys.modular.system.controller.MenuController', 'edit', '2020-08-01 22:09:51', '成功', '菜单名称=平台管理;;;字段名称:菜单排序号,旧值:1,新值:2');
INSERT INTO `sys_operation_log` VALUES (1289564045233426433, '业务日志', '修改菜单', 1, 'cn.stylefeng.guns.sys.modular.system.controller.MenuController', 'edit', '2020-08-01 22:10:02', '成功', '菜单名称=会员管理;;;字段名称:菜单排序号,旧值:999,新值:1');
INSERT INTO `sys_operation_log` VALUES (1289575285661970434, '业务日志', '修改菜单', 1, 'cn.stylefeng.guns.sys.modular.system.controller.MenuController', 'edit', '2020-08-01 22:54:42', '成功', '菜单名称=分润参数;;;字段名称:菜单名称,旧值:分润参数管理,新值:分润参数');
INSERT INTO `sys_operation_log` VALUES (1289581145385644034, '业务日志', '菜单新增', 1, 'cn.stylefeng.guns.sys.modular.system.controller.MenuController', 'add', '2020-08-01 23:17:59', '成功', '菜单名称=模拟操作');
INSERT INTO `sys_operation_log` VALUES (1289581368589725698, '业务日志', '修改菜单', 1, 'cn.stylefeng.guns.sys.modular.system.controller.MenuController', 'edit', '2020-08-01 23:18:52', '成功', '菜单名称=模拟操作;;;字段名称:url地址,旧值:#,新值:/doc.html');
INSERT INTO `sys_operation_log` VALUES (1289581513163190273, '业务日志', '配置权限', 1, 'cn.stylefeng.guns.sys.modular.system.controller.RoleController', 'setAuthority', '2020-08-01 23:19:27', '成功', '角色名称=超级管理员,资源名称=系统管理,用户管理,添加用户,修改用户,删除用户,重置密码,冻结用户,解除冻结用户,分配角色,分配角色跳转,编辑用户跳转,用户列表,角色管理,添加角色,修改角色,删除角色,配置权限,修改角色跳转,角色分配跳转,角色列表,菜单管理,添加菜单,修改菜单,删除菜单,菜单编辑跳转,菜单列表,业务日志,清空日志,日志列表,日志详情,监控管理,部门管理,添加部门,修改部门,删除部门,修改部门跳转,部门列表,部门详情,字典管理,添加字典,修改字典,删除字典,修改菜单跳转,字典列表,字典详情,登录日志,清空登录日志,登录日志列表,通知管理,添加通知,修改通知,删除通知,职位管理,职位表添加,职位表修改,职位表删除,开发管理,接口文档,参数配置,参数配置添加,参数配置修改,参数配置删除,模拟操作,主控面板,消息通知,项目介绍,统计报表,系统监控,高级组件,高级表单,文档预览,数据容器,excel处理,excel导入,excel导出,分销配置,分润参数,分润参数添加,分润参数修改,分润参数删除,账号管理,会员管理,会员修改,平台管理,平台添加,平台修改,交易中心');
INSERT INTO `sys_operation_log` VALUES (1289828285802401794, '业务日志', '菜单新增', 1, 'cn.stylefeng.guns.sys.modular.system.controller.MenuController', 'add', '2020-08-02 15:40:02', '成功', '菜单名称=分润记录');
INSERT INTO `sys_operation_log` VALUES (1289828373136199682, '业务日志', '配置权限', 1, 'cn.stylefeng.guns.sys.modular.system.controller.RoleController', 'setAuthority', '2020-08-02 15:40:23', '成功', '角色名称=超级管理员,资源名称=系统管理,用户管理,添加用户,修改用户,删除用户,重置密码,冻结用户,解除冻结用户,分配角色,分配角色跳转,编辑用户跳转,用户列表,角色管理,添加角色,修改角色,删除角色,配置权限,修改角色跳转,角色分配跳转,角色列表,菜单管理,添加菜单,修改菜单,删除菜单,菜单编辑跳转,菜单列表,业务日志,清空日志,日志列表,日志详情,监控管理,部门管理,添加部门,修改部门,删除部门,修改部门跳转,部门列表,部门详情,字典管理,添加字典,修改字典,删除字典,修改菜单跳转,字典列表,字典详情,登录日志,清空登录日志,登录日志列表,通知管理,添加通知,修改通知,删除通知,职位管理,职位表添加,职位表修改,职位表删除,开发管理,接口文档,参数配置,参数配置添加,参数配置修改,参数配置删除,模拟操作,主控面板,消息通知,项目介绍,统计报表,系统监控,高级组件,高级表单,文档预览,数据容器,excel处理,excel导入,excel导出,分销配置,分润参数,分润参数添加,分润参数修改,分润参数删除,账号管理,会员管理,会员修改,平台管理,平台添加,平台修改,交易中心');
INSERT INTO `sys_operation_log` VALUES (1289828440333144066, '业务日志', '配置权限', 1, 'cn.stylefeng.guns.sys.modular.system.controller.RoleController', 'setAuthority', '2020-08-02 15:40:39', '成功', '角色名称=超级管理员,资源名称=系统管理,用户管理,添加用户,修改用户,删除用户,重置密码,冻结用户,解除冻结用户,分配角色,分配角色跳转,编辑用户跳转,用户列表,角色管理,添加角色,修改角色,删除角色,配置权限,修改角色跳转,角色分配跳转,角色列表,菜单管理,添加菜单,修改菜单,删除菜单,菜单编辑跳转,菜单列表,业务日志,清空日志,日志列表,日志详情,监控管理,部门管理,添加部门,修改部门,删除部门,修改部门跳转,部门列表,部门详情,字典管理,添加字典,修改字典,删除字典,修改菜单跳转,字典列表,字典详情,登录日志,清空登录日志,登录日志列表,通知管理,添加通知,修改通知,删除通知,职位管理,职位表添加,职位表修改,职位表删除,开发管理,接口文档,参数配置,参数配置添加,参数配置修改,参数配置删除,模拟操作,主控面板,消息通知,项目介绍,统计报表,系统监控,高级组件,高级表单,文档预览,数据容器,excel处理,excel导入,excel导出,分销配置,分润参数,分润参数添加,分润参数修改,分润参数删除,账号管理,会员管理,会员修改,平台管理,平台添加,平台修改,交易中心,分润记录');
INSERT INTO `sys_operation_log` VALUES (1292805449535496194, '异常日志', '', 1, NULL, NULL, '2020-08-10 20:50:13', '失败', 'org.springframework.web.HttpRequestMethodNotSupportedException: Request method \'GET\' not supported\r\n	at org.springframework.web.servlet.mvc.method.RequestMappingInfoHandlerMapping.handleNoMatch(RequestMappingInfoHandlerMapping.java:200)\r\n	at org.springframework.web.servlet.handler.AbstractHandlerMethodMapping.lookupHandlerMethod(AbstractHandlerMethodMapping.java:419)\r\n	at org.springframework.web.servlet.handler.AbstractHandlerMethodMapping.getHandlerInternal(AbstractHandlerMethodMapping.java:365)\r\n	at org.springframework.web.servlet.handler.AbstractHandlerMethodMapping.getHandlerInternal(AbstractHandlerMethodMapping.java:65)\r\n	at org.springframework.web.servlet.handler.AbstractHandlerMapping.getHandler(AbstractHandlerMapping.java:401)\r\n	at org.springframework.web.servlet.DispatcherServlet.getHandler(DispatcherServlet.java:1232)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1015)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:942)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1005)\r\n	at org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:897)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:634)\r\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:882)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:741)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:53)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:103)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at cn.stylefeng.roses.core.xss.XssFilter.doFilter(XssFilter.java:31)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:124)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:320)\r\n	at org.springframework.security.web.access.intercept.FilterSecurityInterceptor.invoke(FilterSecurityInterceptor.java:127)\r\n	at org.springframework.security.web.access.intercept.FilterSecurityInterceptor.doFilter(FilterSecurityInterceptor.java:91)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:119)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:137)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.authentication.AnonymousAuthenticationFilter.doFilter(AnonymousAuthenticationFilter.java:111)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestFilter.doFilter(SecurityContextHolderAwareRequestFilter.java:170)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.savedrequest.RequestCacheAwareFilter.doFilter(RequestCacheAwareFilter.java:63)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at cn.stylefeng.guns.sys.core.auth.filter.JwtAuthorizationTokenFilter.doFilterInternal(JwtAuthorizationTokenFilter.java:78)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.web.filter.CorsFilter.doFilterInternal(CorsFilter.java:96)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.header.HeaderWriterFilter.doFilterInternal(HeaderWriterFilter.java:74)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.context.SecurityContextPersistenceFilter.doFilter(SecurityContextPersistenceFilter.java:105)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.context.request.async.WebAsyncManagerIntegrationFilter.doFilterInternal(WebAsyncManagerIntegrationFilter.java:56)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.FilterChainProxy.doFilterInternal(FilterChainProxy.java:215)\r\n	at org.springframework.security.web.FilterChainProxy.doFilter(FilterChainProxy.java:178)\r\n	at org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:357)\r\n	at org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:270)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:99)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:92)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.HiddenHttpMethodFilter.doFilterInternal(HiddenHttpMethodFilter.java:93)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:200)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:202)\r\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:96)\r\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:490)\r\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:139)\r\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:92)\r\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:74)\r\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:343)\r\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:408)\r\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\r\n	at org.apache.coyote.AbstractProtocolTConnectionHandler.process(AbstractProtocol.java:853)\r\n	at org.apache.tomcat.util.net.NioEndpointTSocketProcessor.doRun(NioEndpoint.java:1587)\r\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\r\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1142)\r\n	at java.util.concurrent.ThreadPoolExecutorTWorker.run(ThreadPoolExecutor.java:617)\r\n	at org.apache.tomcat.util.threads.TaskThreadTWrappingRunnable.run(TaskThread.java:61)\r\n	at java.lang.Thread.run(Thread.java:745)\r\n');
INSERT INTO `sys_operation_log` VALUES (1294292392110735362, '业务日志', '修改菜单', 1, 'cn.stylefeng.guns.sys.modular.system.controller.MenuController', 'edit', '2020-08-14 23:18:48', '成功', '菜单名称=账户管理;;;');
INSERT INTO `sys_operation_log` VALUES (1294292708130570241, '业务日志', '配置权限', 1, 'cn.stylefeng.guns.sys.modular.system.controller.RoleController', 'setAuthority', '2020-08-14 23:20:03', '成功', '角色名称=分销平台商,资源名称=账号管理,账户管理,账户修改,账户删除,会员管理,会员添加,会员修改,会员删除');
INSERT INTO `sys_operation_log` VALUES (1294292812237389825, '业务日志', '配置权限', 1, 'cn.stylefeng.guns.sys.modular.system.controller.RoleController', 'setAuthority', '2020-08-14 23:20:28', '成功', '角色名称=超级管理员,资源名称=系统管理,用户管理,添加用户,修改用户,删除用户,重置密码,冻结用户,解除冻结用户,分配角色,分配角色跳转,编辑用户跳转,用户列表,角色管理,添加角色,修改角色,删除角色,配置权限,修改角色跳转,角色分配跳转,角色列表,菜单管理,添加菜单,修改菜单,删除菜单,菜单编辑跳转,菜单列表,业务日志,清空日志,日志列表,日志详情,监控管理,部门管理,添加部门,修改部门,删除部门,修改部门跳转,部门列表,部门详情,字典管理,添加字典,修改字典,删除字典,修改菜单跳转,字典列表,字典详情,登录日志,清空登录日志,登录日志列表,通知管理,添加通知,修改通知,删除通知,职位管理,职位表添加,职位表修改,职位表删除,开发管理,接口文档,参数配置,参数配置添加,参数配置修改,参数配置删除,模拟操作,主控面板,消息通知,项目介绍,统计报表,系统监控,高级组件,高级表单,文档预览,数据容器,excel处理,excel导入,excel导出,分销配置,分润参数,分润参数添加,分润参数修改,分润参数删除,账号管理,账户管理,账户修改,账户删除,会员管理,会员修改,平台管理,平台添加,平台修改,交易中心,分润记录');
INSERT INTO `sys_operation_log` VALUES (1294297536906936322, '业务日志', '配置权限', 1, 'cn.stylefeng.guns.sys.modular.system.controller.RoleController', 'setAuthority', '2020-08-14 23:39:14', '成功', '角色名称=分销平台商,资源名称=账号管理,会员管理,会员添加,会员修改,会员删除');
INSERT INTO `sys_operation_log` VALUES (1294297627805892609, '业务日志', '配置权限', 1, 'cn.stylefeng.guns.sys.modular.system.controller.RoleController', 'setAuthority', '2020-08-14 23:39:36', '成功', '角色名称=超级管理员,资源名称=系统管理,用户管理,添加用户,修改用户,删除用户,重置密码,冻结用户,解除冻结用户,分配角色,分配角色跳转,编辑用户跳转,用户列表,角色管理,添加角色,修改角色,删除角色,配置权限,修改角色跳转,角色分配跳转,角色列表,菜单管理,添加菜单,修改菜单,删除菜单,菜单编辑跳转,菜单列表,业务日志,清空日志,日志列表,日志详情,监控管理,部门管理,添加部门,修改部门,删除部门,修改部门跳转,部门列表,部门详情,字典管理,添加字典,修改字典,删除字典,修改菜单跳转,字典列表,字典详情,登录日志,清空登录日志,登录日志列表,通知管理,添加通知,修改通知,删除通知,职位管理,职位表添加,职位表修改,职位表删除,开发管理,接口文档,参数配置,参数配置添加,参数配置修改,参数配置删除,模拟操作,主控面板,消息通知,项目介绍,统计报表,系统监控,高级组件,高级表单,文档预览,数据容器,excel处理,excel导入,excel导出,分销配置,分润参数,分润参数添加,分润参数修改,分润参数删除,账号管理,会员管理,会员修改,平台管理,平台添加,平台修改,交易中心,分润记录');
INSERT INTO `sys_operation_log` VALUES (1294298152756592642, '异常日志', '', 1, NULL, NULL, '2020-08-14 23:41:41', '失败', 'RequestEmptyException()\r\n');
INSERT INTO `sys_operation_log` VALUES (1294298178807414785, '异常日志', '', 1, NULL, NULL, '2020-08-14 23:41:47', '失败', 'RequestEmptyException()\r\n');
INSERT INTO `sys_operation_log` VALUES (1294298218816880641, '业务日志', '菜单新增', 1, 'cn.stylefeng.guns.sys.modular.system.controller.MenuController', 'add', '2020-08-14 23:41:57', '成功', '菜单名称=会员账户');
INSERT INTO `sys_operation_log` VALUES (1294298303663456258, '业务日志', '修改菜单', 1, 'cn.stylefeng.guns.sys.modular.system.controller.MenuController', 'edit', '2020-08-14 23:42:17', '成功', '菜单名称=会员账户;;;字段名称:url地址,旧值:#,新值:');
INSERT INTO `sys_operation_log` VALUES (1294298352661315586, '业务日志', '修改菜单', 1, 'cn.stylefeng.guns.sys.modular.system.controller.MenuController', 'edit', '2020-08-14 23:42:29', '成功', '菜单名称=会员账户;;;');
INSERT INTO `sys_operation_log` VALUES (1294614906288594946, '业务日志', '删除菜单', 1, 'cn.stylefeng.guns.sys.modular.system.controller.MenuController', 'remove', '2020-08-15 20:40:21', '成功', '菜单名称=账户删除');
INSERT INTO `sys_operation_log` VALUES (1294615087709020161, '业务日志', '配置权限', 1, 'cn.stylefeng.guns.sys.modular.system.controller.RoleController', 'setAuthority', '2020-08-15 20:41:04', '成功', '角色名称=分销平台商,资源名称=账号管理,账户管理,账户修改,会员管理,会员添加,会员修改,会员删除');
INSERT INTO `sys_operation_log` VALUES (1294645557628874754, '业务日志', '配置权限', 1, 'cn.stylefeng.guns.sys.modular.system.controller.RoleController', 'setAuthority', '2020-08-15 22:42:09', '成功', '角色名称=分销平台商,资源名称=分销配置,分润参数,分润参数添加,分润参数修改,分润参数删除,账号管理,账户管理,账户修改,会员管理,会员添加,会员修改,会员删除');
INSERT INTO `sys_operation_log` VALUES (1294645961603264514, '业务日志', '修改菜单', 1, 'cn.stylefeng.guns.sys.modular.system.controller.MenuController', 'edit', '2020-08-15 22:43:45', '成功', '菜单名称=分销配置;;;字段名称:菜单图标,旧值:layui-icon-component,新值:layui-icon-template-1');
INSERT INTO `sys_operation_log` VALUES (1294948987706597377, '业务日志', '修改菜单', 1, 'cn.stylefeng.guns.sys.modular.system.controller.MenuController', 'edit', '2020-08-16 18:47:52', '成功', '菜单名称=分润中心;;;字段名称:菜单编号,旧值:DEAL_CENTER,新值:PROFIT_CENTER;;;字段名称:菜单名称,旧值:交易中心,新值:分润中心');
INSERT INTO `sys_operation_log` VALUES (1294949315780861953, '业务日志', '菜单新增', 1, 'cn.stylefeng.guns.sys.modular.system.controller.MenuController', 'add', '2020-08-16 18:49:11', '成功', '菜单名称=分润动态');
INSERT INTO `sys_operation_log` VALUES (1294949455216304130, '业务日志', '修改菜单', 1, 'cn.stylefeng.guns.sys.modular.system.controller.MenuController', 'edit', '2020-08-16 18:49:44', '成功', '菜单名称=分润动态;;;字段名称:url地址,旧值:/distEvent,新值:/distProfitEvent');
INSERT INTO `sys_operation_log` VALUES (1294949630785675265, '业务日志', '配置权限', 1, 'cn.stylefeng.guns.sys.modular.system.controller.RoleController', 'setAuthority', '2020-08-16 18:50:26', '成功', '角色名称=分销平台商,资源名称=分销配置,分润参数,分润参数添加,分润参数修改,分润参数删除,账号管理,账户管理,账户修改,会员管理,会员添加,会员修改,会员删除,分润中心,分润记录,分润动态');
INSERT INTO `sys_operation_log` VALUES (1294949677245980673, '业务日志', '修改菜单', 1, 'cn.stylefeng.guns.sys.modular.system.controller.MenuController', 'edit', '2020-08-16 18:50:37', '成功', '菜单名称=分润动态;;;');
INSERT INTO `sys_operation_log` VALUES (1296831519742021634, '业务日志', '修改菜单', 1, 'cn.stylefeng.guns.sys.modular.system.controller.MenuController', 'edit', '2020-08-21 23:28:23', '成功', '菜单名称=分润记录;;;');
INSERT INTO `sys_operation_log` VALUES (1296835125874597890, '业务日志', '菜单新增', 1, 'cn.stylefeng.guns.sys.modular.system.controller.MenuController', 'add', '2020-08-21 23:42:43', '成功', '菜单名称=段位参数');
INSERT INTO `sys_operation_log` VALUES (1296835799689535489, '业务日志', '菜单新增', 1, 'cn.stylefeng.guns.sys.modular.system.controller.MenuController', 'add', '2020-08-21 23:45:23', '成功', '菜单名称=段位参数增加');
INSERT INTO `sys_operation_log` VALUES (1296836104393138177, '异常日志', '', 1, NULL, NULL, '2020-08-21 23:46:36', '失败', 'RequestEmptyException()\r\n');
INSERT INTO `sys_operation_log` VALUES (1296836127377924097, '异常日志', '', 1, NULL, NULL, '2020-08-21 23:46:41', '失败', 'RequestEmptyException()\r\n');
INSERT INTO `sys_operation_log` VALUES (1296836241551073282, '业务日志', '菜单新增', 1, 'cn.stylefeng.guns.sys.modular.system.controller.MenuController', 'add', '2020-08-21 23:47:09', '成功', '菜单名称=段位参数修改');
INSERT INTO `sys_operation_log` VALUES (1296836676739473409, '业务日志', '配置权限', 1, 'cn.stylefeng.guns.sys.modular.system.controller.RoleController', 'setAuthority', '2020-08-21 23:48:52', '成功', '角色名称=分销平台商,资源名称=分销配置,分润参数,分润参数添加,分润参数修改,分润参数删除,段位参数,段位参数增加,段位参数修改,段位参数删除,账号管理,账户管理,账户修改,会员管理,会员添加,会员修改,会员删除,分润中心,分润记录,分润动态');
INSERT INTO `sys_operation_log` VALUES (1296838554340634626, '业务日志', '修改菜单', 1, 'cn.stylefeng.guns.sys.modular.system.controller.MenuController', 'edit', '2020-08-21 23:56:20', '成功', '菜单名称=分润参数;;;字段名称:菜单排序号,旧值:999,新值:1');
INSERT INTO `sys_operation_log` VALUES (1296841701654081537, '业务日志', '菜单新增', 1, 'cn.stylefeng.guns.sys.modular.system.controller.MenuController', 'add', '2020-08-22 00:08:50', '成功', '菜单名称=分润提现');
INSERT INTO `sys_operation_log` VALUES (1296841728283717634, '业务日志', '删除菜单', 1, 'cn.stylefeng.guns.sys.modular.system.controller.MenuController', 'remove', '2020-08-22 00:08:57', '成功', '菜单名称=统计中心');
INSERT INTO `sys_operation_log` VALUES (1296841811741978626, '业务日志', '删除菜单', 1, 'cn.stylefeng.guns.sys.modular.system.controller.MenuController', 'remove', '2020-08-22 00:09:17', '成功', '菜单名称=账户明细记录');
INSERT INTO `sys_operation_log` VALUES (1296841851537534978, '业务日志', '删除菜单', 1, 'cn.stylefeng.guns.sys.modular.system.controller.MenuController', 'remove', '2020-08-22 00:09:26', '成功', '菜单名称=分润记录管理');
INSERT INTO `sys_operation_log` VALUES (1296841970425081858, '业务日志', '修改菜单', 1, 'cn.stylefeng.guns.sys.modular.system.controller.MenuController', 'edit', '2020-08-22 00:09:55', '成功', '菜单名称=分润记录;;;字段名称:菜单编号,旧值:PROFIT_RECORD,新值:DIST_PROFIT_RECORD');
INSERT INTO `sys_operation_log` VALUES (1296842254622732290, '业务日志', '修改菜单', 1, 'cn.stylefeng.guns.sys.modular.system.controller.MenuController', 'edit', '2020-08-22 00:11:02', '成功', '菜单名称=分润动态;;;字段名称:菜单编号,旧值:PROFIT_EVENT,新值:DIST_PROFIT_EVENT');
INSERT INTO `sys_operation_log` VALUES (1296842295114543106, '业务日志', '修改菜单', 1, 'cn.stylefeng.guns.sys.modular.system.controller.MenuController', 'edit', '2020-08-22 00:11:12', '成功', '菜单名称=分润中心;;;字段名称:菜单编号,旧值:PROFIT_CENTER,新值:DIST_PROFIT_CENTER');
INSERT INTO `sys_operation_log` VALUES (1296842347753058306, '业务日志', '修改菜单', 1, 'cn.stylefeng.guns.sys.modular.system.controller.MenuController', 'edit', '2020-08-22 00:11:25', '成功', '菜单名称=账号管理;;;字段名称:菜单编号,旧值:MEMBER_MANAGE,新值:DIST_MEMBER_MANAGE');
INSERT INTO `sys_operation_log` VALUES (1296842387372453890, '业务日志', '修改菜单', 1, 'cn.stylefeng.guns.sys.modular.system.controller.MenuController', 'edit', '2020-08-22 00:11:34', '成功', '菜单名称=分销配置;;;字段名称:菜单编号,旧值:PROFIT_CONFIG,新值:DIST_PROFIT_CONFIG');
INSERT INTO `sys_operation_log` VALUES (1296842923844907009, '业务日志', '配置权限', 1, 'cn.stylefeng.guns.sys.modular.system.controller.RoleController', 'setAuthority', '2020-08-22 00:13:42', '成功', '角色名称=超级管理员,资源名称=系统管理,用户管理,添加用户,修改用户,删除用户,重置密码,冻结用户,解除冻结用户,分配角色,分配角色跳转,编辑用户跳转,用户列表,角色管理,添加角色,修改角色,删除角色,配置权限,修改角色跳转,角色分配跳转,角色列表,菜单管理,添加菜单,修改菜单,删除菜单,菜单编辑跳转,菜单列表,业务日志,清空日志,日志列表,日志详情,监控管理,部门管理,添加部门,修改部门,删除部门,修改部门跳转,部门列表,部门详情,字典管理,添加字典,修改字典,删除字典,修改菜单跳转,字典列表,字典详情,登录日志,清空登录日志,登录日志列表,通知管理,添加通知,修改通知,删除通知,职位管理,职位表添加,职位表修改,职位表删除,开发管理,接口文档,参数配置,参数配置添加,参数配置修改,参数配置删除,模拟操作,主控面板,消息通知,项目介绍,统计报表,系统监控,高级组件,高级表单,文档预览,数据容器,excel处理,excel导入,excel导出,账号管理,平台管理,平台添加,平台修改');
INSERT INTO `sys_operation_log` VALUES (1296843250098843650, '业务日志', '修改菜单', 1, 'cn.stylefeng.guns.sys.modular.system.controller.MenuController', 'edit', '2020-08-22 00:15:00', '成功', '菜单名称=账号管理;;;字段名称:菜单排序号,旧值:1,新值:3');
INSERT INTO `sys_operation_log` VALUES (1296843369493901314, '业务日志', '修改菜单', 1, 'cn.stylefeng.guns.sys.modular.system.controller.MenuController', 'edit', '2020-08-22 00:15:28', '成功', '菜单名称=主控面板;;;字段名称:菜单排序号,旧值:10,新值:1');
INSERT INTO `sys_operation_log` VALUES (1296844910225338369, '业务日志', '配置权限', 1, 'cn.stylefeng.guns.sys.modular.system.controller.RoleController', 'setAuthority', '2020-08-22 00:21:35', '成功', '角色名称=分销平台商,资源名称=分销配置,分润参数,分润参数添加,分润参数修改,分润参数删除,段位参数,段位参数增加,段位参数修改,段位参数删除,账号管理,账户管理,账户修改,会员管理,会员添加,会员修改,会员删除,分润中心,分润记录,分润动态,分润提现');
INSERT INTO `sys_operation_log` VALUES (1299914709184634881, '业务日志', '修改菜单', 1, 'cn.stylefeng.guns.sys.modular.system.controller.MenuController', 'edit', '2020-08-30 11:39:53', '成功', '菜单名称=用户管理;;;字段名称:菜单名称,旧值:账号管理,新值:用户管理');
INSERT INTO `sys_operation_log` VALUES (1299915118477402113, '业务日志', '菜单新增', 1, 'cn.stylefeng.guns.sys.modular.system.controller.MenuController', 'add', '2020-08-30 11:41:30', '成功', '菜单名称=账户变动');
INSERT INTO `sys_operation_log` VALUES (1299915243689959425, '业务日志', '配置权限', 1, 'cn.stylefeng.guns.sys.modular.system.controller.RoleController', 'setAuthority', '2020-08-30 11:42:00', '成功', '角色名称=分销平台商,资源名称=分销配置,分润参数,分润参数添加,分润参数修改,分润参数删除,段位参数,段位参数增加,段位参数修改,段位参数删除,用户管理,账户管理,账户修改,会员管理,会员添加,会员修改,会员删除,账户变动,分润中心,分润记录,分润动态,分润提现');
INSERT INTO `sys_operation_log` VALUES (1299916587591098370, '业务日志', '修改菜单', 1, 'cn.stylefeng.guns.sys.modular.system.controller.MenuController', 'edit', '2020-08-30 11:47:20', '成功', '菜单名称=账户管理;;;字段名称:菜单排序号,旧值:999,新值:3');
INSERT INTO `sys_operation_log` VALUES (1300043981551431681, '业务日志', '修改菜单', 1, 'cn.stylefeng.guns.sys.modular.system.controller.MenuController', 'edit', '2020-08-30 20:13:34', '成功', '菜单名称=分润记录;;;字段名称:url地址,旧值:/distProfitRecord,新值:/distProfitRecord/dynamic');
INSERT INTO `sys_operation_log` VALUES (1300044614690009090, '异常日志', '', 1, NULL, NULL, '2020-08-30 20:16:04', '失败', 'RequestEmptyException()\r\n');
INSERT INTO `sys_operation_log` VALUES (1300044785465290754, '业务日志', '修改菜单', 1, 'cn.stylefeng.guns.sys.modular.system.controller.MenuController', 'edit', '2020-08-30 20:16:45', '成功', '菜单名称=分润动态;;;字段名称:菜单编号,旧值:DIST_PROFIT_EVENT,新值:DIST_PROFIT_EVENT_DYNAMIC');
INSERT INTO `sys_operation_log` VALUES (1300045148192894977, '业务日志', '菜单新增', 1, 'cn.stylefeng.guns.sys.modular.system.controller.MenuController', 'add', '2020-08-30 20:18:12', '成功', '菜单名称=分润事件');
INSERT INTO `sys_operation_log` VALUES (1300045217625403393, '业务日志', '配置权限', 1, 'cn.stylefeng.guns.sys.modular.system.controller.RoleController', 'setAuthority', '2020-08-30 20:18:28', '成功', '角色名称=分销平台商,资源名称=分销配置,分润参数,分润参数添加,分润参数修改,分润参数删除,段位参数,段位参数增加,段位参数修改,段位参数删除,用户管理,账户管理,账户修改,会员管理,会员添加,会员修改,会员删除,账户变动,分润中心,分润记录,分润动态,分润提现,分润事件');
INSERT INTO `sys_operation_log` VALUES (1300045869944532994, '业务日志', '修改菜单', 1, 'cn.stylefeng.guns.sys.modular.system.controller.MenuController', 'edit', '2020-08-30 20:21:04', '成功', '菜单名称=分润事件;;;字段名称:菜单排序号,旧值:1,新值:4');
INSERT INTO `sys_operation_log` VALUES (1300095233496739841, '业务日志', '菜单新增', 1, 'cn.stylefeng.guns.sys.modular.system.controller.MenuController', 'add', '2020-08-30 23:37:13', '成功', '菜单名称=会员层级');
INSERT INTO `sys_operation_log` VALUES (1300095292179247106, '业务日志', '配置权限', 1, 'cn.stylefeng.guns.sys.modular.system.controller.RoleController', 'setAuthority', '2020-08-30 23:37:27', '成功', '角色名称=分销平台商,资源名称=分销参数,分润参数,分润参数添加,分润参数修改,分润参数删除,段位参数,段位参数增加,段位参数修改,段位参数删除,用户管理,账户管理,账户修改,会员管理,会员添加,会员修改,会员删除,账户变动,会员层级,分润中心,分润记录,分润动态,分润提现,分润事件');
INSERT INTO `sys_operation_log` VALUES (1300095513525252097, '业务日志', '修改菜单', 1, 'cn.stylefeng.guns.sys.modular.system.controller.MenuController', 'edit', '2020-08-30 23:38:20', '成功', '菜单名称=会员层级;;;字段名称:菜单排序号,旧值:99,新值:1');
INSERT INTO `sys_operation_log` VALUES (1301155252363452417, '业务日志', '修改菜单', 1, 'cn.stylefeng.guns.sys.modular.system.controller.MenuController', 'edit', '2020-09-02 21:49:21', '成功', '菜单名称=会员层级;;;字段名称:url地址,旧值:#,新值:/distMember/tree');
INSERT INTO `sys_operation_log` VALUES (1301774644981805058, '业务日志', '菜单新增', 1, 'cn.stylefeng.guns.sys.modular.system.controller.MenuController', 'add', '2020-09-04 14:50:36', '成功', '菜单名称=工作台');
INSERT INTO `sys_operation_log` VALUES (1301774927740809217, '业务日志', '修改菜单', 1, 'cn.stylefeng.guns.sys.modular.system.controller.MenuController', 'edit', '2020-09-04 14:51:43', '成功', '菜单名称=工作总览;;;字段名称:菜单名称,旧值:工作台,新值:工作总览');
INSERT INTO `sys_operation_log` VALUES (1301775848864493569, '业务日志', '配置权限', 1, 'cn.stylefeng.guns.sys.modular.system.controller.RoleController', 'setAuthority', '2020-09-04 14:55:23', '成功', '角色名称=分销平台商,资源名称=主控面板,工作总览,分销参数,分润参数,分润参数添加,分润参数修改,分润参数删除,段位参数,段位参数增加,段位参数修改,段位参数删除,用户管理,账户管理,账户修改,会员管理,会员添加,会员修改,会员删除,账户变动,会员层级,分润中心,分润记录,分润动态,分润提现,分润事件');
INSERT INTO `sys_operation_log` VALUES (1301783511736266753, '业务日志', '修改菜单', 1, 'cn.stylefeng.guns.sys.modular.system.controller.MenuController', 'edit', '2020-09-04 15:25:50', '成功', '菜单名称=分销总览;;;字段名称:url地址,旧值:/,新值:/distDistboard');
INSERT INTO `sys_operation_log` VALUES (1301783792343592962, '业务日志', '修改菜单', 1, 'cn.stylefeng.guns.sys.modular.system.controller.MenuController', 'edit', '2020-09-04 15:26:57', '成功', '菜单名称=分销总览;;;字段名称:url地址,旧值:/distDistboard,新值:/distDashboard');
INSERT INTO `sys_operation_log` VALUES (1301784278366957569, '业务日志', '修改菜单', 1, 'cn.stylefeng.guns.sys.modular.system.controller.MenuController', 'edit', '2020-09-04 15:28:53', '成功', '菜单名称=分销总览;;;字段名称:url地址,旧值:/distDashboard,新值:/distDashboard/workplace');
INSERT INTO `sys_operation_log` VALUES (1302176299556589569, '业务日志', '配置权限', 1, 'cn.stylefeng.guns.sys.modular.system.controller.RoleController', 'setAuthority', '2020-09-05 17:26:38', '成功', '角色名称=分销平台商,资源名称=主控面板,分销总览,分销参数,分润参数,分润参数添加,分润参数修改,分润参数删除,段位参数,段位参数增加,段位参数修改,段位参数删除,用户管理,账户管理,账户修改,会员管理,会员添加,会员修改,会员删除,账户变动,会员层级,分润中心,分润记录,分润提现,分润事件');
INSERT INTO `sys_operation_log` VALUES (1302187443142868994, '业务日志', '删除菜单', 1, 'cn.stylefeng.guns.sys.modular.system.controller.MenuController', 'remove', '2020-09-05 18:10:55', '成功', '菜单名称=分润动态');
INSERT INTO `sys_operation_log` VALUES (1302987928401711105, '业务日志', '修改菜单', 1, 'cn.stylefeng.guns.sys.modular.system.controller.MenuController', 'edit', '2020-09-07 23:11:45', '成功', '菜单名称=会员层级;;;字段名称:url地址,旧值:/distMember/tree,新值:#');
INSERT INTO `sys_operation_log` VALUES (1302988863668588545, '业务日志', '配置权限', 1, 'cn.stylefeng.guns.sys.modular.system.controller.RoleController', 'setAuthority', '2020-09-07 23:15:28', '成功', '角色名称=分销平台商,资源名称=主控面板,分销总览,分销参数,分润参数,分润参数添加,分润参数修改,分润参数删除,段位参数,段位参数增加,段位参数修改,段位参数删除,用户管理,账户管理,账户修改,会员管理,会员添加,会员修改,会员删除,会员账户,账户变动,分润中心,分润记录,分润提现,分润事件');
INSERT INTO `sys_operation_log` VALUES (1302988971374120962, '业务日志', '删除菜单', 1, 'cn.stylefeng.guns.sys.modular.system.controller.MenuController', 'remove', '2020-09-07 23:15:54', '成功', '菜单名称=账户修改');
INSERT INTO `sys_operation_log` VALUES (1304721222075944962, '业务日志', '修改菜单', 1, 'cn.stylefeng.guns.sys.modular.system.controller.MenuController', 'edit', '2020-09-12 17:59:15', '成功', '菜单名称=接口文档;;;字段名称:url地址,旧值:/swagger-ui.html,新值:/doc.html');
INSERT INTO `sys_operation_log` VALUES (1304721497973067778, '业务日志', '修改菜单', 1, 'cn.stylefeng.guns.sys.modular.system.controller.MenuController', 'edit', '2020-09-12 18:00:20', '成功', '菜单名称=模拟操作;;;字段名称:url地址,旧值:/doc.html,新值:/mock.html');
INSERT INTO `sys_operation_log` VALUES (1304721609055014914, '业务日志', '配置权限', 1, 'cn.stylefeng.guns.sys.modular.system.controller.RoleController', 'setAuthority', '2020-09-12 18:00:47', '成功', '角色名称=分销平台商,资源名称=开发管理,接口文档,模拟操作,主控面板,分销总览,分销参数,分润参数,分润参数添加,分润参数修改,分润参数删除,段位参数,段位参数增加,段位参数修改,段位参数删除,用户管理,账户管理,会员管理,会员添加,会员修改,会员删除,会员账户,账户变动,分润中心,分润记录,分润提现,分润事件');
INSERT INTO `sys_operation_log` VALUES (1304732699319095298, '业务日志', '修改菜单', 1, 'cn.stylefeng.guns.sys.modular.system.controller.MenuController', 'edit', '2020-09-12 18:44:51', '成功', '菜单名称=模拟操作;;;字段名称:url地址,旧值:/mock.html,新值:/mock');
INSERT INTO `sys_operation_log` VALUES (1304798460297437186, '业务日志', '修改菜单', 1, 'cn.stylefeng.guns.sys.modular.system.controller.MenuController', 'edit', '2020-09-12 23:06:10', '成功', '菜单名称=模拟操作;;;字段名称:url地址,旧值:/mock,新值:/mock.html');
INSERT INTO `sys_operation_log` VALUES (1304798737926807553, '业务日志', '修改菜单', 1, 'cn.stylefeng.guns.sys.modular.system.controller.MenuController', 'edit', '2020-09-12 23:07:16', '成功', '菜单名称=模拟操作;;;字段名称:url地址,旧值:/mock.html,新值:/mock');
INSERT INTO `sys_operation_log` VALUES (1312762301413068801, '异常日志', '', 1312014352508907522, NULL, NULL, '2020-10-04 22:31:37', '失败', 'org.springframework.web.HttpRequestMethodNotSupportedException: Request method \'GET\' not supported\r\n	at org.springframework.web.servlet.mvc.method.RequestMappingInfoHandlerMapping.handleNoMatch(RequestMappingInfoHandlerMapping.java:200)\r\n	at org.springframework.web.servlet.handler.AbstractHandlerMethodMapping.lookupHandlerMethod(AbstractHandlerMethodMapping.java:419)\r\n	at org.springframework.web.servlet.handler.AbstractHandlerMethodMapping.getHandlerInternal(AbstractHandlerMethodMapping.java:365)\r\n	at org.springframework.web.servlet.handler.AbstractHandlerMethodMapping.getHandlerInternal(AbstractHandlerMethodMapping.java:65)\r\n	at org.springframework.web.servlet.handler.AbstractHandlerMapping.getHandler(AbstractHandlerMapping.java:401)\r\n	at org.springframework.web.servlet.DispatcherServlet.getHandler(DispatcherServlet.java:1232)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1015)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:942)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1005)\r\n	at org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:897)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:634)\r\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:882)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:741)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:53)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:103)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:103)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at cn.stylefeng.roses.core.xss.XssFilter.doFilter(XssFilter.java:31)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:124)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:320)\r\n	at org.springframework.security.web.access.intercept.FilterSecurityInterceptor.invoke(FilterSecurityInterceptor.java:127)\r\n	at org.springframework.security.web.access.intercept.FilterSecurityInterceptor.doFilter(FilterSecurityInterceptor.java:91)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:119)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:137)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.authentication.AnonymousAuthenticationFilter.doFilter(AnonymousAuthenticationFilter.java:111)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestFilter.doFilter(SecurityContextHolderAwareRequestFilter.java:170)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.savedrequest.RequestCacheAwareFilter.doFilter(RequestCacheAwareFilter.java:63)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at cn.stylefeng.guns.sys.core.auth.filter.ApiJwtAuthorizationTokenFilter.doFilterInternal(ApiJwtAuthorizationTokenFilter.java:53)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at cn.stylefeng.guns.sys.core.auth.filter.JwtAuthorizationTokenFilter.doFilterInternal(JwtAuthorizationTokenFilter.java:86)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.web.filter.CorsFilter.doFilterInternal(CorsFilter.java:96)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.header.HeaderWriterFilter.doFilterInternal(HeaderWriterFilter.java:74)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.context.SecurityContextPersistenceFilter.doFilter(SecurityContextPersistenceFilter.java:105)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.context.request.async.WebAsyncManagerIntegrationFilter.doFilterInternal(WebAsyncManagerIntegrationFilter.java:56)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.springframework.security.web.FilterChainProxyTVirtualFilterChain.doFilter(FilterChainProxy.java:334)\r\n	at org.springframework.security.web.FilterChainProxy.doFilterInternal(FilterChainProxy.java:215)\r\n	at org.springframework.security.web.FilterChainProxy.doFilter(FilterChainProxy.java:178)\r\n	at org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:357)\r\n	at org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:270)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:99)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:92)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.HiddenHttpMethodFilter.doFilterInternal(HiddenHttpMethodFilter.java:93)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:200)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:109)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:202)\r\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:96)\r\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:490)\r\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:139)\r\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:92)\r\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:74)\r\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:343)\r\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:408)\r\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\r\n	at org.apache.coyote.AbstractProtocolTConnectionHandler.process(AbstractProtocol.java:853)\r\n	at org.apache.tomcat.util.net.NioEndpointTSocketProcessor.doRun(NioEndpoint.java:1587)\r\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\r\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1142)\r\n	at java.util.concurrent.ThreadPoolExecutorTWorker.run(ThreadPoolExecutor.java:617)\r\n	at org.apache.tomcat.util.threads.TaskThreadTWrappingRunnable.run(TaskThread.java:61)\r\n	at java.lang.Thread.run(Thread.java:745)\r\n');
INSERT INTO `sys_operation_log` VALUES (1313037436217008129, '业务日志', '配置权限', 1, 'cn.stylefeng.guns.sys.modular.system.controller.RoleController', 'setAuthority', '2020-10-05 16:44:55', '成功', '角色名称=分销平台商,资源名称=开发管理,接口文档,模拟操作,主控面板,项目介绍,分销总览,分销参数,分润参数,分润参数添加,分润参数修改,分润参数删除,段位参数,段位参数增加,段位参数修改,段位参数删除,用户管理,账户管理,会员管理,会员添加,会员修改,会员删除,会员账户,账户变动,分润中心,分润记录,分润提现,分润事件');
INSERT INTO `sys_operation_log` VALUES (1313037624994242561, '业务日志', '修改菜单', 1, 'cn.stylefeng.guns.sys.modular.system.controller.MenuController', 'edit', '2020-10-05 16:45:40', '成功', '菜单名称=分销总览;;;');

-- ----------------------------
-- Table structure for sys_position
-- ----------------------------
DROP TABLE IF EXISTS `sys_position`;
CREATE TABLE `sys_position`  (
  `position_id` bigint(20) NOT NULL COMMENT '主键id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '职位名称',
  `code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '职位编码',
  `sort` int(11) NOT NULL COMMENT '顺序',
  `status` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'ENABLE' COMMENT '状态(字典)',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(20) NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `create_user` bigint(20) NULL DEFAULT NULL COMMENT '创建者',
  PRIMARY KEY (`position_id`) USING BTREE,
  UNIQUE INDEX `CODE_UNI`(`code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '职位表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_position
-- ----------------------------
INSERT INTO `sys_position` VALUES (1, '董事长', 'President', 1, 'ENABLE', NULL, '2019-06-27 18:14:43', 1, NULL, NULL);
INSERT INTO `sys_position` VALUES (2, '总经理', 'GM', 2, 'ENABLE', NULL, '2019-06-27 18:14:43', 1, NULL, NULL);
INSERT INTO `sys_position` VALUES (3, '分销商', 'DIST', 3, 'ENABLE', NULL, '2020-08-01 11:53:49', 1, NULL, NULL);

-- ----------------------------
-- Table structure for sys_relation
-- ----------------------------
DROP TABLE IF EXISTS `sys_relation`;
CREATE TABLE `sys_relation`  (
  `relation_id` bigint(20) NOT NULL COMMENT '主键',
  `menu_id` bigint(20) NULL DEFAULT NULL COMMENT '菜单id',
  `role_id` bigint(20) NULL DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`relation_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_relation
-- ----------------------------
INSERT INTO `sys_relation` VALUES (1184839164297945090, 105, 5);
INSERT INTO `sys_relation` VALUES (1184839164306333697, 132, 5);
INSERT INTO `sys_relation` VALUES (1184839164310528002, 138, 5);
INSERT INTO `sys_relation` VALUES (1184839164318916609, 139, 5);
INSERT INTO `sys_relation` VALUES (1184839164323110913, 140, 5);
INSERT INTO `sys_relation` VALUES (1184839164327305218, 155, 5);
INSERT INTO `sys_relation` VALUES (1184839164335693826, 156, 5);
INSERT INTO `sys_relation` VALUES (1184839164339888130, 157, 5);
INSERT INTO `sys_relation` VALUES (1184839164344082434, 141, 5);
INSERT INTO `sys_relation` VALUES (1184839164348276737, 142, 5);
INSERT INTO `sys_relation` VALUES (1184839164360859649, 143, 5);
INSERT INTO `sys_relation` VALUES (1184839164365053953, 144, 5);
INSERT INTO `sys_relation` VALUES (1184839164373442561, 171, 5);
INSERT INTO `sys_relation` VALUES (1184839164377636866, 149, 5);
INSERT INTO `sys_relation` VALUES (1184839164390219778, 172, 5);
INSERT INTO `sys_relation` VALUES (1184839164394414081, 145, 5);
INSERT INTO `sys_relation` VALUES (1184839164398608386, 1111545968697860098, 5);
INSERT INTO `sys_relation` VALUES (1184839164402802690, 1111546189892870145, 5);
INSERT INTO `sys_relation` VALUES (1296842869243457537, 105, 1);
INSERT INTO `sys_relation` VALUES (1296842869709025282, 106, 1);
INSERT INTO `sys_relation` VALUES (1296842870174593025, 107, 1);
INSERT INTO `sys_relation` VALUES (1296842870610800642, 108, 1);
INSERT INTO `sys_relation` VALUES (1296842871223169026, 109, 1);
INSERT INTO `sys_relation` VALUES (1296842872808615937, 110, 1);
INSERT INTO `sys_relation` VALUES (1296842873219657730, 111, 1);
INSERT INTO `sys_relation` VALUES (1296842873651671042, 112, 1);
INSERT INTO `sys_relation` VALUES (1296842874045935617, 113, 1);
INSERT INTO `sys_relation` VALUES (1296842874456977410, 165, 1);
INSERT INTO `sys_relation` VALUES (1296842874884796417, 166, 1);
INSERT INTO `sys_relation` VALUES (1296842875337781249, 167, 1);
INSERT INTO `sys_relation` VALUES (1296842875744628737, 114, 1);
INSERT INTO `sys_relation` VALUES (1296842876168253442, 115, 1);
INSERT INTO `sys_relation` VALUES (1296842876638015489, 116, 1);
INSERT INTO `sys_relation` VALUES (1296842877032280066, 117, 1);
INSERT INTO `sys_relation` VALUES (1296842877493653505, 118, 1);
INSERT INTO `sys_relation` VALUES (1296842877883723778, 162, 1);
INSERT INTO `sys_relation` VALUES (1296842878231851009, 163, 1);
INSERT INTO `sys_relation` VALUES (1296842878605144066, 164, 1);
INSERT INTO `sys_relation` VALUES (1296842879171375106, 119, 1);
INSERT INTO `sys_relation` VALUES (1296842879754383362, 120, 1);
INSERT INTO `sys_relation` VALUES (1296842880152842242, 121, 1);
INSERT INTO `sys_relation` VALUES (1296842880551301122, 122, 1);
INSERT INTO `sys_relation` VALUES (1296842880962342913, 150, 1);
INSERT INTO `sys_relation` VALUES (1296842881356607489, 151, 1);
INSERT INTO `sys_relation` VALUES (1296842881788620802, 128, 1);
INSERT INTO `sys_relation` VALUES (1296842882182885378, 134, 1);
INSERT INTO `sys_relation` VALUES (1296842882564567041, 158, 1);
INSERT INTO `sys_relation` VALUES (1296842882963025921, 159, 1);
INSERT INTO `sys_relation` VALUES (1296842883340513281, 130, 1);
INSERT INTO `sys_relation` VALUES (1296842883730583554, 131, 1);
INSERT INTO `sys_relation` VALUES (1296842884175179778, 135, 1);
INSERT INTO `sys_relation` VALUES (1296842884535889922, 136, 1);
INSERT INTO `sys_relation` VALUES (1296842884909182977, 137, 1);
INSERT INTO `sys_relation` VALUES (1296842885349584897, 152, 1);
INSERT INTO `sys_relation` VALUES (1296842885760626690, 153, 1);
INSERT INTO `sys_relation` VALUES (1296842886146502658, 154, 1);
INSERT INTO `sys_relation` VALUES (1296842886637236226, 132, 1);
INSERT INTO `sys_relation` VALUES (1296842887002140673, 138, 1);
INSERT INTO `sys_relation` VALUES (1296842887421571074, 139, 1);
INSERT INTO `sys_relation` VALUES (1296842887815835649, 140, 1);
INSERT INTO `sys_relation` VALUES (1296842888205905922, 155, 1);
INSERT INTO `sys_relation` VALUES (1296842888658890753, 156, 1);
INSERT INTO `sys_relation` VALUES (1296842889090904066, 157, 1);
INSERT INTO `sys_relation` VALUES (1296842889522917377, 133, 1);
INSERT INTO `sys_relation` VALUES (1296842889980096513, 160, 1);
INSERT INTO `sys_relation` VALUES (1296842890345000962, 161, 1);
INSERT INTO `sys_relation` VALUES (1296842890718294017, 141, 1);
INSERT INTO `sys_relation` VALUES (1296842891099975681, 142, 1);
INSERT INTO `sys_relation` VALUES (1296842891485851650, 143, 1);
INSERT INTO `sys_relation` VALUES (1296842891905282050, 144, 1);
INSERT INTO `sys_relation` VALUES (1296842892303740929, 1144441072852684801, 1);
INSERT INTO `sys_relation` VALUES (1296842892744142850, 1144441072852684802, 1);
INSERT INTO `sys_relation` VALUES (1296842893201321985, 1144441072852684803, 1);
INSERT INTO `sys_relation` VALUES (1296842893595586562, 1144441072852684804, 1);
INSERT INTO `sys_relation` VALUES (1296842894023405569, 171, 1);
INSERT INTO `sys_relation` VALUES (1296842894459613186, 149, 1);
INSERT INTO `sys_relation` VALUES (1296842895969562625, 1142957882422112257, 1);
INSERT INTO `sys_relation` VALUES (1296842896405770242, 1142957882422112258, 1);
INSERT INTO `sys_relation` VALUES (1296842896841977857, 1142957882422112259, 1);
INSERT INTO `sys_relation` VALUES (1296842897257213953, 1142957882426306562, 1);
INSERT INTO `sys_relation` VALUES (1296842897689227265, 1289581144177684481, 1);
INSERT INTO `sys_relation` VALUES (1296842898075103234, 172, 1);
INSERT INTO `sys_relation` VALUES (1296842898507116545, 145, 1);
INSERT INTO `sys_relation` VALUES (1296842898939129858, 1111545968697860098, 1);
INSERT INTO `sys_relation` VALUES (1296842899413086210, 1111546189892870145, 1);
INSERT INTO `sys_relation` VALUES (1296842899836710914, 1149955324929765378, 1);
INSERT INTO `sys_relation` VALUES (1296842900251947010, 1110777136265838594, 1);
INSERT INTO `sys_relation` VALUES (1296842900692348929, 1110787391943098370, 1);
INSERT INTO `sys_relation` VALUES (1296842901082419202, 1110839216310329346, 1);
INSERT INTO `sys_relation` VALUES (1296842901560569857, 1139827152854716418, 1);
INSERT INTO `sys_relation` VALUES (1296842901938057217, 1212299504967204865, 1);
INSERT INTO `sys_relation` VALUES (1296842902349099009, 1110777366856089602, 1);
INSERT INTO `sys_relation` VALUES (1296842902739169282, 1110777491464667137, 1);
INSERT INTO `sys_relation` VALUES (1296842903112462338, 1279765513257369601, 1);
INSERT INTO `sys_relation` VALUES (1296842903506726914, 1270366386065010689, 1);
INSERT INTO `sys_relation` VALUES (1296842903913574401, 1270366386065010690, 1);
INSERT INTO `sys_relation` VALUES (1296842904291061761, 1270366386065010691, 1);
INSERT INTO `sys_relation` VALUES (1313037413521629185, 171, 6);
INSERT INTO `sys_relation` VALUES (1313037413907505153, 149, 6);
INSERT INTO `sys_relation` VALUES (1313037414297575425, 1289581144177684481, 6);
INSERT INTO `sys_relation` VALUES (1313037414683451393, 172, 6);
INSERT INTO `sys_relation` VALUES (1313037415077715970, 1111545968697860098, 6);
INSERT INTO `sys_relation` VALUES (1313037415492952066, 1301774643555741697, 6);
INSERT INTO `sys_relation` VALUES (1313037415920771074, 1270674446276964354, 6);
INSERT INTO `sys_relation` VALUES (1313037416298258434, 1270366386190839809, 6);
INSERT INTO `sys_relation` VALUES (1313037416700911618, 1270366386190839810, 6);
INSERT INTO `sys_relation` VALUES (1313037417086787585, 1270366386190839811, 6);
INSERT INTO `sys_relation` VALUES (1313037417518800897, 1270366386190839812, 6);
INSERT INTO `sys_relation` VALUES (1313037417904676866, 1296835121596407810, 6);
INSERT INTO `sys_relation` VALUES (1313037418294747138, 1296835798540296193, 6);
INSERT INTO `sys_relation` VALUES (1313037418693206017, 1296836240330530817, 6);
INSERT INTO `sys_relation` VALUES (1313037419062304770, 1296836240330530818, 6);
INSERT INTO `sys_relation` VALUES (1313037419515289602, 1279765513257369601, 6);
INSERT INTO `sys_relation` VALUES (1313037419926331393, 1270366385825935361, 6);
INSERT INTO `sys_relation` VALUES (1313037420328984577, 1270366385997901826, 6);
INSERT INTO `sys_relation` VALUES (1313037420756803586, 1270366385997901827, 6);
INSERT INTO `sys_relation` VALUES (1313037421272702977, 1270366385997901828, 6);
INSERT INTO `sys_relation` VALUES (1313037421662773249, 1270366385997901829, 6);
INSERT INTO `sys_relation` VALUES (1313037422078009346, 1294298215725678594, 6);
INSERT INTO `sys_relation` VALUES (1313037422455496705, 1299915115524612098, 6);
INSERT INTO `sys_relation` VALUES (1313037425206960130, 1279766092016795649, 6);
INSERT INTO `sys_relation` VALUES (1313037425609613313, 1289828284640579586, 6);
INSERT INTO `sys_relation` VALUES (1313037426033238018, 1296841700173492226, 6);
INSERT INTO `sys_relation` VALUES (1313037426431696898, 1300045146670362625, 6);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL COMMENT '主键id',
  `pid` bigint(20) NULL DEFAULT NULL COMMENT '父角色id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '提示',
  `sort` int(11) NULL DEFAULT NULL COMMENT '序号',
  `version` int(11) NULL DEFAULT NULL COMMENT '乐观锁',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `create_user` bigint(20) NULL DEFAULT NULL COMMENT '创建用户',
  `update_user` bigint(20) NULL DEFAULT NULL COMMENT '修改用户',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, 0, '超级管理员', 'administrator', 1, 1, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role` VALUES (5, 1, '第三方登录', 'oauth_role', 2, NULL, NULL, '2019-06-11 13:59:40', NULL, 1);
INSERT INTO `sys_role` VALUES (6, 1, '分销平台商', 'platform', 3, NULL, '2020-07-31 21:27:13', '2020-07-31 21:36:39', 1, 1);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL COMMENT '主键id',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
  `account` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '账号',
  `password` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `salt` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'md5密码盐',
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名字',
  `birthday` datetime(0) NULL DEFAULT NULL COMMENT '生日',
  `sex` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性别(字典)',
  `email` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电子邮件',
  `phone` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电话',
  `role_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色id(多个逗号隔开)',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门id(多个逗号隔开)',
  `status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态(字典)',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_user` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_user` bigint(20) NULL DEFAULT NULL COMMENT '更新人',
  `version` int(11) NULL DEFAULT NULL COMMENT '乐观锁',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '管理员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, '1124606971782160385', 'admin', '17db03c22596b7609c7c9704f16663e0', 'abcdef', 'stylefeng', '2018-11-16 00:00:00', 'M', 'sn93@qq.com', '18200000000', '1', 25, 'ENABLE', '2016-01-29 08:49:53', NULL, '2019-06-28 14:38:19', 24, 25);
INSERT INTO `sys_user` VALUES (1312014352508907522, NULL, 'aigou', '0adb67d8c7194f287a406a8950318a9d', '93ktp', '艾购AiGou', NULL, NULL, NULL, NULL, '6', 3, 'ENABLE', '2020-10-02 20:59:32', 1, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_user_pos
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_pos`;
CREATE TABLE `sys_user_pos`  (
  `user_pos_id` bigint(20) NOT NULL COMMENT '主键id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `pos_id` bigint(20) NOT NULL COMMENT '职位id',
  PRIMARY KEY (`user_pos_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户职位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_pos
-- ----------------------------
INSERT INTO `sys_user_pos` VALUES (1144495219551617025, 1, 1);
INSERT INTO `sys_user_pos` VALUES (1289471487811575810, 1289471487392145410, 3);
INSERT INTO `sys_user_pos` VALUES (1312010612905086978, 1312010612770869250, 111111);
INSERT INTO `sys_user_pos` VALUES (1312014352957698049, 1312014352508907522, 25);

SET FOREIGN_KEY_CHECKS = 1;
