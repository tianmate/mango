/*
 Navicat Premium Data Transfer

 Source Server         : 122.51.66.24
 Source Server Type    : MySQL
 Source Server Version : 50735
 Source Host           : 122.51.66.24:3306
 Source Schema         : mango_dev

 Target Server Type    : MySQL
 Target Server Version : 50735
 File Encoding         : 65001

 Date: 07/03/2022 09:46:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for g_keyword
-- ----------------------------
DROP TABLE IF EXISTS `g_keyword`;
CREATE TABLE `g_keyword`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `word` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `reply` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `enable` tinyint(4) NULL DEFAULT 0,
  `remark` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '关键字表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of g_keyword
-- ----------------------------
INSERT INTO `g_keyword` VALUES (1, '交换', '嘿，你来了。\n新年好啊，欢迎来参加这场全世界陌生人的新年大交换。\n现在，你有机会和世界上另一个角落的某个陌生人交换一段新年问候，主题是：「你新年第一天发生的一件开心小事」。\n新的一年，祝你们从快乐出发，遇见更多快乐。\n现在，参考下面的格式，写下你新年第一天一件开心的小事，发给我，我马上为你交换。\n\n我的话=***，如：我的话=新的一年希望你顺风顺水，晚安呐', 0, NULL);
INSERT INTO `g_keyword` VALUES (2, '报名', '<a href=\"http://www.baidu.com\">点击报名</a>', 1, NULL);
INSERT INTO `g_keyword` VALUES (3, '常用语', '可以发送[交换]开始你的新年祝福', 0, NULL);
INSERT INTO `g_keyword` VALUES (4, '关注回复', '欢迎关注[乐土湾]，立志成为年轻人的精神乐土！现在你可以发送【晚安计划】与陌生人互换晚安哦，并有机会互换微信ID', 0, '关注后回复关键字勿动');
INSERT INTO `g_keyword` VALUES (5, '晚安计划', '欢迎参加晚安互换计划', 1, '测试');
INSERT INTO `g_keyword` VALUES (6, '没有手机号', '您还没有通知手机号哦，现在回复我电话吧。仅用于发送晚安短信，我会严格保密的！回复格式为，手机=***，如：手机=15838330153', 0, '没有手机号回复');
INSERT INTO `g_keyword` VALUES (7, '晚安计划', '报名成功啦，系统会严格保密你的手机号的！\n将会在 10:06 向你推送晚安短信', 0, '');
INSERT INTO `g_keyword` VALUES (8, '没有昵称', '您还没有昵称哦，现在回复我一个昵称吧。回复格式为，昵称=***，如：昵称=程序员田同学', 0, '没有昵称回复内容');
INSERT INTO `g_keyword` VALUES (9, '昵称设置通过', '昵称设置通过，全网通用哦，现在开始我们的活动吧，回复[晚安计划]，开启本年度的晚安计划', 0, '昵称设置通过回复内容');
INSERT INTO `g_keyword` VALUES (10, '手机号设置通过', '手机号设置通过，全网通用哦，现在开始我们的活动吧，回复【晚安计划】，开启本年度的晚安计划', 0, '');
INSERT INTO `g_keyword` VALUES (11, '回复成功', '收到，已将回复发送给了它，期待我们的第二次相遇', 0, '');
INSERT INTO `g_keyword` VALUES (12, '留言成功', '收到，已将留言发送给了它，期待我们的第二次相遇', 0, '');
INSERT INTO `g_keyword` VALUES (13, '留言', '现在你有一次机会与对方留言，留言格式为，留言=**（可以留下微信号哦）留言=qingtengpai', 0, '');
INSERT INTO `g_keyword` VALUES (14, '回复', '你也可以再次向他回复哦，回复格式为：回复=**，如回复=谢谢你呀', 0, '');
INSERT INTO `g_keyword` VALUES (15, '活动结束', '活动还未开始，你可以参加交换活动', 0, '');

-- ----------------------------
-- Table structure for g_mesaage
-- ----------------------------
DROP TABLE IF EXISTS `g_mesaage`;
CREATE TABLE `g_mesaage`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `openid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mes` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `to_openid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `parent_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '消息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of g_mesaage
-- ----------------------------
INSERT INTO `g_mesaage` VALUES (1, 'oZ2B35vrgE5AwaBdVXjsa1jtavzA', '我发了一个消息', NULL, '2022-03-01 16:05:55', NULL);
INSERT INTO `g_mesaage` VALUES (2, 'oZ2B35vrgE5AwaBdVXjsa1jtavzA', 'CLICK：connect', NULL, '2022-03-01 16:06:04', NULL);
INSERT INTO `g_mesaage` VALUES (3, 'oZ2B35vrgE5AwaBdVXjsa1jtavzA', '关注', NULL, '2022-03-01 16:07:17', NULL);

-- ----------------------------
-- Table structure for g_night_join
-- ----------------------------
DROP TABLE IF EXISTS `g_night_join`;
CREATE TABLE `g_night_join`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `openid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `plan_id` bigint(20) NULL DEFAULT NULL COMMENT '计划id',
  `send_num` int(11) NULL DEFAULT 0 COMMENT '发送次数',
  `send_enable` tinyint(4) NULL DEFAULT 0 COMMENT '是否允许发送',
  `create_time` datetime NULL DEFAULT NULL COMMENT '报名时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `g_night_join_id_uindex`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '晚安计划表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of g_night_join
-- ----------------------------
INSERT INTO `g_night_join` VALUES (9, 'oZ2B35vrgE5AwaBdVXjsa1jtavzA', 1, 0, 1, '2022-02-26 10:58:19');
INSERT INTO `g_night_join` VALUES (10, 'oZ2B35vrgE5AwaBdVXjsa1jtavzA', 3, 2, 1, '2022-02-28 11:37:45');

-- ----------------------------
-- Table structure for g_options
-- ----------------------------
DROP TABLE IF EXISTS `g_options`;
CREATE TABLE `g_options`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `key` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `value` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `enable` tinyint(4) NULL DEFAULT 0 COMMENT '是否启用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of g_options
-- ----------------------------
INSERT INTO `g_options` VALUES (1, 'nick_name', '请输入你的昵称', 0);
INSERT INTO `g_options` VALUES (2, '晚安活动期数', '202201', 0);
INSERT INTO `g_options` VALUES (3, '晚安是否开始', '0', 0);

-- ----------------------------
-- Table structure for g_plan
-- ----------------------------
DROP TABLE IF EXISTS `g_plan`;
CREATE TABLE `g_plan`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动名称',
  `des` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动描述',
  `periods` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动期数',
  `num` int(11) NULL DEFAULT NULL COMMENT '推送次数',
  `begin_time` datetime NULL DEFAULT NULL COMMENT '开始时间',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `temp_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '短信模板id',
  `para` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数',
  `enable` tinyint(4) NULL DEFAULT 0 COMMENT '是否启用',
  `end` tinyint(4) NULL DEFAULT 1 COMMENT '是否完成',
  `end_time` datetime NULL DEFAULT NULL COMMENT '结束时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '活动计划表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of g_plan
-- ----------------------------
INSERT INTO `g_plan` VALUES (1, '晚安计划', '晚安计划', '20220201', 3, '2022-02-21 14:54:15', '2022-02-15 15:04:38', '1300158', '公众号[乐土湾]', 1, 0, '2022-02-21 14:54:19');
INSERT INTO `g_plan` VALUES (2, '晚安互换', '晚安互换计划', '20220221', NULL, '2022-02-21 14:54:22', '2022-02-21 10:46:06', NULL, NULL, 1, 0, '2022-02-21 14:54:25');
INSERT INTO `g_plan` VALUES (3, '晚安计划', '晚安计划第2期', '20220228', 2, NULL, '2022-02-28 11:28:36', '1300158,1300159', '公众号【乐土湾】', 1, 0, NULL);

-- ----------------------------
-- Table structure for g_public_user
-- ----------------------------
DROP TABLE IF EXISTS `g_public_user`;
CREATE TABLE `g_public_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nick_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户昵称',
  `openid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'openid',
  `wx_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信号',
  `sex` tinyint(4) NULL DEFAULT NULL COMMENT '性别，0男，1女',
  `tel` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `subscribe` tinyint(4) NULL DEFAULT 1 COMMENT '值为0时，代表此用户没有关注该公众号',
  `subscribe_time` datetime NULL DEFAULT NULL COMMENT '关注时间',
  `subscribe_scene` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户关注的渠道来源ADD_SCENE_SEARCH 公众号搜索，ADD_SCENE_ACCOUNT_MIGRATION 公众号迁移，ADD_SCENE_PROFILE_CARD 名片分享，ADD_SCENE_QR_CODE 扫描二维码，ADD_SCENE_PROFILE_LINK 图文页内名称点击，ADD_SCENE_PROFILE_ITEM 图文页右上角菜单，ADD_SCENE_PAID 支付后关注，ADD_SCENE_WECHAT_ADVERTISEMENT 微信广告，ADD_SCENE_REPRINT 他人转载 ,ADD_SCENE_LIVESTREAM 视频号直播，ADD_SCENE_CHANNELS 视频号 , ADD_SCENE_OTHERS 其他',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `g_public_user_id_uindex`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '公众号用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of g_public_user
-- ----------------------------
INSERT INTO `g_public_user` VALUES (1, '程序员3', 'oZ2B35vrgE5AwaBdVXjsa1jtavzA', 'T_3453', 0, '15838330153', 1, '1970-01-20 08:54:55', 'ADD_SCENE_QR_CODE', NULL);
INSERT INTO `g_public_user` VALUES (2, '哥哥', 'oZ2B35gotGC9SkWxPZVQjGh748DY', NULL, 0, NULL, 1, '1970-01-20 08:40:48', 'ADD_SCENE_OTHERS', '2022-02-18 08:48:38');
INSERT INTO `g_public_user` VALUES (3, '青藤派', 'oZ2B35lvUXGm_fDzf-JFxSUBF-F0', NULL, 0, '18736970012', 1, '1970-01-20 08:59:09', 'ADD_SCENE_QR_CODE', '2022-02-18 10:01:12');
INSERT INTO `g_public_user` VALUES (4, NULL, 'oO8T36bnWVb90QvqFMFoNgowrhx4', NULL, NULL, '15838330153', 1, NULL, NULL, '2022-02-24 11:54:05');
INSERT INTO `g_public_user` VALUES (5, NULL, 'oO8T36cnbjPkTTsA9cRG7aCDYvfg', NULL, NULL, NULL, 1, NULL, NULL, '2022-02-24 18:18:15');

-- ----------------------------
-- Table structure for g_swag
-- ----------------------------
DROP TABLE IF EXISTS `g_swag`;
CREATE TABLE `g_swag`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `openid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发送者openid',
  `to_openid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发送者openid',
  `msg1` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消息1',
  `msg2` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消息2',
  `create_time` datetime NULL DEFAULT NULL COMMENT '交换时间',
  `plan_id` bigint(20) NULL DEFAULT NULL COMMENT '活动id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `g_swag_id_uindex`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '交换表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of g_swag
-- ----------------------------
INSERT INTO `g_swag` VALUES (35, 'oZ2B35vrgE5AwaBdVXjsa1jtavzA', 'oZ2B35lvUXGm_fDzf-JFxSUBF-F0', '我是sky，这是第一天信息，最好的祝福给你', '我是sky，这是我的留言', '2022-02-22 14:58:55', 2);
INSERT INTO `g_swag` VALUES (36, 'oZ2B35lvUXGm_fDzf-JFxSUBF-F0', 'oZ2B35vrgE5AwaBdVXjsa1jtavzA', '我是青藤派，这是我的第一条消息', '我是青藤派，这是我的回复', '2022-02-22 15:06:46', 2);

-- ----------------------------
-- Table structure for log_exception
-- ----------------------------
DROP TABLE IF EXISTS `log_exception`;
CREATE TABLE `log_exception`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `account_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  `api_id` bigint(20) NULL DEFAULT NULL COMMENT '接口id',
  `exception_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '异常类型',
  `exception_level` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '异常层级',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '异常日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of log_exception
-- ----------------------------

-- ----------------------------
-- Table structure for p_api_resource
-- ----------------------------
DROP TABLE IF EXISTS `p_api_resource`;
CREATE TABLE `p_api_resource`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '资源名称',
  `url` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '资源路径',
  `create_time` date NOT NULL COMMENT '添加时间',
  `enable` tinyint(4) NOT NULL DEFAULT 1 COMMENT '可用状态',
  `del` tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标记',
  `remark` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '业务接口资源表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of p_api_resource
-- ----------------------------
INSERT INTO `p_api_resource` VALUES (1, '简体转繁体', '/work/words/convertToTraditionalChinese', '2021-12-10', 1, 0, '简体转繁体');

-- ----------------------------
-- Table structure for p_used_api
-- ----------------------------
DROP TABLE IF EXISTS `p_used_api`;
CREATE TABLE `p_used_api`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `account_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  `api_id` bigint(20) NULL DEFAULT NULL COMMENT '接口资源id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `valid` tinyint(4) NULL DEFAULT NULL COMMENT '是否有效',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户使用表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of p_used_api
-- ----------------------------

-- ----------------------------
-- Table structure for p_user_api
-- ----------------------------
DROP TABLE IF EXISTS `p_user_api`;
CREATE TABLE `p_user_api`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `account_id` bigint(20) NULL DEFAULT NULL COMMENT '账户id',
  `api_id` bigint(20) NULL DEFAULT NULL COMMENT '接口id',
  `total` int(5) NULL DEFAULT NULL COMMENT '总次数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户接口资源表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of p_user_api
-- ----------------------------

-- ----------------------------
-- Table structure for sys_account
-- ----------------------------
DROP TABLE IF EXISTS `sys_account`;
CREATE TABLE `sys_account`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账号',
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `tel` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号',
  `user_type` tinyint(4) NULL DEFAULT NULL COMMENT '用户类型',
  `nick_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '昵称',
  `enable` tinyint(4) UNSIGNED ZEROFILL NULL DEFAULT 0000 COMMENT '可用状态',
  `del` tinyint(4) UNSIGNED ZEROFILL NULL DEFAULT 0000 COMMENT '删除标记',
  `remark` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '账户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_account
-- ----------------------------
INSERT INTO `sys_account` VALUES (2, 'admin', '$2a$10$tXGQWjK7KBJN/4dBnVB1GOdGnvo/GZqWuxKOTx55O7EB7w1B1VjGi', '15838330153', 1, 'sky', 0000, 0000, '系统管理员');
INSERT INTO `sys_account` VALUES (3, 'biubiu', '$2a$10$tXGQWjK7KBJN/4dBnVB1GOdGnvo/GZqWuxKOTx55O7EB7w1B1VjGi', '13854515', 1, 'biubiu', 0000, 0000, '运营者');
INSERT INTO `sys_account` VALUES (4, 'test', '$2a$10$4vkXfPMNq.PzRw7ihVyqk.z0PcMqh7lFCX1a8FJNolV3r82h0Fowa', '13854515', 1, '345热天', 0000, 0000, '测试');
INSERT INTO `sys_account` VALUES (5, 'sky', '$2a$10$aPjS3iAwaOhHHLNUhn802O1.nl46Duz6YodC1Yg9it8VHO4Y8I56C', '15838330153', 1, 'sky1', 0000, 0000, 'sky1');

-- ----------------------------
-- Table structure for sys_account_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_account_role`;
CREATE TABLE `sys_account_role`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `account_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '账户id',
  `role_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '角色id',
  `eable` tinyint(4) UNSIGNED NULL DEFAULT 0 COMMENT '可用状态',
  `del` tinyint(4) UNSIGNED NULL DEFAULT 0 COMMENT '删除标记',
  `remark` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '账户角色关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_account_role
-- ----------------------------
INSERT INTO `sys_account_role` VALUES (1, 2, 1, 0, 0, NULL);
INSERT INTO `sys_account_role` VALUES (3, 4, 2, 0, 0, NULL);
INSERT INTO `sys_account_role` VALUES (19, 4, 3, 0, 0, NULL);
INSERT INTO `sys_account_role` VALUES (21, 2, 2, 0, 0, NULL);
INSERT INTO `sys_account_role` VALUES (27, 2, 4, 0, 0, NULL);
INSERT INTO `sys_account_role` VALUES (29, 2, 4, 0, 0, NULL);
INSERT INTO `sys_account_role` VALUES (30, 2, 5, 0, 0, NULL);
INSERT INTO `sys_account_role` VALUES (33, 3, 6, 0, 0, NULL);

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `description` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '描述',
  `parent_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '父菜单id',
  `path` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路由地址',
  `hidden` tinyint(4) NULL DEFAULT 1 COMMENT '显示状态',
  `icon` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '图标',
  `order` smallint(6) NULL DEFAULT 0 COMMENT '同级优先级',
  `enable` tinyint(4) UNSIGNED ZEROFILL NULL DEFAULT 0000 COMMENT '可用状态',
  `del` tinyint(4) UNSIGNED ZEROFILL NULL DEFAULT 0000 COMMENT '删除标记',
  `remark` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '用户管理', '用户管理', 0, '/pages/user', 0, 'el-icon-user\r\n', 1, 0000, 0000, '用户管理');
INSERT INTO `sys_menu` VALUES (2, '角色管理', '角色管理', 0, '/pages/role', 0, 'el-icon-s-check', 2, 0000, 0000, NULL);
INSERT INTO `sys_menu` VALUES (3, '菜单管理', '菜单管理', 0, '/pages/menu', 0, 'el-icon-menu', 3, 0000, 0000, NULL);
INSERT INTO `sys_menu` VALUES (7, '配置管理', '公众号配置', 4, '/test2', 1, '', 8, 0000, 0001, NULL);
INSERT INTO `sys_menu` VALUES (8, '关键词管理', '公众号关键词管理', 4, '/pages/gzh/keyword', 1, 'el-icon-document', 6, 0000, 0000, NULL);
INSERT INTO `sys_menu` VALUES (10, '活动管理', '公众号统一活动管理', 0, '/pages/gzh/plan', 1, 'el-icon-s-flag', 7, 0000, 0000, NULL);
INSERT INTO `sys_menu` VALUES (11, '公众号用户管理', '公众号用户信息', 0, '/pages/gzh/publicUser', 1, 'el-icon-user', 5, 0000, 0000, NULL);
INSERT INTO `sys_menu` VALUES (12, '晚安计划管理', '晚安计划报名表', 0, '/pages/gzh/nightJoin', 1, ' el-icon-phone-outline', 8, 0000, 0000, NULL);
INSERT INTO `sys_menu` VALUES (13, '晚安交换管理', '晚安交换管理', 0, '/pages/gzh/swag', 1, 'el-icon-tickets', 9, 0000, 0000, NULL);
INSERT INTO `sys_menu` VALUES (14, '消息记录管理', '消息记录管理', 0, '/pages/gzh/message', 1, 'el-icon-bell', 10, 0000, 0000, NULL);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `description` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色描述',
  `sort` tinyint(4) NULL DEFAULT 0 COMMENT '排序',
  `enable` tinyint(4) UNSIGNED ZEROFILL NULL DEFAULT 0000 COMMENT '可用状态',
  `del` tinyint(4) UNSIGNED ZEROFILL NULL DEFAULT 0000 COMMENT '删除标记',
  `remark` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, 'admin', '系统管理员', 1, 0000, 0000, '系统管理员');
INSERT INTO `sys_role` VALUES (2, 'register', '注册用户', 2, 0000, 0000, '公众号注册用户');
INSERT INTO `sys_role` VALUES (3, 'visitor', '游客', 3, 0000, 0000, '游客登录');
INSERT INTO `sys_role` VALUES (4, 'vip', '黄金用户', 5, 0000, 0000, '赞助者');
INSERT INTO `sys_role` VALUES (5, 'test1', '测试1', 6, 0000, 0000, '备注');
INSERT INTO `sys_role` VALUES (6, 'runner', '运营', 0, 0000, 0000, NULL);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_id` bigint(20) NOT NULL COMMENT '角色id',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单id',
  `enable` tinyint(4) UNSIGNED ZEROFILL NOT NULL DEFAULT 0000 COMMENT '可用状态',
  `del` tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标记',
  `remark` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色菜单关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (1, 1, 2, 0001, 0, NULL);
INSERT INTO `sys_role_menu` VALUES (2, 1, 1, 0001, 0, NULL);
INSERT INTO `sys_role_menu` VALUES (3, 1, 3, 0001, 0, NULL);
INSERT INTO `sys_role_menu` VALUES (6, 2, 1, 0001, 0, NULL);
INSERT INTO `sys_role_menu` VALUES (8, 1, 7, 0000, 1, NULL);
INSERT INTO `sys_role_menu` VALUES (9, 1, 8, 0000, 0, NULL);
INSERT INTO `sys_role_menu` VALUES (10, 1, 10, 0000, 0, NULL);
INSERT INTO `sys_role_menu` VALUES (11, 1, 11, 0000, 0, NULL);
INSERT INTO `sys_role_menu` VALUES (12, 1, 12, 0000, 0, NULL);
INSERT INTO `sys_role_menu` VALUES (13, 1, 13, 0000, 0, NULL);
INSERT INTO `sys_role_menu` VALUES (14, 6, 10, 0000, 0, NULL);
INSERT INTO `sys_role_menu` VALUES (15, 6, 11, 0000, 0, NULL);
INSERT INTO `sys_role_menu` VALUES (16, 6, 12, 0000, 0, NULL);
INSERT INTO `sys_role_menu` VALUES (17, 6, 13, 0000, 0, NULL);
INSERT INTO `sys_role_menu` VALUES (18, 6, 8, 0000, 0, NULL);
INSERT INTO `sys_role_menu` VALUES (19, 1, 14, 0000, 0, NULL);

SET FOREIGN_KEY_CHECKS = 1;
