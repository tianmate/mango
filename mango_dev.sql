/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 50644
 Source Host           : 127.0.0.1:3306
 Source Schema         : mango_dev

 Target Server Type    : MySQL
 Target Server Version : 50644
 File Encoding         : 65001

 Date: 02/04/2022 18:16:47
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
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (2, 'sys_notice', '通知公告表', 'test1', 'test1', 'SysNotice', 'crud', 'cn.sky1998.mongo.work.base.notice', 'work', 'notice', '通知公告', 'tcy', '0', '/src/main/java/cn/sky1998/mongo/work/base', '{}', 'admin', '2022-03-15 09:02:37', '', '2022-03-18 17:33:13', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (12, '3', 'notice_id', '公告ID', 'int(4)', 'Integer', 'noticeId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'tcy', '2022-03-16 14:23:29', '', NULL);
INSERT INTO `gen_table_column` VALUES (13, '3', 'notice_title', '公告标题', 'varchar(50)', 'String', 'noticeTitle', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'tcy', '2022-03-16 14:23:29', '', NULL);
INSERT INTO `gen_table_column` VALUES (14, '3', 'notice_type', '公告类型（1通知 2公告）', 'char(1)', 'String', 'noticeType', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', 3, 'tcy', '2022-03-16 14:23:29', '', NULL);
INSERT INTO `gen_table_column` VALUES (15, '3', 'notice_content', '公告内容', 'longblob', 'String', 'noticeContent', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'editor', '', 4, 'tcy', '2022-03-16 14:23:29', '', NULL);
INSERT INTO `gen_table_column` VALUES (16, '3', 'status', '公告状态（0正常 1关闭）', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 5, 'tcy', '2022-03-16 14:23:29', '', NULL);
INSERT INTO `gen_table_column` VALUES (17, '3', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 6, 'tcy', '2022-03-16 14:23:29', '', NULL);
INSERT INTO `gen_table_column` VALUES (18, '3', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 7, 'tcy', '2022-03-16 14:23:29', '', NULL);
INSERT INTO `gen_table_column` VALUES (19, '3', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 8, 'tcy', '2022-03-16 14:23:29', '', NULL);
INSERT INTO `gen_table_column` VALUES (20, '3', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 9, 'tcy', '2022-03-16 14:23:29', '', NULL);
INSERT INTO `gen_table_column` VALUES (21, '3', 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 10, 'tcy', '2022-03-16 14:23:29', '', NULL);
INSERT INTO `gen_table_column` VALUES (22, '4', 'notice_id', '公告ID', 'int(4)', 'Integer', 'noticeId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'tcy', '2022-03-16 14:24:09', '', NULL);
INSERT INTO `gen_table_column` VALUES (23, '4', 'notice_title', '公告标题', 'varchar(50)', 'String', 'noticeTitle', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'tcy', '2022-03-16 14:24:09', '', NULL);
INSERT INTO `gen_table_column` VALUES (24, '4', 'notice_type', '公告类型（1通知 2公告）', 'char(1)', 'String', 'noticeType', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', 3, 'tcy', '2022-03-16 14:24:09', '', NULL);
INSERT INTO `gen_table_column` VALUES (25, '4', 'notice_content', '公告内容', 'longblob', 'String', 'noticeContent', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'editor', '', 4, 'tcy', '2022-03-16 14:24:09', '', NULL);
INSERT INTO `gen_table_column` VALUES (26, '4', 'status', '公告状态（0正常 1关闭）', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 5, 'tcy', '2022-03-16 14:24:09', '', NULL);
INSERT INTO `gen_table_column` VALUES (27, '4', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 6, 'tcy', '2022-03-16 14:24:09', '', NULL);
INSERT INTO `gen_table_column` VALUES (28, '4', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 7, 'tcy', '2022-03-16 14:24:09', '', NULL);
INSERT INTO `gen_table_column` VALUES (29, '4', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 8, 'tcy', '2022-03-16 14:24:09', '', NULL);
INSERT INTO `gen_table_column` VALUES (30, '4', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 9, 'tcy', '2022-03-16 14:24:09', '', NULL);
INSERT INTO `gen_table_column` VALUES (31, '4', 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 10, 'tcy', '2022-03-16 14:24:09', '', NULL);
INSERT INTO `gen_table_column` VALUES (32, '5', 'notice_id', '公告ID', 'int(4)', 'Integer', 'noticeId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'tcy', '2022-03-16 14:25:25', '', NULL);
INSERT INTO `gen_table_column` VALUES (33, '5', 'notice_title', '公告标题', 'varchar(50)', 'String', 'noticeTitle', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'tcy', '2022-03-16 14:25:25', '', NULL);
INSERT INTO `gen_table_column` VALUES (34, '5', 'notice_type', '公告类型（1通知 2公告）', 'char(1)', 'String', 'noticeType', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', 3, 'tcy', '2022-03-16 14:25:25', '', NULL);
INSERT INTO `gen_table_column` VALUES (35, '5', 'notice_content', '公告内容', 'longblob', 'String', 'noticeContent', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'editor', '', 4, 'tcy', '2022-03-16 14:25:25', '', NULL);
INSERT INTO `gen_table_column` VALUES (36, '5', 'status', '公告状态（0正常 1关闭）', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 5, 'tcy', '2022-03-16 14:25:25', '', NULL);
INSERT INTO `gen_table_column` VALUES (37, '5', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 6, 'tcy', '2022-03-16 14:25:25', '', NULL);
INSERT INTO `gen_table_column` VALUES (38, '5', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 7, 'tcy', '2022-03-16 14:25:25', '', NULL);
INSERT INTO `gen_table_column` VALUES (39, '5', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 8, 'tcy', '2022-03-16 14:25:25', '', NULL);
INSERT INTO `gen_table_column` VALUES (40, '5', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 9, 'tcy', '2022-03-16 14:25:25', '', NULL);
INSERT INTO `gen_table_column` VALUES (41, '5', 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 10, 'tcy', '2022-03-16 14:25:25', '', NULL);
INSERT INTO `gen_table_column` VALUES (42, '2', 'notice_id', '公告ID', 'int(4)', 'Integer', 'noticeId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-03-18 17:33:13', '', NULL);
INSERT INTO `gen_table_column` VALUES (43, '2', 'notice_title', '公告标题', 'varchar(50)', 'String', 'noticeTitle', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2022-03-18 17:33:13', '', NULL);
INSERT INTO `gen_table_column` VALUES (44, '2', 'notice_type', '公告类型（1通知 2公告）', 'char(1)', 'String', 'noticeType', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', 3, 'admin', '2022-03-18 17:33:13', '', NULL);
INSERT INTO `gen_table_column` VALUES (45, '2', 'notice_content', '公告内容', 'longblob', 'String', 'noticeContent', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'editor', '', 4, 'admin', '2022-03-18 17:33:13', '', NULL);
INSERT INTO `gen_table_column` VALUES (46, '2', 'status', '公告状态（0正常 1关闭）', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 5, 'admin', '2022-03-18 17:33:13', '', NULL);
INSERT INTO `gen_table_column` VALUES (47, '2', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2022-03-18 17:33:13', '', NULL);
INSERT INTO `gen_table_column` VALUES (48, '2', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2022-03-18 17:33:13', '', NULL);
INSERT INTO `gen_table_column` VALUES (49, '2', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2022-03-18 17:33:13', '', NULL);
INSERT INTO `gen_table_column` VALUES (50, '2', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2022-03-18 17:33:13', '', NULL);
INSERT INTO `gen_table_column` VALUES (51, '2', 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 10, 'admin', '2022-03-18 17:33:13', '', NULL);
INSERT INTO `gen_table_column` VALUES (52, '2', 'test', '测试', 'varchar(64)', 'String', 'test', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 11, NULL, '2022-03-18 17:33:13', '', NULL);

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
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典数据表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2022-03-08 17:36:09', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-03-08 17:36:09', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-03-08 17:36:09', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2022-03-08 17:36:09', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2022-03-08 17:36:09', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2022-03-08 17:36:09', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2022-03-08 17:36:09', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2022-03-08 17:36:09', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2022-03-08 17:36:09', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2022-03-08 17:36:09', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2022-03-08 17:36:09', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2022-03-08 17:36:09', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2022-03-08 17:36:09', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2022-03-08 17:36:09', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2022-03-08 17:36:09', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2022-03-08 17:36:09', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2022-03-08 17:36:09', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-03-08 17:36:09', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (19, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-03-08 17:36:09', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (20, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-03-08 17:36:09', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (21, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2022-03-08 17:36:09', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (22, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-03-08 17:36:09', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (23, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-03-08 17:36:09', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (24, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-03-08 17:36:09', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (25, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-03-08 17:36:09', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (26, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-03-08 17:36:09', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (27, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2022-03-08 17:36:09', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (28, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2022-03-08 17:36:09', '', NULL, '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2022-03-08 17:36:09', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2022-03-08 17:36:09', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2022-03-08 17:36:09', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2022-03-08 17:36:09', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2022-03-08 17:36:09', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2022-03-08 17:36:09', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2022-03-08 17:36:09', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2022-03-08 17:36:09', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2022-03-08 17:36:09', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2022-03-08 17:36:09', '', NULL, '登录状态列表');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int(1) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int(1) NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '用户管理', 4, 0, '/pages/user', 'user/user', NULL, 1, 0, 'C', '0', '0', NULL, 'el-icon-user', '', NULL, '', NULL, '用户管理');
INSERT INTO `sys_menu` VALUES (2, '角色管理', 4, 1, '/pages/role', 'role/role', NULL, 1, 0, 'C', '0', '0', NULL, 'el-icon-s-check', '', NULL, '', NULL, '角色管理');
INSERT INTO `sys_menu` VALUES (3, '菜单管理', 4, 2, '/pages/menu', 'menu/index', NULL, 1, 0, 'C', '0', '0', NULL, 'el-icon-menu', '', NULL, '', NULL, '菜单管理');
INSERT INTO `sys_menu` VALUES (4, '系统管理', 0, 0, '', '', NULL, 1, 0, 'M', '0', '0', NULL, 'el-icon-menu', '', NULL, '', NULL, '系统管理');
INSERT INTO `sys_menu` VALUES (5, '系统工具', 0, 0, '', '', NULL, 1, 0, 'M', '0', '0', NULL, 'el-icon-menu', '', NULL, '', NULL, '系统工具');
INSERT INTO `sys_menu` VALUES (6, '代码生成', 5, 0, '/pages/createCode', 'gen/index', NULL, 1, 0, 'c', '0', '0', NULL, 'el-icon-s-check', '', NULL, '', NULL, '代码生成');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(4) NULL DEFAULT NULL COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `test` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '测试'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知公告表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------

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
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色菜单关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (1, 1, 2, 0001, 0, NULL);
INSERT INTO `sys_role_menu` VALUES (2, 1, 1, 0001, 0, NULL);
INSERT INTO `sys_role_menu` VALUES (3, 1, 3, 0001, 0, NULL);
INSERT INTO `sys_role_menu` VALUES (6, 2, 1, 0001, 0, NULL);
INSERT INTO `sys_role_menu` VALUES (8, 1, 4, 0000, 1, NULL);
INSERT INTO `sys_role_menu` VALUES (9, 1, 5, 0000, 0, NULL);
INSERT INTO `sys_role_menu` VALUES (10, 1, 6, 0000, 0, NULL);
INSERT INTO `sys_role_menu` VALUES (11, 1, 11, 0000, 0, NULL);
INSERT INTO `sys_role_menu` VALUES (12, 1, 12, 0000, 0, NULL);
INSERT INTO `sys_role_menu` VALUES (13, 1, 13, 0000, 0, NULL);
INSERT INTO `sys_role_menu` VALUES (14, 6, 10, 0000, 0, NULL);
INSERT INTO `sys_role_menu` VALUES (15, 6, 11, 0000, 0, NULL);
INSERT INTO `sys_role_menu` VALUES (16, 6, 12, 0000, 0, NULL);
INSERT INTO `sys_role_menu` VALUES (17, 6, 13, 0000, 0, NULL);
INSERT INTO `sys_role_menu` VALUES (18, 6, 8, 0000, 0, NULL);
INSERT INTO `sys_role_menu` VALUES (19, 1, 14, 0000, 0, NULL);
INSERT INTO `sys_role_menu` VALUES (20, 1, 14, 0000, 0, NULL);
INSERT INTO `sys_role_menu` VALUES (21, 1, 16, 0000, 0, NULL);
INSERT INTO `sys_role_menu` VALUES (22, 1, 17, 0000, 0, NULL);
INSERT INTO `sys_role_menu` VALUES (23, 1, 18, 0000, 0, NULL);
INSERT INTO `sys_role_menu` VALUES (24, 1, 19, 0000, 0, NULL);

SET FOREIGN_KEY_CHECKS = 1;
