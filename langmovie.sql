/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50635
Source Host           : localhost:3306
Source Database       : langmovie

Target Server Type    : MYSQL
Target Server Version : 50635
File Encoding         : 65001

Date: 2019-04-26 18:11:33
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `cinema`
-- ----------------------------
DROP TABLE IF EXISTS `cinema`;
CREATE TABLE `cinema` (
  `pk_cinemaid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cinema_name` char(80) NOT NULL,
  `city` char(60) DEFAULT NULL,
  `province` char(60) DEFAULT NULL,
  `country` char(60) DEFAULT NULL,
  `location` varchar(80) DEFAULT NULL,
  `money` float NOT NULL DEFAULT '0',
  `gmt_create` datetime NOT NULL,
  `gmt_modified` datetime NOT NULL,
  PRIMARY KEY (`pk_cinemaid`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cinema
-- ----------------------------
INSERT INTO `cinema` VALUES ('1', '浪浪影院', '长沙市', '湖南', null, '湖南大学东门', '5393.5', '2019-04-11 07:27:33', '2019-04-26 17:02:54');
INSERT INTO `cinema` VALUES ('4', '浪浪影院', '株洲市', '湖南', null, null, '0', '2019-04-11 08:10:09', '2019-04-11 08:10:09');
INSERT INTO `cinema` VALUES ('5', '横店影院', '长沙市', '湖南', null, '中南大学南门', '824', '2019-04-16 09:34:49', '2019-04-16 09:34:53');
INSERT INTO `cinema` VALUES ('6', '横店影院', '湘潭市', '湖南', null, null, '0', '2019-04-16 09:37:00', '2019-04-16 09:37:03');
INSERT INTO `cinema` VALUES ('7', '横店影院', '衡阳市', '湖南', null, null, '0', '2019-04-16 09:39:44', '2019-04-16 09:39:47');
INSERT INTO `cinema` VALUES ('8', '横店影院', '株洲市', '湖南', null, null, '0', '2019-04-16 09:40:47', '2019-04-16 09:40:50');
INSERT INTO `cinema` VALUES ('9', '浪浪影院', '齐齐哈尔市', '黑龙江', null, null, '0', '2019-04-17 09:45:56', '2019-04-17 09:45:59');
INSERT INTO `cinema` VALUES ('10', '浪浪影院', '七台河市', '黑龙江', null, null, '0', '2019-04-17 09:46:36', '2019-04-17 09:46:39');
INSERT INTO `cinema` VALUES ('11', '浪浪影院', '哈尔滨市', '黑龙江', null, null, '0', '2019-04-17 09:46:54', '2019-04-17 09:46:57');
INSERT INTO `cinema` VALUES ('12', '万达影院', '武汉市', '湖北', null, '武汉市万达广场', '100', '2019-04-22 12:21:17', '2019-04-22 12:21:33');
INSERT INTO `cinema` VALUES ('13', '大地影院', '石家庄市', '河北', null, '石家庄北', '0', '2019-04-22 12:29:28', '2019-04-23 12:29:33');
INSERT INTO `cinema` VALUES ('14', 'GVC影院', '南昌市', '江西', null, '南昌永丰路', '0', '2019-04-22 12:40:19', '2019-04-22 12:40:25');
INSERT INTO `cinema` VALUES ('15', '艺术影院', '深圳市', '广东', null, '深圳龙华区', '0', '2019-04-22 12:47:09', '2019-04-22 12:47:13');
INSERT INTO `cinema` VALUES ('16', '士力影院', '长沙市', '湖南', null, '中央卫视', '0', '2019-04-23 13:15:36', '2019-04-23 13:18:17');
INSERT INTO `cinema` VALUES ('17', '第一影院', null, null, null, null, '0', '2019-04-26 16:58:29', '2019-04-26 16:58:29');
INSERT INTO `cinema` VALUES ('18', '第一影院', null, null, null, null, '0', '2019-04-26 17:01:23', '2019-04-26 17:01:23');
INSERT INTO `cinema` VALUES ('19', '第一影院', null, null, null, null, '0', '2019-04-26 17:02:54', '2019-04-26 17:02:54');

-- ----------------------------
-- Table structure for `form`
-- ----------------------------
DROP TABLE IF EXISTS `form`;
CREATE TABLE `form` (
  `pk_formid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fk_screen` bigint(20) unsigned NOT NULL,
  `fk_user` bigint(20) unsigned NOT NULL,
  `seat_x` smallint(5) unsigned NOT NULL,
  `seat_y` smallint(5) unsigned NOT NULL,
  `code` char(150) NOT NULL,
  `gmt_create` datetime NOT NULL,
  `gmt_modified` datetime NOT NULL,
  PRIMARY KEY (`pk_formid`),
  KEY `fk_screen` (`fk_screen`),
  KEY `fk_user` (`fk_user`),
  CONSTRAINT `form_ibfk_1` FOREIGN KEY (`fk_screen`) REFERENCES `screen` (`pk_screenid`),
  CONSTRAINT `form_ibfk_2` FOREIGN KEY (`fk_user`) REFERENCES `user` (`pk_userid`)
) ENGINE=InnoDB AUTO_INCREMENT=174 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of form
-- ----------------------------

-- ----------------------------
-- Table structure for `manager`
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager` (
  `fk_user` bigint(20) unsigned NOT NULL,
  `fk_cinema` bigint(20) unsigned NOT NULL,
  `gmt_create` datetime NOT NULL,
  `gmt_modified` datetime NOT NULL,
  PRIMARY KEY (`fk_user`,`fk_cinema`),
  KEY `fk_cinema` (`fk_cinema`),
  CONSTRAINT `manager_ibfk_2` FOREIGN KEY (`fk_cinema`) REFERENCES `cinema` (`pk_cinemaid`),
  CONSTRAINT `manager_ibfk_3` FOREIGN KEY (`fk_user`) REFERENCES `user` (`pk_userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of manager
-- ----------------------------

-- ----------------------------
-- Table structure for `movie`
-- ----------------------------
DROP TABLE IF EXISTS `movie`;
CREATE TABLE `movie` (
  `pk_movieid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `movie_name` char(100) NOT NULL,
  `movie_release` datetime DEFAULT NULL,
  `introduction` varchar(800) DEFAULT NULL,
  `post` varchar(150) DEFAULT NULL,
  `grade` float DEFAULT NULL,
  `movie_type` char(20) DEFAULT NULL,
  `gmt_create` datetime NOT NULL,
  `gmt_modified` datetime NOT NULL,
  `prefix` text,
  `other_info` char(100) DEFAULT NULL,
  PRIMARY KEY (`pk_movieid`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of movie
-- ----------------------------
INSERT INTO `movie` VALUES ('1', '反贪风暴4', '2019-04-04 00:00:00', '廉政公署收到报案人廖雨萍（周秀娜 饰）的实名举报，举报正在坐牢的富二代曹元元（林峯 饰）涉嫌行贿监狱里的监督沈济全（谭耀文 饰）以及惩教员，首席调查主任陆志廉（古天乐 饰）决定深入虎穴，卧底狱中。在监狱里，被陆志廉送入监狱的前警司黄文彬（林家栋 饰）以及曹元元两大帮派势成水火，陆志廉趁机接近曹元元取得信任。同时监狱外的廉政公署总调查主任程德明（郑嘉颖 饰）、国内反贪局行动处处长洪亮（丁海峰 饰）也陆港联手，通力合作，最终成功破获贪腐行贿大案。', 'https://withyan.cn/images/1.jpg', '7.9', '剧情,动作,犯罪', '2019-04-10 21:30:16', '2019-04-26 17:02:58', null, '中国香港,中国大陆 / 98分钟');
INSERT INTO `movie` VALUES ('2', '欲念游戏', '2019-04-12 00:00:00', '近未来，一代叱咤智能科技领域的风云人物郭实（郭涛 饰），在经历丧女之痛后决定远离尘嚣，终日与智能机器人相伴。但一次意外的发生，郭实莫名沦为“杀人逃犯”，并一步步落入对方所设的陷阱中。为证清白，郭实重拾“化蝶系统”，与爱徒飞凡（姜潮 饰）和机械发烧友萌萌（张子枫 饰）联手追查真凶。在探寻真相的过程中，郭实发现妻子宁雪（梅婷 饰）和好兄弟老查（范伟 饰）与此事有着千丝万缕的联系，但逐渐被视觉致幻的他开始难辨真假虚实，一场有关科技的烧脑战役呼之欲开。', 'https://withyan.cn/images/2.jpg', null, '悬疑,犯罪,剧情', '2019-04-10 21:30:35', '2019-04-10 21:30:35', null, '中国大陆 / 109分钟');
INSERT INTO `movie` VALUES ('3', '最佳男友进化论', '2019-04-12 00:00:00', '情场老司机范凡（郑恺 饰）在机缘巧合之下决定开办一个“男神训练营”，用自己独到的恋爱心得助那些在爱情里苦求不得的单身狗们进化成“最佳男友”。一场婚礼上的“实践教学”让伴娘女神（张雨绮 饰）被套路之下的真心打动，几个徒弟都拥有了梦寐以求的爱情。但作为“专家”范凡自己的感情生活却是剪不断理还乱……', 'https://withyan.cn/images/3.jpg', null, '爱情,喜剧', '2019-04-10 21:32:43', '2019-04-10 21:32:43', null, '中国香港 / 90分钟');
INSERT INTO `movie` VALUES ('4', '调音师', '2019-04-03 00:00:00', '影片讲述了一直假装盲人的钢琴调音师阿卡什（阿尤斯曼·库拉纳 饰），在意外成为一起凶杀案的“目击证人”后，所遭遇的种种出其不意的经历。', 'https://withyan.cn/images/4.jpg', null, '悬疑,犯罪,喜剧', '2019-04-10 21:33:09', '2019-04-10 21:33:09', null, '印度 / 137分钟');
INSERT INTO `movie` VALUES ('5', '祈祷落幕时', '2019-04-12 00:00:00', '在东京都葛饰区小菅的某座公寓里，发现了一具被勒死的女性遗体。被害者是在清洁公司上班、住在滋贺县的押谷道子（中岛博子 饰）。而杀人现场的住户越川睦夫也下落不明。而以松宫（沟端淳平 饰）等警视厅搜查一科的刑警们查不出越川与押谷道子有何交集，案件调查陷入困境。尽管查明押谷道子是为了拜访她的同学，即导演浅居博美（松岛菜菜子 饰）才来东京的，但博美与越川之间也找不出什么交集。这时，案发地点附近发现了被烧死的尸体，松宫怀疑两者有关联。从遗物中，发现了写有日本桥周围12座桥名的文字。知道此事后加贺恭一郎（阿部宽 饰）非常激动，因为那东西与他的亡母大有关联。', 'https://withyan.cn/images/5.jpg', null, '剧情,悬疑,犯罪', '2019-04-10 21:33:37', '2019-04-10 21:33:37', null, '日本 / 119分钟');
INSERT INTO `movie` VALUES ('6', '在乎你', '2019-04-12 00:00:00', '国内知名女设计师袁元（俞飞鸿 饰），日本留学归国，气质出众，事业成功，多年的合伙人雷明也对她照顾有加。然而，看似人生赢家的袁元，内心深处却始终隐藏着一个难以放下的心结。在遇到事业瓶颈时，一位日本女孩（木下彩音 饰）的突然出现打破了袁元原本风平浪静的生活，一段关于北海道的神秘往事也随之展开……', 'https://withyan.cn/images/6.jpg', '7.8', '剧情', '2019-04-11 07:11:35', '2019-04-11 07:11:35', null, '中国大陆 / 120分钟');
INSERT INTO `movie` VALUES ('7', '雷霆沙赞！', '2019-04-05 00:00:00', '每个人身体里都潜藏着一位超级英雄，只需要一点魔力便能将其释放。14岁的街头小混混比利·巴特森(亚瑟·安其 饰)通过大喊“沙赞”这个词，就可以变身为成年超级英雄沙赞(扎克瑞·莱维 饰)，这是一种来自于古老巫师的恩惠。如神一般的肌肉身体里，仍存有一颗孩子心，他开心地与超能力为伴。他能飞吗？他能X光透视吗？他能从手中射出闪电吗？他能不用再考试了吗？沙赞以孩子般轻率又鲁莽的方式，开始测试他的能力极限。但他需要尽快掌握这些力量，以对抗塞迪斯·希瓦纳博士（马克·斯特朗 饰）控制的邪恶势力。', 'https://withyan.cn/images/7.jpg', '7.8', '动作,冒险,奇幻', '2019-04-11 21:16:50', '2019-04-11 21:16:50', null, '美国 / 132分钟');
INSERT INTO `movie` VALUES ('8', '我的宠物是大象', '2019-04-12 00:00:00', '以大象表演为生计的马戏团老板老齐（刘青云 饰），为了能让大象吃到足够的象草，与刁蛮任性的千金大小姐杰西卡（尤婧茹 饰）斗智斗勇，其间发生的故事和欢喜情缘，是一部治愈又充满诗意内涵的成人童话。', 'https://withyan.cn/images/8.jpg', null, '剧情,喜剧', '2019-04-11 21:17:39', '2019-04-11 21:17:39', null, '中国大陆 / 109分钟');
INSERT INTO `movie` VALUES ('9', '老师·好', '2019-03-22 00:00:00', '1985年的南宿一中，苗宛秋（于谦 饰）老师推自行车昂首走在校园，接受着人们艳羡的目光和纷至沓来的恭维。 桀傲不驯的洛小乙（王广源 饰）、温婉可人的安静（汤梦佳 饰）、新潮前卫的关婷婷（秦鸣悦 饰）、大智若愚的脑袋、舞痴兄弟文明（郝鹏飞 饰）建设（郜玄铭 饰）、八婆海燕（徐紫茵 饰）、奸商耗子（孙艺杨 饰）……三班是一个永远也不缺故事的集体。 苗宛秋怎么也不会想到，他即将走进的这个三班将会成为他以及他身边这辆自行车的噩梦。三班的同学也没有想到，这位新来的老师改变了他们的一生。', 'https://withyan.cn/images/9.jpg', '9.3', '剧情,喜剧', '2019-04-11 21:20:26', '2019-04-11 21:20:26', null, '中国大陆 / 111分钟');
INSERT INTO `movie` VALUES ('10', '暗语者', '2019-04-12 00:00:00', '哥哥孙义（罗立群 饰）和弟弟孙礼（高赫一 饰）都是反清分子，一场暗杀行动失败导致弟弟远走异乡，而哥哥为了生存，成为清政府的一名地下狙击手。多年后，俩兄弟再次相遇在暗杀行动中，亦似兄弟，亦似仇人，俩人必须做出艰难的选择。', 'https://withyan.cn/images/10.jpg', null, '悬疑,动作,爱情', '2019-04-12 10:44:38', '2019-04-12 10:44:38', '', '中国大陆 / 99分钟');
INSERT INTO `movie` VALUES ('11', '虫林大作战', '2019-04-13 00:00:00', '流浪艺术家蟋蟀阿波罗（贾斯汀·朗 配音）来到了一个神秘的花园，阿波罗想要获得留在花园的资格，却险些遭到邪恶黄蜂温迪的陷害。有一天，他遇见了美丽蜂后玛格丽特（Anne Tilloy 配音），他们一起唱歌散步，结果土匪飞蛾斯芬克斯带着一帮害虫绑架了蜂后。邪恶黄蜂温迪趁机登上王位。 阿波罗为了证明自己更为了救出被温迪绑架的玛格丽特，它带着蜂后的好朋友们和温迪斗智斗勇，一场争夺王位、保卫花园的战斗即将开始……', 'https://withyan.cn/images/11.jpg', null, '喜剧,动画,冒险', '2019-04-12 10:49:04', '2019-04-12 10:49:04', '', '法国 / 84分钟');
INSERT INTO `movie` VALUES ('12', '如影随心', '2019-04-19 00:00:00', '小提琴家陆松（陈晓 饰）与室内设计师文罂（杜鹃 饰）巴黎邂逅，不打不相识，彼此迷恋越陷越深。爱情之名怂恿着他们为爱再大胆一次，走出各自问题满满的情感关系。仿佛只要现任变前任，幸福就唾手可得。然而前任们也都是战士，文罂的前任郑可（华少 饰）是个理性至极的医生，陆松的前任刘娟（马苏 饰）则在情感社区开启了喋喋不休的骂战，是继续坚持对爱的信仰，还是选择放下与原谅重新开始？现代都市情感危机在北京与巴黎街头上演。越是深爱的，往往也正是痛苦的源头，爱情，像是影子，抓不住却也离不开，如影随心……', 'https://withyan.cn/images/12.jpg', null, '爱情', '2019-04-12 11:13:15', '2019-04-12 11:13:18', null, '中国大陆 / 96分钟');
INSERT INTO `movie` VALUES ('13', '境·界', '2019-04-19 00:00:00', '从小异于常人的黑崎一护（福士苍汰 饰），在一次机缘巧合下遭遇女死神“朽木露琪亚”（杉咲花 饰）。 露琪亚是将灵魂从现实世界引领到尸魂界的收魂者之一，他们为保护人类 不被“虚” 侵害，一直在与这些怪物战斗。在与一只异常强大的“虚” 战斗时，露琪亚身负重伤，无奈只能将死神 的力量暂时转给黑崎一护，让其代为战斗。两人经过一段时间的磨合后并肩战斗，终于战胜了当年害死一护母亲的“虚”，但在这期间，露琪亚的兄长朽木白哉（石原贵雅 饰）强迫她不顾黑崎一护的生命安危收回法力。露琪亚为保护一护，拖延到与“虚”的战斗结束，并清除了一护的记忆……', 'https://withyan.cn/images/13.jpg', null, '动作,奇幻,冒险,动画', '2019-04-12 11:16:06', '2019-04-12 11:16:06', '', '日本 / 108分钟');
INSERT INTO `movie` VALUES ('14', '毕业旅行之逍遥骑士', '2019-04-19 00:00:00', '高考落榜的文艺少年杨风（张朔祯 饰）梦想成为一个“嬉皮士”浪子，并誓要在毕业旅行中完成自己的浪子清单：打架、泡妞、吸烟喝酒、打坐冥想、和摇滚歌手交朋友……他在好友陈火（赵一凡 饰）的相助下伪装成“逍遥骑士”，想借助漂亮师姐思思（安紫依 饰）完成自己的“破处之旅”，却没想到思思也暗藏自己的“少女成人计划”，“逍遥路上”演绎啼笑皆非的动人故事。', 'https://withyan.cn/images/14.jpg', null, '青春,喜剧,冒险', '2019-04-12 11:16:07', '2019-04-12 11:16:07', '', '中国大陆 / 90分钟');
INSERT INTO `movie` VALUES ('15', '小飞象', '2019-03-29 00:00:00', '在马戏团老板麦克斯·美第奇（丹尼·德维托 饰）雇佣下，过气马戏明星霍尔特·法瑞尔（柯林·法瑞尔 饰）与儿女米莉（妮可·帕克 饰）和乔（芬利·霍宾斯 饰）一起，照顾刚出生就因耳朵巨大而受到嘲笑的小飞象。当三人发现小飞象真的会飞时，原本苦苦挣扎的马戏团重获新生，也招来企业家V.A.范德维尔（迈克尔·基顿 饰）的注意，邀请小飞象加入他旗下不同凡响的游乐设施，梦想王国。在那里，小飞象与迷人的空中杂技演员柯蕾特·马尔尚（爱娃·格林 饰）一起展翅高飞，但霍尔特却发现梦想王国光鲜的外表之下，藏着无数黑暗的秘密。', 'https://withyan.cn/images/15.jpg', '9', '动画,奇幻,家庭', '2019-04-12 11:16:07', '2019-04-12 11:16:07', '', '美国 / 112分钟');
INSERT INTO `movie` VALUES ('16', '难以置信', '2019-04-11 00:00:00', '正值高考前的小东(吴超 饰)原本有一个完美的家庭，命运突如其来的打击，让小东的生活发生了巨变。父亲(刘之冰 饰)意外离世，小东十分悲痛；母亲(剧雪 饰)的选择，让他困惑，迷茫；好友小曼(周也 饰)和幺儿的人生境遇让他难以置信... ...生活竟如此复杂！这一切似乎与自己有关联，他必须面对，他在和命运抗争！同时，他还发现自己的家庭隐藏着不为人知的秘密，他执着地去寻觅真相……', 'https://withyan.cn/images/16.jpg', null, '爱情,青春', '2019-04-12 11:16:07', '2019-04-12 11:16:07', '', '中国大陆 / 95分钟');
INSERT INTO `movie` VALUES ('17', '比悲伤更悲伤的故事', '2019-03-14 00:00:00', '唱片制作人张哲凯（刘以豪 饰）和王牌作词人宋媛媛（陈意涵 饰）相依为命，两人自幼身世坎坷只有彼此为伴，他们是亲人、是朋友，也彷佛是命中注定的另一半。父亲罹患遗传重症而被母亲抛弃的哲凯，深怕自己随时会发病不久人世，始终没有跨出友谊的界线对媛媛展露爱意。眼见哲凯的病情加重，他暗自决定用剩余的生命完成他们之间的终曲，再为媛媛找个可以托付一生的好男人。这时，事业有成温柔体贴的医生（张书豪 饰）适时的出现让他成为照顾媛媛的最佳人选，二人按部就班发展着关系。一切看似都在哲凯的计划下进行。然而，故事远比这里所写更要悲伤......', 'https://withyan.cn/images/17.jpg', '8', '剧情,爱情', '2019-04-12 11:16:07', '2019-04-12 11:16:07', '', '中国台湾 / 107分钟');
INSERT INTO `movie` VALUES ('18', '青蛙王子历险记', '2019-04-05 00:00:00', '自大的王子赛维中了女巫的诡计，被变成一只青蛙。误打误撞中他与凡迪卡成为了好朋友，一起踏上寻找破解魔法的旅程。 面对穷追不舍的鼠骑士，看似牢不可破的“同盟”渐渐有了裂痕，赛维与凡迪卡会如何应对？女巫的阴谋能否得逞？', 'https://withyan.cn/images/18.jpg', '7.4', '喜剧,动画,冒险,家庭', '2019-04-12 11:16:07', '2019-04-12 11:16:07', '', '中国大陆 / 82分钟');
INSERT INTO `movie` VALUES ('19', '波西米亚狂想曲', '2019-03-22 00:00:00', '佛莱德·摩克瑞（拉米·马雷克 饰）曾是希思罗机场的一名普通搬运工，对音乐满腔热血的他，与布莱恩·梅（格威利姆·李 饰）、罗杰·泰勒（本·哈迪 饰）、约翰·迪肯（约瑟夫·梅泽罗 饰）组成皇后乐队。这个殿堂级乐队的从无到有，从疏离到重聚，从低谷到巅峰，仿佛就是佛莱德一生的缩影。在最后的日子里，佛莱德做了生命中最重要的决定——在音乐史上最伟大的“拯救生命”大型摇滚乐演唱会上，将所有热血付诸于歌声。', 'https://withyan.cn/images/19.jpg', '9.5', '剧情,音乐,传记', '2019-04-12 11:16:07', '2019-04-12 11:16:07', '', '英国,美国 / 131分钟');
INSERT INTO `movie` VALUES ('20', '海市蜃楼', '2019-03-28 00:00:00', '25年前一个风暴将至的夜晚，小男孩尼克目睹了邻居杀妻的全过程，被凶手发现的他在逃跑途中被车撞死。尼克死去25年后，幸福的已婚妇女维拉（阿德丽安娜·尤加特 饰）搬进了尼克住过的这所房子。一场和25年前一样的风暴让两段时空交错，惊醒的维拉发现自己竟能与电视机里的尼克跨时空对话。维拉透过电视机试图挽救这个男孩的性命，却引发一系列连锁反应——女儿消失、丈夫和身边的人全都不再认识和相信自己。于是，维拉只能在风暴消失前有限的15小时里，与唯一相信她的莱拉警长（奇诺·达林 饰）解开所有谜团……', 'https://withyan.cn/images/20.jpg', '8.7', '悬疑,科幻,爱情', '2019-04-12 11:16:07', '2019-04-12 11:16:07', '', '西班牙 / 129分钟');
INSERT INTO `movie` VALUES ('21', '风中有朵雨做的云', '2019-04-04 00:00:00', '沿海小城，年轻警官杨家栋（井柏然 饰）初来乍到，恰遇建委主任唐奕杰（张颂文 饰）坠楼身亡，杨家栋展开调查，惨遭革职、追杀，一路逃往香港，与死者女儿小诺（马思纯 饰）意外邂逅，在小诺的协助下继续追查，浑然不觉自己正落入一个纯情陷阱。', 'https://withyan.cn/images/21.jpg', '6.9', '剧情,悬疑,犯罪', '2019-04-12 11:16:07', '2019-04-12 11:16:07', '', '中国大陆 / 124分钟');
INSERT INTO `movie` VALUES ('22', '原来如此\r\n', '2019-04-12 00:00:00', '午夜的宿舍楼内，传来鬼魅的唱戏声，那声音竟然来自已经死去的剧团女主演！全楼居民极度恐慌。年轻人陆离（池丹 饰）和哥们儿一起调查女鬼真相，却越陷越深，先是剧团化妆师被女鬼附身，离奇丧命，紧接着哥们儿也惊吓过度，疯癫死亡，外地来的老母亲再度被女鬼纠缠，陆离本人也一次次被鬼魅侵袭！一连串惊心动魄的奇情怪事之后，当夜半戏声再次飘起，最令人胆寒的时刻终于来临……', 'https://withyan.cn/images/22.jpg', null, '惊悚,悬疑,恐怖', '2019-04-12 11:50:01', '2019-04-12 11:50:03', null, '中国大陆 / 83分钟');
INSERT INTO `movie` VALUES ('23', '转型团伙', '2019-04-19 00:00:00', '过气影帝宇哥（吴镇宇 饰）与当红童星费曼（费曼 饰）因一场拍摄意外而陷入黑帮纷争的故事。失忆的宇哥意外“入戏”，以为自己就是真正的社团大哥，为了赚钱照顾儿子决定重出江湖，殊不知时代已经改变，引发一连串令人啼笑皆非的乌龙事件，更上演了险象环生的黑帮纷争……', 'https://withyan.cn/images/23.jpg', null, '剧情,喜剧,动作', '2019-04-12 11:52:07', '2019-04-12 11:52:10', null, '中国大陆 / 90分钟');
INSERT INTO `movie` VALUES ('24', '一个母亲的复仇', '2019-05-10 00:00:00', '本片改编自震惊印度的“德里黑公交案”。艾莉亚（萨佳·阿里 饰）在一次派对活动后遭到强暴，面对凿凿证据，四名罪犯却被法庭判为无罪。艾莉亚的继母，戴维琪（希里黛玉 饰）伤心欲绝，在走投无路后愤然决定亲手为女儿寻求正义。一场高能高智商的复仇大戏拉开序幕。正义到不了的地方，还有母亲！', 'https://withyan.cn/images/24.jpg', null, '剧情,犯罪', '2019-04-12 11:53:41', '2019-04-12 11:53:41', null, '印度 / 146分钟');
INSERT INTO `movie` VALUES ('25', '神奇乐园历险记', '2019-04-19 00:00:00', '古灵精怪的十二岁女孩朱妮（Sofia Mali 配音），偶然间她发现了一座神奇的乐园。小朱妮在乐园里遇到了憨厚可掬的蓝熊布默（肯·哈德森·坎贝尔 配音），善良的疣猪格里塔（米拉·库尼斯 配音），贫嘴的豪猪史蒂夫（约翰·奥利弗 配音），滑稽搞笑的海狸兄弟库珀（郑肯 配音）和格斯（基南·汤普森 配音），充满奇幻想象力的首领和乐园里炙手可热的动物明星猴子花生，并很快和它们成为朋友。这座隐藏在森林中的神奇乐园不仅有着形形色色的动物，还有很多惊险刺激的游乐设施。但从动物朋友口中，小朱妮得知乐园已经衰败无法运营。很快，小朱妮就意识到这座神奇乐园和她之前想象中的乐园一模一样。只有她能拯救这座已经没落的乐园。于是，她和动物朋友们组成了一只小分队，希望帮助乐园重现昔日繁华。', 'https://withyan.cn/images/19.jpg', null, '动画,冒险,喜剧', '2019-04-12 11:16:07', '2019-04-12 11:16:07', '', '美国,西班牙 / 85分钟\r\n');

-- ----------------------------
-- Table structure for `movie_actor`
-- ----------------------------
DROP TABLE IF EXISTS `movie_actor`;
CREATE TABLE `movie_actor` (
  `pk_actorid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fk_movieid` bigint(20) unsigned NOT NULL,
  `actor_url` varchar(150) NOT NULL,
  `gmt_create` datetime NOT NULL,
  `gmt_modified` datetime NOT NULL,
  `actor_name` char(50) DEFAULT NULL,
  `role_name` char(50) DEFAULT NULL,
  PRIMARY KEY (`pk_actorid`),
  KEY `movie_actor_ibfk_1` (`fk_movieid`),
  CONSTRAINT `movie_actor_ibfk_1` FOREIGN KEY (`fk_movieid`) REFERENCES `movie` (`pk_movieid`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of movie_actor
-- ----------------------------
INSERT INTO `movie_actor` VALUES ('17', '1', 'https://withyan.cn/images/role/1/1.jpg', '2019-04-12 20:02:06', '2019-04-12 20:02:06', '古天乐', '陆志廉');
INSERT INTO `movie_actor` VALUES ('18', '1', 'https://withyan.cn/images/role/1/2.jpg', '2019-04-12 20:02:07', '2019-04-12 20:02:07', '郑嘉颖', '程德明');
INSERT INTO `movie_actor` VALUES ('19', '1', 'https://withyan.cn/images/role/1/3.jpg', '2019-04-12 20:09:49', '2019-04-12 20:09:49', '林峯', '曹元元');
INSERT INTO `movie_actor` VALUES ('20', '1', 'https://withyan.cn/images/role/1/4.jpg', '2019-04-12 20:09:50', '2019-04-12 20:09:50', '林家栋', '黄文彬');
INSERT INTO `movie_actor` VALUES ('21', '1', 'https://withyan.cn/images/role/1/5.jpg', '2019-04-12 20:09:50', '2019-04-12 20:09:50', '周秀娜', '廖雨萍');
INSERT INTO `movie_actor` VALUES ('22', '1', 'https://withyan.cn/images/role/1/6.jpg', '2019-04-12 20:09:50', '2019-04-12 20:09:50', '张智霖', '刘保强');
INSERT INTO `movie_actor` VALUES ('23', '1', 'https://withyan.cn/images/role/1/7.jpg', '2019-04-12 20:09:50', '2019-04-12 20:09:50', '张继聪', '王蓝禄');
INSERT INTO `movie_actor` VALUES ('24', '1', 'https://withyan.cn/images/role/1/8.jpg', '2019-04-12 20:09:50', '2019-04-12 20:09:50', '谭耀文', '沈国强');
INSERT INTO `movie_actor` VALUES ('25', '1', 'https://withyan.cn/images/role/1/9.jpg', '2019-04-12 20:09:50', '2019-04-12 20:09:50', '廖启智', '姚君豪');
INSERT INTO `movie_actor` VALUES ('26', '1', 'https://withyan.cn/images/role/1/10.jpg', '2019-04-12 20:09:50', '2019-04-12 20:09:50', '夏嫣', '谭美莉');
INSERT INTO `movie_actor` VALUES ('27', '2', 'https://withyan.cn/images/role/2/1.jpg', '2019-04-12 20:50:08', '2019-04-12 20:50:08', '郭涛', '郭实');
INSERT INTO `movie_actor` VALUES ('28', '2', 'https://withyan.cn/images/role/2/2.jpg', '2019-04-12 20:50:09', '2019-04-12 20:50:09', '张子枫', '萌萌');
INSERT INTO `movie_actor` VALUES ('29', '2', 'https://withyan.cn/images/role/2/3.jpg', '2019-04-12 20:50:09', '2019-04-12 20:50:09', '姜潮', '飞凡');
INSERT INTO `movie_actor` VALUES ('30', '2', 'https://withyan.cn/images/role/2/4.jpg', '2019-04-12 20:50:09', '2019-04-12 20:50:09', '盖玥希', '梁丹');
INSERT INTO `movie_actor` VALUES ('31', '2', 'https://withyan.cn/images/role/2/5.jpg', '2019-04-12 20:50:09', '2019-04-12 20:50:09', '梅婷', '宁雪');
INSERT INTO `movie_actor` VALUES ('32', '2', 'https://withyan.cn/images/role/2/6.jpg', '2019-04-12 20:50:09', '2019-04-12 20:50:09', '范伟', '老查');
INSERT INTO `movie_actor` VALUES ('33', '2', 'https://withyan.cn/images/role/2/7.jpg', '2019-04-12 20:50:10', '2019-04-12 20:50:10', '王迅', '马丁博士');
INSERT INTO `movie_actor` VALUES ('34', '3', 'https://withyan.cn/images/role/3/1.jpg', '2019-04-12 21:03:18', '2019-04-12 21:03:18', '郑恺', '范凡');
INSERT INTO `movie_actor` VALUES ('35', '3', 'https://withyan.cn/images/role/3/2.jpg', '2019-04-12 21:03:18', '2019-04-12 21:03:18', '徐冬冬', '婉儿');
INSERT INTO `movie_actor` VALUES ('36', '3', 'https://withyan.cn/images/role/3/3.jpg', '2019-04-12 21:03:18', '2019-04-12 21:03:18', '张雨绮', '文静');
INSERT INTO `movie_actor` VALUES ('37', '3', 'https://withyan.cn/images/role/3/4.jpg', '2019-04-12 21:03:18', '2019-04-12 21:03:18', '方力申', '羞羞');
INSERT INTO `movie_actor` VALUES ('38', '3', 'https://withyan.cn/images/role/3/5.jpg', '2019-04-12 21:03:18', '2019-04-12 21:03:18', '林子聪', '巧克力');
INSERT INTO `movie_actor` VALUES ('39', '3', 'https://withyan.cn/images/role/3/6.jpg', '2019-04-12 21:03:18', '2019-04-12 21:03:18', '陈国珅', '牛晶');
INSERT INTO `movie_actor` VALUES ('40', '3', 'https://withyan.cn/images/role/3/7.jpg', '2019-04-12 21:03:18', '2019-04-12 21:03:18', '田蕾希', 'Angela lady');
INSERT INTO `movie_actor` VALUES ('41', '3', 'https://withyan.cn/images/role/3/8.jpg', '2019-04-12 21:03:18', '2019-04-12 21:03:18', '金刚', '大春');
INSERT INTO `movie_actor` VALUES ('42', '3', 'https://withyan.cn/images/role/3/9.jpg', '2019-04-12 21:03:18', '2019-04-12 21:03:18', '胡然', '娜娜');
INSERT INTO `movie_actor` VALUES ('43', '4', 'https://withyan.cn/images/role/4/1.jpg', '2019-04-12 21:09:23', '2019-04-12 21:09:23', '阿尤斯曼·库拉纳', 'Akash');
INSERT INTO `movie_actor` VALUES ('44', '4', 'https://withyan.cn/images/role/4/2.jpg', '2019-04-12 21:09:24', '2019-04-12 21:09:24', '塔布', 'Simi');
INSERT INTO `movie_actor` VALUES ('45', '4', 'https://withyan.cn/images/role/4/3.jpg', '2019-04-12 21:09:24', '2019-04-12 21:09:24', '拉迪卡·艾普特', 'Sofie');
INSERT INTO `movie_actor` VALUES ('46', '4', 'https://withyan.cn/images/role/4/4.jpg', '2019-04-12 21:09:24', '2019-04-12 21:09:24', '安尔·德霍万', 'Mrs. Rasika Ja');
INSERT INTO `movie_actor` VALUES ('47', '4', 'https://withyan.cn/images/role/4/5.jpg', '2019-04-12 21:09:24', '2019-04-12 21:09:24', '马纳夫·维吉', 'Inspector Mahendra');
INSERT INTO `movie_actor` VALUES ('48', '4', 'https://withyan.cn/images/role/4/6.jpg', '2019-04-12 21:09:24', '2019-04-12 21:09:24', '阿什维尼·卡尔塞卡', 'Mrs. Rasika Mahendra');
INSERT INTO `movie_actor` VALUES ('49', '4', 'https://withyan.cn/images/role/4/7.jpg', '2019-04-12 21:09:24', '2019-04-12 21:09:24', '田蕾希', 'Angela lady');
INSERT INTO `movie_actor` VALUES ('50', '4', 'https://withyan.cn/images/role/4/8.jpg', '2019-04-12 21:09:24', '2019-04-12 21:09:24', '查亚·卡达姆', 'Mavashi');
INSERT INTO `movie_actor` VALUES ('51', '5', 'https://withyan.cn/images/role/5/1.jpg', '2019-04-12 21:24:35', '2019-04-12 21:24:35', '阿部宽', '加贺恭一郎');
INSERT INTO `movie_actor` VALUES ('52', '5', 'https://withyan.cn/images/role/5/2.jpg', '2019-04-12 21:24:36', '2019-04-12 21:24:36', '松岛菜菜子', '浅居博美');
INSERT INTO `movie_actor` VALUES ('53', '5', 'https://withyan.cn/images/role/5/3.jpg', '2019-04-12 21:24:36', '2019-04-12 21:24:36', '沟端淳平', '松宫修平');
INSERT INTO `movie_actor` VALUES ('54', '5', 'https://withyan.cn/images/role/5/4.jpg', '2019-04-12 21:24:36', '2019-04-12 21:24:36', '饭丰万理江', '浅居博美');
INSERT INTO `movie_actor` VALUES ('55', '5', 'https://withyan.cn/images/role/5/5.jpg', '2019-04-12 21:24:36', '2019-04-12 21:24:36', '上杉祥三', '石垣');
INSERT INTO `movie_actor` VALUES ('56', '6', 'https://withyan.cn/images/role/6/1.jpg', '2019-04-12 21:38:30', '2019-04-12 21:38:30', '俞飞鸿', '袁元');
INSERT INTO `movie_actor` VALUES ('57', '6', 'https://withyan.cn/images/role/6/2.jpg', '2019-04-12 21:38:31', '2019-04-12 21:38:31', '大泽隆夫', '森岛富哉');
INSERT INTO `movie_actor` VALUES ('58', '6', 'https://withyan.cn/images/role/6/3.jpg', '2019-04-12 21:38:31', '2019-04-12 21:38:31', 'keiko', '木下彩音');
INSERT INTO `movie_actor` VALUES ('59', '6', 'https://withyan.cn/images/role/6/4.jpg', '2019-04-12 21:38:31', '2019-04-12 21:38:31', '前田公辉', '小森岛富哉');
INSERT INTO `movie_actor` VALUES ('60', '6', 'https://withyan.cn/images/role/6/5.jpg', '2019-04-12 21:38:31', '2019-04-12 21:38:31', '小袁元', '卢洋洋');
INSERT INTO `movie_actor` VALUES ('61', '6', 'https://withyan.cn/images/role/6/6.jpg', '2019-04-12 21:38:31', '2019-04-12 21:38:31', '美千代', '星由里子');
INSERT INTO `movie_actor` VALUES ('62', '7', 'https://withyan.cn/images/role/7/1.jpg', '2019-04-13 10:42:15', '2019-04-13 10:42:15', '扎克瑞·莱维', '沙赞 Shazam');
INSERT INTO `movie_actor` VALUES ('63', '7', 'https://withyan.cn/images/role/7/2.jpg', '2019-04-13 10:42:16', '2019-04-13 10:42:16', '希瓦纳博士', '马克·斯特朗');
INSERT INTO `movie_actor` VALUES ('64', '7', 'https://withyan.cn/images/role/7/3.jpg', '2019-04-13 10:42:16', '2019-04-13 10:42:16', '杰曼·翰苏', '巫师 The Wizard');
INSERT INTO `movie_actor` VALUES ('65', '7', 'https://withyan.cn/images/role/7/4.jpg', '2019-04-13 10:42:16', '2019-04-13 10:42:16', '亚瑟·安其', '比利·巴特森 Billy Batson');
INSERT INTO `movie_actor` VALUES ('66', '7', 'https://withyan.cn/images/role/7/5.jpg', '2019-04-13 10:42:16', '2019-04-13 10:42:16', '杰克·迪伦·格雷泽', '弗莱迪·弗里曼');
INSERT INTO `movie_actor` VALUES ('67', '7', 'https://withyan.cn/images/role/7/6.jpg', '2019-04-13 10:42:16', '2019-04-13 10:42:16', '约文·阿曼德', '佩德罗·佩纳');
INSERT INTO `movie_actor` VALUES ('68', '8', 'https://withyan.cn/images/role/8/1.jpg', '2019-04-13 11:08:45', '2019-04-13 11:08:45', '刘青云', '齐伟');
INSERT INTO `movie_actor` VALUES ('69', '8', 'https://withyan.cn/images/role/8/2.jpg', '2019-04-13 11:08:47', '2019-04-13 11:08:47', '尤靖茹', '杰西卡');
INSERT INTO `movie_actor` VALUES ('70', '8', 'https://withyan.cn/images/role/8/3.jpg', '2019-04-13 11:08:47', '2019-04-13 11:08:47', '孔维', '梦露');
INSERT INTO `movie_actor` VALUES ('71', '8', 'https://withyan.cn/images/role/8/4.jpg', '2019-04-13 11:08:47', '2019-04-13 11:08:47', '林雪', '老金');
INSERT INTO `movie_actor` VALUES ('72', '8', 'https://withyan.cn/images/role/8/5.jpg', '2019-04-13 11:08:47', '2019-04-13 11:08:47', '潘粤明', '杨乐');
INSERT INTO `movie_actor` VALUES ('73', '8', 'https://withyan.cn/images/role/8/6.jpg', '2019-04-13 11:08:47', '2019-04-13 11:08:47', '周知', '宋文');
INSERT INTO `movie_actor` VALUES ('74', '8', 'https://withyan.cn/images/role/8/7.jpg', '2019-04-13 11:08:47', '2019-04-13 11:08:47', '李晓川', '');
INSERT INTO `movie_actor` VALUES ('75', '9', 'https://withyan.cn/images/role/9/1.jpg', '2019-04-13 11:17:20', '2019-04-13 11:17:20', '于谦', '苗宛秋');
INSERT INTO `movie_actor` VALUES ('76', '9', 'https://withyan.cn/images/role/9/2.jpg', '2019-04-13 11:17:20', '2019-04-13 11:17:20', '汤梦佳', '安静');
INSERT INTO `movie_actor` VALUES ('77', '9', 'https://withyan.cn/images/role/9/3.jpg', '2019-04-13 11:17:21', '2019-04-13 11:17:21', '王广源', '洛小乙');
INSERT INTO `movie_actor` VALUES ('78', '9', 'https://withyan.cn/images/role/9/4.jpg', '2019-04-13 11:17:21', '2019-04-13 11:17:21', '秦鸣悦', '关婷婷');
INSERT INTO `movie_actor` VALUES ('79', '9', 'https://withyan.cn/images/role/9/5.jpg', '2019-04-13 11:17:21', '2019-04-13 11:17:21', '徐子力', '王海');
INSERT INTO `movie_actor` VALUES ('80', '9', 'https://withyan.cn/images/role/9/6.jpg', '2019-04-13 11:17:21', '2019-04-13 11:17:21', '孙艺杨', '刘昊');
INSERT INTO `movie_actor` VALUES ('81', '9', 'https://withyan.cn/images/role/9/7.jpg', '2019-04-13 11:17:21', '2019-04-13 11:17:21', '徐紫茵', '李海燕');
INSERT INTO `movie_actor` VALUES ('82', '9', 'https://withyan.cn/images/role/9/8.jpg', '2019-04-13 11:17:21', '2019-04-13 11:17:21', '郜玄铭', '郭建设');
INSERT INTO `movie_actor` VALUES ('83', '9', 'https://withyan.cn/images/role/9/9.jpg', '2019-04-13 11:17:21', '2019-04-13 11:17:21', '郝鹏飞', '蒋文明');
INSERT INTO `movie_actor` VALUES ('84', '10', 'https://withyan.cn/images/role/10/1.jpg', '2019-04-13 11:24:17', '2019-04-13 11:24:17', '罗立群', '孙义');
INSERT INTO `movie_actor` VALUES ('85', '10', 'https://withyan.cn/images/role/10/2.jpg', '2019-04-13 11:24:17', '2019-04-13 11:24:17', '高赫一', '孙礼');
INSERT INTO `movie_actor` VALUES ('86', '10', 'https://withyan.cn/images/role/10/3.jpg', '2019-04-13 11:24:17', '2019-04-13 11:24:17', '金琦茗', '小红女');
INSERT INTO `movie_actor` VALUES ('87', '10', 'https://withyan.cn/images/role/10/4.jpg', '2019-04-13 11:24:17', '2019-04-13 11:24:17', '郑亚龙', '汪大人');
INSERT INTO `movie_actor` VALUES ('88', '10', 'https://withyan.cn/images/role/10/5.jpg', '2019-04-13 11:24:17', '2019-04-13 11:24:17', '陈立唯', '于洋');
INSERT INTO `movie_actor` VALUES ('89', '10', 'https://withyan.cn/images/role/10/6.jpg', '2019-04-13 11:24:18', '2019-04-13 11:24:18', '张扬', '齐云');
INSERT INTO `movie_actor` VALUES ('90', '10', 'https://withyan.cn/images/role/10/7.jpg', '2019-04-13 11:24:18', '2019-04-13 11:24:18', '陈姗姗', '舅舅');
INSERT INTO `movie_actor` VALUES ('91', '10', 'https://withyan.cn/images/role/10/8.jpg', '2019-04-13 11:24:18', '2019-04-13 11:24:18', '杨作玖', '福兴');
INSERT INTO `movie_actor` VALUES ('92', '10', 'https://withyan.cn/images/role/10/9.jpg', '2019-04-13 11:24:18', '2019-04-13 11:24:18', '邢晓岩', '宫二');

-- ----------------------------
-- Table structure for `movie_post`
-- ----------------------------
DROP TABLE IF EXISTS `movie_post`;
CREATE TABLE `movie_post` (
  `pk_postid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fk_movieid` bigint(20) unsigned NOT NULL,
  `post_url` varchar(200) NOT NULL,
  `gmt_create` datetime NOT NULL,
  `gmt_modified` datetime NOT NULL,
  PRIMARY KEY (`pk_postid`),
  KEY `fk_movieid` (`fk_movieid`),
  CONSTRAINT `movie_post_ibfk_1` FOREIGN KEY (`fk_movieid`) REFERENCES `movie` (`pk_movieid`)
) ENGINE=InnoDB AUTO_INCREMENT=1573 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of movie_post
-- ----------------------------
INSERT INTO `movie_post` VALUES ('361', '2', 'https://withyan.cn/images/post/2/1.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('362', '2', 'https://withyan.cn/images/post/2/2.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('363', '2', 'https://withyan.cn/images/post/2/3.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('364', '2', 'https://withyan.cn/images/post/2/4.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('365', '2', 'https://withyan.cn/images/post/2/5.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('366', '2', 'https://withyan.cn/images/post/2/6.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('367', '2', 'https://withyan.cn/images/post/2/7.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('368', '2', 'https://withyan.cn/images/post/2/8.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('369', '2', 'https://withyan.cn/images/post/2/9.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('370', '2', 'https://withyan.cn/images/post/2/10.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('371', '2', 'https://withyan.cn/images/post/2/11.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('372', '2', 'https://withyan.cn/images/post/2/12.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('373', '3', 'https://withyan.cn/images/post/3/1.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('374', '3', 'https://withyan.cn/images/post/3/2.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('375', '3', 'https://withyan.cn/images/post/3/3.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('376', '3', 'https://withyan.cn/images/post/3/4.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('377', '3', 'https://withyan.cn/images/post/3/5.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('378', '3', 'https://withyan.cn/images/post/3/6.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('379', '3', 'https://withyan.cn/images/post/3/7.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('380', '3', 'https://withyan.cn/images/post/3/8.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('381', '3', 'https://withyan.cn/images/post/3/9.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('382', '3', 'https://withyan.cn/images/post/3/10.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('383', '3', 'https://withyan.cn/images/post/3/11.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('384', '3', 'https://withyan.cn/images/post/3/12.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('385', '4', 'https://withyan.cn/images/post/4/1.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('386', '4', 'https://withyan.cn/images/post/4/2.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('387', '4', 'https://withyan.cn/images/post/4/3.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('388', '4', 'https://withyan.cn/images/post/4/4.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('389', '4', 'https://withyan.cn/images/post/4/5.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('390', '4', 'https://withyan.cn/images/post/4/6.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('391', '4', 'https://withyan.cn/images/post/4/7.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('392', '4', 'https://withyan.cn/images/post/4/8.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('393', '4', 'https://withyan.cn/images/post/4/9.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('394', '4', 'https://withyan.cn/images/post/4/10.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('395', '4', 'https://withyan.cn/images/post/4/11.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('396', '4', 'https://withyan.cn/images/post/4/12.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('397', '5', 'https://withyan.cn/images/post/5/1.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('398', '5', 'https://withyan.cn/images/post/5/2.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('399', '5', 'https://withyan.cn/images/post/5/3.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('400', '5', 'https://withyan.cn/images/post/5/4.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('401', '5', 'https://withyan.cn/images/post/5/5.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('402', '5', 'https://withyan.cn/images/post/5/6.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('403', '5', 'https://withyan.cn/images/post/5/7.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('404', '5', 'https://withyan.cn/images/post/5/8.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('405', '5', 'https://withyan.cn/images/post/5/9.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('406', '5', 'https://withyan.cn/images/post/5/10.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('407', '5', 'https://withyan.cn/images/post/5/11.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('408', '5', 'https://withyan.cn/images/post/5/12.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('409', '6', 'https://withyan.cn/images/post/6/1.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('410', '6', 'https://withyan.cn/images/post/6/2.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('411', '6', 'https://withyan.cn/images/post/6/3.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('412', '6', 'https://withyan.cn/images/post/6/4.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('413', '6', 'https://withyan.cn/images/post/6/5.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('414', '6', 'https://withyan.cn/images/post/6/6.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('415', '6', 'https://withyan.cn/images/post/6/7.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('416', '6', 'https://withyan.cn/images/post/6/8.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('417', '6', 'https://withyan.cn/images/post/6/9.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('418', '6', 'https://withyan.cn/images/post/6/10.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('419', '6', 'https://withyan.cn/images/post/6/11.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('420', '6', 'https://withyan.cn/images/post/6/12.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('421', '7', 'https://withyan.cn/images/post/7/1.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('422', '7', 'https://withyan.cn/images/post/7/2.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('423', '7', 'https://withyan.cn/images/post/7/3.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('424', '7', 'https://withyan.cn/images/post/7/4.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('425', '7', 'https://withyan.cn/images/post/7/5.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('426', '7', 'https://withyan.cn/images/post/7/6.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('427', '7', 'https://withyan.cn/images/post/7/7.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('428', '7', 'https://withyan.cn/images/post/7/8.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('429', '7', 'https://withyan.cn/images/post/7/9.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('430', '7', 'https://withyan.cn/images/post/7/10.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('431', '7', 'https://withyan.cn/images/post/7/11.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('432', '7', 'https://withyan.cn/images/post/7/12.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('433', '8', 'https://withyan.cn/images/post/8/1.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('434', '8', 'https://withyan.cn/images/post/8/2.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('435', '8', 'https://withyan.cn/images/post/8/3.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('436', '8', 'https://withyan.cn/images/post/8/4.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('437', '8', 'https://withyan.cn/images/post/8/5.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('438', '8', 'https://withyan.cn/images/post/8/6.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('439', '8', 'https://withyan.cn/images/post/8/7.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('440', '8', 'https://withyan.cn/images/post/8/8.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('441', '8', 'https://withyan.cn/images/post/8/9.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('442', '8', 'https://withyan.cn/images/post/8/10.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('443', '8', 'https://withyan.cn/images/post/8/11.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('444', '8', 'https://withyan.cn/images/post/8/12.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('445', '9', 'https://withyan.cn/images/post/9/1.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('446', '9', 'https://withyan.cn/images/post/9/2.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('447', '9', 'https://withyan.cn/images/post/9/3.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('448', '9', 'https://withyan.cn/images/post/9/4.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('449', '9', 'https://withyan.cn/images/post/9/5.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('450', '9', 'https://withyan.cn/images/post/9/6.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('451', '9', 'https://withyan.cn/images/post/9/7.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('452', '9', 'https://withyan.cn/images/post/9/8.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('453', '9', 'https://withyan.cn/images/post/9/9.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('454', '9', 'https://withyan.cn/images/post/9/10.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('455', '9', 'https://withyan.cn/images/post/9/11.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('456', '9', 'https://withyan.cn/images/post/9/12.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('457', '10', 'https://withyan.cn/images/post/10/1.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('458', '10', 'https://withyan.cn/images/post/10/2.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('459', '10', 'https://withyan.cn/images/post/10/3.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('460', '10', 'https://withyan.cn/images/post/10/4.jpg', '2019-04-13 12:50:21', '2019-04-13 12:50:21');
INSERT INTO `movie_post` VALUES ('461', '10', 'https://withyan.cn/images/post/10/5.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('462', '10', 'https://withyan.cn/images/post/10/6.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('463', '10', 'https://withyan.cn/images/post/10/7.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('464', '10', 'https://withyan.cn/images/post/10/8.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('465', '10', 'https://withyan.cn/images/post/10/9.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('466', '10', 'https://withyan.cn/images/post/10/10.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('467', '10', 'https://withyan.cn/images/post/10/11.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('468', '10', 'https://withyan.cn/images/post/10/12.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('469', '11', 'https://withyan.cn/images/post/11/1.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('470', '11', 'https://withyan.cn/images/post/11/2.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('471', '11', 'https://withyan.cn/images/post/11/3.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('472', '11', 'https://withyan.cn/images/post/11/4.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('473', '11', 'https://withyan.cn/images/post/11/5.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('474', '11', 'https://withyan.cn/images/post/11/6.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('475', '11', 'https://withyan.cn/images/post/11/7.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('476', '11', 'https://withyan.cn/images/post/11/8.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('477', '11', 'https://withyan.cn/images/post/11/9.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('478', '11', 'https://withyan.cn/images/post/11/10.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('479', '11', 'https://withyan.cn/images/post/11/11.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('480', '11', 'https://withyan.cn/images/post/11/12.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('481', '12', 'https://withyan.cn/images/post/12/1.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('482', '12', 'https://withyan.cn/images/post/12/2.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('483', '12', 'https://withyan.cn/images/post/12/3.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('484', '12', 'https://withyan.cn/images/post/12/4.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('485', '12', 'https://withyan.cn/images/post/12/5.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('486', '12', 'https://withyan.cn/images/post/12/6.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('487', '12', 'https://withyan.cn/images/post/12/7.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('488', '12', 'https://withyan.cn/images/post/12/8.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('489', '12', 'https://withyan.cn/images/post/12/9.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('490', '12', 'https://withyan.cn/images/post/12/10.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('491', '12', 'https://withyan.cn/images/post/12/11.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('492', '12', 'https://withyan.cn/images/post/12/12.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('493', '13', 'https://withyan.cn/images/post/13/1.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('494', '13', 'https://withyan.cn/images/post/13/2.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('495', '13', 'https://withyan.cn/images/post/13/3.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('496', '13', 'https://withyan.cn/images/post/13/4.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('497', '13', 'https://withyan.cn/images/post/13/5.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('498', '13', 'https://withyan.cn/images/post/13/6.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('499', '13', 'https://withyan.cn/images/post/13/7.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('500', '13', 'https://withyan.cn/images/post/13/8.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('501', '13', 'https://withyan.cn/images/post/13/9.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('502', '13', 'https://withyan.cn/images/post/13/10.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('503', '13', 'https://withyan.cn/images/post/13/11.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('504', '13', 'https://withyan.cn/images/post/13/12.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('505', '14', 'https://withyan.cn/images/post/14/1.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('506', '14', 'https://withyan.cn/images/post/14/2.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('507', '14', 'https://withyan.cn/images/post/14/3.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('508', '14', 'https://withyan.cn/images/post/14/4.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('509', '14', 'https://withyan.cn/images/post/14/5.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('510', '14', 'https://withyan.cn/images/post/14/6.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('511', '14', 'https://withyan.cn/images/post/14/7.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('512', '14', 'https://withyan.cn/images/post/14/8.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('513', '14', 'https://withyan.cn/images/post/14/9.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('514', '14', 'https://withyan.cn/images/post/14/10.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('515', '14', 'https://withyan.cn/images/post/14/11.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('516', '14', 'https://withyan.cn/images/post/14/12.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('517', '15', 'https://withyan.cn/images/post/15/1.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('518', '15', 'https://withyan.cn/images/post/15/2.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('519', '15', 'https://withyan.cn/images/post/15/3.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('520', '15', 'https://withyan.cn/images/post/15/4.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('521', '15', 'https://withyan.cn/images/post/15/5.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('522', '15', 'https://withyan.cn/images/post/15/6.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('523', '15', 'https://withyan.cn/images/post/15/7.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('524', '15', 'https://withyan.cn/images/post/15/8.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('525', '15', 'https://withyan.cn/images/post/15/9.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('526', '15', 'https://withyan.cn/images/post/15/10.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('527', '15', 'https://withyan.cn/images/post/15/11.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('528', '15', 'https://withyan.cn/images/post/15/12.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('529', '16', 'https://withyan.cn/images/post/16/1.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('530', '16', 'https://withyan.cn/images/post/16/2.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('531', '16', 'https://withyan.cn/images/post/16/3.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('532', '16', 'https://withyan.cn/images/post/16/4.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('533', '16', 'https://withyan.cn/images/post/16/5.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('534', '16', 'https://withyan.cn/images/post/16/6.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('535', '16', 'https://withyan.cn/images/post/16/7.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('536', '16', 'https://withyan.cn/images/post/16/8.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('537', '16', 'https://withyan.cn/images/post/16/9.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('538', '16', 'https://withyan.cn/images/post/16/10.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('539', '16', 'https://withyan.cn/images/post/16/11.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('540', '16', 'https://withyan.cn/images/post/16/12.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('541', '17', 'https://withyan.cn/images/post/17/1.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('542', '17', 'https://withyan.cn/images/post/17/2.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('543', '17', 'https://withyan.cn/images/post/17/3.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('544', '17', 'https://withyan.cn/images/post/17/4.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('545', '17', 'https://withyan.cn/images/post/17/5.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('546', '17', 'https://withyan.cn/images/post/17/6.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('547', '17', 'https://withyan.cn/images/post/17/7.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('548', '17', 'https://withyan.cn/images/post/17/8.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('549', '17', 'https://withyan.cn/images/post/17/9.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('550', '17', 'https://withyan.cn/images/post/17/10.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('551', '17', 'https://withyan.cn/images/post/17/11.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('552', '17', 'https://withyan.cn/images/post/17/12.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('553', '18', 'https://withyan.cn/images/post/18/1.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('554', '18', 'https://withyan.cn/images/post/18/2.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('555', '18', 'https://withyan.cn/images/post/18/3.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('556', '18', 'https://withyan.cn/images/post/18/4.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('557', '18', 'https://withyan.cn/images/post/18/5.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('558', '18', 'https://withyan.cn/images/post/18/6.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('559', '18', 'https://withyan.cn/images/post/18/7.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('560', '18', 'https://withyan.cn/images/post/18/8.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('561', '18', 'https://withyan.cn/images/post/18/9.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('562', '18', 'https://withyan.cn/images/post/18/10.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('563', '18', 'https://withyan.cn/images/post/18/11.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('564', '18', 'https://withyan.cn/images/post/18/12.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('565', '19', 'https://withyan.cn/images/post/19/1.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('566', '19', 'https://withyan.cn/images/post/19/2.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('567', '19', 'https://withyan.cn/images/post/19/3.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('568', '19', 'https://withyan.cn/images/post/19/4.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('569', '19', 'https://withyan.cn/images/post/19/5.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('570', '19', 'https://withyan.cn/images/post/19/6.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('571', '19', 'https://withyan.cn/images/post/19/7.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('572', '19', 'https://withyan.cn/images/post/19/8.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('573', '19', 'https://withyan.cn/images/post/19/9.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('574', '19', 'https://withyan.cn/images/post/19/10.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('575', '19', 'https://withyan.cn/images/post/19/11.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('576', '19', 'https://withyan.cn/images/post/19/12.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('577', '20', 'https://withyan.cn/images/post/20/1.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('578', '20', 'https://withyan.cn/images/post/20/2.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('579', '20', 'https://withyan.cn/images/post/20/3.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('580', '20', 'https://withyan.cn/images/post/20/4.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('581', '20', 'https://withyan.cn/images/post/20/5.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('582', '20', 'https://withyan.cn/images/post/20/6.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('583', '20', 'https://withyan.cn/images/post/20/7.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('584', '20', 'https://withyan.cn/images/post/20/8.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('585', '20', 'https://withyan.cn/images/post/20/9.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('586', '20', 'https://withyan.cn/images/post/20/10.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('587', '20', 'https://withyan.cn/images/post/20/11.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('588', '20', 'https://withyan.cn/images/post/20/12.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('589', '21', 'https://withyan.cn/images/post/21/1.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('590', '21', 'https://withyan.cn/images/post/21/2.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('591', '21', 'https://withyan.cn/images/post/21/3.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('592', '21', 'https://withyan.cn/images/post/21/4.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('593', '21', 'https://withyan.cn/images/post/21/5.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('594', '21', 'https://withyan.cn/images/post/21/6.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('595', '21', 'https://withyan.cn/images/post/21/7.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('596', '21', 'https://withyan.cn/images/post/21/8.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('597', '21', 'https://withyan.cn/images/post/21/9.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('598', '21', 'https://withyan.cn/images/post/21/10.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('599', '21', 'https://withyan.cn/images/post/21/11.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('600', '21', 'https://withyan.cn/images/post/21/12.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('601', '22', 'https://withyan.cn/images/post/22/1.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('602', '22', 'https://withyan.cn/images/post/22/2.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('603', '22', 'https://withyan.cn/images/post/22/3.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('604', '22', 'https://withyan.cn/images/post/22/4.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('605', '22', 'https://withyan.cn/images/post/22/5.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('606', '22', 'https://withyan.cn/images/post/22/6.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('607', '22', 'https://withyan.cn/images/post/22/7.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('608', '22', 'https://withyan.cn/images/post/22/8.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('609', '22', 'https://withyan.cn/images/post/22/9.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('610', '22', 'https://withyan.cn/images/post/22/10.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('611', '22', 'https://withyan.cn/images/post/22/11.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('612', '22', 'https://withyan.cn/images/post/22/12.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('613', '23', 'https://withyan.cn/images/post/23/1.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('614', '23', 'https://withyan.cn/images/post/23/2.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('615', '23', 'https://withyan.cn/images/post/23/3.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('616', '23', 'https://withyan.cn/images/post/23/4.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('617', '23', 'https://withyan.cn/images/post/23/5.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('618', '23', 'https://withyan.cn/images/post/23/6.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('619', '23', 'https://withyan.cn/images/post/23/7.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('620', '23', 'https://withyan.cn/images/post/23/8.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('621', '23', 'https://withyan.cn/images/post/23/9.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('622', '23', 'https://withyan.cn/images/post/23/10.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('623', '23', 'https://withyan.cn/images/post/23/11.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('624', '23', 'https://withyan.cn/images/post/23/12.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('625', '24', 'https://withyan.cn/images/post/24/1.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('626', '24', 'https://withyan.cn/images/post/24/2.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('627', '24', 'https://withyan.cn/images/post/24/3.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('628', '24', 'https://withyan.cn/images/post/24/4.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('629', '24', 'https://withyan.cn/images/post/24/5.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('630', '24', 'https://withyan.cn/images/post/24/6.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('631', '24', 'https://withyan.cn/images/post/24/7.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('632', '24', 'https://withyan.cn/images/post/24/8.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('633', '24', 'https://withyan.cn/images/post/24/9.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('634', '24', 'https://withyan.cn/images/post/24/10.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('635', '24', 'https://withyan.cn/images/post/24/11.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('636', '24', 'https://withyan.cn/images/post/24/12.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('637', '25', 'https://withyan.cn/images/post/25/1.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('638', '25', 'https://withyan.cn/images/post/25/2.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('639', '25', 'https://withyan.cn/images/post/25/3.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('640', '25', 'https://withyan.cn/images/post/25/4.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('641', '25', 'https://withyan.cn/images/post/25/5.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('642', '25', 'https://withyan.cn/images/post/25/6.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('643', '25', 'https://withyan.cn/images/post/25/7.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('644', '25', 'https://withyan.cn/images/post/25/8.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('645', '25', 'https://withyan.cn/images/post/25/9.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('646', '25', 'https://withyan.cn/images/post/25/10.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('647', '25', 'https://withyan.cn/images/post/25/11.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('648', '25', 'https://withyan.cn/images/post/25/12.jpg', '2019-04-13 12:50:22', '2019-04-13 12:50:22');
INSERT INTO `movie_post` VALUES ('1561', '1', 'https://withyan.cn/images/post/1/1.jpg', '2019-04-26 18:10:47', '2019-04-26 18:10:47');
INSERT INTO `movie_post` VALUES ('1562', '1', 'https://withyan.cn/images/post/1/2.jpg', '2019-04-26 18:10:48', '2019-04-26 18:10:48');
INSERT INTO `movie_post` VALUES ('1563', '1', 'https://withyan.cn/images/post/1/3.jpg', '2019-04-26 18:10:48', '2019-04-26 18:10:48');
INSERT INTO `movie_post` VALUES ('1564', '1', 'https://withyan.cn/images/post/1/4.jpg', '2019-04-26 18:10:48', '2019-04-26 18:10:48');
INSERT INTO `movie_post` VALUES ('1565', '1', 'https://withyan.cn/images/post/1/5.jpg', '2019-04-26 18:10:48', '2019-04-26 18:10:48');
INSERT INTO `movie_post` VALUES ('1566', '1', 'https://withyan.cn/images/post/1/6.jpg', '2019-04-26 18:10:48', '2019-04-26 18:10:48');
INSERT INTO `movie_post` VALUES ('1567', '1', 'https://withyan.cn/images/post/1/7.jpg', '2019-04-26 18:10:48', '2019-04-26 18:10:48');
INSERT INTO `movie_post` VALUES ('1568', '1', 'https://withyan.cn/images/post/1/8.jpg', '2019-04-26 18:10:48', '2019-04-26 18:10:48');
INSERT INTO `movie_post` VALUES ('1569', '1', 'https://withyan.cn/images/post/1/9.jpg', '2019-04-26 18:10:48', '2019-04-26 18:10:48');
INSERT INTO `movie_post` VALUES ('1570', '1', 'https://withyan.cn/images/post/1/10.jpg', '2019-04-26 18:10:48', '2019-04-26 18:10:48');
INSERT INTO `movie_post` VALUES ('1571', '1', 'https://withyan.cn/images/post/1/11.jpg', '2019-04-26 18:10:48', '2019-04-26 18:10:48');
INSERT INTO `movie_post` VALUES ('1572', '1', 'https://withyan.cn/images/post/1/12.jpg', '2019-04-26 18:10:48', '2019-04-26 18:10:48');

-- ----------------------------
-- Table structure for `room`
-- ----------------------------
DROP TABLE IF EXISTS `room`;
CREATE TABLE `room` (
  `pk_roomid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fk_cinema` bigint(20) unsigned NOT NULL,
  `room_name` char(60) NOT NULL,
  `room_row` smallint(5) unsigned NOT NULL,
  `room_column` smallint(5) unsigned NOT NULL,
  `gmt_create` datetime NOT NULL,
  `gmt_modified` datetime NOT NULL,
  PRIMARY KEY (`pk_roomid`),
  KEY `fk_cinema` (`fk_cinema`),
  CONSTRAINT `room_ibfk_1` FOREIGN KEY (`fk_cinema`) REFERENCES `cinema` (`pk_cinemaid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of room
-- ----------------------------
INSERT INTO `room` VALUES ('1', '1', '1', '10', '10', '2019-04-26 17:03:00', '2019-04-11 08:39:36');
INSERT INTO `room` VALUES ('2', '1', '2', '10', '10', '2019-04-11 09:11:42', '2019-04-11 09:11:42');
INSERT INTO `room` VALUES ('3', '1', '3', '10', '10', '2019-04-19 15:55:58', '2019-04-19 15:56:01');
INSERT INTO `room` VALUES ('4', '5', '1', '10', '10', '2019-04-19 16:11:24', '2019-04-19 16:11:27');
INSERT INTO `room` VALUES ('5', '5', '2', '10', '10', '2019-04-19 16:11:46', '2019-04-19 16:11:49');
INSERT INTO `room` VALUES ('6', '5', '3', '10', '10', '2019-04-19 16:12:04', '2019-04-19 16:12:08');
INSERT INTO `room` VALUES ('7', '12', '1', '9', '9', '2019-04-23 11:12:58', '2019-04-24 11:13:02');
INSERT INTO `room` VALUES ('8', '1', '2', '10', '10', '2019-04-26 16:58:39', '2019-04-26 16:58:39');
INSERT INTO `room` VALUES ('9', '1', '2', '10', '10', '2019-04-26 17:01:28', '2019-04-26 17:01:28');
INSERT INTO `room` VALUES ('10', '1', '2', '10', '10', '2019-04-26 17:03:00', '2019-04-26 17:03:00');

-- ----------------------------
-- Table structure for `screen`
-- ----------------------------
DROP TABLE IF EXISTS `screen`;
CREATE TABLE `screen` (
  `pk_screenid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fk_room` bigint(20) unsigned NOT NULL,
  `fk_movie` bigint(20) unsigned NOT NULL,
  `price` float NOT NULL,
  `begin_time` datetime NOT NULL,
  `gmt_create` datetime NOT NULL,
  `gmt_modified` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  PRIMARY KEY (`pk_screenid`),
  KEY `fk_room` (`fk_room`),
  KEY `fk_movie` (`fk_movie`),
  CONSTRAINT `screen_ibfk_1` FOREIGN KEY (`fk_room`) REFERENCES `room` (`pk_roomid`),
  CONSTRAINT `screen_ibfk_2` FOREIGN KEY (`fk_movie`) REFERENCES `movie` (`pk_movieid`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of screen
-- ----------------------------
INSERT INTO `screen` VALUES ('1', '1', '1', '39.8', '2019-04-09 17:35:17', '2019-04-26 17:03:00', '2019-04-11 09:35:16', '2019-04-11 09:35:16');
INSERT INTO `screen` VALUES ('2', '2', '1', '40.9', '2019-04-25 09:51:30', '2019-04-11 09:51:30', '2019-04-11 09:51:30', '2019-04-11 09:51:30');
INSERT INTO `screen` VALUES ('3', '3', '1', '41.8', '2019-04-26 09:52:04', '2019-04-11 09:52:04', '2019-04-11 09:52:04', '2019-04-11 09:52:04');
INSERT INTO `screen` VALUES ('4', '4', '1', '48.9', '2019-04-27 09:52:05', '2019-04-11 09:52:05', '2019-04-11 09:52:05', '2019-04-11 09:52:05');
INSERT INTO `screen` VALUES ('5', '5', '1', '45.9', '2019-04-28 09:52:05', '2019-04-11 09:52:05', '2019-04-11 09:52:05', '2019-04-11 09:52:05');
INSERT INTO `screen` VALUES ('6', '6', '1', '44.8', '2019-04-29 09:52:05', '2019-04-11 09:52:05', '2019-04-11 09:52:05', '2019-04-11 09:52:05');
INSERT INTO `screen` VALUES ('7', '7', '1', '50', '2019-04-11 09:52:05', '2019-04-11 09:52:05', '2019-04-11 09:52:05', '2019-04-11 09:52:05');
INSERT INTO `screen` VALUES ('8', '3', '1', '50', '2019-04-11 09:52:05', '2019-04-11 09:52:05', '2019-04-11 09:52:05', '2019-04-11 09:52:05');
INSERT INTO `screen` VALUES ('9', '4', '1', '50', '2019-04-19 16:44:37', '2019-04-19 16:44:40', '2019-04-19 16:44:44', '2019-04-19 16:44:48');
INSERT INTO `screen` VALUES ('10', '7', '2', '50', '2019-04-23 11:14:31', '2019-04-23 11:14:34', '2019-04-23 11:14:37', '2019-04-23 11:14:39');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `pk_userid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` char(50) DEFAULT NULL,
  `password` char(50) DEFAULT NULL,
  `uk_phone` char(15) DEFAULT NULL,
  `gmt_create` datetime NOT NULL,
  `gmt_modified` datetime NOT NULL,
  `role` char(10) DEFAULT NULL,
  `money` float unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`pk_userid`),
  UNIQUE KEY `uk_phone` (`uk_phone`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------

-- ----------------------------
-- Table structure for `user_info`
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `openid` char(50) NOT NULL DEFAULT '',
  `pk_userid` bigint(20) unsigned DEFAULT NULL,
  `nickname` char(60) DEFAULT NULL,
  `gender` char(10) DEFAULT NULL,
  `city` char(60) DEFAULT NULL,
  `province` char(60) DEFAULT NULL,
  `country` char(60) DEFAULT NULL,
  `avatar_url` char(150) DEFAULT NULL,
  `gmt_create` datetime NOT NULL,
  `gmt_modified` datetime NOT NULL,
  PRIMARY KEY (`openid`),
  KEY `user_info_ibfk_1` (`pk_userid`),
  CONSTRAINT `user_info_ibfk_1` FOREIGN KEY (`pk_userid`) REFERENCES `user` (`pk_userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_info
-- ----------------------------
