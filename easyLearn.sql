/*
Navicat MySQL Data Transfer

Source Server         : windows
Source Server Version : 8.x
Source Host           : localhost:3306
Source Database       : easyLearn

Target Server Type    : MYSQL
Target Server Version : 8.x
File Encoding         : 65001
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for acl_permission
-- ----------------------------
DROP TABLE IF EXISTS `acl_permission`;
CREATE TABLE `acl_permission` (
                                  `id` char(19) NOT NULL DEFAULT '' COMMENT '编号',
                                  `pid` char(19) NOT NULL DEFAULT '' COMMENT '所属上级',
                                  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '名称',
                                  `type` tinyint(3) NOT NULL DEFAULT '0' COMMENT '类型(1:菜单,2:按钮)',
                                  `permission_value` varchar(50) DEFAULT NULL COMMENT '权限值',
                                  `path` varchar(100) DEFAULT NULL COMMENT '访问路径',
                                  `component` varchar(100) DEFAULT NULL COMMENT '组件路径',
                                  `icon` varchar(50) DEFAULT NULL COMMENT '图标',
                                  `status` tinyint(4) DEFAULT NULL COMMENT '状态(0:禁止,1:正常)',
                                  `is_deleted` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
                                  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
                                  `gmt_modified` datetime DEFAULT NULL COMMENT '更新时间',
                                  PRIMARY KEY (`id`),
                                  KEY `idx_pid` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='权限';

-- ----------------------------
-- Records of acl_permission
-- ----------------------------
INSERT INTO `acl_permission` VALUES ('1', '0', '全部数据', '0', '', '', '', '', null, '0', '2019-11-15 17:13:06', '2019-11-15 17:13:06');
INSERT INTO `acl_permission` VALUES ('111', '11', '', '0', null, null, null, null, null, '0', null, null);
INSERT INTO `acl_permission` VALUES ('1111', '111', '', '0', null, null, null, null, null, '0', null, null);
INSERT INTO `acl_permission` VALUES ('11111', '1111', '', '0', null, null, null, null, null, '0', null, null);
INSERT INTO `acl_permission` VALUES ('1195268474480156673', '1', '权限管理', '1', null, '/acl', 'Layout', null, null, '0', '2019-11-15 17:13:06', '2019-11-18 13:54:25');
INSERT INTO `acl_permission` VALUES ('1195268616021139457', '1195268474480156673', '用户管理', '1', null, 'user/list', '/acl/user/list', null, null, '0', '2019-11-15 17:13:40', '2019-11-18 13:53:12');
INSERT INTO `acl_permission` VALUES ('1195268788138598401', '1195268474480156673', '角色管理', '1', null, 'role/list', '/acl/role/list', null, null, '0', '2019-11-15 17:14:21', '2019-11-15 17:14:21');
INSERT INTO `acl_permission` VALUES ('1195268893830864898', '1195268474480156673', '菜单管理', '1', null, 'menu/list', '/acl/menu/list', null, null, '0', '2019-11-15 17:14:46', '2019-11-15 17:14:46');
INSERT INTO `acl_permission` VALUES ('1195269143060602882', '1195268616021139457', '查看', '2', 'user.list', '', '', null, null, '0', '2019-11-15 17:15:45', '2019-11-17 21:57:16');
INSERT INTO `acl_permission` VALUES ('1195269295926206466', '1195268616021139457', '添加', '2', 'user.add', 'user/add', '/acl/user/form', null, null, '0', '2019-11-15 17:16:22', '2019-11-15 17:16:22');
INSERT INTO `acl_permission` VALUES ('1195269473479483394', '1195268616021139457', '修改', '2', 'user.update', 'user/update/:id', '/acl/user/form', null, null, '0', '2019-11-15 17:17:04', '2019-11-15 17:17:04');
INSERT INTO `acl_permission` VALUES ('1195269547269873666', '1195268616021139457', '删除', '2', 'user.remove', '', '', null, null, '0', '2019-11-15 17:17:22', '2019-11-15 17:17:22');
INSERT INTO `acl_permission` VALUES ('1195269821262782465', '1195268788138598401', '修改', '2', 'role.update', 'role/update/:id', '/acl/role/form', null, null, '0', '2019-11-15 17:18:27', '2019-11-15 17:19:53');
INSERT INTO `acl_permission` VALUES ('1195269903542444034', '1195268788138598401', '查看', '2', 'role.list', '', '', null, null, '0', '2019-11-15 17:18:47', '2019-11-15 17:18:47');
INSERT INTO `acl_permission` VALUES ('1195270037005197313', '1195268788138598401', '添加', '2', 'role.add', 'role/add', '/acl/role/form', null, null, '0', '2019-11-15 17:19:19', '2019-11-18 11:05:42');
INSERT INTO `acl_permission` VALUES ('1195270442602782721', '1195268788138598401', '删除', '2', 'role.remove', '', '', null, null, '0', '2019-11-15 17:20:55', '2019-11-15 17:20:55');
INSERT INTO `acl_permission` VALUES ('1195270621548568578', '1195268788138598401', '角色权限', '2', 'role.acl', 'role/distribution/:id', '/acl/role/roleForm', null, null, '0', '2019-11-15 17:21:38', '2019-11-15 17:21:38');
INSERT INTO `acl_permission` VALUES ('1195270744097742849', '1195268893830864898', '查看', '2', 'permission.list', '', '', null, null, '0', '2019-11-15 17:22:07', '2019-11-15 17:22:07');
INSERT INTO `acl_permission` VALUES ('1195270810560684034', '1195268893830864898', '添加', '2', 'permission.add', '', '', null, null, '0', '2019-11-15 17:22:23', '2019-11-15 17:22:23');
INSERT INTO `acl_permission` VALUES ('1195270862100291586', '1195268893830864898', '修改', '2', 'permission.update', '', '', null, null, '0', '2019-11-15 17:22:35', '2019-11-15 17:22:35');
INSERT INTO `acl_permission` VALUES ('1195270887933009922', '1195268893830864898', '删除', '2', 'permission.remove', '', '', null, null, '0', '2019-11-15 17:22:41', '2019-11-15 17:22:41');
INSERT INTO `acl_permission` VALUES ('1195349439240048642', '1', '讲师管理', '1', '', '/teacher', 'Layout', null, null, '0', '2019-11-15 22:34:49', '2019-11-15 22:34:49');
INSERT INTO `acl_permission` VALUES ('1195349699995734017', '1195349439240048642', '讲师列表', '1', null, 'table', '/edu/teacher/list', null, null, '0', '2019-11-15 22:35:52', '2019-11-15 22:35:52');
INSERT INTO `acl_permission` VALUES ('1195349810561781761', '1195349439240048642', '添加讲师', '1', null, 'save', '/edu/teacher/save', null, null, '0', '2019-11-15 22:36:18', '2019-11-15 22:36:18');
INSERT INTO `acl_permission` VALUES ('1195349876252971010', '1195349810561781761', '添加', '2', 'teacher.add', '', '', null, null, '0', '2019-11-15 22:36:34', '2019-11-15 22:36:34');
INSERT INTO `acl_permission` VALUES ('1195349979797753857', '1195349699995734017', '查看', '2', 'teacher.list', '', '', null, null, '0', '2019-11-15 22:36:58', '2019-11-15 22:36:58');
INSERT INTO `acl_permission` VALUES ('1195350117270261762', '1195349699995734017', '修改', '2', 'teacher.update', 'edit/:id', '/edu/teacher/save', null, null, '0', '2019-11-15 22:37:31', '2019-11-15 22:37:31');
INSERT INTO `acl_permission` VALUES ('1195350188359520258', '1195349699995734017', '删除', '2', 'teacher.remove', '', '', null, null, '0', '2019-11-15 22:37:48', '2019-11-15 22:37:48');
INSERT INTO `acl_permission` VALUES ('1195350299365969922', '1', '课程分类', '1', null, '/subject', 'Layout', null, null, '0', '2019-11-15 22:38:15', '2019-11-15 22:38:15');
INSERT INTO `acl_permission` VALUES ('1195350397751758850', '1195350299365969922', '课程分类列表', '1', null, 'list', '/edu/subject/list', null, null, '0', '2019-11-15 22:38:38', '2019-11-15 22:38:38');
INSERT INTO `acl_permission` VALUES ('1195350500512206850', '1195350299365969922', '导入课程分类', '1', null, 'save', '/edu/subject/save', null, null, '0', '2019-11-15 22:39:03', '2019-11-15 22:39:03');
INSERT INTO `acl_permission` VALUES ('1195350612172967938', '1195350397751758850', '查看', '2', 'subject.list', '', '', null, null, '0', '2019-11-15 22:39:29', '2019-11-15 22:39:29');
INSERT INTO `acl_permission` VALUES ('1195350687590748161', '1195350500512206850', '导入', '2', 'subject.import', '', '', null, null, '0', '2019-11-15 22:39:47', '2019-11-15 22:39:47');
INSERT INTO `acl_permission` VALUES ('1195350831744782337', '1', '课程管理', '1', null, '/course', 'Layout', null, null, '0', '2019-11-15 22:40:21', '2019-11-15 22:40:21');
INSERT INTO `acl_permission` VALUES ('1195350919074385921', '1195350831744782337', '课程列表', '1', null, 'list', '/edu/course/list', null, null, '0', '2019-11-15 22:40:42', '2019-11-15 22:40:42');
INSERT INTO `acl_permission` VALUES ('1195351020463296513', '1195350831744782337', '发布课程', '1', null, 'info', '/edu/course/info', null, null, '0', '2019-11-15 22:41:06', '2019-11-15 22:41:06');
INSERT INTO `acl_permission` VALUES ('1195351159672246274', '1195350919074385921', '完成发布', '2', 'course.publish', 'publish/:id', '/edu/course/publish', null, null, '0', '2019-11-15 22:41:40', '2019-11-15 22:44:01');
INSERT INTO `acl_permission` VALUES ('1195351326706208770', '1195350919074385921', '编辑课程', '2', 'course.update', 'info/:id', '/edu/course/info', null, null, '0', '2019-11-15 22:42:19', '2019-11-15 22:42:19');
INSERT INTO `acl_permission` VALUES ('1195351566221938690', '1195350919074385921', '编辑课程大纲', '2', 'chapter.update', 'chapter/:id', '/edu/course/chapter', null, null, '0', '2019-11-15 22:43:17', '2019-11-15 22:43:17');
INSERT INTO `acl_permission` VALUES ('1195351862889254913', '1', '统计分析', '1', null, '/sta', 'Layout', null, null, '0', '2019-11-15 22:44:27', '2019-11-15 22:44:27');
INSERT INTO `acl_permission` VALUES ('1195351968841568257', '1195351862889254913', '生成统计', '1', null, 'create', '/sta/create', null, null, '0', '2019-11-15 22:44:53', '2019-11-15 22:44:53');
INSERT INTO `acl_permission` VALUES ('1195352054917074946', '1195351862889254913', '统计图表', '1', null, 'show', '/sta/show', null, null, '0', '2019-11-15 22:45:13', '2019-11-15 22:45:13');
INSERT INTO `acl_permission` VALUES ('1195352127734386690', '1195352054917074946', '查看', '2', 'daily.list', '', '', null, null, '0', '2019-11-15 22:45:30', '2019-11-15 22:45:30');
INSERT INTO `acl_permission` VALUES ('1195352215768633346', '1195351968841568257', '生成', '2', 'daily.add', '', '', null, null, '0', '2019-11-15 22:45:51', '2019-11-15 22:45:51');
INSERT INTO `acl_permission` VALUES ('1195352547621965825', '1', 'CMS管理', '1', null, '/cms', 'Layout', null, null, '0', '2019-11-15 22:47:11', '2019-11-18 10:51:46');
INSERT INTO `acl_permission` VALUES ('1195352856645701633', '1195353513549205505', '查看', '2', 'banner.list', '', null, null, null, '0', '2019-11-15 22:48:24', '2019-11-15 22:48:24');
INSERT INTO `acl_permission` VALUES ('1195352909401657346', '1195353513549205505', '添加', '2', 'banner.add', 'banner/add', '/cms/banner/form', null, null, '0', '2019-11-15 22:48:37', '2019-11-18 10:52:10');
INSERT INTO `acl_permission` VALUES ('1195353051395624961', '1195353513549205505', '修改', '2', 'banner.update', 'banner/update/:id', '/cms/banner/form', null, null, '0', '2019-11-15 22:49:11', '2019-11-18 10:52:05');
INSERT INTO `acl_permission` VALUES ('1195353513549205505', '1195352547621965825', 'Bander列表', '1', null, 'banner/list', '/cms/banner/list', null, null, '0', '2019-11-15 22:51:01', '2019-11-18 10:51:29');
INSERT INTO `acl_permission` VALUES ('1195353672110673921', '1195353513549205505', '删除', '2', 'banner.remove', '', '', null, null, '0', '2019-11-15 22:51:39', '2019-11-15 22:51:39');
INSERT INTO `acl_permission` VALUES ('1195354076890370050', '1', '订单管理', '1', null, '/order', 'Layout', null, null, '0', '2019-11-15 22:53:15', '2019-11-15 22:53:15');
INSERT INTO `acl_permission` VALUES ('1195354153482555393', '1195354076890370050', '订单列表', '1', null, 'list', '/order/list', null, null, '0', '2019-11-15 22:53:33', '2019-11-15 22:53:58');
INSERT INTO `acl_permission` VALUES ('1195354315093282817', '1195354153482555393', '查看', '2', 'order.list', '', '', null, null, '0', '2019-11-15 22:54:12', '2019-11-15 22:54:12');
INSERT INTO `acl_permission` VALUES ('1196301740985311234', '1195268616021139457', '分配角色', '2', 'user.assgin', 'user/role/:id', '/acl/user/roleForm', null, null, '0', '2019-11-18 13:38:56', '2019-11-18 13:38:56');

-- ----------------------------
-- Table structure for acl_role
-- ----------------------------
DROP TABLE IF EXISTS `acl_role`;
CREATE TABLE `acl_role` (
                            `id` char(19) NOT NULL DEFAULT '' COMMENT '角色id',
                            `role_name` varchar(20) NOT NULL DEFAULT '' COMMENT '角色名称',
                            `role_code` varchar(20) DEFAULT NULL COMMENT '角色编码',
                            `remark` varchar(255) DEFAULT NULL COMMENT '备注',
                            `is_deleted` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
                            `gmt_create` datetime NOT NULL COMMENT '创建时间',
                            `gmt_modified` datetime NOT NULL COMMENT '更新时间',
                            PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of acl_role
-- ----------------------------
INSERT INTO `acl_role` VALUES ('1', '超级管理员', null, null, '0', '2019-11-11 13:09:32', '2020-08-21 11:59:37');
INSERT INTO `acl_role` VALUES ('1193757683205607426', '课程管理员', null, null, '0', '2019-11-11 13:09:45', '2019-11-18 10:25:44');
INSERT INTO `acl_role` VALUES ('1296656642959503361', '讲师管理员', null, null, '0', '2020-08-21 11:53:29', '2020-08-21 11:59:51');
INSERT INTO `acl_role` VALUES ('1296658571068469249', '普通管理员', null, null, '0', '2020-08-21 12:01:09', '2020-08-21 12:01:09');

-- ----------------------------
-- Table structure for acl_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `acl_role_permission`;
CREATE TABLE `acl_role_permission` (
                                       `id` char(19) NOT NULL DEFAULT '',
                                       `role_id` char(19) NOT NULL DEFAULT '',
                                       `permission_id` char(19) NOT NULL DEFAULT '',
                                       `is_deleted` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
                                       `gmt_create` datetime NOT NULL COMMENT '创建时间',
                                       `gmt_modified` datetime NOT NULL COMMENT '更新时间',
                                       PRIMARY KEY (`id`),
                                       KEY `idx_role_id` (`role_id`),
                                       KEY `idx_permission_id` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色权限';

-- ----------------------------
-- Records of acl_role_permission
-- ----------------------------
INSERT INTO `acl_role_permission` VALUES ('1196312702601695234', '1', '1', '0', '2019-11-18 14:22:29', '2019-11-18 14:22:29');
INSERT INTO `acl_role_permission` VALUES ('1196312702652026881', '1', '1195268474480156673', '0', '2019-11-18 14:22:29', '2019-11-18 14:22:29');
INSERT INTO `acl_role_permission` VALUES ('1196312702668804098', '1', '1195268616021139457', '0', '2019-11-18 14:22:29', '2019-11-18 14:22:29');
INSERT INTO `acl_role_permission` VALUES ('1196312702698164226', '1', '1195269143060602882', '0', '2019-11-18 14:22:29', '2019-11-18 14:22:29');
INSERT INTO `acl_role_permission` VALUES ('1196312702723330049', '1', '1195269295926206466', '0', '2019-11-18 14:22:29', '2019-11-18 14:22:29');
INSERT INTO `acl_role_permission` VALUES ('1196312702744301569', '1', '1195269473479483394', '0', '2019-11-18 14:22:29', '2019-11-18 14:22:29');
INSERT INTO `acl_role_permission` VALUES ('1196312702765273089', '1', '1195269547269873666', '0', '2019-11-18 14:22:29', '2019-11-18 14:22:29');
INSERT INTO `acl_role_permission` VALUES ('1196312702790438913', '1', '1196301740985311234', '0', '2019-11-18 14:22:29', '2019-11-18 14:22:29');
INSERT INTO `acl_role_permission` VALUES ('1196312702945628161', '1', '1195268788138598401', '0', '2019-11-18 14:22:29', '2019-11-18 14:22:29');
INSERT INTO `acl_role_permission` VALUES ('1196312702970793985', '1', '1195269821262782465', '0', '2019-11-18 14:22:29', '2019-11-18 14:22:29');
INSERT INTO `acl_role_permission` VALUES ('1196312703000154114', '1', '1195269903542444034', '0', '2019-11-18 14:22:29', '2019-11-18 14:22:29');
INSERT INTO `acl_role_permission` VALUES ('1196312703025319938', '1', '1195270037005197313', '0', '2019-11-18 14:22:29', '2019-11-18 14:22:29');
INSERT INTO `acl_role_permission` VALUES ('1196312703046291458', '1', '1195270442602782721', '0', '2019-11-18 14:22:29', '2019-11-18 14:22:29');
INSERT INTO `acl_role_permission` VALUES ('1196312703063068673', '1', '1195270621548568578', '0', '2019-11-18 14:22:29', '2019-11-18 14:22:29');
INSERT INTO `acl_role_permission` VALUES ('1196312703084040193', '1', '1195268893830864898', '0', '2019-11-18 14:22:29', '2019-11-18 14:22:29');
INSERT INTO `acl_role_permission` VALUES ('1196312703113400321', '1', '1195270744097742849', '0', '2019-11-18 14:22:29', '2019-11-18 14:22:29');
INSERT INTO `acl_role_permission` VALUES ('1196312703134371842', '1', '1195270810560684034', '0', '2019-11-18 14:22:30', '2019-11-18 14:22:30');
INSERT INTO `acl_role_permission` VALUES ('1196312703159537665', '1', '1195270862100291586', '0', '2019-11-18 14:22:30', '2019-11-18 14:22:30');
INSERT INTO `acl_role_permission` VALUES ('1196312703184703490', '1', '1195270887933009922', '0', '2019-11-18 14:22:30', '2019-11-18 14:22:30');
INSERT INTO `acl_role_permission` VALUES ('1196312703209869313', '1', '1195349439240048642', '0', '2019-11-18 14:22:30', '2019-11-18 14:22:30');
INSERT INTO `acl_role_permission` VALUES ('1196312703230840834', '1', '1195349699995734017', '0', '2019-11-18 14:22:30', '2019-11-18 14:22:30');
INSERT INTO `acl_role_permission` VALUES ('1196312703251812354', '1', '1195349979797753857', '0', '2019-11-18 14:22:30', '2019-11-18 14:22:30');
INSERT INTO `acl_role_permission` VALUES ('1196312703272783873', '1', '1195350117270261762', '0', '2019-11-18 14:22:30', '2019-11-18 14:22:30');
INSERT INTO `acl_role_permission` VALUES ('1196312703293755394', '1', '1195350188359520258', '0', '2019-11-18 14:22:30', '2019-11-18 14:22:30');
INSERT INTO `acl_role_permission` VALUES ('1196312703327309826', '1', '1195349810561781761', '0', '2019-11-18 14:22:30', '2019-11-18 14:22:30');
INSERT INTO `acl_role_permission` VALUES ('1196312703348281345', '1', '1195349876252971010', '0', '2019-11-18 14:22:30', '2019-11-18 14:22:30');
INSERT INTO `acl_role_permission` VALUES ('1196312703365058561', '1', '1195350299365969922', '0', '2019-11-18 14:22:30', '2019-11-18 14:22:30');
INSERT INTO `acl_role_permission` VALUES ('1196312703386030082', '1', '1195350397751758850', '0', '2019-11-18 14:22:30', '2019-11-18 14:22:30');
INSERT INTO `acl_role_permission` VALUES ('1196312703440556034', '1', '1195350612172967938', '0', '2019-11-18 14:22:30', '2019-11-18 14:22:30');
INSERT INTO `acl_role_permission` VALUES ('1196312703486693378', '1', '1195350500512206850', '0', '2019-11-18 14:22:30', '2019-11-18 14:22:30');
INSERT INTO `acl_role_permission` VALUES ('1196312703511859202', '1', '1195350687590748161', '0', '2019-11-18 14:22:30', '2019-11-18 14:22:30');
INSERT INTO `acl_role_permission` VALUES ('1196312703654465537', '1', '1195350831744782337', '0', '2019-11-18 14:22:30', '2019-11-18 14:22:30');
INSERT INTO `acl_role_permission` VALUES ('1196312703683825665', '1', '1195350919074385921', '0', '2019-11-18 14:22:30', '2019-11-18 14:22:30');
INSERT INTO `acl_role_permission` VALUES ('1196312703700602882', '1', '1195351159672246274', '0', '2019-11-18 14:22:30', '2019-11-18 14:22:30');
INSERT INTO `acl_role_permission` VALUES ('1196312703717380098', '1', '1195351326706208770', '0', '2019-11-18 14:22:30', '2019-11-18 14:22:30');
INSERT INTO `acl_role_permission` VALUES ('1196312703738351618', '1', '1195351566221938690', '0', '2019-11-18 14:22:30', '2019-11-18 14:22:30');
INSERT INTO `acl_role_permission` VALUES ('1196312703759323137', '1', '1195351020463296513', '0', '2019-11-18 14:22:30', '2019-11-18 14:22:30');
INSERT INTO `acl_role_permission` VALUES ('1196312703776100353', '1', '1195351862889254913', '0', '2019-11-18 14:22:30', '2019-11-18 14:22:30');
INSERT INTO `acl_role_permission` VALUES ('1196312703792877570', '1', '1195351968841568257', '0', '2019-11-18 14:22:30', '2019-11-18 14:22:30');
INSERT INTO `acl_role_permission` VALUES ('1196312703830626305', '1', '1195352215768633346', '0', '2019-11-18 14:22:30', '2019-11-18 14:22:30');
INSERT INTO `acl_role_permission` VALUES ('1196312703843209217', '1', '1195352054917074946', '0', '2019-11-18 14:22:30', '2019-11-18 14:22:30');
INSERT INTO `acl_role_permission` VALUES ('1196312703868375041', '1', '1195352127734386690', '0', '2019-11-18 14:22:30', '2019-11-18 14:22:30');
INSERT INTO `acl_role_permission` VALUES ('1196312703889346561', '1', '1195352547621965825', '0', '2019-11-18 14:22:30', '2019-11-18 14:22:30');
INSERT INTO `acl_role_permission` VALUES ('1196312703901929473', '1', '1195353513549205505', '0', '2019-11-18 14:22:30', '2019-11-18 14:22:30');
INSERT INTO `acl_role_permission` VALUES ('1196312703918706689', '1', '1195352856645701633', '0', '2019-11-18 14:22:30', '2019-11-18 14:22:30');
INSERT INTO `acl_role_permission` VALUES ('1196312703952261121', '1', '1195352909401657346', '0', '2019-11-18 14:22:30', '2019-11-18 14:22:30');
INSERT INTO `acl_role_permission` VALUES ('1196312703973232642', '1', '1195353051395624961', '0', '2019-11-18 14:22:30', '2019-11-18 14:22:30');
INSERT INTO `acl_role_permission` VALUES ('1196312703990009857', '1', '1195353672110673921', '0', '2019-11-18 14:22:30', '2019-11-18 14:22:30');
INSERT INTO `acl_role_permission` VALUES ('1196312704048730114', '1', '1195354076890370050', '0', '2019-11-18 14:22:30', '2019-11-18 14:22:30');
INSERT INTO `acl_role_permission` VALUES ('1196312704069701633', '1', '1195354153482555393', '0', '2019-11-18 14:22:30', '2019-11-18 14:22:30');
INSERT INTO `acl_role_permission` VALUES ('1196312704094867457', '1', '1195354315093282817', '0', '2019-11-18 14:22:30', '2019-11-18 14:22:30');
INSERT INTO `acl_role_permission` VALUES ('1296342198312292353', '1296341621322825729', '1195268474480156673', '0', '2020-08-20 15:04:00', '2020-08-20 15:04:00');
INSERT INTO `acl_role_permission` VALUES ('1296342198333263873', '1296341621322825729', '1195268616021139457', '0', '2020-08-20 15:04:00', '2020-08-20 15:04:00');
INSERT INTO `acl_role_permission` VALUES ('1296342198333263874', '1296341621322825729', '1195269143060602882', '0', '2020-08-20 15:04:00', '2020-08-20 15:04:00');
INSERT INTO `acl_role_permission` VALUES ('1296342198333263875', '1296341621322825729', '1195269295926206466', '0', '2020-08-20 15:04:00', '2020-08-20 15:04:00');
INSERT INTO `acl_role_permission` VALUES ('1296342198341652482', '1296341621322825729', '1195269473479483394', '0', '2020-08-20 15:04:00', '2020-08-20 15:04:00');
INSERT INTO `acl_role_permission` VALUES ('1296342198341652483', '1296341621322825729', '1195269547269873666', '0', '2020-08-20 15:04:00', '2020-08-20 15:04:00');
INSERT INTO `acl_role_permission` VALUES ('1296342198341652484', '1296341621322825729', '1196301740985311234', '0', '2020-08-20 15:04:00', '2020-08-20 15:04:00');
INSERT INTO `acl_role_permission` VALUES ('1296342198341652485', '1296341621322825729', '1195268788138598401', '0', '2020-08-20 15:04:00', '2020-08-20 15:04:00');
INSERT INTO `acl_role_permission` VALUES ('1296342198350041090', '1296341621322825729', '1195269821262782465', '0', '2020-08-20 15:04:00', '2020-08-20 15:04:00');
INSERT INTO `acl_role_permission` VALUES ('1296342198350041091', '1296341621322825729', '1195269903542444034', '0', '2020-08-20 15:04:00', '2020-08-20 15:04:00');
INSERT INTO `acl_role_permission` VALUES ('1296342198354235393', '1296341621322825729', '1195270037005197313', '0', '2020-08-20 15:04:00', '2020-08-20 15:04:00');
INSERT INTO `acl_role_permission` VALUES ('1296342198354235394', '1296341621322825729', '1195270442602782721', '0', '2020-08-20 15:04:00', '2020-08-20 15:04:00');
INSERT INTO `acl_role_permission` VALUES ('1296342198358429698', '1296341621322825729', '1195270621548568578', '0', '2020-08-20 15:04:00', '2020-08-20 15:04:00');
INSERT INTO `acl_role_permission` VALUES ('1296342198358429699', '1296341621322825729', '1195268893830864898', '0', '2020-08-20 15:04:00', '2020-08-20 15:04:00');
INSERT INTO `acl_role_permission` VALUES ('1296342198358429700', '1296341621322825729', '1195270744097742849', '0', '2020-08-20 15:04:00', '2020-08-20 15:04:00');
INSERT INTO `acl_role_permission` VALUES ('1296342198358429701', '1296341621322825729', '1195270810560684034', '0', '2020-08-20 15:04:00', '2020-08-20 15:04:00');
INSERT INTO `acl_role_permission` VALUES ('1296342198366818305', '1296341621322825729', '1195270862100291586', '0', '2020-08-20 15:04:00', '2020-08-20 15:04:00');
INSERT INTO `acl_role_permission` VALUES ('1296342198366818306', '1296341621322825729', '1195270887933009922', '0', '2020-08-20 15:04:00', '2020-08-20 15:04:00');
INSERT INTO `acl_role_permission` VALUES ('1296656752510529537', '1296656642959503361', '1195350299365969922', '0', '2020-08-21 11:53:55', '2020-08-21 11:53:55');
INSERT INTO `acl_role_permission` VALUES ('1296656752523112449', '1296656642959503361', '1195350397751758850', '0', '2020-08-21 11:53:55', '2020-08-21 11:53:55');
INSERT INTO `acl_role_permission` VALUES ('1296656752523112450', '1296656642959503361', '1195350612172967938', '0', '2020-08-21 11:53:55', '2020-08-21 11:53:55');
INSERT INTO `acl_role_permission` VALUES ('1296656752523112451', '1296656642959503361', '1195350500512206850', '0', '2020-08-21 11:53:55', '2020-08-21 11:53:55');
INSERT INTO `acl_role_permission` VALUES ('1296656752527306754', '1296656642959503361', '1195350687590748161', '0', '2020-08-21 11:53:55', '2020-08-21 11:53:55');
INSERT INTO `acl_role_permission` VALUES ('1296656752527306755', '1296656642959503361', '1195350831744782337', '0', '2020-08-21 11:53:55', '2020-08-21 11:53:55');
INSERT INTO `acl_role_permission` VALUES ('1296656752527306756', '1296656642959503361', '1195350919074385921', '0', '2020-08-21 11:53:55', '2020-08-21 11:53:55');
INSERT INTO `acl_role_permission` VALUES ('1296656752531501058', '1296656642959503361', '1195351159672246274', '0', '2020-08-21 11:53:55', '2020-08-21 11:53:55');
INSERT INTO `acl_role_permission` VALUES ('1296656752535695362', '1296656642959503361', '1195351326706208770', '0', '2020-08-21 11:53:55', '2020-08-21 11:53:55');
INSERT INTO `acl_role_permission` VALUES ('1296656752535695363', '1296656642959503361', '1195351566221938690', '0', '2020-08-21 11:53:55', '2020-08-21 11:53:55');
INSERT INTO `acl_role_permission` VALUES ('1296656752535695364', '1296656642959503361', '1195351020463296513', '0', '2020-08-21 11:53:55', '2020-08-21 11:53:55');
INSERT INTO `acl_role_permission` VALUES ('1296658379854344194', '1193757683205607426', '1195350831744782337', '0', '2020-08-21 12:00:23', '2020-08-21 12:00:23');
INSERT INTO `acl_role_permission` VALUES ('1296658379862732801', '1193757683205607426', '1195350919074385921', '0', '2020-08-21 12:00:23', '2020-08-21 12:00:23');
INSERT INTO `acl_role_permission` VALUES ('1296658379862732802', '1193757683205607426', '1195351159672246274', '0', '2020-08-21 12:00:23', '2020-08-21 12:00:23');
INSERT INTO `acl_role_permission` VALUES ('1296658379862732803', '1193757683205607426', '1195351326706208770', '0', '2020-08-21 12:00:23', '2020-08-21 12:00:23');
INSERT INTO `acl_role_permission` VALUES ('1296658379866927106', '1193757683205607426', '1195351566221938690', '0', '2020-08-21 12:00:23', '2020-08-21 12:00:23');
INSERT INTO `acl_role_permission` VALUES ('1296658379871121410', '1193757683205607426', '1195351020463296513', '0', '2020-08-21 12:00:23', '2020-08-21 12:00:23');
INSERT INTO `acl_role_permission` VALUES ('1296658628543016962', '1296658571068469249', '1195349439240048642', '0', '2020-08-21 12:01:22', '2020-08-21 12:01:22');
INSERT INTO `acl_role_permission` VALUES ('1296658628547211266', '1296658571068469249', '1195349699995734017', '0', '2020-08-21 12:01:22', '2020-08-21 12:01:22');
INSERT INTO `acl_role_permission` VALUES ('1296658628547211267', '1296658571068469249', '1195349979797753857', '0', '2020-08-21 12:01:22', '2020-08-21 12:01:22');
INSERT INTO `acl_role_permission` VALUES ('1296658628547211268', '1296658571068469249', '1195350117270261762', '0', '2020-08-21 12:01:22', '2020-08-21 12:01:22');
INSERT INTO `acl_role_permission` VALUES ('1296658628551405570', '1296658571068469249', '1195350188359520258', '0', '2020-08-21 12:01:22', '2020-08-21 12:01:22');
INSERT INTO `acl_role_permission` VALUES ('1296658628551405571', '1296658571068469249', '1195349810561781761', '0', '2020-08-21 12:01:22', '2020-08-21 12:01:22');
INSERT INTO `acl_role_permission` VALUES ('1296658628551405572', '1296658571068469249', '1195349876252971010', '0', '2020-08-21 12:01:22', '2020-08-21 12:01:22');
INSERT INTO `acl_role_permission` VALUES ('1296658628551405573', '1296658571068469249', '1195350299365969922', '0', '2020-08-21 12:01:22', '2020-08-21 12:01:22');
INSERT INTO `acl_role_permission` VALUES ('1296658628551405574', '1296658571068469249', '1195350397751758850', '0', '2020-08-21 12:01:22', '2020-08-21 12:01:22');
INSERT INTO `acl_role_permission` VALUES ('1296658628551405575', '1296658571068469249', '1195350612172967938', '0', '2020-08-21 12:01:22', '2020-08-21 12:01:22');
INSERT INTO `acl_role_permission` VALUES ('1296658628551405576', '1296658571068469249', '1195350500512206850', '0', '2020-08-21 12:01:22', '2020-08-21 12:01:22');
INSERT INTO `acl_role_permission` VALUES ('1296658628551405577', '1296658571068469249', '1195350687590748161', '0', '2020-08-21 12:01:22', '2020-08-21 12:01:22');
INSERT INTO `acl_role_permission` VALUES ('1296658628551405578', '1296658571068469249', '1195350831744782337', '0', '2020-08-21 12:01:22', '2020-08-21 12:01:22');
INSERT INTO `acl_role_permission` VALUES ('1296658628551405579', '1296658571068469249', '1195350919074385921', '0', '2020-08-21 12:01:22', '2020-08-21 12:01:22');
INSERT INTO `acl_role_permission` VALUES ('1296658628551405580', '1296658571068469249', '1195351159672246274', '0', '2020-08-21 12:01:22', '2020-08-21 12:01:22');
INSERT INTO `acl_role_permission` VALUES ('1296658628551405581', '1296658571068469249', '1195351326706208770', '0', '2020-08-21 12:01:22', '2020-08-21 12:01:22');
INSERT INTO `acl_role_permission` VALUES ('1296658628551405582', '1296658571068469249', '1195351566221938690', '0', '2020-08-21 12:01:22', '2020-08-21 12:01:22');
INSERT INTO `acl_role_permission` VALUES ('1296658628551405583', '1296658571068469249', '1195351020463296513', '0', '2020-08-21 12:01:22', '2020-08-21 12:01:22');
INSERT INTO `acl_role_permission` VALUES ('1296658628551405584', '1296658571068469249', '1195351862889254913', '0', '2020-08-21 12:01:22', '2020-08-21 12:01:22');
INSERT INTO `acl_role_permission` VALUES ('1296658628551405585', '1296658571068469249', '1195351968841568257', '0', '2020-08-21 12:01:22', '2020-08-21 12:01:22');
INSERT INTO `acl_role_permission` VALUES ('1296658628551405586', '1296658571068469249', '1195352215768633346', '0', '2020-08-21 12:01:22', '2020-08-21 12:01:22');
INSERT INTO `acl_role_permission` VALUES ('1296658628551405587', '1296658571068469249', '1195352054917074946', '0', '2020-08-21 12:01:22', '2020-08-21 12:01:22');
INSERT INTO `acl_role_permission` VALUES ('1296658628551405588', '1296658571068469249', '1195352127734386690', '0', '2020-08-21 12:01:22', '2020-08-21 12:01:22');
INSERT INTO `acl_role_permission` VALUES ('1296658628551405589', '1296658571068469249', '1195352547621965825', '0', '2020-08-21 12:01:22', '2020-08-21 12:01:22');
INSERT INTO `acl_role_permission` VALUES ('1296658628551405590', '1296658571068469249', '1195353513549205505', '0', '2020-08-21 12:01:22', '2020-08-21 12:01:22');
INSERT INTO `acl_role_permission` VALUES ('1296658628551405591', '1296658571068469249', '1195352856645701633', '0', '2020-08-21 12:01:22', '2020-08-21 12:01:22');
INSERT INTO `acl_role_permission` VALUES ('1296658628551405592', '1296658571068469249', '1195352909401657346', '0', '2020-08-21 12:01:22', '2020-08-21 12:01:22');
INSERT INTO `acl_role_permission` VALUES ('1296658628551405593', '1296658571068469249', '1195353051395624961', '0', '2020-08-21 12:01:22', '2020-08-21 12:01:22');
INSERT INTO `acl_role_permission` VALUES ('1296658628551405594', '1296658571068469249', '1195353672110673921', '0', '2020-08-21 12:01:22', '2020-08-21 12:01:22');
INSERT INTO `acl_role_permission` VALUES ('1296658628551405595', '1296658571068469249', '1195354076890370050', '0', '2020-08-21 12:01:22', '2020-08-21 12:01:22');
INSERT INTO `acl_role_permission` VALUES ('1296658628551405596', '1296658571068469249', '1195354153482555393', '0', '2020-08-21 12:01:22', '2020-08-21 12:01:22');
INSERT INTO `acl_role_permission` VALUES ('1296658631705522177', '1296658571068469249', '1195354315093282817', '0', '2020-08-21 12:01:23', '2020-08-21 12:01:23');

-- ----------------------------
-- Table structure for acl_user
-- ----------------------------
DROP TABLE IF EXISTS `acl_user`;
CREATE TABLE `acl_user` (
                            `id` char(19) NOT NULL COMMENT '会员id',
                            `username` varchar(20) NOT NULL DEFAULT '' COMMENT '微信openid',
                            `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
                            `nick_name` varchar(50) DEFAULT NULL COMMENT '昵称',
                            `salt` varchar(255) DEFAULT NULL COMMENT '用户头像',
                            `token` varchar(100) DEFAULT NULL COMMENT '用户签名',
                            `is_deleted` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
                            `gmt_create` datetime NOT NULL COMMENT '创建时间',
                            `gmt_modified` datetime NOT NULL COMMENT '更新时间',
                            PRIMARY KEY (`id`),
                            UNIQUE KEY `uk_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

-- ----------------------------
-- Records of acl_user
-- ----------------------------
INSERT INTO `acl_user` VALUES ('1', 'admin', '96e79218965eb72c92a549dd5a330112', 'admin', '', null, '0', '2019-11-01 10:39:47', '2019-11-01 10:39:47');
INSERT INTO `acl_user` VALUES ('1296657852869406722', 'yang', '96e79218965eb72c92a549dd5a330112', '龙达达', null, null, '0', '2020-08-21 11:58:18', '2020-08-21 11:58:18');
INSERT INTO `acl_user` VALUES ('1296658810076688386', 'long', '96e79218965eb72c92a549dd5a330112', '龙达达1', null, null, '0', '2020-08-21 12:02:06', '2020-08-21 12:02:06');

-- ----------------------------
-- Table structure for acl_user_role
-- ----------------------------
DROP TABLE IF EXISTS `acl_user_role`;
CREATE TABLE `acl_user_role` (
                                 `id` char(19) NOT NULL DEFAULT '' COMMENT '主键id',
                                 `role_id` char(19) NOT NULL DEFAULT '0' COMMENT '角色id',
                                 `user_id` char(19) NOT NULL DEFAULT '0' COMMENT '用户id',
                                 `is_deleted` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
                                 `gmt_create` datetime NOT NULL COMMENT '创建时间',
                                 `gmt_modified` datetime NOT NULL COMMENT '更新时间',
                                 PRIMARY KEY (`id`),
                                 KEY `idx_role_id` (`role_id`),
                                 KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of acl_user_role
-- ----------------------------
INSERT INTO `acl_user_role` VALUES ('1', '1', '2', '0', '2019-11-11 13:09:53', '2019-11-11 13:09:53');
INSERT INTO `acl_user_role` VALUES ('1296343056387198977', '1296341621322825729', '1296342997553696769', '0', '2020-08-20 15:07:24', '2020-08-20 15:07:24');
INSERT INTO `acl_user_role` VALUES ('1296657892589465601', '1296656642959503361', '1296657852869406722', '0', '2020-08-21 11:58:27', '2020-08-21 11:58:27');
INSERT INTO `acl_user_role` VALUES ('1296659019410206722', '1296658571068469249', '1296658810076688386', '0', '2020-08-21 12:02:56', '2020-08-21 12:02:56');

-- ----------------------------
-- Table structure for crm_banner
-- ----------------------------
DROP TABLE IF EXISTS `crm_banner`;
CREATE TABLE `crm_banner` (
                              `id` char(19) NOT NULL DEFAULT '' COMMENT 'ID',
                              `title` varchar(20) DEFAULT '' COMMENT '标题',
                              `image_url` varchar(500) NOT NULL DEFAULT '' COMMENT '图片地址',
                              `link_url` varchar(500) DEFAULT '' COMMENT '链接地址',
                              `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
                              `is_deleted` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
                              `gmt_create` datetime NOT NULL COMMENT '创建时间',
                              `gmt_modified` datetime NOT NULL COMMENT '更新时间',
                              PRIMARY KEY (`id`),
                              UNIQUE KEY `uk_name` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='首页banner表';

-- ----------------------------
-- Records of crm_banner
-- ----------------------------
INSERT INTO `crm_banner` VALUES ('1194556896025845762', 'test1', 'https://online-teach-file.oss-cn-beijing.aliyuncs.com/cms/2019/11/14/297acd3b-b592-4cfb-a446-a28310369675.jpg', '/course', '1', '0', '2019-11-13 18:05:32', '2019-11-18 10:28:22');
INSERT INTO `crm_banner` VALUES ('1194607458461216769', 'test2', 'https://online-teach-file.oss-cn-beijing.aliyuncs.com/cms/2019/11/13/8f80790d-d736-4842-a6a4-4dcb0d684d4e.jpg', '/teacher', '2', '0', '2019-11-13 21:26:27', '2019-11-14 09:12:15');

-- ----------------------------
-- Table structure for edu_chapter
-- ----------------------------
DROP TABLE IF EXISTS `edu_chapter`;
CREATE TABLE `edu_chapter` (
                               `id` char(19) NOT NULL COMMENT '章节ID',
                               `course_id` char(19) NOT NULL COMMENT '课程ID',
                               `title` varchar(50) NOT NULL COMMENT '章节名称',
                               `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '显示排序',
                               `gmt_create` datetime NOT NULL COMMENT '创建时间',
                               `gmt_modified` datetime NOT NULL COMMENT '更新时间',
                               PRIMARY KEY (`id`),
                               KEY `idx_course_id` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='课程';

-- ----------------------------
-- Records of edu_chapter
-- ----------------------------
INSERT INTO `edu_chapter` VALUES ('1292089439882878978', '1292089410745049089', '第一章', '0', '2020-08-08 21:25:03', '2020-08-08 21:25:03');
INSERT INTO `edu_chapter` VALUES ('1292097784467464194', '1292097678242521090', '时间', '1', '2020-08-08 21:58:12', '2020-08-08 21:58:12');
INSERT INTO `edu_chapter` VALUES ('1292278906387038209', '1292278889588850690', 'ss', '0', '2020-08-09 09:57:55', '2020-08-09 09:57:55');
INSERT INTO `edu_chapter` VALUES ('1292380380689567746', '1292380353153961986', '1515', '0', '2020-08-09 16:41:09', '2020-08-09 16:41:09');
INSERT INTO `edu_chapter` VALUES ('1292682457631481857', '1292682429575782401', 'a', '0', '2020-08-10 12:41:29', '2020-08-10 12:41:29');
INSERT INTO `edu_chapter` VALUES ('1294175999164014594', '1294175937918787585', '第一章、什么是艺术', '0', '2020-08-14 15:36:17', '2020-08-14 15:36:17');

-- ----------------------------
-- Table structure for edu_comment
-- ----------------------------
DROP TABLE IF EXISTS `edu_comment`;
CREATE TABLE `edu_comment` (
                               `id` char(19) NOT NULL COMMENT '讲师ID',
                               `course_id` varchar(19) NOT NULL DEFAULT '' COMMENT '课程id',
                               `teacher_id` char(19) NOT NULL DEFAULT '' COMMENT '讲师id',
                               `member_id` varchar(19) NOT NULL DEFAULT '' COMMENT '会员id',
                               `nickname` varchar(50) DEFAULT NULL COMMENT '会员昵称',
                               `avatar` varchar(255) DEFAULT NULL COMMENT '会员头像',
                               `content` varchar(500) DEFAULT NULL COMMENT '评论内容',
                               `is_deleted` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
                               `gmt_create` datetime NOT NULL COMMENT '创建时间',
                               `gmt_modified` datetime NOT NULL COMMENT '更新时间',
                               PRIMARY KEY (`id`),
                               KEY `idx_course_id` (`course_id`),
                               KEY `idx_teacher_id` (`teacher_id`),
                               KEY `idx_member_id` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='评论';

-- ----------------------------
-- Records of edu_comment
-- ----------------------------
INSERT INTO `edu_comment` VALUES ('1194499162790211585', '1192252213659774977', '1189389726308478977', '1', '小三123', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132', '课程很好', '0', '2019-11-13 14:16:08', '2019-11-13 14:16:08');
INSERT INTO `edu_comment` VALUES ('1194898406466420738', '1192252213659774977', '1189389726308478977', '1', '小三123', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132', '11', '0', '2019-11-14 16:42:35', '2019-11-14 16:42:35');
INSERT INTO `edu_comment` VALUES ('1194898484388200450', '1192252213659774977', '1189389726308478977', '1', '小三123', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132', '111', '0', '2019-11-14 16:42:53', '2019-11-14 16:42:53');
INSERT INTO `edu_comment` VALUES ('1195251020861317122', '1192252213659774977', '1189389726308478977', '1', null, null, '2233', '0', '2019-11-15 16:03:45', '2019-11-15 16:03:45');
INSERT INTO `edu_comment` VALUES ('1195251382720700418', '1192252213659774977', '1189389726308478977', '1', null, null, '4455', '0', '2019-11-15 16:05:11', '2019-11-15 16:05:11');
INSERT INTO `edu_comment` VALUES ('1195252819177570306', '1192252213659774977', '1189389726308478977', '1', '小三1231', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132', '55', '0', '2019-11-15 16:10:53', '2019-11-15 16:10:53');
INSERT INTO `edu_comment` VALUES ('1195252899448160258', '1192252213659774977', '1189389726308478977', '1', '小三1231', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132', '55', '0', '2019-11-15 16:11:13', '2019-11-15 16:11:13');
INSERT INTO `edu_comment` VALUES ('1195252920587452417', '1192252213659774977', '1189389726308478977', '1', '小三1231', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132', '223344', '0', '2019-11-15 16:11:18', '2019-11-15 16:11:18');
INSERT INTO `edu_comment` VALUES ('1195262128095559681', '14', '1189389726308478977', '1', '小三1231', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132', '11', '0', '2019-11-15 16:47:53', '2019-11-15 16:47:53');
INSERT INTO `edu_comment` VALUES ('1196264505170767874', '1192252213659774977', '1189389726308478977', '1', '小三1231', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132', '666666', '0', '2019-11-18 11:10:58', '2019-11-18 11:10:58');

-- ----------------------------
-- Table structure for edu_course
-- ----------------------------
DROP TABLE IF EXISTS `edu_course`;
CREATE TABLE `edu_course` (
                              `id` char(19) NOT NULL COMMENT '课程ID',
                              `teacher_id` char(19) NOT NULL COMMENT '课程讲师ID',
                              `subject_id` char(19) NOT NULL COMMENT '课程专业ID',
                              `subject_parent_id` varchar(40) CHARACTER SET utf8 DEFAULT NULL,
                              `title` varchar(50) NOT NULL COMMENT '课程标题',
                              `price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '课程销售价格，设置为0则可免费观看',
                              `lesson_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '总课时',
                              `cover` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '课程封面图片路径',
                              `buy_count` bigint(10) unsigned NOT NULL DEFAULT '0' COMMENT '销售数量',
                              `view_count` bigint(10) unsigned NOT NULL DEFAULT '0' COMMENT '浏览数量',
                              `version` bigint(20) unsigned NOT NULL DEFAULT '1' COMMENT '乐观锁',
                              `status` varchar(10) NOT NULL DEFAULT 'Draft' COMMENT '课程状态 Draft未发布  Normal已发布',
                              `is_deleted` tinyint(3) DEFAULT NULL COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
                              `gmt_create` datetime NOT NULL COMMENT '创建时间',
                              `gmt_modified` datetime NOT NULL COMMENT '更新时间',
                              PRIMARY KEY (`id`),
                              KEY `idx_title` (`title`),
                              KEY `idx_subject_id` (`subject_id`),
                              KEY `idx_teacher_id` (`teacher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='课程';

-- ----------------------------
-- Records of edu_course
-- ----------------------------
INSERT INTO `edu_course` VALUES ('11', '1189389726308478977', '1293200126730330114', '1293200126705164289', 'java基础课程：test', '0.01', '2', 'http://edu-longyang.oss-cn-beijing.aliyuncs.com/2020/08/06/587d5686663541d986a750be8c9b99b9java.jpg', '4', '387', '1', 'Normal', '0', '2019-11-07 09:27:33', '2019-11-18 13:35:03');
INSERT INTO `edu_course` VALUES ('12', 'string333', '1293200126810021889', '1293200126793244674', 'mysql基础', '0.00', '0', 'http://edu-longyang.oss-cn-beijing.aliyuncs.com/2020/08/06/587d5686663541d986a750be8c9b99b9java.jpg', '0', '20', '1', 'Draft', null, '2020-08-06 15:31:40', '2020-08-06 15:31:40');
INSERT INTO `edu_course` VALUES ('1291291664610062338', '', '1293200126730330114', '1293200126705164289', 'java从入门到入土', '30.00', '66', 'http://edu-longyang.oss-cn-beijing.aliyuncs.com/2020/08/06/587d5686663541d986a750be8c9b99b9java.jpg', '0', '46', '1', 'Draft', null, '2020-08-06 16:34:59', '2020-08-06 16:34:59');
INSERT INTO `edu_course` VALUES ('1291293802446819330', '', '1293200126810021889', '1293200126793244674', 'mysql高级优化', '55.00', '55', 'http://edu-longyang.oss-cn-beijing.aliyuncs.com/2020/08/06/587d5686663541d986a750be8c9b99b9java.jpg', '0', '0', '1', 'Draft', null, '2020-08-06 16:43:28', '2020-08-06 16:43:28');
INSERT INTO `edu_course` VALUES ('1291298930809737218', '1189390295668469762', '', null, '测试讲师下拉列表', '3.00', '30', 'http://edu-longyang.oss-cn-beijing.aliyuncs.com/2020/08/06/587d5686663541d986a750be8c9b99b9java.jpg', '0', '0', '1', 'Draft', null, '2020-08-06 17:03:51', '2020-08-06 17:03:51');
INSERT INTO `edu_course` VALUES ('1291308800434868226', '', '', null, '', '0.00', '0', 'http://edu-longyang.oss-cn-beijing.aliyuncs.com/2020/08/06/587d5686663541d986a750be8c9b99b9java.jpg', '0', '0', '1', 'Draft', null, '2020-08-06 17:43:04', '2020-08-06 17:43:04');
INSERT INTO `edu_course` VALUES ('1291556196871901185', '1290646470801776642', '1291017435083829250', null, '文本测试', '99.00', '30', 'http://edu-longyang.oss-cn-beijing.aliyuncs.com/2020/08/06/587d5686663541d986a750be8c9b99b9java.jpg', '0', '0', '1', 'Draft', null, '2020-08-07 10:06:08', '2020-08-07 10:06:08');
INSERT INTO `edu_course` VALUES ('1291557512700538881', '1189389726308478977', '1291017433825538050', '1291017433578074114', '最终测试课程添加', '88.00', '66', 'http://edu-longyang.oss-cn-beijing.aliyuncs.com/2020/08/06/587d5686663541d986a750be8c9b99b9java.jpg', '0', '0', '1', 'Draft', null, '2020-08-07 10:11:22', '2020-08-07 10:11:22');
INSERT INTO `edu_course` VALUES ('1291573462208405505', '', '', '', '', '0.00', '0', 'http://edu-longyang.oss-cn-beijing.aliyuncs.com/2020/08/06/587d5686663541d986a750be8c9b99b9java.jpg', '0', '66', '1', 'Draft', null, '2020-08-07 11:14:44', '2020-08-07 11:14:44');
INSERT INTO `edu_course` VALUES ('1291586005811359746', '1189426464967995393', '1291017434110750721', '1291017433578074114', '666', '22.00', '66', 'http://edu-longyang.oss-cn-beijing.aliyuncs.com/2020/08/06/587d5686663541d986a750be8c9b99b9java.jpg', '0', '0', '1', 'Draft', null, '2020-08-07 12:04:35', '2020-08-07 12:04:35');
INSERT INTO `edu_course` VALUES ('1291590342465843201', '1192249914833055746', '1291017434811199490', '1291017434525986817', '修改课程测试gogogo', '10.00', '10', 'http://edu-longyang.oss-cn-beijing.aliyuncs.com/2020/08/06/587d5686663541d986a750be8c9b99b9java.jpg', '0', '55', '1', 'Draft', null, '2020-08-07 12:21:49', '2020-08-07 12:24:04');
INSERT INTO `edu_course` VALUES ('1291635923703885825', '1192327476087115778', '1291017434668593154', '1291017434525986817', '测试章节', '60.00', '10', 'http://edu-longyang.oss-cn-beijing.aliyuncs.com/2020/08/06/587d5686663541d986a750be8c9b99b9java.jpg', '0', '0', '1', 'Draft', null, '2020-08-07 15:22:56', '2020-08-07 15:22:56');
INSERT INTO `edu_course` VALUES ('1291647981346443266', '1192249914833055746', '1291017433825538050', '1291017433578074114', 'a', '11.00', '10', 'http://edu-longyang.oss-cn-beijing.aliyuncs.com/2020/08/06/587d5686663541d986a750be8c9b99b9java.jpg', '0', '0', '1', 'Draft', null, '2020-08-07 16:10:51', '2020-08-07 16:10:51');
INSERT INTO `edu_course` VALUES ('1291913972575965186', '66', '1291017434391769090', '1291017433578074114', '提交显示测试', '10.00', '10', 'http://edu-longyang.oss-cn-beijing.aliyuncs.com/2020/08/06/587d5686663541d986a750be8c9b99b9java.jpg', '0', '0', '1', 'Draft', null, '2020-08-08 09:47:48', '2020-08-08 09:47:48');
INSERT INTO `edu_course` VALUES ('1291920219912081409', '1', '1291017433825538050', '1291017433578074114', '老雮尘珠2', '1.00', '10', 'http://edu-longyang.oss-cn-beijing.aliyuncs.com/2020/08/06/587d5686663541d986a750be8c9b99b9java.jpg', '0', '0', '1', 'Normal', null, '2020-08-08 10:12:38', '2020-08-08 10:25:33');
INSERT INTO `edu_course` VALUES ('1292089410745049089', '1192249914833055746', '1291017434668593154', '1291017434525986817', '测试视频上传', '10.00', '10', 'http://edu-longyang.oss-cn-beijing.aliyuncs.com/2020/08/06/587d5686663541d986a750be8c9b99b9java.jpg', '0', '0', '1', 'Normal', null, '2020-08-08 21:24:56', '2020-08-08 21:27:58');
INSERT INTO `edu_course` VALUES ('1292097678242521090', '1292097031057219585', '1291017433825538050', '1291017433578074114', '时间管理', '999.00', '6', 'http://edu-longyang.oss-cn-beijing.aliyuncs.com/2020/08/06/587d5686663541d986a750be8c9b99b9java.jpg', '0', '0', '1', 'Normal', null, '2020-08-08 21:57:47', '2020-08-08 21:59:44');
INSERT INTO `edu_course` VALUES ('1292278889588850690', '1189389726308478977', '1291017433825538050', '1291017433578074114', 'qwe', '30.00', '1', 'http://edu-longyang.oss-cn-beijing.aliyuncs.com/2020/08/06/587d5686663541d986a750be8c9b99b9java.jpg', '0', '0', '1', 'Draft', null, '2020-08-09 09:57:51', '2020-08-09 09:57:51');
INSERT INTO `edu_course` VALUES ('1292380353153961986', '1192327476087115778', '1291017433825538050', '1291017433578074114', '测试熔断器', '10.00', '10', 'http://edu-longyang.oss-cn-beijing.aliyuncs.com/2020/08/06/587d5686663541d986a750be8c9b99b9java.jpg', '0', '0', '1', 'Normal', null, '2020-08-09 16:41:02', '2020-08-09 16:45:34');
INSERT INTO `edu_course` VALUES ('1292682429575782401', '1189389726308478977', '1293200126772273153', '1293200126705164289', 'c++精品课程', '10.00', '0', 'http://edu-longyang.oss-cn-beijing.aliyuncs.com/2020/08/06/587d5686663541d986a750be8c9b99b9java.jpg', '0', '0', '1', 'Draft', null, '2020-08-10 12:41:23', '2020-08-10 12:41:23');
INSERT INTO `edu_course` VALUES ('1299175937918787585', '1294175384794947586', '1293200126365425666', '1293200126289928194', '艺术管理', '2.00', '20', 'http://edu-longyang.oss-cn-beijing.aliyuncs.com/2020/08/06/587d5686663541d986a750be8c9b99b9java.jpg', '0', '0', '1', 'Normal', null, '2020-08-14 15:36:03', '2020-08-14 15:37:19');
INSERT INTO `edu_course` VALUES ('14', '1189389726308478977', '1293200126319288322', '1293200126289928194', 'XHTML CSS2 JS整站制作教程课程学习', '0.00', '3', 'http://edu-longyang.oss-cn-beijing.aliyuncs.com/2020/08/06/587d5686663541d986a750be8c9b99b9java.jpg', '3', '44', '15', 'Normal', '0', '2018-04-02 18:33:34', '2019-11-16 21:21:45');
INSERT INTO `edu_course` VALUES ('15', '1189389726308478977', '1293200126365425666', '1293200126289928194', 'HTML5入门课程学习', '0.00', '23', 'http://edu-longyang.oss-cn-beijing.aliyuncs.com/2020/08/06/587d5686663541d986a750be8c9b99b9java.jpg', '0', '51', '17', 'Normal', '0', '2018-04-02 18:34:32', '2019-11-12 10:19:20');
INSERT INTO `edu_course` VALUES ('18', '1189389726308478977', '1293200126730330114', '1293200126705164289', 'Java精品课程', '0.01', '20', 'http://edu-longyang.oss-cn-beijing.aliyuncs.com/2020/08/06/587d5686663541d986a750be8c9b99b9java.jpg', '151', '737', '6', 'Normal', '0', '2018-04-02 21:28:46', '2019-11-18 11:14:52');

-- ----------------------------
-- Table structure for edu_course_collect
-- ----------------------------
DROP TABLE IF EXISTS `edu_course_collect`;
CREATE TABLE `edu_course_collect` (
                                      `id` char(19) NOT NULL COMMENT '收藏ID',
                                      `course_id` char(19) NOT NULL COMMENT '课程讲师ID',
                                      `member_id` char(19) NOT NULL DEFAULT '' COMMENT '课程专业ID',
                                      `is_deleted` tinyint(3) NOT NULL DEFAULT '0' COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
                                      `gmt_create` datetime NOT NULL COMMENT '创建时间',
                                      `gmt_modified` datetime NOT NULL COMMENT '更新时间',
                                      PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='课程收藏';

-- ----------------------------
-- Records of edu_course_collect
-- ----------------------------
INSERT INTO `edu_course_collect` VALUES ('1196269345666019330', '1192252213659774977', '1', '1', '2019-11-18 11:30:12', '2019-11-18 11:30:12');

-- ----------------------------
-- Table structure for edu_course_description
-- ----------------------------
DROP TABLE IF EXISTS `edu_course_description`;
CREATE TABLE `edu_course_description` (
                                          `id` char(19) NOT NULL COMMENT '课程ID',
                                          `description` text COMMENT '课程简介',
                                          `gmt_create` datetime NOT NULL COMMENT '创建时间',
                                          `gmt_modified` datetime NOT NULL COMMENT '更新时间',
                                          PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='课程简介';

-- ----------------------------
-- Records of edu_course_description
-- ----------------------------
INSERT INTO `edu_course_description` VALUES ('1292089410745049089', '<p>666</p>', '2020-08-08 21:24:56', '2020-08-08 21:24:56');
INSERT INTO `edu_course_description` VALUES ('1292097678242521090', '', '2020-08-08 21:57:47', '2020-08-08 21:57:47');
INSERT INTO `edu_course_description` VALUES ('1292278889588850690', '<p>qwe</p>', '2020-08-09 09:57:51', '2020-08-09 09:57:51');
INSERT INTO `edu_course_description` VALUES ('1292380353153961986', '<p>qq</p>', '2020-08-09 16:41:02', '2020-08-09 16:41:02');
INSERT INTO `edu_course_description` VALUES ('1292682429575782401', '<p>99</p>', '2020-08-10 12:41:23', '2020-08-10 12:41:23');
INSERT INTO `edu_course_description` VALUES ('1294175937918787585', '<p>发现艺术，发现美</p>', '2020-08-14 15:36:03', '2020-08-14 15:36:03');

-- ----------------------------
-- Table structure for edu_subject
-- ----------------------------
DROP TABLE IF EXISTS `edu_subject`;
CREATE TABLE `edu_subject` (
                               `id` char(19) DEFAULT NULL COMMENT '课程类别ID',
                               `title` varchar(10) NOT NULL COMMENT '类别名称',
                               `parent_id` char(19) NOT NULL DEFAULT '0' COMMENT '父ID',
                               `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序字段',
                               `gmt_create` datetime NOT NULL COMMENT '创建时间',
                               `gmt_modified` datetime NOT NULL COMMENT '更新时间',
                               KEY `idx_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='课程科目';

-- ----------------------------
-- Records of edu_subject
-- ----------------------------
INSERT INTO `edu_subject` VALUES ('1293200126289928194', '前端开发', '0', '0', '2020-08-11 22:58:31', '2020-08-11 22:58:31');
INSERT INTO `edu_subject` VALUES ('1293200126319288322', 'vue', '1293200126289928194', '0', '2020-08-11 22:58:31', '2020-08-11 22:58:31');
INSERT INTO `edu_subject` VALUES ('1293200126365425666', 'JavaScript', '1293200126289928194', '0', '2020-08-11 22:58:31', '2020-08-11 22:58:31');
INSERT INTO `edu_subject` VALUES ('1293200126688387074', 'JQuery', '1293200126289928194', '0', '2020-08-11 22:58:31', '2020-08-11 22:58:31');
INSERT INTO `edu_subject` VALUES ('1293200126705164289', '后端开发', '0', '0', '2020-08-11 22:58:31', '2020-08-11 22:58:31');
INSERT INTO `edu_subject` VALUES ('1293200126730330114', 'java', '1293200126705164289', '0', '2020-08-11 22:58:31', '2020-08-11 22:58:31');
INSERT INTO `edu_subject` VALUES ('1293200126772273153', 'c++', '1293200126705164289', '0', '2020-08-11 22:58:31', '2020-08-11 22:58:31');
INSERT INTO `edu_subject` VALUES ('1293200126793244674', '数据库开发', '0', '0', '2020-08-11 22:58:31', '2020-08-11 22:58:31');
INSERT INTO `edu_subject` VALUES ('1293200126810021889', 'mysql', '1293200126793244674', '0', '2020-08-11 22:58:31', '2020-08-11 22:58:31');

-- ----------------------------
-- Table structure for edu_teacher
-- ----------------------------
DROP TABLE IF EXISTS `edu_teacher`;
CREATE TABLE `edu_teacher` (
                               `id` char(19) NOT NULL COMMENT '讲师ID',
                               `name` varchar(20) NOT NULL COMMENT '讲师姓名',
                               `intro` varchar(500) NOT NULL DEFAULT '' COMMENT '讲师简介',
                               `career` varchar(500) DEFAULT NULL COMMENT '讲师资历,一句话说明讲师',
                               `level` int(10) unsigned NOT NULL COMMENT '头衔 1高级讲师 2首席讲师',
                               `avatar` varchar(255) DEFAULT NULL COMMENT '讲师头像',
                               `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
                               `is_deleted` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
                               `gmt_create` datetime NOT NULL COMMENT '创建时间',
                               `gmt_modified` datetime NOT NULL COMMENT '更新时间',
                               PRIMARY KEY (`id`),
                               UNIQUE KEY `uk_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='讲师';

-- ----------------------------
-- Records of edu_teacher
-- ----------------------------
INSERT INTO `edu_teacher` VALUES ('1', '张三', '近年主持国家自然科学基金（6项）、江苏省重大科技成果转化项目（5项）、江苏省产学研前瞻性联合研究项目（3项）、省工业科技支撑、省高技术、省自然科学基金等省部级及其企业的主要科研项目40多个，多个项目在企业成功转化，产生了较好的经济、社会和环境效益。积极开展产学研科技合作，并与省内16家企业建立了江苏省研究生工作站，其中6家为江苏省优秀研究生工作站', '高级', '1', 'https://guli-file-190513.oss-cn-beijing.aliyuncs.com/avatar/default.jpg', '0', '0', '2019-10-30 14:18:46', '2019-11-12 13:36:36');
INSERT INTO `edu_teacher` VALUES ('1189389726308478977', '晴天', '高级讲师简介', '高级讲师资历', '2', 'https://online-teach-file.oss-cn-beijing.aliyuncs.com/teacher/2019/10/30/de47ee9b-7fec-43c5-8173-13c5f7f689b2.png', '1', '0', '2019-10-30 11:53:03', '2019-10-30 11:53:03');
INSERT INTO `edu_teacher` VALUES ('1189390295668469762', '李刚', '高级讲师简介', '高级讲师', '2', 'http://edu-longyang.oss-cn-beijing.aliyuncs.com/2020/08/05/25f411209c8b44b9b003482b6265c3c9file.png', '2', '0', '2019-10-30 11:55:19', '2019-11-12 13:37:52');
INSERT INTO `edu_teacher` VALUES ('1189426437876985857', '王二', '高级讲师简介', '高级讲师', '1', 'http://edu-longyang.oss-cn-beijing.aliyuncs.com/2020/08/05/25f411209c8b44b9b003482b6265c3c9file.png', '0', '0', '2019-10-30 14:18:56', '2019-11-12 13:37:35');
INSERT INTO `edu_teacher` VALUES ('1189426464967995393', '王五', '高级讲师简介', '高级讲师', '1', 'http://edu-longyang.oss-cn-beijing.aliyuncs.com/2020/08/05/25f411209c8b44b9b003482b6265c3c9file.png', '0', '0', '2019-10-30 14:19:02', '2019-11-12 13:37:18');
INSERT INTO `edu_teacher` VALUES ('1192249914833055746', '李四', '高级讲师简介', '高级讲师', '1', 'http://edu-longyang.oss-cn-beijing.aliyuncs.com/2020/08/05/25f411209c8b44b9b003482b6265c3c9file.png', '0', '0', '2019-11-07 09:18:25', '2019-11-12 13:37:01');
INSERT INTO `edu_teacher` VALUES ('1192327476087115778', '1222-12-12', '1111', '11', '1', 'http://edu-longyang.oss-cn-beijing.aliyuncs.com/2020/08/05/25f411209c8b44b9b003482b6265c3c9file.png', '0', '0', '2019-11-07 14:26:37', '2019-11-11 16:26:26');
INSERT INTO `edu_teacher` VALUES ('1195337453429129218', 'test333', 'sdfsdf', 'sdfdf', '1', 'http://edu-longyang.oss-cn-beijing.aliyuncs.com/2020/08/05/25f411209c8b44b9b003482b6265c3c9file.png', '0', '0', '2019-11-15 21:47:12', '2020-08-04 23:45:31');
INSERT INTO `edu_teacher` VALUES ('1289906631454273538', 'hahaha', 'string', 'string', '0', 'http://edu-longyang.oss-cn-beijing.aliyuncs.com/2020/08/05/25f411209c8b44b9b003482b6265c3c9file.png', '0', '0', '2020-08-02 20:51:21', '2020-08-02 21:07:03');
INSERT INTO `edu_teacher` VALUES ('1290646470801776642', '张武', '我很好', '一般', '1', 'http://edu-longyang.oss-cn-beijing.aliyuncs.com/2020/08/05/25f411209c8b44b9b003482b6265c3c9file.png', '1', '0', '2020-08-04 21:51:12', '2020-08-04 21:51:12');
INSERT INTO `edu_teacher` VALUES ('1290647121648709633', '王麻子', '理工教授', '理工', '1', 'https://online-teach-file.oss-cn-beijing.aliyuncs.com/teacher/2019/11/08/e44a2e92-2421-4ea3-bb49-46f2ec96ef88.png', '1', '0', '2020-08-04 21:53:48', '2020-08-04 21:53:48');
INSERT INTO `edu_teacher` VALUES ('1290670160830558210', '哈嘿嘿', 'qqqq', '是是是', '1', 'http://edu-longyang.oss-cn-beijing.aliyuncs.com/2020/08/05/74e33ab5bf8d46848cb5df9943a02c56file.png', '0', '0', '2020-08-04 23:25:20', '2020-08-05 15:16:24');
INSERT INTO `edu_teacher` VALUES ('1290907563440754690', '测试头像上传', '222', '222', '1', 'http://edu-longyang.oss-cn-beijing.aliyuncs.com/2020/08/05/25f411209c8b44b9b003482b6265c3c9file.png', '1', '0', '2020-08-05 15:08:42', '2020-08-05 15:08:42');
INSERT INTO `edu_teacher` VALUES ('1292097031057219585', '龙洋', '男，曾任重庆市城管委员会会长、重庆工商大学融智学院保安一把手。', '重庆工商大学融智学院保安', '1', 'http://edu-longyang.oss-cn-beijing.aliyuncs.com/2020/08/08/ceacfa9cbe504bc8a9291d9bbe40e236file.png', '0', '0', '2020-08-08 21:55:13', '2020-08-08 21:55:13');
INSERT INTO `edu_teacher` VALUES ('1294175384794947586', '廖大姐', '重庆大学研究生、本科生，现在任职鱼洞街道清洁卫生', '重庆大学研究生', '1', 'http://edu-longyang.oss-cn-beijing.aliyuncs.com/2020/08/14/3d66cd734fa44cf988dcb88a2c11785bfile.png', '0', '0', '2020-08-14 15:33:51', '2020-08-14 15:33:51');
INSERT INTO `edu_teacher` VALUES ('2', '周杰伦', '著名歌星，擅长音乐制作', '重庆交通大学', '1', 'https://guli-file-190513.oss-cn-beijing.aliyuncs.com/avatar/default.jpg', '0', '0', '2020-08-02 16:54:17', '2020-08-02 16:54:21');
INSERT INTO `edu_teacher` VALUES ('66', '廖晓悦', '清华大学经济学博士后，曾任中央银行行长、清华大学经管学院院长。', '清华大学', '2', 'http://edu-longyang.oss-cn-beijing.aliyuncs.com/2020/08/08/80ec96616b0344ffbc5e9d9fe4e03914file.png', '0', '0', '2020-08-03 16:44:36', '2020-08-08 21:51:10');
INSERT INTO `edu_teacher` VALUES ('999', '热巴', '高级影星简介', '北京大学', '0', 'http://edu-longyang.oss-cn-beijing.aliyuncs.com/2020/08/05/74e33ab5bf8d46848cb5df9943a02c56file.png', '0', '0', '2020-07-27 17:18:04', '2020-08-04 17:18:08');

-- ----------------------------
-- Table structure for edu_video
-- ----------------------------
DROP TABLE IF EXISTS `edu_video`;
CREATE TABLE `edu_video` (
                             `id` char(19) NOT NULL COMMENT '视频ID',
                             `course_id` char(19) NOT NULL COMMENT '课程ID',
                             `chapter_id` char(19) NOT NULL COMMENT '章节ID',
                             `title` varchar(50) NOT NULL COMMENT '节点名称',
                             `video_source_id` varchar(100) DEFAULT NULL COMMENT '云端视频资源',
                             `video_original_name` varchar(100) DEFAULT NULL COMMENT '原始文件名称',
                             `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序字段',
                             `play_count` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '播放次数',
                             `is_free` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否可以试听：0收费 1免费',
                             `duration` float NOT NULL DEFAULT '0' COMMENT '视频时长（秒）',
                             `status` varchar(20) NOT NULL DEFAULT 'Empty' COMMENT 'Empty未上传 Transcoding转码中  Normal正常',
                             `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '视频源文件大小（字节）',
                             `version` bigint(20) unsigned NOT NULL DEFAULT '1' COMMENT '乐观锁',
                             `gmt_create` datetime NOT NULL COMMENT '创建时间',
                             `gmt_modified` datetime NOT NULL COMMENT '更新时间',
                             PRIMARY KEY (`id`),
                             KEY `idx_course_id` (`course_id`),
                             KEY `idx_chapter_id` (`chapter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='课程视频';

-- ----------------------------
-- Records of edu_video
-- ----------------------------
INSERT INTO `edu_video` VALUES ('1', '1294175937918787585', '1294175999164014594', '艺术的起源', 'fedcdb5027c5428ba29b93f7ef7c7a93', '', '0', '0', '0', '0', 'Empty', '0', '1', '2020-08-14 15:36:57', '2020-08-14 15:36:57');
INSERT INTO `edu_video` VALUES ('1292090147784925186', '1292089410745049089', '1292089439882878978', '第一节', 'e895880ce4784d9a866b17e8d8cd377b', '6 - What If I Want to Move Faster.mp4', '0', '0', '0', '0', 'Empty', '0', '1', '2020-08-08 21:27:52', '2020-08-08 21:27:52');
INSERT INTO `edu_video` VALUES ('1292097844735418369', '1292097678242521090', '1292097784467464194', '什么是时间', '851d386575034d1aa196f35525f9ad72', null, '0', '0', '0', '0', 'Empty', '0', '1', '2020-08-08 21:58:27', '2020-08-08 21:58:27');
INSERT INTO `edu_video` VALUES ('1292097969151057921', '1292097678242521090', '1292097784467464194', '为什么要时间管理', '851d386575034d1aa196f35525f9ad72', null, '0', '0', '0', '0', 'Empty', '0', '1', '2020-08-08 21:58:57', '2020-08-08 21:58:57');
INSERT INTO `edu_video` VALUES ('1292098059089518594', '1292097678242521090', '1292097784467464194', '怎样实现时间管理', '851d386575034d1aa196f35525f9ad72', null, '0', '0', '0', '0', 'Empty', '0', '1', '2020-08-08 21:59:18', '2020-08-08 21:59:18');
INSERT INTO `edu_video` VALUES ('1292380892084277249', '1292380353153961986', '1292380380689567746', '9999', '851d386575034d1aa196f35525f9ad72', '6 - What If I Want to Move Faster.mp4', '0', '0', '0', '0', 'Empty', '0', '1', '2020-08-09 16:43:11', '2020-08-09 16:43:11');
INSERT INTO `edu_video` VALUES ('1292682517811355649', '1292682429575782401', '1292682457631481857', '151', '851d386575034d1aa196f35525f9ad72', null, '10', '0', '0', '0', 'Empty', '0', '1', '2020-08-10 12:41:44', '2020-08-10 12:41:44');
INSERT INTO `edu_video` VALUES ('1294176165854044162', '1294175937918787585', '1294175999164014594', '艺术的起源', '851d386575034d1aa196f35525f9ad72', null, '0', '0', '0', '0', 'Empty', '0', '1', '2020-08-14 15:36:57', '2020-08-14 15:36:57');
INSERT INTO `edu_video` VALUES ('1294176222691057665', '1294175937918787585', '1294175999164014594', '艺术的发展过程', '851d386575034d1aa196f35525f9ad72', null, '0', '0', '0', '0', 'Empty', '0', '1', '2020-08-14 15:37:11', '2020-08-14 15:37:11');

-- ----------------------------
-- Table structure for members
-- ----------------------------
DROP TABLE IF EXISTS `members`;
CREATE TABLE `members` (
                           `id` int(11) NOT NULL,
                           `username` varchar(100) DEFAULT NULL,
                           `age` int(11) DEFAULT NULL,
                           PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of members
-- ----------------------------

-- ----------------------------
-- Table structure for statistics_daily
-- ----------------------------
DROP TABLE IF EXISTS `statistics_daily`;
CREATE TABLE `statistics_daily` (
                                    `id` char(19) NOT NULL COMMENT '主键',
                                    `date_calculated` varchar(20) NOT NULL COMMENT '统计日期',
                                    `register_num` int(11) NOT NULL DEFAULT '0' COMMENT '注册人数',
                                    `login_num` int(11) NOT NULL DEFAULT '0' COMMENT '登录人数',
                                    `video_view_num` int(11) NOT NULL DEFAULT '0' COMMENT '每日播放视频数',
                                    `course_num` int(11) NOT NULL DEFAULT '0' COMMENT '每日新增课程数',
                                    `gmt_create` datetime NOT NULL COMMENT '创建时间',
                                    `gmt_modified` datetime NOT NULL COMMENT '更新时间',
                                    PRIMARY KEY (`id`),
                                    KEY `statistics_day` (`date_calculated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='网站统计日数据';

-- ----------------------------
-- Records of statistics_daily
-- ----------------------------
INSERT INTO `statistics_daily` VALUES ('1078490017163833345', '2018-12-28', '0', '0', '154', '170', '2018-12-28 11:17:12', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1087142127818768386', '2019-01-02', '2', '0', '167', '177', '2019-01-21 08:17:36', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1087198321809457153', '2019-01-01', '1', '0', '130', '189', '2019-01-21 12:00:54', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1087198383973236738', '2019-01-03', '0', '0', '114', '130', '2019-01-21 12:01:09', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1087451681764982785', '2019-01-04', '0', '0', '118', '155', '2019-01-22 04:47:39', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1087455336471785473', '2019-01-05', '0', '0', '184', '186', '2019-01-22 05:02:11', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1105339962460491777', '2019-03-01', '0', '143', '168', '136', '2019-03-12 13:29:18', '2019-03-12 13:29:18');
INSERT INTO `statistics_daily` VALUES ('1105339977027309569', '2019-03-02', '0', '165', '171', '158', '2019-03-12 13:29:21', '2019-03-12 13:29:21');
INSERT INTO `statistics_daily` VALUES ('1105339990738489346', '2019-03-03', '0', '143', '147', '194', '2019-03-12 13:29:25', '2019-03-12 13:29:25');
INSERT INTO `statistics_daily` VALUES ('1105340000544772098', '2019-03-04', '0', '155', '106', '153', '2019-03-12 13:29:27', '2019-03-12 13:29:27');
INSERT INTO `statistics_daily` VALUES ('1105340011244441602', '2019-03-05', '0', '186', '102', '155', '2019-03-12 13:29:30', '2019-03-12 13:29:30');
INSERT INTO `statistics_daily` VALUES ('1105340020929089538', '2019-03-06', '0', '140', '192', '129', '2019-03-12 13:29:32', '2019-03-12 13:29:32');
INSERT INTO `statistics_daily` VALUES ('1105340029800042497', '2019-03-07', '0', '186', '139', '116', '2019-03-12 13:29:34', '2019-03-12 13:29:34');
INSERT INTO `statistics_daily` VALUES ('1105340038696161282', '2019-03-08', '0', '120', '166', '112', '2019-03-12 13:29:36', '2019-03-12 13:29:36');
INSERT INTO `statistics_daily` VALUES ('1105340049441968129', '2019-03-09', '0', '182', '147', '119', '2019-03-12 13:29:39', '2019-03-12 13:29:39');
INSERT INTO `statistics_daily` VALUES ('1105340059738984449', '2019-03-10', '0', '199', '141', '103', '2019-03-12 13:29:41', '2019-03-12 13:29:41');
INSERT INTO `statistics_daily` VALUES ('1105340070438653953', '2019-03-11', '0', '127', '137', '156', '2019-03-12 13:29:44', '2019-03-12 13:29:44');
INSERT INTO `statistics_daily` VALUES ('1105340080307851266', '2019-03-12', '0', '167', '123', '132', '2019-03-12 13:29:46', '2019-03-12 13:29:46');
INSERT INTO `statistics_daily` VALUES ('1105340090047025153', '2019-03-13', '0', '106', '132', '103', '2019-03-12 13:29:48', '2019-03-12 13:29:48');
INSERT INTO `statistics_daily` VALUES ('1105340100075606017', '2019-03-14', '0', '166', '180', '118', '2019-03-12 13:29:51', '2019-03-12 13:29:51');
INSERT INTO `statistics_daily` VALUES ('1105340110511034370', '2019-03-15', '0', '114', '151', '185', '2019-03-12 13:29:53', '2019-03-12 13:29:53');
INSERT INTO `statistics_daily` VALUES ('1105340121412030466', '2019-03-16', '0', '134', '105', '126', '2019-03-12 13:29:56', '2019-03-12 13:29:56');
INSERT INTO `statistics_daily` VALUES ('1105340132833120258', '2019-03-17', '0', '169', '106', '131', '2019-03-12 13:29:59', '2019-03-12 13:29:59');
INSERT INTO `statistics_daily` VALUES ('1105340145659301890', '2019-03-18', '0', '120', '106', '163', '2019-03-12 13:30:02', '2019-03-12 13:30:02');
INSERT INTO `statistics_daily` VALUES ('1105340153578147842', '2019-03-19', '0', '146', '155', '153', '2019-03-12 13:30:03', '2019-03-12 13:30:03');
INSERT INTO `statistics_daily` VALUES ('1105340162436517890', '2019-03-20', '0', '127', '181', '186', '2019-03-12 13:30:06', '2019-03-12 13:30:06');
INSERT INTO `statistics_daily` VALUES ('1105340171517186050', '2019-03-21', '0', '106', '134', '145', '2019-03-12 13:30:08', '2019-03-12 13:30:08');
INSERT INTO `statistics_daily` VALUES ('1105340181034061825', '2019-03-22', '0', '161', '182', '143', '2019-03-12 13:30:10', '2019-03-12 13:30:10');
INSERT INTO `statistics_daily` VALUES ('1105340190072786946', '2019-03-23', '0', '183', '101', '182', '2019-03-12 13:30:12', '2019-03-12 13:30:12');
INSERT INTO `statistics_daily` VALUES ('1105340199426084865', '2019-03-24', '0', '117', '100', '102', '2019-03-12 13:30:14', '2019-03-12 13:30:14');
INSERT INTO `statistics_daily` VALUES ('1105340209261727745', '2019-03-25', '0', '116', '103', '160', '2019-03-12 13:30:17', '2019-03-12 13:30:17');
INSERT INTO `statistics_daily` VALUES ('1105340217935548418', '2019-03-26', '0', '101', '119', '150', '2019-03-12 13:30:19', '2019-03-12 13:30:19');
INSERT INTO `statistics_daily` VALUES ('1105340225967640577', '2019-03-27', '0', '129', '141', '181', '2019-03-12 13:30:21', '2019-03-12 13:30:21');
INSERT INTO `statistics_daily` VALUES ('1105340234075230209', '2019-03-28', '0', '113', '179', '158', '2019-03-12 13:30:23', '2019-03-12 13:30:23');
INSERT INTO `statistics_daily` VALUES ('1105340242837131265', '2019-03-29', '0', '117', '131', '101', '2019-03-12 13:30:25', '2019-03-12 13:30:25');
INSERT INTO `statistics_daily` VALUES ('1105340252395950082', '2019-03-30', '0', '153', '187', '174', '2019-03-12 13:30:27', '2019-03-12 13:30:27');
INSERT INTO `statistics_daily` VALUES ('1105340261958963201', '2019-03-31', '0', '179', '135', '199', '2019-03-12 13:30:29', '2019-03-12 13:30:29');
INSERT INTO `statistics_daily` VALUES ('1105372743634898945', '2019-01-06', '0', '113', '143', '148', '2019-03-12 15:39:34', '2019-03-12 15:39:34');
INSERT INTO `statistics_daily` VALUES ('1105372754380705793', '2019-01-07', '0', '173', '158', '153', '2019-03-12 15:39:36', '2019-03-12 15:39:36');
INSERT INTO `statistics_daily` VALUES ('1105372762526044162', '2019-01-08', '0', '135', '199', '131', '2019-03-12 15:39:38', '2019-03-12 15:39:38');
INSERT INTO `statistics_daily` VALUES ('1105372771229224961', '2019-01-09', '0', '161', '107', '162', '2019-03-12 15:39:40', '2019-03-12 15:39:40');
INSERT INTO `statistics_daily` VALUES ('1105372780922261505', '2019-01-10', '0', '182', '196', '135', '2019-03-12 15:39:42', '2019-03-12 15:39:42');
INSERT INTO `statistics_daily` VALUES ('1105372790103592961', '2019-01-11', '0', '123', '194', '102', '2019-03-12 15:39:45', '2019-03-12 15:39:45');
INSERT INTO `statistics_daily` VALUES ('1105372798626418689', '2019-01-12', '0', '185', '106', '180', '2019-03-12 15:39:47', '2019-03-12 15:39:47');
INSERT INTO `statistics_daily` VALUES ('1165', '2018-01-01', '583', '26', '236', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1166', '2018-01-02', '583', '26', '236', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1167', '2018-01-03', '584', '26', '236', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1168', '2018-01-04', '584', '26', '237', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1169', '2018-01-05', '585', '26', '237', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1170', '2018-01-06', '585', '26', '237', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1171', '2018-01-07', '586', '26', '237', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1172', '2018-01-08', '586', '26', '237', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1173', '2018-01-09', '587', '26', '238', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1174', '2018-01-10', '587', '26', '238', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1175', '2018-01-11', '588', '27', '238', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1176', '2018-01-12', '588', '27', '238', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1177', '2018-01-13', '589', '27', '238', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1178', '2018-01-14', '589', '27', '239', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1179', '2018-01-15', '590', '27', '239', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1180', '2018-01-16', '590', '27', '239', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1181', '2018-01-17', '591', '27', '239', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1182', '2018-01-18', '591', '27', '239', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1183', '2018-01-19', '592', '27', '240', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1183991737299263490', '2019-10-01', '0', '145', '149', '153', '2019-10-15 14:23:22', '2019-10-15 14:23:22');
INSERT INTO `statistics_daily` VALUES ('1183999299272904705', '2019-10-03', '0', '125', '102', '153', '2019-10-15 14:53:25', '2019-10-15 14:53:25');
INSERT INTO `statistics_daily` VALUES ('1183999309477646338', '2019-10-04', '0', '103', '194', '161', '2019-10-15 14:53:28', '2019-10-15 14:53:28');
INSERT INTO `statistics_daily` VALUES ('1183999318919024642', '2019-10-05', '0', '173', '174', '147', '2019-10-15 14:53:30', '2019-10-15 14:53:30');
INSERT INTO `statistics_daily` VALUES ('1183999331409661954', '2019-10-06', '0', '129', '197', '173', '2019-10-15 14:53:33', '2019-10-15 14:53:33');
INSERT INTO `statistics_daily` VALUES ('1183999342897860610', '2019-10-07', '0', '184', '125', '169', '2019-10-15 14:53:36', '2019-10-15 14:53:36');
INSERT INTO `statistics_daily` VALUES ('1183999351588458498', '2019-10-08', '0', '173', '143', '138', '2019-10-15 14:53:38', '2019-10-15 14:53:38');
INSERT INTO `statistics_daily` VALUES ('1183999360316805122', '2019-10-09', '0', '161', '158', '117', '2019-10-15 14:53:40', '2019-10-15 14:53:40');
INSERT INTO `statistics_daily` VALUES ('1183999367480676353', '2019-10-10', '0', '190', '166', '135', '2019-10-15 14:53:42', '2019-10-15 14:53:42');
INSERT INTO `statistics_daily` VALUES ('1184', '2018-01-20', '592', '27', '240', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1184030117693284353', '2019-10-11', '0', '182', '199', '193', '2019-10-15 16:55:53', '2019-10-15 16:55:53');
INSERT INTO `statistics_daily` VALUES ('1185', '2018-01-21', '593', '27', '240', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1185373213064482818', '2019-01-19', '6', '135', '126', '167', '2019-10-19 09:52:52', '2019-10-19 09:52:52');
INSERT INTO `statistics_daily` VALUES ('1186', '2018-01-22', '593', '27', '240', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1186536619937435650', '2019-10-02', '0', '187', '183', '108', '2019-10-22 14:55:50', '2019-10-22 14:55:50');
INSERT INTO `statistics_daily` VALUES ('1187', '2018-01-23', '594', '27', '240', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1188', '2018-01-24', '594', '27', '241', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1189', '2018-01-25', '595', '27', '241', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1190', '2018-01-26', '595', '27', '241', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1191', '2018-01-27', '596', '27', '241', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1192', '2018-01-28', '596', '27', '241', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1192253597226455042', '2019-11-01', '0', '129', '122', '167', '2019-11-07 09:33:03', '2019-11-07 09:33:03');
INSERT INTO `statistics_daily` VALUES ('1192253902756335617', '2019-11-02', '0', '170', '192', '192', '2019-11-07 09:34:16', '2019-11-07 09:34:16');
INSERT INTO `statistics_daily` VALUES ('1193', '2018-01-29', '597', '27', '242', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1194', '2018-01-30', '597', '27', '242', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1194060032935493633', '2019-11-11', '0', '121', '121', '122', '2019-11-12 09:11:11', '2019-11-12 09:11:11');
INSERT INTO `statistics_daily` VALUES ('1194060301425475585', '2019-11-10', '0', '155', '187', '140', '2019-11-12 09:12:15', '2019-11-12 09:12:15');
INSERT INTO `statistics_daily` VALUES ('1195', '2018-01-31', '598', '27', '242', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1196', '2018-02-01', '598', '27', '242', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1197', '2018-02-02', '599', '27', '242', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1198', '2018-02-03', '599', '27', '243', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1199', '2018-02-04', '600', '27', '243', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1200', '2018-02-05', '600', '27', '243', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1201', '2018-02-06', '601', '27', '243', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1202', '2018-02-07', '601', '27', '243', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1203', '2018-02-08', '602', '27', '244', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1204', '2018-02-09', '602', '27', '244', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1205', '2018-02-10', '603', '27', '244', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1206', '2018-02-11', '603', '27', '244', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1207', '2018-02-12', '604', '27', '244', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1208', '2018-02-13', '604', '27', '245', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1209', '2018-02-14', '605', '27', '245', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1210', '2018-02-15', '605', '27', '245', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1211', '2018-02-16', '606', '27', '245', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1212', '2018-02-17', '606', '27', '245', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1213', '2018-02-18', '607', '27', '246', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1214', '2018-02-19', '607', '27', '246', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1215', '2018-02-20', '608', '27', '246', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1216', '2018-02-21', '608', '27', '246', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1217', '2018-02-22', '609', '27', '246', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1218', '2018-02-23', '609', '27', '247', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1219', '2018-02-24', '610', '27', '247', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1220', '2018-02-25', '610', '27', '247', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1221', '2018-02-26', '611', '27', '247', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1222', '2018-02-27', '611', '27', '247', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1223', '2018-02-28', '612', '27', '248', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1224', '2018-03-01', '612', '27', '248', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1225', '2018-03-02', '613', '28', '248', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1226', '2018-03-03', '613', '28', '248', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1227', '2018-03-04', '614', '28', '248', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1228', '2018-03-05', '614', '28', '249', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1229', '2018-03-06', '615', '28', '249', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1230', '2018-03-07', '615', '28', '249', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1231', '2018-03-08', '616', '28', '249', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1232', '2018-03-09', '616', '28', '249', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1233', '2018-03-10', '617', '28', '250', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1234', '2018-03-11', '617', '28', '250', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1235', '2018-03-12', '618', '28', '250', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1236', '2018-03-13', '618', '28', '250', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1237', '2018-03-14', '619', '28', '250', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1238', '2018-03-15', '619', '28', '251', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1239', '2018-03-16', '620', '28', '251', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1240', '2018-03-17', '620', '28', '251', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1241', '2018-03-18', '621', '28', '251', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1242', '2018-03-19', '621', '28', '251', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1243', '2018-03-20', '622', '28', '252', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1244', '2018-03-21', '622', '28', '252', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1245', '2018-03-22', '623', '28', '252', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1246', '2018-03-23', '623', '28', '252', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1247', '2018-03-24', '624', '28', '252', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1248', '2018-03-25', '624', '28', '253', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1249', '2018-03-26', '625', '28', '253', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1250', '2018-03-27', '625', '28', '253', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1251', '2018-03-28', '626', '28', '253', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1252', '2018-03-29', '626', '28', '253', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1253', '2018-03-30', '627', '28', '254', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1254', '2018-03-31', '627', '28', '254', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1255', '2018-04-01', '628', '28', '254', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1256', '2018-04-02', '628', '28', '254', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1257', '2018-04-03', '629', '28', '254', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1258', '2018-04-04', '629', '28', '255', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1259', '2018-04-05', '630', '28', '255', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1260', '2018-04-06', '630', '28', '255', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1261', '2018-04-07', '631', '28', '255', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1262', '2018-04-08', '631', '28', '255', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1263', '2018-04-09', '632', '28', '256', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1264', '2018-04-10', '632', '28', '256', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1265', '2018-04-11', '633', '28', '256', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1266', '2018-04-12', '633', '28', '256', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1267', '2018-04-13', '634', '28', '256', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1268', '2018-04-14', '634', '28', '257', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1269', '2018-04-15', '635', '28', '257', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1270', '2018-04-16', '635', '28', '257', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1271', '2018-04-17', '636', '28', '257', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1272', '2018-04-18', '636', '28', '257', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1273', '2018-04-19', '637', '28', '258', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1274', '2018-04-20', '637', '28', '258', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1275', '2018-04-21', '638', '29', '258', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1276', '2018-04-22', '638', '29', '258', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1277', '2018-04-23', '639', '29', '258', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1278', '2018-04-24', '639', '29', '259', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1279', '2018-04-25', '640', '29', '259', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1280', '2018-04-26', '640', '29', '259', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1281', '2018-04-27', '641', '29', '259', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1282', '2018-04-28', '641', '29', '259', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1283', '2018-04-29', '642', '29', '260', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1284', '2018-04-30', '642', '29', '260', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1285', '2018-05-01', '643', '29', '260', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1286', '2018-05-02', '643', '29', '260', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1287', '2018-05-03', '644', '29', '260', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1288', '2018-05-04', '644', '29', '261', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1289', '2018-05-05', '645', '29', '261', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1290', '2018-05-06', '645', '29', '261', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1291', '2018-05-07', '646', '29', '261', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1292', '2018-05-08', '646', '29', '261', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1293', '2018-05-09', '647', '29', '262', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1294', '2018-05-10', '647', '29', '262', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1295', '2018-05-11', '648', '29', '262', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1295626066102104065', '2020-08-12', '3', '145', '168', '131', '2020-08-18 15:38:20', '2020-08-18 15:38:20');
INSERT INTO `statistics_daily` VALUES ('1296', '2018-05-12', '648', '29', '262', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1297', '2018-05-13', '649', '29', '262', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1298', '2018-05-14', '649', '29', '263', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1299', '2018-05-15', '5', '29', '263', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1300', '2018-05-16', '650', '29', '263', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1301', '2018-05-17', '651', '29', '263', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1302', '2018-05-18', '651', '29', '263', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1303', '2018-05-19', '652', '29', '264', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1304', '2018-05-20', '652', '29', '264', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1305', '2018-05-21', '653', '29', '264', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1306', '2018-05-22', '1', '29', '264', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1307', '2018-05-23', '654', '29', '264', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1308', '2018-05-24', '654', '29', '265', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1309', '2018-05-25', '1', '29', '265', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1310', '2018-05-26', '655', '29', '265', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1311', '2018-05-27', '656', '29', '265', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1312', '2018-05-28', '656', '29', '265', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1313', '2018-05-29', '657', '29', '266', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1314', '2018-05-30', '657', '29', '266', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1315', '2018-05-31', '658', '29', '266', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1316', '2018-06-01', '658', '29', '266', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1317', '2018-06-02', '659', '29', '266', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1318', '2018-06-03', '659', '29', '267', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1319', '2018-06-04', '660', '29', '267', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1320', '2018-06-05', '660', '29', '267', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1321', '2018-06-06', '661', '29', '267', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1322', '2018-06-07', '661', '29', '267', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1323', '2018-06-08', '662', '29', '268', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1324', '2018-06-09', '662', '29', '268', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1325', '2018-06-10', '663', '30', '268', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1326', '2018-06-11', '663', '30', '268', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1327', '2018-06-12', '664', '30', '268', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1328', '2018-06-13', '664', '30', '269', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1329', '2018-06-14', '665', '30', '269', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1330', '2018-06-15', '665', '30', '269', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1331', '2018-06-16', '666', '30', '269', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1332', '2018-06-17', '666', '30', '269', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1333', '2018-06-18', '667', '30', '270', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1334', '2018-06-19', '667', '30', '270', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1335', '2018-06-20', '668', '30', '270', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1336', '2018-06-21', '668', '30', '270', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1337', '2018-06-22', '669', '30', '270', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1338', '2018-06-23', '669', '30', '271', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1339', '2018-06-24', '670', '30', '271', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1340', '2018-06-25', '670', '30', '271', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1341', '2018-06-26', '671', '30', '271', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1342', '2018-06-27', '671', '30', '271', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1343', '2018-06-28', '672', '30', '272', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1344', '2018-06-29', '672', '30', '272', '14', '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1345', '2018-06-30', '673', '30', '272', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1346', '2018-07-01', '673', '30', '272', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1347', '2018-07-02', '674', '30', '272', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1348', '2018-07-03', '674', '30', '273', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1349', '2018-07-04', '675', '30', '273', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1350', '2018-07-05', '675', '30', '273', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1351', '2018-07-06', '676', '30', '273', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1352', '2018-07-07', '676', '30', '273', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1353', '2018-07-08', '677', '30', '274', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1354', '2018-07-09', '677', '30', '274', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1355', '2018-07-10', '678', '30', '274', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1356', '2018-07-11', '678', '30', '274', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1357', '2018-07-12', '679', '30', '274', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1358', '2018-07-13', '679', '30', '275', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1359', '2018-07-14', '680', '30', '275', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1360', '2018-07-15', '680', '30', '275', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1361', '2018-07-16', '681', '30', '275', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1362', '2018-07-17', '681', '30', '275', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1363', '2018-07-18', '682', '30', '276', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1364', '2018-07-19', '682', '30', '276', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1365', '2018-07-20', '683', '30', '276', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1366', '2018-07-21', '683', '30', '276', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1367', '2018-07-22', '684', '30', '276', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1368', '2018-07-23', '684', '30', '277', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1369', '2018-07-24', '685', '30', '277', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1370', '2018-07-25', '685', '30', '277', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1371', '2018-07-26', '686', '30', '277', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1372', '2018-07-27', '686', '30', '277', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1373', '2018-07-28', '687', '30', '278', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1374', '2018-07-29', '687', '30', '278', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1375', '2018-07-30', '688', '31', '278', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1376', '2018-07-31', '688', '31', '278', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1377', '2018-08-01', '689', '31', '278', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1378', '2018-08-02', '689', '31', '279', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1379', '2018-08-03', '690', '31', '279', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1380', '2018-08-04', '690', '31', '279', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1381', '2018-08-05', '691', '31', '279', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1382', '2018-08-06', '691', '31', '279', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1383', '2018-08-07', '692', '31', '280', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1384', '2018-08-08', '692', '31', '280', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1385', '2018-08-09', '1', '31', '280', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1386', '2018-08-10', '693', '31', '280', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1387', '2018-08-11', '694', '31', '280', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1388', '2018-08-12', '694', '31', '281', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1389', '2018-08-13', '695', '31', '281', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1390', '2018-08-14', '695', '31', '281', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1391', '2018-08-15', '696', '31', '281', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1392', '2018-08-16', '696', '31', '281', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1393', '2018-08-17', '697', '31', '282', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1394', '2018-08-18', '697', '31', '282', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1395', '2018-08-19', '698', '31', '282', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1396', '2018-08-20', '698', '31', '282', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1397', '2018-08-21', '699', '31', '282', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1398', '2018-08-22', '699', '31', '283', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1399', '2018-08-23', '700', '31', '283', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1400', '2018-08-24', '700', '31', '283', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1401', '2018-08-25', '701', '31', '283', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1402', '2018-08-26', '701', '31', '283', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1403', '2018-08-27', '702', '31', '284', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1404', '2018-08-28', '702', '31', '284', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1405', '2018-08-29', '703', '31', '284', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1406', '2018-08-30', '703', '31', '284', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1407', '2018-08-31', '704', '31', '284', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1408', '2018-09-01', '1', '31', '285', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1409', '2018-09-02', '705', '31', '285', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1410', '2018-09-03', '705', '31', '285', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1411', '2018-09-04', '706', '31', '285', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1412', '2018-09-05', '706', '31', '285', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1413', '2018-09-06', '707', '31', '286', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1414', '2018-09-07', '707', '31', '1', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1415', '2018-09-08', '708', '31', '1', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1416', '2018-09-09', '1', '31', '1', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1417', '2018-09-10', '1', '31', '2', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1418', '2018-09-11', '709', '31', '287', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1419', '2018-09-12', '710', '31', '287', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1420', '2018-09-13', '710', '31', '287', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1421', '2018-09-14', '711', '31', '287', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1422', '2018-09-15', '711', '31', '287', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1423', '2018-09-16', '712', '31', '288', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1424', '2018-09-17', '712', '31', '288', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1425', '2018-09-18', '713', '32', '288', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1426', '2018-09-19', '713', '32', '288', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1427', '2018-09-20', '714', '32', '288', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1428', '2018-09-21', '714', '32', '289', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1429', '2018-09-22', '715', '32', '289', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1430', '2018-09-23', '715', '32', '289', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1431', '2018-09-24', '716', '32', '1', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1432', '2018-09-25', '716', '32', '289', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1433', '2018-09-26', '717', '32', '290', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1434', '2018-09-27', '717', '32', '290', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1435', '2018-09-28', '718', '32', '290', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1436', '2018-09-29', '718', '32', '1', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1437', '2018-09-30', '719', '32', '290', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1438', '2018-10-01', '719', '32', '291', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1439', '2018-10-02', '720', '32', '291', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1440', '2018-10-03', '720', '32', '291', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1441', '2018-10-04', '721', '32', '291', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1442', '2018-10-05', '721', '32', '291', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1443', '2018-10-06', '722', '32', '292', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1444', '2018-10-07', '722', '32', '292', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1445', '2018-10-08', '1', '32', '292', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1446', '2018-10-09', '723', '32', '292', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1447', '2018-10-10', '724', '32', '292', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1448', '2018-10-11', '724', '32', '293', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1449', '2018-10-12', '725', '32', '293', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1450', '2018-10-13', '725', '32', '293', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1451', '2018-10-14', '726', '32', '4', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1452', '2018-10-15', '726', '32', '293', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1453', '2018-10-16', '727', '32', '294', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1454', '2018-10-17', '727', '32', '294', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1455', '2018-10-18', '728', '32', '294', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1456', '2018-10-19', '728', '32', '294', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1457', '2018-10-20', '729', '32', '294', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1458', '2018-10-21', '729', '32', '295', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1459', '2018-10-22', '730', '32', '1', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1460', '2018-10-23', '730', '32', '295', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1461', '2018-10-24', '731', '32', '295', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1462', '2018-10-25', '731', '32', '295', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1463', '2018-10-26', '732', '32', '296', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1464', '2018-10-27', '732', '32', '296', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1465', '2018-10-28', '733', '32', '296', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1466', '2018-10-29', '2', '32', '3', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1467', '2018-10-30', '734', '32', '296', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1468', '2018-10-31', '734', '32', '297', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1469', '2018-11-01', '735', '32', '297', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1470', '2018-11-02', '735', '32', '297', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1471', '2018-11-03', '1', '32', '297', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1472', '2018-11-04', '736', '32', '1', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1473', '2018-11-05', '737', '32', '298', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1474', '2018-11-06', '737', '32', '298', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1475', '2018-11-07', '738', '33', '298', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1476', '2018-11-08', '738', '33', '169', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1477', '2018-11-09', '1', '33', '298', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1478', '2018-11-10', '739', '33', '78', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1479', '2018-11-11', '740', '33', '299', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1480', '2018-11-12', '740', '33', '299', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1481', '2018-11-13', '741', '33', '299', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1482', '2018-11-14', '741', '33', '299', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1483', '2018-11-15', '742', '33', '300', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1484', '2018-11-16', '742', '33', '35', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1485', '2018-11-17', '743', '33', '300', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1486', '2018-11-18', '743', '33', '300', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1487', '2018-11-19', '744', '33', '300', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1488', '2018-11-20', '744', '33', '301', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1489', '2018-11-21', '745', '33', '234', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1490', '2018-11-22', '456', '33', '301', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1491', '2018-11-23', '746', '33', '301', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1492', '2018-11-24', '746', '33', '301', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1493', '2018-11-25', '747', '33', '302', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1494', '2018-11-26', '747', '4', '302', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1495', '2018-11-27', '748', '33', '302', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1496', '2018-11-28', '748', '33', '36', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1497', '2018-11-29', '749', '33', '302', '2', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1498', '2018-11-30', '749', '3', '303', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1499', '2018-12-01', '750', '33', '303', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1500', '2018-12-02', '234', '33', '303', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1501', '2018-12-03', '751', '33', '303', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1502', '2018-12-04', '751', '33', '303', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1503', '2018-12-05', '752', '6', '304', '33', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1505', '2018-12-07', '753', '33', '55', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1506', '2018-12-08', '753', '33', '304', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1507', '2018-12-09', '754', '33', '304', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1508', '2018-12-10', '754', '1', '305', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1509', '2018-12-11', '755', '33', '305', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1510', '2018-12-12', '755', '33', '305', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1511', '2018-12-13', '756', '33', '305', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1512', '2018-12-14', '366', '33', '305', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1513', '2018-12-15', '757', '33', '66', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1514', '2018-12-16', '757', '33', '306', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1515', '2018-12-17', '758', '33', '306', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1516', '2018-12-18', '758', '2', '306', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1517', '2018-12-19', '759', '33', '306', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1518', '2018-12-20', '564', '33', '307', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1519', '2018-12-21', '760', '33', '307', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1520', '2018-12-22', '760', '33', '307', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1521', '2018-12-23', '761', '33', '307', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1522', '2018-12-24', '761', '33', '307', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1527', '2018-12-29', '764', '34', '308', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1528', '2018-12-30', '764', '34', '309', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1529', '2018-12-31', '765', '34', '309', '14', '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1554', '2018-01-01', '333', '34', '314', '14', '2018-02-02 08:58:31', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1555', '2018-01-02', '778', '34', '314', '14', '2018-02-02 08:58:31', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1556', '2018-01-03', '778', '34', '314', '14', '2018-02-02 08:58:31', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1557', '2018-01-04', '779', '34', '314', '14', '2018-02-02 08:58:31', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1558', '2018-01-05', '779', '34', '315', '14', '2018-02-02 08:58:31', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1559', '2018-01-06', '780', '34', '315', '14', '2018-02-02 08:58:31', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1560', '2018-01-07', '780', '34', '315', '14', '2018-02-02 08:58:31', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1561', '2018-01-08', '781', '34', '315', '14', '2018-02-02 08:58:31', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1562', '2018-01-09', '781', '34', '315', '14', '2018-02-02 08:58:31', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1563', '2018-01-10', '782', '34', '316', '14', '2018-02-02 08:58:31', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1564', '2018-01-11', '782', '34', '316', '14', '2018-02-02 08:58:31', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1565', '2018-01-12', '783', '34', '316', '14', '2018-02-02 08:58:31', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1566', '2018-01-13', '783', '34', '316', '14', '2018-02-02 08:58:31', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1567', '2018-01-14', '784', '34', '316', '14', '2018-02-02 08:58:31', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1568', '2018-01-15', '784', '34', '317', '14', '2018-02-02 08:58:31', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1569', '2018-01-16', '23', '34', '317', '14', '2018-02-02 08:58:31', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1570', '2018-01-17', '785', '34', '317', '14', '2018-02-02 08:58:31', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1571', '2018-01-18', '786', '34', '317', '14', '2018-02-02 08:58:31', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1572', '2018-01-19', '786', '34', '317', '14', '2018-02-02 08:58:31', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1573', '2018-01-20', '787', '2', '318', '14', '2018-02-02 08:58:31', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1574', '2018-01-21', '787', '2', '318', '14', '2018-02-02 08:58:31', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1575', '2018-01-22', '788', '1', '318', '14', '2018-02-02 08:58:31', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1576', '2018-01-23', '788', '35', '318', '14', '2018-02-02 08:58:31', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1577', '2018-01-24', '789', '35', '318', '14', '2018-02-02 08:58:31', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1578', '2018-01-25', '789', '1', '319', '14', '2018-02-02 08:58:31', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1579', '2018-01-26', '790', '1', '319', '14', '2018-02-02 08:58:31', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1580', '2018-01-27', '531', '2', '319', '14', '2018-02-02 08:58:31', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1581', '2018-01-28', '791', '2', '319', '14', '2018-02-02 08:58:31', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1582', '2018-01-29', '791', '2', '319', '14', '2018-02-02 08:58:31', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1583', '2018-01-30', '2', '4', '2', '14', '2018-02-02 08:58:31', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1584', '2018-01-31', '792', '35', '320', '14', '2018-02-02 08:58:31', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1586', '2018-02-01', '793', '4', '3', '14', '2018-02-25 10:54:34', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1587', '2018-02-02', '794', '2', '1', '14', '2018-02-25 10:54:34', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1588', '2018-02-03', '794', '1', '4', '14', '2018-02-25 10:54:34', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1589', '2018-02-04', '795', '35', '321', '14', '2018-02-25 10:54:34', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1590', '2018-02-05', '795', '35', '321', '14', '2018-02-25 10:54:34', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1591', '2018-02-06', '796', '35', '321', '14', '2018-02-25 10:54:34', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1592', '2018-02-07', '796', '35', '321', '14', '2018-02-25 10:54:34', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1593', '2018-02-08', '797', '35', '322', '14', '2018-02-25 10:54:34', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1594', '2018-02-09', '797', '35', '322', '14', '2018-02-25 10:54:34', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1595', '2018-02-10', '99', '35', '322', '14', '2018-02-25 10:54:34', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1596', '2018-02-11', '798', '35', '322', '14', '2018-02-25 10:54:34', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1597', '2018-02-12', '799', '35', '322', '14', '2018-02-25 10:54:34', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1598', '2018-02-13', '799', '35', '323', '14', '2018-02-25 10:54:34', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1599', '2018-02-14', '800', '35', '323', '14', '2018-02-25 10:54:34', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1600', '2018-02-15', '800', '35', '323', '14', '2018-02-25 10:54:34', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1601', '2018-02-16', '89', '35', '90', '14', '2018-02-25 10:54:34', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1602', '2018-02-17', '801', '35', '323', '14', '2018-02-25 10:54:34', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1603', '2018-02-18', '802', '23', '324', '14', '2018-02-25 10:54:34', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1604', '2018-02-19', '802', '2', '324', '14', '2018-02-25 10:54:34', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1605', '2018-02-20', '803', '56', '324', '14', '2018-02-25 10:54:34', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1606', '2018-02-21', '45', '35', '89', '14', '2018-02-25 10:54:34', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1607', '2018-02-22', '804', '35', '324', '14', '2018-02-25 10:54:34', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1608', '2018-02-23', '804', '35', '325', '14', '2018-02-25 10:54:34', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1609', '2018-02-24', '805', '1', '3', '14', '2018-02-25 10:54:34', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1610', '2018-05-15', '0', '0', '0', '7', '2018-05-16 00:25:27', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1611', '2018-10-01', '0', '0', '0', '7', '2018-10-24 16:17:15', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1612', '2018-10-02', '0', '0', '0', '7', '2018-10-24 16:17:15', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1613', '2018-10-03', '0', '0', '0', '7', '2018-10-24 16:17:15', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1614', '2018-10-04', '0', '0', '0', '7', '2018-10-24 16:17:15', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES ('1615', '2018-10-05', '0', '0', '0', '7', '2018-10-24 16:17:15', '2019-09-09 12:12:12');

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test` (
                        `id` char(19) NOT NULL,
                        `name` char(19) NOT NULL,
                        PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of test
-- ----------------------------
INSERT INTO `test` VALUES ('1', 'jj');

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
                           `id` char(19) NOT NULL DEFAULT '',
                           `order_no` varchar(20) NOT NULL DEFAULT '' COMMENT '订单号',
                           `course_id` varchar(19) NOT NULL DEFAULT '' COMMENT '课程id',
                           `course_title` varchar(100) DEFAULT NULL COMMENT '课程名称',
                           `course_cover` varchar(255) DEFAULT NULL COMMENT '课程封面',
                           `teacher_name` varchar(20) DEFAULT NULL COMMENT '讲师名称',
                           `member_id` varchar(19) NOT NULL DEFAULT '' COMMENT '会员id',
                           `nickname` varchar(50) DEFAULT NULL COMMENT '会员昵称',
                           `mobile` varchar(11) DEFAULT NULL COMMENT '会员手机',
                           `total_fee` decimal(10,2) DEFAULT '0.01' COMMENT '订单金额（分）',
                           `pay_type` tinyint(3) DEFAULT NULL COMMENT '支付类型（1：微信 2：支付宝）',
                           `status` tinyint(3) DEFAULT NULL COMMENT '订单状态（0：未支付 1：已支付）',
                           `is_deleted` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
                           `gmt_create` datetime NOT NULL COMMENT '创建时间',
                           `gmt_modified` datetime NOT NULL COMMENT '更新时间',
                           PRIMARY KEY (`id`),
                           UNIQUE KEY `ux_order_no` (`order_no`),
                           KEY `idx_course_id` (`course_id`),
                           KEY `idx_member_id` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='订单';

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES ('1295283899496181762', '20200817165841785', '1291291664610062338', 'java从入门到入土', 'http://edu-longyang.oss-cn-beijing.aliyuncs.com/2020/08/06/587d5686663541d986a750be8c9b99b9java.jpg', null, '1293479645739515905', '龙达达', '', '30.00', '1', '0', '0', '2020-08-17 16:58:42', '2020-08-17 16:58:42');
INSERT INTO `t_order` VALUES ('1295349281120645122', '20200817211829644', '11', 'java基础课程：test', 'http://edu-longyang.oss-cn-beijing.aliyuncs.com/2020/08/06/587d5686663541d986a750be8c9b99b9java.jpg', '晴天', '1293112972314537985', '龙达达', '13206203240', '0.01', '1', '0', '0', '2020-08-17 21:18:30', '2020-08-17 21:19:49');
INSERT INTO `t_order` VALUES ('1295350349279813634', '20200817212244397', '11', 'java基础课程：test', 'http://edu-longyang.oss-cn-beijing.aliyuncs.com/2020/08/06/587d5686663541d986a750be8c9b99b9java.jpg', '晴天', '1293112972314537985', '龙达达', '13206203240', '0.01', '1', '0', '0', '2020-08-17 21:22:44', '2020-08-17 21:23:12');
INSERT INTO `t_order` VALUES ('1295351104241930242', '20200817212544565', '11', 'java基础课程：test', 'http://edu-longyang.oss-cn-beijing.aliyuncs.com/2020/08/06/587d5686663541d986a750be8c9b99b9java.jpg', '晴天', '1293112972314537985', '龙达达', '13206203240', '0.01', '1', '1', '0', '2020-08-17 21:25:44', '2020-08-17 21:25:57');
INSERT INTO `t_order` VALUES ('1295552800213708802', '20200818104712418', '1291291664610062338', 'java从入门到入土', 'http://edu-longyang.oss-cn-beijing.aliyuncs.com/2020/08/06/587d5686663541d986a750be8c9b99b9java.jpg', null, '1293112972314537985', '龙达达', '13206203240', '30.00', '1', '0', '0', '2020-08-18 10:47:12', '2020-08-18 10:47:12');
INSERT INTO `t_order` VALUES ('1296712531745710081', '20200821153533622', '1291557512700538881', '最终测试课程添加', 'http://edu-longyang.oss-cn-beijing.aliyuncs.com/2020/08/06/587d5686663541d986a750be8c9b99b9java.jpg', '晴天', '1293112972314537985', '龙达达', '13206203240', '88.00', '1', '0', '0', '2020-08-21 15:35:34', '2020-08-21 15:35:34');

-- ----------------------------
-- Table structure for t_pay_log
-- ----------------------------
DROP TABLE IF EXISTS `t_pay_log`;
CREATE TABLE `t_pay_log` (
                             `id` char(19) NOT NULL DEFAULT '',
                             `order_no` varchar(20) NOT NULL DEFAULT '' COMMENT '订单号',
                             `pay_time` datetime DEFAULT NULL COMMENT '支付完成时间',
                             `total_fee` decimal(10,2) DEFAULT '0.01' COMMENT '支付金额（分）',
                             `transaction_id` varchar(30) DEFAULT NULL COMMENT '交易流水号',
                             `trade_state` char(20) DEFAULT NULL COMMENT '交易状态',
                             `pay_type` tinyint(3) NOT NULL DEFAULT '0' COMMENT '支付类型（1：微信 2：支付宝）',
                             `attr` text COMMENT '其他属性',
                             `is_deleted` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
                             `gmt_create` datetime NOT NULL COMMENT '创建时间',
                             `gmt_modified` datetime NOT NULL COMMENT '更新时间',
                             PRIMARY KEY (`id`),
                             UNIQUE KEY `uk_order_no` (`order_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='支付日志表';

-- ----------------------------
-- Records of t_pay_log
-- ----------------------------
INSERT INTO `t_pay_log` VALUES ('1295350465545920514', '20200817212244397', '2020-08-17 21:23:12', '0.01', '4200000716202008178616288778', 'SUCCESS', '1', '{\"transaction_id\":\"4200000716202008178616288778\",\"nonce_str\":\"cEyoCjOyeqXliQvT\",\"trade_state\":\"SUCCESS\",\"bank_type\":\"OTHERS\",\"openid\":\"oHwsHuBXPNFFfvVIPO0ziWML1MTc\",\"sign\":\"82FCF003369C7099A273E5326BA66AB9\",\"return_msg\":\"OK\",\"fee_type\":\"CNY\",\"mch_id\":\"1558950191\",\"cash_fee\":\"1\",\"out_trade_no\":\"20200817212244397\",\"cash_fee_type\":\"CNY\",\"appid\":\"wx74862e0dfcf69954\",\"total_fee\":\"1\",\"trade_state_desc\":\"支付成功\",\"trade_type\":\"NATIVE\",\"result_code\":\"SUCCESS\",\"attach\":\"\",\"time_end\":\"20200817212159\",\"is_subscribe\":\"N\",\"return_code\":\"SUCCESS\"}', '0', '2020-08-17 21:23:12', '2020-08-17 21:23:12');
INSERT INTO `t_pay_log` VALUES ('1295351158851768322', '20200817212544565', '2020-08-17 21:25:57', '0.01', '4200000722202008173765395839', 'SUCCESS', '1', '{\"transaction_id\":\"4200000722202008173765395839\",\"nonce_str\":\"o9ZhRL5bAKyH7fob\",\"trade_state\":\"SUCCESS\",\"bank_type\":\"OTHERS\",\"openid\":\"oHwsHuBXPNFFfvVIPO0ziWML1MTc\",\"sign\":\"7DAE26540D60F6751F4C6BDF349CFE63\",\"return_msg\":\"OK\",\"fee_type\":\"CNY\",\"mch_id\":\"1558950191\",\"cash_fee\":\"1\",\"out_trade_no\":\"20200817212544565\",\"cash_fee_type\":\"CNY\",\"appid\":\"wx74862e0dfcf69954\",\"total_fee\":\"1\",\"trade_state_desc\":\"支付成功\",\"trade_type\":\"NATIVE\",\"result_code\":\"SUCCESS\",\"attach\":\"\",\"time_end\":\"20200817212443\",\"is_subscribe\":\"N\",\"return_code\":\"SUCCESS\"}', '0', '2020-08-17 21:25:57', '2020-08-17 21:25:57');

-- ----------------------------
-- Table structure for ucenter_member
-- ----------------------------
DROP TABLE IF EXISTS `ucenter_member`;
CREATE TABLE `ucenter_member` (
                                  `id` char(19) NOT NULL COMMENT '会员id',
                                  `openid` varchar(128) DEFAULT NULL COMMENT '微信openid',
                                  `mobile` varchar(11) DEFAULT '' COMMENT '手机号',
                                  `password` varchar(255) DEFAULT NULL COMMENT '密码',
                                  `nickname` varchar(50) DEFAULT NULL COMMENT '昵称',
                                  `sex` tinyint(2) unsigned DEFAULT NULL COMMENT '性别 1 女，2 男',
                                  `age` tinyint(3) unsigned DEFAULT NULL COMMENT '年龄',
                                  `avatar` varchar(255) DEFAULT NULL COMMENT '用户头像',
                                  `sign` varchar(100) DEFAULT NULL COMMENT '用户签名',
                                  `is_disabled` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否禁用 1（true）已禁用，  0（false）未禁用',
                                  `is_deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
                                  `gmt_create` datetime NOT NULL COMMENT '创建时间',
                                  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
                                  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='会员表';

-- ----------------------------
-- Records of ucenter_member
-- ----------------------------
INSERT INTO `ucenter_member` VALUES ('1', null, '13700000001', '96e79218965eb72c92a549dd5a330112', '小三123', '1', '5', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132', null, '0', '0', '2019-01-01 12:11:33', '2019-11-08 11:56:01');
INSERT INTO `ucenter_member` VALUES ('1080736474267144193', null, '13700000011', '96e79218965eb72c92a549dd5a330112', '用户XJtDfaYeKk', '1', '19', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132', null, '0', '0', '2019-01-02 12:12:45', '2019-01-02 12:12:56');
INSERT INTO `ucenter_member` VALUES ('1080736474355224577', null, '13700000002', '96e79218965eb72c92a549dd5a330112', '用户wUrNkzAPrc', '1', '27', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132', null, '0', '0', '2019-01-02 12:13:56', '2019-01-02 12:14:07');
INSERT INTO `ucenter_member` VALUES ('1086387099449442306', null, '13520191388', '96e79218965eb72c92a549dd5a330112', '用户XTMUeHDAoj', '2', '20', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132', null, '0', '0', '2019-01-19 06:17:23', '2019-01-19 06:17:23');
INSERT INTO `ucenter_member` VALUES ('1086387099520745473', null, '13520191389', '96e79218965eb72c92a549dd5a330112', '用户vSdKeDlimn', '1', '21', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132', null, '0', '0', '2019-01-19 06:17:23', '2019-01-19 06:17:23');
INSERT INTO `ucenter_member` VALUES ('1086387099608825858', null, '13520191381', '96e79218965eb72c92a549dd5a330112', '用户EoyWUVXQoP', '1', '18', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132', null, '0', '0', '2019-01-19 06:17:23', '2019-01-19 06:17:23');
INSERT INTO `ucenter_member` VALUES ('1086387099701100545', null, '13520191382', '96e79218965eb72c92a549dd5a330112', '用户LcAYbxLNdN', '2', '24', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132', null, '0', '0', '2019-01-19 06:17:23', '2019-01-19 06:17:23');
INSERT INTO `ucenter_member` VALUES ('1086387099776598018', null, '13520191383', '96e79218965eb72c92a549dd5a330112', '用户dZdjcgltnk', '2', '25', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132', null, '0', '0', '2019-01-19 06:17:23', '2019-01-19 06:17:23');
INSERT INTO `ucenter_member` VALUES ('1086387099852095490', null, '13520191384', '96e79218965eb72c92a549dd5a330112', '用户wNHGHlxUwX', '2', '23', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132', null, '0', '0', '2019-01-19 06:17:23', '2019-01-19 06:17:23');
INSERT INTO `ucenter_member` VALUES ('1293112972314537985', null, '13206203240', '96e79218965eb72c92a549dd5a330112', '龙达达', null, null, 'https://edu-longyang.oss-cn-beijing.aliyuncs.com/fa104ef58c4e5bc4270d911da1d1b34d.jpg', null, '0', '0', '2020-08-12 17:12:12', '2020-08-11 17:12:12');
INSERT INTO `ucenter_member` VALUES ('1293479645739515905', 'o3_SC5100iQtZIOEa1O6_wwhB61I', '', null, '龙达达', null, null, 'http://thirdwx.qlogo.cn/mmopen/vi_32/UEVqZKDCKVXJiazYbOM1A8WX4STK0UtqCygsAicEMQvCeyb7rKwUgLdo4efTVcERe21w2fOWw3KFbxXmMqfM4FOQ/132', null, '0', '0', '2020-08-12 17:29:14', '2020-08-12 17:29:14');
INSERT INTO `ucenter_member` VALUES ('1293485029254529025', 'o3_SC54LD44rVqQ1PohBLgQD4PhE', '', null, '牵', null, null, 'http://thirdwx.qlogo.cn/mmopen/vi_32/AvAFZY0bJOibR2oHmjf03ojAfCUyiaI8iaqGWkuTCp81Y2LpjFw6fcIyduYSf3VUrF5der96A2flYdtUmqCe1bhlQ/132', null, '0', '0', '2020-08-12 17:50:37', '2020-08-12 17:50:37');
INSERT INTO `ucenter_member` VALUES ('1294176575985618946', null, '18584807318', '96e79218965eb72c92a549dd5a330112', '廖媛媛', null, null, 'https://edu-longyang.oss-cn-beijing.aliyuncs.com/fa104ef58c4e5bc4270d911da1d1b34d.jpg', null, '0', '0', '2020-08-14 15:38:35', '2020-08-14 15:38:35');
INSERT INTO `ucenter_member` VALUES ('1295360096565501954', null, '', null, null, null, null, null, null, '0', '0', '2020-08-17 22:01:28', '2020-08-17 22:01:28');
INSERT INTO `ucenter_member` VALUES ('1295360104345935873', null, '', null, null, null, null, null, null, '0', '0', '2020-08-17 22:01:30', '2020-08-17 22:01:30');
INSERT INTO `ucenter_member` VALUES ('1295360157382909954', null, '', null, null, null, null, null, null, '0', '0', '2020-08-17 22:01:43', '2020-08-17 22:01:43');
