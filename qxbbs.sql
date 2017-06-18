/*
Navicat MySQL Data Transfer

Source Server         : test
Source Server Version : 50627
Source Host           : localhost:3306
Source Database       : qxbbs

Target Server Type    : MYSQL
Target Server Version : 50627
File Encoding         : 65001

Date: 2017-06-14 22:32:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `police_id` varchar(12) NOT NULL COMMENT '管理员policeID',
  `name` varchar(8) DEFAULT NULL COMMENT '名字',
  `nickname` varchar(20) DEFAULT NULL COMMENT '昵称',
  `password` varchar(50) DEFAULT '123456' COMMENT '登录密码',
  `picture_url` varchar(500) DEFAULT NULL COMMENT '头像url',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(200) DEFAULT NULL COMMENT '联系邮件',
  `flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '标识位  1：正常   2：已删除  0：超级管理员',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', '100001', '马雄', '滴水藏海', '123456', null, '18252063607', '173383944@qq.com', '1', '2017-03-29 14:23:29', '2017-04-01 14:57:55');
INSERT INTO `admin` VALUES ('2', '100002', '皇甫', '皇甫', '123456', null, '18252063607', '173383944@qq.com', '1', '2017-04-02 15:02:26', '2017-04-02 15:02:33');
INSERT INTO `admin` VALUES ('3', 'admin', 'admin', 'admin', 'police110', null, null, null, '1', '2017-04-16 12:25:20', '2017-04-16 12:25:20');

-- ----------------------------
-- Table structure for `article`
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` int(12) NOT NULL AUTO_INCREMENT COMMENT 'article表ID',
  `title` varchar(200) NOT NULL COMMENT '标题',
  `title_color` varchar(20) DEFAULT 'black' COMMENT '标题颜色',
  `author` varchar(20) DEFAULT NULL COMMENT '管理员添加的文章可以自定义作者名字',
  `summary` varchar(200) DEFAULT NULL COMMENT '内容摘要',
  `content` text COMMENT '内容',
  `lead_comment` text COMMENT '领导批示',
  `focus_num` int(12) NOT NULL DEFAULT '0' COMMENT '关注数',
  `praise_num` int(12) NOT NULL DEFAULT '0' COMMENT '点赞数',
  `comment_num` int(12) NOT NULL DEFAULT '0' COMMENT '评论数',
  `user_id` int(12) NOT NULL COMMENT '发帖人ID',
  `better` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否是精品 0：不是    1：是',
  `top` tinyint(1) DEFAULT NULL COMMENT '是否置顶 0： 否  1： 是',
  `group_id` int(4) NOT NULL DEFAULT '0' COMMENT '组织ID  如果为0表示是公开的（默认为0）',
  `read_times` int(20) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `ip` varchar(16) DEFAULT NULL COMMENT '用户IP',
  `flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '标识位   1：为审核  2：已审核  3：已删除',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100071 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('100001', '亚洲杯-中国能否干掉伊朗', 'black', null, '不知道，哈哈', '				<p class=\"p1\" style=\"text-align: center;\"><span class=\"s1\">戴云杰</span></p>\r\n                <p class=\"p1\" style=\"text-align: center;\"><span class=\"s1\">历任：宅男，网管，联合创始人，CTO </span></p>\r\n                <p class=\"p1\" style=\"text-align: center;\"><span class=\"s1\">现任：十六个清纯少女的支配人</span></p>\r\n                <p class=\"p1\" style=\"text-align: center;\"><img class=\"alignnone wp-image-374 size-large\" title=\"心动网络联合创始人戴云杰和他的团队成员\" src=\"http://dn-blog.teambition.net/wp-content/uploads/2015/11/1-1024x683.jpg\" alt=\"戴云杰和他的团队成员\" width=\"640\" height=\"427\" srcset=\"https://blog.teambition.com/wp-content/uploads/2015/11/1-1024x683.jpg 1024w, https://blog.teambition.com/wp-content/uploads/2015/11/1-300x200.jpg 300w\" sizes=\"(max-width: 640px) 100vw, 640px\" /></p>\r\n                <hr />\r\n                <p class=\"p1\" style=\"text-align: center;\"><span class=\"s1\">戴云杰大学毕业直接做老板</span></p>\r\n                <p class=\"p1\" style=\"text-align: center;\"><span class=\"s1\">除了兴趣，他不为任何人打工</span></p>\r\n                <p class=\"p1\" style=\"text-align: center;\"><img class=\"alignnone wp-image-375 size-large\" title=\"心动网络联合创始人戴云杰\" src=\"http://dn-blog.teambition.net/wp-content/uploads/2015/11/2-1024x607.gif\" alt=\"心动网络联合创始人戴云杰\" width=\"640\" height=\"379\" srcset=\"https://blog.teambition.com/wp-content/uploads/2015/11/2-1024x607.gif 1024w, https://blog.teambition.com/wp-content/uploads/2015/11/2-300x178.gif 300w\" sizes=\"(max-width: 640px) 100vw, 640px\" /></p>\r\n                <hr />\r\n                <p class=\"p1\" style=\"text-align: center;\"><span class=\"s1\">用正义的软件造福天下网民</span></p>\r\n                <p class=\"p1\" style=\"text-align: center;\"><span class=\"s1\">他觉得好玩</span></p>\r\n                <p class=\"p1\" style=\"text-align: center;\"><span class=\"s1\">玩一款自己开发的游戏</span></p>\r\n                <p class=\"p1\" style=\"text-align: center;\"><span class=\"s1\">他觉得刺激</span></p>\r\n                <p class=\"p1\" style=\"text-align: center;\"><span class=\"s1\">拥有属于自己的一群萌妹纸</span></p>\r\n                <p class=\"p1\" style=\"text-align: center;\"><span class=\"s1\">让他打心底里觉得好过瘾</span></p>\r\n                <p class=\"p1\" style=\"text-align: center;\"><img class=\"alignnone wp-image-376 size-large\" title=\"VeryCD\" src=\"http://dn-blog.teambition.net/wp-content/uploads/2015/11/3-1024x607.gif\" alt=\"VeryCD\" width=\"640\" height=\"379\" srcset=\"https://blog.teambition.com/wp-content/uploads/2015/11/3-1024x607.gif 1024w, https://blog.teambition.com/wp-content/uploads/2015/11/3-300x178.gif 300w\" sizes=\"(max-width: 640px) 100vw, 640px\" /></p>\r\n                <hr />\r\n                <p class=\"p1\" style=\"text-align: center;\"><span class=\"s1\">戴云杰运用神秘的网络力量</span></p>\r\n                <p class=\"p1\" style=\"text-align: center;\"><span class=\"s1\">找到了怀揣梦想的少女们</span></p>\r\n                <p class=\"p1\" style=\"text-align: center;\"><span class=\"s1\">跟她们签订神圣的盟约</span></p>\r\n                <p class=\"p1\" style=\"text-align: center;\"><span class=\"s1\">并赐予少女们化茧成蝶的力量</span></p>\r\n                <p class=\"p1\" style=\"text-align: center;\"><span class=\"s1\">少女提神又醒脑</span></p>\r\n                <p class=\"p1\" style=\"text-align: center;\"><span class=\"s1\">身边常备最重要</span></p>\r\n                <p class=\"p1\" style=\"text-align: center;\"><img class=\"alignnone wp-image-377 size-full\" title=\"心动网络联合创始人戴云杰和他的团队成员\" src=\"http://dn-blog.teambition.net/wp-content/uploads/2015/11/11111.gif\" alt=\"心动网络联合创始人戴云杰和他的团队成员\" width=\"800\" height=\"600\" /></a></p>\r\n                <hr />\r\n                <p class=\"p1\" style=\"text-align: center;\"><span class=\"s1\">做娱乐的同时他还要运营数十款游戏</span></p>\r\n                <p class=\"p1\" style=\"text-align: center;\"><span class=\"s1\">还要开发电视应用软件</span></p>\r\n                <p class=\"p1\" style=\"text-align: center;\"><span class=\"s1\">还要做动画片</span></p>\r\n                <p class=\"p1\" style=\"text-align: center;\"><span class=\"s1\">他的表情是这样的</span></p>\r\n                <p class=\"p1\" style=\"text-align: center;\"><img class=\"alignnone wp-image-378 size-large\" title=\"戴云杰\" src=\"http://dn-blog.teambition.net/wp-content/uploads/2015/11/5-1024x607.gif\" alt=\"戴云杰\" width=\"640\" height=\"379\" srcset=\"https://blog.teambition.com/wp-content/uploads/2015/11/5-1024x607.gif 1024w, https://blog.teambition.com/wp-content/uploads/2015/11/5-300x178.gif 300w\" sizes=\"(max-width: 640px) 100vw, 640px\" /></p>\r\n                <hr />\r\n                <p class=\"p1\" style=\"text-align: center;\"><span class=\"s1\">经过多方挑选</span></p>\r\n                <p class=\"p1\" style=\"text-align: center;\"><span class=\"s1\">戴云杰选择了 Teambition</span></p>\r\n                <p class=\"p1\" style=\"text-align: center;\"><span class=\"s1\">来增进工作效率</span></p>\r\n                <p class=\"p1\" style=\"text-align: center;\"><span class=\"s1\">比起使用电话或短信的沟通</span></p>\r\n                <p class=\"p1\" style=\"text-align: center;\"><span class=\"s1\">他更偏好整个团队使用</span></p>\r\n                <p class=\"p1\" style=\"text-align: center;\"><span class=\"s1\">Teambition 这个协作平台</span></p>\r\n                <p class=\"p1\" style=\"text-align: center;\"><img class=\"alignnone wp-image-379 size-large\" title=\"戴云杰正在使用Teambition\" src=\"http://dn-blog.teambition.net/wp-content/uploads/2015/11/6-1024x607.jpg\" alt=\"戴云杰正在使用Teambition\" width=\"640\" height=\"379\" srcset=\"https://blog.teambition.com/wp-content/uploads/2015/11/6-1024x607.jpg 1024w, https://blog.teambition.com/wp-content/uploads/2015/11/6-300x178.jpg 300w, https://blog.teambition.com/wp-content/uploads/2015/11/6.jpg 1080w\" sizes=\"(max-width: 640px) 100vw, 640px\" /></p>\r\n                <hr />\r\n                <p class=\"p1\" style=\"text-align: center;\"><span class=\"s1\">Teambition 的设计干净美观</span></p>\r\n                <p class=\"p1\" style=\"text-align: center;\"><span class=\"s1\">没有影响视觉的多余部分</span></p>\r\n                <p class=\"p1\" style=\"text-align: center;\"><span class=\"s1\">而且使用起来轻松便捷</span></p>\r\n                <p class=\"p1\" style=\"text-align: center;\"><span class=\"s1\">能更加简化沟通的程序</span></p>\r\n                <p class=\"p1\" style=\"text-align: center;\"><img class=\"alignnone wp-image-363 size-large\" title=\"Teambition外观\" src=\"http://dn-blog.teambition.net/wp-content/uploads/2015/11/2015-11-20_1151-1024x580.png\" alt=\"Teambition外观\" width=\"640\" height=\"363\" srcset=\"https://blog.teambition.com/wp-content/uploads/2015/11/2015-11-20_1151-1024x580.png 1024w, https://blog.teambition.com/wp-content/uploads/2015/11/2015-11-20_1151-300x170.png 300w, https://blog.teambition.com/wp-content/uploads/2015/11/2015-11-20_1151.png 1094w\" sizes=\"(max-width: 640px) 100vw, 640px\" /></p>\r\n                <hr />\r\n                <p class=\"p1\" style=\"text-align: center;\"><span class=\"s1\">特别是Teambition的任务板功能</span></p>\r\n                <p class=\"p1\" style=\"text-align: center;\"><span class=\"s1\">大幅度减少了邮件与纸张来回确认的过程</span></p>\r\n                <p class=\"p1\" style=\"text-align: center;\"><span class=\"s1\">很方便</span></p>\r\n                <p class=\"p1\" style=\"text-align: center;\"><span class=\"s1\">比如我们设计女团的培训课程</span></p>\r\n                <p class=\"p1\" style=\"text-align: center;\"><span class=\"s1\">培训老师们在日本</span></p>\r\n                <p class=\"p1\" style=\"text-align: center;\"><span class=\"s1\">我们和他们的沟通就是建一个项目</span></p>\r\n                <p class=\"p1\" style=\"text-align: center;\"><span class=\"s1\">让所有参与者在里面进行沟通</span></p>\r\n                <p class=\"p1\" style=\"text-align: center;\"><span class=\"s1\">大家提出自己的想法</span></p>\r\n                <p class=\"p1\" style=\"text-align: center;\"><span class=\"s1\">一起跟踪推进项目</span></p>\r\n                <p class=\"p1\" style=\"text-align: center;\"><span class=\"s1\">这样简化了很多不断邮件来回的过程</span></p>\r\n                <p class=\"p1\" style=\"text-align: center;\"><span class=\"s1\">节约了大家的时间</span></p>\r\n                <hr />\r\n                <p class=\"p1\" style=\"text-align: center;\"><span class=\"s1\">甚至财务报表与新人面试</span></p>\r\n                <p class=\"p1\" style=\"text-align: center;\"><span class=\"s1\">戴云杰都使用 Teambition 来整合完成</span></p>\r\n                <p class=\"p1\" style=\"text-align: center;\"><img class=\"alignnone wp-image-385 size-large\" title=\"Teambition外观照\" src=\"http://dn-blog.teambition.net/wp-content/uploads/2015/11/qq-1024x1004.png\" alt=\"Teambition外观照\" width=\"640\" height=\"628\" srcset=\"https://blog.teambition.com/wp-content/uploads/2015/11/qq-1024x1004.png 1024w, https://blog.teambition.com/wp-content/uploads/2015/11/qq-300x294.png 300w, https://blog.teambition.com/wp-content/uploads/2015/11/qq.png 1600w\" sizes=\"(max-width: 640px) 100vw, 640px\" /></p>\r\n                <hr />\r\n                <p class=\"p1\" style=\"text-align: center;\"><span class=\"s1\">对于戴云杰来说</span></p>\r\n                <p class=\"p1\" style=\"text-align: center;\"><span class=\"s1\">他从不上班</span></p>\r\n                <p class=\"p1\" style=\"text-align: center;\"><span class=\"s1\">工作就是他玩耍的一部分</span></p>\r\n                <p class=\"p1\" style=\"text-align: center;\"><img class=\"alignnone wp-image-380 size-large\" title=\"戴云杰在工作中\" src=\"http://dn-blog.teambition.net/wp-content/uploads/2015/11/10-1024x607.gif\" alt=\"戴云杰在工作中\" width=\"640\" height=\"379\" srcset=\"https://blog.teambition.com/wp-content/uploads/2015/11/10-1024x607.gif 1024w, https://blog.teambition.com/wp-content/uploads/2015/11/10-300x178.gif 300w\" sizes=\"(max-width: 640px) 100vw, 640px\" /></p>\r\n                <p class=\"p1\" style=\"text-align: center;\"><strong><span class=\"s1\">工作＝玩</span></strong></p>\r\n                <p class=\"p1\" style=\"text-align: center;\"><strong><span class=\"s1\">走，去工作</span></strong></p>', null, '0', '0', '22', '100001', '1', '0', '0', '0', '10.10.192.40', '2', '2017-03-28 21:49:27', '2017-04-16 09:49:23');
INSERT INTO `article` VALUES ('100002', 'NBA-勇士能否续写辉煌', 'black', null, '我猜猜看，呵呵', '我猜猜看，呵呵', null, '0', '0', '0', '100002', '1', '0', '0', '0', '10.10.192.40', '2', '2017-03-29 15:26:57', '2017-04-16 09:49:23');
INSERT INTO `article` VALUES ('100003', 'NBA-骑士加油', 'black', null, '猩猩来耶', '猩猩来耶', '在欧阳修的一再称赞下，苏轼一时声名大噪。他每有新作，立刻就会传遍京师。当父子名动京师、正要大展身手时，突然传来苏轼苏辙的母亲病故的噩耗。二兄弟随父回乡奔丧。嘉祐四年十月守丧期满回京，嘉祐六年（1061年），苏轼应中制科考试，即通常所谓的“三年京察”，入第三等，为“百年第一”，授大理评事、签书凤翔府判官。[15]  四年后还朝判登闻鼓院。治平二年，苏洵病逝，苏轼、苏辙兄弟扶柩还乡，守孝三年。三年之后，苏轼还朝，震动朝野的王安石变法开始了。苏轼的许多师友，包括当初赏识他的恩师欧阳修在内，因反对新法与新任宰相王安石政见不合，被迫离京。朝野旧雨凋零，苏轼眼中所见，已不是他二十岁时所见的“平和世界”。', '0', '0', '0', '100003', '1', '0', '1', '0', '10.10.192.40', '2', '2017-03-29 15:40:35', '2017-04-16 09:49:23');
INSERT INTO `article` VALUES ('100004', '只是用来测试的', 'black', null, '戴云杰历任：宅男，网管，联合创始人，CTO 现任：十六个清纯少女的支配人', '				<p class=\"p1\" style=\"text-align: center;\"><span class=\"s1\">戴云杰</span></p>\r\n                <p class=\"p1\" style=\"text-align: center;\"><span class=\"s1\">历任：宅男，网管，联合创始人，CTO </span></p>\r\n                <p class=\"p1\" style=\"text-align: center;\"><span class=\"s1\">现任：十六个清纯少女的支配人</span></p>\r\n                <p class=\"p1\" style=\"text-align: center;\"><img class=\"alignnone wp-image-374 size-large\" title=\"心动网络联合创始人戴云杰和他的团队成员\" src=\"http://dn-blog.teambition.net/wp-content/uploads/2015/11/1-1024x683.jpg\" alt=\"戴云杰和他的团队成员\" width=\"640\" height=\"427\" srcset=\"https://blog.teambition.com/wp-content/uploads/2015/11/1-1024x683.jpg 1024w, https://blog.teambition.com/wp-content/uploads/2015/11/1-300x200.jpg 300w\" sizes=\"(max-width: 640px) 100vw, 640px\" /></p>\r\n                <hr />\r\n                <p class=\"p1\" style=\"text-align: center;\"><span class=\"s1\">戴云杰大学毕业直接做老板</span></p>\r\n                <p class=\"p1\" style=\"text-align: center;\"><span class=\"s1\">除了兴趣，他不为任何人打工</span></p>\r\n                <p class=\"p1\" style=\"text-align: center;\"><img class=\"alignnone wp-image-375 size-large\" title=\"心动网络联合创始人戴云杰\" src=\"http://dn-blog.teambition.net/wp-content/uploads/2015/11/2-1024x607.gif\" alt=\"心动网络联合创始人戴云杰\" width=\"640\" height=\"379\" srcset=\"https://blog.teambition.com/wp-content/uploads/2015/11/2-1024x607.gif 1024w, https://blog.teambition.com/wp-content/uploads/2015/11/2-300x178.gif 300w\" sizes=\"(max-width: 640px) 100vw, 640px\" /></p>\r\n                <hr />\r\n                <p class=\"p1\" style=\"text-align: center;\"><span class=\"s1\">用正义的软件造福天下网民</span></p>\r\n                <p class=\"p1\" style=\"text-align: center;\"><span class=\"s1\">他觉得好玩</span></p>\r\n                <p class=\"p1\" style=\"text-align: center;\"><span class=\"s1\">玩一款自己开发的游戏</span></p>\r\n                <p class=\"p1\" style=\"text-align: center;\"><span class=\"s1\">他觉得刺激</span></p>\r\n                <p class=\"p1\" style=\"text-align: center;\"><span class=\"s1\">拥有属于自己的一群萌妹纸</span></p>\r\n                <p class=\"p1\" style=\"text-align: center;\"><span class=\"s1\">让他打心底里觉得好过瘾</span></p>\r\n                <p class=\"p1\" style=\"text-align: center;\"><img class=\"alignnone wp-image-376 size-large\" title=\"VeryCD\" src=\"http://dn-blog.teambition.net/wp-content/uploads/2015/11/3-1024x607.gif\" alt=\"VeryCD\" width=\"640\" height=\"379\" srcset=\"https://blog.teambition.com/wp-content/uploads/2015/11/3-1024x607.gif 1024w, https://blog.teambition.com/wp-content/uploads/2015/11/3-300x178.gif 300w\" sizes=\"(max-width: 640px) 100vw, 640px\" /></p>\r\n                <hr />\r\n                <p class=\"p1\" style=\"text-align: center;\"><span class=\"s1\">戴云杰运用神秘的网络力量</span></p>\r\n                <p class=\"p1\" style=\"text-align: center;\"><span class=\"s1\">找到了怀揣梦想的少女们</span></p>\r\n                <p class=\"p1\" style=\"text-align: center;\"><span class=\"s1\">跟她们签订神圣的盟约</span></p>\r\n                <p class=\"p1\" style=\"text-align: center;\"><span class=\"s1\">并赐予少女们化茧成蝶的力量</span></p>\r\n                <p class=\"p1\" style=\"text-align: center;\"><span class=\"s1\">少女提神又醒脑</span></p>\r\n                <p class=\"p1\" style=\"text-align: center;\"><span class=\"s1\">身边常备最重要</span></p>\r\n                <p class=\"p1\" style=\"text-align: center;\"><img class=\"alignnone wp-image-377 size-full\" title=\"心动网络联合创始人戴云杰和他的团队成员\" src=\"http://dn-blog.teambition.net/wp-content/uploads/2015/11/11111.gif\" alt=\"心动网络联合创始人戴云杰和他的团队成员\" width=\"800\" height=\"600\" /></a></p>\r\n                <hr />\r\n                <p class=\"p1\" style=\"text-align: center;\"><span class=\"s1\">做娱乐的同时他还要运营数十款游戏</span></p>\r\n                <p class=\"p1\" style=\"text-align: center;\"><span class=\"s1\">还要开发电视应用软件</span></p>\r\n                <p class=\"p1\" style=\"text-align: center;\"><span class=\"s1\">还要做动画片</span></p>\r\n                <p class=\"p1\" style=\"text-align: center;\"><span class=\"s1\">他的表情是这样的</span></p>\r\n                <p class=\"p1\" style=\"text-align: center;\"><img class=\"alignnone wp-image-378 size-large\" title=\"戴云杰\" src=\"http://dn-blog.teambition.net/wp-content/uploads/2015/11/5-1024x607.gif\" alt=\"戴云杰\" width=\"640\" height=\"379\" srcset=\"https://blog.teambition.com/wp-content/uploads/2015/11/5-1024x607.gif 1024w, https://blog.teambition.com/wp-content/uploads/2015/11/5-300x178.gif 300w\" sizes=\"(max-width: 640px) 100vw, 640px\" /></p>\r\n                <hr />\r\n                <p class=\"p1\" style=\"text-align: center;\"><span class=\"s1\">经过多方挑选</span></p>\r\n                <p class=\"p1\" style=\"text-align: center;\"><span class=\"s1\">戴云杰选择了 Teambition</span></p>\r\n                <p class=\"p1\" style=\"text-align: center;\"><span class=\"s1\">来增进工作效率</span></p>\r\n                <p class=\"p1\" style=\"text-align: center;\"><span class=\"s1\">比起使用电话或短信的沟通</span></p>\r\n                <p class=\"p1\" style=\"text-align: center;\"><span class=\"s1\">他更偏好整个团队使用</span></p>\r\n                <p class=\"p1\" style=\"text-align: center;\"><span class=\"s1\">Teambition 这个协作平台</span></p>\r\n                <p class=\"p1\" style=\"text-align: center;\"><img class=\"alignnone wp-image-379 size-large\" title=\"戴云杰正在使用Teambition\" src=\"http://dn-blog.teambition.net/wp-content/uploads/2015/11/6-1024x607.jpg\" alt=\"戴云杰正在使用Teambition\" width=\"640\" height=\"379\" srcset=\"https://blog.teambition.com/wp-content/uploads/2015/11/6-1024x607.jpg 1024w, https://blog.teambition.com/wp-content/uploads/2015/11/6-300x178.jpg 300w, https://blog.teambition.com/wp-content/uploads/2015/11/6.jpg 1080w\" sizes=\"(max-width: 640px) 100vw, 640px\" /></p>\r\n                <hr />\r\n                <p class=\"p1\" style=\"text-align: center;\"><span class=\"s1\">Teambition 的设计干净美观</span></p>\r\n                <p class=\"p1\" style=\"text-align: center;\"><span class=\"s1\">没有影响视觉的多余部分</span></p>\r\n                <p class=\"p1\" style=\"text-align: center;\"><span class=\"s1\">而且使用起来轻松便捷</span></p>\r\n                <p class=\"p1\" style=\"text-align: center;\"><span class=\"s1\">能更加简化沟通的程序</span></p>\r\n                <p class=\"p1\" style=\"text-align: center;\"><img class=\"alignnone wp-image-363 size-large\" title=\"Teambition外观\" src=\"http://dn-blog.teambition.net/wp-content/uploads/2015/11/2015-11-20_1151-1024x580.png\" alt=\"Teambition外观\" width=\"640\" height=\"363\" srcset=\"https://blog.teambition.com/wp-content/uploads/2015/11/2015-11-20_1151-1024x580.png 1024w, https://blog.teambition.com/wp-content/uploads/2015/11/2015-11-20_1151-300x170.png 300w, https://blog.teambition.com/wp-content/uploads/2015/11/2015-11-20_1151.png 1094w\" sizes=\"(max-width: 640px) 100vw, 640px\" /></p>\r\n                <hr />\r\n                <p class=\"p1\" style=\"text-align: center;\"><span class=\"s1\">特别是Teambition的任务板功能</span></p>\r\n                <p class=\"p1\" style=\"text-align: center;\"><span class=\"s1\">大幅度减少了邮件与纸张来回确认的过程</span></p>\r\n                <p class=\"p1\" style=\"text-align: center;\"><span class=\"s1\">很方便</span></p>\r\n                <p class=\"p1\" style=\"text-align: center;\"><span class=\"s1\">比如我们设计女团的培训课程</span></p>\r\n                <p class=\"p1\" style=\"text-align: center;\"><span class=\"s1\">培训老师们在日本</span></p>\r\n                <p class=\"p1\" style=\"text-align: center;\"><span class=\"s1\">我们和他们的沟通就是建一个项目</span></p>\r\n                <p class=\"p1\" style=\"text-align: center;\"><span class=\"s1\">让所有参与者在里面进行沟通</span></p>\r\n                <p class=\"p1\" style=\"text-align: center;\"><span class=\"s1\">大家提出自己的想法</span></p>\r\n                <p class=\"p1\" style=\"text-align: center;\"><span class=\"s1\">一起跟踪推进项目</span></p>\r\n                <p class=\"p1\" style=\"text-align: center;\"><span class=\"s1\">这样简化了很多不断邮件来回的过程</span></p>\r\n                <p class=\"p1\" style=\"text-align: center;\"><span class=\"s1\">节约了大家的时间</span></p>\r\n                <hr />\r\n                <p class=\"p1\" style=\"text-align: center;\"><span class=\"s1\">甚至财务报表与新人面试</span></p>\r\n                <p class=\"p1\" style=\"text-align: center;\"><span class=\"s1\">戴云杰都使用 Teambition 来整合完成</span></p>\r\n                <p class=\"p1\" style=\"text-align: center;\"><img class=\"alignnone wp-image-385 size-large\" title=\"Teambition外观照\" src=\"http://dn-blog.teambition.net/wp-content/uploads/2015/11/qq-1024x1004.png\" alt=\"Teambition外观照\" width=\"640\" height=\"628\" srcset=\"https://blog.teambition.com/wp-content/uploads/2015/11/qq-1024x1004.png 1024w, https://blog.teambition.com/wp-content/uploads/2015/11/qq-300x294.png 300w, https://blog.teambition.com/wp-content/uploads/2015/11/qq.png 1600w\" sizes=\"(max-width: 640px) 100vw, 640px\" /></p>\r\n                <hr />\r\n                <p class=\"p1\" style=\"text-align: center;\"><span class=\"s1\">对于戴云杰来说</span></p>\r\n                <p class=\"p1\" style=\"text-align: center;\"><span class=\"s1\">他从不上班</span></p>\r\n                <p class=\"p1\" style=\"text-align: center;\"><span class=\"s1\">工作就是他玩耍的一部分</span></p>\r\n                <p class=\"p1\" style=\"text-align: center;\"><img class=\"alignnone wp-image-380 size-large\" title=\"戴云杰在工作中\" src=\"http://dn-blog.teambition.net/wp-content/uploads/2015/11/10-1024x607.gif\" alt=\"戴云杰在工作中\" width=\"640\" height=\"379\" srcset=\"https://blog.teambition.com/wp-content/uploads/2015/11/10-1024x607.gif 1024w, https://blog.teambition.com/wp-content/uploads/2015/11/10-300x178.gif 300w\" sizes=\"(max-width: 640px) 100vw, 640px\" /></p>\r\n                <p class=\"p1\" style=\"text-align: center;\"><strong><span class=\"s1\">工作＝玩</span></strong></p>\r\n                <p class=\"p1\" style=\"text-align: center;\"><strong><span class=\"s1\">走，去工作</span></strong></p>', null, '0', '0', '0', '100001', '1', '0', '0', '1', '10.10.192.40', '2', '2017-03-31 14:51:09', '2017-04-19 14:41:05');
INSERT INTO `article` VALUES ('100005', '测试没有content情况', 'black', null, null, null, null, '0', '0', '0', '100002', '1', '0', '0', '0', '10.10.192.40', '2', '2017-03-31 17:50:15', '2017-04-16 09:49:24');
INSERT INTO `article` VALUES ('100006', '测试1', 'black', null, '测试1', '测试1', null, '0', '0', '0', '100003', '0', '0', '0', '0', '10.10.192.40', '3', '2017-04-03 14:20:27', '2017-04-16 09:49:25');
INSERT INTO `article` VALUES ('100007', '测试2', 'black', null, '测试2', '测试2', null, '0', '0', '0', '100001', '0', '0', '0', '0', '10.10.192.40', '2', '2017-04-03 14:20:58', '2017-04-16 09:49:25');
INSERT INTO `article` VALUES ('100008', '测试3', 'black', null, '测试3', '测试3', null, '0', '0', '0', '100002', '0', '0', '0', '0', '10.10.192.40', '2', '2017-04-03 14:21:27', '2017-04-16 09:49:25');
INSERT INTO `article` VALUES ('100009', '测试4', 'black', null, '测试4', '测试4', null, '0', '0', '0', '100003', '1', '0', '0', '0', '10.10.192.40', '2', '2017-04-03 14:21:35', '2017-04-16 09:49:26');
INSERT INTO `article` VALUES ('100010', '测试5', 'black', null, '测试5', '测试5', null, '0', '0', '0', '100001', '1', '0', '0', '0', '10.10.192.40', '2', '2017-04-03 14:21:43', '2017-04-16 09:49:26');
INSERT INTO `article` VALUES ('100011', '测试6', 'black', null, '测试6', '测试6', null, '0', '0', '0', '100002', '0', '0', '0', '0', '10.10.192.40', '2', '2017-04-03 14:22:18', '2017-04-16 09:49:26');
INSERT INTO `article` VALUES ('100012', '测试7', 'black', null, '测试7', '测试7', null, '0', '0', '0', '100003', '0', '0', '0', '0', '10.10.192.40', '1', '2017-04-03 14:22:23', '2017-04-16 09:49:26');
INSERT INTO `article` VALUES ('100013', '测试8', 'black', null, null, null, null, '0', '0', '0', '100001', '0', '0', '0', '0', '10.10.192.40', '2', '2017-04-03 14:22:34', '2017-04-16 09:49:30');
INSERT INTO `article` VALUES ('100014', '测试9', 'black', null, null, null, null, '0', '0', '0', '100002', '0', '0', '0', '0', '10.10.192.40', '1', '2017-04-03 14:22:44', '2017-04-16 09:49:28');
INSERT INTO `article` VALUES ('100015', '测试10', 'black', null, null, null, null, '0', '0', '0', '100003', '0', '0', '0', '0', '10.10.192.40', '1', '2017-04-03 14:22:51', '2017-04-16 09:49:28');
INSERT INTO `article` VALUES ('100016', '测试11', 'black', null, null, null, null, '0', '0', '0', '100001', '0', '0', '0', '0', '10.10.192.40', '1', '2017-04-03 14:23:09', '2017-04-16 09:49:29');
INSERT INTO `article` VALUES ('100017', '测试12', 'black', null, null, null, null, '0', '0', '0', '100002', '0', '0', '0', '0', '10.10.192.40', '1', '2017-04-03 14:23:13', '2017-04-16 09:49:31');
INSERT INTO `article` VALUES ('100018', '测试13', 'black', null, null, null, null, '0', '0', '0', '100003', '0', '0', '0', '0', '10.10.192.40', '2', '2017-04-03 14:23:17', '2017-04-16 09:49:31');
INSERT INTO `article` VALUES ('100019', '测试14', 'black', null, null, null, null, '0', '0', '0', '100001', '0', '0', '0', '0', '10.10.192.40', '2', '2017-04-03 14:23:22', '2017-04-16 09:49:32');
INSERT INTO `article` VALUES ('100020', '测试15', 'black', null, null, null, null, '0', '0', '1', '100002', '1', '0', '0', '0', '10.10.192.40', '2', '2017-04-03 14:23:30', '2017-04-16 09:49:32');
INSERT INTO `article` VALUES ('100021', '测试16', 'black', null, null, null, null, '0', '0', '0', '100003', '0', '0', '0', '0', '10.10.192.40', '2', '2017-04-03 14:23:35', '2017-04-16 09:49:32');
INSERT INTO `article` VALUES ('100022', '测试17', 'black', null, null, null, null, '0', '0', '0', '100001', '0', '0', '0', '0', '10.10.192.40', '2', '2017-04-03 14:23:40', '2017-04-16 09:49:32');
INSERT INTO `article` VALUES ('100023', '这是正式测试1', 'black', null, '我只是想测试一下功能，给点面子', '<p>我只是想测试一下功能，<span style=\"font-size: 20px;\">给点面子</span></p>', null, '0', '0', '0', '100001', '0', '0', '1', '0', '0:0:0:0:0:0:0:1', '1', '2017-04-07 16:10:45', '2017-04-16 09:49:33');
INSERT INTO `article` VALUES ('100024', '这是正式测试2', 'black', null, '我只是想测试一下功能，继续给点面子', '<p>我只是想测试一下功能，继续<span style=\"font-size: 20px;\">给点面子</span></p>', null, '0', '0', '0', '100001', '0', '0', '1', '0', '0:0:0:0:0:0:0:1', '1', '2017-04-07 16:14:48', '2017-04-16 09:49:33');
INSERT INTO `article` VALUES ('100025', '正式测试3', 'black', null, '没什么主要内容', '<p>没什么主要内容</p>', null, '0', '0', '0', '100001', '0', '0', '0', '0', '0:0:0:0:0:0:0:1', '1', '2017-04-07 22:23:56', '2017-04-16 09:49:34');
INSERT INTO `article` VALUES ('100026', '古惑仔', 'black', null, '山鸡', '<p>山鸡</p>', null, '0', '0', '2', '100002', '1', '0', '0', '0', '192.168.1.119', '2', '2017-04-07 22:24:48', '2017-04-16 09:49:34');
INSERT INTO `article` VALUES ('100027', '古惑仔', 'black', null, '乌鸦，靓仔琨', '<p>乌鸦，靓仔琨</p>', null, '0', '0', '0', '100002', '0', '0', '1', '0', '192.168.1.119', '1', '2017-04-07 22:25:27', '2017-04-16 09:49:34');
INSERT INTO `article` VALUES ('100028', 'java', 'black', null, '哈哈哈，打飞机古灵精怪了', '<p style=\"text-align: center;\"><span style=\"text-decoration: underline; border: 1px solid rgb(0, 0, 0);\"><em><strong>哈哈哈，打飞机古灵精怪了<img src=\"http://192.168.1.107/js/ueditor/dialogs/emotion/images/jx2/j_0019.gif\"/></strong></em></span></p>', null, '0', '0', '1', '100001', '0', '0', '0', '0', '192.168.1.119', '2', '2017-04-08 01:10:17', '2017-04-16 09:49:35');
INSERT INTO `article` VALUES ('100029', '苏东坡-江城子', 'black', null, '十年生死两茫茫。不思量，自难忘。千里孤坟，无处话凄凉。[1]纵使相逢应不识，尘满面，鬓如霜夜来幽梦', '<p style=\"padding: 10px 0px; font-family: &quot;Microsoft YaHei&quot;, u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53; white-space: normal; background-color: rgb(245, 248, 253);\"><strong>十年生死两茫茫。<br/>不思量，自难忘。<br/>千里孤坟，无处话凄凉。[1]<br/>纵使相逢应不识，<br/>尘满面，鬓如霜</strong></p><p style=\"padding: 10px 0px; font-family: &quot;Microsoft YaHei&quot;, u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53; white-space: normal; background-color: rgb(245, 248, 253);\"><strong>夜来幽梦忽还乡。<br/>小轩窗，正梳妆。<br/>相顾无言，惟有泪千行。<br/>料得年年断肠处，<br/>明月夜，短松冈。</strong></p><p>hahha &nbsp;&nbsp;<img src=\"http://127.0.0.1:9000/js/ueditor/dialogs/emotion/images/jx2/j_0025.gif\"/></p>', null, '0', '0', '2', '100001', '1', '0', '0', '1', '0:0:0:0:0:0:0:1', '2', '2017-04-09 14:40:40', '2017-04-19 14:41:31');
INSERT INTO `article` VALUES ('100030', 'SVB', 'black', null, 'BBC', '<p>BBC</p>', null, '0', '0', '0', '100001', '0', '0', '0', '1', '0:0:0:0:0:0:0:1', '2', '2017-04-09 15:21:02', '2017-05-02 14:12:49');
INSERT INTO `article` VALUES ('100031', '风风光光', 'black', null, '灌灌灌灌', '<p>灌灌灌灌</p>', null, '0', '0', '0', '100001', '0', '0', '0', '0', '0:0:0:0:0:0:0:1', '2', '2017-04-09 15:45:33', '2017-04-16 09:49:39');
INSERT INTO `article` VALUES ('100032', '这是测试', 'black', null, '没有', '简而言之，微服务就是一些协同工作的小而自治的服务[1]。在很多软件开发的组织中会存在这样一个问题，随着新需求的增加，所要维护的代码量就会越来越庞大，以至于即使需要添加一个很小的功能也需要大面积修改代码库，或者很小的代码改动都很难保证不影响其他功能。虽然我们可以选择模块化，但是模块与模块之间的界限确是很难确定和维护的。\r\n在传统的单块架构中，我们常常会选择使用模块化来确保系统的内聚性，进而避免代码库过大带来的一系列问题。Robert C. Martin有一个对这个问题的经典说法：“把因相同原因而变化的东西聚合到一起，而把因不同原因而变化的东西分离出来。”该说法具体地阐述了内聚性的定义。\r\n微服务就是将内聚性这一准则应用到具有自己服务边界的服务上，这样就可以根据业务领域的特性来具体划分应用的服务边界。因为这些服务只关注于自己边界范围内的服务，所以能够比较容易避免因为代码库过大所带来的很多开发上的难度。\r\n许多人比较疑惑的是：服务有多小才算合适，或者说代码量有多小才算合适。如果简单地从代码的数量来讨论感觉并不十分合理，因为不同语言表达力并不相同，有些高级语言可以只写简单的几行代码完成很多底层语言需要写很多代码才能实现的功能。代码依赖包也是一个不得不考虑的问题，因为依赖包中也包含了底层实现代码。还有一个不得不提的问题是不同业务特性对象其本身可能就比较复杂，对象本身描述的代码量就很大。', '简而言之，微服务就是一些协同工作的小而自治的服务[1]。在很多软件开发的组织中会存在这样一个问题，随着新需求的增加，所要维护的代码量就会越来越庞大，以至于即使需要添加一个很小的功能也需要大面积修改代码库，或者很小的代码改动都很难保证不影响其他功能。虽然我们可以选择模块化，但是模块与模块之间的界限确是很难确定和维护的。', '0', '0', '5', '100001', '1', '1', '0', '54', '0:0:0:0:0:0:0:1', '2', '2017-04-09 16:07:10', '2017-05-02 10:04:22');
INSERT INTO `article` VALUES ('100033', '这个是测试1', 'black', null, '这个是测试内容测试管理员修改文章', '<p>这个是测试内容<img src=\"http://127.0.0.1:9000/js/ueditor/dialogs/emotion/images/jx2/j_0004.gif\"/>测试管理员修改文章</p>', '测试领导批示', '0', '0', '0', '100001', '0', '0', '0', '0', '127.0.0.1', '1', '2017-04-12 22:32:51', '2017-05-01 20:40:52');
INSERT INTO `article` VALUES ('100034', '这是一个长名字测试。。。。。。。。。。。。。。。。。', 'black', null, '没什么内容', '<p>没什么内容<img src=\"http://127.0.0.1:9000/js/ueditor/dialogs/emotion/images/jx2/j_0022.gif\"/></p>', null, '0', '0', '6', '100001', '1', '0', '0', '10', '127.0.0.1', '2', '2017-04-13 11:47:46', '2017-06-04 14:17:03');
INSERT INTO `article` VALUES ('100035', '测试新版本1', 'black', null, null, null, null, '0', '0', '0', '100001', '0', '0', '0', '1', '127.0.0.1', '2', '2017-04-14 21:47:17', '2017-05-02 10:47:08');
INSERT INTO `article` VALUES ('100036', '测试一个长名字栖霞公安栖霞公安栖霞公安栖霞公安栖霞公安栖霞公安栖霞公安栖霞公安栖霞公安栖霞公安', 'black', null, null, '<p><video class=\"edui-upload-video  vjs-default-skin video-js\" controls=\"\" preload=\"none\" width=\"420\" height=\"280\" src=\"/ueditor/jsp/upload/video/20170601/1496321803110058428.mkv\" data-setup=\"{}\"><source src=\"/ueditor/jsp/upload/video/20170601/1496321803110058428.mkv\" type=\"video/mkv\"/></video></p>', null, '0', '0', '0', '100001', '0', '0', '0', '6', '127.0.0.1', '2', '2017-04-14 21:57:41', '2017-06-01 21:04:47');
INSERT INTO `article` VALUES ('100037', '2017-4-16 晚上一点测试', 'black', null, null, null, null, '0', '0', '1', '100001', '0', '0', '0', '0', '127.0.0.1', '2', '2017-04-16 00:51:01', '2017-04-16 09:49:42');
INSERT INTO `article` VALUES ('100042', '测试看看', 'black', '马雄', '音乐呵呵', '<p><br/></p><p>音乐呵呵</p>', null, '0', '0', '4', '100001', '1', '1', '0', '55', '127.0.0.1', '2', '2017-04-27 11:44:35', '2017-06-05 00:03:21');
INSERT INTO `article` VALUES ('100043', '测试成功后跳转问题', 'black', null, null, null, '来一个领导批示看看\n', '0', '0', '0', '100001', '0', '0', '0', '0', '127.0.0.1', '1', '2017-05-02 08:34:09', '2017-05-02 13:54:54');
INSERT INTO `article` VALUES ('100044', '测试管理员发帖子功能', 'black', null, '只是用来测试的，别紧张', '<p>只是用来测试的，别紧张</p>', '领导也来两句', '0', '0', '0', '100482', '0', '0', '0', '0', '127.0.0.1', '1', '2017-05-02 12:11:52', '2017-05-02 13:54:55');
INSERT INTO `article` VALUES ('100045', '测试管理员发帖子功能1', 'black', null, '继续测试', '<p>继续测试</p>', '领导也来两句', '0', '0', '0', '100482', '0', '0', '0', '0', '127.0.0.1', '1', '2017-05-02 12:18:42', '2017-05-02 13:54:55');
INSERT INTO `article` VALUES ('100046', '测试管理员发帖子功能2', 'black', '皇甫立波', '换个姿势，再来一次    ', '<p>换个姿势，再来一次&nbsp;&nbsp;&nbsp;&nbsp;<br/></p>', '领导也来两句', '0', '0', '0', '100482', '0', '0', '0', '0', '127.0.0.1', '2', '2017-05-02 12:24:59', '2017-05-11 23:30:48');
INSERT INTO `article` VALUES ('100047', '测试管理员代发帖子功能', 'black', '皇甫立波1', '测试没有作者时候', '<p>测试没有作者时候</p>', '领导也别闲着', '0', '0', '0', '100482', '0', '0', '0', '0', '127.0.0.1', '2', '2017-05-02 12:26:08', '2017-05-02 13:54:57');
INSERT INTO `article` VALUES ('100048', '全流程测试', 'black', null, '这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这', '<p>这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容</p>', null, '0', '0', '0', '100482', '0', '0', '0', '0', '127.0.0.1', '1', '2017-05-02 13:28:05', '2017-05-02 13:54:57');
INSERT INTO `article` VALUES ('100049', '5-2测试', 'black', '滴水藏海', '看看', '<p>看看</p>', '滴水藏海', '0', '0', '0', '100482', '0', '0', '0', '0', '127.0.0.1', '2', '2017-05-02 13:30:33', '2017-05-02 13:54:58');
INSERT INTO `article` VALUES ('100050', '全流程最后一次测试。给力点', 'black', '大黄', '随便说两句罗', '<p>随便说两句罗</p>', '领导来看看', '0', '0', '0', '100001', '1', '0', '0', '3', '127.0.0.1', '2', '2017-05-02 13:51:26', '2017-05-02 14:10:37');
INSERT INTO `article` VALUES ('100051', '测试最近的', 'black', null, '对方答复单', '<p>对方答复单</p>', null, '0', '0', '0', '100001', '0', '0', '0', '4', '127.0.0.1', '2', '2017-05-02 14:00:10', '2017-05-02 14:07:06');
INSERT INTO `article` VALUES ('100052', '测试管理员写文章', 'black', '大黄旺旺', '哈哈', '<p>哈哈</p>', '呵呵', '0', '0', '0', '100001', '0', '0', '0', '2', '127.0.0.1', '2', '2017-05-02 14:10:14', '2017-05-02 14:12:37');
INSERT INTO `article` VALUES ('100053', '在麦当劳蹭网测试', 'black', '大黄', '好痛苦，什么时候是个头啊', '<p>好痛苦，什么时候是个头啊</p>', '呵呵', '0', '0', '0', '100001', '0', '0', '0', '0', '127.0.0.1', '2', '2017-05-02 15:27:18', '2017-05-02 15:27:58');
INSERT INTO `article` VALUES ('100054', '测试图片', 'black', '皇甫立波', null, '<p><img src=\"/js/ueditor/image/20170509/1494331556813029874.jpg\" title=\"1494331556813029874.jpg\" alt=\"no-content.jpg\"/></p>', null, '0', '0', '0', '100001', '0', '0', '0', '1', '127.0.0.1', '2', '2017-05-09 20:06:25', '2017-05-09 20:07:56');
INSERT INTO `article` VALUES ('100055', '测试IE上面上传图片，给力点吧', 'black', null, null, '<p><img title=\"1494333530475091502.jpg\" alt=\"default-1.jpg\" src=\"/js/ueditor/image/20170509/1494333530475091502.jpg\"/></p>', null, '0', '0', '2', '100001', '0', '0', '0', '1', '127.0.0.1', '2', '2017-05-09 20:39:08', '2017-05-09 20:43:51');
INSERT INTO `article` VALUES ('100056', '测试文件上传', 'black', null, 'default-1.jpg\r\n\r\n测试文件上传', '<p style=\"line-height: 16px;\"><img style=\"margin-right: 2px; vertical-align: middle;\" src=\"http://127.0.0.1:9000/js/ueditor/dialogs/attachment/fileTypeImages/icon_jpg.gif\"/><a title=\"default-1.jpg\" style=\"color: rgb(0, 102, 204); font-size: 12px;\" href=\"/ueditor/jsp/upload/file/20170509/1494333865818057576.jpg\">default-1.jpg</a></p><p>测试文件上传</p>', null, '0', '0', '0', '100001', '0', '0', '0', '0', '127.0.0.1', '2', '2017-05-09 20:44:47', '2017-05-11 23:30:53');
INSERT INTO `article` VALUES ('100057', '测试IE8，写文章', 'black', '皇甫立波', '\r\n\r\n', '<p><img title=\"1494334353520093000.jpg\" src=\"/js/ueditor/image/20170509/1494334353520093000.jpg\"/></p><p><img title=\"1494334353520026012.jpg\" src=\"/js/ueditor/image/20170509/1494334353520026012.jpg\"/></p><p></p>', '领导也批示一下', '0', '0', '0', '100482', '0', '0', '0', '1', '127.0.0.1', '2', '2017-05-09 20:52:59', '2017-06-04 14:16:29');
INSERT INTO `article` VALUES ('100058', '测试图片上传', 'black', null, null, '<p><img title=\"1494344402390092769.jpg\" alt=\"default-1.jpg\" src=\"/js/ueditor/image/20170509/1494344402390092769.jpg\"/></p>', null, '0', '0', '0', '100001', '0', '0', '0', '0', '127.0.0.1', '2', '2017-05-09 23:40:16', '2017-05-11 23:30:50');
INSERT INTO `article` VALUES ('100059', '5月11号晚上测试IE缓存问题', 'black', null, null, null, null, '0', '0', '2', '100001', '0', '0', '0', '7', '127.0.0.1', '2', '2017-05-11 23:30:09', '2017-05-11 23:36:10');
INSERT INTO `article` VALUES ('100060', '测试IE缓存问题', 'black', null, '随便打两个字吧\r\n阿偶', '<p>随便打两个字吧</p><p>阿偶</p>', null, '0', '0', '1', '100001', '0', '1', '0', '5', '127.0.0.1', '2', '2017-05-11 23:37:54', '2017-06-04 10:32:13');
INSERT INTO `article` VALUES ('100061', '测试一下管理员发文章', 'black', '马雄', null, '<p><img title=\"1494517286945077290.jpg\" alt=\"default-2.jpg\" src=\"/js/ueditor/image/20170511/1494517286945077290.jpg\"/></p>', '领导', '0', '0', '0', '100001', '1', '0', '0', '2', '127.0.0.1', '2', '2017-05-11 23:41:34', '2017-05-11 23:43:02');
INSERT INTO `article` VALUES ('100062', 'IE8测试视频', 'black', null, null, '<p style=\"TEXT-ALIGN: center\"><video class=\"edui-upload-video  vjs-default-skin video-js\" controls=\"\" preload=\"none\" width=\"800\" height=\"800\" src=\"/ueditor/jsp/upload/video/20170604/1496542646308048327.mp4\" data-setup=\"{}\"><source src=\"/ueditor/jsp/upload/video/20170604/1496542646308048327.mp4\" type=\"video/mp4\"/></video></p>', null, '0', '0', '3', '100001', '0', '0', '0', '31', '127.0.0.1', '2', '2017-06-04 10:17:31', '2017-06-08 00:59:36');
INSERT INTO `article` VALUES ('100063', '测试视频-MKV格式', 'black', null, null, '<p style=\"text-align: center;\"><video class=\"edui-upload-video  vjs-default-skin video-js\" controls=\"\" preload=\"none\" width=\"800\" height=\"800\" src=\"/ueditor/jsp/upload/video/20170604/1496543089901004248.mkv\" data-setup=\"{}\"><source src=\"/ueditor/jsp/upload/video/20170604/1496543089901004248.mkv\" type=\"video/mkv\"/></video></p>', null, '0', '0', '0', '100001', '0', '0', '0', '6', '127.0.0.1', '2', '2017-06-04 10:25:05', '2017-06-04 10:31:07');
INSERT INTO `article` VALUES ('100064', '测试标题颜色', 'black', null, null, null, null, '0', '0', '0', '100001', '0', '0', '0', '0', '127.0.0.1', '1', '2017-06-04 14:21:10', '2017-06-04 14:21:10');
INSERT INTO `article` VALUES ('100065', '测试标题颜色1', 'black', null, null, null, null, '0', '0', '0', '100001', '0', '0', '0', '0', '127.0.0.1', '1', '2017-06-04 14:23:46', '2017-06-04 14:23:46');
INSERT INTO `article` VALUES ('100066', '测试标题颜色2', 'black', null, null, null, null, '0', '0', '0', '100001', '0', '0', '0', '0', '127.0.0.1', '1', '2017-06-04 14:25:38', '2017-06-04 14:25:38');
INSERT INTO `article` VALUES ('100067', 'green', 'green', null, null, null, null, '0', '0', '0', '100001', '0', '0', '0', '14', '127.0.0.1', '2', '2017-06-04 14:31:11', '2017-06-05 00:04:41');
INSERT INTO `article` VALUES ('100068', '5675', 'black', null, null, null, null, '0', '0', '0', '100001', '0', '0', '0', '1', '127.0.0.1', '2', '2017-06-04 23:30:59', '2017-06-04 23:31:13');
INSERT INTO `article` VALUES ('100069', '1234与', 'yellow', null, null, null, null, '0', '0', '0', '100001', '0', '0', '0', '1', '127.0.0.1', '2', '2017-06-04 23:31:48', '2017-06-04 23:32:06');
INSERT INTO `article` VALUES ('100070', '测试标题和视频', 'indigo', '小强', null, '<p style=\"text-align: center;\"><video class=\"edui-upload-video  vjs-default-skin video-js\" controls=\"\" preload=\"none\" width=\"600\" height=\"400\" src=\"/ueditor/jsp/upload/video/20170604/1496590840175063272.mp4\" data-setup=\"{}\"><source src=\"/ueditor/jsp/upload/video/20170604/1496590840175063272.mp4\" type=\"video/mp4\"/></video></p>', '领导出来说两句', '0', '0', '0', '100482', '0', '0', '0', '3', '127.0.0.1', '2', '2017-06-04 23:41:34', '2017-06-05 00:03:46');

-- ----------------------------
-- Table structure for `article_focus`
-- ----------------------------
DROP TABLE IF EXISTS `article_focus`;
CREATE TABLE `article_focus` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '帖子关注表ID',
  `article_id` int(12) NOT NULL COMMENT '帖子ID',
  `user_id` int(12) NOT NULL COMMENT '关注人ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '关注时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article_focus
-- ----------------------------

-- ----------------------------
-- Table structure for `article_praise`
-- ----------------------------
DROP TABLE IF EXISTS `article_praise`;
CREATE TABLE `article_praise` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '帖子点赞表ID',
  `article_id` int(12) NOT NULL COMMENT '帖子ID',
  `user_id` int(12) NOT NULL COMMENT '点赞人ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '点赞时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article_praise
-- ----------------------------

-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '评论表ID',
  `content` text NOT NULL COMMENT '评论内容',
  `user_id` int(12) NOT NULL COMMENT '发表评论的ID',
  `article_id` int(12) NOT NULL COMMENT '评论文章',
  `floor` int(8) NOT NULL COMMENT '评论楼层',
  `ip` varchar(16) DEFAULT NULL COMMENT '评论人IP',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '类型    1：评论   2：回复',
  `flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '标识位  1：未审核  2：已审核  3：已删除',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '评论时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1', '第一条评论哦', '100001', '100001', '1', '10.10.192.40', '1', '2', '2017-04-03 13:21:03');
INSERT INTO `comment` VALUES ('2', '第二条评论', '100001', '100001', '2', '10.10.192.40', '1', '2', '2017-04-03 13:21:18');
INSERT INTO `comment` VALUES ('3', '测试1', '100001', '100001', '3', '10.10.192.40', '1', '2', '2017-04-03 14:54:11');
INSERT INTO `comment` VALUES ('4', '测试1', '100001', '100001', '4', '10.10.192.40', '1', '2', '2017-04-03 14:54:12');
INSERT INTO `comment` VALUES ('5', '测试1', '100001', '100001', '5', '10.10.192.40', '1', '2', '2017-04-03 14:54:12');
INSERT INTO `comment` VALUES ('6', '测试1', '100001', '100001', '6', '10.10.192.40', '1', '2', '2017-04-03 14:54:13');
INSERT INTO `comment` VALUES ('7', '测试1', '100001', '100001', '7', '10.10.192.40', '1', '2', '2017-04-03 14:54:13');
INSERT INTO `comment` VALUES ('8', '测试1', '100001', '100001', '8', '10.10.192.40', '1', '2', '2017-04-03 14:54:13');
INSERT INTO `comment` VALUES ('9', '测试1', '100001', '100001', '9', '10.10.192.40', '1', '2', '2017-04-03 14:54:15');
INSERT INTO `comment` VALUES ('10', '测试1', '100001', '100001', '10', '10.10.192.40', '1', '2', '2017-04-03 14:54:16');
INSERT INTO `comment` VALUES ('11', '测试1', '100001', '100001', '11', '10.10.192.40', '1', '2', '2017-04-03 14:54:17');
INSERT INTO `comment` VALUES ('12', '测试1', '100001', '100001', '12', '10.10.192.40', '1', '2', '2017-04-03 14:54:17');
INSERT INTO `comment` VALUES ('13', '测试1', '100001', '100001', '13', '10.10.192.40', '1', '2', '2017-04-03 14:54:18');
INSERT INTO `comment` VALUES ('14', '测试1', '100001', '100001', '14', '10.10.192.40', '1', '2', '2017-04-03 14:54:19');
INSERT INTO `comment` VALUES ('15', '测试1', '100001', '100001', '15', '10.10.192.40', '1', '2', '2017-04-03 14:54:20');
INSERT INTO `comment` VALUES ('16', '测试1', '100001', '100001', '16', '10.10.192.40', '1', '2', '2017-04-03 14:54:22');
INSERT INTO `comment` VALUES ('17', '测试1', '100001', '100001', '17', '10.10.192.40', '1', '2', '2017-04-03 14:54:23');
INSERT INTO `comment` VALUES ('18', '测试1', '100001', '100001', '18', '10.10.192.40', '1', '2', '2017-04-03 14:54:23');
INSERT INTO `comment` VALUES ('19', '测试1', '100001', '100001', '19', '10.10.192.40', '1', '2', '2017-04-03 14:54:25');
INSERT INTO `comment` VALUES ('20', '测试1', '100001', '100001', '20', '10.10.192.40', '1', '2', '2017-04-03 14:54:25');
INSERT INTO `comment` VALUES ('21', '测试1', '100001', '100001', '21', '10.10.192.40', '1', '2', '2017-04-03 14:54:26');
INSERT INTO `comment` VALUES ('22', '测试1', '100001', '100001', '22', '10.10.192.40', '1', '3', '2017-04-03 14:54:28');
INSERT INTO `comment` VALUES ('23', '<p>测试评论框1</p>', '100001', '100001', '23', '127.0.0.1', '1', '3', '2017-04-07 13:52:08');
INSERT INTO `comment` VALUES ('24', '<p>这是评论2</p>', '100001', '100001', '24', '127.0.0.1', '1', '3', '2017-04-07 14:11:44');
INSERT INTO `comment` VALUES ('25', '<p>这是第二条评论</p>', '100001', '100001', '22', '127.0.0.1', '1', '2', '2017-04-07 14:51:41');
INSERT INTO `comment` VALUES ('26', '<p>测试的哦，别当真<br/></p>', '100001', '100001', '23', '0:0:0:0:0:0:0:1', '1', '1', '2017-04-07 17:08:05');
INSERT INTO `comment` VALUES ('27', '<p>我是焦皮</p>', '100002', '100026', '1', '192.168.1.119', '1', '2', '2017-04-07 22:28:04');
INSERT INTO `comment` VALUES ('28', '<p>我是包皮</p>', '100002', '100026', '2', '192.168.1.119', '1', '2', '2017-04-07 22:29:42');
INSERT INTO `comment` VALUES ('29', '<p>家教<img src=\"http://localhost/js/ueditor/dialogs/emotion/images/jx2/j_0001.gif\"/></p>', '100001', '100026', '1', '0:0:0:0:0:0:0:1', '1', '3', '2017-04-08 00:28:21');
INSERT INTO `comment` VALUES ('30', '<p><img src=\"http://localhost/js/ueditor/dialogs/emotion/images/face/i_f01.gif\"/></p>', '100001', '100026', '2', '0:0:0:0:0:0:0:1', '1', '3', '2017-04-08 00:30:06');
INSERT INTO `comment` VALUES ('31', '<p><img src=\"http://192.168.1.107/js/ueditor/dialogs/emotion/images/jx2/j_0002.gif\"/></p>', '100001', '100026', '3', '192.168.1.119', '1', '3', '2017-04-08 00:58:53');
INSERT INTO `comment` VALUES ('32', '<p>fdff&nbsp;<img src=\"http://192.168.1.107/js/ueditor/dialogs/emotion/images/jx2/j_0024.gif\"/></p>', '100001', '100026', '3', '192.168.1.107', '1', '3', '2017-04-08 01:01:01');
INSERT INTO `comment` VALUES ('33', '<p>dfdfad</p><p>dinfdifd<img src=\"http://192.168.1.107/js/ueditor/dialogs/emotion/images/jx2/j_0014.gif\"/></p><p><img src=\"http://192.168.1.107/js/ueditor/dialogs/emotion/images/jx2/j_0013.gif\"/></p>', '100001', '100026', '3', '192.168.1.107', '1', '3', '2017-04-08 01:03:46');
INSERT INTO `comment` VALUES ('34', '<p>dfdfdf</p><p><br/></p><p>fdfadfd<img src=\"http://192.168.1.107/js/ueditor/dialogs/emotion/images/jx2/j_0036.gif\"/></p>', '100001', '100026', '3', '192.168.1.107', '1', '3', '2017-04-08 01:04:55');
INSERT INTO `comment` VALUES ('35', '<p>是多少括号括</p>', '100001', '100029', '1', '0:0:0:0:0:0:0:1', '1', '2', '2017-04-09 15:46:46');
INSERT INTO `comment` VALUES ('36', '<p>这是评论<img src=\"http://localhost:9000/js/ueditor/dialogs/emotion/images/jx2/j_0028.gif\"/></p>', '100001', '100032', '1', '0:0:0:0:0:0:0:1', '1', '2', '2017-04-09 16:07:38');
INSERT INTO `comment` VALUES ('37', '<p>我是马雄，哈哈哈哈哈哈<img src=\"http://localhost:9000/js/ueditor/dialogs/emotion/images/jx2/j_0026.gif\"/></p>', '100001', '100029', '2', '0:0:0:0:0:0:0:1', '1', '2', '2017-04-09 19:05:20');
INSERT INTO `comment` VALUES ('38', '<p><img src=\"http://localhost:9000/js/ueditor/dialogs/emotion/images/jx2/j_0028.gif\"/></p>', '100001', '100028', '1', '0:0:0:0:0:0:0:1', '1', '2', '2017-04-11 17:19:36');
INSERT INTO `comment` VALUES ('39', '<p><img src=\"http://127.0.0.1:9000/js/ueditor/dialogs/emotion/images/jx2/j_0024.gif\"/></p>', '100001', '100020', '1', '127.0.0.1', '1', '2', '2017-04-12 19:08:23');
INSERT INTO `comment` VALUES ('40', '<p><img src=\"http://127.0.0.1:9000/js/ueditor/dialogs/emotion/images/jx2/j_0081.gif\"/></p>', '100001', '100034', '1', '127.0.0.1', '1', '2', '2017-04-13 14:19:07');
INSERT INTO `comment` VALUES ('41', '<p><img src=\"http://127.0.0.1:9000/js/ueditor/dialogs/emotion/images/jx2/j_0001.gif\"/></p>', '100001', '100034', '2', '127.0.0.1', '1', '2', '2017-04-14 21:42:57');
INSERT INTO `comment` VALUES ('42', '<p><img src=\"http://127.0.0.1:9000/js/ueditor/dialogs/emotion/images/jx2/j_0027.gif\"/></p>', '100001', '100034', '3', '127.0.0.1', '1', '1', '2017-04-14 21:46:52');
INSERT INTO `comment` VALUES ('43', '<p>测试文字！</p>', '100001', '100034', '3', '127.0.0.1', '1', '2', '2017-04-15 23:34:00');
INSERT INTO `comment` VALUES ('44', '<p>测试文字和图片<img src=\"http://127.0.0.1:9000/js/ueditor/dialogs/emotion/images/jx2/j_0027.gif\" style=\"white-space: normal;\"/></p>', '100001', '100034', '3', '127.0.0.1', '1', '2', '2017-04-15 23:34:24');
INSERT INTO `comment` VALUES ('45', '<p><img src=\"http://127.0.0.1:9000/js/ueditor/dialogs/emotion/images/jx2/j_0003.gif\"/></p>', '100001', '100034', '5', '127.0.0.1', '1', '1', '2017-04-16 00:07:20');
INSERT INTO `comment` VALUES ('46', '<p>测试评论<img src=\"http://127.0.0.1:9000/js/ueditor/dialogs/emotion/images/jx2/j_0028.gif\"/></p>', '100001', '100037', '1', '127.0.0.1', '1', '2', '2017-04-16 00:51:21');
INSERT INTO `comment` VALUES ('47', '<p><img src=\"http://127.0.0.1:9000/js/ueditor/dialogs/emotion/images/jx2/j_0028.gif\"/></p>', '100001', '100042', '1', '127.0.0.1', '1', '1', '2017-04-27 11:45:34');
INSERT INTO `comment` VALUES ('48', '<p><img src=\"http://127.0.0.1:9000/js/ueditor/dialogs/emotion/images/jx2/j_0050.gif\"/></p>', '100001', '100032', '2', '127.0.0.1', '1', '2', '2017-05-01 20:24:05');
INSERT INTO `comment` VALUES ('49', '<p>测试评论是否更新</p>', '100001', '100032', '3', '127.0.0.1', '1', '2', '2017-05-02 08:45:06');
INSERT INTO `comment` VALUES ('50', '<p>测试自动刷新评论区</p>', '100001', '100032', '3', '127.0.0.1', '1', '2', '2017-05-02 08:54:06');
INSERT INTO `comment` VALUES ('51', '<p>再测试一个看看</p>', '100001', '100032', '4', '127.0.0.1', '1', '2', '2017-05-02 09:38:14');
INSERT INTO `comment` VALUES ('52', '<p><img src=\"http://127.0.0.1:9000/js/ueditor/dialogs/emotion/images/jx2/j_0026.gif\"/></p>', '100001', '100042', '1', '127.0.0.1', '1', '2', '2017-05-02 13:50:44');
INSERT INTO `comment` VALUES ('53', '<p><img src=\"http://127.0.0.1:9000/js/ueditor/dialogs/emotion/images/jx2/j_0001.gif\"/></p>', '100482', '100055', '1', '127.0.0.1', '1', '2', '2017-05-09 20:43:36');
INSERT INTO `comment` VALUES ('54', '<p><img src=\"http://127.0.0.1:9000/js/ueditor/dialogs/emotion/images/jx2/j_0059.gif\"/></p>', '100482', '100055', '2', '127.0.0.1', '1', '2', '2017-05-09 20:43:51');
INSERT INTO `comment` VALUES ('55', '<p><img src=\"http://127.0.0.1:9000/js/ueditor/dialogs/emotion/images/jx2/j_0024.gif\"/></p>', '100001', '100042', '2', '127.0.0.1', '1', '2', '2017-05-11 23:09:00');
INSERT INTO `comment` VALUES ('56', '<p><img src=\"http://127.0.0.1:9000/js/ueditor/dialogs/emotion/images/jx2/j_0001.gif\"/></p>', '100001', '100042', '3', '127.0.0.1', '1', '2', '2017-05-11 23:28:58');
INSERT INTO `comment` VALUES ('57', '<p><img src=\"http://127.0.0.1:9000/js/ueditor/dialogs/emotion/images/jx2/j_0013.gif\"/></p>', '100001', '100059', '1', '127.0.0.1', '1', '2', '2017-05-11 23:33:10');
INSERT INTO `comment` VALUES ('58', '<img src=\"http://127.0.0.1:9000/js/ueditor/dialogs/emotion/images/jx2/j_0026.gif\"/><p></p>', '100001', '100059', '2', '127.0.0.1', '1', '2', '2017-05-11 23:36:09');
INSERT INTO `comment` VALUES ('59', '<p><img src=\"http://127.0.0.1:9000/js/ueditor/dialogs/emotion/images/jx2/j_0035.gif\"/></p>', '100001', '100060', '1', '127.0.0.1', '1', '2', '2017-05-11 23:38:31');
INSERT INTO `comment` VALUES ('60', '<p><img src=\"http://127.0.0.1:9000/js/ueditor/dialogs/emotion/images/jx2/j_0025.gif\"/></p>', '100001', '100034', '5', '127.0.0.1', '1', '2', '2017-05-14 21:57:05');
INSERT INTO `comment` VALUES ('61', '<p>测试模块</p>', '100001', '100034', '6', '127.0.0.1', '1', '2', '2017-05-14 21:57:20');
INSERT INTO `comment` VALUES ('62', '<p><img src=\"http://127.0.0.1:9000/js/ueditor/dialogs/emotion/images/jx2/j_0013.gif\"/></p>', '100489', '100042', '1', '127.0.0.1', '1', '2', '2017-05-18 21:43:36');
INSERT INTO `comment` VALUES ('63', '<img src=\"http://127.0.0.1:9000/js/ueditor/dialogs/emotion/images/jx2/j_0024.gif\"/><p></p>', '100001', '100062', '1', '127.0.0.1', '1', '2', '2017-06-04 10:35:54');
INSERT INTO `comment` VALUES ('64', '<p><img src=\"http://127.0.0.1:9000/js/ueditor/dialogs/emotion/images/jx2/j_0001.gif\"/></p>', '100001', '100062', '2', '127.0.0.1', '1', '2', '2017-06-04 23:45:32');
INSERT INTO `comment` VALUES ('65', '<p><img src=\"http://127.0.0.1:9000/js/ueditor/dialogs/emotion/images/jx2/j_0030.gif\"/><img src=\"http://127.0.0.1:9000/js/ueditor/dialogs/emotion/images/jx2/j_0053.gif\"/></p>', '100001', '100062', '3', '127.0.0.1', '1', '2', '2017-06-04 23:45:42');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(12) NOT NULL AUTO_INCREMENT COMMENT '表ID',
  `police_id` varchar(12) NOT NULL COMMENT '警员ID',
  `nickname` varchar(20) NOT NULL COMMENT '昵称',
  `name` varchar(8) DEFAULT NULL COMMENT '姓名',
  `password` varchar(50) NOT NULL DEFAULT '111111' COMMENT '密码',
  `picture_url` varchar(500) DEFAULT 'default-1.jpg' COMMENT '用户头像URL',
  `age` int(4) DEFAULT NULL COMMENT '年龄',
  `sex` varchar(1) DEFAULT NULL COMMENT '性别',
  `phone` varchar(11) DEFAULT NULL COMMENT '电话',
  `email` varchar(200) DEFAULT NULL COMMENT '邮件',
  `group_id` int(8) NOT NULL DEFAULT '0' COMMENT '组织ID',
  `group_name` varchar(50) NOT NULL COMMENT '组织名称',
  `read_times` int(20) NOT NULL DEFAULT '0' COMMENT '个人主页浏览次数（初始值为1）',
  `flag` int(1) NOT NULL DEFAULT '2' COMMENT '标识位  1：未审核  2： 已审核  3：已删除',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `police_id_unique_key` (`police_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100490 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('100001', '100001', '滴水藏海', '马警官', '125011', 'default-2.jpg', '25', '男', '18252063607', '173383944@qq.com', '1', '栖霞公安分局', '0', '2', '2017-03-28 21:21:33', '2017-04-16 00:04:53');
INSERT INTO `user` VALUES ('100002', '100002', '皇甫', '黄警官', '11111111', 'default-1.jpg', '25', '男', '18252063607', '173383944@qq.com', '1', '栖霞公安分局', '0', '2', '2017-04-02 14:50:44', '2017-04-06 17:54:34');
INSERT INTO `user` VALUES ('100003', '100003', '大壮', '马状警官', '11111111', 'default-3.jpg', '25', '男', '18252063607', '173383944@qq.com', '1', '栖霞公安分局', '0', '2', '2017-04-02 14:56:26', '2017-04-06 17:54:19');
INSERT INTO `user` VALUES ('100004', '100004', '呵呵', '嘎嘎', '11111111', 'default-2.jpg', '22', '男', '18252063607', '173383944@qq.com', '1', '栖霞公安分局', '0', '2', '2017-04-02 14:57:58', '2017-04-06 17:54:38');
INSERT INTO `user` VALUES ('100005', '100005', '老蒋', '蒋警官', '11111111', 'default-1.jpg', '25', '男', '18252063607', '173383944@qq.com', '1', '栖霞公安分局', '0', '1', '2017-04-02 14:57:41', '2017-04-06 17:54:42');
INSERT INTO `user` VALUES ('100006', '100006', '的发达', '对方答复', '11111111', 'default-3.jpg', '24', '男', '18252063607', '173383944@qq.com', '1', '栖霞公安分局', '0', '1', '2017-04-02 14:58:47', '2017-04-06 17:55:00');
INSERT INTO `user` VALUES ('100007', '100007', '太难', '的发达', '11111111', null, '23', '男', '18252063607', '173383944@qq.com', '0', '', '0', '1', '2017-04-02 14:59:06', '2017-04-02 15:00:57');
INSERT INTO `user` VALUES ('100008', '100008', '几家', '热热', '11111111', null, '23', '男', '18252063607', '173383944@qq.com', '0', '', '0', '2', '2017-04-02 14:59:30', '2017-04-02 15:01:20');
INSERT INTO `user` VALUES ('100009', '100009', '的语言', '6士', '11111111', null, '23', '男', '18252063607', '173383944@qq.com', '0', '', '0', '1', '2017-04-02 14:59:45', '2017-04-02 15:00:58');
INSERT INTO `user` VALUES ('100010', '100010', '房东', '租户', '11111111', null, '23', '女', '18252063607', '173383944@qq.com', '0', '', '0', '2', '2017-04-02 15:00:04', '2017-04-03 13:48:11');
INSERT INTO `user` VALUES ('100011', '100011', '天使', '魔鬼', '11111111', null, '23', '男', '18252063607', '173383944@qq.com', '0', '', '0', '3', '2017-04-02 15:00:25', '2017-04-03 13:48:09');
INSERT INTO `user` VALUES ('100012', '100012', '东皇太一', '东华', '11111111', null, '11', '男', '18252063607', '173383944@qq.com', '0', '', '0', '1', '2017-04-03 14:57:33', '2017-04-03 15:02:42');
INSERT INTO `user` VALUES ('100013', '100013', '墨渊', '夜华', '11111111', null, '23', '男', '18252063607', '173383944@qq.com', '0', '', '0', '1', '2017-04-03 14:57:45', '2017-04-03 15:02:43');
INSERT INTO `user` VALUES ('100014', '100014', '夜华', '夜华', '11111111', null, '23', '男', '18252063607', '173383944@qq.com', '0', '', '0', '1', '2017-04-03 14:57:57', '2017-04-03 15:02:51');
INSERT INTO `user` VALUES ('100015', '100015', '白浅', '夜华', '11111111', null, '23', '女', '18252063607', '173383944@qq.com', '0', '', '0', '1', '2017-04-03 14:58:27', '2017-04-03 15:02:50');
INSERT INTO `user` VALUES ('100016', '100016', '白芷', '夜华', '11111111', null, '23', '男', '18252063607', '173383944@qq.com', '0', '', '0', '1', '2017-04-03 14:58:31', '2017-04-03 15:02:49');
INSERT INTO `user` VALUES ('100017', '100017', '白凤九', '夜华', '11111111', null, '23', '女', '18252063607', '173383944@qq.com', '0', '', '0', '2', '2017-04-03 14:58:49', '2017-04-03 16:41:08');
INSERT INTO `user` VALUES ('100018', '100018', '上神', '夜华', '11111111', null, '23', '男', '18252063607', '173383944@qq.com', '0', '', '0', '1', '2017-04-03 14:58:54', '2017-04-03 15:02:47');
INSERT INTO `user` VALUES ('100019', '100019', '上仙', '夜华', '11111111', null, '23', '男', '18252063607', '173383944@qq.com', '0', '', '0', '1', '2017-04-03 14:59:00', '2017-04-03 15:02:46');
INSERT INTO `user` VALUES ('100020', '100020', '折颜', '夜华', '11111111', null, '23', '男', '18252063607', '173383944@qq.com', '0', '', '0', '1', '2017-04-03 14:59:08', '2017-04-03 15:02:46');
INSERT INTO `user` VALUES ('100021', '100021', '人间', '夜华', '11111111', null, '23', '男', '18252063607', '173383944@qq.com', '0', '', '0', '1', '2017-04-03 14:59:17', '2017-04-03 15:02:45');
INSERT INTO `user` VALUES ('100022', '100022', '神仙', '夜华', '11111111', null, '23', '男', '18252063607', '173383944@qq.com', '0', '', '0', '2', '2017-04-03 14:59:22', '2017-04-03 15:04:03');
INSERT INTO `user` VALUES ('100023', '016970', '谭海军', '谭海军', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局治安大队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100024', '016982', '王道平', '王道平', '111111', 'default-1.jpg', null, null, null, null, '0', '迈皋桥派出所治安巡逻责任区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100025', '017133', '乌银生', '乌银生', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局治安大队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100026', '216955', '谢长柱', '谢长柱', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞区看守所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100027', '017154', '谢建功', '谢建功', '111111', 'default-1.jpg', null, null, null, null, '0', '仙林派出所仙林新村巡区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100028', '017215', '徐文平', '徐文平', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞区看守所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100029', '017182', '许怡公', '许怡公', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局指挥室', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100030', '016947', '许兆映', '许兆映', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局治安大队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100031', '016978', '严雨明', '严雨明', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局监察室', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100032', '016938', '杨宝善', '杨宝善', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局治安大队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100033', '017132', '张宝根', '张宝根', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局指挥室', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100034', '016996', '张晓天', '张晓天', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局刑警大队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100035', '017040', '辛向群', '辛向群', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局刑警大队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100036', '016953', '崔博', '崔博', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局指挥室', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100037', '216943', '王世强', '王世强', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局政治工作办公室', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100038', '012668', '班杰', '班杰', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局巡特警大队仙林警务工作服务站', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100039', '217149', '包琪琛', '包琪琛', '111111', 'default-1.jpg', null, null, null, null, '0', '迈皋桥派出所迈南片巡区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100040', '017135', '鲍宁', '鲍宁', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局法制科', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100041', '210936', '鲍玉石', '鲍玉石', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局特巡警大队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100042', '219533', '鲍媛媛', '鲍媛媛', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局尧化门派出所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100043', '017022', '毕宏', '毕宏', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局经侦大队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100044', '017069', '卞玉民', '卞玉民', '111111', 'default-1.jpg', null, null, null, null, '0', '迈皋桥派出所壹城责任区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100045', '017120', '蔡金华', '蔡金华', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局迈皋桥派出所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100046', '219532', '蔡明泽', '蔡明泽', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局巡特警大队仙林警务工作服务站', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100047', '019507', '蔡学军', '蔡学军', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局食药环犯罪侦查大队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100048', '219528', '曹川', '曹川', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局巡特警大队仙林警务工作服务站', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100049', '217201', '曹杰', '曹杰', '111111', 'default-1.jpg', null, null, null, null, '0', '仙林派出所文澜路第二责任区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100050', '016974', '曹玲', '曹玲', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局人口管理大队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100051', '217018', '曹凌', '曹凌', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局监察室', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100052', '017087', '曹阳', '曹阳', '111111', 'default-1.jpg', null, null, null, null, '0', '燕子矶派出所太平一责任区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100053', '015651', '曹杨', '曹杨', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局食药环犯罪侦查大队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100054', '217219', '曹中秋', '曹中秋', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局燕子矶派出所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100055', '219511', '柴铃铃', '柴铃铃', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局龙潭派出所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100056', '217079', '常全伟', '常全伟', '111111', 'default-1.jpg', null, null, null, null, '0', '尧化门派出所王子楼责任区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100057', '216945', '巢国正', '巢国正', '111111', 'default-1.jpg', null, null, null, null, '0', '迈皋桥派出所华电责任区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100058', '217040', '陈广忠', '陈广忠', '111111', 'default-1.jpg', null, null, null, null, '0', '迈皋桥派出所迈皋桥街责任区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100059', '216922', '陈红飞', '陈红飞', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局尧化门派出所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100060', '016943', '陈静', '陈静', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局指挥室', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100061', '017798', '陈军', '陈军', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局巡特警大队迈皋桥警务工作服务站', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100062', '217090', '陈俊', '陈俊', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局靖安派出所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100063', '216970', '陈峻', '陈峻', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局政治工作办公室', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100064', '217081', '陈良彬', '陈良彬', '111111', 'default-1.jpg', null, null, null, null, '0', '马群派出所文康苑责任区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100065', '017049', '陈文琦', '陈文琦', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局刑警大队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100066', '216983', '陈曦', '陈曦', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局刑警大队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100067', '217165', '陈新', '陈新', '111111', 'default-1.jpg', null, null, null, null, '0', '马群刑侦责任区中队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100068', '219536', '陈亚', '陈亚', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局栖霞派出所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100069', '217233', '陈奕彤', '陈奕彤', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局法制科', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100070', '219512', '陈逸怡', '陈逸怡', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局人口管理大队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100071', '011992', '陈银平', '陈银平', '111111', 'default-1.jpg', null, null, null, null, '0', '靖安派出所靖安责任区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100072', '216971', '陈永军', '陈永军', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局八卦洲派出所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100073', '216964', '陈友顺', '陈友顺', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局刑警大队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100074', '217210', '陈余山', '陈余山', '111111', 'default-1.jpg', null, null, null, null, '0', '摄山派出所治安巡逻责任区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100075', '217131', '陈振东', '陈振东', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局监察室', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100076', '016989', '成翔', '成翔', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局单位内部安全保卫大队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100077', '216977', '程基会', '程基会', '111111', 'default-1.jpg', null, null, null, null, '0', '尧化门派出所尧化巡区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100078', '016928', '程庄', '程庄', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局指挥室', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100079', '216994', '迟海田', '迟海田', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局尧化门派出所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100080', '017175', '仇文喜', '仇文喜', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞派出所栖霞街责任区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100081', '217102', '崔建勋', '崔建勋', '111111', 'default-1.jpg', null, null, null, null, '0', '迈皋桥派出所迈南片巡区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100082', '214823', '崔静', '崔静', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局警务保障室', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100083', '217108', '代兵', '代兵', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞刑侦责任区中队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100084', '217140', '戴刚', '戴刚', '111111', 'default-1.jpg', null, null, null, null, '0', '摄山派出所治安巡逻责任区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100085', '216923', '戴刚', '戴刚', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局治安大队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100086', '217171', '戴建华', '戴建华', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局尧化门派出所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100087', '017053', '戴建平', '戴建平', '111111', 'default-1.jpg', null, null, null, null, '0', '仙林派出所治安巡逻责任区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100088', '216967', '戴兴磊', '戴兴磊', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局巡特警大队仙林警务工作服务站', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100089', '217024', '戴永健', '戴永健', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局法制科', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100090', '010520', '邓飞', '邓飞', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局治安大队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100091', '217058', '邓欢', '邓欢', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局刑警大队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100092', '017064', '邓家忠', '邓家忠', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局刑警大队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100093', '210961', '邓丽娟', '邓丽娟', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局栖霞派出所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100094', '217101', '刁克华', '刁克华', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞区看守所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100095', '011286', '丁怀南', '丁怀南', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局龙潭派出所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100096', '214911', '丁力', '丁力', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局巡特警大队迈皋桥警务工作服务站', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100097', '012676', '丁旭忠', '丁旭忠', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局治安大队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100098', '017116', '董文忠', '董文忠', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局靖安派出所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100099', '217122', '杜飞', '杜飞', '111111', 'default-1.jpg', null, null, null, null, '0', '摄山刑侦责任区中队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100100', '017017', '杜麟', '杜麟', '111111', 'default-1.jpg', null, null, null, null, '0', '仙林派出所文澜路第三责任区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100101', '217156', '杜明泉', '杜明泉', '111111', 'default-1.jpg', null, null, null, null, '0', '迈皋桥刑侦责任区中队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100102', '217644', '杜明星', '杜明星', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局食药环犯罪侦查大队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100103', '017108', '杜为国', '杜为国', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局尧化门派出所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100104', '219504', '樊仕龙', '樊仕龙', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局八卦洲派出所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100105', '219527', '樊信伟', '樊信伟', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局巡特警大队仙林警务工作服务站', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100106', '012768', '范华', '范华', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局迈皋桥派出所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100107', '017201', '费小平', '费小平', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局反恐怖工作大队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100108', '010579', '冯英萍', '冯英萍', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局刑警大队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100109', '017039', '傅建国', '傅建国', '111111', 'default-1.jpg', null, null, null, null, '0', '尧化门派出所尧林仙居责任区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100110', '216978', '傅维成', '傅维成', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局国保大队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100111', '217185', '傅鑫龙', '傅鑫龙', '111111', 'default-1.jpg', null, null, null, null, '0', '迈皋桥刑侦责任区中队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100112', '017204', '高明', '高明', '111111', 'default-1.jpg', null, null, null, null, '0', '龙潭派出所龙潭街巡区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100113', '217144', '高明', '高明', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞刑侦责任区中队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100114', '017024', '高如龙', '高如龙', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞区看守所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100115', '217076', '高永伟', '高永伟', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞区看守所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100116', '219508', '高塬', '高塬', '111111', 'default-1.jpg', null, null, null, null, '0', '尧化门刑侦责任区中队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100117', '219530', '葛晨雨', '葛晨雨', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局仙林派出所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100118', '216924', '宫梅', '宫梅', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局人口管理大队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100119', '214924', '宫伟毅', '宫伟毅', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局巡特警大队迈皋桥警务工作服务站', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100120', '017178', '龚广友', '龚广友', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞区看守所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100121', '217128', '巩锐', '巩锐', '111111', 'default-1.jpg', null, null, null, null, '0', '仙林派出所仙林新村巡区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100122', '017094', '顾卫东', '顾卫东', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局刑警大队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100123', '217125', '观文高', '观文高', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局巡特警大队迈皋桥警务工作服务站', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100124', '216965', '管吉训', '管吉训', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局警务保障室', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100125', '012773', '管建国', '管建国', '111111', 'default-1.jpg', null, null, null, null, '0', '燕子矶派出所太平二责任区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100126', '217117', '郭俊柯', '郭俊柯', '111111', 'default-1.jpg', null, null, null, null, '0', '迈皋桥刑侦责任区中队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100127', '016967', '郭萍', '郭萍', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局单位内部安全保卫大队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100128', '216947', '郭元荣', '郭元荣', '111111', 'default-1.jpg', null, null, null, null, '0', '燕子矶派出所晓庄责任区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100129', '217218', '郭子木', '郭子木', '111111', 'default-1.jpg', null, null, null, null, '0', '马群刑侦责任区中队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100130', '217078', '海阿军', '海阿军', '111111', 'default-1.jpg', null, null, null, null, '0', '燕子矶派出所燕西四组巡区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100131', '017161', '韩东文', '韩东文', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局仙林派出所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100132', '217091', '韩健', '韩健', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局治安大队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100133', '217141', '韩璐', '韩璐', '111111', 'default-1.jpg', null, null, null, null, '0', '迈皋桥派出所景和园责任区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100134', '017033', '韩敏', '韩敏', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局刑警大队专业基础工作中队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100135', '016942', '韩文芳', '韩文芳', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局警务保障室', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100136', '010558', '韩艺', '韩艺', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局迈皋桥派出所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100137', '217135', '何大祥', '何大祥', '111111', 'default-1.jpg', null, null, null, null, '0', '迈皋桥派出所迈北片巡区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100138', '217116', '何况', '何况', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局法制科', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100139', '217096', '贺彦文', '贺彦文', '111111', 'default-1.jpg', null, null, null, null, '0', '燕子矶刑侦责任区中队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100140', '217189', '洪伟', '洪伟', '111111', 'default-1.jpg', null, null, null, null, '0', '马群刑侦责任区中队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100141', '017056', '胡定祥', '胡定祥', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局经侦大队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100142', '217132', '胡伏生', '胡伏生', '111111', 'default-1.jpg', null, null, null, null, '0', '尧化门派出所青田雅居责任区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100143', '217237', '胡静娴', '胡静娴', '111111', 'default-1.jpg', null, null, null, null, '0', '摄山派出所仙林湖责任区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100144', '217146', '胡猛', '胡猛', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局巡特警大队仙林警务工作服务站', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100145', '016971', '胡民强', '胡民强', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局人口管理大队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100146', '217207', '胡清', '胡清', '111111', 'default-1.jpg', null, null, null, null, '0', '迈皋桥派出所治安巡逻责任区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100147', '217226', '胡系文', '胡系文', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局巡特警大队迈皋桥警务工作服务站', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100148', '210450', '胡雅谷', '胡雅谷', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局栖霞派出所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100149', '211364', '胡亚洲', '胡亚洲', '111111', 'default-1.jpg', null, null, null, null, '0', '迈皋桥刑侦责任区中队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100150', '014277', '胡芸辉', '胡芸辉', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局摄山派出所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100151', '017126', '胡忠', '胡忠', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局治安大队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100152', '016983', '花修武', '花修武', '111111', 'default-1.jpg', null, null, null, null, '0', '仙林派出所仙林新村巡区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100153', '217103', '黄功飞', '黄功飞', '111111', 'default-1.jpg', null, null, null, null, '0', '燕子矶刑侦责任区中队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100154', '017750', '黄金春', '黄金春', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局食药环犯罪侦查大队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100155', '217194', '黄维', '黄维', '111111', 'default-1.jpg', null, null, null, null, '0', '龙潭派出所刑侦责任区中队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100156', '217016', '黄炜', '黄炜', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局八卦洲派出所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100157', '017048', '黄新顺', '黄新顺', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞区看守所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100158', '016965', '黄永林', '黄永林', '111111', 'default-1.jpg', null, null, null, null, '0', '八卦洲派出所七里责任区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100159', '013290', '黄勇', '黄勇', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局经侦大队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100160', '217227', '纪晓东', '纪晓东', '111111', 'default-1.jpg', null, null, null, null, '0', '尧化门派出所金尧花园责任区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100161', '217215', '季大为', '季大为', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局刑警大队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100162', '214904', '季瀚', '季瀚', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局巡特警大队迈皋桥警务工作服务站', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100163', '217186', '贾飞', '贾飞', '111111', 'default-1.jpg', null, null, null, null, '0', '燕子矶刑侦责任区中队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100164', '217118', '贾嘉', '贾嘉', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局马群派出所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100165', '012016', '贾培友', '贾培友', '111111', 'default-1.jpg', null, null, null, null, '0', '燕子矶派出所燕西四组巡区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100166', '217139', '贾树旺', '贾树旺', '111111', 'default-1.jpg', null, null, null, null, '0', '迈皋桥派出所高家村责任区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100167', '217176', '贾廷亮', '贾廷亮', '111111', 'default-1.jpg', null, null, null, null, '0', '马群派出所百水桥责任区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100168', '217050', '姜因阔', '姜因阔', '111111', 'default-1.jpg', null, null, null, null, '0', '摄山派出所听竹责任区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100169', '010495', '蒋保华', '蒋保华', '111111', 'default-1.jpg', null, null, null, null, '0', '燕子矶派出所燕南二组巡区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100170', '017091', '蒋国文', '蒋国文', '111111', 'default-1.jpg', null, null, null, null, '0', '燕子矶派出所燕中一组巡区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100171', '217167', '蒋菁', '蒋菁', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局法制科', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100172', '217187', '蒋苏立', '蒋苏立', '111111', 'default-1.jpg', null, null, null, null, '0', '马群派出所花岗责任区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100173', '211516', '蒋庭婷', '蒋庭婷', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局迈皋桥派出所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100174', '017051', '蒋振明', '蒋振明', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局刑警大队专业基础工作中队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100175', '210934', '蒋宗袁', '蒋宗袁', '111111', 'default-1.jpg', null, null, null, null, '0', '迈皋桥刑侦责任区中队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100176', '017150', '金健', '金健', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞区看守所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100177', '017107', '金良才', '金良才', '111111', 'default-1.jpg', null, null, null, null, '0', '迈皋桥派出所迈北片巡区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100178', '219529', '金苇杭', '金苇杭', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局仙林派出所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100179', '217647', '金文武', '金文武', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局食药环犯罪侦查大队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100180', '217115', '金鑫', '金鑫', '111111', 'default-1.jpg', null, null, null, null, '0', '迈皋桥刑侦责任区中队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100181', '016941', '金莹', '金莹', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局警务保障室', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100182', '217053', '金柱祥', '金柱祥', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局尧化门派出所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100183', '010557', '鞠筱春', '鞠筱春', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞区看守所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100184', '217051', '康恺', '康恺', '111111', 'default-1.jpg', null, null, null, null, '0', '马群刑侦责任区中队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100185', '017032', '孔红卫', '孔红卫', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局刑警大队办案指导中队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100186', '216950', '孔辉', '孔辉', '111111', 'default-1.jpg', null, null, null, null, '0', '迈皋桥派出所十字街责任区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100187', '216933', '孔祥炳', '孔祥炳', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞区看守所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100188', '010572', '匡莉莉', '匡莉莉', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞区看守所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100189', '210454', '郎浩', '郎浩', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局刑警大队刑事科学技术室', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100190', '217638', '郎秋兵', '郎秋兵', '111111', 'default-1.jpg', null, null, null, null, '0', '燕子矶派出所治安巡逻责任区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100191', '217019', '黎露刚', '黎露刚', '111111', 'default-1.jpg', null, null, null, null, '0', '马群派出所治安巡逻责任区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100192', '016809', '李爱华', '李爱华', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局治安大队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100193', '012729', '李兵', '李兵', '111111', 'default-1.jpg', null, null, null, null, '0', '马群派出所新街巡区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100194', '217170', '李承承', '李承承', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局刑警大队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100195', '217109', '李程', '李程', '111111', 'default-1.jpg', null, null, null, null, '0', '马群刑侦责任区中队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100196', '010402', '李春明', '李春明', '111111', 'default-1.jpg', null, null, null, null, '0', '仙林派出所仙林新村巡区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100197', '214920', '李国良', '李国良', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局巡特警大队迈皋桥警务工作服务站', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100198', '217038', '李贺', '李贺', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局靖安派出所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100199', '214925', '李鸿飞', '李鸿飞', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局靖安派出所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100200', '217168', '李厚亮', '李厚亮', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞派出所栖霞街巡区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100201', '217123', '李佳', '李佳', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局龙潭派出所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100202', '017774', '李康', '李康', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局食药环犯罪侦查大队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100203', '217112', '李乐', '李乐', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局尧化门派出所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100204', '217015', '李奇', '李奇', '111111', 'default-1.jpg', null, null, null, null, '0', '八卦洲派出所大同责任区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100205', '013533', '李庆', '李庆', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局巡特警大队迈皋桥警务工作服务站', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100206', '016987', '李沙', '李沙', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局治安大队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100207', '210392', '李同进', '李同进', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局仙林派出所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100208', '217021', '李伟器', '李伟器', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞派出所栖霞街巡区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100209', '217059', '李翔宇', '李翔宇', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局八卦洲派出所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100210', '017152', '李向阳', '李向阳', '111111', 'default-1.jpg', null, null, null, null, '0', '尧化门派出所尧化责任区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100211', '216962', '李晓辉', '李晓辉', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局燕子矶派出所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100212', '217014', '李晓林', '李晓林', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局燕子矶派出所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100213', '216939', '李孝华', '李孝华', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局巡特警大队迈皋桥警务工作服务站', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100214', '217041', '李毅', '李毅', '111111', 'default-1.jpg', null, null, null, null, '0', '仙林派出所仙林新村巡区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100215', '210918', '李莹', '李莹', '111111', 'default-1.jpg', null, null, null, null, '0', '燕子矶派出所南电责任区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100216', '217085', '李玉良', '李玉良', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局靖安派出所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100217', '216998', '李玉梅', '李玉梅', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局迈皋桥派出所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100218', '217183', '李振', '李振', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局监察室', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100219', '217224', '李智超', '李智超', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局指挥室', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100220', '217155', '李钟洋', '李钟洋', '111111', 'default-1.jpg', null, null, null, null, '0', '龙潭派出所龙潭街巡区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100221', '217240', '练亚梅', '练亚梅', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局龙潭派出所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100222', '017188', '梁成政', '梁成政', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞区看守所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100223', '210908', '梁晓鹏', '梁晓鹏', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局警务保障室', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100224', '217193', '梁志天', '梁志天', '111111', 'default-1.jpg', null, null, null, null, '0', '尧化门刑侦责任区中队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100225', '217062', '廖彬鸿', '廖彬鸿', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局刑警大队侦查中队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100226', '016961', '林海峰', '林海峰', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局人口管理大队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100227', '216990', '林进回', '林进回', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞区看守所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100228', '012518', '林木天', '林木天', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局指挥室', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100229', '216940', '林永休', '林永休', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局摄山派出所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100230', '016993', '林云', '林云', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局巡特警大队仙林警务工作服务站', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100231', '017059', '凌健', '凌健', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局治安大队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100232', '217088', '凌阳', '凌阳', '111111', 'default-1.jpg', null, null, null, null, '0', '马群刑侦责任区中队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100233', '010515', '刘爱东', '刘爱东', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局特巡警大队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100234', '010568', '刘斌', '刘斌', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局燕子矶派出所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100235', '219501', '刘长文', '刘长文', '111111', 'default-1.jpg', null, null, null, null, '0', '燕子矶刑侦责任区中队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100236', '017233', '刘初阳', '刘初阳', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局单位内部安全保卫大队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100237', '017036', '刘峰', '刘峰', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局刑警大队办案指导中队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100238', '012739', '刘浩', '刘浩', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局指挥室', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100239', '017105', '刘惠民', '刘惠民', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局法制科', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100240', '219510', '刘美彤', '刘美彤', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局马群派出所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100241', '217143', '刘奇明', '刘奇明', '111111', 'default-1.jpg', null, null, null, null, '0', '迈皋桥派出所迈西片巡区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100242', '217148', '刘甦', '刘甦', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局经侦大队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100243', '217032', '刘婷', '刘婷', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局治安大队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100244', '016937', '刘湘衡', '刘湘衡', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局警务保障室', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100245', '217013', '刘永森', '刘永森', '111111', 'default-1.jpg', null, null, null, null, '0', '八卦洲派出所光明责任区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100246', '010501', '刘志伟', '刘志伟', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局特巡警大队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100247', '217026', '卢海建', '卢海建', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局指挥室', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100248', '017119', '鲁红兵', '鲁红兵', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞区看守所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100249', '012731', '鲁照明', '鲁照明', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局尧化门派出所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100250', '017183', '陆成雷', '陆成雷', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局栖霞派出所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100251', '017063', '陆从正', '陆从正', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局反恐怖工作大队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100252', '216989', '陆建国', '陆建国', '111111', 'default-1.jpg', null, null, null, null, '0', '迈皋桥派出所兴都花园责任区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100253', '017141', '陆兴忠', '陆兴忠', '111111', 'default-1.jpg', null, null, null, null, '0', '马群派出所新街巡区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100254', '216936', '吕健', '吕健', '111111', 'default-1.jpg', null, null, null, null, '0', '马群派出所新街巡区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100255', '017026', '吕美巧', '吕美巧', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局巡特警大队仙林警务工作服务站', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100256', '216015', '吕晓云', '吕晓云', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局摄山派出所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100257', '216984', '律波', '律波', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局法制科', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100258', '214840', '罗来洲', '罗来洲', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局刑警大队办案指导中队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100259', '017197', '骆克宝', '骆克宝', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞区看守所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100260', '217048', '马根林', '马根林', '111111', 'default-1.jpg', null, null, null, null, '0', '尧化门派出所吴边责任区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100261', '217212', '马金星', '马金星', '111111', 'default-1.jpg', null, null, null, null, '0', '八卦洲派出所中桥责任区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100262', '219531', '马南宁', '马南宁', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局特巡警大队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100263', '010538', '马鹏', '马鹏', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局刑警大队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100264', '017062', '马修斌', '马修斌', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局法制科', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100265', '219534', '毛鑫', '毛鑫', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局巡特警大队迈皋桥警务工作服务站', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100266', '017191', '孟波', '孟波', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局国保大队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100267', '017153', '孟春秋', '孟春秋', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞区看守所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100268', '217145', '孟海波', '孟海波', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局指挥室', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100269', '017085', '孟雄文', '孟雄文', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞区看守所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100270', '216952', '缪晓峰', '缪晓峰', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局刑警大队专业基础工作中队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100271', '217202', '倪庭', '倪庭', '111111', 'default-1.jpg', null, null, null, null, '0', '仙林派出所治安巡逻责任区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100272', '017104', '欧红平', '欧红平', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局巡特警大队迈皋桥警务工作服务站', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100273', '217204', '潘登', '潘登', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局指挥室', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100274', '017046', '潘国顺', '潘国顺', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞刑侦责任区中队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100275', '217211', '潘习林', '潘习林', '111111', 'default-1.jpg', null, null, null, null, '0', '龙潭派出所花园责任区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100276', '219513', '潘宇', '潘宇', '111111', 'default-1.jpg', null, null, null, null, '0', '仙林派出所刑侦责任区中队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100277', '012736', '潘渊波', '潘渊波', '111111', 'default-1.jpg', null, null, null, null, '0', '仙林派出所汇通路责任区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100278', '217044', '潘子龙', '潘子龙', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局警务保障室', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100279', '217045', '裴俊', '裴俊', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局巡特警大队迈皋桥警务工作服务站', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100280', '217182', '彭建青', '彭建青', '111111', 'default-1.jpg', null, null, null, null, '0', '仙林派出所治安巡逻责任区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100281', '219502', '彭健', '彭健', '111111', 'default-1.jpg', null, null, null, null, '0', '八卦洲刑侦责任区中队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100282', '010555', '浦晨', '浦晨', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞派出所栖霞街巡区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100283', '217064', '祁永强', '祁永强', '111111', 'default-1.jpg', null, null, null, null, '0', '迈皋桥刑侦责任区中队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100284', '217739', '綦振平', '綦振平', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局食药环犯罪侦查大队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100285', '210977', '钱小兰', '钱小兰', '111111', 'default-1.jpg', null, null, null, null, '0', '仙林派出所仙林新村责任区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100286', '217213', '乔恩琴', '乔恩琴', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局仙林派出所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100287', '216960', '乔靖', '乔靖', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局治安大队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100288', '216992', '秦怀善', '秦怀善', '111111', 'default-1.jpg', null, null, null, null, '0', '马群派出所百水芊城社区责任区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100289', '217214', '全冬冬', '全冬冬', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞刑侦责任区中队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100290', '017207', '阙长俊', '阙长俊', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局单位内部安全保卫大队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100291', '012743', '芮飞翔', '芮飞翔', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局尧化门派出所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100292', '016964', '桑琪', '桑琪', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局单位内部安全保卫大队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100293', '217153', '桑瑞', '桑瑞', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局迈皋桥派出所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100294', '217154', '申涛', '申涛', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局巡特警大队迈皋桥警务工作服务站', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100295', '217001', '沈俊', '沈俊', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局刑警大队办案指导中队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100296', '015329', '沈满', '沈满', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局仙林派出所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100297', '217231', '沈思', '沈思', '111111', 'default-1.jpg', null, null, null, null, '0', '仙林派出所刑侦责任区中队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100298', '016972', '沈卫', '沈卫', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局人口管理大队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100299', '211016', '盛杰', '盛杰', '111111', 'default-1.jpg', null, null, null, null, '0', '仙林派出所刑侦责任区中队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100300', '217025', '施蓉芬', '施蓉芬', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局特巡警大队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100301', '219524', '石金加', '石金加', '111111', 'default-1.jpg', null, null, null, null, '0', '燕子矶刑侦责任区中队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100302', '217216', '时午康', '时午康', '111111', 'default-1.jpg', null, null, null, null, '0', '摄山刑侦责任区中队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100303', '215425', '宋冬生', '宋冬生', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局反恐怖工作大队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100304', '217175', '宋建国', '宋建国', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局巡特警大队迈皋桥警务工作服务站', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100305', '216921', '宋杨', '宋杨', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞区看守所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100306', '217205', '宋振昊', '宋振昊', '111111', 'default-1.jpg', null, null, null, null, '0', '仙林派出所治安巡逻责任区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100307', '017083', '孙德洲', '孙德洲', '111111', 'default-1.jpg', null, null, null, null, '0', '燕子矶派出所化纤新村责任区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100308', '217060', '孙冬冬', '孙冬冬', '111111', 'default-1.jpg', null, null, null, null, '0', '迈皋桥刑侦责任区中队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100309', '219542', '孙敢', '孙敢', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局巡特警大队仙林警务工作服务站', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100310', '216953', '孙涵丽', '孙涵丽', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局马群派出所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100311', '017073', '孙恒义', '孙恒义', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞区看守所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100312', '017181', '孙虎', '孙虎', '111111', 'default-1.jpg', null, null, null, null, '0', '仙林派出所治安巡逻责任区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100313', '217066', '孙辉', '孙辉', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局指挥室', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100314', '211009', '孙伟峰', '孙伟峰', '111111', 'default-1.jpg', null, null, null, null, '0', '迈皋桥刑侦责任区中队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100315', '216957', '孙文兴', '孙文兴', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局人口管理大队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100316', '017142', '孙小红', '孙小红', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局马群派出所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100317', '014157', '孙勇', '孙勇', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞区看守所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100318', '017111', '孙志健', '孙志健', '111111', 'default-1.jpg', null, null, null, null, '0', '迈皋桥派出所南塑责任区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100319', '017013', '孙宗龙', '孙宗龙', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局法制科', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100320', '217126', '索皓', '索皓', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局刑警大队刑事科学技术室', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100321', '217206', '谭晓东', '谭晓东', '111111', 'default-1.jpg', null, null, null, null, '0', '仙林派出所杉湖路责任区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100322', '217191', '汤伟', '汤伟', '111111', 'default-1.jpg', null, null, null, null, '0', '迈皋桥刑侦责任区中队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100323', '210320', '汤远明', '汤远明', '111111', 'default-1.jpg', null, null, null, null, '0', '尧化门派出所王子楼责任区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100324', '015664', '唐敏克', '唐敏克', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局巡特警大队迈皋桥警务工作服务站', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100325', '210590', '唐彦芳', '唐彦芳', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局警务保障室', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100326', '017209', '陶发银', '陶发银', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局刑警大队办案指导中队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100327', '217012', '陶红彬', '陶红彬', '111111', 'default-1.jpg', null, null, null, null, '0', '燕子矶派出所燕西四组巡区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100328', '017084', '陶家龙', '陶家龙', '111111', 'default-1.jpg', null, null, null, null, '0', '燕子矶派出所幕府山庄责任区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100329', '010574', '陶苑', '陶苑', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局八卦洲派出所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100330', '016977', '滕建青', '滕建青', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局单位内部安全保卫大队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100331', '217160', '滕云', '滕云', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局龙潭派出所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100332', '219503', '屠亮', '屠亮', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局刑警大队刑事科学技术室', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100333', '017212', '汪长友', '汪长友', '111111', 'default-1.jpg', null, null, null, null, '0', '靖安派出所飞花责任区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100334', '217069', '汪德洋', '汪德洋', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局燕子矶派出所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100335', '016966', '汪开文', '汪开文', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局单位内部安全保卫大队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100336', '217157', '汪坤', '汪坤', '111111', 'default-1.jpg', null, null, null, null, '0', '燕子矶刑侦责任区中队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100337', '017023', '汪维柱', '汪维柱', '111111', 'default-1.jpg', null, null, null, null, '0', '燕子矶派出所治安巡逻责任区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100338', '017093', '汪元嘉', '汪元嘉', '111111', 'default-1.jpg', null, null, null, null, '0', '燕子矶派出所燕华责任区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100339', '010484', '汪治', '汪治', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局刑警大队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100340', '217134', '王阿宝', '王阿宝', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞派出所栖霞街巡区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100341', '017187', '王长平', '王长平', '111111', 'default-1.jpg', null, null, null, null, '0', '摄山派出所西岗责任区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100342', '010457', '王东海', '王东海', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局经侦大队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100343', '017121', '王富成', '王富成', '111111', 'default-1.jpg', null, null, null, null, '0', '迈皋桥派出所迈西片巡区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100344', '017012', '王刚', '王刚', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞刑侦责任区中队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100345', '017211', '王高展', '王高展', '111111', 'default-1.jpg', null, null, null, null, '0', '靖安派出所大棚责任区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100346', '217110', '王广艺', '王广艺', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局刑警大队刑事科学技术室', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100347', '217056', '王翰平', '王翰平', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局摄山派出所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100348', '017092', '王健伟', '王健伟', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局监察室', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100349', '217049', '王金', '王金', '111111', 'default-1.jpg', null, null, null, null, '0', '马群派出所宁康苑责任区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100350', '217097', '王婧', '王婧', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局指挥室', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100351', '210967', '王珏', '王珏', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局人口管理大队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100352', '217137', '王俊伟', '王俊伟', '111111', 'default-1.jpg', null, null, null, null, '0', '仙林派出所仙林新村巡区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100353', '211353', '王骏', '王骏', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局栖霞派出所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100354', '217138', '王骏', '王骏', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局巡特警大队迈皋桥警务工作服务站', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100355', '217106', '王李平', '王李平', '111111', 'default-1.jpg', null, null, null, null, '0', '迈皋桥刑侦责任区中队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100356', '217200', '王林', '王林', '111111', 'default-1.jpg', null, null, null, null, '0', '尧化门刑侦责任区中队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100357', '217005', '王鲁宁', '王鲁宁', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局八卦洲派出所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100358', '017008', '王明海', '王明海', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局迈皋桥派出所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100359', '219538', '王瑞', '王瑞', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局燕子矶派出所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100360', '219537', '王瑞秋', '王瑞秋', '111111', 'default-1.jpg', null, null, null, null, '0', '迈皋桥刑侦责任区中队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100361', '217034', '王苏', '王苏', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局经侦大队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100362', '010546', '王旺', '王旺', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局仙林派出所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100363', '217209', '王翔毅', '王翔毅', '111111', 'default-1.jpg', null, null, null, null, '0', '马群派出所新街巡区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100364', '216988', '王小宝', '王小宝', '111111', 'default-1.jpg', null, null, null, null, '0', '龙潭派出所龙潭街责任区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100365', '217150', '王肖限', '王肖限', '111111', 'default-1.jpg', null, null, null, null, '0', '八卦洲刑侦责任区中队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100366', '217229', '王欣然', '王欣然', '111111', 'default-1.jpg', null, null, null, null, '0', '燕子矶刑侦责任区中队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100367', '217111', '王鑫', '王鑫', '111111', 'default-1.jpg', null, null, null, null, '0', '马群派出所新街巡区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100368', '017006', '王兴国', '王兴国', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局刑警大队办案指导中队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100369', '014322', '王旭东', '王旭东', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局马群派出所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100370', '016946', '王雪', '王雪', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局指挥室', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100371', '210915', '王雪琼', '王雪琼', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局迈皋桥派出所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100372', '217142', '王雪松', '王雪松', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局刑警大队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100373', '217208', '王彦坡', '王彦坡', '111111', 'default-1.jpg', null, null, null, null, '0', '马群派出所治安巡逻责任区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100374', '217151', '王银虎', '王银虎', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局刑警大队刑事科学技术室', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100375', '017029', '王有才', '王有才', '111111', 'default-1.jpg', null, null, null, null, '0', '尧化门派出所翠林山庄责任区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100376', '217046', '王振江', '王振江', '111111', 'default-1.jpg', null, null, null, null, '0', '摄山派出所观梅责任区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100377', '216938', '王智慧', '王智慧', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞派出所石埠桥责任区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100378', '217105', '王宗发', '王宗发', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局栖霞派出所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100379', '017117', '韦祥', '韦祥', '111111', 'default-1.jpg', null, null, null, null, '0', '迈皋桥派出所长营村责任区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100380', '017179', '卫冬梅', '卫冬梅', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局指挥室', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100381', '217223', '蔚阳', '蔚阳', '111111', 'default-1.jpg', null, null, null, null, '0', '摄山刑侦责任区中队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100382', '210558', '魏建国', '魏建国', '111111', 'default-1.jpg', null, null, null, null, '0', '燕子矶刑侦责任区中队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100383', '210575', '温秀荣', '温秀荣', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局刑警大队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100384', '216973', '文玉军', '文玉军', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局治安大队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100385', '016999', '吴春根', '吴春根', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局法制科', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100386', '012772', '吴禄贵', '吴禄贵', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局靖安派出所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100387', '017109', '吴敏', '吴敏', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局食药环犯罪侦查大队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100388', '016168', '吴庆', '吴庆', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局迈皋桥派出所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100389', '210667', '吴爽', '吴爽', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局巡特警大队迈皋桥警务工作服务站', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100390', '217077', '吴松', '吴松', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞区看守所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100391', '017198', '吴素芹', '吴素芹', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局燕子矶派出所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100392', '219535', '吴天真', '吴天真', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局马群派出所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100393', '216993', '吴伟祖', '吴伟祖', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞区看守所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100394', '017020', '吴文庆', '吴文庆', '111111', 'default-1.jpg', null, null, null, null, '0', '尧化门派出所尧胜责任区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100395', '216959', '吴兴', '吴兴', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局指挥室', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100396', '217220', '吴政希', '吴政希', '111111', 'default-1.jpg', null, null, null, null, '0', '仙林派出所刑侦责任区中队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100397', '211474', '武星晨', '武星晨', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局仙林派出所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100398', '017015', '夏文林', '夏文林', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局经侦大队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100399', '217173', '夏小敏', '夏小敏', '111111', 'default-1.jpg', null, null, null, null, '0', '马群派出所紫金责任区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100400', '217042', '项信东', '项信东', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞区看守所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100401', '210390', '谢承慧', '谢承慧', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局迈皋桥派出所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100402', '016992', '熊福生', '熊福生', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局八卦洲派出所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100403', '217002', '徐超', '徐超', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局刑警大队办案指导中队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100404', '217236', '徐辰昀', '徐辰昀', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局马群派出所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100405', '216996', '徐春友', '徐春友', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局特巡警大队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100406', '217235', '徐丹', '徐丹', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局靖安派出所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100407', '214866', '徐风雷', '徐风雷', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局指挥室', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100408', '217061', '徐国栋', '徐国栋', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局刑警大队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100409', '017128', '徐进', '徐进', '111111', 'default-1.jpg', null, null, null, null, '0', '迈皋桥派出所迈东片巡区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100410', '017229', '徐静', '徐静', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局靖安派出所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100411', '015173', '徐静', '徐静', '111111', 'default-1.jpg', null, null, null, null, '0', '仙林派出所文澜路第三责任区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100412', '219523', '徐静文', '徐静文', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局尧化门派出所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100413', '017155', '徐娟', '徐娟', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局人口管理大队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100414', '217190', '徐康', '徐康', '111111', 'default-1.jpg', null, null, null, null, '0', '尧化门刑侦责任区中队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100415', '017138', '徐仁', '徐仁', '111111', 'default-1.jpg', null, null, null, null, '0', '马群派出所马群社区责任区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100416', '217033', '徐锐', '徐锐', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局马群派出所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100417', '217099', '徐森', '徐森', '111111', 'default-1.jpg', null, null, null, null, '0', '燕子矶刑侦责任区中队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100418', '217184', '徐祥意', '徐祥意', '111111', 'default-1.jpg', null, null, null, null, '0', '迈皋桥刑侦责任区中队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100419', '017030', '徐翔', '徐翔', '111111', 'default-1.jpg', null, null, null, null, '0', '尧化门派出所尧辰责任区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100420', '017045', '徐晓', '徐晓', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局反恐怖工作大队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100421', '214120', '徐晓雯', '徐晓雯', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局人口管理大队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100422', '016769', '徐孝全', '徐孝全', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局栖霞派出所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100423', '217023', '徐秀红', '徐秀红', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局人口管理大队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100424', '216948', '徐雪琪', '徐雪琪', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局八卦洲派出所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100425', '017080', '许光宁', '许光宁', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局单位内部安全保卫大队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100426', '017071', '许华忠', '许华忠', '111111', 'default-1.jpg', null, null, null, null, '0', '摄山派出所治安巡逻责任区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100427', '216997', '许久', '许久', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局刑警大队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100428', '217063', '薛峰', '薛峰', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局政治工作办公室', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100429', '012752', '薛永保', '薛永保', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局单位内部安全保卫大队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100430', '217158', '严斌', '严斌', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局刑警大队刑事科学技术室', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100431', '017055', '严俊', '严俊', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局经侦大队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100432', '217196', '杨波', '杨波', '111111', 'default-1.jpg', null, null, null, null, '0', '八卦洲刑侦责任区中队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100433', '217035', '杨传旭', '杨传旭', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局治安大队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100434', '217181', '杨春雷', '杨春雷', '111111', 'default-1.jpg', null, null, null, null, '0', '仙林派出所南大责任区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100435', '216976', '杨登湘', '杨登湘', '111111', 'default-1.jpg', null, null, null, null, '0', '尧化门派出所尧安责任区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100436', '017027', '杨国龙', '杨国龙', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞派出所江南水泥厂责任区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100437', '017125', '杨洁', '杨洁', '111111', 'default-1.jpg', null, null, null, null, '0', '迈皋桥派出所金山花苑责任区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100438', '210901', '杨磊', '杨磊', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局仙林派出所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100439', '017047', '杨鸣', '杨鸣', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞刑侦责任区中队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100440', '017089', '杨琴', '杨琴', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局人口管理大队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100441', '217230', '杨权', '杨权', '111111', 'default-1.jpg', null, null, null, null, '0', '尧化门刑侦责任区中队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100442', '216944', '杨如潮', '杨如潮', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局人口管理大队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100443', '017206', '杨仕平', '杨仕平', '111111', 'default-1.jpg', null, null, null, null, '0', '龙潭派出所中国厂责任区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100444', '017095', '杨涛', '杨涛', '111111', 'default-1.jpg', null, null, null, null, '0', '龙潭派出所花园责任区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100445', '219526', '杨天衡', '杨天衡', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局马群派出所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100446', '017081', '杨同生', '杨同生', '111111', 'default-1.jpg', null, null, null, null, '0', '燕子矶派出所燕石责任区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100447', '217100', '杨威青', '杨威青', '111111', 'default-1.jpg', null, null, null, null, '0', '尧化门派出所尧化巡区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100448', '217197', '杨贤武', '杨贤武', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局特巡警大队三中队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100449', '017196', '杨新保', '杨新保', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局龙潭派出所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100450', '217199', '杨贞', '杨贞', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局政治工作办公室', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100451', '017177', '杨正斌', '杨正斌', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞派出所栖霞街巡区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100452', '012835', '杨志祥', '杨志祥', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局摄山派出所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100453', '016951', '杨忠', '杨忠', '111111', 'default-1.jpg', null, null, null, null, '0', '龙潭派出所江畔人家责任区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100454', '217008', '姚涛', '姚涛', '111111', 'default-1.jpg', null, null, null, null, '0', '仙林派出所仙林新村巡区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100455', '011972', '姚小勇', '姚小勇', '111111', 'default-1.jpg', null, null, null, null, '0', '燕子矶派出所治安巡逻责任区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100456', '010455', '姚旭峰', '姚旭峰', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局仙林派出所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100457', '210553', '姚雪垠', '姚雪垠', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局摄山派出所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100458', '017057', '叶波', '叶波', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局经侦大队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100459', '217020', '易金龙', '易金龙', '111111', 'default-1.jpg', null, null, null, null, '0', '尧化门派出所治安巡逻责任区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100460', '217172', '殷桂琴', '殷桂琴', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局迈皋桥派出所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100461', '211454', '殷其辉', '殷其辉', '111111', 'default-1.jpg', null, null, null, null, '0', '迈皋桥刑侦责任区中队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100462', '017213', '应宗根', '应宗根', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞区看守所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100463', '217098', '尤峰', '尤峰', '111111', 'default-1.jpg', null, null, null, null, '0', '迈皋桥派出所季家街责任区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100464', '217094', '于群', '于群', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局栖霞派出所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100465', '217083', '于文堂', '于文堂', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局刑警大队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100466', '017014', '于晓光', '于晓光', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局治安大队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100467', '019510', '虞雪', '虞雪', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局食药环犯罪侦查大队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100468', '210614', '禹璐', '禹璐', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局法制科', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100469', '217057', '喻彬', '喻彬', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局治安大队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100470', '217095', '原征', '原征', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局政治工作办公室', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100471', '217120', '袁阿崴', '袁阿崴', '111111', 'default-1.jpg', null, null, null, null, '0', '摄山刑侦责任区中队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100472', '017168', '袁爱国', '袁爱国', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞派出所新张责任区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100473', '217121', '袁本超', '袁本超', '111111', 'default-1.jpg', null, null, null, null, '0', '摄山刑侦责任区中队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100474', '217228', '袁栋杰', '袁栋杰', '111111', 'default-1.jpg', null, null, null, null, '0', '龙潭派出所刑侦责任区中队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100475', '217136', '苑志彪', '苑志彪', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞派出所五福家园责任区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100476', '016973', '岳海兰', '岳海兰', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局人口管理大队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100477', '017230', '曾德中', '曾德中', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞区看守所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100478', '217180', '曾光辉', '曾光辉', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局巡特警大队迈皋桥警务工作服务站', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100479', '017086', '曾辉', '曾辉', '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞分局燕子矶派出所', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100480', '010512', '曾卫方', '曾卫方', '111111', 'default-1.jpg', null, null, null, null, '0', '马群派出所新街巡区', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100481', '017004', '詹从义', '詹从义', '111111', 'default-1.jpg', null, null, null, null, '0', '燕子矶刑侦责任区中队', '0', '2', '2017-04-08 18:07:55', '2017-04-08 18:07:55');
INSERT INTO `user` VALUES ('100482', 'admin', 'admin', 'admin', '111111', 'default-1.jpg', null, null, null, null, '0', '管理员', '0', '2', '2017-04-16 13:25:26', '2017-04-16 13:25:26');
INSERT INTO `user` VALUES ('100483', '100023', '这只是测试', null, '111111', 'default-1.jpg', null, null, null, null, '0', '栖霞公安分局', '0', '2', '2017-05-18 21:33:00', '2017-05-18 21:33:00');
INSERT INTO `user` VALUES ('100485', '100024', '这还是一个测试', '马雄', '125011', 'default-1.jpg', null, null, null, null, '0', '招银网络科技（杭州）有限公司', '0', '2', '2017-05-18 21:34:54', '2017-05-18 21:34:54');
INSERT INTO `user` VALUES ('100487', '100025', '最后的测试', '希望是', '125011', 'default-1.jpg', null, null, null, null, '0', '招商银行', '0', '2', '2017-05-18 21:41:09', '2017-05-18 21:41:09');
INSERT INTO `user` VALUES ('100489', '100026', '还是测试', '我也是', '123456789', 'default-3.jpg', null, null, null, null, '0', '招商银行软件中心', '0', '2', '2017-05-18 21:42:33', '2017-05-18 21:43:21');

-- ----------------------------
-- Table structure for `user_focus`
-- ----------------------------
DROP TABLE IF EXISTS `user_focus`;
CREATE TABLE `user_focus` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '用户关注表ID',
  `focus_on` int(12) NOT NULL COMMENT '被关注人ID',
  `user_id` int(12) NOT NULL COMMENT '关注人ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '关注时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_focus
-- ----------------------------

-- ----------------------------
-- Table structure for `user_picture`
-- ----------------------------
DROP TABLE IF EXISTS `user_picture`;
CREATE TABLE `user_picture` (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '头像表ID',
  `name` varchar(200) NOT NULL COMMENT '图片名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_picture
-- ----------------------------
INSERT INTO `user_picture` VALUES ('1', 'default-1.jpg');
INSERT INTO `user_picture` VALUES ('2', 'default-2.jpg');
INSERT INTO `user_picture` VALUES ('3', 'default-3.jpg');

-- ----------------------------
-- Table structure for `user_praise`
-- ----------------------------
DROP TABLE IF EXISTS `user_praise`;
CREATE TABLE `user_praise` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '用户点赞表ID',
  `praise_on` int(12) NOT NULL COMMENT '被点赞人ID',
  `user_id` int(12) NOT NULL COMMENT '点赞人ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '点赞时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_praise
-- ----------------------------
