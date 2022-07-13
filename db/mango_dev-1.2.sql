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

 Date: 13/07/2022 15:06:37
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (2, 'sys_notice', '通知公告表', 'test1', 'test1', 'SysNotice', 'crud', 'cn.sky1998.mongo.work', 'work', 'notice', '通知公告功能名', 'tcy', '0', '/src/main/java/cn/sky1998/mongo/work/base', '{\"parentMenuId\":7}', 'admin', '2022-03-15 09:02:37', '', '2022-07-13 12:00:59', NULL);
INSERT INTO `gen_table` VALUES (16, 'work_student', '学生成绩', 'work_stuInfo', 'sushe', 'workStudent', 'sub', 'cn.sky1998.mongo.work.student', 'work', 'student', '学生成绩管理', 'tcy', '0', '/', '{}', '', '2022-04-26 11:08:26', '', '2022-05-23 17:45:31', NULL);
INSERT INTO `gen_table` VALUES (17, 'work_course', '课程表', 'work_student', 'course', 'workCourse', 'sub', 'cn.sky1998.mongo.work.course', 'work', 'course', '课程管理', 'tcy', '0', '/', '{}', '', '2022-04-29 15:54:56', '', '2022-07-05 16:42:19', NULL);
INSERT INTO `gen_table` VALUES (18, 'work_stuInfo', '学生信息', '', '', 'workStuinfo', 'crud', 'cn.sky1998.mongo.work.stuinfo', 'work', 'stuinfo', '学生管理', 'tcy', '0', '/', '{}', '', '2022-04-29 16:07:50', '', '2022-05-23 18:05:38', NULL);
INSERT INTO `gen_table` VALUES (21, 'log_exception', '异常日志表', NULL, NULL, 'LogException', 'crud', 'cn.sky1998.mango.work', 'work', 'exception', '异常日志', 'tcy', '0', '/', '{}', 'tcy', '2022-07-08 15:43:18', '', '2022-07-08 17:07:23', NULL);

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
  `field_num` int(11) NULL DEFAULT NULL COMMENT '字段长度',
  `point_num` int(11) NULL DEFAULT NULL COMMENT '小数点',
  `default_value` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '默认值',
  `dict_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典code',
  `dict_text` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典text',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `dict_table` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典table',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 732 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (200, '16', 'id', '主键', 'bigint', 'java.math.BigInteger', 'id', '1', '1', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', NULL, 1, NULL, NULL, NULL, NULL, NULL, 'mango', '2022-05-23 17:45:31', '', NULL, NULL);
INSERT INTO `gen_table_column` VALUES (201, '16', 'code', '学号', 'varchar(64)', 'String', 'code', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23 17:45:31', '', NULL, NULL);
INSERT INTO `gen_table_column` VALUES (202, '16', 'name', '姓名', 'varchar(64)', 'String', 'name', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23 17:45:31', '', NULL, NULL);
INSERT INTO `gen_table_column` VALUES (203, '16', 'num', '成绩', 'int', 'int', 'num', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23 17:45:31', '', NULL, NULL);
INSERT INTO `gen_table_column` VALUES (204, '16', 'course', '课程', 'varchar(64)', 'String', 'course', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 5, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23 17:45:31', '', NULL, NULL);
INSERT INTO `gen_table_column` VALUES (210, '18', 'id', '主键', 'bigint', 'java.math.BigInteger', 'id', '1', '1', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', NULL, 1, NULL, NULL, NULL, NULL, NULL, 'mango', '2022-05-23 18:05:38', '', NULL, NULL);
INSERT INTO `gen_table_column` VALUES (211, '18', 'name', '姓名', 'varchar(64)', 'String', 'name', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 2, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23 18:05:38', '', NULL, NULL);
INSERT INTO `gen_table_column` VALUES (212, '18', 'age', '年龄', 'varchar(64)', 'String', 'age', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 3, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23 18:05:38', '', NULL, NULL);
INSERT INTO `gen_table_column` VALUES (213, '18', 'grange', '年级', 'varchar(64)', 'String', 'grange', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 4, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23 18:05:38', '', NULL, NULL);
INSERT INTO `gen_table_column` VALUES (214, '18', 'sushe', '宿舍', 'varchar(64)', 'String', 'sushe', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', 'sys_user_sex', 5, NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23 18:05:38', '', NULL, NULL);
INSERT INTO `gen_table_column` VALUES (256, '17', 'id', '主键', 'bigint(20)', 'java.math.BigInteger', 'id', '1', '1', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', NULL, 1, NULL, NULL, NULL, NULL, NULL, 'mango', '2022-07-05 16:42:19', '', NULL, NULL);
INSERT INTO `gen_table_column` VALUES (257, '17', 'name', '课程名', 'varchar(64)', 'String', 'name', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 2, NULL, NULL, NULL, NULL, NULL, NULL, '2022-07-05 16:42:19', '', NULL, NULL);
INSERT INTO `gen_table_column` VALUES (258, '17', 'teacher', '授课教师', 'varchar(64)', 'String', 'teacher', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 3, NULL, NULL, NULL, NULL, NULL, NULL, '2022-07-05 16:42:19', '', NULL, NULL);
INSERT INTO `gen_table_column` VALUES (452, '21', 'id', '主键', 'Long', 'Long', 'id', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 20, NULL, NULL, NULL, NULL, 'tcy', '2022-07-08 17:07:23', '', NULL, NULL);
INSERT INTO `gen_table_column` VALUES (453, '21', 'account_id', '用户id', 'Long', 'Long', 'accountId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 20, NULL, NULL, NULL, NULL, 'tcy', '2022-07-08 17:07:23', '', NULL, NULL);
INSERT INTO `gen_table_column` VALUES (454, '21', 'api_id', '接口id', 'Long', 'Long', 'apiId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 20, NULL, NULL, NULL, NULL, 'tcy', '2022-07-08 17:07:23', '', NULL, NULL);
INSERT INTO `gen_table_column` VALUES (455, '21', 'exception_type1', '异常类型', 'varchar(64)', 'String', 'exceptionType1', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 4, 64, NULL, NULL, NULL, NULL, 'tcy', '2022-07-08 17:07:23', '', NULL, NULL);
INSERT INTO `gen_table_column` VALUES (456, '21', 'exception_level', '异常层级', 'varchar(32)', 'String', 'exceptionLevel', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 32, NULL, NULL, NULL, NULL, 'tcy', '2022-07-08 17:07:23', '', NULL, NULL);
INSERT INTO `gen_table_column` VALUES (457, '21', 'create_time', '创建时间', 'Date', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 6, NULL, NULL, NULL, NULL, NULL, 'tcy', '2022-07-08 17:07:23', '', NULL, NULL);
INSERT INTO `gen_table_column` VALUES (719, '2', 'notice_id', '公告ID', 'int(12)', 'Long', 'noticeId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 12, NULL, NULL, NULL, NULL, '', '2022-07-13 12:00:59', '', NULL, NULL);
INSERT INTO `gen_table_column` VALUES (720, '2', 'notice_title', '公告标题', 'varchar(6)', 'String', 'noticeTitle', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 6, NULL, NULL, NULL, NULL, '', '2022-07-13 12:00:59', '', NULL, NULL);
INSERT INTO `gen_table_column` VALUES (721, '2', 'notice_type', '公告类型（1通知 2公告）', 'varchar(5)', 'String', 'noticeType', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 3, 5, NULL, NULL, NULL, NULL, '', '2022-07-13 12:00:59', '', NULL, NULL);
INSERT INTO `gen_table_column` VALUES (722, '2', 'notice_content', '公告内容', 'varchar(5)', 'String', 'noticeContent', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'editor', '', 4, 5, NULL, NULL, NULL, NULL, '', '2022-07-13 12:00:59', '', NULL, NULL);
INSERT INTO `gen_table_column` VALUES (723, '2', 'status', '公告状态（0正常 1关闭）', 'varchar(5)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 5, 5, NULL, NULL, NULL, NULL, '', '2022-07-13 12:00:59', '', NULL, NULL);
INSERT INTO `gen_table_column` VALUES (724, '2', 'create_by', '创建者', 'varchar(5)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 6, 5, NULL, NULL, NULL, NULL, '', '2022-07-13 12:00:59', '', NULL, NULL);
INSERT INTO `gen_table_column` VALUES (725, '2', 'create_time', '创建时间', 'date', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 7, NULL, NULL, NULL, NULL, NULL, '', '2022-07-13 12:00:59', '', NULL, NULL);
INSERT INTO `gen_table_column` VALUES (726, '2', 'update_by', '更新者', 'varchar(5)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 8, 5, NULL, NULL, NULL, NULL, '', '2022-07-13 12:00:59', '', NULL, NULL);
INSERT INTO `gen_table_column` VALUES (727, '2', 'update_time', '更新时间', 'date', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 9, NULL, NULL, NULL, NULL, NULL, '', '2022-07-13 12:00:59', '', NULL, NULL);
INSERT INTO `gen_table_column` VALUES (728, '2', 'remark', '备注', 'varchar(5)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 10, 5, NULL, NULL, NULL, NULL, '', '2022-07-13 12:00:59', '', NULL, NULL);
INSERT INTO `gen_table_column` VALUES (729, '2', 'test', '测试', 'varchar(5)', 'String', 'test', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 11, 5, NULL, NULL, NULL, NULL, '', '2022-07-13 12:00:59', '', NULL, NULL);
INSERT INTO `gen_table_column` VALUES (730, '2', 'price3', '价格3', 'decimal(33,3)', 'BigDecimal', 'price3', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 12, 33, 3, NULL, NULL, NULL, '', '2022-07-13 12:00:59', '', NULL, NULL);
INSERT INTO `gen_table_column` VALUES (731, '2', 'price2', '价格2', 'decimal(20,1)', 'BigDecimal', 'price2', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 13, 20, 1, NULL, NULL, NULL, '', '2022-07-13 12:00:59', '', NULL, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '账户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_account
-- ----------------------------
INSERT INTO `sys_account` VALUES (2, 'admin', '$2a$10$H8Qq7rVf32jhq3aBRuSKgeOVIIU7QodA/6iBVPO/HGkMHh278Tb3.', '15838330153', 1, 'sky', 0000, 0000, '系统管理员');
INSERT INTO `sys_account` VALUES (4, 'test', '$2a$10$4vkXfPMNq.PzRw7ihVyqk.z0PcMqh7lFCX1a8FJNolV3r82h0Fowa', '13854515', 1, '345热天', 0000, 0000, '测试');
INSERT INTO `sys_account` VALUES (6, 'work', '$2a$10$TPVbG2kLZgmv0e7Fs7/xKeed0XR/XnIr6jOdtGkHjbclXBoDmAmRO', '', NULL, '业务管理员', 0000, 0000, '业务管理员');
INSERT INTO `sys_account` VALUES (8, 'root', '$2a$10$H8Qq7rVf32jhq3aBRuSKgeOVIIU7QodA/6iBVPO/HGkMHh278Tb3.', '158', NULL, 'root', 0000, 0000, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 88 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '账户角色关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_account_role
-- ----------------------------
INSERT INTO `sys_account_role` VALUES (3, 4, 2, 0, 0, NULL);
INSERT INTO `sys_account_role` VALUES (19, 4, 3, 0, 0, NULL);
INSERT INTO `sys_account_role` VALUES (33, 3, 6, 0, 0, NULL);
INSERT INTO `sys_account_role` VALUES (43, 6, 7, 0, 0, NULL);
INSERT INTO `sys_account_role` VALUES (45, 8, 10, 0, 0, NULL);
INSERT INTO `sys_account_role` VALUES (82, 2, 1, 0, 0, NULL);
INSERT INTO `sys_account_role` VALUES (83, 2, 2, 0, 0, NULL);
INSERT INTO `sys_account_role` VALUES (84, 2, 4, 0, 0, NULL);
INSERT INTO `sys_account_role` VALUES (85, 2, 5, 0, 0, NULL);
INSERT INTO `sys_account_role` VALUES (86, 2, 6, 0, 0, NULL);
INSERT INTO `sys_account_role` VALUES (87, 2, 3, 0, 0, NULL);

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
INSERT INTO `sys_dict_data` VALUES (20, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-03-08 17:36:09', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (21, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2022-03-08 17:36:09', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (22, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-03-08 17:36:09', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (23, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-03-08 17:36:09', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (24, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-03-08 17:36:09', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (25, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-03-08 17:36:09', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (26, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-03-08 17:36:09', '', NULL, '清空操作');

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
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2022-03-08 17:36:09', '', NULL, '操作类型列表');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `log_type` int(2) NULL DEFAULT NULL COMMENT '日志类型',
  `log_content` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志内容',
  `operate_type` int(2) NULL DEFAULT NULL COMMENT '操作类型(增删改查)',
  `username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名称',
  `ip` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ip',
  `work_key` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '业务key',
  `work_value` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '业务value',
  `request_url` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求路径',
  `request_param` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求参数',
  `method` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求java方法',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '日志表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES (1, 0, '系统用户登录', 0, 'root', '127.0.0.1', 'username', 'root', '/system/login/common', '[{\"code\":\"\",\"password\":\"123456\",\"username\":\"root\",\"uuid\":\"23badb955be440ce91cd5aa2c3d2b99d\"}]', 'cn.sky1998.mango.system.controller.LoginController.login', '2022-06-27 16:52:38');
INSERT INTO `sys_log` VALUES (2, 1, '系统用户登录', 0, 'admin', '127.0.0.1', 'username', 'admin', '/system/login/common', '[{\"code\":\"\",\"password\":\"123456\",\"username\":\"admin\",\"uuid\":\"856b3728a913430faf1196034feb4bb2\"}]', 'cn.sky1998.mango.system.controller.LoginController.login', '2022-06-27 17:01:46');
INSERT INTO `sys_log` VALUES (3, 1, '系统用户登录', 0, 'root', '127.0.0.1', 'username', 'root', '/system/login/common', '[{\"code\":\"\",\"password\":\"123456\",\"username\":\"root\",\"uuid\":\"1b26e947300b4e6aaa27385fe5cdc591\"}]', 'cn.sky1998.mango.system.controller.LoginController.login', '2022-06-27 17:01:48');
INSERT INTO `sys_log` VALUES (4, 1, '系统用户登录', 0, 'root', '127.0.0.1', 'username', 'root', '/system/login/common', '[{\"code\":\"\",\"password\":\"123456\",\"username\":\"root\",\"uuid\":\"7eba38f772dc4dec9fa81629ef2f63a4\"}]', 'cn.sky1998.mango.system.controller.LoginController.login', '2022-06-28 11:46:22');
INSERT INTO `sys_log` VALUES (5, 1, '系统用户登录', 0, 'root', '127.0.0.1', 'username', 'root', '/system/login/common', '[{\"code\":\"\",\"password\":\"123456\",\"username\":\"root\",\"uuid\":\"7eba38f772dc4dec9fa81629ef2f63a4\"}]', 'cn.sky1998.mango.system.controller.LoginController.login', '2022-06-28 11:46:24');
INSERT INTO `sys_log` VALUES (6, 1, '系统用户登录', 0, 'root', '127.0.0.1', 'username', 'root', '/system/login/common', '[{\"code\":\"\",\"password\":\"123456\",\"username\":\"root\",\"uuid\":\"\"}]', 'cn.sky1998.mango.system.controller.LoginController.login', '2022-06-28 17:43:28');
INSERT INTO `sys_log` VALUES (7, 1, '系统用户登录', 0, 'root', '127.0.0.1', 'username', 'root', '/system/login/common', '[{\"code\":\"\",\"password\":\"123456\",\"username\":\"root\",\"uuid\":\"\"}]', 'cn.sky1998.mango.system.controller.LoginController.login', '2022-06-28 17:43:30');
INSERT INTO `sys_log` VALUES (8, 1, '系统用户登录', 0, 'root', '127.0.0.1', 'username', 'root', '/system/login/common', '[{\"code\":\"\",\"password\":\"123456\",\"username\":\"root\",\"uuid\":\"\"}]', 'cn.sky1998.mango.system.controller.LoginController.login', '2022-06-29 15:54:43');
INSERT INTO `sys_log` VALUES (9, 1, '系统用户登录', 0, 'root', '127.0.0.1', 'username', 'root', '/system/login/common', '[{\"code\":\"\",\"password\":\"123456\",\"username\":\"root\",\"uuid\":\"\"}]', 'cn.sky1998.mango.system.controller.LoginController.login', '2022-06-29 15:54:43');
INSERT INTO `sys_log` VALUES (10, 1, '系统用户登录', 0, 'root', '127.0.0.1', 'username', 'root', '/system/login/common', '[{\"code\":\"\",\"password\":\"123456\",\"username\":\"root\",\"uuid\":\"\"}]', 'cn.sky1998.mango.system.controller.LoginController.login', '2022-06-29 15:58:10');
INSERT INTO `sys_log` VALUES (11, 1, '系统用户登录', 0, 'root', '127.0.0.1', 'username', 'root', '/system/login/common', '[{\"code\":\"\",\"password\":\"123456\",\"username\":\"root\",\"uuid\":\"\"}]', 'cn.sky1998.mango.system.controller.LoginController.login', '2022-06-29 15:58:10');
INSERT INTO `sys_log` VALUES (12, 1, '系统用户登录', 0, 'root', '127.0.0.1', 'username', 'root', '/system/login/common', '[{\"code\":\"\",\"password\":\"123456\",\"username\":\"root\",\"uuid\":\"\"}]', 'cn.sky1998.mango.system.controller.LoginController.login', '2022-06-29 15:58:10');
INSERT INTO `sys_log` VALUES (13, 1, '系统用户登录', 0, 'admin', '127.0.0.1', 'username', 'admin', '/system/login/common', '[{\"password\":\"123456\",\"username\":\"admin\"}]', 'cn.sky1998.mango.system.controller.LoginController.login', '2022-06-29 18:05:04');
INSERT INTO `sys_log` VALUES (14, 1, '系统用户登录', 0, 'admin', '127.0.0.1', 'username', 'admin', '/system/login/common', '[{\"password\":\"123456\",\"username\":\"admin\"}]', 'cn.sky1998.mango.system.controller.LoginController.login', '2022-06-29 18:13:29');
INSERT INTO `sys_log` VALUES (15, 1, '系统用户登录', 0, 'admin', '127.0.0.1', 'username', 'admin', '/system/login/common', '[{\"password\":\"123456\",\"username\":\"admin\"}]', 'cn.sky1998.mango.system.controller.LoginController.login', '2022-06-29 18:28:25');
INSERT INTO `sys_log` VALUES (16, 1, '系统用户登录', 0, 'admin', '127.0.0.1', 'username', 'admin', '/system/login/common', '[{\"password\":\"123456\",\"username\":\"admin\"}]', 'cn.sky1998.mango.system.controller.LoginController.login', '2022-06-29 18:31:49');
INSERT INTO `sys_log` VALUES (17, 1, '系统用户登录', 0, 'admin', '127.0.0.1', 'username', 'admin', '/system/login/common', '[{\"password\":\"123456\",\"username\":\"admin\"}]', 'cn.sky1998.mango.system.controller.LoginController.login', '2022-06-29 18:32:13');
INSERT INTO `sys_log` VALUES (18, 1, '系统用户登录', 0, 'admin', '127.0.0.1', 'username', 'admin', '/system/login/common', '[{\"password\":\"123456\",\"username\":\"admin\"}]', 'cn.sky1998.mango.system.controller.LoginController.login', '2022-06-29 18:33:42');
INSERT INTO `sys_log` VALUES (19, 1, '系统用户登录', 0, 'admin', '127.0.0.1', 'username', 'admin', '/system/login/common', '[{\"password\":\"123456\",\"username\":\"admin\"}]', 'cn.sky1998.mango.system.controller.LoginController.login', '2022-06-29 18:36:44');
INSERT INTO `sys_log` VALUES (20, 1, '系统用户登录', 0, 'root', '127.0.0.1', 'username', 'root', '/system/login/common', '[{\"code\":\"\",\"password\":\"123456\",\"username\":\"root\",\"uuid\":\"\"}]', 'cn.sky1998.mango.system.controller.LoginController.login', '2022-06-30 08:50:35');
INSERT INTO `sys_log` VALUES (21, 1, '系统用户登录', 0, 'root', '127.0.0.1', 'username', 'root', '/system/login/common', '[{\"code\":\"\",\"password\":\"123456\",\"username\":\"root\",\"uuid\":\"\"}]', 'cn.sky1998.mango.system.controller.LoginController.login', '2022-06-30 08:50:39');
INSERT INTO `sys_log` VALUES (22, 1, '系统用户登录', 0, 'admin', '127.0.0.1', 'username', 'admin', '/system/login/common', '[{\"password\":\"123456\",\"username\":\"admin\"}]', 'cn.sky1998.mango.system.controller.LoginController.login', '2022-06-30 10:59:50');
INSERT INTO `sys_log` VALUES (23, 1, '系统用户登录', 0, 'admin', '127.0.0.1', 'username', 'admin', '/system/login/common', '[{\"password\":\"123456\",\"username\":\"admin\"}]', 'cn.sky1998.mango.system.controller.LoginController.login', '2022-07-01 09:02:22');
INSERT INTO `sys_log` VALUES (24, 1, '系统用户登录', 0, 'admin', '127.0.0.1', 'username', 'admin', '/system/login/common', '[{\"password\":\"123456\",\"username\":\"admin\"}]', 'cn.sky1998.mango.system.controller.LoginController.login', '2022-07-01 09:11:43');
INSERT INTO `sys_log` VALUES (25, 1, '系统用户登录', 0, 'admin', '127.0.0.1', 'username', 'admin', '/system/login/common', '[{\"password\":\"123456\",\"username\":\"admin\"}]', 'cn.sky1998.mango.system.controller.LoginController.login', '2022-07-01 11:28:41');
INSERT INTO `sys_log` VALUES (26, 1, '系统用户登录', 0, 'root', '127.0.0.1', 'username', 'root', '/system/login/common', '[{\"code\":\"\",\"password\":\"123456\",\"username\":\"root\",\"uuid\":\"bda359e1012942fa948f07b587d8e798\"}]', 'cn.sky1998.mango.system.controller.LoginController.login', '2022-07-04 15:39:16');
INSERT INTO `sys_log` VALUES (27, 1, '系统用户登录', 0, 'root', '127.0.0.1', 'username', 'root', '/system/login/common', '[{\"code\":\"\",\"password\":\"123456\",\"username\":\"root\",\"uuid\":\"bda359e1012942fa948f07b587d8e798\"}]', 'cn.sky1998.mango.system.controller.LoginController.login', '2022-07-04 15:39:17');
INSERT INTO `sys_log` VALUES (28, 1, '系统用户登录', 0, 'root', '127.0.0.1', 'username', 'root', '/system/login/common', '[{\"code\":\"\",\"password\":\"123456\",\"username\":\"root\",\"uuid\":\"\"}]', 'cn.sky1998.mango.system.controller.LoginController.login', '2022-07-05 16:23:13');
INSERT INTO `sys_log` VALUES (29, 1, '系统用户登录', 0, 'root', '127.0.0.1', 'username', 'root', '/system/login/common', '[{\"code\":\"\",\"password\":\"123456\",\"username\":\"root\",\"uuid\":\"\"}]', 'cn.sky1998.mango.system.controller.LoginController.login', '2022-07-05 16:23:14');
INSERT INTO `sys_log` VALUES (30, 1, '系统用户登录', 0, 'root', '127.0.0.1', 'username', 'root', '/system/login/common', '[{\"code\":\"\",\"password\":\"123456\",\"username\":\"root\",\"uuid\":\"89ef3a098f054b6f99a6c9e01ed8a731\"}]', 'cn.sky1998.mango.system.controller.LoginController.login', '2022-07-05 16:41:17');
INSERT INTO `sys_log` VALUES (31, 1, '系统用户登录', 0, 'root', '127.0.0.1', 'username', 'root', '/system/login/common', '[{\"code\":\"\",\"password\":\"123456\",\"username\":\"root\",\"uuid\":\"89ef3a098f054b6f99a6c9e01ed8a731\"}]', 'cn.sky1998.mango.system.controller.LoginController.login', '2022-07-05 16:41:18');
INSERT INTO `sys_log` VALUES (32, 1, '系统用户登录', 0, 'root', '127.0.0.1', 'username', 'root', '/system/login/common', '[{\"code\":\"\",\"password\":\"123456\",\"username\":\"root\",\"uuid\":\"\"}]', 'cn.sky1998.mango.system.controller.LoginController.login', '2022-07-07 14:40:29');
INSERT INTO `sys_log` VALUES (33, 1, '系统用户登录', 0, 'root', '127.0.0.1', 'username', 'root', '/system/login/common', '[{\"code\":\"\",\"password\":\"123456\",\"username\":\"root\",\"uuid\":\"\"}]', 'cn.sky1998.mango.system.controller.LoginController.login', '2022-07-07 14:40:29');
INSERT INTO `sys_log` VALUES (34, 1, '系统用户登录', 0, 'root', '127.0.0.1', 'username', 'root', '/system/login/common', '[{\"code\":\"\",\"password\":\"123456\",\"username\":\"root\",\"uuid\":\"eddbda6b1b10412dbf25eeee8d46f64e\"}]', 'cn.sky1998.mango.system.controller.LoginController.login', '2022-07-07 14:55:30');
INSERT INTO `sys_log` VALUES (35, 1, '系统用户登录', 0, 'root', '127.0.0.1', 'username', 'root', '/system/login/common', '[{\"code\":\"\",\"password\":\"123456\",\"username\":\"root\",\"uuid\":\"eddbda6b1b10412dbf25eeee8d46f64e\"}]', 'cn.sky1998.mango.system.controller.LoginController.login', '2022-07-07 14:55:34');
INSERT INTO `sys_log` VALUES (36, 1, '系统用户登录', 0, 'root', '127.0.0.1', 'username', 'root', '/system/login/common', '[{\"code\":\"\",\"password\":\"123456\",\"username\":\"root\",\"uuid\":\"7c7ed56b77a741a9b567ceb1d6fadb43\"}]', 'cn.sky1998.mango.system.controller.LoginController.login', '2022-07-08 15:38:41');
INSERT INTO `sys_log` VALUES (37, 1, '系统用户登录', 0, 'root', '127.0.0.1', 'username', 'root', '/system/login/common', '[{\"code\":\"\",\"password\":\"123456\",\"username\":\"root\",\"uuid\":\"7c7ed56b77a741a9b567ceb1d6fadb43\"}]', 'cn.sky1998.mango.system.controller.LoginController.login', '2022-07-08 15:38:42');
INSERT INTO `sys_log` VALUES (38, 1, '系统用户登录', 0, 'root', '127.0.0.1', 'username', 'root', '/system/login/common', '[{\"code\":\"\",\"password\":\"123456\",\"username\":\"root\",\"uuid\":\"bf71a69d5a6a41bdadac17050c49f799\"}]', 'cn.sky1998.mango.system.controller.LoginController.login', '2022-07-11 14:58:08');
INSERT INTO `sys_log` VALUES (39, 1, '系统用户登录', 0, 'root', '127.0.0.1', 'username', 'root', '/system/login/common', '[{\"code\":\"\",\"password\":\"123456\",\"username\":\"root\",\"uuid\":\"bf71a69d5a6a41bdadac17050c49f799\"}]', 'cn.sky1998.mango.system.controller.LoginController.login', '2022-07-11 14:58:09');
INSERT INTO `sys_log` VALUES (40, 1, '系统用户登录', 0, 'root', '127.0.0.1', 'username', 'root', '/system/login/common', '[{\"code\":\"\",\"password\":\"123456\",\"username\":\"root\",\"uuid\":\"\"}]', 'cn.sky1998.mango.system.controller.LoginController.login', '2022-07-12 10:33:12');
INSERT INTO `sys_log` VALUES (41, 1, '系统用户登录', 0, 'root', '127.0.0.1', 'username', 'root', '/system/login/common', '[{\"code\":\"\",\"password\":\"123456\",\"username\":\"root\",\"uuid\":\"\"}]', 'cn.sky1998.mango.system.controller.LoginController.login', '2022-07-12 10:33:13');
INSERT INTO `sys_log` VALUES (42, 1, '系统用户登录', 0, 'admin', '127.0.0.1', 'username', 'admin', '/system/login/common', '[{\"code\":\"\",\"password\":\"123456\",\"username\":\"admin\",\"uuid\":\"3369fd383b2749abbf8be88e1e9cfd71\"}]', 'cn.sky1998.mango.system.controller.LoginController.login', '2022-07-13 15:04:40');

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
  `visible` tinyint(4) NULL DEFAULT 0 COMMENT '菜单状态（0显示 1隐藏）',
  `status` tinyint(4) NULL DEFAULT 0 COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '用户管理', 4, 1, '/pages/user', 'system/user/user', NULL, 1, 0, 'C', 0, 0, NULL, 'el-icon-user', '', '2022-04-24 15:51:49', '', NULL, '用户管理');
INSERT INTO `sys_menu` VALUES (2, '角色管理', 4, 2, '/pages/role', 'system/role/role', NULL, 1, 0, 'C', 0, 0, NULL, 'el-icon-s-check', '', '2022-04-24 15:51:55', '', NULL, '角色管理');
INSERT INTO `sys_menu` VALUES (3, '菜单管理', 4, 3, '/pages/menu', 'system/menu/index', NULL, 1, 0, 'C', 0, 0, '', 'el-icon-menu', '', '2022-04-24 15:52:00', '', '2022-04-24 16:21:08', '菜单管理');
INSERT INTO `sys_menu` VALUES (4, '系统管理', 0, 1, '', '', NULL, 1, 0, 'M', 0, 0, NULL, 'el-icon-menu', '', '2022-04-24 15:52:01', '', NULL, '系统管理');
INSERT INTO `sys_menu` VALUES (5, '系统工具', 0, 2, '', '', NULL, 1, 0, 'M', 0, 0, NULL, 'el-icon-s-tools', '', '2022-04-24 15:52:02', '', NULL, '系统工具');
INSERT INTO `sys_menu` VALUES (6, '代码生成', 5, 1, '/pages/createCode', 'system/gen/index', NULL, 1, 0, 'C', 0, 0, NULL, 'el-icon-notebook-2', '', '2022-04-24 15:52:04', '', NULL, '代码生成');
INSERT INTO `sys_menu` VALUES (7, '业务管理', 0, 3, '', '', NULL, 1, 0, 'M', 0, 0, NULL, 'el-icon-notebook-2', '', '2022-04-24 15:52:05', '', NULL, '业务管理');
INSERT INTO `sys_menu` VALUES (12, '菜单测试', 4, 1, '/', NULL, NULL, 1, 0, 'C', 0, 0, NULL, '404', 'admin', '2022-04-24 16:15:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (13, '用户增加', 1, 1, '', NULL, NULL, 1, 0, 'F', 0, 0, 'system:user:add', '#', '', NULL, '', NULL, '');
INSERT INTO `sys_menu` VALUES (14, '用户删除', 1, 2, '', NULL, NULL, 1, 0, 'F', 0, 0, 'system:user:remove', '#', '', NULL, '', NULL, '');
INSERT INTO `sys_menu` VALUES (15, '用户修改', 1, 1, '', NULL, NULL, 1, 0, 'F', 0, 0, 'system:user:update', '#', '', NULL, '', NULL, '');
INSERT INTO `sys_menu` VALUES (16, '用户查询', 1, 1, '', NULL, NULL, 1, 0, 'F', 0, 0, 'system:user:list', '#', '', NULL, '', NULL, '');
INSERT INTO `sys_menu` VALUES (17, '日志管理', 4, 5, '/pages/sysLog', 'system/log/index', NULL, 1, 0, 'C', 0, 0, NULL, 'el-icon-notebook-2', '', NULL, '', NULL, '');
INSERT INTO `sys_menu` VALUES (18, '字典管理', 4, 4, '/pages/dict', 'system/dict/index', NULL, 1, 0, 'C', 0, 0, '', 'el-icon-s-tools', '', NULL, '', NULL, '');
INSERT INTO `sys_menu` VALUES (19, '课程管理', 7, 0, '/pages/workCourse', 'work/course/index', NULL, 1, 0, 'C', 0, 0, NULL, 'el-icon-notebook-2', '', NULL, '', NULL, '');
INSERT INTO `sys_menu` VALUES (20, '学生成绩管理', 7, 0, '/pages/workStudent', 'work/student/index', NULL, 1, 0, 'C', 0, 0, NULL, 'el-icon-notebook-2', '', NULL, '', NULL, '');
INSERT INTO `sys_menu` VALUES (26, '通知公告功能名', 7, 0, '/pages/SysNotice', 'work/notice/index', NULL, 1, 0, 'C', 0, 0, NULL, 'el-icon-notebook-2', '', NULL, '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(12) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公告标题',
  `notice_type` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公告内容',
  `status` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` date NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` date NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `test` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '测试',
  `price3` decimal(33, 3) NULL DEFAULT NULL COMMENT '价格3',
  `price2` decimal(20, 1) NULL DEFAULT NULL COMMENT '价格2',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知公告表' ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, 'admin', '系统管理员', 1, 0000, 0000, '系统管理员');
INSERT INTO `sys_role` VALUES (2, 'register', '注册用户', 2, 0000, 0000, '公众号注册用户');
INSERT INTO `sys_role` VALUES (3, 'visitor', '游客', 3, 0000, 0000, '游客登录');
INSERT INTO `sys_role` VALUES (4, 'vip', '黄金用户', 5, 0000, 0000, '赞助者');
INSERT INTO `sys_role` VALUES (5, 'test1', '测试1', 6, 0000, 0000, '备注');
INSERT INTO `sys_role` VALUES (6, 'runner', '运营', 0, 0000, 0000, NULL);
INSERT INTO `sys_role` VALUES (7, 'work', '业务', 0, 0000, 0000, NULL);
INSERT INTO `sys_role` VALUES (8, 'test2', 'test2', 3, 0000, 0000, '');
INSERT INTO `sys_role` VALUES (10, 'root', '超管', 10, 0000, 0000, '超管');

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
) ENGINE = InnoDB AUTO_INCREMENT = 254 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色菜单关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (103, 8, 4, 0000, 0, NULL);
INSERT INTO `sys_role_menu` VALUES (104, 8, 1, 0000, 0, NULL);
INSERT INTO `sys_role_menu` VALUES (105, 8, 12, 0000, 0, NULL);
INSERT INTO `sys_role_menu` VALUES (106, 8, 2, 0000, 0, NULL);
INSERT INTO `sys_role_menu` VALUES (107, 8, 3, 0000, 0, NULL);
INSERT INTO `sys_role_menu` VALUES (108, 8, 5, 0000, 0, NULL);
INSERT INTO `sys_role_menu` VALUES (109, 8, 6, 0000, 0, NULL);
INSERT INTO `sys_role_menu` VALUES (110, 8, 7, 0000, 0, NULL);
INSERT INTO `sys_role_menu` VALUES (111, 8, 11, 0000, 0, NULL);
INSERT INTO `sys_role_menu` VALUES (112, 8, 13, 0000, 0, NULL);
INSERT INTO `sys_role_menu` VALUES (121, 7, 7, 0000, 0, NULL);
INSERT INTO `sys_role_menu` VALUES (122, 7, 11, 0000, 0, NULL);
INSERT INTO `sys_role_menu` VALUES (123, 7, 13, 0000, 0, NULL);
INSERT INTO `sys_role_menu` VALUES (124, 7, 17, 0000, 0, NULL);
INSERT INTO `sys_role_menu` VALUES (125, 7, 18, 0000, 0, NULL);
INSERT INTO `sys_role_menu` VALUES (168, 6, 4, 0000, 0, NULL);
INSERT INTO `sys_role_menu` VALUES (169, 6, 1, 0000, 0, NULL);
INSERT INTO `sys_role_menu` VALUES (170, 6, 13, 0000, 0, NULL);
INSERT INTO `sys_role_menu` VALUES (171, 6, 7, 0000, 0, NULL);
INSERT INTO `sys_role_menu` VALUES (186, 2, 4, 0000, 0, NULL);
INSERT INTO `sys_role_menu` VALUES (187, 2, 1, 0000, 0, NULL);
INSERT INTO `sys_role_menu` VALUES (218, 1, 4, 0000, 0, NULL);
INSERT INTO `sys_role_menu` VALUES (219, 1, 1, 0000, 0, NULL);
INSERT INTO `sys_role_menu` VALUES (220, 1, 13, 0000, 0, NULL);
INSERT INTO `sys_role_menu` VALUES (221, 1, 2, 0000, 0, NULL);
INSERT INTO `sys_role_menu` VALUES (222, 1, 3, 0000, 0, NULL);
INSERT INTO `sys_role_menu` VALUES (223, 1, 18, 0000, 0, NULL);
INSERT INTO `sys_role_menu` VALUES (224, 1, 17, 0000, 0, NULL);
INSERT INTO `sys_role_menu` VALUES (225, 1, 7, 0000, 0, NULL);
INSERT INTO `sys_role_menu` VALUES (226, 1, 19, 0000, 0, NULL);
INSERT INTO `sys_role_menu` VALUES (227, 10, 4, 0000, 0, NULL);
INSERT INTO `sys_role_menu` VALUES (228, 10, 1, 0000, 0, NULL);
INSERT INTO `sys_role_menu` VALUES (229, 10, 13, 0000, 0, NULL);
INSERT INTO `sys_role_menu` VALUES (230, 10, 15, 0000, 0, NULL);
INSERT INTO `sys_role_menu` VALUES (231, 10, 14, 0000, 0, NULL);
INSERT INTO `sys_role_menu` VALUES (232, 10, 2, 0000, 0, NULL);
INSERT INTO `sys_role_menu` VALUES (233, 10, 3, 0000, 0, NULL);
INSERT INTO `sys_role_menu` VALUES (234, 10, 18, 0000, 0, NULL);
INSERT INTO `sys_role_menu` VALUES (235, 10, 17, 0000, 0, NULL);
INSERT INTO `sys_role_menu` VALUES (236, 10, 5, 0000, 0, NULL);
INSERT INTO `sys_role_menu` VALUES (237, 10, 6, 0000, 0, NULL);
INSERT INTO `sys_role_menu` VALUES (238, 10, 7, 0000, 0, NULL);
INSERT INTO `sys_role_menu` VALUES (239, 10, 19, 0000, 0, NULL);
INSERT INTO `sys_role_menu` VALUES (240, 1, 20, 0000, 0, NULL);
INSERT INTO `sys_role_menu` VALUES (246, 1, 26, 0000, 0, NULL);

-- ----------------------------
-- Table structure for work_course
-- ----------------------------
DROP TABLE IF EXISTS `work_course`;
CREATE TABLE `work_course`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程名',
  `teacher` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '授课教师',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '课程表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of work_course
-- ----------------------------
INSERT INTO `work_course` VALUES (3, '语文', '老王');
INSERT INTO `work_course` VALUES (4, '数学', '老李');

-- ----------------------------
-- Table structure for work_student
-- ----------------------------
DROP TABLE IF EXISTS `work_student`;
CREATE TABLE `work_student`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学号',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `num` int(11) NULL DEFAULT NULL COMMENT '成绩',
  `course` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '学生成绩' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of work_student
-- ----------------------------
INSERT INTO `work_student` VALUES (8, '001', '语文', 100, '3');
INSERT INTO `work_student` VALUES (9, '002', '语文', 99, '3');
INSERT INTO `work_student` VALUES (10, '003', '啦啦', 98, '3');
INSERT INTO `work_student` VALUES (11, '001', '老王', 102, '4');

SET FOREIGN_KEY_CHECKS = 1;
