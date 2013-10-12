/*
Navicat MySQL Data Transfer

Source Server         : Local (Password)
Source Server Version : 50613
Source Host           : localhost:3306
Source Database       : relentlessdb

Target Server Type    : MYSQL
Target Server Version : 50613
File Encoding         : 65001

Date: 2013-10-12 18:35:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `guid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` text NOT NULL,
  `email` tinytext NOT NULL,
  `password` tinytext NOT NULL,
  `adminRole` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `signedIn` tinyint(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=ascii;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES ('1', 'test', 'test@test.com', 'db436f780032a5e3341ea316003fa10b90e0e5c0', '2', '0');

-- ----------------------------
-- Table structure for account_avatar
-- ----------------------------
DROP TABLE IF EXISTS `account_avatar`;
CREATE TABLE `account_avatar` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0',
  `head` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `body` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `leg` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `armBack` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `armFront` tinyint(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

-- ----------------------------
-- Records of account_avatar
-- ----------------------------
INSERT INTO `account_avatar` VALUES ('1', '33', '10', '41', '4', '15');

-- ----------------------------
-- Table structure for account_bans
-- ----------------------------
DROP TABLE IF EXISTS `account_bans`;
CREATE TABLE `account_bans` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0',
  `reason` text NOT NULL,
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

-- ----------------------------
-- Records of account_bans
-- ----------------------------

-- ----------------------------
-- Table structure for account_cards
-- ----------------------------
DROP TABLE IF EXISTS `account_cards`;
CREATE TABLE `account_cards` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `guid` int(10) unsigned NOT NULL DEFAULT '0',
  `typeId` int(4) unsigned NOT NULL DEFAULT '0',
  `tradable` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `isToken` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `level` tinyint(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

-- ----------------------------
-- Records of account_cards
-- ----------------------------

-- ----------------------------
-- Table structure for account_data
-- ----------------------------
DROP TABLE IF EXISTS `account_data`;
CREATE TABLE `account_data` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0',
  `gold` int(10) unsigned NOT NULL DEFAULT '2000',
  `shards` int(10) unsigned NOT NULL DEFAULT '0',
  `gamesPlayed` int(10) unsigned NOT NULL DEFAULT '0',
  `gamesWon` int(10) unsigned NOT NULL DEFAULT '0',
  `gamesSurrendered` int(10) unsigned NOT NULL DEFAULT '0',
  `selectedPreconstructed` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

-- ----------------------------
-- Records of account_data
-- ----------------------------
INSERT INTO `account_data` VALUES ('1', '99999', '99999', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for account_decks
-- ----------------------------
DROP TABLE IF EXISTS `account_decks`;
CREATE TABLE `account_decks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `guid` int(10) unsigned NOT NULL DEFAULT '0',
  `name` tinytext NOT NULL,
  `resources` tinytext NOT NULL,
  `timestamp` bigint(20) unsigned NOT NULL,
  `metadata` text NOT NULL,
  `cards` text NOT NULL,
  `valid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

-- ----------------------------
-- Records of account_decks
-- ----------------------------

-- ----------------------------
-- Table structure for account_friends
-- ----------------------------
DROP TABLE IF EXISTS `account_friends`;
CREATE TABLE `account_friends` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

-- ----------------------------
-- Records of account_friends
-- ----------------------------

-- ----------------------------
-- Table structure for account_tower_info
-- ----------------------------
DROP TABLE IF EXISTS `account_tower_info`;
CREATE TABLE `account_tower_info` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0',
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

-- ----------------------------
-- Records of account_tower_info
-- ----------------------------

-- ----------------------------
-- Table structure for avatar_types
-- ----------------------------
DROP TABLE IF EXISTS `avatar_types`;
CREATE TABLE `avatar_types` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `type` text NOT NULL,
  `part` text NOT NULL,
  `filename` text NOT NULL,
  `set` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

-- ----------------------------
-- Records of avatar_types
-- ----------------------------
INSERT INTO `avatar_types` VALUES ('1', 'COMMON', 'ARM_BACK', 'back_arm_1.png', 'MALE_1');
INSERT INTO `avatar_types` VALUES ('2', 'UNLOCKABLE', 'ARM_BACK', 'back_arm_2.png', 'MALE_1');
INSERT INTO `avatar_types` VALUES ('3', 'COMMON', 'ARM_BACK', 'back_arm_3.png', 'MALE_1');
INSERT INTO `avatar_types` VALUES ('4', 'COMMON', 'ARM_BACK', 'back_arm_4.png', 'MALE_1');
INSERT INTO `avatar_types` VALUES ('5', 'COMMON', 'ARM_BACK', 'back_arm_5.png', 'MALE_1');
INSERT INTO `avatar_types` VALUES ('6', 'UNLOCKABLE', 'ARM_BACK', 'back_arm_6.png', 'MALE_1');
INSERT INTO `avatar_types` VALUES ('7', 'COMMON', 'ARM_BACK', 'back_arm_7.png', 'MALE_1');
INSERT INTO `avatar_types` VALUES ('8', 'COMMON', 'BODY', 'body_1.png', 'MALE_1');
INSERT INTO `avatar_types` VALUES ('9', 'COMMON', 'BODY', 'body_2.png', 'MALE_1');
INSERT INTO `avatar_types` VALUES ('10', 'COMMON', 'BODY', 'body_3.png', 'MALE_1');
INSERT INTO `avatar_types` VALUES ('11', 'COMMON', 'BODY', 'body_4.png', 'MALE_1');
INSERT INTO `avatar_types` VALUES ('12', 'UNLOCKABLE', 'BODY', 'body_5.png', 'MALE_1');
INSERT INTO `avatar_types` VALUES ('13', 'COMMON', 'BODY', 'body_6.png', 'MALE_1');
INSERT INTO `avatar_types` VALUES ('15', 'COMMON', 'ARM_FRONT', 'front_arm_1.png', 'MALE_1');
INSERT INTO `avatar_types` VALUES ('16', 'UNLOCKABLE', 'ARM_FRONT', 'front_arm_2.png', 'MALE_1');
INSERT INTO `avatar_types` VALUES ('17', 'COMMON', 'ARM_FRONT', 'front_arm_3.png', 'MALE_1');
INSERT INTO `avatar_types` VALUES ('18', 'COMMON', 'ARM_FRONT', 'front_arm_4.png', 'MALE_1');
INSERT INTO `avatar_types` VALUES ('19', 'COMMON', 'ARM_FRONT', 'front_arm_5.png', 'MALE_1');
INSERT INTO `avatar_types` VALUES ('20', 'UNLOCKABLE', 'ARM_FRONT', 'front_arm_6.png', 'MALE_1');
INSERT INTO `avatar_types` VALUES ('21', 'COMMON', 'ARM_FRONT', 'front_arm_7.png', 'MALE_1');
INSERT INTO `avatar_types` VALUES ('22', 'COMMON', 'HEAD', 'head_1.png', 'MALE_1');
INSERT INTO `avatar_types` VALUES ('23', 'COMMON', 'HEAD', 'head_2.png', 'MALE_1');
INSERT INTO `avatar_types` VALUES ('24', 'COMMON', 'HEAD', 'head_3.png', 'MALE_1');
INSERT INTO `avatar_types` VALUES ('25', 'COMMON', 'HEAD', 'head_4.png', 'MALE_1');
INSERT INTO `avatar_types` VALUES ('26', 'COMMON', 'HEAD', 'head_5.png', 'MALE_1');
INSERT INTO `avatar_types` VALUES ('27', 'COMMON', 'HEAD', 'head_6.png', 'MALE_1');
INSERT INTO `avatar_types` VALUES ('28', 'COMMON', 'HEAD', 'head_7.png', 'MALE_1');
INSERT INTO `avatar_types` VALUES ('29', 'UNLOCKABLE', 'HEAD', 'head_8.png', 'MALE_1');
INSERT INTO `avatar_types` VALUES ('30', 'COMMON', 'HEAD', 'head_9.png', 'MALE_1');
INSERT INTO `avatar_types` VALUES ('31', 'UNLOCKABLE', 'HEAD', 'head_10.png', 'MALE_1');
INSERT INTO `avatar_types` VALUES ('32', 'COMMON', 'HEAD', 'head_11.png', 'MALE_1');
INSERT INTO `avatar_types` VALUES ('33', 'COMMON', 'HEAD', 'head_12.png', 'MALE_1');
INSERT INTO `avatar_types` VALUES ('34', 'UNLOCKABLE', 'HEAD', 'head_13.png', 'MALE_1');
INSERT INTO `avatar_types` VALUES ('35', 'COMMON', 'HEAD', 'head_14.png', 'MALE_1');
INSERT INTO `avatar_types` VALUES ('36', 'UNLOCKABLE', 'HEAD', 'head_15.png', 'MALE_1');
INSERT INTO `avatar_types` VALUES ('37', 'COMMON', 'HEAD', 'head_16.png', 'MALE_1');
INSERT INTO `avatar_types` VALUES ('38', 'UNLOCKABLE', 'HEAD', 'head_17.png', 'MALE_1');
INSERT INTO `avatar_types` VALUES ('39', 'COMMON', 'LEG', 'legs_1.png', 'MALE_1');
INSERT INTO `avatar_types` VALUES ('40', 'COMMON', 'LEG', 'legs_2.png', 'MALE_1');
INSERT INTO `avatar_types` VALUES ('41', 'COMMON', 'LEG', 'legs_3.png', 'MALE_1');
INSERT INTO `avatar_types` VALUES ('68', 'COMMON', 'BODY', 'body_7.png', 'FEMALE_1');
INSERT INTO `avatar_types` VALUES ('69', 'COMMON', 'BODY', 'body_8.png', 'FEMALE_1');
INSERT INTO `avatar_types` VALUES ('70', 'COMMON', 'HEAD', 'head_18.png', 'FEMALE_1');
INSERT INTO `avatar_types` VALUES ('71', 'COMMON', 'HEAD', 'head_19.png', 'FEMALE_1');
INSERT INTO `avatar_types` VALUES ('72', 'COMMON', 'HEAD', 'head_20.png', 'FEMALE_1');
INSERT INTO `avatar_types` VALUES ('73', 'COMMON', 'HEAD', 'head_21.png', 'FEMALE_1');
INSERT INTO `avatar_types` VALUES ('74', 'COMMON', 'LEG', 'legs_4.png', 'FEMALE_1');
INSERT INTO `avatar_types` VALUES ('75', 'COMMON', 'LEG', 'legs_5.png', 'FEMALE_1');
INSERT INTO `avatar_types` VALUES ('76', 'COMMON', 'LEG', 'legs_6.png', 'FEMALE_1');
INSERT INTO `avatar_types` VALUES ('77', 'COMMON', 'LEG', 'legs_7.png', 'FEMALE_1');
INSERT INTO `avatar_types` VALUES ('78', 'STORE', 'ARM_BACK', 'back_arm_18.png', 'MALE_1');
INSERT INTO `avatar_types` VALUES ('79', 'STORE', 'ARM_BACK', 'back_arm_19.png', 'MALE_1');
INSERT INTO `avatar_types` VALUES ('80', 'STORE', 'ARM_BACK', 'back_arm_20.png', 'MALE_1');
INSERT INTO `avatar_types` VALUES ('81', 'STORE', 'ARM_BACK', 'back_arm_21.png', 'MALE_1');
INSERT INTO `avatar_types` VALUES ('82', 'STORE', 'BODY', 'body_18.png', 'MALE_1');
INSERT INTO `avatar_types` VALUES ('83', 'STORE', 'BODY', 'body_19.png', 'MALE_1');
INSERT INTO `avatar_types` VALUES ('84', 'STORE', 'BODY', 'body_20.png', 'MALE_1');
INSERT INTO `avatar_types` VALUES ('85', 'STORE', 'BODY', 'body_21.png', 'MALE_1');
INSERT INTO `avatar_types` VALUES ('86', 'STORE', 'ARM_FRONT', 'front_arm_18.png', 'MALE_1');
INSERT INTO `avatar_types` VALUES ('87', 'STORE', 'ARM_FRONT', 'front_arm_19.png', 'MALE_1');
INSERT INTO `avatar_types` VALUES ('88', 'STORE', 'ARM_FRONT', 'front_arm_20.png', 'MALE_1');
INSERT INTO `avatar_types` VALUES ('89', 'STORE', 'ARM_FRONT', 'front_arm_21.png', 'MALE_1');
INSERT INTO `avatar_types` VALUES ('90', 'STORE', 'LEG', 'legs_18.png', 'MALE_1');
INSERT INTO `avatar_types` VALUES ('91', 'STORE', 'LEG', 'legs_19.png', 'MALE_1');
INSERT INTO `avatar_types` VALUES ('92', 'STORE', 'LEG', 'legs_20.png', 'MALE_1');
INSERT INTO `avatar_types` VALUES ('93', 'STORE', 'LEG', 'legs_21.png', 'MALE_1');
INSERT INTO `avatar_types` VALUES ('94', 'COMMON', 'ARM_BACK', 'back_arm_1.png', 'FEMALE_1');
INSERT INTO `avatar_types` VALUES ('95', 'COMMON', 'ARM_BACK', 'back_arm_2.png', 'FEMALE_1');
INSERT INTO `avatar_types` VALUES ('96', 'COMMON', 'ARM_BACK', 'back_arm_3.png', 'FEMALE_1');
INSERT INTO `avatar_types` VALUES ('97', 'COMMON', 'ARM_BACK', 'back_arm_4.png', 'FEMALE_1');
INSERT INTO `avatar_types` VALUES ('98', 'COMMON', 'ARM_BACK', 'back_arm_5.png', 'FEMALE_1');
INSERT INTO `avatar_types` VALUES ('99', 'COMMON', 'ARM_BACK', 'back_arm_6.png', 'FEMALE_1');
INSERT INTO `avatar_types` VALUES ('100', 'COMMON', 'ARM_BACK', 'back_arm_7.png', 'FEMALE_1');
INSERT INTO `avatar_types` VALUES ('101', 'COMMON', 'BODY', 'body_1.png', 'FEMALE_1');
INSERT INTO `avatar_types` VALUES ('102', 'COMMON', 'BODY', 'body_2.png', 'FEMALE_1');
INSERT INTO `avatar_types` VALUES ('103', 'COMMON', 'BODY', 'body_3.png', 'FEMALE_1');
INSERT INTO `avatar_types` VALUES ('104', 'COMMON', 'BODY', 'body_4.png', 'FEMALE_1');
INSERT INTO `avatar_types` VALUES ('105', 'COMMON', 'BODY', 'body_5.png', 'FEMALE_1');
INSERT INTO `avatar_types` VALUES ('106', 'COMMON', 'BODY', 'body_6.png', 'FEMALE_1');
INSERT INTO `avatar_types` VALUES ('107', 'COMMON', 'ARM_FRONT', 'front_arm_1.png', 'FEMALE_1');
INSERT INTO `avatar_types` VALUES ('108', 'COMMON', 'ARM_FRONT', 'front_arm_2.png', 'FEMALE_1');
INSERT INTO `avatar_types` VALUES ('109', 'COMMON', 'ARM_FRONT', 'front_arm_3.png', 'FEMALE_1');
INSERT INTO `avatar_types` VALUES ('110', 'COMMON', 'ARM_FRONT', 'front_arm_4.png', 'FEMALE_1');
INSERT INTO `avatar_types` VALUES ('111', 'COMMON', 'ARM_FRONT', 'front_arm_5.png', 'FEMALE_1');
INSERT INTO `avatar_types` VALUES ('112', 'COMMON', 'ARM_FRONT', 'front_arm_6.png', 'FEMALE_1');
INSERT INTO `avatar_types` VALUES ('113', 'COMMON', 'ARM_FRONT', 'front_arm_7.png', 'FEMALE_1');
INSERT INTO `avatar_types` VALUES ('114', 'COMMON', 'HEAD', 'head_1.png', 'FEMALE_1');
INSERT INTO `avatar_types` VALUES ('115', 'COMMON', 'HEAD', 'head_10.png', 'FEMALE_1');
INSERT INTO `avatar_types` VALUES ('116', 'COMMON', 'HEAD', 'head_11.png', 'FEMALE_1');
INSERT INTO `avatar_types` VALUES ('117', 'COMMON', 'HEAD', 'head_12.png', 'FEMALE_1');
INSERT INTO `avatar_types` VALUES ('118', 'COMMON', 'HEAD', 'head_13.png', 'FEMALE_1');
INSERT INTO `avatar_types` VALUES ('119', 'COMMON', 'HEAD', 'head_14.png', 'FEMALE_1');
INSERT INTO `avatar_types` VALUES ('120', 'COMMON', 'HEAD', 'head_15.png', 'FEMALE_1');
INSERT INTO `avatar_types` VALUES ('121', 'COMMON', 'HEAD', 'head_16.png', 'FEMALE_1');
INSERT INTO `avatar_types` VALUES ('122', 'COMMON', 'HEAD', 'head_17.png', 'FEMALE_1');
INSERT INTO `avatar_types` VALUES ('123', 'COMMON', 'HEAD', 'head_2.png', 'FEMALE_1');
INSERT INTO `avatar_types` VALUES ('124', 'COMMON', 'HEAD', 'head_3.png', 'FEMALE_1');
INSERT INTO `avatar_types` VALUES ('125', 'COMMON', 'HEAD', 'head_4.png', 'FEMALE_1');
INSERT INTO `avatar_types` VALUES ('126', 'COMMON', 'HEAD', 'head_5.png', 'FEMALE_1');
INSERT INTO `avatar_types` VALUES ('127', 'COMMON', 'HEAD', 'head_6.png', 'FEMALE_1');
INSERT INTO `avatar_types` VALUES ('128', 'COMMON', 'HEAD', 'head_7.png', 'FEMALE_1');
INSERT INTO `avatar_types` VALUES ('129', 'COMMON', 'HEAD', 'head_8.png', 'FEMALE_1');
INSERT INTO `avatar_types` VALUES ('130', 'COMMON', 'HEAD', 'head_9.png', 'FEMALE_1');
INSERT INTO `avatar_types` VALUES ('131', 'COMMON', 'LEG', 'legs_1.png', 'FEMALE_1');
INSERT INTO `avatar_types` VALUES ('132', 'COMMON', 'LEG', 'legs_2.png', 'FEMALE_1');
INSERT INTO `avatar_types` VALUES ('133', 'COMMON', 'LEG', 'legs_3.png', 'FEMALE_1');
INSERT INTO `avatar_types` VALUES ('134', 'STORE', 'HEAD', 'head_18.png', 'MALE_1');
INSERT INTO `avatar_types` VALUES ('135', 'STORE', 'HEAD', 'head_19.png', 'MALE_1');
INSERT INTO `avatar_types` VALUES ('136', 'STORE', 'HEAD', 'head_20.png', 'MALE_1');
INSERT INTO `avatar_types` VALUES ('137', 'STORE', 'HEAD', 'head_21.png', 'MALE_1');
INSERT INTO `avatar_types` VALUES ('138', 'COMMON', 'LEG', 'legs_4.png', 'MALE_1');
INSERT INTO `avatar_types` VALUES ('139', 'COMMON', 'LEG', 'legs_5.png', 'MALE_1');
INSERT INTO `avatar_types` VALUES ('140', 'COMMON', 'LEG', 'legs_6.png', 'MALE_1');
INSERT INTO `avatar_types` VALUES ('141', 'STORE', 'ARM_BACK', 'back_arm_9.png', 'FEMALE_1');
INSERT INTO `avatar_types` VALUES ('144', 'STORE', 'ARM_BACK', 'back_arm_10.png', 'FEMALE_1');
INSERT INTO `avatar_types` VALUES ('145', 'STORE', 'ARM_BACK', 'back_arm_11.png', 'FEMALE_1');
INSERT INTO `avatar_types` VALUES ('146', 'STORE', 'ARM_BACK', 'back_arm_12.png', 'FEMALE_1');
INSERT INTO `avatar_types` VALUES ('147', 'STORE', 'BODY', 'body_10.png', 'FEMALE_1');
INSERT INTO `avatar_types` VALUES ('148', 'STORE', 'BODY', 'body_11.png', 'FEMALE_1');
INSERT INTO `avatar_types` VALUES ('149', 'STORE', 'BODY', 'body_12.png', 'FEMALE_1');
INSERT INTO `avatar_types` VALUES ('150', 'STORE', 'BODY', 'body_13.png', 'FEMALE_1');
INSERT INTO `avatar_types` VALUES ('151', 'STORE', 'ARM_FRONT', 'front_arm_9.png', 'FEMALE_1');
INSERT INTO `avatar_types` VALUES ('152', 'STORE', 'ARM_FRONT', 'front_arm_10.png', 'FEMALE_1');
INSERT INTO `avatar_types` VALUES ('153', 'STORE', 'ARM_FRONT', 'front_arm_11.png', 'FEMALE_1');
INSERT INTO `avatar_types` VALUES ('154', 'STORE', 'ARM_FRONT', 'front_arm_12.png', 'FEMALE_1');
INSERT INTO `avatar_types` VALUES ('155', 'STORE', 'HEAD', 'head_23.png', 'FEMALE_1');
INSERT INTO `avatar_types` VALUES ('156', 'STORE', 'HEAD', 'head_24.png', 'FEMALE_1');
INSERT INTO `avatar_types` VALUES ('157', 'STORE', 'HEAD', 'head_25.png', 'FEMALE_1');
INSERT INTO `avatar_types` VALUES ('158', 'STORE', 'HEAD', 'head_26.png', 'FEMALE_1');
INSERT INTO `avatar_types` VALUES ('159', 'STORE', 'HEAD', 'head_27.png', 'FEMALE_1');
INSERT INTO `avatar_types` VALUES ('160', 'STORE', 'HEAD', 'head_28.png', 'FEMALE_1');
INSERT INTO `avatar_types` VALUES ('161', 'STORE', 'HEAD', 'head_29.png', 'FEMALE_1');
INSERT INTO `avatar_types` VALUES ('162', 'STORE', 'LEG', 'legs_9.png', 'FEMALE_1');
INSERT INTO `avatar_types` VALUES ('163', 'STORE', 'LEG', 'legs_10.png', 'FEMALE_1');
INSERT INTO `avatar_types` VALUES ('164', 'STORE', 'LEG', 'legs_11.png', 'FEMALE_1');
INSERT INTO `avatar_types` VALUES ('165', 'STORE', 'LEG', 'legs_12.png', 'FEMALE_1');
INSERT INTO `avatar_types` VALUES ('166', 'STORE', 'HEAD', 'head_23.png', 'MALE_1');
INSERT INTO `avatar_types` VALUES ('167', 'STORE', 'HEAD', 'head_24.png', 'MALE_1');
INSERT INTO `avatar_types` VALUES ('168', 'STORE', 'BODY', 'body_23.png', 'MALE_1');
INSERT INTO `avatar_types` VALUES ('169', 'STORE', 'BODY', 'body_24.png', 'MALE_1');
INSERT INTO `avatar_types` VALUES ('170', 'STORE', 'LEG', 'legs_23.png', 'MALE_1');
INSERT INTO `avatar_types` VALUES ('171', 'STORE', 'LEG', 'legs_24.png', 'MALE_1');
INSERT INTO `avatar_types` VALUES ('172', 'STORE', 'ARM_FRONT', 'front_arm_23.png', 'MALE_1');
INSERT INTO `avatar_types` VALUES ('173', 'STORE', 'ARM_FRONT', 'front_arm_24.png', 'MALE_1');
INSERT INTO `avatar_types` VALUES ('174', 'STORE', 'ARM_BACK', 'back_arm_24.png', 'MALE_1');
INSERT INTO `avatar_types` VALUES ('193', 'STORE', 'ARM_BACK', 'back_arm_23.png', 'MALE_1');

-- ----------------------------
-- Table structure for card_types
-- ----------------------------
DROP TABLE IF EXISTS `card_types`;
CREATE TABLE `card_types` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `kind` tinytext,
  `name` tinytext,
  `description` tinytext,
  `flavor` tinytext,
  `subTypesStr` tinytext,
  `rarity` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `hp` tinyint(3) NOT NULL DEFAULT '0',
  `ap` tinyint(3) NOT NULL DEFAULT '0',
  `ac` tinyint(3) NOT NULL DEFAULT '0',
  `costDecay` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `costOrder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `costGrowth` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `costEnergy` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rulesList` text,
  `cardImage` int(11) DEFAULT '0',
  `animationPreviewImage` int(10) unsigned NOT NULL DEFAULT '0',
  `animationPreviewInfo` tinytext,
  `animationBundle` int(10) unsigned NOT NULL DEFAULT '0',
  `abilities` text,
  `targetArea` tinytext,
  `passiveRules` text,
  `sound` tinytext,
  `soundProjectile` tinytext,
  `available` tinyint(3) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

-- ----------------------------
-- Records of card_types
-- ----------------------------
INSERT INTO `card_types` VALUES ('1', 'CREATURE', 'Gravelock Elder', 'Other Gravelock creatures you control gain +1 Attack and +1 Health while Gravelock Elder is in play.', 'Gravelocks look up to their elders... literally.', 'Gravelock', '2', '5', '3', '2', '0', '0', '0', '5', '3|AttackForwardRanged|Move|GravelockStrengthModifier', '479', '445', '54.75,50.5,0.25', '98', '1|Move|Move|Move unit to adjacent tile|0|0|0|0', 'FORWARD', '1|Ranged attack|This unit does not take damage from attacking Spiky units.', 'impact_gravelock_physical', null, '1');
INSERT INTO `card_types` VALUES ('2', 'CREATURE', 'Gravelock Raider', null, 'You can handle one or two, but before you know it, they\'re everywhere.', 'Gravelock', '0', '2', '1', '2', '0', '0', '0', '1', '2|AttackForwardContinuous|Move', '480', '446', '74.6,24.75,0.25', '99', '1|Move|Move|Move unit to adjacent tile|0|0|0|0', 'FORWARD', '1|Relentless|If opponent blocking unit is destroyed, this creature will continue its attack.', 'action_gravelock_raider', null, '1');
INSERT INTO `card_types` VALUES ('3', 'CREATURE', 'Infected Gravelock', 'When Infected Gravelock attacks a creature, that creature gets poisoned for 3 rounds. Infected Gravelock has Move 0.', '\"It\'s seeping out of their god-damn pores.\"\\n- Lord Ungstram, Royal Strategist.', 'Gravelock', '0', '3', '2', '2', '2', '0', '0', '0', '2|AttackForward|DealPoison', '481', '447', '45.75,19.25,0.25', '100', null, 'FORWARD', null, 'action_gravelock_infected', null, '1');
INSERT INTO `card_types` VALUES ('4', 'CREATURE', 'Gravehawk', 'For each of your Gravelocks, Gravehawk gains +1 Attack.', '\"Mom always said I\'d end up in bad company. If she only knew...\" \\n- Ryssa, Gravehawk', 'Human', '1', '3', '1', '2', '0', '0', '2', '0', '3|AttackForwardContinuous|Move|NighthawkIncAp', '482', '448', '48.75,77,0.25', '101', '1|Move|Move|Move unit to adjacent tile|0|0|0|0', 'FORWARD', '1|Relentless|If opponent blocking unit is destroyed, this creature will continue its attack.', null, null, '1');
INSERT INTO `card_types` VALUES ('13', 'ENCHANTMENT', 'Elan Vital', 'Enchanted unit is healed by 1 Health each round.', 'Heal faster than you hurt and you\'ll keep fighting forever.', null, '0', '0', '0', '0', '0', '0', '1', '0', '1|ElanVital', '483', '0', null, '0', null, null, null, null, null, '1');
INSERT INTO `card_types` VALUES ('15', 'ENCHANTMENT', 'Crown of Strength', 'Enchanted unit gains +1 Attack and +2 Health.', 'The power of kings, imbued through discarded headwear.', null, '1', '0', '0', '0', '0', '2', '0', '0', '1|CrownOfStrength', '484', '0', null, '0', null, null, null, null, null, '1');
INSERT INTO `card_types` VALUES ('16', 'ENCHANTMENT', 'Bear Paw', 'Enchanted unit gains +2 Attack and +2 Health. When Bear Paw enters play, enchanted unit\'s Countdown increases by 1.', 'The gods saw fit to give it strong limbs and a mellow temperament. ', null, '0', '0', '0', '0', '0', '0', '2', '0', '1|BearPaw', '485', '0', null, '0', null, null, null, null, null, '1');
INSERT INTO `card_types` VALUES ('17', 'ENCHANTMENT', 'Binding Root', 'Enchanted unit\'s Move is decreased by 1.', 'There\'s no better ally than the ground beneath your enemies.', null, '0', '0', '0', '0', '0', '0', '1', '0', '1|BindingRoot', '486', '0', null, '0', null, null, null, null, null, '1');
INSERT INTO `card_types` VALUES ('18', 'SPELL', 'Hymn', 'Heal target unit by 3 Health.', 'Music for those who can\'t dance.', null, '0', '0', '0', '0', '0', '0', '1', '0', '1|Hymn', '487', '0', null, '0', null, 'TILE', null, null, null, '1');
INSERT INTO `card_types` VALUES ('19', 'SPELL', 'Metempsychosis', 'Target unit you control is resummoned on the same tile.', 'Consider the egg. The image of unfulfilled potential, and you eat them for breakfast...', null, '1', '0', '0', '0', '0', '3', '0', '0', '1|Metempsychosis', '488', '0', null, '0', null, 'TILE', null, null, null, '1');
INSERT INTO `card_types` VALUES ('20', 'SPELL', 'Thought Trap', 'Target unit\'s Countdown is doubled.', 'How far will a blind dog walk into a forest?', null, '0', '0', '0', '0', '0', '2', '0', '0', '1|ThoughtTrap', '489', '0', null, '0', null, 'TILE', null, null, null, '1');
INSERT INTO `card_types` VALUES ('21', 'SPELL', 'Rallying', 'All units you control have their Countdown decreased by 2.', 'FOLLOW THE JARL FOR THE KIN!', null, '1', '0', '0', '0', '0', '0', '5', '0', '1|Rallying', '490', '0', null, '0', null, 'UNDEFINED', null, null, null, '1');
INSERT INTO `card_types` VALUES ('22', 'CREATURE', 'Brother of the Wolf', 'When Countdown is 0, Brother of the Wolf can summon one Ragged Wolf instead of attacking.', 'Befriending wolves isn\'t that hard. Failure, however, can be costly.', 'Human,Kinfolk', '1', '4', '3', '2', '0', '0', '4', '0', '3|AttackForward|Move|SummonWolf', '491', '449', '63.5,86,0.25', '102', '2|Move|Move|Move unit to adjacent tile|0|0|0|0|SummonWolf|Summon Wolf|Summon a Ragged Wolf. Countdown increases by 2.|0|0|0|0', 'FORWARD', null, null, null, '1');
INSERT INTO `card_types` VALUES ('23', 'SPELL', 'Callback', 'Target unit you control is returned to your hand.', 'Everyone deserves a second chance.', null, '0', '0', '0', '0', '0', '1', '0', '0', '1|Callback', '492', '0', null, '0', null, 'TILE', null, null, null, '1');
INSERT INTO `card_types` VALUES ('24', 'STRUCTURE', 'Catapult of Goo', 'Units attacked by Catapult of Goo have their Countdown increased by 1.', '\"I don\'t know if the piddlejacks are drivers or parasites on that infernal machine.\" \\n- Ihrbraman, Creature Collector.', 'Artillery', '0', '4', '1', '2', '0', '0', '0', '3', '2|AttackGooCatapult|AttackGooCatapultDummy', '493', '450', '89.5,80.3,0.25', '103', null, 'RADIUS_4', '1|Lobber|This unit attacks at a specific section of the board.', 'action_catapult_goo', 'impact_catapult_goo', '1');
INSERT INTO `card_types` VALUES ('25', 'SPELL', 'Thunder Surge', 'Target unit, and all units connected by adjacent units, receive 2 damage.', 'Fear not the thunder. Fear the lightning.', null, '2', '0', '0', '0', '0', '0', '0', '6', '1|ThunderSurge', '494', '0', null, '0', null, 'SEQUENTIAL', null, null, null, '1');
INSERT INTO `card_types` VALUES ('26', 'ENCHANTMENT', 'Champion Ring', 'Enchanted unit gets +2 Attack.', 'Hard to earn, even harder to carry.', null, '0', '0', '0', '0', '0', '0', '2', '0', '1|ChampionRing', '715', '0', null, '0', null, null, null, null, null, '1');
INSERT INTO `card_types` VALUES ('27', 'SPELL', 'Burn', 'Deal 3 damage to target unit. If that unit is destroyed, draw 1 scroll.', '\"If you can\'t handle the fire, cool yourself in the kettle.\" \\n - Old machine priest saying.', null, '0', '0', '0', '0', '0', '0', '0', '4', '1|Burn', '496', '0', null, '0', null, 'TILE', null, 'action_burn', null, '1');
INSERT INTO `card_types` VALUES ('29', 'SPELL', 'Fertile Soil', 'Sacrifice target creature you control and draw 3 scrolls.', 'The Kinfolk don\'t mourn their dead; nature doesn\'t waste life.', null, '2', '0', '0', '0', '0', '0', '4', '0', '1|FertileSoil', '497', '0', null, '0', null, 'TILE', null, null, null, '1');
INSERT INTO `card_types` VALUES ('30', 'ENCHANTMENT', 'Death Cap Berserk', 'When Death Cap Berserk comes into play, and at the beginning of its following turns, enchanted creature\'s Countdown is decreased by 2. At the end of these turns, it is dealt 2 damage.', '\"I love music. Especially wardrums.\" \\n- Harald, Berserker', null, '2', '0', '0', '0', '0', '0', '3', '0', '1|DeathCapBerserk', '498', '0', null, '0', null, null, null, null, null, '1');
INSERT INTO `card_types` VALUES ('32', 'STRUCTURE', 'Destroyer', null, 'About to dodge? It\'s too late!', 'Artillery', '1', '4', '2', '1', '0', '0', '0', '4', '1|AttackCatapult', '499', '451', '73.05,67.2,0.25', '104', null, 'RADIUS_4', '1|Lobber|This unit attacks at a specific section of the board.', null, 'impact_wood_hard_00', '1');
INSERT INTO `card_types` VALUES ('33', 'STRUCTURE', 'Druid Burial Ground', 'At the beginning of your turn, Druid Burial Ground heals 1 Health of all adjacent units.', '\"I once saw two cats fighting next to such a monument. The fight lasted a week, then they starved to death.\"\\n- Ihrbraman, Creature Collector.', 'Wall', '1', '5', '0', '-1', '0', '0', '3', '0', '1|HealSurrounding', '500', '452', '96.3,98.3,0.25', '105', null, null, null, null, null, '1');
INSERT INTO `card_types` VALUES ('34', 'SPELL', 'Quake', 'Deal 3 damage to all structures and 2 damage to all creatures.', 'No matter your skill, you can\'t parry the ground.', null, '2', '0', '0', '0', '0', '0', '6', '0', '1|Quake', '501', '0', null, '0', null, 'UNDEFINED', null, null, null, '1');
INSERT INTO `card_types` VALUES ('35', 'SPELL', 'Inferno Blast', 'Deal 1 damage to target tile and all adjacent tiles.', 'The power of ten men in one practical projectile.', null, '0', '0', '0', '0', '0', '0', '0', '3', '1|InfernoBlast', '502', '0', null, '0', null, 'RADIUS_7', null, 'action_burn', null, '1');
INSERT INTO `card_types` VALUES ('36', 'SPELL', 'Flip', 'Move target opponent unit to any unoccupied tile on opponent\'s board.', 'A shift in perspective isn\'t always a good thing.', null, '1', '0', '0', '0', '0', '2', '0', '0', '1|Flip', '503', '0', null, '0', null, 'UNDEFINED', null, null, null, '1');
INSERT INTO `card_types` VALUES ('37', 'SPELL', 'Frost Wind', 'Add +1 Countdown to units on target tile and all adjacent tiles.', 'Packing an extra blanket is always good. Or five, if you\'re heading north.', null, '1', '0', '0', '0', '0', '2', '0', '0', '1|FrostWind', '504', '0', null, '0', null, 'RADIUS_7', null, 'action_frost_wind', null, '1');
INSERT INTO `card_types` VALUES ('38', 'CREATURE', 'Great Wolf', 'Great Wolf gets +1 Attack for every other Wolf you control.', 'The beasts have legends too.', 'Beast,Wolf', '2', '5', '3', '2', '0', '0', '5', '0', '3|AttackForwardContinuous|Move|GreatWolfStrengthModifier', '505', '453', '97.5,22.6,0.25', '106', '1|Move|Move|Move unit to adjacent tile|0|0|0|0', 'FORWARD', '1|Relentless|If opponent blocking unit is destroyed, this creature will continue its attack.', 'action_bite_00', null, '1');
INSERT INTO `card_types` VALUES ('39', 'CREATURE', 'Iron Ogre', null, 'Step aside or be disintegrated.', 'Elder', '2', '7', '7', '3', '0', '0', '0', '7', '2|AttackForwardContinuous|Move', '506', '454', '84.4,91.5,0.25', '107', '1|Move|Move|Move unit to adjacent tile|0|0|0|0', 'FORWARD', '1|Relentless|If opponent blocking unit is destroyed, this creature will continue its attack.', null, null, '1');
INSERT INTO `card_types` VALUES ('40', 'STRUCTURE', 'Junkyard', 'Rat creatures you control gain +1 Health while Junkyard is in play.', 'Rats aren\'t picky.', 'Wall', '0', '3', '0', '-1', '0', '0', '1', '0', '1|RatHealthModifier', '507', '455', '80.55,116.3,0.25', '108', null, null, null, null, null, '1');
INSERT INTO `card_types` VALUES ('41', 'CREATURE', 'Kinfolk Brave', null, 'Braves are eager to prove their worth. The Jarls are happy to let them.', 'Human,Kinfolk', '2', '2', '2', '1', '0', '0', '2', '0', '2|AttackForward|Move', '508', '456', '96.9,71.6,0.25', '109', '1|Move|Move|Move unit to adjacent tile|0|0|0|0', 'FORWARD', null, null, null, '1');
INSERT INTO `card_types` VALUES ('42', 'CREATURE', 'Kinfolk Jarl', 'For each creature adjacent to Kinfolk Jarl, Kinfolk Jarl gains +1 Attack. ', 'The strength of his people, crushing your people.', 'Human,Kinfolk', '2', '6', '3', '2', '0', '0', '7', '0', '3|AttackForwardContinuous|SurroundingIncAp|Move', '509', '839', '61.15,106.3,0.25', '238', '1|Move|Move|Move unit to adjacent tile|0|0|0|0', 'FORWARD', '1|Relentless|If opponent blocking unit is destroyed, this creature will continue its attack.', null, null, '1');
INSERT INTO `card_types` VALUES ('43', 'ENCHANTMENT', 'Leeching Ring', 'When enchanted creature deals damage, enchanted creature is healed by as much Health as its original Countdown.', 'Search the ponds. Find one and your name is eternal.', null, '1', '0', '0', '0', '0', '0', '1', '0', '1|LeechingRing', '510', '0', null, '0', null, null, null, null, null, '1');
INSERT INTO `card_types` VALUES ('44', 'CREATURE', 'Mangy Wolf', 'When Mangy Wolf deals damage, it is healed by one. Other Wolf creatures you control have their Countdown decreased by 1 when Mangy Wolf comes into play.', '\"The fat wolf is not dangerous.\"\\n - Kinfolk proverb', 'Beast,Wolf', '0', '3', '2', '2', '0', '0', '4', '0', '4|AttackForward|Move|HealOneOnDamage|CountdownWolvesOnEnterBoard', '511', '458', '94.1,12.4,0.25', '111', '1|Move|Move|Move unit to adjacent tile|0|0|0|0', 'FORWARD', null, 'action_bite_01', null, '1');
INSERT INTO `card_types` VALUES ('45', 'ENCHANTMENT', 'Dryadic Power', 'Enchanted creature gains +1 Attack and +3 Health, and its Move is decreased by 1.', 'The strength of a tree with the resolve of a rock.', null, '1', '0', '0', '0', '0', '0', '1', '0', '1|DryadicPower', '512', '0', null, '0', null, null, null, null, null, '1');
INSERT INTO `card_types` VALUES ('47', 'ENCHANTMENT', 'Potion of Resistance', 'All damage dealt to enchanted unit is reduced to 1 for 3 rounds.', 'Sometimes you\'ve just got to take the hit.', null, '2', '0', '0', '0', '0', '0', '0', '1', '1|PotionOfResistance', '720', '0', null, '0', null, null, null, null, null, '1');
INSERT INTO `card_types` VALUES ('48', 'SPELL', 'Pushback', 'Target opponent unit is returned to its owner\'s hand.', 'You know you\'re not wanted when your body dissolves.', null, '1', '0', '0', '0', '0', '4', '0', '0', '1|Pushback', '514', '0', null, '0', null, 'TILE', null, 'action_pushback', null, '1');
INSERT INTO `card_types` VALUES ('49', 'CREATURE', 'Ragged Wolf', null, 'Fast and feisty.', 'Beast,Wolf', '0', '2', '1', '2', '0', '0', '1', '0', '3|AttackForward|Move|Haste', '515', '459', '94.2,12.4,0.25', '112', '1|Move|Move|Move unit to adjacent tile|0|0|0|0', 'FORWARD', '1|Haste|Creature comes in play with Countdown set to 0.', 'action_bite_01', null, '1');
INSERT INTO `card_types` VALUES ('50', 'SPELL', 'Kabonk', 'Deal 1 damage to target unit. Draw 1 scroll.', 'Ouch!', null, '0', '0', '0', '0', '0', '2', '0', '0', '1|Kabonk', '516', '0', null, '0', null, 'TILE', null, null, null, '1');
INSERT INTO `card_types` VALUES ('51', 'STRUCTURE', 'Shrine', 'While Shrine is in play, all other units you control gain +1 Health.', 'With a strong enough faith, you don\'t need gods for miracles.', 'Totem', '2', '2', '0', '-1', '0', '3', '0', '0', '1|ShrineIncHp', '517', '460', '45.55,95.8,0.25', '113', null, null, null, null, null, '1');
INSERT INTO `card_types` VALUES ('52', 'CREATURE', 'Sinmarked Zealot', 'When Countdown is 0, Sinmarked Zealot can be sacrificed to deal 2 damage to target unit.', 'When his time comes, so will yours.', 'Human', '1', '1', '1', '2', '0', '1', '0', '0', '3|AttackForward|Move|SacrificeAttack', '518', '461', '91.8,72,0.25', '239', '2|Move|Move|Move unit to adjacent tile|0|0|0|0|SacrificeAttack|Sacrifice Attack|Deal 2 damage to selected enemy and kills itself.|0|0|0|0', 'FORWARD', null, null, null, '1');
INSERT INTO `card_types` VALUES ('53', 'CREATURE', 'Sister of the Fox', 'When Sister of the Fox comes into play, draw 1 scroll.', 'The eyes and ears of the Jarl.', 'Human,Kinfolk', '0', '1', '1', '2', '0', '0', '2', '0', '3|AttackForward|Move|DrawScrollOnEnterBoard', '873', '883', '42.25,83.8,0.25', '275', '1|Move|Move|Move unit to adjacent tile|0|0|0|0', 'FORWARD', null, null, null, '1');
INSERT INTO `card_types` VALUES ('54', 'CREATURE', 'Royal Vanguard', 'When Royal Vanguard\'s Countdown becomes 0, adjacent units gain +2 Attack until end of turn.', 'Honor. Power. Axe.', 'Human,Knight', '2', '5', '3', '2', '0', '5', '0', '0', '3|AttackForward|Move|Vanguard', '520', '463', '57.75,116.25,0.25', '116', '1|Move|Move|Move unit to adjacent tile|0|0|0|0', 'FORWARD', null, null, null, '1');
INSERT INTO `card_types` VALUES ('55', 'SPELL', 'Speed', 'Target unit\'s Countdown is decreased by 3.', 'They won\'t know what hit them.', null, '2', '0', '0', '0', '0', '3', '0', '0', '1|Speed', '521', '0', null, '0', null, 'TILE', null, null, null, '1');
INSERT INTO `card_types` VALUES ('56', 'SPELL', 'Essence Feast', 'For each unit you control, heal your idol on the same row by 1. Beast creatures deal double damage to idols this turn.', 'Just like love, it can heal and hurt.', null, '2', '0', '0', '0', '0', '0', '6', '0', '1|EssenceFeast', '522', '0', null, '0', null, 'UNDEFINED', null, null, null, '1');
INSERT INTO `card_types` VALUES ('57', 'SPELL', 'Pother', 'Target unit is moved to a random adjacent tile. Draw 1 scroll.', 'Now you\'re there, now you\'re not!', null, '1', '0', '0', '0', '0', '1', '0', '0', '1|Pother', '523', '0', null, '0', null, 'TILE', null, null, null, '1');
INSERT INTO `card_types` VALUES ('58', 'ENCHANTMENT', 'Unleash Inner Power', 'Target creature\'s Attack is increased by its Health value. Its Health is then set to 2.', 'My very essence shall be my blade.', null, '2', '0', '0', '0', '0', '0', '4', '0', '1|UnleashInnerPower', '524', '0', null, '0', null, null, null, null, null, '1');
INSERT INTO `card_types` VALUES ('59', 'CREATURE', 'Lifestealer', 'When Lifestealer attacks and destroys a unit, Lifestealer is fully healed.', 'One day he\'ll pay for these borrowed lives.', 'Human', '1', '5', '4', '2', '5', '0', '0', '0', '3|AttackForward|Move|HealVampire', '716', '840', '41.25,86.3,0.25', '240', '1|Move|Move|Move unit to adjacent tile|0|0|0|0', 'FORWARD', null, null, null, '1');
INSERT INTO `card_types` VALUES ('60', 'STRUCTURE', 'Eternal Statue', 'At the beginning of your turn, Eternal Statue heals 1 point of Health.', 'It\'s said some sculptors infuse their work with a life of its own.', 'Wall', '0', '4', '0', '-1', '0', '0', '2', '0', '1|HealSelf', '526', '465', '61.65,111,0.25', '118', null, null, null, null, null, '1');
INSERT INTO `card_types` VALUES ('61', 'STRUCTURE', 'Waking Stones', 'All damage dealt to Waking Stones is reduced to 1.', '\"The problem with stone is that it is stationary. We fixed that.\"\\n- Uria, Geo Mage.', 'Wall', '2', '3', '0', '-1', '0', '3', '0', '0', '1|ReduceDamage', '527', '466', '48.75,117.3,0.25', '119', null, null, null, null, null, '1');
INSERT INTO `card_types` VALUES ('62', 'SPELL', 'Transposition', 'Switch places of two units you control. Draw 1 scroll.', 'You don\'t need powerful allies. You need allies in the right places.', null, '0', '0', '0', '0', '0', '1', '0', '0', '1|Transposition', '528', '0', null, '0', null, 'UNDEFINED', null, null, null, '1');
INSERT INTO `card_types` VALUES ('63', 'STRUCTURE', 'Vitality Well', 'When Vitality Well\'s Countdown becomes 0, all friendly units are healed by 1.', 'Refreshing!', 'Totem', '0', '3', '0', '3', '0', '0', '2', '0', '2|VitalityWell|Haste', '529', '467', '49.05,-0.5,0.25', '259', null, null, '1|Haste|Creature comes in play with Countdown set to 0.', null, null, '1');
INSERT INTO `card_types` VALUES ('64', 'SPELL', 'Blessing of Haste', 'Target unit\'s Countdown is decreased by 1.', 'A little bit of speed can make all the difference.', null, '1', '0', '0', '0', '0', '1', '0', '0', '1|BlessingOfHaste', '530', '0', null, '0', null, 'TILE', null, null, null, '1');
INSERT INTO `card_types` VALUES ('65', 'STRUCTURE', 'Ancestral Totem', 'While Ancestral Totem is in play, creatures you control gain +1 Attack.', 'Kinfolk creations aren\'t always pleasant.', 'Totem', '2', '2', '0', '-1', '0', '0', '4', '0', '1|TotemPower', '531', '468', '41,85.75,0.25', '121', null, null, null, null, null, '1');
INSERT INTO `card_types` VALUES ('66', 'CREATURE', 'Copper Automaton', 'Copper Automaton is destroyed after attacking.', 'Explosively cute.', 'Automaton', '0', '2', '4', '1', '0', '0', '0', '1', '3|AttackForward|Move|DieAfterAttack', '532', '469', '62.75,-22.45,0.25', '199', '1|Move|Move|Move unit to adjacent tile|0|0|0|0', 'FORWARD', null, 'action_copperauto', null, '1');
INSERT INTO `card_types` VALUES ('67', 'SPELL', 'Spark', 'Deal 2 points of damage to target unit.', 'The smallest spark can cause a decent flame.', null, '0', '0', '0', '0', '0', '0', '0', '2', '1|Spark', '533', '0', null, '0', null, 'TILE', null, 'action_burn', null, '1');
INSERT INTO `card_types` VALUES ('68', 'CREATURE', 'Cannon Automaton', null, 'wrrr wrrr clunk phssssht BwoooOOOM wrrr wrrr', 'Automaton', '1', '4', '5', '2', '0', '0', '0', '6', '3|AttackForwardRanged|Move|ArmorModifier', '534', '470', '101.2,111.45,0.25', '256', '1|Move|Move|Move unit to adjacent tile|0|0|0|0', 'FORWARD', '2|Ranged attack|This unit does not take damage from attacking Spiky units.|Armor 1|All combat damage dealt to Cannon Automaton is reduced by 1.', null, null, '1');
INSERT INTO `card_types` VALUES ('69', 'STRUCTURE', 'Bitter Root', 'When Bitter Root is attacked in melee, attacking unit becomes poisoned for 3 rounds.', '\"Sure, there\'s plenty to eat in the swamps. Shame it\'s all poisoned.\" \\n - Gundar, Marsh Guide.', 'Wall', '1', '2', '0', '-1', '2', '0', '0', '0', '1|BitterPoison', '535', '471', '83.8,25.55,0.25', '124', null, null, null, null, null, '1');
INSERT INTO `card_types` VALUES ('70', 'SPELL', 'Violent Dispersal', 'Destroy target unit.', '\"When he said \'Disperse!\' I thought he meant all of us. Turns out he was only addressing poor Mikal.\" \\n- Mahts, Infantryman.', null, '2', '0', '0', '0', '0', '0', '0', '6', '1|ViolentDispersal', '536', '0', null, '0', null, 'TILE', null, null, null, '1');
INSERT INTO `card_types` VALUES ('71', 'SPELL', 'Focus', 'Target unit gains +3 Attack until end of turn.', 'If it\'s worth killing, kill it good!', null, '0', '0', '0', '0', '0', '1', '0', '0', '1|Focus', '537', '0', null, '0', null, 'TILE', null, null, null, '1');
INSERT INTO `card_types` VALUES ('73', 'SPELL', 'New Orders', 'All your units have their Move increased by 1 until end of turn.', 'REGROUP!', null, '0', '0', '0', '0', '0', '1', '0', '0', '1|NewOrders', '538', '0', null, '0', null, 'UNDEFINED', null, null, null, '1');
INSERT INTO `card_types` VALUES ('74', 'CREATURE', 'Honorable General', 'When Honorable General\'s Countdown becomes 0, all adjacent units have their Countdown decreased by 2. ', null, 'Human,Knight', '2', '6', '4', '3', '0', '6', '0', '0', '3|AttackForward|TriggerSurroundingZeroAc|Move', '829', '828', '104.9,154.7,0.25', '241', '1|Move|Move|Move unit to adjacent tile|0|0|0|0', 'FORWARD', null, null, null, '1');
INSERT INTO `card_types` VALUES ('75', 'CREATURE', 'Kinfolk Veteran', null, 'It\'s tough getting old in this business.', 'Human,Kinfolk', '1', '4', '3', '2', '0', '0', '5', '0', '3|AttackForward|Move|Haste', '540', '788', '113.1,78.1,0.25', '207', '1|Move|Move|Move unit to adjacent tile|0|0|0|0', 'FORWARD', '1|Haste|Creature comes in play with Countdown set to 0.', null, null, '1');
INSERT INTO `card_types` VALUES ('76', 'SPELL', 'Rumble', 'Opponent\'s units move one step to a random adjacent empty tile.', 'Shaken, not crushed.', null, '1', '0', '0', '0', '0', '0', '3', '0', '1|Rumble', '541', '0', null, '0', null, 'UNDEFINED', null, null, null, '1');
INSERT INTO `card_types` VALUES ('77', 'SPELL', 'Fury', 'All units decrease their Countdown by 1.', 'Fanning the flames of battle.', null, '1', '0', '0', '0', '0', '0', '0', '3', '1|Fury', '542', '0', null, '0', null, 'UNDEFINED', null, 'action_fury', null, '1');
INSERT INTO `card_types` VALUES ('78', 'SPELL', 'Crimson Bull', 'All units you control gain +2 Attack until end of turn.', 'Drink, and take flight!', null, '1', '0', '0', '0', '0', '0', '2', '0', '1|CrimsonBull', '734', '0', null, '0', null, 'UNDEFINED', null, null, null, '1');
INSERT INTO `card_types` VALUES ('79', 'CREATURE', 'Machine Priest', 'Instead of attacking, Machine Priest heals all your structures by 1. When Countdown is 0, Machine Priest can move a structure one step in a random direction instead of healing.', null, 'Human,Tribesman', '1', '4', '0', '2', '0', '0', '0', '2', '3|Move|DyrrianHeal|DisplaceStructure', '544', '474', '81.7,68.8,0.25', '127', '2|Move|Move|Move unit to adjacent tile|0|0|0|0|DisplaceStructure|Displace Structure|Target structure is moved to a random unoccupied, adjacent tile.|0|0|0|0', null, null, null, null, '1');
INSERT INTO `card_types` VALUES ('80', 'ENCHANTMENT', 'Ember Bonds', 'Enchanted unit receives 2 damage before attacking.', 'It\'s inevitable.', null, '1', '0', '0', '0', '0', '0', '0', '3', '1|EmberBonds', '545', '0', null, '0', null, null, null, null, null, '1');
INSERT INTO `card_types` VALUES ('81', 'SPELL', 'End of Reason', 'Sacrifice all units you control with a non-zero Countdown. Each unit sacrificed this way deals 2 damage to opponent units on the same row.', '\"You served me well as soldiers. Now serve me as projectiles!\"\\n- Arran, Machine Priest', null, '2', '0', '0', '0', '0', '0', '0', '5', '1|EndOfReason', '546', '0', null, '0', null, 'UNDEFINED', null, null, null, '1');
INSERT INTO `card_types` VALUES ('82', 'STRUCTURE', 'Ether Pump', 'When Ether Pump attacks, all opponent\'s units are dealt 1 damage.', '\"I know what it looks like! Trust me. A few of these will win any siege.\" \\n- Arran, Machine Priest', 'Totem', '1', '5', '0', '3', '0', '0', '0', '4', '1|EtherAttack', '547', '475', '52.3,55.3,0.25', '128', null, null, null, null, null, '1');
INSERT INTO `card_types` VALUES ('83', 'ENCHANTMENT', 'Golem Skin', 'When Golem Skin comes into play, sacrifice all your structures. Enchanted creature gains Attack and Health equal to the number of structures sacrificed.', 'When you wear machines, laundry day is your greatest worry.', null, '0', '0', '0', '0', '0', '0', '0', '2', '1|GolemSkin', '548', '0', null, '0', null, null, null, null, null, '1');
INSERT INTO `card_types` VALUES ('84', 'SPELL', 'Frost Gale', 'Deal 1 damage to all units.', 'Bad weather is a great weapon. If only you could aim it.', null, '0', '0', '0', '0', '0', '0', '2', '0', '1|FrostGale', '549', '0', null, '0', null, 'UNDEFINED', null, null, null, '1');
INSERT INTO `card_types` VALUES ('85', 'ENCHANTMENT', 'Magma Pack', 'When Magma Pack comes into play, enchanted unit\'s Attack is doubled. Enchanted unit is destroyed after attacking.', 'Don\'t worry, just push the button when you arrive.', null, '1', '0', '0', '0', '0', '0', '0', '2', '1|MagmaPack', '550', '0', null, '0', null, null, null, null, null, '1');
INSERT INTO `card_types` VALUES ('86', 'ENCHANTMENT', 'Plate Armor', 'Enchanted unit has Armor 1 (combat damage dealt to enchanted unit is decreased by 1).', '\"If only we had enough for everyone...\"\\n- Lord Ungstram, Royal Strategist.', null, '2', '0', '0', '0', '0', '2', '0', '0', '1|PlateArmor', '551', '0', null, '0', null, null, null, null, null, '1');
INSERT INTO `card_types` VALUES ('87', 'SPELL', 'Tick Bomb', 'Destroy target structure.', 'Sounds like tick, looks like tick.', null, '0', '0', '0', '0', '0', '0', '0', '3', '1|TickBomb', '552', '0', null, '0', null, 'TILE', null, null, null, '1');
INSERT INTO `card_types` VALUES ('88', 'ENCHANTMENT', 'Vitriol Aura', 'When enchanted unit is attacked in melee combat, attacker becomes poisoned for 3 rounds.', 'Try not to breathe.', null, '0', '0', '0', '0', '0', '0', '1', '0', '1|VitriolAura', '826', '0', null, '0', null, null, null, null, null, '1');
INSERT INTO `card_types` VALUES ('89', 'SPELL', 'Eye of Eagle', 'Take the next creature scroll from your library and add it to your hand.', 'Strategy is nothing if you\'re blind.', null, '0', '0', '0', '0', '0', '0', '1', '0', '1|EyeOfEagle', '554', '0', null, '0', null, 'UNDEFINED', null, null, null, '1');
INSERT INTO `card_types` VALUES ('90', 'STRUCTURE', 'Proximity Charge', 'When Proximity Charge is destroyed in melee combat, attacking unit is dealt 4 damage. When Proximity Charge comes into play, one copy is summoned on a random adjacent tile.', 'Tread lightly!', 'Wall', '0', '1', '0', '-1', '0', '0', '0', '4', '2|ProximityCharge|SummonCopyOnEnterBoard', '555', '476', '65.8,-63.2,0.25', '0', null, null, null, null, null, '1');
INSERT INTO `card_types` VALUES ('91', 'CREATURE', 'Frostbeard', 'When Frostbeard is killed in battle, all friendly units gain +2 Attack until end of your turn.', 'An honorable death is not to be mourned; it\'s a blessing.', 'Human,Kinfolk', '0', '1', '6', '3', '0', '0', '3', '0', '3|AttackForward|Move|FrostBeardMoraleBoost', '573', '571', '100.7,61.05,0.25', '131', '1|Move|Move|Move unit to adjacent tile|0|0|0|0', 'FORWARD', null, null, null, '1');
INSERT INTO `card_types` VALUES ('92', 'ENCHANTMENT', 'Heritage', 'When enchanted unit you control is destroyed, you draw 2 scrolls.', '\"This way your life, or death, won\'t be a complete waste.\" \\n- Lord Ungstram, Royal Strategist.', null, '1', '0', '0', '0', '0', '3', '0', '0', '1|Heritage', '557', '0', null, '0', null, null, null, null, null, '1');
INSERT INTO `card_types` VALUES ('93', 'SPELL', 'Faith Blessing', 'Target unit you control takes 2 damage. Your idol on that row is healed by 4.', '\"It\'s an immense honor. Be grateful for it.\" \\n- Pater Brecht', null, '1', '0', '0', '0', '0', '2', '0', '0', '1|FaithBlessing', '718', '0', null, '0', null, 'TILE', null, null, null, '1');
INSERT INTO `card_types` VALUES ('94', 'SPELL', 'Nutrition', 'Sacrifice target unit you control and add that unit\'s cost to your current resources.', 'A cadaver for some, a feast for others.', null, '1', '0', '0', '0', '0', '0', '1', '0', '1|Nutrition', '559', '0', null, '0', null, 'TILE', null, null, null, '1');
INSERT INTO `card_types` VALUES ('95', 'ENCHANTMENT', 'Powerbound', 'When enchanted unit you control is destroyed, increase your Order by one.', '\"I\'ll just borrow some life force when you don\'t need it anymore.\"\\n- Lord Ungstram, Royal Strategist.', null, '0', '0', '0', '0', '0', '1', '0', '0', '1|OrderOnDeathEnch', '560', '0', null, '0', null, null, null, null, null, '1');
INSERT INTO `card_types` VALUES ('96', 'CREATURE', 'Gun Automaton', null, 'A special kind of turtle.', 'Automaton', '0', '3', '2', '2', '0', '0', '0', '2', '2|AttackForwardRanged|Move', '561', '477', '47.2,-19,0.25', '201', '1|Move|Move|Move unit to adjacent tile|0|0|0|0', 'FORWARD', '1|Ranged attack|This unit does not take damage from attacking Spiky units.', null, null, '1');
INSERT INTO `card_types` VALUES ('97', 'ENCHANTMENT', 'Vengeance Veil', 'When enchanted unit takes damage, its Countdown decreases by 1.', 'All is blood from behind the crimson veil.', null, '0', '0', '0', '0', '0', '1', '0', '0', '1|VengeanceVeil', '721', '0', null, '0', null, null, null, null, null, '1');
INSERT INTO `card_types` VALUES ('98', 'STRUCTURE', 'Useless Contraption', null, 'Working as intended.', 'Wall', '0', '4', '0', '-1', '0', '0', '0', '1', null, '563', '478', '58.9,8,0.25', '130', null, null, null, null, null, '1');
INSERT INTO `card_types` VALUES ('99', 'SPELL', 'Purification', 'Remove all enchantments from target unit.', 'The innocence of youth can cleanse the corrupt.', null, '0', '0', '0', '0', '0', '1', '0', '0', '1|Purification', '564', '0', null, '0', null, 'TILE', null, null, null, '1');
INSERT INTO `card_types` VALUES ('100', 'ENCHANTMENT', 'Ranger\'s Bane', 'Enchanted creature becomes poisoned for 3 rounds.', 'You haven\'t really died until you\'ve been slowly strangled by poisonous roots.', null, '1', '0', '0', '0', '0', '0', '2', '0', '1|RangersBane', '565', '0', null, '0', null, null, null, null, null, '1');
INSERT INTO `card_types` VALUES ('101', 'SPELL', 'Horn of Ages', 'All units opponent controls have their Move decreased by 1 until end of opponent\'s turn.', 'You\'re thankful for surviving battles past, until you crumble under the weight of the memories.', null, '0', '0', '0', '0', '0', '1', '0', '0', '1|HornOfAges', '566', '0', null, '0', null, 'UNDEFINED', null, null, null, '1');
INSERT INTO `card_types` VALUES ('102', 'ENCHANTMENT', 'Mire Curse', 'Enchanted unit deals 1 poison damage to adjacent creatures at the beginning of each of its turns.', 'It\'s putrid, but it\'s home.', null, '1', '0', '0', '0', '2', '0', '0', '0', '1|MireCurse', '567', '0', null, '0', null, null, null, null, null, '1');
INSERT INTO `card_types` VALUES ('103', 'ENCHANTMENT', 'Faith Chains', 'When enchanted creature is destroyed, Faith Chains deals 1 damage to each of opponent\'s idols.', '\"The chains weigh heavier on them, my son.\" \\n- Pater Brecht', null, '2', '0', '0', '0', '0', '4', '0', '0', '1|FaithChains', '568', '0', null, '0', null, null, null, null, null, '1');
INSERT INTO `card_types` VALUES ('104', 'ENCHANTMENT', 'Bloodboil', 'When enchanted unit takes damage, increase the unit\'s Attack by 1.', 'AURRGH... YOU... I... KILL RAAAHH!!', null, '0', '0', '0', '0', '0', '0', '1', '0', '1|Bloodboil', '569', '0', null, '0', null, null, null, null, null, '1');
INSERT INTO `card_types` VALUES ('105', 'SPELL', 'Summons', 'Draws one Structure from your library.', '\"We need more stuff!\" \\n- Lord Ungstram, Royal Strategist.', null, '0', '0', '0', '0', '0', '1', '0', '0', '1|Summons', '570', '0', null, '0', null, 'UNDEFINED', null, null, null, '1');
INSERT INTO `card_types` VALUES ('107', 'CREATURE', 'Scattergunner', null, '\"He was carrying WHAT?!\"\\n- Mahts, Infantryman.', 'Human,Tribesman', '1', '2', '4', '2', '0', '0', '0', '3', '2|AttackForwardRanged|Move', '574', '572', '100.5,62.25,0.25', '205', '1|Move|Move|Move unit to adjacent tile|0|0|0|0', 'FORWARD', '1|Ranged attack|This unit does not take damage from attacking Spiky units.', 'action_scattergun', 'impact_scattergun', '1');
INSERT INTO `card_types` VALUES ('108', 'STRUCTURE', 'Law Memorial', 'When Law Memorial comes into play, increase Order by 1.', 'You\'d think a people so fond of writing would remember the words of their ancestors.', 'Memorial', '0', '1', '0', '-1', '0', '0', '0', '2', '1|IncOutputOrder', '591', '575', '36.15,40.6,0.25', '133', null, null, null, null, null, '1');
INSERT INTO `card_types` VALUES ('109', 'STRUCTURE', 'Desert Memorial', 'When Desert Memorial comes into play, increase Energy by 1.', 'Breakers against the eroding waves of time.', 'Memorial', '0', '1', '0', '-1', '0', '2', '0', '0', '1|IncOutputEnergy', '592', '576', '41.15,6.65,0.25', '134', null, null, null, null, null, '1');
INSERT INTO `card_types` VALUES ('110', 'STRUCTURE', 'Tribal Memorial', 'When Tribal Memorial comes into play, increase Growth by 1.', 'Lest we forget the times of peace.', 'Memorial', '0', '1', '0', '-1', '0', '0', '0', '2', '1|IncOutputGrowth', '593', '577', '46.25,-11.45,0.25', '135', null, null, null, null, null, '1');
INSERT INTO `card_types` VALUES ('111', 'STRUCTURE', 'Woodland Memorial', 'When Woodland Memorial comes into play, increase Growth by 1.', 'The Kinfolk have forgotten, but the trees remember.', 'Memorial', '0', '1', '0', '-1', '0', '2', '0', '0', '1|IncOutputGrowth', '594', '578', '52.6,6.7,0.25', '136', null, null, null, null, null, '1');
INSERT INTO `card_types` VALUES ('112', 'STRUCTURE', 'Sand Pact Memorial', 'When Sand Pact Memorial comes into play, increase Energy by 1.', 'Like grains of sand in an hourglass, our memories fade over time.', 'Memorial', '0', '1', '0', '-1', '0', '0', '2', '0', '1|IncOutputEnergy', '595', '579', '41.15,6.15,0.25', '137', null, null, null, null, null, '1');
INSERT INTO `card_types` VALUES ('113', 'STRUCTURE', 'Stone Pact Memorial', 'When Stone Pact Memorial comes into play, increase Order by 1.', 'We remember the times, but not the promises.', 'Memorial', '0', '1', '0', '-1', '0', '0', '2', '0', '1|IncOutputOrder', '596', '580', '41.15,23.15,0.25', '138', null, null, null, null, null, '1');
INSERT INTO `card_types` VALUES ('114', 'ENCHANTMENT', 'Illthorn Seed', 'When enchanted unit you control is destroyed, summon Illthorn in its place.', 'This corpse brings its own flowers to the funeral.', null, '0', '0', '0', '0', '0', '0', '1', '0', '1|IllthornSeed', '597', '0', null, '0', null, null, null, null, null, '1');
INSERT INTO `card_types` VALUES ('115', 'STRUCTURE', 'Illthorn', null, '\"Look, Barbra. Wires!\" \\n- Ihrbraman, Creature Collector.', 'Wall', '0', '3', '0', '-1', '0', '0', '2', '0', '1|Spiky1', '598', '841', '71.25,42,0.25', '242', null, null, '1|Spiky 1|When Illthorn is attacked in melee, Illthorn deals 1 damage to attacking unit.', null, null, '1');
INSERT INTO `card_types` VALUES ('116', 'SPELL', 'Decimation', 'All units on target row lose 1 Health. Opponent\'s idol on that row loses 2 Health.', 'One by one by one they fall, and now we\'ve reached the Cobalt Hall...', null, '2', '0', '0', '0', '0', '3', '0', '0', '1|Decimation', '599', '0', null, '0', null, 'ROW_FULL_IDOLS', null, null, null, '1');
INSERT INTO `card_types` VALUES ('117', 'SPELL', 'God Hand', 'All your units gain +2 Attack until end of turn, and have their Countdown decreased by 2.', 'Howl for the gods!', null, '2', '0', '0', '0', '0', '0', '8', '0', '1|GodHand', '600', '0', null, '0', null, 'UNDEFINED', null, null, null, '1');
INSERT INTO `card_types` VALUES ('118', 'STRUCTURE', 'Hellspitter Mortar', 'Attacks a randomly selected tile on opponent\'s board.', 'Aim? With enough power you don\'t need aim.', 'Artillery', '2', '6', '5', '2', '0', '0', '0', '3', '2|AttackHellspitter|AttackForwardRangedDummy', '601', '612', '151.4,169.3,0.25', '206', null, 'UNDEFINED', '1|Ranged attack|This unit does not take damage from attacking Spiky units.', 'action_hellfire_mortar', 'impact_hellfire_mortar', '1');
INSERT INTO `card_types` VALUES ('119', 'CREATURE', 'Knight Scholar', 'Draw 1 scroll if Countdown is 0. Countdown is reset to Knight Scholar\'s base value.', 'Knowledge is strength. ', 'Human,Knight', '2', '6', '3', '2', '0', '5', '0', '0', '3|AttackForward|Move|DrawScrollAbility', '874', '871', '57.85,111.15,0.25', '273', '2|Move|Move|Move unit to adjacent tile|0|0|0|0|DrawScrollAbility|Draw Scroll|draw a scroll|0|0|0|0', 'FORWARD', null, null, null, '1');
INSERT INTO `card_types` VALUES ('120', 'STRUCTURE', 'Obelisk', null, 'Good for leaning on. And hiding behind...', 'Wall', '0', '5', '0', '-1', '0', '2', '0', '0', null, '603', '583', '50.05,56.55,0.25', '141', null, null, null, null, null, '1');
INSERT INTO `card_types` VALUES ('121', 'CREATURE', 'Ducal Infantryman', 'All other creatures you control on the same row as Ducal Infantryman gain +1 Attack.', 'Strength in numbers.', 'Human,Soldier', '0', '3', '1', '2', '0', '2', '0', '0', '3|AttackForward|Move|InfantryIncAp', '604', '584', '68.05,85.6,0.25', '142', '1|Move|Move|Move unit to adjacent tile|0|0|0|0', 'FORWARD', null, null, null, '1');
INSERT INTO `card_types` VALUES ('122', 'CREATURE', 'Ducal Skirmisher', null, 'Slice and dice!', 'Human,Soldier', '0', '4', '3', '2', '0', '4', '0', '0', '2|AttackForwardContinuous|Move', '605', '585', '89.25,77.25,0.25', '143', '1|Move|Move|Move unit to adjacent tile|0|0|0|0', 'FORWARD', '1|Relentless|If opponent blocking unit is destroyed, this creature will continue its attack.', null, null, '1');
INSERT INTO `card_types` VALUES ('123', 'CREATURE', 'Ducal Spearman', null, 'If you bait them, they will come.', 'Human,Soldier', '0', '4', '1', '2', '0', '4', '0', '0', '3|AttackForward|Move|Spiky2', '606', '586', '60.85,117.3,0.25', '144', '1|Move|Move|Move unit to adjacent tile|0|0|0|0', 'FORWARD', '1|Spiky 2|When Ducal Spearman is attacked in melee, Ducal Spearman deals 2 damage to attacking unit.', null, null, '1');
INSERT INTO `card_types` VALUES ('124', 'ENCHANTMENT', 'Resonant Helm', 'Enchanted unit\'s Health is healed by 1 every time you play a spell or enchantment.', 'You\'ll hear the silent whispers of magic and it will change you.', null, '0', '0', '0', '0', '0', '1', '0', '0', '1|ResonantHelm', '607', '0', null, '0', null, null, null, null, null, '1');
INSERT INTO `card_types` VALUES ('125', 'CREATURE', 'Crossbowman', null, 'Locked, loaded, and lying in wait...', 'Human,Soldier', '0', '2', '4', '3', '0', '1', '0', '0', '2|AttackForwardRanged|Move', '608', '587', '93.75,70.75,0.25', '145', '1|Move|Move|Move unit to adjacent tile|0|0|0|0', 'FORWARD', '1|Ranged attack|This unit does not take damage from attacking Spiky units.', 'action_crossbowman_00', 'impact_crossbow_01', '1');
INSERT INTO `card_types` VALUES ('126', 'CREATURE', 'Royal Infantryman', 'All other creatures you control on the same row as Royal Infantryman gain +1 Health.', 'Yes, my Liege. I\'ll protect them, my Liege.', 'Human,Soldier', '1', '2', '1', '2', '0', '1', '0', '0', '3|AttackForward|Move|InfantryIncHp', '609', '588', '68.05,85.6,0.25', '146', '1|Move|Move|Move unit to adjacent tile|0|0|0|0', 'FORWARD', null, null, null, '1');
INSERT INTO `card_types` VALUES ('127', 'CREATURE', 'Royal Skirmisher', null, 'Double the swords, double the fun!', 'Human,Soldier', '1', '3', '3', '2', '0', '3', '0', '0', '2|AttackForwardContinuous|Move', '610', '589', '84,79.55,0.25', '147', '1|Move|Move|Move unit to adjacent tile|0|0|0|0', 'FORWARD', '1|Relentless|If opponent blocking unit is destroyed, this creature will continue its attack.', null, null, '1');
INSERT INTO `card_types` VALUES ('128', 'CREATURE', 'Royal Spearman', null, 'HOOOOOLLLD!', 'Human,Soldier', '1', '3', '2', '2', '0', '3', '0', '0', '3|AttackForward|Move|Spiky2', '611', '590', '60.85,125.3,0.25', '148', '1|Move|Move|Move unit to adjacent tile|0|0|0|0', 'FORWARD', '1|Spiky 2|When Royal Spearman is attacked in melee, Royal Spearman deals 2 damage to attacking unit.', null, null, '1');
INSERT INTO `card_types` VALUES ('129', 'CREATURE', 'Bunny', 'If Bunny\'s Attack is 0, it will summon another Bunny in an adjacent tile instead of attacking. ', 'Cute, crafty, and quick to procreate.', 'Beast,Bunny', '1', '1', '0', '3', '0', '0', '1', '0', '3|HasApAttackForward|SummonCopyAttack|Move', '719', '714', '21.3,-40.45,0.25', '243', '1|Move|Move|Move unit to adjacent tile|0|0|0|0', 'FORWARD', null, null, null, '1');
INSERT INTO `card_types` VALUES ('130', 'CREATURE', 'Gravelock Outcast', 'Pay one Growth to heal Gravelock Outcast to full health. ', '\"Cast out from gravelock society? Wow, that\'s some feat.\"\\n- Siani, Dyrran Historian', 'Gravelock', '0', '3', '2', '2', '0', '0', '0', '3', '3|AttackForward|GrowthRegenerateAbility|Move', '733', '732', '74.6,24.75,0.25', '244', '2|GrowthRegenerateAbility|Regenerate|Heal self to full health for one Growth|0|0|0|1|Move|Move|Move unit to adjacent tile|0|0|0|0', 'FORWARD', null, null, null, '1');
INSERT INTO `card_types` VALUES ('131', 'CREATURE', 'Tethered Recruit', 'When Tethered Recruit is destroyed, increase Order by 1.', '\"Its mind is muddled, but its heart is still with the army.\"\r\n\\n- Arhart, Mire Master', 'Human', '1', '1', '2', '2', '2', '0', '0', '0', '3|AttackForward|Move|IncOrderOnDeath', '762', '765', '68.05,91.85,0.25', '208', '1|Move|Move|Move unit to adjacent tile|0|0|0|0', 'FORWARD', null, null, null, '1');
INSERT INTO `card_types` VALUES ('134', 'SPELL', 'Efficiency', 'Target unit gains +1 Attack until end of turn. If that unit kills another unit this turn, increase Energy by 1.', 'The best discipline conserves energy.', null, '1', '0', '0', '0', '0', '1', '0', '0', '1|Efficiency', '763', '0', null, '0', null, 'TILE', null, null, null, '1');
INSERT INTO `card_types` VALUES ('137', 'SPELL', 'Return To Nature', 'Opponent creatures get -1 Health until end of turn. If a creature with this effect is killed, increase Growth by 1.', 'Wither and begin anew.', null, '1', '0', '0', '0', '2', '0', '0', '0', '1|ReturnToNature', '764', '0', null, '0', null, 'UNDEFINED', null, null, null, '1');
INSERT INTO `card_types` VALUES ('138', 'ENCHANTMENT', 'Blast Strike', 'Every time enchanted creature deals damage to a unit it also deals 1 damage to every unit adjacent to that unit.', '\"Needs more brutal.\"\\n- Arran, Machine Priest', null, '1', '0', '0', '0', '0', '0', '0', '2', '1|BlastStrike', '846', '0', null, '0', null, null, null, null, null, '1');
INSERT INTO `card_types` VALUES ('139', 'ENCHANTMENT', 'Rigged', 'Whenever enchanted structure is destroyed in melee combat, its attacker takes 4 damage.', 'Strap it on, then stand back.', null, '0', '0', '0', '0', '0', '0', '0', '1', '1|Rigged', '736', '0', null, '0', null, null, null, null, null, '1');
INSERT INTO `card_types` VALUES ('140', 'ENCHANTMENT', 'Overdrive', 'When Overdrive comes into play, and at the beginning of its following turns, enchanted structure\'s Countdown is decreased by 2. At the end of these turns, it is dealt 2 damage.', '\\n\"I know it\'ll break. I just\\ndon\'t care.\"\\n- Arran, Machine Priest', null, '1', '0', '0', '0', '0', '0', '0', '2', '1|Overdrive', '737', '0', null, '0', null, null, null, null, null, '1');
INSERT INTO `card_types` VALUES ('141', 'ENCHANTMENT', 'Plating', 'Enchanted unit disregards next attack or damage taken. Plating is removed afterwards.', 'Almost works like real armor.', null, '0', '0', '0', '0', '0', '0', '0', '1', '1|Plating', '738', '0', null, '0', null, null, null, null, null, '1');
INSERT INTO `card_types` VALUES ('142', 'SPELL', 'Iron Whip', 'Target unit takes 1 damage. Its Attack is increased by 1 until end of turn and Countdown decreased by 1. ', 'A whip for steel hides.', null, '1', '0', '0', '0', '0', '0', '0', '2', '1|IronWhip', '739', '0', null, '0', null, 'TILE', null, null, null, '1');
INSERT INTO `card_types` VALUES ('143', 'SPELL', 'Incendiaries', 'Opponent\'s Structures take 3 damage.', 'It\'s raining cats and bombs.', null, '0', '0', '0', '0', '0', '0', '0', '3', '1|Incendiaries', '740', '0', null, '0', null, 'UNDEFINED', null, null, null, '1');
INSERT INTO `card_types` VALUES ('145', 'ENCHANTMENT', 'Redesign', 'Target creature\'s Attack and Health switch values.', '\"Trust me, it\'s better this way.\"\\n-Amhan, Machine Master.', null, '1', '0', '0', '0', '0', '0', '0', '2', '1|Redesign', '741', '0', null, '0', null, null, null, null, null, '1');
INSERT INTO `card_types` VALUES ('146', 'SPELL', 'Desperation', 'Target creature gets +2 Attack until end of turn for each opponent unit on the same row. It is then dealt 1 damage.', 'Many a conqueror have been surprised by the ferocity of desperate defenders.', null, '0', '0', '0', '0', '0', '0', '0', '2', '1|Desperation', '742', '0', null, '0', null, 'TILE', null, null, null, '1');
INSERT INTO `card_types` VALUES ('147', 'SPELL', 'Blind Rage', 'Target creature deals damage equal to its Countdown to all adjacent units. Its Countdown is then increased by 1.', 'When you\'re seeing red, friends and foes look the same.', null, '1', '0', '0', '0', '0', '0', '0', '4', '1|BlindRage', '743', '0', null, '0', null, 'TILE', null, null, null, '1');
INSERT INTO `card_types` VALUES ('148', 'ENCHANTMENT', 'Machination Mindset', 'Enchanted melee creature becomes relentless. Its Attack is increased by 1.', 'No doubt, no fear, no thought.', null, '1', '0', '0', '0', '0', '0', '0', '3', '1|Relentless', '745', '0', null, '0', null, null, null, null, null, '1');
INSERT INTO `card_types` VALUES ('149', 'SPELL', 'Concentrate Fire', 'Target unit with Ranged or Lobber will make an extra attack after its next attack.', 'Double the fire, double the fun.', null, '1', '0', '0', '0', '0', '0', '0', '4', '1|ConcentrateFire', '747', '0', null, '0', null, 'TILE', null, null, null, '1');
INSERT INTO `card_types` VALUES ('150', 'CREATURE', 'Tool Initiate', 'When Tool Initiate\'s Countdown is 0, you may increase its Countdown by 1 to increase target structure\'s Attack by 1.', '\"Let me just tweak this...\"\\n-Amhan, Machine Master.', 'Human', '1', '3', '2', '2', '0', '0', '0', '2', '3|AttackForward|Move|ToolInitiate', '848', '849', '76.7,80.45,0.25', '257', '2|Move|Move|Move unit to adjacent tile|0|0|0|0|ToolInitiate|Increase Attack|When unit\'s Countdown is 0, you may increase the Countdown by 1 to increase target structure\'s Attack by 1.|0|0|0|0', 'FORWARD', null, null, null, '1');
INSERT INTO `card_types` VALUES ('151', 'SPELL', 'Metal Heart', 'Target creature gains Attack equal to the number of friendly structures until end of turn.', 'More machines, more mayhem.', null, '0', '0', '0', '0', '0', '0', '0', '2', '1|MetalHeart', '750', '0', null, '0', null, 'TILE', null, null, null, '1');
INSERT INTO `card_types` VALUES ('152', 'SPELL', 'Bombard', 'All units with Ranged or Lobber attack have their Countdown decreased by 2.', 'FIRE AT WILL!', null, '2', '0', '0', '0', '0', '0', '0', '3', '1|Bombard', '751', '0', null, '0', null, 'UNDEFINED', null, null, null, '1');
INSERT INTO `card_types` VALUES ('153', 'STRUCTURE', 'Clock Library', 'When Clock Library\'s Countdown becomes 0, Clock Library is sacrificed and you draw 3 scrolls.', 'Tick. Tick. Tick. Tick...', 'Totem', '0', '5', '0', '4', '0', '0', '0', '4', '1|DrawScrollsAndDestroyOnZeroAc', '752', '753', '41.8,29.8,0.25', '210', null, null, null, null, null, '1');
INSERT INTO `card_types` VALUES ('154', 'CREATURE', 'Wildling', 'When a creature is summoned adjacent to Wildling, Wildling is dealt 1 damage and its Attack is increased by 1.', 'Sometimes you just want to be left alone.', 'Human', '1', '4', '0', '1', '0', '0', '4', '0', '3|AttackForward|Move|Wildling', '754', '756', '48.3,-0.2,0.25', '211', '1|Move|Move|Move unit to adjacent tile|0|0|0|0', 'FORWARD', null, null, null, '1');
INSERT INTO `card_types` VALUES ('155', 'STRUCTURE', 'Mangonel', 'When Mangonel comes into play, your Mangonels\' Countdowns are set to the lowest of any you control.', 'Powerful, portable, and packing a punch.', 'Artillery', '1', '2', '3', '3', '0', '3', '0', '0', '2|AttackCatapult|SyncToLowestAcOnEnterBoard', '755', '757', '83.8,72.05,0.25', '212', null, 'RADIUS_4', '1|Lobber|This unit attacks at a specific section of the board.', null, null, '1');
INSERT INTO `card_types` VALUES ('156', 'CREATURE', 'Vaettr of the Wild', 'When Vaettr of the Wild comes into play, increase Growth by 1. When Vaettr of the Wild leaves play, decrease Growth by 1.', 'The forest personified. Cute.', 'Vaettr', '1', '1', '1', '2', '0', '0', '1', '0', '4|AttackForward|Move|IncOutputGrowth|DecOutputGrowthOnRemove', '758', '759', '66.9,80.5,0.25', '213', '1|Move|Move|Move unit to adjacent tile|0|0|0|0', 'FORWARD', null, null, null, '1');
INSERT INTO `card_types` VALUES ('157', 'SPELL', 'Imperial Resources', 'Draw 2 scrolls. Your idols are healed by 1. All your units are healed by 1. Increase Order by 1.', 'From the furthest reaches of the Empire, they hauled their gear. Now, the time has come to use it.', null, '2', '0', '0', '0', '0', '7', '0', '0', '1|ImperialResources', '760', '0', null, '0', null, 'UNDEFINED', null, null, null, '1');
INSERT INTO `card_types` VALUES ('158', 'ENCHANTMENT', 'Divine Mark', 'When enchanted creature is destroyed, it is returned to owners hand. If it was killed by damage from another unit, that unit is returned to its owner\'s hand.', '\"Let\'s try that again.\"\\n- Lord Ungstram, Royal Strategist.', null, '1', '0', '0', '0', '0', '2', '0', '0', '1|DivineMark', '761', '0', null, '0', null, null, null, null, null, '1');
INSERT INTO `card_types` VALUES ('159', 'SPELL', 'Unbind', 'Sacrifice target non-Decay structure you control. Increase Decay by 1.', '\"Let\'s put that to better use.\"', null, '1', '0', '0', '0', '1', '0', '0', '0', '1|Unbind', '766', '0', null, '0', null, 'TILE', null, null, null, '1');
INSERT INTO `card_types` VALUES ('160', 'STRUCTURE', 'Charge Coil', 'When Charge Coil attacks, a random opponent unit is dealt 1 damage.', '\"This is extremely annoying.\"\\n- Arhart, Mire Master', 'Totem', '0', '3', '0', '1', '0', '0', '0', '3', '1|ChargeCoilAttack', '802', '803', '49.3,9.55,0.25', '214', null, null, null, null, null, '1');
INSERT INTO `card_types` VALUES ('161', 'CREATURE', 'Viscera Sage', 'When Viscera Sage kills another unit, draw 1 scroll.', 'Reading entrails takes a strong stomach.', 'Human', '1', '2', '2', '2', '2', '0', '0', '0', '3|AttackForward|Move|DrawScrollOnKill', '767', '771', '75.05,82.35,0.25', '245', '1|Move|Move|Move unit to adjacent tile|0|0|0|0', 'FORWARD', null, null, null, '1');
INSERT INTO `card_types` VALUES ('162', 'CREATURE', 'Loyal Darkling', 'When Countdown is 0, Loyal Darkling can sacrifice itself. When Loyal Darkling is destroyed, it deals 2 damage to your opponent\'s idol on the same row.', 'To night, she\'ll return.', 'Human', '0', '2', '1', '2', '2', '0', '0', '0', '4|AttackForward|Move|SacrificeSelf|DamageIdolOnDeath', '768', '772', '65.1,177.3,0.25', '216', '2|Move|Move|Move unit to adjacent tile|0|0|0|0|SacrificeSelf|Sacrifice|This unit sacrifices itself.|0|0|0|0', 'FORWARD', null, null, null, '1');
INSERT INTO `card_types` VALUES ('163', 'CREATURE', 'Husk', null, 'Hollow, haggard, happy to help.', 'Undead', '0', '2', '3', '3', '1', '0', '0', '0', '2|AttackForward|Move', '769', '773', '60.05,60.4,0.25', '246', '1|Move|Move|Move unit to adjacent tile|0|0|0|0', 'FORWARD', null, null, null, '1');
INSERT INTO `card_types` VALUES ('164', 'CREATURE', 'Mire Shambler', 'Before attacking, Mire Shambler moves to a random adjacent tile.  ', null, 'Masked,Undead', '0', '1', '3', '2', '1', '0', '0', '0', '3|AttackMoveRandomly|AttackForward|Move', '770', '831', '63.8,63.1,0.25', '247', '1|Move|Move|Move unit to adjacent tile|0|0|0|0', 'FORWARD', null, null, null, '1');
INSERT INTO `card_types` VALUES ('165', 'CREATURE', 'Mangy Rat', 'When Mangy Rat attacks a creature, that creature gets poisoned for 3 rounds. ', 'Tiny Merchants\\nTrader of Graves\\nDeath\'s Servants\\nFate\'s Knaves', 'Beast,Rat', '0', '1', '1', '2', '1', '0', '0', '0', '3|AttackForward|DealPoison|Move', '775', '842', '67.05,-44.95,0.25', '248', '1|Move|Move|Move unit to adjacent tile|0|0|0|0', 'FORWARD', null, null, null, '1');
INSERT INTO `card_types` VALUES ('166', 'CREATURE', 'Ilmire Witch Doctor', 'When a Human creature adjacent to Ilmire Witch Doctor is destroyed, an undead Husk creature is summoned in its place.', '\"I can\'t promise you eternal life, but I can keep you standing.\"', 'Human', '2', '5', '5', '2', '6', '0', '0', '0', '3|AttackForwardRanged|Move|HuskSpawner', '777', '778', '86.75,110.25,0.25', '220', '1|Move|Move|Move unit to adjacent tile|0|0|0|0', 'FORWARD', '1|Ranged attack|This unit does not take damage from attacking Spiky units.', null, null, '1');
INSERT INTO `card_types` VALUES ('168', 'CREATURE', 'Blightbearer', 'Blightbearer takes 1 poison damage before attacking. When Blightbearer is destroyed, all creatures on the same row get poisoned for 3 rounds.', 'In this army, illness is no excuse.', 'Human', '1', '4', '3', '2', '3', '0', '0', '0', '4|AttackForward|Move|DamageOneBeforeAttack|DealPoisonToRowCreaturesOnDeath', '779', '780', '60.65,69,0.25', '249', '1|Move|Move|Move unit to adjacent tile|0|0|0|0', 'FORWARD', null, null, null, '1');
INSERT INTO `card_types` VALUES ('169', 'STRUCTURE', 'Puppet Soldier', 'When Puppet Soldier dies, all units on the same row are killed.', 'The soldier is false. The fear is not.', 'Wall', '1', '3', '0', '-1', '3', '0', '0', '0', '1|KillRowUnitsOnDeath', '781', '782', '32.3,26.3,0.25', '222', null, null, null, null, null, '1');
INSERT INTO `card_types` VALUES ('170', 'STRUCTURE', 'Pillar of Disease', 'Opponent\'s units on the same row as Pillar of Disease have Attack decreased by 1.', 'The Ilmire provides for its own.', 'Wall', '0', '4', '0', '-1', '3', '0', '0', '0', '1|PillarDecAp', '783', '785', '38.8,40.3,0.25', '223', null, null, null, null, null, '1');
INSERT INTO `card_types` VALUES ('171', 'ENCHANTMENT', 'Animovore', 'When a unit adjacent to enchanted unit dies, enchanted unit is dealt 1 damage and you draw 1 scroll.', 'I\'ll take a piece of your mind, if you don\'t mind.', null, '0', '0', '0', '0', '2', '0', '0', '0', '1|Animovore', '784', '0', null, '0', null, null, null, null, null, '1');
INSERT INTO `card_types` VALUES ('172', 'CREATURE', 'Harvester', 'Does not count down.  When a creature dies, Harvester\'s Countdown is decreased by 1.', 'We\'ve learnt to live, and die, with the Harvesters.', 'Masked,Undead', '2', '6', '8', '5', '3', '0', '0', '0', '4|NoCountdown|AttackForwardContinuous|Move|DecCountdownOnCreatureDeath', '786', '787', '88.85,96.75,0.25', '224', '1|Move|Move|Move unit to adjacent tile|0|0|0|0', 'FORWARD', '1|Relentless|If opponent blocking unit is destroyed, this creature will continue its attack.', null, null, '1');
INSERT INTO `card_types` VALUES ('173', 'STRUCTURE', 'Totem of Suffering', 'When a creature you control dies, the opposing idol on that row is dealt 1 damage.', 'Empathy can be a cruel thing.', 'Totem', '2', '3', '0', '-1', '4', '0', '0', '0', '1|TotemOfSuffering', '789', '790', '42.05,95.8,0.25', '225', null, null, null, null, null, '1');
INSERT INTO `card_types` VALUES ('174', 'ENCHANTMENT', 'Soul Scrounger', 'When a creature is destroyed, enchanted unit\'s Countdown is decreased by 1.', 'Those who have fallen act through the living.', null, '1', '0', '0', '0', '3', '0', '0', '0', '1|DecCountdownOnCreatureDeathEnch', '791', '0', null, '0', null, null, null, null, null, '1');
INSERT INTO `card_types` VALUES ('175', 'ENCHANTMENT', 'Grisly Graft', 'Enchant creature you control. When Grisly Graft comes into play, sacrifice adjacent creatures. Enchanted creature gains Attack and Health equal to the number of creatures sacrificed.', 'Great needlework!', null, '2', '0', '0', '0', '3', '0', '0', '0', '1|GrislyGraft', '792', '0', null, '0', null, null, null, null, null, '1');
INSERT INTO `card_types` VALUES ('176', 'ENCHANTMENT', 'Arthritis', 'Each time enchanted unit deals damage, it also deals 1 damage to itself.', 'You\'re only as old as you feel.', null, '0', '0', '0', '0', '1', '0', '0', '0', '1|DamageOneOnDamage', '793', '0', null, '0', null, null, null, null, null, '1');
INSERT INTO `card_types` VALUES ('177', 'SPELL', 'Restless Bones', 'All your Undead units gain +2 Attack until end of turn, and Countdown decreased by 1.', '\"Angering the dead is no trivial task.\" \\n- Grahm, Animator', null, '2', '0', '0', '0', '3', '0', '0', '0', '1|RestlessBones', '794', '0', null, '0', null, 'UNDEFINED', null, null, null, '1');
INSERT INTO `card_types` VALUES ('179', 'ENCHANTMENT', 'Shroud of Unlife', 'When enchanted creature is destroyed, an undead Husk is summoned in its place.', '\"You\'ll not find warmth in this garb.\" \\n- Tobai, Bone Merchant', null, '0', '0', '0', '0', '1', '0', '0', '0', '1|HuskSeed', '796', '0', null, '0', null, null, null, null, null, '1');
INSERT INTO `card_types` VALUES ('180', 'SPELL', 'Damning Curse', 'Destroy target creature. Units you control are dealt 1 damage.', 'When someone else is paying, who cares about the price?', null, '2', '0', '0', '0', '4', '0', '0', '0', '1|DamningCurse', '797', '0', null, '0', null, 'TILE', null, null, null, '1');
INSERT INTO `card_types` VALUES ('181', 'ENCHANTMENT', 'Languid', 'Enchanted unit\'s Attack is decreased by 2. When Languid comes into play, draw 1 scroll.', 'Play nice!', null, '0', '0', '0', '0', '2', '0', '0', '0', '1|Languid', '798', '0', null, '0', null, null, null, null, null, '1');
INSERT INTO `card_types` VALUES ('182', 'ENCHANTMENT', 'Energy Siphon', 'When Energy Siphon comes into play, increase Energy by 1. Enchanted creature\'s Attack and Health are decreased by 1. ', 'Resources are everywhere. It\'s just a matter of extraction.', null, '1', '0', '0', '0', '2', '0', '0', '0', '1|EnergySiphon', '825', '0', null, '0', null, null, null, null, null, '1');
INSERT INTO `card_types` VALUES ('183', 'ENCHANTMENT', 'Brain Lice', 'When Brain Lice comes into play, enchanted creature becomes poisoned for 3 rounds. When enchanted creature is destroyed, draw 1 scroll.', 'Scratch all you want. The itch is in your head.', null, '1', '0', '0', '0', '3', '0', '0', '0', '1|BrainLice', '800', '0', null, '0', null, null, null, null, null, '1');
INSERT INTO `card_types` VALUES ('184', 'ENCHANTMENT', 'Searing Shackles', 'At the end of owner\'s turn, enchanted unit deals 1 damage to the idol on the same row. Enchanted unit is dealt 2 damage when it moves.', 'Death is the only escape.', null, '1', '0', '0', '0', '2', '0', '0', '0', '1|SearingShackles', '801', '0', null, '0', null, null, null, null, null, '1');
INSERT INTO `card_types` VALUES ('185', 'STRUCTURE', 'Miasma Well', 'All Poison damage is increased by 1.', 'DO NOT DRINK.', 'Totem', '0', '3', '0', '-1', '2', '0', '0', '0', '1|IncPoisonDamage', '847', '805', '51.8,63.55,0.25', '226', null, null, null, null, null, '1');
INSERT INTO `card_types` VALUES ('186', 'STRUCTURE', 'Pillar of Fatigue', 'Whenever a creature moves, its Countdown is raised by 1.', 'What good are tactics when your men can\'t lift their swords?', 'Totem', '2', '3', '0', '-1', '3', '0', '0', '0', '1|IncCountdownOnMoves', '806', '808', '44.3,43.6,0.25', '227', null, null, null, null, null, '1');
INSERT INTO `card_types` VALUES ('187', 'ENCHANTMENT', 'Infectious Blight', 'Enchanted creature is dealt 1 poison damage at the beginning of each round. If enchanted unit is killed by poison damage, a random creature on the same side gets Infectious Blight.', 'The plague doesn\'t discriminate.', null, '2', '0', '0', '0', '4', '0', '0', '0', '1|InfectiousBlight', '807', '0', null, '0', null, null, null, null, null, '1');
INSERT INTO `card_types` VALUES ('188', 'SPELL', 'Necrogeddon', 'Destroy all creatures you control. Creatures destroyed this way are replaced by undead Husks at Countdown 0.', '\"This won\'t do. Lets start over.\"\\n-Nuru, Flesh-seamstress.', null, '2', '0', '0', '0', '6', '0', '0', '0', '1|Necrogeddon', '827', '0', null, '0', null, 'UNDEFINED', null, null, null, '1');
INSERT INTO `card_types` VALUES ('189', 'CREATURE', 'Beast Rat', null, '\"Oh look how big they are compared to those in the city!\"\\n- Ihrbraman, Creature Collector.', 'Beast,Rat', '0', '2', '1', '2', '0', '0', '1', '0', '2|AttackForward|Move', '810', '843', '67.05,-44.95,0.25', '250', '1|Move|Move|Move unit to adjacent tile|0|0|0|0', 'FORWARD', null, null, null, '1');
INSERT INTO `card_types` VALUES ('190', 'SPELL', 'Soul Steal', 'Destroy target creature with health 2 or less. Summon a Mire Shambler on a random tile on your side.', 'Ilmire mercy is worse than death.', null, '2', '0', '0', '0', '3', '0', '0', '0', '1|SoulSteal', '812', '0', null, '0', null, 'TILE', null, null, null, '1');
INSERT INTO `card_types` VALUES ('191', 'ENCHANTMENT', 'Regeniture', 'Target unit gains 2 Health. When Regeniture comes into play, enchanted unit\'s controller\'s idol on that row is dealt 1 damage.', 'Sometimes you can squeeze blood from a stone.', null, '0', '0', '0', '0', '1', '0', '0', '0', '1|Regeniture', '832', '0', null, '0', null, null, null, null, null, '1');
INSERT INTO `card_types` VALUES ('192', 'SPELL', 'Draining Mist', 'All opponent units with Countdown 1 or less have their Countdown increased by 2.', '\"Wait, I have an idea!\"\\n-Nuru, Flesh-seamstress.', null, '0', '0', '0', '0', '3', '0', '0', '0', '1|DrainingMist', '814', '0', null, '0', null, 'UNDEFINED', null, null, null, '1');
INSERT INTO `card_types` VALUES ('193', 'ENCHANTMENT', 'Roasted Bean Potion', 'Enchanted creature\'s Move is increased by 1.', null, null, '2', '0', '0', '0', '0', '2', '0', '0', '1|RoastedBeanPotion', '815', '0', null, '0', null, null, null, null, null, '1');
INSERT INTO `card_types` VALUES ('194', 'CREATURE', 'Oblivion Seeker', 'When Oblivion Seeker is destroyed, draw 2 scrolls.', 'He leaves nothing but memories. ', 'Human', '1', '3', '2', '2', '5', '0', '0', '0', '3|AttackForwardRanged|Move|DrawScrolls2OnDeath', '816', '819', '65.3,55.8,0.25', '234', '1|Move|Move|Move unit to adjacent tile|0|0|0|0', 'FORWARD', '1|Ranged attack|This unit does not take damage from attacking Spiky units.', null, null, '1');
INSERT INTO `card_types` VALUES ('195', 'CREATURE', 'Ilmire Rot Eater', 'Whenever a creature adjacent Ilmire Rot Eater dies, Ilmire Rot Eater gains 1 Attack and 1 Health.', 'Corpses are surprisingly nutritious.', 'Beast', '0', '3', '3', '2', '3', '0', '0', '0', '3|AttackForward|Move|IncApHpOnAdjacentCreatureDeath', '838', '822', '119.9,37.3,0.25', '251', '1|Move|Move|Move unit to adjacent tile|0|0|0|0', 'FORWARD', null, null, null, '1');
INSERT INTO `card_types` VALUES ('196', 'CREATURE', 'Ilmire Hunter', null, 'Like the mire, Hunters kill without mercy.', 'Human', '2', '5', '2', '2', '4', '0', '0', '0', '3|AttackForward|Move|Slayer', '817', '820', '90.55,104.95,0.25', '230', '1|Move|Move|Move unit to adjacent tile|0|0|0|0', 'FORWARD', '1|Slayer|When Ilmire Hunter deals damage to a creature, that creature is destroyed.', null, null, '1');
INSERT INTO `card_types` VALUES ('197', 'STRUCTURE', 'Scavenger Construct', 'When an adjacent unit dies, Scavenger Construct\'s Health is increased by 2.', '\"Feed the Construct!\"\\n- Nuru, Flesh-seamstress.', null, '0', '3', '0', '-1', '1', '0', '0', '0', '1|IncHp2OnAdjacentDeath', '844', '845', '89.3,41.05,0.25', '254', null, null, null, null, null, '1');
INSERT INTO `card_types` VALUES ('198', 'SPELL', 'Atrophy', 'Target unit\'s Attack is decreased by 5 until end of opponent\'s next turn. ', 'It usually takes longer.', null, '0', '0', '0', '0', '1', '0', '0', '0', '1|Atrophy', '830', '0', null, '0', null, 'TILE', null, null, null, '1');
INSERT INTO `card_types` VALUES ('199', 'SPELL', 'Cluster Hex', 'All units on target tile and adjacent tiles gain Curse 1.', 'Curse upon you, and your children, and their children for seven generations.', null, '1', '0', '0', '0', '3', '0', '0', '0', '1|ClusterHex', '833', '0', null, '0', null, 'RADIUS_7', null, null, null, '1');
INSERT INTO `card_types` VALUES ('200', 'CREATURE', 'Cursemonger', 'When Countdown is 0, Cursemonger may increase its Countdown by 2 to give target unit Curse 2.', '\"Needles and bones, my darling, that\'s my trade.\"', 'Human', '1', '4', '3', '2', '4', '0', '0', '0', '3|AttackForwardRanged|Move|CursemongerAbility', '916', '835', '70.6,27.8,0.25', '252', '2|Move|Move|Move unit to adjacent tile|0|0|0|0|CursemongerAbility|Curse|When unit\'s Countdown is 0, you may increase the Countdown by 2 to give target unit Curse 2.|0|0|0|0', 'FORWARD', '1|Ranged attack|This unit does not take damage from attacking Spiky units.', null, null, '1');
INSERT INTO `card_types` VALUES ('201', 'ENCHANTMENT', 'Pestis', 'Enchanted creature gains +1 Attack for each Rat you control. When enchanted creature kills another unit, summon a Mangy Rat on a random tile on your side.', 'There\'s no virtue among vermin.', null, '1', '0', '0', '0', '3', '0', '0', '0', '1|Pestis', '836', '0', null, '0', null, null, null, null, null, '1');
INSERT INTO `card_types` VALUES ('202', 'ENCHANTMENT', 'Hex Marks', 'When enchanted creature damages an idol, it deals 3 extra damage.', 'It\'s not just about looks.', null, '0', '0', '0', '0', '1', '0', '0', '0', '1|HexMarks', '837', '0', null, '0', null, null, null, null, null, '1');
INSERT INTO `card_types` VALUES ('203', 'CREATURE', 'Noaidi', 'When Noaidi comes into play, you gain 1 resource of each non-Growth type your opponent has.', 'For the Kinfolk, the moose migration marks the beginning of the new year.', 'Human,Kinfolk', '1', '2', '2', '2', '0', '0', '3', '0', '3|AttackForward|Move|NoaidiResources', '851', '853', '79.95,86.45,0.25', '260', '1|Move|Move|Move unit to adjacent tile|0|0|0|0', 'FORWARD', null, null, null, '1');
INSERT INTO `card_types` VALUES ('204', 'CREATURE', 'Solemn Giant', 'Does not count down. Pay 2 Energy to decrease Countdown by 2. This ability can be used multiple times per turn.', '\"The Giants are no more, so we made new ones.\"\\n-Amhan, Machine Master.', 'Automaton', '2', '4', '8', '6', '0', '0', '0', '4', '4|AttackForward|Move|NoCountdown|EnergyCountdownAbility', '852', '861', '77.3,69.8,0.25', '298', '2|Move|Move|Move unit to adjacent tile|0|0|0|0|EnergyCountdownAbility|Pay 2 Energy|Pay 2 Energy to decrease Countdown by 2.|0|0|2|0', 'FORWARD', null, null, null, '1');
INSERT INTO `card_types` VALUES ('205', 'CREATURE', 'Dust Runner', 'When Dust Runner deals damage to a creature with 3 or less Health, that creature is destroyed.', '\"Kinfolk make for great\\ntarget practice.\"\\n- Sarh, Dust Runner', 'Human,Tribesman', '0', '2', '1', '2', '0', '0', '0', '1', '3|AttackForwardRanged|Move|SlayLowHP', '857', '858', '56.05,81.05,0.25', '267', '1|Move|Move|Move unit to adjacent tile|0|0|0|0', 'FORWARD', '1|Ranged attack|This unit does not take damage from attacking Spiky units.', null, null, '1');
INSERT INTO `card_types` VALUES ('206', 'CREATURE', 'Wings Shield', 'Wings Shield has Armor X, where X is the number of units behind it (combat damage dealt to Wings Shield is decreased by X).', '\"I shield those I love. From them I draw strength.\"', 'Human,Soldier', '0', '3', '2', '2', '0', '3', '0', '0', '3|AttackForward|Move|WingsArmorModifier', '864', '862', '77.8,98.75,0.25', '268', '1|Move|Move|Move unit to adjacent tile|0|0|0|0', 'FORWARD', null, null, null, '1');
INSERT INTO `card_types` VALUES ('207', 'STRUCTURE', 'Automata Forge', 'Instead of attacking, Automata Forge summons a Gun Automaton on an adjacent tile. Pay 3 Energy to decrease Countdown by 1. This ability can be used multiple times per turn.', null, 'Forge', '2', '5', '0', '3', '0', '0', '0', '3', '2|AttackSummonGunAutomaton|EnergyCountdownAbility1for3', '859', '863', '73,66.3,0.25', '269', '1|EnergyCountdownAbility1for3|Pay 3 Energy|Pay 3 Energy to decrease Countdown by 1.|0|0|3|0', null, null, null, null, '1');
INSERT INTO `card_types` VALUES ('208', 'ENCHANTMENT', 'Stag Heart', 'Enchanted unit gets +1 Attack and +1 Health for each Stag Heart you control.', 'The Kinfolk judge every beast on their own merits.', null, '0', '0', '0', '0', '0', '0', '2', '0', '1|StagHeart', '860', '0', null, '0', null, null, null, null, null, '1');
INSERT INTO `card_types` VALUES ('209', 'ENCHANTMENT', 'Faith Duty', 'Enchant unit you control. At the beginning of each of its turns, enchanted unit is dealt 1 damage and opponent units on that row get their Countdown increased by 1.', 'Willingly, but not wisely.', null, '0', '0', '0', '0', '0', '2', '0', '0', '1|FaithDuty', '866', '0', null, '0', null, null, null, null, null, '1');
INSERT INTO `card_types` VALUES ('210', 'STRUCTURE', 'Metal Wonder', 'When your opponent plays a Spell or Enchantment, Metal Wonder deals 2 damage to a random idol under their control.', 'Machine victory, no fiddly bits.', 'Totem', '2', '4', '0', '-1', '0', '0', '0', '4', '1|MetalWonder', '870', '872', '59.85,60.55,0.25', '295', null, null, null, null, null, '1');
INSERT INTO `card_types` VALUES ('211', 'CREATURE', 'Crone', 'Crone does not attack.  When Crone is destroyed in melee combat, the attacking unit is destroyed.', '\"Grandma in the front. The hag\'s time is up.\"\\n- Halm, Berserker.', 'Human,Kinfolk', '1', '2', '0', '3', '0', '0', '3', '0', '2|Move|DestroyAttackerOnDeath', '867', '869', '99.55,21.55,0.25', '272', '1|Move|Move|Move unit to adjacent tile|0|0|0|0', null, null, null, null, '1');
INSERT INTO `card_types` VALUES ('215', 'SPELL', 'Rat King', 'Summons a Beast Rat on target tile and on two adjacent random tiles.', 'Obey the Jarl, but fear the King.', null, '2', '0', '0', '0', '0', '0', '4', '0', '1|RatKing', '878', '0', null, '0', null, 'UNDEFINED', null, null, null, '1');
INSERT INTO `card_types` VALUES ('218', 'CREATURE', 'Sister of the Bear', null, '\"Honored Sisters. Your strength will be my hammer against the hated Empire!\"\\n- Jarl Urhald.', 'Human,Kinfolk', '0', '4', '4', '2', '0', '0', '4', '0', '2|AttackForward|Move', '881', '886', '74.3,125.55,0.25', '278', '1|Move|Move|Move unit to adjacent tile|0|0|0|0', 'FORWARD', null, null, null, '1');
INSERT INTO `card_types` VALUES ('223', 'CREATURE', 'Storm Runner', null, 'Storm Runners have perfected the art of... throwing.', 'Human,Tribesman', '1', '3', '2', '2', '0', '0', '0', '3', '2|AttackCatapult|Move', '893', '895', '65.6,111.55,0.25', '282', '1|Move|Move|Move unit to adjacent tile|0|0|0|0', 'RADIUS_4', '1|Lobber|This unit attacks at a specific section of the board.', null, null, '1');
INSERT INTO `card_types` VALUES ('230', 'SPELL', 'Redeploy', 'Swap two target rows on your side.', '\"Wings to the east, vanguard south. Go!\"', null, '2', '0', '0', '0', '0', '3', '0', '0', '1|SwapRows', '903', '0', null, '0', null, 'ROW_SIDE', null, null, null, '1');
INSERT INTO `card_types` VALUES ('237', 'CREATURE', 'Wings Soldier', null, 'The elites of the Empire strike with precision.', 'Human,Soldier', '0', '2', '3', '2', '0', '2', '0', '0', '2|AttackForward|Move', '917', '918', '127.1,107.7,0.25', '297', '1|Move|Move|Move unit to adjacent tile|0|0|0|0', 'FORWARD', null, null, null, '1');
INSERT INTO `card_types` VALUES ('239', 'ENCHANTMENT', 'Wicked Being', 'When enchanted unit is attacked in melee, attacker gets Curse 1.', 'There are no innocents in the Mire.', null, '0', '0', '0', '0', '1', '0', '0', '0', '1|CurseAttacker', '920', '0', null, '0', null, null, null, null, null, '1');

-- ----------------------------
-- Table structure for deck_types
-- ----------------------------
DROP TABLE IF EXISTS `deck_types`;
CREATE TABLE `deck_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text,
  `card` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=ascii;

-- ----------------------------
-- Records of deck_types
-- ----------------------------
INSERT INTO `deck_types` VALUES ('1', 'GROWTH', '91');
INSERT INTO `deck_types` VALUES ('2', 'GROWTH', '91');
INSERT INTO `deck_types` VALUES ('3', 'GROWTH', '89');
INSERT INTO `deck_types` VALUES ('4', 'GROWTH', '38');
INSERT INTO `deck_types` VALUES ('5', 'GROWTH', '89');
INSERT INTO `deck_types` VALUES ('6', 'GROWTH', '75');
INSERT INTO `deck_types` VALUES ('7', 'GROWTH', '156');
INSERT INTO `deck_types` VALUES ('8', 'GROWTH', '156');
INSERT INTO `deck_types` VALUES ('9', 'GROWTH', '75');
INSERT INTO `deck_types` VALUES ('10', 'GROWTH', '40');
INSERT INTO `deck_types` VALUES ('11', 'GROWTH', '53');
INSERT INTO `deck_types` VALUES ('12', 'GROWTH', '40');
INSERT INTO `deck_types` VALUES ('13', 'GROWTH', '53');
INSERT INTO `deck_types` VALUES ('14', 'GROWTH', '18');
INSERT INTO `deck_types` VALUES ('15', 'GROWTH', '18');
INSERT INTO `deck_types` VALUES ('16', 'GROWTH', '17');
INSERT INTO `deck_types` VALUES ('17', 'GROWTH', '65');
INSERT INTO `deck_types` VALUES ('18', 'GROWTH', '40');
INSERT INTO `deck_types` VALUES ('19', 'GROWTH', '41');
INSERT INTO `deck_types` VALUES ('20', 'GROWTH', '42');
INSERT INTO `deck_types` VALUES ('21', 'GROWTH', '94');
INSERT INTO `deck_types` VALUES ('22', 'GROWTH', '22');
INSERT INTO `deck_types` VALUES ('23', 'GROWTH', '22');
INSERT INTO `deck_types` VALUES ('24', 'GROWTH', '78');
INSERT INTO `deck_types` VALUES ('25', 'GROWTH', '21');
INSERT INTO `deck_types` VALUES ('26', 'GROWTH', '21');
INSERT INTO `deck_types` VALUES ('27', 'GROWTH', '63');
INSERT INTO `deck_types` VALUES ('28', 'GROWTH', '63');
INSERT INTO `deck_types` VALUES ('29', 'GROWTH', '84');
INSERT INTO `deck_types` VALUES ('30', 'GROWTH', '115');
INSERT INTO `deck_types` VALUES ('31', 'GROWTH', '84');
INSERT INTO `deck_types` VALUES ('32', 'GROWTH', '26');
INSERT INTO `deck_types` VALUES ('33', 'GROWTH', '26');
INSERT INTO `deck_types` VALUES ('34', 'GROWTH', '45');
INSERT INTO `deck_types` VALUES ('35', 'GROWTH', '44');
INSERT INTO `deck_types` VALUES ('36', 'GROWTH', '44');
INSERT INTO `deck_types` VALUES ('37', 'GROWTH', '115');
INSERT INTO `deck_types` VALUES ('38', 'GROWTH', '88');
INSERT INTO `deck_types` VALUES ('39', 'GROWTH', '88');
INSERT INTO `deck_types` VALUES ('40', 'GROWTH', '49');
INSERT INTO `deck_types` VALUES ('41', 'GROWTH', '16');
INSERT INTO `deck_types` VALUES ('42', 'GROWTH', '114');
INSERT INTO `deck_types` VALUES ('43', 'GROWTH', '16');
INSERT INTO `deck_types` VALUES ('44', 'GROWTH', '17');
INSERT INTO `deck_types` VALUES ('45', 'GROWTH', '49');
INSERT INTO `deck_types` VALUES ('46', 'GROWTH', '56');
INSERT INTO `deck_types` VALUES ('47', 'GROWTH', '13');
INSERT INTO `deck_types` VALUES ('48', 'GROWTH', '13');
INSERT INTO `deck_types` VALUES ('49', 'GROWTH', '100');
INSERT INTO `deck_types` VALUES ('50', 'GROWTH', '100');
INSERT INTO `deck_types` VALUES ('51', 'ENERGY', '87');
INSERT INTO `deck_types` VALUES ('52', 'ENERGY', '87');
INSERT INTO `deck_types` VALUES ('53', 'ENERGY', '130');
INSERT INTO `deck_types` VALUES ('54', 'ENERGY', '32');
INSERT INTO `deck_types` VALUES ('55', 'ENERGY', '83');
INSERT INTO `deck_types` VALUES ('56', 'ENERGY', '1');
INSERT INTO `deck_types` VALUES ('57', 'ENERGY', '2');
INSERT INTO `deck_types` VALUES ('58', 'ENERGY', '2');
INSERT INTO `deck_types` VALUES ('59', 'ENERGY', '24');
INSERT INTO `deck_types` VALUES ('60', 'ENERGY', '24');
INSERT INTO `deck_types` VALUES ('61', 'ENERGY', '24');
INSERT INTO `deck_types` VALUES ('62', 'ENERGY', '67');
INSERT INTO `deck_types` VALUES ('63', 'ENERGY', '67');
INSERT INTO `deck_types` VALUES ('64', 'ENERGY', '151');
INSERT INTO `deck_types` VALUES ('65', 'ENERGY', '151');
INSERT INTO `deck_types` VALUES ('66', 'ENERGY', '35');
INSERT INTO `deck_types` VALUES ('67', 'ENERGY', '107');
INSERT INTO `deck_types` VALUES ('68', 'ENERGY', '35');
INSERT INTO `deck_types` VALUES ('69', 'ENERGY', '107');
INSERT INTO `deck_types` VALUES ('70', 'ENERGY', '152');
INSERT INTO `deck_types` VALUES ('71', 'ENERGY', '152');
INSERT INTO `deck_types` VALUES ('72', 'ENERGY', '68');
INSERT INTO `deck_types` VALUES ('73', 'ENERGY', '68');
INSERT INTO `deck_types` VALUES ('74', 'ENERGY', '82');
INSERT INTO `deck_types` VALUES ('75', 'ENERGY', '80');
INSERT INTO `deck_types` VALUES ('76', 'ENERGY', '149');
INSERT INTO `deck_types` VALUES ('77', 'ENERGY', '80');
INSERT INTO `deck_types` VALUES ('78', 'ENERGY', '66');
INSERT INTO `deck_types` VALUES ('79', 'ENERGY', '96');
INSERT INTO `deck_types` VALUES ('80', 'ENERGY', '66');
INSERT INTO `deck_types` VALUES ('81', 'ENERGY', '96');
INSERT INTO `deck_types` VALUES ('82', 'ENERGY', '149');
INSERT INTO `deck_types` VALUES ('83', 'ENERGY', '118');
INSERT INTO `deck_types` VALUES ('84', 'ENERGY', '150');
INSERT INTO `deck_types` VALUES ('85', 'ENERGY', '27');
INSERT INTO `deck_types` VALUES ('86', 'ENERGY', '98');
INSERT INTO `deck_types` VALUES ('87', 'ENERGY', '27');
INSERT INTO `deck_types` VALUES ('88', 'ENERGY', '98');
INSERT INTO `deck_types` VALUES ('89', 'ENERGY', '98');
INSERT INTO `deck_types` VALUES ('90', 'ENERGY', '143');
INSERT INTO `deck_types` VALUES ('91', 'ENERGY', '96');
INSERT INTO `deck_types` VALUES ('92', 'ENERGY', '141');
INSERT INTO `deck_types` VALUES ('93', 'ENERGY', '83');
INSERT INTO `deck_types` VALUES ('94', 'ENERGY', '39');
INSERT INTO `deck_types` VALUES ('95', 'ENERGY', '77');
INSERT INTO `deck_types` VALUES ('96', 'ENERGY', '77');
INSERT INTO `deck_types` VALUES ('97', 'ENERGY', '141');
INSERT INTO `deck_types` VALUES ('98', 'ENERGY', '141');
INSERT INTO `deck_types` VALUES ('99', 'ENERGY', '139');
INSERT INTO `deck_types` VALUES ('100', 'ENERGY', '139');
INSERT INTO `deck_types` VALUES ('101', 'ORDER', '54');
INSERT INTO `deck_types` VALUES ('102', 'ORDER', '20');
INSERT INTO `deck_types` VALUES ('103', 'ORDER', '20');
INSERT INTO `deck_types` VALUES ('104', 'ORDER', '95');
INSERT INTO `deck_types` VALUES ('105', 'ORDER', '95');
INSERT INTO `deck_types` VALUES ('106', 'ORDER', '122');
INSERT INTO `deck_types` VALUES ('107', 'ORDER', '121');
INSERT INTO `deck_types` VALUES ('108', 'ORDER', '86');
INSERT INTO `deck_types` VALUES ('109', 'ORDER', '50');
INSERT INTO `deck_types` VALUES ('110', 'ORDER', '86');
INSERT INTO `deck_types` VALUES ('111', 'ORDER', '50');
INSERT INTO `deck_types` VALUES ('112', 'ORDER', '105');
INSERT INTO `deck_types` VALUES ('113', 'ORDER', '52');
INSERT INTO `deck_types` VALUES ('114', 'ORDER', '52');
INSERT INTO `deck_types` VALUES ('115', 'ORDER', '120');
INSERT INTO `deck_types` VALUES ('116', 'ORDER', '120');
INSERT INTO `deck_types` VALUES ('117', 'ORDER', '124');
INSERT INTO `deck_types` VALUES ('118', 'ORDER', '125');
INSERT INTO `deck_types` VALUES ('119', 'ORDER', '99');
INSERT INTO `deck_types` VALUES ('120', 'ORDER', '124');
INSERT INTO `deck_types` VALUES ('121', 'ORDER', '125');
INSERT INTO `deck_types` VALUES ('122', 'ORDER', '23');
INSERT INTO `deck_types` VALUES ('123', 'ORDER', '23');
INSERT INTO `deck_types` VALUES ('124', 'ORDER', '36');
INSERT INTO `deck_types` VALUES ('125', 'ORDER', '48');
INSERT INTO `deck_types` VALUES ('126', 'ORDER', '37');
INSERT INTO `deck_types` VALUES ('127', 'ORDER', '73');
INSERT INTO `deck_types` VALUES ('128', 'ORDER', '73');
INSERT INTO `deck_types` VALUES ('129', 'ORDER', '74');
INSERT INTO `deck_types` VALUES ('130', 'ORDER', '71');
INSERT INTO `deck_types` VALUES ('131', 'ORDER', '71');
INSERT INTO `deck_types` VALUES ('132', 'ORDER', '64');
INSERT INTO `deck_types` VALUES ('133', 'ORDER', '50');
INSERT INTO `deck_types` VALUES ('134', 'ORDER', '122');
INSERT INTO `deck_types` VALUES ('135', 'ORDER', '123');
INSERT INTO `deck_types` VALUES ('136', 'ORDER', '123');
INSERT INTO `deck_types` VALUES ('137', 'ORDER', '123');
INSERT INTO `deck_types` VALUES ('138', 'ORDER', '124');
INSERT INTO `deck_types` VALUES ('139', 'ORDER', '101');
INSERT INTO `deck_types` VALUES ('140', 'ORDER', '15');
INSERT INTO `deck_types` VALUES ('141', 'ORDER', '128');
INSERT INTO `deck_types` VALUES ('142', 'ORDER', '128');
INSERT INTO `deck_types` VALUES ('143', 'ORDER', '99');
INSERT INTO `deck_types` VALUES ('144', 'ORDER', '127');
INSERT INTO `deck_types` VALUES ('145', 'ORDER', '61');
INSERT INTO `deck_types` VALUES ('146', 'ORDER', '126');
INSERT INTO `deck_types` VALUES ('147', 'ORDER', '126');
INSERT INTO `deck_types` VALUES ('148', 'ORDER', '97');
INSERT INTO `deck_types` VALUES ('149', 'ORDER', '127');
INSERT INTO `deck_types` VALUES ('150', 'ORDER', '97');
INSERT INTO `deck_types` VALUES ('151', 'DECAY', '163');
INSERT INTO `deck_types` VALUES ('152', 'DECAY', '179');
INSERT INTO `deck_types` VALUES ('153', 'DECAY', '166');
INSERT INTO `deck_types` VALUES ('154', 'DECAY', '180');
INSERT INTO `deck_types` VALUES ('155', 'DECAY', '195');
INSERT INTO `deck_types` VALUES ('156', 'DECAY', '179');
INSERT INTO `deck_types` VALUES ('157', 'DECAY', '165');
INSERT INTO `deck_types` VALUES ('158', 'DECAY', '195');
INSERT INTO `deck_types` VALUES ('159', 'DECAY', '179');
INSERT INTO `deck_types` VALUES ('160', 'DECAY', '165');
INSERT INTO `deck_types` VALUES ('161', 'DECAY', '164');
INSERT INTO `deck_types` VALUES ('162', 'DECAY', '170');
INSERT INTO `deck_types` VALUES ('163', 'DECAY', '184');
INSERT INTO `deck_types` VALUES ('164', 'DECAY', '200');
INSERT INTO `deck_types` VALUES ('165', 'DECAY', '184');
INSERT INTO `deck_types` VALUES ('166', 'DECAY', '198');
INSERT INTO `deck_types` VALUES ('167', 'DECAY', '170');
INSERT INTO `deck_types` VALUES ('168', 'DECAY', '198');
INSERT INTO `deck_types` VALUES ('169', 'DECAY', '198');
INSERT INTO `deck_types` VALUES ('170', 'DECAY', '185');
INSERT INTO `deck_types` VALUES ('171', 'DECAY', '186');
INSERT INTO `deck_types` VALUES ('172', 'DECAY', '187');
INSERT INTO `deck_types` VALUES ('173', 'DECAY', '102');
INSERT INTO `deck_types` VALUES ('174', 'DECAY', '102');
INSERT INTO `deck_types` VALUES ('175', 'DECAY', '174');
INSERT INTO `deck_types` VALUES ('176', 'DECAY', '69');
INSERT INTO `deck_types` VALUES ('177', 'DECAY', '69');
INSERT INTO `deck_types` VALUES ('178', 'DECAY', '194');
INSERT INTO `deck_types` VALUES ('179', 'DECAY', '201');
INSERT INTO `deck_types` VALUES ('180', 'DECAY', '59');
INSERT INTO `deck_types` VALUES ('181', 'DECAY', '3');
INSERT INTO `deck_types` VALUES ('182', 'DECAY', '191');
INSERT INTO `deck_types` VALUES ('183', 'DECAY', '191');
INSERT INTO `deck_types` VALUES ('184', 'DECAY', '239');
INSERT INTO `deck_types` VALUES ('185', 'DECAY', '239');
INSERT INTO `deck_types` VALUES ('186', 'DECAY', '192');
INSERT INTO `deck_types` VALUES ('187', 'DECAY', '201');
INSERT INTO `deck_types` VALUES ('188', 'DECAY', '192');
INSERT INTO `deck_types` VALUES ('189', 'DECAY', '192');
INSERT INTO `deck_types` VALUES ('190', 'DECAY', '202');
INSERT INTO `deck_types` VALUES ('191', 'DECAY', '191');
INSERT INTO `deck_types` VALUES ('192', 'DECAY', '202');
INSERT INTO `deck_types` VALUES ('193', 'DECAY', '175');
INSERT INTO `deck_types` VALUES ('194', 'DECAY', '162');
INSERT INTO `deck_types` VALUES ('195', 'DECAY', '200');
INSERT INTO `deck_types` VALUES ('196', 'DECAY', '163');
INSERT INTO `deck_types` VALUES ('197', 'DECAY', '176');
INSERT INTO `deck_types` VALUES ('198', 'DECAY', '176');
INSERT INTO `deck_types` VALUES ('199', 'DECAY', '176');
INSERT INTO `deck_types` VALUES ('200', 'DECAY', '3');

-- ----------------------------
-- Table structure for server_stats
-- ----------------------------
DROP TABLE IF EXISTS `server_stats`;
CREATE TABLE `server_stats` (
  `loginsLast24h` int(10) unsigned NOT NULL DEFAULT '0',
  `totalGoldRewarded` int(10) unsigned NOT NULL DEFAULT '0',
  `totalSoldCards` int(10) unsigned NOT NULL DEFAULT '0',
  `currentGameId` int(10) unsigned NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

-- ----------------------------
-- Records of server_stats
-- ----------------------------
INSERT INTO `server_stats` VALUES ('0', '0', '0', '1');

-- ----------------------------
-- Table structure for store_items
-- ----------------------------
DROP TABLE IF EXISTS `store_items`;
CREATE TABLE `store_items` (
  `itemId` int(10) unsigned NOT NULL DEFAULT '0',
  `itemType` tinytext NOT NULL,
  `itemName` tinytext NOT NULL,
  `description` tinytext NOT NULL,
  `costGold` smallint(5) unsigned NOT NULL DEFAULT '0',
  `costShards` smallint(5) NOT NULL DEFAULT '0',
  `isPublic` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`itemId`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

-- ----------------------------
-- Records of store_items
-- ----------------------------
INSERT INTO `store_items` VALUES ('137', 'CARD_FACE_DOWN', 'Random Scroll', 'A random scroll from a random faction. A cheap and easy way to boost your collection.', '100', '-1', '1');
INSERT INTO `store_items` VALUES ('180', 'CARD_PACK', 'Scroll Pack', '10 scrolls picked randomly from all factions.  You\'re guaranteed to get two uncommon and one rare in this pack. Lucky you!', '1000', '-1', '1');
INSERT INTO `store_items` VALUES ('182', 'CARD_ORDER', 'Order Scroll', 'One scroll picked randomly from the Order faction. Good luck!', '200', '-1', '1');
INSERT INTO `store_items` VALUES ('183', 'CARD_GROWTH', 'Growth Scroll', 'One scroll picked randomly from the Growth faction. Good luck!', '200', '-1', '1');
INSERT INTO `store_items` VALUES ('184', 'CARD_ENERGY', 'Energy Scroll', 'One scroll picked randomly from the Energy faction. Good luck!', '200', '-1', '1');
INSERT INTO `store_items` VALUES ('1708255', 'CARD_DECAY', 'Decay Scroll', 'One scroll picked randomly from the Decay faction. Good luck!', '200', '-1', '1');

-- ----------------------------
-- Table structure for tower_info
-- ----------------------------
DROP TABLE IF EXISTS `tower_info`;
CREATE TABLE `tower_info` (
  `id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `name` tinytext NOT NULL,
  `goldReward` int(10) unsigned NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `difficulty` tinytext NOT NULL,
  `flavour` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

-- ----------------------------
-- Records of tower_info
-- ----------------------------
INSERT INTO `tower_info` VALUES ('1', 'An insult', '250', '- Destroy three of your opponent\'s idols to win\\n- Your opponent\'s idols start with just five health\\n- You begin the battle with two pre-deployed Eternal Statues', 'Easy', 'A cocky spirit tosses jibes as you wander past his shack. At first you ignore the taunts - he\'s too weak to be of any concern to you - but they increase in volume and become more offensive, escalating into unconfirmed claims about close family members. Honour dictates you teach this guy a lesson...');
