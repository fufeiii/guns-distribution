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
INSERT INTO `database_info` VALUES (1316378072492093442, 'master', 'com.mysql.cj.jdbc.Driver', 'root', 'root', 'jdbc:mysql://47.116.1.66:3306/guns_distribution?autoReconnect=true&useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=CONVERT_TO_NULL&useSSL=false&serverTimezone=CTT', '主数据源，项目启动数据源！', '2020-10-14 21:59:24');

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
INSERT INTO `dist_account` VALUES (129, '2020-10-05 12:55:33', NULL, 8, 14.11000000, 14.11000000, 0.00000000, 0, 0, 0, 0, 0);
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
INSERT INTO `dist_account_record` VALUES (1314555247594655746, '2020-10-09 21:16:08', 'aigou', 'aigou1', 0, 8.14000000, 11.11000000, 2.97000000, 0, 1314555247166836738, NULL);
INSERT INTO `dist_account_record` VALUES (1314563953971453954, '2020-10-09 21:50:44', 'aigou', 'aigou1', 0, 11.11000000, 14.11000000, 3.00000000, 0, 1314563953547829249, NULL);

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
  `webhook` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '平台的webhook',
  `state` int(11) NOT NULL COMMENT '状态',
  `memo` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `sys_id` bigint(20) NOT NULL COMMENT '系统管理员id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_platform_username`(`platform_username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '平台' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dist_platform
-- ----------------------------
INSERT INTO `dist_platform` VALUES (1312014353360351233, '2020-10-02 20:59:33', NULL, 2, 'aigou', '艾购AiGou', 'https://oapi.dingtalk.com/robot/send?access_token=52cc7983ee44cc79c87bd00fafb011b897122598654a1c8b45f9cb338075a854', 0, '', 1312014352508907522);

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
INSERT INTO `dist_profit_event` VALUES (1314555244969021442, '2020-10-09 21:16:08', 'aigou', 0, 'aigou2', 'aigou2_order123', 99.00000000, 'aigou1等, 1人获得分润');
INSERT INTO `dist_profit_event` VALUES (1314563950607622146, '2020-10-09 21:50:44', 'aigou', 0, 'aigou2', 'aigou2_order1234', 100.00000000, 'aigou1等, 1人获得分润');

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
INSERT INTO `dist_profit_record` VALUES (1314555247166836738, '2020-10-09 21:16:08', 1314555244969021442, 0, 'aigou1', 2.97000000, NULL);
INSERT INTO `dist_profit_record` VALUES (1314563953547829249, '2020-10-09 21:50:44', 1314563950607622146, 0, 'aigou1', 3.00000000, NULL);

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
