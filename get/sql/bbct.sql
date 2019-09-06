/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50723
 Source Host           : localhost:3306
 Source Schema         : bbct

 Target Server Type    : MySQL
 Target Server Version : 50723
 File Encoding         : 65001

 Date: 06/09/2019 19:35:58
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
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'app更新记录表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1224 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文件上传' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 7464349 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES (7462916, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/getCoinTrading', '{\"accessKey\":\"b5d0906b65e6431484162f30ae4da0b2\"}', '113.116.28.253', '2019-05-04 21:13:24', 'sesame');
INSERT INTO `sys_log` VALUES (7462917, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/get_appinfo', '{}', '113.116.28.253', '2019-05-04 21:13:24', 'sesame');
INSERT INTO `sys_log` VALUES (7462918, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/otc/get_fiat_type_price', '{\"accessKey\":\"b5d0906b65e6431484162f30ae4da0b2\"}', '113.116.28.253', '2019-05-04 21:13:24', 'sesame');
INSERT INTO `sys_log` VALUES (7462919, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"b5d0906b65e6431484162f30ae4da0b2\"}', '113.116.28.253', '2019-05-04 21:13:24', 'sesame');
INSERT INTO `sys_log` VALUES (7462920, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/coin/getAllCoinTraingOrder', '{\"accessKey\":\"b5d0906b65e6431484162f30ae4da0b2\",\"order_type\":\"1\"}', '113.116.28.253', '2019-05-04 21:13:33', 'sesame');
INSERT INTO `sys_log` VALUES (7462921, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"b5d0906b65e6431484162f30ae4da0b2\"}', '113.116.28.253', '2019-05-04 21:13:36', 'sesame');
INSERT INTO `sys_log` VALUES (7462922, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userRecord', '{\"offset\":\"0\",\"accessKey\":\"b5d0906b65e6431484162f30ae4da0b2\",\"coinTypeId\":\"003\",\"num\":\"\",\"limit\":\"20\",\"type\":\"\"}', '113.116.28.253', '2019-05-04 21:13:38', 'sesame');
INSERT INTO `sys_log` VALUES (7462923, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userRecord', '{\"offset\":\"0\",\"accessKey\":\"b5d0906b65e6431484162f30ae4da0b2\",\"coinTypeId\":\"bb0fa0c784bd4886ad1fa223366c167f\",\"num\":\"\",\"limit\":\"20\",\"type\":\"\"}', '113.116.28.253', '2019-05-04 21:13:42', 'sesame');
INSERT INTO `sys_log` VALUES (7462924, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userRecord', '{\"offset\":\"0\",\"accessKey\":\"b5d0906b65e6431484162f30ae4da0b2\",\"coinTypeId\":\"d4dbebaacb3846bf9180447797b9d909\",\"num\":\"\",\"limit\":\"20\",\"type\":\"\"}', '113.116.28.253', '2019-05-04 21:13:47', 'sesame');
INSERT INTO `sys_log` VALUES (7462925, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/get_appinfo', '{}', '113.116.28.253', '2019-05-04 21:13:57', 'sesame');
INSERT INTO `sys_log` VALUES (7462926, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"b5d0906b65e6431484162f30ae4da0b2\"}', '113.116.28.253', '2019-05-04 21:25:45', 'sesame');
INSERT INTO `sys_log` VALUES (7462927, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/get_appinfo', '{}', '113.116.28.253', '2019-05-04 21:25:47', 'sesame');
INSERT INTO `sys_log` VALUES (7462928, -1, '获取用户信息为空', 'normal', NULL, '/manager/login;JSESSIONID=2d51801b-7e44-45ef-8419-42d0a5312286', '{}', '127.0.0.1', '2019-05-05 09:56:29', 'sesame');
INSERT INTO `sys_log` VALUES (7462929, 1, 'admin', 'normal', NULL, '/manager/login', '{\"password\":\"123456\",\"mobileCheckCode\":\"\",\"username\":\"admin\",\"checkCode\":\"yhb9\"}', '127.0.0.1', '2019-05-05 09:56:40', 'sesame');
INSERT INTO `sys_log` VALUES (7462930, 1, 'admin', 'normal', NULL, '/manager/index', '{}', '127.0.0.1', '2019-05-05 09:56:40', 'sesame');
INSERT INTO `sys_log` VALUES (7462931, 1, 'admin', 'normal', NULL, '/manager/main', '{}', '127.0.0.1', '2019-05-05 09:56:40', 'sesame');
INSERT INTO `sys_log` VALUES (7462932, 1, 'admin', 'normal', NULL, '/manager/oa/notify/message', '{}', '127.0.0.1', '2019-05-05 09:56:41', 'sesame');
INSERT INTO `sys_log` VALUES (7462933, 1, 'admin', 'normal', NULL, '/manager/main', '{}', '127.0.0.1', '2019-05-05 09:56:41', 'sesame');
INSERT INTO `sys_log` VALUES (7462934, 1, 'admin', 'normal', NULL, '/api/report/getUserRegisteredNum', '{\"endDate\":\"2019-5-5\",\"startDate\":\"2019-4-5\"}', '127.0.0.1', '2019-05-05 09:56:41', 'sesame');
INSERT INTO `sys_log` VALUES (7462935, 1, 'admin', 'error', NULL, 'http://localhost:91/api/report/getBaseReport', 'org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'account_id\' in \'where clause\'\r\n### The error may exist in com/sesame/system/report/dao/BaseReportDao.java (best guess)\r\n### The error may involve com.sesame.system.report.dao.BaseReportDao.getRYBYesterdayAddLockCoin-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select sum(lock_currency) FROM t_lp_account_invest_project  WHERE (account_id LIKE \'%-RYBLock\') and  (date(create_date) = date(?) )\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'account_id\' in \'where clause\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'account_id\' in \'where clause\'', NULL, '2019-05-05 09:56:41', NULL);
INSERT INTO `sys_log` VALUES (7462936, 1, 'admin', 'error', NULL, 'http://localhost:91/api/report/getProfitCoinRelease', 'org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column \'kplus.t_profit_coin_release.release_date\' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by\r\n### The error may exist in com/sesame/system/report/dao/BaseReportDao.java (best guess)\r\n### The error may involve com.sesame.system.report.dao.BaseReportDao.getProfitCoinRelease-Inline\r\n### The error occurred while setting parameters\r\n### SQL: SELECT release_date date,currency FROM t_profit_coin_release WHERE ( date ( release_date ) >= date ( ? ) AND date ( release_date ) <= date ( ? ) ) GROUP BY date ( release_date ) ORDER BY date asc\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column \'kplus.t_profit_coin_release.release_date\' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column \'kplus.t_profit_coin_release.release_date\' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by', NULL, '2019-05-05 09:56:41', NULL);
INSERT INTO `sys_log` VALUES (7462937, 1, 'admin', 'normal', NULL, '/', '{}', '127.0.0.1', '2019-05-05 09:56:41', 'sesame');
INSERT INTO `sys_log` VALUES (7462938, 1, 'admin', 'normal', NULL, '/api/report/getBaseReport', '{}', '127.0.0.1', '2019-05-05 09:56:41', 'sesame');
INSERT INTO `sys_log` VALUES (7462939, 1, 'admin', 'normal', NULL, '/api/report/getProfitCoinRelease', '{\"endDate\":\"2021-5-5\",\"startDate\":\"2019-5-5\"}', '127.0.0.1', '2019-05-05 09:56:41', 'sesame');
INSERT INTO `sys_log` VALUES (7462940, 1, 'admin', 'normal', NULL, '/manager/login', '{}', '127.0.0.1', '2019-05-05 09:56:41', 'sesame');
INSERT INTO `sys_log` VALUES (7462941, 1, 'admin', 'normal', NULL, '/manager/sysconfig/config', '{\"clazzName\":\"SettlementCommonConfig\"}', '127.0.0.1', '2019-05-05 09:58:41', 'sesame');
INSERT INTO `sys_log` VALUES (7462942, 1, 'admin', 'normal', NULL, '/manager/sysconfig/config', '{\"clazzName\":\"SettlementCommonConfig\"}', '127.0.0.1', '2019-05-05 09:58:41', 'sesame');
INSERT INTO `sys_log` VALUES (7462943, 1, 'admin', 'normal', NULL, '/manager/sysconfig/config/list', '{\"clazzName\":\"SettlementCommonConfig\"}', '127.0.0.1', '2019-05-05 09:58:41', 'sesame');
INSERT INTO `sys_log` VALUES (7462944, 1, 'admin', 'normal', NULL, '/manager/index', '{}', '127.0.0.1', '2019-05-05 09:59:04', 'sesame');
INSERT INTO `sys_log` VALUES (7462945, 1, 'admin', 'normal', NULL, '/manager/main', '{}', '127.0.0.1', '2019-05-05 09:59:04', 'sesame');
INSERT INTO `sys_log` VALUES (7462946, 1, 'admin', 'normal', NULL, '/manager/oa/notify/message', '{}', '127.0.0.1', '2019-05-05 09:59:04', 'sesame');
INSERT INTO `sys_log` VALUES (7462947, 1, 'admin', 'normal', NULL, '/manager/main', '{}', '127.0.0.1', '2019-05-05 09:59:04', 'sesame');
INSERT INTO `sys_log` VALUES (7462948, 1, 'admin', 'error', NULL, 'http://localhost:91/api/report/getProfitCoinRelease', 'org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column \'kplus.t_profit_coin_release.release_date\' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by\r\n### The error may exist in com/sesame/system/report/dao/BaseReportDao.java (best guess)\r\n### The error may involve com.sesame.system.report.dao.BaseReportDao.getProfitCoinRelease-Inline\r\n### The error occurred while setting parameters\r\n### SQL: SELECT release_date date,currency FROM t_profit_coin_release WHERE ( date ( release_date ) >= date ( ? ) AND date ( release_date ) <= date ( ? ) ) GROUP BY date ( release_date ) ORDER BY date asc\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column \'kplus.t_profit_coin_release.release_date\' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column \'kplus.t_profit_coin_release.release_date\' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by', NULL, '2019-05-05 09:59:04', NULL);
INSERT INTO `sys_log` VALUES (7462949, 1, 'admin', 'normal', NULL, '/api/report/getUserRegisteredNum', '{\"endDate\":\"2019-5-5\",\"startDate\":\"2019-4-5\"}', '127.0.0.1', '2019-05-05 09:59:04', 'sesame');
INSERT INTO `sys_log` VALUES (7462950, 1, 'admin', 'error', NULL, 'http://localhost:91/api/report/getBaseReport', 'org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'account_id\' in \'where clause\'\r\n### The error may exist in com/sesame/system/report/dao/BaseReportDao.java (best guess)\r\n### The error may involve com.sesame.system.report.dao.BaseReportDao.getRYBYesterdayAddLockCoin-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select sum(lock_currency) FROM t_lp_account_invest_project  WHERE (account_id LIKE \'%-RYBLock\') and  (date(create_date) = date(?) )\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'account_id\' in \'where clause\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'account_id\' in \'where clause\'', NULL, '2019-05-05 09:59:04', NULL);
INSERT INTO `sys_log` VALUES (7462951, 1, 'admin', 'normal', NULL, '/api/report/getProfitCoinRelease', '{\"endDate\":\"2021-5-5\",\"startDate\":\"2019-5-5\"}', '127.0.0.1', '2019-05-05 09:59:04', 'sesame');
INSERT INTO `sys_log` VALUES (7462952, 1, 'admin', 'normal', NULL, '/api/report/getBaseReport', '{}', '127.0.0.1', '2019-05-05 09:59:04', 'sesame');
INSERT INTO `sys_log` VALUES (7462953, 1, 'admin', 'normal', NULL, '/', '{}', '127.0.0.1', '2019-05-05 09:59:05', 'sesame');
INSERT INTO `sys_log` VALUES (7462954, 1, 'admin', 'normal', NULL, '/manager/login', '{}', '127.0.0.1', '2019-05-05 09:59:05', 'sesame');
INSERT INTO `sys_log` VALUES (7462955, 1, 'admin', 'normal', NULL, '/manager/sysconfig/config', '{\"clazzName\":\"SettlementCommonConfig\"}', '127.0.0.1', '2019-05-05 09:59:06', 'sesame');
INSERT INTO `sys_log` VALUES (7462956, 1, 'admin', 'normal', NULL, '/manager/sysconfig/config', '{\"clazzName\":\"SettlementCommonConfig\"}', '127.0.0.1', '2019-05-05 09:59:06', 'sesame');
INSERT INTO `sys_log` VALUES (7462957, 1, 'admin', 'normal', NULL, '/manager/sysconfig/config/list', '{\"clazzName\":\"SettlementCommonConfig\"}', '127.0.0.1', '2019-05-05 09:59:06', 'sesame');
INSERT INTO `sys_log` VALUES (7462958, 1, 'admin', 'normal', NULL, '/manager/sysconfig/config/update', '{\"data\":\"{\\\"BackWebsiteFullName\\\":\\\"K+钱包推广系统\\\",\\\"BackWebsiteSubName\\\":\\\"K+推广系统\\\",\\\"WebsiteURL\\\":\\\"http://http://wallets.shenzhitong.cn\\\",\\\"WebsiteLogo\\\":\\\"/files/763fb1ba-5877-4762-ad65-e9eeb594a31c.png\\\",\\\"SystemAccountId\\\":\\\"1\\\",\\\"IsEnableAdminLoginMobileCheck\\\":1,\\\"UserRegGiveCoin\\\":\\\"KC\\\",\\\"UserRegGiveCoinTotalJson\\\":\\\"\\\\n    {\\\\n        \\\\\\\"regUser\\\\\\\":\\\\\\\"3\\\\\\\",\\\\n        \\\\\\\"rewardCoin\\\\\\\":\\\\\\\"2222\\\\\\\",\\\\n        \\\\\\\"freeProjectName\\\\\\\":\\\\\\\"注册曾送2222KBT+\\\\\\\"\\\\n    },\\\\n    {\\\\n        \\\\\\\"regUser\\\\\\\":\\\\\\\"4\\\\\\\",\\\\n        \\\\\\\"rewardCoin\\\\\\\":\\\\\\\"1111\\\\\\\",\\\\n        \\\\\\\"freeProjectName\\\\\\\":\\\\\\\"注册曾送1111KBT+\\\\\\\"\\\\n    },\\\\n    {\\\\n        \\\\\\\"regUser\\\\\\\":\\\\\\\"100000\\\\\\\",\\\\n        \\\\\\\"rewardCoin\\\\\\\":\\\\\\\"888\\\\\\\",\\\\n        \\\\\\\"freeProjectName\\\\\\\":\\\\\\\"注册曾送888KBT+\\\\\\\"\\\\n    }\\\\n\\\",\\\"PushUserNumber\\\":\\\"5\\\",\\\"TranReturnPercent\\\":\\\"0.5\\\",\\\"KbtToKb2Proportion\\\":\\\"100\\\"}\",\"clazzName\":\"SettlementCommonConfig\"}', '127.0.0.1', '2019-05-05 09:59:18', 'sesame');
INSERT INTO `sys_log` VALUES (7462959, 1, 'admin', 'normal', NULL, '/manager/sysconfig/config/list', '{\"clazzName\":\"SettlementCommonConfig\"}', '127.0.0.1', '2019-05-05 09:59:18', 'sesame');
INSERT INTO `sys_log` VALUES (7462960, 1, 'admin', 'normal', NULL, '/manager/index', '{}', '127.0.0.1', '2019-05-05 09:59:22', 'sesame');
INSERT INTO `sys_log` VALUES (7462961, 1, 'admin', 'normal', NULL, '/manager/main', '{}', '127.0.0.1', '2019-05-05 09:59:22', 'sesame');
INSERT INTO `sys_log` VALUES (7462962, 1, 'admin', 'normal', NULL, '/manager/oa/notify/message', '{}', '127.0.0.1', '2019-05-05 09:59:22', 'sesame');
INSERT INTO `sys_log` VALUES (7462963, 1, 'admin', 'normal', NULL, '/manager/main', '{}', '127.0.0.1', '2019-05-05 09:59:22', 'sesame');
INSERT INTO `sys_log` VALUES (7462964, 1, 'admin', 'error', NULL, 'http://localhost:91/api/report/getProfitCoinRelease', 'org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column \'kplus.t_profit_coin_release.release_date\' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by\r\n### The error may exist in com/sesame/system/report/dao/BaseReportDao.java (best guess)\r\n### The error may involve com.sesame.system.report.dao.BaseReportDao.getProfitCoinRelease-Inline\r\n### The error occurred while setting parameters\r\n### SQL: SELECT release_date date,currency FROM t_profit_coin_release WHERE ( date ( release_date ) >= date ( ? ) AND date ( release_date ) <= date ( ? ) ) GROUP BY date ( release_date ) ORDER BY date asc\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column \'kplus.t_profit_coin_release.release_date\' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column \'kplus.t_profit_coin_release.release_date\' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by', NULL, '2019-05-05 09:59:22', NULL);
INSERT INTO `sys_log` VALUES (7462965, 1, 'admin', 'normal', NULL, '/api/report/getUserRegisteredNum', '{\"endDate\":\"2019-5-5\",\"startDate\":\"2019-4-5\"}', '127.0.0.1', '2019-05-05 09:59:22', 'sesame');
INSERT INTO `sys_log` VALUES (7462966, 1, 'admin', 'error', NULL, 'http://localhost:91/api/report/getBaseReport', 'org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'account_id\' in \'where clause\'\r\n### The error may exist in com/sesame/system/report/dao/BaseReportDao.java (best guess)\r\n### The error may involve com.sesame.system.report.dao.BaseReportDao.getRYBYesterdayAddLockCoin-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select sum(lock_currency) FROM t_lp_account_invest_project  WHERE (account_id LIKE \'%-RYBLock\') and  (date(create_date) = date(?) )\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'account_id\' in \'where clause\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'account_id\' in \'where clause\'', NULL, '2019-05-05 09:59:22', NULL);
INSERT INTO `sys_log` VALUES (7462967, 1, 'admin', 'normal', NULL, '/api/report/getProfitCoinRelease', '{\"endDate\":\"2021-5-5\",\"startDate\":\"2019-5-5\"}', '127.0.0.1', '2019-05-05 09:59:22', 'sesame');
INSERT INTO `sys_log` VALUES (7462968, 1, 'admin', 'normal', NULL, '/api/report/getBaseReport', '{}', '127.0.0.1', '2019-05-05 09:59:22', 'sesame');
INSERT INTO `sys_log` VALUES (7462969, 1, 'admin', 'normal', NULL, '/manager/sysconfig/config', '{\"clazzName\":\"SettlementCommonConfig\"}', '127.0.0.1', '2019-05-05 09:59:23', 'sesame');
INSERT INTO `sys_log` VALUES (7462970, 1, 'admin', 'normal', NULL, '/manager/sysconfig/config', '{\"clazzName\":\"SettlementCommonConfig\"}', '127.0.0.1', '2019-05-05 09:59:23', 'sesame');
INSERT INTO `sys_log` VALUES (7462971, 1, 'admin', 'normal', NULL, '/manager/sysconfig/config/list', '{\"clazzName\":\"SettlementCommonConfig\"}', '127.0.0.1', '2019-05-05 09:59:23', 'sesame');
INSERT INTO `sys_log` VALUES (7462972, 1, 'admin', 'normal', NULL, '/', '{}', '127.0.0.1', '2019-05-05 09:59:28', 'sesame');
INSERT INTO `sys_log` VALUES (7462973, 1, 'admin', 'normal', NULL, '/manager/login', '{}', '127.0.0.1', '2019-05-05 09:59:29', 'sesame');
INSERT INTO `sys_log` VALUES (7462974, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/getCoinTrading', '{\"accessKey\":\"a5db385794be4d5cb4b6229068493907\"}', '119.139.199.99', '2019-05-05 10:03:39', 'sesame');
INSERT INTO `sys_log` VALUES (7462975, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/otc/get_fiat_type_price', '{\"accessKey\":\"a5db385794be4d5cb4b6229068493907\"}', '119.139.199.99', '2019-05-05 10:03:39', 'sesame');
INSERT INTO `sys_log` VALUES (7462976, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"a5db385794be4d5cb4b6229068493907\"}', '119.139.199.99', '2019-05-05 10:03:39', 'sesame');
INSERT INTO `sys_log` VALUES (7462977, 1, 'admin', 'normal', NULL, '/manager/index', '{}', '127.0.0.1', '2019-05-05 10:03:52', 'sesame');
INSERT INTO `sys_log` VALUES (7462978, 1, 'admin', 'normal', NULL, '/manager/main', '{}', '127.0.0.1', '2019-05-05 10:03:52', 'sesame');
INSERT INTO `sys_log` VALUES (7462979, 1, 'admin', 'normal', NULL, '/manager/oa/notify/message', '{}', '127.0.0.1', '2019-05-05 10:03:52', 'sesame');
INSERT INTO `sys_log` VALUES (7462980, 1, 'admin', 'normal', NULL, '/manager/main', '{}', '127.0.0.1', '2019-05-05 10:03:52', 'sesame');
INSERT INTO `sys_log` VALUES (7462981, 1, 'admin', 'error', NULL, 'http://localhost:91/api/report/getProfitCoinRelease', 'org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column \'kplus.t_profit_coin_release.release_date\' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by\r\n### The error may exist in com/sesame/system/report/dao/BaseReportDao.java (best guess)\r\n### The error may involve com.sesame.system.report.dao.BaseReportDao.getProfitCoinRelease-Inline\r\n### The error occurred while setting parameters\r\n### SQL: SELECT release_date date,currency FROM t_profit_coin_release WHERE ( date ( release_date ) >= date ( ? ) AND date ( release_date ) <= date ( ? ) ) GROUP BY date ( release_date ) ORDER BY date asc\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column \'kplus.t_profit_coin_release.release_date\' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column \'kplus.t_profit_coin_release.release_date\' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by', NULL, '2019-05-05 10:03:52', NULL);
INSERT INTO `sys_log` VALUES (7462982, 1, 'admin', 'normal', NULL, '/api/report/getUserRegisteredNum', '{\"endDate\":\"2019-5-5\",\"startDate\":\"2019-4-5\"}', '127.0.0.1', '2019-05-05 10:03:52', 'sesame');
INSERT INTO `sys_log` VALUES (7462983, 1, 'admin', 'error', NULL, 'http://localhost:91/api/report/getBaseReport', 'org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'account_id\' in \'where clause\'\r\n### The error may exist in com/sesame/system/report/dao/BaseReportDao.java (best guess)\r\n### The error may involve com.sesame.system.report.dao.BaseReportDao.getRYBYesterdayAddLockCoin-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select sum(lock_currency) FROM t_lp_account_invest_project  WHERE (account_id LIKE \'%-RYBLock\') and  (date(create_date) = date(?) )\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'account_id\' in \'where clause\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'account_id\' in \'where clause\'', NULL, '2019-05-05 10:03:52', NULL);
INSERT INTO `sys_log` VALUES (7462984, 1, 'admin', 'normal', NULL, '/api/report/getProfitCoinRelease', '{\"endDate\":\"2021-5-5\",\"startDate\":\"2019-5-5\"}', '127.0.0.1', '2019-05-05 10:03:52', 'sesame');
INSERT INTO `sys_log` VALUES (7462985, 1, 'admin', 'normal', NULL, '/api/report/getBaseReport', '{}', '127.0.0.1', '2019-05-05 10:03:52', 'sesame');
INSERT INTO `sys_log` VALUES (7462986, -1, '获取用户信息为空', 'normal', NULL, '/', '{}', '127.0.0.1', '2019-05-05 10:03:56', 'sesame');
INSERT INTO `sys_log` VALUES (7462987, -1, '获取用户信息为空', 'normal', NULL, '/manager/login', '{}', '127.0.0.1', '2019-05-05 10:03:56', 'sesame');
INSERT INTO `sys_log` VALUES (7462988, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/otc/get_fiat_type_price', '{\"accessKey\":\"a5db385794be4d5cb4b6229068493907\"}', '119.139.199.99', '2019-05-05 10:04:09', 'sesame');
INSERT INTO `sys_log` VALUES (7462989, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/getCoinTrading', '{\"accessKey\":\"a5db385794be4d5cb4b6229068493907\"}', '119.139.199.99', '2019-05-05 10:04:09', 'sesame');
INSERT INTO `sys_log` VALUES (7462990, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"a5db385794be4d5cb4b6229068493907\"}', '119.139.199.99', '2019-05-05 10:04:09', 'sesame');
INSERT INTO `sys_log` VALUES (7462991, -1, '获取用户信息为空', 'normal', NULL, '/manager/login;JSESSIONID=ac51ee6d-dfea-4b62-8a1f-b65de524cfd0', '{}', '127.0.0.1', '2019-05-05 10:04:22', 'sesame');
INSERT INTO `sys_log` VALUES (7462992, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"a5db385794be4d5cb4b6229068493907\"}', '119.139.199.99', '2019-05-05 10:04:27', 'sesame');
INSERT INTO `sys_log` VALUES (7462993, 1, 'admin', 'normal', NULL, '/manager/login', '{\"password\":\"123456\",\"mobileCheckCode\":\"\",\"username\":\"admin\",\"checkCode\":\"eomg\"}', '127.0.0.1', '2019-05-05 10:04:31', 'sesame');
INSERT INTO `sys_log` VALUES (7462994, 1, 'admin', 'normal', NULL, '/manager/index', '{}', '127.0.0.1', '2019-05-05 10:04:31', 'sesame');
INSERT INTO `sys_log` VALUES (7462995, 1, 'admin', 'normal', NULL, '/manager/main', '{}', '127.0.0.1', '2019-05-05 10:04:31', 'sesame');
INSERT INTO `sys_log` VALUES (7462996, 1, 'admin', 'normal', NULL, '/manager/oa/notify/message', '{}', '127.0.0.1', '2019-05-05 10:04:31', 'sesame');
INSERT INTO `sys_log` VALUES (7462997, 1, 'admin', 'normal', NULL, '/manager/main', '{}', '127.0.0.1', '2019-05-05 10:04:31', 'sesame');
INSERT INTO `sys_log` VALUES (7462998, 1, 'admin', 'normal', NULL, '/api/report/getUserRegisteredNum', '{\"endDate\":\"2019-5-5\",\"startDate\":\"2019-4-5\"}', '127.0.0.1', '2019-05-05 10:04:32', 'sesame');
INSERT INTO `sys_log` VALUES (7462999, 1, 'admin', 'error', NULL, 'http://localhost:91/api/report/getBaseReport', 'org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'account_id\' in \'where clause\'\r\n### The error may exist in com/sesame/system/report/dao/BaseReportDao.java (best guess)\r\n### The error may involve com.sesame.system.report.dao.BaseReportDao.getRYBYesterdayAddLockCoin-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select sum(lock_currency) FROM t_lp_account_invest_project  WHERE (account_id LIKE \'%-RYBLock\') and  (date(create_date) = date(?) )\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'account_id\' in \'where clause\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'account_id\' in \'where clause\'', NULL, '2019-05-05 10:04:32', NULL);
INSERT INTO `sys_log` VALUES (7463000, 1, 'admin', 'error', NULL, 'http://localhost:91/api/report/getProfitCoinRelease', 'org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column \'kplus.t_profit_coin_release.release_date\' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by\r\n### The error may exist in com/sesame/system/report/dao/BaseReportDao.java (best guess)\r\n### The error may involve com.sesame.system.report.dao.BaseReportDao.getProfitCoinRelease-Inline\r\n### The error occurred while setting parameters\r\n### SQL: SELECT release_date date,currency FROM t_profit_coin_release WHERE ( date ( release_date ) >= date ( ? ) AND date ( release_date ) <= date ( ? ) ) GROUP BY date ( release_date ) ORDER BY date asc\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column \'kplus.t_profit_coin_release.release_date\' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column \'kplus.t_profit_coin_release.release_date\' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by', NULL, '2019-05-05 10:04:32', NULL);
INSERT INTO `sys_log` VALUES (7463001, 1, 'admin', 'normal', NULL, '/api/report/getBaseReport', '{}', '127.0.0.1', '2019-05-05 10:04:32', 'sesame');
INSERT INTO `sys_log` VALUES (7463002, 1, 'admin', 'normal', NULL, '/api/report/getProfitCoinRelease', '{\"endDate\":\"2021-5-5\",\"startDate\":\"2019-5-5\"}', '127.0.0.1', '2019-05-05 10:04:32', 'sesame');
INSERT INTO `sys_log` VALUES (7463003, 1, 'admin', 'normal', NULL, '/manager/sesame/appInfo', '{}', '127.0.0.1', '2019-05-05 10:04:33', 'sesame');
INSERT INTO `sys_log` VALUES (7463004, 1, 'admin', 'normal', NULL, '/manager/sesame/appInfo/list', '{}', '127.0.0.1', '2019-05-05 10:04:33', 'sesame');
INSERT INTO `sys_log` VALUES (7463005, 1, 'admin', 'normal', NULL, '/', '{}', '127.0.0.1', '2019-05-05 10:04:34', 'sesame');
INSERT INTO `sys_log` VALUES (7463006, 1, 'admin', 'normal', NULL, '/manager/login', '{}', '127.0.0.1', '2019-05-05 10:04:34', 'sesame');
INSERT INTO `sys_log` VALUES (7463007, 1, 'admin', 'normal', NULL, '/manager/sysconfig/config', '{\"clazzName\":\"SettlementCommonConfig\"}', '127.0.0.1', '2019-05-05 10:04:34', 'sesame');
INSERT INTO `sys_log` VALUES (7463008, 1, 'admin', 'normal', NULL, '/manager/sysconfig/config', '{\"clazzName\":\"SettlementCommonConfig\"}', '127.0.0.1', '2019-05-05 10:04:34', 'sesame');
INSERT INTO `sys_log` VALUES (7463009, 1, 'admin', 'normal', NULL, '/manager/sysconfig/config/list', '{\"clazzName\":\"SettlementCommonConfig\"}', '127.0.0.1', '2019-05-05 10:04:34', 'sesame');
INSERT INTO `sys_log` VALUES (7463010, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"a5db385794be4d5cb4b6229068493907\"}', '10.235.20.62', '2019-05-05 10:09:05', 'sesame');
INSERT INTO `sys_log` VALUES (7463011, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/getCoinTrading', '{\"accessKey\":\"a5db385794be4d5cb4b6229068493907\"}', '10.235.20.62', '2019-05-05 10:09:09', 'sesame');
INSERT INTO `sys_log` VALUES (7463012, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/otc/get_fiat_type_price', '{\"accessKey\":\"a5db385794be4d5cb4b6229068493907\"}', '10.235.20.62', '2019-05-05 10:09:09', 'sesame');
INSERT INTO `sys_log` VALUES (7463013, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"a5db385794be4d5cb4b6229068493907\"}', '10.235.20.62', '2019-05-05 10:09:09', 'sesame');
INSERT INTO `sys_log` VALUES (7463014, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userRecord', '{\"offset\":\"0\",\"accessKey\":\"a5db385794be4d5cb4b6229068493907\",\"coinTypeId\":\"003\",\"num\":\"\",\"limit\":\"20\",\"type\":\"\"}', '10.235.20.62', '2019-05-05 10:09:13', 'sesame');
INSERT INTO `sys_log` VALUES (7463015, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"a5db385794be4d5cb4b6229068493907\"}', '10.235.20.62', '2019-05-05 10:09:18', 'sesame');
INSERT INTO `sys_log` VALUES (7463016, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"a5db385794be4d5cb4b6229068493907\"}', '10.235.20.62', '2019-05-05 10:09:18', 'sesame');
INSERT INTO `sys_log` VALUES (7463017, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userRecord', '{\"offset\":\"0\",\"accessKey\":\"a5db385794be4d5cb4b6229068493907\",\"num\":\"\",\"limit\":\"20\",\"type\":\"\"}', '10.235.20.62', '2019-05-05 10:09:19', 'sesame');
INSERT INTO `sys_log` VALUES (7463018, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userRecord', '{\"offset\":\"0\",\"accessKey\":\"a5db385794be4d5cb4b6229068493907\",\"num\":\"\",\"limit\":\"20\",\"type\":\"\"}', '10.235.20.62', '2019-05-05 10:10:34', 'sesame');
INSERT INTO `sys_log` VALUES (7463019, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userRecord', '{\"offset\":\"1\",\"accessKey\":\"a5db385794be4d5cb4b6229068493907\",\"num\":\"\",\"limit\":\"20\",\"type\":\"\"}', '10.235.20.63', '2019-05-05 10:10:53', 'sesame');
INSERT INTO `sys_log` VALUES (7463020, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/get_appinfo', '{}', '119.139.199.99', '2019-05-05 10:11:17', 'sesame');
INSERT INTO `sys_log` VALUES (7463021, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userRecord', '{\"offset\":\"0\",\"accessKey\":\"a5db385794be4d5cb4b6229068493907\",\"num\":\"\",\"limit\":\"20\",\"type\":\"\"}', '10.235.20.62', '2019-05-05 10:11:25', 'sesame');
INSERT INTO `sys_log` VALUES (7463022, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userRecord', '{\"offset\":\"0\",\"accessKey\":\"a5db385794be4d5cb4b6229068493907\",\"num\":\"\",\"limit\":\"20\",\"type\":\"\"}', '10.235.20.63', '2019-05-05 10:11:42', 'sesame');
INSERT INTO `sys_log` VALUES (7463023, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userRecord', '{\"offset\":\"1\",\"accessKey\":\"a5db385794be4d5cb4b6229068493907\",\"num\":\"\",\"limit\":\"20\",\"type\":\"\"}', '10.235.20.63', '2019-05-05 10:12:34', 'sesame');
INSERT INTO `sys_log` VALUES (7463024, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userRecord', '{\"offset\":\"1\",\"accessKey\":\"a5db385794be4d5cb4b6229068493907\",\"num\":\"\",\"limit\":\"2\",\"type\":\"\"}', '10.235.20.63', '2019-05-05 10:12:45', 'sesame');
INSERT INTO `sys_log` VALUES (7463025, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userRecord', '{\"offset\":\"2\",\"accessKey\":\"a5db385794be4d5cb4b6229068493907\",\"num\":\"\",\"limit\":\"2\",\"type\":\"\"}', '10.235.20.63', '2019-05-05 10:12:51', 'sesame');
INSERT INTO `sys_log` VALUES (7463026, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userRecord', '{\"offset\":\"3\",\"accessKey\":\"a5db385794be4d5cb4b6229068493907\",\"num\":\"\",\"limit\":\"2\",\"type\":\"\"}', '10.235.20.63', '2019-05-05 10:12:54', 'sesame');
INSERT INTO `sys_log` VALUES (7463027, NULL, NULL, 'error', NULL, 'http://10.235.20.176:91/api/app/pv/userRecord', 'java.lang.NumberFormatException: For input string: \"0\n\"', NULL, '2019-05-05 10:13:01', NULL);
INSERT INTO `sys_log` VALUES (7463028, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userRecord', '{\"offset\":\"0\\n\",\"accessKey\":\"a5db385794be4d5cb4b6229068493907\",\"num\":\"\",\"limit\":\"2\",\"type\":\"\"}', '10.235.20.63', '2019-05-05 10:13:02', 'sesame');
INSERT INTO `sys_log` VALUES (7463029, NULL, NULL, 'error', NULL, 'http://10.235.20.176:91/api/app/pv/userRecord', 'java.lang.NumberFormatException: For input string: \"0\n\"', NULL, '2019-05-05 10:13:07', NULL);
INSERT INTO `sys_log` VALUES (7463030, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userRecord', '{\"offset\":\"0\\n\",\"accessKey\":\"a5db385794be4d5cb4b6229068493907\",\"num\":\"\",\"limit\":\"2\",\"type\":\"\"}', '10.235.20.63', '2019-05-05 10:13:07', 'sesame');
INSERT INTO `sys_log` VALUES (7463031, NULL, NULL, 'error', NULL, 'http://10.235.20.176:91/api/app/pv/userRecord', 'java.lang.NumberFormatException: For input string: \"0\n\"', NULL, '2019-05-05 10:13:11', NULL);
INSERT INTO `sys_log` VALUES (7463032, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userRecord', '{\"offset\":\"0\\n\",\"accessKey\":\"a5db385794be4d5cb4b6229068493907\",\"num\":\"\",\"limit\":\"2\",\"type\":\"\"}', '10.235.20.63', '2019-05-05 10:13:11', 'sesame');
INSERT INTO `sys_log` VALUES (7463033, NULL, NULL, 'error', NULL, 'http://10.235.20.176:91/api/app/pv/userRecord', 'java.lang.NumberFormatException: For input string: \"0\n\"', NULL, '2019-05-05 10:13:20', NULL);
INSERT INTO `sys_log` VALUES (7463034, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userRecord', '{\"offset\":\"0\\n\",\"accessKey\":\"a5db385794be4d5cb4b6229068493907\",\"num\":\"\",\"limit\":\"20\",\"type\":\"\"}', '10.235.20.63', '2019-05-05 10:13:20', 'sesame');
INSERT INTO `sys_log` VALUES (7463035, NULL, NULL, 'error', NULL, 'http://10.235.20.176:91/api/app/pv/userRecord', 'java.lang.NumberFormatException: For input string: \"0\n\"', NULL, '2019-05-05 10:13:31', NULL);
INSERT INTO `sys_log` VALUES (7463036, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userRecord', '{\"offset\":\"0\\n\",\"accessKey\":\"a5db385794be4d5cb4b6229068493907\",\"num\":\"\",\"limit\":\"20\",\"type\":\"\"}', '10.235.20.63', '2019-05-05 10:13:31', 'sesame');
INSERT INTO `sys_log` VALUES (7463037, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/get_appinfo', '{}', '119.139.199.99', '2019-05-05 10:13:46', 'sesame');
INSERT INTO `sys_log` VALUES (7463038, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/otc/user_all_buy_order', '{\"accessKey\":\"a5db385794be4d5cb4b6229068493907\"}', '10.235.20.62', '2019-05-05 10:14:53', 'sesame');
INSERT INTO `sys_log` VALUES (7463039, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"a5db385794be4d5cb4b6229068493907\"}', '10.235.20.62', '2019-05-05 10:14:54', 'sesame');
INSERT INTO `sys_log` VALUES (7463040, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userRecord', '{\"offset\":\"0\",\"accessKey\":\"a5db385794be4d5cb4b6229068493907\",\"num\":\"\",\"limit\":\"20\",\"type\":\"\"}', '10.235.20.62', '2019-05-05 10:14:55', 'sesame');
INSERT INTO `sys_log` VALUES (7463041, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"a5db385794be4d5cb4b6229068493907\"}', '10.235.20.62', '2019-05-05 10:15:13', 'sesame');
INSERT INTO `sys_log` VALUES (7463042, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userRecord', '{\"offset\":\"0\",\"accessKey\":\"a5db385794be4d5cb4b6229068493907\",\"coinTypeId\":\"bb0fa0c784bd4886ad1fa223366c167f\",\"num\":\"\",\"limit\":\"20\",\"type\":\"\"}', '10.235.20.62', '2019-05-05 10:15:14', 'sesame');
INSERT INTO `sys_log` VALUES (7463043, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userRecord', '{\"offset\":\"0\",\"accessKey\":\"a5db385794be4d5cb4b6229068493907\",\"coinTypeId\":\"d4dbebaacb3846bf9180447797b9d909\",\"num\":\"\",\"limit\":\"20\",\"type\":\"\"}', '10.235.20.62', '2019-05-05 10:15:19', 'sesame');
INSERT INTO `sys_log` VALUES (7463044, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userRecord', '{\"offset\":\"0\",\"accessKey\":\"a5db385794be4d5cb4b6229068493907\",\"coinTypeId\":\"003\",\"num\":\"\",\"limit\":\"20\",\"type\":\"\"}', '10.235.20.62', '2019-05-05 10:15:21', 'sesame');
INSERT INTO `sys_log` VALUES (7463045, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userRecord', '{\"offset\":\"0\",\"accessKey\":\"a5db385794be4d5cb4b6229068493907\",\"coinTypeId\":\"bb0fa0c784bd4886ad1fa223366c167f\",\"num\":\"\",\"limit\":\"20\",\"type\":\"\"}', '10.235.20.62', '2019-05-05 10:15:24', 'sesame');
INSERT INTO `sys_log` VALUES (7463046, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userRecord', '{\"offset\":\"0\",\"accessKey\":\"a5db385794be4d5cb4b6229068493907\",\"coinTypeId\":\"d4dbebaacb3846bf9180447797b9d909\",\"num\":\"\",\"limit\":\"20\",\"type\":\"\"}', '10.235.20.62', '2019-05-05 10:15:26', 'sesame');
INSERT INTO `sys_log` VALUES (7463047, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/getFaitCoinType', '{}', '10.235.20.62', '2019-05-05 10:18:05', 'sesame');
INSERT INTO `sys_log` VALUES (7463048, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/getFaitCoinType', '{}', '10.235.20.62', '2019-05-05 10:18:57', 'sesame');
INSERT INTO `sys_log` VALUES (7463049, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/getFaitCoinType', '{}', '10.235.20.62', '2019-05-05 10:18:59', 'sesame');
INSERT INTO `sys_log` VALUES (7463050, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/login', '{\"mobile\":\"13418545078\",\"loginPass\":\"jguiz228183\",\"ex1\":\"86\"}', '10.235.20.62', '2019-05-05 10:19:17', 'sesame');
INSERT INTO `sys_log` VALUES (7463051, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/login', '{\"mobile\":\"13418545078\",\"loginPass\":\"12345678\",\"ex1\":\"86\"}', '10.235.20.62', '2019-05-05 10:19:29', 'sesame');
INSERT INTO `sys_log` VALUES (7463052, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/login', '{\"mobile\":\"13418545078\",\"loginPass\":\"12345678\",\"ex1\":\"86\"}', '10.235.20.62', '2019-05-05 10:19:57', 'sesame');
INSERT INTO `sys_log` VALUES (7463053, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/getImgCheckCodeKey', '{}', '10.235.20.62', '2019-05-05 10:20:07', 'sesame');
INSERT INTO `sys_log` VALUES (7463054, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/getImgCheckCode', '{\"imgCheckCodeKey\":\"b6f1e5285c424a2db62f6d8aa19251da\"}', '10.235.20.62', '2019-05-05 10:20:08', 'sesame');
INSERT INTO `sys_log` VALUES (7463055, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/getMobileCheckCode', '{\"mobile\":\"13418545078\",\"ex1\":\"86\"}', '10.235.20.62', '2019-05-05 10:20:15', 'sesame');
INSERT INTO `sys_log` VALUES (7463056, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/register', '{\"imgCheckCode\":\"kxbd\",\"mobile\":\"13418545078\",\"imgCheckCodeKey\":\"b6f1e5285c424a2db62f6d8aa19251da\",\"mobileCheckcode\":\"5568\",\"loginPass\":\"12345678\",\"recomId\":\"\",\"ex1\":\"86\"}', '10.235.20.62', '2019-05-05 10:20:34', 'sesame');
INSERT INTO `sys_log` VALUES (7463057, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/login', '{\"mobile\":\"13418545078\",\"loginPass\":\"12345678\",\"ex1\":\"86\"}', '10.235.20.62', '2019-05-05 10:20:34', 'sesame');
INSERT INTO `sys_log` VALUES (7463058, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/getCoinTrading', '{\"accessKey\":\"0c31edcea5e242cebd6214666a2183fd\"}', '10.235.20.62', '2019-05-05 10:20:34', 'sesame');
INSERT INTO `sys_log` VALUES (7463059, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/otc/get_fiat_type_price', '{\"accessKey\":\"0c31edcea5e242cebd6214666a2183fd\"}', '10.235.20.62', '2019-05-05 10:20:34', 'sesame');
INSERT INTO `sys_log` VALUES (7463060, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/coin/getAllCoinTraingOrder', '{\"accessKey\":\"0c31edcea5e242cebd6214666a2183fd\",\"order_type\":\"1\"}', '10.235.20.62', '2019-05-05 10:20:34', 'sesame');
INSERT INTO `sys_log` VALUES (7463061, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"0c31edcea5e242cebd6214666a2183fd\"}', '10.235.20.62', '2019-05-05 10:20:34', 'sesame');
INSERT INTO `sys_log` VALUES (7463062, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/coin/getAllCoinTraingOrder', '{\"accessKey\":\"0c31edcea5e242cebd6214666a2183fd\",\"order_type\":\"1\"}', '10.235.20.62', '2019-05-05 10:20:40', 'sesame');
INSERT INTO `sys_log` VALUES (7463063, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/coin/getAllCoinTraingOrder', '{\"accessKey\":\"0c31edcea5e242cebd6214666a2183fd\",\"order_type\":\"1\"}', '10.235.20.62', '2019-05-05 10:20:47', 'sesame');
INSERT INTO `sys_log` VALUES (7463064, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/coin/getAllCoinTraingOrder', '{\"accessKey\":\"0c31edcea5e242cebd6214666a2183fd\",\"order_type\":\"1\"}', '10.235.20.62', '2019-05-05 10:20:48', 'sesame');
INSERT INTO `sys_log` VALUES (7463065, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/coin/getAllCoinTraingOrder', '{\"accessKey\":\"0c31edcea5e242cebd6214666a2183fd\",\"order_type\":\"1\"}', '10.235.20.62', '2019-05-05 10:20:50', 'sesame');
INSERT INTO `sys_log` VALUES (7463066, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/coin/getAllCoinTraingOrder', '{\"accessKey\":\"0c31edcea5e242cebd6214666a2183fd\",\"order_type\":\"1\"}', '10.235.20.62', '2019-05-05 10:20:51', 'sesame');
INSERT INTO `sys_log` VALUES (7463067, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/coin/getAllCoinTraingOrder', '{\"accessKey\":\"0c31edcea5e242cebd6214666a2183fd\",\"order_type\":\"2\"}', '10.235.20.62', '2019-05-05 10:20:52', 'sesame');
INSERT INTO `sys_log` VALUES (7463068, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/coin/getAllCoinTraingOrder', '{\"accessKey\":\"0c31edcea5e242cebd6214666a2183fd\",\"order_type\":\"2\"}', '10.235.20.62', '2019-05-05 10:20:52', 'sesame');
INSERT INTO `sys_log` VALUES (7463069, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/coin/getAllCoinTraingOrder', '{\"accessKey\":\"0c31edcea5e242cebd6214666a2183fd\",\"order_type\":\"2\"}', '10.235.20.62', '2019-05-05 10:20:53', 'sesame');
INSERT INTO `sys_log` VALUES (7463070, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/coin/getAllCoinTraingOrder', '{\"accessKey\":\"0c31edcea5e242cebd6214666a2183fd\",\"order_type\":\"2\"}', '10.235.20.62', '2019-05-05 10:20:54', 'sesame');
INSERT INTO `sys_log` VALUES (7463071, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/coin/getAllCoinTraingOrder', '{\"accessKey\":\"0c31edcea5e242cebd6214666a2183fd\",\"order_type\":\"2\"}', '10.235.20.62', '2019-05-05 10:20:55', 'sesame');
INSERT INTO `sys_log` VALUES (7463072, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/coin/getAllCoinTraingOrder', '{\"accessKey\":\"0c31edcea5e242cebd6214666a2183fd\",\"order_type\":\"2\"}', '10.235.20.62', '2019-05-05 10:20:57', 'sesame');
INSERT INTO `sys_log` VALUES (7463073, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"0c31edcea5e242cebd6214666a2183fd\"}', '10.235.20.62', '2019-05-05 10:21:08', 'sesame');
INSERT INTO `sys_log` VALUES (7463074, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"a5db385794be4d5cb4b6229068493907\"}', '10.235.20.62', '2019-05-05 10:21:42', 'sesame');
INSERT INTO `sys_log` VALUES (7463075, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"0c31edcea5e242cebd6214666a2183fd\"}', '10.235.20.62', '2019-05-05 10:22:31', 'sesame');
INSERT INTO `sys_log` VALUES (7463076, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/otc/get_order_mer_count', '{\"accessKey\":\"0c31edcea5e242cebd6214666a2183fd\"}', '10.235.20.62', '2019-05-05 10:22:40', 'sesame');
INSERT INTO `sys_log` VALUES (7463077, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/otc/get_fiat_type_price', '{\"accessKey\":\"0c31edcea5e242cebd6214666a2183fd\"}', '10.235.20.62', '2019-05-05 10:22:40', 'sesame');
INSERT INTO `sys_log` VALUES (7463078, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/getPushUser', '{\"accessKey\":\"0c31edcea5e242cebd6214666a2183fd\"}', '10.235.20.62', '2019-05-05 10:24:01', 'sesame');
INSERT INTO `sys_log` VALUES (7463079, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/otc/user_all_buy_order', '{\"accessKey\":\"0c31edcea5e242cebd6214666a2183fd\"}', '10.235.20.62', '2019-05-05 10:24:05', 'sesame');
INSERT INTO `sys_log` VALUES (7463080, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"0c31edcea5e242cebd6214666a2183fd\"}', '10.235.20.62', '2019-05-05 10:24:06', 'sesame');
INSERT INTO `sys_log` VALUES (7463081, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"0c31edcea5e242cebd6214666a2183fd\"}', '10.235.20.62', '2019-05-05 10:24:07', 'sesame');
INSERT INTO `sys_log` VALUES (7463082, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"0c31edcea5e242cebd6214666a2183fd\"}', '10.235.20.62', '2019-05-05 10:24:07', 'sesame');
INSERT INTO `sys_log` VALUES (7463083, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"0c31edcea5e242cebd6214666a2183fd\"}', '10.235.20.62', '2019-05-05 10:24:10', 'sesame');
INSERT INTO `sys_log` VALUES (7463084, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/logout', '{\"accessKey\":\"0c31edcea5e242cebd6214666a2183fd\"}', '10.235.20.62', '2019-05-05 10:24:14', 'sesame');
INSERT INTO `sys_log` VALUES (7463085, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/getFaitCoinType', '{}', '10.235.20.62', '2019-05-05 10:24:14', 'sesame');
INSERT INTO `sys_log` VALUES (7463086, -1, '获取用户信息为空', 'normal', NULL, '/manager/login;JSESSIONID=fda015c3-7040-42c1-850d-0eef95dd4163', '{}', '119.139.199.99', '2019-05-05 10:24:31', 'sesame');
INSERT INTO `sys_log` VALUES (7463087, 1, 'admin', 'normal', NULL, '/manager/login', '{\"password\":\"123456\",\"mobileCheckCode\":\"\",\"username\":\"admin\",\"checkCode\":\"sm8n\"}', '119.139.199.99', '2019-05-05 10:24:41', 'sesame');
INSERT INTO `sys_log` VALUES (7463088, 1, 'admin', 'normal', NULL, '/manager/index', '{}', '119.139.199.99', '2019-05-05 10:24:41', 'sesame');
INSERT INTO `sys_log` VALUES (7463089, 1, 'admin', 'normal', NULL, '/manager/main', '{}', '119.139.199.99', '2019-05-05 10:24:41', 'sesame');
INSERT INTO `sys_log` VALUES (7463090, 1, 'admin', 'normal', NULL, '/manager/oa/notify/message', '{}', '119.139.199.99', '2019-05-05 10:24:41', 'sesame');
INSERT INTO `sys_log` VALUES (7463091, 1, 'admin', 'normal', NULL, '/manager/main', '{}', '119.139.199.99', '2019-05-05 10:24:42', 'sesame');
INSERT INTO `sys_log` VALUES (7463092, 1, 'admin', 'error', NULL, 'http://kplus.kkg222.com/api/report/getProfitCoinRelease', 'org.springframework.jdbc.BadSqlGrammarException: \n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column \'kplus.t_profit_coin_release.release_date\' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by\n### The error may exist in com/sesame/system/report/dao/BaseReportDao.java (best guess)\n### The error may involve com.sesame.system.report.dao.BaseReportDao.getProfitCoinRelease-Inline\n### The error occurred while setting parameters\n### SQL: SELECT release_date date,currency FROM t_profit_coin_release WHERE ( date ( release_date ) >= date ( ? ) AND date ( release_date ) <= date ( ? ) ) GROUP BY date ( release_date ) ORDER BY date asc\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column \'kplus.t_profit_coin_release.release_date\' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column \'kplus.t_profit_coin_release.release_date\' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by', NULL, '2019-05-05 10:24:42', NULL);
INSERT INTO `sys_log` VALUES (7463093, 1, 'admin', 'normal', NULL, '/api/report/getUserRegisteredNum', '{\"endDate\":\"2019-5-5\",\"startDate\":\"2019-4-5\"}', '119.139.199.99', '2019-05-05 10:24:42', 'sesame');
INSERT INTO `sys_log` VALUES (7463094, 1, 'admin', 'error', NULL, 'http://kplus.kkg222.com/api/report/getBaseReport', 'org.springframework.jdbc.BadSqlGrammarException: \n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'account_id\' in \'where clause\'\n### The error may exist in com/sesame/system/report/dao/BaseReportDao.java (best guess)\n### The error may involve com.sesame.system.report.dao.BaseReportDao.getRYBYesterdayAddLockCoin-Inline\n### The error occurred while setting parameters\n### SQL: select sum(lock_currency) FROM t_lp_account_invest_project  WHERE (account_id LIKE \'%-RYBLock\') and  (date(create_date) = date(?) )\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'account_id\' in \'where clause\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'account_id\' in \'where clause\'', NULL, '2019-05-05 10:24:42', NULL);
INSERT INTO `sys_log` VALUES (7463095, 1, 'admin', 'normal', NULL, '/api/report/getProfitCoinRelease', '{\"endDate\":\"2021-5-5\",\"startDate\":\"2019-5-5\"}', '119.139.199.99', '2019-05-05 10:24:42', 'sesame');
INSERT INTO `sys_log` VALUES (7463096, 1, 'admin', 'normal', NULL, '/api/report/getBaseReport', '{}', '119.139.199.99', '2019-05-05 10:24:42', 'sesame');
INSERT INTO `sys_log` VALUES (7463097, 1, 'admin', 'normal', NULL, '/', '{}', '119.139.199.99', '2019-05-05 10:24:42', 'sesame');
INSERT INTO `sys_log` VALUES (7463098, 1, 'admin', 'normal', NULL, '/manager/login', '{}', '119.139.199.99', '2019-05-05 10:24:42', 'sesame');
INSERT INTO `sys_log` VALUES (7463099, 1, 'admin', 'normal', NULL, '/manager/record/msgRecord', '{}', '119.139.199.99', '2019-05-05 10:24:49', 'sesame');
INSERT INTO `sys_log` VALUES (7463100, 1, 'admin', 'normal', NULL, '/manager/record/msgRecord/list', '{}', '119.139.199.99', '2019-05-05 10:24:49', 'sesame');
INSERT INTO `sys_log` VALUES (7463101, 1, 'admin', 'normal', NULL, '/manager/record/msgRecord/list', '{}', '119.139.199.99', '2019-05-05 10:24:49', 'sesame');
INSERT INTO `sys_log` VALUES (7463102, 1, 'admin', 'normal', NULL, '/manager/record/msgRecord/list', '{}', '119.139.199.99', '2019-05-05 10:24:58', 'sesame');
INSERT INTO `sys_log` VALUES (7463103, 1, 'admin', 'normal', NULL, '/manager/record/msgRecord/list', '{}', '119.139.199.99', '2019-05-05 10:25:01', 'sesame');
INSERT INTO `sys_log` VALUES (7463104, 1, 'admin', 'normal', NULL, '/manager/record/msgRecord/list', '{}', '119.139.199.99', '2019-05-05 10:25:05', 'sesame');
INSERT INTO `sys_log` VALUES (7463105, 1, 'admin', 'normal', NULL, '/manager/record/msgRecord/list', '{}', '119.139.199.99', '2019-05-05 10:25:07', 'sesame');
INSERT INTO `sys_log` VALUES (7463106, 1, 'admin', 'normal', NULL, '/manager/record/msgRecord/list', '{}', '119.139.199.99', '2019-05-05 10:25:10', 'sesame');
INSERT INTO `sys_log` VALUES (7463107, 1, 'admin', 'normal', NULL, '/manager/sesame/swUserBasic', '{}', '119.139.199.99', '2019-05-05 10:25:14', 'sesame');
INSERT INTO `sys_log` VALUES (7463108, 1, 'admin', 'normal', NULL, '/manager/sesame/swUserBasic/list', '{}', '119.139.199.99', '2019-05-05 10:25:14', 'sesame');
INSERT INTO `sys_log` VALUES (7463109, 1, 'admin', 'normal', NULL, '/manager/sesame/swUserBasic/list', '{}', '119.139.199.99', '2019-05-05 10:25:14', 'sesame');
INSERT INTO `sys_log` VALUES (7463110, 1, 'admin', 'normal', NULL, '/manager/sesame/swUserBasic/list', '{}', '119.139.199.99', '2019-05-05 10:25:33', 'sesame');
INSERT INTO `sys_log` VALUES (7463111, 1, 'admin', 'normal', NULL, '/manager/sesame/swUserBasic/list', '{}', '119.139.199.99', '2019-05-05 10:25:37', 'sesame');
INSERT INTO `sys_log` VALUES (7463112, 1, 'admin', 'normal', NULL, '/manager/sys/user/', '{}', '119.139.199.99', '2019-05-05 10:25:43', 'sesame');
INSERT INTO `sys_log` VALUES (7463113, 1, 'admin', 'normal', NULL, '/manager/sys/user/list', '{}', '119.139.199.99', '2019-05-05 10:25:43', 'sesame');
INSERT INTO `sys_log` VALUES (7463114, 1, 'admin', 'normal', NULL, '/manager/system/sysDept/tree', '{}', '119.139.199.99', '2019-05-05 10:25:43', 'sesame');
INSERT INTO `sys_log` VALUES (7463115, 1, 'admin', 'normal', NULL, '/manager/sys/menu/', '{}', '119.139.199.99', '2019-05-05 10:25:45', 'sesame');
INSERT INTO `sys_log` VALUES (7463116, 1, 'admin', 'normal', NULL, '/manager/sys/menu/list', '{\"sort\":\"order_num\"}', '119.139.199.99', '2019-05-05 10:25:45', 'sesame');
INSERT INTO `sys_log` VALUES (7463117, 1, 'admin', 'normal', NULL, '/manager/sys/role', '{}', '119.139.199.99', '2019-05-05 10:25:46', 'sesame');
INSERT INTO `sys_log` VALUES (7463118, 1, 'admin', 'normal', NULL, '/manager/sys/role/list', '{}', '119.139.199.99', '2019-05-05 10:25:46', 'sesame');
INSERT INTO `sys_log` VALUES (7463119, 1, 'admin', 'normal', NULL, '/manager/sesame/swUserBasic/list', '{}', '119.139.199.99', '2019-05-05 10:26:17', 'sesame');
INSERT INTO `sys_log` VALUES (7463120, 1, 'admin', 'normal', NULL, '/manager/sesame/swUserBasic/list', '{}', '119.139.199.99', '2019-05-05 10:26:24', 'sesame');
INSERT INTO `sys_log` VALUES (7463121, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/login', '{\"mobile\":\"16800000000\",\"loginPass\":\"12345678\",\"ex1\":\"86\"}', '10.235.20.62', '2019-05-05 10:26:47', 'sesame');
INSERT INTO `sys_log` VALUES (7463122, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/otc/get_fiat_type_price', '{\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\"}', '10.235.20.62', '2019-05-05 10:26:47', 'sesame');
INSERT INTO `sys_log` VALUES (7463123, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/getCoinTrading', '{\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\"}', '10.235.20.62', '2019-05-05 10:26:47', 'sesame');
INSERT INTO `sys_log` VALUES (7463124, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\"}', '10.235.20.62', '2019-05-05 10:26:48', 'sesame');
INSERT INTO `sys_log` VALUES (7463125, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/getPushUser', '{\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\"}', '10.235.20.62', '2019-05-05 10:26:51', 'sesame');
INSERT INTO `sys_log` VALUES (7463126, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/coin/getAllCoinTraingOrder', '{\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\",\"order_type\":\"2\"}', '10.235.20.62', '2019-05-05 10:27:11', 'sesame');
INSERT INTO `sys_log` VALUES (7463127, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/coin/getAllCoinTraingOrder', '{\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\",\"order_type\":\"2\"}', '10.235.20.62', '2019-05-05 10:27:12', 'sesame');
INSERT INTO `sys_log` VALUES (7463128, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\"}', '10.235.20.62', '2019-05-05 10:27:15', 'sesame');
INSERT INTO `sys_log` VALUES (7463129, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\"}', '10.235.20.62', '2019-05-05 10:28:21', 'sesame');
INSERT INTO `sys_log` VALUES (7463130, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\"}', '10.235.20.62', '2019-05-05 10:28:21', 'sesame');
INSERT INTO `sys_log` VALUES (7463131, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/get_appinfo', '{}', '119.139.199.99', '2019-05-05 10:29:45', 'sesame');
INSERT INTO `sys_log` VALUES (7463132, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\"}', '10.235.20.62', '2019-05-05 10:29:45', 'sesame');
INSERT INTO `sys_log` VALUES (7463133, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userRecord', '{\"offset\":\"0\",\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\",\"coinTypeId\":\"003\",\"num\":\"\",\"limit\":\"20\",\"type\":\"\"}', '10.235.20.62', '2019-05-05 10:29:49', 'sesame');
INSERT INTO `sys_log` VALUES (7463134, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userRecord', '{\"offset\":\"0\",\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\",\"coinTypeId\":\"bb0fa0c784bd4886ad1fa223366c167f\",\"num\":\"\",\"limit\":\"20\",\"type\":\"\"}', '10.235.20.62', '2019-05-05 10:30:08', 'sesame');
INSERT INTO `sys_log` VALUES (7463135, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/coin/getAllCoinTraingOrder', '{\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\",\"order_type\":\"1\"}', '10.235.20.62', '2019-05-05 10:30:14', 'sesame');
INSERT INTO `sys_log` VALUES (7463136, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/coin/getAllCoinTraingOrder', '{\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\",\"order_type\":\"1\"}', '10.235.20.62', '2019-05-05 10:30:17', 'sesame');
INSERT INTO `sys_log` VALUES (7463137, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\"}', '10.235.20.62', '2019-05-05 10:30:18', 'sesame');
INSERT INTO `sys_log` VALUES (7463138, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userRecord', '{\"offset\":\"0\",\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\",\"coinTypeId\":\"bb0fa0c784bd4886ad1fa223366c167f\",\"num\":\"\",\"limit\":\"20\",\"type\":\"\"}', '10.235.20.62', '2019-05-05 10:30:19', 'sesame');
INSERT INTO `sys_log` VALUES (7463139, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/coin/getAllCoinTraingOrder', '{\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\",\"order_type\":\"2\"}', '10.235.20.62', '2019-05-05 10:30:24', 'sesame');
INSERT INTO `sys_log` VALUES (7463140, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\"}', '10.235.20.62', '2019-05-05 10:30:28', 'sesame');
INSERT INTO `sys_log` VALUES (7463141, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/coin/getAllCoinTraingOrder', '{\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\",\"order_type\":\"2\"}', '10.235.20.62', '2019-05-05 10:30:39', 'sesame');
INSERT INTO `sys_log` VALUES (7463142, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\"}', '10.235.20.62', '2019-05-05 10:30:49', 'sesame');
INSERT INTO `sys_log` VALUES (7463143, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\"}', '10.235.20.62', '2019-05-05 10:30:49', 'sesame');
INSERT INTO `sys_log` VALUES (7463144, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\"}', '10.235.20.62', '2019-05-05 10:30:55', 'sesame');
INSERT INTO `sys_log` VALUES (7463145, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userRecord', '{\"offset\":\"0\",\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\",\"coinTypeId\":\"003\",\"num\":\"\",\"limit\":\"20\",\"type\":\"\"}', '10.235.20.62', '2019-05-05 10:30:57', 'sesame');
INSERT INTO `sys_log` VALUES (7463146, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userRecord', '{\"offset\":\"0\",\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\",\"coinTypeId\":\"d4dbebaacb3846bf9180447797b9d909\",\"num\":\"\",\"limit\":\"20\",\"type\":\"\"}', '10.235.20.62', '2019-05-05 10:31:13', 'sesame');
INSERT INTO `sys_log` VALUES (7463147, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userRecord', '{\"offset\":\"0\",\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\",\"coinTypeId\":\"003\",\"num\":\"\",\"limit\":\"20\",\"type\":\"\"}', '10.235.20.62', '2019-05-05 10:31:16', 'sesame');
INSERT INTO `sys_log` VALUES (7463148, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userRecord', '{\"offset\":\"0\",\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\",\"coinTypeId\":\"d4dbebaacb3846bf9180447797b9d909\",\"num\":\"\",\"limit\":\"20\",\"type\":\"\"}', '10.235.20.62', '2019-05-05 10:32:12', 'sesame');
INSERT INTO `sys_log` VALUES (7463149, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/coin/getAllCoinTraingOrder', '{\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\",\"order_type\":\"2\"}', '10.235.20.62', '2019-05-05 10:32:17', 'sesame');
INSERT INTO `sys_log` VALUES (7463150, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\"}', '10.235.20.62', '2019-05-05 10:32:18', 'sesame');
INSERT INTO `sys_log` VALUES (7463151, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\"}', '10.235.20.62', '2019-05-05 10:32:20', 'sesame');
INSERT INTO `sys_log` VALUES (7463152, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\"}', '10.235.20.62', '2019-05-05 10:32:23', 'sesame');
INSERT INTO `sys_log` VALUES (7463153, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/coin/getAllCoinTraingOrder', '{\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\",\"order_type\":\"2\"}', '10.235.20.62', '2019-05-05 10:33:09', 'sesame');
INSERT INTO `sys_log` VALUES (7463154, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\"}', '10.235.20.62', '2019-05-05 10:34:05', 'sesame');
INSERT INTO `sys_log` VALUES (7463155, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/coin/getAllCoinTraingOrder', '{\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\",\"order_type\":\"2\"}', '10.235.20.62', '2019-05-05 10:34:06', 'sesame');
INSERT INTO `sys_log` VALUES (7463156, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\"}', '10.235.20.62', '2019-05-05 10:34:07', 'sesame');
INSERT INTO `sys_log` VALUES (7463157, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/coin/getAllCoinTraingOrder', '{\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\",\"order_type\":\"2\"}', '10.235.20.62', '2019-05-05 10:34:08', 'sesame');
INSERT INTO `sys_log` VALUES (7463158, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\"}', '10.235.20.62', '2019-05-05 10:34:12', 'sesame');
INSERT INTO `sys_log` VALUES (7463159, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\"}', '10.235.20.62', '2019-05-05 10:34:14', 'sesame');
INSERT INTO `sys_log` VALUES (7463160, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/coin/getAllCoinTraingOrder', '{\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\",\"order_type\":\"2\"}', '10.235.20.62', '2019-05-05 10:34:15', 'sesame');
INSERT INTO `sys_log` VALUES (7463161, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\"}', '10.235.20.62', '2019-05-05 10:34:16', 'sesame');
INSERT INTO `sys_log` VALUES (7463162, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\"}', '10.235.20.62', '2019-05-05 10:34:17', 'sesame');
INSERT INTO `sys_log` VALUES (7463163, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/getAuthResult', '{\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\"}', '10.235.20.62', '2019-05-05 10:34:56', 'sesame');
INSERT INTO `sys_log` VALUES (7463164, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/getCoinTrading', '{\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\"}', '10.235.20.62', '2019-05-05 10:34:56', 'sesame');
INSERT INTO `sys_log` VALUES (7463165, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/otc/get_fiat_type_price', '{\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\"}', '10.235.20.62', '2019-05-05 10:34:56', 'sesame');
INSERT INTO `sys_log` VALUES (7463166, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\"}', '10.235.20.62', '2019-05-05 10:34:56', 'sesame');
INSERT INTO `sys_log` VALUES (7463167, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/otc/select_user_payinfo', '{\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\"}', '10.235.20.62', '2019-05-05 10:35:08', 'sesame');
INSERT INTO `sys_log` VALUES (7463168, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/getFaitCoinType', '{}', '10.235.20.62', '2019-05-05 10:35:26', 'sesame');
INSERT INTO `sys_log` VALUES (7463169, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/getFaitCoinType', '{}', '10.235.20.62', '2019-05-05 10:35:29', 'sesame');
INSERT INTO `sys_log` VALUES (7463170, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/otc/get_fiat_type_price', '{\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\"}', '10.235.20.62', '2019-05-05 10:35:33', 'sesame');
INSERT INTO `sys_log` VALUES (7463171, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/otc/user_all_buy_order', '{\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\"}', '10.235.20.62', '2019-05-05 10:35:42', 'sesame');
INSERT INTO `sys_log` VALUES (7463172, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/otc/user_all_sell_order', '{\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\"}', '10.235.20.62', '2019-05-05 10:35:43', 'sesame');
INSERT INTO `sys_log` VALUES (7463173, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/otc/user_all_finish_order', '{\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\"}', '10.235.20.62', '2019-05-05 10:35:44', 'sesame');
INSERT INTO `sys_log` VALUES (7463174, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\"}', '10.235.20.62', '2019-05-05 10:35:44', 'sesame');
INSERT INTO `sys_log` VALUES (7463175, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userRecord', '{\"offset\":\"0\",\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\",\"num\":\"\",\"limit\":\"20\",\"type\":\"\"}', '10.235.20.62', '2019-05-05 10:35:46', 'sesame');
INSERT INTO `sys_log` VALUES (7463176, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userRecord', '{\"offset\":\"0\",\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\",\"num\":\"\",\"limit\":\"20\",\"type\":\"\"}', '10.235.20.62', '2019-05-05 10:35:53', 'sesame');
INSERT INTO `sys_log` VALUES (7463177, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userRecord', '{\"offset\":\"0\",\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\",\"num\":\"\",\"limit\":\"20\",\"type\":\"2\"}', '10.235.20.62', '2019-05-05 10:35:56', 'sesame');
INSERT INTO `sys_log` VALUES (7463178, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userRecord', '{\"offset\":\"0\",\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\",\"num\":\"\",\"limit\":\"20\",\"type\":\"1\"}', '10.235.20.62', '2019-05-05 10:35:58', 'sesame');
INSERT INTO `sys_log` VALUES (7463179, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userRecord', '{\"offset\":\"0\",\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\",\"num\":\"\",\"limit\":\"20\",\"type\":\"\"}', '10.235.20.62', '2019-05-05 10:36:01', 'sesame');
INSERT INTO `sys_log` VALUES (7463180, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userRecord', '{\"offset\":\"0\",\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\",\"num\":\"\",\"limit\":\"20\",\"type\":\"1\"}', '10.235.20.62', '2019-05-05 10:36:04', 'sesame');
INSERT INTO `sys_log` VALUES (7463181, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/get_information', '{}', '10.235.20.62', '2019-05-05 10:36:07', 'sesame');
INSERT INTO `sys_log` VALUES (7463182, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/get_appinfo', '{}', '10.235.20.62', '2019-05-05 10:36:54', 'sesame');
INSERT INTO `sys_log` VALUES (7463183, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/otc/get_order_mer_count', '{\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\"}', '10.235.20.62', '2019-05-05 10:37:14', 'sesame');
INSERT INTO `sys_log` VALUES (7463184, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/otc/get_fiat_type_price', '{\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\"}', '10.235.20.62', '2019-05-05 10:37:14', 'sesame');
INSERT INTO `sys_log` VALUES (7463185, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/otc/user_add_buy_order', '{\"amount\":\"500\",\"coin_id\":\"003\",\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\",\"price\":\"1.35\",\"fiat_coin_id\":\"3\"}', '10.235.20.62', '2019-05-05 10:37:46', 'sesame');
INSERT INTO `sys_log` VALUES (7463186, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/otc/user_add_buy_order', '{\"amount\":\"500\",\"coin_id\":\"003\",\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\",\"price\":\"1.35\",\"fiat_coin_id\":\"3\"}', '10.235.20.62', '2019-05-05 10:37:48', 'sesame');
INSERT INTO `sys_log` VALUES (7463187, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/otc/user_add_buy_order', '{\"amount\":\"100\",\"coin_id\":\"003\",\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\",\"price\":\"1.35\",\"fiat_coin_id\":\"3\"}', '10.235.20.62', '2019-05-05 10:37:52', 'sesame');
INSERT INTO `sys_log` VALUES (7463188, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/otc/user_add_buy_order', '{\"amount\":\"200\",\"coin_id\":\"003\",\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\",\"price\":\"6.71\",\"fiat_coin_id\":\"1\"}', '10.235.20.62', '2019-05-05 10:38:01', 'sesame');
INSERT INTO `sys_log` VALUES (7463189, -1, '获取用户信息为空', 'normal', NULL, '/', '{}', '10.235.20.62', '2019-05-05 10:38:01', 'sesame');
INSERT INTO `sys_log` VALUES (7463190, -1, '获取用户信息为空', 'normal', NULL, '/manager/login', '{}', '10.235.20.62', '2019-05-05 10:38:02', 'sesame');
INSERT INTO `sys_log` VALUES (7463191, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/fileUpload', '{\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\"}', '10.235.20.62', '2019-05-05 10:38:59', 'sesame');
INSERT INTO `sys_log` VALUES (7463192, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/otc/user_cancal_order', '{\"user_type\":\"1\",\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\",\"order_id\":\"34495\"}', '10.235.20.62', '2019-05-05 10:39:06', 'sesame');
INSERT INTO `sys_log` VALUES (7463193, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/otc/user_all_buy_order', '{\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\"}', '10.235.20.62', '2019-05-05 10:39:09', 'sesame');
INSERT INTO `sys_log` VALUES (7463194, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/otc/user_all_sell_order', '{\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\"}', '10.235.20.62', '2019-05-05 10:39:10', 'sesame');
INSERT INTO `sys_log` VALUES (7463195, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/otc/user_all_finish_order', '{\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\"}', '10.235.20.62', '2019-05-05 10:39:10', 'sesame');
INSERT INTO `sys_log` VALUES (7463196, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\"}', '10.235.20.62', '2019-05-05 10:39:16', 'sesame');
INSERT INTO `sys_log` VALUES (7463197, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\"}', '10.235.20.62', '2019-05-05 10:39:16', 'sesame');
INSERT INTO `sys_log` VALUES (7463198, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userRecord', '{\"offset\":\"0\",\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\",\"coinTypeId\":\"003\",\"num\":\"\",\"limit\":\"20\",\"type\":\"\"}', '10.235.20.62', '2019-05-05 10:40:22', 'sesame');
INSERT INTO `sys_log` VALUES (7463199, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userRecord', '{\"offset\":\"0\",\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\",\"coinTypeId\":\"bb0fa0c784bd4886ad1fa223366c167f\",\"num\":\"\",\"limit\":\"20\",\"type\":\"\"}', '10.235.20.62', '2019-05-05 10:40:40', 'sesame');
INSERT INTO `sys_log` VALUES (7463200, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\"}', '10.235.20.62', '2019-05-05 10:40:51', 'sesame');
INSERT INTO `sys_log` VALUES (7463201, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userRecord', '{\"offset\":\"0\",\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\",\"num\":\"\",\"limit\":\"20\",\"type\":\"\"}', '10.235.20.62', '2019-05-05 10:40:54', 'sesame');
INSERT INTO `sys_log` VALUES (7463202, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/getPushUser', '{\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\"}', '10.235.20.62', '2019-05-05 10:41:02', 'sesame');
INSERT INTO `sys_log` VALUES (7463203, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/coin/getAllCoinTraingOrder', '{\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\",\"order_type\":\"2\"}', '10.235.20.62', '2019-05-05 10:41:09', 'sesame');
INSERT INTO `sys_log` VALUES (7463204, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/coin/getAllCoinTraingOrder', '{\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\",\"order_type\":\"2\"}', '10.235.20.62', '2019-05-05 10:41:30', 'sesame');
INSERT INTO `sys_log` VALUES (7463205, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\"}', '10.235.20.62', '2019-05-05 10:41:32', 'sesame');
INSERT INTO `sys_log` VALUES (7463206, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\"}', '10.235.20.62', '2019-05-05 10:41:37', 'sesame');
INSERT INTO `sys_log` VALUES (7463207, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userRecord', '{\"offset\":\"0\",\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\",\"coinTypeId\":\"bb0fa0c784bd4886ad1fa223366c167f\",\"num\":\"\",\"limit\":\"20\",\"type\":\"\"}', '10.235.20.62', '2019-05-05 10:41:38', 'sesame');
INSERT INTO `sys_log` VALUES (7463208, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/coin/getAllCoinTraingOrder', '{\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\",\"order_type\":\"1\"}', '10.235.20.62', '2019-05-05 10:41:39', 'sesame');
INSERT INTO `sys_log` VALUES (7463209, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\"}', '10.235.20.62', '2019-05-05 10:41:41', 'sesame');
INSERT INTO `sys_log` VALUES (7463210, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\"}', '10.235.20.62', '2019-05-05 10:41:45', 'sesame');
INSERT INTO `sys_log` VALUES (7463211, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/otc/get_order_mer_count', '{\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\"}', '10.235.20.62', '2019-05-05 10:41:47', 'sesame');
INSERT INTO `sys_log` VALUES (7463212, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/otc/get_fiat_type_price', '{\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\"}', '10.235.20.62', '2019-05-05 10:41:47', 'sesame');
INSERT INTO `sys_log` VALUES (7463213, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/otc/user_all_buy_order', '{\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\"}', '10.235.20.62', '2019-05-05 10:42:23', 'sesame');
INSERT INTO `sys_log` VALUES (7463214, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\"}', '10.235.20.62', '2019-05-05 10:42:37', 'sesame');
INSERT INTO `sys_log` VALUES (7463215, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/coin/getAllCoinTraingOrder', '{\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\",\"order_type\":\"1\"}', '10.235.20.62', '2019-05-05 10:42:44', 'sesame');
INSERT INTO `sys_log` VALUES (7463216, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\"}', '10.235.20.62', '2019-05-05 10:42:46', 'sesame');
INSERT INTO `sys_log` VALUES (7463217, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/coin/getAllCoinTraingOrder', '{\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\",\"order_type\":\"1\"}', '10.235.20.62', '2019-05-05 10:42:46', 'sesame');
INSERT INTO `sys_log` VALUES (7463218, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\"}', '10.235.20.62', '2019-05-05 10:42:48', 'sesame');
INSERT INTO `sys_log` VALUES (7463219, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/coin/getAllCoinTraingOrder', '{\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\",\"order_type\":\"1\"}', '10.235.20.62', '2019-05-05 10:43:07', 'sesame');
INSERT INTO `sys_log` VALUES (7463220, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/coin/getAllCoinTraingOrder', '{\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\",\"order_type\":\"1\"}', '10.235.20.62', '2019-05-05 10:43:08', 'sesame');
INSERT INTO `sys_log` VALUES (7463221, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\"}', '10.235.20.62', '2019-05-05 10:43:09', 'sesame');
INSERT INTO `sys_log` VALUES (7463222, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\"}', '10.235.20.62', '2019-05-05 10:43:19', 'sesame');
INSERT INTO `sys_log` VALUES (7463223, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userRecord', '{\"offset\":\"0\",\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\",\"coinTypeId\":\"003\",\"num\":\"\",\"limit\":\"20\",\"type\":\"\"}', '10.235.20.62', '2019-05-05 10:43:26', 'sesame');
INSERT INTO `sys_log` VALUES (7463224, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/coin/getAllCoinTraingOrder', '{\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\",\"order_type\":\"1\"}', '10.235.20.62', '2019-05-05 10:43:59', 'sesame');
INSERT INTO `sys_log` VALUES (7463225, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\"}', '10.235.20.62', '2019-05-05 10:44:01', 'sesame');
INSERT INTO `sys_log` VALUES (7463226, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/coin/getAllCoinTraingOrder', '{\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\",\"order_type\":\"1\"}', '10.235.20.62', '2019-05-05 10:44:04', 'sesame');
INSERT INTO `sys_log` VALUES (7463227, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/coin/getAllCoinTraingOrder', '{\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\",\"order_type\":\"1\"}', '10.235.20.62', '2019-05-05 10:44:07', 'sesame');
INSERT INTO `sys_log` VALUES (7463228, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/coin/getAllCoinTraingOrder', '{\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\",\"order_type\":\"1\"}', '10.235.20.62', '2019-05-05 10:44:08', 'sesame');
INSERT INTO `sys_log` VALUES (7463229, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/coin/getAllCoinTraingOrder', '{\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\",\"order_type\":\"1\"}', '10.235.20.62', '2019-05-05 10:44:08', 'sesame');
INSERT INTO `sys_log` VALUES (7463230, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/coin/getAllCoinTraingOrder', '{\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\",\"order_type\":\"2\"}', '10.235.20.62', '2019-05-05 10:44:11', 'sesame');
INSERT INTO `sys_log` VALUES (7463231, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/coin/getAllCoinTraingOrder', '{\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\",\"order_type\":\"2\"}', '10.235.20.62', '2019-05-05 10:44:13', 'sesame');
INSERT INTO `sys_log` VALUES (7463232, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\"}', '10.235.20.62', '2019-05-05 10:44:21', 'sesame');
INSERT INTO `sys_log` VALUES (7463233, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/coin/getAllCoinTraingOrder', '{\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\",\"order_type\":\"2\"}', '10.235.20.62', '2019-05-05 10:44:32', 'sesame');
INSERT INTO `sys_log` VALUES (7463234, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/coin/getAllCoinTraingOrder', '{\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\",\"order_type\":\"1\"}', '10.235.20.62', '2019-05-05 10:44:33', 'sesame');
INSERT INTO `sys_log` VALUES (7463235, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\"}', '10.235.20.62', '2019-05-05 10:44:35', 'sesame');
INSERT INTO `sys_log` VALUES (7463236, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userRecord', '{\"offset\":\"0\",\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\",\"coinTypeId\":\"003\",\"num\":\"\",\"limit\":\"20\",\"type\":\"\"}', '10.235.20.62', '2019-05-05 10:44:36', 'sesame');
INSERT INTO `sys_log` VALUES (7463237, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userRecord', '{\"offset\":\"0\",\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\",\"coinTypeId\":\"003\",\"num\":\"\",\"limit\":\"20\",\"type\":\"\"}', '10.235.20.62', '2019-05-05 10:44:40', 'sesame');
INSERT INTO `sys_log` VALUES (7463238, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userRecord', '{\"offset\":\"0\",\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\",\"coinTypeId\":\"d4dbebaacb3846bf9180447797b9d909\",\"num\":\"\",\"limit\":\"20\",\"type\":\"\"}', '10.235.20.62', '2019-05-05 10:44:43', 'sesame');
INSERT INTO `sys_log` VALUES (7463239, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/coin/getAllCoinTraingOrder', '{\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\",\"order_type\":\"2\"}', '10.235.20.62', '2019-05-05 10:44:45', 'sesame');
INSERT INTO `sys_log` VALUES (7463240, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\"}', '10.235.20.62', '2019-05-05 10:44:46', 'sesame');
INSERT INTO `sys_log` VALUES (7463241, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userRecord', '{\"offset\":\"0\",\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\",\"coinTypeId\":\"bb0fa0c784bd4886ad1fa223366c167f\",\"num\":\"\",\"limit\":\"20\",\"type\":\"\"}', '10.235.20.62', '2019-05-05 10:44:47', 'sesame');
INSERT INTO `sys_log` VALUES (7463242, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/coin/getAllCoinTraingOrder', '{\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\",\"order_type\":\"2\"}', '10.235.20.62', '2019-05-05 10:44:48', 'sesame');
INSERT INTO `sys_log` VALUES (7463243, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\"}', '10.235.20.62', '2019-05-05 10:44:50', 'sesame');
INSERT INTO `sys_log` VALUES (7463244, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userRecord', '{\"offset\":\"0\",\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\",\"coinTypeId\":\"d4dbebaacb3846bf9180447797b9d909\",\"num\":\"\",\"limit\":\"20\",\"type\":\"\"}', '10.235.20.62', '2019-05-05 10:44:51', 'sesame');
INSERT INTO `sys_log` VALUES (7463245, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/coin/getAllCoinTraingOrder', '{\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\",\"order_type\":\"2\"}', '10.235.20.62', '2019-05-05 10:44:52', 'sesame');
INSERT INTO `sys_log` VALUES (7463246, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\"}', '10.235.20.62', '2019-05-05 10:44:54', 'sesame');
INSERT INTO `sys_log` VALUES (7463247, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\"}', '10.235.20.62', '2019-05-05 10:45:02', 'sesame');
INSERT INTO `sys_log` VALUES (7463248, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\"}', '10.235.20.62', '2019-05-05 10:45:02', 'sesame');
INSERT INTO `sys_log` VALUES (7463249, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/getPushUser', '{\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\"}', '10.235.20.62', '2019-05-05 10:46:17', 'sesame');
INSERT INTO `sys_log` VALUES (7463250, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\"}', '10.235.20.62', '2019-05-05 10:46:22', 'sesame');
INSERT INTO `sys_log` VALUES (7463251, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\"}', '10.235.20.62', '2019-05-05 10:46:22', 'sesame');
INSERT INTO `sys_log` VALUES (7463252, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"a5db385794be4d5cb4b6229068493907\"}', '10.235.20.62', '2019-05-05 10:54:01', 'sesame');
INSERT INTO `sys_log` VALUES (7463253, -1, '获取用户信息为空', 'normal', NULL, '//api/app/pc/login', '{\"mobile\":\"14444444491\",\"loginPass\":\"aaa000000\",\"ex1\":\"86\"}', '127.0.0.1', '2019-05-05 11:03:45', 'sesame');
INSERT INTO `sys_log` VALUES (7463254, -1, '获取用户信息为空', 'normal', NULL, '/manager/login;JSESSIONID=4e53e0d8-bb55-41ac-a832-783616b7abb2', '{}', '127.0.0.1', '2019-05-05 11:05:28', 'sesame');
INSERT INTO `sys_log` VALUES (7463255, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"0262f1583a054eeea34cbf18405e63e9\"}', '10.235.20.62', '2019-05-05 11:07:40', 'sesame');
INSERT INTO `sys_log` VALUES (7463256, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv', '{}', '127.0.0.1', '2019-05-05 11:09:06', 'sesame');
INSERT INTO `sys_log` VALUES (7463257, -1, '获取用户信息为空', 'normal', NULL, '/manager/login;JSESSIONID=93cc38a9-b8f1-4d13-9b98-f41fd7c90515', '{}', '119.139.199.99', '2019-05-05 11:09:55', 'sesame');
INSERT INTO `sys_log` VALUES (7463258, -1, '获取用户信息为空', 'normal', NULL, '/manager/login;JSESSIONID=93cc38a9-b8f1-4d13-9b98-f41fd7c90515', '{}', '119.139.199.99', '2019-05-05 11:09:55', 'sesame');
INSERT INTO `sys_log` VALUES (7463259, 1, 'admin', 'normal', NULL, '/manager/login', '{\"password\":\"123456\",\"mobileCheckCode\":\"\",\"username\":\"admin\",\"checkCode\":\"urqp\"}', '119.139.199.99', '2019-05-05 11:10:04', 'sesame');
INSERT INTO `sys_log` VALUES (7463260, 1, 'admin', 'normal', NULL, '/manager/index', '{}', '119.139.199.99', '2019-05-05 11:10:05', 'sesame');
INSERT INTO `sys_log` VALUES (7463261, 1, 'admin', 'normal', NULL, '/manager/main', '{}', '119.139.199.99', '2019-05-05 11:10:05', 'sesame');
INSERT INTO `sys_log` VALUES (7463262, 1, 'admin', 'normal', NULL, '/manager/main', '{}', '119.139.199.99', '2019-05-05 11:10:05', 'sesame');
INSERT INTO `sys_log` VALUES (7463263, 1, 'admin', 'normal', NULL, '/manager/oa/notify/message', '{}', '119.139.199.99', '2019-05-05 11:10:05', 'sesame');
INSERT INTO `sys_log` VALUES (7463264, 1, 'admin', 'error', NULL, 'http://kplus.kkg222.com/api/report/getBaseReport', 'org.springframework.jdbc.BadSqlGrammarException: \n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'account_id\' in \'where clause\'\n### The error may exist in com/sesame/system/report/dao/BaseReportDao.java (best guess)\n### The error may involve com.sesame.system.report.dao.BaseReportDao.getRYBYesterdayAddLockCoin-Inline\n### The error occurred while setting parameters\n### SQL: select sum(lock_currency) FROM t_lp_account_invest_project  WHERE (account_id LIKE \'%-RYBLock\') and  (date(create_date) = date(?) )\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'account_id\' in \'where clause\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'account_id\' in \'where clause\'', NULL, '2019-05-05 11:10:05', NULL);
INSERT INTO `sys_log` VALUES (7463265, 1, 'admin', 'error', NULL, 'http://kplus.kkg222.com/api/report/getProfitCoinRelease', 'org.springframework.jdbc.BadSqlGrammarException: \n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column \'kplus.t_profit_coin_release.release_date\' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by\n### The error may exist in com/sesame/system/report/dao/BaseReportDao.java (best guess)\n### The error may involve com.sesame.system.report.dao.BaseReportDao.getProfitCoinRelease-Inline\n### The error occurred while setting parameters\n### SQL: SELECT release_date date,currency FROM t_profit_coin_release WHERE ( date ( release_date ) >= date ( ? ) AND date ( release_date ) <= date ( ? ) ) GROUP BY date ( release_date ) ORDER BY date asc\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column \'kplus.t_profit_coin_release.release_date\' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column \'kplus.t_profit_coin_release.release_date\' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by', NULL, '2019-05-05 11:10:05', NULL);
INSERT INTO `sys_log` VALUES (7463266, 1, 'admin', 'normal', NULL, '/api/report/getUserRegisteredNum', '{\"endDate\":\"2019-5-5\",\"startDate\":\"2019-4-5\"}', '119.139.199.99', '2019-05-05 11:10:05', 'sesame');
INSERT INTO `sys_log` VALUES (7463267, 1, 'admin', 'normal', NULL, '/api/report/getBaseReport', '{}', '119.139.199.99', '2019-05-05 11:10:05', 'sesame');
INSERT INTO `sys_log` VALUES (7463268, 1, 'admin', 'normal', NULL, '/api/report/getProfitCoinRelease', '{\"endDate\":\"2021-5-5\",\"startDate\":\"2019-5-5\"}', '119.139.199.99', '2019-05-05 11:10:05', 'sesame');
INSERT INTO `sys_log` VALUES (7463269, 1, 'admin', 'normal', NULL, '/', '{}', '119.139.199.99', '2019-05-05 11:10:05', 'sesame');
INSERT INTO `sys_log` VALUES (7463270, 1, 'admin', 'normal', NULL, '/manager/login', '{}', '119.139.199.99', '2019-05-05 11:10:05', 'sesame');
INSERT INTO `sys_log` VALUES (7463271, NULL, NULL, 'error', NULL, 'http://localhost:91/api/app/pv/userRecord', 'java.lang.NullPointerException', NULL, '2019-05-05 11:12:39', NULL);
INSERT INTO `sys_log` VALUES (7463272, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userRecord', '{}', '127.0.0.1', '2019-05-05 11:12:39', 'sesame');
INSERT INTO `sys_log` VALUES (7463273, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userRecord', '{}', '127.0.0.1', '2019-05-05 11:14:10', 'sesame');
INSERT INTO `sys_log` VALUES (7463274, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userRecord', '{}', '127.0.0.1', '2019-05-05 11:15:02', 'sesame');
INSERT INTO `sys_log` VALUES (7463275, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userRecord', '{}', '127.0.0.1', '2019-05-05 11:15:46', 'sesame');
INSERT INTO `sys_log` VALUES (7463276, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userRecord', '{}', '127.0.0.1', '2019-05-05 11:15:53', 'sesame');
INSERT INTO `sys_log` VALUES (7463277, NULL, NULL, 'error', NULL, 'http://10.235.20.176:91/api/app/pv/userRecord', 'java.lang.NumberFormatException: For input string: \"1\n\n\"', NULL, '2019-05-05 11:18:00', NULL);
INSERT INTO `sys_log` VALUES (7463278, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userRecord', '{\"offset\":\"1\\n\\n\",\"accessKey\":\"a5db385794be4d5cb4b6229068493907\",\"num\":\"\",\"limit\":\"20\",\"type\":\"\"}', '10.235.20.63', '2019-05-05 11:18:00', 'sesame');
INSERT INTO `sys_log` VALUES (7463279, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userRecord', '{\"offset\":\"1\",\"accessKey\":\"a5db385794be4d5cb4b6229068493907\",\"num\":\"\",\"limit\":\"20\",\"type\":\"\"}', '10.235.20.63', '2019-05-05 11:18:14', 'sesame');
INSERT INTO `sys_log` VALUES (7463280, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userRecord', '{\"offset\":\"0\",\"accessKey\":\"a5db385794be4d5cb4b6229068493907\",\"num\":\"\",\"limit\":\"20\",\"type\":\"\"}', '10.235.20.63', '2019-05-05 11:18:24', 'sesame');
INSERT INTO `sys_log` VALUES (7463281, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userRecord', '{\"offset\":\"1\",\"accessKey\":\"a5db385794be4d5cb4b6229068493907\",\"num\":\"\",\"limit\":\"20\",\"type\":\"\"}', '10.235.20.63', '2019-05-05 11:18:43', 'sesame');
INSERT INTO `sys_log` VALUES (7463282, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userRecord', '{\"offset\":\"2\",\"accessKey\":\"a5db385794be4d5cb4b6229068493907\",\"num\":\"\",\"limit\":\"20\",\"type\":\"\"}', '10.235.20.63', '2019-05-05 11:19:21', 'sesame');
INSERT INTO `sys_log` VALUES (7463283, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userRecord', '{\"offset\":\"3\",\"accessKey\":\"a5db385794be4d5cb4b6229068493907\",\"num\":\"\",\"limit\":\"20\",\"type\":\"\"}', '10.235.20.63', '2019-05-05 11:19:26', 'sesame');
INSERT INTO `sys_log` VALUES (7463284, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userRecord', '{\"offset\":\"4\",\"accessKey\":\"a5db385794be4d5cb4b6229068493907\",\"num\":\"\",\"limit\":\"20\",\"type\":\"\"}', '10.235.20.63', '2019-05-05 11:19:29', 'sesame');
INSERT INTO `sys_log` VALUES (7463285, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userRecord', '{}', '127.0.0.1', '2019-05-05 11:20:05', 'sesame');
INSERT INTO `sys_log` VALUES (7463286, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userRecord', '{}', '127.0.0.1', '2019-05-05 11:20:48', 'sesame');
INSERT INTO `sys_log` VALUES (7463287, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userRecord', '{}', '127.0.0.1', '2019-05-05 11:20:56', 'sesame');
INSERT INTO `sys_log` VALUES (7463288, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userRecord', '{}', '127.0.0.1', '2019-05-05 11:21:49', 'sesame');
INSERT INTO `sys_log` VALUES (7463289, -1, '获取用户信息为空', 'normal', NULL, '//api/app/pc/login', '{\"mobile\":\"14444444491\",\"loginPass\":\"aaa000000\",\"ex1\":\"86\"}', '127.0.0.1', '2019-05-05 11:23:39', 'sesame');
INSERT INTO `sys_log` VALUES (7463290, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userRecord', '{}', '127.0.0.1', '2019-05-05 11:29:10', 'sesame');
INSERT INTO `sys_log` VALUES (7463291, NULL, NULL, 'error', NULL, 'http://localhost:91/api/app/pv/userRecord', 'org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'*20, 20\' at line 23\r\n### The error may exist in file [G:\\java_project\\k+\\kplus\\target\\classes\\mybatis\\sesame\\SwAccountRecordMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select         `tid`,`user_id`,`num`,`type`,`coin_type_id`,`currency`,`remark`,`ex1`,`ex2`,`ex3`,`create_date`,`update_date`,`del_flag`         from t_sw_account_record          WHERE  user_id =                 ?                          and coin_type_id =                 ?                                                                                                                     and del_flag =                 ?                            order by tid desc                                     limit ?*?, ?\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'*20, 20\' at line 23\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'*20, 20\' at line 23', NULL, '2019-05-05 11:32:33', NULL);
INSERT INTO `sys_log` VALUES (7463292, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userRecord', '{}', '127.0.0.1', '2019-05-05 11:32:33', 'sesame');
INSERT INTO `sys_log` VALUES (7463293, NULL, NULL, 'error', NULL, 'http://localhost:91/api/app/pv/userRecord', 'org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'(4*20), 20\' at line 23\r\n### The error may exist in file [G:\\java_project\\k+\\kplus\\target\\classes\\mybatis\\sesame\\SwAccountRecordMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select         `tid`,`user_id`,`num`,`type`,`coin_type_id`,`currency`,`remark`,`ex1`,`ex2`,`ex3`,`create_date`,`update_date`,`del_flag`         from t_sw_account_record          WHERE  user_id =                 ?                          and coin_type_id =                 ?                                                                                                                     and del_flag =                 ?                            order by tid desc                                     limit (?*?), ?\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'(4*20), 20\' at line 23\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'(4*20), 20\' at line 23', NULL, '2019-05-05 11:33:46', NULL);
INSERT INTO `sys_log` VALUES (7463294, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userRecord', '{}', '127.0.0.1', '2019-05-05 11:33:46', 'sesame');
INSERT INTO `sys_log` VALUES (7463295, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userRecord', '{\"offset\":\"80\",\"accessKey\":\"a5db385794be4d5cb4b6229068493907\",\"num\":\"\",\"limit\":\"20\",\"type\":\"\"}', '10.235.20.63', '2019-05-05 11:35:50', 'sesame');
INSERT INTO `sys_log` VALUES (7463296, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userRecord', '{\"offset\":\"0\",\"accessKey\":\"a5db385794be4d5cb4b6229068493907\",\"num\":\"\",\"limit\":\"20\",\"type\":\"\"}', '10.235.20.63', '2019-05-05 11:36:05', 'sesame');
INSERT INTO `sys_log` VALUES (7463297, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userRecord', '{\"offset\":\"20\",\"accessKey\":\"a5db385794be4d5cb4b6229068493907\",\"num\":\"\",\"limit\":\"20\",\"type\":\"\"}', '10.235.20.63', '2019-05-05 11:36:15', 'sesame');
INSERT INTO `sys_log` VALUES (7463298, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userRecord', '{\"offset\":\"0\",\"accessKey\":\"a5db385794be4d5cb4b6229068493907\",\"num\":\"\",\"limit\":\"20\",\"type\":\"\"}', '10.235.20.63', '2019-05-05 11:36:25', 'sesame');
INSERT INTO `sys_log` VALUES (7463299, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userRecord', '{\"offset\":\"40\",\"accessKey\":\"a5db385794be4d5cb4b6229068493907\",\"num\":\"\",\"limit\":\"20\",\"type\":\"\"}', '10.235.20.63', '2019-05-05 11:36:38', 'sesame');
INSERT INTO `sys_log` VALUES (7463300, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userRecord', '{\"offset\":\"20\",\"accessKey\":\"a5db385794be4d5cb4b6229068493907\",\"num\":\"\",\"limit\":\"20\",\"type\":\"\"}', '10.235.20.63', '2019-05-05 11:36:43', 'sesame');
INSERT INTO `sys_log` VALUES (7463301, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userRecord', '{\"offset\":\"0\",\"accessKey\":\"a5db385794be4d5cb4b6229068493907\",\"num\":\"\",\"limit\":\"20\",\"type\":\"\"}', '10.235.20.63', '2019-05-05 11:36:46', 'sesame');
INSERT INTO `sys_log` VALUES (7463302, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userRecord', '{\"offset\":\"0\",\"accessKey\":\"a5db385794be4d5cb4b6229068493907\",\"num\":\"\",\"limit\":\"2\",\"type\":\"\"}', '10.235.20.63', '2019-05-05 11:36:57', 'sesame');
INSERT INTO `sys_log` VALUES (7463303, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userRecord', '{\"offset\":\"2\",\"accessKey\":\"a5db385794be4d5cb4b6229068493907\",\"num\":\"\",\"limit\":\"2\",\"type\":\"\"}', '10.235.20.63', '2019-05-05 11:37:03', 'sesame');
INSERT INTO `sys_log` VALUES (7463304, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userRecord', '{\"offset\":\"4\",\"accessKey\":\"a5db385794be4d5cb4b6229068493907\",\"num\":\"\",\"limit\":\"2\",\"type\":\"\"}', '10.235.20.63', '2019-05-05 11:37:07', 'sesame');
INSERT INTO `sys_log` VALUES (7463305, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userRecord', '{}', '127.0.0.1', '2019-05-05 11:40:29', 'sesame');
INSERT INTO `sys_log` VALUES (7463306, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userRecord', '{}', '127.0.0.1', '2019-05-05 11:41:37', 'sesame');
INSERT INTO `sys_log` VALUES (7463307, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userRecord', '{}', '127.0.0.1', '2019-05-05 11:42:12', 'sesame');
INSERT INTO `sys_log` VALUES (7463308, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userRecord', '{}', '127.0.0.1', '2019-05-05 11:45:04', 'sesame');
INSERT INTO `sys_log` VALUES (7463309, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userRecord', '{}', '127.0.0.1', '2019-05-05 11:45:12', 'sesame');
INSERT INTO `sys_log` VALUES (7463310, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userRecord', '{}', '127.0.0.1', '2019-05-05 11:45:21', 'sesame');
INSERT INTO `sys_log` VALUES (7463311, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userRecord', '{}', '127.0.0.1', '2019-05-05 11:45:26', 'sesame');
INSERT INTO `sys_log` VALUES (7463312, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userRecord', '{}', '127.0.0.1', '2019-05-05 11:45:38', 'sesame');
INSERT INTO `sys_log` VALUES (7463313, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userRecord', '{}', '127.0.0.1', '2019-05-05 11:45:40', 'sesame');
INSERT INTO `sys_log` VALUES (7463314, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userRecord', '{}', '127.0.0.1', '2019-05-05 11:45:44', 'sesame');
INSERT INTO `sys_log` VALUES (7463315, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/get_appinfo', '{}', '119.139.199.99', '2019-05-05 11:47:03', 'sesame');
INSERT INTO `sys_log` VALUES (7463316, -1, '获取用户信息为空', 'normal', NULL, '/manager/login;JSESSIONID=ea94af23-d6d7-45d3-9567-7f98204fb918', '{}', '127.0.0.1', '2019-05-05 11:50:34', 'sesame');
INSERT INTO `sys_log` VALUES (7463317, -1, '获取用户信息为空', 'normal', NULL, '//api/app/pc/login', '{\"mobile\":\"14444444491\",\"loginPass\":\"aaa000000\",\"ex1\":\"86\"}', '127.0.0.1', '2019-05-05 11:50:42', 'sesame');
INSERT INTO `sys_log` VALUES (7463318, -1, '获取用户信息为空', 'normal', NULL, '/manager/login', '{}', '127.0.0.1', '2019-05-05 11:50:47', 'sesame');
INSERT INTO `sys_log` VALUES (7463319, -1, '获取用户信息为空', 'normal', NULL, '/manager/login', '{}', '127.0.0.1', '2019-05-05 11:51:59', 'sesame');
INSERT INTO `sys_log` VALUES (7463320, -1, '获取用户信息为空', 'normal', NULL, '/manager/login', '{}', '127.0.0.1', '2019-05-05 11:52:24', 'sesame');
INSERT INTO `sys_log` VALUES (7463321, -1, '获取用户信息为空', 'normal', NULL, '/manager/login', '{}', '127.0.0.1', '2019-05-05 11:53:19', 'sesame');
INSERT INTO `sys_log` VALUES (7463322, -1, '获取用户信息为空', 'normal', NULL, '/manager/login;JSESSIONID=ffca565f-71ee-4d99-85a6-ee9f982efb3c', '{}', '127.0.0.1', '2019-05-05 11:59:56', 'sesame');
INSERT INTO `sys_log` VALUES (7463323, 1, 'admin', 'normal', NULL, '/manager/login', '{\"password\":\"123456\",\"mobileCheckCode\":\"\",\"username\":\"admin\",\"checkCode\":\"hr9q\"}', '127.0.0.1', '2019-05-05 12:00:05', 'sesame');
INSERT INTO `sys_log` VALUES (7463324, 1, 'admin', 'normal', NULL, '/manager/index', '{}', '127.0.0.1', '2019-05-05 12:00:05', 'sesame');
INSERT INTO `sys_log` VALUES (7463325, 1, 'admin', 'normal', NULL, '/manager/main', '{}', '127.0.0.1', '2019-05-05 12:00:05', 'sesame');
INSERT INTO `sys_log` VALUES (7463326, 1, 'admin', 'normal', NULL, '/manager/oa/notify/message', '{}', '127.0.0.1', '2019-05-05 12:00:06', 'sesame');
INSERT INTO `sys_log` VALUES (7463327, 1, 'admin', 'normal', NULL, '/manager/main', '{}', '127.0.0.1', '2019-05-05 12:00:06', 'sesame');
INSERT INTO `sys_log` VALUES (7463328, 1, 'admin', 'normal', NULL, '/api/report/getUserRegisteredNum', '{\"endDate\":\"2019-5-5\",\"startDate\":\"2019-4-5\"}', '127.0.0.1', '2019-05-05 12:00:09', 'sesame');
INSERT INTO `sys_log` VALUES (7463329, 1, 'admin', 'normal', NULL, '/', '{}', '127.0.0.1', '2019-05-05 12:00:09', 'sesame');
INSERT INTO `sys_log` VALUES (7463330, 1, 'admin', 'error', NULL, 'http://localhost:91/api/report/getProfitCoinRelease', 'org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column \'kplus.t_profit_coin_release.release_date\' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by\r\n### The error may exist in com/sesame/system/report/dao/BaseReportDao.java (best guess)\r\n### The error may involve com.sesame.system.report.dao.BaseReportDao.getProfitCoinRelease-Inline\r\n### The error occurred while setting parameters\r\n### SQL: SELECT release_date date,currency FROM t_profit_coin_release WHERE ( date ( release_date ) >= date ( ? ) AND date ( release_date ) <= date ( ? ) ) GROUP BY date ( release_date ) ORDER BY date asc\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column \'kplus.t_profit_coin_release.release_date\' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column \'kplus.t_profit_coin_release.release_date\' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by', NULL, '2019-05-05 12:00:09', NULL);
INSERT INTO `sys_log` VALUES (7463331, 1, 'admin', 'error', NULL, 'http://localhost:91/api/report/getBaseReport', 'org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'account_id\' in \'where clause\'\r\n### The error may exist in com/sesame/system/report/dao/BaseReportDao.java (best guess)\r\n### The error may involve com.sesame.system.report.dao.BaseReportDao.getRYBYesterdayAddLockCoin-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select sum(lock_currency) FROM t_lp_account_invest_project  WHERE (account_id LIKE \'%-RYBLock\') and  (date(create_date) = date(?) )\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'account_id\' in \'where clause\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'account_id\' in \'where clause\'', NULL, '2019-05-05 12:00:09', NULL);
INSERT INTO `sys_log` VALUES (7463332, 1, 'admin', 'normal', NULL, '/api/report/getBaseReport', '{}', '127.0.0.1', '2019-05-05 12:00:09', 'sesame');
INSERT INTO `sys_log` VALUES (7463333, 1, 'admin', 'normal', NULL, '/api/report/getProfitCoinRelease', '{\"endDate\":\"2021-5-5\",\"startDate\":\"2019-5-5\"}', '127.0.0.1', '2019-05-05 12:00:09', 'sesame');
INSERT INTO `sys_log` VALUES (7463334, 1, 'admin', 'normal', NULL, '/manager/login', '{}', '127.0.0.1', '2019-05-05 12:00:09', 'sesame');
INSERT INTO `sys_log` VALUES (7463335, 1, 'admin', 'normal', NULL, '/manager/sesame/swUserAuth', '{}', '127.0.0.1', '2019-05-05 12:00:13', 'sesame');
INSERT INTO `sys_log` VALUES (7463336, 1, 'admin', 'normal', NULL, '/manager/sesame/swUserAuth/list', '{}', '127.0.0.1', '2019-05-05 12:00:13', 'sesame');
INSERT INTO `sys_log` VALUES (7463337, 1, 'admin', 'normal', NULL, '/manager/sesame/swUserAuth/list', '{}', '127.0.0.1', '2019-05-05 12:00:13', 'sesame');
INSERT INTO `sys_log` VALUES (7463338, 1, 'admin', 'normal', NULL, '/manager/sesame/swExtractReview', '{}', '127.0.0.1', '2019-05-05 12:00:15', 'sesame');
INSERT INTO `sys_log` VALUES (7463339, 1, 'admin', 'normal', NULL, '/manager/sesame/swExtractReview/list', '{}', '127.0.0.1', '2019-05-05 12:00:15', 'sesame');
INSERT INTO `sys_log` VALUES (7463340, 1, 'admin', 'normal', NULL, '/manager/sesame/swExtractReview/list', '{}', '127.0.0.1', '2019-05-05 12:00:15', 'sesame');
INSERT INTO `sys_log` VALUES (7463341, 1, 'admin', 'normal', NULL, '/manager/sesame/swOtcOrder', '{}', '127.0.0.1', '2019-05-05 12:00:19', 'sesame');
INSERT INTO `sys_log` VALUES (7463342, 1, 'admin', 'normal', NULL, '/manager/sesame/swOtcOrder/list', '{}', '127.0.0.1', '2019-05-05 12:00:19', 'sesame');
INSERT INTO `sys_log` VALUES (7463343, 1, 'admin', 'normal', NULL, '/manager/sesame/swAccountRecord', '{}', '127.0.0.1', '2019-05-05 12:00:28', 'sesame');
INSERT INTO `sys_log` VALUES (7463344, 1, 'admin', 'normal', NULL, '/manager/sesame/swAccountRecord/list', '{}', '127.0.0.1', '2019-05-05 12:00:28', 'sesame');
INSERT INTO `sys_log` VALUES (7463345, 1, 'admin', 'normal', NULL, '/manager/sesame/swAccountRecord/list', '{}', '127.0.0.1', '2019-05-05 12:00:28', 'sesame');
INSERT INTO `sys_log` VALUES (7463346, 1, 'admin', 'normal', NULL, '/manager/sesame/swAccountRecord/list', '{}', '127.0.0.1', '2019-05-05 12:00:40', 'sesame');
INSERT INTO `sys_log` VALUES (7463347, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"a5db385794be4d5cb4b6229068493907\"}', '10.235.20.62', '2019-05-05 12:01:37', 'sesame');
INSERT INTO `sys_log` VALUES (7463348, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/coin/getAllCoinTraingOrder', '{\"accessKey\":\"a5db385794be4d5cb4b6229068493907\",\"order_type\":\"1\"}', '10.235.20.62', '2019-05-05 12:01:39', 'sesame');
INSERT INTO `sys_log` VALUES (7463349, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/coin/getAllCoinTraingOrder', '{\"accessKey\":\"a5db385794be4d5cb4b6229068493907\",\"order_type\":\"1\"}', '10.235.20.62', '2019-05-05 12:01:39', 'sesame');
INSERT INTO `sys_log` VALUES (7463350, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/get_appinfo', '{}', '119.139.199.99', '2019-05-05 12:03:51', 'sesame');
INSERT INTO `sys_log` VALUES (7463351, -1, '获取用户信息为空', 'normal', NULL, '/manager/login;JSESSIONID=4b1d702d-3bc8-4625-92e9-bfef6d93bdff', '{}', '127.0.0.1', '2019-05-05 14:01:35', 'sesame');
INSERT INTO `sys_log` VALUES (7463352, 1, 'admin', 'normal', NULL, '/manager/login', '{\"password\":\"123456\",\"mobileCheckCode\":\"\",\"username\":\"admin\",\"checkCode\":\"25md\"}', '127.0.0.1', '2019-05-05 14:01:43', 'sesame');
INSERT INTO `sys_log` VALUES (7463353, 1, 'admin', 'normal', NULL, '/manager/index', '{}', '127.0.0.1', '2019-05-05 14:01:43', 'sesame');
INSERT INTO `sys_log` VALUES (7463354, 1, 'admin', 'normal', NULL, '/manager/main', '{}', '127.0.0.1', '2019-05-05 14:01:43', 'sesame');
INSERT INTO `sys_log` VALUES (7463355, 1, 'admin', 'normal', NULL, '/manager/oa/notify/message', '{}', '127.0.0.1', '2019-05-05 14:01:44', 'sesame');
INSERT INTO `sys_log` VALUES (7463356, 1, 'admin', 'normal', NULL, '/manager/main', '{}', '127.0.0.1', '2019-05-05 14:01:44', 'sesame');
INSERT INTO `sys_log` VALUES (7463357, 1, 'admin', 'error', NULL, 'http://localhost:91/api/report/getProfitCoinRelease', 'org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column \'kplus.t_profit_coin_release.release_date\' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by\r\n### The error may exist in com/sesame/system/report/dao/BaseReportDao.java (best guess)\r\n### The error may involve com.sesame.system.report.dao.BaseReportDao.getProfitCoinRelease-Inline\r\n### The error occurred while setting parameters\r\n### SQL: SELECT release_date date,currency FROM t_profit_coin_release WHERE ( date ( release_date ) >= date ( ? ) AND date ( release_date ) <= date ( ? ) ) GROUP BY date ( release_date ) ORDER BY date asc\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column \'kplus.t_profit_coin_release.release_date\' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column \'kplus.t_profit_coin_release.release_date\' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by', NULL, '2019-05-05 14:01:44', NULL);
INSERT INTO `sys_log` VALUES (7463358, 1, 'admin', 'normal', NULL, '/api/report/getUserRegisteredNum', '{\"endDate\":\"2019-5-5\",\"startDate\":\"2019-4-5\"}', '127.0.0.1', '2019-05-05 14:01:44', 'sesame');
INSERT INTO `sys_log` VALUES (7463359, 1, 'admin', 'error', NULL, 'http://localhost:91/api/report/getBaseReport', 'org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'account_id\' in \'where clause\'\r\n### The error may exist in com/sesame/system/report/dao/BaseReportDao.java (best guess)\r\n### The error may involve com.sesame.system.report.dao.BaseReportDao.getRYBYesterdayAddLockCoin-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select sum(lock_currency) FROM t_lp_account_invest_project  WHERE (account_id LIKE \'%-RYBLock\') and  (date(create_date) = date(?) )\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'account_id\' in \'where clause\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'account_id\' in \'where clause\'', NULL, '2019-05-05 14:01:44', NULL);
INSERT INTO `sys_log` VALUES (7463360, 1, 'admin', 'normal', NULL, '/api/report/getProfitCoinRelease', '{\"endDate\":\"2021-5-5\",\"startDate\":\"2019-5-5\"}', '127.0.0.1', '2019-05-05 14:01:44', 'sesame');
INSERT INTO `sys_log` VALUES (7463361, 1, 'admin', 'normal', NULL, '/api/report/getBaseReport', '{}', '127.0.0.1', '2019-05-05 14:01:44', 'sesame');
INSERT INTO `sys_log` VALUES (7463362, 1, 'admin', 'normal', NULL, '/', '{}', '127.0.0.1', '2019-05-05 14:01:45', 'sesame');
INSERT INTO `sys_log` VALUES (7463363, 1, 'admin', 'normal', NULL, '/manager/login', '{}', '127.0.0.1', '2019-05-05 14:01:45', 'sesame');
INSERT INTO `sys_log` VALUES (7463364, 1, 'admin', 'normal', NULL, '/manager/sesame/swAccountRecord', '{}', '127.0.0.1', '2019-05-05 14:01:59', 'sesame');
INSERT INTO `sys_log` VALUES (7463365, 1, 'admin', 'normal', NULL, '/manager/sesame/swAccountRecord/list', '{}', '127.0.0.1', '2019-05-05 14:01:59', 'sesame');
INSERT INTO `sys_log` VALUES (7463366, 1, 'admin', 'normal', NULL, '/manager/sesame/swAccountRecord/list', '{}', '127.0.0.1', '2019-05-05 14:01:59', 'sesame');
INSERT INTO `sys_log` VALUES (7463367, 1, 'admin', 'normal', NULL, '/manager/sesame/swAccountRecord', '{}', '127.0.0.1', '2019-05-05 14:02:10', 'sesame');
INSERT INTO `sys_log` VALUES (7463368, 1, 'admin', 'normal', NULL, '/manager/sesame/swAccountRecord/list', '{}', '127.0.0.1', '2019-05-05 14:02:10', 'sesame');
INSERT INTO `sys_log` VALUES (7463369, 1, 'admin', 'normal', NULL, '/manager/sesame/swAccountRecord/list', '{}', '127.0.0.1', '2019-05-05 14:02:10', 'sesame');
INSERT INTO `sys_log` VALUES (7463370, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/getCoinTrading', '{\"accessKey\":\"a5db385794be4d5cb4b6229068493907\"}', '10.235.20.62', '2019-05-05 14:02:11', 'sesame');
INSERT INTO `sys_log` VALUES (7463371, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/otc/get_fiat_type_price', '{\"accessKey\":\"a5db385794be4d5cb4b6229068493907\"}', '10.235.20.62', '2019-05-05 14:02:11', 'sesame');
INSERT INTO `sys_log` VALUES (7463372, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"a5db385794be4d5cb4b6229068493907\"}', '10.235.20.62', '2019-05-05 14:02:11', 'sesame');
INSERT INTO `sys_log` VALUES (7463373, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/coin/getAllCoinTraingOrder', '{\"accessKey\":\"a5db385794be4d5cb4b6229068493907\",\"order_type\":\"1\"}', '10.235.20.62', '2019-05-05 14:02:12', 'sesame');
INSERT INTO `sys_log` VALUES (7463374, 1, 'admin', 'normal', NULL, '/manager/sesame/swAccountRecord/list', '{}', '127.0.0.1', '2019-05-05 14:02:22', 'sesame');
INSERT INTO `sys_log` VALUES (7463375, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"a5db385794be4d5cb4b6229068493907\"}', '10.235.20.62', '2019-05-05 14:04:22', 'sesame');
INSERT INTO `sys_log` VALUES (7463376, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"a5db385794be4d5cb4b6229068493907\"}', '10.235.20.62', '2019-05-05 14:06:04', 'sesame');
INSERT INTO `sys_log` VALUES (7463377, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/otc/user_all_buy_order', '{\"accessKey\":\"a5db385794be4d5cb4b6229068493907\"}', '10.235.20.62', '2019-05-05 14:06:06', 'sesame');
INSERT INTO `sys_log` VALUES (7463378, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userRecord', '{\"offset\":\"0\",\"accessKey\":\"a5db385794be4d5cb4b6229068493907\",\"num\":\"\",\"limit\":\"20\",\"type\":\"\"}', '10.235.20.62', '2019-05-05 14:06:08', 'sesame');
INSERT INTO `sys_log` VALUES (7463379, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/otc/get_fiat_type_price', '{\"accessKey\":\"a5db385794be4d5cb4b6229068493907\"}', '10.235.20.62', '2019-05-05 14:06:23', 'sesame');
INSERT INTO `sys_log` VALUES (7463380, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/getCoinTrading', '{\"accessKey\":\"a5db385794be4d5cb4b6229068493907\"}', '10.235.20.62', '2019-05-05 14:06:23', 'sesame');
INSERT INTO `sys_log` VALUES (7463381, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"a5db385794be4d5cb4b6229068493907\"}', '10.235.20.62', '2019-05-05 14:06:23', 'sesame');
INSERT INTO `sys_log` VALUES (7463382, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"a5db385794be4d5cb4b6229068493907\"}', '10.235.20.62', '2019-05-05 14:17:17', 'sesame');
INSERT INTO `sys_log` VALUES (7463383, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/getCoinTrading', '{\"accessKey\":\"a5db385794be4d5cb4b6229068493907\"}', '10.235.20.62', '2019-05-05 14:18:03', 'sesame');
INSERT INTO `sys_log` VALUES (7463384, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/otc/get_fiat_type_price', '{\"accessKey\":\"a5db385794be4d5cb4b6229068493907\"}', '10.235.20.62', '2019-05-05 14:18:03', 'sesame');
INSERT INTO `sys_log` VALUES (7463385, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"a5db385794be4d5cb4b6229068493907\"}', '10.235.20.62', '2019-05-05 14:18:04', 'sesame');
INSERT INTO `sys_log` VALUES (7463386, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/getCoinTrading', '{\"accessKey\":\"a5db385794be4d5cb4b6229068493907\"}', '10.235.20.62', '2019-05-05 14:18:14', 'sesame');
INSERT INTO `sys_log` VALUES (7463387, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/otc/get_fiat_type_price', '{\"accessKey\":\"a5db385794be4d5cb4b6229068493907\"}', '10.235.20.62', '2019-05-05 14:18:14', 'sesame');
INSERT INTO `sys_log` VALUES (7463388, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"a5db385794be4d5cb4b6229068493907\"}', '10.235.20.62', '2019-05-05 14:18:14', 'sesame');
INSERT INTO `sys_log` VALUES (7463389, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/getCoinTrading', '{\"accessKey\":\"a5db385794be4d5cb4b6229068493907\"}', '10.235.20.62', '2019-05-05 14:18:28', 'sesame');
INSERT INTO `sys_log` VALUES (7463390, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/otc/get_fiat_type_price', '{\"accessKey\":\"a5db385794be4d5cb4b6229068493907\"}', '10.235.20.62', '2019-05-05 14:18:28', 'sesame');
INSERT INTO `sys_log` VALUES (7463391, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"a5db385794be4d5cb4b6229068493907\"}', '10.235.20.62', '2019-05-05 14:18:28', 'sesame');
INSERT INTO `sys_log` VALUES (7463392, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/coin/getAllCoinTraingOrder', '{\"accessKey\":\"a5db385794be4d5cb4b6229068493907\",\"order_type\":\"1\"}', '10.235.20.62', '2019-05-05 14:18:34', 'sesame');
INSERT INTO `sys_log` VALUES (7463393, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"a5db385794be4d5cb4b6229068493907\"}', '10.235.20.62', '2019-05-05 14:18:35', 'sesame');
INSERT INTO `sys_log` VALUES (7463394, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/getCoinTrading', '{\"accessKey\":\"a5db385794be4d5cb4b6229068493907\"}', '10.235.20.62', '2019-05-05 14:19:55', 'sesame');
INSERT INTO `sys_log` VALUES (7463395, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/otc/get_fiat_type_price', '{\"accessKey\":\"a5db385794be4d5cb4b6229068493907\"}', '10.235.20.62', '2019-05-05 14:19:55', 'sesame');
INSERT INTO `sys_log` VALUES (7463396, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"a5db385794be4d5cb4b6229068493907\"}', '10.235.20.62', '2019-05-05 14:19:55', 'sesame');
INSERT INTO `sys_log` VALUES (7463397, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/getCoinTrading', '{\"accessKey\":\"a5db385794be4d5cb4b6229068493907\"}', '10.235.20.62', '2019-05-05 14:20:06', 'sesame');
INSERT INTO `sys_log` VALUES (7463398, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/otc/get_fiat_type_price', '{\"accessKey\":\"a5db385794be4d5cb4b6229068493907\"}', '10.235.20.62', '2019-05-05 14:20:06', 'sesame');
INSERT INTO `sys_log` VALUES (7463399, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"a5db385794be4d5cb4b6229068493907\"}', '10.235.20.62', '2019-05-05 14:20:06', 'sesame');
INSERT INTO `sys_log` VALUES (7463400, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/getCoinTrading', '{\"accessKey\":\"a5db385794be4d5cb4b6229068493907\"}', '10.235.20.62', '2019-05-05 14:20:13', 'sesame');
INSERT INTO `sys_log` VALUES (7463401, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/otc/get_fiat_type_price', '{\"accessKey\":\"a5db385794be4d5cb4b6229068493907\"}', '10.235.20.62', '2019-05-05 14:20:13', 'sesame');
INSERT INTO `sys_log` VALUES (7463402, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"a5db385794be4d5cb4b6229068493907\"}', '10.235.20.62', '2019-05-05 14:20:13', 'sesame');
INSERT INTO `sys_log` VALUES (7463403, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/getCoinTrading', '{\"accessKey\":\"a5db385794be4d5cb4b6229068493907\"}', '10.235.20.62', '2019-05-05 14:21:12', 'sesame');
INSERT INTO `sys_log` VALUES (7463404, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/otc/get_fiat_type_price', '{\"accessKey\":\"a5db385794be4d5cb4b6229068493907\"}', '10.235.20.62', '2019-05-05 14:21:12', 'sesame');
INSERT INTO `sys_log` VALUES (7463405, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"a5db385794be4d5cb4b6229068493907\"}', '10.235.20.62', '2019-05-05 14:21:12', 'sesame');
INSERT INTO `sys_log` VALUES (7463406, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/getCoinTrading', '{\"accessKey\":\"a5db385794be4d5cb4b6229068493907\"}', '10.235.20.62', '2019-05-05 14:21:52', 'sesame');
INSERT INTO `sys_log` VALUES (7463407, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/otc/get_fiat_type_price', '{\"accessKey\":\"a5db385794be4d5cb4b6229068493907\"}', '10.235.20.62', '2019-05-05 14:21:52', 'sesame');
INSERT INTO `sys_log` VALUES (7463408, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"a5db385794be4d5cb4b6229068493907\"}', '10.235.20.62', '2019-05-05 14:21:52', 'sesame');
INSERT INTO `sys_log` VALUES (7463409, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/coin/getAllCoinTraingOrder', '{\"accessKey\":\"a5db385794be4d5cb4b6229068493907\",\"order_type\":\"1\"}', '10.235.20.62', '2019-05-05 14:22:00', 'sesame');
INSERT INTO `sys_log` VALUES (7463410, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/getCoinTrading', '{\"accessKey\":\"a5db385794be4d5cb4b6229068493907\"}', '10.235.20.62', '2019-05-05 14:22:52', 'sesame');
INSERT INTO `sys_log` VALUES (7463411, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/otc/get_fiat_type_price', '{\"accessKey\":\"a5db385794be4d5cb4b6229068493907\"}', '10.235.20.62', '2019-05-05 14:22:52', 'sesame');
INSERT INTO `sys_log` VALUES (7463412, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"a5db385794be4d5cb4b6229068493907\"}', '10.235.20.62', '2019-05-05 14:22:52', 'sesame');
INSERT INTO `sys_log` VALUES (7463413, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"a5db385794be4d5cb4b6229068493907\"}', '10.235.20.62', '2019-05-05 15:10:29', 'sesame');
INSERT INTO `sys_log` VALUES (7463414, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"a5db385794be4d5cb4b6229068493907\"}', '10.235.20.62', '2019-05-05 15:10:29', 'sesame');
INSERT INTO `sys_log` VALUES (7463415, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/getFaitCoinType', '{}', '10.235.20.62', '2019-05-05 15:10:32', 'sesame');
INSERT INTO `sys_log` VALUES (7463416, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/getFaitCoinType', '{}', '10.235.20.62', '2019-05-05 15:10:50', 'sesame');
INSERT INTO `sys_log` VALUES (7463417, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/get_appinfo', '{}', '119.139.199.99', '2019-05-05 15:25:50', 'sesame');
INSERT INTO `sys_log` VALUES (7463418, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/otc/get_fiat_type_price', '{\"accessKey\":\"a5db385794be4d5cb4b6229068493907\"}', '10.235.20.62', '2019-05-05 15:58:09', 'sesame');
INSERT INTO `sys_log` VALUES (7463419, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/getCoinTrading', '{\"accessKey\":\"a5db385794be4d5cb4b6229068493907\"}', '10.235.20.62', '2019-05-05 15:58:09', 'sesame');
INSERT INTO `sys_log` VALUES (7463420, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"a5db385794be4d5cb4b6229068493907\"}', '10.235.20.62', '2019-05-05 15:58:09', 'sesame');
INSERT INTO `sys_log` VALUES (7463421, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/coin/getAllCoinTraingOrder', '{\"accessKey\":\"a5db385794be4d5cb4b6229068493907\",\"order_type\":\"1\"}', '10.235.20.62', '2019-05-05 15:58:12', 'sesame');
INSERT INTO `sys_log` VALUES (7463422, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/coin/getAllCoinTraingOrder', '{\"accessKey\":\"a5db385794be4d5cb4b6229068493907\",\"order_type\":\"1\"}', '10.235.20.62', '2019-05-05 15:58:12', 'sesame');
INSERT INTO `sys_log` VALUES (7463423, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"a5db385794be4d5cb4b6229068493907\"}', '10.235.20.62', '2019-05-05 16:14:41', 'sesame');
INSERT INTO `sys_log` VALUES (7463424, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"a5db385794be4d5cb4b6229068493907\"}', '10.235.20.62', '2019-05-05 16:14:43', 'sesame');
INSERT INTO `sys_log` VALUES (7463425, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/otc/user_all_buy_order', '{\"accessKey\":\"a5db385794be4d5cb4b6229068493907\"}', '10.235.20.62', '2019-05-05 16:14:46', 'sesame');
INSERT INTO `sys_log` VALUES (7463426, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/otc/user_all_buy_order', '{\"accessKey\":\"a5db385794be4d5cb4b6229068493907\"}', '10.235.20.62', '2019-05-05 16:14:48', 'sesame');
INSERT INTO `sys_log` VALUES (7463427, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userRecord', '{\"offset\":\"0\",\"accessKey\":\"a5db385794be4d5cb4b6229068493907\",\"num\":\"\",\"limit\":\"20\",\"type\":\"\"}', '10.235.20.62', '2019-05-05 16:14:49', 'sesame');
INSERT INTO `sys_log` VALUES (7463428, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"a5db385794be4d5cb4b6229068493907\"}', '10.235.20.62', '2019-05-05 16:14:52', 'sesame');
INSERT INTO `sys_log` VALUES (7463429, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/coin/getAllCoinTraingOrder', '{\"accessKey\":\"a5db385794be4d5cb4b6229068493907\",\"order_type\":\"1\"}', '10.235.20.62', '2019-05-05 16:14:52', 'sesame');
INSERT INTO `sys_log` VALUES (7463430, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"a5db385794be4d5cb4b6229068493907\"}', '10.235.20.62', '2019-05-05 16:14:54', 'sesame');
INSERT INTO `sys_log` VALUES (7463431, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/coin/getAllCoinTraingOrder', '{\"accessKey\":\"a5db385794be4d5cb4b6229068493907\",\"order_type\":\"1\"}', '10.235.20.62', '2019-05-05 16:14:57', 'sesame');
INSERT INTO `sys_log` VALUES (7463432, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"a5db385794be4d5cb4b6229068493907\"}', '10.235.20.62', '2019-05-05 16:14:57', 'sesame');
INSERT INTO `sys_log` VALUES (7463433, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"a5db385794be4d5cb4b6229068493907\"}', '10.235.20.62', '2019-05-05 16:15:02', 'sesame');
INSERT INTO `sys_log` VALUES (7463434, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"a5db385794be4d5cb4b6229068493907\"}', '10.235.20.62', '2019-05-05 16:15:02', 'sesame');
INSERT INTO `sys_log` VALUES (7463435, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userRecord', '{\"offset\":\"0\",\"accessKey\":\"a5db385794be4d5cb4b6229068493907\",\"num\":\"\",\"limit\":\"20\",\"type\":\"\"}', '10.235.20.62', '2019-05-05 16:15:12', 'sesame');
INSERT INTO `sys_log` VALUES (7463436, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"a5db385794be4d5cb4b6229068493907\"}', '10.235.20.62', '2019-05-05 16:19:07', 'sesame');
INSERT INTO `sys_log` VALUES (7463437, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"a5db385794be4d5cb4b6229068493907\"}', '10.235.20.62', '2019-05-05 16:19:07', 'sesame');
INSERT INTO `sys_log` VALUES (7463438, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userRecord', '{\"offset\":\"0\",\"accessKey\":\"a5db385794be4d5cb4b6229068493907\",\"coinTypeId\":\"003\",\"num\":\"\",\"limit\":\"20\",\"type\":\"\"}', '10.235.20.62', '2019-05-05 16:19:09', 'sesame');
INSERT INTO `sys_log` VALUES (7463439, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/coin/getAllCoinTraingOrder', '{\"accessKey\":\"a5db385794be4d5cb4b6229068493907\",\"order_type\":\"1\"}', '10.235.20.62', '2019-05-05 16:19:18', 'sesame');
INSERT INTO `sys_log` VALUES (7463440, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"a5db385794be4d5cb4b6229068493907\"}', '10.235.20.62', '2019-05-05 16:19:20', 'sesame');
INSERT INTO `sys_log` VALUES (7463441, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/get_appinfo', '{}', '119.139.199.99', '2019-05-05 16:25:29', 'sesame');
INSERT INTO `sys_log` VALUES (7463442, -1, '获取用户信息为空', 'normal', NULL, '/manager/login;JSESSIONID=4eda4c1d-076d-4c2e-99ac-1a3541b86499', '{}', '127.0.0.1', '2019-05-05 16:30:07', 'sesame');
INSERT INTO `sys_log` VALUES (7463443, 1, 'admin', 'normal', NULL, '/manager/login', '{\"password\":\"123456\",\"mobileCheckCode\":\"\",\"username\":\"admin\",\"checkCode\":\"8qwj\"}', '127.0.0.1', '2019-05-05 16:30:14', 'sesame');
INSERT INTO `sys_log` VALUES (7463444, 1, 'admin', 'normal', NULL, '/manager/index', '{}', '127.0.0.1', '2019-05-05 16:30:14', 'sesame');
INSERT INTO `sys_log` VALUES (7463445, 1, 'admin', 'normal', NULL, '/manager/main', '{}', '127.0.0.1', '2019-05-05 16:30:14', 'sesame');
INSERT INTO `sys_log` VALUES (7463446, 1, 'admin', 'normal', NULL, '/manager/oa/notify/message', '{}', '127.0.0.1', '2019-05-05 16:30:14', 'sesame');
INSERT INTO `sys_log` VALUES (7463447, 1, 'admin', 'normal', NULL, '/manager/main', '{}', '127.0.0.1', '2019-05-05 16:30:14', 'sesame');
INSERT INTO `sys_log` VALUES (7463448, 1, 'admin', 'normal', NULL, '/api/report/getUserRegisteredNum', '{\"endDate\":\"2019-5-5\",\"startDate\":\"2019-4-5\"}', '127.0.0.1', '2019-05-05 16:30:15', 'sesame');
INSERT INTO `sys_log` VALUES (7463449, 1, 'admin', 'error', NULL, 'http://localhost:91/api/report/getProfitCoinRelease', 'org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column \'kplus.t_profit_coin_release.release_date\' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by\r\n### The error may exist in com/sesame/system/report/dao/BaseReportDao.java (best guess)\r\n### The error may involve com.sesame.system.report.dao.BaseReportDao.getProfitCoinRelease-Inline\r\n### The error occurred while setting parameters\r\n### SQL: SELECT release_date date,currency FROM t_profit_coin_release WHERE ( date ( release_date ) >= date ( ? ) AND date ( release_date ) <= date ( ? ) ) GROUP BY date ( release_date ) ORDER BY date asc\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column \'kplus.t_profit_coin_release.release_date\' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column \'kplus.t_profit_coin_release.release_date\' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by', NULL, '2019-05-05 16:30:15', NULL);
INSERT INTO `sys_log` VALUES (7463450, 1, 'admin', 'error', NULL, 'http://localhost:91/api/report/getBaseReport', 'org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'account_id\' in \'where clause\'\r\n### The error may exist in com/sesame/system/report/dao/BaseReportDao.java (best guess)\r\n### The error may involve com.sesame.system.report.dao.BaseReportDao.getRYBYesterdayAddLockCoin-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select sum(lock_currency) FROM t_lp_account_invest_project  WHERE (account_id LIKE \'%-RYBLock\') and  (date(create_date) = date(?) )\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'account_id\' in \'where clause\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'account_id\' in \'where clause\'', NULL, '2019-05-05 16:30:15', NULL);
INSERT INTO `sys_log` VALUES (7463451, 1, 'admin', 'normal', NULL, '/api/report/getProfitCoinRelease', '{\"endDate\":\"2021-5-5\",\"startDate\":\"2019-5-5\"}', '127.0.0.1', '2019-05-05 16:30:15', 'sesame');
INSERT INTO `sys_log` VALUES (7463452, 1, 'admin', 'normal', NULL, '/api/report/getBaseReport', '{}', '127.0.0.1', '2019-05-05 16:30:15', 'sesame');
INSERT INTO `sys_log` VALUES (7463453, 1, 'admin', 'normal', NULL, '/', '{}', '127.0.0.1', '2019-05-05 16:30:17', 'sesame');
INSERT INTO `sys_log` VALUES (7463454, 1, 'admin', 'normal', NULL, '/manager/login', '{}', '127.0.0.1', '2019-05-05 16:30:17', 'sesame');
INSERT INTO `sys_log` VALUES (7463455, 1, 'admin', 'normal', NULL, '/manager/sesame/swOtcOrder', '{}', '127.0.0.1', '2019-05-05 16:30:18', 'sesame');
INSERT INTO `sys_log` VALUES (7463456, 1, 'admin', 'normal', NULL, '/manager/sesame/swOtcOrder/list', '{}', '127.0.0.1', '2019-05-05 16:30:19', 'sesame');
INSERT INTO `sys_log` VALUES (7463457, 1, 'admin', 'normal', NULL, '/manager/sesame/swAccountRecord', '{}', '127.0.0.1', '2019-05-05 16:30:26', 'sesame');
INSERT INTO `sys_log` VALUES (7463458, 1, 'admin', 'normal', NULL, '/manager/sesame/swAccountRecord/list', '{}', '127.0.0.1', '2019-05-05 16:30:26', 'sesame');
INSERT INTO `sys_log` VALUES (7463459, 1, 'admin', 'normal', NULL, '/manager/sesame/swAccountRecord/list', '{}', '127.0.0.1', '2019-05-05 16:30:26', 'sesame');
INSERT INTO `sys_log` VALUES (7463460, 1, 'admin', 'normal', NULL, '/manager/sesame/swAccountRecord/list', '{}', '127.0.0.1', '2019-05-05 16:30:28', 'sesame');
INSERT INTO `sys_log` VALUES (7463461, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/getCoinTrading', '{\"accessKey\":\"a5db385794be4d5cb4b6229068493907\"}', '10.235.20.62', '2019-05-05 17:19:00', 'sesame');
INSERT INTO `sys_log` VALUES (7463462, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/otc/get_fiat_type_price', '{\"accessKey\":\"a5db385794be4d5cb4b6229068493907\"}', '10.235.20.62', '2019-05-05 17:19:00', 'sesame');
INSERT INTO `sys_log` VALUES (7463463, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"a5db385794be4d5cb4b6229068493907\"}', '10.235.20.62', '2019-05-05 17:19:00', 'sesame');
INSERT INTO `sys_log` VALUES (7463464, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"a5db385794be4d5cb4b6229068493907\"}', '10.235.20.62', '2019-05-05 17:46:27', 'sesame');
INSERT INTO `sys_log` VALUES (7463465, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"a5db385794be4d5cb4b6229068493907\"}', '10.235.20.62', '2019-05-05 17:54:36', 'sesame');
INSERT INTO `sys_log` VALUES (7463466, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/coin/getAllCoinTraingOrder', '{\"accessKey\":\"a5db385794be4d5cb4b6229068493907\",\"order_type\":\"1\"}', '10.235.20.62', '2019-05-05 17:54:38', 'sesame');
INSERT INTO `sys_log` VALUES (7463467, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"a5db385794be4d5cb4b6229068493907\"}', '10.235.20.62', '2019-05-05 18:01:28', 'sesame');
INSERT INTO `sys_log` VALUES (7463468, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/logout', '{\"accessKey\":\"a5db385794be4d5cb4b6229068493907\"}', '10.235.20.62', '2019-05-05 18:02:18', 'sesame');
INSERT INTO `sys_log` VALUES (7463469, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/getFaitCoinType', '{}', '10.235.20.62', '2019-05-05 18:02:19', 'sesame');
INSERT INTO `sys_log` VALUES (7463470, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"62bf04744c604cf2adf56d15c1e33487\"}', '112.97.63.216', '2019-05-05 21:37:14', 'sesame');
INSERT INTO `sys_log` VALUES (7463471, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/otc/get_fiat_type_price', '{\"accessKey\":\"62bf04744c604cf2adf56d15c1e33487\"}', '112.97.63.216', '2019-05-05 21:37:14', 'sesame');
INSERT INTO `sys_log` VALUES (7463472, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/get_appinfo', '{}', '112.97.63.216', '2019-05-05 21:37:14', 'sesame');
INSERT INTO `sys_log` VALUES (7463473, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"62bf04744c604cf2adf56d15c1e33487\"}', '112.97.63.216', '2019-05-05 21:37:43', 'sesame');
INSERT INTO `sys_log` VALUES (7463474, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/getCoinTypeLockProject', '{\"accessKey\":\"62bf04744c604cf2adf56d15c1e33487\",\"coinName\":\"KC\"}', '112.97.63.216', '2019-05-05 21:37:44', 'sesame');
INSERT INTO `sys_log` VALUES (7463475, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/otc/user_all_buy_order', '{\"accessKey\":\"62bf04744c604cf2adf56d15c1e33487\"}', '112.97.63.216', '2019-05-05 21:37:50', 'sesame');
INSERT INTO `sys_log` VALUES (7463476, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"62bf04744c604cf2adf56d15c1e33487\"}', '112.97.63.216', '2019-05-05 21:37:52', 'sesame');
INSERT INTO `sys_log` VALUES (7463477, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"62bf04744c604cf2adf56d15c1e33487\"}', '112.97.63.216', '2019-05-05 21:37:53', 'sesame');
INSERT INTO `sys_log` VALUES (7463478, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"62bf04744c604cf2adf56d15c1e33487\"}', '112.97.63.216', '2019-05-05 21:38:02', 'sesame');
INSERT INTO `sys_log` VALUES (7463479, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/get_appinfo', '{}', '112.97.63.216', '2019-05-05 21:38:08', 'sesame');
INSERT INTO `sys_log` VALUES (7463480, -1, '获取用户信息为空', 'normal', NULL, '/', '{}', '139.224.15.159', '2019-05-06 09:48:21', 'sesame');
INSERT INTO `sys_log` VALUES (7463481, -1, '获取用户信息为空', 'normal', NULL, '/manager/login', '{}', '139.224.15.159', '2019-05-06 09:48:21', 'sesame');
INSERT INTO `sys_log` VALUES (7463482, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/getFaitCoinType', '{}', '10.235.20.62', '2019-05-06 10:12:59', 'sesame');
INSERT INTO `sys_log` VALUES (7463483, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/getFaitCoinType', '{}', '10.235.20.62', '2019-05-06 10:13:00', 'sesame');
INSERT INTO `sys_log` VALUES (7463484, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/getFaitCoinType', '{}', '10.235.20.62', '2019-05-06 10:13:21', 'sesame');
INSERT INTO `sys_log` VALUES (7463485, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/login', '{\"mobile\":\"15626215431\",\"loginPass\":\"12345678\",\"ex1\":\"86\"}', '10.235.20.62', '2019-05-06 10:13:29', 'sesame');
INSERT INTO `sys_log` VALUES (7463486, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/otc/get_fiat_type_price', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 10:13:30', 'sesame');
INSERT INTO `sys_log` VALUES (7463487, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/getCoinTrading', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 10:13:30', 'sesame');
INSERT INTO `sys_log` VALUES (7463488, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 10:13:30', 'sesame');
INSERT INTO `sys_log` VALUES (7463489, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/getCoinTrading', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 10:13:34', 'sesame');
INSERT INTO `sys_log` VALUES (7463490, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/otc/get_fiat_type_price', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 10:13:34', 'sesame');
INSERT INTO `sys_log` VALUES (7463491, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 10:13:34', 'sesame');
INSERT INTO `sys_log` VALUES (7463492, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/getCoinTrading', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 10:14:37', 'sesame');
INSERT INTO `sys_log` VALUES (7463493, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/otc/get_fiat_type_price', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 10:14:37', 'sesame');
INSERT INTO `sys_log` VALUES (7463494, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 10:14:37', 'sesame');
INSERT INTO `sys_log` VALUES (7463495, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/getCoinTrading', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 10:17:17', 'sesame');
INSERT INTO `sys_log` VALUES (7463496, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/otc/get_fiat_type_price', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 10:17:17', 'sesame');
INSERT INTO `sys_log` VALUES (7463497, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 10:17:17', 'sesame');
INSERT INTO `sys_log` VALUES (7463498, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/getCoinTrading', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 10:17:20', 'sesame');
INSERT INTO `sys_log` VALUES (7463499, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/otc/get_fiat_type_price', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 10:17:20', 'sesame');
INSERT INTO `sys_log` VALUES (7463500, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 10:17:20', 'sesame');
INSERT INTO `sys_log` VALUES (7463501, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/otc/get_fiat_type_price', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 10:17:25', 'sesame');
INSERT INTO `sys_log` VALUES (7463502, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/getCoinTrading', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 10:17:25', 'sesame');
INSERT INTO `sys_log` VALUES (7463503, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 10:17:25', 'sesame');
INSERT INTO `sys_log` VALUES (7463504, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/getCoinTrading', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 10:17:40', 'sesame');
INSERT INTO `sys_log` VALUES (7463505, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/otc/get_fiat_type_price', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 10:17:40', 'sesame');
INSERT INTO `sys_log` VALUES (7463506, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 10:17:40', 'sesame');
INSERT INTO `sys_log` VALUES (7463507, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 10:18:14', 'sesame');
INSERT INTO `sys_log` VALUES (7463508, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 10:18:15', 'sesame');
INSERT INTO `sys_log` VALUES (7463509, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 10:18:15', 'sesame');
INSERT INTO `sys_log` VALUES (7463510, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/otc/get_fiat_type_price', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 10:18:33', 'sesame');
INSERT INTO `sys_log` VALUES (7463511, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/getCoinTrading', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 10:18:33', 'sesame');
INSERT INTO `sys_log` VALUES (7463512, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 10:18:33', 'sesame');
INSERT INTO `sys_log` VALUES (7463513, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userRecord', '{\"offset\":\"0\",\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\",\"coinTypeId\":\"bb0fa0c784bd4886ad1fa223366c167f\",\"num\":\"\",\"limit\":\"20\",\"type\":\"\"}', '10.235.20.62', '2019-05-06 10:18:38', 'sesame');
INSERT INTO `sys_log` VALUES (7463514, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/shop/check_shop_register', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 10:18:53', 'sesame');
INSERT INTO `sys_log` VALUES (7463515, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/getCoinTrading', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 10:19:01', 'sesame');
INSERT INTO `sys_log` VALUES (7463516, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/otc/get_fiat_type_price', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 10:19:01', 'sesame');
INSERT INTO `sys_log` VALUES (7463517, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 10:19:01', 'sesame');
INSERT INTO `sys_log` VALUES (7463518, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/shop/check_shop_register', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 10:19:03', 'sesame');
INSERT INTO `sys_log` VALUES (7463519, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/getCoinTrading', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 10:19:14', 'sesame');
INSERT INTO `sys_log` VALUES (7463520, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/otc/get_fiat_type_price', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 10:19:14', 'sesame');
INSERT INTO `sys_log` VALUES (7463521, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 10:19:14', 'sesame');
INSERT INTO `sys_log` VALUES (7463522, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/getCoinTrading', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 10:19:29', 'sesame');
INSERT INTO `sys_log` VALUES (7463523, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/otc/get_fiat_type_price', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 10:19:29', 'sesame');
INSERT INTO `sys_log` VALUES (7463524, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 10:19:29', 'sesame');
INSERT INTO `sys_log` VALUES (7463525, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/getCoinTrading', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 10:19:37', 'sesame');
INSERT INTO `sys_log` VALUES (7463526, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/otc/get_fiat_type_price', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 10:19:37', 'sesame');
INSERT INTO `sys_log` VALUES (7463527, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 10:19:37', 'sesame');
INSERT INTO `sys_log` VALUES (7463528, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/shop/check_shop_register', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 10:19:39', 'sesame');
INSERT INTO `sys_log` VALUES (7463529, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/getCoinTrading', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 10:19:49', 'sesame');
INSERT INTO `sys_log` VALUES (7463530, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/otc/get_fiat_type_price', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 10:19:49', 'sesame');
INSERT INTO `sys_log` VALUES (7463531, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 10:19:49', 'sesame');
INSERT INTO `sys_log` VALUES (7463532, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/getCoinTrading', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 10:19:52', 'sesame');
INSERT INTO `sys_log` VALUES (7463533, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/otc/get_fiat_type_price', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 10:19:52', 'sesame');
INSERT INTO `sys_log` VALUES (7463534, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 10:19:52', 'sesame');
INSERT INTO `sys_log` VALUES (7463535, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/getCoinTrading', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 10:21:15', 'sesame');
INSERT INTO `sys_log` VALUES (7463536, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/otc/get_fiat_type_price', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 10:21:15', 'sesame');
INSERT INTO `sys_log` VALUES (7463537, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 10:21:15', 'sesame');
INSERT INTO `sys_log` VALUES (7463538, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/shop/check_shop_register', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 10:21:17', 'sesame');
INSERT INTO `sys_log` VALUES (7463539, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/getCoinTrading', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 10:22:54', 'sesame');
INSERT INTO `sys_log` VALUES (7463540, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/otc/get_fiat_type_price', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 10:22:54', 'sesame');
INSERT INTO `sys_log` VALUES (7463541, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 10:22:54', 'sesame');
INSERT INTO `sys_log` VALUES (7463542, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/getCoinTrading', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 10:22:57', 'sesame');
INSERT INTO `sys_log` VALUES (7463543, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/otc/get_fiat_type_price', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 10:22:57', 'sesame');
INSERT INTO `sys_log` VALUES (7463544, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 10:22:57', 'sesame');
INSERT INTO `sys_log` VALUES (7463545, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/getCoinTrading', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 10:23:44', 'sesame');
INSERT INTO `sys_log` VALUES (7463546, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/otc/get_fiat_type_price', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 10:23:44', 'sesame');
INSERT INTO `sys_log` VALUES (7463547, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 10:23:44', 'sesame');
INSERT INTO `sys_log` VALUES (7463548, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/getCoinTrading', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 10:23:54', 'sesame');
INSERT INTO `sys_log` VALUES (7463549, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/otc/get_fiat_type_price', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 10:23:54', 'sesame');
INSERT INTO `sys_log` VALUES (7463550, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 10:23:54', 'sesame');
INSERT INTO `sys_log` VALUES (7463551, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userRecord', '{\"offset\":\"0\",\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\",\"coinTypeId\":\"bb0fa0c784bd4886ad1fa223366c167f\",\"num\":\"\",\"limit\":\"20\",\"type\":\"\"}', '10.235.20.62', '2019-05-06 10:25:19', 'sesame');
INSERT INTO `sys_log` VALUES (7463552, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 10:37:30', 'sesame');
INSERT INTO `sys_log` VALUES (7463553, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/shop/check_shop_register', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 10:37:35', 'sesame');
INSERT INTO `sys_log` VALUES (7463554, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/shop/check_shop_register', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 10:39:05', 'sesame');
INSERT INTO `sys_log` VALUES (7463555, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/getCoinTrading', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 10:40:14', 'sesame');
INSERT INTO `sys_log` VALUES (7463556, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/otc/get_fiat_type_price', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 10:40:14', 'sesame');
INSERT INTO `sys_log` VALUES (7463557, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 10:40:14', 'sesame');
INSERT INTO `sys_log` VALUES (7463558, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/getCoinTrading', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 10:40:17', 'sesame');
INSERT INTO `sys_log` VALUES (7463559, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/otc/get_fiat_type_price', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 10:40:17', 'sesame');
INSERT INTO `sys_log` VALUES (7463560, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 10:40:17', 'sesame');
INSERT INTO `sys_log` VALUES (7463561, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/shop/check_shop_register', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 10:41:36', 'sesame');
INSERT INTO `sys_log` VALUES (7463562, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/get_appinfo', '{}', '119.139.196.65', '2019-05-06 10:46:24', 'sesame');
INSERT INTO `sys_log` VALUES (7463563, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/get_appinfo', '{}', '119.139.196.65', '2019-05-06 10:46:24', 'sesame');
INSERT INTO `sys_log` VALUES (7463564, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/otc/get_fiat_type_price', '{\"accessKey\":\"f36d743633f74ddbb88c3db380cdf248\"}', '10.235.20.62', '2019-05-06 12:02:45', 'sesame');
INSERT INTO `sys_log` VALUES (7463565, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/get_appinfo', '{}', '10.235.20.62', '2019-05-06 12:02:45', 'sesame');
INSERT INTO `sys_log` VALUES (7463566, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"f36d743633f74ddbb88c3db380cdf248\"}', '10.235.20.62', '2019-05-06 12:02:45', 'sesame');
INSERT INTO `sys_log` VALUES (7463567, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/getCoinTypeLockProject', '{\"accessKey\":\"f36d743633f74ddbb88c3db380cdf248\",\"coinName\":\"KCP\"}', '10.235.20.62', '2019-05-06 12:03:00', 'sesame');
INSERT INTO `sys_log` VALUES (7463568, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userRecord', '{\"offset\":\"0\",\"accessKey\":\"f36d743633f74ddbb88c3db380cdf248\",\"num\":\"\",\"limit\":\"10\",\"type\":\"\"}', '10.235.20.62', '2019-05-06 12:03:05', 'sesame');
INSERT INTO `sys_log` VALUES (7463569, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/get_appinfo', '{}', '10.235.20.62', '2019-05-06 12:05:17', 'sesame');
INSERT INTO `sys_log` VALUES (7463570, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/otc/get_fiat_type_price', '{\"accessKey\":\"f36d743633f74ddbb88c3db380cdf248\"}', '10.235.20.62', '2019-05-06 14:14:22', 'sesame');
INSERT INTO `sys_log` VALUES (7463571, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"f36d743633f74ddbb88c3db380cdf248\"}', '10.235.20.62', '2019-05-06 14:14:22', 'sesame');
INSERT INTO `sys_log` VALUES (7463572, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/get_appinfo', '{}', '10.235.20.62', '2019-05-06 14:14:22', 'sesame');
INSERT INTO `sys_log` VALUES (7463573, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"f36d743633f74ddbb88c3db380cdf248\"}', '10.235.20.62', '2019-05-06 14:14:52', 'sesame');
INSERT INTO `sys_log` VALUES (7463574, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/getUserCheckInAmount', '{\"accessKey\":\"f36d743633f74ddbb88c3db380cdf248\"}', '10.235.20.62', '2019-05-06 14:15:06', 'sesame');
INSERT INTO `sys_log` VALUES (7463575, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/getUserCheckInAmount', '{\"accessKey\":\"f36d743633f74ddbb88c3db380cdf248\"}', '10.235.20.62', '2019-05-06 14:15:28', 'sesame');
INSERT INTO `sys_log` VALUES (7463576, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userRecord', '{\"offset\":\"0\",\"accessKey\":\"f36d743633f74ddbb88c3db380cdf248\",\"num\":\"\",\"limit\":\"10\",\"type\":\"\"}', '10.235.20.62', '2019-05-06 14:15:38', 'sesame');
INSERT INTO `sys_log` VALUES (7463577, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userRecord', '{\"offset\":\"0\",\"accessKey\":\"f36d743633f74ddbb88c3db380cdf248\",\"num\":\"\",\"limit\":\"10\",\"type\":\"\"}', '10.235.20.62', '2019-05-06 14:15:44', 'sesame');
INSERT INTO `sys_log` VALUES (7463578, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/getCoinTrading', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 15:13:17', 'sesame');
INSERT INTO `sys_log` VALUES (7463579, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/otc/get_fiat_type_price', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 15:13:17', 'sesame');
INSERT INTO `sys_log` VALUES (7463580, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 15:13:17', 'sesame');
INSERT INTO `sys_log` VALUES (7463581, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/getCoinTrading', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 15:13:22', 'sesame');
INSERT INTO `sys_log` VALUES (7463582, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/otc/get_fiat_type_price', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 15:13:22', 'sesame');
INSERT INTO `sys_log` VALUES (7463583, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 15:13:22', 'sesame');
INSERT INTO `sys_log` VALUES (7463584, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/shop/check_shop_register', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 15:13:26', 'sesame');
INSERT INTO `sys_log` VALUES (7463585, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/getCoinTrading', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 15:15:33', 'sesame');
INSERT INTO `sys_log` VALUES (7463586, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/otc/get_fiat_type_price', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 15:15:33', 'sesame');
INSERT INTO `sys_log` VALUES (7463587, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 15:15:33', 'sesame');
INSERT INTO `sys_log` VALUES (7463588, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/shop/check_shop_register', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 15:20:59', 'sesame');
INSERT INTO `sys_log` VALUES (7463589, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/get_discount_list', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 15:21:22', 'sesame');
INSERT INTO `sys_log` VALUES (7463590, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/get_discount_list', '{}', '10.235.20.62', '2019-05-06 15:21:39', 'sesame');
INSERT INTO `sys_log` VALUES (7463591, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/get_discount_list', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 15:21:42', 'sesame');
INSERT INTO `sys_log` VALUES (7463592, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/get_discount_list', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 15:22:12', 'sesame');
INSERT INTO `sys_log` VALUES (7463593, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/get_discount_list', '{}', '10.235.20.69', '2019-05-06 15:22:39', 'sesame');
INSERT INTO `sys_log` VALUES (7463594, -1, '获取用户信息为空', 'normal', NULL, '//api/app/pc/login', '{\"mobile\":\"14444444491\",\"loginPass\":\"aaa000000\",\"ex1\":\"86\"}', '127.0.0.1', '2019-05-06 15:25:42', 'sesame');
INSERT INTO `sys_log` VALUES (7463595, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/shop/get_discount_list', '{}', '127.0.0.1', '2019-05-06 15:26:04', 'sesame');
INSERT INTO `sys_log` VALUES (7463596, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/shop/check_shop_register', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 15:26:22', 'sesame');
INSERT INTO `sys_log` VALUES (7463597, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/get_discount_list', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 15:26:22', 'sesame');
INSERT INTO `sys_log` VALUES (7463598, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/get_discount_list', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 15:26:55', 'sesame');
INSERT INTO `sys_log` VALUES (7463599, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/get_discount_list', '{}', '10.235.20.69', '2019-05-06 15:27:23', 'sesame');
INSERT INTO `sys_log` VALUES (7463600, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/get_discount_list', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.69', '2019-05-06 15:27:59', 'sesame');
INSERT INTO `sys_log` VALUES (7463601, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/shop/get_discount_list', '{}', '127.0.0.1', '2019-05-06 15:28:35', 'sesame');
INSERT INTO `sys_log` VALUES (7463602, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/shop/get_discount_list', '{}', '127.0.0.1', '2019-05-06 15:28:52', 'sesame');
INSERT INTO `sys_log` VALUES (7463603, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/shop/get_discount_list', '{}', '10.235.20.184', '2019-05-06 15:29:44', 'sesame');
INSERT INTO `sys_log` VALUES (7463604, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/shop/get_discount_list', '{}', '10.235.20.184', '2019-05-06 15:30:55', 'sesame');
INSERT INTO `sys_log` VALUES (7463605, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/shop/get_discount_list', '{}', '10.235.20.184', '2019-05-06 15:31:05', 'sesame');
INSERT INTO `sys_log` VALUES (7463606, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/shop/get_discount_list', '{}', '10.235.20.184', '2019-05-06 15:31:54', 'sesame');
INSERT INTO `sys_log` VALUES (7463607, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/get_discount_list', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.69', '2019-05-06 15:34:54', 'sesame');
INSERT INTO `sys_log` VALUES (7463608, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/shop/get_discount_list', '{}', '10.235.20.184', '2019-05-06 15:40:34', 'sesame');
INSERT INTO `sys_log` VALUES (7463609, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/otc/get_fiat_type_price', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 15:41:41', 'sesame');
INSERT INTO `sys_log` VALUES (7463610, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/getCoinTrading', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 15:41:41', 'sesame');
INSERT INTO `sys_log` VALUES (7463611, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 15:41:41', 'sesame');
INSERT INTO `sys_log` VALUES (7463612, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/shop/check_shop_register', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 15:41:43', 'sesame');
INSERT INTO `sys_log` VALUES (7463613, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/get_discount_list', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 15:41:43', 'sesame');
INSERT INTO `sys_log` VALUES (7463614, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/shop/get_discount_list', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.69', '2019-05-06 15:41:58', 'sesame');
INSERT INTO `sys_log` VALUES (7463615, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/shop/get_discount_list', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 15:42:11', 'sesame');
INSERT INTO `sys_log` VALUES (7463616, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/shop/check_shop_register', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 15:45:26', 'sesame');
INSERT INTO `sys_log` VALUES (7463617, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/shop/get_discount_list', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 15:45:26', 'sesame');
INSERT INTO `sys_log` VALUES (7463618, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/shop/get_discount_list', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 15:47:00', 'sesame');
INSERT INTO `sys_log` VALUES (7463619, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/shop/get_discount_list', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 15:47:07', 'sesame');
INSERT INTO `sys_log` VALUES (7463620, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/shop/get_discount_list', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 15:47:11', 'sesame');
INSERT INTO `sys_log` VALUES (7463621, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/shop/get_discount_list', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 15:47:14', 'sesame');
INSERT INTO `sys_log` VALUES (7463622, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/shop/get_discount_list', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 15:55:45', 'sesame');
INSERT INTO `sys_log` VALUES (7463623, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/shop/get_discount_list', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 15:55:52', 'sesame');
INSERT INTO `sys_log` VALUES (7463624, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/shop/get_discount_list', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 15:56:07', 'sesame');
INSERT INTO `sys_log` VALUES (7463625, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/shop/get_discount_list', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 15:56:09', 'sesame');
INSERT INTO `sys_log` VALUES (7463626, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/shop/get_discount_list', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 15:56:14', 'sesame');
INSERT INTO `sys_log` VALUES (7463627, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/shop/get_discount_list', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 15:56:20', 'sesame');
INSERT INTO `sys_log` VALUES (7463628, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/shop/get_discount_list', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 15:57:02', 'sesame');
INSERT INTO `sys_log` VALUES (7463629, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/shop/get_discount_list', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 15:57:58', 'sesame');
INSERT INTO `sys_log` VALUES (7463630, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/shop/get_discount_list', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 15:58:04', 'sesame');
INSERT INTO `sys_log` VALUES (7463631, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/shop/get_discount_list', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 15:58:29', 'sesame');
INSERT INTO `sys_log` VALUES (7463632, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/shop/get_discount_list', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 15:58:32', 'sesame');
INSERT INTO `sys_log` VALUES (7463633, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/getCoinTrading', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 16:00:10', 'sesame');
INSERT INTO `sys_log` VALUES (7463634, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/otc/get_fiat_type_price', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 16:00:10', 'sesame');
INSERT INTO `sys_log` VALUES (7463635, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 16:00:10', 'sesame');
INSERT INTO `sys_log` VALUES (7463636, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 16:25:06', 'sesame');
INSERT INTO `sys_log` VALUES (7463637, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/shop/get_discount_list', '{}', '10.235.20.184', '2019-05-06 16:38:06', 'sesame');
INSERT INTO `sys_log` VALUES (7463638, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 16:57:27', 'sesame');
INSERT INTO `sys_log` VALUES (7463639, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/getCoinTrading', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 16:57:28', 'sesame');
INSERT INTO `sys_log` VALUES (7463640, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/otc/get_fiat_type_price', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 16:57:28', 'sesame');
INSERT INTO `sys_log` VALUES (7463641, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 16:57:28', 'sesame');
INSERT INTO `sys_log` VALUES (7463642, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/coin/getAllCoinTraingOrder', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\",\"order_type\":\"1\"}', '10.235.20.62', '2019-05-06 16:57:30', 'sesame');
INSERT INTO `sys_log` VALUES (7463643, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/shop/check_shop_register', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 16:57:31', 'sesame');
INSERT INTO `sys_log` VALUES (7463644, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/shop/get_discount_list', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 16:57:32', 'sesame');
INSERT INTO `sys_log` VALUES (7463645, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/getCoinTrading', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 17:01:49', 'sesame');
INSERT INTO `sys_log` VALUES (7463646, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/otc/get_fiat_type_price', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 17:01:49', 'sesame');
INSERT INTO `sys_log` VALUES (7463647, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/userWalletAmount', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\"}', '10.235.20.62', '2019-05-06 17:01:49', 'sesame');
INSERT INTO `sys_log` VALUES (7463648, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/coin/getAllCoinTraingOrder', '{\"accessKey\":\"a2a87141f397441aa31b1eacb94fa0fb\",\"order_type\":\"1\"}', '10.235.20.62', '2019-05-06 17:02:04', 'sesame');
INSERT INTO `sys_log` VALUES (7463649, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/get_province_list', '{}', '10.235.20.184', '2019-05-06 17:36:31', 'sesame');
INSERT INTO `sys_log` VALUES (7463650, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/get_city_list', '{}', '10.235.20.184', '2019-05-06 17:38:00', 'sesame');
INSERT INTO `sys_log` VALUES (7463651, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/get_city_list', '{}', '10.235.20.184', '2019-05-06 17:38:41', 'sesame');
INSERT INTO `sys_log` VALUES (7463652, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/get_area_list', '{}', '10.235.20.184', '2019-05-06 17:54:41', 'sesame');
INSERT INTO `sys_log` VALUES (7463653, -1, '获取用户信息为空', 'normal', NULL, '/', '{}', '10.235.20.176', '2019-05-07 10:14:10', 'sesame');
INSERT INTO `sys_log` VALUES (7463654, -1, '获取用户信息为空', 'normal', NULL, '/manager/login', '{}', '10.235.20.176', '2019-05-07 10:14:10', 'sesame');
INSERT INTO `sys_log` VALUES (7463655, -1, '获取用户信息为空', 'normal', NULL, '/manager/login', '{\"password\":\"123456\",\"mobileCheckCode\":\"\",\"username\":\"admin\",\"checkCode\":\"\"}', '10.235.20.176', '2019-05-07 10:14:18', 'sesame');
INSERT INTO `sys_log` VALUES (7463656, 1, 'admin', 'normal', NULL, '/manager/login', '{\"password\":\"123456\",\"mobileCheckCode\":\"\",\"username\":\"admin\",\"checkCode\":\"sviq\"}', '10.235.20.176', '2019-05-07 10:14:22', 'sesame');
INSERT INTO `sys_log` VALUES (7463657, 1, 'admin', 'normal', NULL, '/manager/index', '{}', '10.235.20.176', '2019-05-07 10:14:22', 'sesame');
INSERT INTO `sys_log` VALUES (7463658, 1, 'admin', 'normal', NULL, '/manager/main', '{}', '10.235.20.176', '2019-05-07 10:14:22', 'sesame');
INSERT INTO `sys_log` VALUES (7463659, 1, 'admin', 'normal', NULL, '/manager/oa/notify/message', '{}', '10.235.20.176', '2019-05-07 10:14:22', 'sesame');
INSERT INTO `sys_log` VALUES (7463660, 1, 'admin', 'normal', NULL, '/manager/main', '{}', '10.235.20.176', '2019-05-07 10:14:22', 'sesame');
INSERT INTO `sys_log` VALUES (7463661, 1, 'admin', 'error', NULL, 'http://10.236.10.1:91/api/report/getProfitCoinRelease', 'org.springframework.jdbc.BadSqlGrammarException: \n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column \'kplus.t_profit_coin_release.release_date\' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by\n### The error may exist in com/sesame/system/report/dao/BaseReportDao.java (best guess)\n### The error may involve com.sesame.system.report.dao.BaseReportDao.getProfitCoinRelease-Inline\n### The error occurred while setting parameters\n### SQL: SELECT release_date date,currency FROM t_profit_coin_release WHERE ( date ( release_date ) >= date ( ? ) AND date ( release_date ) <= date ( ? ) ) GROUP BY date ( release_date ) ORDER BY date asc\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column \'kplus.t_profit_coin_release.release_date\' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column \'kplus.t_profit_coin_release.release_date\' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by', NULL, '2019-05-07 10:14:22', NULL);
INSERT INTO `sys_log` VALUES (7463662, 1, 'admin', 'normal', NULL, '/api/report/getUserRegisteredNum', '{\"endDate\":\"2019-5-7\",\"startDate\":\"2019-4-7\"}', '10.235.20.176', '2019-05-07 10:14:22', 'sesame');
INSERT INTO `sys_log` VALUES (7463663, 1, 'admin', 'error', NULL, 'http://10.236.10.1:91/api/report/getBaseReport', 'org.springframework.jdbc.BadSqlGrammarException: \n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'account_id\' in \'where clause\'\n### The error may exist in com/sesame/system/report/dao/BaseReportDao.java (best guess)\n### The error may involve com.sesame.system.report.dao.BaseReportDao.getRYBYesterdayAddLockCoin-Inline\n### The error occurred while setting parameters\n### SQL: select sum(lock_currency) FROM t_lp_account_invest_project  WHERE (account_id LIKE \'%-RYBLock\') and  (date(create_date) = date(?) )\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'account_id\' in \'where clause\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'account_id\' in \'where clause\'', NULL, '2019-05-07 10:14:22', NULL);
INSERT INTO `sys_log` VALUES (7463664, 1, 'admin', 'normal', NULL, '/api/report/getProfitCoinRelease', '{\"endDate\":\"2021-5-7\",\"startDate\":\"2019-5-7\"}', '10.235.20.176', '2019-05-07 10:14:22', 'sesame');
INSERT INTO `sys_log` VALUES (7463665, 1, 'admin', 'normal', NULL, '/api/report/getBaseReport', '{}', '10.235.20.176', '2019-05-07 10:14:22', 'sesame');
INSERT INTO `sys_log` VALUES (7463666, 1, 'admin', 'normal', NULL, '/', '{}', '10.235.20.176', '2019-05-07 10:14:22', 'sesame');
INSERT INTO `sys_log` VALUES (7463667, 1, 'admin', 'normal', NULL, '/manager/login', '{}', '10.235.20.176', '2019-05-07 10:14:22', 'sesame');
INSERT INTO `sys_log` VALUES (7463668, 1, 'admin', 'normal', NULL, '/manager/common/generator', '{}', '10.235.20.176', '2019-05-07 10:14:56', 'sesame');
INSERT INTO `sys_log` VALUES (7463669, 1, 'admin', 'normal', NULL, '/manager/common/generator/list', '{}', '10.235.20.176', '2019-05-07 10:14:57', 'sesame');
INSERT INTO `sys_log` VALUES (7463670, 1, 'admin', 'normal', NULL, '/manager/sys/menu/', '{}', '10.235.20.176', '2019-05-07 10:15:04', 'sesame');
INSERT INTO `sys_log` VALUES (7463671, 1, 'admin', 'normal', NULL, '/manager/sys/menu/list', '{\"sort\":\"order_num\"}', '10.235.20.176', '2019-05-07 10:15:04', 'sesame');
INSERT INTO `sys_log` VALUES (7463672, -1, '获取用户信息为空', 'normal', NULL, '/manager/login;JSESSIONID=1556bb26-24c6-4d53-ade2-05df1c0a58be', '{}', '127.0.0.1', '2019-05-07 10:23:26', 'sesame');
INSERT INTO `sys_log` VALUES (7463673, 1, 'admin', 'normal', NULL, '/manager/login', '{\"password\":\"123456\",\"mobileCheckCode\":\"\",\"username\":\"admin\",\"checkCode\":\"v9we\"}', '127.0.0.1', '2019-05-07 10:23:42', 'sesame');
INSERT INTO `sys_log` VALUES (7463674, 1, 'admin', 'normal', NULL, '/manager/index', '{}', '127.0.0.1', '2019-05-07 10:23:42', 'sesame');
INSERT INTO `sys_log` VALUES (7463675, 1, 'admin', 'normal', NULL, '/manager/main', '{}', '127.0.0.1', '2019-05-07 10:23:42', 'sesame');
INSERT INTO `sys_log` VALUES (7463676, 1, 'admin', 'normal', NULL, '/manager/oa/notify/message', '{}', '127.0.0.1', '2019-05-07 10:23:42', 'sesame');
INSERT INTO `sys_log` VALUES (7463677, 1, 'admin', 'normal', NULL, '/manager/main', '{}', '127.0.0.1', '2019-05-07 10:23:42', 'sesame');
INSERT INTO `sys_log` VALUES (7463678, 1, 'admin', 'normal', NULL, '/api/report/getUserRegisteredNum', '{\"endDate\":\"2019-5-7\",\"startDate\":\"2019-4-7\"}', '127.0.0.1', '2019-05-07 10:23:42', 'sesame');
INSERT INTO `sys_log` VALUES (7463679, 1, 'admin', 'error', NULL, 'http://localhost:91/api/report/getProfitCoinRelease', 'org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column \'kplus.t_profit_coin_release.release_date\' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by\r\n### The error may exist in com/sesame/system/report/dao/BaseReportDao.java (best guess)\r\n### The error may involve com.sesame.system.report.dao.BaseReportDao.getProfitCoinRelease-Inline\r\n### The error occurred while setting parameters\r\n### SQL: SELECT release_date date,currency FROM t_profit_coin_release WHERE ( date ( release_date ) >= date ( ? ) AND date ( release_date ) <= date ( ? ) ) GROUP BY date ( release_date ) ORDER BY date asc\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column \'kplus.t_profit_coin_release.release_date\' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column \'kplus.t_profit_coin_release.release_date\' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by', NULL, '2019-05-07 10:23:42', NULL);
INSERT INTO `sys_log` VALUES (7463680, 1, 'admin', 'error', NULL, 'http://localhost:91/api/report/getBaseReport', 'org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'account_id\' in \'where clause\'\r\n### The error may exist in com/sesame/system/report/dao/BaseReportDao.java (best guess)\r\n### The error may involve com.sesame.system.report.dao.BaseReportDao.getRYBYesterdayAddLockCoin-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select sum(lock_currency) FROM t_lp_account_invest_project  WHERE (account_id LIKE \'%-RYBLock\') and  (date(create_date) = date(?) )\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'account_id\' in \'where clause\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'account_id\' in \'where clause\'', NULL, '2019-05-07 10:23:42', NULL);
INSERT INTO `sys_log` VALUES (7463681, 1, 'admin', 'normal', NULL, '/api/report/getProfitCoinRelease', '{\"endDate\":\"2021-5-7\",\"startDate\":\"2019-5-7\"}', '127.0.0.1', '2019-05-07 10:23:43', 'sesame');
INSERT INTO `sys_log` VALUES (7463682, 1, 'admin', 'normal', NULL, '/api/report/getBaseReport', '{}', '127.0.0.1', '2019-05-07 10:23:43', 'sesame');
INSERT INTO `sys_log` VALUES (7463683, 1, 'admin', 'normal', NULL, '/', '{}', '127.0.0.1', '2019-05-07 10:23:43', 'sesame');
INSERT INTO `sys_log` VALUES (7463684, 1, 'admin', 'normal', NULL, '/manager/login', '{}', '127.0.0.1', '2019-05-07 10:23:43', 'sesame');
INSERT INTO `sys_log` VALUES (7463685, -1, '获取用户信息为空', 'normal', NULL, '/manager/login;JSESSIONID=4e3b06c7-8786-47a5-b40a-57494b5c93a3', '{}', '127.0.0.1', '2019-05-08 14:42:27', 'sesame');
INSERT INTO `sys_log` VALUES (7463686, 1, 'admin', 'normal', NULL, '/manager/login', '{\"password\":\"123456\",\"mobileCheckCode\":\"\",\"username\":\"admin\",\"checkCode\":\"\"}', '127.0.0.1', '2019-05-08 14:42:31', 'sesame');
INSERT INTO `sys_log` VALUES (7463687, 1, 'admin', 'normal', NULL, '/manager/index', '{}', '127.0.0.1', '2019-05-08 14:42:31', 'sesame');
INSERT INTO `sys_log` VALUES (7463688, 1, 'admin', 'normal', NULL, '/manager/main', '{}', '127.0.0.1', '2019-05-08 14:42:31', 'sesame');
INSERT INTO `sys_log` VALUES (7463689, 1, 'admin', 'normal', NULL, '/manager/oa/notify/message', '{}', '127.0.0.1', '2019-05-08 14:42:32', 'sesame');
INSERT INTO `sys_log` VALUES (7463690, 1, 'admin', 'normal', NULL, '/manager/main', '{}', '127.0.0.1', '2019-05-08 14:42:32', 'sesame');
INSERT INTO `sys_log` VALUES (7463691, 1, 'admin', 'normal', NULL, '/api/report/getProfitCoinRelease', '{\"endDate\":\"2021-5-8\",\"startDate\":\"2019-5-8\"}', '127.0.0.1', '2019-05-08 14:42:32', 'sesame');
INSERT INTO `sys_log` VALUES (7463692, 1, 'admin', 'normal', NULL, '/api/report/getUserRegisteredNum', '{\"endDate\":\"2019-5-8\",\"startDate\":\"2019-4-8\"}', '127.0.0.1', '2019-05-08 14:42:32', 'sesame');
INSERT INTO `sys_log` VALUES (7463693, 1, 'admin', 'normal', NULL, '/api/report/getBaseReport', '{}', '127.0.0.1', '2019-05-08 14:42:32', 'sesame');
INSERT INTO `sys_log` VALUES (7463694, 1, 'admin', 'normal', NULL, '/', '{}', '127.0.0.1', '2019-05-08 14:42:32', 'sesame');
INSERT INTO `sys_log` VALUES (7463695, 1, 'admin', 'normal', NULL, '/manager/login', '{}', '127.0.0.1', '2019-05-08 14:42:32', 'sesame');
INSERT INTO `sys_log` VALUES (7463696, 1, 'admin', 'normal', NULL, '/manager/sysconfig/config', '{\"clazzName\":\"SettlementCommonConfig\"}', '127.0.0.1', '2019-05-08 14:42:42', 'sesame');
INSERT INTO `sys_log` VALUES (7463697, 1, 'admin', 'normal', NULL, '/manager/sysconfig/config', '{\"clazzName\":\"SettlementCommonConfig\"}', '127.0.0.1', '2019-05-08 14:42:42', 'sesame');
INSERT INTO `sys_log` VALUES (7463698, 1, 'admin', 'normal', NULL, '/manager/sysconfig/config/list', '{\"clazzName\":\"SettlementCommonConfig\"}', '127.0.0.1', '2019-05-08 14:42:42', 'sesame');
INSERT INTO `sys_log` VALUES (7463699, 1, 'admin', 'normal', NULL, '/manager/sesame/appInfo', '{}', '127.0.0.1', '2019-05-08 14:42:43', 'sesame');
INSERT INTO `sys_log` VALUES (7463700, 1, 'admin', 'normal', NULL, '/manager/common/sysFile', '{}', '127.0.0.1', '2019-05-08 14:42:50', 'sesame');
INSERT INTO `sys_log` VALUES (7463701, 1, 'admin', 'normal', NULL, '/manager/common/sysFile/list', '{\"offset\":\"0\",\"limit\":\"12\",\"type\":\"\"}', '127.0.0.1', '2019-05-08 14:42:50', 'sesame');
INSERT INTO `sys_log` VALUES (7463702, 1, 'admin', 'normal', NULL, '/manager/common/dict', '{}', '127.0.0.1', '2019-05-08 14:42:51', 'sesame');
INSERT INTO `sys_log` VALUES (7463703, 1, 'admin', 'normal', NULL, '/manager/common/dict/type', '{}', '127.0.0.1', '2019-05-08 14:42:51', 'sesame');
INSERT INTO `sys_log` VALUES (7463704, 1, 'admin', 'normal', NULL, '/manager/common/dict/list', '{}', '127.0.0.1', '2019-05-08 14:42:51', 'sesame');
INSERT INTO `sys_log` VALUES (7463705, 1, 'admin', 'normal', NULL, '/manager/tasklog/task', '{}', '127.0.0.1', '2019-05-08 14:42:53', 'sesame');
INSERT INTO `sys_log` VALUES (7463706, 1, 'admin', 'normal', NULL, '/manager/tasklog/task/list', '{}', '127.0.0.1', '2019-05-08 14:42:53', 'sesame');
INSERT INTO `sys_log` VALUES (7463707, 1, 'admin', 'normal', NULL, '/manager/tasklog/task/list', '{}', '127.0.0.1', '2019-05-08 14:42:53', 'sesame');
INSERT INTO `sys_log` VALUES (7463708, 1, 'admin', 'normal', NULL, '/manager/record/msgRecord', '{}', '127.0.0.1', '2019-05-08 14:42:53', 'sesame');
INSERT INTO `sys_log` VALUES (7463709, 1, 'admin', 'normal', NULL, '/manager/record/msgRecord/list', '{}', '127.0.0.1', '2019-05-08 14:42:53', 'sesame');
INSERT INTO `sys_log` VALUES (7463710, 1, 'admin', 'normal', NULL, '/manager/record/msgRecord/list', '{}', '127.0.0.1', '2019-05-08 14:42:53', 'sesame');
INSERT INTO `sys_log` VALUES (7463711, 1, 'admin', 'normal', NULL, '/manager/sys/menu/', '{}', '127.0.0.1', '2019-05-08 14:42:54', 'sesame');
INSERT INTO `sys_log` VALUES (7463712, 1, 'admin', 'normal', NULL, '/manager/sys/menu/list', '{\"sort\":\"order_num\"}', '127.0.0.1', '2019-05-08 14:42:54', 'sesame');
INSERT INTO `sys_log` VALUES (7463713, 1, 'admin', 'normal', NULL, '/manager/sys/user/', '{}', '127.0.0.1', '2019-05-08 14:43:01', 'sesame');
INSERT INTO `sys_log` VALUES (7463714, 1, 'admin', 'normal', NULL, '/manager/system/sysDept/tree', '{}', '127.0.0.1', '2019-05-08 14:43:01', 'sesame');
INSERT INTO `sys_log` VALUES (7463715, 1, 'admin', 'normal', NULL, '/manager/sys/user/list', '{}', '127.0.0.1', '2019-05-08 14:43:01', 'sesame');
INSERT INTO `sys_log` VALUES (7463716, 1, 'admin', 'normal', NULL, '/manager/sys/role', '{}', '127.0.0.1', '2019-05-08 14:43:02', 'sesame');
INSERT INTO `sys_log` VALUES (7463717, 1, 'admin', 'normal', NULL, '/manager/sys/role/list', '{}', '127.0.0.1', '2019-05-08 14:43:02', 'sesame');
INSERT INTO `sys_log` VALUES (7463718, 1, 'admin', 'normal', NULL, '/manager/system/sysDept', '{}', '127.0.0.1', '2019-05-08 14:43:03', 'sesame');
INSERT INTO `sys_log` VALUES (7463719, 1, 'admin', 'normal', NULL, '/manager/system/sysDept/list', '{}', '127.0.0.1', '2019-05-08 14:43:03', 'sesame');
INSERT INTO `sys_log` VALUES (7463720, 1, 'admin', 'normal', NULL, '/manager/base/securityManager', '{}', '127.0.0.1', '2019-05-08 14:43:04', 'sesame');
INSERT INTO `sys_log` VALUES (7463721, 1, 'admin', 'normal', NULL, '/manager/base/securityManager/list', '{}', '127.0.0.1', '2019-05-08 14:43:04', 'sesame');
INSERT INTO `sys_log` VALUES (7463722, 1, 'admin', 'normal', NULL, '/manager/base/securityManager/list', '{}', '127.0.0.1', '2019-05-08 14:43:04', 'sesame');
INSERT INTO `sys_log` VALUES (7463723, 1, 'admin', 'normal', NULL, '/manager/common/log', '{}', '127.0.0.1', '2019-05-08 14:43:07', 'sesame');
INSERT INTO `sys_log` VALUES (7463724, 1, 'admin', 'normal', NULL, '/manager/common/log/list', '{}', '127.0.0.1', '2019-05-08 14:43:07', 'sesame');
INSERT INTO `sys_log` VALUES (7463725, 1, 'admin', 'normal', NULL, '/manager/common/log/list', '{}', '127.0.0.1', '2019-05-08 14:43:07', 'sesame');
INSERT INTO `sys_log` VALUES (7463726, 1, 'admin', 'normal', NULL, '/manager/sys/online', '{}', '127.0.0.1', '2019-05-08 14:43:08', 'sesame');
INSERT INTO `sys_log` VALUES (7463727, 1, 'admin', 'normal', NULL, '/manager/sys/online/list', '{}', '127.0.0.1', '2019-05-08 14:43:08', 'sesame');
INSERT INTO `sys_log` VALUES (7463728, 1, 'admin', 'normal', NULL, '/manager/common/generator', '{}', '127.0.0.1', '2019-05-08 14:43:10', 'sesame');
INSERT INTO `sys_log` VALUES (7463729, 1, 'admin', 'normal', NULL, '/manager/common/generator/list', '{}', '127.0.0.1', '2019-05-08 14:43:10', 'sesame');
INSERT INTO `sys_log` VALUES (7463730, 1, 'admin', 'normal', NULL, '/manager/common/settlementTest', '{}', '127.0.0.1', '2019-05-08 14:43:11', 'sesame');
INSERT INTO `sys_log` VALUES (7463731, 1, 'admin', 'normal', NULL, '/manager/sys/menu/remove', '{\"id\":\"236\"}', '127.0.0.1', '2019-05-08 14:43:37', 'sesame');
INSERT INTO `sys_log` VALUES (7463732, 1, 'admin', 'normal', NULL, '/manager/sys/menu/list', '{\"sort\":\"order_num\"}', '127.0.0.1', '2019-05-08 14:43:37', 'sesame');
INSERT INTO `sys_log` VALUES (7463733, 1, 'admin', 'normal', NULL, '/manager/sys/menu/remove', '{\"id\":\"252\"}', '127.0.0.1', '2019-05-08 14:43:45', 'sesame');
INSERT INTO `sys_log` VALUES (7463734, 1, 'admin', 'normal', NULL, '/manager/sys/menu/list', '{\"sort\":\"order_num\"}', '127.0.0.1', '2019-05-08 14:43:45', 'sesame');
INSERT INTO `sys_log` VALUES (7463735, 1, 'admin', 'normal', NULL, '/manager/sys/menu/remove', '{\"id\":\"240\"}', '127.0.0.1', '2019-05-08 14:43:50', 'sesame');
INSERT INTO `sys_log` VALUES (7463736, 1, 'admin', 'normal', NULL, '/manager/sys/menu/list', '{\"sort\":\"order_num\"}', '127.0.0.1', '2019-05-08 14:43:50', 'sesame');
INSERT INTO `sys_log` VALUES (7463737, 1, 'admin', 'normal', NULL, '/manager/sys/menu/remove', '{\"id\":\"244\"}', '127.0.0.1', '2019-05-08 14:43:54', 'sesame');
INSERT INTO `sys_log` VALUES (7463738, 1, 'admin', 'normal', NULL, '/manager/sys/menu/list', '{\"sort\":\"order_num\"}', '127.0.0.1', '2019-05-08 14:43:54', 'sesame');
INSERT INTO `sys_log` VALUES (7463739, 1, 'admin', 'normal', NULL, '/manager/sys/menu/remove', '{\"id\":\"242\"}', '127.0.0.1', '2019-05-08 14:43:57', 'sesame');
INSERT INTO `sys_log` VALUES (7463740, 1, 'admin', 'normal', NULL, '/manager/sys/menu/list', '{\"sort\":\"order_num\"}', '127.0.0.1', '2019-05-08 14:43:57', 'sesame');
INSERT INTO `sys_log` VALUES (7463741, 1, 'admin', 'normal', NULL, '/manager/sys/menu/remove', '{\"id\":\"243\"}', '127.0.0.1', '2019-05-08 14:44:01', 'sesame');
INSERT INTO `sys_log` VALUES (7463742, 1, 'admin', 'normal', NULL, '/manager/sys/menu/list', '{\"sort\":\"order_num\"}', '127.0.0.1', '2019-05-08 14:44:01', 'sesame');
INSERT INTO `sys_log` VALUES (7463743, 1, 'admin', 'normal', NULL, '/manager/sys/menu/remove', '{\"id\":\"239\"}', '127.0.0.1', '2019-05-08 14:44:04', 'sesame');
INSERT INTO `sys_log` VALUES (7463744, 1, 'admin', 'normal', NULL, '/manager/sys/menu/list', '{\"sort\":\"order_num\"}', '127.0.0.1', '2019-05-08 14:44:04', 'sesame');
INSERT INTO `sys_log` VALUES (7463745, 1, 'admin', 'normal', NULL, '/manager/sys/menu/remove', '{\"id\":\"238\"}', '127.0.0.1', '2019-05-08 14:44:07', 'sesame');
INSERT INTO `sys_log` VALUES (7463746, 1, 'admin', 'normal', NULL, '/manager/sys/menu/list', '{\"sort\":\"order_num\"}', '127.0.0.1', '2019-05-08 14:44:07', 'sesame');
INSERT INTO `sys_log` VALUES (7463747, 1, 'admin', 'normal', NULL, '/manager/sys/menu/remove', '{\"id\":\"251\"}', '127.0.0.1', '2019-05-08 14:44:10', 'sesame');
INSERT INTO `sys_log` VALUES (7463748, 1, 'admin', 'normal', NULL, '/manager/sys/menu/list', '{\"sort\":\"order_num\"}', '127.0.0.1', '2019-05-08 14:44:10', 'sesame');
INSERT INTO `sys_log` VALUES (7463749, 1, 'admin', 'normal', NULL, '/manager/sys/menu/remove', '{\"id\":\"245\"}', '127.0.0.1', '2019-05-08 14:44:20', 'sesame');
INSERT INTO `sys_log` VALUES (7463750, 1, 'admin', 'normal', NULL, '/manager/sys/menu/list', '{\"sort\":\"order_num\"}', '127.0.0.1', '2019-05-08 14:44:20', 'sesame');
INSERT INTO `sys_log` VALUES (7463751, 1, 'admin', 'normal', NULL, '/manager/sys/menu/remove', '{\"id\":\"247\"}', '127.0.0.1', '2019-05-08 14:44:24', 'sesame');
INSERT INTO `sys_log` VALUES (7463752, 1, 'admin', 'normal', NULL, '/manager/sys/menu/list', '{\"sort\":\"order_num\"}', '127.0.0.1', '2019-05-08 14:44:24', 'sesame');
INSERT INTO `sys_log` VALUES (7463753, 1, 'admin', 'normal', NULL, '/manager/sys/menu/remove', '{\"id\":\"237\"}', '127.0.0.1', '2019-05-08 14:44:29', 'sesame');
INSERT INTO `sys_log` VALUES (7463754, 1, 'admin', 'normal', NULL, '/manager/sys/menu/list', '{\"sort\":\"order_num\"}', '127.0.0.1', '2019-05-08 14:44:29', 'sesame');
INSERT INTO `sys_log` VALUES (7463755, 1, 'admin', 'normal', NULL, '/manager/sys/menu/remove', '{\"id\":\"179\"}', '127.0.0.1', '2019-05-08 14:44:34', 'sesame');
INSERT INTO `sys_log` VALUES (7463756, 1, 'admin', 'normal', NULL, '/manager/sys/menu/list', '{\"sort\":\"order_num\"}', '127.0.0.1', '2019-05-08 14:44:34', 'sesame');
INSERT INTO `sys_log` VALUES (7463757, 1, 'admin', 'normal', NULL, '/manager/sys/menu/remove', '{\"id\":\"193\"}', '127.0.0.1', '2019-05-08 14:44:43', 'sesame');
INSERT INTO `sys_log` VALUES (7463758, 1, 'admin', 'normal', NULL, '/manager/sys/menu/list', '{\"sort\":\"order_num\"}', '127.0.0.1', '2019-05-08 14:44:43', 'sesame');
INSERT INTO `sys_log` VALUES (7463759, 1, 'admin', 'normal', NULL, '/manager/sys/menu/remove', '{\"id\":\"176\"}', '127.0.0.1', '2019-05-08 14:44:46', 'sesame');
INSERT INTO `sys_log` VALUES (7463760, 1, 'admin', 'normal', NULL, '/manager/sys/menu/list', '{\"sort\":\"order_num\"}', '127.0.0.1', '2019-05-08 14:44:46', 'sesame');
INSERT INTO `sys_log` VALUES (7463761, 1, 'admin', 'normal', NULL, '/manager/sys/menu/remove', '{\"id\":\"259\"}', '127.0.0.1', '2019-05-08 14:44:51', 'sesame');
INSERT INTO `sys_log` VALUES (7463762, 1, 'admin', 'normal', NULL, '/manager/sys/menu/list', '{\"sort\":\"order_num\"}', '127.0.0.1', '2019-05-08 14:44:51', 'sesame');
INSERT INTO `sys_log` VALUES (7463763, 1, 'admin', 'normal', NULL, '/manager/sys/menu/remove', '{\"id\":\"262\"}', '127.0.0.1', '2019-05-08 14:44:55', 'sesame');
INSERT INTO `sys_log` VALUES (7463764, 1, 'admin', 'normal', NULL, '/manager/sys/menu/list', '{\"sort\":\"order_num\"}', '127.0.0.1', '2019-05-08 14:44:55', 'sesame');
INSERT INTO `sys_log` VALUES (7463765, 1, 'admin', 'normal', NULL, '/manager/sys/menu/remove', '{\"id\":\"269\"}', '127.0.0.1', '2019-05-08 14:44:58', 'sesame');
INSERT INTO `sys_log` VALUES (7463766, 1, 'admin', 'normal', NULL, '/manager/sys/menu/list', '{\"sort\":\"order_num\"}', '127.0.0.1', '2019-05-08 14:44:58', 'sesame');
INSERT INTO `sys_log` VALUES (7463767, 1, 'admin', 'normal', NULL, '/manager/sys/menu/remove', '{\"id\":\"256\"}', '127.0.0.1', '2019-05-08 14:45:02', 'sesame');
INSERT INTO `sys_log` VALUES (7463768, 1, 'admin', 'normal', NULL, '/manager/sys/menu/list', '{\"sort\":\"order_num\"}', '127.0.0.1', '2019-05-08 14:45:02', 'sesame');
INSERT INTO `sys_log` VALUES (7463769, 1, 'admin', 'normal', NULL, '/manager/sys/menu/remove', '{\"id\":\"255\"}', '127.0.0.1', '2019-05-08 14:45:04', 'sesame');
INSERT INTO `sys_log` VALUES (7463770, 1, 'admin', 'normal', NULL, '/manager/sys/menu/list', '{\"sort\":\"order_num\"}', '127.0.0.1', '2019-05-08 14:45:04', 'sesame');
INSERT INTO `sys_log` VALUES (7463771, 1, 'admin', 'normal', NULL, '/manager/sys/menu/remove', '{\"id\":\"226\"}', '127.0.0.1', '2019-05-08 14:45:09', 'sesame');
INSERT INTO `sys_log` VALUES (7463772, 1, 'admin', 'normal', NULL, '/manager/sys/menu/list', '{\"sort\":\"order_num\"}', '127.0.0.1', '2019-05-08 14:45:09', 'sesame');
INSERT INTO `sys_log` VALUES (7463773, 1, 'admin', 'normal', NULL, '/manager/sys/menu/remove', '{\"id\":\"219\"}', '127.0.0.1', '2019-05-08 14:45:12', 'sesame');
INSERT INTO `sys_log` VALUES (7463774, 1, 'admin', 'normal', NULL, '/manager/sys/menu/list', '{\"sort\":\"order_num\"}', '127.0.0.1', '2019-05-08 14:45:12', 'sesame');
INSERT INTO `sys_log` VALUES (7463775, 1, 'admin', 'normal', NULL, '/manager/sys/menu/remove', '{\"id\":\"250\"}', '127.0.0.1', '2019-05-08 14:45:16', 'sesame');
INSERT INTO `sys_log` VALUES (7463776, 1, 'admin', 'normal', NULL, '/manager/sys/menu/list', '{\"sort\":\"order_num\"}', '127.0.0.1', '2019-05-08 14:45:16', 'sesame');
INSERT INTO `sys_log` VALUES (7463777, 1, 'admin', 'normal', NULL, '/manager/sys/menu/remove', '{\"id\":\"249\"}', '127.0.0.1', '2019-05-08 14:45:18', 'sesame');
INSERT INTO `sys_log` VALUES (7463778, 1, 'admin', 'normal', NULL, '/manager/sys/menu/list', '{\"sort\":\"order_num\"}', '127.0.0.1', '2019-05-08 14:45:18', 'sesame');
INSERT INTO `sys_log` VALUES (7463779, 1, 'admin', 'normal', NULL, '/manager/sys/menu/remove', '{\"id\":\"186\"}', '127.0.0.1', '2019-05-08 14:45:33', 'sesame');
INSERT INTO `sys_log` VALUES (7463780, 1, 'admin', 'normal', NULL, '/manager/sys/menu/list', '{\"sort\":\"order_num\"}', '127.0.0.1', '2019-05-08 14:45:33', 'sesame');
INSERT INTO `sys_log` VALUES (7463781, 1, 'admin', 'normal', NULL, '/manager/sys/menu/remove', '{\"id\":\"246\"}', '127.0.0.1', '2019-05-08 14:45:35', 'sesame');
INSERT INTO `sys_log` VALUES (7463782, 1, 'admin', 'normal', NULL, '/manager/sys/menu/list', '{\"sort\":\"order_num\"}', '127.0.0.1', '2019-05-08 14:45:35', 'sesame');
INSERT INTO `sys_log` VALUES (7463783, 1, 'admin', 'normal', NULL, '/manager/sys/menu/remove', '{\"id\":\"228\"}', '127.0.0.1', '2019-05-08 14:45:38', 'sesame');
INSERT INTO `sys_log` VALUES (7463784, 1, 'admin', 'normal', NULL, '/manager/sys/menu/list', '{\"sort\":\"order_num\"}', '127.0.0.1', '2019-05-08 14:45:38', 'sesame');
INSERT INTO `sys_log` VALUES (7463785, 1, 'admin', 'normal', NULL, '/manager/sys/menu/remove', '{\"id\":\"198\"}', '127.0.0.1', '2019-05-08 14:45:41', 'sesame');
INSERT INTO `sys_log` VALUES (7463786, 1, 'admin', 'normal', NULL, '/manager/sys/menu/list', '{\"sort\":\"order_num\"}', '127.0.0.1', '2019-05-08 14:45:41', 'sesame');
INSERT INTO `sys_log` VALUES (7463787, 1, 'admin', 'normal', NULL, '/manager/sys/menu/remove', '{\"id\":\"184\"}', '127.0.0.1', '2019-05-08 14:45:44', 'sesame');
INSERT INTO `sys_log` VALUES (7463788, 1, 'admin', 'normal', NULL, '/manager/sys/menu/list', '{\"sort\":\"order_num\"}', '127.0.0.1', '2019-05-08 14:45:44', 'sesame');
INSERT INTO `sys_log` VALUES (7463789, 1, 'admin', 'normal', NULL, '/manager/sys/menu/remove', '{\"id\":\"248\"}', '127.0.0.1', '2019-05-08 14:45:46', 'sesame');
INSERT INTO `sys_log` VALUES (7463790, 1, 'admin', 'normal', NULL, '/manager/sys/menu/list', '{\"sort\":\"order_num\"}', '127.0.0.1', '2019-05-08 14:45:46', 'sesame');
INSERT INTO `sys_log` VALUES (7463791, 1, 'admin', 'normal', NULL, '/manager/sys/menu/remove', '{\"id\":\"227\"}', '127.0.0.1', '2019-05-08 14:45:49', 'sesame');
INSERT INTO `sys_log` VALUES (7463792, 1, 'admin', 'normal', NULL, '/manager/sys/menu/list', '{\"sort\":\"order_num\"}', '127.0.0.1', '2019-05-08 14:45:49', 'sesame');
INSERT INTO `sys_log` VALUES (7463793, 1, 'admin', 'normal', NULL, '/manager/sys/menu/remove', '{\"id\":\"197\"}', '127.0.0.1', '2019-05-08 14:45:51', 'sesame');
INSERT INTO `sys_log` VALUES (7463794, 1, 'admin', 'normal', NULL, '/manager/sys/menu/list', '{\"sort\":\"order_num\"}', '127.0.0.1', '2019-05-08 14:45:51', 'sesame');
INSERT INTO `sys_log` VALUES (7463795, 1, 'admin', 'normal', NULL, '/manager/sys/menu/remove', '{\"id\":\"182\"}', '127.0.0.1', '2019-05-08 14:45:53', 'sesame');
INSERT INTO `sys_log` VALUES (7463796, 1, 'admin', 'normal', NULL, '/manager/sys/menu/list', '{\"sort\":\"order_num\"}', '127.0.0.1', '2019-05-08 14:45:53', 'sesame');
INSERT INTO `sys_log` VALUES (7463797, 1, 'admin', 'normal', NULL, '/manager/sys/menu/remove', '{\"id\":\"229\"}', '127.0.0.1', '2019-05-08 14:45:56', 'sesame');
INSERT INTO `sys_log` VALUES (7463798, 1, 'admin', 'normal', NULL, '/manager/sys/menu/list', '{\"sort\":\"order_num\"}', '127.0.0.1', '2019-05-08 14:45:56', 'sesame');
INSERT INTO `sys_log` VALUES (7463799, 1, 'admin', 'normal', NULL, '/manager/sys/menu/remove', '{\"id\":\"271\"}', '127.0.0.1', '2019-05-08 14:45:59', 'sesame');
INSERT INTO `sys_log` VALUES (7463800, 1, 'admin', 'normal', NULL, '/manager/sys/menu/list', '{\"sort\":\"order_num\"}', '127.0.0.1', '2019-05-08 14:45:59', 'sesame');
INSERT INTO `sys_log` VALUES (7463801, 1, 'admin', 'normal', NULL, '/manager/sys/menu/remove', '{\"id\":\"270\"}', '127.0.0.1', '2019-05-08 14:46:02', 'sesame');
INSERT INTO `sys_log` VALUES (7463802, 1, 'admin', 'normal', NULL, '/manager/sys/menu/list', '{\"sort\":\"order_num\"}', '127.0.0.1', '2019-05-08 14:46:02', 'sesame');
INSERT INTO `sys_log` VALUES (7463803, 1, 'admin', 'normal', NULL, '/manager/sys/menu/remove', '{\"id\":\"264\"}', '127.0.0.1', '2019-05-08 14:46:04', 'sesame');
INSERT INTO `sys_log` VALUES (7463804, 1, 'admin', 'normal', NULL, '/manager/sys/menu/list', '{\"sort\":\"order_num\"}', '127.0.0.1', '2019-05-08 14:46:04', 'sesame');
INSERT INTO `sys_log` VALUES (7463805, 1, 'admin', 'normal', NULL, '/manager/sys/menu/remove', '{\"id\":\"263\"}', '127.0.0.1', '2019-05-08 14:46:06', 'sesame');
INSERT INTO `sys_log` VALUES (7463806, 1, 'admin', 'normal', NULL, '/manager/sys/menu/list', '{\"sort\":\"order_num\"}', '127.0.0.1', '2019-05-08 14:46:07', 'sesame');
INSERT INTO `sys_log` VALUES (7463807, 1, 'admin', 'normal', NULL, '/manager/sys/menu/remove', '{\"id\":\"261\"}', '127.0.0.1', '2019-05-08 14:46:09', 'sesame');
INSERT INTO `sys_log` VALUES (7463808, 1, 'admin', 'normal', NULL, '/manager/sys/menu/list', '{\"sort\":\"order_num\"}', '127.0.0.1', '2019-05-08 14:46:09', 'sesame');
INSERT INTO `sys_log` VALUES (7463809, 1, 'admin', 'normal', NULL, '/manager/sys/menu/remove', '{\"id\":\"260\"}', '127.0.0.1', '2019-05-08 14:46:11', 'sesame');
INSERT INTO `sys_log` VALUES (7463810, 1, 'admin', 'normal', NULL, '/manager/sys/menu/list', '{\"sort\":\"order_num\"}', '127.0.0.1', '2019-05-08 14:46:11', 'sesame');
INSERT INTO `sys_log` VALUES (7463811, 1, 'admin', 'normal', NULL, '/manager/sys/menu/remove', '{\"id\":\"258\"}', '127.0.0.1', '2019-05-08 14:46:13', 'sesame');
INSERT INTO `sys_log` VALUES (7463812, 1, 'admin', 'normal', NULL, '/manager/sys/menu/list', '{\"sort\":\"order_num\"}', '127.0.0.1', '2019-05-08 14:46:13', 'sesame');
INSERT INTO `sys_log` VALUES (7463813, 1, 'admin', 'normal', NULL, '/manager/sys/menu/remove', '{\"id\":\"257\"}', '127.0.0.1', '2019-05-08 14:46:16', 'sesame');
INSERT INTO `sys_log` VALUES (7463814, 1, 'admin', 'normal', NULL, '/manager/sys/menu/list', '{\"sort\":\"order_num\"}', '127.0.0.1', '2019-05-08 14:46:16', 'sesame');
INSERT INTO `sys_log` VALUES (7463815, 1, 'admin', 'normal', NULL, '/manager/sys/menu/remove', '{\"id\":\"265\"}', '127.0.0.1', '2019-05-08 14:46:24', 'sesame');
INSERT INTO `sys_log` VALUES (7463816, 1, 'admin', 'normal', NULL, '/manager/sys/menu/list', '{\"sort\":\"order_num\"}', '127.0.0.1', '2019-05-08 14:46:24', 'sesame');
INSERT INTO `sys_log` VALUES (7463817, 1, 'admin', 'normal', NULL, '/manager/sys/menu/remove', '{\"id\":\"268\"}', '127.0.0.1', '2019-05-08 14:46:30', 'sesame');
INSERT INTO `sys_log` VALUES (7463818, 1, 'admin', 'normal', NULL, '/manager/sys/menu/list', '{\"sort\":\"order_num\"}', '127.0.0.1', '2019-05-08 14:46:30', 'sesame');
INSERT INTO `sys_log` VALUES (7463819, 1, 'admin', 'normal', NULL, '/manager/sys/menu/remove', '{\"id\":\"267\"}', '127.0.0.1', '2019-05-08 14:46:33', 'sesame');
INSERT INTO `sys_log` VALUES (7463820, 1, 'admin', 'normal', NULL, '/manager/sys/menu/list', '{\"sort\":\"order_num\"}', '127.0.0.1', '2019-05-08 14:46:33', 'sesame');
INSERT INTO `sys_log` VALUES (7463821, 1, 'admin', 'normal', NULL, '/manager/sys/menu/remove', '{\"id\":\"266\"}', '127.0.0.1', '2019-05-08 14:46:34', 'sesame');
INSERT INTO `sys_log` VALUES (7463822, 1, 'admin', 'normal', NULL, '/manager/sys/menu/list', '{\"sort\":\"order_num\"}', '127.0.0.1', '2019-05-08 14:46:34', 'sesame');
INSERT INTO `sys_log` VALUES (7463823, -1, '获取用户信息为空', 'normal', NULL, '/', '{}', '127.0.0.1', '2019-05-08 14:46:42', 'sesame');
INSERT INTO `sys_log` VALUES (7463824, -1, '获取用户信息为空', 'normal', NULL, '/manager/login', '{}', '127.0.0.1', '2019-05-08 14:46:42', 'sesame');
INSERT INTO `sys_log` VALUES (7463825, -1, '获取用户信息为空', 'normal', NULL, '/manager/login', '{}', '127.0.0.1', '2019-05-08 14:46:46', 'sesame');
INSERT INTO `sys_log` VALUES (7463826, 1, 'admin', 'normal', NULL, '/manager/login', '{\"password\":\"123456\",\"mobileCheckCode\":\"\",\"username\":\"admin\",\"checkCode\":\"\"}', '127.0.0.1', '2019-05-08 14:46:50', 'sesame');
INSERT INTO `sys_log` VALUES (7463827, 1, 'admin', 'normal', NULL, '/manager/index', '{}', '127.0.0.1', '2019-05-08 14:46:50', 'sesame');
INSERT INTO `sys_log` VALUES (7463828, 1, 'admin', 'normal', NULL, '/manager/main', '{}', '127.0.0.1', '2019-05-08 14:46:50', 'sesame');
INSERT INTO `sys_log` VALUES (7463829, 1, 'admin', 'normal', NULL, '/manager/oa/notify/message', '{}', '127.0.0.1', '2019-05-08 14:46:50', 'sesame');
INSERT INTO `sys_log` VALUES (7463830, 1, 'admin', 'normal', NULL, '/manager/main', '{}', '127.0.0.1', '2019-05-08 14:46:50', 'sesame');
INSERT INTO `sys_log` VALUES (7463831, 1, 'admin', 'normal', NULL, '/api/report/getUserRegisteredNum', '{\"endDate\":\"2019-5-8\",\"startDate\":\"2019-4-8\"}', '127.0.0.1', '2019-05-08 14:46:50', 'sesame');
INSERT INTO `sys_log` VALUES (7463832, 1, 'admin', 'normal', NULL, '/api/report/getBaseReport', '{}', '127.0.0.1', '2019-05-08 14:46:50', 'sesame');
INSERT INTO `sys_log` VALUES (7463833, 1, 'admin', 'normal', NULL, '/api/report/getProfitCoinRelease', '{\"endDate\":\"2021-5-8\",\"startDate\":\"2019-5-8\"}', '127.0.0.1', '2019-05-08 14:46:50', 'sesame');
INSERT INTO `sys_log` VALUES (7463834, 1, 'admin', 'normal', NULL, '/', '{}', '127.0.0.1', '2019-05-08 14:46:50', 'sesame');
INSERT INTO `sys_log` VALUES (7463835, 1, 'admin', 'normal', NULL, '/manager/login', '{}', '127.0.0.1', '2019-05-08 14:46:50', 'sesame');
INSERT INTO `sys_log` VALUES (7463836, -1, '获取用户信息为空', 'normal', NULL, '/manager/login;JSESSIONID=f290084b-a458-4d66-90d9-eb1ee86717f0', '{}', '127.0.0.1', '2019-05-08 14:51:38', 'sesame');
INSERT INTO `sys_log` VALUES (7463837, 1, 'admin', 'normal', NULL, '/manager/login', '{\"password\":\"123456\",\"mobileCheckCode\":\"\",\"username\":\"admin\",\"checkCode\":\"\"}', '127.0.0.1', '2019-05-08 14:51:41', 'sesame');
INSERT INTO `sys_log` VALUES (7463838, 1, 'admin', 'normal', NULL, '/manager/index', '{}', '127.0.0.1', '2019-05-08 14:51:41', 'sesame');
INSERT INTO `sys_log` VALUES (7463839, 1, 'admin', 'normal', NULL, '/manager/main', '{}', '127.0.0.1', '2019-05-08 14:51:41', 'sesame');
INSERT INTO `sys_log` VALUES (7463840, 1, 'admin', 'normal', NULL, '/manager/oa/notify/message', '{}', '127.0.0.1', '2019-05-08 14:51:42', 'sesame');
INSERT INTO `sys_log` VALUES (7463841, 1, 'admin', 'normal', NULL, '/manager/main', '{}', '127.0.0.1', '2019-05-08 14:51:42', 'sesame');
INSERT INTO `sys_log` VALUES (7463842, 1, 'admin', 'normal', NULL, '/api/report/getProfitCoinRelease', '{\"endDate\":\"2021-5-8\",\"startDate\":\"2019-5-8\"}', '127.0.0.1', '2019-05-08 14:51:42', 'sesame');
INSERT INTO `sys_log` VALUES (7463843, 1, 'admin', 'normal', NULL, '/api/report/getUserRegisteredNum', '{\"endDate\":\"2019-5-8\",\"startDate\":\"2019-4-8\"}', '127.0.0.1', '2019-05-08 14:51:42', 'sesame');
INSERT INTO `sys_log` VALUES (7463844, 1, 'admin', 'normal', NULL, '/api/report/getBaseReport', '{}', '127.0.0.1', '2019-05-08 14:51:42', 'sesame');
INSERT INTO `sys_log` VALUES (7463845, 1, 'admin', 'normal', NULL, '/', '{}', '127.0.0.1', '2019-05-08 14:51:42', 'sesame');
INSERT INTO `sys_log` VALUES (7463846, 1, 'admin', 'normal', NULL, '/manager/login', '{}', '127.0.0.1', '2019-05-08 14:51:42', 'sesame');
INSERT INTO `sys_log` VALUES (7463847, -1, '获取用户信息为空', 'normal', NULL, '/manager/login;JSESSIONID=339dfc7d-88d7-478e-b7fb-a0c6970044f9', '{}', '127.0.0.1', '2019-05-08 15:08:44', 'sesame');
INSERT INTO `sys_log` VALUES (7463848, 1, 'admin', 'normal', NULL, '/manager/login', '{\"password\":\"123456\",\"mobileCheckCode\":\"\",\"username\":\"admin\",\"checkCode\":\"\"}', '127.0.0.1', '2019-05-08 15:08:48', 'sesame');
INSERT INTO `sys_log` VALUES (7463849, 1, 'admin', 'normal', NULL, '/manager/index', '{}', '127.0.0.1', '2019-05-08 15:08:48', 'sesame');
INSERT INTO `sys_log` VALUES (7463850, 1, 'admin', 'normal', NULL, '/manager/main', '{}', '127.0.0.1', '2019-05-08 15:08:48', 'sesame');
INSERT INTO `sys_log` VALUES (7463851, 1, 'admin', 'normal', NULL, '/manager/oa/notify/message', '{}', '127.0.0.1', '2019-05-08 15:08:48', 'sesame');
INSERT INTO `sys_log` VALUES (7463852, 1, 'admin', 'normal', NULL, '/manager/main', '{}', '127.0.0.1', '2019-05-08 15:08:49', 'sesame');
INSERT INTO `sys_log` VALUES (7463853, 1, 'admin', 'normal', NULL, '/api/report/getUserRegisteredNum', '{\"endDate\":\"2019-5-8\",\"startDate\":\"2019-4-8\"}', '127.0.0.1', '2019-05-08 15:08:49', 'sesame');
INSERT INTO `sys_log` VALUES (7463854, 1, 'admin', 'normal', NULL, '/api/report/getBaseReport', '{}', '127.0.0.1', '2019-05-08 15:08:49', 'sesame');
INSERT INTO `sys_log` VALUES (7463855, 1, 'admin', 'normal', NULL, '/api/report/getProfitCoinRelease', '{\"endDate\":\"2021-5-8\",\"startDate\":\"2019-5-8\"}', '127.0.0.1', '2019-05-08 15:08:49', 'sesame');
INSERT INTO `sys_log` VALUES (7463856, 1, 'admin', 'normal', NULL, '/', '{}', '127.0.0.1', '2019-05-08 15:08:49', 'sesame');
INSERT INTO `sys_log` VALUES (7463857, 1, 'admin', 'normal', NULL, '/manager/login', '{}', '127.0.0.1', '2019-05-08 15:08:49', 'sesame');
INSERT INTO `sys_log` VALUES (7463858, 1, 'admin', 'normal', NULL, '/manager/common/generator', '{}', '127.0.0.1', '2019-05-08 15:08:54', 'sesame');
INSERT INTO `sys_log` VALUES (7463859, 1, 'admin', 'normal', NULL, '/manager/common/generator/list', '{}', '127.0.0.1', '2019-05-08 15:08:54', 'sesame');
INSERT INTO `sys_log` VALUES (7463860, -1, '获取用户信息为空', 'normal', NULL, '/manager/login;JSESSIONID=89e1ad1d-601f-4d03-a63e-af7dcc0972f9', '{}', '127.0.0.1', '2019-08-22 15:58:47', 'sesame');
INSERT INTO `sys_log` VALUES (7463861, 1, 'admin', 'normal', NULL, '/manager/login', '{\"password\":\"123456\",\"mobileCheckCode\":\"\",\"username\":\"admin\",\"checkCode\":\"\"}', '127.0.0.1', '2019-08-22 15:58:51', 'sesame');
INSERT INTO `sys_log` VALUES (7463862, 1, 'admin', 'normal', NULL, '/manager/index', '{}', '127.0.0.1', '2019-08-22 15:58:52', 'sesame');
INSERT INTO `sys_log` VALUES (7463863, 1, 'admin', 'normal', NULL, '/manager/main', '{}', '127.0.0.1', '2019-08-22 15:58:52', 'sesame');
INSERT INTO `sys_log` VALUES (7463864, 1, 'admin', 'normal', NULL, '/manager/oa/notify/message', '{}', '127.0.0.1', '2019-08-22 15:58:52', 'sesame');
INSERT INTO `sys_log` VALUES (7463865, 1, 'admin', 'normal', NULL, '/manager/main', '{}', '127.0.0.1', '2019-08-22 15:58:52', 'sesame');
INSERT INTO `sys_log` VALUES (7463866, 1, 'admin', 'normal', NULL, '/', '{}', '127.0.0.1', '2019-08-22 15:58:52', 'sesame');
INSERT INTO `sys_log` VALUES (7463867, 1, 'admin', 'normal', NULL, '/manager/common/generator', '{}', '127.0.0.1', '2019-08-22 16:01:04', 'sesame');
INSERT INTO `sys_log` VALUES (7463868, 1, 'admin', 'normal', NULL, '/manager/common/generator/list', '{}', '127.0.0.1', '2019-08-22 16:01:04', 'sesame');
INSERT INTO `sys_log` VALUES (7463869, 1, 'admin', 'normal', NULL, '/manager/common/generator/code/t_sw_coin_type', '{}', '127.0.0.1', '2019-08-22 16:01:33', 'sesame');
INSERT INTO `sys_log` VALUES (7463870, 1, 'admin', 'normal', NULL, '/manager/common/generator/code/t_sw_current', '{}', '127.0.0.1', '2019-08-22 16:07:20', 'sesame');
INSERT INTO `sys_log` VALUES (7463871, 1, 'admin', 'normal', NULL, '/manager/common/generator/code/t_sw_current_user', '{}', '127.0.0.1', '2019-08-22 16:12:25', 'sesame');
INSERT INTO `sys_log` VALUES (7463872, 1, 'admin', 'normal', NULL, '/manager/common/generator/code/t_sw_evangelist', '{}', '127.0.0.1', '2019-08-22 16:14:25', 'sesame');
INSERT INTO `sys_log` VALUES (7463873, 1, 'admin', 'normal', NULL, '/manager/common/generator/code/t_sw_evangelist_user', '{}', '127.0.0.1', '2019-08-22 16:18:10', 'sesame');
INSERT INTO `sys_log` VALUES (7463874, 1, 'admin', 'normal', NULL, '/manager/common/generator/code/t_sw_partner', '{}', '127.0.0.1', '2019-08-22 16:20:07', 'sesame');
INSERT INTO `sys_log` VALUES (7463875, 1, 'admin', 'normal', NULL, '/manager/common/generator/code/t_sw_partner_user', '{}', '127.0.0.1', '2019-08-22 16:21:37', 'sesame');
INSERT INTO `sys_log` VALUES (7463876, 1, 'admin', 'normal', NULL, '/manager/common/generator/code/t_sw_period', '{}', '127.0.0.1', '2019-08-22 16:23:16', 'sesame');
INSERT INTO `sys_log` VALUES (7463877, 1, 'admin', 'normal', NULL, '/manager/common/generator/code/t_sw_period_user', '{}', '127.0.0.1', '2019-08-22 16:25:02', 'sesame');
INSERT INTO `sys_log` VALUES (7463878, 1, 'admin', 'normal', NULL, '/manager/common/generator/code/t_sw_principal', '{}', '127.0.0.1', '2019-08-22 16:27:04', 'sesame');
INSERT INTO `sys_log` VALUES (7463879, 1, 'admin', 'normal', NULL, '/manager/common/generator/code/t_sw_principal_user', '{}', '127.0.0.1', '2019-08-22 16:28:52', 'sesame');
INSERT INTO `sys_log` VALUES (7463880, 1, 'admin', 'normal', NULL, '/manager/common/generator/code/t_sw_user_basic', '{}', '127.0.0.1', '2019-08-22 16:39:29', 'sesame');
INSERT INTO `sys_log` VALUES (7463881, 1, 'admin', 'normal', NULL, '/manager/common/generator/code/t_sw_wallets', '{}', '127.0.0.1', '2019-08-22 16:41:45', 'sesame');
INSERT INTO `sys_log` VALUES (7463882, -1, '获取用户信息为空', 'normal', NULL, '/manager/login;JSESSIONID=c0d55c01-b364-479c-a4df-9050fb2587ce', '{}', '127.0.0.1', '2019-08-22 20:13:53', 'sesame');
INSERT INTO `sys_log` VALUES (7463883, 1, 'admin', 'normal', NULL, '/manager/login', '{\"password\":\"123456\",\"mobileCheckCode\":\"\",\"username\":\"admin\",\"checkCode\":\"\"}', '127.0.0.1', '2019-08-22 20:13:57', 'sesame');
INSERT INTO `sys_log` VALUES (7463884, 1, 'admin', 'normal', NULL, '/manager/index', '{}', '127.0.0.1', '2019-08-22 20:13:57', 'sesame');
INSERT INTO `sys_log` VALUES (7463885, 1, 'admin', 'normal', NULL, '/manager/main', '{}', '127.0.0.1', '2019-08-22 20:13:57', 'sesame');
INSERT INTO `sys_log` VALUES (7463886, 1, 'admin', 'normal', NULL, '/manager/oa/notify/message', '{}', '127.0.0.1', '2019-08-22 20:13:57', 'sesame');
INSERT INTO `sys_log` VALUES (7463887, 1, 'admin', 'normal', NULL, '/manager/main', '{}', '127.0.0.1', '2019-08-22 20:13:57', 'sesame');
INSERT INTO `sys_log` VALUES (7463888, 1, 'admin', 'normal', NULL, '/', '{}', '127.0.0.1', '2019-08-22 20:13:58', 'sesame');
INSERT INTO `sys_log` VALUES (7463889, 1, 'admin', 'normal', NULL, '/manager/common/generator', '{}', '127.0.0.1', '2019-08-22 20:14:00', 'sesame');
INSERT INTO `sys_log` VALUES (7463890, 1, 'admin', 'normal', NULL, '/manager/common/generator/list', '{}', '127.0.0.1', '2019-08-22 20:14:00', 'sesame');
INSERT INTO `sys_log` VALUES (7463891, 1, 'admin', 'normal', NULL, '/manager/common/generator/list', '{}', '127.0.0.1', '2019-08-22 20:14:48', 'sesame');
INSERT INTO `sys_log` VALUES (7463892, 1, 'admin', 'normal', NULL, '/manager/common/generator/code/t_sw_chargelog', '{}', '127.0.0.1', '2019-08-22 20:15:08', 'sesame');
INSERT INTO `sys_log` VALUES (7463893, 1, 'admin', 'normal', NULL, '/manager/common/generator/code/t_sw_chargelog', '{}', '127.0.0.1', '2019-08-22 20:19:00', 'sesame');
INSERT INTO `sys_log` VALUES (7463894, 1, 'admin', 'normal', NULL, '/manager/common/generator/code/t_sw_chargelog', '{}', '127.0.0.1', '2019-08-22 20:21:00', 'sesame');
INSERT INTO `sys_log` VALUES (7463895, 1, 'admin', 'normal', NULL, '/manager/common/generator/code/t_sw_release_record', '{}', '127.0.0.1', '2019-08-22 20:23:29', 'sesame');
INSERT INTO `sys_log` VALUES (7463896, 1, 'admin', 'normal', NULL, '/manager/common/generator/code/t_sw_transfer_record', '{}', '127.0.0.1', '2019-08-22 20:28:19', 'sesame');
INSERT INTO `sys_log` VALUES (7463897, 1, 'admin', 'normal', NULL, '/manager/common/generator/code/t_sw_withdraw_address', '{}', '127.0.0.1', '2019-08-22 20:33:37', 'sesame');
INSERT INTO `sys_log` VALUES (7463898, 1, 'admin', 'normal', NULL, '/manager/common/generator/code/t_sw_withlog', '{}', '127.0.0.1', '2019-08-22 20:35:23', 'sesame');
INSERT INTO `sys_log` VALUES (7463899, 1, 'admin', 'normal', NULL, '/manager/common/generator/code/t_sw_withlog', '{}', '127.0.0.1', '2019-08-22 20:37:55', 'sesame');
INSERT INTO `sys_log` VALUES (7463900, 1, 'admin', 'normal', NULL, '/manager/common/generator/code/t_sw_withlog', '{}', '127.0.0.1', '2019-08-22 20:39:31', 'sesame');
INSERT INTO `sys_log` VALUES (7463901, -1, '获取用户信息为空', 'normal', NULL, '/manager/login;JSESSIONID=f8678a59-4a8d-4a5f-9de5-8609914b2201', '{}', '127.0.0.1', '2019-08-23 10:08:40', 'sesame');
INSERT INTO `sys_log` VALUES (7463902, 1, 'admin', 'normal', NULL, '/manager/login', '{\"password\":\"123456\",\"mobileCheckCode\":\"\",\"username\":\"admin\",\"checkCode\":\"\"}', '127.0.0.1', '2019-08-23 10:08:43', 'sesame');
INSERT INTO `sys_log` VALUES (7463903, 1, 'admin', 'normal', NULL, '/manager/index', '{}', '127.0.0.1', '2019-08-23 10:08:43', 'sesame');
INSERT INTO `sys_log` VALUES (7463904, 1, 'admin', 'normal', NULL, '/manager/main', '{}', '127.0.0.1', '2019-08-23 10:08:43', 'sesame');
INSERT INTO `sys_log` VALUES (7463905, 1, 'admin', 'normal', NULL, '/manager/oa/notify/message', '{}', '127.0.0.1', '2019-08-23 10:08:44', 'sesame');
INSERT INTO `sys_log` VALUES (7463906, 1, 'admin', 'normal', NULL, '/manager/main', '{}', '127.0.0.1', '2019-08-23 10:08:44', 'sesame');
INSERT INTO `sys_log` VALUES (7463907, 1, 'admin', 'normal', NULL, '/', '{}', '127.0.0.1', '2019-08-23 10:08:44', 'sesame');
INSERT INTO `sys_log` VALUES (7463908, 1, 'admin', 'normal', NULL, '/manager/common/generator', '{}', '127.0.0.1', '2019-08-23 10:08:50', 'sesame');
INSERT INTO `sys_log` VALUES (7463909, 1, 'admin', 'normal', NULL, '/manager/common/generator/list', '{}', '127.0.0.1', '2019-08-23 10:08:50', 'sesame');
INSERT INTO `sys_log` VALUES (7463910, 1, 'admin', 'normal', NULL, '/manager/common/generator/code/t_sw_withlog', '{}', '127.0.0.1', '2019-08-23 10:10:44', 'sesame');
INSERT INTO `sys_log` VALUES (7463911, -1, '获取用户信息为空', 'normal', NULL, '/manager/login;JSESSIONID=db2aa0be-7b8f-4ada-9f13-f9b75992746c', '{}', '127.0.0.1', '2019-08-23 21:03:24', 'sesame');
INSERT INTO `sys_log` VALUES (7463912, 1, 'admin', 'normal', NULL, '/manager/login', '{\"password\":\"123456\",\"mobileCheckCode\":\"\",\"username\":\"admin\",\"checkCode\":\"\"}', '127.0.0.1', '2019-08-23 21:03:28', 'sesame');
INSERT INTO `sys_log` VALUES (7463913, 1, 'admin', 'normal', NULL, '/manager/index', '{}', '127.0.0.1', '2019-08-23 21:03:28', 'sesame');
INSERT INTO `sys_log` VALUES (7463914, 1, 'admin', 'normal', NULL, '/manager/main', '{}', '127.0.0.1', '2019-08-23 21:03:28', 'sesame');
INSERT INTO `sys_log` VALUES (7463915, 1, 'admin', 'normal', NULL, '/manager/oa/notify/message', '{}', '127.0.0.1', '2019-08-23 21:03:28', 'sesame');
INSERT INTO `sys_log` VALUES (7463916, 1, 'admin', 'normal', NULL, '/manager/main', '{}', '127.0.0.1', '2019-08-23 21:03:28', 'sesame');
INSERT INTO `sys_log` VALUES (7463917, 1, 'admin', 'normal', NULL, '/', '{}', '127.0.0.1', '2019-08-23 21:03:29', 'sesame');
INSERT INTO `sys_log` VALUES (7463918, 1, 'admin', 'normal', NULL, '/manager/sys/menu/', '{}', '127.0.0.1', '2019-08-23 21:03:39', 'sesame');
INSERT INTO `sys_log` VALUES (7463919, 1, 'admin', 'normal', NULL, '/manager/sys/menu/list', '{\"sort\":\"order_num\"}', '127.0.0.1', '2019-08-23 21:03:39', 'sesame');
INSERT INTO `sys_log` VALUES (7463920, 1, 'admin', 'normal', NULL, '/manager/sys/menu/add/0', '{}', '127.0.0.1', '2019-08-23 21:03:42', 'sesame');
INSERT INTO `sys_log` VALUES (7463921, 1, 'admin', 'normal', NULL, '/manager/sys/menu/save', '{\"name\":\"用户管理\",\"icon\":\"fa fa-user\",\"orderNum\":\"1\",\"perms\":\"\",\"type\":\"0\",\"parentId\":\"0\",\"url\":\"\"}', '127.0.0.1', '2019-08-23 21:04:31', 'sesame');
INSERT INTO `sys_log` VALUES (7463922, 1, 'admin', 'normal', NULL, '/manager/sys/menu/list', '{\"sort\":\"order_num\"}', '127.0.0.1', '2019-08-23 21:04:31', 'sesame');
INSERT INTO `sys_log` VALUES (7463923, 1, 'admin', 'normal', NULL, '/manager/sys/menu/add/272', '{}', '127.0.0.1', '2019-08-23 21:04:37', 'sesame');
INSERT INTO `sys_log` VALUES (7463924, 1, 'admin', 'normal', NULL, '/manager/sys/menu/save', '{\"name\":\"用户列表\",\"icon\":\"\",\"orderNum\":\"1\",\"perms\":\"get:swUserBasic:swUserBasic\",\"type\":\"1\",\"parentId\":\"272\",\"url\":\"/manager/get/swUserBasic\"}', '127.0.0.1', '2019-08-23 21:05:16', 'sesame');
INSERT INTO `sys_log` VALUES (7463925, 1, 'admin', 'normal', NULL, '/manager/sys/menu/list', '{\"sort\":\"order_num\"}', '127.0.0.1', '2019-08-23 21:05:16', 'sesame');
INSERT INTO `sys_log` VALUES (7463926, 1, 'admin', 'normal', NULL, '/manager/sys/menu/add/0', '{}', '127.0.0.1', '2019-08-23 21:05:32', 'sesame');
INSERT INTO `sys_log` VALUES (7463927, 1, 'admin', 'normal', NULL, '/manager/sys/menu/save', '{\"name\":\"资金管理\",\"icon\":\"fa fa-credit-card\",\"orderNum\":\"2\",\"perms\":\"\",\"type\":\"0\",\"parentId\":\"0\",\"url\":\"\"}', '127.0.0.1', '2019-08-23 21:06:33', 'sesame');
INSERT INTO `sys_log` VALUES (7463928, 1, 'admin', 'normal', NULL, '/manager/sys/menu/list', '{\"sort\":\"order_num\"}', '127.0.0.1', '2019-08-23 21:06:33', 'sesame');
INSERT INTO `sys_log` VALUES (7463929, 1, 'admin', 'normal', NULL, '/manager/sys/menu/add/274', '{}', '127.0.0.1', '2019-08-23 21:06:36', 'sesame');
INSERT INTO `sys_log` VALUES (7463930, 1, 'admin', 'normal', NULL, '/manager/sys/menu/save', '{\"name\":\"钱包管理\",\"icon\":\"\",\"orderNum\":\"1\",\"perms\":\"get:swWallets:swWallets\",\"type\":\"1\",\"parentId\":\"274\",\"url\":\"/manager/get/swWallets\"}', '127.0.0.1', '2019-08-23 21:06:54', 'sesame');
INSERT INTO `sys_log` VALUES (7463931, 1, 'admin', 'normal', NULL, '/manager/sys/menu/list', '{\"sort\":\"order_num\"}', '127.0.0.1', '2019-08-23 21:06:54', 'sesame');
INSERT INTO `sys_log` VALUES (7463932, -1, '获取用户信息为空', 'normal', NULL, '/manager/logout', '{}', '127.0.0.1', '2019-08-23 21:06:58', 'sesame');
INSERT INTO `sys_log` VALUES (7463933, -1, '获取用户信息为空', 'normal', NULL, '/manager/login;JSESSIONID=79cb8e9a-4e7c-41b7-bda6-0e3f1a517bc1', '{}', '127.0.0.1', '2019-08-23 21:06:58', 'sesame');
INSERT INTO `sys_log` VALUES (7463934, 1, 'admin', 'normal', NULL, '/manager/login', '{\"password\":\"123456\",\"mobileCheckCode\":\"\",\"username\":\"admin\",\"checkCode\":\"\"}', '127.0.0.1', '2019-08-23 21:07:01', 'sesame');
INSERT INTO `sys_log` VALUES (7463935, 1, 'admin', 'normal', NULL, '/manager/index', '{}', '127.0.0.1', '2019-08-23 21:07:01', 'sesame');
INSERT INTO `sys_log` VALUES (7463936, 1, 'admin', 'normal', NULL, '/manager/main', '{}', '127.0.0.1', '2019-08-23 21:07:01', 'sesame');
INSERT INTO `sys_log` VALUES (7463937, 1, 'admin', 'normal', NULL, '/manager/oa/notify/message', '{}', '127.0.0.1', '2019-08-23 21:07:01', 'sesame');
INSERT INTO `sys_log` VALUES (7463938, 1, 'admin', 'normal', NULL, '/manager/main', '{}', '127.0.0.1', '2019-08-23 21:07:01', 'sesame');
INSERT INTO `sys_log` VALUES (7463939, 1, 'admin', 'normal', NULL, '/', '{}', '127.0.0.1', '2019-08-23 21:07:01', 'sesame');
INSERT INTO `sys_log` VALUES (7463940, 1, 'admin', 'normal', NULL, '/manager/sys/role', '{}', '127.0.0.1', '2019-08-23 21:07:05', 'sesame');
INSERT INTO `sys_log` VALUES (7463941, 1, 'admin', 'normal', NULL, '/manager/sys/role/list', '{}', '127.0.0.1', '2019-08-23 21:07:06', 'sesame');
INSERT INTO `sys_log` VALUES (7463942, 1, 'admin', 'normal', NULL, '/manager/sys/role/edit/1', '{}', '127.0.0.1', '2019-08-23 21:07:06', 'sesame');
INSERT INTO `sys_log` VALUES (7463943, 1, 'admin', 'normal', NULL, '/manager/sys/menu/tree/1', '{}', '127.0.0.1', '2019-08-23 21:07:07', 'sesame');
INSERT INTO `sys_log` VALUES (7463944, 1, 'admin', 'normal', NULL, '/manager/sys/role/update', '{\"roleId\":\"1\",\"roleName\":\"开发管理员角色\",\"remark\":\"拥有最高权限\",\"menuIds\":\"205,92,57,30,29,28,206,118,48,209,207,203,76,75,74,62,56,55,15,26,25,24,14,13,12,61,22,21,20,83,81,80,79,71,204,109,27,91,77,202,73,7,6,2,3,78,1,274,275,272,273,-1\"}', '127.0.0.1', '2019-08-23 21:07:11', 'sesame');
INSERT INTO `sys_log` VALUES (7463945, 1, 'admin', 'normal', NULL, '/manager/sys/role/list', '{}', '127.0.0.1', '2019-08-23 21:07:11', 'sesame');
INSERT INTO `sys_log` VALUES (7463946, -1, '获取用户信息为空', 'normal', NULL, '/manager/logout', '{}', '127.0.0.1', '2019-08-23 21:07:12', 'sesame');
INSERT INTO `sys_log` VALUES (7463947, -1, '获取用户信息为空', 'normal', NULL, '/manager/login;JSESSIONID=de7eaf7e-b9ba-41d0-9e82-ce344c2d510e', '{}', '127.0.0.1', '2019-08-23 21:07:12', 'sesame');
INSERT INTO `sys_log` VALUES (7463948, 1, 'admin', 'normal', NULL, '/manager/login', '{\"password\":\"123456\",\"mobileCheckCode\":\"\",\"username\":\"admin\",\"checkCode\":\"\"}', '127.0.0.1', '2019-08-23 21:07:16', 'sesame');
INSERT INTO `sys_log` VALUES (7463949, 1, 'admin', 'normal', NULL, '/manager/index', '{}', '127.0.0.1', '2019-08-23 21:07:16', 'sesame');
INSERT INTO `sys_log` VALUES (7463950, 1, 'admin', 'normal', NULL, '/manager/main', '{}', '127.0.0.1', '2019-08-23 21:07:16', 'sesame');
INSERT INTO `sys_log` VALUES (7463951, 1, 'admin', 'normal', NULL, '/manager/oa/notify/message', '{}', '127.0.0.1', '2019-08-23 21:07:16', 'sesame');
INSERT INTO `sys_log` VALUES (7463952, 1, 'admin', 'normal', NULL, '/manager/main', '{}', '127.0.0.1', '2019-08-23 21:07:16', 'sesame');
INSERT INTO `sys_log` VALUES (7463953, 1, 'admin', 'normal', NULL, '/', '{}', '127.0.0.1', '2019-08-23 21:07:17', 'sesame');
INSERT INTO `sys_log` VALUES (7463954, 1, 'admin', 'normal', NULL, '/manager/get/swUserBasic', '{}', '127.0.0.1', '2019-08-23 21:07:18', 'sesame');
INSERT INTO `sys_log` VALUES (7463955, 1, 'admin', 'normal', NULL, '/manager/get/swUserBasic/list', '{}', '127.0.0.1', '2019-08-23 21:07:19', 'sesame');
INSERT INTO `sys_log` VALUES (7463956, 1, 'admin', 'normal', NULL, '/manager/get/swUserBasic/list', '{}', '127.0.0.1', '2019-08-23 21:07:19', 'sesame');
INSERT INTO `sys_log` VALUES (7463957, 1, 'admin', 'normal', NULL, '/manager/get/swWallets', '{}', '127.0.0.1', '2019-08-23 21:07:21', 'sesame');
INSERT INTO `sys_log` VALUES (7463958, 1, 'admin', 'normal', NULL, '/manager/get/swWallets/list', '{}', '127.0.0.1', '2019-08-23 21:07:21', 'sesame');
INSERT INTO `sys_log` VALUES (7463959, 1, 'admin', 'normal', NULL, '/manager/get/swWallets/list', '{}', '127.0.0.1', '2019-08-23 21:07:21', 'sesame');
INSERT INTO `sys_log` VALUES (7463960, 1, 'admin', 'normal', NULL, '/manager/sys/menu/', '{}', '127.0.0.1', '2019-08-23 21:07:45', 'sesame');
INSERT INTO `sys_log` VALUES (7463961, 1, 'admin', 'normal', NULL, '/manager/sys/menu/list', '{\"sort\":\"order_num\"}', '127.0.0.1', '2019-08-23 21:07:45', 'sesame');
INSERT INTO `sys_log` VALUES (7463962, 1, 'admin', 'normal', NULL, '/manager/sys/menu/edit/275', '{}', '127.0.0.1', '2019-08-23 21:07:56', 'sesame');
INSERT INTO `sys_log` VALUES (7463963, 1, 'admin', 'normal', NULL, '/manager/sys/menu/remove', '{\"id\":\"275\"}', '127.0.0.1', '2019-08-23 21:08:26', 'sesame');
INSERT INTO `sys_log` VALUES (7463964, 1, 'admin', 'normal', NULL, '/manager/sys/menu/list', '{\"sort\":\"order_num\"}', '127.0.0.1', '2019-08-23 21:08:26', 'sesame');
INSERT INTO `sys_log` VALUES (7463965, 1, 'admin', 'normal', NULL, '/manager/sys/menu/add/274', '{}', '127.0.0.1', '2019-08-23 21:08:28', 'sesame');
INSERT INTO `sys_log` VALUES (7463966, 1, 'admin', 'normal', NULL, '/manager/sys/menu/save', '{\"name\":\"币种管理\",\"icon\":\"\",\"orderNum\":\"1\",\"perms\":\"get:swCoinType:swCoinType\",\"type\":\"1\",\"parentId\":\"274\",\"url\":\"/manager/get/swCoinType\"}', '127.0.0.1', '2019-08-23 21:08:56', 'sesame');
INSERT INTO `sys_log` VALUES (7463967, 1, 'admin', 'normal', NULL, '/manager/sys/menu/list', '{\"sort\":\"order_num\"}', '127.0.0.1', '2019-08-23 21:08:56', 'sesame');
INSERT INTO `sys_log` VALUES (7463968, 1, 'admin', 'normal', NULL, '/manager/sys/role', '{}', '127.0.0.1', '2019-08-23 21:09:00', 'sesame');
INSERT INTO `sys_log` VALUES (7463969, 1, 'admin', 'normal', NULL, '/manager/sys/role/list', '{}', '127.0.0.1', '2019-08-23 21:09:00', 'sesame');
INSERT INTO `sys_log` VALUES (7463970, 1, 'admin', 'normal', NULL, '/manager/sys/role/edit/1', '{}', '127.0.0.1', '2019-08-23 21:09:01', 'sesame');
INSERT INTO `sys_log` VALUES (7463971, 1, 'admin', 'normal', NULL, '/manager/sys/menu/tree/1', '{}', '127.0.0.1', '2019-08-23 21:09:01', 'sesame');
INSERT INTO `sys_log` VALUES (7463972, 1, 'admin', 'normal', NULL, '/manager/sys/role/update', '{\"roleId\":\"1\",\"roleName\":\"开发管理员角色\",\"remark\":\"拥有最高权限\",\"menuIds\":\"273,205,92,57,30,29,28,206,118,48,209,207,203,76,75,74,62,56,55,15,26,25,24,14,13,12,61,22,21,20,83,81,80,79,71,272,204,109,27,91,77,202,73,7,6,2,3,78,1,274,276,-1\"}', '127.0.0.1', '2019-08-23 21:09:04', 'sesame');
INSERT INTO `sys_log` VALUES (7463973, 1, 'admin', 'normal', NULL, '/manager/sys/role/list', '{}', '127.0.0.1', '2019-08-23 21:09:04', 'sesame');
INSERT INTO `sys_log` VALUES (7463974, -1, '获取用户信息为空', 'normal', NULL, '/manager/logout', '{}', '127.0.0.1', '2019-08-23 21:09:06', 'sesame');
INSERT INTO `sys_log` VALUES (7463975, -1, '获取用户信息为空', 'normal', NULL, '/manager/login;JSESSIONID=9d8d9279-2297-49a0-ad7a-c4fcd5987db9', '{}', '127.0.0.1', '2019-08-23 21:09:06', 'sesame');
INSERT INTO `sys_log` VALUES (7463976, 1, 'admin', 'normal', NULL, '/manager/login', '{\"password\":\"123456\",\"mobileCheckCode\":\"\",\"username\":\"admin\",\"checkCode\":\"\"}', '127.0.0.1', '2019-08-23 21:09:09', 'sesame');
INSERT INTO `sys_log` VALUES (7463977, 1, 'admin', 'normal', NULL, '/manager/index', '{}', '127.0.0.1', '2019-08-23 21:09:09', 'sesame');
INSERT INTO `sys_log` VALUES (7463978, 1, 'admin', 'normal', NULL, '/manager/main', '{}', '127.0.0.1', '2019-08-23 21:09:09', 'sesame');
INSERT INTO `sys_log` VALUES (7463979, 1, 'admin', 'normal', NULL, '/manager/oa/notify/message', '{}', '127.0.0.1', '2019-08-23 21:09:09', 'sesame');
INSERT INTO `sys_log` VALUES (7463980, 1, 'admin', 'normal', NULL, '/manager/main', '{}', '127.0.0.1', '2019-08-23 21:09:09', 'sesame');
INSERT INTO `sys_log` VALUES (7463981, 1, 'admin', 'normal', NULL, '/', '{}', '127.0.0.1', '2019-08-23 21:09:10', 'sesame');
INSERT INTO `sys_log` VALUES (7463982, 1, 'admin', 'normal', NULL, '/manager/get/swCoinType', '{}', '127.0.0.1', '2019-08-23 21:09:12', 'sesame');
INSERT INTO `sys_log` VALUES (7463983, 1, 'admin', 'normal', NULL, '/manager/get/swCoinType/list', '{}', '127.0.0.1', '2019-08-23 21:09:12', 'sesame');
INSERT INTO `sys_log` VALUES (7463984, 1, 'admin', 'normal', NULL, '/manager/get/swCoinType/list', '{}', '127.0.0.1', '2019-08-23 21:09:12', 'sesame');
INSERT INTO `sys_log` VALUES (7463985, 1, 'admin', 'normal', NULL, '/manager/sys/menu/', '{}', '127.0.0.1', '2019-08-23 21:09:23', 'sesame');
INSERT INTO `sys_log` VALUES (7463986, 1, 'admin', 'normal', NULL, '/manager/sys/menu/list', '{\"sort\":\"order_num\"}', '127.0.0.1', '2019-08-23 21:09:23', 'sesame');
INSERT INTO `sys_log` VALUES (7463987, 1, 'admin', 'normal', NULL, '/manager/sys/menu/add/276', '{}', '127.0.0.1', '2019-08-23 21:09:28', 'sesame');
INSERT INTO `sys_log` VALUES (7463988, 1, 'admin', 'normal', NULL, '/manager/sys/menu/save', '{\"name\":\"添加\",\"icon\":\"\",\"orderNum\":\"1\",\"perms\":\"get:swCoinType:add\",\"type\":\"2\",\"parentId\":\"276\",\"url\":\"\"}', '127.0.0.1', '2019-08-23 21:09:46', 'sesame');
INSERT INTO `sys_log` VALUES (7463989, 1, 'admin', 'normal', NULL, '/manager/sys/menu/list', '{\"sort\":\"order_num\"}', '127.0.0.1', '2019-08-23 21:09:46', 'sesame');
INSERT INTO `sys_log` VALUES (7463990, 1, 'admin', 'normal', NULL, '/manager/sys/menu/add/276', '{}', '127.0.0.1', '2019-08-23 21:09:51', 'sesame');
INSERT INTO `sys_log` VALUES (7463991, 1, 'admin', 'normal', NULL, '/manager/sys/menu/save', '{\"name\":\"更新\",\"icon\":\"\",\"orderNum\":\"2\",\"perms\":\"get:swCoinType:edit\",\"type\":\"2\",\"parentId\":\"276\",\"url\":\"\"}', '127.0.0.1', '2019-08-23 21:10:05', 'sesame');
INSERT INTO `sys_log` VALUES (7463992, 1, 'admin', 'normal', NULL, '/manager/sys/menu/list', '{\"sort\":\"order_num\"}', '127.0.0.1', '2019-08-23 21:10:05', 'sesame');
INSERT INTO `sys_log` VALUES (7463993, 1, 'admin', 'normal', NULL, '/manager/sys/role', '{}', '127.0.0.1', '2019-08-23 21:10:11', 'sesame');
INSERT INTO `sys_log` VALUES (7463994, 1, 'admin', 'normal', NULL, '/manager/sys/role/list', '{}', '127.0.0.1', '2019-08-23 21:10:12', 'sesame');
INSERT INTO `sys_log` VALUES (7463995, 1, 'admin', 'normal', NULL, '/manager/sys/role/edit/1', '{}', '127.0.0.1', '2019-08-23 21:10:12', 'sesame');
INSERT INTO `sys_log` VALUES (7463996, 1, 'admin', 'normal', NULL, '/manager/sys/menu/tree/1', '{}', '127.0.0.1', '2019-08-23 21:10:12', 'sesame');
INSERT INTO `sys_log` VALUES (7463997, 1, 'admin', 'normal', NULL, '/manager/sys/role/update', '{\"roleId\":\"1\",\"roleName\":\"开发管理员角色\",\"remark\":\"拥有最高权限\",\"menuIds\":\"273,205,92,57,30,29,28,206,118,48,209,207,203,76,75,74,62,56,55,15,26,25,24,14,13,12,61,22,21,20,83,81,80,79,71,272,204,109,27,91,77,202,73,7,6,2,3,78,1,274,278,277,276,-1\"}', '127.0.0.1', '2019-08-23 21:10:15', 'sesame');
INSERT INTO `sys_log` VALUES (7463998, 1, 'admin', 'normal', NULL, '/manager/sys/role/list', '{}', '127.0.0.1', '2019-08-23 21:10:15', 'sesame');
INSERT INTO `sys_log` VALUES (7463999, -1, '获取用户信息为空', 'normal', NULL, '/manager/logout', '{}', '127.0.0.1', '2019-08-23 21:10:16', 'sesame');
INSERT INTO `sys_log` VALUES (7464000, -1, '获取用户信息为空', 'normal', NULL, '/manager/login;JSESSIONID=bc6534c3-a234-46a9-8478-bb827f594a7d', '{}', '127.0.0.1', '2019-08-23 21:10:16', 'sesame');
INSERT INTO `sys_log` VALUES (7464001, 1, 'admin', 'normal', NULL, '/manager/login', '{\"password\":\"123456\",\"mobileCheckCode\":\"\",\"username\":\"admin\",\"checkCode\":\"\"}', '127.0.0.1', '2019-08-23 21:10:20', 'sesame');
INSERT INTO `sys_log` VALUES (7464002, 1, 'admin', 'normal', NULL, '/manager/index', '{}', '127.0.0.1', '2019-08-23 21:10:20', 'sesame');
INSERT INTO `sys_log` VALUES (7464003, 1, 'admin', 'normal', NULL, '/manager/main', '{}', '127.0.0.1', '2019-08-23 21:10:20', 'sesame');
INSERT INTO `sys_log` VALUES (7464004, 1, 'admin', 'normal', NULL, '/manager/oa/notify/message', '{}', '127.0.0.1', '2019-08-23 21:10:20', 'sesame');
INSERT INTO `sys_log` VALUES (7464005, 1, 'admin', 'normal', NULL, '/manager/main', '{}', '127.0.0.1', '2019-08-23 21:10:20', 'sesame');
INSERT INTO `sys_log` VALUES (7464006, 1, 'admin', 'normal', NULL, '/', '{}', '127.0.0.1', '2019-08-23 21:10:20', 'sesame');
INSERT INTO `sys_log` VALUES (7464007, 1, 'admin', 'normal', NULL, '/manager/get/swCoinType', '{}', '127.0.0.1', '2019-08-23 21:10:23', 'sesame');
INSERT INTO `sys_log` VALUES (7464008, 1, 'admin', 'normal', NULL, '/manager/get/swCoinType/list', '{}', '127.0.0.1', '2019-08-23 21:10:23', 'sesame');
INSERT INTO `sys_log` VALUES (7464009, 1, 'admin', 'normal', NULL, '/manager/get/swCoinType/list', '{}', '127.0.0.1', '2019-08-23 21:10:23', 'sesame');
INSERT INTO `sys_log` VALUES (7464010, 1, 'admin', 'normal', NULL, '/manager/get/swCoinType/add', '{}', '127.0.0.1', '2019-08-23 21:10:25', 'sesame');
INSERT INTO `sys_log` VALUES (7464011, 1, 'admin', 'normal', NULL, '/manager/get/swCoinType/add', '{}', '127.0.0.1', '2019-08-23 21:11:30', 'sesame');
INSERT INTO `sys_log` VALUES (7464012, -1, '获取用户信息为空', 'normal', NULL, '/manager/login;JSESSIONID=e7f4cdf7-9988-4976-a017-d266901b9f53', '{}', '127.0.0.1', '2019-08-23 21:12:32', 'sesame');
INSERT INTO `sys_log` VALUES (7464013, 1, 'admin', 'normal', NULL, '/manager/login', '{\"password\":\"123456\",\"mobileCheckCode\":\"\",\"username\":\"admin\",\"checkCode\":\"\"}', '127.0.0.1', '2019-08-23 21:12:35', 'sesame');
INSERT INTO `sys_log` VALUES (7464014, 1, 'admin', 'normal', NULL, '/manager/index', '{}', '127.0.0.1', '2019-08-23 21:12:35', 'sesame');
INSERT INTO `sys_log` VALUES (7464015, 1, 'admin', 'normal', NULL, '/manager/oa/notify/message', '{}', '127.0.0.1', '2019-08-23 21:12:35', 'sesame');
INSERT INTO `sys_log` VALUES (7464016, 1, 'admin', 'normal', NULL, '/manager/main', '{}', '127.0.0.1', '2019-08-23 21:12:35', 'sesame');
INSERT INTO `sys_log` VALUES (7464017, 1, 'admin', 'normal', NULL, '/manager/main', '{}', '127.0.0.1', '2019-08-23 21:12:35', 'sesame');
INSERT INTO `sys_log` VALUES (7464018, 1, 'admin', 'normal', NULL, '/', '{}', '127.0.0.1', '2019-08-23 21:12:36', 'sesame');
INSERT INTO `sys_log` VALUES (7464019, 1, 'admin', 'normal', NULL, '/manager/get/swCoinType', '{}', '127.0.0.1', '2019-08-23 21:12:38', 'sesame');
INSERT INTO `sys_log` VALUES (7464020, 1, 'admin', 'normal', NULL, '/manager/get/swCoinType/list', '{}', '127.0.0.1', '2019-08-23 21:12:38', 'sesame');
INSERT INTO `sys_log` VALUES (7464021, 1, 'admin', 'normal', NULL, '/manager/get/swCoinType/list', '{}', '127.0.0.1', '2019-08-23 21:12:38', 'sesame');
INSERT INTO `sys_log` VALUES (7464022, 1, 'admin', 'normal', NULL, '/manager/get/swCoinType/add', '{}', '127.0.0.1', '2019-08-23 21:12:39', 'sesame');
INSERT INTO `sys_log` VALUES (7464023, 1, 'admin', 'normal', NULL, '/manager/get/swCoinType/save', '{\"updateDate\":\"\",\"coinPhot\":\"\",\"enable\":\"0\",\"coinName\":\"EOS\",\"delFlag\":\"0\",\"ex2\":\"\",\"createDate\":\"\",\"ex1\":\"\"}', '127.0.0.1', '2019-08-23 21:12:50', 'sesame');
INSERT INTO `sys_log` VALUES (7464024, 1, 'admin', 'normal', NULL, '/manager/get/swCoinType/list', '{}', '127.0.0.1', '2019-08-23 21:12:50', 'sesame');
INSERT INTO `sys_log` VALUES (7464025, 1, 'admin', 'normal', NULL, '/manager/get/swCoinType/add', '{}', '127.0.0.1', '2019-08-23 21:12:56', 'sesame');
INSERT INTO `sys_log` VALUES (7464026, 1, 'admin', 'normal', NULL, '/manager/get/swCoinType/save', '{\"updateDate\":\"\",\"coinPhot\":\"\",\"enable\":\"0\",\"coinName\":\"BBCT\",\"delFlag\":\"0\",\"ex2\":\"\",\"createDate\":\"\",\"ex1\":\"\"}', '127.0.0.1', '2019-08-23 21:13:07', 'sesame');
INSERT INTO `sys_log` VALUES (7464027, 1, 'admin', 'normal', NULL, '/manager/get/swCoinType/list', '{}', '127.0.0.1', '2019-08-23 21:13:07', 'sesame');
INSERT INTO `sys_log` VALUES (7464028, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/checkRegister', '{\"loginPass\":\"aaa000000\",\"email\":\"1143178854@qq.com\",\"recomId\":\"1\",\"checkCode\":\"0001\"}', '127.0.0.1', '2019-08-24 14:07:53', 'sesame');
INSERT INTO `sys_log` VALUES (7464029, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/checkRegister', '{\"loginPass\":\"aaa000000\",\"email\":\"1143178854@qq.com\",\"recomId\":\"1\",\"checkCode\":\"0001\"}', '127.0.0.1', '2019-08-24 14:08:28', 'sesame');
INSERT INTO `sys_log` VALUES (7464030, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/checkRegister', '{\"loginPass\":\"aaa000000\",\"email\":\"1143178854@qq.com\",\"recomId\":\"1\",\"checkCode\":\"0001\"}', '127.0.0.1', '2019-08-24 14:08:58', 'sesame');
INSERT INTO `sys_log` VALUES (7464031, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/checkRegister', '{\"loginPass\":\"aaa000000\",\"email\":\"1143178854@qq.com\",\"recomId\":\"1\",\"checkCode\":\"0001\"}', '127.0.0.1', '2019-08-24 14:10:05', 'sesame');
INSERT INTO `sys_log` VALUES (7464032, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/checkRegister', '{\"loginPass\":\"aaa000000\",\"email\":\"1143178854@qq.com\",\"recomId\":\"1\",\"checkCode\":\"0001\"}', '127.0.0.1', '2019-08-24 14:10:51', 'sesame');
INSERT INTO `sys_log` VALUES (7464033, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/checkRegister', '{\"loginPass\":\"aaa000000\",\"email\":\"1143178855@qq.com\",\"recomId\":\"1\",\"checkCode\":\"0001\"}', '127.0.0.1', '2019-08-26 19:05:57', 'sesame');
INSERT INTO `sys_log` VALUES (7464034, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/getEmailCheckCode', '{\"email\":\"27592285@qq.com\"}', '127.0.0.1', '2019-08-26 19:07:49', 'sesame');
INSERT INTO `sys_log` VALUES (7464035, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/checkRegister', '{\"loginPass\":\"aaa000000\",\"email\":\"27592285@qq.com\",\"recomId\":\"1\",\"checkCode\":\"2360\"}', '127.0.0.1', '2019-08-26 19:08:55', 'sesame');
INSERT INTO `sys_log` VALUES (7464036, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/checkRegister', '{\"loginPass\":\"aaa000000\",\"email\":\"27592285@qq.com\",\"recomId\":\"1\",\"checkCode\":\"2360\"}', '127.0.0.1', '2019-08-26 19:13:59', 'sesame');
INSERT INTO `sys_log` VALUES (7464037, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/login', '{\"loginPass\":\"aaa000000\",\"email\":\"27592285@qq.com\"}', '127.0.0.1', '2019-08-26 19:15:23', 'sesame');
INSERT INTO `sys_log` VALUES (7464038, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/getEmailCheckCode', '{\"email\":\"27592285@qq.com\"}', '127.0.0.1', '2019-08-26 19:39:52', 'sesame');
INSERT INTO `sys_log` VALUES (7464039, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/get_email_check_code', '{\"email\":\"27592285@qq.com\"}', '127.0.0.1', '2019-08-26 19:40:11', 'sesame');
INSERT INTO `sys_log` VALUES (7464040, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/set_password', '{\"pass\":\"aaa111111\",\"type\":\"1\",\"email\":\"27592285@qq.com\",\"checkCode\":\"8282\"}', '127.0.0.1', '2019-08-26 19:40:46', 'sesame');
INSERT INTO `sys_log` VALUES (7464041, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/set_password', '{\"pass\":\"aaa111111\",\"type\":\"1\",\"email\":\"275922851@qq.com\",\"checkCode\":\"8282\"}', '127.0.0.1', '2019-08-26 19:44:17', 'sesame');
INSERT INTO `sys_log` VALUES (7464042, -1, '获取用户信息为空', 'normal', NULL, '/manager/login;JSESSIONID=489a66a2-199d-4ba7-a26d-a36425c80f58', '{}', '127.0.0.1', '2019-08-26 19:48:00', 'sesame');
INSERT INTO `sys_log` VALUES (7464043, 1, 'admin', 'normal', NULL, '/manager/login', '{\"password\":\"123456\",\"mobileCheckCode\":\"\",\"username\":\"admin\",\"checkCode\":\"\"}', '127.0.0.1', '2019-08-26 19:48:03', 'sesame');
INSERT INTO `sys_log` VALUES (7464044, 1, 'admin', 'normal', NULL, '/manager/index', '{}', '127.0.0.1', '2019-08-26 19:48:03', 'sesame');
INSERT INTO `sys_log` VALUES (7464045, 1, 'admin', 'normal', NULL, '/manager/main', '{}', '127.0.0.1', '2019-08-26 19:48:04', 'sesame');
INSERT INTO `sys_log` VALUES (7464046, 1, 'admin', 'normal', NULL, '/manager/oa/notify/message', '{}', '127.0.0.1', '2019-08-26 19:48:04', 'sesame');
INSERT INTO `sys_log` VALUES (7464047, 1, 'admin', 'normal', NULL, '/manager/main', '{}', '127.0.0.1', '2019-08-26 19:48:04', 'sesame');
INSERT INTO `sys_log` VALUES (7464048, 1, 'admin', 'normal', NULL, '/', '{}', '127.0.0.1', '2019-08-26 19:48:04', 'sesame');
INSERT INTO `sys_log` VALUES (7464049, 1, 'admin', 'normal', NULL, '/manager/common/generator', '{}', '127.0.0.1', '2019-08-26 19:48:09', 'sesame');
INSERT INTO `sys_log` VALUES (7464050, 1, 'admin', 'normal', NULL, '/manager/common/generator/list', '{}', '127.0.0.1', '2019-08-26 19:48:10', 'sesame');
INSERT INTO `sys_log` VALUES (7464051, 1, 'admin', 'normal', NULL, '/manager/common/generator/list', '{}', '127.0.0.1', '2019-08-26 19:49:18', 'sesame');
INSERT INTO `sys_log` VALUES (7464052, -1, '获取用户信息为空', 'normal', NULL, '/manager/login;JSESSIONID=b2fdddb1-0bb3-4455-af3d-e2909b964f2d', '{}', '127.0.0.1', '2019-08-26 20:24:28', 'sesame');
INSERT INTO `sys_log` VALUES (7464053, 1, 'admin', 'normal', NULL, '/manager/login', '{\"password\":\"123456\",\"mobileCheckCode\":\"\",\"username\":\"admin\",\"checkCode\":\"\"}', '127.0.0.1', '2019-08-26 20:24:32', 'sesame');
INSERT INTO `sys_log` VALUES (7464054, 1, 'admin', 'normal', NULL, '/manager/index', '{}', '127.0.0.1', '2019-08-26 20:24:32', 'sesame');
INSERT INTO `sys_log` VALUES (7464055, 1, 'admin', 'normal', NULL, '/manager/main', '{}', '127.0.0.1', '2019-08-26 20:24:32', 'sesame');
INSERT INTO `sys_log` VALUES (7464056, 1, 'admin', 'normal', NULL, '/manager/oa/notify/message', '{}', '127.0.0.1', '2019-08-26 20:24:32', 'sesame');
INSERT INTO `sys_log` VALUES (7464057, 1, 'admin', 'normal', NULL, '/manager/main', '{}', '127.0.0.1', '2019-08-26 20:24:32', 'sesame');
INSERT INTO `sys_log` VALUES (7464058, 1, 'admin', 'normal', NULL, '/', '{}', '127.0.0.1', '2019-08-26 20:24:33', 'sesame');
INSERT INTO `sys_log` VALUES (7464059, 1, 'admin', 'normal', NULL, '/manager/common/generator', '{}', '127.0.0.1', '2019-08-26 20:24:35', 'sesame');
INSERT INTO `sys_log` VALUES (7464060, 1, 'admin', 'normal', NULL, '/manager/common/generator/list', '{}', '127.0.0.1', '2019-08-26 20:24:35', 'sesame');
INSERT INTO `sys_log` VALUES (7464061, 1, 'admin', 'normal', NULL, '/manager/common/generator/code/t_sw_evangelist_info', '{}', '127.0.0.1', '2019-08-26 20:24:45', 'sesame');
INSERT INTO `sys_log` VALUES (7464062, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/login', '{\"loginPass\":\"aaa000000\",\"email\":\"27592285@qq.com\"}', '127.0.0.1', '2019-08-26 21:04:21', 'sesame');
INSERT INTO `sys_log` VALUES (7464063, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/login', '{\"loginPass\":\"aaa111111\",\"email\":\"27592285@qq.com\"}', '127.0.0.1', '2019-08-26 21:04:27', 'sesame');
INSERT INTO `sys_log` VALUES (7464064, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/apply_for_evangelist', '{}', '127.0.0.1', '2019-08-26 21:06:17', 'sesame');
INSERT INTO `sys_log` VALUES (7464065, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/apply_for_evangelist', '{}', '127.0.0.1', '2019-08-26 21:07:20', 'sesame');
INSERT INTO `sys_log` VALUES (7464066, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/login', '{\"loginPass\":\"aaa111111\",\"email\":\"27592285@qq.com\"}', '127.0.0.1', '2019-08-26 21:07:52', 'sesame');
INSERT INTO `sys_log` VALUES (7464067, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/apply_for_evangelist', '{}', '127.0.0.1', '2019-08-26 21:08:02', 'sesame');
INSERT INTO `sys_log` VALUES (7464068, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/apply_for_evangelist', '{}', '127.0.0.1', '2019-08-26 21:08:17', 'sesame');
INSERT INTO `sys_log` VALUES (7464069, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/apply_for_evangelist', '{}', '127.0.0.1', '2019-08-26 21:15:09', 'sesame');
INSERT INTO `sys_log` VALUES (7464070, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/withdraw_log', '{}', '127.0.0.1', '2019-08-27 18:56:34', 'sesame');
INSERT INTO `sys_log` VALUES (7464071, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/withdraw_log', '{}', '127.0.0.1', '2019-08-27 18:58:56', 'sesame');
INSERT INTO `sys_log` VALUES (7464072, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/charge_address', '{}', '127.0.0.1', '2019-08-27 19:13:01', 'sesame');
INSERT INTO `sys_log` VALUES (7464073, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/withdraw_address', '{}', '127.0.0.1', '2019-08-27 19:24:44', 'sesame');
INSERT INTO `sys_log` VALUES (7464074, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/withdraw_address', '{}', '127.0.0.1', '2019-08-27 19:25:39', 'sesame');
INSERT INTO `sys_log` VALUES (7464075, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/add_withdraw_address', '{}', '127.0.0.1', '2019-08-27 19:36:21', 'sesame');
INSERT INTO `sys_log` VALUES (7464076, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/withdraw_address', '{}', '127.0.0.1', '2019-08-27 19:59:33', 'sesame');
INSERT INTO `sys_log` VALUES (7464077, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/add_withdraw_address', '{}', '127.0.0.1', '2019-08-27 19:59:47', 'sesame');
INSERT INTO `sys_log` VALUES (7464078, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/withdraw_address', '{}', '127.0.0.1', '2019-08-27 20:00:01', 'sesame');
INSERT INTO `sys_log` VALUES (7464079, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/add_withdraw_address', '{}', '127.0.0.1', '2019-08-27 20:06:10', 'sesame');
INSERT INTO `sys_log` VALUES (7464080, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/withdraw_address', '{}', '127.0.0.1', '2019-08-27 20:06:13', 'sesame');
INSERT INTO `sys_log` VALUES (7464081, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/withdraw_address', '{}', '127.0.0.1', '2019-08-27 20:06:32', 'sesame');
INSERT INTO `sys_log` VALUES (7464082, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/add_withdraw_address', '{}', '127.0.0.1', '2019-08-27 20:06:35', 'sesame');
INSERT INTO `sys_log` VALUES (7464083, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/withdraw_address', '{}', '127.0.0.1', '2019-08-27 20:06:37', 'sesame');
INSERT INTO `sys_log` VALUES (7464084, NULL, NULL, 'error', NULL, 'http://localhost:8081/api/app/pv/edit_withdraw_address', 'org.springframework.web.HttpRequestMethodNotSupportedException: Request method \'GET\' not supported', NULL, '2019-08-27 20:07:40', NULL);
INSERT INTO `sys_log` VALUES (7464085, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/edit_withdraw_address', '{}', '127.0.0.1', '2019-08-27 20:11:08', 'sesame');
INSERT INTO `sys_log` VALUES (7464086, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/edit_withdraw_address', '{}', '127.0.0.1', '2019-08-27 20:12:01', 'sesame');
INSERT INTO `sys_log` VALUES (7464087, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/edit_withdraw_address', '{}', '127.0.0.1', '2019-08-27 20:12:29', 'sesame');
INSERT INTO `sys_log` VALUES (7464088, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/edit_withdraw_address', '{}', '127.0.0.1', '2019-08-27 20:13:15', 'sesame');
INSERT INTO `sys_log` VALUES (7464089, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/edit_withdraw_address', '{}', '127.0.0.1', '2019-08-27 20:14:43', 'sesame');
INSERT INTO `sys_log` VALUES (7464090, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/edit_withdraw_address', '{}', '127.0.0.1', '2019-08-27 20:15:32', 'sesame');
INSERT INTO `sys_log` VALUES (7464091, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/edit_withdraw_address', '{}', '127.0.0.1', '2019-08-27 20:15:37', 'sesame');
INSERT INTO `sys_log` VALUES (7464092, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/edit_withdraw_address', '{}', '127.0.0.1', '2019-08-27 20:15:42', 'sesame');
INSERT INTO `sys_log` VALUES (7464093, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/edit_withdraw_address', '{}', '127.0.0.1', '2019-08-27 20:18:30', 'sesame');
INSERT INTO `sys_log` VALUES (7464094, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/delete_withdraw_address', '{}', '127.0.0.1', '2019-08-27 20:19:41', 'sesame');
INSERT INTO `sys_log` VALUES (7464095, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/delete_withdraw_address', '{\"tid\":\"4861efe79df94c8e98da54122fd2fb89\"}', '127.0.0.1', '2019-08-27 20:21:55', 'sesame');
INSERT INTO `sys_log` VALUES (7464096, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/delete_withdraw_address', '{\"tid\":\"4861efe79df94c8e98da54122fd2fb89\"}', '127.0.0.1', '2019-08-27 20:22:25', 'sesame');
INSERT INTO `sys_log` VALUES (7464097, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/delete_withdraw_address', '{\"tid\":\"4861efe79df94c8e98da54122fd2fb89\"}', '127.0.0.1', '2019-08-27 20:22:57', 'sesame');
INSERT INTO `sys_log` VALUES (7464098, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/delete_withdraw_address', '{\"tid\":\"4861efe79df94c8e98da54122fd2fb89\"}', '127.0.0.1', '2019-08-27 20:23:37', 'sesame');
INSERT INTO `sys_log` VALUES (7464099, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/charge_log_detail', '{}', '127.0.0.1', '2019-08-27 20:38:27', 'sesame');
INSERT INTO `sys_log` VALUES (7464100, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/charge_log_detail', '{}', '127.0.0.1', '2019-08-27 20:38:49', 'sesame');
INSERT INTO `sys_log` VALUES (7464101, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/charge_log_detail', '{}', '127.0.0.1', '2019-08-27 20:39:25', 'sesame');
INSERT INTO `sys_log` VALUES (7464102, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/charge_log_detail', '{}', '127.0.0.1', '2019-08-27 20:40:07', 'sesame');
INSERT INTO `sys_log` VALUES (7464103, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/charge_log_detail', '{}', '127.0.0.1', '2019-08-27 20:42:30', 'sesame');
INSERT INTO `sys_log` VALUES (7464104, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/charge_log_detail', '{\"tid\":\"321asdf65asdf564\"}', '127.0.0.1', '2019-08-27 20:42:47', 'sesame');
INSERT INTO `sys_log` VALUES (7464105, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/withdraw_log', '{}', '127.0.0.1', '2019-08-27 20:53:17', 'sesame');
INSERT INTO `sys_log` VALUES (7464106, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/withdraw_log', '{}', '127.0.0.1', '2019-08-27 21:01:17', 'sesame');
INSERT INTO `sys_log` VALUES (7464107, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pv/withdraw_log_detail', '{\"tid\":\"asdf321asdf321\"}', '127.0.0.1', '2019-08-27 21:07:29', 'sesame');
INSERT INTO `sys_log` VALUES (7464108, -1, '获取用户信息为空', 'normal', NULL, '/manager/login;JSESSIONID=8369949e-854e-4cac-afb1-f3feaf2211e5', '{}', '127.0.0.1', '2019-08-28 19:09:47', 'sesame');
INSERT INTO `sys_log` VALUES (7464109, 1, 'admin', 'normal', NULL, '/manager/login', '{\"password\":\"123456\",\"mobileCheckCode\":\"\",\"username\":\"admin\",\"checkCode\":\"\"}', '127.0.0.1', '2019-08-28 19:09:50', 'sesame');
INSERT INTO `sys_log` VALUES (7464110, 1, 'admin', 'normal', NULL, '/manager/index', '{}', '127.0.0.1', '2019-08-28 19:09:50', 'sesame');
INSERT INTO `sys_log` VALUES (7464111, 1, 'admin', 'normal', NULL, '/manager/main', '{}', '127.0.0.1', '2019-08-28 19:09:51', 'sesame');
INSERT INTO `sys_log` VALUES (7464112, 1, 'admin', 'normal', NULL, '/manager/oa/notify/message', '{}', '127.0.0.1', '2019-08-28 19:09:51', 'sesame');
INSERT INTO `sys_log` VALUES (7464113, 1, 'admin', 'normal', NULL, '/manager/main', '{}', '127.0.0.1', '2019-08-28 19:09:51', 'sesame');
INSERT INTO `sys_log` VALUES (7464114, 1, 'admin', 'normal', NULL, '/', '{}', '127.0.0.1', '2019-08-28 19:09:51', 'sesame');
INSERT INTO `sys_log` VALUES (7464115, 1, 'admin', 'normal', NULL, '/manager/common/generator', '{}', '127.0.0.1', '2019-08-28 19:09:57', 'sesame');
INSERT INTO `sys_log` VALUES (7464116, 1, 'admin', 'normal', NULL, '/manager/common/generator/list', '{}', '127.0.0.1', '2019-08-28 19:09:57', 'sesame');
INSERT INTO `sys_log` VALUES (7464117, 1, 'admin', 'normal', NULL, '/manager/common/generator/code/t_sys_information', '{}', '127.0.0.1', '2019-08-28 19:10:03', 'sesame');
INSERT INTO `sys_log` VALUES (7464118, 1, 'admin', 'normal', NULL, '/manager/sys/menu/', '{}', '127.0.0.1', '2019-08-28 19:11:49', 'sesame');
INSERT INTO `sys_log` VALUES (7464119, 1, 'admin', 'normal', NULL, '/manager/sys/menu/list', '{\"sort\":\"order_num\"}', '127.0.0.1', '2019-08-28 19:11:49', 'sesame');
INSERT INTO `sys_log` VALUES (7464120, 1, 'admin', 'normal', NULL, '/manager/sys/menu/add/0', '{}', '127.0.0.1', '2019-08-28 19:12:09', 'sesame');
INSERT INTO `sys_log` VALUES (7464121, 1, 'admin', 'normal', NULL, '/manager/sys/menu/save', '{\"name\":\"资讯管理\",\"icon\":\"\",\"orderNum\":\"88\",\"perms\":\"\",\"type\":\"0\",\"parentId\":\"0\",\"url\":\"\"}', '127.0.0.1', '2019-08-28 19:12:21', 'sesame');
INSERT INTO `sys_log` VALUES (7464122, 1, 'admin', 'normal', NULL, '/manager/sys/menu/list', '{\"sort\":\"order_num\"}', '127.0.0.1', '2019-08-28 19:12:21', 'sesame');
INSERT INTO `sys_log` VALUES (7464123, 1, 'admin', 'normal', NULL, '/manager/sys/menu/edit/279', '{}', '127.0.0.1', '2019-08-28 19:12:26', 'sesame');
INSERT INTO `sys_log` VALUES (7464124, 1, 'admin', 'normal', NULL, '/manager/sys/menu/edit/109', '{}', '127.0.0.1', '2019-08-28 19:12:30', 'sesame');
INSERT INTO `sys_log` VALUES (7464125, 1, 'admin', 'normal', NULL, '/manager/sys/menu/edit/272', '{}', '127.0.0.1', '2019-08-28 19:12:32', 'sesame');
INSERT INTO `sys_log` VALUES (7464126, 1, 'admin', 'normal', NULL, '/manager/sys/menu/edit/272', '{}', '127.0.0.1', '2019-08-28 19:12:36', 'sesame');
INSERT INTO `sys_log` VALUES (7464127, 1, 'admin', 'normal', NULL, '/manager/sys/menu/update', '{\"name\":\"用户管理\",\"icon\":\"fa fa-user\",\"menuId\":\"272\",\"orderNum\":\"10\",\"perms\":\"\",\"type\":\"0\",\"parentId\":\"0\",\"url\":\"\"}', '127.0.0.1', '2019-08-28 19:12:54', 'sesame');
INSERT INTO `sys_log` VALUES (7464128, 1, 'admin', 'normal', NULL, '/manager/sys/menu/list', '{\"sort\":\"order_num\"}', '127.0.0.1', '2019-08-28 19:12:54', 'sesame');
INSERT INTO `sys_log` VALUES (7464129, 1, 'admin', 'normal', NULL, '/manager/sys/menu/edit/274', '{}', '127.0.0.1', '2019-08-28 19:12:56', 'sesame');
INSERT INTO `sys_log` VALUES (7464130, 1, 'admin', 'normal', NULL, '/manager/sys/menu/update', '{\"name\":\"资金管理\",\"icon\":\"fa fa-credit-card\",\"menuId\":\"274\",\"orderNum\":\"20\",\"perms\":\"\",\"type\":\"0\",\"parentId\":\"0\",\"url\":\"\"}', '127.0.0.1', '2019-08-28 19:13:00', 'sesame');
INSERT INTO `sys_log` VALUES (7464131, 1, 'admin', 'normal', NULL, '/manager/sys/menu/list', '{\"sort\":\"order_num\"}', '127.0.0.1', '2019-08-28 19:13:00', 'sesame');
INSERT INTO `sys_log` VALUES (7464132, 1, 'admin', 'normal', NULL, '/manager/sys/menu/edit/77', '{}', '127.0.0.1', '2019-08-28 19:13:02', 'sesame');
INSERT INTO `sys_log` VALUES (7464133, 1, 'admin', 'normal', NULL, '/manager/sys/menu/update', '{\"name\":\"系统工具\",\"icon\":\"fa fa-gear\",\"menuId\":\"77\",\"orderNum\":\"50\",\"perms\":\"\",\"type\":\"0\",\"parentId\":\"0\",\"url\":\"\"}', '127.0.0.1', '2019-08-28 19:13:05', 'sesame');
INSERT INTO `sys_log` VALUES (7464134, 1, 'admin', 'normal', NULL, '/manager/sys/menu/list', '{\"sort\":\"order_num\"}', '127.0.0.1', '2019-08-28 19:13:05', 'sesame');
INSERT INTO `sys_log` VALUES (7464135, 1, 'admin', 'normal', NULL, '/manager/sys/menu/edit/91', '{}', '127.0.0.1', '2019-08-28 19:13:06', 'sesame');
INSERT INTO `sys_log` VALUES (7464136, 1, 'admin', 'normal', NULL, '/manager/sys/menu/update', '{\"name\":\"系统监控\",\"icon\":\"fa fa-video-camera\",\"menuId\":\"91\",\"orderNum\":\"60\",\"perms\":\"\",\"type\":\"0\",\"parentId\":\"0\",\"url\":\"\"}', '127.0.0.1', '2019-08-28 19:13:09', 'sesame');
INSERT INTO `sys_log` VALUES (7464137, 1, 'admin', 'normal', NULL, '/manager/sys/menu/list', '{\"sort\":\"order_num\"}', '127.0.0.1', '2019-08-28 19:13:09', 'sesame');
INSERT INTO `sys_log` VALUES (7464138, 1, 'admin', 'normal', NULL, '/manager/sys/menu/edit/3', '{}', '127.0.0.1', '2019-08-28 19:13:10', 'sesame');
INSERT INTO `sys_log` VALUES (7464139, 1, 'admin', 'normal', NULL, '/manager/sys/menu/update', '{\"name\":\"系统管理\",\"icon\":\"fa fa-desktop\",\"menuId\":\"3\",\"orderNum\":\"70\",\"perms\":\"\",\"type\":\"0\",\"parentId\":\"0\",\"url\":\"\"}', '127.0.0.1', '2019-08-28 19:13:13', 'sesame');
INSERT INTO `sys_log` VALUES (7464140, 1, 'admin', 'normal', NULL, '/manager/sys/menu/list', '{\"sort\":\"order_num\"}', '127.0.0.1', '2019-08-28 19:13:13', 'sesame');
INSERT INTO `sys_log` VALUES (7464141, 1, 'admin', 'normal', NULL, '/manager/sys/menu/edit/1', '{}', '127.0.0.1', '2019-08-28 19:13:14', 'sesame');
INSERT INTO `sys_log` VALUES (7464142, 1, 'admin', 'normal', NULL, '/manager/sys/menu/update', '{\"name\":\"基础管理\",\"icon\":\"fa fa-bars\",\"menuId\":\"1\",\"orderNum\":\"80\",\"perms\":\"\",\"type\":\"0\",\"parentId\":\"0\",\"url\":\"\"}', '127.0.0.1', '2019-08-28 19:13:17', 'sesame');
INSERT INTO `sys_log` VALUES (7464143, 1, 'admin', 'normal', NULL, '/manager/sys/menu/list', '{\"sort\":\"order_num\"}', '127.0.0.1', '2019-08-28 19:13:17', 'sesame');
INSERT INTO `sys_log` VALUES (7464144, 1, 'admin', 'normal', NULL, '/manager/sys/menu/edit/272', '{}', '127.0.0.1', '2019-08-28 19:13:19', 'sesame');
INSERT INTO `sys_log` VALUES (7464145, 1, 'admin', 'normal', NULL, '/manager/sys/menu/edit/109', '{}', '127.0.0.1', '2019-08-28 19:13:21', 'sesame');
INSERT INTO `sys_log` VALUES (7464146, 1, 'admin', 'normal', NULL, '/manager/sys/menu/update', '{\"name\":\"全局配置\",\"icon\":\"fa fa-gear\",\"menuId\":\"109\",\"orderNum\":\"90\",\"perms\":\"\",\"type\":\"0\",\"parentId\":\"0\",\"url\":\"\"}', '127.0.0.1', '2019-08-28 19:13:28', 'sesame');
INSERT INTO `sys_log` VALUES (7464147, 1, 'admin', 'normal', NULL, '/manager/sys/menu/list', '{\"sort\":\"order_num\"}', '127.0.0.1', '2019-08-28 19:13:28', 'sesame');
INSERT INTO `sys_log` VALUES (7464148, 1, 'admin', 'normal', NULL, '/manager/sys/menu/edit/279', '{}', '127.0.0.1', '2019-08-28 19:13:33', 'sesame');
INSERT INTO `sys_log` VALUES (7464149, 1, 'admin', 'normal', NULL, '/manager/sys/menu/edit/274', '{}', '127.0.0.1', '2019-08-28 19:13:41', 'sesame');
INSERT INTO `sys_log` VALUES (7464150, 1, 'admin', 'normal', NULL, '/manager/sys/menu/edit/279', '{}', '127.0.0.1', '2019-08-28 19:13:44', 'sesame');
INSERT INTO `sys_log` VALUES (7464151, 1, 'admin', 'normal', NULL, '/manager/sys/menu/update', '{\"name\":\"资讯管理\",\"icon\":\"\",\"menuId\":\"279\",\"orderNum\":\"29\",\"perms\":\"\",\"type\":\"0\",\"parentId\":\"0\",\"url\":\"\"}', '127.0.0.1', '2019-08-28 19:13:49', 'sesame');
INSERT INTO `sys_log` VALUES (7464152, 1, 'admin', 'normal', NULL, '/manager/sys/menu/list', '{\"sort\":\"order_num\"}', '127.0.0.1', '2019-08-28 19:13:49', 'sesame');
INSERT INTO `sys_log` VALUES (7464153, 1, 'admin', 'normal', NULL, '/manager/sys/menu/add/279', '{}', '127.0.0.1', '2019-08-28 19:13:58', 'sesame');
INSERT INTO `sys_log` VALUES (7464154, 1, 'admin', 'normal', NULL, '/manager/sys/menu/save', '{\"name\":\"资讯管理\",\"icon\":\"\",\"orderNum\":\"1\",\"perms\":\"get:information:information\",\"type\":\"1\",\"parentId\":\"279\",\"url\":\"/manager/get/information\"}', '127.0.0.1', '2019-08-28 19:14:49', 'sesame');
INSERT INTO `sys_log` VALUES (7464155, 1, 'admin', 'normal', NULL, '/manager/sys/menu/list', '{\"sort\":\"order_num\"}', '127.0.0.1', '2019-08-28 19:14:49', 'sesame');
INSERT INTO `sys_log` VALUES (7464156, 1, 'admin', 'normal', NULL, '/manager/sys/menu/add/280', '{}', '127.0.0.1', '2019-08-28 19:14:56', 'sesame');
INSERT INTO `sys_log` VALUES (7464157, 1, 'admin', 'normal', NULL, '/manager/sys/menu/save', '{\"name\":\"添加\",\"icon\":\"\",\"orderNum\":\"1\",\"perms\":\"get:information:add\",\"type\":\"2\",\"parentId\":\"280\",\"url\":\"\"}', '127.0.0.1', '2019-08-28 19:15:18', 'sesame');
INSERT INTO `sys_log` VALUES (7464158, 1, 'admin', 'normal', NULL, '/manager/sys/menu/list', '{\"sort\":\"order_num\"}', '127.0.0.1', '2019-08-28 19:15:18', 'sesame');
INSERT INTO `sys_log` VALUES (7464159, 1, 'admin', 'normal', NULL, '/manager/sys/menu/add/280', '{}', '127.0.0.1', '2019-08-28 19:15:28', 'sesame');
INSERT INTO `sys_log` VALUES (7464160, 1, 'admin', 'normal', NULL, '/manager/sys/menu/save', '{\"name\":\"更新\",\"icon\":\"\",\"orderNum\":\"2\",\"perms\":\"get:information:edit\",\"type\":\"2\",\"parentId\":\"280\",\"url\":\"\"}', '127.0.0.1', '2019-08-28 19:15:41', 'sesame');
INSERT INTO `sys_log` VALUES (7464161, 1, 'admin', 'normal', NULL, '/manager/sys/menu/list', '{\"sort\":\"order_num\"}', '127.0.0.1', '2019-08-28 19:15:41', 'sesame');
INSERT INTO `sys_log` VALUES (7464162, 1, 'admin', 'normal', NULL, '/manager/sys/menu/add/280', '{}', '127.0.0.1', '2019-08-28 19:15:49', 'sesame');
INSERT INTO `sys_log` VALUES (7464163, 1, 'admin', 'normal', NULL, '/manager/sys/menu/save', '{\"name\":\"删除\",\"icon\":\"\",\"orderNum\":\"3\",\"perms\":\"get:information:remove\",\"type\":\"2\",\"parentId\":\"280\",\"url\":\"\"}', '127.0.0.1', '2019-08-28 19:16:01', 'sesame');
INSERT INTO `sys_log` VALUES (7464164, 1, 'admin', 'normal', NULL, '/manager/sys/menu/list', '{\"sort\":\"order_num\"}', '127.0.0.1', '2019-08-28 19:16:01', 'sesame');
INSERT INTO `sys_log` VALUES (7464165, 1, 'admin', 'normal', NULL, '/manager/sys/role', '{}', '127.0.0.1', '2019-08-28 19:18:47', 'sesame');
INSERT INTO `sys_log` VALUES (7464166, 1, 'admin', 'normal', NULL, '/manager/sys/role/list', '{}', '127.0.0.1', '2019-08-28 19:18:47', 'sesame');
INSERT INTO `sys_log` VALUES (7464167, 1, 'admin', 'normal', NULL, '/manager/sys/role/edit/1', '{}', '127.0.0.1', '2019-08-28 19:18:49', 'sesame');
INSERT INTO `sys_log` VALUES (7464168, 1, 'admin', 'normal', NULL, '/manager/sys/menu/tree/1', '{}', '127.0.0.1', '2019-08-28 19:18:49', 'sesame');
INSERT INTO `sys_log` VALUES (7464169, 1, 'admin', 'normal', NULL, '/manager/sys/role/update', '{\"roleId\":\"1\",\"roleName\":\"开发管理员角色\",\"remark\":\"拥有最高权限\",\"menuIds\":\"278,277,273,205,92,57,30,29,28,206,118,48,209,207,203,76,75,74,62,56,55,15,26,25,24,14,13,12,61,22,21,20,83,81,80,79,71,276,274,272,204,109,27,91,77,202,73,7,6,2,3,78,1,279,283,282,281,280,-1\"}', '127.0.0.1', '2019-08-28 19:18:52', 'sesame');
INSERT INTO `sys_log` VALUES (7464170, 1, 'admin', 'normal', NULL, '/manager/sys/role/list', '{}', '127.0.0.1', '2019-08-28 19:18:52', 'sesame');
INSERT INTO `sys_log` VALUES (7464171, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/get_information', '{\"type\":\"1\"}', '127.0.0.1', '2019-08-28 19:32:19', 'sesame');
INSERT INTO `sys_log` VALUES (7464172, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/get_information', '{\"type\":\"1\"}', '127.0.0.1', '2019-08-28 19:33:40', 'sesame');
INSERT INTO `sys_log` VALUES (7464173, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/get_information', '{\"type\":\"2\"}', '127.0.0.1', '2019-08-28 19:33:43', 'sesame');
INSERT INTO `sys_log` VALUES (7464174, -1, '获取用户信息为空', 'normal', NULL, '/manager/login;JSESSIONID=6c61d132-8cb1-4f61-bdbd-144cdb8ae51f', '{}', '127.0.0.1', '2019-08-28 19:37:24', 'sesame');
INSERT INTO `sys_log` VALUES (7464175, 1, 'admin', 'normal', NULL, '/manager/login', '{\"password\":\"123456\",\"mobileCheckCode\":\"\",\"username\":\"admin\",\"checkCode\":\"\"}', '127.0.0.1', '2019-08-28 19:37:27', 'sesame');
INSERT INTO `sys_log` VALUES (7464176, 1, 'admin', 'normal', NULL, '/manager/index', '{}', '127.0.0.1', '2019-08-28 19:37:28', 'sesame');
INSERT INTO `sys_log` VALUES (7464177, 1, 'admin', 'normal', NULL, '/manager/main', '{}', '127.0.0.1', '2019-08-28 19:37:28', 'sesame');
INSERT INTO `sys_log` VALUES (7464178, 1, 'admin', 'normal', NULL, '/manager/oa/notify/message', '{}', '127.0.0.1', '2019-08-28 19:37:28', 'sesame');
INSERT INTO `sys_log` VALUES (7464179, 1, 'admin', 'normal', NULL, '/manager/main', '{}', '127.0.0.1', '2019-08-28 19:37:28', 'sesame');
INSERT INTO `sys_log` VALUES (7464180, 1, 'admin', 'normal', NULL, '/', '{}', '127.0.0.1', '2019-08-28 19:37:28', 'sesame');
INSERT INTO `sys_log` VALUES (7464181, 1, 'admin', 'normal', NULL, '/manager/sys/menu/', '{}', '127.0.0.1', '2019-08-28 19:38:00', 'sesame');
INSERT INTO `sys_log` VALUES (7464182, 1, 'admin', 'normal', NULL, '/manager/sys/menu/list', '{\"sort\":\"order_num\"}', '127.0.0.1', '2019-08-28 19:38:00', 'sesame');
INSERT INTO `sys_log` VALUES (7464183, 1, 'admin', 'normal', NULL, '/manager/sys/menu/edit/279', '{}', '127.0.0.1', '2019-08-28 19:38:03', 'sesame');
INSERT INTO `sys_log` VALUES (7464184, 1, 'admin', 'normal', NULL, '/manager/sys/menu/update', '{\"name\":\"资讯管理\",\"icon\":\"fa fa-envelope-o\",\"menuId\":\"279\",\"orderNum\":\"29\",\"perms\":\"\",\"type\":\"0\",\"parentId\":\"0\",\"url\":\"\"}', '127.0.0.1', '2019-08-28 19:38:20', 'sesame');
INSERT INTO `sys_log` VALUES (7464185, 1, 'admin', 'normal', NULL, '/manager/sys/menu/list', '{\"sort\":\"order_num\"}', '127.0.0.1', '2019-08-28 19:38:20', 'sesame');
INSERT INTO `sys_log` VALUES (7464186, -1, '获取用户信息为空', 'normal', NULL, '/manager/login;JSESSIONID=93309ee2-dbbf-468e-8654-996d41c8e4a8', '{}', '127.0.0.1', '2019-08-28 19:46:34', 'sesame');
INSERT INTO `sys_log` VALUES (7464187, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/get_information', '{\"type\":\"2\"}', '127.0.0.1', '2019-08-28 19:46:40', 'sesame');
INSERT INTO `sys_log` VALUES (7464188, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/get_information_detail', '{\"tid\":\"as6df4as3d2f1\"}', '127.0.0.1', '2019-08-28 19:48:03', 'sesame');
INSERT INTO `sys_log` VALUES (7464189, -1, '获取用户信息为空', 'normal', NULL, '/manager/login;JSESSIONID=93309ee2-dbbf-468e-8654-996d41c8e4a8', '{}', '127.0.0.1', '2019-08-29 09:43:34', 'sesame');
INSERT INTO `sys_log` VALUES (7464190, -1, '获取用户信息为空', 'normal', NULL, '/manager/login;JSESSIONID=93309ee2-dbbf-468e-8654-996d41c8e4a8', '{}', '127.0.0.1', '2019-08-29 09:43:36', 'sesame');
INSERT INTO `sys_log` VALUES (7464191, -1, '获取用户信息为空', 'normal', NULL, '/manager/login;JSESSIONID=93309ee2-dbbf-468e-8654-996d41c8e4a8', '{}', '127.0.0.1', '2019-08-29 09:43:38', 'sesame');
INSERT INTO `sys_log` VALUES (7464192, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/login', '{\"loginPass\":\"aaa111111\",\"email\":\"27592285@qq.com\"}', '127.0.0.1', '2019-08-29 20:56:51', 'sesame');
INSERT INTO `sys_log` VALUES (7464193, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/login', '{\"loginPass\":\"aaa111111\",\"email\":\"27592285@qq.com\"}', '127.0.0.1', '2019-08-29 20:59:32', 'sesame');
INSERT INTO `sys_log` VALUES (7464194, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/login', '{\"loginPass\":\"aaa111111\",\"email\":\"27592285@qq.com\"}', '127.0.0.1', '2019-08-29 21:15:53', 'sesame');
INSERT INTO `sys_log` VALUES (7464195, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/login', '{\"loginPass\":\"aaa111111\",\"email\":\"27592285@qq.com\"}', '127.0.0.1', '2019-08-29 21:21:56', 'sesame');
INSERT INTO `sys_log` VALUES (7464196, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/login', '{\"loginPass\":\"aaa111111\",\"email\":\"27592285@qq.com\"}', '127.0.0.1', '2019-08-29 21:22:39', 'sesame');
INSERT INTO `sys_log` VALUES (7464197, NULL, NULL, 'error', NULL, 'http://localhost:8081/api/app/pc/login', 'java.lang.IllegalArgumentException: No enum constant com.common.utils.i18n.LanguageEnum.ens', NULL, '2019-08-29 21:22:59', NULL);
INSERT INTO `sys_log` VALUES (7464198, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/login', '{\"loginPass\":\"aaa111111\",\"email\":\"27592285@qq.com\"}', '127.0.0.1', '2019-08-29 21:22:59', 'sesame');
INSERT INTO `sys_log` VALUES (7464199, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/login', '{\"loginPass\":\"aaa111111\"}', '127.0.0.1', '2019-08-29 21:33:43', 'sesame');
INSERT INTO `sys_log` VALUES (7464200, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/login', '{\"loginPass\":\"aaa111111\"}', '127.0.0.1', '2019-08-29 21:35:19', 'sesame');
INSERT INTO `sys_log` VALUES (7464201, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/login', '{\"loginPass\":\"aaa111111\"}', '127.0.0.1', '2019-08-29 21:35:43', 'sesame');
INSERT INTO `sys_log` VALUES (7464202, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/login', '{\"loginPass\":\"aaa111111\"}', '127.0.0.1', '2019-08-29 21:36:37', 'sesame');
INSERT INTO `sys_log` VALUES (7464203, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/login', '{\"loginPass\":\"aaa111111\"}', '127.0.0.1', '2019-08-29 21:37:09', 'sesame');
INSERT INTO `sys_log` VALUES (7464204, -1, '获取用户信息为空', 'normal', NULL, '/manager/login;JSESSIONID=f5b2140e-2c3b-479b-8ab8-d3aabb3f1545', '{}', '127.0.0.1', '2019-09-02 11:32:23', 'sesame');
INSERT INTO `sys_log` VALUES (7464205, 1, 'admin', 'normal', NULL, '/manager/login', '{\"password\":\"123456\",\"mobileCheckCode\":\"\",\"username\":\"admin\",\"checkCode\":\"\"}', '127.0.0.1', '2019-09-02 11:33:00', 'sesame');
INSERT INTO `sys_log` VALUES (7464206, 1, 'admin', 'normal', NULL, '/manager/index', '{}', '127.0.0.1', '2019-09-02 11:33:01', 'sesame');
INSERT INTO `sys_log` VALUES (7464207, 1, 'admin', 'normal', NULL, '/manager/main', '{}', '127.0.0.1', '2019-09-02 11:33:01', 'sesame');
INSERT INTO `sys_log` VALUES (7464208, 1, 'admin', 'normal', NULL, '/manager/oa/notify/message', '{}', '127.0.0.1', '2019-09-02 11:33:01', 'sesame');
INSERT INTO `sys_log` VALUES (7464209, 1, 'admin', 'normal', NULL, '/manager/main', '{}', '127.0.0.1', '2019-09-02 11:33:01', 'sesame');
INSERT INTO `sys_log` VALUES (7464210, 1, 'admin', 'normal', NULL, '/', '{}', '127.0.0.1', '2019-09-02 11:33:01', 'sesame');
INSERT INTO `sys_log` VALUES (7464211, 1, 'admin', 'normal', NULL, '/manager/common/generator', '{}', '127.0.0.1', '2019-09-02 11:33:15', 'sesame');
INSERT INTO `sys_log` VALUES (7464212, 1, 'admin', 'normal', NULL, '/manager/common/generator/list', '{}', '127.0.0.1', '2019-09-02 11:33:15', 'sesame');
INSERT INTO `sys_log` VALUES (7464213, 1, 'admin', 'normal', NULL, '/manager/common/generator/code/t_sw_current_user', '{}', '127.0.0.1', '2019-09-02 11:33:27', 'sesame');
INSERT INTO `sys_log` VALUES (7464214, 1, 'admin', 'normal', NULL, '/manager/common/generator/code/t_sw_evangelist_user', '{}', '127.0.0.1', '2019-09-02 11:36:56', 'sesame');
INSERT INTO `sys_log` VALUES (7464215, 1, 'admin', 'normal', NULL, '/manager/common/generator/code/t_sw_partner_user', '{}', '127.0.0.1', '2019-09-02 11:38:30', 'sesame');
INSERT INTO `sys_log` VALUES (7464216, 1, 'admin', 'normal', NULL, '/manager/common/generator/code/t_sw_period_user', '{}', '127.0.0.1', '2019-09-02 11:39:40', 'sesame');
INSERT INTO `sys_log` VALUES (7464217, 1, 'admin', 'normal', NULL, '/manager/common/generator/code/t_sw_principal_user', '{}', '127.0.0.1', '2019-09-02 11:42:11', 'sesame');
INSERT INTO `sys_log` VALUES (7464218, -1, '获取用户信息为空', 'normal', NULL, '/manager/login;JSESSIONID=5e3573ea-5e74-4e14-841f-2a6bd166ce72', '{}', '127.0.0.1', '2019-09-03 15:51:41', 'sesame');
INSERT INTO `sys_log` VALUES (7464219, 1, 'admin', 'normal', NULL, '/manager/login', '{\"password\":\"123456\",\"mobileCheckCode\":\"\",\"username\":\"admin\",\"checkCode\":\"\"}', '127.0.0.1', '2019-09-03 15:51:44', 'sesame');
INSERT INTO `sys_log` VALUES (7464220, 1, 'admin', 'normal', NULL, '/manager/index', '{}', '127.0.0.1', '2019-09-03 15:51:45', 'sesame');
INSERT INTO `sys_log` VALUES (7464221, 1, 'admin', 'normal', NULL, '/manager/main', '{}', '127.0.0.1', '2019-09-03 15:51:45', 'sesame');
INSERT INTO `sys_log` VALUES (7464222, 1, 'admin', 'normal', NULL, '/manager/oa/notify/message', '{}', '127.0.0.1', '2019-09-03 15:51:45', 'sesame');
INSERT INTO `sys_log` VALUES (7464223, 1, 'admin', 'normal', NULL, '/manager/main', '{}', '127.0.0.1', '2019-09-03 15:51:45', 'sesame');
INSERT INTO `sys_log` VALUES (7464224, 1, 'admin', 'normal', NULL, '/', '{}', '127.0.0.1', '2019-09-03 15:51:45', 'sesame');
INSERT INTO `sys_log` VALUES (7464225, 1, 'admin', 'normal', NULL, '/manager/common/generator', '{}', '127.0.0.1', '2019-09-03 15:51:49', 'sesame');
INSERT INTO `sys_log` VALUES (7464226, 1, 'admin', 'normal', NULL, '/manager/common/generator/list', '{}', '127.0.0.1', '2019-09-03 15:51:49', 'sesame');
INSERT INTO `sys_log` VALUES (7464227, 1, 'admin', 'normal', NULL, '/manager/common/generator/code/t_sw_evangelist_user', '{}', '127.0.0.1', '2019-09-03 15:52:01', 'sesame');
INSERT INTO `sys_log` VALUES (7464228, 1, 'admin', 'normal', NULL, '/manager/common/generator/code/t_sw_partner_user', '{}', '127.0.0.1', '2019-09-03 16:20:41', 'sesame');
INSERT INTO `sys_log` VALUES (7464229, 1, 'admin', 'normal', NULL, '/manager/common/generator/code/t_sw_principal_user', '{}', '127.0.0.1', '2019-09-03 16:25:41', 'sesame');
INSERT INTO `sys_log` VALUES (7464230, -1, '获取用户信息为空', 'normal', NULL, '/manager/login;JSESSIONID=e9642432-04bd-4235-bc7d-4cbebe146f13', '{}', '127.0.0.1', '2019-09-03 16:50:35', 'sesame');
INSERT INTO `sys_log` VALUES (7464231, 1, 'admin', 'normal', NULL, '/manager/login', '{\"password\":\"123456\",\"mobileCheckCode\":\"\",\"username\":\"admin\",\"checkCode\":\"\"}', '127.0.0.1', '2019-09-03 16:50:39', 'sesame');
INSERT INTO `sys_log` VALUES (7464232, 1, 'admin', 'normal', NULL, '/manager/index', '{}', '127.0.0.1', '2019-09-03 16:50:39', 'sesame');
INSERT INTO `sys_log` VALUES (7464233, 1, 'admin', 'normal', NULL, '/manager/main', '{}', '127.0.0.1', '2019-09-03 16:50:39', 'sesame');
INSERT INTO `sys_log` VALUES (7464234, 1, 'admin', 'normal', NULL, '/manager/oa/notify/message', '{}', '127.0.0.1', '2019-09-03 16:50:39', 'sesame');
INSERT INTO `sys_log` VALUES (7464235, 1, 'admin', 'normal', NULL, '/manager/main', '{}', '127.0.0.1', '2019-09-03 16:50:39', 'sesame');
INSERT INTO `sys_log` VALUES (7464236, 1, 'admin', 'normal', NULL, '/', '{}', '127.0.0.1', '2019-09-03 16:50:39', 'sesame');
INSERT INTO `sys_log` VALUES (7464237, 1, 'admin', 'normal', NULL, '/manager/sys/menu/', '{}', '127.0.0.1', '2019-09-03 16:50:51', 'sesame');
INSERT INTO `sys_log` VALUES (7464238, 1, 'admin', 'normal', NULL, '/manager/sys/menu/list', '{\"sort\":\"order_num\"}', '127.0.0.1', '2019-09-03 16:50:52', 'sesame');
INSERT INTO `sys_log` VALUES (7464239, 1, 'admin', 'normal', NULL, '/manager/sys/menu/add/109', '{}', '127.0.0.1', '2019-09-03 16:50:56', 'sesame');
INSERT INTO `sys_log` VALUES (7464240, 1, 'admin', 'normal', NULL, '/manager/sys/menu/save', '{\"name\":\"规则列表\",\"icon\":\"\",\"orderNum\":\"2\",\"perms\":\"get:swRewardRule:swRewardRule\",\"type\":\"1\",\"parentId\":\"109\",\"url\":\"/manager/get/swRewardRule\"}', '127.0.0.1', '2019-09-03 16:52:24', 'sesame');
INSERT INTO `sys_log` VALUES (7464241, 1, 'admin', 'normal', NULL, '/manager/sys/menu/list', '{\"sort\":\"order_num\"}', '127.0.0.1', '2019-09-03 16:52:25', 'sesame');
INSERT INTO `sys_log` VALUES (7464242, 1, 'admin', 'normal', NULL, '/manager/sys/menu/add/284', '{}', '127.0.0.1', '2019-09-03 16:52:52', 'sesame');
INSERT INTO `sys_log` VALUES (7464243, 1, 'admin', 'normal', NULL, '/manager/sys/menu/save', '{\"name\":\"添加\",\"icon\":\"\",\"orderNum\":\"1\",\"perms\":\"get:swRewardRule:add\",\"type\":\"2\",\"parentId\":\"284\",\"url\":\"\"}', '127.0.0.1', '2019-09-03 16:53:02', 'sesame');
INSERT INTO `sys_log` VALUES (7464244, 1, 'admin', 'normal', NULL, '/manager/sys/menu/list', '{\"sort\":\"order_num\"}', '127.0.0.1', '2019-09-03 16:53:02', 'sesame');
INSERT INTO `sys_log` VALUES (7464245, 1, 'admin', 'normal', NULL, '/manager/sys/menu/add/284', '{}', '127.0.0.1', '2019-09-03 16:53:14', 'sesame');
INSERT INTO `sys_log` VALUES (7464246, 1, 'admin', 'normal', NULL, '/manager/sys/menu/save', '{\"name\":\"更新\",\"icon\":\"\",\"orderNum\":\"2\",\"perms\":\"get:swRewardRule:edit\",\"type\":\"2\",\"parentId\":\"284\",\"url\":\"\"}', '127.0.0.1', '2019-09-03 16:53:25', 'sesame');
INSERT INTO `sys_log` VALUES (7464247, 1, 'admin', 'normal', NULL, '/manager/sys/menu/list', '{\"sort\":\"order_num\"}', '127.0.0.1', '2019-09-03 16:53:25', 'sesame');
INSERT INTO `sys_log` VALUES (7464248, 1, 'admin', 'normal', NULL, '/manager/sys/menu/add/284', '{}', '127.0.0.1', '2019-09-03 16:53:34', 'sesame');
INSERT INTO `sys_log` VALUES (7464249, 1, 'admin', 'normal', NULL, '/manager/sys/menu/save', '{\"name\":\"删除\",\"icon\":\"\",\"orderNum\":\"3\",\"perms\":\"get:swRewardRule:remove\",\"type\":\"2\",\"parentId\":\"284\",\"url\":\"\"}', '127.0.0.1', '2019-09-03 16:53:40', 'sesame');
INSERT INTO `sys_log` VALUES (7464250, 1, 'admin', 'normal', NULL, '/manager/sys/menu/list', '{\"sort\":\"order_num\"}', '127.0.0.1', '2019-09-03 16:53:40', 'sesame');
INSERT INTO `sys_log` VALUES (7464251, 1, 'admin', 'normal', NULL, '/manager/sys/menu/add/109', '{}', '127.0.0.1', '2019-09-03 16:53:58', 'sesame');
INSERT INTO `sys_log` VALUES (7464252, 1, 'admin', 'normal', NULL, '/manager/sys/menu/save', '{\"name\":\"规则详情\",\"icon\":\"\",\"orderNum\":\"3\",\"perms\":\"/manager/get/swRuleDetail\",\"type\":\"1\",\"parentId\":\"109\",\"url\":\"\"}', '127.0.0.1', '2019-09-03 16:54:13', 'sesame');
INSERT INTO `sys_log` VALUES (7464253, 1, 'admin', 'normal', NULL, '/manager/sys/menu/list', '{\"sort\":\"order_num\"}', '127.0.0.1', '2019-09-03 16:54:13', 'sesame');
INSERT INTO `sys_log` VALUES (7464254, 1, 'admin', 'normal', NULL, '/manager/sys/menu/edit/288', '{}', '127.0.0.1', '2019-09-03 16:54:22', 'sesame');
INSERT INTO `sys_log` VALUES (7464255, 1, 'admin', 'normal', NULL, '/manager/sys/menu/update', '{\"name\":\"规则详情\",\"icon\":\"\",\"menuId\":\"288\",\"orderNum\":\"3\",\"perms\":\"get:swRuleDetail:swRuleDetail\",\"type\":\"1\",\"parentId\":\"109\",\"url\":\"/manager/get/swRuleDetail\"}', '127.0.0.1', '2019-09-03 16:54:37', 'sesame');
INSERT INTO `sys_log` VALUES (7464256, 1, 'admin', 'normal', NULL, '/manager/sys/menu/list', '{\"sort\":\"order_num\"}', '127.0.0.1', '2019-09-03 16:54:37', 'sesame');
INSERT INTO `sys_log` VALUES (7464257, 1, 'admin', 'normal', NULL, '/manager/sys/menu/add/288', '{}', '127.0.0.1', '2019-09-03 16:54:47', 'sesame');
INSERT INTO `sys_log` VALUES (7464258, 1, 'admin', 'normal', NULL, '/manager/sys/menu/save', '{\"name\":\"添加\",\"icon\":\"\",\"orderNum\":\"1\",\"perms\":\"get:swRuleDetail:add\",\"type\":\"2\",\"parentId\":\"288\",\"url\":\"\"}', '127.0.0.1', '2019-09-03 16:54:54', 'sesame');
INSERT INTO `sys_log` VALUES (7464259, 1, 'admin', 'normal', NULL, '/manager/sys/menu/list', '{\"sort\":\"order_num\"}', '127.0.0.1', '2019-09-03 16:54:54', 'sesame');
INSERT INTO `sys_log` VALUES (7464260, 1, 'admin', 'normal', NULL, '/manager/sys/menu/add/288', '{}', '127.0.0.1', '2019-09-03 16:55:03', 'sesame');
INSERT INTO `sys_log` VALUES (7464261, 1, 'admin', 'normal', NULL, '/manager/sys/menu/save', '{\"name\":\"更新\",\"icon\":\"\",\"orderNum\":\"2\",\"perms\":\"get:swRuleDetail:edit\",\"type\":\"2\",\"parentId\":\"288\",\"url\":\"\"}', '127.0.0.1', '2019-09-03 16:55:09', 'sesame');
INSERT INTO `sys_log` VALUES (7464262, 1, 'admin', 'normal', NULL, '/manager/sys/menu/list', '{\"sort\":\"order_num\"}', '127.0.0.1', '2019-09-03 16:55:09', 'sesame');
INSERT INTO `sys_log` VALUES (7464263, 1, 'admin', 'normal', NULL, '/manager/sys/menu/add/288', '{}', '127.0.0.1', '2019-09-03 16:55:17', 'sesame');
INSERT INTO `sys_log` VALUES (7464264, 1, 'admin', 'normal', NULL, '/manager/sys/menu/save', '{\"name\":\"删除\",\"icon\":\"\",\"orderNum\":\"3\",\"perms\":\"get:swRuleDetail:remove\",\"type\":\"2\",\"parentId\":\"288\",\"url\":\"\"}', '127.0.0.1', '2019-09-03 16:55:22', 'sesame');
INSERT INTO `sys_log` VALUES (7464265, 1, 'admin', 'normal', NULL, '/manager/sys/menu/list', '{\"sort\":\"order_num\"}', '127.0.0.1', '2019-09-03 16:55:22', 'sesame');
INSERT INTO `sys_log` VALUES (7464266, 1, 'admin', 'normal', NULL, '/manager/sys/role', '{}', '127.0.0.1', '2019-09-03 16:55:24', 'sesame');
INSERT INTO `sys_log` VALUES (7464267, 1, 'admin', 'normal', NULL, '/manager/sys/role/list', '{}', '127.0.0.1', '2019-09-03 16:55:24', 'sesame');
INSERT INTO `sys_log` VALUES (7464268, 1, 'admin', 'normal', NULL, '/manager/sys/role/edit/1', '{}', '127.0.0.1', '2019-09-03 16:55:25', 'sesame');
INSERT INTO `sys_log` VALUES (7464269, 1, 'admin', 'normal', NULL, '/manager/sys/menu/tree/1', '{}', '127.0.0.1', '2019-09-03 16:55:25', 'sesame');
INSERT INTO `sys_log` VALUES (7464270, 1, 'admin', 'normal', NULL, '/manager/sys/role/update', '{\"roleId\":\"1\",\"roleName\":\"开发管理员角色\",\"remark\":\"拥有最高权限\",\"menuIds\":\"283,282,281,278,277,273,205,92,57,30,29,28,206,118,48,209,207,203,76,75,74,62,56,55,15,26,25,24,14,13,12,61,22,21,20,83,81,80,79,71,280,279,276,274,272,204,27,91,77,202,73,7,6,2,3,78,1,288,291,290,289,284,287,286,285,109,-1\"}', '127.0.0.1', '2019-09-03 16:55:29', 'sesame');
INSERT INTO `sys_log` VALUES (7464271, 1, 'admin', 'normal', NULL, '/manager/sys/role/list', '{}', '127.0.0.1', '2019-09-03 16:55:29', 'sesame');
INSERT INTO `sys_log` VALUES (7464272, -1, '获取用户信息为空', 'normal', NULL, '/manager/logout', '{}', '127.0.0.1', '2019-09-03 16:55:31', 'sesame');
INSERT INTO `sys_log` VALUES (7464273, -1, '获取用户信息为空', 'normal', NULL, '/manager/login;JSESSIONID=6046e7ad-cb84-4dc3-b649-4a5166f6a9b3', '{}', '127.0.0.1', '2019-09-03 16:55:31', 'sesame');
INSERT INTO `sys_log` VALUES (7464274, 1, 'admin', 'normal', NULL, '/manager/login', '{\"password\":\"123456\",\"mobileCheckCode\":\"\",\"username\":\"admin\",\"checkCode\":\"\"}', '127.0.0.1', '2019-09-03 16:55:32', 'sesame');
INSERT INTO `sys_log` VALUES (7464275, 1, 'admin', 'normal', NULL, '/manager/index', '{}', '127.0.0.1', '2019-09-03 16:55:32', 'sesame');
INSERT INTO `sys_log` VALUES (7464276, 1, 'admin', 'normal', NULL, '/manager/main', '{}', '127.0.0.1', '2019-09-03 16:55:32', 'sesame');
INSERT INTO `sys_log` VALUES (7464277, 1, 'admin', 'normal', NULL, '/manager/oa/notify/message', '{}', '127.0.0.1', '2019-09-03 16:55:32', 'sesame');
INSERT INTO `sys_log` VALUES (7464278, 1, 'admin', 'normal', NULL, '/manager/main', '{}', '127.0.0.1', '2019-09-03 16:55:32', 'sesame');
INSERT INTO `sys_log` VALUES (7464279, 1, 'admin', 'normal', NULL, '/', '{}', '127.0.0.1', '2019-09-03 16:55:32', 'sesame');
INSERT INTO `sys_log` VALUES (7464280, 1, 'admin', 'normal', NULL, '/manager/get/swRewardRule', '{}', '127.0.0.1', '2019-09-03 16:55:36', 'sesame');
INSERT INTO `sys_log` VALUES (7464281, 1, 'admin', 'normal', NULL, '/manager/get/swRewardRule/list', '{}', '127.0.0.1', '2019-09-03 16:55:36', 'sesame');
INSERT INTO `sys_log` VALUES (7464282, 1, 'admin', 'normal', NULL, '/manager/get/swRewardRule/list', '{}', '127.0.0.1', '2019-09-03 16:55:36', 'sesame');
INSERT INTO `sys_log` VALUES (7464283, 1, 'admin', 'normal', NULL, '/manager/get/swRuleDetail', '{}', '127.0.0.1', '2019-09-03 16:55:37', 'sesame');
INSERT INTO `sys_log` VALUES (7464284, 1, 'admin', 'normal', NULL, '/manager/get/swRewardRule/queryAll', '{}', '127.0.0.1', '2019-09-03 16:55:37', 'sesame');
INSERT INTO `sys_log` VALUES (7464285, 1, 'admin', 'normal', NULL, '/manager/get/swRuleDetail/list', '{}', '127.0.0.1', '2019-09-03 16:55:37', 'sesame');
INSERT INTO `sys_log` VALUES (7464286, 1, 'admin', 'normal', NULL, '/manager/get/swRewardRule/add', '{}', '127.0.0.1', '2019-09-03 16:55:39', 'sesame');
INSERT INTO `sys_log` VALUES (7464287, 1, 'admin', 'normal', NULL, '/manager/get/swRewardRule/save', '{\"name\":\"给上级加速规则\",\"remark\":\"\",\"type\":\"1\",\"status\":\"0\"}', '127.0.0.1', '2019-09-03 16:56:10', 'sesame');
INSERT INTO `sys_log` VALUES (7464288, 1, 'admin', 'normal', NULL, '/manager/get/swRewardRule/list', '{}', '127.0.0.1', '2019-09-03 16:56:10', 'sesame');
INSERT INTO `sys_log` VALUES (7464289, 1, 'admin', 'normal', NULL, '/manager/get/swRuleDetail/add', '{}', '127.0.0.1', '2019-09-03 16:56:16', 'sesame');
INSERT INTO `sys_log` VALUES (7464290, 1, 'admin', 'normal', NULL, '/manager/get/swRewardRule/queryAll', '{}', '127.0.0.1', '2019-09-03 16:56:16', 'sesame');
INSERT INTO `sys_log` VALUES (7464291, 1, 'admin', 'error', NULL, 'http://localhost:8081/manager/get/swRuleDetail/save', 'org.springframework.dao.DataIntegrityViolationException: \r\n### Error updating database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Column \'tid\' cannot be null\r\n### The error may involve com.get.dao.SwRuleDetailDao.save-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into t_sw_rule_detail         (                                     `tid`,                                                  `rule_id`,                                                  `level`,                                                  `type`,                                                  `value`,                                                  `ex1`,                                                  `ex2`,                                                  `ex3`,                                                  `create_date`,                                                  `update_date`,                                                  `del_flag`                             )         values         (                                     ?,                                                  ?,                                                  ?,                                                  ?,                                                  ?,                                                  ?,                                                  ?,                                                  ?,                                                  ?,                                                  ?,                                                  ?                             )\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Column \'tid\' cannot be null\n; ]; Column \'tid\' cannot be null; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Column \'tid\' cannot be null', NULL, '2019-09-03 16:58:25', NULL);
INSERT INTO `sys_log` VALUES (7464292, 1, 'admin', 'normal', NULL, '/manager/get/swRuleDetail/save', '{\"level\":\"1\",\"ruleId\":\"9a5da7e1e7554b7dbffefed7e49eaad3\",\"value\":\"0.05\"}', '127.0.0.1', '2019-09-03 16:58:25', 'sesame');
INSERT INTO `sys_log` VALUES (7464293, -1, '获取用户信息为空', 'normal', NULL, '/manager/login;JSESSIONID=56896ad3-5197-466b-9dfc-613666a8535c', '{}', '127.0.0.1', '2019-09-03 17:00:55', 'sesame');
INSERT INTO `sys_log` VALUES (7464294, 1, 'admin', 'normal', NULL, '/manager/login', '{\"password\":\"123456\",\"mobileCheckCode\":\"\",\"username\":\"admin\",\"checkCode\":\"\"}', '127.0.0.1', '2019-09-03 17:00:57', 'sesame');
INSERT INTO `sys_log` VALUES (7464295, 1, 'admin', 'normal', NULL, '/manager/index', '{}', '127.0.0.1', '2019-09-03 17:00:57', 'sesame');
INSERT INTO `sys_log` VALUES (7464296, 1, 'admin', 'normal', NULL, '/manager/main', '{}', '127.0.0.1', '2019-09-03 17:00:57', 'sesame');
INSERT INTO `sys_log` VALUES (7464297, 1, 'admin', 'normal', NULL, '/manager/oa/notify/message', '{}', '127.0.0.1', '2019-09-03 17:00:57', 'sesame');
INSERT INTO `sys_log` VALUES (7464298, 1, 'admin', 'normal', NULL, '/manager/main', '{}', '127.0.0.1', '2019-09-03 17:00:57', 'sesame');
INSERT INTO `sys_log` VALUES (7464299, 1, 'admin', 'normal', NULL, '/', '{}', '127.0.0.1', '2019-09-03 17:00:58', 'sesame');
INSERT INTO `sys_log` VALUES (7464300, 1, 'admin', 'normal', NULL, '/manager/get/swRuleDetail', '{}', '127.0.0.1', '2019-09-03 17:01:00', 'sesame');
INSERT INTO `sys_log` VALUES (7464301, 1, 'admin', 'normal', NULL, '/manager/get/swRewardRule/queryAll', '{}', '127.0.0.1', '2019-09-03 17:01:00', 'sesame');
INSERT INTO `sys_log` VALUES (7464302, 1, 'admin', 'normal', NULL, '/manager/get/swRuleDetail/list', '{}', '127.0.0.1', '2019-09-03 17:01:00', 'sesame');
INSERT INTO `sys_log` VALUES (7464303, 1, 'admin', 'normal', NULL, '/manager/get/swRuleDetail/add', '{}', '127.0.0.1', '2019-09-03 17:01:01', 'sesame');
INSERT INTO `sys_log` VALUES (7464304, 1, 'admin', 'normal', NULL, '/manager/get/swRewardRule/queryAll', '{}', '127.0.0.1', '2019-09-03 17:01:01', 'sesame');
INSERT INTO `sys_log` VALUES (7464305, 1, 'admin', 'normal', NULL, '/manager/get/swRuleDetail/save', '{\"level\":\"1\",\"ruleId\":\"9a5da7e1e7554b7dbffefed7e49eaad3\",\"value\":\"0.05\"}', '127.0.0.1', '2019-09-03 17:01:08', 'sesame');
INSERT INTO `sys_log` VALUES (7464306, 1, 'admin', 'normal', NULL, '/manager/get/swRuleDetail/list', '{}', '127.0.0.1', '2019-09-03 17:01:08', 'sesame');
INSERT INTO `sys_log` VALUES (7464307, 1, 'admin', 'normal', NULL, '/manager/get/swRuleDetail/edit/3ac5183837d843628bb9e28205ce5c17', '{}', '127.0.0.1', '2019-09-03 17:01:16', 'sesame');
INSERT INTO `sys_log` VALUES (7464308, 1, 'admin', 'normal', NULL, '/manager/get/swRuleDetail/add', '{}', '127.0.0.1', '2019-09-03 17:01:21', 'sesame');
INSERT INTO `sys_log` VALUES (7464309, 1, 'admin', 'normal', NULL, '/manager/get/swRewardRule/queryAll', '{}', '127.0.0.1', '2019-09-03 17:01:21', 'sesame');
INSERT INTO `sys_log` VALUES (7464310, 1, 'admin', 'normal', NULL, '/manager/get/swRuleDetail/save', '{\"level\":\"2\",\"ruleId\":\"9a5da7e1e7554b7dbffefed7e49eaad3\",\"value\":\"0.1\"}', '127.0.0.1', '2019-09-03 17:01:28', 'sesame');
INSERT INTO `sys_log` VALUES (7464311, 1, 'admin', 'normal', NULL, '/manager/get/swRuleDetail/list', '{}', '127.0.0.1', '2019-09-03 17:01:28', 'sesame');
INSERT INTO `sys_log` VALUES (7464312, 1, 'admin', 'normal', NULL, '/manager/get/swRuleDetail/add', '{}', '127.0.0.1', '2019-09-03 17:01:30', 'sesame');
INSERT INTO `sys_log` VALUES (7464313, 1, 'admin', 'normal', NULL, '/manager/get/swRewardRule/queryAll', '{}', '127.0.0.1', '2019-09-03 17:01:30', 'sesame');
INSERT INTO `sys_log` VALUES (7464314, 1, 'admin', 'normal', NULL, '/manager/get/swRuleDetail/save', '{\"level\":\"3\",\"ruleId\":\"9a5da7e1e7554b7dbffefed7e49eaad3\",\"value\":\"0.15\"}', '127.0.0.1', '2019-09-03 17:01:37', 'sesame');
INSERT INTO `sys_log` VALUES (7464315, 1, 'admin', 'normal', NULL, '/manager/get/swRuleDetail/list', '{}', '127.0.0.1', '2019-09-03 17:01:37', 'sesame');
INSERT INTO `sys_log` VALUES (7464316, 1, 'admin', 'normal', NULL, '/manager/get/swRewardRule', '{}', '127.0.0.1', '2019-09-03 17:01:45', 'sesame');
INSERT INTO `sys_log` VALUES (7464317, 1, 'admin', 'normal', NULL, '/manager/get/swRewardRule/list', '{}', '127.0.0.1', '2019-09-03 17:01:45', 'sesame');
INSERT INTO `sys_log` VALUES (7464318, 1, 'admin', 'normal', NULL, '/manager/get/swRewardRule/list', '{}', '127.0.0.1', '2019-09-03 17:01:45', 'sesame');
INSERT INTO `sys_log` VALUES (7464319, 1, 'admin', 'normal', NULL, '/manager/get/swRewardRule/update', '{\"tid\":\"9a5da7e1e7554b7dbffefed7e49eaad3\",\"status\":\"1\"}', '127.0.0.1', '2019-09-03 17:03:24', 'sesame');
INSERT INTO `sys_log` VALUES (7464320, 1, 'admin', 'normal', NULL, '/manager/get/swRewardRule/update', '{\"tid\":\"9a5da7e1e7554b7dbffefed7e49eaad3\",\"status\":\"0\"}', '127.0.0.1', '2019-09-03 17:03:25', 'sesame');
INSERT INTO `sys_log` VALUES (7464321, 1, 'admin', 'normal', NULL, '/manager/get/swRewardRule/update', '{\"tid\":\"9a5da7e1e7554b7dbffefed7e49eaad3\",\"status\":\"1\"}', '127.0.0.1', '2019-09-03 17:03:36', 'sesame');
INSERT INTO `sys_log` VALUES (7464322, 1, 'admin', 'normal', NULL, '/manager/get/swRewardRule/update', '{\"tid\":\"9a5da7e1e7554b7dbffefed7e49eaad3\",\"status\":\"0\"}', '127.0.0.1', '2019-09-03 17:03:37', 'sesame');
INSERT INTO `sys_log` VALUES (7464323, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/get_email_check_code', '{\"email\":\"27592285@sse.com\"}', '127.0.0.1', '2019-09-05 11:25:12', 'sesame');
INSERT INTO `sys_log` VALUES (7464324, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/checkRegister', '{\"loginPass\":\"aaa000000\",\"email\":\"27592285@sse.com\",\"recomId\":\"104398\",\"checkCode\":\"1726\"}', '127.0.0.1', '2019-09-05 11:26:06', 'sesame');
INSERT INTO `sys_log` VALUES (7464325, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/register', '{\"loginPass\":\"aaa000000\",\"email\":\"27592285@sse.com\",\"recomId\":\"104398\",\"checkCode\":\"1726\"}', '127.0.0.1', '2019-09-05 11:28:00', 'sesame');
INSERT INTO `sys_log` VALUES (7464326, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/get_email_check_code', '{\"email\":\"27592285@ssf.com\"}', '127.0.0.1', '2019-09-05 11:31:44', 'sesame');
INSERT INTO `sys_log` VALUES (7464327, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/register', '{\"loginPass\":\"aaa000000\",\"email\":\"27592285@ssf.com\",\"recomId\":\"104398\",\"checkCode\":\"6912\"}', '127.0.0.1', '2019-09-05 11:32:36', 'sesame');
INSERT INTO `sys_log` VALUES (7464328, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/get_email_check_code', '{\"email\":\"27592285@ssg.com\"}', '127.0.0.1', '2019-09-05 11:40:10', 'sesame');
INSERT INTO `sys_log` VALUES (7464329, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/register', '{\"loginPass\":\"aaa000000\",\"email\":\"27592285@ssg.com\",\"recomId\":\"104398\",\"checkCode\":\"3394\"}', '127.0.0.1', '2019-09-05 11:43:04', 'sesame');
INSERT INTO `sys_log` VALUES (7464330, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/get_email_check_code', '{\"email\":\"27592285@ssa.com\"}', '127.0.0.1', '2019-09-05 11:43:38', 'sesame');
INSERT INTO `sys_log` VALUES (7464331, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/register', '{\"loginPass\":\"aaa000000\",\"email\":\"27592285@ssa.com\",\"recomId\":\"104398\",\"checkCode\":\"4686\"}', '127.0.0.1', '2019-09-05 11:44:33', 'sesame');
INSERT INTO `sys_log` VALUES (7464332, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/get_email_check_code', '{\"email\":\"27592285@ssq.com\"}', '127.0.0.1', '2019-09-05 11:44:57', 'sesame');
INSERT INTO `sys_log` VALUES (7464333, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/register', '{\"loginPass\":\"aaa000000\",\"email\":\"27592285@ssq.com\",\"recomId\":\"104398\",\"checkCode\":\"3116\"}', '127.0.0.1', '2019-09-05 11:46:05', 'sesame');
INSERT INTO `sys_log` VALUES (7464334, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/get_email_check_code', '{\"email\":\"27592285@ssw.com\"}', '127.0.0.1', '2019-09-05 11:47:38', 'sesame');
INSERT INTO `sys_log` VALUES (7464335, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/register', '{\"loginPass\":\"aaa000000\",\"email\":\"27592285@ssw.com\",\"recomId\":\"104398\",\"checkCode\":\"8144\"}', '127.0.0.1', '2019-09-05 11:48:16', 'sesame');
INSERT INTO `sys_log` VALUES (7464336, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/get_email_check_code', '{\"email\":\"27592285@ssr.com\"}', '127.0.0.1', '2019-09-05 11:53:15', 'sesame');
INSERT INTO `sys_log` VALUES (7464337, -1, '获取用户信息为空', 'normal', NULL, '/api/app/pc/register', '{\"loginPass\":\"aaa000000\",\"email\":\"27592285@ssr.com\",\"recomId\":\"104398\",\"checkCode\":\"1068\"}', '127.0.0.1', '2019-09-05 11:53:38', 'sesame');
INSERT INTO `sys_log` VALUES (7464338, -1, '获取用户信息为空', 'normal', NULL, '/manager/login;JSESSIONID=21f44977-3599-4368-953e-20048e3001c7', '{}', '127.0.0.1', '2019-09-05 15:48:20', 'sesame');
INSERT INTO `sys_log` VALUES (7464339, 1, 'admin', 'normal', NULL, '/manager/login', '{\"password\":\"123456\",\"mobileCheckCode\":\"\",\"username\":\"admin\",\"checkCode\":\"\"}', '127.0.0.1', '2019-09-05 15:48:22', 'sesame');
INSERT INTO `sys_log` VALUES (7464340, 1, 'admin', 'normal', NULL, '/manager/index', '{}', '127.0.0.1', '2019-09-05 15:48:22', 'sesame');
INSERT INTO `sys_log` VALUES (7464341, 1, 'admin', 'normal', NULL, '/manager/main', '{}', '127.0.0.1', '2019-09-05 15:48:22', 'sesame');
INSERT INTO `sys_log` VALUES (7464342, 1, 'admin', 'normal', NULL, '/manager/oa/notify/message', '{}', '127.0.0.1', '2019-09-05 15:48:22', 'sesame');
INSERT INTO `sys_log` VALUES (7464343, 1, 'admin', 'normal', NULL, '/manager/main', '{}', '127.0.0.1', '2019-09-05 15:48:22', 'sesame');
INSERT INTO `sys_log` VALUES (7464344, 1, 'admin', 'normal', NULL, '/', '{}', '127.0.0.1', '2019-09-05 15:48:23', 'sesame');
INSERT INTO `sys_log` VALUES (7464345, 1, 'admin', 'normal', NULL, '/manager/common/generator', '{}', '127.0.0.1', '2019-09-05 15:48:26', 'sesame');
INSERT INTO `sys_log` VALUES (7464346, 1, 'admin', 'normal', NULL, '/manager/common/generator/list', '{}', '127.0.0.1', '2019-09-05 15:48:26', 'sesame');
INSERT INTO `sys_log` VALUES (7464347, 1, 'admin', 'normal', NULL, '/manager/common/generator/code/t_sw_benchlog', '{}', '127.0.0.1', '2019-09-05 15:48:53', 'sesame');
INSERT INTO `sys_log` VALUES (7464348, 1, 'admin', 'normal', NULL, '/manager/common/generator/code/t_sw_benchmarking', '{}', '127.0.0.1', '2019-09-05 15:56:31', 'sesame');

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
) ENGINE = InnoDB AUTO_INCREMENT = 292 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单管理' ROW_FORMAT = Dynamic;

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
INSERT INTO `sys_menu` VALUES (274, 0, '资金管理', '', '', 0, 'fa fa-credit-card', 20, NULL, NULL);
INSERT INTO `sys_menu` VALUES (276, 274, '币种管理', '/manager/get/swCoinType', 'get:swCoinType:swCoinType', 1, '', 1, NULL, NULL);
INSERT INTO `sys_menu` VALUES (277, 276, '添加', '', 'get:swCoinType:add', 2, '', 1, NULL, NULL);
INSERT INTO `sys_menu` VALUES (278, 276, '更新', '', 'get:swCoinType:edit', 2, '', 2, NULL, NULL);
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
) ENGINE = InnoDB AUTO_INCREMENT = 7942 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色与菜单对应关系' ROW_FORMAT = Dynamic;

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
INSERT INTO `sys_role_menu` VALUES (7875, 1, 283);
INSERT INTO `sys_role_menu` VALUES (7876, 1, 282);
INSERT INTO `sys_role_menu` VALUES (7877, 1, 281);
INSERT INTO `sys_role_menu` VALUES (7878, 1, 278);
INSERT INTO `sys_role_menu` VALUES (7879, 1, 277);
INSERT INTO `sys_role_menu` VALUES (7880, 1, 273);
INSERT INTO `sys_role_menu` VALUES (7881, 1, 205);
INSERT INTO `sys_role_menu` VALUES (7882, 1, 92);
INSERT INTO `sys_role_menu` VALUES (7883, 1, 57);
INSERT INTO `sys_role_menu` VALUES (7884, 1, 30);
INSERT INTO `sys_role_menu` VALUES (7885, 1, 29);
INSERT INTO `sys_role_menu` VALUES (7886, 1, 28);
INSERT INTO `sys_role_menu` VALUES (7887, 1, 206);
INSERT INTO `sys_role_menu` VALUES (7888, 1, 118);
INSERT INTO `sys_role_menu` VALUES (7889, 1, 48);
INSERT INTO `sys_role_menu` VALUES (7890, 1, 209);
INSERT INTO `sys_role_menu` VALUES (7891, 1, 207);
INSERT INTO `sys_role_menu` VALUES (7892, 1, 203);
INSERT INTO `sys_role_menu` VALUES (7893, 1, 76);
INSERT INTO `sys_role_menu` VALUES (7894, 1, 75);
INSERT INTO `sys_role_menu` VALUES (7895, 1, 74);
INSERT INTO `sys_role_menu` VALUES (7896, 1, 62);
INSERT INTO `sys_role_menu` VALUES (7897, 1, 56);
INSERT INTO `sys_role_menu` VALUES (7898, 1, 55);
INSERT INTO `sys_role_menu` VALUES (7899, 1, 15);
INSERT INTO `sys_role_menu` VALUES (7900, 1, 26);
INSERT INTO `sys_role_menu` VALUES (7901, 1, 25);
INSERT INTO `sys_role_menu` VALUES (7902, 1, 24);
INSERT INTO `sys_role_menu` VALUES (7903, 1, 14);
INSERT INTO `sys_role_menu` VALUES (7904, 1, 13);
INSERT INTO `sys_role_menu` VALUES (7905, 1, 12);
INSERT INTO `sys_role_menu` VALUES (7906, 1, 61);
INSERT INTO `sys_role_menu` VALUES (7907, 1, 22);
INSERT INTO `sys_role_menu` VALUES (7908, 1, 21);
INSERT INTO `sys_role_menu` VALUES (7909, 1, 20);
INSERT INTO `sys_role_menu` VALUES (7910, 1, 83);
INSERT INTO `sys_role_menu` VALUES (7911, 1, 81);
INSERT INTO `sys_role_menu` VALUES (7912, 1, 80);
INSERT INTO `sys_role_menu` VALUES (7913, 1, 79);
INSERT INTO `sys_role_menu` VALUES (7914, 1, 71);
INSERT INTO `sys_role_menu` VALUES (7915, 1, 280);
INSERT INTO `sys_role_menu` VALUES (7916, 1, 279);
INSERT INTO `sys_role_menu` VALUES (7917, 1, 276);
INSERT INTO `sys_role_menu` VALUES (7918, 1, 274);
INSERT INTO `sys_role_menu` VALUES (7919, 1, 272);
INSERT INTO `sys_role_menu` VALUES (7920, 1, 204);
INSERT INTO `sys_role_menu` VALUES (7921, 1, 27);
INSERT INTO `sys_role_menu` VALUES (7922, 1, 91);
INSERT INTO `sys_role_menu` VALUES (7923, 1, 77);
INSERT INTO `sys_role_menu` VALUES (7924, 1, 202);
INSERT INTO `sys_role_menu` VALUES (7925, 1, 73);
INSERT INTO `sys_role_menu` VALUES (7926, 1, 7);
INSERT INTO `sys_role_menu` VALUES (7927, 1, 6);
INSERT INTO `sys_role_menu` VALUES (7928, 1, 2);
INSERT INTO `sys_role_menu` VALUES (7929, 1, 3);
INSERT INTO `sys_role_menu` VALUES (7930, 1, 78);
INSERT INTO `sys_role_menu` VALUES (7931, 1, 1);
INSERT INTO `sys_role_menu` VALUES (7932, 1, 288);
INSERT INTO `sys_role_menu` VALUES (7933, 1, 291);
INSERT INTO `sys_role_menu` VALUES (7934, 1, 290);
INSERT INTO `sys_role_menu` VALUES (7935, 1, 289);
INSERT INTO `sys_role_menu` VALUES (7936, 1, 284);
INSERT INTO `sys_role_menu` VALUES (7937, 1, 287);
INSERT INTO `sys_role_menu` VALUES (7938, 1, 286);
INSERT INTO `sys_role_menu` VALUES (7939, 1, 285);
INSERT INTO `sys_role_menu` VALUES (7940, 1, 109);
INSERT INTO `sys_role_menu` VALUES (7941, 1, -1);

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
INSERT INTO `t_mail_record` VALUES ('07d6c05219864c318d35703cc27521da', '1143178854@qq.com', '0001', 0, '2019-08-26 19:05:11', NULL, '0');
INSERT INTO `t_mail_record` VALUES ('1d31ad4cce4b44e282bd8ef45d8638e0', '27592285@ssq.com', '3116', 1, '2019-09-05 11:44:57', NULL, '0');
INSERT INTO `t_mail_record` VALUES ('2425899b873b4e83b2ba93b5610b5d64', '27592285@ssg.com', '3394', 1, '2019-09-05 11:40:10', NULL, '0');
INSERT INTO `t_mail_record` VALUES ('55ba54f062264000896a75db35243d40', '27592285@sse.com', '1726', 1, '2019-09-05 11:25:11', NULL, '0');
INSERT INTO `t_mail_record` VALUES ('7f7a727eb9a14694a4d3d7e7c177e6bb', '27592285@ssw.com', '8144', 1, '2019-09-05 11:47:37', NULL, '0');
INSERT INTO `t_mail_record` VALUES ('a084b1cc38a844a7b78eebd856aea07a', '27592285@qq.com', '8282', 1, '2019-08-26 19:40:10', NULL, '0');
INSERT INTO `t_mail_record` VALUES ('ae4cb8b1ec1c4ae99392e9e580c7474a', '27592285@ssa.com', '4686', 1, '2019-09-05 11:43:37', NULL, '0');
INSERT INTO `t_mail_record` VALUES ('b075b01732d045eabb44a5dde99b6181', '27592285@qq.com', '2360', 1, '2019-08-26 19:07:48', NULL, '0');
INSERT INTO `t_mail_record` VALUES ('b53ccbc9fe734b2cb74a3da57dec27f6', '27592285@ssf.com', '6912', 1, '2019-09-05 11:31:43', NULL, '0');
INSERT INTO `t_mail_record` VALUES ('bed7b785e14f416893faad8066ee5f51', '27592285@ssr.com', '1068', 1, '2019-09-05 11:53:14', NULL, '0');

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
INSERT INTO `t_sw_chargelog` VALUES ('321asdf65asdf564', 104398, '737d784555164db2862fd74361a97165', 160.0000, 'asdfasdf', 'erwerwer', '1', '2019-08-27 18:58:47', '2019-08-27 18:58:50', '0', NULL, NULL, NULL);

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
-- Table structure for t_sw_consume_log
-- ----------------------------
DROP TABLE IF EXISTS `t_sw_consume_log`;
CREATE TABLE `t_sw_consume_log`  (
  `tid` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `consume_amount` decimal(65, 8) NULL DEFAULT NULL COMMENT '消费金额(GC)',
  `destoryed` decimal(65, 8) NULL DEFAULT NULL COMMENT '平台销毁金额',
  `pay_user` int(11) NOT NULL COMMENT '支付人',
  `receive_user` int(11) NOT NULL COMMENT '收款人',
  `coin_type_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '币种类型id(GC)',
  `last_consume` decimal(65, 8) NULL DEFAULT 0.00000000 COMMENT '记录上次兑换/挂卖商家收到GC/GCP消费',
  `score` int(2) NULL DEFAULT NULL COMMENT '评分',
  `business_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '店铺id',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '删除标识',
  `ex2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '币种类型id(GCP)',
  `ex3` decimal(65, 8) NULL DEFAULT NULL COMMENT '消费金额(GCP)',
  `ex4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态1-成功，2-失败',
  `ex5` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ex5',
  PRIMARY KEY (`tid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '消费记录表' ROW_FORMAT = Dynamic;

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
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '说明',
  PRIMARY KEY (`tid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '活币金表' ROW_FORMAT = Dynamic;

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
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '说明',
  PRIMARY KEY (`tid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '优币金表' ROW_FORMAT = Dynamic;

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
  `ex1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ex1',
  `ex2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ex2',
  `ex3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ex3',
  `ex4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ex4',
  PRIMARY KEY (`tid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '布道者资料申请表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sw_evangelist_info
-- ----------------------------
INSERT INTO `t_sw_evangelist_info` VALUES ('c32deaa82ea946f396264db3b08b2b4a', 104398, '陈杰', '18720984237', '2419704296@qq.com', 'e27592285', 'mr_acechen', '深圳南山', '2019-08-26 21:08:17', '2019-08-26 21:08:17', '0', NULL, NULL, NULL, NULL);

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
INSERT INTO `t_sw_fiat_coin` VALUES (1, '中国', 1, 'CNY', '￥', 7.0000, '003', '2019-03-18 20:25:14.000000', '2019-08-09 14:59:08.985000', 86, 6.7900, '6.79', NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (2, '马来西亚', 1, 'MYR', 'RM', 4.0700, '003', '2019-03-19 16:22:42.000000', '2019-06-25 11:18:53.437000', 60, 3.8700, '3.87', NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (3, '新加坡', 1, 'SGD', 'S$', 1.3500, '003', '2019-03-19 16:23:18.000000', '2019-03-19 16:23:21.000000', 65, 1.2500, '1.25', NULL);
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
INSERT INTO `t_sw_fiat_coin` VALUES (1233, '台湾', 1, 'TWD', 'NT$', 32.0000, '003', '2019-06-24 12:07:31.142000', '2019-06-24 12:07:31.142000', 886, 31.0000, '31', NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1234, '印度尼西亚', 1, 'IDR', 'Rp', 15000.0000, '003', '2019-06-24 12:13:05.680000', '2019-06-24 18:52:02.290000', 62, 13500.0000, '13500', NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1235, '澳大利亚', 1, 'AUD', 'AUD$', 1.4000, '003', '2019-06-24 12:17:27.137000', '2019-06-24 12:17:27.137000', 61, 1.3000, '1.3', NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1236, '香港', 1, 'HKD', 'HKD$', 8.0000, '003', '2019-06-24 12:21:02.652000', '2019-06-24 12:21:02.652000', 852, 7.5000, '7.5', NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1237, '意大利', 1, 'EUR', '€', 1.1000, '003', '2019-06-24 12:24:22.109000', '2019-06-24 12:24:22.109000', 39, 0.9000, '0.9', NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1238, '韩国', 1, 'KRW', ' ₩', 1300.0000, '003', '2019-06-24 12:27:27.367000', '2019-06-24 12:27:27.367000', 82, 1100.0000, '1100', NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1239, '日本', 1, 'JPY', 'JP¥', 130.0000, '003', '2019-06-24 12:30:26.856000', '2019-06-24 12:30:48.005000', 81, 110.0000, '110', NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1240, '美国', 1, 'USD', 'US$', 1.0000, '003', '2019-06-24 12:36:31.394000', '2019-06-24 13:00:26.022000', 1, 0.9800, '0.98', NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1241, '越南', 1, 'VND', '₫', 24000.0000, '003', '2019-06-24 12:39:20.262000', '2019-06-24 12:39:20.262000', 84, 22000.0000, '22000', NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1242, '菲律宾', 1, 'PHP', '‎₱	', 60.0000, '003', '2019-06-24 12:50:54.432000', '2019-06-24 12:50:54.432000', 63, 50.0000, '50', NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1243, '印度', 1, 'INR', '₹', 70.0000, '003', '2019-06-24 13:06:15.961000', '2019-06-24 13:06:15.961000', 91, 55.0000, '55', NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1244, '泰国', 1, 'THB', '฿', 32.0000, '003', '2019-06-24 16:23:57.667000', '2019-06-24 16:23:57.667000', 66, 30.0000, '30', NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1245, '英国', 1, 'GBP', '£', 0.7500, '003', '2019-06-24 18:50:43.896000', '2019-06-24 18:50:43.896000', 44, 0.6500, '0.65', NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1246, '柬埔寨', 1, 'KHR', '៛ ', 4300.0000, '003', '2019-06-25 10:54:39.374000', '2019-06-25 11:18:17.551000', 855, 4000.0000, '4000', NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1247, '西班牙', 1, 'EUR', '€', 1.1000, '003', '2019-06-25 11:17:44.715000', '2019-06-25 11:17:44.715000', 34, 0.9000, '0.9', NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1248, '阿拉伯联合酋长国', 1, 'AED', '‎د.إ', 3.8000, '003', '2019-06-26 19:20:39.978000', '2019-06-26 19:20:39.978000', 971, 3.6000, '3.6', NULL);
INSERT INTO `t_sw_fiat_coin` VALUES (1249, '马尔代夫', 1, 'MVR ', 'Rf', 16.0000, '003', '2019-06-26 19:24:45.499000', '2019-08-14 19:44:51.877000', 960, 15.0000, '15', NULL);

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
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '说明',
  `ex1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ex1',
  `ex2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ex2',
  `ex3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ex3',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '0为可用,1为不可用',
  PRIMARY KEY (`tid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '升币金表' ROW_FORMAT = Dynamic;

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
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '说明',
  PRIMARY KEY (`tid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定币金表' ROW_FORMAT = Dynamic;

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
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '说明',
  `ex1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ex1',
  `ex2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ex2',
  `ex3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ex3',
  PRIMARY KEY (`tid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '固币金表' ROW_FORMAT = Dynamic;

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
  `ex1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ex1',
  `ex2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ex2',
  `ex3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ex3',
  PRIMARY KEY (`tid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户持有固币金表' ROW_FORMAT = Dynamic;

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
INSERT INTO `t_sw_reward_rule` VALUES ('9a5da7e1e7554b7dbffefed7e49eaad3', '859ND9', '给上级加速规则', '0', 1, '', '2019-09-03 16:56:10', '2019-09-03 17:03:37', '0');

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
INSERT INTO `t_sw_rule_detail` VALUES ('2b4b54808c5f4c2fa0adf564f57c8444', '9a5da7e1e7554b7dbffefed7e49eaad3', 2, NULL, 0.10000000, NULL, NULL, NULL, '2019-09-03 17:01:28', '2019-09-03 17:01:28', '0');
INSERT INTO `t_sw_rule_detail` VALUES ('3ac5183837d843628bb9e28205ce5c17', '9a5da7e1e7554b7dbffefed7e49eaad3', 1, NULL, 0.05000000, NULL, NULL, NULL, '2019-09-03 17:01:08', '2019-09-03 17:01:08', '0');
INSERT INTO `t_sw_rule_detail` VALUES ('43000d6b18d841cdb0a4f64a78531e99', '9a5da7e1e7554b7dbffefed7e49eaad3', 3, NULL, 0.15000000, NULL, NULL, NULL, '2019-09-03 17:01:37', '2019-09-03 17:01:37', '0');

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
  `ex1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ex1',
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
) ENGINE = InnoDB AUTO_INCREMENT = 104406 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户基本表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sw_user_basic
-- ----------------------------
INSERT INTO `t_sw_user_basic` VALUES (1, 'system', 0, '888888', 'aaa@aa.com', '12345678', '12345678', '86', 1, '2019-08-24 14:07:36', '2019-08-24 14:07:38', '0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sw_user_basic` VALUES (104397, 'sz104397', 1, NULL, '1143178854@qq.com', '2cea958616ebafce8f5a3a92aef5873c', NULL, NULL, 0, '2019-08-24 14:10:51', '2019-08-24 14:10:51', '0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sw_user_basic` VALUES (104398, 'sz104398', 104397, NULL, '27592285@qq.com', 'da621990825bdb3d3674fe64af41e5d8', NULL, NULL, 0, '2019-08-26 19:08:55', '2019-08-26 19:08:55', '0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sw_user_basic` VALUES (104399, 'sz104399', 104398, NULL, '27592285@sse.com', '2cea958616ebafce8f5a3a92aef5873c', NULL, NULL, 0, '2019-09-05 11:26:52', '2019-09-05 11:26:55', '0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sw_user_basic` VALUES (104400, 'sz104400', 104398, NULL, '27592285@ssf.com', '2cea958616ebafce8f5a3a92aef5873c', NULL, NULL, 0, '2019-09-05 11:32:11', '2019-09-05 11:32:13', '0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sw_user_basic` VALUES (104401, 'sz104401', 104398, NULL, '27592285@ssg.com', '2cea958616ebafce8f5a3a92aef5873c', NULL, NULL, 0, '2019-09-05 11:41:13', '2019-09-05 11:41:17', '0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sw_user_basic` VALUES (104402, 'sz104402', 104398, NULL, '27592285@ssa.com', '2cea958616ebafce8f5a3a92aef5873c', NULL, NULL, 0, '2019-09-05 11:43:50', '2019-09-05 11:43:54', '0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sw_user_basic` VALUES (104403, 'sz104403', 104398, NULL, '27592285@ssq.com', '2cea958616ebafce8f5a3a92aef5873c', NULL, NULL, 0, '2019-09-05 11:45:09', '2019-09-05 11:45:13', '0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sw_user_basic` VALUES (104404, 'sz104404', 104398, NULL, '27592285@ssw.com', '2cea958616ebafce8f5a3a92aef5873c', NULL, NULL, 0, '2019-09-05 11:47:50', '2019-09-05 11:47:51', '0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_sw_user_basic` VALUES (104405, 'sz104405', 104398, NULL, '27592285@ssr.com', '2cea958616ebafce8f5a3a92aef5873c', NULL, NULL, 0, '2019-09-05 11:53:32', '2019-09-05 11:53:36', '0', NULL, NULL, NULL, NULL, NULL);

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
INSERT INTO `t_sw_wallets` VALUES ('01d7b79de7a046fca67bd10046e0ec91', 104405, '737d784555164db2862fd74361a97165', NULL, '0', NULL, '2019-09-05 11:53:38', '2019-09-05 11:53:38', '0', NULL, NULL, NULL, NULL);
INSERT INTO `t_sw_wallets` VALUES ('0c0c16f6e4e241428eb1ea5c9534cc31', 104400, '737d784555164db2862fd74361a97165', NULL, '0', NULL, '2019-09-05 11:32:36', '2019-09-05 11:32:36', '0', NULL, NULL, NULL, NULL);
INSERT INTO `t_sw_wallets` VALUES ('105b6749fc2c4e4d975815acf87e2f68', 104397, '737d784555164db2862fd74361a97165', NULL, '0', NULL, '2019-08-24 14:10:51', '2019-08-24 14:10:51', '0', NULL, NULL, NULL, NULL);
INSERT INTO `t_sw_wallets` VALUES ('15a9ebf8a9fd4474bcf4c932f39916ba', 104399, '737d784555164db2862fd74361a97165', NULL, '0', NULL, '2019-09-05 11:28:00', '2019-09-05 11:28:00', '0', NULL, NULL, NULL, NULL);
INSERT INTO `t_sw_wallets` VALUES ('213f1726e77d4befaadab3915e59e13e', 104403, 'cb7f09bdb0ef4174abd446d6c1e7745b', NULL, '0', NULL, '2019-09-05 11:46:05', '2019-09-05 11:46:05', '0', NULL, NULL, NULL, NULL);
INSERT INTO `t_sw_wallets` VALUES ('269e475861824251ada5caa302003e8b', 104401, '737d784555164db2862fd74361a97165', NULL, '0', NULL, '2019-09-05 11:43:04', '2019-09-05 11:43:04', '0', NULL, NULL, NULL, NULL);
INSERT INTO `t_sw_wallets` VALUES ('2d7d679517b2475182b01c21ad56d664', 104398, 'cb7f09bdb0ef4174abd446d6c1e7745b', NULL, '0', NULL, '2019-08-26 19:08:55', '2019-08-26 19:08:55', '0', NULL, NULL, NULL, NULL);
INSERT INTO `t_sw_wallets` VALUES ('379a3b4d8bf54473923a27ab58fd504c', 104397, 'cb7f09bdb0ef4174abd446d6c1e7745b', NULL, '0', NULL, '2019-08-24 14:10:51', '2019-08-24 14:10:51', '0', NULL, NULL, NULL, NULL);
INSERT INTO `t_sw_wallets` VALUES ('4877f617b93b446886535cce95a63e1f', 104402, 'cb7f09bdb0ef4174abd446d6c1e7745b', NULL, '0', NULL, '2019-09-05 11:44:33', '2019-09-05 11:44:33', '0', NULL, NULL, NULL, NULL);
INSERT INTO `t_sw_wallets` VALUES ('56bf9828a13549d2acf9a71b81ca44b3', 104400, 'cb7f09bdb0ef4174abd446d6c1e7745b', NULL, '0', NULL, '2019-09-05 11:32:36', '2019-09-05 11:32:36', '0', NULL, NULL, NULL, NULL);
INSERT INTO `t_sw_wallets` VALUES ('5e20e83ddd9d4fd08bd925ab70a98aff', 104404, 'cb7f09bdb0ef4174abd446d6c1e7745b', NULL, '0', NULL, '2019-09-05 11:48:16', '2019-09-05 11:48:16', '0', NULL, NULL, NULL, NULL);
INSERT INTO `t_sw_wallets` VALUES ('89ded44039184e7c857f3f9e96f2c646', 104404, '737d784555164db2862fd74361a97165', NULL, '0', NULL, '2019-09-05 11:48:16', '2019-09-05 11:48:16', '0', NULL, NULL, NULL, NULL);
INSERT INTO `t_sw_wallets` VALUES ('8ebeb3e2c2804c52a18f8fc08d1ad3c3', 104401, 'cb7f09bdb0ef4174abd446d6c1e7745b', NULL, '0', NULL, '2019-09-05 11:43:04', '2019-09-05 11:43:04', '0', NULL, NULL, NULL, NULL);
INSERT INTO `t_sw_wallets` VALUES ('afdf1c8a3c9e4fefafccf90a4dabbc6d', 104398, '737d784555164db2862fd74361a97165', NULL, '0', NULL, '2019-08-26 19:08:55', '2019-08-26 19:08:55', '0', NULL, NULL, NULL, NULL);
INSERT INTO `t_sw_wallets` VALUES ('c78a41125bbc4c86a454b397a31244a5', 104402, '737d784555164db2862fd74361a97165', NULL, '0', NULL, '2019-09-05 11:44:33', '2019-09-05 11:44:33', '0', NULL, NULL, NULL, NULL);
INSERT INTO `t_sw_wallets` VALUES ('d32d39e9f709488494aae12fb6af2066', 104403, '737d784555164db2862fd74361a97165', NULL, '0', NULL, '2019-09-05 11:46:05', '2019-09-05 11:46:05', '0', NULL, NULL, NULL, NULL);
INSERT INTO `t_sw_wallets` VALUES ('e057847b2a714fb29a383ff6769d70a8', 104405, 'cb7f09bdb0ef4174abd446d6c1e7745b', NULL, '0', NULL, '2019-09-05 11:53:38', '2019-09-05 11:53:38', '0', NULL, NULL, NULL, NULL);
INSERT INTO `t_sw_wallets` VALUES ('e4e754799a3745bbb4d834bc2a2dcdc4', 104399, 'cb7f09bdb0ef4174abd446d6c1e7745b', NULL, '0', NULL, '2019-09-05 11:27:06', '2019-09-05 11:27:06', '0', NULL, NULL, NULL, NULL);

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
INSERT INTO `t_sw_withdraw_address` VALUES ('4861efe79df94c8e98da54122fd2fb89', 104398, NULL, 'a1s3d5g4sas655s', NULL, '陈杰地址编辑', NULL, NULL, NULL, '2019-08-27 20:06:35', '2019-08-27 20:23:37', '1');
INSERT INTO `t_sw_withdraw_address` VALUES ('asdf', 104398, '737d784555164db2862fd74361a97165', 'asdfasdfasdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `t_sw_withdraw_address` VALUES ('c0c42003b4ac4db29a27a200ed53eac1', 104398, NULL, 'a1s3d5g4sas655s', NULL, '陈杰地址1', NULL, NULL, NULL, '2019-08-27 20:06:10', '2019-08-27 20:06:10', '0');

-- ----------------------------
-- Table structure for t_sw_withlog
-- ----------------------------
DROP TABLE IF EXISTS `t_sw_withlog`;
CREATE TABLE `t_sw_withlog`  (
  `tid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `coin_type_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '币种id',
  `amount` decimal(20, 4) NULL DEFAULT NULL COMMENT '数量',
  `address_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '提币地址id',
  `status` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态 0-审核中 1-已完成 2-提币失败',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核信息',
  `txid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区块链交易id',
  `fee` decimal(20, 4) NULL DEFAULT NULL COMMENT '提币手续费',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标记',
  `ex2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ex2',
  `ex4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ex4',
  `ex5` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ex5',
  PRIMARY KEY (`tid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '提币记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sw_withlog
-- ----------------------------
INSERT INTO `t_sw_withlog` VALUES ('asdf321asdf321', 104398, '737d784555164db2862fd74361a97165', 150.0000, 'ASDF123WER', '1', '123', '123asdf32a1sdf3', 0.0000, '2019-08-27 18:58:00', '2019-08-27 18:58:03', '0', NULL, NULL, NULL);

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
INSERT INTO `t_sys_config` VALUES ('02c8c69f39414509b8ee0582f5ba528b', 'IndexConfig-IndexButtonName', '释放核心区块链价值', 'IndexConfig-', '2018-09-11 14:51:06', '2018-09-20 10:02:20', '0');
INSERT INTO `t_sys_config` VALUES ('0783b5ab245f481da9cd58b4df470985', 'IndexConfig-EnglishImg', '/files/46350ad7-9cb5-446c-9d5c-87ea2ca164e5.png', 'IndexConfig-', '2018-09-11 14:43:18', '2018-09-20 10:02:20', '0');
INSERT INTO `t_sys_config` VALUES ('0c15c646d0864adf921b10ff6ae65e58', 'CommonConfig-Email', '285646393@qq.com', 'CommonConfig-', '2018-09-11 11:25:05', '2018-09-19 16:00:35', '0');
INSERT INTO `t_sys_config` VALUES ('0f7499a4e0b54757adf15bebb91053d1', 'SettlementCommonConfig-CnyExchangeRyb', '0', 'SettlementCommonConfig-', '2018-12-14 22:51:42', '2019-02-12 20:07:19', '0');
INSERT INTO `t_sys_config` VALUES ('11d61c8f92ae4b959efc158e385f1fcf', 'CommonConfig-AboutUs', '', 'CommonConfig-', '2018-09-11 11:25:05', '2018-09-11 15:33:28', '0');
INSERT INTO `t_sys_config` VALUES ('12e0ef9eb62f45a0b01e41c967a941eb', 'SettlementCommonConfig-TransferTransaction', '0', 'SettlementCommonConfig-', '2018-11-23 17:11:44', '2019-02-12 20:07:19', '0');
INSERT INTO `t_sys_config` VALUES ('13389682a3af47569fe9ba43580d2351', 'SettlementCommonConfig-RYHExchangeProportion', '2.8', 'SettlementCommonConfig-', '2018-10-18 11:57:04', '2019-01-20 11:03:11', '0');
INSERT INTO `t_sys_config` VALUES ('13e9af39f0174860a6b03f8aa7c5ee54', 'IndexConfig-AboutUSSixText', '综合服务', 'IndexConfig-', '2018-09-11 18:20:41', '2018-09-20 10:02:20', '0');
INSERT INTO `t_sys_config` VALUES ('1993937b83b74c028b3636d267cb93ae', 'IndexConfig-AboutUSThreeImage', '/files/c9aba902-e954-4831-a0db-62ec1d5b9913.jpg', 'IndexConfig-', '2018-09-11 18:20:41', '2018-09-20 10:02:20', '0');
INSERT INTO `t_sys_config` VALUES ('20fe57b15ae1480c83c924f042a23e11', 'IndexConfig-CoreTwoTwoText', '查看更多', 'IndexConfig-', '2018-09-11 16:31:39', '2018-09-20 10:02:20', '0');
INSERT INTO `t_sys_config` VALUES ('271ab523a0cb49d8b7d791bf33d6a903', 'IndexConfig-CoreThreeOneText', '股权投资', 'IndexConfig-', '2018-09-11 16:31:39', '2018-09-20 10:02:20', '0');
INSERT INTO `t_sys_config` VALUES ('27bc566e5b78459995022b0462e40a4f', 'IndexConfig-Core', '核心业务', 'IndexConfig-', '2018-09-06 20:39:33', '2018-09-20 10:02:20', '0');
INSERT INTO `t_sys_config` VALUES ('283b9fe7525a41e8bedbe8d2fe9f416f', 'AboutUsConfig-AboutUSTwoName', '发展历程', 'AboutUsConfig-', '2018-09-11 18:06:36', '2018-09-19 19:03:46', '0');
INSERT INTO `t_sys_config` VALUES ('2baf298fb31a463fa969518d520d9648', 'IndexConfig-CoreOneImage', '/files/4b58a678-2a98-4205-a61a-b756f38e2df2.jpg', 'IndexConfig-', '2018-09-11 16:31:39', '2018-09-20 10:02:20', '0');
INSERT INTO `t_sys_config` VALUES ('2d069fa379604ba18a74ed9a98f8d17f', 'CommonConfig-Mobile', '0755-83256505', 'CommonConfig-', '2018-09-11 11:25:05', '2018-09-19 16:00:35', '0');
INSERT INTO `t_sys_config` VALUES ('2e4aec3f729c4b6fafd4990389a73256', 'IndexConfig-CoreOneOneText', '产品配置', 'IndexConfig-', '2018-09-11 16:31:39', '2018-09-20 10:02:20', '0');
INSERT INTO `t_sys_config` VALUES ('2ec87e3b45284402b6682817202144bb', 'TeamConfig-TeamOneText', '集团拥有世界顶级金融经济团队。来自中国，瑞典，德国，美国。香港的顶级金融人才。随着区块链研究的深入，新加坡和中国数家顶级金融机构、风险基金高调宣布参与中盈汇区块链的应用开发项目。', 'TeamConfig-', '2018-09-11 17:36:15', '2018-09-13 19:54:40', '0');
INSERT INTO `t_sys_config` VALUES ('2f39dc2d9e854a0b9164c442b430477e', 'SettlementCommonConfig-TransferMall', '0', 'SettlementCommonConfig-', '2019-01-10 17:56:37', '2019-01-20 11:03:11', '0');
INSERT INTO `t_sys_config` VALUES ('306699bff74b43f8bb5a07d2b703b65f', 'IndexConfig-AboutUSFiveText', '卓越专业', 'IndexConfig-', '2018-09-11 18:20:41', '2018-09-20 10:02:20', '0');
INSERT INTO `t_sys_config` VALUES ('31fbb55f1ebb400aaae49c54977d15b6', 'SettlementCommonConfig-HoldProfitProportion', '50', 'SettlementCommonConfig-', '2018-10-18 11:57:04', '2019-01-20 11:03:11', '0');
INSERT INTO `t_sys_config` VALUES ('31fd7c675d9f4426ad7f297c7b9b42f0', 'SettlementCommonConfig-PushUserNumber', '5', 'SettlementCommonConfig-', '2019-02-20 18:03:26', '2019-05-05 09:59:18', '0');
INSERT INTO `t_sys_config` VALUES ('324b531d992741bda50489cb775c7530', 'IndexConfig-CoreThreeImage', '/files/7c3af328-4f68-4b5b-827e-e28d7c6e0bf3.jpg', 'IndexConfig-', '2018-09-11 16:31:39', '2018-09-20 10:02:20', '0');
INSERT INTO `t_sys_config` VALUES ('367abd1b6b604125b790ecd56b7dc837', 'IndexConfig-AboutUSThreeText', '专业人才', 'IndexConfig-', '2018-09-11 18:20:41', '2018-09-20 10:02:20', '0');
INSERT INTO `t_sys_config` VALUES ('38481d7e087347e2b092c793325b7e73', 'IndexConfig-AboutUSFiveImage', '/files/1878b3b8-d203-4690-889e-bc43eac103f3.jpg', 'IndexConfig-', '2018-09-11 18:20:41', '2018-09-20 10:02:20', '0');
INSERT INTO `t_sys_config` VALUES ('38cdbf335ca54d788e25d3ece5efc6e2', 'IndexConfig-IndexAboutUSBecause', '我们不是单一的企业，我们的服务涵盖了整个金融范围。不管是传统金融业还是新兴互联网金融。', 'IndexConfig-', '2018-09-11 16:31:39', '2018-09-20 10:02:20', '0');
INSERT INTO `t_sys_config` VALUES ('3a60e3c33db24f05bbd2b1ddf75d5e2b', 'IndexConfig-AboutUSSixImage', '/files/17607132-4666-4628-a7b3-6aad79ad5549.jpg', 'IndexConfig-', '2018-09-11 18:20:41', '2018-09-20 10:02:20', '0');
INSERT INTO `t_sys_config` VALUES ('3a7c5e271aea452a8b4c081ec56663d6', 'AboutUsConfig-AboutUSOneName', '关于我们', 'AboutUsConfig-', '2018-09-11 18:06:36', '2018-09-19 19:03:46', '0');
INSERT INTO `t_sys_config` VALUES ('3ad1bbc5c2de49c2880ac13ef832558e', 'SettlementCommonConfig-BackWebsiteFullName', 'K+钱包推广系统', 'SettlementCommonConfig-', '2019-02-20 18:03:26', '2019-05-05 09:59:18', '0');
INSERT INTO `t_sys_config` VALUES ('3e8796fa0cda4d839c2bdaf74815f84d', 'NewsConfig-AboutUSSmallTitle', '', 'NewsConfig-', '2018-09-14 09:59:27', '2018-09-19 16:28:35', '0');
INSERT INTO `t_sys_config` VALUES ('40aa9ce199534dbe8f03bb419b29eea7', 'IndexConfig-CoreOneTwoText', '查看更多', 'IndexConfig-', '2018-09-11 16:31:39', '2018-09-20 10:02:20', '0');
INSERT INTO `t_sys_config` VALUES ('4211a74a37eb40f5bc97625bb7c85d7f', 'SettlementCommonConfig-KbtToKb2Proportion', '100', 'SettlementCommonConfig-', '2019-02-26 11:47:05', '2019-05-05 09:59:18', '0');
INSERT INTO `t_sys_config` VALUES ('427b99b6dd5b414386730a262f6ad3a3', 'IndexConfig-CoreTwoUrl', '/corebusiness.html', 'IndexConfig-', '2018-09-11 16:31:39', '2018-09-20 10:02:20', '0');
INSERT INTO `t_sys_config` VALUES ('44776765d11c464cadd90ffeb68c68a4', 'SettlementCommonConfig-UserRegGiveCoinTotalJson', '[\n    {\n        \"regUser\":\"3\",\n        \"rewardCoin\":\"2222\",\n        \"freeProjectName\":\"注册曾送2222KBT+\"\n    },\n    {\n        \"regUser\":\"4\",\n        \"rewardCoin\":\"1111\",\n        \"freeProjectName\":\"注册曾送1111KBT+\"\n    },\n    {\n        \"regUser\":\"100000\",\n        \"rewardCoin\":\"888\",\n        \"freeProjectName\":\"注册曾送888KBT+\"\n    }\n]', 'SettlementCommonConfig-', '2019-02-20 18:14:18', '2019-05-05 09:59:17', '0');
INSERT INTO `t_sys_config` VALUES ('4477c3b28ab24581ae6361f1bacc429d', 'IndexConfig-AboutUSOneImage', '/files/b2cfee30-f075-4414-b087-15dc9771951a.jpg', 'IndexConfig-', '2018-09-11 18:20:41', '2018-09-20 10:02:20', '0');
INSERT INTO `t_sys_config` VALUES ('4782b9644d06472a9467a037b3fa8f57', 'AboutUsConfig-AboutUSOneText', '关于我们\n中盈汇集团是一家以资产管理、财富管理、投资管理、区块链开发为核心业务的平台，是一家业务范围涵盖私募证券投资基金、股权投资、影视基金、区块链技术应用四大业务板块的现代化资产管理公司。中盈汇集团于2011年8月成立于新加坡，旗下企业包括：中盈汇（新加坡）基金会、中盈汇（新加坡）咨询有限公司、中盈汇（新加坡）科技有限公司；先后在中国内地、中国香港成立了中盈汇资产管理有限公司、中盈汇区块链科技有限公司、中盈汇投资咨询有限公司和中盈汇集团（香港）控股公司、桂林中盈汇国际旅游有限公司等。\n公司成立至今，始终走在行业最前沿。凭借这两年来的精耕细作、诚信经营，公司业务发展越发全面，除了传统的金融业，新兴互联网金融更是领先整个亚洲地区，业务范围覆盖了东南亚直至整个亚洲。', 'AboutUsConfig-', '2018-09-11 18:06:36', '2018-09-19 19:03:46', '0');
INSERT INTO `t_sys_config` VALUES ('48695cb66175403885374cf09c3bbe63', 'IndexConfig-CoreThreeUrl', '/corebusiness.html', 'IndexConfig-', '2018-09-11 16:31:39', '2018-09-20 10:02:20', '0');
INSERT INTO `t_sys_config` VALUES ('4a48e10df4ca4623834532026fffb6a6', 'SettlementCommonConfig-UserRegGiveCoinTotal', '100', 'SettlementCommonConfig-', '2019-02-12 20:07:18', '2019-02-12 20:07:18', '0');
INSERT INTO `t_sys_config` VALUES ('4be8e5af954a49eab35324ec9eaf7518', 'CommonConfig-RRPublicImg', '/files/6001eec1-303a-4ab1-97ee-2ade0311f556.png', 'CommonConfig-', '2018-09-11 11:49:54', '2018-09-19 16:00:35', '0');
INSERT INTO `t_sys_config` VALUES ('5306b9570df643589f9afdc238ec79f2', 'SettlementCommonConfig-WebsiteLogo', '/files/763fb1ba-5877-4762-ad65-e9eeb594a31c.png', 'SettlementCommonConfig-', '2019-02-20 19:09:42', '2019-05-05 09:59:18', '0');
INSERT INTO `t_sys_config` VALUES ('59841589dfbf453bb479a22be2935b82', 'TeamConfig-TeamTwoText', '目前，有多个顶级金融机构和风险基金与中盈汇集团紧密合作。集团的实力为投资者提供了强有力的 保障和足够的信心。能获得社会如此高的关注，不 仅是因为项目自身带着发展热潮的光环，更多的是 项目的完美落地、对技术的追求、颠覆了市场的伟 大愿景。率先为新加坡打开区块链技术，颠覆传统 金融经济是集团的宏愿。', 'TeamConfig-', '2018-09-11 17:36:15', '2018-09-13 19:54:40', '0');
INSERT INTO `t_sys_config` VALUES ('598df99a058e40268da843a5e69c3683', 'CommonConfig-PublicNumberImg', '/files/a57c942a-42b7-46de-a652-5eed3a923295.jpg', 'CommonConfig-', '2018-09-11 11:25:05', '2018-09-11 15:33:28', '0');
INSERT INTO `t_sys_config` VALUES ('59fce243d57345389728dc2d7aa3b685', 'IndexConfig-IndexButtonLinked', '/corebusiness.html', 'IndexConfig-', '2018-09-11 14:51:07', '2018-09-20 10:02:20', '0');
INSERT INTO `t_sys_config` VALUES ('5d2b7e0829af4c059c2944952fb12521', 'IndexConfig-AboutUSFourImage', '/files/4cb77884-ef94-4d5a-8593-91b38363430c.jpg', 'IndexConfig-', '2018-09-11 18:20:41', '2018-09-20 10:02:20', '0');
INSERT INTO `t_sys_config` VALUES ('5dae0779fe774694a4ca1e9dc30fc970', 'IndexConfig-CoreTwoOneText', '投资管理', 'IndexConfig-', '2018-09-11 16:31:39', '2018-09-20 10:02:20', '0');
INSERT INTO `t_sys_config` VALUES ('5e3de55e6b8640ae8749217b89abe21b', 'SettlementCommonConfig-PushProfitProportion', '50', 'SettlementCommonConfig-', '2018-10-18 11:57:04', '2019-01-20 11:03:11', '0');
INSERT INTO `t_sys_config` VALUES ('60bbebafaf4d4531ad29b6f38e7c80e3', 'AboutUsConfig-AboutUSFourImage', '/files/190e7577-0b2a-43cc-bfd0-3d5c445e1c49.jpg', 'AboutUsConfig-', '2018-09-11 18:06:36', '2018-09-19 19:03:46', '0');
INSERT INTO `t_sys_config` VALUES ('6173f0e37875470aa73245224ab78395', 'AboutUsConfig-AboutUSThreeName', '核心人物介绍', 'AboutUsConfig-', '2018-09-11 18:06:36', '2018-09-19 19:03:46', '0');
INSERT INTO `t_sys_config` VALUES ('629b9b1ef5724edcb51215bb7a4917e9', 'CommonConfig-IsEnableWaiXinImg', '1', 'CommonConfig-', '2018-09-10 14:39:55', '2018-09-19 16:00:35', '0');
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
INSERT INTO `t_sys_config` VALUES ('77389e1725fd48a39ec2b50b633576d8', 'IndexConfig-IndexShowText', '给您提供专业现代化资产管理', 'IndexConfig-', '2018-09-11 14:43:18', '2018-09-20 10:02:20', '0');
INSERT INTO `t_sys_config` VALUES ('78a8a489a0c7491bb2e69783afc9f482', 'AboutUsConfig-AboutUSTwoImage', '/files/84d58893-0a20-4050-9ed8-bc6fd53d22a2.jpg', 'AboutUsConfig-', '2018-09-11 18:06:36', '2018-09-19 19:03:46', '0');
INSERT INTO `t_sys_config` VALUES ('7972ffea8872414a8d67d0770275277a', 'AboutUsConfig-AboutUSOneImage', '/files/23316c5f-4d42-461f-b225-b4d070d6c335.jpg', 'AboutUsConfig-', '2018-09-11 18:06:36', '2018-09-19 19:03:46', '0');
INSERT INTO `t_sys_config` VALUES ('7c22f6ab571b49b6bb19f4e35085789d', 'TeamConfig-TeamThreeImage', '/files/62933708-4da2-40b5-86af-c50c617957c6.jpg', 'TeamConfig-', '2018-09-11 17:36:15', '2018-09-13 19:54:40', '0');
INSERT INTO `t_sys_config` VALUES ('7cfe3307b7044b4ea12037373adeb5c5', 'TeamConfig-TeamOneName', '技术团队', 'TeamConfig-', '2018-09-11 17:36:15', '2018-09-13 19:54:40', '0');
INSERT INTO `t_sys_config` VALUES ('7fb39bf6db73470eb09e0dcc3c81996b', 'AboutUsConfig-AboutUSFourName', '集团理念', 'AboutUsConfig-', '2018-09-11 18:06:36', '2018-09-19 19:03:46', '0');
INSERT INTO `t_sys_config` VALUES ('80c9b98e367449cfb39109148417d538', 'TeamConfig-TeamOneImage', '/files/a3ff6af0-34a5-471b-a23a-e3210e2c3d77.jpg', 'TeamConfig-', '2018-09-11 17:36:15', '2018-09-13 19:54:40', '0');
INSERT INTO `t_sys_config` VALUES ('8671746e21054af29388cb748f27829c', 'CoreConfig-CoreBackGroundImg', '/files/b103b3b2-5fe3-4ef6-9aa5-2207db32ed0b.jpg', 'CoreConfig-', '2018-09-13 18:34:30', '2018-09-17 16:40:15', '0');
INSERT INTO `t_sys_config` VALUES ('8703df7ca64146d399d3192820b2144f', 'SettlementCommonConfig-TransferOther', '0', 'SettlementCommonConfig-', '2018-11-23 17:11:44', '2019-02-12 20:07:19', '0');
INSERT INTO `t_sys_config` VALUES ('89e82c14c2ef4c35ba7ce47d0687be87', 'nullCore', '测试基础配置', NULL, '2018-09-06 20:50:41', '2018-09-11 10:32:04', '0');
INSERT INTO `t_sys_config` VALUES ('8c19ead6eefd415292c1acde28516ff7', 'CommonConfig-ZYHPublicImgName', '中盈汇集团公众号', 'CommonConfig-', '2018-09-11 16:54:11', '2018-09-19 16:00:35', '0');
INSERT INTO `t_sys_config` VALUES ('8d10e34f36ed4d17995ba18b6081ea33', 'SettlementCommonConfig-GameSuccessIP', '132.148.21.154;104.28.27.167', 'SettlementCommonConfig-', '2019-01-10 10:00:57', '2019-01-20 11:03:11', '0');
INSERT INTO `t_sys_config` VALUES ('9112058318ff4d558d0b01b1012ac2b6', 'AboutUsConfig-AboutUSSmallTitle', '', 'AboutUsConfig-', '2018-09-11 18:06:36', '2018-09-19 19:03:46', '0');
INSERT INTO `t_sys_config` VALUES ('95e91aca902c4b7e9b05dae8c222842a', 'IndexConfig-IndexBackGroundImg', '/files/a361cfa5-4235-4ffb-93a8-778bdb07f729.jpg', 'IndexConfig-', '2018-09-11 14:43:18', '2018-09-20 10:02:20', '0');
INSERT INTO `t_sys_config` VALUES ('990ba03df87244dc8f6164a800b966b2', 'SettlementCommonConfig-WalletGT', '50', 'SettlementCommonConfig-', '2018-10-18 11:57:04', '2019-01-20 11:03:11', '0');
INSERT INTO `t_sys_config` VALUES ('9f82fa642f5141d9a40e4e7c7b8857a1', 'IndexConfig-CoreTwoImage', '/files/492b4ee7-0500-4b57-84d6-9e7bdfde0da0.jpg', 'IndexConfig-', '2018-09-11 16:31:39', '2018-09-20 10:02:20', '0');
INSERT INTO `t_sys_config` VALUES ('a49952ceb6874735895b3920a05305eb', 'CommonConfig-RRPublicImgName', '瑞银RR社区公众号', 'CommonConfig-', '2018-09-11 16:54:11', '2018-09-19 16:00:35', '0');
INSERT INTO `t_sys_config` VALUES ('a8412c8d3382423fa346b034ce71609f', 'IndexConfig-CoreFourOneText', '区块链开发', 'IndexConfig-', '2018-09-11 16:31:39', '2018-09-20 10:02:20', '0');
INSERT INTO `t_sys_config` VALUES ('a8fb73e46ed94e74b48cb89164efef4f', 'NewsConfig-AboutUSBigTitle', '', 'NewsConfig-', '2018-09-14 09:59:27', '2018-09-19 16:28:35', '0');
INSERT INTO `t_sys_config` VALUES ('aad451199729480e95f3021b15ad2919', 'AboutUsConfig-AboutUSTwoText', '21世纪，人类已进入信息化时代，互联网金融、虚拟经济迅速崛起。随着“互联网+“概念的提出和发展趋势，互联网金融、数字资产逐渐成了热门词汇，它正以远超我们预期的速度迅猛发展。比特币等虚拟货币的出现和应用标志着区块链技术正式被世人认可并追求。随着“区块链“概念的提出和其发展趋势，互联网新金融、区块链经济迅速崛起，A字贫P之所以引起全球众多领域关注是因为它正在颠覆一个全以中心化的金融主导的经济时代，去中心化虚拟数字货币已成为时代的潮流这一切已经说明人类资产数字化，已是为历史进程中不可阴挡的趋势。中盈汇集团率先在新加坡试点开发“区块链”应用技术的研发。在供给侧改革，万众创新，大众创业的大背景下，创7业将通过兼并重组积聚优势生产力.股权投资将成为经济转型发展的必然选择。我国股权基金正处于蓬勃发展期，在葬资、投资、管理与退出机制上都取得了长足的进展，P〔投资的市场环境已经成熟。股权投资的时代是大势所趋，股权投资者可能成为未来最大寡家。股权投资从全球来看，正在从另类成为主流，是创新、创业、金融的核心地带，过去10年有50倍以上的增长。\n中盈汇集团专注于区块链技术应用、生物医药、节能环保、新材料、新能源、新金融、人工智能等领域。', 'AboutUsConfig-', '2018-09-11 18:06:36', '2018-09-19 19:03:46', '0');
INSERT INTO `t_sys_config` VALUES ('abfccc52e9ca4779b80495accb499fdb', 'nullAboutUs', '关于我们的配置，啦啦啦啦啊', NULL, '2018-09-06 20:50:41', '2018-09-11 10:32:04', '0');
INSERT INTO `t_sys_config` VALUES ('ac8990fd6df0499cac3e9d2488aa9b2d', 'IndexConfig-AboutUSFourText', '遍布全球', 'IndexConfig-', '2018-09-11 18:20:41', '2018-09-20 10:02:20', '0');
INSERT INTO `t_sys_config` VALUES ('ae485e70d5d748bdbb0981f062fe7a79', 'IndexConfig-CoreOneUrl', '/corebusiness.html', 'IndexConfig-', '2018-09-11 16:31:39', '2018-09-20 10:02:20', '0');
INSERT INTO `t_sys_config` VALUES ('af1653818fc64453b92865c47229450d', 'SettlementCommonConfig-IsEnableAdminLoginMobileCheck', '1', 'SettlementCommonConfig-', '2018-10-18 11:57:04', '2019-05-05 09:59:18', '0');
INSERT INTO `t_sys_config` VALUES ('afaa10ef5e1c4815b679faa471df85cd', 'nullIsEnableWaiXinImg', '1', NULL, '2018-09-06 20:51:04', '2018-09-10 14:41:41', '0');
INSERT INTO `t_sys_config` VALUES ('b027096903ba4d0a8cb842cfd9bb3721', 'IndexConfig-CoreFourImage', '/files/dea4bcd2-f0c7-4ee4-82aa-5cee98d21fb6.jpg', 'IndexConfig-', '2018-09-11 16:31:39', '2018-09-20 10:02:20', '0');
INSERT INTO `t_sys_config` VALUES ('b085c257906b4dbb836d8fc102a0f359', 'IndexConfig-AboutUSImg', '/img/noPicture.jpg', 'IndexConfig-', '2018-09-11 16:31:39', '2018-09-11 16:31:39', '0');
INSERT INTO `t_sys_config` VALUES ('b412995feba043fc87e035d8f17fe4be', 'CommonConfig-Address', '深圳市福田区福田海岸环庆大厦1404-1405室', 'CommonConfig-', '2018-09-11 11:25:05', '2018-09-19 16:00:35', '0');
INSERT INTO `t_sys_config` VALUES ('be006dbfd4c640c48f407bcbff3d6b6a', 'IndexConfig-AboutUSTwoText', '资源交流', 'IndexConfig-', '2018-09-11 18:20:41', '2018-09-20 10:02:20', '0');
INSERT INTO `t_sys_config` VALUES ('be156e7c8042428ea548843f4caad4ef', 'SettlementCommonConfig-WebsiteURL', 'http://http://wallets.shenzhitong.cn', 'SettlementCommonConfig-', '2019-02-22 16:55:07', '2019-05-05 09:59:17', '0');
INSERT INTO `t_sys_config` VALUES ('c2f7fddb70714929a937980d0d61c28f', 'SettlementCommonConfig-ShopConsumePerCent', '0.25', 'SettlementCommonConfig-', '2019-04-26 16:17:21', '2019-04-28 09:51:38', '0');
INSERT INTO `t_sys_config` VALUES ('cda3b81dcb76416796c415403dd99f99', 'SettlementCommonConfig-TranReturnPercent', '0.5', 'SettlementCommonConfig-', '2019-05-05 09:59:18', '2019-05-05 09:59:18', '0');
INSERT INTO `t_sys_config` VALUES ('ce07fc27260348f0992eab308acdcd4f', 'SettlementCommonConfig-SettlementTransferTradingTotalLimit', '100', 'SettlementCommonConfig-', '2018-12-25 17:19:08', '2019-01-20 11:03:11', '0');
INSERT INTO `t_sys_config` VALUES ('d198201984c04b4f9ceb739bb4839776', 'TeamConfig-TeamTwoName', '集团愿望', 'TeamConfig-', '2018-09-11 17:36:15', '2018-09-13 19:54:40', '0');
INSERT INTO `t_sys_config` VALUES ('d3ab6ad5180d4dc29be040feb6184911', 'AboutUsConfig-AboutUSThreeImage', '/files/9a80e08c-069c-47d7-bc5d-1817fae87faf.png', 'AboutUsConfig-', '2018-09-11 18:06:36', '2018-09-19 19:03:46', '0');
INSERT INTO `t_sys_config` VALUES ('d5ef6b9f3528435792458ba1b9326537', 'SettlementCommonConfig-ShopPushRule', '[\n    {\n        \"percent\":\"0.05\",\n        \"num\":\"1\"\n    },\n    {\n        \"percent\":\"0.1\",\n        \"num\":\"2\"\n    },\n    {\n        \"percent\":\"0.15\",\n        \"num\":\"3\"\n    }\n]', 'SettlementCommonConfig-', '2019-04-28 09:51:37', '2019-04-28 09:51:37', '0');
INSERT INTO `t_sys_config` VALUES ('d7b9786fa6e848a49392c899dc86caa4', 'TeamConfig-TeamThreeText', '1.全面综合性服务\n我门不是单一的企业，我们的服务涵盖了整个金融范围。不管剧专统金融业还是新兴互联网金融。\n2.专业的人才\n我们的团队都是金融业里面各国的顶尖人才，我们提供最专业的技术最精准的评估。\n3.资源充足，渠道众多\n公司成立以来，凭借着丰富的贸易经验和公司管理经验，多年来的精耕细作经营，公司业务发展越发全面，范围\n越发宽广，无论是跨国合作还是跨国人才，集团都经营有声有色。', 'TeamConfig-', '2018-09-11 17:36:15', '2018-09-13 19:54:40', '0');
INSERT INTO `t_sys_config` VALUES ('d8dc0e5112e54da1aae3898cef00c0e7', 'IndexConfig-CoreFourTwoText', '查看更多', 'IndexConfig-', '2018-09-11 16:31:39', '2018-09-20 10:02:20', '0');
INSERT INTO `t_sys_config` VALUES ('dae9e00de26f49b2ab4dcf3331956c25', 'AboutUsConfig-AboutUSThreeText', '夏辉，中盈汇集团懂事长瑞银RR社区、瑞银钱包创始人。现为江苏基金会会长，中国香港狮子会成员。由于其独特的敏锐性，从2015年开始专注于区块链技术应用研究，2016年进入矿圈2017年创建中盈汇集团，2018年成为矿圈大咖现托管的比特币矿机达40万台规模2017年总产值8亿元人民币。', 'AboutUsConfig-', '2018-09-11 18:06:36', '2018-09-19 19:03:46', '0');
INSERT INTO `t_sys_config` VALUES ('db121743c14f46e8b833f48780cb3bec', 'IndexConfig-CoreThreeTwoText', '查看更多', 'IndexConfig-', '2018-09-11 16:31:39', '2018-09-20 10:02:20', '0');
INSERT INTO `t_sys_config` VALUES ('e0c387a066e74102a42c9a7aad5a9890', 'CoreConfig-CoreButtonName', '实现商业目标', 'CoreConfig-', '2018-09-13 18:34:30', '2018-09-17 16:40:15', '0');
INSERT INTO `t_sys_config` VALUES ('e5095e8df69945afb4db1d1ac797946b', 'CoreConfig-CoreButtonLinked', '/index.html', 'CoreConfig-', '2018-09-13 18:34:30', '2018-09-17 16:40:15', '0');
INSERT INTO `t_sys_config` VALUES ('e7dd32b4663443da8803c884a303f162', 'IndexConfig-IndexWhyCheckUs', '为什么选择我们', 'IndexConfig-', '2018-09-11 16:31:39', '2018-09-20 10:02:20', '0');
INSERT INTO `t_sys_config` VALUES ('e8327d9c20ac4953a27159580a6b5ab5', 'nullPublicNumberImg', '/files/02063ad2-2074-4d5a-89e0-4c20d8d60a61.jpg', NULL, '2018-09-06 20:50:41', '2018-09-11 10:32:04', '0');
INSERT INTO `t_sys_config` VALUES ('ea37c37d66c845c8b86169253169028f', 'AboutUsConfig-AboutUSFourText', '颠覆了市场，颠覆传统金融经济集团使命:为投资者盈利，帮助投资者实现财富自由\n分享财富、共享资源、共赢天下\n以人为本，志同道合，信任协作，互惠共赢\n坚持理想！理想实现！', 'AboutUsConfig-', '2018-09-11 18:06:36', '2018-09-19 19:03:46', '0');
INSERT INTO `t_sys_config` VALUES ('eb2996f4a44c49638253110372a082ff', 'CommonConfig-LogoImg', '/files/5c444493-738c-4774-8da1-faaa30ea0d48.png', 'CommonConfig-', '2018-09-11 14:03:39', '2018-09-19 16:00:35', '0');
INSERT INTO `t_sys_config` VALUES ('ef6cfa8643604807931dda54212b5f05', 'TeamConfig-TeamTwoImage', '/files/b05dfd53-d567-4c87-b20c-2943d41981ae.jpg', 'TeamConfig-', '2018-09-11 17:36:15', '2018-09-13 19:54:40', '0');
INSERT INTO `t_sys_config` VALUES ('efbf6d6cb5494eb5bb2214de26ab621e', 'SettlementCommonConfig-UserRegGiveCoin', 'KC', 'SettlementCommonConfig-', '2019-02-12 20:07:18', '2019-05-05 09:59:17', '0');
INSERT INTO `t_sys_config` VALUES ('f19ecb3e26df440fbea5a246c44771c6', 'SettlementCommonConfig-BackWebsiteSubName', 'K+推广系统', 'SettlementCommonConfig-', '2019-02-20 18:03:26', '2019-05-05 09:59:17', '0');
INSERT INTO `t_sys_config` VALUES ('f1a206b909ec4a94a1eebb08793b3078', 'CoreConfig-CoreTextName', '释放区块链核心价值', 'CoreConfig-', '2018-09-13 18:34:30', '2018-09-17 16:40:15', '0');
INSERT INTO `t_sys_config` VALUES ('f7103b6ce4f04e1cbae74ec8826059d3', 'IndexConfig-ChineseImg', '/files/23c76f35-fd15-4398-ad67-ed1b480e18eb.png', 'IndexConfig-', '2018-09-11 14:43:18', '2018-09-20 10:02:20', '0');
INSERT INTO `t_sys_config` VALUES ('f942dfc2b04045efb0e3d9a4b1b8a0d2', 'SettlementCommonConfig-SettlementTransferTradingLimitTimes', '100', 'SettlementCommonConfig-', '2018-12-25 17:19:08', '2019-01-20 11:03:11', '0');
INSERT INTO `t_sys_config` VALUES ('fc0dc65ebe5347e08033f599a5085711', 'IndexConfig-IndexAboutUs', '关于我们', 'IndexConfig-', '2018-09-11 16:31:39', '2018-09-20 10:02:20', '0');
INSERT INTO `t_sys_config` VALUES ('fda4041f3ce9456cb132ea40c85f49ad', 'SettlementCommonConfig-SystemAccountId', '1', 'SettlementCommonConfig-', '2019-02-28 01:29:01', '2019-05-05 09:59:17', '0');
INSERT INTO `t_sys_config` VALUES ('ffa39e9ca2a14e07b75290ef53aa6bd6', 'CommonConfig-ZYHPublicImg', '/files/f2c7611f-14fa-45e9-bdd9-d82613666237.png', 'CommonConfig-', '2018-09-11 11:49:54', '2018-09-19 16:00:35', '0');

-- ----------------------------
-- Table structure for t_sys_information
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_information`;
CREATE TABLE `t_sys_information`  (
  `tid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `title` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `type` int(2) NULL DEFAULT NULL COMMENT '类型，1-新闻，2-公告',
  `status` int(1) NULL DEFAULT NULL COMMENT '状态，0-可用，1-不可用',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标记',
  `ex1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ex1',
  `ex2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ex2',
  `ex3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ex3',
  PRIMARY KEY (`tid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '资讯表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sys_information
-- ----------------------------
INSERT INTO `t_sys_information` VALUES ('as6df4as3d2f1', '公告1', '我们准备更新了', 2, 0, '2019-08-28 19:33:31', '2019-08-28 19:33:33', '0', NULL, NULL, NULL);
INSERT INTO `t_sys_information` VALUES ('asdf321asdf1', '新闻1', '据前线记者报道....', 1, 0, '2019-08-28 19:33:00', '2019-08-28 19:33:03', '0', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for t_task
-- ----------------------------
DROP TABLE IF EXISTS `t_task`;
CREATE TABLE `t_task`  (
  `tid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `job_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '定时任务名称',
  `batch_num` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '批次编号',
  `type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'normal正常结算, runtime运行时,error异常结算',
  `start_date` datetime(0) NULL DEFAULT NULL COMMENT '开始时间',
  `end_date` datetime(0) NULL DEFAULT NULL COMMENT '结束时间',
  `message` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '消息',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `del_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除编号',
  PRIMARY KEY (`tid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统定时任务, 废弃sys_task表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_task
-- ----------------------------
INSERT INTO `t_task` VALUES ('0158aa82545648808dd9668713524eb4', 'FixedDepositTask', '20190401', 'normal', '2019-04-01 01:00:00', '2019-04-01 01:00:00', '定存检查定时任务成功检查,取消定存用户：0人，成功释放利息：0人', '2019-04-01 01:00:00', '0');
INSERT INTO `t_task` VALUES ('01f1f48a9f2e4563bf379f86c6e2ca79', 'cleanLog', '20190414', 'normal', '2019-04-14 01:00:00', '2019-04-14 01:00:00', '删除日志成功删除1317行', '2019-04-14 01:00:00', '0');
INSERT INTO `t_task` VALUES ('0411734f5f6743fbba206915e3ad8382', 'FixedDepositTask', '20190321', 'normal', '2019-03-21 01:00:00', '2019-03-21 01:00:00', '定存检查定时任务成功检查,取消定存用户：0人，成功释放利息：0人', '2019-03-21 01:00:00', '0');
INSERT INTO `t_task` VALUES ('05c0a8114d8a484a90809dbcaebc2a21', 'cleanLog', '20190427', 'normal', '2019-04-27 01:00:00', '2019-04-27 01:00:00', '删除日志成功删除46行', '2019-04-27 01:00:00', '0');
INSERT INTO `t_task` VALUES ('073897159d834061b0daa231ce72488b', 'cleanLog', '20190307', 'normal', '2019-03-07 01:00:00', '2019-03-07 01:00:00', '删除日志成功删除0行', '2019-03-07 01:00:00', '0');
INSERT INTO `t_task` VALUES ('093c892fb7224884a065b87a4ec2e49a', 'CheckInTask', '20190428', 'normal', '2019-04-28 01:00:00', '2019-04-28 01:00:00', '昨日未签到用户0个', '2019-04-28 01:00:00', '0');
INSERT INTO `t_task` VALUES ('09b73e91a15e43e389163f0d8885f53f', 'CheckInTask', '20190407', 'normal', '2019-04-07 00:59:51', '2019-04-07 00:59:52', '昨日未签到用户2个', '2019-04-07 00:59:51', '0');
INSERT INTO `t_task` VALUES ('0c6ebedbeb4d44f9bda47b4853fb6402', 'CheckInTask', '20190405', 'normal', '2019-04-05 01:00:00', '2019-04-05 01:00:00', '昨日未签到用户0个', '2019-04-05 01:00:00', '0');
INSERT INTO `t_task` VALUES ('0c8f5accffdc474aa6e1e5e73070da56', 'cleanLog', '20190305', 'normal', '2019-03-05 01:00:00', '2019-03-05 01:00:00', '删除日志成功删除0行', '2019-03-05 01:00:00', '0');
INSERT INTO `t_task` VALUES ('0d8e6e67473a4745ad28dc2dfa28d7d3', 'FixedDepositTask', '20190403', 'normal', '2019-04-03 01:04:09', '2019-04-03 01:04:09', '定存检查定时任务成功检查,取消定存用户：0人，成功释放利息：0人', '2019-04-03 01:04:09', '0');
INSERT INTO `t_task` VALUES ('0d9b0e92b04d4d28b97841f2f5e4daf8', 'cleanLog', '20190419', 'normal', '2019-04-19 01:00:01', '2019-04-19 01:00:01', '删除日志成功删除0行', '2019-04-19 01:00:01', '0');
INSERT INTO `t_task` VALUES ('0dcb6c10b25d442abf64e5ef6873378d', 'CheckInTask', '20190420', 'normal', '2019-04-20 01:00:00', '2019-04-20 01:00:00', '昨日未签到用户0个', '2019-04-20 01:00:00', '0');
INSERT INTO `t_task` VALUES ('0e8eaa0c9ad74dcf8d54597a91d97d44', 'cleanLog', '20190411', 'normal', '2019-04-11 01:00:00', '2019-04-11 01:00:00', '删除日志成功删除28行', '2019-04-11 01:00:00', '0');
INSERT INTO `t_task` VALUES ('0f0a8efcab5c4b508280d516d9000680', 'CheckInTask', '20190307', 'normal', '2019-03-07 01:00:00', '2019-03-07 01:00:00', '昨日未签到用户0个', '2019-03-07 01:00:00', '0');
INSERT INTO `t_task` VALUES ('123c6a7752fc4f748324640b74f10023', 'CheckInTask', '20190330', 'normal', '2019-03-30 00:59:56', '2019-03-30 00:59:56', '昨日未签到用户0个', '2019-03-30 00:59:56', '0');
INSERT INTO `t_task` VALUES ('124f742296ff49b6a6a2500ea2d463af', 'cleanLog', '20190329', 'normal', '2019-03-29 01:00:00', '2019-03-29 01:00:20', '删除日志成功删除0行', '2019-03-29 01:00:00', '0');
INSERT INTO `t_task` VALUES ('1312bc8db9394fcc95c81ad5ea1e2d5f', 'cleanLog', '20190426', 'normal', '2019-04-26 01:00:00', '2019-04-26 01:00:00', '删除日志成功删除0行', '2019-04-26 01:00:00', '0');
INSERT INTO `t_task` VALUES ('139f89a44e3b4c9aab118e503a1d1346', 'cleanLog', '20190328', 'normal', '2019-03-28 01:00:00', '2019-03-28 01:00:00', '删除日志成功删除55行', '2019-03-28 01:00:00', '0');
INSERT INTO `t_task` VALUES ('15710cf4305b4bdeab40df343b3ea109', 'cleanLog', '20190429', 'normal', '2019-04-29 01:00:00', '2019-04-29 01:00:00', '删除日志成功删除2411行', '2019-04-29 01:00:00', '0');
INSERT INTO `t_task` VALUES ('16c9e89b5ecc403192a34c1ef578c3d7', 'cleanLog', '20190426', 'normal', '2019-04-26 01:00:00', '2019-04-26 01:00:00', '删除日志成功删除0行', '2019-04-26 01:00:00', '0');
INSERT INTO `t_task` VALUES ('17f2f2f39e3e40e4ab39a46b9dde391f', 'CheckInTask', '20190405', 'normal', '2019-04-05 01:00:00', '2019-04-05 01:00:00', '昨日未签到用户0个', '2019-04-05 01:00:00', '0');
INSERT INTO `t_task` VALUES ('18a49c7568c349b09f9545de411a9197', 'FixedDepositTask', '20190420', 'normal', '2019-04-20 01:00:00', '2019-04-20 01:00:00', '定存检查定时任务成功检查,取消定存用户：0人，成功释放利息：0人', '2019-04-20 01:00:00', '0');
INSERT INTO `t_task` VALUES ('19abbb86e2ec41c789261c3826b3b72e', 'CheckInTask', '20190402', 'normal', '2019-04-02 01:00:00', '2019-04-02 01:00:00', '昨日未签到用户0个', '2019-04-02 01:00:00', '0');
INSERT INTO `t_task` VALUES ('1a03f5c1daf242168d2b192b40032f79', 'CheckInTask', '20190406', 'normal', '2019-04-06 01:00:01', '2019-04-06 01:00:01', '昨日未签到用户2个', '2019-04-06 01:00:01', '0');
INSERT INTO `t_task` VALUES ('1f14b6c3539247778dd83c7fc59af38a', 'FixedDepositTask', '20190401', 'normal', '2019-04-01 01:00:00', '2019-04-01 01:00:00', '定存检查定时任务成功检查,取消定存用户：0人，成功释放利息：0人', '2019-04-01 01:00:00', '0');
INSERT INTO `t_task` VALUES ('1f91172ef8754885b17e4bb12584d302', 'FixedDepositTask', '20190427', 'normal', '2019-04-27 01:00:00', '2019-04-27 01:00:00', '定存检查定时任务成功检查,取消定存用户：0人，成功释放利息：0人', '2019-04-27 01:00:00', '0');
INSERT INTO `t_task` VALUES ('20851e338b124f29a36c2abdd11c029f', 'CheckInTask', '20190426', 'normal', '2019-04-26 01:00:00', '2019-04-26 01:00:00', '昨日未签到用户0个', '2019-04-26 01:00:00', '0');
INSERT INTO `t_task` VALUES ('211b4a874d164708950518b5ad179b3a', 'cleanLog', '20190415', 'normal', '2019-04-15 01:00:00', '2019-04-15 01:00:00', '删除日志成功删除924行', '2019-04-15 01:00:00', '0');
INSERT INTO `t_task` VALUES ('2190603f4f0b4ac7a51ae2d52e844c90', 'FixedDepositTask', '20190424', 'normal', '2019-04-24 01:00:00', '2019-04-24 01:00:00', '定存检查定时任务成功检查,取消定存用户：0人，成功释放利息：0人', '2019-04-24 01:00:00', '0');
INSERT INTO `t_task` VALUES ('21b89da3a4064fbaa3051bef35157df9', 'CheckInTask', '20190403', 'normal', '2019-04-03 01:04:09', '2019-04-03 01:04:09', '昨日未签到用户0个', '2019-04-03 01:04:09', '0');
INSERT INTO `t_task` VALUES ('2251589dad4d4156bca34528308012af', 'FixedDepositTask', '20190501', 'normal', '2019-05-01 01:00:00', '2019-05-01 01:00:00', '定存检查定时任务成功检查,取消定存用户：0人，成功释放利息：0人', '2019-05-01 01:00:00', '0');
INSERT INTO `t_task` VALUES ('265eeaef096e42828281534452e15d54', 'FixedDepositTask', '20190426', 'normal', '2019-04-26 01:00:00', '2019-04-26 01:00:00', '定存检查定时任务成功检查,取消定存用户：0人，成功释放利息：0人', '2019-04-26 01:00:00', '0');
INSERT INTO `t_task` VALUES ('26ad05a9a18c45bbb69cd141ba186bef', 'cleanLog', '20190422', 'normal', '2019-04-22 01:00:00', '2019-04-22 01:00:00', '删除日志成功删除0行', '2019-04-22 01:00:00', '0');
INSERT INTO `t_task` VALUES ('2712b011c1f44d9f8bf0c1f82f22db36', 'CheckInTask', '20190502', 'normal', '2019-05-02 01:00:00', '2019-05-02 01:00:00', '昨日未签到用户0个', '2019-05-02 01:00:00', '0');
INSERT INTO `t_task` VALUES ('2744b752e580452ba6ac53822f29bbaf', 'FixedDepositTask', '20190328', 'normal', '2019-03-28 01:00:00', '2019-03-28 01:00:00', '定存检查定时任务成功检查,取消定存用户：0人，成功释放利息：0人', '2019-03-28 01:00:00', '0');
INSERT INTO `t_task` VALUES ('27a37b2a0f604aa18d93c4836207a09f', 'cleanLog', '20190421', 'normal', '2019-04-21 01:00:00', '2019-04-21 01:00:00', '删除日志成功删除0行', '2019-04-21 01:00:00', '0');
INSERT INTO `t_task` VALUES ('29adfabb83fc4efe9e36437581413db1', 'FixedDepositTask', '20190417', 'normal', '2019-04-17 01:00:00', '2019-04-17 01:00:00', '定存检查定时任务成功检查,取消定存用户：0人，成功释放利息：0人', '2019-04-17 01:00:00', '0');
INSERT INTO `t_task` VALUES ('2a1d3bf45b3c4f08a21d59af46fc1218', 'cleanLog', '20190319', 'normal', '2019-03-19 00:59:57', '2019-03-19 00:59:57', '删除日志成功删除1312行', '2019-03-19 00:59:57', '0');
INSERT INTO `t_task` VALUES ('2a6e55ff366643798246fdf0e81f1bb8', 'cleanLog', '20190403', 'normal', '2019-04-03 00:59:55', '2019-04-03 01:04:09', '删除日志成功删除1859382行', '2019-04-03 00:59:55', '0');
INSERT INTO `t_task` VALUES ('2adfb493e4614a129f1a0961427a9287', 'CheckInTask', '20190408', 'normal', '2019-04-08 01:00:00', '2019-04-08 01:00:00', '昨日未签到用户2个', '2019-04-08 01:00:00', '0');
INSERT INTO `t_task` VALUES ('2dce6e0b78fb4adb803d6558207c1c56', 'CheckInTask', '20190410', 'normal', '2019-04-10 01:00:00', '2019-04-10 01:00:00', '昨日未签到用户2个', '2019-04-10 01:00:00', '0');
INSERT INTO `t_task` VALUES ('2dda7253126e4ef6bee3361e1bdced21', 'FixedDepositTask', '20190307', 'normal', '2019-03-07 01:00:00', '2019-03-07 01:00:00', '定存检查定时任务成功检查,取消定存用户：0人，成功释放利息：0人', '2019-03-07 01:00:00', '0');
INSERT INTO `t_task` VALUES ('2fa1140ec4d243ce9ec0d2c830193626', 'cleanLog', '20190329', 'normal', '2019-03-29 01:00:00', '2019-03-29 01:00:13', '删除日志成功删除0行', '2019-03-29 01:00:00', '0');
INSERT INTO `t_task` VALUES ('3018a022db844559ab662668c0774e1f', 'FixedDepositTask', '20190411', 'normal', '2019-04-11 01:00:00', '2019-04-11 01:00:00', '定存检查定时任务成功检查,取消定存用户：0人，成功释放利息：1人', '2019-04-11 01:00:00', '0');
INSERT INTO `t_task` VALUES ('3288763a58c8429cbfb4fcd64f234ae7', 'CheckInTask', '20190330', 'normal', '2019-03-30 01:00:00', '2019-03-30 01:00:00', '昨日未签到用户0个', '2019-03-30 01:00:00', '0');
INSERT INTO `t_task` VALUES ('3292d4333fc54c01b5cec675cc99de5d', 'FixedDepositTask', '20190404', 'error', '2019-04-04 01:00:00', '2019-04-04 01:00:01', '定存检查定时任务失败：\n### Error updating database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Column \'tid\' cannot be null\n### The error may involve com.sesame.sesame.dao.SwAccountRecordDao.save-Inline\n### The error occurred while setting parameters\n### SQL: insert into t_sw_account_record         (                                     `tid`,                                      `user_id`,                                                 `num`,                                                 `type`,                                                  `coin_type_id`,                                                  `currency`,                                                  `remark`,                                                  `ex1`,                                                  `ex2`,                                                  `ex3`,                                                  `create_date`,                                                  `update_date`,                                                  `del_flag`                             )         values         (                                     ?,                                      ?,                                                 ?,                                                 ?,                                                  ?,                                                  ?,                                                  ?,                                                  ?,                                                  ?,                                                  ?,                                                  ?,                                                  ?,                                                  ?                             )\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Column \'tid\' cannot be null\n; ]; Column \'tid\' cannot be null; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Column \'tid\' cannot be null', '2019-04-04 01:00:00', '0');
INSERT INTO `t_task` VALUES ('33d821eb0bbb4a21a3cc55b4305111f9', 'cleanLog', '20190401', 'normal', '2019-04-01 01:00:00', '2019-04-01 01:00:09', '删除日志成功删除0行', '2019-04-01 01:00:00', '0');
INSERT INTO `t_task` VALUES ('34e467a939484c58b990ed3fcad161e6', 'cleanLog', '20190320', 'normal', '2019-03-20 01:00:00', '2019-03-20 01:00:00', '删除日志成功删除0行', '2019-03-20 01:00:00', '0');
INSERT INTO `t_task` VALUES ('36a898e0b5934822905f0045d387083c', 'FixedDepositTask', '20190422', 'normal', '2019-04-22 01:00:00', '2019-04-22 01:00:00', '定存检查定时任务成功检查,取消定存用户：0人，成功释放利息：0人', '2019-04-22 01:00:00', '0');
INSERT INTO `t_task` VALUES ('36cd85f792d94b36bd1931dd82e2cc0c', 'cleanLog', '20190430', 'normal', '2019-04-30 01:00:00', '2019-04-30 01:00:00', '删除日志成功删除1286行', '2019-04-30 01:00:00', '0');
INSERT INTO `t_task` VALUES ('36da188dba20498f897b664d620114b7', 'FixedDepositTask', '20190412', 'normal', '2019-04-12 01:00:00', '2019-04-12 01:00:00', '定存检查定时任务成功检查,取消定存用户：0人，成功释放利息：0人', '2019-04-12 01:00:00', '0');
INSERT INTO `t_task` VALUES ('38493b4ff2f24189b527dbbd1102e003', 'FixedDepositTask', '20190305', 'normal', '2019-03-05 01:00:00', '2019-03-05 01:00:00', '定存检查定时任务成功检查,取消定存用户：0人，成功释放利息：0人', '2019-03-05 01:00:00', '0');
INSERT INTO `t_task` VALUES ('3c18bc67a0394f0cb868c22990a4d352', 'FixedDepositTask', '20190312', 'normal', '2019-03-12 01:00:00', '2019-03-12 01:00:00', '定存检查定时任务成功检查,取消定存用户：0人，成功释放利息：0人', '2019-03-12 01:00:00', '0');
INSERT INTO `t_task` VALUES ('3c88b68108af447f8f9c14fd1e55a75c', 'cleanLog', '20190405', 'normal', '2019-04-05 01:00:00', '2019-04-05 01:00:00', '删除日志成功删除0行', '2019-04-05 01:00:00', '0');
INSERT INTO `t_task` VALUES ('3cd27d653c3d4159b63de695b832b734', 'CheckInTask', '20190312', 'normal', '2019-03-12 01:00:00', '2019-03-12 01:00:00', '昨日未签到用户0个', '2019-03-12 01:00:00', '0');
INSERT INTO `t_task` VALUES ('3e9f7509383b4a81a5a646cd0cb51b18', 'FixedDepositTask', '20190425', 'normal', '2019-04-25 01:00:00', '2019-04-25 01:00:00', '定存检查定时任务成功检查,取消定存用户：0人，成功释放利息：0人', '2019-04-25 01:00:00', '0');
INSERT INTO `t_task` VALUES ('3f90bddcf69f4d548371370645abe291', 'cleanLog', '20190409', 'normal', '2019-04-09 01:00:00', '2019-04-09 01:00:00', '删除日志成功删除1179行', '2019-04-09 01:00:00', '0');
INSERT INTO `t_task` VALUES ('428e34abecc14827b3d56ae7c8c0026c', 'cleanLog', '20190404', 'normal', '2019-04-04 01:00:00', '2019-04-04 01:00:00', '删除日志成功删除0行', '2019-04-04 01:00:00', '0');
INSERT INTO `t_task` VALUES ('42da1182a77347eabb3caf0820a22939', 'FixedDepositTask', '20190330', 'normal', '2019-03-30 01:00:00', '2019-03-30 01:00:00', '定存检查定时任务成功检查,取消定存用户：0人，成功释放利息：0人', '2019-03-30 01:00:00', '0');
INSERT INTO `t_task` VALUES ('43b5e6a625a44e7a892b51d51f30b07a', 'FixedDepositTask', '20190426', 'normal', '2019-04-26 01:00:00', '2019-04-26 01:00:00', '定存检查定时任务成功检查,取消定存用户：0人，成功释放利息：0人', '2019-04-26 01:00:00', '0');
INSERT INTO `t_task` VALUES ('44d711183ba74a9581d640d23b4d660c', 'cleanLog', '20190501', 'normal', '2019-05-01 01:00:00', '2019-05-01 01:00:00', '删除日志成功删除833行', '2019-05-01 01:00:00', '0');
INSERT INTO `t_task` VALUES ('454dbd4d512643aa82058ff70e383874', 'CheckInTask', '20190424', 'normal', '2019-04-24 01:00:00', '2019-04-24 01:00:00', '昨日未签到用户0个', '2019-04-24 01:00:00', '0');
INSERT INTO `t_task` VALUES ('460dd37244964634a7d013f184679dd3', 'CheckInTask', '20190405', 'normal', '2019-04-05 00:59:04', '2019-04-05 00:59:04', '昨日未签到用户0个', '2019-04-05 00:59:04', '0');
INSERT INTO `t_task` VALUES ('4655d0891a1849c8901b95359132f6f8', 'cleanLog', '20190331', 'normal', '2019-03-31 01:00:00', '2019-03-31 01:00:14', '删除日志成功删除1478行', '2019-03-31 01:00:00', '0');
INSERT INTO `t_task` VALUES ('46b77d1fbc56417da8af8a194cc25571', 'CheckInTask', '20190319', 'normal', '2019-03-19 00:59:57', '2019-03-19 00:59:57', '昨日未签到用户0个', '2019-03-19 00:59:57', '0');
INSERT INTO `t_task` VALUES ('475308ebfb0043e4bde461201fd004be', 'cleanLog', '20190402', 'normal', '2019-04-02 01:00:00', '2019-04-02 01:02:38', '删除日志成功删除5562319行', '2019-04-02 01:00:00', '0');
INSERT INTO `t_task` VALUES ('48504ee7bdae43879da5e9f48d889379', 'CheckInTask', '20190419', 'normal', '2019-04-19 01:00:00', '2019-04-19 01:00:01', '昨日未签到用户0个', '2019-04-19 01:00:00', '0');
INSERT INTO `t_task` VALUES ('499c5b7a9e65448dad7bf930d3013ec4', 'CheckInTask', '20190305', 'normal', '2019-03-05 01:00:00', '2019-03-05 01:00:00', '昨日未签到用户0个', '2019-03-05 01:00:00', '0');
INSERT INTO `t_task` VALUES ('49f655704c2c425e8137076bb7c6021a', 'FixedDepositTask', '20190425', 'normal', '2019-04-25 01:00:00', '2019-04-25 01:00:00', '定存检查定时任务成功检查,取消定存用户：0人，成功释放利息：0人', '2019-04-25 01:00:00', '0');
INSERT INTO `t_task` VALUES ('4af9b84ce5a94eb6a10cc9d354bde71e', 'FixedDepositTask', '20190425', 'normal', '2019-04-25 01:00:00', '2019-04-25 01:00:00', '定存检查定时任务成功检查,取消定存用户：0人，成功释放利息：0人', '2019-04-25 01:00:00', '0');
INSERT INTO `t_task` VALUES ('4be5d3c7837247fb840a5f7788e316cf', 'cleanLog', '20190418', 'normal', '2019-04-18 01:00:00', '2019-04-18 01:00:00', '删除日志成功删除2行', '2019-04-18 01:00:00', '0');
INSERT INTO `t_task` VALUES ('4c34f4ea13d24a099ea04338d6b38507', 'FixedDepositTask', '20190408', 'normal', '2019-04-08 01:00:00', '2019-04-08 01:00:00', '定存检查定时任务成功检查,取消定存用户：0人，成功释放利息：0人', '2019-04-08 01:00:00', '0');
INSERT INTO `t_task` VALUES ('4d7e85c3d57b4314aafff2e283a9e045', 'CheckInTask', '20190430', 'normal', '2019-04-30 01:00:00', '2019-04-30 01:00:00', '昨日未签到用户2个', '2019-04-30 01:00:00', '0');
INSERT INTO `t_task` VALUES ('4db1e02356824585bfd5b40c250c0766', 'cleanLog', '20190408', 'normal', '2019-04-08 01:00:00', '2019-04-08 01:00:00', '删除日志成功删除0行', '2019-04-08 01:00:00', '0');
INSERT INTO `t_task` VALUES ('4e0e6c8401664a8dba52743b31f162c9', 'FixedDepositTask', '20190430', 'normal', '2019-04-30 01:00:00', '2019-04-30 01:00:00', '定存检查定时任务成功检查,取消定存用户：0人，成功释放利息：0人', '2019-04-30 01:00:00', '0');
INSERT INTO `t_task` VALUES ('4f3eef2be60c4ee89a059b3dfcdc3826', 'FixedDepositTask', '20190327', 'normal', '2019-03-27 01:00:00', '2019-03-27 01:00:00', '定存检查定时任务成功检查,取消定存用户：0人，成功释放利息：0人', '2019-03-27 01:00:00', '0');
INSERT INTO `t_task` VALUES ('504dcf3d21954f9b93c94872c3677827', 'FixedDepositTask', '20190507', 'normal', '2019-05-07 01:00:00', '2019-05-07 01:00:00', '定存检查定时任务成功检查,取消定存用户：0人，成功释放利息：0人', '2019-05-07 01:00:00', '0');
INSERT INTO `t_task` VALUES ('5110a0daa8dd40e283906c5d2ad43b95', 'cleanLog', '20190504', 'normal', '2019-05-04 01:00:00', '2019-05-04 01:00:00', '删除日志成功删除2267行', '2019-05-04 01:00:00', '0');
INSERT INTO `t_task` VALUES ('525dfee074024ec2a8d30503bfc636cc', 'FixedDepositTask', '20190405', 'normal', '2019-04-05 01:00:00', '2019-04-05 01:00:00', '定存检查定时任务成功检查,取消定存用户：0人，成功释放利息：0人', '2019-04-05 01:00:00', '0');
INSERT INTO `t_task` VALUES ('5330ec35ec5045bfad79d112a51b316b', 'cleanLog', '20190413', 'normal', '2019-04-13 01:00:00', '2019-04-13 01:00:00', '删除日志成功删除1956行', '2019-04-13 01:00:00', '0');
INSERT INTO `t_task` VALUES ('539c51a4dd364916906c2e8cc8137b87', 'FixedDepositTask', '20190319', 'normal', '2019-03-19 00:59:57', '2019-03-19 00:59:57', '定存检查定时任务成功检查,取消定存用户：0人，成功释放利息：0人', '2019-03-19 00:59:57', '0');
INSERT INTO `t_task` VALUES ('55307bff6bb746a79dfb72da07e9647a', 'CheckInTask', '20190422', 'normal', '2019-04-22 01:00:00', '2019-04-22 01:00:01', '昨日未签到用户2个', '2019-04-22 01:00:00', '0');
INSERT INTO `t_task` VALUES ('55fc9297257c4950b641d20ca40b744f', 'FixedDepositTask', '20190408', 'normal', '2019-04-08 01:00:00', '2019-04-08 01:00:00', '定存检查定时任务成功检查,取消定存用户：0人，成功释放利息：0人', '2019-04-08 01:00:00', '0');
INSERT INTO `t_task` VALUES ('577efcf4ee5e490aa72ee1c0af0583e9', 'FixedDepositTask', '20190426', 'normal', '2019-04-26 01:00:00', '2019-04-26 01:00:00', '定存检查定时任务成功检查,取消定存用户：0人，成功释放利息：0人', '2019-04-26 01:00:00', '0');
INSERT INTO `t_task` VALUES ('583dc8e5a7f245e8b897e9508b995f14', 'FixedDepositTask', '20190326', 'normal', '2019-03-26 01:00:00', '2019-03-26 01:00:00', '定存检查定时任务成功检查,取消定存用户：1人，成功释放利息：0人', '2019-03-26 01:00:00', '0');
INSERT INTO `t_task` VALUES ('583f7ce566e942bf8c9fba97561e6d7f', 'cleanLog', '20190428', 'normal', '2019-04-28 01:00:00', '2019-04-28 01:00:00', '删除日志成功删除1351行', '2019-04-28 01:00:00', '0');
INSERT INTO `t_task` VALUES ('596880eebedc4c57a96e89e08dfb39e6', 'CheckInTask', '20190408', 'normal', '2019-04-08 01:00:00', '2019-04-08 01:00:00', '昨日未签到用户2个', '2019-04-08 01:00:00', '0');
INSERT INTO `t_task` VALUES ('5a4fd9c2d6e543d8aff5c3faf5349631', 'FixedDepositTask', '20190402', 'normal', '2019-04-02 01:02:39', '2019-04-02 01:02:39', '定存检查定时任务成功检查,取消定存用户：0人，成功释放利息：0人', '2019-04-02 01:02:39', '0');
INSERT INTO `t_task` VALUES ('5c6ce1e539cb41d79525f8783c4eeb07', 'cleanLog', '20190330', 'normal', '2019-03-30 00:59:57', '2019-03-30 01:00:04', '删除日志成功删除229行', '2019-03-30 00:59:57', '0');
INSERT INTO `t_task` VALUES ('5c9ab7fbaa2f4a5dbc2deffa3928dc3b', 'CheckInTask', '20190405', 'normal', '2019-04-05 01:00:00', '2019-04-05 01:00:00', '昨日未签到用户0个', '2019-04-05 01:00:00', '0');
INSERT INTO `t_task` VALUES ('5edc46a0fcf2427aae7320064affbc5a', 'FixedDepositTask', '20190429', 'normal', '2019-04-29 01:00:00', '2019-04-29 01:00:00', '定存检查定时任务成功检查,取消定存用户：0人，成功释放利息：0人', '2019-04-29 01:00:00', '0');
INSERT INTO `t_task` VALUES ('5fa6befd09d4498aa811dc8fb5482d38', 'CheckInTask', '20190320', 'normal', '2019-03-20 01:00:00', '2019-03-20 01:00:00', '昨日未签到用户0个', '2019-03-20 01:00:00', '0');
INSERT INTO `t_task` VALUES ('60ef3e59ab53454f8d17a53e19f72b5f', 'FixedDepositTask', '20190406', 'normal', '2019-04-06 01:00:00', '2019-04-06 01:00:00', '定存检查定时任务成功检查,取消定存用户：0人，成功释放利息：0人', '2019-04-06 01:00:00', '0');
INSERT INTO `t_task` VALUES ('6196115a61554f95ac0f30acfbcee61d', 'cleanLog', '20190425', 'normal', '2019-04-25 01:00:00', '2019-04-25 01:00:00', '删除日志成功删除0行', '2019-04-25 01:00:00', '0');
INSERT INTO `t_task` VALUES ('61eae710eb32486fa0f46d445e567900', 'CheckInTask', '20190404', 'normal', '2019-04-04 01:00:00', '2019-04-04 01:00:00', '昨日未签到用户0个', '2019-04-04 01:00:00', '0');
INSERT INTO `t_task` VALUES ('64352336f0a14fccb462ae08a52f45fe', 'CheckInTask', '20190412', 'normal', '2019-04-12 01:00:00', '2019-04-12 01:00:00', '昨日未签到用户0个', '2019-04-12 01:00:00', '0');
INSERT INTO `t_task` VALUES ('67925f508dfe42a790361b8694afca4d', 'cleanLog', '20190507', 'normal', '2019-05-07 01:00:00', '2019-05-07 01:00:00', '删除日志成功删除0行', '2019-05-07 01:00:00', '0');
INSERT INTO `t_task` VALUES ('688ad3a709754f72a8bf19ec32a7f1b1', 'CheckInTask', '20190425', 'normal', '2019-04-25 01:00:00', '2019-04-25 01:00:00', '昨日未签到用户0个', '2019-04-25 01:00:00', '0');
INSERT INTO `t_task` VALUES ('6bd83dbf8b4d4bb4a0c624912452e9bd', 'FixedDepositTask', '20190502', 'normal', '2019-05-02 01:00:00', '2019-05-02 01:00:00', '定存检查定时任务成功检查,取消定存用户：0人，成功释放利息：0人', '2019-05-02 01:00:00', '0');
INSERT INTO `t_task` VALUES ('6cadf3a5bfc4445b8f7e5ae367f7860d', 'cleanLog', '20190506', 'normal', '2019-05-06 01:00:03', '2019-05-06 01:00:03', '删除日志成功删除0行', '2019-05-06 01:00:03', '0');
INSERT INTO `t_task` VALUES ('6dac40cbc147434c90fd053902f4ffb8', 'FixedDepositTask', '20190320', 'normal', '2019-03-20 01:00:00', '2019-03-20 01:00:00', '定存检查定时任务成功检查,取消定存用户：0人，成功释放利息：0人', '2019-03-20 01:00:00', '0');
INSERT INTO `t_task` VALUES ('6efc08da8d52420585d32796d47fb88a', 'CheckInTask', '20190331', 'normal', '2019-03-31 01:00:00', '2019-03-31 01:00:00', '昨日未签到用户0个', '2019-03-31 01:00:00', '0');
INSERT INTO `t_task` VALUES ('6f6b111d00dc44bc8471b39d6eeb4ab9', 'cleanLog', '20190430', 'normal', '2019-04-30 01:00:00', '2019-04-30 01:00:00', '删除日志成功删除0行', '2019-04-30 01:00:00', '0');
INSERT INTO `t_task` VALUES ('70b13d1570b14ec5beea029e421ec323', 'cleanLog', '20190405', 'normal', '2019-04-05 01:00:00', '2019-04-05 01:00:00', '删除日志成功删除0行', '2019-04-05 01:00:00', '0');
INSERT INTO `t_task` VALUES ('70c15a5c1fc940eba1e3efee829491d1', 'cleanLog', '20190503', 'normal', '2019-05-03 01:00:00', '2019-05-03 01:00:00', '删除日志成功删除1619行', '2019-05-03 01:00:00', '0');
INSERT INTO `t_task` VALUES ('71c6cb02dfbe4230ba70737696aea809', 'cleanLog', '20190425', 'normal', '2019-04-25 01:00:00', '2019-04-25 01:00:00', '删除日志成功删除0行', '2019-04-25 01:00:00', '0');
INSERT INTO `t_task` VALUES ('723169616aed48c8ac9df2e9a48054cd', 'FixedDepositTask', '20190407', 'normal', '2019-04-07 01:00:00', '2019-04-07 01:00:00', '定存检查定时任务成功检查,取消定存用户：0人，成功释放利息：0人', '2019-04-07 01:00:00', '0');
INSERT INTO `t_task` VALUES ('7265d6cd1b1c410eb5600032ed164a3e', 'FixedDepositTask', '20190410', 'normal', '2019-04-10 01:00:00', '2019-04-10 01:00:00', '定存检查定时任务成功检查,取消定存用户：0人，成功释放利息：0人', '2019-04-10 01:00:00', '0');
INSERT INTO `t_task` VALUES ('7544e2437db84a8e8b974ff534e57506', 'CheckInTask', '20190424', 'normal', '2019-04-24 01:00:00', '2019-04-24 01:00:00', '昨日未签到用户0个', '2019-04-24 01:00:00', '0');
INSERT INTO `t_task` VALUES ('75a2a06669c640f09de669de2732aa68', 'CheckInTask', '20190419', 'normal', '2019-04-19 01:00:00', '2019-04-19 01:00:00', '昨日未签到用户0个', '2019-04-19 01:00:00', '0');
INSERT INTO `t_task` VALUES ('7706339c37234278a1e5fea0bf73dda1', 'CheckInTask', '20190327', 'normal', '2019-03-27 01:00:00', '2019-03-27 01:00:00', '昨日未签到用户0个', '2019-03-27 01:00:00', '0');
INSERT INTO `t_task` VALUES ('7779d417de3a4b1e801a6f8fa9d59820', 'FixedDepositTask', '20190403', 'normal', '2019-04-03 01:00:02', '2019-04-03 01:00:29', '定存检查定时任务成功检查,取消定存用户：0人，成功释放利息：0人', '2019-04-03 01:00:02', '0');
INSERT INTO `t_task` VALUES ('77894c4e313948c984117934831528df', 'FixedDepositTask', '20190506', 'normal', '2019-05-06 01:00:00', '2019-05-06 01:00:00', '定存检查定时任务成功检查,取消定存用户：0人，成功释放利息：0人', '2019-05-06 01:00:00', '0');
INSERT INTO `t_task` VALUES ('7bb540ed4ec84ccfa898e3822f1ee23e', 'CheckInTask', '20190328', 'normal', '2019-03-28 01:00:00', '2019-03-28 01:00:00', '昨日未签到用户0个', '2019-03-28 01:00:00', '0');
INSERT INTO `t_task` VALUES ('7c5da3c7225046b9ab019dc65ce182fd', 'cleanLog', '20190405', 'normal', '2019-04-05 00:59:04', '2019-04-05 00:59:04', '删除日志成功删除285行', '2019-04-05 00:59:04', '0');
INSERT INTO `t_task` VALUES ('7c66855c440a4b89b37038107fb497f3', 'cleanLog', '20190326', 'normal', '2019-03-26 01:00:00', '2019-03-26 01:00:00', '删除日志成功删除323行', '2019-03-26 01:00:00', '0');
INSERT INTO `t_task` VALUES ('7cfcec4c124241909dfb66a90fb2eebe', 'cleanLog', '20190423', 'normal', '2019-04-23 01:00:00', '2019-04-23 01:00:00', '删除日志成功删除0行', '2019-04-23 01:00:00', '0');
INSERT INTO `t_task` VALUES ('7dcffeee23404113bc28e85c08195ebb', 'FixedDepositTask', '20190421', 'normal', '2019-04-21 01:00:02', '2019-04-21 01:00:02', '定存检查定时任务成功检查,取消定存用户：0人，成功释放利息：0人', '2019-04-21 01:00:02', '0');
INSERT INTO `t_task` VALUES ('826544b00ee646a8b59b20aa37aababf', 'FixedDepositTask', '20190308', 'normal', '2019-03-08 01:00:00', '2019-03-08 01:00:00', '定存检查定时任务成功检查,取消定存用户：0人，成功释放利息：0人', '2019-03-08 01:00:00', '0');
INSERT INTO `t_task` VALUES ('83565c88b912485394e8a860581a2482', 'CheckInTask', '20190418', 'normal', '2019-04-18 01:00:00', '2019-04-18 01:00:00', '昨日未签到用户0个', '2019-04-18 01:00:00', '0');
INSERT INTO `t_task` VALUES ('85f10cd3559f4a07b4e2ed2281a9bf18', 'CheckInTask', '20190429', 'normal', '2019-04-29 01:00:00', '2019-04-29 01:00:00', '昨日未签到用户0个', '2019-04-29 01:00:00', '0');
INSERT INTO `t_task` VALUES ('86d1313fb8e940d2aa1549dbdfbc4550', 'CheckInTask', '20190409', 'normal', '2019-04-09 01:00:00', '2019-04-09 01:00:00', '昨日未签到用户1个', '2019-04-09 01:00:00', '0');
INSERT INTO `t_task` VALUES ('874a24c452a349f1b7d956aa2d014dba', 'cleanLog', '20190506', 'normal', '2019-05-06 01:00:00', '2019-05-06 01:00:00', '删除日志成功删除0行', '2019-05-06 01:00:00', '0');
INSERT INTO `t_task` VALUES ('8862394c41184c3c80e028f97ed2b055', 'CheckInTask', '20190417', 'normal', '2019-04-17 01:00:00', '2019-04-17 01:00:00', '昨日未签到用户0个', '2019-04-17 01:00:00', '0');
INSERT INTO `t_task` VALUES ('88ea581613e640428aef6af386355970', 'cleanLog', '20190404', 'normal', '2019-04-04 01:00:00', '2019-04-04 01:00:00', '删除日志成功删除226行', '2019-04-04 01:00:00', '0');
INSERT INTO `t_task` VALUES ('89b6d17e511043b9a299319a2246fd69', 'CheckInTask', '20190404', 'normal', '2019-04-04 01:00:00', '2019-04-04 01:00:00', '昨日未签到用户0个', '2019-04-04 01:00:00', '0');
INSERT INTO `t_task` VALUES ('8add01f1f9014d4f983619112ec7e7fa', 'CheckInTask', '20190308', 'normal', '2019-03-08 01:00:00', '2019-03-08 01:00:00', '昨日未签到用户0个', '2019-03-08 01:00:00', '0');
INSERT INTO `t_task` VALUES ('8b1c31e1d054451da1e3b37a624b6940', 'FixedDepositTask', '20190331', 'normal', '2019-03-31 01:00:00', '2019-03-31 01:00:00', '定存检查定时任务成功检查,取消定存用户：0人，成功释放利息：0人', '2019-03-31 01:00:00', '0');
INSERT INTO `t_task` VALUES ('8c3bbd1dae034b54a5e856d806be3c15', 'FixedDepositTask', '20190507', 'normal', '2019-05-07 01:00:00', '2019-05-07 01:00:00', '定存检查定时任务成功检查,取消定存用户：0人，成功释放利息：0人', '2019-05-07 01:00:00', '0');
INSERT INTO `t_task` VALUES ('8cdeda6d5de94d369d079127a3f5ddc9', 'cleanLog', '20190425', 'normal', '2019-04-25 01:00:00', '2019-04-25 01:00:00', '删除日志成功删除0行', '2019-04-25 01:00:00', '0');
INSERT INTO `t_task` VALUES ('8d5f1459f3c9407d90ef0c33caca6f32', 'FixedDepositTask', '20190422', 'normal', '2019-04-22 01:00:00', '2019-04-22 01:00:00', '定存检查定时任务成功检查,取消定存用户：0人，成功释放利息：0人', '2019-04-22 01:00:00', '0');
INSERT INTO `t_task` VALUES ('8fc9260b0894481491da513854655748', 'FixedDepositTask', '20190421', 'normal', '2019-04-21 01:00:00', '2019-04-21 01:00:00', '定存检查定时任务成功检查,取消定存用户：0人，成功释放利息：0人', '2019-04-21 01:00:00', '0');
INSERT INTO `t_task` VALUES ('906db6305613407d828761987d6d4561', 'CheckInTask', '20190506', 'normal', '2019-05-06 01:00:00', '2019-05-06 01:00:00', '昨日未签到用户0个', '2019-05-06 01:00:00', '0');
INSERT INTO `t_task` VALUES ('90cd642684c94769830501b7e94c04d5', 'CheckInTask', '20190504', 'normal', '2019-05-04 01:00:00', '2019-05-04 01:00:00', '昨日未签到用户0个', '2019-05-04 01:00:00', '0');
INSERT INTO `t_task` VALUES ('925dcb081b9f4b9fa1ed01fd25a0ccb4', 'cleanLog', '20190430', 'normal', '2019-04-30 01:00:00', '2019-04-30 01:00:00', '删除日志成功删除467行', '2019-04-30 01:00:00', '0');
INSERT INTO `t_task` VALUES ('93d21475013741ed945a7880b5de3113', 'cleanLog', '20190419', 'normal', '2019-04-19 01:00:00', '2019-04-19 01:00:01', '删除日志成功删除6行', '2019-04-19 01:00:00', '0');
INSERT INTO `t_task` VALUES ('96ffb57a65f141e18daa4528b5506c56', 'CheckInTask', '20190329', 'normal', '2019-03-29 01:00:00', '2019-03-29 01:00:00', '昨日未签到用户0个', '2019-03-29 01:00:00', '0');
INSERT INTO `t_task` VALUES ('972d0f65dd3241c78195cea0874517b2', 'FixedDepositTask', '20190506', 'normal', '2019-05-06 01:00:03', '2019-05-06 01:00:03', '定存检查定时任务成功检查,取消定存用户：0人，成功释放利息：0人', '2019-05-06 01:00:03', '0');
INSERT INTO `t_task` VALUES ('983cc5f4d4164dc9b196dbc6c1028b55', 'CheckInTask', '20190321', 'normal', '2019-03-21 01:00:00', '2019-03-21 01:00:00', '昨日未签到用户0个', '2019-03-21 01:00:00', '0');
INSERT INTO `t_task` VALUES ('995e40a004ee4e34baee92cdf344f966', 'CheckInTask', '20190426', 'normal', '2019-04-26 01:00:00', '2019-04-26 01:00:00', '昨日未签到用户0个', '2019-04-26 01:00:00', '0');
INSERT INTO `t_task` VALUES ('9b7cf8fb6b5d4c9ea6b128fe39f94d6e', 'CheckInTask', '20190407', 'normal', '2019-04-07 01:00:00', '2019-04-07 01:00:00', '昨日未签到用户2个', '2019-04-07 01:00:00', '0');
INSERT INTO `t_task` VALUES ('9bb4ead5de3a4bf0983d956cecc38684', 'cleanLog', '20190506', 'normal', '2019-05-06 01:00:00', '2019-05-06 01:00:00', '删除日志成功删除30行', '2019-05-06 01:00:00', '0');
INSERT INTO `t_task` VALUES ('9d202a01622b4177a3536683b1c11cbe', 'cleanLog', '20190507', 'normal', '2019-05-07 01:00:00', '2019-05-07 01:00:00', '删除日志成功删除0行', '2019-05-07 01:00:00', '0');
INSERT INTO `t_task` VALUES ('9dac6a7ef8fc46e08dbff61a5c1b96ca', 'FixedDepositTask', '20190329', 'normal', '2019-03-29 01:00:13', '2019-03-29 01:00:13', '定存检查定时任务成功检查,取消定存用户：0人，成功释放利息：0人', '2019-03-29 01:00:13', '0');
INSERT INTO `t_task` VALUES ('9e6abfc5ee1d40f99747e69f8364136c', 'FixedDepositTask', '20190405', 'normal', '2019-04-05 01:00:00', '2019-04-05 01:00:00', '定存检查定时任务成功检查,取消定存用户：0人，成功释放利息：5人', '2019-04-05 01:00:00', '0');
INSERT INTO `t_task` VALUES ('9ef456beb9cb433f80ea469ad88d45ee', 'FixedDepositTask', '20190404', 'normal', '2019-04-04 01:00:01', '2019-04-04 01:00:01', '定存检查定时任务成功检查,取消定存用户：0人，成功释放利息：0人', '2019-04-04 01:00:01', '0');
INSERT INTO `t_task` VALUES ('9f03de4e1302432f867692ba98a5e8f5', 'CheckInTask', '20190429', 'normal', '2019-04-29 01:00:00', '2019-04-29 01:00:00', '昨日未签到用户0个', '2019-04-29 01:00:00', '0');
INSERT INTO `t_task` VALUES ('a156baa5a0cc4df18c2514a97f2054b8', 'FixedDepositTask', '20190505', 'normal', '2019-05-05 01:00:00', '2019-05-05 01:00:00', '定存检查定时任务成功检查,取消定存用户：0人，成功释放利息：0人', '2019-05-05 01:00:00', '0');
INSERT INTO `t_task` VALUES ('a2a75b5756aa41ee87325fb3f19cb517', 'FixedDepositTask', '20190404', 'normal', '2019-04-04 01:00:00', '2019-04-04 01:00:02', '定存检查定时任务成功检查,取消定存用户：0人，成功释放利息：4人', '2019-04-04 01:00:00', '0');
INSERT INTO `t_task` VALUES ('a2acfc976b5b45489cdc4fca98621738', 'FixedDepositTask', '20190430', 'normal', '2019-04-30 01:00:00', '2019-04-30 01:00:00', '定存检查定时任务成功检查,取消定存用户：0人，成功释放利息：0人', '2019-04-30 01:00:00', '0');
INSERT INTO `t_task` VALUES ('a39d2b790ede4c0b8d1394631cb7eaa8', 'FixedDepositTask', '20190404', 'normal', '2019-04-04 01:00:00', '2019-04-04 01:00:00', '定存检查定时任务成功检查,取消定存用户：0人，成功释放利息：0人', '2019-04-04 01:00:00', '0');
INSERT INTO `t_task` VALUES ('a58efd47bf9546e1ababd9a025c99b2f', 'CheckInTask', '20190424', 'normal', '2019-04-24 01:00:00', '2019-04-24 01:00:00', '昨日未签到用户0个', '2019-04-24 01:00:00', '0');
INSERT INTO `t_task` VALUES ('a596b764166445278e8acf7d52d07074', 'CheckInTask', '20190501', 'normal', '2019-05-01 01:00:00', '2019-05-01 01:00:00', '昨日未签到用户0个', '2019-05-01 01:00:00', '0');
INSERT INTO `t_task` VALUES ('a7447987141a4db2b3ba5d522086790d', 'CheckInTask', '20190426', 'normal', '2019-04-26 01:00:00', '2019-04-26 01:00:00', '昨日未签到用户0个', '2019-04-26 01:00:00', '0');
INSERT INTO `t_task` VALUES ('a823f6915d9242468c4d3933b00b38fa', 'cleanLog', '20190315', 'normal', '2019-03-15 00:59:56', '2019-03-15 00:59:56', '删除日志成功删除174行', '2019-03-15 00:59:56', '0');
INSERT INTO `t_task` VALUES ('a84bfbc896094d10927a4e708e7cbc3c', 'cleanLog', '20190330', 'normal', '2019-03-30 01:00:00', '2019-03-30 01:00:10', '删除日志成功删除0行', '2019-03-30 01:00:00', '0');
INSERT INTO `t_task` VALUES ('a9c4805d969f44189aa556496fd2f61c', 'CheckInTask', '20190401', 'normal', '2019-04-01 01:00:09', '2019-04-01 01:00:09', '昨日未签到用户0个', '2019-04-01 01:00:09', '0');
INSERT INTO `t_task` VALUES ('a9cc0f8456274474a93351f4f689c4e4', 'CheckInTask', '20190420', 'normal', '2019-04-20 01:00:04', '2019-04-20 01:00:04', '昨日未签到用户0个', '2019-04-20 01:00:04', '0');
INSERT INTO `t_task` VALUES ('aa3d9b54452a41719a418a790fc874c8', 'CheckInTask', '20190505', 'normal', '2019-05-05 01:00:00', '2019-05-05 01:00:00', '昨日未签到用户0个', '2019-05-05 01:00:00', '0');
INSERT INTO `t_task` VALUES ('ab3ebd8b880641cbaf4928c52a1bb6d4', 'cleanLog', '20190321', 'normal', '2019-03-21 01:00:00', '2019-03-21 01:00:00', '删除日志成功删除0行', '2019-03-21 01:00:00', '0');
INSERT INTO `t_task` VALUES ('ac1a69511e274f869f015a06058733ae', 'CheckInTask', '20190422', 'normal', '2019-04-22 01:00:00', '2019-04-22 01:00:00', '昨日未签到用户2个', '2019-04-22 01:00:00', '0');
INSERT INTO `t_task` VALUES ('ac44d2efc9dc4a7682ad9d5fa4060dae', 'cleanLog', '20190417', 'normal', '2019-04-17 01:00:00', '2019-04-17 01:00:00', '删除日志成功删除654行', '2019-04-17 01:00:00', '0');
INSERT INTO `t_task` VALUES ('ac74f8ea4ec5472288f7bfed2e820cd8', 'CheckInTask', '20190427', 'normal', '2019-04-27 01:00:00', '2019-04-27 01:00:00', '昨日未签到用户0个', '2019-04-27 01:00:00', '0');
INSERT INTO `t_task` VALUES ('acfbcb833a6746f0aeb5f2fb3e37332e', 'CheckInTask', '20190329', 'normal', '2019-03-29 01:00:20', '2019-03-29 01:00:20', '昨日未签到用户0个', '2019-03-29 01:00:20', '0');
INSERT INTO `t_task` VALUES ('aede8dc8f2ca448db8e7170f86f1e14a', 'CheckInTask', '20190411', 'normal', '2019-04-11 01:00:00', '2019-04-11 01:00:00', '昨日未签到用户0个', '2019-04-11 01:00:00', '0');
INSERT INTO `t_task` VALUES ('afdec2cad7a841f19c9a651dad427168', 'CheckInTask', '20190425', 'normal', '2019-04-25 01:00:00', '2019-04-25 01:00:00', '昨日未签到用户0个', '2019-04-25 01:00:00', '0');
INSERT INTO `t_task` VALUES ('b020c21e4a8d49f5be53374877327d55', 'cleanLog', '20190505', 'normal', '2019-05-05 01:00:00', '2019-05-05 01:00:00', '删除日志成功删除2541行', '2019-05-05 01:00:00', '0');
INSERT INTO `t_task` VALUES ('b11e95e787ff4787b64a1f2f46e2fc4b', 'FixedDepositTask', '20190429', 'normal', '2019-04-29 01:00:00', '2019-04-29 01:00:00', '定存检查定时任务成功检查,取消定存用户：0人，成功释放利息：0人', '2019-04-29 01:00:00', '0');
INSERT INTO `t_task` VALUES ('b19a8ce5981547ee9dba39a6080b5eab', 'CheckInTask', '20190506', 'normal', '2019-05-06 01:00:00', '2019-05-06 01:00:00', '昨日未签到用户0个', '2019-05-06 01:00:00', '0');
INSERT INTO `t_task` VALUES ('b19b37a9b25847098afe0ab231e00639', 'cleanLog', '20190507', 'normal', '2019-05-07 00:59:55', '2019-05-07 00:59:55', '删除日志成功删除18行', '2019-05-07 00:59:55', '0');
INSERT INTO `t_task` VALUES ('b1e949a4e380492ca05c5ef3ed206969', 'cleanLog', '20190424', 'normal', '2019-04-24 01:00:00', '2019-04-24 01:00:00', '删除日志成功删除0行', '2019-04-24 01:00:00', '0');
INSERT INTO `t_task` VALUES ('b24889091cb2417294c4dbd6e91116f9', 'cleanLog', '20190502', 'normal', '2019-05-02 01:00:00', '2019-05-02 01:00:00', '删除日志成功删除7行', '2019-05-02 01:00:00', '0');
INSERT INTO `t_task` VALUES ('b2ee608647d34a52ab4e4ad65a397ce8', 'CheckInTask', '20190405', 'normal', '2019-04-05 01:00:00', '2019-04-05 01:00:00', '昨日未签到用户0个', '2019-04-05 01:00:00', '0');
INSERT INTO `t_task` VALUES ('b58be2f7807e4654b8271c6f8fa8f218', 'CheckInTask', '20190416', 'normal', '2019-04-16 01:00:00', '2019-04-16 01:00:00', '昨日未签到用户0个', '2019-04-16 01:00:00', '0');
INSERT INTO `t_task` VALUES ('b5a374e987a14b728b71ddfe8edaa393', 'CheckInTask', '20190430', 'normal', '2019-04-30 01:00:00', '2019-04-30 01:00:00', '昨日未签到用户0个', '2019-04-30 01:00:00', '0');
INSERT INTO `t_task` VALUES ('b64771430e954a7d84eeccf7e7ef5de1', 'cleanLog', '20190405', 'normal', '2019-04-05 01:00:00', '2019-04-05 01:00:00', '删除日志成功删除0行', '2019-04-05 01:00:00', '0');
INSERT INTO `t_task` VALUES ('b6ac5065813a4b4d823e1fcd6af3753f', 'cleanLog', '20190426', 'normal', '2019-04-26 01:00:00', '2019-04-26 01:00:00', '删除日志成功删除0行', '2019-04-26 01:00:00', '0');
INSERT INTO `t_task` VALUES ('bad83f87d4a8472e814ec7da9aa60824', 'cleanLog', '20190420', 'normal', '2019-04-20 01:00:00', '2019-04-20 01:00:00', '删除日志成功删除432行', '2019-04-20 01:00:00', '0');
INSERT INTO `t_task` VALUES ('bd34ffda274d4b88be6755d46b27a2b0', 'cleanLog', '20190328', 'normal', '2019-03-28 01:00:00', '2019-03-28 01:00:00', '删除日志成功删除0行', '2019-03-28 01:00:00', '0');
INSERT INTO `t_task` VALUES ('bd80a3073c124db78f91ee4ed6f1c810', 'FixedDepositTask', '20190503', 'normal', '2019-05-03 01:00:00', '2019-05-03 01:00:00', '定存检查定时任务成功检查,取消定存用户：0人，成功释放利息：0人', '2019-05-03 01:00:00', '0');
INSERT INTO `t_task` VALUES ('bd94bc8c0d4b4fc3a2a223c1525537b4', 'CheckInTask', '20190413', 'normal', '2019-04-13 01:00:00', '2019-04-13 01:00:00', '昨日未签到用户0个', '2019-04-13 01:00:00', '0');
INSERT INTO `t_task` VALUES ('be296250d9ac4334bcf030ca008d53a8', 'cleanLog', '20190402', 'error', '2019-04-02 01:00:01', '2019-04-02 01:00:52', '删除日志失败\n### Error updating database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLTransactionRollbackException: Lock wait timeout exceeded; try restarting transaction\n### The error may involve com.sesame.common.basicskills.dao.LogDao.removeLTDate-Inline\n### The error occurred while setting parameters\n### SQL: delete from sys_log where gmt_create < ?\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLTransactionRollbackException: Lock wait timeout exceeded; try restarting transaction\n; ]; Lock wait timeout exceeded; try restarting transaction; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLTransactionRollbackException: Lock wait timeout exceeded; try restarting transaction', '2019-04-02 01:00:01', '0');
INSERT INTO `t_task` VALUES ('c198654f641b43daa871ee30d101187d', 'CheckInTask', '20190326', 'normal', '2019-03-26 01:00:00', '2019-03-26 01:00:00', '昨日未签到用户0个', '2019-03-26 01:00:00', '0');
INSERT INTO `t_task` VALUES ('c31d6c4bb1094844bb2f29880599ec83', 'CheckInTask', '20190327', 'normal', '2019-03-27 01:00:00', '2019-03-27 01:00:00', '昨日未签到用户0个', '2019-03-27 01:00:00', '0');
INSERT INTO `t_task` VALUES ('c3ec53bf5dfe4530a39638d74833ce03', 'cleanLog', '20190412', 'normal', '2019-04-12 01:00:00', '2019-04-12 01:00:00', '删除日志成功删除0行', '2019-04-12 01:00:00', '0');
INSERT INTO `t_task` VALUES ('c6683fea41da4dbdbb60e8138559617e', 'CheckInTask', '20190405', 'normal', '2019-04-05 01:00:00', '2019-04-05 01:00:00', '昨日未签到用户0个', '2019-04-05 01:00:00', '0');
INSERT INTO `t_task` VALUES ('c877dec3652e4dcd90502feed22701bc', 'CheckInTask', '20190403', 'normal', '2019-04-03 01:00:45', '2019-04-03 01:00:45', '昨日未签到用户0个', '2019-04-03 01:00:45', '0');
INSERT INTO `t_task` VALUES ('c8b3f5b5ef564118bf42fef33975026e', 'CheckInTask', '20190423', 'normal', '2019-04-23 01:00:00', '2019-04-23 01:00:00', '昨日未签到用户0个', '2019-04-23 01:00:00', '0');
INSERT INTO `t_task` VALUES ('c95e6baf7b664df38f0432460934cd74', 'CheckInTask', '20190405', 'normal', '2019-04-05 01:00:00', '2019-04-05 01:00:00', '昨日未签到用户0个', '2019-04-05 01:00:00', '0');
INSERT INTO `t_task` VALUES ('ca3f3eab53b9464eba94bd04a31c6fc5', 'FixedDepositTask', '20190414', 'normal', '2019-04-14 01:00:00', '2019-04-14 01:00:00', '定存检查定时任务成功检查,取消定存用户：0人，成功释放利息：0人', '2019-04-14 01:00:00', '0');
INSERT INTO `t_task` VALUES ('ca81cc64ec144393aa7049b0a4571d53', 'FixedDepositTask', '20190430', 'normal', '2019-04-30 01:00:00', '2019-04-30 01:00:00', '定存检查定时任务成功检查,取消定存用户：0人，成功释放利息：0人', '2019-04-30 01:00:00', '0');
INSERT INTO `t_task` VALUES ('caba7ed2ac7d47c889b0d1135b5a915f', 'FixedDepositTask', '20190328', 'normal', '2019-03-28 01:00:00', '2019-03-28 01:00:00', '定存检查定时任务成功检查,取消定存用户：0人，成功释放利息：0人', '2019-03-28 01:00:00', '0');
INSERT INTO `t_task` VALUES ('cc063d13e19b4b53b08131ca58d495bb', 'FixedDepositTask', '20190423', 'normal', '2019-04-23 01:00:00', '2019-04-23 01:00:00', '定存检查定时任务成功检查,取消定存用户：0人，成功释放利息：0人', '2019-04-23 01:00:00', '0');
INSERT INTO `t_task` VALUES ('ce16a04cdf8249b78b7ed3bc8c9366db', 'FixedDepositTask', '20190330', 'normal', '2019-03-30 01:00:04', '2019-03-30 01:00:04', '定存检查定时任务成功检查,取消定存用户：0人，成功释放利息：0人', '2019-03-30 01:00:04', '0');
INSERT INTO `t_task` VALUES ('cf65df7867d242f98818724260d71831', 'FixedDepositTask', '20190428', 'normal', '2019-04-28 01:00:00', '2019-04-28 01:00:00', '定存检查定时任务成功检查,取消定存用户：0人，成功释放利息：0人', '2019-04-28 01:00:00', '0');
INSERT INTO `t_task` VALUES ('d02f10049af34d7da9ebaa6fe8ab861e', 'cleanLog', '20190405', 'normal', '2019-04-05 01:00:00', '2019-04-05 01:00:00', '删除日志成功删除0行', '2019-04-05 01:00:00', '0');
INSERT INTO `t_task` VALUES ('d0cd53a4152a45579840c32192c99d51', 'CheckInTask', '20190328', 'normal', '2019-03-28 01:00:00', '2019-03-28 01:00:00', '昨日未签到用户0个', '2019-03-28 01:00:00', '0');
INSERT INTO `t_task` VALUES ('d16b9ab91e994ffa95e9adc1d1ba84bc', 'CheckInTask', '20190401', 'normal', '2019-04-01 01:00:00', '2019-04-01 01:00:00', '昨日未签到用户0个', '2019-04-01 01:00:00', '0');
INSERT INTO `t_task` VALUES ('d1e86dcfc6c746dda24bb19a547b49a1', 'CheckInTask', '20190421', 'normal', '2019-04-21 01:00:01', '2019-04-21 01:00:02', '昨日未签到用户2个', '2019-04-21 01:00:01', '0');
INSERT INTO `t_task` VALUES ('d28ef5c5f6de4e0195ca6dcfc04afce3', 'FixedDepositTask', '20190506', 'normal', '2019-05-06 01:00:00', '2019-05-06 01:00:00', '定存检查定时任务成功检查,取消定存用户：0人，成功释放利息：0人', '2019-05-06 01:00:00', '0');
INSERT INTO `t_task` VALUES ('d30d11f4433a45f89ea6c84a746a89e2', 'cleanLog', '20190404', 'normal', '2019-04-04 01:00:00', '2019-04-04 01:00:00', '删除日志成功删除0行', '2019-04-04 01:00:00', '0');
INSERT INTO `t_task` VALUES ('d35a1c63b9434009aa501ee72df8feac', 'FixedDepositTask', '20190416', 'normal', '2019-04-16 01:00:00', '2019-04-16 01:00:00', '定存检查定时任务成功检查,取消定存用户：0人，成功释放利息：0人', '2019-04-16 01:00:00', '0');
INSERT INTO `t_task` VALUES ('d394fdff2e3c4860abb1abc114007629', 'CheckInTask', '20190331', 'normal', '2019-03-31 01:00:14', '2019-03-31 01:00:14', '昨日未签到用户0个', '2019-03-31 01:00:14', '0');
INSERT INTO `t_task` VALUES ('d43db970cabe49668c75bb24292e4fda', 'CheckInTask', '20190507', 'normal', '2019-05-07 00:59:55', '2019-05-07 00:59:55', '昨日未签到用户0个', '2019-05-07 00:59:55', '0');
INSERT INTO `t_task` VALUES ('d5c39519d9ca4aa78d7223adb9ef5094', 'FixedDepositTask', '20190315', 'normal', '2019-03-15 00:59:56', '2019-03-15 00:59:56', '定存检查定时任务成功检查,取消定存用户：0人，成功释放利息：0人', '2019-03-15 00:59:56', '0');
INSERT INTO `t_task` VALUES ('d604be8bbf934c14a26193ebca4c75f1', 'CheckInTask', '20190425', 'normal', '2019-04-25 01:00:00', '2019-04-25 01:00:00', '昨日未签到用户0个', '2019-04-25 01:00:00', '0');
INSERT INTO `t_task` VALUES ('d6837c5633c3482184281706cd7a9c88', 'cleanLog', '20190408', 'normal', '2019-04-08 01:00:00', '2019-04-08 01:00:00', '删除日志成功删除908行', '2019-04-08 01:00:00', '0');
INSERT INTO `t_task` VALUES ('d71e8bec58c14bb783bc0b9dce636b6b', 'cleanLog', '20190407', 'normal', '2019-04-07 00:59:52', '2019-04-07 00:59:52', '删除日志成功删除1149行', '2019-04-07 00:59:52', '0');
INSERT INTO `t_task` VALUES ('d76bc0ac6c874e41a5b9aec564df7731', 'cleanLog', '20190416', 'normal', '2019-04-16 01:00:00', '2019-04-16 01:00:00', '删除日志成功删除3766行', '2019-04-16 01:00:00', '0');
INSERT INTO `t_task` VALUES ('d78f06af47154a55abf0a251e1ae931d', 'FixedDepositTask', '20190504', 'normal', '2019-05-04 01:00:00', '2019-05-04 01:00:00', '定存检查定时任务成功检查,取消定存用户：0人，成功释放利息：0人', '2019-05-04 01:00:00', '0');
INSERT INTO `t_task` VALUES ('d8657d60a9be475893787c139a603605', 'FixedDepositTask', '20190409', 'normal', '2019-04-09 01:00:00', '2019-04-09 01:00:00', '定存检查定时任务成功检查,取消定存用户：0人，成功释放利息：0人', '2019-04-09 01:00:00', '0');
INSERT INTO `t_task` VALUES ('d8da50a2a65f46a9ada6b1a94a7a52e6', 'cleanLog', '20190405', 'normal', '2019-04-05 01:00:00', '2019-04-05 01:00:00', '删除日志成功删除0行', '2019-04-05 01:00:00', '0');
INSERT INTO `t_task` VALUES ('da905717714b4df4879588b757b8c019', 'cleanLog', '20190327', 'normal', '2019-03-27 01:00:00', '2019-03-27 01:00:00', '删除日志成功删除0行', '2019-03-27 01:00:00', '0');
INSERT INTO `t_task` VALUES ('db84c2b49dcf4bbd80d72c2b338bf1b7', 'CheckInTask', '20190414', 'normal', '2019-04-14 01:00:00', '2019-04-14 01:00:00', '昨日未签到用户2个', '2019-04-14 01:00:00', '0');
INSERT INTO `t_task` VALUES ('db97b3e032e64a7aa8dae6bcc1b99563', 'cleanLog', '20190404', 'normal', '2019-04-04 01:00:00', '2019-04-04 01:00:01', '删除日志成功删除227行', '2019-04-04 01:00:00', '0');
INSERT INTO `t_task` VALUES ('dbf4ad45966e4c55b8d9d719da546d0b', 'CheckInTask', '20190503', 'normal', '2019-05-03 01:00:00', '2019-05-03 01:00:00', '昨日未签到用户0个', '2019-05-03 01:00:00', '0');
INSERT INTO `t_task` VALUES ('dcfb55d153c04e64899c79086db3681e', 'CheckInTask', '20190421', 'normal', '2019-04-21 01:00:00', '2019-04-21 01:00:00', '昨日未签到用户2个', '2019-04-21 01:00:00', '0');
INSERT INTO `t_task` VALUES ('ddb5f666b00841c8843d8b01fac6a51b', 'cleanLog', '20190421', 'normal', '2019-04-21 01:00:00', '2019-04-21 01:00:01', '删除日志成功删除200行', '2019-04-21 01:00:00', '0');
INSERT INTO `t_task` VALUES ('de1af0e490d94b7780d9b93f5817fa77', 'CheckInTask', '20190402', 'normal', '2019-04-02 01:00:52', '2019-04-02 01:00:52', '昨日未签到用户0个', '2019-04-02 01:00:52', '0');
INSERT INTO `t_task` VALUES ('de68341b8ca9406f96a29be23b524ff3', 'cleanLog', '20190401', 'normal', '2019-04-01 01:00:00', '2019-04-01 01:00:11', '删除日志成功删除2167行', '2019-04-01 01:00:00', '0');
INSERT INTO `t_task` VALUES ('deb5891bff894d17b182276932566e4f', 'cleanLog', '20190422', 'normal', '2019-04-22 01:00:00', '2019-04-22 01:00:00', '删除日志成功删除182行', '2019-04-22 01:00:00', '0');
INSERT INTO `t_task` VALUES ('e2164161972149b195badef01617f076', 'FixedDepositTask', '20190329', 'normal', '2019-03-29 01:00:00', '2019-03-29 01:00:00', '定存检查定时任务成功检查,取消定存用户：0人，成功释放利息：0人', '2019-03-29 01:00:00', '0');
INSERT INTO `t_task` VALUES ('e23a4283913149f2bc191ca296d8499c', 'cleanLog', '20190312', 'normal', '2019-03-12 01:00:00', '2019-03-12 01:00:00', '删除日志成功删除223行', '2019-03-12 01:00:00', '0');
INSERT INTO `t_task` VALUES ('e24fed5633fa455fabb1f64c84394dac', 'cleanLog', '20190410', 'normal', '2019-04-10 01:00:00', '2019-04-10 01:00:00', '删除日志成功删除18行', '2019-04-10 01:00:00', '0');
INSERT INTO `t_task` VALUES ('e2cd4f79d75b4d2bb1eb1242a8cd9f3a', 'cleanLog', '20190331', 'normal', '2019-03-31 01:00:00', '2019-03-31 01:00:16', '删除日志成功删除0行', '2019-03-31 01:00:00', '0');
INSERT INTO `t_task` VALUES ('e3e259299ab947b9a7e54c39f6436be7', 'CheckInTask', '20190315', 'normal', '2019-03-15 00:59:56', '2019-03-15 00:59:56', '昨日未签到用户0个', '2019-03-15 00:59:56', '0');
INSERT INTO `t_task` VALUES ('e3e9a1b2751943fa9be400f1f6de4df9', 'CheckInTask', '20190430', 'normal', '2019-04-30 01:00:00', '2019-04-30 01:00:00', '昨日未签到用户0个', '2019-04-30 01:00:00', '0');
INSERT INTO `t_task` VALUES ('e5461a027da34425a301980cdaaecb93', 'CheckInTask', '20190404', 'normal', '2019-04-04 01:00:00', '2019-04-04 01:00:00', '昨日未签到用户0个', '2019-04-04 01:00:00', '0');
INSERT INTO `t_task` VALUES ('e63123c1fb5a48489c5eb697a934a632', 'FixedDepositTask', '20190407', 'normal', '2019-04-07 00:59:52', '2019-04-07 00:59:52', '定存检查定时任务成功检查,取消定存用户：0人，成功释放利息：0人', '2019-04-07 00:59:52', '0');
INSERT INTO `t_task` VALUES ('e69d83c63fcd49baa5a415f1ede9838c', 'FixedDepositTask', '20190420', 'normal', '2019-04-20 01:00:03', '2019-04-20 01:00:03', '定存检查定时任务成功检查,取消定存用户：0人，成功释放利息：0人', '2019-04-20 01:00:03', '0');
INSERT INTO `t_task` VALUES ('e7799da1c70845d2aa3a34f7fb91fb16', 'cleanLog', '20190424', 'normal', '2019-04-24 01:00:00', '2019-04-24 01:00:00', '删除日志成功删除0行', '2019-04-24 01:00:00', '0');
INSERT INTO `t_task` VALUES ('e80416d08d7946f39269611556d736dd', 'CheckInTask', '20190415', 'normal', '2019-04-15 01:00:00', '2019-04-15 01:00:00', '昨日未签到用户2个', '2019-04-15 01:00:00', '0');
INSERT INTO `t_task` VALUES ('e81a23e6332e40038314da541b880f2f', 'cleanLog', '20190308', 'normal', '2019-03-08 01:00:00', '2019-03-08 01:00:00', '删除日志成功删除0行', '2019-03-08 01:00:00', '0');
INSERT INTO `t_task` VALUES ('ea39cfa2fb924edaa1d03c973bbd6d8b', 'cleanLog', '20190420', 'normal', '2019-04-20 01:00:04', '2019-04-20 01:00:04', '删除日志成功删除0行', '2019-04-20 01:00:04', '0');
INSERT INTO `t_task` VALUES ('ea3d06e8f0c04b4188fbc06a62b2d5de', 'FixedDepositTask', '20190419', 'normal', '2019-04-19 01:00:01', '2019-04-19 01:00:01', '定存检查定时任务成功检查,取消定存用户：0人，成功释放利息：0人', '2019-04-19 01:00:01', '0');
INSERT INTO `t_task` VALUES ('ea40cb89cdd24c63a96814d7944a1694', 'cleanLog', '20190424', 'normal', '2019-04-24 01:00:00', '2019-04-24 01:00:00', '删除日志成功删除0行', '2019-04-24 01:00:00', '0');
INSERT INTO `t_task` VALUES ('ec0c1e367952490fa3979d89aae76d9f', 'FixedDepositTask', '20190415', 'normal', '2019-04-15 01:00:00', '2019-04-15 01:00:00', '定存检查定时任务成功检查,取消定存用户：0人，成功释放利息：0人', '2019-04-15 01:00:00', '0');
INSERT INTO `t_task` VALUES ('ee46ffa7af35468995e7b6e4c42c9719', 'CheckInTask', '20190506', 'normal', '2019-05-06 01:00:03', '2019-05-06 01:00:03', '昨日未签到用户0个', '2019-05-06 01:00:03', '0');
INSERT INTO `t_task` VALUES ('ee68ebeb793f46879dd2e6efaecad8bc', 'cleanLog', '20190429', 'normal', '2019-04-29 01:00:00', '2019-04-29 01:00:00', '删除日志成功删除0行', '2019-04-29 01:00:00', '0');
INSERT INTO `t_task` VALUES ('ee8161327fa241aebf16787174125c83', 'CheckInTask', '20190404', 'normal', '2019-04-04 01:00:00', '2019-04-04 01:00:00', '昨日未签到用户0个', '2019-04-04 01:00:00', '0');
INSERT INTO `t_task` VALUES ('ee92ad9953aa4fb7b5569bd583339f7d', 'cleanLog', '20190327', 'normal', '2019-03-27 01:00:00', '2019-03-27 01:00:01', '删除日志成功删除51行', '2019-03-27 01:00:00', '0');
INSERT INTO `t_task` VALUES ('eff53b4514964a7da7379738d4fd8881', 'cleanLog', '20190407', 'normal', '2019-04-07 01:00:00', '2019-04-07 01:00:00', '删除日志成功删除0行', '2019-04-07 01:00:00', '0');
INSERT INTO `t_task` VALUES ('f0bd6d69bb7148918c992cd634844dca', 'FixedDepositTask', '20190424', 'normal', '2019-04-24 01:00:00', '2019-04-24 01:00:00', '定存检查定时任务成功检查,取消定存用户：0人，成功释放利息：0人', '2019-04-24 01:00:00', '0');
INSERT INTO `t_task` VALUES ('f35608bb5e0b477cb755db234da393f3', 'CheckInTask', '20190507', 'normal', '2019-05-07 01:00:00', '2019-05-07 01:00:00', '昨日未签到用户0个', '2019-05-07 01:00:00', '0');
INSERT INTO `t_task` VALUES ('f39630cdf539473591212bc4b4d95d3a', 'cleanLog', '20190405', 'normal', '2019-04-05 01:00:00', '2019-04-05 01:00:01', '删除日志成功删除2行', '2019-04-05 01:00:00', '0');
INSERT INTO `t_task` VALUES ('f3a92db89f004919bfe05a9b1214f6ce', 'FixedDepositTask', '20190507', 'normal', '2019-05-07 00:59:55', '2019-05-07 00:59:55', '定存检查定时任务成功检查,取消定存用户：0人，成功释放利息：0人', '2019-05-07 00:59:55', '0');
INSERT INTO `t_task` VALUES ('f67d70129be44943b46e8d503981554a', 'CheckInTask', '20190507', 'normal', '2019-05-07 01:00:00', '2019-05-07 01:00:00', '昨日未签到用户0个', '2019-05-07 01:00:00', '0');
INSERT INTO `t_task` VALUES ('f80a945cbe8e4055aaa0b66a16c3df36', 'FixedDepositTask', '20190419', 'normal', '2019-04-19 01:00:01', '2019-04-19 01:00:01', '定存检查定时任务成功检查,取消定存用户：0人，成功释放利息：0人', '2019-04-19 01:00:01', '0');
INSERT INTO `t_task` VALUES ('f99dcb85e95045cbad499357f5b517ae', 'FixedDepositTask', '20190413', 'normal', '2019-04-13 01:00:00', '2019-04-13 01:00:00', '定存检查定时任务成功检查,取消定存用户：0人，成功释放利息：0人', '2019-04-13 01:00:00', '0');
INSERT INTO `t_task` VALUES ('f9a14cd3968a46a0a76232ecca250619', 'FixedDepositTask', '20190402', 'normal', '2019-04-02 01:00:00', '2019-04-02 01:00:01', '定存检查定时任务成功检查,取消定存用户：0人，成功释放利息：0人', '2019-04-02 01:00:00', '0');
INSERT INTO `t_task` VALUES ('fa0cdac482834f7eb0a31287b354ac8a', 'cleanLog', '20190406', 'normal', '2019-04-06 01:00:00', '2019-04-06 01:00:00', '删除日志成功删除7688行', '2019-04-06 01:00:00', '0');
INSERT INTO `t_task` VALUES ('fb0ffadf4b874f2d97b13b13fd5e3bfa', 'FixedDepositTask', '20190327', 'normal', '2019-03-27 01:00:01', '2019-03-27 01:00:01', '定存检查定时任务成功检查,取消定存用户：1人，成功释放利息：0人', '2019-03-27 01:00:01', '0');
INSERT INTO `t_task` VALUES ('fc472b2822eb4ba7a4398465906844a5', 'cleanLog', '20190403', 'error', '2019-04-03 01:00:47', '2019-04-03 01:01:54', '删除日志失败\n### Error updating database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLTransactionRollbackException: Lock wait timeout exceeded; try restarting transaction\n### The error may involve com.sesame.common.basicskills.dao.LogDao.removeLTDate-Inline\n### The error occurred while setting parameters\n### SQL: delete from sys_log where gmt_create < ?\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLTransactionRollbackException: Lock wait timeout exceeded; try restarting transaction\n; ]; Lock wait timeout exceeded; try restarting transaction; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLTransactionRollbackException: Lock wait timeout exceeded; try restarting transaction', '2019-04-03 01:00:47', '0');
INSERT INTO `t_task` VALUES ('fc501edff5e54211932ddaeae991ea4c', 'FixedDepositTask', '20190418', 'normal', '2019-04-18 01:00:00', '2019-04-18 01:00:00', '定存检查定时任务成功检查,取消定存用户：0人，成功释放利息：0人', '2019-04-18 01:00:00', '0');
INSERT INTO `t_task` VALUES ('feb20784a2fe4cd7b3614d2e94502618', 'FixedDepositTask', '20190331', 'normal', '2019-03-31 01:00:17', '2019-03-31 01:00:17', '定存检查定时任务成功检查,取消定存用户：0人，成功释放利息：0人', '2019-03-31 01:00:17', '0');
INSERT INTO `t_task` VALUES ('ffa840033fb149969fd20a7bf237833f', 'FixedDepositTask', '20190424', 'normal', '2019-04-24 01:00:00', '2019-04-24 01:00:00', '定存检查定时任务成功检查,取消定存用户：0人，成功释放利息：0人', '2019-04-24 01:00:00', '0');

-- ----------------------------
-- Procedure structure for find_recommenders
-- ----------------------------
DROP PROCEDURE IF EXISTS `find_recommenders`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `find_recommenders`(in id int,in generate int)
BEGIN
      	DECLARE var INT default 0;
        DECLARE ftid int;
        declare idstr text(50000) default '-1';
	while var < generate do
		select recom_id into ftid from t_sw_user_basic where tid = id;
				if ftid != 1 then
					set idstr = concat(idstr,',',ftid); 
					set id = ftid;
				end if;
		set var = var +1;
	end while;
	
	select * from t_sw_user_basic where find_in_set(tid,idstr);
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
