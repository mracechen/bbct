/*
 Navicat Premium Data Transfer

 Source Server         : bbctdb
 Source Server Type    : MySQL
 Source Server Version : 80015
 Source Host           : 10.236.10.1:3306
 Source Schema         : bbctdb

 Target Server Type    : MySQL
 Target Server Version : 80015
 File Encoding         : 65001

 Date: 30/09/2019 09:43:05
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sw_app_info
-- ----------------------------
DROP TABLE IF EXISTS `sw_app_info`;
CREATE TABLE `sw_app_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '版本编号',
  `version` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'app版本',
  `downloadurl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '整包下载地址',
  `downloadurl1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部分更新地址',
  `version_number` int(11) NULL DEFAULT NULL COMMENT '版本编号',
  `create_time` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  `download_ios` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分包下载ios',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'app更新记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sw_app_info
-- ----------------------------
INSERT INTO `sw_app_info` VALUES (22, '1.3.0', 'http://bbct.kkg222.com/files/e3c832b2-f701-4c64-8992-2d1ff6830c64.apk', 'http://bbct.kkg222.com/files/5f764bbc-c1a5-4918-aae4-a893afbfda69.wgt', NULL, '2019-09-26 18:15:54.876000', '');
INSERT INTO `sw_app_info` VALUES (24, '1.4.0', 'http://bbct.kkg222.com/files/e3c832b2-f701-4c64-8992-2d1ff6830c64.apk', 'http://bbct.kkg222.com/files/a53db071-3090-4e6d-b00c-14fd1e432542.wgt', NULL, '2019-09-27 17:27:00.952000', '');
INSERT INTO `sw_app_info` VALUES (26, '1.5.0', 'http://bbct.kkg222.com/files/e3c832b2-f701-4c64-8992-2d1ff6830c64.apk', 'http://bbct.kkg222.com/files/c3b1558e-8d1a-4af2-b851-fbef77e4e117.wgt', NULL, '2019-09-27 17:43:11.879000', '');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '上级部门ID，一级部门为0',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门名称',
  `order_num` int(11) NULL DEFAULT NULL COMMENT '排序',
  `del_flag` tinyint(4) NULL DEFAULT 0 COMMENT '是否删除  -1：已删除  0：正常',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (6, 0, '研发部', 1, 0);
INSERT INTO `sys_dept` VALUES (11, 0, '产品部', 3, 0);
INSERT INTO `sys_dept` VALUES (13, 0, '测试部', 5, 0);
INSERT INTO `sys_dept` VALUES (19, 0, '设计部', 2, 0);
INSERT INTO `sys_dept` VALUES (26, 0, '市场部', 6, 0);

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict`  (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '标签名',
  `value` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '数据值',
  `type` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '类型',
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '描述',
  `sort` decimal(10, 0) NULL DEFAULT NULL COMMENT '排序（升序）',
  `parent_id` bigint(64) NULL DEFAULT 0 COMMENT '父级编号',
  `create_by` int(64) NULL DEFAULT NULL COMMENT '创建者',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(64) NULL DEFAULT NULL COMMENT '更新者',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sys_dict_value`(`value`) USING BTREE,
  INDEX `sys_dict_label`(`name`) USING BTREE,
  INDEX `sys_dict_del_flag`(`del_flag`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 123 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '字典表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES (1, '正常', '0', 'del_flag', '删除标记', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (3, '显示', '1', 'show_hide', '显示/隐藏', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (4, '隐藏', '0', 'show_hide', '显示/隐藏', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (5, '是', '1', 'yes_no', '是/否', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (6, '否', '0', 'yes_no', '是/否', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (7, '红色', 'red', 'color', '颜色值', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (8, '绿色', 'green', 'color', '颜色值', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (9, '蓝色', 'blue', 'color', '颜色值', 30, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (10, '黄色', 'yellow', 'color', '颜色值', 40, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (11, '橙色', 'orange', 'color', '颜色值', 50, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (12, '默认主题', 'default', 'theme', '主题方案', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (13, '天蓝主题', 'cerulean', 'theme', '主题方案', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (14, '橙色主题', 'readable', 'theme', '主题方案', 30, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (15, '红色主题', 'united', 'theme', '主题方案', 40, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (16, 'Flat主题', 'flat', 'theme', '主题方案', 60, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (17, '国家', '1', 'sys_area_type', '区域类型', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (18, '省份、直辖市', '2', 'sys_area_type', '区域类型', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (19, '地市', '3', 'sys_area_type', '区域类型', 30, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (20, '区县', '4', 'sys_area_type', '区域类型', 40, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (21, '公司', '1', 'sys_office_type', '机构类型', 60, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (22, '部门', '2', 'sys_office_type', '机构类型', 70, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (23, '小组', '3', 'sys_office_type', '机构类型', 80, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (24, '其它', '4', 'sys_office_type', '机构类型', 90, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (25, '综合部', '1', 'sys_office_common', '快捷通用部门', 30, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (26, '开发部', '2', 'sys_office_common', '快捷通用部门', 40, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (27, '人力部', '3', 'sys_office_common', '快捷通用部门', 50, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (28, '一级', '1', 'sys_office_grade', '机构等级', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (29, '二级', '2', 'sys_office_grade', '机构等级', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (30, '三级', '3', 'sys_office_grade', '机构等级', 30, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (31, '四级', '4', 'sys_office_grade', '机构等级', 40, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (32, '所有数据', '1', 'sys_data_scope', '数据范围', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (33, '所在公司及以下数据', '2', 'sys_data_scope', '数据范围', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (34, '所在公司数据', '3', 'sys_data_scope', '数据范围', 30, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (35, '所在部门及以下数据', '4', 'sys_data_scope', '数据范围', 40, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (36, '所在部门数据', '5', 'sys_data_scope', '数据范围', 50, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (37, '仅本人数据', '8', 'sys_data_scope', '数据范围', 90, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (38, '按明细设置', '9', 'sys_data_scope', '数据范围', 100, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (39, '系统管理', '1', 'sys_user_type', '用户类型', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (40, '部门经理', '2', 'sys_user_type', '用户类型', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (41, '普通用户', '3', 'sys_user_type', '用户类型', 30, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (42, '基础主题', 'basic', 'cms_theme', '站点主题', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (43, '蓝色主题', 'blue', 'cms_theme', '站点主题', 20, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (44, '红色主题', 'red', 'cms_theme', '站点主题', 30, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (45, '文章模型', 'article', 'cms_module', '栏目模型', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (46, '图片模型', 'picture', 'cms_module', '栏目模型', 20, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (47, '下载模型', 'download', 'cms_module', '栏目模型', 30, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (48, '链接模型', 'link', 'cms_module', '栏目模型', 40, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (49, '专题模型', 'special', 'cms_module', '栏目模型', 50, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (50, '默认展现方式', '0', 'cms_show_modes', '展现方式', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (51, '首栏目内容列表', '1', 'cms_show_modes', '展现方式', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (52, '栏目第一条内容', '2', 'cms_show_modes', '展现方式', 30, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (53, '发布', '0', 'cms_del_flag', '内容状态', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (54, '删除', '1', 'cms_del_flag', '内容状态', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (55, '审核', '2', 'cms_del_flag', '内容状态', 15, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (56, '首页焦点图', '1', 'cms_posid', '推荐位', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (57, '栏目页文章推荐', '2', 'cms_posid', '推荐位', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (58, '咨询', '1', 'cms_guestbook', '留言板分类', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (59, '建议', '2', 'cms_guestbook', '留言板分类', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (60, '投诉', '3', 'cms_guestbook', '留言板分类', 30, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (61, '其它', '4', 'cms_guestbook', '留言板分类', 40, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (67, '接入日志', '1', 'sys_log_type', '日志类型', 30, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (68, '异常日志', '2', 'sys_log_type', '日志类型', 40, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (73, '增删改查', 'crud', 'gen_category', '代码生成分类', 10, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (74, '增删改查（包含从表）', 'crud_many', 'gen_category', '代码生成分类', 20, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (75, '树结构', 'tree', 'gen_category', '代码生成分类', 30, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (76, '=', '=', 'gen_query_type', '查询方式', 10, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (77, '!=', '!=', 'gen_query_type', '查询方式', 20, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (78, '&gt;', '&gt;', 'gen_query_type', '查询方式', 30, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (79, '&lt;', '&lt;', 'gen_query_type', '查询方式', 40, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (80, 'Between', 'between', 'gen_query_type', '查询方式', 50, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (81, 'Like', 'like', 'gen_query_type', '查询方式', 60, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (82, 'Left Like', 'left_like', 'gen_query_type', '查询方式', 70, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (83, 'Right Like', 'right_like', 'gen_query_type', '查询方式', 80, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (84, '文本框', 'input', 'gen_show_type', '字段生成方案', 10, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (85, '文本域', 'textarea', 'gen_show_type', '字段生成方案', 20, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (86, '下拉框', 'select', 'gen_show_type', '字段生成方案', 30, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (87, '复选框', 'checkbox', 'gen_show_type', '字段生成方案', 40, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (88, '单选框', 'radiobox', 'gen_show_type', '字段生成方案', 50, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (89, '日期选择', 'dateselect', 'gen_show_type', '字段生成方案', 60, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (90, '人员选择', 'userselect', 'gen_show_type', '字段生成方案', 70, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (91, '部门选择', 'officeselect', 'gen_show_type', '字段生成方案', 80, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (92, '区域选择', 'areaselect', 'gen_show_type', '字段生成方案', 90, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (93, 'String', 'String', 'gen_java_type', 'Java类型', 10, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (94, 'Long', 'Long', 'gen_java_type', 'Java类型', 20, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (95, '仅持久层', 'dao', 'gen_category', '代码生成分类', 40, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (96, '男', '1', 'sex', '性别', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (97, '女', '2', 'sex', '性别', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (98, 'Integer', 'Integer', 'gen_java_type', 'Java类型', 30, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (99, 'Double', 'Double', 'gen_java_type', 'Java类型', 40, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (100, 'Date', 'java.util.Date', 'gen_java_type', 'Java类型', 50, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (104, 'Custom', 'Custom', 'gen_java_type', 'Java类型', 90, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (113, '删除', '0', 'del_flag', '删除标记', NULL, NULL, NULL, NULL, NULL, NULL, '', '');
INSERT INTO `sys_dict` VALUES (121, '编码', 'code', 'hobby', '爱好', NULL, NULL, NULL, NULL, NULL, NULL, '', '');
INSERT INTO `sys_dict` VALUES (122, '绘画', 'painting', 'hobby', '爱好', 1, NULL, NULL, NULL, NULL, NULL, '', '');

-- ----------------------------
-- Table structure for sys_file
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` int(11) NULL DEFAULT NULL COMMENT '文件类型',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'URL地址',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1309 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文件上传' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_file
-- ----------------------------
INSERT INTO `sys_file` VALUES (1006, 0, '/files/52cf52d9-ed3e-4601-b02d-86b5668b53ce.jpg', '2019-04-11 10:55:44');
INSERT INTO `sys_file` VALUES (1007, 0, '/files/1bf4bb17-eb35-473b-b553-13e983837146.jpg', '2019-04-11 10:55:53');
INSERT INTO `sys_file` VALUES (1008, 0, '/files/4d21d06e-8074-4a60-a865-eb05944fc44e.jpg', '2019-04-11 10:55:59');
INSERT INTO `sys_file` VALUES (1009, 0, '/files/b190a14f-404b-4363-a787-ff0b04af61a0.jpg', '2019-04-11 11:09:09');
INSERT INTO `sys_file` VALUES (1010, 0, '/files/db953290-e10e-4d94-a96e-36f3b5f1281f.jpg', '2019-04-11 11:09:13');
INSERT INTO `sys_file` VALUES (1011, 0, '/files/f8567c03-58be-462c-812d-46eb67c0facb.jpg', '2019-04-11 11:09:17');
INSERT INTO `sys_file` VALUES (1012, 0, '/files/b53b5ddb-0ec2-42dc-9d07-78fa306a825f.jpg', '2019-04-11 11:10:18');
INSERT INTO `sys_file` VALUES (1013, 0, '/files/20e737ae-6e06-4d05-8c02-c22207fa0fcd.jpg', '2019-04-11 11:10:32');
INSERT INTO `sys_file` VALUES (1014, 0, '/files/3c9ad808-90d1-460d-b23e-21b8e3dffe8d.jpg', '2019-04-11 11:10:39');
INSERT INTO `sys_file` VALUES (1015, 0, '/files/3c8207f3-ef00-4e6b-96fc-f9b95a3f5c6c.jpg', '2019-04-11 11:27:43');
INSERT INTO `sys_file` VALUES (1016, 0, '/files/880a6898-28d9-4590-a163-9a1a470b6393.jpg', '2019-04-11 11:28:09');
INSERT INTO `sys_file` VALUES (1017, 0, '/files/cf9407a7-917e-43ea-b3b8-e18587b25dcb.jpg', '2019-04-11 11:28:20');
INSERT INTO `sys_file` VALUES (1018, 0, '/files/81771593-71a2-414d-b725-04dfcb6f0411.jpg', '2019-04-11 11:30:30');
INSERT INTO `sys_file` VALUES (1019, 0, '/files/aa33b268-0557-4389-84e1-85fa02c269a8.jpg', '2019-04-11 11:30:36');
INSERT INTO `sys_file` VALUES (1020, 0, '/files/62590972-5ce7-4aa0-8402-62ac3f580ff1.jpg', '2019-04-11 11:30:44');
INSERT INTO `sys_file` VALUES (1021, 0, '/files/8c9348eb-2061-4f26-8a05-394fe5c22821.jpg', '2019-04-11 11:32:38');
INSERT INTO `sys_file` VALUES (1022, 0, '/files/b423f6cb-1ea7-43d9-9f96-84bcddffe16a.jpg', '2019-04-11 11:32:45');
INSERT INTO `sys_file` VALUES (1023, 0, '/files/c6dbea06-0ce3-4bb0-b8de-02c6c4f8bae3.jpg', '2019-04-11 11:32:51');
INSERT INTO `sys_file` VALUES (1024, 0, '/files/96b479fb-6bb6-4df0-91af-ea03f789aaac.jpg', '2019-04-11 11:34:42');
INSERT INTO `sys_file` VALUES (1025, 0, '/files/31e26dfe-80a2-4acc-a7e0-714bbc12b750.jpg', '2019-04-11 11:34:57');
INSERT INTO `sys_file` VALUES (1026, 0, '/files/a13e898a-27ec-4544-b293-a937eda6fb6a.jpg', '2019-04-11 11:35:16');
INSERT INTO `sys_file` VALUES (1027, 0, '/files/84f83862-355c-48e5-b8fa-c5f422548ea8.jpg', '2019-04-11 11:52:43');
INSERT INTO `sys_file` VALUES (1028, 0, '/files/1ac2a328-a931-42ec-8120-290505e0eebf.jpg', '2019-04-11 11:52:48');
INSERT INTO `sys_file` VALUES (1029, 0, '/files/80cb5545-835e-4dff-b29d-fdba45aec206.jpg', '2019-04-11 11:52:55');
INSERT INTO `sys_file` VALUES (1030, 0, '/files/4e3d19fd-208e-43c5-9eb0-3741744d06c7.jpg', '2019-04-11 11:55:21');
INSERT INTO `sys_file` VALUES (1031, 0, '/files/a360d77a-ef3a-4703-85e8-3e460ea5efb1.jpg', '2019-04-11 11:55:26');
INSERT INTO `sys_file` VALUES (1032, 0, '/files/1792682d-66b4-4c6b-a73c-73969b53b71f.jpg', '2019-04-11 11:55:32');
INSERT INTO `sys_file` VALUES (1033, 0, '/files/9e1a2227-a7a7-4dba-a4aa-17c04a44efea.jpg', '2019-04-11 11:57:12');
INSERT INTO `sys_file` VALUES (1034, 0, '/files/1313affa-7f5f-4be1-b87c-e38c764b7fc8.jpg', '2019-04-11 11:57:17');
INSERT INTO `sys_file` VALUES (1035, 0, '/files/0c521239-ca42-49af-b246-365a21cf7e6f.jpg', '2019-04-11 11:57:28');
INSERT INTO `sys_file` VALUES (1036, 0, '/files/581bc515-76ef-41f5-92fe-92b50c0fcbc2.jpg', '2019-04-11 12:01:00');
INSERT INTO `sys_file` VALUES (1037, 0, '/files/c9f3557f-5e89-4183-818c-abf961452cda.jpg', '2019-04-11 12:01:06');
INSERT INTO `sys_file` VALUES (1038, 0, '/files/3115f3ba-1bd0-4e6d-9cbc-bd2eaea1fb0f.jpg', '2019-04-11 12:01:12');
INSERT INTO `sys_file` VALUES (1039, 0, '/files/3131d327-1622-48f1-848a-e334d8d89d7c.jpg', '2019-04-11 14:07:19');
INSERT INTO `sys_file` VALUES (1040, 0, '/files/61333b0a-86cf-4b4f-afb1-316c068077ab.jpg', '2019-04-11 14:07:25');
INSERT INTO `sys_file` VALUES (1041, 0, '/files/35214cb1-9e69-4e24-bd52-ff482e775000.jpg', '2019-04-11 14:07:31');
INSERT INTO `sys_file` VALUES (1042, 0, '/files/881bf8ed-a747-4767-8b68-8d18fa11ff1d.jpg', '2019-04-11 14:20:36');
INSERT INTO `sys_file` VALUES (1043, 0, '/files/95b367b1-075b-48a2-bc09-b746a3997794.jpg', '2019-04-11 14:25:26');
INSERT INTO `sys_file` VALUES (1044, 0, '/files/749427bd-257d-4329-8c9f-4d5ffa36e5ff.jpg', '2019-04-11 14:35:28');
INSERT INTO `sys_file` VALUES (1045, 0, '/files/43d08ad6-4b6e-44d2-904a-879e4bc7633b.jpg', '2019-04-11 14:57:26');
INSERT INTO `sys_file` VALUES (1046, 0, '/files/8fb8c516-6d90-4e80-8030-5613d1060af0.jpg', '2019-04-11 14:58:52');
INSERT INTO `sys_file` VALUES (1047, 0, '/files/6a19f402-41f0-4c69-a4d1-14cfcd484a73.jpg', '2019-04-11 17:27:55');
INSERT INTO `sys_file` VALUES (1048, 0, '/files/a2fea45a-583a-4a33-b79a-6b319f757668.jpg', '2019-04-11 17:28:08');
INSERT INTO `sys_file` VALUES (1049, 0, '/files/6320887b-f350-4222-9186-1491b222179c.jpg', '2019-04-11 17:40:08');
INSERT INTO `sys_file` VALUES (1050, 0, '/files/0979ae3f-b9c6-48cc-8c2b-fef49f130ba6.jpg', '2019-04-11 17:42:42');
INSERT INTO `sys_file` VALUES (1051, 0, '/files/51a4e426-bb7d-4f1f-8629-28190453aa8c.jpg', '2019-04-11 17:42:57');
INSERT INTO `sys_file` VALUES (1052, 0, '/files/750b9d63-25e5-43de-a8d0-0f8d66c637d6.jpg', '2019-04-11 17:43:18');
INSERT INTO `sys_file` VALUES (1053, 0, '/files/a486c178-15b6-4b50-b61d-0703c1161329.jpg', '2019-04-11 17:43:30');
INSERT INTO `sys_file` VALUES (1054, 0, '/files/aa5376c9-44be-4aee-97cb-fe0f244682b8.jpg', '2019-04-11 18:00:24');
INSERT INTO `sys_file` VALUES (1055, 0, '/files/44672db3-666c-4338-a535-4f40ac982a4c.jpg', '2019-04-11 18:00:35');
INSERT INTO `sys_file` VALUES (1056, 0, '/files/625d946a-7dd9-414d-8808-6deb11ac1840.jpg', '2019-04-11 18:00:55');
INSERT INTO `sys_file` VALUES (1057, 0, '/files/841234a1-87f3-4649-83df-ea8c8b71a5c5.jpg', '2019-04-11 18:57:21');
INSERT INTO `sys_file` VALUES (1058, 0, '/files/c856cb25-f341-4aa9-984a-f0a8f461336f.jpg', '2019-04-11 18:57:38');
INSERT INTO `sys_file` VALUES (1059, 0, '/files/5858d3f8-24f6-4359-a973-11ab727ab9d9.jpg', '2019-04-11 19:00:37');
INSERT INTO `sys_file` VALUES (1060, 0, '/files/80640244-bce8-4712-9341-46fb1b408910.jpg', '2019-04-11 19:09:32');
INSERT INTO `sys_file` VALUES (1061, 0, '/files/599802de-89b8-4bd0-b26d-3dac18a476ff.jpg', '2019-04-11 19:11:17');
INSERT INTO `sys_file` VALUES (1062, 0, '/files/a12ae530-2092-4e4b-9d40-8861d8da4fef.jpg', '2019-04-11 19:18:16');
INSERT INTO `sys_file` VALUES (1063, 0, '/files/7e3aa5c3-1667-4bf3-8570-f90fcf08e465.jpg', '2019-04-11 19:37:58');
INSERT INTO `sys_file` VALUES (1064, 0, '/files/296b8057-2273-4d47-9c3e-e5f3e1046df5.jpg', '2019-04-11 19:44:10');
INSERT INTO `sys_file` VALUES (1065, 0, '/files/01a7646e-b689-478a-bfec-ac1033f7fa70.jpg', '2019-04-11 19:52:57');
INSERT INTO `sys_file` VALUES (1066, 0, '/files/f8821d32-bad5-483d-9435-0ea2fbbba826.jpg', '2019-04-11 19:53:54');
INSERT INTO `sys_file` VALUES (1067, 0, '/files/d670e640-582c-4415-bc53-84e31b7337c2.jpg', '2019-04-11 19:54:09');
INSERT INTO `sys_file` VALUES (1068, 0, '/files/ecd4aa35-242b-4789-9a13-4ce0becedea6.jpg', '2019-04-11 19:54:27');
INSERT INTO `sys_file` VALUES (1069, 0, '/files/298e1557-a2aa-4966-b50d-2c3703f96038.jpg', '2019-04-11 19:54:48');
INSERT INTO `sys_file` VALUES (1070, 0, '/files/3bf5f90d-53a0-4387-aaed-4eccbd341869.jpg', '2019-04-12 10:54:30');
INSERT INTO `sys_file` VALUES (1071, 0, '/files/ba2e6546-3fdc-41d3-af79-e880fde3e0ac.jpg', '2019-04-12 10:55:46');
INSERT INTO `sys_file` VALUES (1072, 0, '/files/f696bae2-f65a-4c84-b460-4c88240823d2.jpg', '2019-04-12 11:04:35');
INSERT INTO `sys_file` VALUES (1073, 0, '/files/16c1120d-dc2d-4374-89ec-f031f27322c6.jpg', '2019-04-19 15:22:47');
INSERT INTO `sys_file` VALUES (1074, 0, '/files/496db90b-d571-495a-869d-4bde057eb90d.jpg', '2019-04-19 15:22:52');
INSERT INTO `sys_file` VALUES (1075, 0, '/files/bd556233-59c6-4632-a315-945e2adee530.jpg', '2019-04-19 15:22:56');
INSERT INTO `sys_file` VALUES (1076, 0, '/files/3a574a20-e3af-4cd5-af35-07e0116ac191.jpg', '2019-04-22 10:25:33');
INSERT INTO `sys_file` VALUES (1077, 0, '/files/f839b0e8-3496-4ce7-b6a6-3df807615396.jpg', '2019-04-22 10:25:44');
INSERT INTO `sys_file` VALUES (1078, 0, '/files/fbd34902-0825-4a76-b0e3-99107cb3ed58.jpg', '2019-04-22 10:25:48');
INSERT INTO `sys_file` VALUES (1079, 0, '/files/d567b34f-4952-4505-b1a9-2da56e028d11.jpg', '2019-04-22 11:39:49');
INSERT INTO `sys_file` VALUES (1080, 0, '/files/8bc5c82f-c377-4b21-a941-6774737ff7ca.jpg', '2019-04-22 11:39:54');
INSERT INTO `sys_file` VALUES (1081, 0, '/files/ce8b71c4-304a-45f4-8edd-988ff6218339.jpg', '2019-04-22 11:40:00');
INSERT INTO `sys_file` VALUES (1082, 0, '/files/276bdcd2-5e64-46d0-99e8-0e34b9b31c4c.jpg', '2019-04-22 11:52:14');
INSERT INTO `sys_file` VALUES (1083, 0, '/files/c298da9d-e8c9-47f0-aa48-4b841adc1abc.jpg', '2019-04-22 11:52:17');
INSERT INTO `sys_file` VALUES (1084, 0, '/files/6f13eed1-a512-402a-bc91-e5bfd88b7ce5.jpg', '2019-04-22 11:52:22');
INSERT INTO `sys_file` VALUES (1085, 0, '/files/1e40f874-e1dd-4196-bb40-dff7bebcaa07.jpg', '2019-04-22 11:55:21');
INSERT INTO `sys_file` VALUES (1086, 0, '/files/e8fe1be4-983b-48d2-8319-da092138176d.jpg', '2019-04-22 11:55:25');
INSERT INTO `sys_file` VALUES (1087, 0, '/files/22066c14-99d5-45c5-9693-b0a4be733fdb.jpg', '2019-04-22 11:55:29');
INSERT INTO `sys_file` VALUES (1088, 0, '/files/83a8dee9-e215-416d-b652-637ec5f6b308.jpg', '2019-04-22 12:07:38');
INSERT INTO `sys_file` VALUES (1089, 0, '/files/069c3a64-9bb3-4ee4-808a-f4763f475004.jpg', '2019-04-22 12:07:42');
INSERT INTO `sys_file` VALUES (1090, 0, '/files/8687c532-e2bb-4957-b36e-45d0ef1b70a7.jpg', '2019-04-22 12:07:46');
INSERT INTO `sys_file` VALUES (1091, 0, '/files/9dae630f-45db-4744-bf36-4f28932674dc.jpg', '2019-04-23 17:17:13');
INSERT INTO `sys_file` VALUES (1092, 0, '/files/800d089f-d567-4faf-af78-8e27372e7892.jpg', '2019-04-23 17:17:23');
INSERT INTO `sys_file` VALUES (1093, 0, '/files/c09671aa-780c-4d07-a813-dc94a52433b0.jpg', '2019-04-23 17:17:30');
INSERT INTO `sys_file` VALUES (1094, 0, '/files/28aeb2ff-8ad9-4e54-8b1b-7e16de01c1ff.jpg', '2019-04-23 17:23:34');
INSERT INTO `sys_file` VALUES (1095, 0, '/files/9b1987b4-4a2b-475a-8b76-7bbd7eb0099d.jpg', '2019-04-23 17:23:38');
INSERT INTO `sys_file` VALUES (1096, 0, '/files/bce48223-7dfb-4a46-a640-0c3162de4a38.jpg', '2019-04-23 17:23:42');
INSERT INTO `sys_file` VALUES (1097, 0, '/files/b514d15d-e976-44c5-a147-52af49eb8a93.jpg', '2019-04-23 17:41:56');
INSERT INTO `sys_file` VALUES (1098, 0, '/files/a880ed10-499b-40fd-a888-bccbb88d2fe0.jpg', '2019-04-23 17:42:00');
INSERT INTO `sys_file` VALUES (1099, 0, '/files/d4034f66-6306-45b1-9277-0d89cc5be64d.jpg', '2019-04-23 17:42:06');
INSERT INTO `sys_file` VALUES (1100, 0, '/files/06e684e3-2cd7-4a30-ba70-c5995e1436a9.jpg', '2019-04-23 18:01:50');
INSERT INTO `sys_file` VALUES (1101, 0, '/files/42ae2977-547d-4109-a3bf-e8e84e98b2df.jpg', '2019-04-23 18:01:53');
INSERT INTO `sys_file` VALUES (1102, 0, '/files/0aab18df-7508-4340-a4f0-0534244a17f3.jpg', '2019-04-23 18:01:56');
INSERT INTO `sys_file` VALUES (1103, 0, '/files/be2ad727-4134-42c3-a993-552a693bbbbe.jpg', '2019-04-23 18:05:24');
INSERT INTO `sys_file` VALUES (1104, 0, '/files/3f2a365b-888e-4146-a8d2-f843b5424f23.jpg', '2019-04-23 18:05:27');
INSERT INTO `sys_file` VALUES (1105, 0, '/files/89aba1df-b26f-44ac-bea6-b23d6e70bfd8.jpg', '2019-04-23 18:05:30');
INSERT INTO `sys_file` VALUES (1106, 0, '/files/df197310-fafc-46e8-9b86-735a28ac6e5f.jpg', '2019-04-23 18:06:16');
INSERT INTO `sys_file` VALUES (1107, 0, '/files/5d6f19ea-880b-4d09-9a3e-e0aedfbf6eab.jpg', '2019-04-23 18:14:36');
INSERT INTO `sys_file` VALUES (1108, 0, '/files/2129f27e-ed1a-4c4a-9e36-0ff2d719364e.jpg', '2019-04-23 19:10:05');
INSERT INTO `sys_file` VALUES (1109, 0, '/files/87b26304-7589-47ba-872b-42fb3a7edf58.jpg', '2019-04-23 19:10:08');
INSERT INTO `sys_file` VALUES (1110, 0, '/files/d5c06c05-49e7-45d7-9684-ffa42a395871.jpg', '2019-04-23 19:10:11');
INSERT INTO `sys_file` VALUES (1111, 0, '/files/2863c487-4305-4122-80d6-971c0a5c1bd0.jpg', '2019-04-23 19:15:57');
INSERT INTO `sys_file` VALUES (1112, 0, '/files/d5da8dc9-0845-45e4-bc56-dc589031015d.jpg', '2019-04-23 19:16:01');
INSERT INTO `sys_file` VALUES (1113, 0, '/files/2d3945b7-584c-453b-ab8f-1d5e4888bd9d.jpg', '2019-04-23 19:16:04');
INSERT INTO `sys_file` VALUES (1114, 0, '/files/d22b498b-f73e-4e86-81ef-66892eb4967f.jpg', '2019-04-23 19:23:31');
INSERT INTO `sys_file` VALUES (1115, 0, '/files/f367dfc9-fe39-41a8-8464-18b50cd45b51.jpg', '2019-04-23 19:23:34');
INSERT INTO `sys_file` VALUES (1116, 0, '/files/f521d072-3617-4357-a27d-894108b2c573.jpg', '2019-04-23 19:23:37');
INSERT INTO `sys_file` VALUES (1117, 0, '/files/ff0fab88-b730-4093-9edf-668ad2054850.jpg', '2019-04-23 19:37:03');
INSERT INTO `sys_file` VALUES (1118, 0, '/files/b770d872-9fa9-4e7b-a734-d818e5f49c93.jpg', '2019-04-23 19:37:05');
INSERT INTO `sys_file` VALUES (1119, 0, '/files/2f0d9e68-cc3d-4356-98d8-9abf165804dc.jpg', '2019-04-23 19:37:07');
INSERT INTO `sys_file` VALUES (1120, 0, '/files/bf6df173-f775-4655-bd23-96ec6989e380.jpg', '2019-04-23 19:41:30');
INSERT INTO `sys_file` VALUES (1121, 0, '/files/ab40c798-b22b-4cda-a1c2-cc9133a98855.jpg', '2019-04-23 19:41:33');
INSERT INTO `sys_file` VALUES (1122, 0, '/files/41ede240-2e40-48e2-9f78-f326d11fd9a1.jpg', '2019-04-23 19:41:36');
INSERT INTO `sys_file` VALUES (1123, 0, '/files/90879e30-48ee-4ce2-9dcc-cea7b86ce002.jpg', '2019-04-24 09:37:05');
INSERT INTO `sys_file` VALUES (1124, 0, '/files/68c60784-909f-46c6-aa1a-42482e3b2c13.jpg', '2019-04-24 09:37:08');
INSERT INTO `sys_file` VALUES (1125, 0, '/files/8bc465de-ef31-4555-a428-0447c4d11c7d.jpg', '2019-04-24 09:37:12');
INSERT INTO `sys_file` VALUES (1126, 0, '/files/fb401540-fb4f-4fc6-aad9-716eaaf7af00.jpg', '2019-04-24 09:39:18');
INSERT INTO `sys_file` VALUES (1127, 0, '/files/54b217fc-406c-4430-b31f-40bf4e056550.jpg', '2019-04-24 09:39:21');
INSERT INTO `sys_file` VALUES (1128, 0, '/files/5b755663-75d7-48e1-ab50-28f675596b40.jpg', '2019-04-24 09:39:24');
INSERT INTO `sys_file` VALUES (1129, 0, '/files/c4258098-da68-4a9e-8f33-3a9a8694ee2d.jpg', '2019-04-24 09:40:43');
INSERT INTO `sys_file` VALUES (1130, 0, '/files/89e63f80-4ec1-4134-8b3a-f340d95e1c29.jpg', '2019-04-24 09:40:46');
INSERT INTO `sys_file` VALUES (1131, 0, '/files/f3dc18e4-6f76-4f4b-87b7-858c7c338a50.jpg', '2019-04-24 09:40:48');
INSERT INTO `sys_file` VALUES (1132, 0, '/files/ad734e86-525a-4f7f-a339-5e93a8da4318.jpg', '2019-04-24 09:41:56');
INSERT INTO `sys_file` VALUES (1133, 0, '/files/cb122369-6a19-4412-aeb4-e27d9e6f07f6.jpg', '2019-04-24 09:41:58');
INSERT INTO `sys_file` VALUES (1134, 0, '/files/21fc980d-7828-44f5-8fd0-12eed4f7f5ca.jpg', '2019-04-24 09:42:01');
INSERT INTO `sys_file` VALUES (1135, 0, '/files/d7e4d87a-b48a-4833-8ec3-5216a31e21a6.jpg', '2019-04-24 09:43:04');
INSERT INTO `sys_file` VALUES (1136, 0, '/files/a47de6c3-d950-419b-8fc0-9e8b9dd0bcad.jpg', '2019-04-24 09:43:08');
INSERT INTO `sys_file` VALUES (1137, 0, '/files/9c4afb3f-9337-4c72-8209-323262e19be1.jpg', '2019-04-24 09:43:11');
INSERT INTO `sys_file` VALUES (1138, 0, '/files/e1aee19c-7fc2-4c2e-af6e-5bc6af885add.jpg', '2019-04-24 09:45:02');
INSERT INTO `sys_file` VALUES (1139, 0, '/files/506bf81e-caf7-4610-8760-70837e96cd1c.jpg', '2019-04-24 09:45:04');
INSERT INTO `sys_file` VALUES (1140, 0, '/files/5e2407c4-670a-4c82-bc2c-36dd9f2582bd.jpg', '2019-04-24 09:45:07');
INSERT INTO `sys_file` VALUES (1141, 0, '/files/54770af8-6771-47c1-9ec9-7df83ba14e5d.jpg', '2019-04-24 09:46:12');
INSERT INTO `sys_file` VALUES (1142, 0, '/files/d81b176f-bfe3-44a7-b2b6-24311d58f502.jpg', '2019-04-24 09:46:14');
INSERT INTO `sys_file` VALUES (1143, 0, '/files/48e9bffd-0793-4bf3-adfd-5879b27bd38a.jpg', '2019-04-24 09:46:17');
INSERT INTO `sys_file` VALUES (1144, 0, '/files/4ca363aa-1703-4807-9a8a-3e483e8bfc19.jpg', '2019-04-24 10:05:18');
INSERT INTO `sys_file` VALUES (1145, 0, '/files/2484a2bc-bcfb-4d72-8c4b-c5114e2ca89f.jpg', '2019-04-24 10:05:21');
INSERT INTO `sys_file` VALUES (1146, 0, '/files/b1f69710-302f-49c5-90ae-8a236e910846.jpg', '2019-04-24 10:05:23');
INSERT INTO `sys_file` VALUES (1147, 0, '/files/59ddd33a-dd86-43c6-8a9c-49a5b05ae686.jpg', '2019-04-24 10:06:37');
INSERT INTO `sys_file` VALUES (1148, 0, '/files/9807e7e6-cdde-459d-b191-103d97f165fd.jpg', '2019-04-24 10:06:42');
INSERT INTO `sys_file` VALUES (1149, 0, '/files/96b158f5-413d-42b8-93a3-e86388044b76.jpg', '2019-04-24 10:06:46');
INSERT INTO `sys_file` VALUES (1150, 0, '/files/ff8b130f-256a-4ac1-8539-f2a22f29d7fd.jpg', '2019-04-24 10:16:21');
INSERT INTO `sys_file` VALUES (1151, 0, '/files/3ba53083-54b9-4c33-9096-0fd4149b55a2.jpg', '2019-04-24 10:16:27');
INSERT INTO `sys_file` VALUES (1152, 0, '/files/13d60604-fb78-4040-a6aa-a125d6b7bd5f.jpg', '2019-04-24 10:16:30');
INSERT INTO `sys_file` VALUES (1153, 0, '/files/bb6a86f7-c5d0-4a36-bfde-149e14e996e8.jpg', '2019-04-24 10:17:53');
INSERT INTO `sys_file` VALUES (1154, 0, '/files/115f1be7-d75a-48c0-9163-25c251594ab2.jpg', '2019-04-24 10:17:57');
INSERT INTO `sys_file` VALUES (1155, 0, '/files/4ad11882-c9ba-485b-83ad-97b77fee5873.jpg', '2019-04-24 10:17:59');
INSERT INTO `sys_file` VALUES (1156, 0, '/files/b9a6c612-f24f-4929-8d9c-8c90ab7b7827.jpg', '2019-04-24 10:21:14');
INSERT INTO `sys_file` VALUES (1157, 0, '/files/e705fc83-595a-4643-96e2-4a25ecad7f9e.jpg', '2019-04-24 10:21:16');
INSERT INTO `sys_file` VALUES (1158, 0, '/files/5c8d4e9a-da7d-46fa-b4e5-c20a030f8136.jpg', '2019-04-24 10:21:19');
INSERT INTO `sys_file` VALUES (1159, 0, '/files/c043137f-d44d-401c-9fcd-23649f4cbde6.jpg', '2019-04-24 10:22:28');
INSERT INTO `sys_file` VALUES (1160, 0, '/files/1e3881c4-21bd-4fe9-8ed7-21da6d5a06a2.jpg', '2019-04-24 10:22:33');
INSERT INTO `sys_file` VALUES (1161, 0, '/files/0cc5c0f8-3bb3-49e6-8c14-1481c67460aa.jpg', '2019-04-24 10:22:36');
INSERT INTO `sys_file` VALUES (1162, 0, '/files/66404a0e-5882-49fa-8ab5-ac5c9e796daf.jpg', '2019-04-24 10:33:54');
INSERT INTO `sys_file` VALUES (1163, 0, '/files/272310b6-9eed-4da1-ac4b-8a51d515aa46.jpg', '2019-04-24 10:33:58');
INSERT INTO `sys_file` VALUES (1164, 0, '/files/532fb3c5-a50f-4a14-8a65-09fb85f3d77f.jpg', '2019-04-24 10:34:02');
INSERT INTO `sys_file` VALUES (1165, 0, '/files/dc7b0bad-eacc-44b4-9c47-fa6263470890.jpg', '2019-04-24 10:36:05');
INSERT INTO `sys_file` VALUES (1166, 0, '/files/febe870d-1cfb-4d35-a80a-7d664f0dfcda.jpg', '2019-04-24 10:36:10');
INSERT INTO `sys_file` VALUES (1167, 0, '/files/24e58ddf-f4c9-43c9-9d4e-68406efca356.jpg', '2019-04-24 10:36:14');
INSERT INTO `sys_file` VALUES (1168, 0, '/files/682a36f0-674f-426d-b35a-7a61dc4747bf.jpg', '2019-04-24 10:38:17');
INSERT INTO `sys_file` VALUES (1169, 0, '/files/46de166e-6002-4547-bbcd-61c4573a6c9c.jpg', '2019-04-24 10:38:21');
INSERT INTO `sys_file` VALUES (1170, 0, '/files/e2fea80f-be77-4fac-84e9-e712bdd8b4f1.jpg', '2019-04-24 10:38:24');
INSERT INTO `sys_file` VALUES (1171, 0, '/files/a4f0012b-e5a0-42aa-9e70-6e29065a8e8a.jpg', '2019-04-24 10:39:57');
INSERT INTO `sys_file` VALUES (1172, 0, '/files/f261c263-f027-4a5a-b4f5-5a334694cd3f.jpg', '2019-04-24 10:40:01');
INSERT INTO `sys_file` VALUES (1173, 0, '/files/30fdb104-a524-4cfc-87aa-86aa7bab4e14.jpg', '2019-04-24 10:40:04');
INSERT INTO `sys_file` VALUES (1174, 0, '/files/10a8763f-240a-4630-832c-352db7e606dc.jpg', '2019-04-24 10:41:05');
INSERT INTO `sys_file` VALUES (1175, 0, '/files/51995930-9aaa-4ddb-aa2d-200ac4f4a4d4.jpg', '2019-04-24 10:45:17');
INSERT INTO `sys_file` VALUES (1176, 0, '/files/76fda685-63e0-4f0f-a253-a277f2e26b10.jpg', '2019-04-24 10:45:21');
INSERT INTO `sys_file` VALUES (1177, 0, '/files/2db53426-9640-4dc1-910d-1c072750eb0b.jpg', '2019-04-24 10:45:25');
INSERT INTO `sys_file` VALUES (1178, 0, '/files/860f4f44-562d-4048-a84e-04d153513167.jpg', '2019-04-25 16:18:36');
INSERT INTO `sys_file` VALUES (1179, 0, '/files/52679657-5321-4a67-acf9-f727f9cdd223.jpg', '2019-04-25 16:18:38');
INSERT INTO `sys_file` VALUES (1180, 0, '/files/4f635d57-f8da-4328-b08e-09db339c674f.jpg', '2019-04-25 16:18:41');
INSERT INTO `sys_file` VALUES (1181, 0, '/files/c26387a9-2350-4b5b-9f06-c474c47289fe.jpg', '2019-04-25 16:29:29');
INSERT INTO `sys_file` VALUES (1182, 0, '/files/9e197dd0-4d50-485c-9746-fdd62db04131.jpg', '2019-04-25 16:29:33');
INSERT INTO `sys_file` VALUES (1183, 0, '/files/a3ae1ecc-19cd-4059-8db8-4bf0998dd6bd.jpg', '2019-04-25 16:29:36');
INSERT INTO `sys_file` VALUES (1184, 0, '/files/e12cad1b-7d12-4a78-adcd-c2c3c1eb1dea.jpg', '2019-04-25 16:31:42');
INSERT INTO `sys_file` VALUES (1185, 0, '/files/efb58279-36f0-4c8c-802a-2eff78b4b9f5.jpg', '2019-04-25 16:31:45');
INSERT INTO `sys_file` VALUES (1186, 0, '/files/6e068191-91f1-43fe-8974-5cd5fe6aef13.jpg', '2019-04-25 16:31:47');
INSERT INTO `sys_file` VALUES (1187, 0, '/files/9d476e53-31dc-45a1-a51c-c6e88ff612e3.jpg', '2019-04-25 16:36:21');
INSERT INTO `sys_file` VALUES (1188, 0, '/files/7b63f533-2d93-42e2-9838-6eb42d26db69.jpg', '2019-04-25 16:36:23');
INSERT INTO `sys_file` VALUES (1189, 0, '/files/08af4376-8c4e-4b95-9e3d-f8a0b4234ece.jpg', '2019-04-25 16:36:26');
INSERT INTO `sys_file` VALUES (1190, 0, '/files/515a73de-a35d-401d-8ec8-e23f82668c05.jpg', '2019-04-25 16:45:53');
INSERT INTO `sys_file` VALUES (1191, 0, '/files/46f0085e-215c-4486-90fd-7477e78c705c.jpg', '2019-04-25 16:45:55');
INSERT INTO `sys_file` VALUES (1192, 0, '/files/ae8e25a0-71ed-4ec7-ac67-114de230d40b.jpg', '2019-04-25 16:46:02');
INSERT INTO `sys_file` VALUES (1193, 0, '/files/6d507898-1b1d-477f-b2f6-5639bc3704b1.jpg', '2019-04-29 17:56:50');
INSERT INTO `sys_file` VALUES (1194, 0, '/files/42ecfed7-cdce-4c6d-a80f-ed690c451f39.jpg', '2019-04-29 17:56:53');
INSERT INTO `sys_file` VALUES (1195, 0, '/files/ac853e2e-f46f-4c0d-9a59-febcfe900ada.jpg', '2019-04-29 17:56:55');
INSERT INTO `sys_file` VALUES (1196, 0, '/files/d88f5e04-35df-4e2e-b7b1-768acd3971ee.jpg', '2019-04-29 18:00:04');
INSERT INTO `sys_file` VALUES (1197, 0, '/files/c91fdbf6-bca1-4865-a18c-6f8e19f91f07.jpg', '2019-04-29 18:00:07');
INSERT INTO `sys_file` VALUES (1198, 0, '/files/4211a596-07db-4ff8-b4a4-c8ce44df96ef.jpg', '2019-04-29 18:00:09');
INSERT INTO `sys_file` VALUES (1199, 0, '/files/97bd74a4-a104-498c-8c44-57ee54e807fd.jpg', '2019-04-29 18:11:25');
INSERT INTO `sys_file` VALUES (1200, 0, '/files/584c7a90-df75-457e-8778-ee0cb4b40cf4.jpg', '2019-04-29 18:11:27');
INSERT INTO `sys_file` VALUES (1201, 0, '/files/5a817449-c1dd-4cef-a155-2afe08f2c979.jpg', '2019-04-29 18:11:30');
INSERT INTO `sys_file` VALUES (1202, 0, '/files/06fe0749-349a-4484-97b4-7a422d825504.jpg', '2019-04-29 18:16:49');
INSERT INTO `sys_file` VALUES (1203, 0, '/files/168e631f-70e9-4c08-8786-f0c8931c97e7.jpg', '2019-04-29 18:16:51');
INSERT INTO `sys_file` VALUES (1204, 0, '/files/ea716ac7-65af-4c1f-bb3d-e4b2dac0e8c8.jpg', '2019-04-29 18:16:54');
INSERT INTO `sys_file` VALUES (1205, 0, '/files/d9e80b2c-cbda-467c-96a5-3bfaa24b6102.jpg', '2019-04-29 18:22:43');
INSERT INTO `sys_file` VALUES (1206, 0, '/files/837d5de5-02f3-47ad-811a-708478c8ef65.jpg', '2019-04-29 18:22:45');
INSERT INTO `sys_file` VALUES (1207, 0, '/files/5f96cd85-8c0e-4bcc-8ce5-cf378dd2120d.jpg', '2019-04-29 18:22:48');
INSERT INTO `sys_file` VALUES (1208, 0, '/files/9051e3d5-0d1e-4bd9-8332-6777ab092356.jpg', '2019-04-30 16:01:54');
INSERT INTO `sys_file` VALUES (1209, 0, '/files/5e5d9794-61bd-4649-8e69-e70883cf0547.jpg', '2019-04-30 16:01:57');
INSERT INTO `sys_file` VALUES (1210, 0, '/files/9327d39c-672c-4e76-afb6-e460e34972b0.jpg', '2019-04-30 16:01:59');
INSERT INTO `sys_file` VALUES (1211, 0, '/files/0656537a-0774-4343-b293-05d7ad001eff.jpg', '2019-04-30 16:05:34');
INSERT INTO `sys_file` VALUES (1212, 0, '/files/088aaceb-65a4-4eb4-97d8-1165b49576b6.jpg', '2019-04-30 16:05:37');
INSERT INTO `sys_file` VALUES (1213, 0, '/files/c33cc417-9f2f-4d3f-86b4-ae91b42c0255.jpg', '2019-04-30 16:05:40');
INSERT INTO `sys_file` VALUES (1214, 0, '/files/de8937af-39e4-4d17-af68-767aae1219ba.jpg', '2019-04-30 16:46:49');
INSERT INTO `sys_file` VALUES (1215, 0, '/files/8e40b0d7-5920-48d0-b62c-8a7b091f3af4.jpg', '2019-04-30 16:46:51');
INSERT INTO `sys_file` VALUES (1216, 0, '/files/555d33d7-45dc-4666-8b4a-d9aba73fc417.jpg', '2019-04-30 16:46:54');
INSERT INTO `sys_file` VALUES (1217, 0, '/files/c667cda6-7b4e-45de-a1f5-5ccdedcb5a5f.jpg', '2019-04-30 19:58:20');
INSERT INTO `sys_file` VALUES (1218, 0, '/files/277de781-6c2a-4a49-b5eb-f6c1b83a3507.jpg', '2019-04-30 19:58:22');
INSERT INTO `sys_file` VALUES (1219, 0, '/files/30fb6789-56d7-42a0-ad3c-65eef352a339.jpg', '2019-04-30 19:58:25');
INSERT INTO `sys_file` VALUES (1220, 0, '/files/e021f2de-b3c3-4abc-be54-c904c86bff19.jpg', '2019-04-30 20:02:15');
INSERT INTO `sys_file` VALUES (1221, 0, '/files/7e57399c-7807-44bd-8009-a094b9fb7f08.jpg', '2019-04-30 20:02:17');
INSERT INTO `sys_file` VALUES (1222, 0, '/files/43e338ca-082f-43e6-ac5b-840e0debfe02.jpg', '2019-04-30 20:02:21');
INSERT INTO `sys_file` VALUES (1223, 0, '/files/d21c5c24-498d-4ec5-8c8c-be0c86823064.jpg', '2019-05-05 10:38:59');
INSERT INTO `sys_file` VALUES (1224, 0, '/files/7011c4cd-5726-4911-956c-392a6f0157df.png', '2019-09-10 11:50:39');
INSERT INTO `sys_file` VALUES (1225, 0, '/files/c0d377e5-338c-4765-b5d2-153643b42e4e.png', '2019-09-10 11:50:44');
INSERT INTO `sys_file` VALUES (1226, 0, '/files/17ac7aee-a4e3-4296-a409-3f5f5bd98da6.png', '2019-09-10 11:50:48');
INSERT INTO `sys_file` VALUES (1227, 0, '/files/347993b5-7aaa-485a-9caa-1fb0fa0efa5c.png', '2019-09-10 11:50:52');
INSERT INTO `sys_file` VALUES (1228, 0, '/files/d2f0bee7-e101-4385-af3e-0272fdd60e68.png', '2019-09-10 11:50:55');
INSERT INTO `sys_file` VALUES (1229, 0, '/files/344baa02-1dae-4604-a6bf-70571aec0bf4.png', '2019-09-10 11:50:59');
INSERT INTO `sys_file` VALUES (1230, 99, '/files/499b1fbb-056c-4de9-b802-b0e7d56ff27a.wgt', '2019-09-15 19:09:30');
INSERT INTO `sys_file` VALUES (1231, 99, '/files/23a3b1a7-70d2-4d62-828c-959748274397.wgt', '2019-09-17 09:58:41');
INSERT INTO `sys_file` VALUES (1232, 99, '/files/4e94e1b3-abea-4ab9-bd0a-0cb0c9707b28.wgt', '2019-09-17 16:33:05');
INSERT INTO `sys_file` VALUES (1233, 99, '/files/1cd824d0-82be-4c19-8238-a5e780f9f215.wgt', '2019-09-17 16:34:56');
INSERT INTO `sys_file` VALUES (1234, 99, '/files/56576529-f3c8-4e92-ace4-92a9bb8986ba.wgt', '2019-09-17 17:55:18');
INSERT INTO `sys_file` VALUES (1235, 0, '/files/e46e299b-7fd3-4677-ae0f-5bca2d3e8d44.jpg', '2019-09-25 11:12:01');
INSERT INTO `sys_file` VALUES (1236, 0, '/files/cae1f730-e7ef-4de3-8462-0bb648c31b49.jpg', '2019-09-25 11:28:56');
INSERT INTO `sys_file` VALUES (1237, 0, '/files/853a7648-1950-40e2-b2ab-5988db9cb404.jpg', '2019-09-25 11:30:26');
INSERT INTO `sys_file` VALUES (1238, 0, '/files/d55aae42-cd7a-4b74-b6e9-8f01c2283cfd.jpg', '2019-09-25 14:12:44');
INSERT INTO `sys_file` VALUES (1239, 2, '/files/0ea26e42-5e6f-42a1-a68d-de4b819f599c.mp4', '2019-09-25 14:23:35');
INSERT INTO `sys_file` VALUES (1240, 2, '/files/9d5c9423-d69d-4799-819b-ddb7db0ddf7c.mp4', '2019-09-25 14:42:39');
INSERT INTO `sys_file` VALUES (1241, 2, '/files/4d2c1086-2745-40c3-9dc3-bfc7676e6354.mp4', '2019-09-25 14:53:45');
INSERT INTO `sys_file` VALUES (1242, 2, '/files/89cea4f9-7fc7-4150-84f8-8a34fad851cb.mp4', '2019-09-25 15:02:04');
INSERT INTO `sys_file` VALUES (1243, 2, '/files/9ca40bd8-cd07-417c-834b-a258ddc7bf13.mp4', '2019-09-25 15:12:46');
INSERT INTO `sys_file` VALUES (1244, 2, '/files/97630eaf-e568-4d43-934d-420cbeab598f.mp4', '2019-09-25 15:22:23');
INSERT INTO `sys_file` VALUES (1245, 0, '/files/eaab1b2b-8237-4268-b63c-5de88c1c8e2a.png', '2019-09-25 17:27:39');
INSERT INTO `sys_file` VALUES (1246, 0, '/files/2beb96de-204c-4fc7-adb5-9ab4a1a8140b.png', '2019-09-25 17:29:48');
INSERT INTO `sys_file` VALUES (1247, 0, '/files/37200320-c583-427a-afbc-4d33d8577868.png', '2019-09-25 17:30:57');
INSERT INTO `sys_file` VALUES (1248, 0, '/files/58a19ff4-7e0b-4d26-8e56-abdcd8909d5f.png', '2019-09-25 17:31:29');
INSERT INTO `sys_file` VALUES (1249, 0, '/files/f00f4d8c-f83f-4bbb-8a34-2bb7fa3d77df.png', '2019-09-25 17:31:54');
INSERT INTO `sys_file` VALUES (1250, 0, '/files/902557a5-e179-4082-a14c-ffe3df55ebd8.png', '2019-09-25 17:32:20');
INSERT INTO `sys_file` VALUES (1251, 0, '/files/d685ccc6-99e0-4ca0-bc56-28d984258a6c.png', '2019-09-25 17:33:02');
INSERT INTO `sys_file` VALUES (1252, 0, '/files/697a8420-1e0a-48c3-86f5-5f7a8aead3b9.png', '2019-09-25 17:33:37');
INSERT INTO `sys_file` VALUES (1253, 0, '/files/c2d0f53f-07a0-4e34-aa6d-8dfe428aa0f9.png', '2019-09-25 17:34:12');
INSERT INTO `sys_file` VALUES (1254, 0, '/files/5a73dfbc-69ee-428e-b67b-25609f379999.png', '2019-09-25 17:34:49');
INSERT INTO `sys_file` VALUES (1255, 2, '/files/b44f0045-6bc2-4870-a42e-a2bcbda648de.mp4', '2019-09-25 18:03:06');
INSERT INTO `sys_file` VALUES (1256, 0, '/files/7c5cf08f-805d-486c-b739-7fc6ea1f201b.png', '2019-09-25 18:48:21');
INSERT INTO `sys_file` VALUES (1257, 0, '/files/e8490486-3caa-40c0-9636-83f15aa008db.png', '2019-09-25 18:52:15');
INSERT INTO `sys_file` VALUES (1258, 0, '/files/a1e5b816-ff90-4be7-8477-0ffe7c2b2861.png', '2019-09-25 18:53:35');
INSERT INTO `sys_file` VALUES (1259, 0, '/files/af00b189-abe1-4a85-b523-4523be01053d.png', '2019-09-25 18:54:13');
INSERT INTO `sys_file` VALUES (1260, 0, '/files/405b8980-c059-4b1c-bf55-b94a4b96361f.png', '2019-09-25 18:55:32');
INSERT INTO `sys_file` VALUES (1261, 0, '/files/a3a6f80b-8347-4218-96d1-9465f1239396.png', '2019-09-26 10:33:39');
INSERT INTO `sys_file` VALUES (1262, 0, '/files/e6cf805e-4f54-4a07-b2f8-a46e205b4f38.png', '2019-09-26 10:34:01');
INSERT INTO `sys_file` VALUES (1263, 0, '/files/9396416e-ef4c-4c61-b24d-b8995126c7ec.png', '2019-09-26 10:34:29');
INSERT INTO `sys_file` VALUES (1264, 2, '/files/7e3cb9f1-b91e-4662-90aa-b9650319014e.mp4', '2019-09-26 10:46:49');
INSERT INTO `sys_file` VALUES (1265, 2, '/files/20b56b52-1ec6-4377-aef3-9a3c3245e274.mp4', '2019-09-26 10:58:25');
INSERT INTO `sys_file` VALUES (1266, 2, '/files/2f1a1479-8c4f-4b63-803f-1d8c5b989dd8.mp4', '2019-09-26 11:13:23');
INSERT INTO `sys_file` VALUES (1267, 2, '/files/a136754a-5441-41d8-a692-5e79c482040b.mp4', '2019-09-26 11:14:51');
INSERT INTO `sys_file` VALUES (1268, 2, '/files/492e8371-4f94-4a86-8fde-9ba332182f9a.mp4', '2019-09-26 11:16:58');
INSERT INTO `sys_file` VALUES (1269, 2, '/files/1106a50d-f064-4cf4-ad10-c9e97224f422.mp4', '2019-09-26 11:43:06');
INSERT INTO `sys_file` VALUES (1270, 2, '/files/ad00b7b2-d9a1-40fb-bc2d-2901935fc75b.mp4', '2019-09-26 11:43:14');
INSERT INTO `sys_file` VALUES (1271, 2, '/files/de1a9b75-638c-443d-8993-d2eeb2409944.mp4', '2019-09-26 11:43:18');
INSERT INTO `sys_file` VALUES (1272, 2, '/files/94b7b0ad-1904-4f8e-8ccc-3bac5841ff0d.mp4', '2019-09-26 11:48:15');
INSERT INTO `sys_file` VALUES (1273, 2, '/files/d8ed286d-fd74-45de-aeef-5da692e4be83.mp4', '2019-09-26 11:48:20');
INSERT INTO `sys_file` VALUES (1274, 0, '/files/62a02c36-1f67-4dd4-8add-37956923f2de.png', '2019-09-26 14:52:07');
INSERT INTO `sys_file` VALUES (1275, 0, '/files/d1359301-4f56-4eae-ac86-c0290d9f1177.png', '2019-09-26 14:59:23');
INSERT INTO `sys_file` VALUES (1276, 0, '/files/bae02410-74aa-4ed5-bb94-bb5ee120acba.png', '2019-09-26 15:20:17');
INSERT INTO `sys_file` VALUES (1277, 0, '/files/b3939101-2a95-4fb8-9158-15d849ef5d20.png', '2019-09-26 15:26:25');
INSERT INTO `sys_file` VALUES (1278, 2, '/files/2726c1a3-076f-4c48-973e-1d0161f3894b.mp4', '2019-09-26 15:26:33');
INSERT INTO `sys_file` VALUES (1279, 2, '/files/a7ca2151-f1da-41c9-8316-a4b348326724.mp4', '2019-09-26 15:32:08');
INSERT INTO `sys_file` VALUES (1280, 2, '/files/3aaa7cd6-600c-4cfd-a21d-54afb555fd1d.mp4', '2019-09-26 15:50:47');
INSERT INTO `sys_file` VALUES (1281, 0, '/files/8c760822-c798-4a5b-a62d-2d86dd8fced3.png', '2019-09-26 15:51:34');
INSERT INTO `sys_file` VALUES (1282, 2, '/files/b58ad5f9-a70e-4541-9c4e-32eba59b51d9.mp4', '2019-09-26 16:06:33');
INSERT INTO `sys_file` VALUES (1283, 0, '/files/3bec52b6-5b69-46e3-9fd8-5e41b7cbd1ed.jpg', '2019-09-26 16:06:41');
INSERT INTO `sys_file` VALUES (1284, 99, '/files/f6b16e62-235c-4d09-b0bd-d0fd5c34b5a3.wgt', '2019-09-26 17:05:53');
INSERT INTO `sys_file` VALUES (1285, 99, '/files/31d80c21-54bc-49dc-b723-5e07ea1fb659.apk', '2019-09-26 17:13:32');
INSERT INTO `sys_file` VALUES (1286, 0, '/files/534712d0-5665-4087-8e0c-39371b0293df.png', '2019-09-26 17:24:59');
INSERT INTO `sys_file` VALUES (1287, 0, '/files/517a7cb6-96c9-4ce2-aea0-e7fcea45866e.png', '2019-09-26 17:27:32');
INSERT INTO `sys_file` VALUES (1288, 0, '/files/04f2aac0-f5d3-4fef-977f-2326d423f35c.png', '2019-09-26 17:27:59');
INSERT INTO `sys_file` VALUES (1289, 0, '/files/902c3a5e-acfb-4461-81ab-427590404e3f.png', '2019-09-26 17:28:24');
INSERT INTO `sys_file` VALUES (1290, 0, '/files/625f24f2-50d3-4dcd-98e0-1bf452282b04.png', '2019-09-26 17:30:04');
INSERT INTO `sys_file` VALUES (1291, 0, '/files/2f6ba8a0-674c-4451-bf27-9762a1901514.png', '2019-09-26 17:30:36');
INSERT INTO `sys_file` VALUES (1292, 99, '/files/e3c832b2-f701-4c64-8992-2d1ff6830c64.apk', '2019-09-26 17:31:24');
INSERT INTO `sys_file` VALUES (1293, 0, '/files/e10bc913-6a59-4995-957d-376c607f4cd9.png', '2019-09-26 17:31:40');
INSERT INTO `sys_file` VALUES (1294, 0, '/files/16174004-10d8-44bd-8124-2d227b5b6671.png', '2019-09-26 17:32:30');
INSERT INTO `sys_file` VALUES (1295, 0, '/files/87aa7328-003a-4337-ac47-8eaff2d2fecb.png', '2019-09-26 17:33:09');
INSERT INTO `sys_file` VALUES (1296, 99, '/files/5f764bbc-c1a5-4918-aae4-a893afbfda69.wgt', '2019-09-26 18:15:23');
INSERT INTO `sys_file` VALUES (1297, 2, '/files/92aedbc6-cb57-40d9-b9e4-d69db3002020.mp4', '2019-09-26 18:20:38');
INSERT INTO `sys_file` VALUES (1298, 0, '/files/3d7b00b2-eb4f-43ec-a4e6-f01871acf680.png', '2019-09-26 19:38:49');
INSERT INTO `sys_file` VALUES (1299, 0, '/files/b75911c6-7271-4b5f-90c2-ce0ac396b72e.png', '2019-09-26 19:39:26');
INSERT INTO `sys_file` VALUES (1300, 0, '/files/eba872c9-2574-41fb-97d3-38d07b134594.png', '2019-09-26 19:40:22');
INSERT INTO `sys_file` VALUES (1301, 0, '/files/66d3fd3f-fcd9-4018-81f1-0be3ca33dc1f.png', '2019-09-26 19:41:02');
INSERT INTO `sys_file` VALUES (1302, 0, '/files/03c2581d-356d-468d-8b65-2df08c366c1b.png', '2019-09-26 19:43:50');
INSERT INTO `sys_file` VALUES (1303, 0, '/files/08e32191-2f50-4688-be86-9c368681c3fe.png', '2019-09-26 19:44:55');
INSERT INTO `sys_file` VALUES (1304, 2, '/files/abcd0c6a-2c3b-4332-ad4c-2f70771d2a8b.mp4', '2019-09-27 14:28:06');
INSERT INTO `sys_file` VALUES (1305, 2, '/files/3524c9e6-fb06-4673-8693-3d9b1996d62a.mp4', '2019-09-27 14:29:51');
INSERT INTO `sys_file` VALUES (1306, 99, '/files/a53db071-3090-4e6d-b00c-14fd1e432542.wgt', '2019-09-27 17:14:59');
INSERT INTO `sys_file` VALUES (1307, 99, '/files/b7553fff-94a0-4cfe-a26c-e10430b078b1.wgt', '2019-09-27 17:30:15');
INSERT INTO `sys_file` VALUES (1308, 99, '/files/c3b1558e-8d1a-4af2-b851-fbef77e4e117.wgt', '2019-09-27 17:42:59');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户操作',
  `time` int(11) NULL DEFAULT NULL COMMENT '响应时间',
  `method` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求参数',
  `ip` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `gmt_create` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `app` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'settlement' COMMENT '应用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES (1, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/get_user_info', '{}', '119.139.196.64', '2019-09-26 14:46:11', 'sesame');
INSERT INTO `sys_log` VALUES (2, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/product/total_currency', '{}', '119.139.196.64', '2019-09-26 14:46:11', 'sesame');
INSERT INTO `sys_log` VALUES (3, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/product/profit_statistic', '{}', '119.139.196.64', '2019-09-26 14:46:11', 'sesame');
INSERT INTO `sys_log` VALUES (4, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/get_user_info', '{}', '119.139.196.64', '2019-09-26 14:46:13', 'sesame');
INSERT INTO `sys_log` VALUES (5, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/get_user_info', '{}', '119.139.196.64', '2019-09-26 14:46:17', 'sesame');
INSERT INTO `sys_log` VALUES (6, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/product/principal_list', '{}', '119.139.196.64', '2019-09-26 14:46:17', 'sesame');
INSERT INTO `sys_log` VALUES (7, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/product/currency_list', '{}', '119.139.196.64', '2019-09-26 14:46:17', 'sesame');
INSERT INTO `sys_log` VALUES (8, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/product/my_principal', '{}', '119.139.196.64', '2019-09-26 14:46:18', 'sesame');
INSERT INTO `sys_log` VALUES (9, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/product/my_principal_status', '{}', '119.139.196.64', '2019-09-26 14:46:18', 'sesame');
INSERT INTO `sys_log` VALUES (10, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/get_user_info', '{}', '119.139.196.64', '2019-09-26 14:46:19', 'sesame');
INSERT INTO `sys_log` VALUES (11, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/get_user_info', '{}', '119.139.196.64', '2019-09-26 14:46:21', 'sesame');
INSERT INTO `sys_log` VALUES (12, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/get_user_info', '{}', '119.139.196.64', '2019-09-26 14:48:31', 'sesame');
INSERT INTO `sys_log` VALUES (13, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/get_appinfo', '{}', '119.139.196.64', '2019-09-26 14:48:33', 'sesame');
INSERT INTO `sys_log` VALUES (14, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/get_user_info', '{}', '119.139.196.64', '2019-09-26 14:48:33', 'sesame');
INSERT INTO `sys_log` VALUES (15, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/product/profit_statistic', '{}', '119.139.196.64', '2019-09-26 14:48:34', 'sesame');
INSERT INTO `sys_log` VALUES (16, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/product/total_currency', '{}', '119.139.196.64', '2019-09-26 14:48:34', 'sesame');
INSERT INTO `sys_log` VALUES (17, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/get_user_info', '{}', '119.139.196.64', '2019-09-26 14:49:12', 'sesame');
INSERT INTO `sys_log` VALUES (18, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/get_appinfo', '{}', '119.139.196.64', '2019-09-26 14:49:16', 'sesame');
INSERT INTO `sys_log` VALUES (19, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/get_user_info', '{}', '119.139.196.64', '2019-09-26 14:49:16', 'sesame');
INSERT INTO `sys_log` VALUES (20, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/product/total_currency', '{}', '119.139.196.64', '2019-09-26 14:49:16', 'sesame');
INSERT INTO `sys_log` VALUES (21, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/product/profit_statistic', '{}', '119.139.196.64', '2019-09-26 14:49:16', 'sesame');
INSERT INTO `sys_log` VALUES (22, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/get_user_info', '{}', '119.139.196.64', '2019-09-26 14:49:18', 'sesame');
INSERT INTO `sys_log` VALUES (23, 1, 'admin', 'error', NULL, 'http://bbct.kkg222.com/manager/tasklog/task/list', 'org.springframework.jdbc.BadSqlGrammarException: \n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'bbctdb.t_task\' doesn\'t exist\n### The error may exist in class path resource [mybatis/system/tasklog/TaskMapper.xml]\n### The error may involve defaultParameterMap\n### The error occurred while setting parameters\n### SQL: select `tid`,`job_name`,`batch_num`,`type`,`start_date`,`end_date`,`message`,`create_date`,`del_flag` from         t_task                                      order by tid desc                                     limit ?, ?\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'bbctdb.t_task\' doesn\'t exist\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'bbctdb.t_task\' doesn\'t exist', NULL, '2019-09-26 14:55:06', NULL);
INSERT INTO `sys_log` VALUES (24, 1, 'admin', 'error', NULL, 'http://bbct.kkg222.com/manager/tasklog/task/list', 'org.springframework.jdbc.BadSqlGrammarException: \n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'bbctdb.t_task\' doesn\'t exist\n### The error may exist in class path resource [mybatis/system/tasklog/TaskMapper.xml]\n### The error may involve defaultParameterMap\n### The error occurred while setting parameters\n### SQL: select `tid`,`job_name`,`batch_num`,`type`,`start_date`,`end_date`,`message`,`create_date`,`del_flag` from         t_task                                      order by create_date desc                                     limit ?, ?\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'bbctdb.t_task\' doesn\'t exist\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'bbctdb.t_task\' doesn\'t exist', NULL, '2019-09-26 14:55:06', NULL);
INSERT INTO `sys_log` VALUES (25, 1, 'admin', 'error', NULL, 'http://bbct.kkg222.com/manager/record/msgRecord/list', 'org.springframework.jdbc.BadSqlGrammarException: \n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'bbctdb.t_msg_record\' doesn\'t exist\n### The error may exist in class path resource [mybatis/system/record/MsgRecordMapper.xml]\n### The error may involve defaultParameterMap\n### The error occurred while setting parameters\n### SQL: select `tid`,`mobile`,`msg_content`,`status`,`create_date`,`del_flag` from t_msg_record                                      order by tid desc                                     limit ?, ?\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'bbctdb.t_msg_record\' doesn\'t exist\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'bbctdb.t_msg_record\' doesn\'t exist', NULL, '2019-09-26 14:55:07', NULL);
INSERT INTO `sys_log` VALUES (26, 1, 'admin', 'error', NULL, 'http://bbct.kkg222.com/manager/record/msgRecord/list', 'org.springframework.jdbc.BadSqlGrammarException: \n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'bbctdb.t_msg_record\' doesn\'t exist\n### The error may exist in class path resource [mybatis/system/record/MsgRecordMapper.xml]\n### The error may involve defaultParameterMap\n### The error occurred while setting parameters\n### SQL: select `tid`,`mobile`,`msg_content`,`status`,`create_date`,`del_flag` from t_msg_record                                      order by create_date desc                                     limit ?, ?\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'bbctdb.t_msg_record\' doesn\'t exist\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'bbctdb.t_msg_record\' doesn\'t exist', NULL, '2019-09-26 14:55:07', NULL);

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) NULL DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) NULL DEFAULT NULL COMMENT '排序',
  `gmt_create` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 347 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, 0, '基础管理', '', '', 0, 'fa fa-bars', 80, '2017-08-09 22:49:47', NULL);
INSERT INTO `sys_menu` VALUES (2, 3, '系统菜单', 'sys/menu/', 'sys:menu:menu', 1, 'fa fa-th-list', 6, '2017-08-09 22:55:15', NULL);
INSERT INTO `sys_menu` VALUES (3, 0, '系统管理', '', '', 0, 'fa fa-desktop', 70, '2017-08-09 23:06:55', '2017-08-14 14:13:43');
INSERT INTO `sys_menu` VALUES (6, 3, '用户管理', 'sys/user/', 'sys:user:user', 1, 'fa fa-user', 4, '2017-08-10 14:12:11', NULL);
INSERT INTO `sys_menu` VALUES (7, 3, '角色管理', 'sys/role', 'sys:role:role', 1, 'fa fa-paw', 3, '2017-08-10 14:13:19', NULL);
INSERT INTO `sys_menu` VALUES (12, 6, '新增', '', 'sys:user:add', 2, '', 0, '2017-08-14 10:51:35', NULL);
INSERT INTO `sys_menu` VALUES (13, 6, '编辑', '', 'sys:user:edit', 2, '', 0, '2017-08-14 10:52:06', NULL);
INSERT INTO `sys_menu` VALUES (14, 6, '删除', NULL, 'sys:user:remove', 2, NULL, 0, '2017-08-14 10:52:24', NULL);
INSERT INTO `sys_menu` VALUES (15, 7, '新增', '', 'sys:role:add', 2, '', 0, '2017-08-14 10:56:37', NULL);
INSERT INTO `sys_menu` VALUES (20, 2, '新增', '', 'sys:menu:add', 2, '', 0, '2017-08-14 10:59:32', NULL);
INSERT INTO `sys_menu` VALUES (21, 2, '编辑', '', 'sys:menu:edit', 2, '', 0, '2017-08-14 10:59:56', NULL);
INSERT INTO `sys_menu` VALUES (22, 2, '删除', '', 'sys:menu:remove', 2, '', 0, '2017-08-14 11:00:26', NULL);
INSERT INTO `sys_menu` VALUES (24, 6, '批量删除', '', 'sys:user:batchRemove', 2, '', 0, '2017-08-14 17:27:18', NULL);
INSERT INTO `sys_menu` VALUES (25, 6, '停用', NULL, 'sys:user:disable', 2, NULL, 0, '2017-08-14 17:27:43', NULL);
INSERT INTO `sys_menu` VALUES (26, 6, '重置密码', '', 'sys:user:resetPwd', 2, '', 0, '2017-08-14 17:28:34', NULL);
INSERT INTO `sys_menu` VALUES (27, 91, '系统日志', 'common/log', 'common:log', 1, 'fa fa-warning', 0, '2017-08-14 22:11:53', NULL);
INSERT INTO `sys_menu` VALUES (28, 27, '刷新', NULL, 'sys:log:list', 2, NULL, 0, '2017-08-14 22:30:22', NULL);
INSERT INTO `sys_menu` VALUES (29, 27, '删除', NULL, 'sys:log:remove', 2, NULL, 0, '2017-08-14 22:30:43', NULL);
INSERT INTO `sys_menu` VALUES (30, 27, '清空', NULL, 'sys:log:clear', 2, NULL, 0, '2017-08-14 22:31:02', NULL);
INSERT INTO `sys_menu` VALUES (48, 77, '代码生成', 'common/generator', 'common:generator', 1, 'fa fa-code', 3, NULL, NULL);
INSERT INTO `sys_menu` VALUES (55, 7, '编辑', '', 'sys:role:edit', 2, '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (56, 7, '删除', '', 'sys:role:remove', 2, NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (57, 91, '运行监控', '/druid/index.html', '', 1, 'fa fa-caret-square-o-right', 1, NULL, NULL);
INSERT INTO `sys_menu` VALUES (61, 2, '批量删除', '', 'sys:menu:batchRemove', 2, NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (62, 7, '批量删除', '', 'sys:role:batchRemove', 2, NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (71, 1, '文件管理', '/manager/common/sysFile', 'common:sysFile:sysFile', 1, 'fa fa-folder-open', 2, NULL, NULL);
INSERT INTO `sys_menu` VALUES (73, 3, '部门管理', '/manager/system/sysDept', 'system:sysDept:sysDept', 1, 'fa fa-users', 3, NULL, NULL);
INSERT INTO `sys_menu` VALUES (74, 73, '增加', '/system/sysDept/add', 'system:sysDept:add', 2, NULL, 1, NULL, NULL);
INSERT INTO `sys_menu` VALUES (75, 73, '刪除', 'system/sysDept/remove', 'system:sysDept:remove', 2, NULL, 2, NULL, NULL);
INSERT INTO `sys_menu` VALUES (76, 73, '编辑', '/system/sysDept/edit', 'system:sysDept:edit', 2, NULL, 3, NULL, NULL);
INSERT INTO `sys_menu` VALUES (77, 0, '系统工具', '', '', 0, 'fa fa-gear', 50, NULL, NULL);
INSERT INTO `sys_menu` VALUES (78, 1, '数据字典', '/manager/common/dict', 'common:dict:dict', 1, 'fa fa-book', 1, NULL, NULL);
INSERT INTO `sys_menu` VALUES (79, 78, '增加', '/common/dict/add', 'common:dict:add', 2, NULL, 2, NULL, NULL);
INSERT INTO `sys_menu` VALUES (80, 78, '编辑', '/common/dict/edit', 'common:dict:edit', 2, NULL, 2, NULL, NULL);
INSERT INTO `sys_menu` VALUES (81, 78, '删除', '/common/dict/remove', 'common:dict:remove', 2, '', 3, NULL, NULL);
INSERT INTO `sys_menu` VALUES (83, 78, '批量删除', '/common/dict/batchRemove', 'common:dict:batchRemove', 2, '', 4, NULL, NULL);
INSERT INTO `sys_menu` VALUES (91, 0, '系统监控', '', '', 0, 'fa fa-video-camera', 60, NULL, NULL);
INSERT INTO `sys_menu` VALUES (92, 91, '在线用户', 'sys/online', '', 1, 'fa fa-user', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (109, 0, '全局配置', '', '', 0, 'fa fa-gear', 90, NULL, NULL);
INSERT INTO `sys_menu` VALUES (118, 77, '添加', '/manager/category/newsCategory/add', 'category:newsCategory:add', 2, '', 1, NULL, NULL);
INSERT INTO `sys_menu` VALUES (202, 3, '安全密钥管理', '/manager/base/securityManager', 'base:securityManager:securityManager', 1, '', 1, NULL, NULL);
INSERT INTO `sys_menu` VALUES (203, 202, '添加', '', 'base:securityManager:add', 2, '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (204, 109, '全局基本配置', 'sysconfig/config?clazzName=SettlementCommonConfig', 'sysconfig:config:config', 1, '', 1, NULL, NULL);
INSERT INTO `sys_menu` VALUES (205, 204, '编辑', '', 'sysconfig:config:edit', 2, '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (206, 77, '结算测试', '/manager/common/settlementTest', 'common:settlementTest:settlementTest', 1, '', 2, NULL, NULL);
INSERT INTO `sys_menu` VALUES (207, 3, '短信记录', '/manager/record/msgRecord', 'record:msgRecord:msgRecord', 1, '', 9, NULL, NULL);
INSERT INTO `sys_menu` VALUES (209, 3, '系统定时任务', '/manager/tasklog/task', 'tasklog:task:task', 1, '', 98, NULL, NULL);
INSERT INTO `sys_menu` VALUES (272, 0, '用户管理', '', '', 0, 'fa fa-user', 10, NULL, NULL);
INSERT INTO `sys_menu` VALUES (273, 272, '用户列表', '/manager/get/swUserBasic', 'get:swUserBasic:swUserBasic', 1, '', 1, NULL, NULL);
INSERT INTO `sys_menu` VALUES (279, 0, '资讯管理', '', '', 0, 'fa fa-envelope-o', 29, NULL, NULL);
INSERT INTO `sys_menu` VALUES (280, 279, '资讯管理', '/manager/get/information', 'get:information:information', 1, '', 1, NULL, NULL);
INSERT INTO `sys_menu` VALUES (281, 280, '添加', '', 'get:information:add', 2, '', 1, NULL, NULL);
INSERT INTO `sys_menu` VALUES (282, 280, '更新', '', 'get:information:edit', 2, '', 2, NULL, NULL);
INSERT INTO `sys_menu` VALUES (283, 280, '删除', '', 'get:information:remove', 2, '', 3, NULL, NULL);
INSERT INTO `sys_menu` VALUES (284, 109, '规则列表', '/manager/get/swRewardRule', 'get:swRewardRule:swRewardRule', 1, '', 2, NULL, NULL);
INSERT INTO `sys_menu` VALUES (285, 284, '添加', '', 'get:swRewardRule:add', 2, '', 1, NULL, NULL);
INSERT INTO `sys_menu` VALUES (286, 284, '更新', '', 'get:swRewardRule:edit', 2, '', 2, NULL, NULL);
INSERT INTO `sys_menu` VALUES (287, 284, '删除', '', 'get:swRewardRule:remove', 2, '', 3, NULL, NULL);
INSERT INTO `sys_menu` VALUES (288, 109, '规则详情', '/manager/get/swRuleDetail', 'get:swRuleDetail:swRuleDetail', 1, '', 3, NULL, NULL);
INSERT INTO `sys_menu` VALUES (289, 288, '添加', '', 'get:swRuleDetail:add', 2, '', 1, NULL, NULL);
INSERT INTO `sys_menu` VALUES (290, 288, '更新', '', 'get:swRuleDetail:edit', 2, '', 2, NULL, NULL);
INSERT INTO `sys_menu` VALUES (291, 288, '删除', '', 'get:swRuleDetail:remove', 2, '', 3, NULL, NULL);
INSERT INTO `sys_menu` VALUES (292, 272, '钱包管理', '/manager/get/swWallets', 'get:swWallets:swWallets', 1, '', 2, NULL, NULL);
INSERT INTO `sys_menu` VALUES (293, 292, '添加', '', 'get:swWallets:add', 2, '', 1, NULL, NULL);
INSERT INTO `sys_menu` VALUES (294, 292, '更新', '', 'get:swWallets:edit', 2, '', 2, NULL, NULL);
INSERT INTO `sys_menu` VALUES (295, 272, '用户流水	', '/manager/get/swAccountRecord', 'get:swAccountRecord:swAccountRecord', 1, '', 3, NULL, NULL);
INSERT INTO `sys_menu` VALUES (298, 0, '币种管理', '', '', 0, 'fa fa-anchor', 13, NULL, NULL);
INSERT INTO `sys_menu` VALUES (299, 298, '法币列表', '/manager/get/swFiatCoin', 'get:swFiatCoin:swFiatCoin', 1, '', 1, NULL, NULL);
INSERT INTO `sys_menu` VALUES (300, 299, '添加', '', 'get:swFiatCoin:add', 2, '', 1, NULL, NULL);
INSERT INTO `sys_menu` VALUES (301, 300, '更新', '', 'get:swFiatCoin:edit', 2, '', 2, NULL, NULL);
INSERT INTO `sys_menu` VALUES (302, 3, '邮件记录', '/manager/get/mailRecord', 'get:mailRecord:mailRecord', 1, '', 8, NULL, NULL);
INSERT INTO `sys_menu` VALUES (303, 0, '审核管理', '', '', 0, 'fa fa-cc', 12, NULL, NULL);
INSERT INTO `sys_menu` VALUES (304, 298, '币种列表', '/manager/get/swCoinType', 'get:swCoinType:swCoinType', 1, '', 2, NULL, NULL);
INSERT INTO `sys_menu` VALUES (305, 304, '添加', '', 'get:swCoinType:add', 2, '', 1, NULL, NULL);
INSERT INTO `sys_menu` VALUES (306, 304, '更新', '', 'get:swCoinType:edit', 2, '', 2, NULL, NULL);
INSERT INTO `sys_menu` VALUES (307, 303, '提币审核', '/manager/get/swWithlog', 'get:swWithlog:swWithlog', 1, '', 1, NULL, NULL);
INSERT INTO `sys_menu` VALUES (308, 307, '更新', '', 'get:swWithlog:edit', 2, '', 1, NULL, NULL);
INSERT INTO `sys_menu` VALUES (309, 273, '更新', '', 'get:swUserBasic:edit', 2, '', 1, NULL, NULL);
INSERT INTO `sys_menu` VALUES (310, 303, '布道者审核', '/manager/get/swEvangelistInfo', 'get:swEvangelistInfo:swEvangelistInfo', 1, '', 2, NULL, NULL);
INSERT INTO `sys_menu` VALUES (311, 310, '更新', '', 'get:swEvangelistInfo:edit', 2, '', 1, NULL, NULL);
INSERT INTO `sys_menu` VALUES (312, 0, '记录管理', '', '', 0, 'fa fa-bars', 15, NULL, NULL);
INSERT INTO `sys_menu` VALUES (313, 312, '充币记录', '/manager/get/swChargelog', 'get:swChargelog:swChargelog', 1, '', 1, NULL, NULL);
INSERT INTO `sys_menu` VALUES (314, 312, '提币记录', '/manager/get/swWithlog', 'get:swWithlog:swWithlog', 1, '', 2, NULL, NULL);
INSERT INTO `sys_menu` VALUES (315, 312, '对标记录', '/manager/get/swBenchlog', 'get:swBenchlog:swBenchlog', 1, '', 3, NULL, NULL);
INSERT INTO `sys_menu` VALUES (316, 312, '账户记录', '/manager/get/swAccountRecord', 'get:swAccountRecord:swAccountRecord', 1, '', 4, NULL, NULL);
INSERT INTO `sys_menu` VALUES (317, 109, '版本管理', '/manager/get/appInfo', 'get:appInfo:appInfo', 1, '', 4, NULL, NULL);
INSERT INTO `sys_menu` VALUES (318, 317, '添加', '', 'get:appInfo:add', 2, '', 1, NULL, NULL);
INSERT INTO `sys_menu` VALUES (319, 317, '更新', '', 'get:appInfo:edit', 2, '', 2, NULL, NULL);
INSERT INTO `sys_menu` VALUES (320, 0, '产品管理', '', '', 0, 'fa fa-cubes', 8, NULL, NULL);
INSERT INTO `sys_menu` VALUES (321, 320, '固币金管理', '/manager/get/swPrincipal', 'get:swPrincipal:swPrincipal', 1, '', 1, NULL, NULL);
INSERT INTO `sys_menu` VALUES (322, 321, '添加', '', 'get:swPrincipal:add', 2, '', 1, NULL, NULL);
INSERT INTO `sys_menu` VALUES (323, 321, '更新', '', 'get:swPrincipal:edit', 2, '', 2, NULL, NULL);
INSERT INTO `sys_menu` VALUES (324, 320, '活币金管理', '/manager/get/swCurrent', 'get:swCurrent:swCurrent', 1, '', 2, NULL, NULL);
INSERT INTO `sys_menu` VALUES (325, 324, '添加', '', 'get:swCurrent:add', 2, '', 1, NULL, NULL);
INSERT INTO `sys_menu` VALUES (326, 324, '更新', '', 'get:swCurrent:edit', 2, '', 2, NULL, NULL);
INSERT INTO `sys_menu` VALUES (327, 320, '定币金管理', '/manager/get/swPeriod', 'get:swPeriod:swPeriod', 1, '', 3, NULL, NULL);
INSERT INTO `sys_menu` VALUES (328, 327, '添加', '', 'get:swPeriod:add', 2, '', 1, NULL, NULL);
INSERT INTO `sys_menu` VALUES (329, 327, '更新', '', 'get:swPeriod:edit', 2, '', 2, NULL, NULL);
INSERT INTO `sys_menu` VALUES (330, 320, '优币金管理', '/manager/get/swEvangelist', 'get:swEvangelist:swEvangelist', 1, '', 4, NULL, NULL);
INSERT INTO `sys_menu` VALUES (331, 330, '添加', '', 'get:swEvangelist:add', 2, '', 1, NULL, NULL);
INSERT INTO `sys_menu` VALUES (332, 330, '更新', '', 'get:swEvangelist:edit', 2, '', 2, NULL, NULL);
INSERT INTO `sys_menu` VALUES (333, 320, '升币金管理', '/manager/get/swPartner', 'get:swPartner:swPartner', 1, '', 5, NULL, NULL);
INSERT INTO `sys_menu` VALUES (334, 333, '添加', '', 'get:swPartner:add', 2, '', 1, NULL, NULL);
INSERT INTO `sys_menu` VALUES (335, 333, '更新', '', 'get:swPartner:edit', 2, '', 2, NULL, NULL);
INSERT INTO `sys_menu` VALUES (336, 320, '对标管理', '/manager/get/swBenchmarking', 'get:swBenchmarking:swBenchmarking', 1, '', 6, NULL, NULL);
INSERT INTO `sys_menu` VALUES (337, 336, '添加', '', 'get:swBenchmarking:add', 2, '', 1, NULL, NULL);
INSERT INTO `sys_menu` VALUES (338, 336, '更新', '', 'get:swBenchmarking:edit', 2, '', 2, NULL, NULL);
INSERT INTO `sys_menu` VALUES (339, 0, '用户持有', '', '', 0, 'fa fa-cube', 11, NULL, NULL);
INSERT INTO `sys_menu` VALUES (340, 339, '用户固币金列表', '/manager/get/swPrincipalUser', 'get:swPrincipalUser:swPrincipalUser', 1, '', 1, NULL, NULL);
INSERT INTO `sys_menu` VALUES (341, 339, '用户活币金列表', '/manager/get/swCurrentUser', 'get:swCurrentUser:swCurrentUser', 1, '', 2, NULL, NULL);
INSERT INTO `sys_menu` VALUES (342, 339, '用户定币金列表', '/manager/get/swPeriodUser', 'get:swPeriodUser:swPeriodUser', 1, '', 3, NULL, NULL);
INSERT INTO `sys_menu` VALUES (343, 339, '用户优币金列表', '/manager/get/swEvangelistUser', 'get:swEvangelistUser:swEvangelistUser', 1, '', 4, NULL, NULL);
INSERT INTO `sys_menu` VALUES (344, 339, '用户升币金列表', '/manager/get/swPartnerUser', 'get:swPartnerUser:swPartnerUser', 1, '', 5, NULL, NULL);
INSERT INTO `sys_menu` VALUES (345, 317, '删除', '', 'get:appInfo:remove', 2, '', 2, NULL, NULL);
INSERT INTO `sys_menu` VALUES (346, 317, '删除', '', 'get:appInfo:remove', 2, '', 2, NULL, NULL);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `role_sign` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色标识',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `user_id_create` bigint(255) NULL DEFAULT NULL COMMENT '创建用户id',
  `gmt_create` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '开发管理员角色', 'admin', '拥有最高权限', 2, '2017-08-12 00:43:52', '2017-08-12 19:14:59');
INSERT INTO `sys_role` VALUES (3, '系统管理员', NULL, '本系统的所有者拥有最高权限', NULL, NULL, NULL);
INSERT INTO `sys_role` VALUES (6, '芝麻钱包管理员', NULL, '芝麻钱包管理员', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) NULL DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NULL DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9248 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色与菜单对应关系' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (7082, 3, 217);
INSERT INTO `sys_role_menu` VALUES (7083, 3, 215);
INSERT INTO `sys_role_menu` VALUES (7084, 3, 213);
INSERT INTO `sys_role_menu` VALUES (7085, 3, 212);
INSERT INTO `sys_role_menu` VALUES (7086, 3, 198);
INSERT INTO `sys_role_menu` VALUES (7087, 3, 197);
INSERT INTO `sys_role_menu` VALUES (7088, 3, 186);
INSERT INTO `sys_role_menu` VALUES (7089, 3, 184);
INSERT INTO `sys_role_menu` VALUES (7090, 3, 182);
INSERT INTO `sys_role_menu` VALUES (7091, 3, 210);
INSERT INTO `sys_role_menu` VALUES (7092, 3, 201);
INSERT INTO `sys_role_menu` VALUES (7093, 3, 163);
INSERT INTO `sys_role_menu` VALUES (7094, 3, 162);
INSERT INTO `sys_role_menu` VALUES (7095, 3, 161);
INSERT INTO `sys_role_menu` VALUES (7096, 3, 159);
INSERT INTO `sys_role_menu` VALUES (7097, 3, 158);
INSERT INTO `sys_role_menu` VALUES (7098, 3, 154);
INSERT INTO `sys_role_menu` VALUES (7099, 3, 208);
INSERT INTO `sys_role_menu` VALUES (7100, 3, 151);
INSERT INTO `sys_role_menu` VALUES (7101, 3, 150);
INSERT INTO `sys_role_menu` VALUES (7102, 3, 188);
INSERT INTO `sys_role_menu` VALUES (7103, 3, 141);
INSERT INTO `sys_role_menu` VALUES (7104, 3, 140);
INSERT INTO `sys_role_menu` VALUES (7105, 3, 205);
INSERT INTO `sys_role_menu` VALUES (7106, 3, 92);
INSERT INTO `sys_role_menu` VALUES (7107, 3, 57);
INSERT INTO `sys_role_menu` VALUES (7108, 3, 30);
INSERT INTO `sys_role_menu` VALUES (7109, 3, 29);
INSERT INTO `sys_role_menu` VALUES (7110, 3, 28);
INSERT INTO `sys_role_menu` VALUES (7111, 3, 209);
INSERT INTO `sys_role_menu` VALUES (7112, 3, 207);
INSERT INTO `sys_role_menu` VALUES (7113, 3, 203);
INSERT INTO `sys_role_menu` VALUES (7114, 3, 76);
INSERT INTO `sys_role_menu` VALUES (7115, 3, 75);
INSERT INTO `sys_role_menu` VALUES (7116, 3, 74);
INSERT INTO `sys_role_menu` VALUES (7117, 3, 62);
INSERT INTO `sys_role_menu` VALUES (7118, 3, 56);
INSERT INTO `sys_role_menu` VALUES (7119, 3, 55);
INSERT INTO `sys_role_menu` VALUES (7120, 3, 15);
INSERT INTO `sys_role_menu` VALUES (7121, 3, 26);
INSERT INTO `sys_role_menu` VALUES (7122, 3, 25);
INSERT INTO `sys_role_menu` VALUES (7123, 3, 24);
INSERT INTO `sys_role_menu` VALUES (7124, 3, 14);
INSERT INTO `sys_role_menu` VALUES (7125, 3, 13);
INSERT INTO `sys_role_menu` VALUES (7126, 3, 12);
INSERT INTO `sys_role_menu` VALUES (7127, 3, 61);
INSERT INTO `sys_role_menu` VALUES (7128, 3, 22);
INSERT INTO `sys_role_menu` VALUES (7129, 3, 21);
INSERT INTO `sys_role_menu` VALUES (7130, 3, 20);
INSERT INTO `sys_role_menu` VALUES (7131, 3, 71);
INSERT INTO `sys_role_menu` VALUES (7132, 3, 216);
INSERT INTO `sys_role_menu` VALUES (7133, 3, 214);
INSERT INTO `sys_role_menu` VALUES (7134, 3, 211);
INSERT INTO `sys_role_menu` VALUES (7135, 3, 193);
INSERT INTO `sys_role_menu` VALUES (7136, 3, 179);
INSERT INTO `sys_role_menu` VALUES (7137, 3, 176);
INSERT INTO `sys_role_menu` VALUES (7138, 3, 147);
INSERT INTO `sys_role_menu` VALUES (7139, 3, 146);
INSERT INTO `sys_role_menu` VALUES (7140, 3, 145);
INSERT INTO `sys_role_menu` VALUES (7141, 3, 144);
INSERT INTO `sys_role_menu` VALUES (7142, 3, 178);
INSERT INTO `sys_role_menu` VALUES (7143, 3, 139);
INSERT INTO `sys_role_menu` VALUES (7144, 3, 138);
INSERT INTO `sys_role_menu` VALUES (7145, 3, 204);
INSERT INTO `sys_role_menu` VALUES (7146, 3, 109);
INSERT INTO `sys_role_menu` VALUES (7147, 3, 27);
INSERT INTO `sys_role_menu` VALUES (7148, 3, 91);
INSERT INTO `sys_role_menu` VALUES (7149, 3, 202);
INSERT INTO `sys_role_menu` VALUES (7150, 3, 73);
INSERT INTO `sys_role_menu` VALUES (7151, 3, 7);
INSERT INTO `sys_role_menu` VALUES (7152, 3, 6);
INSERT INTO `sys_role_menu` VALUES (7153, 3, 2);
INSERT INTO `sys_role_menu` VALUES (7154, 3, 3);
INSERT INTO `sys_role_menu` VALUES (7155, 3, 218);
INSERT INTO `sys_role_menu` VALUES (7156, 3, 160);
INSERT INTO `sys_role_menu` VALUES (7157, 3, -1);
INSERT INTO `sys_role_menu` VALUES (7158, 3, 1);
INSERT INTO `sys_role_menu` VALUES (7618, 6, 264);
INSERT INTO `sys_role_menu` VALUES (7619, 6, 263);
INSERT INTO `sys_role_menu` VALUES (7620, 6, 261);
INSERT INTO `sys_role_menu` VALUES (7621, 6, 260);
INSERT INTO `sys_role_menu` VALUES (7622, 6, 258);
INSERT INTO `sys_role_menu` VALUES (7623, 6, 257);
INSERT INTO `sys_role_menu` VALUES (7624, 6, 250);
INSERT INTO `sys_role_menu` VALUES (7625, 6, 248);
INSERT INTO `sys_role_menu` VALUES (7626, 6, 246);
INSERT INTO `sys_role_menu` VALUES (7627, 6, 252);
INSERT INTO `sys_role_menu` VALUES (7628, 6, 244);
INSERT INTO `sys_role_menu` VALUES (7629, 6, 243);
INSERT INTO `sys_role_menu` VALUES (7630, 6, 251);
INSERT INTO `sys_role_menu` VALUES (7631, 6, 240);
INSERT INTO `sys_role_menu` VALUES (7632, 6, 239);
INSERT INTO `sys_role_menu` VALUES (7633, 6, 229);
INSERT INTO `sys_role_menu` VALUES (7634, 6, 228);
INSERT INTO `sys_role_menu` VALUES (7635, 6, 227);
INSERT INTO `sys_role_menu` VALUES (7636, 6, 268);
INSERT INTO `sys_role_menu` VALUES (7637, 6, 267);
INSERT INTO `sys_role_menu` VALUES (7638, 6, 266);
INSERT INTO `sys_role_menu` VALUES (7639, 6, 262);
INSERT INTO `sys_role_menu` VALUES (7640, 6, 259);
INSERT INTO `sys_role_menu` VALUES (7641, 6, 256);
INSERT INTO `sys_role_menu` VALUES (7642, 6, 249);
INSERT INTO `sys_role_menu` VALUES (7643, 6, 247);
INSERT INTO `sys_role_menu` VALUES (7644, 6, 245);
INSERT INTO `sys_role_menu` VALUES (7645, 6, 237);
INSERT INTO `sys_role_menu` VALUES (7646, 6, 242);
INSERT INTO `sys_role_menu` VALUES (7647, 6, 238);
INSERT INTO `sys_role_menu` VALUES (7648, 6, 236);
INSERT INTO `sys_role_menu` VALUES (7649, 6, 226);
INSERT INTO `sys_role_menu` VALUES (7650, 6, 219);
INSERT INTO `sys_role_menu` VALUES (7651, 6, 265);
INSERT INTO `sys_role_menu` VALUES (7652, 6, 269);
INSERT INTO `sys_role_menu` VALUES (7653, 6, 271);
INSERT INTO `sys_role_menu` VALUES (7654, 6, 270);
INSERT INTO `sys_role_menu` VALUES (7655, 6, 255);
INSERT INTO `sys_role_menu` VALUES (7656, 6, -1);
INSERT INTO `sys_role_menu` VALUES (7657, 6, 109);
INSERT INTO `sys_role_menu` VALUES (9132, 1, 344);
INSERT INTO `sys_role_menu` VALUES (9133, 1, 343);
INSERT INTO `sys_role_menu` VALUES (9134, 1, 342);
INSERT INTO `sys_role_menu` VALUES (9135, 1, 341);
INSERT INTO `sys_role_menu` VALUES (9136, 1, 340);
INSERT INTO `sys_role_menu` VALUES (9137, 1, 338);
INSERT INTO `sys_role_menu` VALUES (9138, 1, 337);
INSERT INTO `sys_role_menu` VALUES (9139, 1, 335);
INSERT INTO `sys_role_menu` VALUES (9140, 1, 334);
INSERT INTO `sys_role_menu` VALUES (9141, 1, 332);
INSERT INTO `sys_role_menu` VALUES (9142, 1, 331);
INSERT INTO `sys_role_menu` VALUES (9143, 1, 329);
INSERT INTO `sys_role_menu` VALUES (9144, 1, 328);
INSERT INTO `sys_role_menu` VALUES (9145, 1, 326);
INSERT INTO `sys_role_menu` VALUES (9146, 1, 325);
INSERT INTO `sys_role_menu` VALUES (9147, 1, 323);
INSERT INTO `sys_role_menu` VALUES (9148, 1, 322);
INSERT INTO `sys_role_menu` VALUES (9149, 1, 316);
INSERT INTO `sys_role_menu` VALUES (9150, 1, 315);
INSERT INTO `sys_role_menu` VALUES (9151, 1, 314);
INSERT INTO `sys_role_menu` VALUES (9152, 1, 313);
INSERT INTO `sys_role_menu` VALUES (9153, 1, 311);
INSERT INTO `sys_role_menu` VALUES (9154, 1, 308);
INSERT INTO `sys_role_menu` VALUES (9155, 1, 306);
INSERT INTO `sys_role_menu` VALUES (9156, 1, 305);
INSERT INTO `sys_role_menu` VALUES (9157, 1, 301);
INSERT INTO `sys_role_menu` VALUES (9158, 1, 283);
INSERT INTO `sys_role_menu` VALUES (9159, 1, 282);
INSERT INTO `sys_role_menu` VALUES (9160, 1, 281);
INSERT INTO `sys_role_menu` VALUES (9161, 1, 295);
INSERT INTO `sys_role_menu` VALUES (9162, 1, 294);
INSERT INTO `sys_role_menu` VALUES (9163, 1, 293);
INSERT INTO `sys_role_menu` VALUES (9164, 1, 309);
INSERT INTO `sys_role_menu` VALUES (9165, 1, 345);
INSERT INTO `sys_role_menu` VALUES (9166, 1, 319);
INSERT INTO `sys_role_menu` VALUES (9167, 1, 318);
INSERT INTO `sys_role_menu` VALUES (9168, 1, 291);
INSERT INTO `sys_role_menu` VALUES (9169, 1, 290);
INSERT INTO `sys_role_menu` VALUES (9170, 1, 289);
INSERT INTO `sys_role_menu` VALUES (9171, 1, 287);
INSERT INTO `sys_role_menu` VALUES (9172, 1, 286);
INSERT INTO `sys_role_menu` VALUES (9173, 1, 285);
INSERT INTO `sys_role_menu` VALUES (9174, 1, 205);
INSERT INTO `sys_role_menu` VALUES (9175, 1, 92);
INSERT INTO `sys_role_menu` VALUES (9176, 1, 57);
INSERT INTO `sys_role_menu` VALUES (9177, 1, 30);
INSERT INTO `sys_role_menu` VALUES (9178, 1, 29);
INSERT INTO `sys_role_menu` VALUES (9179, 1, 28);
INSERT INTO `sys_role_menu` VALUES (9180, 1, 206);
INSERT INTO `sys_role_menu` VALUES (9181, 1, 118);
INSERT INTO `sys_role_menu` VALUES (9182, 1, 48);
INSERT INTO `sys_role_menu` VALUES (9183, 1, 302);
INSERT INTO `sys_role_menu` VALUES (9184, 1, 209);
INSERT INTO `sys_role_menu` VALUES (9185, 1, 207);
INSERT INTO `sys_role_menu` VALUES (9186, 1, 203);
INSERT INTO `sys_role_menu` VALUES (9187, 1, 76);
INSERT INTO `sys_role_menu` VALUES (9188, 1, 75);
INSERT INTO `sys_role_menu` VALUES (9189, 1, 74);
INSERT INTO `sys_role_menu` VALUES (9190, 1, 62);
INSERT INTO `sys_role_menu` VALUES (9191, 1, 56);
INSERT INTO `sys_role_menu` VALUES (9192, 1, 55);
INSERT INTO `sys_role_menu` VALUES (9193, 1, 15);
INSERT INTO `sys_role_menu` VALUES (9194, 1, 26);
INSERT INTO `sys_role_menu` VALUES (9195, 1, 25);
INSERT INTO `sys_role_menu` VALUES (9196, 1, 24);
INSERT INTO `sys_role_menu` VALUES (9197, 1, 14);
INSERT INTO `sys_role_menu` VALUES (9198, 1, 13);
INSERT INTO `sys_role_menu` VALUES (9199, 1, 12);
INSERT INTO `sys_role_menu` VALUES (9200, 1, 61);
INSERT INTO `sys_role_menu` VALUES (9201, 1, 22);
INSERT INTO `sys_role_menu` VALUES (9202, 1, 21);
INSERT INTO `sys_role_menu` VALUES (9203, 1, 20);
INSERT INTO `sys_role_menu` VALUES (9204, 1, 83);
INSERT INTO `sys_role_menu` VALUES (9205, 1, 81);
INSERT INTO `sys_role_menu` VALUES (9206, 1, 80);
INSERT INTO `sys_role_menu` VALUES (9207, 1, 79);
INSERT INTO `sys_role_menu` VALUES (9208, 1, 71);
INSERT INTO `sys_role_menu` VALUES (9209, 1, 339);
INSERT INTO `sys_role_menu` VALUES (9210, 1, 336);
INSERT INTO `sys_role_menu` VALUES (9211, 1, 333);
INSERT INTO `sys_role_menu` VALUES (9212, 1, 330);
INSERT INTO `sys_role_menu` VALUES (9213, 1, 327);
INSERT INTO `sys_role_menu` VALUES (9214, 1, 324);
INSERT INTO `sys_role_menu` VALUES (9215, 1, 321);
INSERT INTO `sys_role_menu` VALUES (9216, 1, 320);
INSERT INTO `sys_role_menu` VALUES (9217, 1, 312);
INSERT INTO `sys_role_menu` VALUES (9218, 1, 310);
INSERT INTO `sys_role_menu` VALUES (9219, 1, 307);
INSERT INTO `sys_role_menu` VALUES (9220, 1, 303);
INSERT INTO `sys_role_menu` VALUES (9221, 1, 304);
INSERT INTO `sys_role_menu` VALUES (9222, 1, 300);
INSERT INTO `sys_role_menu` VALUES (9223, 1, 299);
INSERT INTO `sys_role_menu` VALUES (9224, 1, 298);
INSERT INTO `sys_role_menu` VALUES (9225, 1, 280);
INSERT INTO `sys_role_menu` VALUES (9226, 1, 279);
INSERT INTO `sys_role_menu` VALUES (9227, 1, 292);
INSERT INTO `sys_role_menu` VALUES (9228, 1, 273);
INSERT INTO `sys_role_menu` VALUES (9229, 1, 272);
INSERT INTO `sys_role_menu` VALUES (9230, 1, 288);
INSERT INTO `sys_role_menu` VALUES (9231, 1, 284);
INSERT INTO `sys_role_menu` VALUES (9232, 1, 204);
INSERT INTO `sys_role_menu` VALUES (9233, 1, 27);
INSERT INTO `sys_role_menu` VALUES (9234, 1, 91);
INSERT INTO `sys_role_menu` VALUES (9235, 1, 77);
INSERT INTO `sys_role_menu` VALUES (9236, 1, 202);
INSERT INTO `sys_role_menu` VALUES (9237, 1, 73);
INSERT INTO `sys_role_menu` VALUES (9238, 1, 7);
INSERT INTO `sys_role_menu` VALUES (9239, 1, 6);
INSERT INTO `sys_role_menu` VALUES (9240, 1, 2);
INSERT INTO `sys_role_menu` VALUES (9241, 1, 3);
INSERT INTO `sys_role_menu` VALUES (9242, 1, 78);
INSERT INTO `sys_role_menu` VALUES (9243, 1, 1);
INSERT INTO `sys_role_menu` VALUES (9244, 1, 346);
INSERT INTO `sys_role_menu` VALUES (9245, 1, 317);
INSERT INTO `sys_role_menu` VALUES (9246, 1, 109);
INSERT INTO `sys_role_menu` VALUES (9247, 1, -1);

-- ----------------------------
-- Table structure for sys_task
-- ----------------------------
DROP TABLE IF EXISTS `sys_task`;
CREATE TABLE `sys_task`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'cron表达式',
  `method_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务调用的方法名',
  `is_concurrent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务是否有状态',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务描述',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `bean_class` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务执行时调用哪个类的方法 包名+类名',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `job_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务状态',
  `job_group` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务分组',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `spring_bean` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Spring bean',
  `job_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_task
-- ----------------------------
INSERT INTO `sys_task` VALUES (2, '0/10 * * * * ?', 'run1', '1', '', '4028ea815a3d2a8c015a3d2f8d2a0002', 'com.bootdo.common.task.WelcomeJob', '2017-05-19 18:30:56', '0', 'group1', '2017-05-19 18:31:07', NULL, '', 'welcomJob');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `dept_id` bigint(20) NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `status` tinyint(255) NULL DEFAULT NULL COMMENT '状态 0:禁用，1:正常',
  `user_id_create` bigint(255) NULL DEFAULT NULL COMMENT '创建用户id',
  `gmt_create` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `sex` bigint(32) NULL DEFAULT NULL COMMENT '性别',
  `birth` datetime(0) NULL DEFAULT NULL COMMENT '出身日期',
  `pic_id` bigint(32) NULL DEFAULT NULL,
  `live_address` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '现居住地',
  `hobby` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '爱好',
  `province` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份',
  `city` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所在城市',
  `district` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所在地区',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', 'sun ya long', 'a47bcdfb674847caed412a5e37743df5', 6, 'admin@example.com', '17370666933', 1, 1, '2017-08-15 21:40:39', '2017-08-15 21:41:00', 96, '2017-12-22 00:00:00', 138, 'ccc', '121;', '北京市', '北京市市辖区', '东城区');
INSERT INTO `sys_user` VALUES (2, 'dev', 'dev', 'e0a772a8ab986e060b1e72cc7ed1ef4f', 6, '17088880000@163.com', '17088880000', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) NULL DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 159 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与角色对应关系' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (156, 1, 6);
INSERT INTO `sys_user_role` VALUES (157, 1, 1);
INSERT INTO `sys_user_role` VALUES (158, 2, 6);

-- ----------------------------
-- Table structure for t_backup_log
-- ----------------------------
DROP TABLE IF EXISTS `t_backup_log`;
CREATE TABLE `t_backup_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `operation` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作类型',
  `operation_time` varchar(14) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作时间',
  `file_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备份文件名',
  `file_size` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备份文件大小',
  `table_names` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备份文件内容（那些表或者是整个数据库）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_ids
-- ----------------------------
DROP TABLE IF EXISTS `t_ids`;
CREATE TABLE `t_ids`  (
  `tid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `random` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '随机数',
  PRIMARY KEY (`tid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_language
-- ----------------------------
DROP TABLE IF EXISTS `t_language`;
CREATE TABLE `t_language`  (
  `tid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '主键',
  `zh_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '中文数值',
  `to_status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'en' COMMENT '需要翻译的语言标识zh表示中文,en标识英文',
  `to_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '将zh_text翻译后的值',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '0为可用,1为不可用',
  PRIMARY KEY (`tid`) USING BTREE,
  INDEX `zh_text_index`(`zh_text`(255)) USING BTREE,
  INDEX `to_index`(`to_status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '国际化语言表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_language_category
-- ----------------------------
DROP TABLE IF EXISTS `t_language_category`;
CREATE TABLE `t_language_category`  (
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '语言标识符',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '语言名称',
  `status_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '语言对应的图标',
  `sort` int(255) NULL DEFAULT 0 COMMENT '排序',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '说明',
  `is_enable` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '是否显示',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '添加时间',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`status`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '语言分类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_language_category
-- ----------------------------
INSERT INTO `t_language_category` VALUES ('en', 'English', '/files/5bf59366-feba-4086-b0d7-c246855d0188.jpg', 2, '英文', '0', '2018-09-13 13:02:00', '2018-09-13 14:04:50');
INSERT INTO `t_language_category` VALUES ('jp', '日本語は', '/files/5e437896-a871-4f91-9f14-70e01284c06a.jpg', 3, '日语', '1', '2018-09-13 13:49:07', '2018-09-20 17:17:54');
INSERT INTO `t_language_category` VALUES ('zh', '简体中文', '/files/838245ae-cb09-4490-badb-fde32ae7136c.jpg', 1, '中文', '0', '2018-09-13 13:02:03', '2018-09-18 17:29:56');

-- ----------------------------
-- Table structure for t_mail_record
-- ----------------------------
DROP TABLE IF EXISTS `t_mail_record`;
CREATE TABLE `t_mail_record`  (
  `tid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容',
  `status` int(1) NULL DEFAULT NULL COMMENT '状态',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '删除标识',
  PRIMARY KEY (`tid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '邮箱注册码表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_mail_record
-- ----------------------------
INSERT INTO `t_mail_record` VALUES ('020c593581734efcbd0c0bbbdc5bdb33', 'test1@qq.com', '6918', 1, '2019-09-27 15:33:43', NULL, '0');
INSERT INTO `t_mail_record` VALUES ('025ff64eb6df4311be3deec5b48f7a63', 'test@qq.com', '9408', 1, '2019-09-27 15:27:18', NULL, '0');
INSERT INTO `t_mail_record` VALUES ('0363a72f69924ef19fbb626eb903b332', '953751759@qq.com', '5745', 1, '2019-09-26 17:18:16', NULL, '0');
INSERT INTO `t_mail_record` VALUES ('04e8d9e3803e45c289225f5ba606045e', '27592285@qq.com', '8625', 1, '2019-09-27 14:40:33', NULL, '0');
INSERT INTO `t_mail_record` VALUES ('0b48cd01f9a04c9f95e3c5c31d23a597', 'test1@qq.com', '9613', 0, '2019-09-27 15:45:14', NULL, '0');
INSERT INTO `t_mail_record` VALUES ('1c5a2b8d76b94fdb8952dbf375c9dea3', '953751759@qq.com', '2236', 1, '2019-09-27 17:22:00', NULL, '0');
INSERT INTO `t_mail_record` VALUES ('1de52c69fcdf4e078f48e1bb01a103ac', 'jjbph@qq.com', '3352', 1, '2019-09-27 16:45:43', NULL, '0');
INSERT INTO `t_mail_record` VALUES ('3184b03cd1684b07848bb5720951757a', 'ygvh@qq.com', '5053', 1, '2019-09-27 16:50:42', NULL, '0');
INSERT INTO `t_mail_record` VALUES ('4df933c652c54a5c9dd289ab4a18ddbe', 'test@qq.com', '1813', 1, '2019-09-27 15:39:45', NULL, '0');
INSERT INTO `t_mail_record` VALUES ('4f0807726f7541e19def17c7d506416a', 'hgdfg@qq.com', '1217', 0, '2019-09-27 16:43:33', NULL, '0');
INSERT INTO `t_mail_record` VALUES ('54bb8e1dbe604eb2a310024b9cc17eac', '112217888@qq.com', '5697', 1, '2019-09-26 20:00:07', NULL, '0');
INSERT INTO `t_mail_record` VALUES ('6ba3245c62af4d4d81395ca21b41eaf3', '1145308642@qq.com', '9279', 1, '2019-09-26 14:56:20', NULL, '0');
INSERT INTO `t_mail_record` VALUES ('6bcc85e17c26463b97dd5c1658f963d5', '1145308642@qq.com', '6200', 1, '2019-09-26 19:47:59', NULL, '0');
INSERT INTO `t_mail_record` VALUES ('6c8714802f514ace95a72285e5248eb0', 'jjgf@qq.com', '6490', 1, '2019-09-27 15:06:15', NULL, '0');
INSERT INTO `t_mail_record` VALUES ('7ceaa1bb56fe43f5a1d1949913c00798', '7hhhhb@qq.com', '7796', 1, '2019-09-27 16:48:15', NULL, '0');
INSERT INTO `t_mail_record` VALUES ('83175f064eea4e268b20120f5e1db0ad', '1145308642@qq.com', '5380', 1, '2019-09-27 16:53:37', NULL, '0');
INSERT INTO `t_mail_record` VALUES ('837797b309cc4ce194bac39e50ac3bf0', '1145308642@qq.com', '6947', 1, '2019-09-26 19:55:31', NULL, '0');
INSERT INTO `t_mail_record` VALUES ('904c706da8ed4ff58218fa35a2cccf36', '112217888@qq.com', '7357', 1, '2019-09-26 16:05:47', NULL, '0');
INSERT INTO `t_mail_record` VALUES ('a273d0c81fec4c2389e37d4c3afae2c4', '1145308642@qq.com', '7393', 1, '2019-09-26 19:47:27', NULL, '0');
INSERT INTO `t_mail_record` VALUES ('ab820ff4759a4f94b995894c9368c95a', '1145308642@qq.com', '3723', 1, '2019-09-27 15:58:10', NULL, '0');
INSERT INTO `t_mail_record` VALUES ('acf8431625964714b6b55b2671ee6308', 'jbvggf@qq.com', '1181', 1, '2019-09-27 17:02:47', NULL, '0');
INSERT INTO `t_mail_record` VALUES ('add04083ef03479db1b47deb1661cdea', 'test@qq.com', '8252', 1, '2019-09-27 15:28:13', NULL, '0');
INSERT INTO `t_mail_record` VALUES ('b01d940867244d0b947970540b684928', 'test@qq.com', '5677', 0, '2019-09-27 15:44:02', NULL, '0');
INSERT INTO `t_mail_record` VALUES ('b1cde607d89d489bbf660adf40978166', '953751758@qq.com', '6518', 1, '2019-09-29 10:18:16', NULL, '0');
INSERT INTO `t_mail_record` VALUES ('b7d32e046c8a41359533e145b223800b', 'jjgf@qq.com', '1482', 1, '2019-09-27 15:08:51', NULL, '0');
INSERT INTO `t_mail_record` VALUES ('b8db983e61a24370af84a7551215f09a', 'test2@qq.com', '9726', 0, '2019-09-27 15:46:46', NULL, '0');
INSERT INTO `t_mail_record` VALUES ('ca79d6b8ba824db488dde8c1a4123a0e', 'tttt@qq.com', '7823', 1, '2019-09-27 17:05:08', NULL, '0');
INSERT INTO `t_mail_record` VALUES ('df7b9670167a463b94195235f8d9300f', '1143178854@qq.com', '8131', 1, '2019-09-27 14:47:26', NULL, '0');
INSERT INTO `t_mail_record` VALUES ('eb5e03aadd6a4ff4bde82875f80867a4', 'jjbhh@qq.com', '8190', 1, '2019-09-27 16:44:08', NULL, '0');
INSERT INTO `t_mail_record` VALUES ('f2cf7aa19e0a4be58aae0bb451161047', 'hgdfg@qq.com', '3196', 1, '2019-09-27 16:42:31', NULL, '0');
INSERT INTO `t_mail_record` VALUES ('f74682cfadfa4423993450d27b9494fa', 'test2@qq.com', '5186', 1, '2019-09-27 15:47:07', NULL, '0');

-- ----------------------------
-- Table structure for t_security_manager
-- ----------------------------
DROP TABLE IF EXISTS `t_security_manager`;
CREATE TABLE `t_security_manager`  (
  `tid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `security_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '安全密匙',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `del_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`tid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_security_manager
-- ----------------------------
INSERT INTO `t_security_manager` VALUES ('00018633ac8a4e219f6e2e477613a617', 'df5fb0d41b734b5ab1ca07e5c984504b', '2019-01-03 14:01:00', '0');
INSERT INTO `t_security_manager` VALUES ('00037aed9f5641539b784e5b24de2163', '754292d53ad24a6ea033a5d8062c4bd6', '2019-01-18 23:33:00', '0');
INSERT INTO `t_security_manager` VALUES ('0006a70d279d402da8ddebe4c8719c73', 'a3e2c00acd824e879b9e2592f968db51', '2019-01-11 00:55:00', '0');
INSERT INTO `t_security_manager` VALUES ('0006e11e9ae149e197e321c98bd4bd13', '23569a16d0e44e9596f9796c35c3b4ee', '2019-01-20 05:08:00', '0');
INSERT INTO `t_security_manager` VALUES ('0006f32fa2fb4c128b4502db2a4e0514', '818ec89c437644eda96e82a0a222c74b', '2018-12-29 08:51:00', '0');
INSERT INTO `t_security_manager` VALUES ('0007a5816a964ae0883d2d595b443efe', 'ab859e171364423c9a536d7713dc38fc', '2019-01-21 01:10:00', '0');

-- ----------------------------
-- Table structure for t_sw_account_record
-- ----------------------------
DROP TABLE IF EXISTS `t_sw_account_record`;
CREATE TABLE `t_sw_account_record`  (
  `tid` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `num` int(11) NOT NULL COMMENT '流水号',
  `type` int(11) NULL DEFAULT NULL COMMENT '交易类型',
  `coin_type_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '币种类型id',
  `currency` decimal(65, 4) NULL DEFAULT NULL COMMENT '金额',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `current_amount` decimal(65, 4) NULL DEFAULT NULL COMMENT '当前账户金额',
  `ex2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ex2',
  `ex3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ex3',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '删除标识',
  PRIMARY KEY (`tid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '账户记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sw_account_record
-- ----------------------------
INSERT INTO `t_sw_account_record` VALUES ('004184e9d95e44769c56a47799876af5', 104414, 1009, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 20.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 100060.0000, NULL, NULL, '2019-09-18 10:43:00', '2019-09-18 10:43:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('0057927753b8490a9927ecae85b464ea', 104428, 1002, 9, 'cb7f09bdb0ef4174abd446d6c1e7745b', 50000.0000, 'system.benchmarking', 50000.0000, NULL, NULL, '2019-09-26 19:59:35', '2019-09-26 19:59:35', '0');
INSERT INTO `t_sw_account_record` VALUES ('0060fd8569c040ce992dc63c6e2c940d', 104414, 1017, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 60.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 71160.0000, NULL, NULL, '2019-09-18 17:01:00', '2019-09-18 17:01:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('00d5dfc8b68a4fa99412e3ee953a0e62', 104414, 1002, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 60.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 69450.0000, NULL, NULL, '2019-09-18 12:07:00', '2019-09-18 12:07:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('00de0769de354fdfb901847996586986', 104414, 1001, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', -1000.0000, '{\"en\":\"购买固币金\",\"zh\":\"购买固币金\"}', 99000.0000, NULL, NULL, '2019-09-18 15:46:09', '2019-09-18 15:46:09', '0');
INSERT INTO `t_sw_account_record` VALUES ('00ea2ecb51e5475cb821561cf4ccee47', 104414, 1031, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 60.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 70950.0000, NULL, NULL, '2019-09-18 12:32:00', '2019-09-18 12:32:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('01a250ca0d3b4a07a46da83a16dad209', 104414, 1018, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 60.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 70170.0000, NULL, NULL, '2019-09-18 12:19:00', '2019-09-18 12:19:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('01d15eb8427f4bd88466000f4ff45d41', 104414, 1003, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', -1000.0000, '{\"en\":\"购买固币金\",\"zh\":\"购买固币金\"}', 999000.0000, NULL, NULL, '2019-09-17 17:06:44', '2019-09-17 17:06:44', '0');
INSERT INTO `t_sw_account_record` VALUES ('01fb87ba6e1f46ac85c57121f87115c7', 104414, 1002, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 1200.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 61400.0000, NULL, NULL, '2019-09-18 14:59:22', '2019-09-18 14:59:22', '0');
INSERT INTO `t_sw_account_record` VALUES ('029f3284f4e540428dd17af8af9be579', 104414, 1003, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', -1000.0000, '{\"en\":\"购买固币金\",\"zh\":\"购买固币金\"}', 51000.0000, NULL, NULL, '2019-09-23 11:43:25', '2019-09-23 11:43:25', '0');
INSERT INTO `t_sw_account_record` VALUES ('0311d0f30de54c53b5c6e23d51329374', 104420, 1026, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 600.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 72800.0000, NULL, NULL, '2019-09-18 17:04:00', '2019-09-18 17:04:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('034bd4fc03624cbb97259ee6f596002e', 104417, 1006, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 600.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 69600.0000, NULL, NULL, '2019-09-18 15:14:00', '2019-09-18 15:14:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('041ecf3e286b40758d899244577ad12c', 104414, 1019, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 60.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 70230.0000, NULL, NULL, '2019-09-18 12:20:00', '2019-09-18 12:20:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('0559cf0309934528b0209f1a80a46f42', 104413, 1010, 9, 'cb7f09bdb0ef4174abd446d6c1e7745b', 50000.0000, 'system.benchmarking', 1500000.0000, NULL, NULL, '2019-09-17 17:52:21', '2019-09-17 17:52:21', '0');
INSERT INTO `t_sw_account_record` VALUES ('06093d01fae34bffa6e2e2310601d591', 104414, 1002, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', -40000.0000, '{\"en\":\"购买定币金\",\"zh\":\"购买定币金\"}', 59000.0000, NULL, NULL, '2019-09-18 15:29:59', '2019-09-18 15:29:59', '0');
INSERT INTO `t_sw_account_record` VALUES ('06712e4ce3c047e5aaf129748dc7599e', 104420, 1005, 10, 'cb7f09bdb0ef4174abd446d6c1e7745b', 1.2345, '{\"en\":\"充值\",\"zh\":\"充值\"}', 200001.2345, NULL, NULL, '2019-09-20 10:03:16', '2019-09-20 10:03:16', '0');
INSERT INTO `t_sw_account_record` VALUES ('06c6a6ae3f534f3787dcc8ad88ee9793', 104414, 1015, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 60.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 69990.0000, NULL, NULL, '2019-09-18 12:16:00', '2019-09-18 12:16:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('06f5f68e11a5421cab4a10fde54f71e3', 104426, 1002, 7, 'cb7f09bdb0ef4174abd446d6c1e7745b', 450.0000, '{\"en\":\"定币金到期释放\",\"zh\":\"定币金到期释放\"}', 70800.0000, NULL, NULL, '2019-09-18 18:43:00', '2019-09-18 18:43:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('07536f26e30c4b7482505a9a40662c68', 104414, 1038, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 60.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 101960.0000, NULL, NULL, '2019-09-18 17:11:00', '2019-09-18 17:11:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('081c8c06aacd4b1eb2ac193a130f017f', 104418, 1017, 6, 'cb7f09bdb0ef4174abd446d6c1e7745b', 100.0000, '{\"en\":\"收款-sz104419\",\"zh\":\"收款-sz104419\"}', 994950.0000, NULL, NULL, '2019-09-17 19:12:46', '2019-09-17 19:12:46', '0');
INSERT INTO `t_sw_account_record` VALUES ('0933e3409fac4c07b18fc88e76a07d08', 104414, 1023, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 10.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 98010.0000, NULL, NULL, '2019-09-19 15:01:00', '2019-09-19 15:01:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('09b4b1b3f13b43658bcb7b71677b9c57', 104418, 1020, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 200.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 101200.0000, NULL, NULL, '2019-09-18 10:46:00', '2019-09-18 10:46:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('09f9927c99704dff92eedf8845c76692', 104413, 1019, 9, 'cb7f09bdb0ef4174abd446d6c1e7745b', 50000.0000, 'system.benchmarking', 1100000.0000, NULL, NULL, '2019-09-17 17:24:55', '2019-09-17 17:24:55', '0');
INSERT INTO `t_sw_account_record` VALUES ('0b592c2a8dff4503ae5cb5cb42f15c4b', 104426, 1009, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 600.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 70800.0000, NULL, NULL, '2019-09-19 12:06:00', '2019-09-19 12:06:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('0bae3c67c65e40159cb1f649ceaa035a', 104414, 1007, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 300.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 70020.0000, NULL, NULL, '2019-09-18 16:58:00', '2019-09-18 16:58:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('0c2d10d8cd9f4aab93479253de7af7fa', 104425, 1019, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 60.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 99300.0000, NULL, NULL, '2019-09-19 12:08:00', '2019-09-19 12:08:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('0c43e425309f4661b1af104ef963f57c', 104417, 1002, 9, '737d784555164db2862fd74361a97165', -200.0000, 'system.benchmarking', 99800.0000, NULL, NULL, '2019-09-19 19:04:12', '2019-09-19 19:04:12', '0');
INSERT INTO `t_sw_account_record` VALUES ('0f4243b7a2dc41b784548bc0fb34870f', 104414, 1048, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 60.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 72740.0000, NULL, NULL, '2019-09-18 17:19:00', '2019-09-18 17:19:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('102ea5b42a8e4024974f9451e46789d2', 104414, 1058, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', 30000.0000, '{\"en\":\"取消活币金\",\"zh\":\"取消活币金\"}', 103400.0000, NULL, NULL, '2019-09-18 17:25:11', '2019-09-18 17:25:11', '0');
INSERT INTO `t_sw_account_record` VALUES ('118659f786f6473d98767dc649061690', 104420, 1001, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 600.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 69900.0000, NULL, NULL, '2019-09-18 11:58:00', '2019-09-18 11:58:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('1213debe6474423aa8564a58a5588928', 104414, 1009, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 60.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 69630.0000, NULL, NULL, '2019-09-18 12:10:00', '2019-09-18 12:10:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('142ba04cf68249ebb35997e3185de372', 104424, 1012, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 30.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 99090.0000, NULL, NULL, '2019-09-19 12:06:00', '2019-09-19 12:06:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('1496ee981b914a7bab45c6258e4404a5', 104420, 1002, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', -1000.0000, '{\"en\":\"购买固币金\",\"zh\":\"购买固币金\"}', 99000.0000, NULL, NULL, '2019-07-01 16:23:07', '2019-07-01 16:23:07', '0');
INSERT INTO `t_sw_account_record` VALUES ('15e2f186181346fb9d327147c20ac5a8', 104418, 1007, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 200.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 994850.0000, NULL, NULL, '2019-09-17 18:08:00', '2019-09-17 18:08:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('16715841c6cc46a2aef43156647454d1', 104414, 1029, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 60.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 70830.0000, NULL, NULL, '2019-09-18 12:30:00', '2019-09-18 12:30:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('16a35dfc5eb04a8d811de192d2519005', 104417, 1010, 1, 'cb7f09bdb0ef4174abd446d6c1e7745b', 2000.0000, '{\"en\":\"固币金到期释放\",\"zh\":\"固币金到期释放\"}', 910000.0000, NULL, NULL, '2019-09-17 17:41:23', '2019-09-17 17:41:23', '0');
INSERT INTO `t_sw_account_record` VALUES ('16f88c78e9be49c8ae75a0a7d6f5ddc1', 104414, 1073, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 60.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 73720.0000, NULL, NULL, '2019-09-18 17:38:00', '2019-09-18 17:38:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('16fb2751eebb4f8c9c9b4d37b9fcf07d', 104414, 1004, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', -20000.0000, '{\"en\":\"购买活币金\",\"zh\":\"购买活币金\"}', 979000.0000, NULL, NULL, '2019-09-17 17:06:55', '2019-09-17 17:06:55', '0');
INSERT INTO `t_sw_account_record` VALUES ('1861c727a1d2475b8ae3b60609cee95b', 104414, 1013, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 60.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 69870.0000, NULL, NULL, '2019-09-18 12:14:00', '2019-09-18 12:14:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('186949a12ac4451882ed50db2534dd17', 104414, 1001, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 1500.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 50500.0000, NULL, NULL, '2019-09-23 11:36:00', '2019-09-23 11:36:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('19027bdef74a46f5bb6a91d9e8366609', 104414, 1005, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', 1000.0000, '{\"en\":\"取消活币金\",\"zh\":\"取消活币金\"}', 99000.0000, NULL, NULL, '2019-07-23 16:53:39', '2019-07-23 16:53:39', '0');
INSERT INTO `t_sw_account_record` VALUES ('19dbf78df02c47daa6bed5341b22114e', 104414, 1012, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 100.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 979600.0000, NULL, NULL, '2019-09-17 17:41:23', '2019-09-17 17:41:23', '0');
INSERT INTO `t_sw_account_record` VALUES ('1ab3dcbd654b43b287221dcb4634387b', 104424, 1003, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', -1000.0000, '{\"en\":\"购买固币金\",\"zh\":\"购买固币金\"}', 99000.0000, NULL, NULL, '2019-09-19 11:56:48', '2019-09-19 11:56:48', '0');
INSERT INTO `t_sw_account_record` VALUES ('1abaa9507cef4aeda2acb19db4ba6ea5', 104414, 1034, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 60.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 71130.0000, NULL, NULL, '2019-09-18 12:35:00', '2019-09-18 12:35:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('1bb34fff4b824e39885b41c11abb5ec3', 104420, 1002, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 600.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 69600.0000, NULL, NULL, '2019-09-18 16:56:00', '2019-09-18 16:56:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('1c092737ea07412a80e40598841aab61', 104414, 1070, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', -30000.0000, '{\"en\":\"购买定币金\",\"zh\":\"购买定币金\"}', 73000.0000, NULL, NULL, '2019-09-18 17:36:40', '2019-09-18 17:36:40', '0');
INSERT INTO `t_sw_account_record` VALUES ('1c3253fb7316416a8555635b5d30e22b', 104414, 1041, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 60.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 100310.0000, NULL, NULL, '2019-09-18 11:42:00', '2019-09-18 11:42:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('1c59417c75f14601ad4c372005ad9a7d', 104417, 1006, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 2000.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 910000.0000, NULL, NULL, '2019-09-17 17:39:00', '2019-09-17 17:39:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('1c9aa5648dc94781990976027360f662', 104414, 1078, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 600.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 75640.0000, NULL, NULL, '2019-09-18 17:41:00', '2019-09-18 17:41:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('1ca8118953b8429ca6f9fc4c26003e8c', 104414, 1014, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 200.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 979100.0000, NULL, NULL, '2019-09-17 17:14:05', '2019-09-17 17:14:05', '0');
INSERT INTO `t_sw_account_record` VALUES ('1d4ae71c87804bc595783c513c78f9f1', 104414, 1001, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', -1000.0000, '{\"en\":\"购买固币金\",\"zh\":\"购买固币金\"}', 999000.0000, NULL, NULL, '2019-09-17 17:03:11', '2019-09-17 17:03:11', '0');
INSERT INTO `t_sw_account_record` VALUES ('1da4618c56af4e26bd802391aba20939', 104420, 1037, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', -1000.0000, '{\"en\":\"购买固币金\",\"zh\":\"购买固币金\"}', 71300.0000, NULL, NULL, '2019-09-18 14:22:40', '2019-09-18 14:22:40', '0');
INSERT INTO `t_sw_account_record` VALUES ('1e69280f4c414a0891869826d6e2ad66', 104420, 1003, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', -30000.0000, '{\"en\":\"购买定币金\",\"zh\":\"购买定币金\"}', 69000.0000, NULL, NULL, '2019-07-23 16:53:27', '2019-07-23 16:53:27', '0');
INSERT INTO `t_sw_account_record` VALUES ('1e7a3c7e4d5549f2bcd5aed51698746f', 104417, 1004, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', -1000.0000, '{\"en\":\"购买固币金\",\"zh\":\"购买固币金\"}', 99000.0000, NULL, NULL, '2019-09-18 15:12:08', '2019-09-18 15:12:08', '0');
INSERT INTO `t_sw_account_record` VALUES ('1f310d2e646445cc94203c140e965987', 104414, 1033, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 60.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 71070.0000, NULL, NULL, '2019-09-18 12:34:00', '2019-09-18 12:34:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('1f883058f6aa485ebb33a77b33995075', 104417, 1018, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 10.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 100050.0000, NULL, NULL, '2019-09-18 10:45:00', '2019-09-18 10:45:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('2017681b23ef44e7ac8990a7d8d85abb', 104414, 1004, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 60.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 69510.0000, NULL, NULL, '2019-09-18 12:08:00', '2019-09-18 12:08:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('2044dc5034ac4400bf31ec0a92c56b76', 104414, 1003, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 800.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 59800.0000, NULL, NULL, '2019-09-18 15:41:00', '2019-09-18 15:41:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('20e9574746f84bbfb1e79b3db7f96ec1', 104418, 1001, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 200.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 994450.0000, NULL, NULL, '2019-09-17 18:06:00', '2019-09-17 18:06:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('2198225573c4445b80f2664a810a7e49', 104414, 1011, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 60.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 69750.0000, NULL, NULL, '2019-09-18 12:12:00', '2019-09-18 12:12:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('21f70f58e43b4c4e88a86bb71fad4ae5', 104414, 1006, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 20.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 979660.0000, NULL, NULL, '2019-09-17 18:07:00', '2019-09-17 18:07:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('220ac53940214794af957df182c2ffe0', 104420, 1007, 1, 'cb7f09bdb0ef4174abd446d6c1e7745b', 300.0000, '{\"en\":\"固币金到期释放\",\"zh\":\"固币金到期释放\"}', 71400.0000, NULL, NULL, '2019-09-18 12:10:00', '2019-09-18 12:10:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('23eed542757d49aa9b0a93b061dee2ce', 104425, 1003, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 60.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 99060.0000, NULL, NULL, '2019-09-19 12:04:00', '2019-09-19 12:04:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('27ba4b4d0c0b4345a8956aee46a9b94a', 104414, 1002, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', -20000.0000, '{\"en\":\"购买活币金\",\"zh\":\"购买活币金\"}', 979000.0000, NULL, NULL, '2019-09-17 17:03:56', '2019-09-17 17:03:56', '0');
INSERT INTO `t_sw_account_record` VALUES ('286c19dedd734a1797a6f857386f228a', 104414, 1003, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 20.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 979640.0000, NULL, NULL, '2019-09-17 18:06:00', '2019-09-17 18:06:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('291da189fb8d4e06bf30c4c0d77d5c71', 104414, 1001, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 300.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 69300.0000, NULL, NULL, '2019-09-18 16:56:00', '2019-09-18 16:56:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('29da1014eaad4f359f367047fe57d508', 104420, 1001, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', -1000.0000, '{\"en\":\"购买固币金\",\"zh\":\"购买固币金\"}', 99000.0000, NULL, NULL, '2019-07-23 16:53:12', '2019-07-23 16:53:12', '0');
INSERT INTO `t_sw_account_record` VALUES ('2a0155f95b72457c9b7450a08db0e208', 104414, 1057, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 60.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 73400.0000, NULL, NULL, '2019-09-18 17:25:00', '2019-09-18 17:25:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('2a89bd9f65f64a9bbd759e495c75d529', 104422, 1039, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', -30000.0000, '{\"en\":\"购买活币金\",\"zh\":\"购买活币金\"}', 0.0000, NULL, NULL, '2019-09-18 14:45:16', '2019-09-18 14:45:16', '0');
INSERT INTO `t_sw_account_record` VALUES ('2ab745eb12624669b74db493318cb748', 104414, 1017, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 60.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 70110.0000, NULL, NULL, '2019-09-18 12:18:00', '2019-09-18 12:18:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('2ab9b8d44fb246f4986fee5ffb2992ec', 104414, 1002, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 60.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 69390.0000, NULL, NULL, '2019-09-18 11:58:00', '2019-09-18 11:58:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('2b198f8d597f42468d2f6c5f7126bc08', 104413, 1021, 9, 'cb7f09bdb0ef4174abd446d6c1e7745b', 50000.0000, 'system.benchmarking', 1150000.0000, NULL, NULL, '2019-09-17 17:25:02', '2019-09-17 17:25:02', '0');
INSERT INTO `t_sw_account_record` VALUES ('2bfdb38e473c4dabbeed20b00887d400', 104414, 1005, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 300.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 69960.0000, NULL, NULL, '2019-09-18 04:36:00', '2019-09-18 04:36:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('2d3e9f5da8bd49f980ac92b7d8bc3b58', 104414, 1009, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 300.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 71160.0000, NULL, NULL, '2019-09-18 04:41:12', '2019-09-18 04:41:12', '0');
INSERT INTO `t_sw_account_record` VALUES ('2d5582ac8bf84427ab407887487c39ec', 104420, 1038, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 600.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 69890.0000, NULL, NULL, '2019-09-18 11:40:00', '2019-09-18 11:40:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('2edbbd233bdb4d498415fe3fa752a814', 104414, 1077, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 60.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 75040.0000, NULL, NULL, '2019-09-18 17:40:00', '2019-09-18 17:40:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('2f2e0d63b7f24e6182986efd283082bf', 104413, 1005, 9, '737d784555164db2862fd74361a97165', -100.0000, 'system.benchmarking', 999200.0000, NULL, NULL, '2019-09-17 17:52:01', '2019-09-17 17:52:01', '0');
INSERT INTO `t_sw_account_record` VALUES ('3064ad4ba1484b1399d6e1fe0d5d3c1c', 104414, 1004, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 300.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 69660.0000, NULL, NULL, '2019-09-18 04:35:00', '2019-09-18 04:35:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('30cef516427a45ea820ddf501a7f8235', 104414, 1006, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 20.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 100040.0000, NULL, NULL, '2019-09-18 10:42:00', '2019-09-18 10:42:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('30e3d773638f4718be8ba5e35bb6358b', 104419, 1016, 5, 'cb7f09bdb0ef4174abd446d6c1e7745b', -100.0000, '{\"en\":\"转账-sz104418\",\"zh\":\"转账-sz104418\"}', 28900.0000, NULL, NULL, '2019-09-17 19:12:46', '2019-09-17 19:12:46', '0');
INSERT INTO `t_sw_account_record` VALUES ('31eb325238294613a1c817e21f8d46d0', 104414, 1005, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 800.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 61400.0000, NULL, NULL, '2019-09-18 15:44:05', '2019-09-18 15:44:05', '0');
INSERT INTO `t_sw_account_record` VALUES ('33ea58cbc2af43d08b72e0b889a33e13', 104414, 1005, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 1200.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 62600.0000, NULL, NULL, '2019-09-18 15:33:00', '2019-09-18 15:33:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('341ee9b477ed4903a73902d5e67854b4', 104414, 1022, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', -1000.0000, '{\"en\":\"购买活币金\",\"zh\":\"购买活币金\"}', 98000.0000, NULL, NULL, '2019-09-19 15:00:05', '2019-09-19 15:00:05', '0');
INSERT INTO `t_sw_account_record` VALUES ('3437a72b277744bf92006c6b256acf79', 104414, 1003, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 20.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 979620.0000, NULL, NULL, '2019-09-17 18:02:00', '2019-09-17 18:02:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('345bbfebe66a4681b991a662efc99d84', 104417, 1007, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 600.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 70200.0000, NULL, NULL, '2019-09-18 15:15:00', '2019-09-18 15:15:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('354ad84ece5c4008b0c50d24db3d8846', 104414, 1008, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', -20000.0000, '{\"en\":\"购买活币金\",\"zh\":\"购买活币金\"}', 978900.0000, NULL, NULL, '2019-09-17 17:08:46', '2019-09-17 17:08:46', '0');
INSERT INTO `t_sw_account_record` VALUES ('36b7c54839e64bc9ab5b8c504f9280d3', 104417, 1013, 1, 'cb7f09bdb0ef4174abd446d6c1e7745b', 400.0000, '{\"en\":\"固币金到期释放\",\"zh\":\"固币金到期释放\"}', 73000.0000, NULL, NULL, '2019-09-18 15:21:32', '2019-09-18 15:21:32', '0');
INSERT INTO `t_sw_account_record` VALUES ('378c5a8d20654481b6703d5fa732cbbb', 104419, 1010, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', 30000.0000, '{\"en\":\"取消活币金\",\"zh\":\"取消活币金\"}', 130000.0000, NULL, NULL, '2019-09-18 10:43:06', '2019-09-18 10:43:06', '0');
INSERT INTO `t_sw_account_record` VALUES ('3912e6be44134ceba889aa7f6059bcb9', 104420, 1005, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', -30000.0000, '{\"en\":\"购买定币金\",\"zh\":\"购买定币金\"}', 69000.0000, NULL, NULL, '2019-07-01 16:24:08', '2019-07-01 16:24:08', '0');
INSERT INTO `t_sw_account_record` VALUES ('3976b76ebde94ac18fa28930e6edc701', 104414, 1006, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 60.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 69720.0000, NULL, NULL, '2019-09-18 16:57:00', '2019-09-18 16:57:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('39bc194ecde0479da36400a797f61726', 104426, 1001, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 450.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 70350.0000, NULL, NULL, '2019-09-18 18:43:00', '2019-09-18 18:43:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('3c974013ee6f4d67b60b0b6f88283478', 104414, 1040, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', -1000.0000, '{\"en\":\"购买固币金\",\"zh\":\"购买固币金\"}', 99000.0000, NULL, NULL, '2019-09-18 14:54:16', '2019-09-18 14:54:16', '0');
INSERT INTO `t_sw_account_record` VALUES ('3db21cf43c85473f879298121948ca05', 104414, 1066, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 60.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 103880.0000, NULL, NULL, '2019-09-18 17:33:00', '2019-09-18 17:33:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('3db29b07a21243eaa5a10c09556482b7', 104418, 1004, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 200.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 994650.0000, NULL, NULL, '2019-09-17 18:07:00', '2019-09-17 18:07:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('3e240a28934c445da66c917066c75fb1', 104414, 1043, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', -30000.0000, '{\"en\":\"购买活币金\",\"zh\":\"购买活币金\"}', 72200.0000, NULL, NULL, '2019-09-18 17:15:30', '2019-09-18 17:15:30', '0');
INSERT INTO `t_sw_account_record` VALUES ('3e9c639caa874500a0047600c3c20388', 104428, 1004, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', -25000.0000, '{\"en\":\"购买活币金\",\"zh\":\"购买活币金\"}', 20000.0000, NULL, NULL, '2019-09-26 20:02:37', '2019-09-26 20:02:37', '0');
INSERT INTO `t_sw_account_record` VALUES ('3eeee46f0b3a488380051bbcfdd79a19', 104414, 1019, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 300.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 71460.0000, NULL, NULL, '2019-09-18 17:02:00', '2019-09-18 17:02:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('40b9582a4bdc464e97d8fcf827775ff7', 104414, 1023, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 60.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 70470.0000, NULL, NULL, '2019-09-18 12:24:00', '2019-09-18 12:24:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('412ce48567bc43b3a70e66589e7b9608', 104417, 1004, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', -50000.0000, '{\"en\":\"购买定币金\",\"zh\":\"购买定币金\"}', 50000.0000, NULL, NULL, '2019-09-19 19:04:33', '2019-09-19 19:04:33', '0');
INSERT INTO `t_sw_account_record` VALUES ('41545255f13749448e8e4b4c6505efc7', 104417, 1008, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 2000.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 912000.0000, NULL, NULL, '2019-09-17 17:40:00', '2019-09-17 17:40:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('4182530499f44af99a7bfce91be8d5b4', 104420, 1030, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 600.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 74000.0000, NULL, NULL, '2019-09-18 17:06:00', '2019-09-18 17:06:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('41f54daaabf54bfea297423093808a48', 104420, 1006, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 60.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 99120.0000, NULL, NULL, '2019-09-19 12:05:00', '2019-09-19 12:05:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('41f8e8e843904813b5ceae240c762b40', 104426, 1002, 1, 'cb7f09bdb0ef4174abd446d6c1e7745b', 3000.0000, '{\"en\":\"固币金到期释放\",\"zh\":\"固币金到期释放\"}', 102000.0000, NULL, NULL, '2019-09-19 16:10:00', '2019-09-19 16:10:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('42547538b02146e0b836687257dc822a', 104414, 1009, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 60.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 70080.0000, NULL, NULL, '2019-09-18 16:58:00', '2019-09-18 16:58:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('4416623f8f054a138cb5eed2cd98393d', 104414, 1014, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 60.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 69930.0000, NULL, NULL, '2019-09-18 12:15:00', '2019-09-18 12:15:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('44340a5dc1704426923ad69119e6191c', 104420, 1014, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 60.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 99240.0000, NULL, NULL, '2019-09-19 12:07:00', '2019-09-19 12:07:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('44ef0f627e71461c8bc5c4ab738a8399', 104414, 1063, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 60.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 103700.0000, NULL, NULL, '2019-09-18 17:30:00', '2019-09-18 17:30:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('479492e89e4b4f378fdae03730cf4a00', 104428, 1007, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', 50000.0000, '{\"en\":\"取消活币金\",\"zh\":\"取消活币金\"}', 150000.0000, NULL, NULL, '2019-09-26 20:06:31', '2019-09-26 20:06:31', '0');
INSERT INTO `t_sw_account_record` VALUES ('47ed162bd9f1412995f616a04d8ed1a0', 104426, 1002, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', -1000.0000, '{\"en\":\"购买固币金\",\"zh\":\"购买固币金\"}', 99000.0000, NULL, NULL, '2019-09-19 11:55:32', '2019-09-19 11:55:32', '0');
INSERT INTO `t_sw_account_record` VALUES ('48640d118a14489eba10808d41b8c3cc', 104425, 1005, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', -1000.0000, '{\"en\":\"购买固币金\",\"zh\":\"购买固币金\"}', 99000.0000, NULL, NULL, '2019-09-19 11:58:01', '2019-09-19 11:58:01', '0');
INSERT INTO `t_sw_account_record` VALUES ('49191217e2264650ae2d42d25929d909', 104426, 1003, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', -30000.0000, '{\"en\":\"购买定币金\",\"zh\":\"购买定币金\"}', 69000.0000, NULL, NULL, '2019-09-23 18:11:03', '2019-09-23 18:11:03', '0');
INSERT INTO `t_sw_account_record` VALUES ('4978324deaf44e03937d84216e33d587', 104413, 1001, 9, '737d784555164db2862fd74361a97165', -100.0000, 'system.benchmarking', 999400.0000, NULL, NULL, '2019-09-17 17:51:30', '2019-09-17 17:51:30', '0');
INSERT INTO `t_sw_account_record` VALUES ('49f57173bee849bd83978130f0d69a4a', 104414, 1031, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 60.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 71360.0000, NULL, NULL, '2019-09-18 17:06:00', '2019-09-18 17:06:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('4a682d26ba424567bf694b98f46c04f0', 104420, 1001, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', -1000.0000, '{\"en\":\"购买固币金\",\"zh\":\"购买固币金\"}', 99000.0000, NULL, NULL, '2019-09-19 11:54:37', '2019-09-19 11:54:37', '0');
INSERT INTO `t_sw_account_record` VALUES ('4b2a1ac111d04635b5e1a93172fc8182', 104414, 1010, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 300.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 71460.0000, NULL, NULL, '2019-09-18 16:42:44', '2019-09-18 16:42:44', '0');
INSERT INTO `t_sw_account_record` VALUES ('4b7bacd25d7c46d1a2fa011939048cee', 104413, 1024, 9, '737d784555164db2862fd74361a97165', -100.0000, 'system.benchmarking', 999500.0000, NULL, NULL, '2019-09-17 17:25:13', '2019-09-17 17:25:13', '0');
INSERT INTO `t_sw_account_record` VALUES ('4d0064f73b3b40be8c1a634cab3b24b4', 104419, 1011, 9, 'cb7f09bdb0ef4174abd446d6c1e7745b', 50000.0000, 'system.benchmarking', 60000.0000, NULL, NULL, '2019-09-17 19:10:00', '2019-09-17 19:10:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('4f809027b69545d7bea4269ff2403bbc', 104426, 1001, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 600.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 69600.0000, NULL, NULL, '2019-09-19 12:04:00', '2019-09-19 12:04:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('50bde88d558a4b178b5506f9da42a3a6', 104414, 1001, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', -1000.0000, '{\"en\":\"购买固币金\",\"zh\":\"购买固币金\"}', 99000.0000, NULL, NULL, '2019-09-23 11:32:33', '2019-09-23 11:32:33', '0');
INSERT INTO `t_sw_account_record` VALUES ('51fdd4f5ac6f41f395134262ff693cde', 104414, 1010, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 60.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 69690.0000, NULL, NULL, '2019-09-18 12:11:00', '2019-09-18 12:11:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('520472bc0e604404bf18736baa0c0b59', 104419, 1036, 6, 'cb7f09bdb0ef4174abd446d6c1e7745b', 10.0001, '{\"en\":\"收款-sz104420\",\"zh\":\"收款-sz104420\"}', 100010.0001, NULL, NULL, '2019-09-18 11:15:53', '2019-09-18 11:15:53', '0');
INSERT INTO `t_sw_account_record` VALUES ('5310462948d94b1b9d7374f907b5ea9e', 104420, 1002, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 300.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 69300.0000, NULL, NULL, '2019-09-18 11:55:00', '2019-09-18 11:55:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('53453156c8bd43619bfc890d7f7987fc', 104414, 1001, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', -1000.0000, '{\"en\":\"购买固币金\",\"zh\":\"购买固币金\"}', 99000.0000, NULL, NULL, '2019-09-23 18:09:00', '2019-09-23 18:09:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('5463f8111fde462b8f4648b934588777', 104419, 1018, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', 30000.0000, '{\"en\":\"取消活币金\",\"zh\":\"取消活币金\"}', 60900.0000, NULL, NULL, '2019-09-17 19:18:39', '2019-09-17 19:18:39', '0');
INSERT INTO `t_sw_account_record` VALUES ('5599e4d129c34eeab21573e0a937b781', 104426, 1002, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', -1000.0000, '{\"en\":\"购买固币金\",\"zh\":\"购买固币金\"}', 99000.0000, NULL, NULL, '2019-09-23 18:10:44', '2019-09-23 18:10:44', '0');
INSERT INTO `t_sw_account_record` VALUES ('55da33a40d0140b5b5b5d0370e37d7e9', 104414, 1003, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', 1000.0000, '{\"en\":\"取消活币金\",\"zh\":\"取消活币金\"}', 99000.0000, NULL, NULL, '2019-09-18 11:49:52', '2019-09-18 11:49:52', '0');
INSERT INTO `t_sw_account_record` VALUES ('56cd7ad371eb4fbaadb353a7b2466c44', 104414, 1006, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', -30000.0000, '{\"en\":\"购买活币金\",\"zh\":\"购买活币金\"}', 69000.0000, NULL, NULL, '2019-07-23 16:53:47', '2019-07-23 16:53:47', '0');
INSERT INTO `t_sw_account_record` VALUES ('5746075204254258a2cacb616e410bba', 104420, 1008, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 300.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 600.0000, NULL, NULL, '2019-09-18 12:10:00', '2019-09-18 12:10:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('57d5e2a466b24145ad665fff4eebb407', 104414, 1072, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 600.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 73660.0000, NULL, NULL, '2019-09-18 17:38:00', '2019-09-18 17:38:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('5818caf7fafa4098974d260c24264763', 104414, 1002, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', -40000.0000, '{\"en\":\"购买定币金\",\"zh\":\"购买定币金\"}', 59000.0000, NULL, NULL, '2019-09-18 15:46:28', '2019-09-18 15:46:28', '0');
INSERT INTO `t_sw_account_record` VALUES ('59448d8fb25e4e5b9706df9ca6d363fb', 104428, 1003, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 1500.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 1500.0000, NULL, NULL, '2019-09-27 20:07:00', '2019-09-27 20:07:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('5a4dbfd16a924a6790468e4d5d60212b', 104425, 1011, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 60.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 99180.0000, NULL, NULL, '2019-09-19 12:06:00', '2019-09-19 12:06:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('5af948b25c9440b898c528634b7c8f5c', 104418, 1026, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 200.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 101600.0000, NULL, NULL, '2019-09-18 10:48:00', '2019-09-18 10:48:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('5b5d7eae7a474f3ebca909ead0740d09', 104414, 1027, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 60.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 70710.0000, NULL, NULL, '2019-09-18 12:28:00', '2019-09-18 12:28:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('5c0c23ba74f641ab9e218bbd66ced280', 104414, 1003, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 60.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 69360.0000, NULL, NULL, '2019-09-18 04:34:00', '2019-09-18 04:34:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('5c4cfbd6a2754df9bab931b3e37681a6', 104414, 1016, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 60.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 70050.0000, NULL, NULL, '2019-09-18 12:17:00', '2019-09-18 12:17:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('5c52627a12ba417c9831420598a2af2c', 104427, 1005, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 10.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 80.0000, NULL, NULL, '2019-09-28 14:50:00', '2019-09-28 14:50:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('5e6f08ce4a3e475fb20ff7ee152c000e', 104414, 1076, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 600.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 74980.0000, NULL, NULL, '2019-09-18 17:40:00', '2019-09-18 17:40:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('5e86326b697d45fcbb007974072b27b1', 104417, 1011, 1, 'cb7f09bdb0ef4174abd446d6c1e7745b', 400.0000, '{\"en\":\"固币金到期释放\",\"zh\":\"固币金到期释放\"}', 72200.0000, NULL, NULL, '2019-09-18 15:19:29', '2019-09-18 15:19:29', '0');
INSERT INTO `t_sw_account_record` VALUES ('5ec11bae9a324da99105662b57a90ea2', 104414, 1006, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', -30000.0000, '{\"en\":\"购买活币金\",\"zh\":\"购买活币金\"}', 69000.0000, NULL, NULL, '2019-07-01 16:24:16', '2019-07-01 16:24:16', '0');
INSERT INTO `t_sw_account_record` VALUES ('5fa1bc9169f941529e432ac247ce0862', 104414, 1037, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 60.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 101900.0000, NULL, NULL, '2019-09-18 17:10:00', '2019-09-18 17:10:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('5feafab025be4adf8eb619f1bef7fd89', 104426, 1002, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 450.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 69900.0000, NULL, NULL, '2019-09-18 18:40:00', '2019-09-18 18:40:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('605c553275264f3bbc832ce2b3da06e7', 104414, 1001, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', -1000.0000, '{\"en\":\"购买固币金\",\"zh\":\"购买固币金\"}', 99000.0000, NULL, NULL, '2019-07-01 16:22:53', '2019-07-01 16:22:53', '0');
INSERT INTO `t_sw_account_record` VALUES ('6084d326e45040f68f6e49759930ffe8', 104414, 1028, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', -1000.0000, '{\"en\":\"购买固币金\",\"zh\":\"购买固币金\"}', 71000.0000, NULL, NULL, '2019-09-18 17:05:34', '2019-09-18 17:05:34', '0');
INSERT INTO `t_sw_account_record` VALUES ('612bdb5dbf9541e7a9d38b370e04aa4b', 104417, 1005, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 10.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 916030.0000, NULL, NULL, '2019-09-17 18:07:00', '2019-09-17 18:07:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('6143a74da43b4cefac5e9a1b44b7c1dd', 104413, 1016, 9, '737d784555164db2862fd74361a97165', -100.0000, 'system.benchmarking', 999900.0000, NULL, NULL, '2019-09-17 17:24:49', '2019-09-17 17:24:49', '0');
INSERT INTO `t_sw_account_record` VALUES ('619efeb4f15747889da52b826344de40', 104414, 1044, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 60.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 72260.0000, NULL, NULL, '2019-09-18 17:16:00', '2019-09-18 17:16:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('6232c60b59a34c73984a3ff20d44d0e7', 104414, 1001, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 300.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 69300.0000, NULL, NULL, '2019-09-18 04:34:00', '2019-09-18 04:34:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('63de5139c2bf43318c50b1e35b97aace', 104414, 1002, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', -1000.0000, '{\"en\":\"购买活币金\",\"zh\":\"购买活币金\"}', 98000.0000, NULL, NULL, '2019-09-18 11:49:44', '2019-09-18 11:49:44', '0');
INSERT INTO `t_sw_account_record` VALUES ('6408fdb2553f449c8e5482cde2235472', 104414, 1025, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 120.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 72000.0000, NULL, NULL, '2019-09-18 17:04:00', '2019-09-18 17:04:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('644d40a66c4144cb8caa7bbea8f50d42', 104417, 1008, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 10.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 916040.0000, NULL, NULL, '2019-09-17 18:08:00', '2019-09-17 18:08:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('64f945809e9e4adeb93e25bf4df9a4fe', 104414, 1074, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 600.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 74320.0000, NULL, NULL, '2019-09-18 17:39:00', '2019-09-18 17:39:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('66736fbe57034faaa0423adf95a0de1c', 104414, 1033, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 30.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 100190.0000, NULL, NULL, '2019-09-18 11:08:00', '2019-09-18 11:08:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('6727320598a94474b9796c620183ae0b', 104414, 1055, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 60.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 73040.0000, NULL, NULL, '2019-09-18 17:24:00', '2019-09-18 17:24:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('67d94133cf104e39881678032befd492', 104414, 1004, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 300.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 69660.0000, NULL, NULL, '2019-09-18 16:57:00', '2019-09-18 16:57:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('68d57c9bbd3a4f8db0f445ee9b56f21e', 104427, 1001, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', -1000.0000, '{\"en\":\"购买活币金\",\"zh\":\"购买活币金\"}', 8000.0000, NULL, NULL, '2019-09-27 14:49:38', '2019-09-27 14:49:38', '0');
INSERT INTO `t_sw_account_record` VALUES ('69976c0b3b2748d58d82a9e9367bd3f2', 104417, 1002, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 10.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 100010.0000, NULL, NULL, '2019-09-18 10:41:00', '2019-09-18 10:41:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('69ca03f06d794b52895323f48be43908', 104414, 1041, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', -40000.0000, '{\"en\":\"购买定币金\",\"zh\":\"购买定币金\"}', 59000.0000, NULL, NULL, '2019-09-18 14:55:57', '2019-09-18 14:55:57', '0');
INSERT INTO `t_sw_account_record` VALUES ('69d6ee1e558c4dbfb07d56534d92c9c6', 104414, 1025, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 60.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 70590.0000, NULL, NULL, '2019-09-18 12:26:00', '2019-09-18 12:26:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('6a3628e53e7d430ab5fe95b996873263', 104414, 1004, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 800.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 60600.0000, NULL, NULL, '2019-09-18 15:49:00', '2019-09-18 15:49:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('6a7dfadf36b048b5a234a8bdecb033e2', 104420, 1004, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', 30000.0000, '{\"en\":\"取消活币金\",\"zh\":\"取消活币金\"}', 99300.0000, NULL, NULL, '2019-09-18 11:56:09', '2019-09-18 11:56:09', '0');
INSERT INTO `t_sw_account_record` VALUES ('6aa165a2a90345f59a8e6c0a034ebb46', 104414, 1046, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 60.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 72380.0000, NULL, NULL, '2019-09-18 17:18:00', '2019-09-18 17:18:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('6b54ce4594f24151b2bad49a3251f2a1', 104428, 1003, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', -5000.0000, '{\"en\":\"购买固币金\",\"zh\":\"购买固币金\"}', 45000.0000, NULL, NULL, '2019-09-26 20:01:14', '2019-09-26 20:01:14', '0');
INSERT INTO `t_sw_account_record` VALUES ('6b9990bf3c6a4fe7a27c9770daa4de30', 104414, 1019, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 20.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 100100.0000, NULL, NULL, '2019-09-18 10:45:00', '2019-09-18 10:45:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('6bccb3caebe6441d95fdaec54e5c44c4', 104414, 1053, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 60.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 102980.0000, NULL, NULL, '2019-09-18 17:23:00', '2019-09-18 17:23:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('6c1e7f928ad94eeab3a47e4853f29b8f', 104414, 1006, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 300.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 70260.0000, NULL, NULL, '2019-09-18 04:37:00', '2019-09-18 04:37:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('6c8d4c54c4164b23bafb4fb7c408a43c', 104425, 1007, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 60.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 99120.0000, NULL, NULL, '2019-09-19 12:05:00', '2019-09-19 12:05:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('6cef1f83f0404cb480ce15cc0e1fea53', 104414, 1022, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 60.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 70410.0000, NULL, NULL, '2019-09-18 12:23:00', '2019-09-18 12:23:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('6dee4cbce3fa47c5a57d69371f4b92b2', 104414, 1029, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 300.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 71300.0000, NULL, NULL, '2019-09-18 17:06:00', '2019-09-18 17:06:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('6e890dbbe17f48c79a1573358a7d8c74', 104420, 1005, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 600.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 71700.0000, NULL, NULL, '2019-09-18 12:09:00', '2019-09-18 12:09:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('6ea87849eda245d0b618eb1738afe36e', 104414, 1035, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 60.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 71190.0000, NULL, NULL, '2019-09-18 12:36:00', '2019-09-18 12:36:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('6f36f7598e304b8ca44a8fc089535c76', 104420, 1027, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 600.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 73400.0000, NULL, NULL, '2019-09-18 17:05:00', '2019-09-18 17:05:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('6f87718766fd4e25bf1089df079f3ba8', 104422, 1038, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', -1000.0000, '{\"en\":\"购买固币金\",\"zh\":\"购买固币金\"}', 30000.0000, NULL, NULL, '2019-09-18 14:45:03', '2019-09-18 14:45:03', '0');
INSERT INTO `t_sw_account_record` VALUES ('701589f42c0e43f384c1ccaaa4ed87f1', 104417, 1026, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 2000.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 902000.0000, NULL, NULL, '2019-09-17 17:29:00', '2019-09-17 17:29:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('70f312cbe9b24c30b3a4138f16c39a85', 104414, 1003, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 30.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 69330.0000, NULL, NULL, '2019-09-18 11:55:00', '2019-09-18 11:55:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('7135a2c352e84e358168145d6d89f250', 104428, 1004, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', 150000.0000, '{\"en\":\"取消活币金\",\"zh\":\"取消活币金\"}', 151500.0000, NULL, NULL, '2019-09-28 01:00:10', '2019-09-28 01:00:10', '0');
INSERT INTO `t_sw_account_record` VALUES ('71942def748348e1b5bf13906fde83ed', 104420, 1005, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 600.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 70200.0000, NULL, NULL, '2019-09-18 16:57:00', '2019-09-18 16:57:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('720824df910b45ad98ffd70c9aaab598', 104417, 1009, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 600.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 71400.0000, NULL, NULL, '2019-09-18 15:17:00', '2019-09-18 15:17:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('73cb9657202e42fdaa5a429659894c38', 104419, 1012, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', -1000.0000, '{\"en\":\"购买固币金\",\"zh\":\"购买固币金\"}', 59000.0000, NULL, NULL, '2019-09-17 19:10:38', '2019-09-17 19:10:38', '0');
INSERT INTO `t_sw_account_record` VALUES ('73ffdd85e42840d3a78a7067de076576', 104428, 1008, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', -150000.0000, '{\"en\":\"购买活币金\",\"zh\":\"购买活币金\"}', 0.0000, NULL, NULL, '2019-09-26 20:06:42', '2019-09-26 20:06:42', '0');
INSERT INTO `t_sw_account_record` VALUES ('7419a5abac934e9b83f73770b2255443', 104414, 1028, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 60.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 70770.0000, NULL, NULL, '2019-09-18 12:29:00', '2019-09-18 12:29:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('75982636b7234451b6412fae077f97ce', 104420, 1037, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', -30000.0000, '{\"en\":\"购买定币金\",\"zh\":\"购买定币金\"}', 69290.0000, NULL, NULL, '2019-09-18 11:38:08', '2019-09-18 11:38:08', '0');
INSERT INTO `t_sw_account_record` VALUES ('761fed95197e4844837b8e565394ed34', 104418, 1012, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', -5000.0000, '{\"en\":\"购买活币金\",\"zh\":\"购买活币金\"}', 994000.0000, NULL, NULL, '2019-09-17 17:12:44', '2019-09-17 17:12:44', '0');
INSERT INTO `t_sw_account_record` VALUES ('77c17f54780e4f3bb5f5f3699e0847db', 104414, 1009, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 100.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 979500.0000, NULL, NULL, '2019-09-17 17:40:00', '2019-09-17 17:40:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('79d02f9b266f4432aae027eec943025a', 104418, 1023, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 200.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 101400.0000, NULL, NULL, '2019-09-18 10:47:00', '2019-09-18 10:47:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('79df8be286e4464caec139cbd3b87dbe', 104426, 1017, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 600.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 72000.0000, NULL, NULL, '2019-09-19 12:08:00', '2019-09-19 12:08:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('7ad27495860d49028ed6ff6e61d3a2a9', 104417, 1003, 9, 'cb7f09bdb0ef4174abd446d6c1e7745b', 100000.0000, 'system.benchmarking', 100000.0000, NULL, NULL, '2019-09-19 19:04:12', '2019-09-19 19:04:12', '0');
INSERT INTO `t_sw_account_record` VALUES ('7b500e6580724e589a90784a2f74133b', 104413, 1003, 9, '737d784555164db2862fd74361a97165', -100.0000, 'system.benchmarking', 999300.0000, NULL, NULL, '2019-09-17 17:51:36', '2019-09-17 17:51:36', '0');
INSERT INTO `t_sw_account_record` VALUES ('7c6d2287559c4bc6af2bbc9ad120a47f', 104414, 1001, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 300.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 69300.0000, NULL, NULL, '2019-09-18 11:55:00', '2019-09-18 11:55:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('7c7850abdda6435b9bcdd53a2e4ff608', 104417, 1002, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 10.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 916020.0000, NULL, NULL, '2019-09-17 18:06:00', '2019-09-17 18:06:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('7d60c4f97a6b42a18ff76fe235f3d3d7', 104414, 1008, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 300.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 70860.0000, NULL, NULL, '2019-09-18 04:40:16', '2019-09-18 04:40:16', '0');
INSERT INTO `t_sw_account_record` VALUES ('7dbbe9f71420449aa400dbd0ccb81ad7', 104414, 1010, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 300.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 70380.0000, NULL, NULL, '2019-09-18 16:59:00', '2019-09-18 16:59:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('7e633412c7624550bda766a273b3d605', 104420, 1040, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 600.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 70490.0000, NULL, NULL, '2019-09-18 11:42:00', '2019-09-18 11:42:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('7fa4189fb7c949159028fc348ddbdc94', 104414, 1035, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 60.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 101780.0000, NULL, NULL, '2019-09-18 17:08:00', '2019-09-18 17:08:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('81887ddd149b46a09305485231244d0a', 104414, 1001, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', -1000.0000, '{\"en\":\"购买固币金\",\"zh\":\"购买固币金\"}', 99000.0000, NULL, NULL, '2019-09-18 11:49:21', '2019-09-18 11:49:21', '0');
INSERT INTO `t_sw_account_record` VALUES ('83045eabc9c844468c5e597d93c513d7', 104417, 1010, 1, 'cb7f09bdb0ef4174abd446d6c1e7745b', 400.0000, '{\"en\":\"固币金到期释放\",\"zh\":\"固币金到期释放\"}', 71800.0000, NULL, NULL, '2019-09-18 15:18:00', '2019-09-18 15:18:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('8316949025bd433db9268dba7d8b3db6', 104414, 1022, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 300.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 71820.0000, NULL, NULL, '2019-09-18 17:03:00', '2019-09-18 17:03:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('834a686953054214bba064732928d7c3', 104414, 1059, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 60.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 103460.0000, NULL, NULL, '2019-09-18 17:26:00', '2019-09-18 17:26:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('83f09d4786e54ad6997a518828c52c4a', 104414, 1021, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 60.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 71520.0000, NULL, NULL, '2019-09-18 17:02:00', '2019-09-18 17:02:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('859e489dcc5a47c4b687fa708eb4d944', 104419, 1013, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', -10000.0000, '{\"en\":\"购买活币金\",\"zh\":\"购买活币金\"}', 49000.0000, NULL, NULL, '2019-09-17 19:11:05', '2019-09-17 19:11:05', '0');
INSERT INTO `t_sw_account_record` VALUES ('863e089f53474bc28639e9853e2976b6', 104417, 1010, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', -100000.0000, '{\"en\":\"购买定币金\",\"zh\":\"购买定币金\"}', 898000.0000, NULL, NULL, '2019-09-17 17:10:23', '2019-09-17 17:10:23', '0');
INSERT INTO `t_sw_account_record` VALUES ('885391497f8f418ea7d9d6706c4e1ec4', 104417, 1001, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', -1000.0000, '{\"en\":\"购买固币金\",\"zh\":\"购买固币金\"}', 99000.0000, NULL, NULL, '2019-09-19 17:18:45', '2019-09-19 17:18:45', '0');
INSERT INTO `t_sw_account_record` VALUES ('88d2c469869247ef84bd99c065b3b6d0', 104427, 1001, 10, 'cb7f09bdb0ef4174abd446d6c1e7745b', 2.0000, '{\"en\":\"充值\",\"zh\":\"充值\"}', 2.0000, NULL, NULL, '2019-09-26 17:58:46', '2019-09-26 17:58:46', '0');
INSERT INTO `t_sw_account_record` VALUES ('898e05a9e21249d1925a0f8a25741e4d', 104414, 1004, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', -30000.0000, '{\"en\":\"购买活币金\",\"zh\":\"购买活币金\"}', 69000.0000, NULL, NULL, '2019-09-18 11:50:15', '2019-09-18 11:50:15', '0');
INSERT INTO `t_sw_account_record` VALUES ('8a36fb30ab2042d99db9fd9fef336977', 104426, 1001, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', -1000.0000, '{\"en\":\"购买固币金\",\"zh\":\"购买固币金\"}', 99000.0000, NULL, NULL, '2019-09-19 16:07:05', '2019-09-19 16:07:05', '0');
INSERT INTO `t_sw_account_record` VALUES ('8a40a8dcf49e43d0867a8eebb05f09c2', 104420, 1020, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 600.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 71600.0000, NULL, NULL, '2019-09-18 17:02:00', '2019-09-18 17:02:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('8a78ffe00c124e1581ef1558ffd02ac2', 104420, 1018, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', -1000.0000, '{\"en\":\"购买固币金\",\"zh\":\"购买固币金\"}', 71000.0000, NULL, NULL, '2019-09-18 17:01:10', '2019-09-18 17:01:10', '0');
INSERT INTO `t_sw_account_record` VALUES ('8a90dfdfcaed404e8e8c2e7b085befbf', 104417, 1002, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 2000.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 4000.0000, NULL, NULL, '2019-09-17 17:32:00', '2019-09-17 17:32:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('8ac55135564d421089a2886f95fff5b5', 104414, 1002, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', -1000.0000, '{\"en\":\"购买固币金\",\"zh\":\"购买固币金\"}', 99000.0000, NULL, NULL, '2019-09-19 15:58:30', '2019-09-19 15:58:30', '0');
INSERT INTO `t_sw_account_record` VALUES ('8ac8c30388a748de939b9991197b71a3', 104417, 1001, 1, 'cb7f09bdb0ef4174abd446d6c1e7745b', 2000.0000, '{\"en\":\"固币金到期释放\",\"zh\":\"固币金到期释放\"}', 900000.0000, NULL, NULL, '2019-09-17 17:32:00', '2019-09-17 17:32:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('8b8e65f671fe4ed7ade24100a367cc0e', 104414, 1041, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 60.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 102140.0000, NULL, NULL, '2019-09-18 17:14:00', '2019-09-18 17:14:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('8bab38ef7be24589901beb995645723f', 104414, 1062, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 60.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 103640.0000, NULL, NULL, '2019-09-18 17:29:00', '2019-09-18 17:29:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('8c241b9d521548efa9abc33afb230057', 104417, 1021, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 10.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 100060.0000, NULL, NULL, '2019-09-18 10:46:00', '2019-09-18 10:46:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('8c809968d4174b6db4391d6ff6872e17', 104414, 1026, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 60.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 70650.0000, NULL, NULL, '2019-09-18 12:27:00', '2019-09-18 12:27:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('8d0a74492f0e4c468ee654f2be0e6033', 104414, 1022, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 20.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 100120.0000, NULL, NULL, '2019-09-18 10:46:00', '2019-09-18 10:46:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('8d90fc7622ef4ce6b3eb159d2828baf4', 104428, 1006, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', -50000.0000, '{\"en\":\"购买活币金\",\"zh\":\"购买活币金\"}', 0.0000, NULL, NULL, '2019-09-26 20:04:46', '2019-09-26 20:04:46', '0');
INSERT INTO `t_sw_account_record` VALUES ('8db5f14993ea4a6ebcccffc76cfa2bd9', 104414, 1001, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', -1000.0000, '{\"en\":\"购买固币金\",\"zh\":\"购买固币金\"}', 99000.0000, NULL, NULL, '2019-09-18 15:29:28', '2019-09-18 15:29:28', '0');
INSERT INTO `t_sw_account_record` VALUES ('8db7efacb0124122a0b02a8dd2b96de8', 104414, 1039, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 60.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 100250.0000, NULL, NULL, '2019-09-18 11:40:00', '2019-09-18 11:40:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('8e4e8dd7185340ac93d1a8daa4bf5637', 104413, 1018, 9, '737d784555164db2862fd74361a97165', -100.0000, 'system.benchmarking', 999800.0000, NULL, NULL, '2019-09-17 17:24:55', '2019-09-17 17:24:55', '0');
INSERT INTO `t_sw_account_record` VALUES ('8f227a84143f45258df37b875132acb9', 104414, 1006, 11, 'cb7f09bdb0ef4174abd446d6c1e7745b', -103.0000, '{\"en\":\"提现\",\"zh\":\"提现\"}', 99794.0000, NULL, NULL, '2019-09-20 10:08:31', '2019-09-20 10:08:31', '0');
INSERT INTO `t_sw_account_record` VALUES ('90594d6699664cb8baf23a6e89f91d87', 104417, 1015, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 2000.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 900000.0000, NULL, NULL, '2019-09-17 17:14:05', '2019-09-17 17:14:05', '0');
INSERT INTO `t_sw_account_record` VALUES ('90ee0c9fdc5e45efad5fa84e8b7910ea', 104418, 1001, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 200.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 100200.0000, NULL, NULL, '2019-09-18 10:41:00', '2019-09-18 10:41:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('91f607447a0b477fab22ed4939c5f09a', 104414, 1050, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 60.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 102800.0000, NULL, NULL, '2019-09-18 17:20:00', '2019-09-18 17:20:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('92853493413040b6a2c42b5280b8edd9', 104426, 1013, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 600.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 71400.0000, NULL, NULL, '2019-09-19 12:07:00', '2019-09-19 12:07:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('93441bb31034409990fe59c4a1cc561e', 104420, 1035, 5, 'cb7f09bdb0ef4174abd446d6c1e7745b', -10.0001, '{\"en\":\"转账-sz104419\",\"zh\":\"转账-sz104419\"}', 99289.9999, NULL, NULL, '2019-09-18 11:15:53', '2019-09-18 11:15:53', '0');
INSERT INTO `t_sw_account_record` VALUES ('9480c6d0440f454d8fbb330a9d56190a', 104414, 1002, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', -1000.0000, '{\"en\":\"购买固币金\",\"zh\":\"购买固币金\"}', 99000.0000, NULL, NULL, '2019-07-23 16:53:24', '2019-07-23 16:53:24', '0');
INSERT INTO `t_sw_account_record` VALUES ('959487f113c9434585b9684b6d0fc882', 104419, 1014, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', 10000.0000, '{\"en\":\"取消活币金\",\"zh\":\"取消活币金\"}', 59000.0000, NULL, NULL, '2019-09-17 19:11:15', '2019-09-17 19:11:15', '0');
INSERT INTO `t_sw_account_record` VALUES ('95a3d8987d5240ddbcafd590a6ca3e01', 104414, 1003, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 20.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 100020.0000, NULL, NULL, '2019-09-18 10:41:00', '2019-09-18 10:41:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('961a803b7a3941dea3c59aaeaccacf8f', 104417, 1011, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 2000.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 4000.0000, NULL, NULL, '2019-09-17 17:41:23', '2019-09-17 17:41:23', '0');
INSERT INTO `t_sw_account_record` VALUES ('96703056e7c241cc95d5e4ba01104fc8', 104427, 1001, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', -1000.0000, '{\"en\":\"购买固币金\",\"zh\":\"购买固币金\"}', 9000.0000, NULL, NULL, '2019-09-27 14:21:26', '2019-09-27 14:21:26', '0');
INSERT INTO `t_sw_account_record` VALUES ('9762c202823141d6bf51eed27e43c252', 104428, 1009, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', -150000.0000, '{\"en\":\"购买活币金\",\"zh\":\"购买活币金\"}', 1500.0000, NULL, NULL, '2019-09-29 15:23:00', '2019-09-29 15:23:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('989031bea1834889b0d61a733e6d7729', 104413, 1020, 9, '737d784555164db2862fd74361a97165', -100.0000, 'system.benchmarking', 999700.0000, NULL, NULL, '2019-09-17 17:25:02', '2019-09-17 17:25:02', '0');
INSERT INTO `t_sw_account_record` VALUES ('98cc9af111ca4f35bf5b220b24b0a681', 104414, 1045, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 60.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 72320.0000, NULL, NULL, '2019-09-18 17:17:00', '2019-09-18 17:17:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('9b3469904e614cc4b634a1da1c2fd44c', 104420, 1002, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 600.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 69600.0000, NULL, NULL, '2019-09-18 04:34:00', '2019-09-18 04:34:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('9b421a984be941d3ba7bd92ead7dde86', 104417, 1005, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', -30000.0000, '{\"en\":\"购买定币金\",\"zh\":\"购买定币金\"}', 69000.0000, NULL, NULL, '2019-09-18 15:12:34', '2019-09-18 15:12:34', '0');
INSERT INTO `t_sw_account_record` VALUES ('9b795d55b6794ff7a41ae887c27d3ea9', 104424, 1008, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 30.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 99060.0000, NULL, NULL, '2019-09-19 12:05:00', '2019-09-19 12:05:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('9bb7fc9b610a4bda94e23c1348cdf1e5', 104414, 1024, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 60.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 71880.0000, NULL, NULL, '2019-09-18 17:03:00', '2019-09-18 17:03:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('9cb96c341bd242548e18ab66b236710a', 104414, 1004, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 800.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 60600.0000, NULL, NULL, '2019-09-18 15:42:31', '2019-09-18 15:42:31', '0');
INSERT INTO `t_sw_account_record` VALUES ('9e759c7ea3884947a04751eda86fd958', 104414, 1067, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 60.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 103940.0000, NULL, NULL, '2019-09-18 17:34:00', '2019-09-18 17:34:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('9e7a5ef5e5a740cfbb2f2bdfd4a84b01', 104420, 1032, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 300.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 69300.0000, NULL, NULL, '2019-09-18 11:08:00', '2019-09-18 11:08:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('9e8500774f3d4b5ba48ac9ed6471a52d', 104417, 1008, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 10.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 100030.0000, NULL, NULL, '2019-09-18 10:43:00', '2019-09-18 10:43:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('9f432d6855e94b27b4be323e6a4445ca', 104413, 1009, 9, '737d784555164db2862fd74361a97165', -100.0000, 'system.benchmarking', 999000.0000, NULL, NULL, '2019-09-17 17:52:21', '2019-09-17 17:52:21', '0');
INSERT INTO `t_sw_account_record` VALUES ('9f7558b870c24c8bbb35c9d277e59b3d', 104414, 1079, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 60.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 75700.0000, NULL, NULL, '2019-09-18 17:41:00', '2019-09-18 17:41:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('a0c7374b64674f4499d566474e50e68b', 104414, 1069, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', -1000.0000, '{\"en\":\"购买固币金\",\"zh\":\"购买固币金\"}', 103000.0000, NULL, NULL, '2019-09-18 17:36:20', '2019-09-18 17:36:20', '0');
INSERT INTO `t_sw_account_record` VALUES ('a1774e5a38104032b3937a63737c8e91', 104427, 1009, 11, 'cb7f09bdb0ef4174abd446d6c1e7745b', -7.0000, '{\"en\":\"提现\",\"zh\":\"提现\"}', -7.0000, NULL, NULL, '2019-09-26 20:16:24', '2019-09-26 20:16:24', '0');
INSERT INTO `t_sw_account_record` VALUES ('a1d60dc479e54eafa8c6de62e0438867', 104417, 1013, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 10.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 100040.0000, NULL, NULL, '2019-09-18 10:44:07', '2019-09-18 10:44:07', '0');
INSERT INTO `t_sw_account_record` VALUES ('a3ba5650f8fa4a4292e97799078aac8a', 104417, 1002, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 1500.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 53000.0000, NULL, NULL, '2019-09-23 11:16:00', '2019-09-23 11:16:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('a51582ab0e144a31a371d84702daa7ce', 104420, 1008, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 600.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 70800.0000, NULL, NULL, '2019-09-18 16:58:00', '2019-09-18 16:58:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('a5ba70c69d3e4b1e9d7523048a1519fd', 104414, 1051, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 60.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 102860.0000, NULL, NULL, '2019-09-18 17:21:00', '2019-09-18 17:21:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('a71aef1966594251b8cd1ada4460193b', 104414, 1071, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 60.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 73060.0000, NULL, NULL, '2019-09-18 17:37:00', '2019-09-18 17:37:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('a75eb397d609444b963cf028c8a94f0a', 104420, 1003, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', -30000.0000, '{\"en\":\"购买活币金\",\"zh\":\"购买活币金\"}', 69000.0000, NULL, NULL, '2019-07-01 16:23:29', '2019-07-01 16:23:29', '0');
INSERT INTO `t_sw_account_record` VALUES ('a8b5e334ded44425952c204213eb514f', 104420, 1001, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 600.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 70500.0000, NULL, NULL, '2019-09-18 12:07:00', '2019-09-18 12:07:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('a8dc8744c0a343c3bcac4bc81a57c5cf', 104414, 1064, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 60.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 103760.0000, NULL, NULL, '2019-09-18 17:31:00', '2019-09-18 17:31:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('a91793367aeb40f2ac354e1691b70e87', 104414, 1005, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', 20000.0000, '{\"en\":\"取消活币金\",\"zh\":\"取消活币金\"}', 999000.0000, NULL, NULL, '2019-09-17 17:07:24', '2019-09-17 17:07:24', '0');
INSERT INTO `t_sw_account_record` VALUES ('a91874fe805349b29be14e00c1f20c2b', 104417, 1004, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 2000.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 908000.0000, NULL, NULL, '2019-09-17 17:36:00', '2019-09-17 17:36:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('a9356574dd854d94b8e630c176164859', 104414, 1001, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 300.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 71760.0000, NULL, NULL, '2019-09-18 16:44:00', '2019-09-18 16:44:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('a98a14c187054eb9a5c06d51cff301b4', 104417, 1024, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 10.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 100070.0000, NULL, NULL, '2019-09-18 10:47:00', '2019-09-18 10:47:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('a9f33362131a43158237c3b8f673539a', 104414, 1056, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 300.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 73340.0000, NULL, NULL, '2019-09-18 17:25:00', '2019-09-18 17:25:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('aa20ca4a383142eabda323be003e239d', 104420, 1023, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 600.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 72200.0000, NULL, NULL, '2019-09-18 17:03:00', '2019-09-18 17:03:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('aa84668c6e4d47bbb452a2b949612bcf', 104414, 1065, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 60.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 103820.0000, NULL, NULL, '2019-09-18 17:32:00', '2019-09-18 17:32:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('aaae2f7fe63a4260a31f7425ddf299c4', 104414, 1052, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 60.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 102920.0000, NULL, NULL, '2019-09-18 17:22:00', '2019-09-18 17:22:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('ac385b7f8dc443718a5643ab3bc0be8c', 104414, 1060, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 60.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 103520.0000, NULL, NULL, '2019-09-18 17:27:00', '2019-09-18 17:27:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('ac7083396d134cceb10167e4d3e4cc85', 104414, 1009, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 20.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 979680.0000, NULL, NULL, '2019-09-17 18:08:00', '2019-09-17 18:08:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('ace5e531e75e415aa39bd45ac4ca6bd6', 104420, 1003, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 600.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 71100.0000, NULL, NULL, '2019-09-18 12:08:00', '2019-09-18 12:08:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('ae968133ea5146a698f6049ec36838ce', 104420, 1014, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 600.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 72000.0000, NULL, NULL, '2019-09-18 17:00:00', '2019-09-18 17:00:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('aeaa281ed3bf4e2397739a8e5b1ea307', 104414, 1068, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 60.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 104000.0000, NULL, NULL, '2019-09-18 17:35:00', '2019-09-18 17:35:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('af7e945826154ede9198fb422b044e31', 104419, 1015, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', -30000.0000, '{\"en\":\"购买活币金\",\"zh\":\"购买活币金\"}', 29000.0000, NULL, NULL, '2019-09-17 19:11:39', '2019-09-17 19:11:39', '0');
INSERT INTO `t_sw_account_record` VALUES ('afc9188cc152451bad428977e4d892de', 104414, 1030, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 60.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 70890.0000, NULL, NULL, '2019-09-18 12:31:00', '2019-09-18 12:31:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('affdd891585d4598a08995097dd8c1ea', 104417, 1005, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 10.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 100020.0000, NULL, NULL, '2019-09-18 10:42:00', '2019-09-18 10:42:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('b02af07faa0a4c2aa145893ea86d0bdf', 104418, 1012, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 200.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 100800.0000, NULL, NULL, '2019-09-18 10:44:01', '2019-09-18 10:44:01', '0');
INSERT INTO `t_sw_account_record` VALUES ('b2c190357d96479f8126c89738c6b04d', 104417, 1012, 1, 'cb7f09bdb0ef4174abd446d6c1e7745b', 400.0000, '{\"en\":\"固币金到期释放\",\"zh\":\"固币金到期释放\"}', 72600.0000, NULL, NULL, '2019-09-18 15:20:11', '2019-09-18 15:20:11', '0');
INSERT INTO `t_sw_account_record` VALUES ('b53a80282f9047aa9bbd4dc770765a51', 104417, 1008, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 600.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 70800.0000, NULL, NULL, '2019-09-18 15:16:00', '2019-09-18 15:16:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('b57551638b6e42c6a676ead0b7c6ceb4', 104414, 1003, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 800.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 59800.0000, NULL, NULL, '2019-09-18 15:48:00', '2019-09-18 15:48:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('b9c7f0326925458293dae80169e958f3', 104414, 1075, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 60.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 74380.0000, NULL, NULL, '2019-09-18 17:39:00', '2019-09-18 17:39:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('ba4c606a72da40679820d6e080bf7252', 104420, 1005, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', -1000.0000, '{\"en\":\"购买固币金\",\"zh\":\"购买固币金\"}', 99000.0000, NULL, NULL, '2019-09-18 11:50:34', '2019-09-18 11:50:34', '0');
INSERT INTO `t_sw_account_record` VALUES ('bab48bbe60544e8693e3544674831227', 104420, 1034, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', 30000.0000, '{\"en\":\"取消活币金\",\"zh\":\"取消活币金\"}', 99300.0000, NULL, NULL, '2019-09-18 11:11:02', '2019-09-18 11:11:02', '0');
INSERT INTO `t_sw_account_record` VALUES ('bb45cf2932154286ad0c34abad1ae77f', 104414, 1004, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', -1000.0000, '{\"en\":\"购买固币金\",\"zh\":\"购买固币金\"}', 99000.0000, NULL, NULL, '2019-09-19 11:56:48', '2019-09-19 11:56:48', '0');
INSERT INTO `t_sw_account_record` VALUES ('bb97d25ea7374ae594c87ca9b46fb9ba', 104414, 1040, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 60.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 102080.0000, NULL, NULL, '2019-09-18 17:13:00', '2019-09-18 17:13:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('bc893cb9caa04d07bffb15acbb924262', 104414, 1002, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', -40000.0000, '{\"en\":\"购买定币金\",\"zh\":\"购买定币金\"}', 59000.0000, NULL, NULL, '2019-09-18 15:39:54', '2019-09-18 15:39:54', '0');
INSERT INTO `t_sw_account_record` VALUES ('bca0b54baf2e4086a2bc09f5cea7157e', 104414, 1028, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 20.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 100160.0000, NULL, NULL, '2019-09-18 10:48:00', '2019-09-18 10:48:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('bdf9c60228de4974b91254c405062371', 104429, 1001, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', -1000.0000, '{\"en\":\"购买固币金\",\"zh\":\"购买固币金\"}', 9999000.0000, NULL, NULL, '2019-09-27 17:22:40', '2019-09-27 17:22:40', '0');
INSERT INTO `t_sw_account_record` VALUES ('bec97b256ac645be99e5797cbf148767', 104414, 1004, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', -1000.0000, '{\"en\":\"购买活币金\",\"zh\":\"购买活币金\"}', 98000.0000, NULL, NULL, '2019-07-23 16:53:35', '2019-07-23 16:53:35', '0');
INSERT INTO `t_sw_account_record` VALUES ('bf2015bceff843e3a87aa8031c02a74e', 104414, 1001, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 1500.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 54000.0000, NULL, NULL, '2019-09-25 11:44:00', '2019-09-25 11:44:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('c04da0c87a044db9bb19146abbec63a1', 104414, 1033, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 60.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 71720.0000, NULL, NULL, '2019-09-18 17:07:00', '2019-09-18 17:07:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('c143a5e314d448b7affbb940fea03344', 104414, 1025, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 20.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 100140.0000, NULL, NULL, '2019-09-18 10:47:00', '2019-09-18 10:47:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('c1823ecffa184eb7bf995b7527a5b918', 104414, 1054, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', -30000.0000, '{\"en\":\"购买活币金\",\"zh\":\"购买活币金\"}', 72980.0000, NULL, NULL, '2019-09-18 17:23:18', '2019-09-18 17:23:18', '0');
INSERT INTO `t_sw_account_record` VALUES ('c1b89def5cbe4a1ba020de917c72301f', 104414, 1002, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 240.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 72000.0000, NULL, NULL, '2019-09-18 16:45:00', '2019-09-18 16:45:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('c25aa2ba7e394b05b7fd7d77c12809a7', 104419, 1001, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', -30000.0000, '{\"en\":\"购买活币金\",\"zh\":\"购买活币金\"}', 30900.0000, NULL, NULL, '2019-09-18 10:25:50', '2019-09-18 10:25:50', '0');
INSERT INTO `t_sw_account_record` VALUES ('c5d3edd0d62a44368c121fe627a7e5c4', 104414, 1042, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 60.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 102200.0000, NULL, NULL, '2019-09-18 17:15:00', '2019-09-18 17:15:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('c63c4f14ef274e9ca9a80af0666ffce0', 104414, 1001, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', -1000.0000, '{\"en\":\"购买固币金\",\"zh\":\"购买固币金\"}', 99000.0000, NULL, NULL, '2019-09-18 15:38:55', '2019-09-18 15:38:55', '0');
INSERT INTO `t_sw_account_record` VALUES ('c63ebd991b5f404bad72286e61f409e9', 104419, 1010, 9, '737d784555164db2862fd74361a97165', -100.0000, 'system.benchmarking', 99900.0000, NULL, NULL, '2019-09-17 19:10:00', '2019-09-17 19:10:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('c6feba3bbb9d44c7b5874687e8c44bd7', 104414, 1049, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', 30000.0000, '{\"en\":\"取消活币金\",\"zh\":\"取消活币金\"}', 102740.0000, NULL, NULL, '2019-09-18 17:19:10', '2019-09-18 17:19:10', '0');
INSERT INTO `t_sw_account_record` VALUES ('c93afa6cd59d47fa97bb848f1980f071', 104414, 1006, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 600.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 62000.0000, NULL, NULL, '2019-09-18 15:51:00', '2019-09-18 15:51:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('c96e05ba3b0542208fd7daffb84c8008', 104413, 1004, 9, 'cb7f09bdb0ef4174abd446d6c1e7745b', 50000.0000, 'system.benchmarking', 1350000.0000, NULL, NULL, '2019-09-17 17:51:36', '2019-09-17 17:51:36', '0');
INSERT INTO `t_sw_account_record` VALUES ('c9adf1a0abfb48a08c9aac7ed9401b91', 104414, 1014, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 20.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 100080.0000, NULL, NULL, '2019-09-18 10:44:07', '2019-09-18 10:44:07', '0');
INSERT INTO `t_sw_account_record` VALUES ('c9ca1719b0e8498fb34a173b531a6432', 104414, 1012, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 60.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 70440.0000, NULL, NULL, '2019-09-18 16:59:00', '2019-09-18 16:59:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('ca1fb64f75b0415d842c70898c5ca92a', 104413, 1017, 9, 'cb7f09bdb0ef4174abd446d6c1e7745b', 50000.0000, 'system.benchmarking', 1050000.0000, NULL, NULL, '2019-09-17 17:24:49', '2019-09-17 17:24:49', '0');
INSERT INTO `t_sw_account_record` VALUES ('cb1a7fbc3fb548be83f71e5d8d0e5f7c', 104413, 1022, 9, '737d784555164db2862fd74361a97165', -100.0000, 'system.benchmarking', 999600.0000, NULL, NULL, '2019-09-17 17:25:08', '2019-09-17 17:25:08', '0');
INSERT INTO `t_sw_account_record` VALUES ('cc0291a4ca864a0cbeab4ff7902a846e', 104417, 1001, 11, 'cb7f09bdb0ef4174abd446d6c1e7745b', -99000.0000, '{\"en\":\"提现\",\"zh\":\"提现\"}', -99000.0000, NULL, NULL, '2019-09-19 17:49:59', '2019-09-19 17:49:59', '0');
INSERT INTO `t_sw_account_record` VALUES ('cd029e1b703241feb7e95c2eed686eda', 104414, 1013, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 300.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 70740.0000, NULL, NULL, '2019-09-18 17:00:00', '2019-09-18 17:00:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('cd2f0559feee4fcc8a7b0b4cb445f981', 104414, 1039, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 60.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 102020.0000, NULL, NULL, '2019-09-18 17:12:00', '2019-09-18 17:12:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('cdb187a3374d4b52a51d551e0764f612', 104417, 1027, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 10.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 100080.0000, NULL, NULL, '2019-09-18 10:48:00', '2019-09-18 10:48:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('cdda364acdf3498a957abb760e073cb8', 104423, 1002, 9, 'cb7f09bdb0ef4174abd446d6c1e7745b', 50000.0000, 'system.benchmarking', 50000.0000, NULL, NULL, '2019-09-18 16:12:49', '2019-09-18 16:12:49', '0');
INSERT INTO `t_sw_account_record` VALUES ('ce3d5abb29d747d68287941ff83a37ad', 104420, 1005, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', -30000.0000, '{\"en\":\"购买定币金\",\"zh\":\"购买定币金\"}', 69300.0000, NULL, NULL, '2019-09-18 11:56:40', '2019-09-18 11:56:40', '0');
INSERT INTO `t_sw_account_record` VALUES ('d0a6b84a60d5460ca70c737902342a98', 104418, 1001, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 200.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 994250.0000, NULL, NULL, '2019-09-17 18:02:00', '2019-09-17 18:02:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('d0e4a137bcc84a8d822d9cc96936cbc9', 104414, 1080, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 300.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 76000.0000, NULL, NULL, '2019-09-18 17:42:00', '2019-09-18 17:42:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('d13ac419139e46819f44cd6a0255761c', 104429, 1006, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 300.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 9969300.0000, NULL, NULL, '2019-09-28 17:24:00', '2019-09-28 17:24:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('d20ab2934182450283f0770560d8fefe', 104426, 1001, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 450.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 69450.0000, NULL, NULL, '2019-09-18 18:39:00', '2019-09-18 18:39:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('d672237a4ff84e84bca60bee9e8e131a', 104414, 1003, 1, 'cb7f09bdb0ef4174abd446d6c1e7745b', 3000.0000, '{\"en\":\"固币金到期释放\",\"zh\":\"固币金到期释放\"}', 102000.0000, NULL, NULL, '2019-09-19 16:02:06', '2019-09-19 16:02:06', '0');
INSERT INTO `t_sw_account_record` VALUES ('d791ad47dd214f84acd3d0ab534bb589', 104414, 1001, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 1200.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 60200.0000, NULL, NULL, '2019-09-18 14:58:21', '2019-09-18 14:58:21', '0');
INSERT INTO `t_sw_account_record` VALUES ('d8af2f77f3f9491489d9fbe14e41916e', 104414, 1036, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 60.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 71250.0000, NULL, NULL, '2019-09-18 12:37:00', '2019-09-18 12:37:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('d8ea521f15804b91a7acf62da52ebfb2', 104414, 1061, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 60.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 103580.0000, NULL, NULL, '2019-09-18 17:28:00', '2019-09-18 17:28:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('d98dafacef4d4732997b06281aed3691', 104413, 1023, 9, 'cb7f09bdb0ef4174abd446d6c1e7745b', 50000.0000, 'system.benchmarking', 1200000.0000, NULL, NULL, '2019-09-17 17:25:08', '2019-09-17 17:25:08', '0');
INSERT INTO `t_sw_account_record` VALUES ('d9afcd4d3cb446c49dc9919a00530a3b', 104420, 1031, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', -30000.0000, '{\"en\":\"购买活币金\",\"zh\":\"购买活币金\"}', 69000.0000, NULL, NULL, '2019-09-18 11:03:59', '2019-09-18 11:03:59', '0');
INSERT INTO `t_sw_account_record` VALUES ('da425351fd9f4750b27d7490bd5fd2b3', 104413, 1007, 9, '737d784555164db2862fd74361a97165', -100.0000, 'system.benchmarking', 999100.0000, NULL, NULL, '2019-09-17 17:52:06', '2019-09-17 17:52:06', '0');
INSERT INTO `t_sw_account_record` VALUES ('da5db02339804a50911aedd7191c6d3d', 104417, 1014, 1, 'cb7f09bdb0ef4174abd446d6c1e7745b', 400.0000, '{\"en\":\"固币金到期释放\",\"zh\":\"固币金到期释放\"}', 73400.0000, NULL, NULL, '2019-09-18 15:23:03', '2019-09-18 15:23:03', '0');
INSERT INTO `t_sw_account_record` VALUES ('da6a8a15f0b4477a98c9f6e957dae11f', 104414, 1004, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 1200.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 61400.0000, NULL, NULL, '2019-09-18 15:32:00', '2019-09-18 15:32:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('dac67279885c49978ecdf1b2ce7ea34f', 104414, 1007, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', -1000.0000, '{\"en\":\"购买固币金\",\"zh\":\"购买固币金\"}', 998900.0000, NULL, NULL, '2019-09-17 17:08:32', '2019-09-17 17:08:32', '0');
INSERT INTO `t_sw_account_record` VALUES ('db23ffbb78c54fa28da0a414e211e5af', 104420, 1030, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', -1000.0000, '{\"en\":\"购买固币金\",\"zh\":\"购买固币金\"}', 99000.0000, NULL, NULL, '2019-09-18 11:03:16', '2019-09-18 11:03:16', '0');
INSERT INTO `t_sw_account_record` VALUES ('dc18e0377988499aaf055cd6e2770eb5', 104414, 1032, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 60.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 71010.0000, NULL, NULL, '2019-09-18 12:33:00', '2019-09-18 12:33:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('dc556bb98be94d08bcd587f85efb2f95', 104420, 1018, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 60.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 99300.0000, NULL, NULL, '2019-09-19 12:08:00', '2019-09-19 12:08:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('dcdab0f1676e4e18a07bdbe0735834a9', 104413, 1025, 9, 'cb7f09bdb0ef4174abd446d6c1e7745b', 50000.0000, 'system.benchmarking', 1250000.0000, NULL, NULL, '2019-09-17 17:25:13', '2019-09-17 17:25:13', '0');
INSERT INTO `t_sw_account_record` VALUES ('dd52c3c0cd12428295038ac96ade9567', 104414, 1047, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 300.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 72680.0000, NULL, NULL, '2019-09-18 17:19:00', '2019-09-18 17:19:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('dd713e9cdc8e4b749a891deff4b17fd0', 104423, 1003, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', -50000.0000, '{\"en\":\"购买优币金\",\"zh\":\"购买优币金\"}', 0.0000, NULL, NULL, '2019-09-18 16:13:24', '2019-09-18 16:13:24', '0');
INSERT INTO `t_sw_account_record` VALUES ('df1b3d98dbe249c2b6cd4707dd99f926', 104426, 1005, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 600.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 70200.0000, NULL, NULL, '2019-09-19 12:05:00', '2019-09-19 12:05:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('e070683b1baa4326952b4b40efbd299d', 104414, 1001, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 1500.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 52500.0000, NULL, NULL, '2019-09-24 11:44:00', '2019-09-24 11:44:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('e084f749fe194aea8e6c83a29ba310b6', 104414, 1003, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 100.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 979200.0000, NULL, NULL, '2019-09-17 17:32:00', '2019-09-17 17:32:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('e0bc539c29aa4cc2bc90f507d5e6ad1d', 104417, 1009, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', -2000.0000, '{\"en\":\"购买固币金\",\"zh\":\"购买固币金\"}', 998000.0000, NULL, NULL, '2019-09-17 17:09:41', '2019-09-17 17:09:41', '0');
INSERT INTO `t_sw_account_record` VALUES ('e23f11631a87407299c695b3dcd314ee', 104419, 1011, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', -1000.0000, '{\"en\":\"购买活币金\",\"zh\":\"购买活币金\"}', 129000.0000, NULL, NULL, '2019-09-18 10:43:14', '2019-09-18 10:43:14', '0');
INSERT INTO `t_sw_account_record` VALUES ('e245b6ae38244f85bf8d3253aef2db2a', 104414, 1003, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 1200.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 60200.0000, NULL, NULL, '2019-09-18 15:31:00', '2019-09-18 15:31:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('e432f15508984c2f97b102761fe316fe', 104428, 1001, 9, '737d784555164db2862fd74361a97165', -100.0000, 'system.benchmarking', 0.0000, NULL, NULL, '2019-09-26 19:59:35', '2019-09-26 19:59:35', '0');
INSERT INTO `t_sw_account_record` VALUES ('e6bccd25394941c4b273aa9f4c152670', 104427, 1008, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 10.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 100.0000, NULL, NULL, '2019-09-29 14:50:00', '2019-09-29 14:50:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('e7f625b142ce42169994e8b8a70935ef', 104413, 1001, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', -1000.0000, '{\"en\":\"购买固币金\",\"zh\":\"购买固币金\"}', 99000.0000, NULL, NULL, '2019-09-19 15:56:26', '2019-09-19 15:56:26', '0');
INSERT INTO `t_sw_account_record` VALUES ('e8118ca596f84429a934fe7ccb3ff70d', 104418, 1004, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 200.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 100400.0000, NULL, NULL, '2019-09-18 10:42:00', '2019-09-18 10:42:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('e81d00f0631a42c8a2da23f7c8b9171e', 104414, 1036, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 60.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 101840.0000, NULL, NULL, '2019-09-18 17:09:00', '2019-09-18 17:09:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('e84a8217653744e987a1020af2f36953', 104424, 1020, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 30.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 99150.0000, NULL, NULL, '2019-09-19 12:08:00', '2019-09-19 12:08:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('e94f6bb5869c44579f0ba6c7a7e3a400', 104424, 1016, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 30.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 99120.0000, NULL, NULL, '2019-09-19 12:07:00', '2019-09-19 12:07:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('e97aa034e0b14fbfb499d427932ac931', 104425, 1015, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 60.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 99240.0000, NULL, NULL, '2019-09-19 12:07:00', '2019-09-19 12:07:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('e9f86d2f975747d5a212c2f615ef0e4f', 104420, 1011, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 600.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 71400.0000, NULL, NULL, '2019-09-18 16:59:00', '2019-09-18 16:59:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('ea231b41be0447269c489d76fe2eb03d', 104429, 1002, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', -30000.0000, '{\"en\":\"购买活币金\",\"zh\":\"购买活币金\"}', 9969000.0000, NULL, NULL, '2019-09-27 17:23:01', '2019-09-27 17:23:01', '0');
INSERT INTO `t_sw_account_record` VALUES ('ea446a0a18e94989965b72025588b0a0', 104446, 1007, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', -50000.0000, '{\"en\":\"购买优币金\",\"zh\":\"购买优币金\"}', 0.0000, NULL, NULL, '2019-09-29 10:19:07', '2019-09-29 10:19:07', '0');
INSERT INTO `t_sw_account_record` VALUES ('eb466a7983644d90b03c786fbc1c873e', 104420, 1004, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', 30000.0000, '{\"en\":\"取消活币金\",\"zh\":\"取消活币金\"}', 99000.0000, NULL, NULL, '2019-07-01 16:23:52', '2019-07-01 16:23:52', '0');
INSERT INTO `t_sw_account_record` VALUES ('ebc15b0616c747c8b3c5a56eb3791a24', 104426, 1021, 7, 'cb7f09bdb0ef4174abd446d6c1e7745b', 600.0000, '{\"en\":\"定币金到期释放\",\"zh\":\"定币金到期释放\"}', 72600.0000, NULL, NULL, '2019-09-19 14:44:00', '2019-09-19 14:44:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('ebe624cc7b0b42da9246fff26bef105d', 104414, 1003, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 60.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 69360.0000, NULL, NULL, '2019-09-18 16:56:00', '2019-09-18 16:56:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('ebf439deba2d4807b522d4382d2e995b', 104414, 1021, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 60.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 70350.0000, NULL, NULL, '2019-09-18 12:22:00', '2019-09-18 12:22:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('ebf72c4245854c80bbf7188d8698e23a', 104414, 1024, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 10.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 98020.0000, NULL, NULL, '2019-09-19 15:02:00', '2019-09-19 15:02:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('ec8b32be8b094ea39dd4c9ce9920dd8e', 104414, 1024, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 60.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 70530.0000, NULL, NULL, '2019-09-18 12:25:00', '2019-09-18 12:25:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('eeb386b60a4f435baea3cccd9a49270b', 104418, 1013, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 50.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 994050.0000, NULL, NULL, '2019-09-17 17:14:05', '2019-09-17 17:14:05', '0');
INSERT INTO `t_sw_account_record` VALUES ('eeed4493dcf34995a4b5c03967dad829', 104414, 1015, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 60.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 70800.0000, NULL, NULL, '2019-09-18 17:00:00', '2019-09-18 17:00:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('ef37e22cbab84bcc82f039dcc5d7cc19', 104428, 1005, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', 25000.0000, '{\"en\":\"取消活币金\",\"zh\":\"取消活币金\"}', 45000.0000, NULL, NULL, '2019-09-26 20:03:26', '2019-09-26 20:03:26', '0');
INSERT INTO `t_sw_account_record` VALUES ('ef7338649e28431e8f750cdc1eb08d2b', 104413, 1001, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', -1000.0000, '{\"en\":\"购买固币金\",\"zh\":\"购买固币金\"}', 99000.0000, NULL, NULL, '2019-09-19 11:44:44', '2019-09-19 11:44:44', '0');
INSERT INTO `t_sw_account_record` VALUES ('ef7900d84acb426d9c425816ea3425b5', 104413, 1008, 9, 'cb7f09bdb0ef4174abd446d6c1e7745b', 50000.0000, 'system.benchmarking', 1450000.0000, NULL, NULL, '2019-09-17 17:52:06', '2019-09-17 17:52:06', '0');
INSERT INTO `t_sw_account_record` VALUES ('efc298c7311f44db832a386530bf9630', 104414, 1020, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 60.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 70290.0000, NULL, NULL, '2019-09-18 12:21:00', '2019-09-18 12:21:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('f0046546a54b46fbb1fb97b22d8d98c6', 104423, 1001, 9, '737d784555164db2862fd74361a97165', -100.0000, 'system.benchmarking', 9900.0000, NULL, NULL, '2019-09-18 16:12:49', '2019-09-18 16:12:49', '0');
INSERT INTO `t_sw_account_record` VALUES ('f0298f2a263a4110853ad6b3f58d9315', 104414, 1005, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 800.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 61400.0000, NULL, NULL, '2019-09-18 15:50:00', '2019-09-18 15:50:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('f07b763827d7425d83a6d8d6656e818b', 104414, 1032, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 300.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 71660.0000, NULL, NULL, '2019-09-18 17:07:00', '2019-09-18 17:07:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('f19c511e7db84954a9185c13ba9fec45', 104419, 1016, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', -30000.0000, '{\"en\":\"购买活币金\",\"zh\":\"购买活币金\"}', 100000.0000, NULL, NULL, '2019-09-18 10:44:33', '2019-09-18 10:44:33', '0');
INSERT INTO `t_sw_account_record` VALUES ('f1d0ffa78bd041479c2c7da34db8111d', 104419, 1015, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', 1000.0000, '{\"en\":\"取消活币金\",\"zh\":\"取消活币金\"}', 130000.0000, NULL, NULL, '2019-09-18 10:44:22', '2019-09-18 10:44:22', '0');
INSERT INTO `t_sw_account_record` VALUES ('f4b6962be3024254971985b4e270ca82', 104413, 1006, 9, 'cb7f09bdb0ef4174abd446d6c1e7745b', 50000.0000, 'system.benchmarking', 1400000.0000, NULL, NULL, '2019-09-17 17:52:01', '2019-09-17 17:52:01', '0');
INSERT INTO `t_sw_account_record` VALUES ('f4ce61aada374e41bf6107fb81287ff8', 104417, 1002, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 10.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 916010.0000, NULL, NULL, '2019-09-17 18:02:00', '2019-09-17 18:02:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('f4f1e8e84c2143f3a4d3ea3af952d3e5', 104426, 1006, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', -30000.0000, '{\"en\":\"购买定币金\",\"zh\":\"购买定币金\"}', 69000.0000, NULL, NULL, '2019-09-19 11:58:50', '2019-09-19 11:58:50', '0');
INSERT INTO `t_sw_account_record` VALUES ('f4f764fc1baf46f18e6456536a340da6', 104420, 1029, 10, 'cb7f09bdb0ef4174abd446d6c1e7745b', 100000.0000, '{\"en\":\"充值\",\"zh\":\"充值\"}', 100000.0000, NULL, NULL, '2019-09-18 10:58:32', '2019-09-18 10:58:32', '0');
INSERT INTO `t_sw_account_record` VALUES ('f505c95a7b2f465d90d04406a879f479', 104414, 1003, 1, 'cb7f09bdb0ef4174abd446d6c1e7745b', 600.0000, '{\"en\":\"固币金到期释放\",\"zh\":\"固币金到期释放\"}', 62000.0000, NULL, NULL, '2019-09-18 15:00:49', '2019-09-18 15:00:49', '0');
INSERT INTO `t_sw_account_record` VALUES ('f54cfbf1c64f446488a458efce3787c9', 104414, 1002, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 1500.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 52000.0000, NULL, NULL, '2019-09-23 11:37:00', '2019-09-23 11:37:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('f614db6406a74a77b28dfd9b166b9b97', 104420, 1002, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 60.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 99060.0000, NULL, NULL, '2019-09-19 12:04:00', '2019-09-19 12:04:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('f652b9c436544f15afa0e8b3ffd945d9', 104414, 1007, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 100.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 979400.0000, NULL, NULL, '2019-09-17 17:39:00', '2019-09-17 17:39:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('f6b24c3e5df242c7b10e994c5919b56b', 104420, 1006, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', -30000.0000, '{\"en\":\"购买活币金\",\"zh\":\"购买活币金\"}', 69000.0000, NULL, NULL, '2019-09-18 11:50:49', '2019-09-18 11:50:49', '0');
INSERT INTO `t_sw_account_record` VALUES ('f736037b0899496bb5cb3f48aea7367f', 104418, 1007, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 200.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 100600.0000, NULL, NULL, '2019-09-18 10:43:00', '2019-09-18 10:43:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('f80e85636ad84ee2881379cede287cfd', 104414, 1006, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', 900.0000, '{\"en\":\"取消固币金\",\"zh\":\"取消固币金\"}', 999900.0000, NULL, NULL, '2019-09-17 17:07:56', '2019-09-17 17:07:56', '0');
INSERT INTO `t_sw_account_record` VALUES ('f8a77a1e3dc94ad6b693b654b289e818', 104418, 1011, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', -1000.0000, '{\"en\":\"购买固币金\",\"zh\":\"购买固币金\"}', 999000.0000, NULL, NULL, '2019-09-17 17:12:31', '2019-09-17 17:12:31', '0');
INSERT INTO `t_sw_account_record` VALUES ('f8d39134eb5047fa96fd9f8a59ff17b1', 104414, 1005, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 100.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 979300.0000, NULL, NULL, '2019-09-17 17:36:00', '2019-09-17 17:36:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('f8ea3c95717b46bd8d64e598367bd44b', 104413, 1002, 9, 'cb7f09bdb0ef4174abd446d6c1e7745b', 50000.0000, 'system.benchmarking', 1300000.0000, NULL, NULL, '2019-09-17 17:51:30', '2019-09-17 17:51:30', '0');
INSERT INTO `t_sw_account_record` VALUES ('fa961622686946acbd84008036408e22', 104414, 1012, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 60.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 69810.0000, NULL, NULL, '2019-09-18 12:13:00', '2019-09-18 12:13:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('fa96e7fa25e74e60a46fd8069f33ca23', 104414, 1002, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', -50000.0000, '{\"en\":\"购买定币金\",\"zh\":\"购买定币金\"}', 49000.0000, NULL, NULL, '2019-09-23 11:33:02', '2019-09-23 11:33:02', '0');
INSERT INTO `t_sw_account_record` VALUES ('fab0e71f4fa047778d7e5a9d13b5c3d8', 104417, 1001, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 1500.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 51500.0000, NULL, NULL, '2019-09-23 11:15:21', '2019-09-23 11:15:21', '0');
INSERT INTO `t_sw_account_record` VALUES ('fad8014bacdb4c95810d6e375a27bc9f', 104424, 1004, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 30.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 99030.0000, NULL, NULL, '2019-09-19 12:04:00', '2019-09-19 12:04:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('faf79cba0df747448acd8ca7ce7a5dfc', 104418, 1017, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 200.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 101000.0000, NULL, NULL, '2019-09-18 10:45:00', '2019-09-18 10:45:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('fbd179ee117142a4af4f8ba44e3c2b49', 104414, 1006, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 60.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 69570.0000, NULL, NULL, '2019-09-18 12:09:00', '2019-09-18 12:09:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('fc3e35b00eb44f6d86a4a5a17131fb2d', 104414, 1007, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 300.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 70560.0000, NULL, NULL, '2019-09-18 04:38:00', '2019-09-18 04:38:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('fd3985dde22e4983a1fa7d61b3e13e2f', 104429, 1010, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 300.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 9969600.0000, NULL, NULL, '2019-09-29 17:24:00', '2019-09-29 17:24:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('fe94a9413b224e75ae811bcd7dd310c8', 104420, 1010, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 60.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 99180.0000, NULL, NULL, '2019-09-19 12:06:00', '2019-09-19 12:06:00', '0');
INSERT INTO `t_sw_account_record` VALUES ('ff67c6d1bc014c7eb88d086903e79730', 104414, 1034, 8, 'cb7f09bdb0ef4174abd446d6c1e7745b', 30000.0000, '{\"en\":\"取消活币金\",\"zh\":\"取消活币金\"}', 101720.0000, NULL, NULL, '2019-09-18 17:07:02', '2019-09-18 17:07:02', '0');
INSERT INTO `t_sw_account_record` VALUES ('ff81798ce11e4cd2ab660c2d4ad0de8a', 104414, 1016, 2, 'cb7f09bdb0ef4174abd446d6c1e7745b', 300.0000, '{\"en\":\"固币金加速释放\",\"zh\":\"固币金加速释放\"}', 71100.0000, NULL, NULL, '2019-09-18 17:01:00', '2019-09-18 17:01:00', '0');

-- ----------------------------
-- Table structure for t_sw_benchlog
-- ----------------------------
DROP TABLE IF EXISTS `t_sw_benchlog`;
CREATE TABLE `t_sw_benchlog`  (
  `tid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户ID',
  `source_coin_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '源币种',
  `target_coin_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '目标币种',
  `source_num` double(20, 4) NULL DEFAULT NULL COMMENT '源币种数量',
  `target_num` double(20, 4) NULL DEFAULT NULL COMMENT '目标币种数量',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标记',
  `ex1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ex1',
  `ex2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ex2',
  `ex3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ex3',
  `ex4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ex4',
  PRIMARY KEY (`tid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '对标记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sw_benchlog
-- ----------------------------
INSERT INTO `t_sw_benchlog` VALUES ('e1844be3e3234c3a9cbbbeb00708dbc7', 104428, '737d784555164db2862fd74361a97165', 'cb7f09bdb0ef4174abd446d6c1e7745b', 100.0000, 50000.0000, '2019-09-26 19:59:35', '2019-09-26 19:59:35', '0', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for t_sw_benchmarking
-- ----------------------------
DROP TABLE IF EXISTS `t_sw_benchmarking`;
CREATE TABLE `t_sw_benchmarking`  (
  `tid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `source_coin_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '源币种',
  `target_coin_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '目标币种',
  `source_num` double(20, 4) NULL DEFAULT NULL COMMENT '源币种数量',
  `target_num` double(20, 4) NULL DEFAULT NULL COMMENT '目标币种数量',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标记',
  `ex1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ex1',
  `ex2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ex2',
  `ex3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ex3',
  `ex4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ex4',
  PRIMARY KEY (`tid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '对标项目表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sw_benchmarking
-- ----------------------------
INSERT INTO `t_sw_benchmarking` VALUES ('173e02baade94e22976893d6d82829c6', '737d784555164db2862fd74361a97165', 'cb7f09bdb0ef4174abd446d6c1e7745b', 1000.0000, 500000.0000, '2019-09-16 20:08:02', '2019-09-16 20:08:02', '0', '', '', '', '');
INSERT INTO `t_sw_benchmarking` VALUES ('b65fa4cf115b4fa185dd3ab63eea5dd3', '737d784555164db2862fd74361a97165', 'cb7f09bdb0ef4174abd446d6c1e7745b', 200.0000, 100000.0000, '2019-09-16 20:03:34', '2019-09-16 20:03:34', '0', '', '', '', '');
INSERT INTO `t_sw_benchmarking` VALUES ('c12aa34671334456ae1cd378cea746db', '737d784555164db2862fd74361a97165', 'cb7f09bdb0ef4174abd446d6c1e7745b', 500.0000, 250000.0000, '2019-09-16 20:03:55', '2019-09-16 20:03:55', '0', '', '', '', '');
INSERT INTO `t_sw_benchmarking` VALUES ('fba301b8c2394d349abc2a24b96523e9', '737d784555164db2862fd74361a97165', 'cb7f09bdb0ef4174abd446d6c1e7745b', 100.0000, 50000.0000, '2019-09-16 20:03:13', '2019-09-16 20:03:13', '0', '', '', '', '');

-- ----------------------------
-- Table structure for t_sw_chargelog
-- ----------------------------
DROP TABLE IF EXISTS `t_sw_chargelog`;
CREATE TABLE `t_sw_chargelog`  (
  `tid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `coin_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '币种id',
  `amount` decimal(20, 4) NULL DEFAULT NULL COMMENT '数量',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '充币地址',
  `txid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '转账id',
  `status` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态 0-确认中 1-成功 2-失败',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标记',
  `ex2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ex2',
  `ex4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ex4',
  `ex5` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ex5',
  PRIMARY KEY (`tid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '充币记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sw_chargelog
-- ----------------------------
INSERT INTO `t_sw_chargelog` VALUES ('abe918c20abe4198a2f0e660d8cbca07', 104427, 'cb7f09bdb0ef4174abd446d6c1e7745b', 10.0000, 'deposit', '76530003c177f979193ec1bd9ca22f2dd500a4dce80df72622b9949b53627e6a', '1', '2019-09-27 15:54:14', '2019-09-27 15:54:14', '0', NULL, NULL, NULL);
INSERT INTO `t_sw_chargelog` VALUES ('c389b4d8dc9f431c81e237c3151858ec', 104427, 'cb7f09bdb0ef4174abd446d6c1e7745b', 2.0000, 'deposit', 'b6f789911894a0d49360070c1ca831cdd66fc0e32655b73d34a874c1953388f7', '1', '2019-09-26 17:57:20', '2019-09-26 17:58:46', '0', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for t_sw_coin_type
-- ----------------------------
DROP TABLE IF EXISTS `t_sw_coin_type`;
CREATE TABLE `t_sw_coin_type`  (
  `tid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `coin_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '币种名称',
  `coin_phot` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '币种图片',
  `enable` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '启用0为启用',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '注册时间',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '删除标识',
  `ex1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ex1',
  `ex2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '扩展2',
  PRIMARY KEY (`tid`) USING BTREE,
  UNIQUE INDEX `coin_name`(`coin_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '平台币种表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sw_coin_type
-- ----------------------------
INSERT INTO `t_sw_coin_type` VALUES ('737d784555164db2862fd74361a97165', 'EOS', '', '0', '2019-08-23 21:12:49', '2019-08-23 21:12:49', '0', '', '');
INSERT INTO `t_sw_coin_type` VALUES ('cb7f09bdb0ef4174abd446d6c1e7745b', 'BBCT', '', '0', '2019-08-23 21:13:07', '2019-08-23 21:13:07', '0', '', '');

-- ----------------------------
-- Table structure for t_sw_current
-- ----------------------------
DROP TABLE IF EXISTS `t_sw_current`;
CREATE TABLE `t_sw_current`  (
  `tid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `coin_type_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '币种id',
  `t_percent` double(20, 4) NULL DEFAULT NULL COMMENT '购买最高倍率',
  `b_percent` double(20, 4) NULL DEFAULT NULL COMMENT '购买最低倍率',
  `accelerate_percent` double(20, 4) NULL DEFAULT NULL COMMENT '加速倍率',
  `ex1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ex1',
  `ex2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ex2',
  `ex3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ex3',
  `ex4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ex4',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '0为可用,1为不可用',
  `remark` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '说明',
  PRIMARY KEY (`tid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '活币金表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sw_current
-- ----------------------------
INSERT INTO `t_sw_current` VALUES ('e73868a6942e40c282198811decc3828', '活币金', 'cb7f09bdb0ef4174abd446d6c1e7745b', 30.0000, 1.0000, 0.0100, '', '', '', '', '2019-09-16 14:37:04', '2019-09-16 14:37:04', '0', '');

-- ----------------------------
-- Table structure for t_sw_current_user
-- ----------------------------
DROP TABLE IF EXISTS `t_sw_current_user`;
CREATE TABLE `t_sw_current_user`  (
  `tid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ID',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户ID',
  `current_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活币金id',
  `release_time` datetime(0) NULL DEFAULT NULL COMMENT '释放时间',
  `status` int(1) NULL DEFAULT NULL COMMENT '状态，0-正常，1-已释放完',
  `ex1` double(20, 4) NULL DEFAULT NULL COMMENT '认购金额',
  `ex2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ex2',
  `ex3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ex3',
  `ex4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ex4',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '0为可用,1为不可用',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '说明',
  PRIMARY KEY (`tid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户持有活币金表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sw_current_user
-- ----------------------------
INSERT INTO `t_sw_current_user` VALUES ('03c6c0d2b93546ff8c045bedfd44bbab', 104428, 'e73868a6942e40c282198811decc3828', '2019-09-27 20:06:42', 1, 150000.0000, NULL, NULL, NULL, '2019-09-26 20:06:42', '2019-09-28 01:00:10', '0', NULL);
INSERT INTO `t_sw_current_user` VALUES ('247d709d30aa4d5380c142673962c05e', 104427, 'e73868a6942e40c282198811decc3828', '2019-09-29 14:49:38', 0, 1000.0000, NULL, NULL, NULL, '2019-09-27 14:49:38', '2019-09-29 14:50:00', '0', NULL);
INSERT INTO `t_sw_current_user` VALUES ('6ce3a6f1b28a4db8a29ae7bf6aae277e', 104428, 'e73868a6942e40c282198811decc3828', '2019-09-26 20:02:37', 1, 25000.0000, NULL, NULL, NULL, '2019-09-26 20:02:37', '2019-09-26 20:03:26', '0', NULL);
INSERT INTO `t_sw_current_user` VALUES ('88ecdfc2ee7a43408016a72ce0ff0ae1', 104429, 'e73868a6942e40c282198811decc3828', '2019-09-29 17:23:01', 0, 30000.0000, NULL, NULL, NULL, '2019-09-27 17:23:01', '2019-09-29 17:24:00', '0', NULL);
INSERT INTO `t_sw_current_user` VALUES ('d6e0e5faffd5440093f0dab892fbafa4', 104428, 'e73868a6942e40c282198811decc3828', '2019-09-29 15:23:00', 0, 150000.0000, NULL, NULL, NULL, '2019-09-29 15:23:00', '2019-09-29 15:23:00', '0', NULL);
INSERT INTO `t_sw_current_user` VALUES ('dcb2616609924695812aaeff19f99e0f', 104428, 'e73868a6942e40c282198811decc3828', '2019-09-26 20:04:46', 1, 50000.0000, NULL, NULL, NULL, '2019-09-26 20:04:46', '2019-09-26 20:06:31', '0', NULL);

-- ----------------------------
-- Table structure for t_sw_evangelist
-- ----------------------------
DROP TABLE IF EXISTS `t_sw_evangelist`;
CREATE TABLE `t_sw_evangelist`  (
  `tid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `coin_type_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '币种id',
  `evangelist_num` double(20, 4) NULL DEFAULT NULL COMMENT '优币金额度',
  `percent` double(20, 4) NULL DEFAULT NULL COMMENT '倍率',
  `ex1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ex1',
  `ex2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ex2',
  `ex3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ex3',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '0为可用,1为不可用',
  `remark` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '说明',
  PRIMARY KEY (`tid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '优币金表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sw_evangelist
-- ----------------------------
INSERT INTO `t_sw_evangelist` VALUES ('b8b22ebd7a7248588417661d078659cf', '优币金', 'cb7f09bdb0ef4174abd446d6c1e7745b', 50000.0000, 10.0000, '', '', '', '2019-09-16 14:38:28', '2019-09-16 14:38:28', '0', '');

-- ----------------------------
-- Table structure for t_sw_evangelist_info
-- ----------------------------
DROP TABLE IF EXISTS `t_sw_evangelist_info`;
CREATE TABLE `t_sw_evangelist_info`  (
  `tid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户ID',
  `real_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `mobile` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '布道者邮箱',
  `wechat` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信',
  `weibo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微博',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所在地区',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '0为可用,1为不可用',
  `ex1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核状态，0-待审核，1-审核通过，2-审核拒绝',
  `ex2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ex2',
  `ex3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ex3',
  `ex4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ex4',
  PRIMARY KEY (`tid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '布道者资料申请表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sw_evangelist_info
-- ----------------------------
INSERT INTO `t_sw_evangelist_info` VALUES ('fb618779c2d542c1b1e17862ee640294', 104429, '杨威', '18923715896', '953751758@qq.com', '953751759', '953751759', '广东深圳', '2019-09-29 10:15:28', '2019-09-29 10:15:28', '0', '1', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for t_sw_evangelist_user
-- ----------------------------
DROP TABLE IF EXISTS `t_sw_evangelist_user`;
CREATE TABLE `t_sw_evangelist_user`  (
  `tid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ID',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户ID',
  `evangelist_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '优币金id',
  `total_num` double(20, 4) NULL DEFAULT NULL COMMENT '总金额',
  `left_num` double(20, 4) NULL DEFAULT NULL COMMENT '剩余金额',
  `status` int(1) NULL DEFAULT NULL COMMENT '状态，0-正常，1-已释放完',
  `ex1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ex1',
  `ex2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ex2',
  `ex3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ex3',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '0为可用,1为不可用',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '说明',
  PRIMARY KEY (`tid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户持有优币金表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sw_evangelist_user
-- ----------------------------
INSERT INTO `t_sw_evangelist_user` VALUES ('f4f61a485de94d58be7d95e2c31370d9', 104446, 'b8b22ebd7a7248588417661d078659cf', 500000.0000, 500000.0000, 0, NULL, NULL, NULL, '2019-09-29 10:19:07', '2019-09-29 10:19:07', '0', NULL);

-- ----------------------------
-- Table structure for t_sw_fiat_coin
-- ----------------------------
DROP TABLE IF EXISTS `t_sw_fiat_coin`;
CREATE TABLE `t_sw_fiat_coin`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '法币表',
  `country_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国家名称',
  `is_show` tinyint(4) NULL DEFAULT NULL COMMENT '是否显示',
  `curr_symbol` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '符号',
  `curr_icon` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单位符号',
  `price` decimal(20, 4) NULL DEFAULT NULL COMMENT '购买价格',
  `coin_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数字货币id',
  `create_time` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(6) NULL DEFAULT NULL COMMENT '最后更新时间',
  `code` int(20) NULL DEFAULT NULL COMMENT '国家编号',
  `sell_price` decimal(20, 4) NULL DEFAULT NULL COMMENT '回购价格',
  `ex1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消费价格',
  `ex2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ex2',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1250 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sw_fiat_coin
-- ----------------------------
INSERT INTO `t_sw_fiat_coin` VALUES (1, '中国', 1, 'CNY', '￥', 0.0100, '003', '2019-03-18 20:25:14.000000', '2019-08-09 14:59:08.985000', 86, 6.7900, '6.79', NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (2, '马来西亚', 1, 'MYR', 'RM', 0.0200, '003', '2019-03-19 16:22:42.000000', '2019-06-25 11:18:53.437000', 60, 3.8700, '3.87', NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (3, '新加坡', 1, 'SGD', 'S$', 0.0300, '003', '2019-03-19 16:23:18.000000', '2019-03-19 16:23:21.000000', 65, 1.2500, '1.25', NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1011, '中国', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:19:04.061000', '2019-06-18 15:19:04.061000', 86, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1012, '智利', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:19:13.321000', '2019-06-18 15:19:13.321000', 56, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1013, '新加坡', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:19:13.806000', '2019-06-18 15:19:13.806000', 65, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1014, '泰国', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:19:13.933000', '2019-06-18 15:19:13.933000', 66, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1015, '尼泊尔', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:19:15.391000', '2019-06-18 15:19:15.391000', 977, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1016, '荷兰', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:19:15.501000', '2019-06-18 15:19:15.501000', 31, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1017, '挪威', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:19:18.254000', '2019-06-18 15:19:18.254000', 47, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1018, '新西兰', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:19:19.492000', '2019-06-18 15:19:19.492000', 64, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1019, '纽埃岛', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:19:20.334000', '2019-06-18 15:19:20.334000', 222, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1020, '阿曼', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:19:20.434000', '2019-06-18 15:19:20.434000', 968, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1021, '秘鲁', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:19:20.622000', '2019-06-18 15:19:20.622000', 51, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1022, '巴拿马', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:19:20.993000', '2019-06-18 15:19:20.993000', 507, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1023, '圣皮埃尔岛和密克隆', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:19:21.167000', '2019-06-18 15:19:21.167000', 222, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1024, '波兰', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:19:21.259000', '2019-06-18 15:19:21.259000', 48, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1025, '巴基斯坦', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:19:24.012000', '2019-06-18 15:19:24.012000', 92, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1026, '菲律宾', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:19:24.148000', '2019-06-18 15:19:24.148000', 63, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1027, '巴布亚新几内亚', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:19:24.823000', '2019-06-18 15:19:24.823000', 675, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1028, '法属波利尼西亚', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:19:24.954000', '2019-06-18 15:19:24.954000', 689, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1029, '斯里兰卡', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:19:25.141000', '2019-06-18 15:19:25.141000', 94, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1030, '莱索托', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:19:25.488000', '2019-06-18 15:19:25.488000', 266, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1031, '立陶宛', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:19:25.586000', '2019-06-18 15:19:25.586000', 370, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1032, '卢森堡', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:19:25.944000', '2019-06-18 15:19:25.944000', 352, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1033, '拉脱维亚', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:19:26.241000', '2019-06-18 15:19:26.241000', 371, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1034, '利比亚', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:19:26.545000', '2019-06-18 15:19:26.545000', 218, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1035, '摩洛哥', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:19:26.639000', '2019-06-18 15:19:26.639000', 212, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1036, '摩尔多瓦', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:19:26.803000', '2019-06-18 15:19:26.803000', 373, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1037, '摩纳哥', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:19:26.927000', '2019-06-18 15:19:26.927000', 377, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1038, '法属圣马丁', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:19:27.025000', '2019-06-18 15:19:27.025000', 222, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1039, '门的内哥罗', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:19:27.116000', '2019-06-18 15:19:27.116000', 222, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1040, '马达加斯加岛', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:19:27.353000', '2019-06-18 15:19:27.353000', 222, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1041, '缅甸', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:19:27.500000', '2019-06-18 15:19:27.500000', 95, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1042, '蒙古', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:19:27.696000', '2019-06-18 15:19:27.696000', 976, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1043, '马其顿', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:19:27.798000', '2019-06-18 15:19:27.798000', 222, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1044, '马里', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:19:27.964000', '2019-06-18 15:19:27.964000', 223, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1045, '马提尼克岛', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:19:28.063000', '2019-06-18 15:19:28.063000', 222, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1046, '毛利塔尼亚', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:19:28.182000', '2019-06-18 15:19:28.182000', 222, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1047, '北马里亚纳群岛', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:19:28.273000', '2019-06-18 15:19:28.273000', 222, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1048, '毛里求斯', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:19:28.379000', '2019-06-18 15:19:28.379000', 230, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1049, '马尔代夫', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:19:28.470000', '2019-06-18 15:19:28.470000', 960, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1050, '蒙特塞拉特', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:19:28.666000', '2019-06-18 15:19:28.666000', 1664, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1051, '马耳他', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:19:28.761000', '2019-06-18 15:19:28.761000', 356, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1052, '马来西亚', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:19:29.033000', '2019-06-18 15:19:29.033000', 60, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1053, '莫桑比克', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:19:30.092000', '2019-06-18 15:19:30.092000', 258, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1054, '马拉维', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:19:30.255000', '2019-06-18 15:19:30.255000', 265, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1055, '墨西哥', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:19:30.374000', '2019-06-18 15:19:30.374000', 52, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1056, '新喀里多尼亚', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:19:31.579000', '2019-06-18 15:19:31.579000', 687, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1057, '纳米比亚', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:19:31.678000', '2019-06-18 15:19:31.678000', 222, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1058, '尼日利亚', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:19:31.909000', '2019-06-18 15:19:31.909000', 234, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1059, '诺福克岛', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:19:32.067000', '2019-06-18 15:19:32.067000', 6723, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1060, '尼日尔', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:19:32.164000', '2019-06-18 15:19:32.164000', 227, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1061, '尼加拉瓜', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:19:32.258000', '2019-06-18 15:19:32.258000', 505, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1062, '日本', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:19:32.430000', '2019-06-18 15:19:32.430000', 81, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1063, '牙买加', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:19:36.460000', '2019-06-18 15:19:36.460000', 1876, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1064, '约旦', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:19:36.644000', '2019-06-18 15:19:36.644000', 962, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1065, '肯尼亚', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:19:36.771000', '2019-06-18 15:19:36.771000', 254, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1066, '吉尔吉斯斯坦', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:19:37.003000', '2019-06-18 15:19:37.003000', 996, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1067, '柬埔寨', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:19:37.118000', '2019-06-18 15:19:37.118000', 855, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1068, '科威特', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:19:37.342000', '2019-06-18 15:19:37.342000', 965, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1069, '韩国', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:19:37.443000', '2019-06-18 15:19:37.443000', 82, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1070, '圣基茨和尼维斯', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:19:38.117000', '2019-06-18 15:19:38.117000', 1869, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1071, '科摩罗', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:19:38.228000', '2019-06-18 15:19:38.228000', 269, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1072, '列支敦士登', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:19:38.314000', '2019-06-18 15:19:38.314000', 423, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1073, '黎巴嫩', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:19:38.445000', '2019-06-18 15:19:38.445000', 961, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1074, '圣卢西亚岛', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:19:38.623000', '2019-06-18 15:19:38.623000', 222, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1075, '老挝', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:19:38.755000', '2019-06-18 15:19:38.755000', 856, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1076, '开曼群岛', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:19:38.927000', '2019-06-18 15:19:38.927000', 1345, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1077, '哈萨克斯坦', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:19:39.033000', '2019-06-18 15:19:39.033000', 73, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1078, '洪都拉斯', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:19:39.192000', '2019-06-18 15:19:39.192000', 504, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1079, '克罗地亚', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:19:39.340000', '2019-06-18 15:19:39.340000', 385, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1080, '南非', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:19:39.894000', '2019-06-18 15:19:39.894000', 27, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1081, '匈牙利', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:19:40.381000', '2019-06-18 15:19:40.381000', 36, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1082, '海地', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:19:41.186000', '2019-06-18 15:19:41.186000', 509, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1083, '津巴布韦', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:19:41.292000', '2019-06-18 15:19:41.292000', 263, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1084, '印度尼西亚', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:19:41.429000', '2019-06-18 15:19:41.429000', 62, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1085, '爱尔兰', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:19:43.476000', '2019-06-18 15:19:43.476000', 353, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1086, '赞比亚', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:19:44.329000', '2019-06-18 15:19:44.329000', 260, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1087, '伊拉克', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:19:44.479000', '2019-06-18 15:19:44.479000', 964, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1088, '意大利', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:19:44.569000', '2019-06-18 15:19:44.569000', 39, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1089, '冰岛', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:19:59.044000', '2019-06-18 15:19:59.044000', 354, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1090, '印度', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:19:59.503000', '2019-06-18 15:19:59.503000', 91, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1091, '以色列', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:20:01.342000', '2019-06-18 15:20:01.342000', 972, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1092, '马约特', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:20:01.863000', '2019-06-18 15:20:01.863000', 269, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1093, '泽西岛', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:20:01.949000', '2019-06-18 15:20:01.949000', 222, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1094, '格林纳达', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:20:02.058000', '2019-06-18 15:20:02.058000', 1473, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1095, '英国', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:20:02.168000', '2019-06-18 15:20:02.168000', 44, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1096, '加蓬', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:20:07.771000', '2019-06-18 15:20:07.771000', 241, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1097, '斐济', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:20:07.866000', '2019-06-18 15:20:07.866000', 679, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1098, '福克兰群岛', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:20:07.963000', '2019-06-18 15:20:07.963000', 222, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1099, '芬兰', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:20:08.053000', '2019-06-18 15:20:08.053000', 358, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1100, '法国', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:20:09.506000', '2019-06-18 15:20:09.506000', 33, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1101, '法罗群岛', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:20:21.335000', '2019-06-18 15:20:21.335000', 298, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1102, '密克罗尼西亚', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:20:21.447000', '2019-06-18 15:20:21.447000', 691, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1103, '圭亚那', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:20:21.552000', '2019-06-18 15:20:21.552000', 592, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1104, '关岛', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:20:21.639000', '2019-06-18 15:20:21.639000', 1671, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1105, '几内亚比绍', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:20:21.741000', '2019-06-18 15:20:21.741000', 245, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1106, '萨摩亚', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:20:21.831000', '2019-06-18 15:20:21.831000', 685, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1107, '直布罗陀', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:20:21.982000', '2019-06-18 15:20:21.982000', 350, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1108, '瓦努阿图', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:20:22.071000', '2019-06-18 15:20:22.071000', 678, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1109, '格陵兰', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:20:22.216000', '2019-06-18 15:20:22.216000', 299, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1110, '格鲁吉亚', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:20:22.315000', '2019-06-18 15:20:22.315000', 995, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1111, '法属圭亚那', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:20:22.511000', '2019-06-18 15:20:22.511000', 594, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1112, '格恩西岛', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:20:22.602000', '2019-06-18 15:20:22.602000', 222, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1113, '加纳', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:20:22.703000', '2019-06-18 15:20:22.703000', 233, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1114, '赤道几内亚', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:20:22.851000', '2019-06-18 15:20:22.851000', 240, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1115, '希腊', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:20:22.946000', '2019-06-18 15:20:22.946000', 30, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1116, '危地马拉', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:20:23.253000', '2019-06-18 15:20:23.253000', 502, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1117, '冈比亚', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:20:23.464000', '2019-06-18 15:20:23.464000', 220, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1118, '几内亚', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:20:23.566000', '2019-06-18 15:20:23.566000', 224, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1119, '瓜德罗普岛', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:20:23.657000', '2019-06-18 15:20:23.657000', 222, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1120, '维尔京群岛', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:20:23.748000', '2019-06-18 15:20:23.748000', 222, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1121, '委内瑞拉', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:20:23.840000', '2019-06-18 15:20:23.840000', 58, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1122, '英属维尔京群岛', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:20:24.029000', '2019-06-18 15:20:24.029000', 1284, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1123, '阿尔及利亚', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:20:24.146000', '2019-06-18 15:20:24.146000', 213, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1124, '越南', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:20:24.272000', '2019-06-18 15:20:24.272000', 84, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1125, '德国', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:20:24.926000', '2019-06-18 15:20:24.926000', 49, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1126, '乌拉圭', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:20:31.231000', '2019-06-18 15:20:31.231000', 598, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1127, '乌兹别克斯坦', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:20:31.610000', '2019-06-18 15:20:31.610000', 998, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1128, '美国', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:20:31.734000', '2019-06-18 15:20:31.734000', 1, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1129, '多米尼加', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:21:03.743000', '2019-06-18 15:21:03.743000', 1809, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1130, '吉布提', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:21:03.957000', '2019-06-18 15:21:03.957000', 253, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1131, '丹麦', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:21:04.050000', '2019-06-18 15:21:04.050000', 45, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1132, '圣文森特和格林纳丁斯', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:21:05.236000', '2019-06-18 15:21:05.236000', 1784, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1133, '多米尼加共和国', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:21:05.342000', '2019-06-18 15:21:05.342000', 222, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1134, '埃塞俄比亚', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:21:05.538000', '2019-06-18 15:21:05.538000', 251, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1135, '西班牙', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:21:05.650000', '2019-06-18 15:21:05.650000', 34, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1136, '乌干达', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:21:10.668000', '2019-06-18 15:21:10.668000', 256, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1137, '厄瓜多尔', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:21:11.059000', '2019-06-18 15:21:11.059000', 593, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1138, '爱沙尼亚', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:21:11.413000', '2019-06-18 15:21:11.413000', 372, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1139, '埃及', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:21:12.063000', '2019-06-18 15:21:12.063000', 20, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1140, '特立尼达和多巴哥', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:21:12.299000', '2019-06-18 15:21:12.299000', 1868, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1141, '西撒哈拉', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:21:12.416000', '2019-06-18 15:21:12.416000', 222, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1142, '土耳其', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:21:12.502000', '2019-06-18 15:21:12.502000', 90, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1143, '乌克兰', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:21:14.621000', '2019-06-18 15:21:14.621000', 380, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1144, '坦桑尼亚', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:21:15.287000', '2019-06-18 15:21:15.287000', 255, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1145, '塔吉克斯坦', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:21:15.619000', '2019-06-18 15:21:15.619000', 992, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1146, '东帝汶', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:21:15.709000', '2019-06-18 15:21:15.709000', 222, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1147, '伯利兹', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:21:15.798000', '2019-06-18 15:21:15.798000', 501, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1148, '突尼斯', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:21:15.950000', '2019-06-18 15:21:15.950000', 216, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1149, '汤加', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:21:16.148000', '2019-06-18 15:21:16.148000', 676, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1150, '白俄罗斯', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:21:16.263000', '2019-06-18 15:21:16.263000', 375, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1151, '特克斯和凯科斯群岛', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:21:16.418000', '2019-06-18 15:21:16.418000', 1649, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1152, '博茨瓦纳', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:21:16.522000', '2019-06-18 15:21:16.522000', 267, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1153, '不丹', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:21:16.806000', '2019-06-18 15:21:16.806000', 975, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1154, '巴西', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:21:16.911000', '2019-06-18 15:21:16.911000', 55, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1155, '多哥', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:21:20.119000', '2019-06-18 15:21:20.119000', 228, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1156, '巴哈马', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:21:20.210000', '2019-06-18 15:21:20.210000', 1242, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1157, '荷兰加勒比区', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:21:20.406000', '2019-06-18 15:21:20.406000', 222, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1158, '斯威士兰', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:21:20.503000', '2019-06-18 15:21:20.503000', 268, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1159, '玻利维亚', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:21:20.606000', '2019-06-18 15:21:20.606000', 591, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1160, '文莱', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:21:20.798000', '2019-06-18 15:21:20.798000', 673, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1161, '百慕大', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:21:21.056000', '2019-06-18 15:21:21.056000', 1441, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1162, '圣巴泰勒米岛', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:21:21.179000', '2019-06-18 15:21:21.179000', 222, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1163, '贝宁', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:21:21.271000', '2019-06-18 15:21:21.271000', 229, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1164, '布隆迪', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:21:21.362000', '2019-06-18 15:21:21.362000', 257, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1165, '巴林', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:21:21.448000', '2019-06-18 15:21:21.448000', 973, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1166, '苏里南', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:21:21.557000', '2019-06-18 15:21:21.557000', 597, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1167, '保加利亚', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:21:21.647000', '2019-06-18 15:21:21.647000', 359, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1168, '布基纳法索', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:21:22.486000', '2019-06-18 15:21:22.486000', 226, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1169, '圣多美和普林西比', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:21:22.576000', '2019-06-18 15:21:22.576000', 239, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1170, '比利时', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:21:22.805000', '2019-06-18 15:21:22.805000', 32, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1171, '孟加拉国', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:21:25.091000', '2019-06-18 15:21:25.091000', 880, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1172, '萨尔瓦多', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:21:25.293000', '2019-06-18 15:21:25.293000', 503, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1173, '巴巴多斯岛', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:21:25.457000', '2019-06-18 15:21:25.457000', 222, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1174, '荷属圣马丁', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:21:25.633000', '2019-06-18 15:21:25.633000', 222, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1175, '波斯尼亚和黑塞哥维那', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:21:25.729000', '2019-06-18 15:21:25.729000', 222, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1176, '斯洛伐克', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:21:25.819000', '2019-06-18 15:21:25.819000', 421, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1177, '塞拉利昂', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:21:26.670000', '2019-06-18 15:21:26.670000', 222, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1178, '斯洛文尼亚', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:21:26.759000', '2019-06-18 15:21:26.759000', 386, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1179, '斯瓦尔巴特群岛', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:21:27.011000', '2019-06-18 15:21:27.011000', 222, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1180, '塞浦路斯', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:21:27.097000', '2019-06-18 15:21:27.097000', 357, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1181, '捷克', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:21:27.407000', '2019-06-18 15:21:27.407000', 420, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1182, '圣马力诺', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:21:29.425000', '2019-06-18 15:21:29.425000', 378, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1183, '塞内加尔', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:21:29.524000', '2019-06-18 15:21:29.524000', 221, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1184, '塞舌尔', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:21:29.703000', '2019-06-18 15:21:29.703000', 248, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1185, '佛得角', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:21:29.811000', '2019-06-18 15:21:29.811000', 238, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1186, '库拉索', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:21:29.924000', '2019-06-18 15:21:29.924000', 222, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1187, '沙特阿拉伯', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:21:30.046000', '2019-06-18 15:21:30.046000', 966, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1188, '所罗门群岛', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:21:30.270000', '2019-06-18 15:21:30.270000', 677, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1189, '哥斯达黎加', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:21:30.361000', '2019-06-18 15:21:30.361000', 506, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1190, '瑞典', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:21:30.849000', '2019-06-18 15:21:30.849000', 46, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1191, '喀麦隆', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:21:33.068000', '2019-06-18 15:21:33.068000', 237, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1192, '哥伦比亚', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:21:33.188000', '2019-06-18 15:21:33.188000', 57, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1193, '库克群岛', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:21:33.794000', '2019-06-18 15:21:33.794000', 682, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1194, '塞尔维亚', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:21:33.928000', '2019-06-18 15:21:33.928000', 222, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1195, '瑞士', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:21:34.265000', '2019-06-18 15:21:34.265000', 41, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1196, '刚果', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:21:37.421000', '2019-06-18 15:21:37.421000', 222, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1197, '卢旺达', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:21:37.515000', '2019-06-18 15:21:37.515000', 250, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1198, '加拿大', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:21:37.606000', '2019-06-18 15:21:37.606000', 1, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1199, '俄罗斯', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:21:45.805000', '2019-06-18 15:21:45.805000', 7, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1200, '科科斯群岛', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:21:47.436000', '2019-06-18 15:21:47.436000', 222, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1201, '罗马尼亚', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:21:47.529000', '2019-06-18 15:21:47.529000', 40, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1202, '留尼汪', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:21:48.667000', '2019-06-18 15:21:48.667000', 262, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1203, '阿鲁巴', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:21:48.803000', '2019-06-18 15:21:48.803000', 297, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1204, '奥兰群岛', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:21:48.949000', '2019-06-18 15:21:48.949000', 222, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1205, '阿塞拜疆', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:21:49.037000', '2019-06-18 15:21:49.037000', 994, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1206, '安哥拉', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:21:49.174000', '2019-06-18 15:21:49.174000', 244, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1207, '阿根廷', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:21:49.263000', '2019-06-18 15:21:49.263000', 54, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1208, '美属萨摩亚', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:21:50.311000', '2019-06-18 15:21:50.311000', 684, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1209, '卡塔尔', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:21:50.401000', '2019-06-18 15:21:50.401000', 974, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1210, '奥地利', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:21:50.502000', '2019-06-18 15:21:50.502000', 43, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1211, '澳大利亚', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:21:55.106000', '2019-06-18 15:21:55.106000', 61, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1212, '安提瓜和巴布达', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:22:00.341000', '2019-06-18 15:22:00.341000', 1268, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1213, '安圭拉', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:22:00.482000', '2019-06-18 15:22:00.482000', 1264, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1214, '阿尔巴尼亚', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:22:00.584000', '2019-06-18 15:22:00.584000', 355, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1215, '巴拉圭', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:22:00.768000', '2019-06-18 15:22:00.768000', 595, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1216, '帕劳', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:22:01.073000', '2019-06-18 15:22:01.073000', 680, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1217, '亚美尼亚', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:22:01.174000', '2019-06-18 15:22:01.174000', 374, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1218, '葡萄牙', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:22:01.296000', '2019-06-18 15:22:01.296000', 351, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1219, '波多黎各', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:22:02.838000', '2019-06-18 15:22:02.838000', 1809, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1220, '安道尔', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:22:03.096000', '2019-06-18 15:22:03.096000', 376, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1221, '阿拉伯联合酋长国', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:22:03.412000', '2019-06-18 15:22:03.412000', 971, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1222, '阿富汗', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:22:03.575000', '2019-06-18 15:22:03.575000', 93, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1223, '乍得', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:22:03.662000', '2019-06-18 15:22:03.662000', 235, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1224, '古巴', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:22:03.748000', '2019-06-18 15:22:03.748000', 53, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1225, '伊朗', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:22:03.883000', '2019-06-18 15:22:03.883000', 98, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1226, '叙利亚', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:22:03.994000', '2019-06-18 15:22:03.994000', 963, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1227, '土库曼斯坦', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:22:04.090000', '2019-06-18 15:22:04.090000', 993, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1228, '也门', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:22:04.181000', '2019-06-18 15:22:04.181000', 967, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1229, '朝鲜', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:22:04.277000', '2019-06-18 15:22:04.277000', 850, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1230, '科索沃', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:22:04.365000', '2019-06-18 15:22:04.365000', 222, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1231, '科特迪瓦', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:22:04.459000', '2019-06-18 15:22:04.459000', 225, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1232, '苏丹', 2, NULL, NULL, NULL, NULL, '2019-06-18 15:22:04.549000', '2019-06-18 15:22:04.549000', 249, NULL, NULL, NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1233, '中国台湾', 2, 'TWD', 'NT$', 32.0000, '003', '2019-06-24 12:07:31.142000', '2019-09-26 20:15:16.811000', 886, 31.0000, '31', NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1234, '印度尼西亚', 2, 'IDR', 'Rp', 15000.0000, '003', '2019-06-24 12:13:05.680000', '2019-09-26 20:12:12.600000', 62, 13500.0000, '13500', NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1235, '澳大利亚', 2, 'AUD', 'AUD$', 1.4000, '003', '2019-06-24 12:17:27.137000', '2019-09-26 20:12:17.344000', 61, 1.3000, '1.3', NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1236, '中国香港', 1, 'HKD', 'HKD$', 8.0000, '003', '2019-06-24 12:21:02.652000', '2019-09-26 20:13:43.083000', 852, 7.5000, '7.5', NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1237, '意大利', 2, 'EUR', '€', 1.1000, '003', '2019-06-24 12:24:22.109000', '2019-09-26 20:12:32.632000', 39, 0.9000, '0.9', NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1238, '韩国', 2, 'KRW', ' ₩', 1300.0000, '003', '2019-06-24 12:27:27.367000', '2019-09-26 20:12:37.815000', 82, 1100.0000, '1100', NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1239, '日本', 2, 'JPY', 'JP¥', 130.0000, '003', '2019-06-24 12:30:26.856000', '2019-09-26 20:12:03.138000', 81, 110.0000, '110', NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1240, '美国', 2, 'USD', 'US$', 1.0000, '003', '2019-06-24 12:36:31.394000', '2019-09-26 20:11:58.767000', 1, 0.9800, '0.98', NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1241, '越南', 2, 'VND', '₫', 24000.0000, '003', '2019-06-24 12:39:20.262000', '2019-09-26 20:12:43.118000', 84, 22000.0000, '22000', NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1242, '菲律宾', 2, 'PHP', '‎₱	', 60.0000, '003', '2019-06-24 12:50:54.432000', '2019-09-26 20:12:47.248000', 63, 50.0000, '50', NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1243, '印度', 2, 'INR', '₹', 70.0000, '003', '2019-06-24 13:06:15.961000', '2019-09-26 20:12:51.127000', 91, 55.0000, '55', NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1244, '泰国', 2, 'THB', '฿', 32.0000, '003', '2019-06-24 16:23:57.667000', '2019-09-26 20:12:55.141000', 66, 30.0000, '30', NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1245, '英国', 2, 'GBP', '£', 0.7500, '003', '2019-06-24 18:50:43.896000', '2019-09-26 20:12:58.887000', 44, 0.6500, '0.65', NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1246, '柬埔寨', 2, 'KHR', '៛ ', 4300.0000, '003', '2019-06-25 10:54:39.374000', '2019-09-26 20:13:02.980000', 855, 4000.0000, '4000', NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1247, '西班牙', 2, 'EUR', '€', 1.1000, '003', '2019-06-25 11:17:44.715000', '2019-09-26 20:13:07.261000', 34, 0.9000, '0.9', NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1248, '阿拉伯联合酋长国', 2, 'AED', '‎د.إ', 3.8000, '003', '2019-06-26 19:20:39.978000', '2019-09-26 20:13:15.628000', 971, 3.6000, '3.6', NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1249, '马尔代夫', 2, 'MVR ', 'Rf', 16.0000, '003', '2019-06-26 19:24:45.499000', '2019-09-26 20:13:23.688000', 960, 15.0000, '15', NULL);

-- ----------------------------
-- Table structure for t_sw_partner
-- ----------------------------
DROP TABLE IF EXISTS `t_sw_partner`;
CREATE TABLE `t_sw_partner`  (
  `tid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `coin_type_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '币种id',
  `partner_num` double(20, 4) NULL DEFAULT NULL COMMENT '升币金额度',
  `percent` double(20, 4) NULL DEFAULT NULL COMMENT '倍率',
  `remark` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '说明',
  `ex1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ex1',
  `ex2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ex2',
  `ex3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ex3',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '0为可用,1为不可用',
  PRIMARY KEY (`tid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '升币金表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sw_partner
-- ----------------------------
INSERT INTO `t_sw_partner` VALUES ('579947aafb4c47dea434202e89d3c688', '升币金', 'cb7f09bdb0ef4174abd446d6c1e7745b', 50000.0000, 100.0000, '', '', '', '', '2019-09-16 14:38:45', '2019-09-16 14:38:45', '0');

-- ----------------------------
-- Table structure for t_sw_partner_user
-- ----------------------------
DROP TABLE IF EXISTS `t_sw_partner_user`;
CREATE TABLE `t_sw_partner_user`  (
  `tid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ID',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户ID',
  `partner_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '升币金ID',
  `total_num` double(20, 4) NULL DEFAULT NULL COMMENT '总数量',
  `left_num` double(20, 4) NULL DEFAULT NULL COMMENT '剩余数量',
  `status` int(1) NULL DEFAULT NULL COMMENT '状态，0-正常，1-已释放完',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '说明',
  `ex1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ex1',
  `ex2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ex2',
  `ex3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ex3',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '0为可用,1为不可用',
  PRIMARY KEY (`tid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户持有升币金表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_sw_period
-- ----------------------------
DROP TABLE IF EXISTS `t_sw_period`;
CREATE TABLE `t_sw_period`  (
  `tid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `coin_type_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '币种id',
  `period_term` int(5) NULL DEFAULT NULL COMMENT '定币金周期（天）',
  `t_percent` double(20, 4) NULL DEFAULT NULL COMMENT '购买最高倍率',
  `b_percent` double(20, 4) NULL DEFAULT NULL COMMENT '购买最低倍率',
  `accelerate_percent` double(20, 4) NULL DEFAULT NULL COMMENT '加速倍率',
  `ex1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ex1',
  `ex2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ex2',
  `ex3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ex3',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '0为可用,1为不可用',
  `remark` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '说明',
  PRIMARY KEY (`tid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定币金表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sw_period
-- ----------------------------
INSERT INTO `t_sw_period` VALUES ('2d1c9d3c65bf4375b2f8aad928fcc8bb', 'B60', 'cb7f09bdb0ef4174abd446d6c1e7745b', 60, 50.0000, 1.0000, 0.0200, '', '', '', '2019-09-16 14:37:47', '2019-09-16 14:37:47', '0', '');
INSERT INTO `t_sw_period` VALUES ('47253ca743eb4fc48b0145611c8edee0', 'C90', 'cb7f09bdb0ef4174abd446d6c1e7745b', 90, 50.0000, 1.0000, 0.0300, '', '', '', '2019-09-16 14:38:04', '2019-09-16 14:38:04', '0', '');
INSERT INTO `t_sw_period` VALUES ('e45d0de4511d4f1ca6a3f4e8b344d518', 'A30', 'cb7f09bdb0ef4174abd446d6c1e7745b', 30, 50.0000, 1.0000, 0.0150, '', '', '', '2019-09-16 14:37:27', '2019-09-16 14:37:27', '0', '');

-- ----------------------------
-- Table structure for t_sw_period_user
-- ----------------------------
DROP TABLE IF EXISTS `t_sw_period_user`;
CREATE TABLE `t_sw_period_user`  (
  `tid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ID',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户ID',
  `period_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '定币金ID',
  `release_time` datetime(0) NULL DEFAULT NULL COMMENT '释放时间',
  `status` int(1) NULL DEFAULT NULL COMMENT '状态，0-正常，1-已释放完',
  `ex1` double(20, 8) NULL DEFAULT NULL COMMENT '认购金额',
  `ex2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ex2',
  `ex3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ex3',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '0为可用,1为不可用',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '说明',
  PRIMARY KEY (`tid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户持有定币金表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_sw_principal
-- ----------------------------
DROP TABLE IF EXISTS `t_sw_principal`;
CREATE TABLE `t_sw_principal`  (
  `tid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `coin_type_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '币种id',
  `principal_num` double(20, 4) NULL DEFAULT NULL COMMENT '固币金额度',
  `reward_percent` double(20, 4) NULL DEFAULT NULL COMMENT '收益倍率',
  `contract_term` int(5) NULL DEFAULT NULL COMMENT '合约期限（天）',
  `charge_term` int(10) NULL DEFAULT NULL COMMENT '收取手续费期限（小时）',
  `charge_percent` double(20, 4) NULL DEFAULT NULL COMMENT '手续费比例',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '0为可用,1为不可用',
  `remark` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '说明',
  `ex1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ex1',
  `ex2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ex2',
  `ex3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ex3',
  PRIMARY KEY (`tid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '固币金表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sw_principal
-- ----------------------------
INSERT INTO `t_sw_principal` VALUES ('b13a5180bab94fa78a35f6fb629a4fdf', '1000固币金', 'cb7f09bdb0ef4174abd446d6c1e7745b', 1000.0000, 3.0000, 300, 24, 0.1000, '2019-09-16 14:36:01', '2019-09-16 14:36:01', '0', '', '', '', '');
INSERT INTO `t_sw_principal` VALUES ('b7b0032848e1427eb3f779ce0b061833', '5000固币金', 'cb7f09bdb0ef4174abd446d6c1e7745b', 5000.0000, 3.0000, 300, 24, 0.1000, '2019-09-20 10:11:21', '2019-09-20 10:11:21', '0', '', NULL, NULL, NULL);
INSERT INTO `t_sw_principal` VALUES ('fc85f4467bb941789891e1d3a977cbcb', '2000固币金', 'cb7f09bdb0ef4174abd446d6c1e7745b', 2000.0000, 3.0000, 300, 24, 0.1000, '2019-09-16 14:36:38', '2019-09-19 16:49:24', '0', '', '', '', '');

-- ----------------------------
-- Table structure for t_sw_principal_user
-- ----------------------------
DROP TABLE IF EXISTS `t_sw_principal_user`;
CREATE TABLE `t_sw_principal_user`  (
  `tid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ID',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `principal_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固币金id',
  `left_term` int(5) NULL DEFAULT NULL COMMENT '剩余合约期限（天）',
  `left_num` double(20, 4) NULL DEFAULT NULL COMMENT '剩余金额',
  `total_num` double(20, 4) NULL DEFAULT NULL COMMENT '总金额',
  `status` int(1) NULL DEFAULT NULL COMMENT '状态，0-正常，1-已释放完',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '0为可用,1为不可用',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '说明',
  `ex1` datetime(0) NULL DEFAULT NULL COMMENT '计时时间',
  `ex2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ex2',
  `ex3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ex3',
  PRIMARY KEY (`tid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户持有固币金表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sw_principal_user
-- ----------------------------
INSERT INTO `t_sw_principal_user` VALUES ('7181b3c95de241488f18e8505f92a17b', 104428, 'b7b0032848e1427eb3f779ce0b061833', 297, 13500.0000, 15000.0000, 0, '2019-09-26 20:01:14', '2019-09-29 20:02:00', '0', NULL, '2019-09-29 20:01:14', NULL, NULL);
INSERT INTO `t_sw_principal_user` VALUES ('a4496f102dcb4fdaa46ef0f4dfcd3741', 104427, 'b13a5180bab94fa78a35f6fb629a4fdf', 298, 2980.0000, 3000.0000, 0, '2019-09-27 14:21:26', '2019-09-29 14:50:00', '0', NULL, '2019-09-29 14:21:26', NULL, NULL);
INSERT INTO `t_sw_principal_user` VALUES ('c9fa70dd07e34767ae669febd53f1b05', 104429, 'b13a5180bab94fa78a35f6fb629a4fdf', 298, 2400.0000, 3000.0000, 0, '2019-09-27 17:22:40', '2019-09-29 17:24:00', '0', NULL, '2019-09-29 17:22:40', NULL, NULL);

-- ----------------------------
-- Table structure for t_sw_release_record
-- ----------------------------
DROP TABLE IF EXISTS `t_sw_release_record`;
CREATE TABLE `t_sw_release_record`  (
  `tid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ID',
  `target_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '释放目标项目id',
  `amount` double(20, 4) NULL DEFAULT NULL COMMENT '释放金额',
  `cause_type` int(2) NULL DEFAULT NULL COMMENT '导致释放的方式，1-自然释放，2-活币金释放，3-定币金释放',
  `cause_user_id` int(11) NULL DEFAULT NULL COMMENT '导致释放的用户ID',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标记',
  `ex1` int(11) NULL DEFAULT NULL COMMENT '释放目标类型，1-固币金，2-优币金，3-升币金',
  `ex2` int(11) NULL DEFAULT NULL COMMENT '释放目标用户id',
  `ex3` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '导致释放的项目id',
  PRIMARY KEY (`tid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '释放记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sw_release_record
-- ----------------------------
INSERT INTO `t_sw_release_record` VALUES ('1388baafd1f8406386a211ad1a2d1bd5', 'a4496f102dcb4fdaa46ef0f4dfcd3741', 10.0000, 2, 104427, NULL, '2019-09-28 14:50:00', '2019-09-28 14:50:00', '0', 1, 104427, '247d709d30aa4d5380c142673962c05e');
INSERT INTO `t_sw_release_record` VALUES ('3c3d6d09bc654614bef267915954208f', 'a4496f102dcb4fdaa46ef0f4dfcd3741', 10.0000, 2, 104427, NULL, '2019-09-29 14:50:00', '2019-09-29 14:50:00', '0', 1, 104427, '247d709d30aa4d5380c142673962c05e');
INSERT INTO `t_sw_release_record` VALUES ('4dc1f0bef9664951a14a7b0d610c94ac', 'c9fa70dd07e34767ae669febd53f1b05', 300.0000, 2, 104429, NULL, '2019-09-29 17:24:00', '2019-09-29 17:24:00', '0', 1, 104429, '88ecdfc2ee7a43408016a72ce0ff0ae1');
INSERT INTO `t_sw_release_record` VALUES ('690f82a6370441228d31528d28b2612c', '7181b3c95de241488f18e8505f92a17b', 1500.0000, 2, 104428, NULL, '2019-09-27 20:07:00', '2019-09-27 20:07:00', '0', 1, 104428, '03c6c0d2b93546ff8c045bedfd44bbab');
INSERT INTO `t_sw_release_record` VALUES ('6af557274d7d44c9b8974449d87dda15', 'c9fa70dd07e34767ae669febd53f1b05', 300.0000, 2, 104429, NULL, '2019-09-28 17:24:00', '2019-09-28 17:24:00', '0', 1, 104429, '88ecdfc2ee7a43408016a72ce0ff0ae1');

-- ----------------------------
-- Table structure for t_sw_reward_rule
-- ----------------------------
DROP TABLE IF EXISTS `t_sw_reward_rule`;
CREATE TABLE `t_sw_reward_rule`  (
  `tid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编码',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规则名称',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态，0-可用，1-不可用',
  `type` int(1) NULL DEFAULT NULL COMMENT '计量方式，1-比例，2-数值',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标识',
  PRIMARY KEY (`tid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '推荐人奖励规则表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sw_reward_rule
-- ----------------------------
INSERT INTO `t_sw_reward_rule` VALUES ('b13605e5b5c942ad9fec59b4ff8e0d7f', 'IVDMX6', '层级加速规则', '0', 1, '', '2019-09-17 16:51:03', '2019-09-17 16:51:03', '0');

-- ----------------------------
-- Table structure for t_sw_rule_detail
-- ----------------------------
DROP TABLE IF EXISTS `t_sw_rule_detail`;
CREATE TABLE `t_sw_rule_detail`  (
  `tid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `rule_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规则id',
  `level` int(10) NULL DEFAULT NULL COMMENT '层级',
  `type` int(1) NULL DEFAULT NULL COMMENT '计量方式，1-百分比，2-数量(弃用，计量方式使用reward_rule表中的字段)',
  `value` double(65, 8) NULL DEFAULT NULL COMMENT '计量值',
  `ex1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ex1',
  `ex2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ex2',
  `ex3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ex3',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标识',
  PRIMARY KEY (`tid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '推荐人奖励规则详情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sw_rule_detail
-- ----------------------------
INSERT INTO `t_sw_rule_detail` VALUES ('7b57f8c2fea8451a94f5a1dfc90383d8', 'b13605e5b5c942ad9fec59b4ff8e0d7f', 3, NULL, 0.10000000, NULL, NULL, NULL, '2019-09-18 11:06:01', '2019-09-18 11:06:01', '0');
INSERT INTO `t_sw_rule_detail` VALUES ('89cc53dc1e264fd68af428a216379a7b', 'b13605e5b5c942ad9fec59b4ff8e0d7f', 1, NULL, 0.10000000, NULL, NULL, NULL, '2019-09-17 16:51:17', '2019-09-18 11:05:36', '0');
INSERT INTO `t_sw_rule_detail` VALUES ('f83751f5309b4a4bb25e1d0d9cb23f7a', 'b13605e5b5c942ad9fec59b4ff8e0d7f', 2, NULL, 0.05000000, NULL, NULL, NULL, '2019-09-17 16:51:50', '2019-09-18 11:05:52', '0');

-- ----------------------------
-- Table structure for t_sw_team_info
-- ----------------------------
DROP TABLE IF EXISTS `t_sw_team_info`;
CREATE TABLE `t_sw_team_info`  (
  `tid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '社群名称',
  `pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '社群图标',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容',
  `ex1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ex1',
  `ex2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ex2',
  `ex3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ex3',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`tid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '社群表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sw_team_info
-- ----------------------------
INSERT INTO `t_sw_team_info` VALUES ('1', '微信公众号', '/files/344baa02-1dae-4604-a6bf-70571aec0bf4.png', 'e27592285', NULL, NULL, NULL, '2019-09-10 11:32:46', '2019-09-10 11:32:48', '0');
INSERT INTO `t_sw_team_info` VALUES ('2', 'Facebook', '/files/c0d377e5-338c-4765-b5d2-153643b42e4e.png', '1523655', NULL, NULL, NULL, '2019-09-10 11:32:46', '2019-09-10 11:32:46', '0');
INSERT INTO `t_sw_team_info` VALUES ('3', '电报群', '/files/347993b5-7aaa-485a-9caa-1fb0fa0efa5c.png', NULL, NULL, NULL, NULL, '2019-09-10 11:32:46', '2019-09-10 11:32:46', '0');
INSERT INTO `t_sw_team_info` VALUES ('4', 'Github', '/files/17ac7aee-a4e3-4296-a409-3f5f5bd98da6.png', NULL, NULL, NULL, NULL, '2019-09-10 11:32:46', '2019-09-10 11:32:46', '0');
INSERT INTO `t_sw_team_info` VALUES ('5', 'Twitter', '/files/d2f0bee7-e101-4385-af3e-0272fdd60e68.png', NULL, NULL, NULL, NULL, '2019-09-10 11:34:12', '2019-09-10 11:34:12', '0');

-- ----------------------------
-- Table structure for t_sw_transfer_record
-- ----------------------------
DROP TABLE IF EXISTS `t_sw_transfer_record`;
CREATE TABLE `t_sw_transfer_record`  (
  `tid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `payer` int(11) NULL DEFAULT NULL COMMENT '付款方',
  `receiver` int(11) NULL DEFAULT NULL COMMENT '收款方',
  `coin_type_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '币种id',
  `amount` double(20, 4) NULL DEFAULT NULL COMMENT '交易金额',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标记',
  `ex1` int(1) NULL DEFAULT NULL COMMENT '类型，1-转账，2-收款',
  `ex2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ex2',
  `ex3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ex3',
  PRIMARY KEY (`tid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '转账记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_sw_user_basic
-- ----------------------------
DROP TABLE IF EXISTS `t_sw_user_basic`;
CREATE TABLE `t_sw_user_basic`  (
  `tid` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `recom_id` int(11) NULL DEFAULT NULL COMMENT '推荐人编号',
  `mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `login_pass` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录密码',
  `high_pass` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '高级密码',
  `area_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机区域编号',
  `user_type` tinyint(4) NULL DEFAULT NULL COMMENT '用户类型 0-普通用户，1-布道者，2-合伙人',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '注册时间',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '删除标识',
  `ex1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ex1',
  `ex2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ex2',
  `ex3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ex3',
  `ex4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ex4',
  `ex5` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ex5',
  PRIMARY KEY (`tid`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 104447 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户基本表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sw_user_basic
-- ----------------------------
INSERT INTO `t_sw_user_basic` VALUES (1, 'system', 0, '888888', 'aaa@aa.com', '12345678', '12345678', '86', 0, '2019-08-24 14:07:36', '2019-08-24 14:07:38', '0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sw_user_basic` VALUES (104427, 'sz104427', 1, NULL, '1145308642@qq.com', '97facb2520dae6c25575a9c3de474ef5', '97facb2520dae6c25575a9c3de474ef5', NULL, 0, '2019-09-26 14:56:32', '2019-09-26 14:56:32', '0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sw_user_basic` VALUES (104428, 'sz104428', 1, NULL, '112217888@qq.com', '97facb2520dae6c25575a9c3de474ef5', '97facb2520dae6c25575a9c3de474ef5', NULL, 0, '2019-09-26 16:06:19', '2019-09-26 16:06:19', '0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sw_user_basic` VALUES (104429, 'sz104429', 1, NULL, '953751759@qq.com', '97facb2520dae6c25575a9c3de474ef5', '97facb2520dae6c25575a9c3de474ef5', NULL, 0, '2019-09-26 17:19:00', '2019-09-26 17:19:00', '0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sw_user_basic` VALUES (104430, 'sz104430', 1, NULL, '27592285@qq.com', '2cea958616ebafce8f5a3a92aef5873c', NULL, NULL, 0, '2019-09-27 14:41:05', '2019-09-27 14:41:05', '0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sw_user_basic` VALUES (104431, 'sz104431', 104430, NULL, '1143178854@qq.com', '2cea958616ebafce8f5a3a92aef5873c', NULL, NULL, 0, '2019-09-27 14:48:05', '2019-09-27 14:48:05', '0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sw_user_basic` VALUES (104435, 'sz104435', 104427, NULL, 'test1@qq.com', '97facb2520dae6c25575a9c3de474ef5', NULL, NULL, 0, '2019-09-27 15:34:29', '2019-09-27 15:34:29', '0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sw_user_basic` VALUES (104436, 'sz104436', 104427, NULL, 'test@qq.com', '97facb2520dae6c25575a9c3de474ef5', NULL, NULL, 0, '2019-09-27 15:40:21', '2019-09-27 15:40:21', '0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sw_user_basic` VALUES (104437, 'sz104437', 1, NULL, 'test2@qq.com', '97facb2520dae6c25575a9c3de474ef5', NULL, NULL, 0, '2019-09-27 15:47:31', '2019-09-27 15:47:31', '0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sw_user_basic` VALUES (104438, 'sz104438', 1, NULL, 'hgdfg@qq.com', '2cea958616ebafce8f5a3a92aef5873c', NULL, NULL, 0, '2019-09-27 16:42:49', '2019-09-27 16:42:49', '0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sw_user_basic` VALUES (104440, 'sz104440', 1, NULL, 'jjbph@qq.com', '2cea958616ebafce8f5a3a92aef5873c', NULL, NULL, 0, '2019-09-27 16:46:13', '2019-09-27 16:46:13', '0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sw_user_basic` VALUES (104441, 'sz104441', 1, NULL, '7hhhhb@qq.com', '2cea958616ebafce8f5a3a92aef5873c', NULL, NULL, 0, '2019-09-27 16:48:33', '2019-09-27 16:48:33', '0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sw_user_basic` VALUES (104442, 'sz104442', 1, NULL, 'ygvh@qq.com', '2cea958616ebafce8f5a3a92aef5873c', NULL, NULL, 0, '2019-09-27 16:51:04', '2019-09-27 16:51:04', '0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sw_user_basic` VALUES (104446, 'sz104446', 1, NULL, '953751758@qq.com', '97facb2520dae6c25575a9c3de474ef5', '97facb2520dae6c25575a9c3de474ef5', NULL, 1, '2019-09-29 10:16:20', '2019-09-29 10:16:20', '0', NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for t_sw_wallets
-- ----------------------------
DROP TABLE IF EXISTS `t_sw_wallets`;
CREATE TABLE `t_sw_wallets`  (
  `tid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `coin_type_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '币种id',
  `currency` decimal(20, 4) NULL DEFAULT NULL COMMENT '币的总量余额',
  `is_active` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '账户是否激活0为激活可用，1为不可使用',
  `frozen_amount` decimal(20, 4) NULL DEFAULT NULL COMMENT '冻结金额',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标记',
  `ex1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ex1',
  `ex2` decimal(65, 4) NULL DEFAULT NULL COMMENT 'ex2',
  `ex3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ex3',
  `ex4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ex4',
  PRIMARY KEY (`tid`) USING BTREE,
  INDEX `union`(`user_id`, `coin_type_id`) USING BTREE,
  INDEX `union_index`(`user_id`, `coin_type_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '钱包表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sw_wallets
-- ----------------------------
INSERT INTO `t_sw_wallets` VALUES ('081f3db5853c4ef584e9f4e68e9552a9', 104437, 'cb7f09bdb0ef4174abd446d6c1e7745b', 0.0000, '0', 0.0000, '2019-09-27 15:48:54', '2019-09-27 15:48:54', '0', NULL, NULL, NULL, NULL);
INSERT INTO `t_sw_wallets` VALUES ('08725c0d187744859884026965cac1b1', 104430, 'cb7f09bdb0ef4174abd446d6c1e7745b', 0.0000, '0', 0.0000, '2019-09-27 14:41:17', '2019-09-27 14:41:17', '0', NULL, NULL, NULL, NULL);
INSERT INTO `t_sw_wallets` VALUES ('0b0f4b3ab38c46a7bed1f5ce2efe678d', 104436, '737d784555164db2862fd74361a97165', 0.0000, '0', 0.0000, '2019-09-27 15:40:41', '2019-09-27 15:40:41', '0', NULL, NULL, NULL, NULL);
INSERT INTO `t_sw_wallets` VALUES ('29f9f327c4b8448cadef3443a17ec21e', 104436, 'cb7f09bdb0ef4174abd446d6c1e7745b', 0.0000, '0', 0.0000, '2019-09-27 15:40:41', '2019-09-27 15:40:41', '0', NULL, NULL, NULL, NULL);
INSERT INTO `t_sw_wallets` VALUES ('43fc523e838a4819b17d968bd860b81b', 104428, 'cb7f09bdb0ef4174abd446d6c1e7745b', 1500.0000, '0', 0.0000, '2019-09-26 16:06:19', '2019-09-29 15:23:00', '0', NULL, NULL, NULL, NULL);
INSERT INTO `t_sw_wallets` VALUES ('45b7b307d1a643c1b861845a92654f8a', 104446, '737d784555164db2862fd74361a97165', 0.0000, '0', 0.0000, '2019-09-29 10:16:28', '2019-09-29 10:16:28', '0', NULL, NULL, NULL, NULL);
INSERT INTO `t_sw_wallets` VALUES ('57e6be2d450842b385a7ae35730b0fd0', 104429, '737d784555164db2862fd74361a97165', 0.0000, '0', 0.0000, '2019-09-26 17:19:01', '2019-09-26 17:19:01', '0', NULL, NULL, NULL, NULL);
INSERT INTO `t_sw_wallets` VALUES ('5d57b84b7fea4ec49549515d318151b8', 104440, 'cb7f09bdb0ef4174abd446d6c1e7745b', 0.0000, '0', 0.0000, '2019-09-27 16:46:14', '2019-09-27 16:46:14', '0', NULL, NULL, NULL, NULL);
INSERT INTO `t_sw_wallets` VALUES ('65066455d44e46f18145f9b8b5c4f51e', 104435, 'cb7f09bdb0ef4174abd446d6c1e7745b', 0.0000, '0', 0.0000, '2019-09-27 15:37:39', '2019-09-27 15:37:39', '0', NULL, NULL, NULL, NULL);
INSERT INTO `t_sw_wallets` VALUES ('71d2e729a12c4c2192fff35448147d7f', 104438, 'cb7f09bdb0ef4174abd446d6c1e7745b', 0.0000, '0', 0.0000, '2019-09-27 16:43:50', '2019-09-27 16:43:50', '0', NULL, NULL, NULL, NULL);
INSERT INTO `t_sw_wallets` VALUES ('74871f0a9ec045238c5dd1ee1d05bfc7', 104442, '737d784555164db2862fd74361a97165', 0.0000, '0', 0.0000, '2019-09-27 16:51:48', '2019-09-27 16:51:48', '0', NULL, NULL, NULL, NULL);
INSERT INTO `t_sw_wallets` VALUES ('796808fbba97461087c1d000312abd9c', 104437, '737d784555164db2862fd74361a97165', 0.0000, '0', 0.0000, '2019-09-27 15:48:54', '2019-09-27 15:48:54', '0', NULL, NULL, NULL, NULL);
INSERT INTO `t_sw_wallets` VALUES ('972c8424d87f408294d31c8af939bad5', 104427, 'cb7f09bdb0ef4174abd446d6c1e7745b', 100.0000, '0', 60.0000, '2019-09-26 14:56:33', '2019-09-29 14:50:00', '0', NULL, NULL, NULL, NULL);
INSERT INTO `t_sw_wallets` VALUES ('9861df99106c419bae7d95e67a5ca78b', 104440, '737d784555164db2862fd74361a97165', 0.0000, '0', 0.0000, '2019-09-27 16:46:14', '2019-09-27 16:46:14', '0', NULL, NULL, NULL, NULL);
INSERT INTO `t_sw_wallets` VALUES ('ab95910760184f2e8313e84998914938', 104431, 'cb7f09bdb0ef4174abd446d6c1e7745b', 0.0000, '0', 0.0000, '2019-09-27 14:48:26', '2019-09-27 14:48:26', '0', NULL, NULL, NULL, NULL);
INSERT INTO `t_sw_wallets` VALUES ('ac58594522124391a68ec329fd5e1562', 104442, 'cb7f09bdb0ef4174abd446d6c1e7745b', 0.0000, '0', 0.0000, '2019-09-27 16:51:48', '2019-09-27 16:51:48', '0', NULL, NULL, NULL, NULL);
INSERT INTO `t_sw_wallets` VALUES ('b3a8a78289c845a3863f6c673b0ff26b', 104430, '737d784555164db2862fd74361a97165', 0.0000, '0', 0.0000, '2019-09-27 14:41:17', '2019-09-27 14:41:17', '0', NULL, NULL, NULL, NULL);
INSERT INTO `t_sw_wallets` VALUES ('b3f4dcba238e46bb8b096f42b5b99aab', 104446, 'cb7f09bdb0ef4174abd446d6c1e7745b', 0.0000, '0', 0.0000, '2019-09-29 10:16:28', '2019-09-29 10:19:07', '0', NULL, NULL, NULL, NULL);
INSERT INTO `t_sw_wallets` VALUES ('b3f8baf19a644591a08e4ff54c7f383e', 104435, '737d784555164db2862fd74361a97165', 0.0000, '0', 0.0000, '2019-09-27 15:37:39', '2019-09-27 15:37:39', '0', NULL, NULL, NULL, NULL);
INSERT INTO `t_sw_wallets` VALUES ('b9dc6e7961df4547baf8fd471b3e7f20', 104438, '737d784555164db2862fd74361a97165', 0.0000, '0', 0.0000, '2019-09-27 16:43:50', '2019-09-27 16:43:50', '0', NULL, NULL, NULL, NULL);
INSERT INTO `t_sw_wallets` VALUES ('ba70d7b96d7c4aee96d36a9f86682592', 104428, '737d784555164db2862fd74361a97165', 0.0000, '0', 0.0000, '2019-09-26 16:06:19', '2019-09-26 19:59:35', '0', NULL, NULL, NULL, NULL);
INSERT INTO `t_sw_wallets` VALUES ('c00a851499bd46d48e191ad853250664', 1, 'cb7f09bdb0ef4174abd446d6c1e7745b', 100000.0000, '0', 0.0000, '2019-09-16 19:32:19', '2019-09-17 10:17:36', '0', '', NULL, '', '');
INSERT INTO `t_sw_wallets` VALUES ('c5895919dbd440289ef3087e86323554', 1, '737d784555164db2862fd74361a97165', 100000.0000, '0', 0.0000, '2019-09-16 19:18:49', '2019-09-16 19:18:49', '0', NULL, NULL, NULL, NULL);
INSERT INTO `t_sw_wallets` VALUES ('c715e4b219e9479e81ed04b91dfb6974', 104431, '737d784555164db2862fd74361a97165', 0.0000, '0', 0.0000, '2019-09-27 14:48:26', '2019-09-27 14:48:26', '0', NULL, NULL, NULL, NULL);
INSERT INTO `t_sw_wallets` VALUES ('c7fcefd3e3724094b8a474bb933d9c79', 104441, 'cb7f09bdb0ef4174abd446d6c1e7745b', 0.0000, '0', 0.0000, '2019-09-27 16:49:00', '2019-09-27 16:49:00', '0', NULL, NULL, NULL, NULL);
INSERT INTO `t_sw_wallets` VALUES ('d72917f284b743f7b44e9da8edab8c35', 104427, '737d784555164db2862fd74361a97165', 0.0000, '0', 0.0000, '2019-09-26 14:56:33', '2019-09-26 14:56:33', '0', NULL, NULL, NULL, NULL);
INSERT INTO `t_sw_wallets` VALUES ('e484a5d5e3844620be48fa74f4465ced', 104429, 'cb7f09bdb0ef4174abd446d6c1e7745b', 9969600.0000, '0', 0.0000, '2019-09-26 17:19:01', '2019-09-29 17:24:00', '0', NULL, NULL, NULL, NULL);
INSERT INTO `t_sw_wallets` VALUES ('e63f1d18eab341e69ad5deffee6d3db9', 104441, '737d784555164db2862fd74361a97165', 0.0000, '0', 0.0000, '2019-09-27 16:49:00', '2019-09-27 16:49:00', '0', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for t_sw_withdraw_address
-- ----------------------------
DROP TABLE IF EXISTS `t_sw_withdraw_address`;
CREATE TABLE `t_sw_withdraw_address`  (
  `tid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户ID',
  `coin_type_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '币种ID',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '提币地址',
  `type` tinyint(4) NULL DEFAULT NULL COMMENT '类型 1-omin 2-erc20',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `ex3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '扩展3',
  `ex4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '扩展4',
  `ex5` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '扩展5',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '注册时间',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '删除标识',
  PRIMARY KEY (`tid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '提现地址' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sw_withdraw_address
-- ----------------------------
INSERT INTO `t_sw_withdraw_address` VALUES ('a6c2ea615f5f43868a98ea107c3f96dc', 104427, NULL, '1', NULL, '2', '1', NULL, NULL, '2019-09-27 16:23:09', '2019-09-27 16:27:26', '0');

-- ----------------------------
-- Table structure for t_sw_withlog
-- ----------------------------
DROP TABLE IF EXISTS `t_sw_withlog`;
CREATE TABLE `t_sw_withlog`  (
  `tid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `coin_type_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '币种id',
  `amount` decimal(20, 4) NULL DEFAULT NULL COMMENT '数量',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '提币地址',
  `status` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态 0-确认中 1-已完成 2-提币失败',
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '审核信息',
  `txid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区块链交易id',
  `fee` decimal(20, 4) NULL DEFAULT NULL COMMENT '提币手续费',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标记',
  `ex2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核状态，0-待审核，1-审核通过，2-审核拒绝',
  `ex4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'memo',
  `ex5` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ex5',
  PRIMARY KEY (`tid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '提币记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sw_withlog
-- ----------------------------
INSERT INTO `t_sw_withlog` VALUES ('482b5722adc6471d9309ddb5c6281e66', 104427, 'cb7f09bdb0ef4174abd446d6c1e7745b', 10.0000, 'liuleiliulei', '2', '{\"code\":1,\"message\":\"cleos timeout and exit\"}', NULL, 5.0000, '2019-09-27 16:54:09', '2019-09-27 16:54:09', '0', '1', '', NULL);
INSERT INTO `t_sw_withlog` VALUES ('600c410539594fbdbcbfa51b6adeee1c', 104427, 'cb7f09bdb0ef4174abd446d6c1e7745b', 7.0000, 'heydamjxgige', '1', NULL, '4f3061f4d1e276215eb24db9e99a9b9ccab5c9d04a12a9873a52bbc4cd923c4d', 5.0000, '2019-09-26 19:55:50', '2019-09-26 20:16:24', '0', '1', '', NULL);
INSERT INTO `t_sw_withlog` VALUES ('c630cfede7e7446ca876b0b474efe90a', 104427, 'cb7f09bdb0ef4174abd446d6c1e7745b', 7.0000, 'heydamjxgige', '2', '{\"code\":1,\"message\":\"\\u001B[31mError 3050003: eosio_assert_message assertion failure\\u001B[0m\\n\\u001B[33mError Details:\\nassertion failure with message: Not meeting the minimum amount\\u001B[0m\"}', NULL, 5.0000, '2019-09-26 19:48:14', '2019-09-26 19:48:14', '0', '1', '', NULL);
INSERT INTO `t_sw_withlog` VALUES ('e004ce78f85e45028d6aa15bbb7b02f7', 104427, 'cb7f09bdb0ef4174abd446d6c1e7745b', 10.0000, 'liuleiliulei', '2', '{\"code\":1,\"message\":\"cleos timeout and exit\"}', '24b4889587987f2bc0c35348eeb8b8c32cc557889115b820b6d1ab985bc6ee45', 5.0000, '2019-09-27 15:58:52', '2019-09-27 15:58:52', '0', '1', '', NULL);

-- ----------------------------
-- Table structure for t_sys_config
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_config`;
CREATE TABLE `t_sys_config`  (
  `tid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `field_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属性名称',
  `field_value` varchar(10000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属性值',
  `filed_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '属性类型',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除状态0为可用',
  PRIMARY KEY (`tid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sys_config
-- ----------------------------
INSERT INTO `t_sys_config` VALUES ('002', 'IndexConfig-News', '新闻', 'IndexConfig', '2018-09-06 14:02:17', '2018-09-06 14:02:17', '0');
INSERT INTO `t_sys_config` VALUES ('003', 'IndexConfig-AboutUs', '为什么选择我们\n我们不是单一的企业，我们的服务涵盖了整个金融范围。不管是传统金融业还是新兴互联网金融。', 'IndexConfig-', '2018-09-06 14:02:17', '2018-09-11 15:03:43', '0');
INSERT INTO `t_sys_config` VALUES ('004', 'IndexConfig-IsEnableWaiXinImg', '0', 'IndexConfig-', '2018-09-06 14:02:17', '2018-09-11 16:31:39', '0');
INSERT INTO `t_sys_config` VALUES ('005', 'IndexConfig-PublicNumberImg', '/files/7373920f-0caf-4c01-9f65-873f432586ab.png', 'IndexConfig-', '2018-09-06 14:02:17', '2018-09-11 16:31:39', '0');
INSERT INTO `t_sys_config` VALUES ('010b892a9195431a9e1d2d0442b14042', 'SettlementCommonConfig-PushUserNumberCoinNum', '', 'SettlementCommonConfig-', '2019-09-10 16:17:15', '2019-09-26 14:54:48', '0');
INSERT INTO `t_sys_config` VALUES ('02c8c69f39414509b8ee0582f5ba528b', 'IndexConfig-IndexButtonName', '释放核心区块链价值', 'IndexConfig-', '2018-09-11 14:51:06', '2018-09-20 10:02:20', '0');
INSERT INTO `t_sys_config` VALUES ('06dd65df6a774f199636a0b4ba6b653d', 'SettlementCommonConfig-ShopReturnTotalJson', '', 'SettlementCommonConfig-', '2019-09-10 16:17:15', '2019-09-26 14:54:47', '0');
INSERT INTO `t_sys_config` VALUES ('06e877df6e74407cb70f9b6bd343a554', 'SettlementCommonConfig-SecondLevelDay', '', 'SettlementCommonConfig-', '2019-09-10 16:17:15', '2019-09-26 14:54:47', '0');
INSERT INTO `t_sys_config` VALUES ('07569e622bd642069a82f9bfd3172bca', 'SettlementCommonConfig-FirstShareLevelBorder', '', 'SettlementCommonConfig-', '2019-09-10 16:17:15', '2019-09-26 14:54:48', '0');
INSERT INTO `t_sys_config` VALUES ('0783b5ab245f481da9cd58b4df470985', 'IndexConfig-EnglishImg', '/files/46350ad7-9cb5-446c-9d5c-87ea2ca164e5.png', 'IndexConfig-', '2018-09-11 14:43:18', '2018-09-20 10:02:20', '0');
INSERT INTO `t_sys_config` VALUES ('0c15c646d0864adf921b10ff6ae65e58', 'CommonConfig-Email', '285646393@qq.com', 'CommonConfig-', '2018-09-11 11:25:05', '2018-09-19 16:00:35', '0');
INSERT INTO `t_sys_config` VALUES ('0f7499a4e0b54757adf15bebb91053d1', 'SettlementCommonConfig-CnyExchangeRyb', '0', 'SettlementCommonConfig-', '2018-12-14 22:51:42', '2019-02-12 20:07:19', '0');
INSERT INTO `t_sys_config` VALUES ('11d61c8f92ae4b959efc158e385f1fcf', 'CommonConfig-AboutUs', '', 'CommonConfig-', '2018-09-11 11:25:05', '2018-09-11 15:33:28', '0');
INSERT INTO `t_sys_config` VALUES ('12e0ef9eb62f45a0b01e41c967a941eb', 'SettlementCommonConfig-TransferTransaction', '0', 'SettlementCommonConfig-', '2018-11-23 17:11:44', '2019-02-12 20:07:19', '0');
INSERT INTO `t_sys_config` VALUES ('13389682a3af47569fe9ba43580d2351', 'SettlementCommonConfig-RYHExchangeProportion', '2.8', 'SettlementCommonConfig-', '2018-10-18 11:57:04', '2019-01-20 11:03:11', '0');
INSERT INTO `t_sys_config` VALUES ('13e9af39f0174860a6b03f8aa7c5ee54', 'IndexConfig-AboutUSSixText', '综合服务', 'IndexConfig-', '2018-09-11 18:20:41', '2018-09-20 10:02:20', '0');
INSERT INTO `t_sys_config` VALUES ('1993937b83b74c028b3636d267cb93ae', 'IndexConfig-AboutUSThreeImage', '/files/c9aba902-e954-4831-a0db-62ec1d5b9913.jpg', 'IndexConfig-', '2018-09-11 18:20:41', '2018-09-20 10:02:20', '0');
INSERT INTO `t_sys_config` VALUES ('1d50daca5ec643038b89ac5f5c8bf446', 'SettlementCommonConfig-After21DayMultipleInner', '', 'SettlementCommonConfig-', '2019-09-10 16:17:15', '2019-09-26 14:54:47', '0');
INSERT INTO `t_sys_config` VALUES ('1f26b73fe81f4ab9ac96b265c6233924', 'SettlementCommonConfig-ShopNumOfL1', '', 'SettlementCommonConfig-', '2019-09-10 16:17:15', '2019-09-26 14:54:47', '0');
INSERT INTO `t_sys_config` VALUES ('20fe57b15ae1480c83c924f042a23e11', 'IndexConfig-CoreTwoTwoText', '查看更多', 'IndexConfig-', '2018-09-11 16:31:39', '2018-09-20 10:02:20', '0');
INSERT INTO `t_sys_config` VALUES ('27021083071e49a6bc9ded0584faa907', 'SettlementCommonConfig-PackageRuleJson', '', 'SettlementCommonConfig-', '2019-09-10 16:17:15', '2019-09-26 14:54:48', '0');
INSERT INTO `t_sys_config` VALUES ('271ab523a0cb49d8b7d791bf33d6a903', 'IndexConfig-CoreThreeOneText', '股权投资', 'IndexConfig-', '2018-09-11 16:31:39', '2018-09-20 10:02:20', '0');
INSERT INTO `t_sys_config` VALUES ('27bc566e5b78459995022b0462e40a4f', 'IndexConfig-Core', '核心业务', 'IndexConfig-', '2018-09-06 20:39:33', '2018-09-20 10:02:20', '0');
INSERT INTO `t_sys_config` VALUES ('283b9fe7525a41e8bedbe8d2fe9f416f', 'AboutUsConfig-AboutUSTwoName', '发展历程', 'AboutUsConfig-', '2018-09-11 18:06:36', '2018-09-19 19:03:46', '0');
INSERT INTO `t_sys_config` VALUES ('2baf298fb31a463fa969518d520d9648', 'IndexConfig-CoreOneImage', '/files/4b58a678-2a98-4205-a61a-b756f38e2df2.jpg', 'IndexConfig-', '2018-09-11 16:31:39', '2018-09-20 10:02:20', '0');
INSERT INTO `t_sys_config` VALUES ('2bd8be41c6d4402eb534c0a44c32ec53', 'SettlementCommonConfig-MonthPackageIncidentalCoin', '', 'SettlementCommonConfig-', '2019-09-10 16:17:15', '2019-09-26 14:54:48', '0');
INSERT INTO `t_sys_config` VALUES ('2d069fa379604ba18a74ed9a98f8d17f', 'CommonConfig-Mobile', '0755-83256505', 'CommonConfig-', '2018-09-11 11:25:05', '2018-09-19 16:00:35', '0');
INSERT INTO `t_sys_config` VALUES ('2e4aec3f729c4b6fafd4990389a73256', 'IndexConfig-CoreOneOneText', '产品配置', 'IndexConfig-', '2018-09-11 16:31:39', '2018-09-20 10:02:20', '0');
INSERT INTO `t_sys_config` VALUES ('2ec87e3b45284402b6682817202144bb', 'TeamConfig-TeamOneText', '集团拥有世界顶级金融经济团队。来自中国，瑞典，德国，美国。香港的顶级金融人才。随着区块链研究的深入，新加坡和中国数家顶级金融机构、风险基金高调宣布参与中盈汇区块链的应用开发项目。', 'TeamConfig-', '2018-09-11 17:36:15', '2018-09-13 19:54:40', '0');
INSERT INTO `t_sys_config` VALUES ('2f39dc2d9e854a0b9164c442b430477e', 'SettlementCommonConfig-TransferMall', '0', 'SettlementCommonConfig-', '2019-01-10 17:56:37', '2019-01-20 11:03:11', '0');
INSERT INTO `t_sys_config` VALUES ('306699bff74b43f8bb5a07d2b703b65f', 'IndexConfig-AboutUSFiveText', '卓越专业', 'IndexConfig-', '2018-09-11 18:20:41', '2018-09-20 10:02:20', '0');
INSERT INTO `t_sys_config` VALUES ('31fbb55f1ebb400aaae49c54977d15b6', 'SettlementCommonConfig-HoldProfitProportion', '50', 'SettlementCommonConfig-', '2018-10-18 11:57:04', '2019-01-20 11:03:11', '0');
INSERT INTO `t_sys_config` VALUES ('31fd7c675d9f4426ad7f297c7b9b42f0', 'SettlementCommonConfig-PushUserNumber', '', 'SettlementCommonConfig-', '2019-02-20 18:03:26', '2019-09-26 14:54:48', '0');
INSERT INTO `t_sys_config` VALUES ('324b531d992741bda50489cb775c7530', 'IndexConfig-CoreThreeImage', '/files/7c3af328-4f68-4b5b-827e-e28d7c6e0bf3.jpg', 'IndexConfig-', '2018-09-11 16:31:39', '2018-09-20 10:02:20', '0');
INSERT INTO `t_sys_config` VALUES ('367abd1b6b604125b790ecd56b7dc837', 'IndexConfig-AboutUSThreeText', '专业人才', 'IndexConfig-', '2018-09-11 18:20:41', '2018-09-20 10:02:20', '0');
INSERT INTO `t_sys_config` VALUES ('38481d7e087347e2b092c793325b7e73', 'IndexConfig-AboutUSFiveImage', '/files/1878b3b8-d203-4690-889e-bc43eac103f3.jpg', 'IndexConfig-', '2018-09-11 18:20:41', '2018-09-20 10:02:20', '0');
INSERT INTO `t_sys_config` VALUES ('38cdbf335ca54d788e25d3ece5efc6e2', 'IndexConfig-IndexAboutUSBecause', '我们不是单一的企业，我们的服务涵盖了整个金融范围。不管是传统金融业还是新兴互联网金融。', 'IndexConfig-', '2018-09-11 16:31:39', '2018-09-20 10:02:20', '0');
INSERT INTO `t_sys_config` VALUES ('3a60e3c33db24f05bbd2b1ddf75d5e2b', 'IndexConfig-AboutUSSixImage', '/files/17607132-4666-4628-a7b3-6aad79ad5549.jpg', 'IndexConfig-', '2018-09-11 18:20:41', '2018-09-20 10:02:20', '0');
INSERT INTO `t_sys_config` VALUES ('3a7c5e271aea452a8b4c081ec56663d6', 'AboutUsConfig-AboutUSOneName', '关于我们', 'AboutUsConfig-', '2018-09-11 18:06:36', '2018-09-19 19:03:46', '0');
INSERT INTO `t_sys_config` VALUES ('3aa8bf5fc7ec42adb623e120fca3b683', 'SettlementCommonConfig-ShareOf1288TargetCoin', '', 'SettlementCommonConfig-', '2019-09-10 16:17:15', '2019-09-26 14:54:48', '0');
INSERT INTO `t_sys_config` VALUES ('3ad1bbc5c2de49c2880ac13ef832558e', 'SettlementCommonConfig-BackWebsiteFullName', 'BBCT', 'SettlementCommonConfig-', '2019-02-20 18:03:26', '2019-09-26 14:54:48', '0');
INSERT INTO `t_sys_config` VALUES ('3e8796fa0cda4d839c2bdaf74815f84d', 'NewsConfig-AboutUSSmallTitle', '', 'NewsConfig-', '2018-09-14 09:59:27', '2018-09-19 16:28:35', '0');
INSERT INTO `t_sys_config` VALUES ('3e8c7da00e7c44e9bc3ff899f20a442b', 'SettlementCommonConfig-PushUserNumberCoin', '', 'SettlementCommonConfig-', '2019-09-10 16:17:15', '2019-09-26 14:54:47', '0');
INSERT INTO `t_sys_config` VALUES ('40aa9ce199534dbe8f03bb419b29eea7', 'IndexConfig-CoreOneTwoText', '查看更多', 'IndexConfig-', '2018-09-11 16:31:39', '2018-09-20 10:02:20', '0');
INSERT INTO `t_sys_config` VALUES ('4211a74a37eb40f5bc97625bb7c85d7f', 'SettlementCommonConfig-KbtToKb2Proportion', '', 'SettlementCommonConfig-', '2019-02-26 11:47:05', '2019-09-26 14:54:46', '0');
INSERT INTO `t_sys_config` VALUES ('427b99b6dd5b414386730a262f6ad3a3', 'IndexConfig-CoreTwoUrl', '/corebusiness.html', 'IndexConfig-', '2018-09-11 16:31:39', '2018-09-20 10:02:20', '0');
INSERT INTO `t_sys_config` VALUES ('4394560cb9b44815931a76b8ee40fd04', 'SettlementCommonConfig-SuperPackageRate', '', 'SettlementCommonConfig-', '2019-09-10 16:17:15', '2019-09-26 14:54:46', '0');
INSERT INTO `t_sys_config` VALUES ('44776765d11c464cadd90ffeb68c68a4', 'SettlementCommonConfig-UserRegGiveCoinTotalJson', '', 'SettlementCommonConfig-', '2019-02-20 18:14:18', '2019-09-26 14:54:47', '0');
INSERT INTO `t_sys_config` VALUES ('4477c3b28ab24581ae6361f1bacc429d', 'IndexConfig-AboutUSOneImage', '/files/b2cfee30-f075-4414-b087-15dc9771951a.jpg', 'IndexConfig-', '2018-09-11 18:20:41', '2018-09-20 10:02:20', '0');
INSERT INTO `t_sys_config` VALUES ('4782b9644d06472a9467a037b3fa8f57', 'AboutUsConfig-AboutUSOneText', '关于我们\n中盈汇集团是一家以资产管理、财富管理、投资管理、区块链开发为核心业务的平台，是一家业务范围涵盖私募证券投资基金、股权投资、影视基金、区块链技术应用四大业务板块的现代化资产管理公司。中盈汇集团于2011年8月成立于新加坡，旗下企业包括：中盈汇（新加坡）基金会、中盈汇（新加坡）咨询有限公司、中盈汇（新加坡）科技有限公司；先后在中国内地、中国香港成立了中盈汇资产管理有限公司、中盈汇区块链科技有限公司、中盈汇投资咨询有限公司和中盈汇集团（香港）控股公司、桂林中盈汇国际旅游有限公司等。\n公司成立至今，始终走在行业最前沿。凭借这两年来的精耕细作、诚信经营，公司业务发展越发全面，除了传统的金融业，新兴互联网金融更是领先整个亚洲地区，业务范围覆盖了东南亚直至整个亚洲。', 'AboutUsConfig-', '2018-09-11 18:06:36', '2018-09-19 19:03:46', '0');
INSERT INTO `t_sys_config` VALUES ('48695cb66175403885374cf09c3bbe63', 'IndexConfig-CoreThreeUrl', '/corebusiness.html', 'IndexConfig-', '2018-09-11 16:31:39', '2018-09-20 10:02:20', '0');
INSERT INTO `t_sys_config` VALUES ('4a48e10df4ca4623834532026fffb6a6', 'SettlementCommonConfig-UserRegGiveCoinTotal', '100', 'SettlementCommonConfig-', '2019-02-12 20:07:18', '2019-02-12 20:07:18', '0');
INSERT INTO `t_sys_config` VALUES ('4a6ff8dbafb54471a42e963b7f303309', 'SettlementCommonConfig-Before21DayMultiple', '', 'SettlementCommonConfig-', '2019-09-10 16:17:15', '2019-09-26 14:54:47', '0');
INSERT INTO `t_sys_config` VALUES ('4be8e5af954a49eab35324ec9eaf7518', 'CommonConfig-RRPublicImg', '/files/6001eec1-303a-4ab1-97ee-2ade0311f556.png', 'CommonConfig-', '2018-09-11 11:49:54', '2018-09-19 16:00:35', '0');
INSERT INTO `t_sys_config` VALUES ('4ea9cdc16d3a49fb81e8d2fc32766fee', 'SettlementCommonConfig-ConsumeCoin', '', 'SettlementCommonConfig-', '2019-09-10 16:17:15', '2019-09-26 14:54:47', '0');
INSERT INTO `t_sys_config` VALUES ('525ed0d6c21b417dbd3329c885200155', 'SettlementCommonConfig-PushReachedUserNumber', '', 'SettlementCommonConfig-', '2019-09-10 16:17:15', '2019-09-26 14:54:46', '0');
INSERT INTO `t_sys_config` VALUES ('5306b9570df643589f9afdc238ec79f2', 'SettlementCommonConfig-WebsiteLogo', '/files/62a02c36-1f67-4dd4-8add-37956923f2de.png', 'SettlementCommonConfig-', '2019-02-20 19:09:42', '2019-09-26 14:54:48', '0');
INSERT INTO `t_sys_config` VALUES ('581ef6cf7ff047158e386efaff90c390', 'SettlementCommonConfig-WithFee', '', 'SettlementCommonConfig-', '2019-09-10 16:17:15', '2019-09-26 14:54:47', '0');
INSERT INTO `t_sys_config` VALUES ('59841589dfbf453bb479a22be2935b82', 'TeamConfig-TeamTwoText', '目前，有多个顶级金融机构和风险基金与中盈汇集团紧密合作。集团的实力为投资者提供了强有力的 保障和足够的信心。能获得社会如此高的关注，不 仅是因为项目自身带着发展热潮的光环，更多的是 项目的完美落地、对技术的追求、颠覆了市场的伟 大愿景。率先为新加坡打开区块链技术，颠覆传统 金融经济是集团的宏愿。', 'TeamConfig-', '2018-09-11 17:36:15', '2018-09-13 19:54:40', '0');
INSERT INTO `t_sys_config` VALUES ('598df99a058e40268da843a5e69c3683', 'CommonConfig-PublicNumberImg', '/files/a57c942a-42b7-46de-a652-5eed3a923295.jpg', 'CommonConfig-', '2018-09-11 11:25:05', '2018-09-11 15:33:28', '0');
INSERT INTO `t_sys_config` VALUES ('59fce243d57345389728dc2d7aa3b685', 'IndexConfig-IndexButtonLinked', '/corebusiness.html', 'IndexConfig-', '2018-09-11 14:51:07', '2018-09-20 10:02:20', '0');
INSERT INTO `t_sys_config` VALUES ('5d2b7e0829af4c059c2944952fb12521', 'IndexConfig-AboutUSFourImage', '/files/4cb77884-ef94-4d5a-8593-91b38363430c.jpg', 'IndexConfig-', '2018-09-11 18:20:41', '2018-09-20 10:02:20', '0');
INSERT INTO `t_sys_config` VALUES ('5dae0779fe774694a4ca1e9dc30fc970', 'IndexConfig-CoreTwoOneText', '投资管理', 'IndexConfig-', '2018-09-11 16:31:39', '2018-09-20 10:02:20', '0');
INSERT INTO `t_sys_config` VALUES ('5e3de55e6b8640ae8749217b89abe21b', 'SettlementCommonConfig-PushProfitProportion', '50', 'SettlementCommonConfig-', '2018-10-18 11:57:04', '2019-01-20 11:03:11', '0');
INSERT INTO `t_sys_config` VALUES ('602fd71393814973865098c58c2921e1', 'SettlementCommonConfig-Before7DayMultiple', '', 'SettlementCommonConfig-', '2019-09-10 16:17:15', '2019-09-26 14:54:48', '0');
INSERT INTO `t_sys_config` VALUES ('60bbebafaf4d4531ad29b6f38e7c80e3', 'AboutUsConfig-AboutUSFourImage', '/files/190e7577-0b2a-43cc-bfd0-3d5c445e1c49.jpg', 'AboutUsConfig-', '2018-09-11 18:06:36', '2018-09-19 19:03:46', '0');
INSERT INTO `t_sys_config` VALUES ('6173f0e37875470aa73245224ab78395', 'AboutUsConfig-AboutUSThreeName', '核心人物介绍', 'AboutUsConfig-', '2018-09-11 18:06:36', '2018-09-19 19:03:46', '0');
INSERT INTO `t_sys_config` VALUES ('629b9b1ef5724edcb51215bb7a4917e9', 'CommonConfig-IsEnableWaiXinImg', '1', 'CommonConfig-', '2018-09-10 14:39:55', '2018-09-19 16:00:35', '0');
INSERT INTO `t_sys_config` VALUES ('633f870b0c8b419eb5b3cf7fefa79d0f', 'SettlementCommonConfig-SecondShareLevelBorder', '', 'SettlementCommonConfig-', '2019-09-10 16:17:15', '2019-09-26 14:54:48', '0');
INSERT INTO `t_sys_config` VALUES ('63a6d671349e4d78b2991ac3b2ac76b2', 'SettlementCommonConfig-Before21DayMultipleInner', '', 'SettlementCommonConfig-', '2019-09-10 16:17:15', '2019-09-26 14:54:46', '0');
INSERT INTO `t_sys_config` VALUES ('63bd618d4b5a4db6b03643a4e5d4d929', 'CommonConfig-Contact', '刘宇（13430837268）', 'CommonConfig-', '2018-09-14 12:01:27', '2018-09-19 16:00:35', '0');
INSERT INTO `t_sys_config` VALUES ('658178a6b6cc4529964e4f0a4571bc57', 'AboutUsConfig-AboutUSBigTitle', '', 'AboutUsConfig-', '2018-09-11 18:06:36', '2018-09-19 19:03:46', '0');
INSERT INTO `t_sys_config` VALUES ('65cc9652465e45648dd391a28e5ded9e', 'CommonConfig-Core', '', 'CommonConfig-', '2018-09-11 11:25:05', '2018-09-11 15:33:28', '0');
INSERT INTO `t_sys_config` VALUES ('672d573d484b4b7babc84025da35c019', 'IndexConfig-CoreFourUrl', '/corebusiness.html', 'IndexConfig-', '2018-09-11 16:31:39', '2018-09-20 10:02:20', '0');
INSERT INTO `t_sys_config` VALUES ('683ba7fc7ee74dda97267b8ec6bb1e9c', 'SettlementCommonConfig-', '5', 'SettlementCommonConfig-', '2019-02-20 18:59:06', '2019-02-20 18:59:06', '0');
INSERT INTO `t_sys_config` VALUES ('6a2c21ba4d3c457497613a966fe0053b', 'TeamConfig-TeamThreeName', '集团优势', 'TeamConfig-', '2018-09-11 17:36:15', '2018-09-13 19:54:40', '0');
INSERT INTO `t_sys_config` VALUES ('6b26d95c7dbd46dba75f2f1937d06d9c', 'IndexConfig-AboutUSOneText', '经验丰富', 'IndexConfig-', '2018-09-11 18:20:41', '2018-09-20 10:02:20', '0');
INSERT INTO `t_sys_config` VALUES ('6be87d5b46094a67a2b33e1045440ea5', 'IndexConfig-AboutUSTwoImage', '/files/57de60c4-c760-4b78-9705-c67e1012717b.jpg', 'IndexConfig-', '2018-09-11 18:20:41', '2018-09-20 10:02:20', '0');
INSERT INTO `t_sys_config` VALUES ('6e63c8e1558c488584e6b05138d65386', 'SettlementCommonConfig-TransferGames', '0', 'SettlementCommonConfig-', '2019-01-10 17:56:37', '2019-01-20 11:03:11', '0');
INSERT INTO `t_sys_config` VALUES ('6f2e1011600945ee954b48cbf68aee9f', 'CommonConfig-CompanyCopyright', '版权所有： 中盈汇集团', 'CommonConfig-', '2018-09-11 15:33:28', '2018-09-19 16:00:35', '0');
INSERT INTO `t_sys_config` VALUES ('7594385521ca4117b21879941ab1b648', 'SettlementCommonConfig-ConsumeRevertRatio', '', 'SettlementCommonConfig-', '2019-09-10 16:17:15', '2019-09-26 14:54:46', '0');
INSERT INTO `t_sys_config` VALUES ('77389e1725fd48a39ec2b50b633576d8', 'IndexConfig-IndexShowText', '给您提供专业现代化资产管理', 'IndexConfig-', '2018-09-11 14:43:18', '2018-09-20 10:02:20', '0');
INSERT INTO `t_sys_config` VALUES ('78a8a489a0c7491bb2e69783afc9f482', 'AboutUsConfig-AboutUSTwoImage', '/files/84d58893-0a20-4050-9ed8-bc6fd53d22a2.jpg', 'AboutUsConfig-', '2018-09-11 18:06:36', '2018-09-19 19:03:46', '0');
INSERT INTO `t_sys_config` VALUES ('7972ffea8872414a8d67d0770275277a', 'AboutUsConfig-AboutUSOneImage', '/files/23316c5f-4d42-461f-b225-b4d070d6c335.jpg', 'AboutUsConfig-', '2018-09-11 18:06:36', '2018-09-19 19:03:46', '0');
INSERT INTO `t_sys_config` VALUES ('7c22f6ab571b49b6bb19f4e35085789d', 'TeamConfig-TeamThreeImage', '/files/62933708-4da2-40b5-86af-c50c617957c6.jpg', 'TeamConfig-', '2018-09-11 17:36:15', '2018-09-13 19:54:40', '0');
INSERT INTO `t_sys_config` VALUES ('7cfe3307b7044b4ea12037373adeb5c5', 'TeamConfig-TeamOneName', '技术团队', 'TeamConfig-', '2018-09-11 17:36:15', '2018-09-13 19:54:40', '0');
INSERT INTO `t_sys_config` VALUES ('7f51328ab3714e288a826186c76d2ed5', 'SettlementCommonConfig-MonthPackageIncidentalCoinNum', '', 'SettlementCommonConfig-', '2019-09-10 16:17:15', '2019-09-26 14:54:46', '0');
INSERT INTO `t_sys_config` VALUES ('7fb39bf6db73470eb09e0dcc3c81996b', 'AboutUsConfig-AboutUSFourName', '集团理念', 'AboutUsConfig-', '2018-09-11 18:06:36', '2018-09-19 19:03:46', '0');
INSERT INTO `t_sys_config` VALUES ('80c9b98e367449cfb39109148417d538', 'TeamConfig-TeamOneImage', '/files/a3ff6af0-34a5-471b-a23a-e3210e2c3d77.jpg', 'TeamConfig-', '2018-09-11 17:36:15', '2018-09-13 19:54:40', '0');
INSERT INTO `t_sys_config` VALUES ('8266583255f64bff81166e28882cf025', 'SettlementCommonConfig-FirstShareLevelOfPackage', '', 'SettlementCommonConfig-', '2019-09-10 16:17:15', '2019-09-26 14:54:46', '0');
INSERT INTO `t_sys_config` VALUES ('8671746e21054af29388cb748f27829c', 'CoreConfig-CoreBackGroundImg', '/files/b103b3b2-5fe3-4ef6-9aa5-2207db32ed0b.jpg', 'CoreConfig-', '2018-09-13 18:34:30', '2018-09-17 16:40:15', '0');
INSERT INTO `t_sys_config` VALUES ('8703df7ca64146d399d3192820b2144f', 'SettlementCommonConfig-TransferOther', '0', 'SettlementCommonConfig-', '2018-11-23 17:11:44', '2019-02-12 20:07:19', '0');
INSERT INTO `t_sys_config` VALUES ('875c994887b1460e8ab0aa893dd19e00', 'SettlementCommonConfig-SuperPackageIncidentalCoin', '', 'SettlementCommonConfig-', '2019-09-10 16:17:15', '2019-09-26 14:54:47', '0');
INSERT INTO `t_sys_config` VALUES ('87cc0c572b19439fb3d14533ded6c8ec', 'SettlementCommonConfig-CoinTypeOfL1', '', 'SettlementCommonConfig-', '2019-09-10 16:17:15', '2019-09-26 14:54:46', '0');
INSERT INTO `t_sys_config` VALUES ('89e82c14c2ef4c35ba7ce47d0687be87', 'nullCore', '测试基础配置', NULL, '2018-09-06 20:50:41', '2018-09-11 10:32:04', '0');
INSERT INTO `t_sys_config` VALUES ('8c19ead6eefd415292c1acde28516ff7', 'CommonConfig-ZYHPublicImgName', '中盈汇集团公众号', 'CommonConfig-', '2018-09-11 16:54:11', '2018-09-19 16:00:35', '0');
INSERT INTO `t_sys_config` VALUES ('8d10e34f36ed4d17995ba18b6081ea33', 'SettlementCommonConfig-GameSuccessIP', '132.148.21.154;104.28.27.167', 'SettlementCommonConfig-', '2019-01-10 10:00:57', '2019-01-20 11:03:11', '0');
INSERT INTO `t_sys_config` VALUES ('9112058318ff4d558d0b01b1012ac2b6', 'AboutUsConfig-AboutUSSmallTitle', '', 'AboutUsConfig-', '2018-09-11 18:06:36', '2018-09-19 19:03:46', '0');
INSERT INTO `t_sys_config` VALUES ('9448bb73e90645ff868f7b576a51dbfa', 'SettlementCommonConfig-ConsumeCoinMultiple', '', 'SettlementCommonConfig-', '2019-09-10 16:17:15', '2019-09-26 14:54:48', '0');
INSERT INTO `t_sys_config` VALUES ('9493d1d9e5044cf29960b1a98827b309', 'SettlementCommonConfig-PushReachedUserCoinType', '', 'SettlementCommonConfig-', '2019-09-10 16:17:15', '2019-09-26 14:54:47', '0');
INSERT INTO `t_sys_config` VALUES ('95e91aca902c4b7e9b05dae8c222842a', 'IndexConfig-IndexBackGroundImg', '/files/a361cfa5-4235-4ffb-93a8-778bdb07f729.jpg', 'IndexConfig-', '2018-09-11 14:43:18', '2018-09-20 10:02:20', '0');
INSERT INTO `t_sys_config` VALUES ('975216cb57094bb288e5851f02a8f266', 'SettlementCommonConfig-MonthPackageInsteadCoin', '', 'SettlementCommonConfig-', '2019-09-10 16:17:15', '2019-09-26 14:54:48', '0');
INSERT INTO `t_sys_config` VALUES ('990ba03df87244dc8f6164a800b966b2', 'SettlementCommonConfig-WalletGT', '50', 'SettlementCommonConfig-', '2018-10-18 11:57:04', '2019-01-20 11:03:11', '0');
INSERT INTO `t_sys_config` VALUES ('9a5c4a991ebd42c98780f869aa9ab9bb', 'SettlementCommonConfig-ThirdShareLevelOfBorder', '', 'SettlementCommonConfig-', '2019-09-10 16:17:15', '2019-09-26 14:54:47', '0');
INSERT INTO `t_sys_config` VALUES ('9dfd99ad1f4549c0a7e7b5f55ac975cd', 'SettlementCommonConfig-PackageOf1288Code', '', 'SettlementCommonConfig-', '2019-09-10 16:17:15', '2019-09-26 14:54:46', '0');
INSERT INTO `t_sys_config` VALUES ('9ea632b46fd74f97b0b533eb4d0e57ec', 'SettlementCommonConfig-PushUserNumberCheckIn', '', 'SettlementCommonConfig-', '2019-09-10 16:17:15', '2019-09-26 14:54:47', '0');
INSERT INTO `t_sys_config` VALUES ('9f6fa96da19e4dd6a167b8569262b9fe', 'SettlementCommonConfig-RewardRuleCode', '', 'SettlementCommonConfig-', '2019-09-10 16:17:15', '2019-09-26 14:54:47', '0');
INSERT INTO `t_sys_config` VALUES ('9f82fa642f5141d9a40e4e7c7b8857a1', 'IndexConfig-CoreTwoImage', '/files/492b4ee7-0500-4b57-84d6-9e7bdfde0da0.jpg', 'IndexConfig-', '2018-09-11 16:31:39', '2018-09-20 10:02:20', '0');
INSERT INTO `t_sys_config` VALUES ('a30318102acb49b9bafd3180839a7ecf', 'SettlementCommonConfig-CoinNumOfL1', '', 'SettlementCommonConfig-', '2019-09-10 16:17:15', '2019-09-26 14:54:48', '0');
INSERT INTO `t_sys_config` VALUES ('a3dba7a2e04c47cdb49eb7de0e5ffab0', 'SettlementCommonConfig-PackageOf1288SharePercent', '', 'SettlementCommonConfig-', '2019-09-10 16:17:15', '2019-09-26 14:54:47', '0');
INSERT INTO `t_sys_config` VALUES ('a49952ceb6874735895b3920a05305eb', 'CommonConfig-RRPublicImgName', '瑞银RR社区公众号', 'CommonConfig-', '2018-09-11 16:54:11', '2018-09-19 16:00:35', '0');
INSERT INTO `t_sys_config` VALUES ('a696f73cb51747eeb2dd22453354979d', 'SettlementCommonConfig-After21DayMultiple', '', 'SettlementCommonConfig-', '2019-09-10 16:17:15', '2019-09-26 14:54:47', '0');
INSERT INTO `t_sys_config` VALUES ('a8412c8d3382423fa346b034ce71609f', 'IndexConfig-CoreFourOneText', '区块链开发', 'IndexConfig-', '2018-09-11 16:31:39', '2018-09-20 10:02:20', '0');
INSERT INTO `t_sys_config` VALUES ('a8fb73e46ed94e74b48cb89164efef4f', 'NewsConfig-AboutUSBigTitle', '', 'NewsConfig-', '2018-09-14 09:59:27', '2018-09-19 16:28:35', '0');
INSERT INTO `t_sys_config` VALUES ('aad451199729480e95f3021b15ad2919', 'AboutUsConfig-AboutUSTwoText', '21世纪，人类已进入信息化时代，互联网金融、虚拟经济迅速崛起。随着“互联网+“概念的提出和发展趋势，互联网金融、数字资产逐渐成了热门词汇，它正以远超我们预期的速度迅猛发展。比特币等虚拟货币的出现和应用标志着区块链技术正式被世人认可并追求。随着“区块链“概念的提出和其发展趋势，互联网新金融、区块链经济迅速崛起，A字贫P之所以引起全球众多领域关注是因为它正在颠覆一个全以中心化的金融主导的经济时代，去中心化虚拟数字货币已成为时代的潮流这一切已经说明人类资产数字化，已是为历史进程中不可阴挡的趋势。中盈汇集团率先在新加坡试点开发“区块链”应用技术的研发。在供给侧改革，万众创新，大众创业的大背景下，创7业将通过兼并重组积聚优势生产力.股权投资将成为经济转型发展的必然选择。我国股权基金正处于蓬勃发展期，在葬资、投资、管理与退出机制上都取得了长足的进展，P〔投资的市场环境已经成熟。股权投资的时代是大势所趋，股权投资者可能成为未来最大寡家。股权投资从全球来看，正在从另类成为主流，是创新、创业、金融的核心地带，过去10年有50倍以上的增长。\n中盈汇集团专注于区块链技术应用、生物医药、节能环保、新材料、新能源、新金融、人工智能等领域。', 'AboutUsConfig-', '2018-09-11 18:06:36', '2018-09-19 19:03:46', '0');
INSERT INTO `t_sys_config` VALUES ('abfccc52e9ca4779b80495accb499fdb', 'nullAboutUs', '关于我们的配置，啦啦啦啦啊', NULL, '2018-09-06 20:50:41', '2018-09-11 10:32:04', '0');
INSERT INTO `t_sys_config` VALUES ('ac8990fd6df0499cac3e9d2488aa9b2d', 'IndexConfig-AboutUSFourText', '遍布全球', 'IndexConfig-', '2018-09-11 18:20:41', '2018-09-20 10:02:20', '0');
INSERT INTO `t_sys_config` VALUES ('adb2499badb242b7b72b087c5ec80d76', 'SettlementCommonConfig-FilterInterface', '', 'SettlementCommonConfig-', '2019-09-10 16:17:15', '2019-09-26 14:54:46', '0');
INSERT INTO `t_sys_config` VALUES ('ae485e70d5d748bdbb0981f062fe7a79', 'IndexConfig-CoreOneUrl', '/corebusiness.html', 'IndexConfig-', '2018-09-11 16:31:39', '2018-09-20 10:02:20', '0');
INSERT INTO `t_sys_config` VALUES ('af1653818fc64453b92865c47229450d', 'SettlementCommonConfig-IsEnableAdminLoginMobileCheck', '1', 'SettlementCommonConfig-', '2018-10-18 11:57:04', '2019-09-26 14:54:48', '0');
INSERT INTO `t_sys_config` VALUES ('afaa10ef5e1c4815b679faa471df85cd', 'nullIsEnableWaiXinImg', '1', NULL, '2018-09-06 20:51:04', '2018-09-10 14:41:41', '0');
INSERT INTO `t_sys_config` VALUES ('b027096903ba4d0a8cb842cfd9bb3721', 'IndexConfig-CoreFourImage', '/files/dea4bcd2-f0c7-4ee4-82aa-5cee98d21fb6.jpg', 'IndexConfig-', '2018-09-11 16:31:39', '2018-09-20 10:02:20', '0');
INSERT INTO `t_sys_config` VALUES ('b085c257906b4dbb836d8fc102a0f359', 'IndexConfig-AboutUSImg', '/img/noPicture.jpg', 'IndexConfig-', '2018-09-11 16:31:39', '2018-09-11 16:31:39', '0');
INSERT INTO `t_sys_config` VALUES ('b412995feba043fc87e035d8f17fe4be', 'CommonConfig-Address', '深圳市福田区福田海岸环庆大厦1404-1405室', 'CommonConfig-', '2018-09-11 11:25:05', '2018-09-19 16:00:35', '0');
INSERT INTO `t_sys_config` VALUES ('b70f062f2cc1405599998c4ec7e09004', 'SettlementCommonConfig-MinWithLimit', '', 'SettlementCommonConfig-', '2019-09-10 16:17:15', '2019-09-26 14:54:46', '0');
INSERT INTO `t_sys_config` VALUES ('be006dbfd4c640c48f407bcbff3d6b6a', 'IndexConfig-AboutUSTwoText', '资源交流', 'IndexConfig-', '2018-09-11 18:20:41', '2018-09-20 10:02:20', '0');
INSERT INTO `t_sys_config` VALUES ('be156e7c8042428ea548843f4caad4ef', 'SettlementCommonConfig-WebsiteURL', 'http://bbct.kkg222.com', 'SettlementCommonConfig-', '2019-02-22 16:55:07', '2019-09-26 14:54:47', '0');
INSERT INTO `t_sys_config` VALUES ('be29905759d341bea816803d3eb4be8b', 'SettlementCommonConfig-UserNumOfL1', '', 'SettlementCommonConfig-', '2019-09-10 16:17:15', '2019-09-26 14:54:46', '0');
INSERT INTO `t_sys_config` VALUES ('c2f7fddb70714929a937980d0d61c28f', 'SettlementCommonConfig-ShopConsumePerCent', '0.25', 'SettlementCommonConfig-', '2019-04-26 16:17:21', '2019-04-28 09:51:38', '0');
INSERT INTO `t_sys_config` VALUES ('cba51e6d413d4007b4262c8263d1290e', 'SettlementCommonConfig-FirstLevelDay', '', 'SettlementCommonConfig-', '2019-09-10 16:17:15', '2019-09-26 14:54:48', '0');
INSERT INTO `t_sys_config` VALUES ('cda3b81dcb76416796c415403dd99f99', 'SettlementCommonConfig-TranReturnPercent', '0.5', 'SettlementCommonConfig-', '2019-05-05 09:59:18', '2019-05-05 09:59:18', '0');
INSERT INTO `t_sys_config` VALUES ('ce07fc27260348f0992eab308acdcd4f', 'SettlementCommonConfig-SettlementTransferTradingTotalLimit', '100', 'SettlementCommonConfig-', '2018-12-25 17:19:08', '2019-01-20 11:03:11', '0');
INSERT INTO `t_sys_config` VALUES ('d198201984c04b4f9ceb739bb4839776', 'TeamConfig-TeamTwoName', '集团愿望', 'TeamConfig-', '2018-09-11 17:36:15', '2018-09-13 19:54:40', '0');
INSERT INTO `t_sys_config` VALUES ('d3ab6ad5180d4dc29be040feb6184911', 'AboutUsConfig-AboutUSThreeImage', '/files/9a80e08c-069c-47d7-bc5d-1817fae87faf.png', 'AboutUsConfig-', '2018-09-11 18:06:36', '2018-09-19 19:03:46', '0');
INSERT INTO `t_sys_config` VALUES ('d5ef6b9f3528435792458ba1b9326537', 'SettlementCommonConfig-ShopPushRule', '[\n    {\n        \"percent\":\"0.05\",\n        \"num\":\"1\"\n    },\n    {\n        \"percent\":\"0.1\",\n        \"num\":\"2\"\n    },\n    {\n        \"percent\":\"0.15\",\n        \"num\":\"3\"\n    }\n]', 'SettlementCommonConfig-', '2019-04-28 09:51:37', '2019-04-28 09:51:37', '0');
INSERT INTO `t_sys_config` VALUES ('d7b9786fa6e848a49392c899dc86caa4', 'TeamConfig-TeamThreeText', '1.全面综合性服务\n我门不是单一的企业，我们的服务涵盖了整个金融范围。不管剧专统金融业还是新兴互联网金融。\n2.专业的人才\n我们的团队都是金融业里面各国的顶尖人才，我们提供最专业的技术最精准的评估。\n3.资源充足，渠道众多\n公司成立以来，凭借着丰富的贸易经验和公司管理经验，多年来的精耕细作经营，公司业务发展越发全面，范围\n越发宽广，无论是跨国合作还是跨国人才，集团都经营有声有色。', 'TeamConfig-', '2018-09-11 17:36:15', '2018-09-13 19:54:40', '0');
INSERT INTO `t_sys_config` VALUES ('d8dc0e5112e54da1aae3898cef00c0e7', 'IndexConfig-CoreFourTwoText', '查看更多', 'IndexConfig-', '2018-09-11 16:31:39', '2018-09-20 10:02:20', '0');
INSERT INTO `t_sys_config` VALUES ('dae9e00de26f49b2ab4dcf3331956c25', 'AboutUsConfig-AboutUSThreeText', '夏辉，中盈汇集团懂事长瑞银RR社区、瑞银钱包创始人。现为江苏基金会会长，中国香港狮子会成员。由于其独特的敏锐性，从2015年开始专注于区块链技术应用研究，2016年进入矿圈2017年创建中盈汇集团，2018年成为矿圈大咖现托管的比特币矿机达40万台规模2017年总产值8亿元人民币。', 'AboutUsConfig-', '2018-09-11 18:06:36', '2018-09-19 19:03:46', '0');
INSERT INTO `t_sys_config` VALUES ('db121743c14f46e8b833f48780cb3bec', 'IndexConfig-CoreThreeTwoText', '查看更多', 'IndexConfig-', '2018-09-11 16:31:39', '2018-09-20 10:02:20', '0');
INSERT INTO `t_sys_config` VALUES ('dcd0111d68484ff49fa77506bf5f5dfc', 'SettlementCommonConfig-ShareOf1288SourceCoin', '', 'SettlementCommonConfig-', '2019-09-10 16:17:15', '2019-09-26 14:54:48', '0');
INSERT INTO `t_sys_config` VALUES ('de5d9959c971482d8baf821a48397b7b', 'SettlementCommonConfig-PushReachedUserCoinNumber', '', 'SettlementCommonConfig-', '2019-09-10 16:17:15', '2019-09-26 14:54:48', '0');
INSERT INTO `t_sys_config` VALUES ('e0c387a066e74102a42c9a7aad5a9890', 'CoreConfig-CoreButtonName', '实现商业目标', 'CoreConfig-', '2018-09-13 18:34:30', '2018-09-17 16:40:15', '0');
INSERT INTO `t_sys_config` VALUES ('e5095e8df69945afb4db1d1ac797946b', 'CoreConfig-CoreButtonLinked', '/index.html', 'CoreConfig-', '2018-09-13 18:34:30', '2018-09-17 16:40:15', '0');
INSERT INTO `t_sys_config` VALUES ('e7dd32b4663443da8803c884a303f162', 'IndexConfig-IndexWhyCheckUs', '为什么选择我们', 'IndexConfig-', '2018-09-11 16:31:39', '2018-09-20 10:02:20', '0');
INSERT INTO `t_sys_config` VALUES ('e8327d9c20ac4953a27159580a6b5ab5', 'nullPublicNumberImg', '/files/02063ad2-2074-4d5a-89e0-4c20d8d60a61.jpg', NULL, '2018-09-06 20:50:41', '2018-09-11 10:32:04', '0');
INSERT INTO `t_sys_config` VALUES ('ea37c37d66c845c8b86169253169028f', 'AboutUsConfig-AboutUSFourText', '颠覆了市场，颠覆传统金融经济集团使命:为投资者盈利，帮助投资者实现财富自由\n分享财富、共享资源、共赢天下\n以人为本，志同道合，信任协作，互惠共赢\n坚持理想！理想实现！', 'AboutUsConfig-', '2018-09-11 18:06:36', '2018-09-19 19:03:46', '0');
INSERT INTO `t_sys_config` VALUES ('eb2996f4a44c49638253110372a082ff', 'CommonConfig-LogoImg', '/files/5c444493-738c-4774-8da1-faaa30ea0d48.png', 'CommonConfig-', '2018-09-11 14:03:39', '2018-09-19 16:00:35', '0');
INSERT INTO `t_sys_config` VALUES ('ee8a30cebdb24597b2e617aa926f23d2', 'SettlementCommonConfig-Before7DayMultipleInner', '', 'SettlementCommonConfig-', '2019-09-10 16:17:15', '2019-09-26 14:54:48', '0');
INSERT INTO `t_sys_config` VALUES ('ef6cfa8643604807931dda54212b5f05', 'TeamConfig-TeamTwoImage', '/files/b05dfd53-d567-4c87-b20c-2943d41981ae.jpg', 'TeamConfig-', '2018-09-11 17:36:15', '2018-09-13 19:54:40', '0');
INSERT INTO `t_sys_config` VALUES ('efbf6d6cb5494eb5bb2214de26ab621e', 'SettlementCommonConfig-UserRegGiveCoin', '', 'SettlementCommonConfig-', '2019-02-12 20:07:18', '2019-09-26 14:54:48', '0');
INSERT INTO `t_sys_config` VALUES ('f19ecb3e26df440fbea5a246c44771c6', 'SettlementCommonConfig-BackWebsiteSubName', 'BBCT管理系统', 'SettlementCommonConfig-', '2019-02-20 18:03:26', '2019-09-26 14:54:46', '0');
INSERT INTO `t_sys_config` VALUES ('f1a206b909ec4a94a1eebb08793b3078', 'CoreConfig-CoreTextName', '释放区块链核心价值', 'CoreConfig-', '2018-09-13 18:34:30', '2018-09-17 16:40:15', '0');
INSERT INTO `t_sys_config` VALUES ('f7103b6ce4f04e1cbae74ec8826059d3', 'IndexConfig-ChineseImg', '/files/23c76f35-fd15-4398-ad67-ed1b480e18eb.png', 'IndexConfig-', '2018-09-11 14:43:18', '2018-09-20 10:02:20', '0');
INSERT INTO `t_sys_config` VALUES ('f942dfc2b04045efb0e3d9a4b1b8a0d2', 'SettlementCommonConfig-SettlementTransferTradingLimitTimes', '100', 'SettlementCommonConfig-', '2018-12-25 17:19:08', '2019-01-20 11:03:11', '0');
INSERT INTO `t_sys_config` VALUES ('f9a61fc08c47487e92ccbf344122bd2b', 'SettlementCommonConfig-ThirdShareLevelOfPackage', '', 'SettlementCommonConfig-', '2019-09-10 16:17:15', '2019-09-26 14:54:46', '0');
INSERT INTO `t_sys_config` VALUES ('fc0dc65ebe5347e08033f599a5085711', 'IndexConfig-IndexAboutUs', '关于我们', 'IndexConfig-', '2018-09-11 16:31:39', '2018-09-20 10:02:20', '0');
INSERT INTO `t_sys_config` VALUES ('fcc3384b29df4b79955ad2f5276478e7', 'SettlementCommonConfig-SecondShareLevelOfPackage', '', 'SettlementCommonConfig-', '2019-09-10 16:17:15', '2019-09-26 14:54:46', '0');
INSERT INTO `t_sys_config` VALUES ('fda4041f3ce9456cb132ea40c85f49ad', 'SettlementCommonConfig-SystemAccountId', '1', 'SettlementCommonConfig-', '2019-02-28 01:29:01', '2019-09-26 14:54:47', '0');
INSERT INTO `t_sys_config` VALUES ('ff055ab60cb0455094fa78e44f2e4bbe', 'SettlementCommonConfig-MonthPackageInsteadPercent', '', 'SettlementCommonConfig-', '2019-09-10 16:17:15', '2019-09-26 14:54:48', '0');
INSERT INTO `t_sys_config` VALUES ('ffa39e9ca2a14e07b75290ef53aa6bd6', 'CommonConfig-ZYHPublicImg', '/files/f2c7611f-14fa-45e9-bdd9-d82613666237.png', 'CommonConfig-', '2018-09-11 11:49:54', '2018-09-19 16:00:35', '0');

-- ----------------------------
-- Table structure for t_sys_information
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_information`;
CREATE TABLE `t_sys_information`  (
  `tid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `title` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `type` int(2) NULL DEFAULT NULL COMMENT '类型，1-轮播图，2-轮播图下菜单，3-推荐菜单，4-table',
  `level` int(2) NULL DEFAULT NULL COMMENT '层级',
  `status` int(1) NULL DEFAULT NULL COMMENT '状态，0-可用，1-不可用',
  `link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '链接',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标记',
  `pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  `ex1` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父级id',
  `ex2` int(1) NULL DEFAULT NULL COMMENT '前端布局风格，1-文字在前，2-图片在前',
  `ex3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ex3',
  `ex4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ex4',
  PRIMARY KEY (`tid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '资讯表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sys_information
-- ----------------------------
INSERT INTO `t_sys_information` VALUES ('07f7e141995245e0ad061f40e640a922', '测试推荐一级菜单', '', 3, 1, 0, NULL, '2019-09-25 16:37:52', '2019-09-25 16:38:02', '1', '', '', NULL, NULL, NULL);
INSERT INTO `t_sys_information` VALUES ('1132818dc38d4cf5a21c8eab4035d325', '火星APP', '', 3, 1, 0, '', '2019-09-25 17:34:30', '2019-09-26 17:34:14', '0', '/files/16174004-10d8-44bd-8124-2d227b5b6671.png', NULL, 1, NULL, NULL);
INSERT INTO `t_sys_information` VALUES ('13d2b4bd1f06483783451f25ad72aaea', 'Cryptokitties', '<p>领养你的专属数字猫</p>', 4, 2, 0, 'http://www.baidu.com', '2019-09-25 18:52:56', '2019-09-26 19:40:38', '0', '/files/eba872c9-2574-41fb-97d3-38d07b134594.png', 'ccbd194b04ce4226adb661c363cda722', 2, NULL, NULL);
INSERT INTO `t_sys_information` VALUES ('165267c1ee724f54aeeaccee73df4ef2', '测试推荐二级菜单', '', 3, 2, 0, NULL, '2019-09-25 16:38:28', '2019-09-25 16:38:55', '1', '', '07f7e141995245e0ad061f40e640a922', NULL, NULL, NULL);
INSERT INTO `t_sys_information` VALUES ('311332543bc849c8a836547e75fbceeb', '新零售通证，构建电子商务财富管理新生态', '<p>2018年全球电子商务报告的一组数据显示，北美市场电商销售额达5526亿美元，欧洲市场达3465亿美元，亚洲市场达831.7亿美元，澳大利亚市场达186亿美元，非洲和中东市场达186亿美元，南美洲市场达到177亿美元。</p><p>传统的中心化电商产业自带区域属性，主要是由支付货币及支付手段形成的隔离，而区块链可信销售网络及支付通道面向全球，尤其是那些传统销售网络及支付通道不发达的地区。&nbsp;</p><p><img src=\"http://10.235.20.47:9980/files/9396416e-ef4c-4c61-b24d-b8995126c7ec.png\" title=\"path\" alt=\"path\" width=\"439\" height=\"323\" style=\"width: 439px; height: 323px;\"/>BBCT致力于将区块链底层技术做封装，构建一个便捷化平台，让任何商业机构或者任何人都可以很简单地创造自己的生态应用，实现让个体一键进入区块链世界，自创建区块链账本、自设计Token，实现高效的工作协同和价值流通</p><p><video class=\"edui-upload-video  vjs-default-skin video-js\" controls=\"\" preload=\"none\" width=\"420\" height=\"280\" src=\"http://10.235.20.47:9980/files/94b7b0ad-1904-4f8e-8ccc-3bac5841ff0d.mp4\" data-setup=\"{}\"><source src=\"http://10.235.20.47:9980/files/94b7b0ad-1904-4f8e-8ccc-3bac5841ff0d.mp4\" type=\"video/mp4\"/></video><video class=\"edui-upload-video  vjs-default-skin video-js\" controls=\"\" preload=\"none\" width=\"420\" height=\"280\" src=\"http://10.235.20.47:9980/files/d8ed286d-fd74-45de-aeef-5da692e4be83.mp4\" data-setup=\"{}\"><source src=\"http://10.235.20.47:9980/files/d8ed286d-fd74-45de-aeef-5da692e4be83.mp4\" type=\"video/mp4\"/></video></p>', 4, 2, 0, '', '2019-09-25 18:42:05', '2019-09-26 11:48:24', '0', '/files/c2d0f53f-07a0-4e34-aa6d-8dfe428aa0f9.png', 'ffe18d0160ff45f5b62e142f466ceb49', 1, NULL, NULL);
INSERT INTO `t_sys_information` VALUES ('4241087d0ee2493fa002e8d71f7344b7', '公告', NULL, 4, 1, 0, NULL, '2019-09-25 17:35:45', '2019-09-25 17:35:45', '0', '', NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_information` VALUES ('4656d725ef394976b03de86cf01964ea', '潮汐-泠鸢yousa', '<p>&nbsp;&nbsp;&nbsp;&nbsp;<strong>《潮汐》&nbsp;</strong> &nbsp;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;湿润的砂砾吧</p><p>&nbsp;&nbsp;&nbsp;&nbsp;多留恋，多可惜</p><p>&nbsp;&nbsp;&nbsp;&nbsp;随地平线</p><p>&nbsp;&nbsp;&nbsp;&nbsp;渐渐模糊的轮廓</p><p>&nbsp;&nbsp;&nbsp;&nbsp;被缤纷的潮水，淹没</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--陈杰<br/></p>', 4, 2, 0, NULL, '2019-09-25 10:44:48', '2019-09-25 15:31:35', '1', '', '', NULL, '', '');
INSERT INTO `t_sys_information` VALUES ('4d87a1c7035b4cb08d2b18f976b7cdea', '会员商城', '', 2, 1, 0, '', '2019-09-25 17:31:19', '2019-09-26 17:28:13', '0', '/files/04f2aac0-f5d3-4fef-977f-2326d423f35c.png', NULL, 1, NULL, NULL);
INSERT INTO `t_sys_information` VALUES ('556f2791b3c6468388b6f93b1550aed7', '邀请好友', '', 2, 1, 0, '/pages/invite/invite', '2019-09-25 17:30:40', '2019-09-26 17:26:28', '0', '/files/534712d0-5665-4087-8e0c-39371b0293df.png', NULL, 1, NULL, NULL);
INSERT INTO `t_sys_information` VALUES ('5b7dd018d4c5477190512a10ce281fce', '金色财经', '', 3, 1, 0, '', '2019-09-25 17:32:41', '2019-09-26 17:36:15', '0', '/files/2f6ba8a0-674c-4451-bf27-9762a1901514.png', NULL, 1, NULL, NULL);
INSERT INTO `t_sys_information` VALUES ('5f81e389c50842d3906d760f93dff2cb', '轮播图', '', 1, 1, 0, NULL, '2019-09-25 15:29:54', '2019-09-25 15:30:08', '1', 'https://www.baidu.com/img/dong_a16028f60eed614e4fa191786f32f417.gif', NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_information` VALUES ('63fe6d69f66f47579ab792454bafe09e', '轮播图图片-1', '', 1, 1, 0, '/pages/currency/contract?contractType=0', '2019-09-25 17:28:48', '2019-09-26 17:29:15', '0', '/files/517a7cb6-96c9-4ce2-aea0-e7fcea45866e.png', NULL, 1, NULL, NULL);
INSERT INTO `t_sys_information` VALUES ('7148370de06f429b81180845bd2f7835', 'Edgeware', '<p>帮助持有EDG的用户解锁</p>', 4, 2, 0, 'http://www.baidu.com', '2019-09-25 18:55:38', '2019-09-26 19:45:07', '0', '/files/08e32191-2f50-4688-be86-9c368681c3fe.png', 'd248a1eceede4864bea3f34e3dcb6659', 2, NULL, NULL);
INSERT INTO `t_sys_information` VALUES ('7a2c9723a17040468c57e86b252a3beb', '交易所', NULL, 4, 1, 0, NULL, '2019-09-25 17:36:37', '2019-09-25 17:36:37', '0', '', NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_information` VALUES ('7af1c4a783ef419d987845b74730fccf', '火币Pro', '', 3, 1, 0, '', '2019-09-25 17:33:56', '2019-09-26 17:31:52', '0', '/files/e10bc913-6a59-4995-957d-376c607f4cd9.png', NULL, 1, NULL, NULL);
INSERT INTO `t_sys_information` VALUES ('7f1bc8d3e101473f9e7b991744eb6f86', '火币网', '<p>www.huobi.vn</p>', 4, 2, 0, 'http://www.huobi.vn', '2019-09-25 18:44:52', '2019-09-26 19:39:01', '0', '/files/3d7b00b2-eb4f-43ec-a4e6-f01871acf680.png', '7a2c9723a17040468c57e86b252a3beb', 2, NULL, NULL);
INSERT INTO `t_sys_information` VALUES ('7fc4411b6b16467591f59b9528ef3dc0', '云斗龙', '<p>可战斗的区块链游戏，领养你的专属龙</p>', 4, 2, 0, 'http://www.baidu.com', '2019-09-25 18:53:40', '2019-09-26 19:41:12', '0', '/files/66d3fd3f-fcd9-4018-81f1-0be3ca33dc1f.png', 'ccbd194b04ce4226adb661c363cda722', 2, NULL, NULL);
INSERT INTO `t_sys_information` VALUES ('a8e1967c15b94731b9be4a5b141edb49', '重磅：BBCT将于9月15日推出首个实物交割的比特币合约', NULL, 4, 2, 0, 'http://www.baidu.com', '2019-09-25 18:43:13', '2019-09-25 18:43:13', '0', '/files/c2d0f53f-07a0-4e34-aa6d-8dfe428aa0f9.png', 'ffe18d0160ff45f5b62e142f466ceb49', 1, NULL, NULL);
INSERT INTO `t_sys_information` VALUES ('a9ee3f88ae4d4b2092eb907a3329f7f1', '新币网', '<p>www.xinbi.co</p>', 4, 2, 0, 'http://www.xinbi.co', '2019-09-25 18:49:05', '2019-09-26 19:39:39', '0', '/files/b75911c6-7271-4b5f-90c2-ce0ac396b72e.png', '7a2c9723a17040468c57e86b252a3beb', 2, NULL, NULL);
INSERT INTO `t_sys_information` VALUES ('as6df4as3d2f1', '公告1', '<p>我们准备更新了</p>', 4, 1, 0, NULL, '2019-08-28 19:33:31', '2019-09-25 15:31:46', '1', '/files/344baa02-1dae-4604-a6bf-70571aec0bf4.png', NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_information` VALUES ('asdf321asdf1', '新闻1', '<p>据前线记者报道....</p>', 4, 1, 0, NULL, '2019-08-28 19:33:00', '2019-09-25 15:31:57', '1', '/files/344baa02-1dae-4604-a6bf-70571aec0bf4.png', NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_information` VALUES ('c97e939ae9a34fdb9edd3dc15756fa15', '进化星球', '<p>进化星球是一个支持跨链虚拟经营类区块链游</p>', 4, 2, 0, 'http://www.baidu.com', '2019-09-25 18:54:19', '2019-09-26 19:44:33', '0', '/files/03c2581d-356d-468d-8b65-2df08c366c1b.png', 'ccbd194b04ce4226adb661c363cda722', 2, NULL, NULL);
INSERT INTO `t_sys_information` VALUES ('c9b28c002818411a9bccb03d294cd2f7', '芒种', '<p style=\"text-align: center;\"><em><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color: rgb(146, 208, 80);\">《芒种》</span></strong></em></p><p style=\"text-align: center;\"><span style=\"font-size: 12px;\"><em><strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</strong></em></span><span style=\"font-size: 12px; color: rgb(141, 179, 226);\">赵方婧</span><em><strong><br/></strong></em></p><p style=\"text-align: center;\"><span style=\"font-size: 12px;\"></span></p><p style=\"text-align: center;\">一想到你我就</p><p style=\"text-align: center;\">Wu</p><p style=\"text-align: center;\">空恨别梦久</p><p style=\"text-align: center;\">Wu</p><p style=\"text-align: center;\">烧去纸灰埋烟柳</p><p style=\"text-align: center;\">于鲜活的枝丫</p><p style=\"text-align: center;\">凋零下的无暇</p><p style=\"text-align: center;\">是收获谜底的代价</p><p style=\"text-align: center;\">余晖沾上 远行人的发</p><p style=\"text-align: center;\">他洒下手中牵挂</p><p style=\"text-align: center;\">于桥下</p><p style=\"text-align: center;\">前世迟来者</p><p style=\"text-align: center;\">擦肩而过</p><p style=\"text-align: center;\">掌心刻</p><p style=\"text-align: center;\">来生记得</p><p style=\"text-align: center;\">你眼中烟波滴落一滴墨 wo</p><p style=\"text-align: center;\">若佛说</p><p style=\"text-align: center;\">无牵无挂</p><p style=\"text-align: center;\">放下执着</p><p style=\"text-align: center;\">无相无色</p><p style=\"text-align: center;\">我怎能 波澜不惊 去附和</p><p style=\"text-align: center;\">一想到你我就</p><p style=\"text-align: center;\">Wu</p><p style=\"text-align: center;\">恨情不寿 总于苦海囚</p><p style=\"text-align: center;\">Wu</p><p style=\"text-align: center;\">新翠徒留 落花影中游</p><p style=\"text-align: center;\">Wu</p><p style=\"text-align: center;\">相思无用 才笑山盟旧</p><p style=\"text-align: center;\">Wu</p><p style=\"text-align: center;\">谓我何求</p><p style=\"text-align: center;\">种一万朵莲花</p><p style=\"text-align: center;\">在众生中发芽</p><p style=\"text-align: center;\">等红尘一万种解答</p><p style=\"text-align: center;\">念珠落进 时间的泥沙</p><p style=\"text-align: center;\">待 割舍诠释慈悲</p><p style=\"text-align: center;\">的读法</p><p style=\"text-align: center;\">前世迟来者</p><p style=\"text-align: center;\">擦肩而过</p><p style=\"text-align: center;\">掌心刻</p><p style=\"text-align: center;\">来生记得</p><p style=\"text-align: center;\">你眼中烟波滴落一滴墨 wo</p><p style=\"text-align: center;\">若佛说</p><p style=\"text-align: center;\">无牵无挂</p><p style=\"text-align: center;\">放下执着</p><p style=\"text-align: center;\">无相无色</p><p style=\"text-align: center;\">我怎能 波澜不惊 去附和</p><p style=\"text-align: center;\">一想到你我就</p><p style=\"text-align: center;\">Wu</p><p style=\"text-align: center;\">恨情不寿 总于苦海囚</p><p style=\"text-align: center;\">Wu</p><p style=\"text-align: center;\">新翠徒留 落花影中游</p><p style=\"text-align: center;\">Wu</p><p style=\"text-align: center;\">相思无用 才笑山盟旧</p><p style=\"text-align: center;\">Wu</p><p style=\"text-align: center;\">谓我何求</p><p><video class=\"edui-upload-video  vjs-default-skin     video-js\" controls=\"\" preload=\"none\" width=\"420\" height=\"280\" src=\"/files/97630eaf-e568-4d43-934d-420cbeab598f.mp4\" data-setup=\"{}\"><source src=\"/files/97630eaf-e568-4d43-934d-420cbeab598f.mp4\" type=\"video/mp4\"/></video></p><p style=\"text-align: center;\"><span style=\"font-size: 12px;\"></span></p><p style=\"display: none;\"><br/></p><p style=\"display: none;\"><br/></p><p style=\"display: none;\"><br/></p><p style=\"display: none;\"><br/></p><p style=\"display:none;\" data-background=\"background-repeat:no-repeat; background-position:center center; background-color:transparent; background-image:url(http://localhost:9980/files/d55aae42-cd7a-4b74-b6e9-8f01c2283cfd.jpg);\"><br/></p>', 4, 2, 0, NULL, '2019-09-25 11:19:02', '2019-09-25 15:31:23', '1', '', NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_information` VALUES ('cc5f4f73cc3a4197a91a910de8da126c', '我是标题我是标题xxx', '<p><strong>加粗</strong></p><p><em>斜体</em></p><p><span style=\"text-decoration: underline;\">下划线</span></p><p><span style=\"color: rgb(255, 0, 0);\"><strong>红色</strong></span></p><p><span style=\"color: rgb(0, 176, 240);\"><strong>蓝色</strong></span></p><p><video class=\"edui-upload-video  vjs-default-skin video-js\" controls=\"\" preload=\"none\" width=\"420\" height=\"280\" src=\"http://bbct.kkg222.com/files/3524c9e6-fb06-4673-8693-3d9b1996d62a.mp4\" data-setup=\"{}\"><source src=\"http://bbct.kkg222.com/files/3524c9e6-fb06-4673-8693-3d9b1996d62a.mp4\" type=\"video/mp4\"/></video></p>', 4, 2, 0, '', '2019-09-25 18:39:26', '2019-09-27 14:29:55', '0', '', '4241087d0ee2493fa002e8d71f7344b7', 1, NULL, NULL);
INSERT INTO `t_sys_information` VALUES ('ccbd194b04ce4226adb661c363cda722', '游戏', NULL, 4, 1, 0, NULL, '2019-09-25 17:36:53', '2019-09-25 17:36:53', '0', '', NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_information` VALUES ('d248a1eceede4864bea3f34e3dcb6659', '工具', NULL, 4, 1, 0, NULL, '2019-09-25 17:37:02', '2019-09-25 17:37:02', '0', '', NULL, NULL, NULL, NULL);
INSERT INTO `t_sys_information` VALUES ('d4022a4b212c4d41bfd1c73273e1206c', '关于BBCT即将上线的公告', '<p><img src=\"http://bbct.kkg222.com/files/b3939101-2a95-4fb8-9158-15d849ef5d20.png\" title=\"path\" alt=\"path\"/></p><p><video class=\"edui-upload-video  vjs-default-skin video-js\" controls=\"\" preload=\"none\" width=\"420\" height=\"280\" src=\"http://bbct.kkg222.com/files/92aedbc6-cb57-40d9-b9e4-d69db3002020.mp4\" data-setup=\"{}\"><source src=\"http://bbct.kkg222.com/files/92aedbc6-cb57-40d9-b9e4-d69db3002020.mp4\" type=\"video/mp4\"/></video></p>', 4, 2, 0, '', '2019-09-25 18:03:49', '2019-09-26 18:20:49', '0', '', '4241087d0ee2493fa002e8d71f7344b7', 1, NULL, NULL);
INSERT INTO `t_sys_information` VALUES ('df65536eb6e6450387ac54152f4caeae', '金融理财', '', 2, 1, 0, '', '2019-09-25 17:32:07', '2019-09-26 17:35:25', '0', '/files/625f24f2-50d3-4dcd-98e0-1bf452282b04.png', NULL, 1, NULL, NULL);
INSERT INTO `t_sys_information` VALUES ('e83f001fae3c493590b8a3224f3d7f24', '非小号', '', 3, 1, 0, '', '2019-09-25 17:35:01', '2019-09-26 17:33:19', '0', '/files/87aa7328-003a-4337-ac47-8eaff2d2fecb.png', NULL, 1, NULL, NULL);
INSERT INTO `t_sys_information` VALUES ('f65e93683531441f951b80399ebbca47', '平台红包', '', 2, 1, 0, '', '2019-09-25 17:31:41', '2019-09-26 17:35:10', '0', '/files/902c3a5e-acfb-4461-81ab-427590404e3f.png', NULL, 1, NULL, NULL);
INSERT INTO `t_sys_information` VALUES ('ffe18d0160ff45f5b62e142f466ceb49', '新闻', NULL, 4, 1, 0, NULL, '2019-09-25 17:36:03', '2019-09-25 17:36:03', '0', '', NULL, NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
