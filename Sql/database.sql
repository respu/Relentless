-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.6.13 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             8.0.0.4396
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for relentlessdb
CREATE DATABASE IF NOT EXISTS `relentlessdb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `relentlessdb`;


-- Dumping structure for table relentlessdb.account
CREATE TABLE IF NOT EXISTS `account` (
  `guid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` text NOT NULL,
  `email` tinytext NOT NULL,
  `password` tinytext NOT NULL,
  `adminRole` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `signedIn` tinyint(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=ascii;

-- Dumping data for table relentlessdb.account: ~3 rows (approximately)
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
REPLACE INTO `account` (`guid`, `username`, `email`, `password`, `adminRole`, `signedIn`) VALUES
	(1, 'Test', 'test@test.com', 'db436f780032a5e3341ea316003fa10b90e0e5c0', 2, 0);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;


-- Dumping structure for table relentlessdb.account_avatar
CREATE TABLE IF NOT EXISTS `account_avatar` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0',
  `head` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `body` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `leg` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `armBack` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `armFront` tinyint(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

-- Dumping data for table relentlessdb.account_avatar: ~3 rows (approximately)
/*!40000 ALTER TABLE `account_avatar` DISABLE KEYS */;
REPLACE INTO `account_avatar` (`guid`, `head`, `body`, `leg`, `armBack`, `armFront`) VALUES
	(1, 33, 10, 41, 4, 15);
/*!40000 ALTER TABLE `account_avatar` ENABLE KEYS */;


-- Dumping structure for table relentlessdb.account_bans
CREATE TABLE IF NOT EXISTS `account_bans` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0',
  `reason` text NOT NULL,
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

-- Dumping data for table relentlessdb.account_bans: ~0 rows (approximately)
/*!40000 ALTER TABLE `account_bans` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_bans` ENABLE KEYS */;


-- Dumping structure for table relentlessdb.account_cards
CREATE TABLE IF NOT EXISTS `account_cards` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `guid` int(10) unsigned NOT NULL DEFAULT '0',
  `typeId` int(4) unsigned NOT NULL DEFAULT '0',
  `tradable` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `isToken` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `level` tinyint(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=ascii;

-- Dumping data for table relentlessdb.account_cards: ~177 rows (approximately)
/*!40000 ALTER TABLE `account_cards` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_cards` ENABLE KEYS */;


-- Dumping structure for table relentlessdb.account_data
CREATE TABLE IF NOT EXISTS `account_data` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0',
  `gold` int(10) unsigned NOT NULL DEFAULT '2000',
  `shards` int(10) unsigned NOT NULL DEFAULT '0',
  `gamesPlayed` int(10) unsigned NOT NULL DEFAULT '0',
  `gamesWon` int(10) unsigned NOT NULL DEFAULT '0',
  `gamesSurrendered` int(10) unsigned NOT NULL DEFAULT '0',
  `selectedPreconstructed` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

-- Dumping data for table relentlessdb.account_data: ~3 rows (approximately)
/*!40000 ALTER TABLE `account_data` DISABLE KEYS */;
REPLACE INTO `account_data` (`guid`, `gold`, `shards`, `gamesPlayed`, `gamesWon`, `gamesSurrendered`, `selectedPreconstructed`) VALUES
	(1, 99999, 99999, 0, 0, 0, 0);
/*!40000 ALTER TABLE `account_data` ENABLE KEYS */;


-- Dumping structure for table relentlessdb.account_decks
CREATE TABLE IF NOT EXISTS `account_decks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `guid` int(10) unsigned NOT NULL DEFAULT '0',
  `name` tinytext NOT NULL,
  `resources` tinytext NOT NULL,
  `timestamp` bigint(20) unsigned NOT NULL,
  `metadata` text NOT NULL,
  `cards` text NOT NULL,
  `valid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=ascii;

-- Dumping data for table relentlessdb.account_decks: ~2 rows (approximately)
/*!40000 ALTER TABLE `account_decks` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_decks` ENABLE KEYS */;


-- Dumping structure for table relentlessdb.account_friends
CREATE TABLE IF NOT EXISTS `account_friends` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

-- Dumping data for table relentlessdb.account_friends: ~0 rows (approximately)
/*!40000 ALTER TABLE `account_friends` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_friends` ENABLE KEYS */;


-- Dumping structure for table relentlessdb.account_tower_info
CREATE TABLE IF NOT EXISTS `account_tower_info` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0',
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

-- Dumping data for table relentlessdb.account_tower_info: ~0 rows (approximately)
/*!40000 ALTER TABLE `account_tower_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_tower_info` ENABLE KEYS */;


-- Dumping structure for table relentlessdb.avatar_types
CREATE TABLE IF NOT EXISTS `avatar_types` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `type` text NOT NULL,
  `part` text NOT NULL,
  `filename` text NOT NULL,
  `set` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

-- Dumping data for table relentlessdb.avatar_types: ~146 rows (approximately)
/*!40000 ALTER TABLE `avatar_types` DISABLE KEYS */;
REPLACE INTO `avatar_types` (`id`, `type`, `part`, `filename`, `set`) VALUES
	(1, 'COMMON', 'ARM_BACK', 'back_arm_1.png', 'MALE_1'),
	(2, 'UNLOCKABLE', 'ARM_BACK', 'back_arm_2.png', 'MALE_1'),
	(3, 'COMMON', 'ARM_BACK', 'back_arm_3.png', 'MALE_1'),
	(4, 'COMMON', 'ARM_BACK', 'back_arm_4.png', 'MALE_1'),
	(5, 'COMMON', 'ARM_BACK', 'back_arm_5.png', 'MALE_1'),
	(6, 'UNLOCKABLE', 'ARM_BACK', 'back_arm_6.png', 'MALE_1'),
	(7, 'COMMON', 'ARM_BACK', 'back_arm_7.png', 'MALE_1'),
	(8, 'COMMON', 'BODY', 'body_1.png', 'MALE_1'),
	(9, 'COMMON', 'BODY', 'body_2.png', 'MALE_1'),
	(10, 'COMMON', 'BODY', 'body_3.png', 'MALE_1'),
	(11, 'COMMON', 'BODY', 'body_4.png', 'MALE_1'),
	(12, 'UNLOCKABLE', 'BODY', 'body_5.png', 'MALE_1'),
	(13, 'COMMON', 'BODY', 'body_6.png', 'MALE_1'),
	(15, 'COMMON', 'ARM_FRONT', 'front_arm_1.png', 'MALE_1'),
	(16, 'UNLOCKABLE', 'ARM_FRONT', 'front_arm_2.png', 'MALE_1'),
	(17, 'COMMON', 'ARM_FRONT', 'front_arm_3.png', 'MALE_1'),
	(18, 'COMMON', 'ARM_FRONT', 'front_arm_4.png', 'MALE_1'),
	(19, 'COMMON', 'ARM_FRONT', 'front_arm_5.png', 'MALE_1'),
	(20, 'UNLOCKABLE', 'ARM_FRONT', 'front_arm_6.png', 'MALE_1'),
	(21, 'COMMON', 'ARM_FRONT', 'front_arm_7.png', 'MALE_1'),
	(22, 'COMMON', 'HEAD', 'head_1.png', 'MALE_1'),
	(23, 'COMMON', 'HEAD', 'head_2.png', 'MALE_1'),
	(24, 'COMMON', 'HEAD', 'head_3.png', 'MALE_1'),
	(25, 'COMMON', 'HEAD', 'head_4.png', 'MALE_1'),
	(26, 'COMMON', 'HEAD', 'head_5.png', 'MALE_1'),
	(27, 'COMMON', 'HEAD', 'head_6.png', 'MALE_1'),
	(28, 'COMMON', 'HEAD', 'head_7.png', 'MALE_1'),
	(29, 'UNLOCKABLE', 'HEAD', 'head_8.png', 'MALE_1'),
	(30, 'COMMON', 'HEAD', 'head_9.png', 'MALE_1'),
	(31, 'UNLOCKABLE', 'HEAD', 'head_10.png', 'MALE_1'),
	(32, 'COMMON', 'HEAD', 'head_11.png', 'MALE_1'),
	(33, 'COMMON', 'HEAD', 'head_12.png', 'MALE_1'),
	(34, 'UNLOCKABLE', 'HEAD', 'head_13.png', 'MALE_1'),
	(35, 'COMMON', 'HEAD', 'head_14.png', 'MALE_1'),
	(36, 'UNLOCKABLE', 'HEAD', 'head_15.png', 'MALE_1'),
	(37, 'COMMON', 'HEAD', 'head_16.png', 'MALE_1'),
	(38, 'UNLOCKABLE', 'HEAD', 'head_17.png', 'MALE_1'),
	(39, 'COMMON', 'LEG', 'legs_1.png', 'MALE_1'),
	(40, 'COMMON', 'LEG', 'legs_2.png', 'MALE_1'),
	(41, 'COMMON', 'LEG', 'legs_3.png', 'MALE_1'),
	(68, 'COMMON', 'BODY', 'body_7.png', 'FEMALE_1'),
	(69, 'COMMON', 'BODY', 'body_8.png', 'FEMALE_1'),
	(70, 'COMMON', 'HEAD', 'head_18.png', 'FEMALE_1'),
	(71, 'COMMON', 'HEAD', 'head_19.png', 'FEMALE_1'),
	(72, 'COMMON', 'HEAD', 'head_20.png', 'FEMALE_1'),
	(73, 'COMMON', 'HEAD', 'head_21.png', 'FEMALE_1'),
	(74, 'COMMON', 'LEG', 'legs_4.png', 'FEMALE_1'),
	(75, 'COMMON', 'LEG', 'legs_5.png', 'FEMALE_1'),
	(76, 'COMMON', 'LEG', 'legs_6.png', 'FEMALE_1'),
	(77, 'COMMON', 'LEG', 'legs_7.png', 'FEMALE_1'),
	(78, 'STORE', 'ARM_BACK', 'back_arm_18.png', 'MALE_1'),
	(79, 'STORE', 'ARM_BACK', 'back_arm_19.png', 'MALE_1'),
	(80, 'STORE', 'ARM_BACK', 'back_arm_20.png', 'MALE_1'),
	(81, 'STORE', 'ARM_BACK', 'back_arm_21.png', 'MALE_1'),
	(82, 'STORE', 'BODY', 'body_18.png', 'MALE_1'),
	(83, 'STORE', 'BODY', 'body_19.png', 'MALE_1'),
	(84, 'STORE', 'BODY', 'body_20.png', 'MALE_1'),
	(85, 'STORE', 'BODY', 'body_21.png', 'MALE_1'),
	(86, 'STORE', 'ARM_FRONT', 'front_arm_18.png', 'MALE_1'),
	(87, 'STORE', 'ARM_FRONT', 'front_arm_19.png', 'MALE_1'),
	(88, 'STORE', 'ARM_FRONT', 'front_arm_20.png', 'MALE_1'),
	(89, 'STORE', 'ARM_FRONT', 'front_arm_21.png', 'MALE_1'),
	(90, 'STORE', 'LEG', 'legs_18.png', 'MALE_1'),
	(91, 'STORE', 'LEG', 'legs_19.png', 'MALE_1'),
	(92, 'STORE', 'LEG', 'legs_20.png', 'MALE_1'),
	(93, 'STORE', 'LEG', 'legs_21.png', 'MALE_1'),
	(94, 'COMMON', 'ARM_BACK', 'back_arm_1.png', 'FEMALE_1'),
	(95, 'COMMON', 'ARM_BACK', 'back_arm_2.png', 'FEMALE_1'),
	(96, 'COMMON', 'ARM_BACK', 'back_arm_3.png', 'FEMALE_1'),
	(97, 'COMMON', 'ARM_BACK', 'back_arm_4.png', 'FEMALE_1'),
	(98, 'COMMON', 'ARM_BACK', 'back_arm_5.png', 'FEMALE_1'),
	(99, 'COMMON', 'ARM_BACK', 'back_arm_6.png', 'FEMALE_1'),
	(100, 'COMMON', 'ARM_BACK', 'back_arm_7.png', 'FEMALE_1'),
	(101, 'COMMON', 'BODY', 'body_1.png', 'FEMALE_1'),
	(102, 'COMMON', 'BODY', 'body_2.png', 'FEMALE_1'),
	(103, 'COMMON', 'BODY', 'body_3.png', 'FEMALE_1'),
	(104, 'COMMON', 'BODY', 'body_4.png', 'FEMALE_1'),
	(105, 'COMMON', 'BODY', 'body_5.png', 'FEMALE_1'),
	(106, 'COMMON', 'BODY', 'body_6.png', 'FEMALE_1'),
	(107, 'COMMON', 'ARM_FRONT', 'front_arm_1.png', 'FEMALE_1'),
	(108, 'COMMON', 'ARM_FRONT', 'front_arm_2.png', 'FEMALE_1'),
	(109, 'COMMON', 'ARM_FRONT', 'front_arm_3.png', 'FEMALE_1'),
	(110, 'COMMON', 'ARM_FRONT', 'front_arm_4.png', 'FEMALE_1'),
	(111, 'COMMON', 'ARM_FRONT', 'front_arm_5.png', 'FEMALE_1'),
	(112, 'COMMON', 'ARM_FRONT', 'front_arm_6.png', 'FEMALE_1'),
	(113, 'COMMON', 'ARM_FRONT', 'front_arm_7.png', 'FEMALE_1'),
	(114, 'COMMON', 'HEAD', 'head_1.png', 'FEMALE_1'),
	(115, 'COMMON', 'HEAD', 'head_10.png', 'FEMALE_1'),
	(116, 'COMMON', 'HEAD', 'head_11.png', 'FEMALE_1'),
	(117, 'COMMON', 'HEAD', 'head_12.png', 'FEMALE_1'),
	(118, 'COMMON', 'HEAD', 'head_13.png', 'FEMALE_1'),
	(119, 'COMMON', 'HEAD', 'head_14.png', 'FEMALE_1'),
	(120, 'COMMON', 'HEAD', 'head_15.png', 'FEMALE_1'),
	(121, 'COMMON', 'HEAD', 'head_16.png', 'FEMALE_1'),
	(122, 'COMMON', 'HEAD', 'head_17.png', 'FEMALE_1'),
	(123, 'COMMON', 'HEAD', 'head_2.png', 'FEMALE_1'),
	(124, 'COMMON', 'HEAD', 'head_3.png', 'FEMALE_1'),
	(125, 'COMMON', 'HEAD', 'head_4.png', 'FEMALE_1'),
	(126, 'COMMON', 'HEAD', 'head_5.png', 'FEMALE_1'),
	(127, 'COMMON', 'HEAD', 'head_6.png', 'FEMALE_1'),
	(128, 'COMMON', 'HEAD', 'head_7.png', 'FEMALE_1'),
	(129, 'COMMON', 'HEAD', 'head_8.png', 'FEMALE_1'),
	(130, 'COMMON', 'HEAD', 'head_9.png', 'FEMALE_1'),
	(131, 'COMMON', 'LEG', 'legs_1.png', 'FEMALE_1'),
	(132, 'COMMON', 'LEG', 'legs_2.png', 'FEMALE_1'),
	(133, 'COMMON', 'LEG', 'legs_3.png', 'FEMALE_1'),
	(134, 'STORE', 'HEAD', 'head_18.png', 'MALE_1'),
	(135, 'STORE', 'HEAD', 'head_19.png', 'MALE_1'),
	(136, 'STORE', 'HEAD', 'head_20.png', 'MALE_1'),
	(137, 'STORE', 'HEAD', 'head_21.png', 'MALE_1'),
	(138, 'COMMON', 'LEG', 'legs_4.png', 'MALE_1'),
	(139, 'COMMON', 'LEG', 'legs_5.png', 'MALE_1'),
	(140, 'COMMON', 'LEG', 'legs_6.png', 'MALE_1'),
	(141, 'STORE', 'ARM_BACK', 'back_arm_9.png', 'FEMALE_1'),
	(144, 'STORE', 'ARM_BACK', 'back_arm_10.png', 'FEMALE_1'),
	(145, 'STORE', 'ARM_BACK', 'back_arm_11.png', 'FEMALE_1'),
	(146, 'STORE', 'ARM_BACK', 'back_arm_12.png', 'FEMALE_1'),
	(147, 'STORE', 'BODY', 'body_10.png', 'FEMALE_1'),
	(148, 'STORE', 'BODY', 'body_11.png', 'FEMALE_1'),
	(149, 'STORE', 'BODY', 'body_12.png', 'FEMALE_1'),
	(150, 'STORE', 'BODY', 'body_13.png', 'FEMALE_1'),
	(151, 'STORE', 'ARM_FRONT', 'front_arm_9.png', 'FEMALE_1'),
	(152, 'STORE', 'ARM_FRONT', 'front_arm_10.png', 'FEMALE_1'),
	(153, 'STORE', 'ARM_FRONT', 'front_arm_11.png', 'FEMALE_1'),
	(154, 'STORE', 'ARM_FRONT', 'front_arm_12.png', 'FEMALE_1'),
	(155, 'STORE', 'HEAD', 'head_23.png', 'FEMALE_1'),
	(156, 'STORE', 'HEAD', 'head_24.png', 'FEMALE_1'),
	(157, 'STORE', 'HEAD', 'head_25.png', 'FEMALE_1'),
	(158, 'STORE', 'HEAD', 'head_26.png', 'FEMALE_1'),
	(159, 'STORE', 'HEAD', 'head_27.png', 'FEMALE_1'),
	(160, 'STORE', 'HEAD', 'head_28.png', 'FEMALE_1'),
	(161, 'STORE', 'HEAD', 'head_29.png', 'FEMALE_1'),
	(162, 'STORE', 'LEG', 'legs_9.png', 'FEMALE_1'),
	(163, 'STORE', 'LEG', 'legs_10.png', 'FEMALE_1'),
	(164, 'STORE', 'LEG', 'legs_11.png', 'FEMALE_1'),
	(165, 'STORE', 'LEG', 'legs_12.png', 'FEMALE_1'),
	(166, 'STORE', 'HEAD', 'head_23.png', 'MALE_1'),
	(167, 'STORE', 'HEAD', 'head_24.png', 'MALE_1'),
	(168, 'STORE', 'BODY', 'body_23.png', 'MALE_1'),
	(169, 'STORE', 'BODY', 'body_24.png', 'MALE_1'),
	(170, 'STORE', 'LEG', 'legs_23.png', 'MALE_1'),
	(171, 'STORE', 'LEG', 'legs_24.png', 'MALE_1'),
	(172, 'STORE', 'ARM_FRONT', 'front_arm_23.png', 'MALE_1'),
	(173, 'STORE', 'ARM_FRONT', 'front_arm_24.png', 'MALE_1'),
	(174, 'STORE', 'ARM_BACK', 'back_arm_24.png', 'MALE_1'),
	(193, 'STORE', 'ARM_BACK', 'back_arm_23.png', 'MALE_1');
/*!40000 ALTER TABLE `avatar_types` ENABLE KEYS */;


-- Dumping structure for table relentlessdb.card_types
CREATE TABLE IF NOT EXISTS `card_types` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `kind` tinytext,
  `name` tinytext,
  `description` tinytext,
  `flavor` tinytext,
  `subTypesStr` tinytext,
  `rarity` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `hp` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ap` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ac` tinyint(3) unsigned NOT NULL DEFAULT '0',
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

-- Dumping data for table relentlessdb.card_types: ~150 rows (approximately)
/*!40000 ALTER TABLE `card_types` DISABLE KEYS */;
REPLACE INTO `card_types` (`id`, `kind`, `name`, `description`, `flavor`, `subTypesStr`, `rarity`, `hp`, `ap`, `ac`, `costDecay`, `costOrder`, `costGrowth`, `costEnergy`, `rulesList`, `cardImage`, `animationPreviewImage`, `animationPreviewInfo`, `animationBundle`, `abilities`, `targetArea`, `passiveRules`, `sound`, `soundProjectile`, `available`) VALUES
	(1, 'CREATURE', 'Gravelock Elder', 'Other Gravelock creatures you control gain +1 Attack and +1 Health while Gravelock Elder is in play.', 'Gravelocks look up to their elders... literally.', 'Gravelock', 2, 5, 3, 2, 0, 0, 0, 5, '3|AttackForwardRanged|Move|GravelockStrengthModifier', 479, 445, '54.75,50.5,0.25', 98, '1|Move|Move|Move unit to adjacent tile|0|0|0|0', 'FORWARD', '1|Ranged attack|This unit does not take damage from attacking Spiky units.', 'impact_gravelock_physical', NULL, 1),
	(2, 'CREATURE', 'Gravelock Raider', NULL, 'You can handle one or two, but before you know it, they\'re everywhere.', 'Gravelock', 0, 2, 1, 2, 0, 0, 0, 1, '2|AttackForwardContinuous|Move', 480, 446, '74.6,24.75,0.25', 99, '1|Move|Move|Move unit to adjacent tile|0|0|0|0', 'FORWARD', '1|Relentless|If opponent blocking unit is destroyed, this creature will continue its attack.', 'action_gravelock_raider', NULL, 1),
	(4, 'CREATURE', 'Gravehawk', 'For each of your Gravelocks, Gravehawk gains +1 Attack.', '"Mom always said I\'d end up in bad company. If she only knew..." \\n- Ryssa, Gravehawk', 'Human', 1, 3, 1, 2, 0, 0, 2, 0, '3|AttackForwardContinuous|Move|NighthawkIncAp', 482, 448, '48.75,77,0.25', 101, '1|Move|Move|Move unit to adjacent tile|0|0|0|0', 'FORWARD', '1|Relentless|If opponent blocking unit is destroyed, this creature will continue its attack.', NULL, NULL, 1),
	(13, 'ENCHANTMENT', 'Elan Vital', 'Enchanted unit is healed by 1 Health each round.', 'Heal faster than you hurt and you\'ll keep fighting forever.', NULL, 0, 0, 0, 0, 0, 0, 1, 0, '1|ElanVital', 483, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
	(15, 'ENCHANTMENT', 'Crown of Strength', 'Enchanted unit gains +1 Attack and +2 Health.', 'The power of kings, imbued through discarded headwear.', NULL, 1, 0, 0, 0, 0, 2, 0, 0, '1|CrownOfStrength', 484, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
	(16, 'ENCHANTMENT', 'Bear Paw', 'Enchanted unit gains +2 Attack and +2 Health. When Bear Paw enters play, enchanted unit\'s Countdown increases by 1.', 'The gods saw fit to give it strong limbs and a mellow temperament. ', NULL, 0, 0, 0, 0, 0, 0, 2, 0, '1|BearPaw', 485, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
	(17, 'ENCHANTMENT', 'Binding Root', 'Enchanted unit\'s Move is decreased by 1.', 'There\'s no better ally than the ground beneath your enemies.', NULL, 0, 0, 0, 0, 0, 0, 1, 0, '1|BindingRoot', 486, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
	(18, 'SPELL', 'Hymn', 'Heal target unit by 3 Health.', 'Music for those who can\'t dance.', NULL, 0, 0, 0, 0, 0, 0, 1, 0, '1|Hymn', 487, 0, NULL, 0, NULL, 'TILE', NULL, NULL, NULL, 1),
	(19, 'SPELL', 'Metempsychosis', 'Target unit you control is resummoned on the same tile.', 'Consider the egg. The image of unfulfilled potential, and you eat them for breakfast...', NULL, 1, 0, 0, 0, 0, 3, 0, 0, '1|Metempsychosis', 488, 0, NULL, 0, NULL, 'TILE', NULL, NULL, NULL, 1),
	(20, 'SPELL', 'Thought Trap', 'Target unit\'s Countdown is doubled.', 'How far will a blind dog walk into a forest?', NULL, 0, 0, 0, 0, 0, 2, 0, 0, '1|ThoughtTrap', 489, 0, NULL, 0, NULL, 'TILE', NULL, NULL, NULL, 1),
	(21, 'SPELL', 'Rallying', 'All units you control have their Countdown decreased by 2.', 'FOLLOW THE JARL FOR THE KIN!', NULL, 1, 0, 0, 0, 0, 0, 5, 0, '1|Rallying', 490, 0, NULL, 0, NULL, 'UNDEFINED', NULL, NULL, NULL, 1),
	(22, 'CREATURE', 'Brother of the Wolf', 'When Countdown is 0, Brother of the Wolf can summon one Ragged Wolf instead of attacking.', 'Befriending wolves isn\'t that hard. Failure, however, can be costly.', 'Human,Kinfolk', 1, 4, 3, 2, 0, 0, 4, 0, '3|AttackForward|Move|SummonWolf', 491, 449, '63.5,86,0.25', 102, '2|Move|Move|Move unit to adjacent tile|0|0|0|0|SummonWolf|Summon Wolf|Summon a Ragged Wolf. Countdown increases by 2.|0|0|0|0', 'FORWARD', NULL, NULL, NULL, 1),
	(23, 'SPELL', 'Callback', 'Target unit you control is returned to your hand.', 'Everyone deserves a second chance.', NULL, 0, 0, 0, 0, 0, 1, 0, 0, '1|Callback', 492, 0, NULL, 0, NULL, 'TILE', NULL, NULL, NULL, 1),
	(24, 'STRUCTURE', 'Catapult of Goo', 'Units attacked by Catapult of Goo have their Countdown increased by 1.', '"I don\'t know if the piddlejacks are drivers or parasites on that infernal machine." \\n- Ihrbraman, Creature Collector.', 'Artillery', 0, 4, 1, 2, 0, 0, 0, 3, '2|AttackGooCatapult|AttackGooCatapultDummy', 493, 450, '89.5,80.3,0.25', 103, NULL, 'RADIUS_4', '1|Lobber|This unit attacks at a specific section of the board.', 'action_catapult_goo', 'impact_catapult_goo', 1),
	(25, 'SPELL', 'Thunder Surge', 'Target unit, and all units connected by adjacent units, receive 2 damage.', 'Fear not the thunder. Fear the lightning.', NULL, 2, 0, 0, 0, 0, 0, 0, 6, '1|ThunderSurge', 494, 0, NULL, 0, NULL, 'SEQUENTIAL', NULL, NULL, NULL, 1),
	(26, 'ENCHANTMENT', 'Champion Ring', 'Enchanted unit gets +2 Attack.', 'Hard to earn, even harder to carry.', NULL, 0, 0, 0, 0, 0, 0, 2, 0, '1|ChampionRing', 715, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
	(27, 'SPELL', 'Burn', 'Deal 3 damage to target unit. If that unit is destroyed, draw 1 scroll.', '"If you can\'t handle the fire, cool yourself in the kettle." \\n - Old machine priest saying.', NULL, 0, 0, 0, 0, 0, 0, 0, 4, '1|Burn', 496, 0, NULL, 0, NULL, 'TILE', NULL, 'action_burn', NULL, 1),
	(29, 'SPELL', 'Fertile Soil', 'Sacrifice target creature you control and draw 3 scrolls.', 'The Kinfolk don\'t mourn their dead; nature doesn\'t waste life.', NULL, 2, 0, 0, 0, 0, 0, 4, 0, '1|FertileSoil', 497, 0, NULL, 0, NULL, 'TILE', NULL, NULL, NULL, 1),
	(30, 'ENCHANTMENT', 'Death Cap Berserk', 'When Death Cap Berserk comes into play, and at the beginning of its following turns, enchanted creature\'s Countdown is decreased by 2. At the end of these turns, it is dealt 2 damage.', '"I love music. Especially wardrums." \\n- Harald, Berserker', NULL, 2, 0, 0, 0, 0, 0, 3, 0, '1|DeathCapBerserk', 498, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
	(32, 'STRUCTURE', 'Destroyer', NULL, 'About to dodge? It\'s too late!', 'Artillery', 1, 4, 2, 1, 0, 0, 0, 4, '1|AttackCatapult', 499, 451, '73.05,67.2,0.25', 104, NULL, 'RADIUS_4', '1|Lobber|This unit attacks at a specific section of the board.', NULL, 'impact_wood_hard_00', 1),
	(33, 'STRUCTURE', 'Druid Burial Ground', 'At the beginning of your turn, Druid Burial Ground heals 1 Health of all adjacent units.', '"I once saw two cats fighting next to such a monument. The fight lasted a week, then they starved to death."\\n- Ihrbraman, Creature Collector.', 'Wall', 1, 5, 0, 0, 0, 0, 3, 0, '1|HealSurrounding', 500, 452, '96.3,98.3,0.25', 105, NULL, NULL, NULL, NULL, NULL, 1),
	(34, 'SPELL', 'Quake', 'Deal 3 damage to all structures and 2 damage to all creatures.', 'No matter your skill, you can\'t parry the ground.', NULL, 2, 0, 0, 0, 0, 0, 6, 0, '1|Quake', 501, 0, NULL, 0, NULL, 'UNDEFINED', NULL, NULL, NULL, 1),
	(35, 'SPELL', 'Inferno Blast', 'Deal 1 damage to target tile and all adjacent tiles.', 'The power of ten men in one practical projectile.', NULL, 0, 0, 0, 0, 0, 0, 0, 3, '1|InfernoBlast', 502, 0, NULL, 0, NULL, 'RADIUS_7', NULL, 'action_burn', NULL, 1),
	(36, 'SPELL', 'Flip', 'Move target opponent unit to any unoccupied tile on opponent\'s board.', 'A shift in perspective isn\'t always a good thing.', NULL, 1, 0, 0, 0, 0, 2, 0, 0, '1|Flip', 503, 0, NULL, 0, NULL, 'UNDEFINED', NULL, NULL, NULL, 1),
	(37, 'SPELL', 'Frost Wind', 'Add +1 Countdown to units on target tile and all adjacent tiles.', 'Packing an extra blanket is always good. Or five, if you\'re heading north.', NULL, 1, 0, 0, 0, 0, 2, 0, 0, '1|FrostWind', 504, 0, NULL, 0, NULL, 'RADIUS_7', NULL, 'action_frost_wind', NULL, 1),
	(38, 'CREATURE', 'Great Wolf', 'Great Wolf gets +1 Attack for every other Wolf you control.', 'The beasts have legends too.', 'Beast,Wolf', 2, 5, 3, 2, 0, 0, 5, 0, '3|AttackForwardContinuous|Move|GreatWolfStrengthModifier', 505, 453, '97.5,22.6,0.25', 106, '1|Move|Move|Move unit to adjacent tile|0|0|0|0', 'FORWARD', '1|Relentless|If opponent blocking unit is destroyed, this creature will continue its attack.', 'action_bite_00', NULL, 1),
	(39, 'CREATURE', 'Iron Ogre', NULL, 'Step aside or be disintegrated.', 'Elder', 2, 7, 7, 3, 0, 0, 0, 7, '2|AttackForwardContinuous|Move', 506, 454, '84.4,91.5,0.25', 107, '1|Move|Move|Move unit to adjacent tile|0|0|0|0', 'FORWARD', '1|Relentless|If opponent blocking unit is destroyed, this creature will continue its attack.', NULL, NULL, 1),
	(40, 'STRUCTURE', 'Junkyard', 'Rat creatures you control gain +1 Health while Junkyard is in play.', 'Rats aren\'t picky.', 'Wall', 0, 3, 0, 0, 0, 0, 1, 0, '1|RatHealthModifier', 507, 455, '80.55,116.3,0.25', 108, NULL, NULL, NULL, NULL, NULL, 1),
	(41, 'CREATURE', 'Kinfolk Brave', NULL, 'Hirsute, honorable, and with big biceps.', 'Human,Kinfolk', 2, 2, 2, 1, 0, 0, 2, 0, '2|AttackForward|Move', 508, 456, '96.9,71.6,0.25', 109, '1|Move|Move|Move unit to adjacent tile|0|0|0|0', 'FORWARD', NULL, NULL, NULL, 1),
	(42, 'CREATURE', 'Kinfolk Jarl', 'For each creature adjacent to Kinfolk Jarl, Kinfolk Jarl gains +1 Attack. ', 'The strength of his people, crushing your people.', 'Human,Kinfolk', 2, 6, 3, 2, 0, 0, 7, 0, '3|AttackForwardContinuous|SurroundingIncAp|Move', 509, 839, '61.15,106.3,0.25', 238, '1|Move|Move|Move unit to adjacent tile|0|0|0|0', 'FORWARD', '1|Relentless|If opponent blocking unit is destroyed, this creature will continue its attack.', NULL, NULL, 1),
	(43, 'ENCHANTMENT', 'Leeching Ring', 'When enchanted creature deals damage, enchanted creature is healed by as much Health as its original Countdown.', 'Search the ponds. Find one and your name is eternal.', NULL, 1, 0, 0, 0, 0, 0, 1, 0, '1|LeechingRing', 510, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
	(44, 'CREATURE', 'Mangy Wolf', 'When Mangy Wolf deals damage, it is healed by one. Other Wolf creatures you control have their Countdown decreased by 1 when Mangy Wolf comes into play.', '"The fat wolf is not dangerous."\\n - Kinfolk proverb', 'Beast,Wolf', 0, 3, 2, 2, 0, 0, 4, 0, '4|AttackForward|Move|HealOneOnDamage|CountdownWolvesOnEnterBoard', 511, 458, '94.1,12.4,0.25', 111, '1|Move|Move|Move unit to adjacent tile|0|0|0|0', 'FORWARD', NULL, 'action_bite_01', NULL, 1),
	(45, 'ENCHANTMENT', 'Dryadic Power', 'Enchanted creature gains +1 Attack and +3 Health, and its Move is decreased by 1.', 'The strength of a tree with the resolve of a rock.', NULL, 1, 0, 0, 0, 0, 0, 1, 0, '1|DryadicPower', 512, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
	(47, 'ENCHANTMENT', 'Potion of Resistance', 'All damage dealt to enchanted unit is reduced to 1 for 3 rounds.', 'Sometimes you\'ve just got to take the hit.', NULL, 2, 0, 0, 0, 0, 0, 0, 1, '1|PotionOfResistance', 720, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
	(48, 'SPELL', 'Pushback', 'Target opponent unit is returned to its owner\'s hand.', 'You know you\'re not wanted when your body dissolves.', NULL, 1, 0, 0, 0, 0, 4, 0, 0, '1|Pushback', 514, 0, NULL, 0, NULL, 'TILE', NULL, 'action_pushback', NULL, 1),
	(49, 'CREATURE', 'Ragged Wolf', NULL, 'Fast and feisty.', 'Beast,Wolf', 0, 2, 1, 2, 0, 0, 1, 0, '3|AttackForward|Move|Haste', 515, 459, '94.2,12.4,0.25', 112, '1|Move|Move|Move unit to adjacent tile|0|0|0|0', 'FORWARD', '1|Haste|Creature comes in play with Countdown set to 0.', 'action_bite_01', NULL, 1),
	(50, 'SPELL', 'Kabonk', 'Deal 1 damage to target unit. Draw 1 scroll.', 'Ouch!', NULL, 0, 0, 0, 0, 0, 2, 0, 0, '1|Kabonk', 516, 0, NULL, 0, NULL, 'TILE', NULL, NULL, NULL, 1),
	(51, 'STRUCTURE', 'Shrine', 'While Shrine is in play, all other units you control gain +1 Health.', 'With a strong enough faith, you don\'t need gods for miracles.', 'Totem', 2, 2, 0, 0, 0, 3, 0, 0, '1|ShrineIncHp', 517, 460, '45.55,95.8,0.25', 113, NULL, NULL, NULL, NULL, NULL, 1),
	(52, 'CREATURE', 'Sinmarked Zealot', 'When Countdown is 0, Sinmarked Zealot can be sacrificed to deal 2 damage to target unit.', 'When his time comes, so will yours.', 'Human', 1, 1, 1, 2, 0, 1, 0, 0, '3|AttackForward|Move|SacrificeAttack', 518, 461, '91.8,72,0.25', 239, '2|Move|Move|Move unit to adjacent tile|0|0|0|0|SacrificeAttack|Sacrifice Attack|Deal 2 damage to selected enemy and kills itself.|0|0|0|0', 'FORWARD', NULL, NULL, NULL, 1),
	(53, 'CREATURE', 'Sister of the Fox', 'When Sister of the Fox comes into play, draw 1 scroll.', 'The eyes and ears of the Jarl.', 'Human,Kinfolk', 0, 1, 1, 2, 0, 0, 2, 0, '3|AttackForward|Move|DrawScrollOnEnterBoard', 873, 883, '42.25,83.8,0.25', 275, '1|Move|Move|Move unit to adjacent tile|0|0|0|0', 'FORWARD', NULL, NULL, NULL, 1),
	(54, 'CREATURE', 'Royal Vanguard', 'When Royal Vanguard\'s Countdown becomes 0, adjacent units gain +2 Attack until end of turn.', 'Honor. Power. Axe.', 'Human,Knight', 2, 5, 3, 2, 0, 5, 0, 0, '3|AttackForward|Move|Vanguard', 520, 463, '57.75,116.25,0.25', 116, '1|Move|Move|Move unit to adjacent tile|0|0|0|0', 'FORWARD', NULL, NULL, NULL, 1),
	(55, 'SPELL', 'Speed', 'Target unit\'s Countdown is decreased by 3.', 'They won\'t know what hit them.', NULL, 2, 0, 0, 0, 0, 3, 0, 0, '1|Speed', 521, 0, NULL, 0, NULL, 'TILE', NULL, NULL, NULL, 1),
	(56, 'SPELL', 'Essence Feast', 'For each unit you control, heal your idol on the same row by 1. Beast creatures deal double damage to idols this turn.', 'Just like love, it can heal and hurt.', NULL, 2, 0, 0, 0, 0, 0, 6, 0, '1|EssenceFeast', 522, 0, NULL, 0, NULL, 'UNDEFINED', NULL, NULL, NULL, 1),
	(57, 'SPELL', 'Pother', 'Target unit is moved to a random adjacent tile. Draw 1 scroll.', 'Now you\'re there, now you\'re not!', NULL, 1, 0, 0, 0, 0, 1, 0, 0, '1|Pother', 523, 0, NULL, 0, NULL, 'TILE', NULL, NULL, NULL, 1),
	(58, 'ENCHANTMENT', 'Unleash Inner Power', 'Target creature\'s Attack is increased by its Health value. Its Health is then set to 2.', 'My very essence shall be my blade.', NULL, 2, 0, 0, 0, 0, 0, 4, 0, '1|UnleashInnerPower', 524, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
	(60, 'STRUCTURE', 'Eternal Statue', 'At the beginning of your turn, Eternal Statue heals 1 point of Health.', 'It\'s said some sculptors infuse their work with a life of its own.', 'Wall', 0, 4, 0, 0, 0, 0, 2, 0, '1|HealSelf', 526, 465, '61.65,111,0.25', 118, NULL, NULL, NULL, NULL, NULL, 1),
	(61, 'STRUCTURE', 'Waking Stones', 'All damage dealt to Waking Stones is reduced to 1.', 'The problem with stone is that it is stationary. We fixed that."\\n- Uria, Geo Mage.', 'Wall', 2, 3, 0, 0, 0, 3, 0, 0, '1|ReduceDamage', 527, 466, '48.75,117.3,0.25', 119, NULL, NULL, NULL, NULL, NULL, 1),
	(62, 'SPELL', 'Transposition', 'Switch places of two units you control. Draw 1 scroll.', 'You don\'t need powerful allies. You need allies in the right places.', NULL, 0, 0, 0, 0, 0, 1, 0, 0, '1|Transposition', 528, 0, NULL, 0, NULL, 'UNDEFINED', NULL, NULL, NULL, 1),
	(63, 'STRUCTURE', 'Vitality Well', 'When Vitality Well\'s Countdown becomes 0, all friendly units are healed by 1.', 'Refreshing!', 'Totem', 0, 3, 0, 3, 0, 0, 2, 0, '2|VitalityWell|Haste', 529, 467, '49.05,-0.5,0.25', 259, NULL, NULL, '1|Haste|Creature comes in play with Countdown set to 0.', NULL, NULL, 1),
	(64, 'SPELL', 'Blessing of Haste', 'Target unit\'s Countdown is decreased by 1.', 'A little bit of speed can make all the difference.', NULL, 1, 0, 0, 0, 0, 1, 0, 0, '1|BlessingOfHaste', 530, 0, NULL, 0, NULL, 'TILE', NULL, NULL, NULL, 1),
	(65, 'STRUCTURE', 'Ancestral Totem', 'While Ancestral Totem is in play, creatures you control gain +1 Attack.', 'Kinfolk creations aren\'t always pleasant.', 'Totem', 2, 2, 0, 0, 0, 0, 4, 0, '1|TotemPower', 531, 468, '41,85.75,0.25', 121, NULL, NULL, NULL, NULL, NULL, 1),
	(66, 'CREATURE', 'Copper Automaton', 'Copper Automaton is destroyed after attacking.', 'Explosively cute.', 'Automaton', 0, 2, 4, 1, 0, 0, 0, 1, '3|AttackForward|Move|DieAfterAttack', 532, 469, '62.75,-22.45,0.25', 199, '1|Move|Move|Move unit to adjacent tile|0|0|0|0', 'FORWARD', NULL, 'action_copperauto', NULL, 1),
	(67, 'SPELL', 'Spark', 'Deal 2 points of damage to target unit.', 'The smallest spark can cause a decent flame.', NULL, 0, 0, 0, 0, 0, 0, 0, 2, '1|Spark', 533, 0, NULL, 0, NULL, 'TILE', NULL, 'action_burn', NULL, 1),
	(68, 'CREATURE', 'Cannon Automaton', NULL, 'wrrr wrrr clunk phssssht BwoooOOOM wrrr wrrr', 'Automaton', 1, 4, 5, 2, 0, 0, 0, 6, '3|AttackForwardRanged|Move|ArmorModifier', 534, 470, '101.2,111.45,0.25', 256, '1|Move|Move|Move unit to adjacent tile|0|0|0|0', 'FORWARD', '2|Ranged attack|This unit does not take damage from attacking Spiky units.|Armor 1|All combat damage dealt to Cannon Automaton is reduced by 1.', NULL, NULL, 1),
	(70, 'SPELL', 'Violent Dispersal', 'Destroy target unit.', '"When he said \'Disperse!\' I thought he meant all of us. Turns out he was only addressing poor Mikal." \\n- Mahts, Infantryman.', NULL, 2, 0, 0, 0, 0, 0, 0, 6, '1|ViolentDispersal', 536, 0, NULL, 0, NULL, 'TILE', NULL, NULL, NULL, 1),
	(71, 'SPELL', 'Focus', 'Target unit gains +3 Attack until end of turn.', 'If it\'s worth killing, kill it good!', NULL, 0, 0, 0, 0, 0, 1, 0, 0, '1|Focus', 537, 0, NULL, 0, NULL, 'TILE', NULL, NULL, NULL, 1),
	(73, 'SPELL', 'New Orders', 'All your units have their Move increased by 1 until end of turn.', 'REGROUP!', NULL, 0, 0, 0, 0, 0, 1, 0, 0, '1|NewOrders', 538, 0, NULL, 0, NULL, 'UNDEFINED', NULL, NULL, NULL, 1),
	(74, 'CREATURE', 'Honorable General', 'When Honorable General\'s Countdown becomes 0, all adjacent units have their Countdown decreased by 2. ', NULL, 'Human,Knight', 2, 6, 4, 3, 0, 6, 0, 0, '3|AttackForward|TriggerSurroundingZeroAc|Move', 829, 828, '104.9,154.7,0.25', 241, '1|Move|Move|Move unit to adjacent tile|0|0|0|0', 'FORWARD', NULL, NULL, NULL, 1),
	(75, 'CREATURE', 'Kinfolk Veteran', NULL, 'It\'s tough getting old in this business.', 'Human,Kinfolk', 1, 4, 3, 2, 0, 0, 5, 0, '3|AttackForward|Move|Haste', 540, 788, '113.1,78.1,0.25', 207, '1|Move|Move|Move unit to adjacent tile|0|0|0|0', 'FORWARD', '1|Haste|Creature comes in play with Countdown set to 0.', NULL, NULL, 1),
	(76, 'SPELL', 'Rumble', 'Opponent\'s units move one step to a random adjacent empty tile.', 'Shaken, not crushed.', NULL, 1, 0, 0, 0, 0, 0, 3, 0, '1|Rumble', 541, 0, NULL, 0, NULL, 'UNDEFINED', NULL, NULL, NULL, 1),
	(77, 'SPELL', 'Fury', 'All units decrease their Countdown by 1.', 'Fanning the flames of battle.', NULL, 1, 0, 0, 0, 0, 0, 0, 3, '1|Fury', 542, 0, NULL, 0, NULL, 'UNDEFINED', NULL, 'action_fury', NULL, 1),
	(78, 'SPELL', 'Crimson Bull', 'All units you control gain +2 Attack until end of turn.', 'Drink, and take flight!', NULL, 1, 0, 0, 0, 0, 0, 2, 0, '1|CrimsonBull', 734, 0, NULL, 0, NULL, 'UNDEFINED', NULL, NULL, NULL, 1),
	(79, 'CREATURE', 'Machine Priest', 'Instead of attacking, Machine Priest heals all your structures by 1. When Countdown is 0, Machine Priest can move a structure one step in a random direction instead of healing.', NULL, 'Human,Tribesman', 1, 4, 0, 2, 0, 0, 0, 2, '3|Move|DyrrianHeal|DisplaceStructure', 544, 474, '81.7,68.8,0.25', 127, '2|Move|Move|Move unit to adjacent tile|0|0|0|0|DisplaceStructure|Displace Structure|Target structure is moved to a random unoccupied, adjacent tile.|0|0|0|0', NULL, NULL, NULL, NULL, 1),
	(80, 'ENCHANTMENT', 'Ember Bonds', 'Enchanted unit receives 2 damage before attacking.', 'It\'s inevitable.', NULL, 1, 0, 0, 0, 0, 0, 0, 3, '1|EmberBonds', 545, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
	(81, 'SPELL', 'End of Reason', 'Sacrifice all units you control with a non-zero Countdown. Each unit sacrificed this way deals 2 damage to opponent units on the same row.', '"You served me well as soldiers. Now serve me as projectiles!"\\n- Arran, Machine Priest', NULL, 2, 0, 0, 0, 0, 0, 0, 5, '1|EndOfReason', 546, 0, NULL, 0, NULL, 'UNDEFINED', NULL, NULL, NULL, 1),
	(82, 'STRUCTURE', 'Ether Pump', 'When Ether Pump attacks, all opponent\'s units are dealt 1 damage.', '"I know what it looks like! Trust me. A few of these will win any siege." \\n- Arran, Machine Priest', 'Totem', 1, 5, 0, 3, 0, 0, 0, 4, '1|EtherAttack', 547, 475, '52.3,55.3,0.25', 128, NULL, NULL, NULL, NULL, NULL, 1),
	(83, 'ENCHANTMENT', 'Golem Skin', 'When Golem Skin comes into play, sacrifice all your structures. Enchanted creature gains Attack and Health equal to the number of structures sacrificed.', 'When you wear machines, laundry day is your greatest worry.', NULL, 0, 0, 0, 0, 0, 0, 0, 2, '1|GolemSkin', 548, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
	(84, 'SPELL', 'Frost Gale', 'Deal 1 damage to all units.', 'Bad weather is a great weapon. If only you could aim it.', NULL, 0, 0, 0, 0, 0, 0, 2, 0, '1|FrostGale', 549, 0, NULL, 0, NULL, 'UNDEFINED', NULL, NULL, NULL, 1),
	(85, 'ENCHANTMENT', 'Magma Pack', 'When Magma Pack comes into play, enchanted unit\'s Attack is doubled. Enchanted unit is destroyed after attacking.', 'Don\'t worry, just push the button when you arrive.', NULL, 1, 0, 0, 0, 0, 0, 0, 2, '1|MagmaPack', 550, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
	(86, 'ENCHANTMENT', 'Plate Armor', 'Enchanted unit has Armor 1 (combat damage dealt to enchanted unit is decreased by 1).', '"If only we had enough for everyone..."\\n- Lord Ungstram, Royal Strategist.', NULL, 2, 0, 0, 0, 0, 2, 0, 0, '1|PlateArmor', 551, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
	(87, 'SPELL', 'Tick Bomb', 'Destroy target structure.', 'Sounds like tick, looks like tick.', NULL, 0, 0, 0, 0, 0, 0, 0, 3, '1|TickBomb', 552, 0, NULL, 0, NULL, 'TILE', NULL, NULL, NULL, 1),
	(88, 'ENCHANTMENT', 'Vitriol Aura', 'When enchanted unit is attacked in melee combat, attacker becomes poisoned for 3 rounds.', 'Try not to breathe.', NULL, 0, 0, 0, 0, 0, 0, 1, 0, '1|VitriolAura', 826, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
	(89, 'SPELL', 'Eye of Eagle', 'Take the next creature scroll from your library and add it to your hand.', 'Strategy is nothing if you\'re blind.', NULL, 0, 0, 0, 0, 0, 0, 1, 0, '1|EyeOfEagle', 554, 0, NULL, 0, NULL, 'UNDEFINED', NULL, NULL, NULL, 1),
	(90, 'STRUCTURE', 'Proximity Charge', 'When Proximity Charge is destroyed in melee combat, attacking unit is dealt 4 damage. When Proximity Charge comes into play, one copy is summoned on a random adjacent tile.', 'Tread lightly!', 'Wall', 0, 1, 0, 0, 0, 0, 0, 4, '2|ProximityCharge|SummonCopyOnEnterBoard', 555, 476, '65.8,-63.2,0.25', 0, NULL, NULL, NULL, NULL, NULL, 1),
	(91, 'CREATURE', 'Frostbeard', 'When Frostbeard is killed in battle, all friendly units gain +2 Attack until end of your turn.', 'An honorable death is not to be mourned; it\'s a blessing.', 'Human,Kinfolk', 0, 1, 6, 3, 0, 0, 3, 0, '3|AttackForward|Move|FrostBeardMoraleBoost', 573, 571, '100.7,61.05,0.25', 131, '1|Move|Move|Move unit to adjacent tile|0|0|0|0', 'FORWARD', NULL, NULL, NULL, 1),
	(92, 'ENCHANTMENT', 'Heritage', 'When enchanted unit you control is destroyed, you draw 2 scrolls.', '"This way your life, or death, won\'t be a complete waste." \\n- Lord Ungstram, Royal Strategist.', NULL, 1, 0, 0, 0, 0, 3, 0, 0, '1|Heritage', 557, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
	(93, 'SPELL', 'Faith Blessing', 'Target unit you control takes 2 damage. Your idol on that row is healed by 4.', '"It\'s an immense honor. Be grateful for it." \\n- Pater Brecht', NULL, 1, 0, 0, 0, 0, 2, 0, 0, '1|FaithBlessing', 718, 0, NULL, 0, NULL, 'TILE', NULL, NULL, NULL, 1),
	(94, 'SPELL', 'Nutrition', 'Sacrifice target unit you control and add that unit\'s cost to your current resources.', 'A cadaver for some, a feast for others.', NULL, 1, 0, 0, 0, 0, 0, 1, 0, '1|Nutrition', 559, 0, NULL, 0, NULL, 'TILE', NULL, NULL, NULL, 1),
	(95, 'ENCHANTMENT', 'Powerbound', 'When enchanted unit you control is destroyed, increase your Order by one.', '"I\'ll just borrow some life force when you don\'t need it anymore."\\n- Lord Ungstram, Royal Strategist.', NULL, 0, 0, 0, 0, 0, 1, 0, 0, '1|OrderOnDeathEnch', 560, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
	(96, 'CREATURE', 'Gun Automaton', NULL, 'A special kind of turtle.', 'Automaton', 0, 3, 2, 2, 0, 0, 0, 2, '2|AttackForwardRanged|Move', 561, 477, '47.2,-19,0.25', 201, '1|Move|Move|Move unit to adjacent tile|0|0|0|0', 'FORWARD', '1|Ranged attack|This unit does not take damage from attacking Spiky units.', NULL, NULL, 1),
	(97, 'ENCHANTMENT', 'Vengeance Veil', 'When enchanted unit receives damage, its Countdown decreases by 1.', 'All is blood from behind the crimson veil.', NULL, 0, 0, 0, 0, 0, 1, 0, 0, '1|VengeanceVeil', 721, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
	(98, 'STRUCTURE', 'Useless Contraption', NULL, 'Working as intended.', 'Wall', 0, 4, 0, 0, 0, 0, 0, 1, NULL, 563, 478, '58.9,8,0.25', 130, NULL, NULL, NULL, NULL, NULL, 1),
	(99, 'SPELL', 'Purification', 'Remove all enchantments from target unit.', 'The innocence of youth can cleanse the corrupt.', NULL, 0, 0, 0, 0, 0, 1, 0, 0, '1|Purification', 564, 0, NULL, 0, NULL, 'TILE', NULL, NULL, NULL, 1),
	(100, 'ENCHANTMENT', 'Ranger\'s Bane', 'Enchanted creature becomes poisoned for 3 rounds.', 'You haven\'t really died until you\'ve been slowly strangled by poisonous roots.', NULL, 1, 0, 0, 0, 0, 0, 2, 0, '1|RangersBane', 565, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
	(101, 'SPELL', 'Horn of Ages', 'All units opponent controls have their Move decreased by 1 until end of opponent\'s turn.', 'You\'re thankful for surviving battles past, until you crumble under the weight of the memories.', NULL, 0, 0, 0, 0, 0, 1, 0, 0, '1|HornOfAges', 566, 0, NULL, 0, NULL, 'UNDEFINED', NULL, NULL, NULL, 1),
	(103, 'ENCHANTMENT', 'Faith Chains', 'When enchanted creature is destroyed, Faith Chains deals 1 damage to each of opponent\'s idols.', '"The chains weigh heavier on them, my son." \\n- Pater Brecht', NULL, 2, 0, 0, 0, 0, 4, 0, 0, '1|FaithChains', 568, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
	(104, 'ENCHANTMENT', 'Bloodboil', 'When enchanted unit takes damage, increase the unit\'s Attack by 1.', 'AURRGH... YOU... I... KILL RAAAHH!!', NULL, 0, 0, 0, 0, 0, 0, 1, 0, '1|Bloodboil', 569, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
	(105, 'SPELL', 'Summons', 'Draws one Structure from your library.', '"We need more stuff!" \\n- Lord Ungstram, Royal Strategist.', NULL, 0, 0, 0, 0, 0, 1, 0, 0, '1|Summons', 570, 0, NULL, 0, NULL, 'UNDEFINED', NULL, NULL, NULL, 1),
	(107, 'CREATURE', 'Scattergunner', NULL, '"He was carrying WHAT?!"\\n- Mahts, Infantryman.', 'Human,Tribesman', 1, 2, 4, 2, 0, 0, 0, 3, '2|AttackForwardRanged|Move', 574, 572, '100.5,62.25,0.25', 205, '1|Move|Move|Move unit to adjacent tile|0|0|0|0', 'FORWARD', '1|Ranged attack|This unit does not take damage from attacking Spiky units.', 'action_scattergun', 'impact_scattergun', 1),
	(108, 'STRUCTURE', 'Law Memorial', 'When Law Memorial comes into play, increase Order by 1.', 'You\'d think a people so fond of writing would remember the words of their ancestors.', 'Memorial', 0, 1, 0, 0, 0, 0, 0, 2, '1|IncOutputOrder', 591, 575, '36.15,40.6,0.25', 133, NULL, NULL, NULL, NULL, NULL, 1),
	(109, 'STRUCTURE', 'Desert Memorial', 'When Desert Memorial comes into play, increase Energy by 1.', 'Breakers against the eroding waves of time.', 'Memorial', 0, 1, 0, 0, 0, 2, 0, 0, '1|IncOutputEnergy', 592, 576, '41.15,6.65,0.25', 134, NULL, NULL, NULL, NULL, NULL, 1),
	(110, 'STRUCTURE', 'Tribal Memorial', 'When Tribal Memorial comes into play, increase Growth by 1.', 'Lest we forget the times of peace.', 'Memorial', 0, 1, 0, 0, 0, 0, 0, 2, '1|IncOutputGrowth', 593, 577, '46.25,-11.45,0.25', 135, NULL, NULL, NULL, NULL, NULL, 1),
	(111, 'STRUCTURE', 'Woodland Memorial', 'When Woodland Memorial comes into play, increase Growth by 1.', 'The Kinfolk have forgotten, but the trees remember.', 'Memorial', 0, 1, 0, 0, 0, 2, 0, 0, '1|IncOutputGrowth', 594, 578, '52.6,6.7,0.25', 136, NULL, NULL, NULL, NULL, NULL, 1),
	(112, 'STRUCTURE', 'Sand Pact Memorial', 'When Sand Pact Memorial comes into play, increase Energy by 1.', 'Like grains of sand in an hourglass, our memories fade over time.', 'Memorial', 0, 1, 0, 0, 0, 0, 2, 0, '1|IncOutputEnergy', 595, 579, '41.15,6.15,0.25', 137, NULL, NULL, NULL, NULL, NULL, 1),
	(113, 'STRUCTURE', 'Stone Pact Memorial', 'When Stone Pact Memorial comes into play, increase Order by 1.', 'We remember the times, but not the promises.', 'Memorial', 0, 1, 0, 0, 0, 0, 2, 0, '1|IncOutputOrder', 596, 580, '41.15,23.15,0.25', 138, NULL, NULL, NULL, NULL, NULL, 1),
	(114, 'ENCHANTMENT', 'Illthorn Seed', 'When enchanted unit you control is destroyed, summon Illthorn in its place.', 'This corpse brings its own flowers to the funeral.', NULL, 0, 0, 0, 0, 0, 0, 1, 0, '1|IllthornSeed', 597, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
	(115, 'STRUCTURE', 'Illthorn', NULL, '"Look, Barbra. Wires!" \\n- Ihrbraman, Creature Collector.', 'Wall', 0, 3, 0, 0, 0, 0, 2, 0, '1|Spiky1', 598, 841, '71.25,42,0.25', 242, NULL, NULL, '1|Spiky 1|When Illthorn is damaged in combat, Illthorn deals 1 damage to attacking unit.', NULL, NULL, 1),
	(116, 'SPELL', 'Decimation', 'All units on target row lose 1 Health. Opponent\'s idol on that row loses 2 Health.', 'One by one by one they fall, and now we\'ve reached the Cobalt Hall...', NULL, 2, 0, 0, 0, 0, 3, 0, 0, '1|Decimation', 599, 0, NULL, 0, NULL, 'ROW_FULL_IDOLS', NULL, NULL, NULL, 1),
	(117, 'SPELL', 'God Hand', 'All your units gain +2 Attack until end of turn, and have their Countdown decreased by 2.', 'Howl for the gods!', NULL, 2, 0, 0, 0, 0, 0, 8, 0, '1|GodHand', 600, 0, NULL, 0, NULL, 'UNDEFINED', NULL, NULL, NULL, 1),
	(118, 'STRUCTURE', 'Hellspitter Mortar', 'Attacks a randomly selected tile on opponent\'s board.', 'Aim? With enough power you don\'t need aim.', 'Artillery', 2, 6, 5, 2, 0, 0, 0, 3, '2|AttackHellspitter|AttackForwardRangedDummy', 601, 612, '151.4,169.3,0.25', 206, NULL, 'UNDEFINED', '1|Ranged attack|This unit does not take damage from attacking Spiky units.', 'action_hellfire_mortar', 'impact_hellfire_mortar', 1),
	(119, 'CREATURE', 'Knight Scholar', 'Draw 1 scroll if Countdown is 0. Countdown is reset to Knight Scholar\'s base value.', 'Knowledge is strength. ', 'Human,Knight', 2, 6, 3, 2, 0, 5, 0, 0, '3|AttackForward|Move|DrawScrollAbility', 874, 871, '57.85,111.15,0.25', 273, '2|Move|Move|Move unit to adjacent tile|0|0|0|0|DrawScrollAbility|Draw Scroll|draw a scroll|0|0|0|0', 'FORWARD', NULL, NULL, NULL, 1),
	(120, 'STRUCTURE', 'Obelisk', NULL, 'Good for leaning on. And hiding behind...', 'Wall', 0, 5, 0, 0, 0, 2, 0, 0, NULL, 603, 583, '50.05,56.55,0.25', 141, NULL, NULL, NULL, NULL, NULL, 1),
	(121, 'CREATURE', 'Ducal Infantryman', 'All other creatures you control on the same row as Ducal Infantryman gain +1 Attack.', 'Strength in numbers.', 'Human,Soldier', 0, 3, 1, 2, 0, 2, 0, 0, '3|AttackForward|Move|InfantryIncAp', 604, 584, '68.05,85.6,0.25', 142, '1|Move|Move|Move unit to adjacent tile|0|0|0|0', 'FORWARD', NULL, NULL, NULL, 1),
	(122, 'CREATURE', 'Ducal Skirmisher', NULL, 'Slice and dice!', 'Human,Soldier', 0, 4, 3, 2, 0, 4, 0, 0, '2|AttackForwardContinuous|Move', 605, 585, '89.25,77.25,0.25', 143, '1|Move|Move|Move unit to adjacent tile|0|0|0|0', 'FORWARD', '1|Relentless|If opponent blocking unit is destroyed, this creature will continue its attack.', NULL, NULL, 1),
	(123, 'CREATURE', 'Ducal Spearman', NULL, 'If you bait them, they will come.', 'Human,Soldier', 0, 4, 1, 2, 0, 4, 0, 0, '3|AttackForward|Move|Spiky2', 606, 586, '60.85,117.3,0.25', 144, '1|Move|Move|Move unit to adjacent tile|0|0|0|0', 'FORWARD', '1|Spiky 2|When Ducal Spearman is damaged in combat, Ducal Spearman deals 2 damage to attacking unit.', NULL, NULL, 1),
	(124, 'ENCHANTMENT', 'Resonant Helm', 'Enchanted unit\'s Health is healed by 1 every time you play a spell or enchantment.', 'You\'ll hear the silent whispers of magic and it will change you.', NULL, 0, 0, 0, 0, 0, 1, 0, 0, '1|ResonantHelm', 607, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
	(125, 'CREATURE', 'Crossbowman', NULL, 'Locked, loaded, and lying in wait...', 'Human,Soldier', 0, 2, 4, 3, 0, 1, 0, 0, '2|AttackForwardRanged|Move', 608, 587, '93.75,70.75,0.25', 145, '1|Move|Move|Move unit to adjacent tile|0|0|0|0', 'FORWARD', '1|Ranged attack|This unit does not take damage from attacking Spiky units.', 'action_crossbowman_00', 'impact_crossbow_01', 1),
	(126, 'CREATURE', 'Royal Infantryman', 'All other creatures you control on the same row as Royal Infantryman gain +1 Health.', 'Yes, my Liege. I\'ll protect them, my Liege.', 'Human,Soldier', 1, 2, 1, 2, 0, 1, 0, 0, '3|AttackForward|Move|InfantryIncHp', 609, 588, '68.05,85.6,0.25', 146, '1|Move|Move|Move unit to adjacent tile|0|0|0|0', 'FORWARD', NULL, NULL, NULL, 1),
	(127, 'CREATURE', 'Royal Skirmisher', NULL, 'Double the swords, double the fun!', 'Human,Soldier', 1, 3, 3, 2, 0, 3, 0, 0, '2|AttackForwardContinuous|Move', 610, 589, '84,79.55,0.25', 147, '1|Move|Move|Move unit to adjacent tile|0|0|0|0', 'FORWARD', '1|Relentless|If opponent blocking unit is destroyed, this creature will continue its attack.', NULL, NULL, 1),
	(128, 'CREATURE', 'Royal Spearman', NULL, 'HOOOOOLLLD!', 'Human,Soldier', 1, 3, 2, 2, 0, 3, 0, 0, '3|AttackForward|Move|Spiky2', 611, 590, '60.85,125.3,0.25', 148, '1|Move|Move|Move unit to adjacent tile|0|0|0|0', 'FORWARD', '1|Spiky 2|When Royal Spearman is damaged in combat, Royal Spearman deals 2 damage to attacking unit.', NULL, NULL, 1),
	(129, 'CREATURE', 'Bunny', 'If Bunny\'s Attack is 0, it will summon another Bunny in an adjacent tile instead of attacking. ', 'Cute, crafty, and quick to procreate.', 'Beast,Bunny', 1, 1, 0, 3, 0, 0, 1, 0, '3|HasApAttackForward|SummonCopyAttack|Move', 719, 714, '21.3,-40.45,0.25', 243, '1|Move|Move|Move unit to adjacent tile|0|0|0|0', 'FORWARD', NULL, NULL, NULL, 1),
	(130, 'CREATURE', 'Gravelock Outcast', 'Pay one Growth to heal Gravelock Outcast to full health. ', '"Cast out from gravelock society? Wow, that\'s some feat."\\n- Siani, Dyrran Historian', 'Gravelock', 0, 3, 2, 2, 0, 0, 0, 3, '3|AttackForward|GrowthRegenerateAbility|Move', 733, 732, '74.6,24.75,0.25', 244, '2|GrowthRegenerateAbility|Regenerate|Heal self to full health for one Growth|0|0|0|1|Move|Move|Move unit to adjacent tile|0|0|0|0', 'FORWARD', NULL, NULL, NULL, 1),
	(134, 'SPELL', 'Efficiency', 'Target unit gains +1 Attack until end of turn. If that unit kills another unit this turn, increase Energy by 1.', 'The best discipline conserves energy.', NULL, 1, 0, 0, 0, 0, 1, 0, 0, '1|Efficiency', 763, 0, NULL, 0, NULL, 'TILE', NULL, NULL, NULL, 1),
	(138, 'ENCHANTMENT', 'Blast Strike', 'Every time enchanted creature deals damage to a unit it also deals 1 damage to every unit adjacent to that unit.', '"Needs more brutal."\\n- Arran, Machine Priest', NULL, 1, 0, 0, 0, 0, 0, 0, 2, '1|BlastStrike', 846, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
	(139, 'ENCHANTMENT', 'Rigged', 'Whenever enchanted structure is destroyed in melee combat, its attacker takes 4 damage.', 'Strap it on, then stand back.', NULL, 0, 0, 0, 0, 0, 0, 0, 1, '1|Rigged', 736, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
	(140, 'ENCHANTMENT', 'Overdrive', 'When Overdrive comes into play, and at the beginning of its following turns, enchanted structure\'s Countdown is decreased by 2. At the end of these turns, it is dealt 2 damage.', '\\n"I know it\'ll break. I just\\ndon\'t care."\\n- Arran, Machine Priest', NULL, 1, 0, 0, 0, 0, 0, 0, 2, '1|Overdrive', 737, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
	(141, 'ENCHANTMENT', 'Plating', 'Enchanted unit disregards next damage taken. Plating is removed afterwards.', 'Almost works like real armor.', NULL, 0, 0, 0, 0, 0, 0, 0, 1, '1|Plating', 738, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
	(142, 'SPELL', 'Iron Whip', 'Target unit takes 1 damage. Its Attack is increased by 1 until end of turn and Countdown decreased by 1. ', 'A whip for steel hides.', NULL, 1, 0, 0, 0, 0, 0, 0, 2, '1|IronWhip', 739, 0, NULL, 0, NULL, 'TILE', NULL, NULL, NULL, 1),
	(143, 'SPELL', 'Incendiaries', 'Opponent\'s Structures take 3 damage.', 'It\'s raining cats and bombs.', NULL, 0, 0, 0, 0, 0, 0, 0, 3, '1|Incendiaries', 740, 0, NULL, 0, NULL, 'UNDEFINED', NULL, NULL, NULL, 1),
	(145, 'ENCHANTMENT', 'Redesign', 'Target creature\'s Attack and Health switch values.', '"Trust me, it\'s better this way."\\n-Amhan, Machine Master.', NULL, 1, 0, 0, 0, 0, 0, 0, 2, '1|Redesign', 741, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
	(146, 'SPELL', 'Desperation', 'Target creature gets +2 Attack until end of turn for each opponent unit on the same row. It is then dealt 1 damage.', 'Many a conqueror have been surprised by the ferocity of desperate defenders.', NULL, 0, 0, 0, 0, 0, 0, 0, 2, '1|Desperation', 742, 0, NULL, 0, NULL, 'TILE', NULL, NULL, NULL, 1),
	(147, 'SPELL', 'Blind Rage', 'Target creature deals damage equal to its Countdown to all adjacent units. Its Countdown is then increased by 1.', 'When you\'re seeing red, friends and foes look the same.', NULL, 1, 0, 0, 0, 0, 0, 0, 4, '1|BlindRage', 743, 0, NULL, 0, NULL, 'TILE', NULL, NULL, NULL, 1),
	(148, 'ENCHANTMENT', 'Machination Mindset', 'Enchanted melee creature becomes relentless. Its Attack is increased by 1.', 'No doubt, no fear, no thought.', NULL, 1, 0, 0, 0, 0, 0, 0, 3, '1|Relentless', 745, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
	(149, 'SPELL', 'Concentrate Fire', 'Target unit with Ranged or Lobber will make an extra attack after its next attack.', 'Double the fire, double the fun.', NULL, 1, 0, 0, 0, 0, 0, 0, 4, '1|ConcentrateFire', 747, 0, NULL, 0, NULL, 'TILE', NULL, NULL, NULL, 1),
	(150, 'CREATURE', 'Tool Initiate', 'When Tool Initiate\'s Countdown is 0, you may increase its Countdown by 1 to increase target structure\'s Attack by 1.', '"Let me just tweak this..."\\n-Amhan, Machine Master.', 'Human', 1, 3, 2, 2, 0, 0, 0, 2, '3|AttackForward|Move|ToolInitiate', 848, 849, '76.7,80.45,0.25', 257, '2|Move|Move|Move unit to adjacent tile|0|0|0|0|ToolInitiate|Increase Attack|When unit\'s Countdown is 0, you may increase the Countdown by 1 to increase target structure\'s Attack by 1.|0|0|0|0', 'FORWARD', NULL, NULL, NULL, 1),
	(151, 'SPELL', 'Metal Heart', 'Target creature gains Attack equal to the number of friendly structures until end of turn.', 'More machines, more mayhem.', NULL, 0, 0, 0, 0, 0, 0, 0, 2, '1|MetalHeart', 750, 0, NULL, 0, NULL, 'TILE', NULL, NULL, NULL, 1),
	(152, 'SPELL', 'Bombard', 'All units with Ranged or Lobber attack have their Countdown decreased by 2.', 'FIRE AT WILL!', NULL, 2, 0, 0, 0, 0, 0, 0, 3, '1|Bombard', 751, 0, NULL, 0, NULL, 'UNDEFINED', NULL, NULL, NULL, 1),
	(153, 'STRUCTURE', 'Clock Library', 'When Clock Library\'s Countdown becomes 0, Clock Library is sacrificed and you draw 3 scrolls.', 'Tick. Tick. Tick. Tick...', 'Totem', 0, 5, 0, 4, 0, 0, 0, 4, '1|DrawScrollsAndDestroyOnZeroAc', 752, 753, '41.8,29.8,0.25', 210, NULL, NULL, NULL, NULL, NULL, 1),
	(154, 'CREATURE', 'Wildling', 'When a creature is summoned adjacent to Wildling, Wildling is dealt 1 damage and its Attack is increased by 1.', 'Sometimes you just want to be left alone.', 'Human', 1, 4, 0, 1, 0, 0, 4, 0, '3|AttackForward|Move|Wildling', 754, 756, '48.3,-0.2,0.25', 211, '1|Move|Move|Move unit to adjacent tile|0|0|0|0', 'FORWARD', NULL, NULL, NULL, 1),
	(155, 'STRUCTURE', 'Mangonel', 'When Mangonel comes into play, your Mangonels\' Countdowns are set to the lowest of any you control.', 'Powerful, portable, and packing a punch.', 'Artillery', 1, 2, 3, 3, 0, 3, 0, 0, '2|AttackCatapult|SyncToLowestAcOnEnterBoard', 755, 757, '83.8,72.05,0.25', 212, NULL, 'RADIUS_4', '1|Lobber|This unit attacks at a specific section of the board.', NULL, NULL, 1),
	(156, 'CREATURE', 'Vaettr of the Wild', 'When Vaettr of the Wild comes into play, increase Growth by 1. When Vaettr of the Wild leaves play, decrease Growth by 1.', 'The forest personified. Cute.', 'Vaettr', 1, 1, 1, 2, 0, 0, 1, 0, '4|AttackForward|Move|IncOutputGrowth|DecOutputGrowthOnRemove', 758, 759, '66.9,80.5,0.25', 213, '1|Move|Move|Move unit to adjacent tile|0|0|0|0', 'FORWARD', NULL, NULL, NULL, 1),
	(157, 'SPELL', 'Imperial Resources', 'Draw 2 scrolls. Your idols are healed by 1. All your units are healed by 1. Increase Order by 1.', 'From the furthest reaches of the Empire, they hauled their gear. Now, the time has come to use it.', NULL, 2, 0, 0, 0, 0, 7, 0, 0, '1|ImperialResources', 760, 0, NULL, 0, NULL, 'UNDEFINED', NULL, NULL, NULL, 1),
	(158, 'ENCHANTMENT', 'Divine Mark', 'When enchanted creature is destroyed, it is returned to owners hand. If it was killed by damage from another unit, that unit is returned to its owner\'s hand.', '"Let\'s try that again."\\n- Lord Ungstram, Royal Strategist.', NULL, 1, 0, 0, 0, 0, 2, 0, 0, '1|DivineMark', 761, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
	(160, 'STRUCTURE', 'Charge Coil', 'When Charge Coil attacks, a random opponent unit is dealt 1 damage.', '"This is extremely annoying."\\n- Arhart, Mire Master', 'Totem', 0, 3, 0, 1, 0, 0, 0, 3, '1|ChargeCoilAttack', 802, 803, '49.3,9.55,0.25', 214, NULL, NULL, NULL, NULL, NULL, 1),
	(189, 'CREATURE', 'Beast Rat', NULL, '"Oh look how big they are compared to those in the city!"\\n- Ihrbraman, Creature Collector.', 'Beast,Rat', 0, 2, 1, 2, 0, 0, 1, 0, '2|AttackForward|Move', 810, 843, '67.05,-44.95,0.25', 250, '1|Move|Move|Move unit to adjacent tile|0|0|0|0', 'FORWARD', NULL, NULL, NULL, 1),
	(193, 'ENCHANTMENT', 'Roasted Bean Potion', 'Enchanted creature\'s Move is increased by 1.', NULL, NULL, 2, 0, 0, 0, 0, 2, 0, 0, '1|RoastedBeanPotion', 815, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
	(203, 'CREATURE', 'Noaidi', 'When Noaidi comes into play, you gain 1 resource of each non-Growth type your opponent has.', 'For the Kinfolk, the moose migration marks the beginning of the new year.', 'Human,Kinfolk', 1, 2, 2, 2, 0, 0, 3, 0, '3|AttackForward|Move|NoaidiResources', 851, 853, '79.95,86.45,0.25', 260, '1|Move|Move|Move unit to adjacent tile|0|0|0|0', 'FORWARD', NULL, NULL, NULL, 1),
	(204, 'CREATURE', 'Solemn Giant', 'Does not count down. Pay 2 Energy to decrease Countdown by 2. This ability can be used multiple times per turn.', '"The Giants are no more, so we made new ones."\\n-Amhan, Machine Master.', 'Automaton', 2, 4, 8, 6, 0, 0, 0, 4, '4|AttackForward|Move|NoCountdown|EnergyCountdownAbility', 852, 861, '77.3,69.8,0.25', 298, '2|Move|Move|Move unit to adjacent tile|0|0|0|0|EnergyCountdownAbility|Pay 2 Energy|Pay 2 Energy to decrease Countdown by 2.|0|0|2|0', 'FORWARD', NULL, NULL, NULL, 1),
	(205, 'CREATURE', 'Dust Runner', 'When Dust Runner deals damage to a creature with 3 or less Health, that creature is destroyed.', '"Kinfolk make for great\\ntarget practice."\\n- Sarh, Dust Runner', 'Human,Tribesman', 0, 2, 1, 2, 0, 0, 0, 1, '3|AttackForwardRanged|Move|SlayLowHP', 857, 858, '56.05,81.05,0.25', 267, '1|Move|Move|Move unit to adjacent tile|0|0|0|0', 'FORWARD', '1|Ranged attack|This unit does not take damage from attacking Spiky units.', NULL, NULL, 1),
	(206, 'CREATURE', 'Wings Shield', 'Wings Shield has Armor X, where X is the number of units behind it (combat damage dealt to Wings Shield is decreased by X).', '"I shield those I love. From them I draw strength."', 'Human,Soldier', 0, 3, 2, 2, 0, 3, 0, 0, '3|AttackForward|Move|WingsArmorModifier', 864, 862, '77.8,98.75,0.25', 268, '1|Move|Move|Move unit to adjacent tile|0|0|0|0', 'FORWARD', NULL, NULL, NULL, 1),
	(207, 'STRUCTURE', 'Automata Forge', 'Instead of attacking, Automata Forge summons a Gun Automaton on an adjacent tile. Pay 3 Energy to decrease Countdown by 1. This ability can be used multiple times per turn.', NULL, 'Forge', 2, 5, 0, 3, 0, 0, 0, 3, '2|AttackSummonGunAutomaton|EnergyCountdownAbility1for3', 859, 863, '73,66.3,0.25', 269, '1|EnergyCountdownAbility1for3|Pay 3 Energy|Pay 3 Energy to decrease Countdown by 1.|0|0|3|0', NULL, NULL, NULL, NULL, 1),
	(208, 'ENCHANTMENT', 'Stag Heart', 'Enchanted unit gets +1 Attack and +1 Health for each Stag Heart you control.', 'The Kinfolk judge every beast on their own merits.', NULL, 0, 0, 0, 0, 0, 0, 2, 0, '1|StagHeart', 860, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
	(209, 'ENCHANTMENT', 'Faith Duty', 'Enchant unit you control. At the beginning of each of its turns, enchanted unit is dealt 1 damage and opponent units on that row get their Countdown increased by 1.', 'Willingly, but not wisely.', NULL, 0, 0, 0, 0, 0, 2, 0, 0, '1|FaithDuty', 866, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
	(210, 'STRUCTURE', 'Metal Wonder', 'When your opponent plays a Spell or Enchantment, Metal Wonder deals 2 damage to a random idol under their control.', 'Machine victory, no fiddly bits.', 'Totem', 2, 4, 0, 0, 0, 0, 0, 4, '1|MetalWonder', 870, 872, '59.85,60.55,0.25', 295, NULL, NULL, NULL, NULL, NULL, 1),
	(211, 'CREATURE', 'Crone', 'Crone does not attack.  When Crone is destroyed in melee combat, the attacking unit is destroyed.', '"Grandma in the front. The hag\'s time is up."\\n- Halm, Berserker.', 'Human,Kinfolk', 1, 2, 0, 3, 0, 0, 3, 0, '2|Move|DestroyAttackerOnDeath', 867, 869, '99.55,21.55,0.25', 272, '1|Move|Move|Move unit to adjacent tile|0|0|0|0', NULL, NULL, NULL, NULL, 1),
	(215, 'SPELL', 'Rat King', 'Summons a Beast Rat on target tile and on two adjacent random tiles.', 'Obey the Jarl, but fear the King.', NULL, 2, 0, 0, 0, 0, 0, 4, 0, '1|RatKing', 878, 0, NULL, 0, NULL, 'UNDEFINED', NULL, NULL, NULL, 1),
	(218, 'CREATURE', 'Sister of the Bear', NULL, '"Honored Sisters. Your strength will be my hammer against the hated Empire!"\\n- Jarl Urhald.', 'Human,Kinfolk', 0, 4, 4, 2, 0, 0, 4, 0, '2|AttackForward|Move', 881, 886, '74.3,125.55,0.25', 278, '1|Move|Move|Move unit to adjacent tile|0|0|0|0', 'FORWARD', NULL, NULL, NULL, 1),
	(223, 'CREATURE', 'Storm Runner', NULL, 'Storm Runners have perfected the art of... throwing.', 'Human,Tribesman', 1, 3, 2, 2, 0, 0, 0, 3, '2|AttackCatapult|Move', 893, 895, '65.6,111.55,0.25', 282, '1|Move|Move|Move unit to adjacent tile|0|0|0|0', 'RADIUS_4', '1|Lobber|This unit attacks at a specific section of the board.', NULL, NULL, 1),
	(230, 'SPELL', 'Redeploy', 'Swap two target rows on your side.', '"Wings to the east, vanguard south. Go!"', NULL, 2, 0, 0, 0, 0, 3, 0, 0, '1|SwapRows', 903, 0, NULL, 0, NULL, 'ROW_SIDE', NULL, NULL, NULL, 1),
	(237, 'CREATURE', 'Wings Soldier', NULL, 'The elites of the Empire strike with precision.', 'Human,Soldier', 0, 2, 3, 2, 0, 2, 0, 0, '2|AttackForward|Move', 917, 918, '127.1,107.7,0.25', 297, '1|Move|Move|Move unit to adjacent tile|0|0|0|0', 'FORWARD', NULL, NULL, NULL, 1);
/*!40000 ALTER TABLE `card_types` ENABLE KEYS */;


-- Dumping structure for table relentlessdb.deck_types
CREATE TABLE IF NOT EXISTS `deck_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text,
  `card` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=ascii;

-- Dumping data for table relentlessdb.deck_types: ~150 rows (approximately)
/*!40000 ALTER TABLE `deck_types` DISABLE KEYS */;
REPLACE INTO `deck_types` (`id`, `name`, `card`) VALUES
	(1, 'GROWTH', 91),
	(2, 'GROWTH', 91),
	(3, 'GROWTH', 89),
	(4, 'GROWTH', 38),
	(5, 'GROWTH', 89),
	(6, 'GROWTH', 75),
	(7, 'GROWTH', 156),
	(8, 'GROWTH', 156),
	(9, 'GROWTH', 75),
	(10, 'GROWTH', 40),
	(11, 'GROWTH', 53),
	(12, 'GROWTH', 40),
	(13, 'GROWTH', 53),
	(14, 'GROWTH', 18),
	(15, 'GROWTH', 18),
	(16, 'GROWTH', 17),
	(17, 'GROWTH', 65),
	(18, 'GROWTH', 40),
	(19, 'GROWTH', 41),
	(20, 'GROWTH', 42),
	(21, 'GROWTH', 94),
	(22, 'GROWTH', 22),
	(23, 'GROWTH', 22),
	(24, 'GROWTH', 78),
	(25, 'GROWTH', 21),
	(26, 'GROWTH', 21),
	(27, 'GROWTH', 63),
	(28, 'GROWTH', 63),
	(29, 'GROWTH', 84),
	(30, 'GROWTH', 115),
	(31, 'GROWTH', 84),
	(32, 'GROWTH', 26),
	(33, 'GROWTH', 26),
	(34, 'GROWTH', 45),
	(35, 'GROWTH', 44),
	(36, 'GROWTH', 44),
	(37, 'GROWTH', 115),
	(38, 'GROWTH', 88),
	(39, 'GROWTH', 88),
	(40, 'GROWTH', 49),
	(41, 'GROWTH', 16),
	(42, 'GROWTH', 114),
	(43, 'GROWTH', 16),
	(44, 'GROWTH', 17),
	(45, 'GROWTH', 49),
	(46, 'GROWTH', 56),
	(47, 'GROWTH', 13),
	(48, 'GROWTH', 13),
	(49, 'GROWTH', 100),
	(50, 'GROWTH', 100),
	(51, 'ENERGY', 87),
	(52, 'ENERGY', 87),
	(53, 'ENERGY', 130),
	(54, 'ENERGY', 32),
	(55, 'ENERGY', 83),
	(56, 'ENERGY', 1),
	(57, 'ENERGY', 2),
	(58, 'ENERGY', 2),
	(59, 'ENERGY', 24),
	(60, 'ENERGY', 24),
	(61, 'ENERGY', 24),
	(62, 'ENERGY', 67),
	(63, 'ENERGY', 67),
	(64, 'ENERGY', 151),
	(65, 'ENERGY', 151),
	(66, 'ENERGY', 35),
	(67, 'ENERGY', 107),
	(68, 'ENERGY', 35),
	(69, 'ENERGY', 107),
	(70, 'ENERGY', 152),
	(71, 'ENERGY', 152),
	(72, 'ENERGY', 68),
	(73, 'ENERGY', 68),
	(74, 'ENERGY', 82),
	(75, 'ENERGY', 80),
	(76, 'ENERGY', 149),
	(77, 'ENERGY', 80),
	(78, 'ENERGY', 66),
	(79, 'ENERGY', 96),
	(80, 'ENERGY', 66),
	(81, 'ENERGY', 96),
	(82, 'ENERGY', 149),
	(83, 'ENERGY', 118),
	(84, 'ENERGY', 150),
	(85, 'ENERGY', 27),
	(86, 'ENERGY', 98),
	(87, 'ENERGY', 27),
	(88, 'ENERGY', 98),
	(89, 'ENERGY', 98),
	(90, 'ENERGY', 143),
	(91, 'ENERGY', 96),
	(92, 'ENERGY', 141),
	(93, 'ENERGY', 83),
	(94, 'ENERGY', 39),
	(95, 'ENERGY', 77),
	(96, 'ENERGY', 77),
	(97, 'ENERGY', 141),
	(98, 'ENERGY', 141),
	(99, 'ENERGY', 139),
	(100, 'ENERGY', 139),
	(101, 'ORDER', 54),
	(102, 'ORDER', 20),
	(103, 'ORDER', 20),
	(104, 'ORDER', 95),
	(105, 'ORDER', 95),
	(106, 'ORDER', 122),
	(107, 'ORDER', 121),
	(108, 'ORDER', 86),
	(109, 'ORDER', 50),
	(110, 'ORDER', 86),
	(111, 'ORDER', 50),
	(112, 'ORDER', 105),
	(113, 'ORDER', 52),
	(114, 'ORDER', 52),
	(115, 'ORDER', 120),
	(116, 'ORDER', 120),
	(117, 'ORDER', 124),
	(118, 'ORDER', 125),
	(119, 'ORDER', 99),
	(120, 'ORDER', 124),
	(121, 'ORDER', 125),
	(122, 'ORDER', 23),
	(123, 'ORDER', 23),
	(124, 'ORDER', 36),
	(125, 'ORDER', 48),
	(126, 'ORDER', 37),
	(127, 'ORDER', 73),
	(128, 'ORDER', 73),
	(129, 'ORDER', 74),
	(130, 'ORDER', 71),
	(131, 'ORDER', 71),
	(132, 'ORDER', 64),
	(133, 'ORDER', 50),
	(134, 'ORDER', 122),
	(135, 'ORDER', 123),
	(136, 'ORDER', 123),
	(137, 'ORDER', 123),
	(138, 'ORDER', 124),
	(139, 'ORDER', 101),
	(140, 'ORDER', 15),
	(141, 'ORDER', 128),
	(142, 'ORDER', 128),
	(143, 'ORDER', 99),
	(144, 'ORDER', 127),
	(145, 'ORDER', 61),
	(146, 'ORDER', 126),
	(147, 'ORDER', 126),
	(148, 'ORDER', 97),
	(149, 'ORDER', 127),
	(150, 'ORDER', 97);
/*!40000 ALTER TABLE `deck_types` ENABLE KEYS */;


-- Dumping structure for table relentlessdb.server_stats
CREATE TABLE IF NOT EXISTS `server_stats` (
  `loginsLast24h` int(10) unsigned NOT NULL DEFAULT '0',
  `totalGoldRewarded` int(10) unsigned NOT NULL DEFAULT '0',
  `totalSoldCards` int(10) unsigned NOT NULL DEFAULT '0',
  `currentGameId` int(10) unsigned NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

-- Dumping data for table relentlessdb.server_stats: ~0 rows (approximately)
/*!40000 ALTER TABLE `server_stats` DISABLE KEYS */;
REPLACE INTO `server_stats` (`loginsLast24h`, `totalGoldRewarded`, `totalSoldCards`, `currentGameId`) VALUES
	(0, 0, 1, 1);
/*!40000 ALTER TABLE `server_stats` ENABLE KEYS */;


-- Dumping structure for table relentlessdb.store_items
CREATE TABLE IF NOT EXISTS `store_items` (
  `itemId` int(10) unsigned NOT NULL DEFAULT '0',
  `itemType` tinytext NOT NULL,
  `itemName` tinytext NOT NULL,
  `description` tinytext NOT NULL,
  `costGold` smallint(5) unsigned NOT NULL DEFAULT '0',
  `costShards` smallint(5) NOT NULL DEFAULT '0',
  `isPublic` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`itemId`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

-- Dumping data for table relentlessdb.store_items: ~5 rows (approximately)
/*!40000 ALTER TABLE `store_items` DISABLE KEYS */;
REPLACE INTO `store_items` (`itemId`, `itemType`, `itemName`, `description`, `costGold`, `costShards`, `isPublic`) VALUES
	(137, 'CARD_FACE_DOWN', 'Random Scroll', 'A random scroll from a random faction. A cheap and easy way to boost your collection.', 100, -1, 1),
	(180, 'CARD_PACK', 'Scroll Pack', '10 scrolls picked randomly from all factions.  You\'re guaranteed to get two uncommon and one rare in this pack. Lucky you!', 1000, -1, 1),
	(182, 'CARD_ORDER', 'Order Scroll', 'One scroll picked randomly from the Order faction. Good luck!', 175, -1, 1),
	(183, 'CARD_GROWTH', 'Growth Scroll', 'One scroll picked randomly from the Growth faction. Good luck!', 175, -1, 1),
	(184, 'CARD_ENERGY', 'Energy Scroll', 'One scroll picked randomly from the Energy faction. Good luck!', 175, -1, 1);
/*!40000 ALTER TABLE `store_items` ENABLE KEYS */;


-- Dumping structure for table relentlessdb.tower_info
CREATE TABLE IF NOT EXISTS `tower_info` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` tinytext NOT NULL,
  `goldReward` int(10) unsigned NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `difficulty` tinytext NOT NULL,
  `flavour` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=ascii;

-- Dumping data for table relentlessdb.tower_info: ~0 rows (approximately)
/*!40000 ALTER TABLE `tower_info` DISABLE KEYS */;
REPLACE INTO `tower_info` (`id`, `name`, `goldReward`, `description`, `difficulty`, `flavour`) VALUES
	(1, 'An insult', 250, '- Destroy three of your opponent\'s idols to win\\n- Your opponent\'s idols start with just five health\\n- You begin the battle with two pre-deployed Eternal Statues', 'Easy', 'A cocky spirit tosses jibes as you wander past his shack. At first you ignore the taunts - he\'s too weak to be of any concern to you - but they increase in volume and become more offensive, escalating into unconfirmed claims about close family members. Honour dictates you teach this guy a lesson...');
/*!40000 ALTER TABLE `tower_info` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
