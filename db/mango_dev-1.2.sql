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

 Date: 19/07/2022 18:28:08
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
                                `enable` tinyint(4) UNSIGNED ZEROFILL NULL DEFAULT 0001 COMMENT '可用状态',
                                `del` tinyint(4) UNSIGNED ZEROFILL NULL DEFAULT 0001 COMMENT '删除标记',
                                `remark` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
                                PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '账户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_account
-- ----------------------------
INSERT INTO `sys_account` VALUES (2, 'admin', '$2a$10$H8Qq7rVf32jhq3aBRuSKgeOVIIU7QodA/6iBVPO/HGkMHh278Tb3.', '15838330153', 1, 'sky', 0001, 0001, '系统管理员');
INSERT INTO `sys_account` VALUES (4, 'test', '$2a$10$4vkXfPMNq.PzRw7ihVyqk.z0PcMqh7lFCX1a8FJNolV3r82h0Fowa', '13854515', 1, '345热天', 0001, 0001, '测试');
INSERT INTO `sys_account` VALUES (6, 'work', '$2a$10$TPVbG2kLZgmv0e7Fs7/xKeed0XR/XnIr6jOdtGkHjbclXBoDmAmRO', '', NULL, '业务管理员', 0001, 0001, '业务管理员');
INSERT INTO `sys_account` VALUES (8, 'root', '$2a$10$H8Qq7rVf32jhq3aBRuSKgeOVIIU7QodA/6iBVPO/HGkMHh278Tb3.', '158', NULL, 'root', 0001, 0001, NULL);

-- ----------------------------
-- Table structure for sys_account_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_account_role`;
CREATE TABLE `sys_account_role`  (
                                     `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
                                     `account_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '账户id',
                                     `role_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '角色id',
                                     `eable` tinyint(4) UNSIGNED NULL DEFAULT 1 COMMENT '可用状态',
                                     `del` tinyint(4) UNSIGNED NULL DEFAULT 1 COMMENT '删除标记',
                                     `remark` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
                                     PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 88 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '账户角色关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_account_role
-- ----------------------------
INSERT INTO `sys_account_role` VALUES (3, 4, 2, 1, 1, NULL);
INSERT INTO `sys_account_role` VALUES (19, 4, 3, 1, 1, NULL);
INSERT INTO `sys_account_role` VALUES (33, 3, 6, 1, 1, NULL);
INSERT INTO `sys_account_role` VALUES (43, 6, 7, 1, 1, NULL);
INSERT INTO `sys_account_role` VALUES (45, 8, 10, 1, 1, NULL);
INSERT INTO `sys_account_role` VALUES (82, 2, 1, 1, 1, NULL);
INSERT INTO `sys_account_role` VALUES (83, 2, 2, 1, 1, NULL);
INSERT INTO `sys_account_role` VALUES (84, 2, 4, 1, 1, NULL);
INSERT INTO `sys_account_role` VALUES (85, 2, 5, 1, 1, NULL);
INSERT INTO `sys_account_role` VALUES (86, 2, 6, 1, 1, NULL);
INSERT INTO `sys_account_role` VALUES (87, 2, 3, 1, 1, NULL);

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
                                  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '状态（1正常 0停用）',
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
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '1', 'admin', '2022-03-08 17:36:09', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '1', 'admin', '2022-03-08 17:36:09', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '1', 'admin', '2022-03-08 17:36:09', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '1', 'admin', '2022-03-08 17:36:09', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '1', 'admin', '2022-03-08 17:36:09', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '1', 'admin', '2022-03-08 17:36:09', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '1', 'admin', '2022-03-08 17:36:09', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '1', 'admin', '2022-03-08 17:36:09', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '1', 'admin', '2022-03-08 17:36:09', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '1', 'admin', '2022-03-08 17:36:09', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '1', 'admin', '2022-03-08 17:36:09', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '1', 'admin', '2022-03-08 17:36:09', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '1', 'admin', '2022-03-08 17:36:09', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (20, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '1', 'admin', '2022-03-08 17:36:09', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (21, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '1', 'admin', '2022-03-08 17:36:09', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (22, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '1', 'admin', '2022-03-08 17:36:09', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (23, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '1', 'admin', '2022-03-08 17:36:09', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (24, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '1', 'admin', '2022-03-08 17:36:09', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (25, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '1', 'admin', '2022-03-08 17:36:09', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (26, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '1', 'admin', '2022-03-08 17:36:09', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (27, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '1', 'admin', '2022-03-08 17:36:09', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (28, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '1', 'admin', '2022-03-08 17:36:09', '', NULL, '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
                                  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
                                  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典名称',
                                  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
                                  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '状态（1正常 0停用）',
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
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '1', 'admin', '2022-03-08 17:36:09', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '1', 'admin', '2022-03-08 17:36:09', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '1', 'admin', '2022-03-08 17:36:09', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '1', 'admin', '2022-03-08 17:36:09', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '1', 'admin', '2022-03-08 17:36:09', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '1', 'admin', '2022-03-08 17:36:09', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '1', 'admin', '2022-07-19 10:50:19', '', NULL, '系统状态');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
                            `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
                            `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
                            `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
                            `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
                            `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
                            `misfire_policy` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
                            `concurrent` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '是否并发执行（1允许 0禁止）',
                            `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '状态（1正常 0暂停）',
                            `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
                            `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                            `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
                            `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
                            `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注信息',
                            PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'SYSTEM', 'mangoTask.mangoNoParams', '0/10 * * * * ?', '3', '1', '0', 'admin', '2022-03-08 17:36:13', 'root', '2022-07-19 18:09:07', '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'mangoTask.mangoParams(\'ry\')', '0/15 * * * * ?', '3', '1', '0', 'admin', '2022-03-08 17:36:13', 'root', '2022-07-19 18:09:11', '');
INSERT INTO `sys_job` VALUES (4, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '* 0/3 * * * ?', '3', '1', '0', 'root', '2022-07-19 11:10:25', 'root', '2022-07-19 18:09:15', '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
                                `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
                                `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
                                `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
                                `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
                                `job_message` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志信息',
                                `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '执行状态（1正常 0失败）',
                                `exception_info` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '异常信息',
                                `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                                PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 497 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------
INSERT INTO `sys_job_log` VALUES (1, '系统默认（无参）', 'SYSTEM', 'ryTask.ryNoParams', '系统默认（无参） 总共耗时：0毫秒', '1', '', '2022-07-19 10:58:56');
INSERT INTO `sys_job_log` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '系统默认（有参） 总共耗时：0毫秒', '1', '', '2022-07-19 10:59:08');
INSERT INTO `sys_job_log` VALUES (4, '多餐', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '多餐 总共耗时：1毫秒', '1', '', '2022-07-19 11:12:00');
INSERT INTO `sys_job_log` VALUES (5, '多餐', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '多餐 总共耗时：0毫秒', '1', '', '2022-07-19 11:12:01');
INSERT INTO `sys_job_log` VALUES (6, '多餐', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '多餐 总共耗时：0毫秒', '1', '', '2022-07-19 11:12:02');
INSERT INTO `sys_job_log` VALUES (7, '多餐', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '多餐 总共耗时：0毫秒', '1', '', '2022-07-19 11:12:03');
INSERT INTO `sys_job_log` VALUES (8, '多餐', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '多餐 总共耗时：1毫秒', '1', '', '2022-07-19 11:12:04');
INSERT INTO `sys_job_log` VALUES (9, '多餐', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '多餐 总共耗时：1毫秒', '1', '', '2022-07-19 11:12:05');
INSERT INTO `sys_job_log` VALUES (10, '多餐', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '多餐 总共耗时：0毫秒', '1', '', '2022-07-19 11:12:06');
INSERT INTO `sys_job_log` VALUES (11, '多餐', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '多餐 总共耗时：1毫秒', '1', '', '2022-07-19 11:12:07');
INSERT INTO `sys_job_log` VALUES (12, '多餐', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '多餐 总共耗时：0毫秒', '1', '', '2022-07-19 11:12:08');
INSERT INTO `sys_job_log` VALUES (13, '多餐', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '多餐 总共耗时：0毫秒', '1', '', '2022-07-19 11:12:09');
INSERT INTO `sys_job_log` VALUES (14, '多餐', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '多餐 总共耗时：0毫秒', '1', '', '2022-07-19 11:12:10');
INSERT INTO `sys_job_log` VALUES (15, '多餐', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '多餐 总共耗时：1毫秒', '1', '', '2022-07-19 11:12:11');
INSERT INTO `sys_job_log` VALUES (16, '多餐', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '多餐 总共耗时：0毫秒', '1', '', '2022-07-19 11:12:12');
INSERT INTO `sys_job_log` VALUES (17, '多餐', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '多餐 总共耗时：0毫秒', '1', '', '2022-07-19 11:12:13');
INSERT INTO `sys_job_log` VALUES (18, '多餐', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '多餐 总共耗时：1毫秒', '1', '', '2022-07-19 11:12:14');
INSERT INTO `sys_job_log` VALUES (19, '多餐', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '多餐 总共耗时：1毫秒', '1', '', '2022-07-19 11:12:15');
INSERT INTO `sys_job_log` VALUES (20, '多餐', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '多餐 总共耗时：0毫秒', '1', '', '2022-07-19 11:12:16');
INSERT INTO `sys_job_log` VALUES (21, '多餐', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '多餐 总共耗时：0毫秒', '1', '', '2022-07-19 11:12:17');
INSERT INTO `sys_job_log` VALUES (22, '多餐', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '多餐 总共耗时：0毫秒', '1', '', '2022-07-19 11:12:18');
INSERT INTO `sys_job_log` VALUES (23, '多餐', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '多餐 总共耗时：0毫秒', '1', '', '2022-07-19 11:12:19');
INSERT INTO `sys_job_log` VALUES (24, '多餐', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '多餐 总共耗时：0毫秒', '1', '', '2022-07-19 11:12:20');
INSERT INTO `sys_job_log` VALUES (25, '多餐', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '多餐 总共耗时：1毫秒', '1', '', '2022-07-19 11:12:21');
INSERT INTO `sys_job_log` VALUES (26, '多餐', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '多餐 总共耗时：0毫秒', '1', '', '2022-07-19 11:12:22');
INSERT INTO `sys_job_log` VALUES (27, '多餐', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '多餐 总共耗时：0毫秒', '1', '', '2022-07-19 11:12:23');
INSERT INTO `sys_job_log` VALUES (28, '多餐', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '多餐 总共耗时：0毫秒', '1', '', '2022-07-19 11:12:24');
INSERT INTO `sys_job_log` VALUES (29, '多餐', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '多餐 总共耗时：0毫秒', '1', '', '2022-07-19 11:12:25');
INSERT INTO `sys_job_log` VALUES (30, '多餐', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '多餐 总共耗时：2毫秒', '1', '', '2022-07-19 11:12:26');
INSERT INTO `sys_job_log` VALUES (31, '多餐', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '多餐 总共耗时：0毫秒', '1', '', '2022-07-19 11:12:27');
INSERT INTO `sys_job_log` VALUES (32, '多餐', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '多餐 总共耗时：0毫秒', '1', '', '2022-07-19 11:12:28');
INSERT INTO `sys_job_log` VALUES (33, '多餐', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '多餐 总共耗时：0毫秒', '1', '', '2022-07-19 11:12:29');
INSERT INTO `sys_job_log` VALUES (34, '多餐', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '多餐 总共耗时：0毫秒', '1', '', '2022-07-19 11:12:30');
INSERT INTO `sys_job_log` VALUES (35, '多餐', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '多餐 总共耗时：1毫秒', '1', '', '2022-07-19 11:12:31');
INSERT INTO `sys_job_log` VALUES (36, '多餐', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '多餐 总共耗时：1毫秒', '1', '', '2022-07-19 11:12:32');
INSERT INTO `sys_job_log` VALUES (37, '多餐', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '多餐 总共耗时：1毫秒', '1', '', '2022-07-19 11:12:33');
INSERT INTO `sys_job_log` VALUES (38, '多餐', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '多餐 总共耗时：1毫秒', '1', '', '2022-07-19 11:12:34');
INSERT INTO `sys_job_log` VALUES (39, '多餐', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '多餐 总共耗时：1毫秒', '1', '', '2022-07-19 11:12:35');
INSERT INTO `sys_job_log` VALUES (40, '多餐', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '多餐 总共耗时：0毫秒', '1', '', '2022-07-19 11:12:36');
INSERT INTO `sys_job_log` VALUES (41, '多餐', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '多餐 总共耗时：0毫秒', '1', '', '2022-07-19 11:12:37');
INSERT INTO `sys_job_log` VALUES (42, '多餐', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '多餐 总共耗时：0毫秒', '1', '', '2022-07-19 11:12:38');
INSERT INTO `sys_job_log` VALUES (43, '多餐', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '多餐 总共耗时：0毫秒', '1', '', '2022-07-19 11:12:39');
INSERT INTO `sys_job_log` VALUES (44, '多餐', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '多餐 总共耗时：0毫秒', '1', '', '2022-07-19 11:12:40');
INSERT INTO `sys_job_log` VALUES (45, '多餐', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '多餐 总共耗时：1毫秒', '1', '', '2022-07-19 11:12:41');
INSERT INTO `sys_job_log` VALUES (46, '多餐', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '多餐 总共耗时：0毫秒', '1', '', '2022-07-19 11:12:42');
INSERT INTO `sys_job_log` VALUES (47, '多餐', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '多餐 总共耗时：1毫秒', '1', '', '2022-07-19 11:12:43');
INSERT INTO `sys_job_log` VALUES (48, '系统默认（无参）', 'SYSTEM', 'mangoTask.mangoNoParams', '系统默认（无参） 总共耗时：25毫秒', '0', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'mangoTask\' available\r\n	at org.springframework.beans.factory.support.DefaultListableBeanFactory.getBeanDefinition(DefaultListableBeanFactory.java:863)\r\n	at org.springframework.beans.factory.support.AbstractBeanFactory.getMergedLocalBeanDefinition(AbstractBeanFactory.java:1344)\r\n	at org.springframework.beans.factory.support.AbstractBeanFactory.doGetBean(AbstractBeanFactory.java:309)\r\n	at org.springframework.beans.factory.support.AbstractBeanFactory.doGetBean(AbstractBeanFactory.java:283)\r\n	at org.springframework.beans.factory.support.AbstractBeanFactory.getBean(AbstractBeanFactory.java:208)\r\n	at cn.sky1998.mango.framework.utils.SpringUtils.getBean(SpringUtils.java:63)\r\n	at cn.sky1998.mango.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at cn.sky1998.mango.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at cn.sky1998.mango.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:44)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\n', '2022-07-19 11:31:48');
INSERT INTO `sys_job_log` VALUES (49, '系统默认（无参）', 'SYSTEM', 'mongoTask.mangoNoParams', '系统默认（无参） 总共耗时：1毫秒', '0', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'mongoTask\' available\r\n	at org.springframework.beans.factory.support.DefaultListableBeanFactory.getBeanDefinition(DefaultListableBeanFactory.java:863)\r\n	at org.springframework.beans.factory.support.AbstractBeanFactory.getMergedLocalBeanDefinition(AbstractBeanFactory.java:1344)\r\n	at org.springframework.beans.factory.support.AbstractBeanFactory.doGetBean(AbstractBeanFactory.java:309)\r\n	at org.springframework.beans.factory.support.AbstractBeanFactory.doGetBean(AbstractBeanFactory.java:283)\r\n	at org.springframework.beans.factory.support.AbstractBeanFactory.getBean(AbstractBeanFactory.java:208)\r\n	at cn.sky1998.mango.framework.utils.SpringUtils.getBean(SpringUtils.java:63)\r\n	at cn.sky1998.mango.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at cn.sky1998.mango.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at cn.sky1998.mango.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:44)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\n', '2022-07-19 11:32:10');
INSERT INTO `sys_job_log` VALUES (50, '系统默认（无参）', 'SYSTEM', 'mongoTask.mangoNoParams', '系统默认（无参） 总共耗时：1毫秒', '0', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'mongoTask\' available\r\n	at org.springframework.beans.factory.support.DefaultListableBeanFactory.getBeanDefinition(DefaultListableBeanFactory.java:863)\r\n	at org.springframework.beans.factory.support.AbstractBeanFactory.getMergedLocalBeanDefinition(AbstractBeanFactory.java:1344)\r\n	at org.springframework.beans.factory.support.AbstractBeanFactory.doGetBean(AbstractBeanFactory.java:309)\r\n	at org.springframework.beans.factory.support.AbstractBeanFactory.doGetBean(AbstractBeanFactory.java:283)\r\n	at org.springframework.beans.factory.support.AbstractBeanFactory.getBean(AbstractBeanFactory.java:208)\r\n	at cn.sky1998.mango.framework.utils.SpringUtils.getBean(SpringUtils.java:63)\r\n	at cn.sky1998.mango.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at cn.sky1998.mango.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at cn.sky1998.mango.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:44)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\n', '2022-07-19 11:32:35');
INSERT INTO `sys_job_log` VALUES (51, '系统默认（无参）', 'SYSTEM', 'mangoTask.mangoNoParams', '系统默认（无参） 总共耗时：1毫秒', '0', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'mangoTask\' available\r\n	at org.springframework.beans.factory.support.DefaultListableBeanFactory.getBeanDefinition(DefaultListableBeanFactory.java:863)\r\n	at org.springframework.beans.factory.support.AbstractBeanFactory.getMergedLocalBeanDefinition(AbstractBeanFactory.java:1344)\r\n	at org.springframework.beans.factory.support.AbstractBeanFactory.doGetBean(AbstractBeanFactory.java:309)\r\n	at org.springframework.beans.factory.support.AbstractBeanFactory.doGetBean(AbstractBeanFactory.java:283)\r\n	at org.springframework.beans.factory.support.AbstractBeanFactory.getBean(AbstractBeanFactory.java:208)\r\n	at cn.sky1998.mango.framework.utils.SpringUtils.getBean(SpringUtils.java:63)\r\n	at cn.sky1998.mango.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at cn.sky1998.mango.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at cn.sky1998.mango.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:44)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\n', '2022-07-19 11:33:03');
INSERT INTO `sys_job_log` VALUES (52, '系统默认（无参）', 'SYSTEM', 'MangoTask.mangoNoParams', '系统默认（无参） 总共耗时：1毫秒', '0', 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'MangoTask\' available\r\n	at org.springframework.beans.factory.support.DefaultListableBeanFactory.getBeanDefinition(DefaultListableBeanFactory.java:863)\r\n	at org.springframework.beans.factory.support.AbstractBeanFactory.getMergedLocalBeanDefinition(AbstractBeanFactory.java:1344)\r\n	at org.springframework.beans.factory.support.AbstractBeanFactory.doGetBean(AbstractBeanFactory.java:309)\r\n	at org.springframework.beans.factory.support.AbstractBeanFactory.doGetBean(AbstractBeanFactory.java:283)\r\n	at org.springframework.beans.factory.support.AbstractBeanFactory.getBean(AbstractBeanFactory.java:208)\r\n	at cn.sky1998.mango.framework.utils.SpringUtils.getBean(SpringUtils.java:63)\r\n	at cn.sky1998.mango.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at cn.sky1998.mango.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at cn.sky1998.mango.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:44)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\n', '2022-07-19 11:33:25');
INSERT INTO `sys_job_log` VALUES (53, '系统默认（无参）', 'SYSTEM', 'mangoTask.mangoNoParams', '系统默认（无参） 总共耗时：11毫秒', '1', '', '2022-07-19 11:37:36');
INSERT INTO `sys_job_log` VALUES (54, '系统默认（有参）', 'DEFAULT', 'mangoTask.mangoParams(\'ry\')', '系统默认（有参） 总共耗时：0毫秒', '1', '', '2022-07-19 11:37:49');
INSERT INTO `sys_job_log` VALUES (55, '多餐', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多餐 总共耗时：30毫秒', '1', '', '2022-07-19 11:37:59');
INSERT INTO `sys_job_log` VALUES (56, '系统默认（无参）', 'SYSTEM', 'mangoTask.mangoNoParams', '系统默认（无参） 总共耗时：40毫秒', '0', '', '2022-07-19 17:59:13');
INSERT INTO `sys_job_log` VALUES (57, '系统默认（有参）', 'DEFAULT', 'mangoTask.mangoParams(\'ry\')', '系统默认（有参） 总共耗时：4毫秒', '0', '', '2022-07-19 17:59:15');
INSERT INTO `sys_job_log` VALUES (58, '系统默认（无参）', 'SYSTEM', 'mangoTask.mangoNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2022-07-19 17:59:20');
INSERT INTO `sys_job_log` VALUES (59, '系统默认（有参）', 'DEFAULT', 'mangoTask.mangoParams(\'ry\')', '系统默认（有参） 总共耗时：2毫秒', '0', '', '2022-07-19 17:59:30');
INSERT INTO `sys_job_log` VALUES (60, '系统默认（无参）', 'SYSTEM', 'mangoTask.mangoNoParams', '系统默认（无参） 总共耗时：1毫秒', '0', '', '2022-07-19 17:59:30');
INSERT INTO `sys_job_log` VALUES (61, '系统默认（无参）', 'SYSTEM', 'mangoTask.mangoNoParams', '系统默认（无参） 总共耗时：1毫秒', '0', '', '2022-07-19 17:59:40');
INSERT INTO `sys_job_log` VALUES (62, '系统默认（有参）', 'DEFAULT', 'mangoTask.mangoParams(\'ry\')', '系统默认（有参） 总共耗时：1毫秒', '0', '', '2022-07-19 17:59:45');
INSERT INTO `sys_job_log` VALUES (63, '系统默认（无参）', 'SYSTEM', 'mangoTask.mangoNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2022-07-19 17:59:50');
INSERT INTO `sys_job_log` VALUES (64, '系统默认（有参）', 'DEFAULT', 'mangoTask.mangoParams(\'ry\')', '系统默认（有参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:00:00');
INSERT INTO `sys_job_log` VALUES (65, '系统默认（无参）', 'SYSTEM', 'mangoTask.mangoNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:00:00');
INSERT INTO `sys_job_log` VALUES (66, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：74毫秒', '0', '', '2022-07-19 18:00:00');
INSERT INTO `sys_job_log` VALUES (67, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:00:01');
INSERT INTO `sys_job_log` VALUES (68, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:00:02');
INSERT INTO `sys_job_log` VALUES (69, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：1毫秒', '0', '', '2022-07-19 18:00:03');
INSERT INTO `sys_job_log` VALUES (70, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:00:04');
INSERT INTO `sys_job_log` VALUES (71, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：1毫秒', '0', '', '2022-07-19 18:00:05');
INSERT INTO `sys_job_log` VALUES (72, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:00:06');
INSERT INTO `sys_job_log` VALUES (73, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:00:07');
INSERT INTO `sys_job_log` VALUES (74, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:00:08');
INSERT INTO `sys_job_log` VALUES (75, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:00:09');
INSERT INTO `sys_job_log` VALUES (76, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:00:10');
INSERT INTO `sys_job_log` VALUES (77, '系统默认（无参）', 'SYSTEM', 'mangoTask.mangoNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:00:10');
INSERT INTO `sys_job_log` VALUES (78, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：1毫秒', '0', '', '2022-07-19 18:00:11');
INSERT INTO `sys_job_log` VALUES (79, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:00:12');
INSERT INTO `sys_job_log` VALUES (80, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:00:13');
INSERT INTO `sys_job_log` VALUES (81, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：1毫秒', '0', '', '2022-07-19 18:00:14');
INSERT INTO `sys_job_log` VALUES (82, '系统默认（有参）', 'DEFAULT', 'mangoTask.mangoParams(\'ry\')', '系统默认（有参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:00:15');
INSERT INTO `sys_job_log` VALUES (83, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：1毫秒', '0', '', '2022-07-19 18:00:15');
INSERT INTO `sys_job_log` VALUES (84, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:00:16');
INSERT INTO `sys_job_log` VALUES (85, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：1毫秒', '0', '', '2022-07-19 18:00:17');
INSERT INTO `sys_job_log` VALUES (86, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:00:18');
INSERT INTO `sys_job_log` VALUES (87, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:00:19');
INSERT INTO `sys_job_log` VALUES (88, '系统默认（无参）', 'SYSTEM', 'mangoTask.mangoNoParams', '系统默认（无参） 总共耗时：1毫秒', '0', '', '2022-07-19 18:00:20');
INSERT INTO `sys_job_log` VALUES (89, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:00:20');
INSERT INTO `sys_job_log` VALUES (90, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：1毫秒', '0', '', '2022-07-19 18:00:21');
INSERT INTO `sys_job_log` VALUES (91, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:00:22');
INSERT INTO `sys_job_log` VALUES (92, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:00:23');
INSERT INTO `sys_job_log` VALUES (93, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:00:24');
INSERT INTO `sys_job_log` VALUES (94, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:00:25');
INSERT INTO `sys_job_log` VALUES (95, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:00:26');
INSERT INTO `sys_job_log` VALUES (96, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:00:27');
INSERT INTO `sys_job_log` VALUES (97, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：1毫秒', '0', '', '2022-07-19 18:00:28');
INSERT INTO `sys_job_log` VALUES (98, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:00:29');
INSERT INTO `sys_job_log` VALUES (99, '系统默认（无参）', 'SYSTEM', 'mangoTask.mangoNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:00:30');
INSERT INTO `sys_job_log` VALUES (100, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:00:30');
INSERT INTO `sys_job_log` VALUES (101, '系统默认（有参）', 'DEFAULT', 'mangoTask.mangoParams(\'ry\')', '系统默认（有参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:00:30');
INSERT INTO `sys_job_log` VALUES (102, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:00:31');
INSERT INTO `sys_job_log` VALUES (103, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:00:32');
INSERT INTO `sys_job_log` VALUES (104, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:00:33');
INSERT INTO `sys_job_log` VALUES (105, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：1毫秒', '0', '', '2022-07-19 18:00:34');
INSERT INTO `sys_job_log` VALUES (106, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:00:35');
INSERT INTO `sys_job_log` VALUES (107, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：1毫秒', '0', '', '2022-07-19 18:00:36');
INSERT INTO `sys_job_log` VALUES (108, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：1毫秒', '0', '', '2022-07-19 18:00:37');
INSERT INTO `sys_job_log` VALUES (109, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:00:38');
INSERT INTO `sys_job_log` VALUES (110, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：1毫秒', '0', '', '2022-07-19 18:00:45');
INSERT INTO `sys_job_log` VALUES (111, '系统默认（无参）', 'SYSTEM', 'mangoTask.mangoNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:00:45');
INSERT INTO `sys_job_log` VALUES (112, '系统默认（有参）', 'DEFAULT', 'mangoTask.mangoParams(\'ry\')', '系统默认（有参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:00:45');
INSERT INTO `sys_job_log` VALUES (113, '系统默认（有参）', 'DEFAULT', 'mangoTask.mangoParams(\'ry\')', '系统默认（有参） 总共耗时：1毫秒', '0', '', '2022-07-19 18:01:11');
INSERT INTO `sys_job_log` VALUES (114, '系统默认（无参）', 'SYSTEM', 'mangoTask.mangoNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:01:11');
INSERT INTO `sys_job_log` VALUES (115, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：1毫秒', '0', '', '2022-07-19 18:01:11');
INSERT INTO `sys_job_log` VALUES (116, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：1毫秒', '0', '', '2022-07-19 18:01:13');
INSERT INTO `sys_job_log` VALUES (117, '系统默认（无参）', 'SYSTEM', 'mangoTask.mangoNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:01:28');
INSERT INTO `sys_job_log` VALUES (118, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：1毫秒', '0', '', '2022-07-19 18:01:28');
INSERT INTO `sys_job_log` VALUES (119, '系统默认（有参）', 'DEFAULT', 'mangoTask.mangoParams(\'ry\')', '系统默认（有参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:01:28');
INSERT INTO `sys_job_log` VALUES (120, '系统默认（无参）', 'SYSTEM', 'mangoTask.mangoNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:01:28');
INSERT INTO `sys_job_log` VALUES (121, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：1毫秒', '0', '', '2022-07-19 18:01:28');
INSERT INTO `sys_job_log` VALUES (122, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:01:28');
INSERT INTO `sys_job_log` VALUES (123, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:01:28');
INSERT INTO `sys_job_log` VALUES (124, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:01:28');
INSERT INTO `sys_job_log` VALUES (125, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:01:28');
INSERT INTO `sys_job_log` VALUES (126, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:01:28');
INSERT INTO `sys_job_log` VALUES (127, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:01:28');
INSERT INTO `sys_job_log` VALUES (128, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:01:28');
INSERT INTO `sys_job_log` VALUES (129, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:01:28');
INSERT INTO `sys_job_log` VALUES (130, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：1毫秒', '0', '', '2022-07-19 18:01:28');
INSERT INTO `sys_job_log` VALUES (131, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：1毫秒', '0', '', '2022-07-19 18:01:28');
INSERT INTO `sys_job_log` VALUES (132, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:01:28');
INSERT INTO `sys_job_log` VALUES (133, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:01:29');
INSERT INTO `sys_job_log` VALUES (134, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：1毫秒', '0', '', '2022-07-19 18:01:29');
INSERT INTO `sys_job_log` VALUES (135, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:01:29');
INSERT INTO `sys_job_log` VALUES (136, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：1毫秒', '0', '', '2022-07-19 18:01:29');
INSERT INTO `sys_job_log` VALUES (137, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:01:29');
INSERT INTO `sys_job_log` VALUES (138, '系统默认（无参）', 'SYSTEM', 'mangoTask.mangoNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:01:30');
INSERT INTO `sys_job_log` VALUES (139, '系统默认（有参）', 'DEFAULT', 'mangoTask.mangoParams(\'ry\')', '系统默认（有参） 总共耗时：1毫秒', '0', '', '2022-07-19 18:01:30');
INSERT INTO `sys_job_log` VALUES (140, '系统默认（无参）', 'SYSTEM', 'mangoTask.mangoNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:02:03');
INSERT INTO `sys_job_log` VALUES (141, '系统默认（有参）', 'DEFAULT', 'mangoTask.mangoParams(\'ry\')', '系统默认（有参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:02:03');
INSERT INTO `sys_job_log` VALUES (142, '系统默认（无参）', 'SYSTEM', 'mangoTask.mangoNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:02:03');
INSERT INTO `sys_job_log` VALUES (143, '系统默认（有参）', 'DEFAULT', 'mangoTask.mangoParams(\'ry\')', '系统默认（有参） 总共耗时：1毫秒', '0', '', '2022-07-19 18:02:03');
INSERT INTO `sys_job_log` VALUES (144, '系统默认（无参）', 'SYSTEM', 'mangoTask.mangoNoParams', '系统默认（无参） 总共耗时：39毫秒', '0', '', '2022-07-19 18:02:30');
INSERT INTO `sys_job_log` VALUES (145, '系统默认（有参）', 'DEFAULT', 'mangoTask.mangoParams(\'ry\')', '系统默认（有参） 总共耗时：41毫秒', '0', '', '2022-07-19 18:02:30');
INSERT INTO `sys_job_log` VALUES (146, '系统默认（无参）', 'SYSTEM', 'mangoTask.mangoNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:02:43');
INSERT INTO `sys_job_log` VALUES (147, '系统默认（有参）', 'DEFAULT', 'mangoTask.mangoParams(\'ry\')', '系统默认（有参） 总共耗时：1毫秒', '0', '', '2022-07-19 18:02:45');
INSERT INTO `sys_job_log` VALUES (148, '系统默认（无参）', 'SYSTEM', 'mangoTask.mangoNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:02:50');
INSERT INTO `sys_job_log` VALUES (149, '系统默认（无参）', 'SYSTEM', 'mangoTask.mangoNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:03:00');
INSERT INTO `sys_job_log` VALUES (150, '系统默认（有参）', 'DEFAULT', 'mangoTask.mangoParams(\'ry\')', '系统默认（有参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:03:00');
INSERT INTO `sys_job_log` VALUES (151, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：101毫秒', '0', '', '2022-07-19 18:03:00');
INSERT INTO `sys_job_log` VALUES (152, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:03:01');
INSERT INTO `sys_job_log` VALUES (153, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:03:02');
INSERT INTO `sys_job_log` VALUES (154, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:03:03');
INSERT INTO `sys_job_log` VALUES (155, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:03:04');
INSERT INTO `sys_job_log` VALUES (156, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:03:05');
INSERT INTO `sys_job_log` VALUES (157, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:03:06');
INSERT INTO `sys_job_log` VALUES (158, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：1毫秒', '0', '', '2022-07-19 18:03:07');
INSERT INTO `sys_job_log` VALUES (159, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:03:08');
INSERT INTO `sys_job_log` VALUES (160, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:03:09');
INSERT INTO `sys_job_log` VALUES (161, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:03:10');
INSERT INTO `sys_job_log` VALUES (162, '系统默认（无参）', 'SYSTEM', 'mangoTask.mangoNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:03:10');
INSERT INTO `sys_job_log` VALUES (163, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:03:11');
INSERT INTO `sys_job_log` VALUES (164, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:03:12');
INSERT INTO `sys_job_log` VALUES (165, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：1毫秒', '0', '', '2022-07-19 18:03:13');
INSERT INTO `sys_job_log` VALUES (166, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:03:14');
INSERT INTO `sys_job_log` VALUES (167, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：1毫秒', '0', '', '2022-07-19 18:03:15');
INSERT INTO `sys_job_log` VALUES (168, '系统默认（有参）', 'DEFAULT', 'mangoTask.mangoParams(\'ry\')', '系统默认（有参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:03:15');
INSERT INTO `sys_job_log` VALUES (169, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:03:16');
INSERT INTO `sys_job_log` VALUES (170, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：1毫秒', '0', '', '2022-07-19 18:03:17');
INSERT INTO `sys_job_log` VALUES (171, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:03:18');
INSERT INTO `sys_job_log` VALUES (172, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:03:19');
INSERT INTO `sys_job_log` VALUES (173, '系统默认（无参）', 'SYSTEM', 'mangoTask.mangoNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:03:20');
INSERT INTO `sys_job_log` VALUES (174, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：1毫秒', '0', '', '2022-07-19 18:03:20');
INSERT INTO `sys_job_log` VALUES (175, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:03:21');
INSERT INTO `sys_job_log` VALUES (176, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:03:22');
INSERT INTO `sys_job_log` VALUES (177, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:03:23');
INSERT INTO `sys_job_log` VALUES (178, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:03:24');
INSERT INTO `sys_job_log` VALUES (179, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：1毫秒', '0', '', '2022-07-19 18:03:25');
INSERT INTO `sys_job_log` VALUES (180, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:03:26');
INSERT INTO `sys_job_log` VALUES (181, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:03:27');
INSERT INTO `sys_job_log` VALUES (182, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:03:28');
INSERT INTO `sys_job_log` VALUES (183, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:03:29');
INSERT INTO `sys_job_log` VALUES (184, '系统默认（有参）', 'DEFAULT', 'mangoTask.mangoParams(\'ry\')', '系统默认（有参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:03:30');
INSERT INTO `sys_job_log` VALUES (185, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：1毫秒', '0', '', '2022-07-19 18:03:30');
INSERT INTO `sys_job_log` VALUES (186, '系统默认（无参）', 'SYSTEM', 'mangoTask.mangoNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:03:30');
INSERT INTO `sys_job_log` VALUES (187, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：1毫秒', '0', '', '2022-07-19 18:03:31');
INSERT INTO `sys_job_log` VALUES (188, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:03:32');
INSERT INTO `sys_job_log` VALUES (189, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:03:33');
INSERT INTO `sys_job_log` VALUES (190, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:03:34');
INSERT INTO `sys_job_log` VALUES (191, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:03:35');
INSERT INTO `sys_job_log` VALUES (192, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:03:36');
INSERT INTO `sys_job_log` VALUES (193, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:03:37');
INSERT INTO `sys_job_log` VALUES (194, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:03:38');
INSERT INTO `sys_job_log` VALUES (195, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:03:39');
INSERT INTO `sys_job_log` VALUES (196, '系统默认（无参）', 'SYSTEM', 'mangoTask.mangoNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:03:40');
INSERT INTO `sys_job_log` VALUES (197, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:03:40');
INSERT INTO `sys_job_log` VALUES (198, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:03:41');
INSERT INTO `sys_job_log` VALUES (199, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:03:42');
INSERT INTO `sys_job_log` VALUES (200, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:03:43');
INSERT INTO `sys_job_log` VALUES (201, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：1毫秒', '0', '', '2022-07-19 18:03:44');
INSERT INTO `sys_job_log` VALUES (202, '系统默认（有参）', 'DEFAULT', 'mangoTask.mangoParams(\'ry\')', '系统默认（有参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:03:45');
INSERT INTO `sys_job_log` VALUES (203, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:03:45');
INSERT INTO `sys_job_log` VALUES (204, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:03:46');
INSERT INTO `sys_job_log` VALUES (205, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:03:47');
INSERT INTO `sys_job_log` VALUES (206, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：1毫秒', '0', '', '2022-07-19 18:03:48');
INSERT INTO `sys_job_log` VALUES (207, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：1毫秒', '0', '', '2022-07-19 18:03:49');
INSERT INTO `sys_job_log` VALUES (208, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:03:50');
INSERT INTO `sys_job_log` VALUES (209, '系统默认（无参）', 'SYSTEM', 'mangoTask.mangoNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:03:50');
INSERT INTO `sys_job_log` VALUES (210, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:03:51');
INSERT INTO `sys_job_log` VALUES (211, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:03:52');
INSERT INTO `sys_job_log` VALUES (212, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:03:53');
INSERT INTO `sys_job_log` VALUES (213, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:03:54');
INSERT INTO `sys_job_log` VALUES (214, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：1毫秒', '0', '', '2022-07-19 18:03:55');
INSERT INTO `sys_job_log` VALUES (215, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：1毫秒', '0', '', '2022-07-19 18:03:56');
INSERT INTO `sys_job_log` VALUES (216, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:03:57');
INSERT INTO `sys_job_log` VALUES (217, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：1毫秒', '0', '', '2022-07-19 18:03:58');
INSERT INTO `sys_job_log` VALUES (218, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:03:59');
INSERT INTO `sys_job_log` VALUES (219, '系统默认（无参）', 'SYSTEM', 'mangoTask.mangoNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:04:00');
INSERT INTO `sys_job_log` VALUES (220, '系统默认（有参）', 'DEFAULT', 'mangoTask.mangoParams(\'ry\')', '系统默认（有参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:04:00');
INSERT INTO `sys_job_log` VALUES (221, '系统默认（无参）', 'SYSTEM', 'mangoTask.mangoNoParams', '系统默认（无参） 总共耗时：1毫秒', '0', '', '2022-07-19 18:04:10');
INSERT INTO `sys_job_log` VALUES (222, '系统默认（有参）', 'DEFAULT', 'mangoTask.mangoParams(\'ry\')', '系统默认（有参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:04:15');
INSERT INTO `sys_job_log` VALUES (223, '系统默认（无参）', 'SYSTEM', 'mangoTask.mangoNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:04:20');
INSERT INTO `sys_job_log` VALUES (224, '系统默认（有参）', 'DEFAULT', 'mangoTask.mangoParams(\'ry\')', '系统默认（有参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:04:30');
INSERT INTO `sys_job_log` VALUES (225, '系统默认（无参）', 'SYSTEM', 'mangoTask.mangoNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:04:30');
INSERT INTO `sys_job_log` VALUES (226, '系统默认（无参）', 'SYSTEM', 'mangoTask.mangoNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:04:40');
INSERT INTO `sys_job_log` VALUES (227, '系统默认（有参）', 'DEFAULT', 'mangoTask.mangoParams(\'ry\')', '系统默认（有参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:04:45');
INSERT INTO `sys_job_log` VALUES (228, '系统默认（无参）', 'SYSTEM', 'mangoTask.mangoNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:04:50');
INSERT INTO `sys_job_log` VALUES (229, '系统默认（有参）', 'DEFAULT', 'mangoTask.mangoParams(\'ry\')', '系统默认（有参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:05:00');
INSERT INTO `sys_job_log` VALUES (230, '系统默认（无参）', 'SYSTEM', 'mangoTask.mangoNoParams', '系统默认（无参） 总共耗时：1毫秒', '0', '', '2022-07-19 18:05:00');
INSERT INTO `sys_job_log` VALUES (231, '系统默认（无参）', 'SYSTEM', 'mangoTask.mangoNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:05:10');
INSERT INTO `sys_job_log` VALUES (232, '系统默认（有参）', 'DEFAULT', 'mangoTask.mangoParams(\'ry\')', '系统默认（有参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:05:15');
INSERT INTO `sys_job_log` VALUES (233, '系统默认（无参）', 'SYSTEM', 'mangoTask.mangoNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:05:20');
INSERT INTO `sys_job_log` VALUES (234, '系统默认（有参）', 'DEFAULT', 'mangoTask.mangoParams(\'ry\')', '系统默认（有参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:05:30');
INSERT INTO `sys_job_log` VALUES (235, '系统默认（无参）', 'SYSTEM', 'mangoTask.mangoNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:05:30');
INSERT INTO `sys_job_log` VALUES (236, '系统默认（无参）', 'SYSTEM', 'mangoTask.mangoNoParams', '系统默认（无参） 总共耗时：1毫秒', '0', '', '2022-07-19 18:05:40');
INSERT INTO `sys_job_log` VALUES (237, '系统默认（有参）', 'DEFAULT', 'mangoTask.mangoParams(\'ry\')', '系统默认（有参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:05:45');
INSERT INTO `sys_job_log` VALUES (238, '系统默认（无参）', 'SYSTEM', 'mangoTask.mangoNoParams', '系统默认（无参） 总共耗时：1毫秒', '0', '', '2022-07-19 18:05:50');
INSERT INTO `sys_job_log` VALUES (239, '系统默认（有参）', 'DEFAULT', 'mangoTask.mangoParams(\'ry\')', '系统默认（有参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:06:00');
INSERT INTO `sys_job_log` VALUES (240, '系统默认（无参）', 'SYSTEM', 'mangoTask.mangoNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:06:00');
INSERT INTO `sys_job_log` VALUES (241, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：1毫秒', '0', '', '2022-07-19 18:06:00');
INSERT INTO `sys_job_log` VALUES (242, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:06:01');
INSERT INTO `sys_job_log` VALUES (243, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:06:02');
INSERT INTO `sys_job_log` VALUES (244, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:06:03');
INSERT INTO `sys_job_log` VALUES (245, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:06:04');
INSERT INTO `sys_job_log` VALUES (246, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:06:05');
INSERT INTO `sys_job_log` VALUES (247, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:06:06');
INSERT INTO `sys_job_log` VALUES (248, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:06:07');
INSERT INTO `sys_job_log` VALUES (249, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:06:08');
INSERT INTO `sys_job_log` VALUES (250, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:06:09');
INSERT INTO `sys_job_log` VALUES (251, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:06:10');
INSERT INTO `sys_job_log` VALUES (252, '系统默认（无参）', 'SYSTEM', 'mangoTask.mangoNoParams', '系统默认（无参） 总共耗时：1毫秒', '0', '', '2022-07-19 18:06:10');
INSERT INTO `sys_job_log` VALUES (253, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:06:11');
INSERT INTO `sys_job_log` VALUES (254, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:06:12');
INSERT INTO `sys_job_log` VALUES (255, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:06:13');
INSERT INTO `sys_job_log` VALUES (256, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：1毫秒', '0', '', '2022-07-19 18:06:14');
INSERT INTO `sys_job_log` VALUES (257, '系统默认（有参）', 'DEFAULT', 'mangoTask.mangoParams(\'ry\')', '系统默认（有参） 总共耗时：1毫秒', '0', '', '2022-07-19 18:06:15');
INSERT INTO `sys_job_log` VALUES (258, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：1毫秒', '0', '', '2022-07-19 18:06:15');
INSERT INTO `sys_job_log` VALUES (259, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：1毫秒', '0', '', '2022-07-19 18:06:16');
INSERT INTO `sys_job_log` VALUES (260, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：1毫秒', '0', '', '2022-07-19 18:06:17');
INSERT INTO `sys_job_log` VALUES (261, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:06:18');
INSERT INTO `sys_job_log` VALUES (262, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：1毫秒', '0', '', '2022-07-19 18:06:19');
INSERT INTO `sys_job_log` VALUES (263, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:06:20');
INSERT INTO `sys_job_log` VALUES (264, '系统默认（无参）', 'SYSTEM', 'mangoTask.mangoNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:06:20');
INSERT INTO `sys_job_log` VALUES (265, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:06:21');
INSERT INTO `sys_job_log` VALUES (266, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:06:22');
INSERT INTO `sys_job_log` VALUES (267, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:06:23');
INSERT INTO `sys_job_log` VALUES (268, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：1毫秒', '0', '', '2022-07-19 18:06:24');
INSERT INTO `sys_job_log` VALUES (269, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:06:25');
INSERT INTO `sys_job_log` VALUES (270, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：1毫秒', '0', '', '2022-07-19 18:06:26');
INSERT INTO `sys_job_log` VALUES (271, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：1毫秒', '0', '', '2022-07-19 18:06:27');
INSERT INTO `sys_job_log` VALUES (272, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：1毫秒', '0', '', '2022-07-19 18:06:28');
INSERT INTO `sys_job_log` VALUES (273, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:06:29');
INSERT INTO `sys_job_log` VALUES (274, '系统默认（有参）', 'DEFAULT', 'mangoTask.mangoParams(\'ry\')', '系统默认（有参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:06:30');
INSERT INTO `sys_job_log` VALUES (275, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:06:30');
INSERT INTO `sys_job_log` VALUES (276, '系统默认（无参）', 'SYSTEM', 'mangoTask.mangoNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:06:30');
INSERT INTO `sys_job_log` VALUES (277, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:06:31');
INSERT INTO `sys_job_log` VALUES (278, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:06:32');
INSERT INTO `sys_job_log` VALUES (279, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:06:33');
INSERT INTO `sys_job_log` VALUES (280, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:06:34');
INSERT INTO `sys_job_log` VALUES (281, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:06:35');
INSERT INTO `sys_job_log` VALUES (282, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:06:36');
INSERT INTO `sys_job_log` VALUES (283, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：1毫秒', '0', '', '2022-07-19 18:06:37');
INSERT INTO `sys_job_log` VALUES (284, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:06:38');
INSERT INTO `sys_job_log` VALUES (285, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:06:39');
INSERT INTO `sys_job_log` VALUES (286, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:06:40');
INSERT INTO `sys_job_log` VALUES (287, '系统默认（无参）', 'SYSTEM', 'mangoTask.mangoNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:06:40');
INSERT INTO `sys_job_log` VALUES (288, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:06:41');
INSERT INTO `sys_job_log` VALUES (289, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：1毫秒', '0', '', '2022-07-19 18:06:42');
INSERT INTO `sys_job_log` VALUES (290, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:06:43');
INSERT INTO `sys_job_log` VALUES (291, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:06:44');
INSERT INTO `sys_job_log` VALUES (292, '系统默认（有参）', 'DEFAULT', 'mangoTask.mangoParams(\'ry\')', '系统默认（有参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:06:45');
INSERT INTO `sys_job_log` VALUES (293, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:06:45');
INSERT INTO `sys_job_log` VALUES (294, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:06:46');
INSERT INTO `sys_job_log` VALUES (295, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:06:47');
INSERT INTO `sys_job_log` VALUES (296, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:06:48');
INSERT INTO `sys_job_log` VALUES (297, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:06:49');
INSERT INTO `sys_job_log` VALUES (298, '系统默认（无参）', 'SYSTEM', 'mangoTask.mangoNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:06:50');
INSERT INTO `sys_job_log` VALUES (299, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:06:50');
INSERT INTO `sys_job_log` VALUES (300, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:06:51');
INSERT INTO `sys_job_log` VALUES (301, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:06:52');
INSERT INTO `sys_job_log` VALUES (302, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:06:53');
INSERT INTO `sys_job_log` VALUES (303, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:06:54');
INSERT INTO `sys_job_log` VALUES (304, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:06:55');
INSERT INTO `sys_job_log` VALUES (305, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:06:56');
INSERT INTO `sys_job_log` VALUES (306, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:06:57');
INSERT INTO `sys_job_log` VALUES (307, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:06:58');
INSERT INTO `sys_job_log` VALUES (308, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:06:59');
INSERT INTO `sys_job_log` VALUES (309, '系统默认（无参）', 'SYSTEM', 'mangoTask.mangoNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:07:00');
INSERT INTO `sys_job_log` VALUES (310, '系统默认（有参）', 'DEFAULT', 'mangoTask.mangoParams(\'ry\')', '系统默认（有参） 总共耗时：1毫秒', '0', '', '2022-07-19 18:07:00');
INSERT INTO `sys_job_log` VALUES (311, '系统默认（无参）', 'SYSTEM', 'mangoTask.mangoNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:07:10');
INSERT INTO `sys_job_log` VALUES (312, '系统默认（有参）', 'DEFAULT', 'mangoTask.mangoParams(\'ry\')', '系统默认（有参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:07:15');
INSERT INTO `sys_job_log` VALUES (313, '系统默认（无参）', 'SYSTEM', 'mangoTask.mangoNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:07:20');
INSERT INTO `sys_job_log` VALUES (314, '系统默认（有参）', 'DEFAULT', 'mangoTask.mangoParams(\'ry\')', '系统默认（有参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:07:30');
INSERT INTO `sys_job_log` VALUES (315, '系统默认（无参）', 'SYSTEM', 'mangoTask.mangoNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:07:30');
INSERT INTO `sys_job_log` VALUES (316, '系统默认（无参）', 'SYSTEM', 'mangoTask.mangoNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:07:40');
INSERT INTO `sys_job_log` VALUES (317, '系统默认（有参）', 'DEFAULT', 'mangoTask.mangoParams(\'ry\')', '系统默认（有参） 总共耗时：1毫秒', '0', '', '2022-07-19 18:07:45');
INSERT INTO `sys_job_log` VALUES (318, '系统默认（无参）', 'SYSTEM', 'mangoTask.mangoNoParams', '系统默认（无参） 总共耗时：1毫秒', '0', '', '2022-07-19 18:07:50');
INSERT INTO `sys_job_log` VALUES (319, '系统默认（有参）', 'DEFAULT', 'mangoTask.mangoParams(\'ry\')', '系统默认（有参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:08:00');
INSERT INTO `sys_job_log` VALUES (320, '系统默认（无参）', 'SYSTEM', 'mangoTask.mangoNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:08:00');
INSERT INTO `sys_job_log` VALUES (321, '系统默认（无参）', 'SYSTEM', 'mangoTask.mangoNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:08:10');
INSERT INTO `sys_job_log` VALUES (322, '系统默认（有参）', 'DEFAULT', 'mangoTask.mangoParams(\'ry\')', '系统默认（有参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:08:15');
INSERT INTO `sys_job_log` VALUES (323, '系统默认（无参）', 'SYSTEM', 'mangoTask.mangoNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:08:20');
INSERT INTO `sys_job_log` VALUES (324, '系统默认（有参）', 'DEFAULT', 'mangoTask.mangoParams(\'ry\')', '系统默认（有参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:08:30');
INSERT INTO `sys_job_log` VALUES (325, '系统默认（无参）', 'SYSTEM', 'mangoTask.mangoNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:08:30');
INSERT INTO `sys_job_log` VALUES (326, '系统默认（无参）', 'SYSTEM', 'mangoTask.mangoNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:08:40');
INSERT INTO `sys_job_log` VALUES (327, '系统默认（有参）', 'DEFAULT', 'mangoTask.mangoParams(\'ry\')', '系统默认（有参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:08:45');
INSERT INTO `sys_job_log` VALUES (328, '系统默认（无参）', 'SYSTEM', 'mangoTask.mangoNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:08:50');
INSERT INTO `sys_job_log` VALUES (329, '系统默认（无参）', 'SYSTEM', 'mangoTask.mangoNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:08:57');
INSERT INTO `sys_job_log` VALUES (330, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:09:00');
INSERT INTO `sys_job_log` VALUES (331, '系统默认（有参）', 'DEFAULT', 'mangoTask.mangoParams(\'ry\')', '系统默认（有参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:09:00');
INSERT INTO `sys_job_log` VALUES (332, '系统默认（无参）', 'SYSTEM', 'mangoTask.mangoNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:09:00');
INSERT INTO `sys_job_log` VALUES (333, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:09:01');
INSERT INTO `sys_job_log` VALUES (334, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:09:02');
INSERT INTO `sys_job_log` VALUES (335, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:09:03');
INSERT INTO `sys_job_log` VALUES (336, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：1毫秒', '0', '', '2022-07-19 18:09:04');
INSERT INTO `sys_job_log` VALUES (337, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：1毫秒', '0', '', '2022-07-19 18:09:05');
INSERT INTO `sys_job_log` VALUES (338, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:09:06');
INSERT INTO `sys_job_log` VALUES (339, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:09:07');
INSERT INTO `sys_job_log` VALUES (340, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：1毫秒', '0', '', '2022-07-19 18:09:08');
INSERT INTO `sys_job_log` VALUES (341, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：1毫秒', '0', '', '2022-07-19 18:09:09');
INSERT INTO `sys_job_log` VALUES (342, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：1毫秒', '0', '', '2022-07-19 18:09:10');
INSERT INTO `sys_job_log` VALUES (343, '系统默认（无参）', 'SYSTEM', 'mangoTask.mangoNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:09:10');
INSERT INTO `sys_job_log` VALUES (344, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:09:11');
INSERT INTO `sys_job_log` VALUES (345, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：1毫秒', '0', '', '2022-07-19 18:09:12');
INSERT INTO `sys_job_log` VALUES (346, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：1毫秒', '0', '', '2022-07-19 18:09:13');
INSERT INTO `sys_job_log` VALUES (347, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：1毫秒', '0', '', '2022-07-19 18:09:14');
INSERT INTO `sys_job_log` VALUES (348, '系统默认（有参）', 'DEFAULT', 'mangoTask.mangoParams(\'ry\')', '系统默认（有参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:09:15');
INSERT INTO `sys_job_log` VALUES (349, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:09:15');
INSERT INTO `sys_job_log` VALUES (350, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:09:15');
INSERT INTO `sys_job_log` VALUES (351, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：1毫秒', '0', '', '2022-07-19 18:09:16');
INSERT INTO `sys_job_log` VALUES (352, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：1毫秒', '0', '', '2022-07-19 18:09:17');
INSERT INTO `sys_job_log` VALUES (353, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:09:18');
INSERT INTO `sys_job_log` VALUES (354, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:09:19');
INSERT INTO `sys_job_log` VALUES (355, '系统默认（无参）', 'SYSTEM', 'mangoTask.mangoNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:09:20');
INSERT INTO `sys_job_log` VALUES (356, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:09:20');
INSERT INTO `sys_job_log` VALUES (357, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:09:21');
INSERT INTO `sys_job_log` VALUES (358, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:09:22');
INSERT INTO `sys_job_log` VALUES (359, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:09:23');
INSERT INTO `sys_job_log` VALUES (360, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:09:24');
INSERT INTO `sys_job_log` VALUES (361, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:09:25');
INSERT INTO `sys_job_log` VALUES (362, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:09:26');
INSERT INTO `sys_job_log` VALUES (363, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:09:27');
INSERT INTO `sys_job_log` VALUES (364, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：1毫秒', '0', '', '2022-07-19 18:09:28');
INSERT INTO `sys_job_log` VALUES (365, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:09:29');
INSERT INTO `sys_job_log` VALUES (366, '系统默认（无参）', 'SYSTEM', 'mangoTask.mangoNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:09:30');
INSERT INTO `sys_job_log` VALUES (367, '系统默认（有参）', 'DEFAULT', 'mangoTask.mangoParams(\'ry\')', '系统默认（有参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:09:30');
INSERT INTO `sys_job_log` VALUES (368, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:09:30');
INSERT INTO `sys_job_log` VALUES (369, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:09:31');
INSERT INTO `sys_job_log` VALUES (370, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：1毫秒', '0', '', '2022-07-19 18:09:32');
INSERT INTO `sys_job_log` VALUES (371, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:09:33');
INSERT INTO `sys_job_log` VALUES (372, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:09:34');
INSERT INTO `sys_job_log` VALUES (373, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：2毫秒', '0', '', '2022-07-19 18:09:35');
INSERT INTO `sys_job_log` VALUES (374, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：1毫秒', '0', '', '2022-07-19 18:09:36');
INSERT INTO `sys_job_log` VALUES (375, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:09:37');
INSERT INTO `sys_job_log` VALUES (376, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:09:38');
INSERT INTO `sys_job_log` VALUES (377, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:09:39');
INSERT INTO `sys_job_log` VALUES (378, '系统默认（无参）', 'SYSTEM', 'mangoTask.mangoNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:09:40');
INSERT INTO `sys_job_log` VALUES (379, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:09:40');
INSERT INTO `sys_job_log` VALUES (380, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:09:41');
INSERT INTO `sys_job_log` VALUES (381, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:09:42');
INSERT INTO `sys_job_log` VALUES (382, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:09:43');
INSERT INTO `sys_job_log` VALUES (383, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：1毫秒', '0', '', '2022-07-19 18:09:44');
INSERT INTO `sys_job_log` VALUES (384, '系统默认（有参）', 'DEFAULT', 'mangoTask.mangoParams(\'ry\')', '系统默认（有参） 总共耗时：1毫秒', '0', '', '2022-07-19 18:09:45');
INSERT INTO `sys_job_log` VALUES (385, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：1毫秒', '0', '', '2022-07-19 18:09:45');
INSERT INTO `sys_job_log` VALUES (386, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：1毫秒', '0', '', '2022-07-19 18:09:46');
INSERT INTO `sys_job_log` VALUES (387, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：1毫秒', '0', '', '2022-07-19 18:09:47');
INSERT INTO `sys_job_log` VALUES (388, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：1毫秒', '0', '', '2022-07-19 18:09:48');
INSERT INTO `sys_job_log` VALUES (389, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:09:49');
INSERT INTO `sys_job_log` VALUES (390, '系统默认（无参）', 'SYSTEM', 'mangoTask.mangoNoParams', '系统默认（无参） 总共耗时：1毫秒', '0', '', '2022-07-19 18:09:50');
INSERT INTO `sys_job_log` VALUES (391, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：1毫秒', '0', '', '2022-07-19 18:09:50');
INSERT INTO `sys_job_log` VALUES (392, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：1毫秒', '0', '', '2022-07-19 18:09:51');
INSERT INTO `sys_job_log` VALUES (393, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:09:52');
INSERT INTO `sys_job_log` VALUES (394, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:09:53');
INSERT INTO `sys_job_log` VALUES (395, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:09:54');
INSERT INTO `sys_job_log` VALUES (396, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:09:55');
INSERT INTO `sys_job_log` VALUES (397, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:09:56');
INSERT INTO `sys_job_log` VALUES (398, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:09:57');
INSERT INTO `sys_job_log` VALUES (399, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:09:58');
INSERT INTO `sys_job_log` VALUES (400, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:09:59');
INSERT INTO `sys_job_log` VALUES (401, '系统默认（有参）', 'DEFAULT', 'mangoTask.mangoParams(\'ry\')', '系统默认（有参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:10:00');
INSERT INTO `sys_job_log` VALUES (402, '系统默认（无参）', 'SYSTEM', 'mangoTask.mangoNoParams', '系统默认（无参） 总共耗时：1毫秒', '0', '', '2022-07-19 18:10:00');
INSERT INTO `sys_job_log` VALUES (403, '系统默认（无参）', 'SYSTEM', 'mangoTask.mangoNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:10:10');
INSERT INTO `sys_job_log` VALUES (404, '系统默认（有参）', 'DEFAULT', 'mangoTask.mangoParams(\'ry\')', '系统默认（有参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:10:15');
INSERT INTO `sys_job_log` VALUES (405, '系统默认（无参）', 'SYSTEM', 'mangoTask.mangoNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:10:20');
INSERT INTO `sys_job_log` VALUES (406, '系统默认（无参）', 'SYSTEM', 'mangoTask.mangoNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:10:30');
INSERT INTO `sys_job_log` VALUES (407, '系统默认（有参）', 'DEFAULT', 'mangoTask.mangoParams(\'ry\')', '系统默认（有参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:10:30');
INSERT INTO `sys_job_log` VALUES (408, '系统默认（无参）', 'SYSTEM', 'mangoTask.mangoNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:10:40');
INSERT INTO `sys_job_log` VALUES (409, '系统默认（有参）', 'DEFAULT', 'mangoTask.mangoParams(\'ry\')', '系统默认（有参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:10:45');
INSERT INTO `sys_job_log` VALUES (410, '系统默认（无参）', 'SYSTEM', 'mangoTask.mangoNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:10:50');
INSERT INTO `sys_job_log` VALUES (411, '系统默认（无参）', 'SYSTEM', 'mangoTask.mangoNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:11:00');
INSERT INTO `sys_job_log` VALUES (412, '系统默认（有参）', 'DEFAULT', 'mangoTask.mangoParams(\'ry\')', '系统默认（有参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:11:00');
INSERT INTO `sys_job_log` VALUES (413, '系统默认（无参）', 'SYSTEM', 'mangoTask.mangoNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:11:10');
INSERT INTO `sys_job_log` VALUES (414, '系统默认（有参）', 'DEFAULT', 'mangoTask.mangoParams(\'ry\')', '系统默认（有参） 总共耗时：1毫秒', '0', '', '2022-07-19 18:11:15');
INSERT INTO `sys_job_log` VALUES (415, '系统默认（无参）', 'SYSTEM', 'mangoTask.mangoNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:11:20');
INSERT INTO `sys_job_log` VALUES (416, '系统默认（有参）', 'DEFAULT', 'mangoTask.mangoParams(\'ry\')', '系统默认（有参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:11:30');
INSERT INTO `sys_job_log` VALUES (417, '系统默认（无参）', 'SYSTEM', 'mangoTask.mangoNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:11:30');
INSERT INTO `sys_job_log` VALUES (418, '系统默认（无参）', 'SYSTEM', 'mangoTask.mangoNoParams', '系统默认（无参） 总共耗时：41毫秒', '0', '', '2022-07-19 18:19:30');
INSERT INTO `sys_job_log` VALUES (419, '系统默认（有参）', 'DEFAULT', 'mangoTask.mangoParams(\'ry\')', '系统默认（有参） 总共耗时：48毫秒', '0', '', '2022-07-19 18:19:30');
INSERT INTO `sys_job_log` VALUES (420, '系统默认（无参）', 'SYSTEM', 'mangoTask.mangoNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:19:40');
INSERT INTO `sys_job_log` VALUES (421, '系统默认（有参）', 'DEFAULT', 'mangoTask.mangoParams(\'ry\')', '系统默认（有参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:19:45');
INSERT INTO `sys_job_log` VALUES (422, '系统默认（无参）', 'SYSTEM', 'mangoTask.mangoNoParams', '系统默认（无参） 总共耗时：1毫秒', '0', '', '2022-07-19 18:19:50');
INSERT INTO `sys_job_log` VALUES (423, '系统默认（无参）', 'SYSTEM', 'mangoTask.mangoNoParams', '系统默认（无参） 总共耗时：1毫秒', '0', '', '2022-07-19 18:20:00');
INSERT INTO `sys_job_log` VALUES (424, '系统默认（有参）', 'DEFAULT', 'mangoTask.mangoParams(\'ry\')', '系统默认（有参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:20:00');
INSERT INTO `sys_job_log` VALUES (425, '系统默认（无参）', 'SYSTEM', 'mangoTask.mangoNoParams', '系统默认（无参） 总共耗时：4059毫秒', '0', '', '2022-07-19 18:20:14');
INSERT INTO `sys_job_log` VALUES (426, '系统默认（有参）', 'DEFAULT', 'mangoTask.mangoParams(\'ry\')', '系统默认（有参） 总共耗时：1134毫秒', '0', '', '2022-07-19 18:20:16');
INSERT INTO `sys_job_log` VALUES (427, '系统默认（无参）', 'SYSTEM', 'mangoTask.mangoNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:20:20');
INSERT INTO `sys_job_log` VALUES (428, '系统默认（有参）', 'DEFAULT', 'mangoTask.mangoParams(\'ry\')', '系统默认（有参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:20:30');
INSERT INTO `sys_job_log` VALUES (429, '系统默认（无参）', 'SYSTEM', 'mangoTask.mangoNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:20:30');
INSERT INTO `sys_job_log` VALUES (430, '系统默认（无参）', 'SYSTEM', 'mangoTask.mangoNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:20:40');
INSERT INTO `sys_job_log` VALUES (431, '系统默认（有参）', 'DEFAULT', 'mangoTask.mangoParams(\'ry\')', '系统默认（有参） 总共耗时：1毫秒', '0', '', '2022-07-19 18:20:45');
INSERT INTO `sys_job_log` VALUES (432, '系统默认（无参）', 'SYSTEM', 'mangoTask.mangoNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:20:50');
INSERT INTO `sys_job_log` VALUES (433, '系统默认（有参）', 'DEFAULT', 'mangoTask.mangoParams(\'ry\')', '系统默认（有参） 总共耗时：1毫秒', '0', '', '2022-07-19 18:21:00');
INSERT INTO `sys_job_log` VALUES (434, '系统默认（无参）', 'SYSTEM', 'mangoTask.mangoNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:21:00');
INSERT INTO `sys_job_log` VALUES (435, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：91毫秒', '0', '', '2022-07-19 18:21:00');
INSERT INTO `sys_job_log` VALUES (436, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:21:01');
INSERT INTO `sys_job_log` VALUES (437, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:21:02');
INSERT INTO `sys_job_log` VALUES (438, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：1毫秒', '0', '', '2022-07-19 18:21:03');
INSERT INTO `sys_job_log` VALUES (439, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:21:04');
INSERT INTO `sys_job_log` VALUES (440, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：1毫秒', '0', '', '2022-07-19 18:21:05');
INSERT INTO `sys_job_log` VALUES (441, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:21:06');
INSERT INTO `sys_job_log` VALUES (442, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:21:07');
INSERT INTO `sys_job_log` VALUES (443, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：2毫秒', '0', '', '2022-07-19 18:21:08');
INSERT INTO `sys_job_log` VALUES (444, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:21:09');
INSERT INTO `sys_job_log` VALUES (445, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:21:10');
INSERT INTO `sys_job_log` VALUES (446, '系统默认（无参）', 'SYSTEM', 'mangoTask.mangoNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:21:10');
INSERT INTO `sys_job_log` VALUES (447, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：1毫秒', '0', '', '2022-07-19 18:21:11');
INSERT INTO `sys_job_log` VALUES (448, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:21:12');
INSERT INTO `sys_job_log` VALUES (449, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：1毫秒', '0', '', '2022-07-19 18:21:13');
INSERT INTO `sys_job_log` VALUES (450, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：1毫秒', '0', '', '2022-07-19 18:21:14');
INSERT INTO `sys_job_log` VALUES (451, '系统默认（有参）', 'DEFAULT', 'mangoTask.mangoParams(\'ry\')', '系统默认（有参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:21:15');
INSERT INTO `sys_job_log` VALUES (452, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：1毫秒', '0', '', '2022-07-19 18:21:15');
INSERT INTO `sys_job_log` VALUES (453, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：1毫秒', '0', '', '2022-07-19 18:21:16');
INSERT INTO `sys_job_log` VALUES (454, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：1毫秒', '0', '', '2022-07-19 18:21:17');
INSERT INTO `sys_job_log` VALUES (455, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:21:18');
INSERT INTO `sys_job_log` VALUES (456, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:21:19');
INSERT INTO `sys_job_log` VALUES (457, '系统默认（无参）', 'SYSTEM', 'mangoTask.mangoNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:21:20');
INSERT INTO `sys_job_log` VALUES (458, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:21:20');
INSERT INTO `sys_job_log` VALUES (459, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:21:21');
INSERT INTO `sys_job_log` VALUES (460, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:21:22');
INSERT INTO `sys_job_log` VALUES (461, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:21:23');
INSERT INTO `sys_job_log` VALUES (462, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:21:24');
INSERT INTO `sys_job_log` VALUES (463, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:21:25');
INSERT INTO `sys_job_log` VALUES (464, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：1毫秒', '0', '', '2022-07-19 18:21:26');
INSERT INTO `sys_job_log` VALUES (465, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：1毫秒', '0', '', '2022-07-19 18:21:27');
INSERT INTO `sys_job_log` VALUES (466, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:21:28');
INSERT INTO `sys_job_log` VALUES (467, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:21:29');
INSERT INTO `sys_job_log` VALUES (468, '系统默认（有参）', 'DEFAULT', 'mangoTask.mangoParams(\'ry\')', '系统默认（有参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:21:30');
INSERT INTO `sys_job_log` VALUES (469, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：1毫秒', '0', '', '2022-07-19 18:21:30');
INSERT INTO `sys_job_log` VALUES (470, '系统默认（无参）', 'SYSTEM', 'mangoTask.mangoNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:21:30');
INSERT INTO `sys_job_log` VALUES (471, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:21:31');
INSERT INTO `sys_job_log` VALUES (472, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：1毫秒', '0', '', '2022-07-19 18:21:32');
INSERT INTO `sys_job_log` VALUES (473, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：1毫秒', '0', '', '2022-07-19 18:21:33');
INSERT INTO `sys_job_log` VALUES (474, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：1毫秒', '0', '', '2022-07-19 18:21:34');
INSERT INTO `sys_job_log` VALUES (475, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：1毫秒', '0', '', '2022-07-19 18:21:35');
INSERT INTO `sys_job_log` VALUES (476, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：1毫秒', '0', '', '2022-07-19 18:21:36');
INSERT INTO `sys_job_log` VALUES (477, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：1毫秒', '0', '', '2022-07-19 18:21:37');
INSERT INTO `sys_job_log` VALUES (478, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：1毫秒', '0', '', '2022-07-19 18:21:38');
INSERT INTO `sys_job_log` VALUES (479, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:21:39');
INSERT INTO `sys_job_log` VALUES (480, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:21:40');
INSERT INTO `sys_job_log` VALUES (481, '系统默认（无参）', 'SYSTEM', 'mangoTask.mangoNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:21:40');
INSERT INTO `sys_job_log` VALUES (482, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：1毫秒', '0', '', '2022-07-19 18:21:41');
INSERT INTO `sys_job_log` VALUES (483, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：1毫秒', '0', '', '2022-07-19 18:21:42');
INSERT INTO `sys_job_log` VALUES (484, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:21:43');
INSERT INTO `sys_job_log` VALUES (485, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：1毫秒', '0', '', '2022-07-19 18:21:44');
INSERT INTO `sys_job_log` VALUES (486, '系统默认（有参）', 'DEFAULT', 'mangoTask.mangoParams(\'ry\')', '系统默认（有参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:21:45');
INSERT INTO `sys_job_log` VALUES (487, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:21:45');
INSERT INTO `sys_job_log` VALUES (488, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:21:46');
INSERT INTO `sys_job_log` VALUES (489, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：1毫秒', '0', '', '2022-07-19 18:21:47');
INSERT INTO `sys_job_log` VALUES (490, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:21:48');
INSERT INTO `sys_job_log` VALUES (491, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：1毫秒', '0', '', '2022-07-19 18:21:49');
INSERT INTO `sys_job_log` VALUES (492, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：1毫秒', '0', '', '2022-07-19 18:21:50');
INSERT INTO `sys_job_log` VALUES (493, '系统默认（无参）', 'SYSTEM', 'mangoTask.mangoNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2022-07-19 18:21:50');
INSERT INTO `sys_job_log` VALUES (494, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：1毫秒', '0', '', '2022-07-19 18:21:51');
INSERT INTO `sys_job_log` VALUES (495, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：0毫秒', '0', '', '2022-07-19 18:21:52');
INSERT INTO `sys_job_log` VALUES (496, '多参', 'DEFAULT', 'mangoTask.mangoMultipleParams(\'mango\', true, 2000L, 316.50D, 100)', '多参 总共耗时：1毫秒', '0', '', '2022-07-19 18:21:53');

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
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '日志表' ROW_FORMAT = Compact;

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
INSERT INTO `sys_log` VALUES (43, 1, '系统用户登录', 0, 'admin', '127.0.0.1', 'username', 'admin', '/system/login/common', '[{\"password\":\"123456\",\"username\":\"admin\"}]', 'cn.sky1998.mango.system.controller.LoginController.login', '2022-07-16 09:32:43');
INSERT INTO `sys_log` VALUES (44, 1, '系统用户登录', 0, 'root', '127.0.0.1', 'username', 'root', '/system/login/common', '[{\"code\":\"\",\"password\":\"123456\",\"username\":\"root\",\"uuid\":\"\"}]', 'cn.sky1998.mango.system.controller.LoginController.login', '2022-07-16 11:07:03');
INSERT INTO `sys_log` VALUES (45, 1, '系统用户登录', 0, 'root', '127.0.0.1', 'username', 'root', '/system/login/common', '[{\"code\":\"\",\"password\":\"123456\",\"username\":\"root\",\"uuid\":\"\"}]', 'cn.sky1998.mango.system.controller.LoginController.login', '2022-07-16 11:07:06');
INSERT INTO `sys_log` VALUES (46, 1, '系统用户登录', 0, 'root', '127.0.0.1', 'username', 'root', '/system/login/common', '[{\"code\":\"\",\"password\":\"123456\",\"username\":\"root\",\"uuid\":\"88bc67d69ba645fb91d97a59146676aa\"}]', 'cn.sky1998.mango.system.controller.LoginController.login', '2022-07-18 11:44:05');
INSERT INTO `sys_log` VALUES (47, 1, '系统用户登录', 0, 'root', '127.0.0.1', 'username', 'root', '/system/login/common', '[{\"code\":\"\",\"password\":\"123456\",\"username\":\"root\",\"uuid\":\"88bc67d69ba645fb91d97a59146676aa\"}]', 'cn.sky1998.mango.system.controller.LoginController.login', '2022-07-18 11:44:06');
INSERT INTO `sys_log` VALUES (48, 1, '系统用户登录', 0, 'root', '127.0.0.1', 'username', 'root', '/system/login/common', '[{\"code\":\"\",\"password\":\"123456\",\"username\":\"root\",\"uuid\":\"\"}]', 'cn.sky1998.mango.system.controller.LoginController.login', '2022-07-19 10:36:01');
INSERT INTO `sys_log` VALUES (49, 1, '系统用户登录', 0, 'root', '127.0.0.1', 'username', 'root', '/system/login/common', '[{\"code\":\"\",\"password\":\"123456\",\"username\":\"root\",\"uuid\":\"\"}]', 'cn.sky1998.mango.system.controller.LoginController.login', '2022-07-19 10:36:03');
INSERT INTO `sys_log` VALUES (50, 1, '系统用户登录', 0, 'root', '127.0.0.1', 'username', 'root', '/system/login/common', '[{\"code\":\"\",\"password\":\"123456\",\"username\":\"root\",\"uuid\":\"2960f148e7a44d8c8ae4c68165723415\"}]', 'cn.sky1998.mango.system.controller.LoginController.login', '2022-07-19 18:02:46');

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
                             `is_frame` int(1) NULL DEFAULT 0 COMMENT '是否为外链（1是 0否）',
                             `is_cache` int(1) NULL DEFAULT 1 COMMENT '是否缓存（1缓存 0不缓存）',
                             `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
                             `visible` tinyint(4) NULL DEFAULT 1 COMMENT '菜单状态（1显示 0隐藏）',
                             `status` tinyint(4) NULL DEFAULT 1 COMMENT '菜单状态（1正常 0停用）',
                             `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
                             `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
                             `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
                             `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                             `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
                             `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
                             `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
                             PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '用户管理', 4, 1, '/pages/user', 'system/user/user', NULL, 0, 1, 'C', 1, 1, NULL, 'el-icon-user', '', '2022-04-24 15:51:49', '', NULL, '用户管理');
INSERT INTO `sys_menu` VALUES (2, '角色管理', 4, 2, '/pages/role', 'system/role/role', NULL, 0, 1, 'C', 1, 1, NULL, 'el-icon-s-check', '', '2022-04-24 15:51:55', '', NULL, '角色管理');
INSERT INTO `sys_menu` VALUES (3, '菜单管理', 4, 3, '/pages/menu', 'system/menu/index', NULL, 0, 1, 'C', 1, 1, '', 'el-icon-menu', '', '2022-04-24 15:52:00', '', '2022-04-24 16:21:08', '菜单管理');
INSERT INTO `sys_menu` VALUES (4, '系统管理', 0, 1, '', '', NULL, 0, 1, 'M', 1, 1, NULL, 'el-icon-menu', '', '2022-04-24 15:52:01', '', NULL, '系统管理');
INSERT INTO `sys_menu` VALUES (5, '系统工具', 0, 2, '', '', NULL, 0, 1, 'M', 1, 1, NULL, 'el-icon-s-tools', '', '2022-04-24 15:52:02', '', NULL, '系统工具');
INSERT INTO `sys_menu` VALUES (6, '代码生成', 5, 1, '/pages/createCode', 'system/gen/index', NULL, 0, 1, 'C', 1, 1, NULL, 'el-icon-notebook-2', '', '2022-04-24 15:52:04', '', NULL, '代码生成');
INSERT INTO `sys_menu` VALUES (7, '业务管理', 0, 3, '', '', NULL, 0, 1, 'M', 1, 1, NULL, 'el-icon-notebook-2', '', '2022-04-24 15:52:05', '', NULL, '业务管理');
INSERT INTO `sys_menu` VALUES (12, '菜单测试', 4, 1, '/', NULL, NULL, 0, 1, 'C', 1, 1, NULL, '404', 'admin', '2022-04-24 16:15:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (13, '用户增加', 1, 1, '', NULL, NULL, 0, 1, 'F', 1, 1, 'system:user:add', '#', '', NULL, '', NULL, '');
INSERT INTO `sys_menu` VALUES (14, '用户删除', 1, 2, '', NULL, NULL, 0, 1, 'F', 1, 1, 'system:user:remove', '#', '', NULL, '', NULL, '');
INSERT INTO `sys_menu` VALUES (15, '用户修改', 1, 1, '', NULL, NULL, 0, 1, 'F', 1, 1, 'system:user:update', '#', '', NULL, '', NULL, '');
INSERT INTO `sys_menu` VALUES (16, '用户查询', 1, 1, '', NULL, NULL, 0, 1, 'F', 1, 1, 'system:user:list', '#', '', NULL, '', NULL, '');
INSERT INTO `sys_menu` VALUES (17, '日志管理', 4, 5, '/pages/sysLog', 'system/log/index', NULL, 0, 1, 'C', 1, 1, NULL, 'el-icon-notebook-2', '', NULL, '', NULL, '');
INSERT INTO `sys_menu` VALUES (18, '字典管理', 4, 4, '/pages/dict', 'system/dict/index', NULL, 0, 1, 'C', 1, 1, '', 'el-icon-s-tools', '', NULL, '', NULL, '');
INSERT INTO `sys_menu` VALUES (19, '课程管理', 7, 0, '/pages/workCourse', 'work/course/index', NULL, 0, 1, 'C', 1, 1, NULL, 'el-icon-notebook-2', '', NULL, '', NULL, '');
INSERT INTO `sys_menu` VALUES (20, '学生成绩管理', 7, 0, '/pages/workStudent', 'work/student/index', NULL, 0, 1, 'C', 1, 1, NULL, 'el-icon-notebook-2', '', NULL, '', NULL, '');
INSERT INTO `sys_menu` VALUES (26, '通知公告功能名', 7, 0, '/pages/SysNotice', 'work/notice/index', NULL, 0, 1, 'C', 1, 1, NULL, 'el-icon-notebook-2', '', NULL, '', NULL, '');
INSERT INTO `sys_menu` VALUES (27, '定时任务', 5, 2, '/pages/job', 'system/quartz/index', NULL, 0, 1, 'C', 1, 1, NULL, 'el-icon-notebook-2', '', '2022-04-24 15:52:04', '', NULL, '代码生成');

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
                             `enable` tinyint(4) UNSIGNED ZEROFILL NULL DEFAULT 0001 COMMENT '可用状态',
                             `del` tinyint(4) UNSIGNED ZEROFILL NULL DEFAULT 0001 COMMENT '删除标记',
                             `remark` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
                             PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, 'admin', '系统管理员', 1, 0001, 0001, '系统管理员');
INSERT INTO `sys_role` VALUES (2, 'register', '注册用户', 2, 0001, 0001, '公众号注册用户');
INSERT INTO `sys_role` VALUES (3, 'visitor', '游客', 3, 0001, 0001, '游客登录');
INSERT INTO `sys_role` VALUES (4, 'vip', '黄金用户', 5, 0001, 0001, '赞助者');
INSERT INTO `sys_role` VALUES (5, 'test1', '测试1', 6, 0001, 0001, '备注');
INSERT INTO `sys_role` VALUES (6, 'runner', '运营', 0, 0001, 0001, NULL);
INSERT INTO `sys_role` VALUES (7, 'work', '业务', 0, 0001, 0001, NULL);
INSERT INTO `sys_role` VALUES (8, 'test2', 'test2', 3, 0001, 0001, '');
INSERT INTO `sys_role` VALUES (10, 'root', '超管', 10, 0001, 0001, '超管');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
                                  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
                                  `role_id` bigint(20) NOT NULL COMMENT '角色id',
                                  `menu_id` bigint(20) NOT NULL COMMENT '菜单id',
                                  `enable` tinyint(4) UNSIGNED ZEROFILL NOT NULL DEFAULT 0001 COMMENT '可用状态',
                                  `del` tinyint(4) NOT NULL DEFAULT 1 COMMENT '删除标记',
                                  `remark` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
                                  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 262 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色菜单关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (103, 8, 4, 0001, 1, NULL);
INSERT INTO `sys_role_menu` VALUES (104, 8, 1, 0001, 1, NULL);
INSERT INTO `sys_role_menu` VALUES (105, 8, 12, 0001, 1, NULL);
INSERT INTO `sys_role_menu` VALUES (106, 8, 2, 0001, 1, NULL);
INSERT INTO `sys_role_menu` VALUES (107, 8, 3, 0001, 1, NULL);
INSERT INTO `sys_role_menu` VALUES (108, 8, 5, 0001, 1, NULL);
INSERT INTO `sys_role_menu` VALUES (109, 8, 6, 0001, 1, NULL);
INSERT INTO `sys_role_menu` VALUES (110, 8, 7, 0001, 1, NULL);
INSERT INTO `sys_role_menu` VALUES (111, 8, 11, 0001, 1, NULL);
INSERT INTO `sys_role_menu` VALUES (112, 8, 13, 0001, 1, NULL);
INSERT INTO `sys_role_menu` VALUES (121, 7, 7, 0001, 1, NULL);
INSERT INTO `sys_role_menu` VALUES (122, 7, 11, 0001, 1, NULL);
INSERT INTO `sys_role_menu` VALUES (123, 7, 13, 0001, 1, NULL);
INSERT INTO `sys_role_menu` VALUES (124, 7, 17, 0001, 1, NULL);
INSERT INTO `sys_role_menu` VALUES (125, 7, 18, 0001, 1, NULL);
INSERT INTO `sys_role_menu` VALUES (168, 6, 4, 0001, 1, NULL);
INSERT INTO `sys_role_menu` VALUES (169, 6, 1, 0001, 1, NULL);
INSERT INTO `sys_role_menu` VALUES (170, 6, 13, 0001, 1, NULL);
INSERT INTO `sys_role_menu` VALUES (171, 6, 7, 0001, 1, NULL);
INSERT INTO `sys_role_menu` VALUES (186, 2, 4, 0001, 1, NULL);
INSERT INTO `sys_role_menu` VALUES (187, 2, 1, 0001, 1, NULL);
INSERT INTO `sys_role_menu` VALUES (218, 1, 4, 0001, 1, NULL);
INSERT INTO `sys_role_menu` VALUES (219, 1, 1, 0001, 1, NULL);
INSERT INTO `sys_role_menu` VALUES (220, 1, 13, 0001, 1, NULL);
INSERT INTO `sys_role_menu` VALUES (221, 1, 2, 0001, 1, NULL);
INSERT INTO `sys_role_menu` VALUES (222, 1, 3, 0001, 1, NULL);
INSERT INTO `sys_role_menu` VALUES (223, 1, 18, 0001, 1, NULL);
INSERT INTO `sys_role_menu` VALUES (224, 1, 17, 0001, 1, NULL);
INSERT INTO `sys_role_menu` VALUES (225, 1, 7, 0001, 1, NULL);
INSERT INTO `sys_role_menu` VALUES (226, 1, 19, 0001, 1, NULL);
INSERT INTO `sys_role_menu` VALUES (240, 1, 20, 0001, 1, NULL);
INSERT INTO `sys_role_menu` VALUES (246, 1, 26, 0001, 1, NULL);
INSERT INTO `sys_role_menu` VALUES (247, 10, 4, 0001, 1, NULL);
INSERT INTO `sys_role_menu` VALUES (248, 10, 1, 0001, 1, NULL);
INSERT INTO `sys_role_menu` VALUES (249, 10, 7, 0001, 1, NULL);
INSERT INTO `sys_role_menu` VALUES (250, 10, 13, 0001, 1, NULL);
INSERT INTO `sys_role_menu` VALUES (251, 10, 15, 0001, 1, NULL);
INSERT INTO `sys_role_menu` VALUES (252, 10, 14, 0001, 1, NULL);
INSERT INTO `sys_role_menu` VALUES (253, 10, 2, 0001, 1, NULL);
INSERT INTO `sys_role_menu` VALUES (254, 10, 3, 0001, 1, NULL);
INSERT INTO `sys_role_menu` VALUES (255, 10, 18, 0001, 1, NULL);
INSERT INTO `sys_role_menu` VALUES (256, 10, 17, 0001, 1, NULL);
INSERT INTO `sys_role_menu` VALUES (257, 10, 5, 0001, 1, NULL);
INSERT INTO `sys_role_menu` VALUES (258, 10, 6, 0001, 1, NULL);
INSERT INTO `sys_role_menu` VALUES (259, 10, 27, 0001, 1, NULL);
INSERT INTO `sys_role_menu` VALUES (261, 10, 19, 0001, 1, NULL);

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
