DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230724142016');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230724142016');
-- Add your query below.

-- Dumping structure for table mangos.spell_group
DROP TABLE IF EXISTS `spell_group`;
CREATE TABLE IF NOT EXISTS `spell_group` (
  `group_id` int(11) unsigned NOT NULL DEFAULT '0',
  `group_spell_id` int(11) unsigned NOT NULL DEFAULT '0',
  `spell_id` int(11) NOT NULL DEFAULT '0',
  `build_min` smallint(4) unsigned NOT NULL DEFAULT '0' COMMENT 'Minimum game client build to load this entry',
  `build_max` smallint(4) unsigned NOT NULL DEFAULT '5875' COMMENT 'Maximum game client build to load this entry',
  PRIMARY KEY (`group_id`,`group_spell_id`,`spell_id`),
  UNIQUE KEY `group_id` (`group_id`,`group_spell_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Spell System';

-- Dumping structure for table mangos.spell_group_stack_rules
DROP TABLE IF EXISTS `spell_group_stack_rules`;
CREATE TABLE IF NOT EXISTS `spell_group_stack_rules` (
  `group_id` int(11) unsigned NOT NULL DEFAULT '0',
  `build` smallint(4) unsigned NOT NULL DEFAULT '0' COMMENT 'Game client build in which this exact stacking rule was added',
  `stack_rule` tinyint(3) NOT NULL DEFAULT '1',
  PRIMARY KEY (`group_id`,`build`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


-- well fed
INSERT INTO `spell_group` (`group_id`, `group_spell_id`, `spell_id`, `build_min`, `build_max`) VALUES
(1001, 0, 18125, 5086, 5875),
(1001, 1, 18141, 5086, 5875),
(1001, 2, 19705, 5086, 5875),
(1001, 3, 19706, 5086, 5875),
(1001, 4, 19708, 5086, 5875),
(1001, 5, 19709, 5086, 5875),
(1001, 6, 19710, 5086, 5875),
(1001, 7, 19711, 5086, 5875),
(1001, 8, 23697, 5086, 5875),
(1001, 9, 24799, 5086, 5875),
(1001, 10, 24870, 5086, 5875),
(1001, 11, 25694, 5086, 5875),
(1001, 12, 25941, 5086, 5875),
(1001, 13, 18191, 5086, 5875),
(1001, 14, 18194, 5086, 5875),
(1001, 15, 22730, 5086, 5875),
(1001, 16, 18222, 5086, 5875),
(1001, 17, 18192, 5086, 5875),
(1001, 18, 25661, 5086, 5875);
INSERT INTO `spell_group_stack_rules` (`group_id`, `build`, `stack_rule`) VALUES (1001, 5086, 1);

-- Zanzas
INSERT INTO `spell_group` (`group_id`, `group_spell_id`, `spell_id`, `build_min`, `build_max`) VALUES
(1002, 0, 24417, 4695, 5875),
(1002, 1, 24383, 4695, 5875),
(1002, 2, 24382, 4695, 5875);
INSERT INTO `spell_group_stack_rules` (`group_id`, `build`, `stack_rule`) VALUES (1002, 4695, 1);
	
-- Blasted lands
INSERT INTO `spell_group` (`group_id`, `group_spell_id`, `spell_id`, `build_min`, `build_max`) VALUES
(1003, 0, 10693, 0, 5875),
(1003, 1, 10668, 0, 5875),
(1003, 2, 10669, 0, 5875),
(1003, 3, 10667, 0, 5875),
(1003, 4, 10692, 0, 5875),
(1003, 5, 10670, 0, 5875),
(1003, 6, 10671, 0, 5875),
(1003, 7, 10672, 0, 5875),
(1003, 8, 10690, 0, 5875),
(1003, 9, 10691, 0, 5875);
INSERT INTO `spell_group_stack_rules` (`group_id`, `build`, `stack_rule`) VALUES (1003, 0, 1);
	
-- Alcohol
INSERT INTO `spell_group` (`group_id`, `group_spell_id`, `spell_id`, `build_min`, `build_max`) VALUES
(1004, 0, 25804, 5086, 5875),
(1004, 1, 20875, 0, 5875),
(1004, 2, 25722, 5086, 5875),
(1004, 3, 25037, 5086, 5875),
(1004, 4, 22789, 0, 5875),
(1004, 5, 22790, 0, 5875),
(1004, 6, 6114, 0, 5875),
(1004, 7, 5020, 0, 5875),
(1004, 8, 5021, 0, 5875);
INSERT INTO `spell_group_stack_rules` (`group_id`, `build`, `stack_rule`) VALUES (1004, 0, 1);

-- Stamina scrolls + fortitude. exclusives: 17537
INSERT INTO `spell_group` (`group_id`, `group_spell_id`, `spell_id`, `build_min`, `build_max`) VALUES
(1005, 0, 1243, 0, 5875),
(1005, 1, 8099, 0, 5875),
(1005, 2, 8100, 0, 5875),
(1005, 3, 1244, 0, 5875),
(1005, 4, 8101, 0, 5875),
(1005, 5, 12178, 0, 5875),
(1005, 6, 1245, 0, 5875),
(1005, 7, 2791, 0, 5875),
(1005, 8, 10937, 0, 5875),
(1005, 9, 10938, 0, 5875),
(1005, 10, 21562, 0, 5875),
(1005, 11, 21564, 0, 5875);
INSERT INTO `spell_group_stack_rules` (`group_id`, `build`, `stack_rule`) VALUES (1005, 0, 3);

-- Intellect scrolls + arcane intellect + juju guile + elixir of greater intellect. exclusives: 17535
INSERT INTO `spell_group` (`group_id`, `group_spell_id`, `spell_id`, `build_min`, `build_max`) VALUES	
(1006, 0, 1459, 0, 5875),
(1006, 1, 8096, 0, 5875),
(1006, 2, 1460, 0, 5875),
(1006, 3, 8097, 0, 5875),
(1006, 4, 8098, 0, 5875),
(1006, 5, 1461, 0, 5875),
(1006, 6, 12176, 0, 5875),
(1006, 7, 10156, 0, 5875),
(1006, 8, 11396, 0, 5875),
(1006, 9, 16327, 0, 5875),
(1006, 10, 16876, 0, 5875),
(1006, 11, 10157, 0, 5875),
(1006, 12, 23028, 0, 5875);
INSERT INTO `spell_group_stack_rules` (`group_id`, `build`, `stack_rule`) VALUES (1006, 0, 3);

-- Spirit scrolls + divine spirit + crystal force. exclusives: 17535
INSERT INTO `spell_group` (`group_id`, `group_spell_id`, `spell_id`, `build_min`, `build_max`) VALUES
(1007, 1, 8113, 0, 5875),
(1007, 2, 8114, 0, 5875),
(1007, 3, 12177, 0, 5875),
(1007, 4, 14752, 0, 5875),
(1007, 5, 14818, 0, 5875),
(1007, 6, 15231, 0, 5875),
(1007, 7, 14819, 0, 5875),
(1007, 8, 27841, 5302, 5875),
(1007, 9, 27681, 5302, 5875);
INSERT INTO `spell_group_stack_rules` (`group_id`, `build`, `stack_rule`) VALUES (1007, 0, 3);

-- Strength scrolls + elixirs + juju power. exclusives: 8212 17537
INSERT INTO `spell_group` (`group_id`, `group_spell_id`, `spell_id`, `build_min`, `build_max`) VALUES
(1008, 0, 2367, 0, 5875),
(1008, 1, 8118, 0, 5875),
(1008, 2, 3164, 0, 5875),
(1008, 3, 8119, 0, 5875),
(1008, 4, 8120, 0, 5875),
(1008, 5, 12179, 0, 5875),
(1008, 6, 11405, 0, 5875),
(1008, 7, 16323, 0, 5875);
INSERT INTO `spell_group_stack_rules` (`group_id`, `build`, `stack_rule`) VALUES (1008, 0, 3);
	
-- Agility scrolls + elixirs. exclusives: 17538
INSERT INTO `spell_group` (`group_id`, `group_spell_id`, `spell_id`, `build_min`, `build_max`) VALUES
(1009, 0, 2374, 0, 5875),
(1009, 1, 8115, 0, 5875),
(1009, 2, 3160, 0, 5875),
(1009, 3, 8116, 0, 5875),
(1009, 4, 8117, 0, 5875),
(1009, 5, 11328, 0, 5875),
(1009, 6, 12174, 0, 5875),
(1009, 7, 11334, 0, 5875);
INSERT INTO `spell_group_stack_rules` (`group_id`, `build`, `stack_rule`) VALUES (1009, 0, 3);

-- Armor scrolls + elixirs.
INSERT INTO `spell_group` (`group_id`, `group_spell_id`, `spell_id`, `build_min`, `build_max`) VALUES
(1010, 0, 673, 0, 5875),
(1010, 1, 8091, 0, 5875),
(1010, 2, 8094, 0, 5875),
(1010, 3, 3220, 0, 5875),
(1010, 4, 8095, 0, 5875),
(1010, 5, 12175, 0, 5875),
(1010, 6, 11349, 0, 5875),
(1010, 7, 11348, 0, 5875);
INSERT INTO `spell_group_stack_rules` (`group_id`, `build`, `stack_rule`) VALUES (1010, 0, 3);

-- Spell damage elixirs + mind control buffs
INSERT INTO `spell_group` (`group_id`, `group_spell_id`, `spell_id`, `build_min`, `build_max`) VALUES
(1011, 0, 11390, 0, 5875),
(1011, 1, 15288, 0, 5875),
(1011, 2, 17539, 0, 5875),
(1011, 3, 17150, 0, 5875);
INSERT INTO `spell_group_stack_rules` (`group_id`, `build`, `stack_rule`) VALUES (1011, 0, 3);

-- Fire damage elixirs
INSERT INTO `spell_group` (`group_id`, `group_spell_id`, `spell_id`, `build_min`, `build_max`) VALUES
(1012, 0, 7844, 0, 5875),
(1012, 1, 26276, 5302, 5875);
INSERT INTO `spell_group_stack_rules` (`group_id`, `build`, `stack_rule`) VALUES (1012, 0, 3);

-- Shadow damage elixirs + mind control buffs
INSERT INTO `spell_group` (`group_id`, `group_spell_id`, `spell_id`, `build_min`, `build_max`) VALUES
(1013, 0, 16587, 0, 5875),
(1013, 1, 11474, 0, 5875);
INSERT INTO `spell_group_stack_rules` (`group_id`, `build`, `stack_rule`) VALUES (1013, 0, 3);

-- Detect Invisibility
INSERT INTO `spell_group` (`group_id`, `group_spell_id`, `spell_id`, `build_min`, `build_max`) VALUES
(1014, 0, 132, 0, 5875),
(1014, 1, 2970, 0, 5875),
(1014, 2, 11743, 0, 5875);
INSERT INTO `spell_group_stack_rules` (`group_id`, `build`, `stack_rule`) VALUES (1014, 0, 3);

-- Blessing of might
INSERT INTO `spell_group` (`group_id`, `group_spell_id`, `spell_id`, `build_min`, `build_max`) VALUES
(1015, 0, 19740, 0, 5875),
(1015, 1, 19834, 0, 5875),
(1015, 2, 19835, 0, 5875),
(1015, 3, 19836, 0, 5875),
(1015, 4, 19837, 0, 5875),
(1015, 5, 19838, 0, 5875),
(1015, 6, 25291, 5086, 5875),
(1015, 7, 25782, 5086, 5875),
(1015, 8, 25916, 5086, 5875);
INSERT INTO `spell_group_stack_rules` (`group_id`, `build`, `stack_rule`) VALUES (1015, 0, 1);

-- Blessing of wisdom
INSERT INTO `spell_group` (`group_id`, `group_spell_id`, `spell_id`, `build_min`, `build_max`) VALUES
(1016, 0, 19742, 0, 5875),
(1016, 1, 19850, 0, 5875),
(1016, 2, 19852, 0, 5875),
(1016, 3, 19853, 0, 5875),
(1016, 4, 19854, 0, 5875),
(1016, 5, 25290, 5086, 5875),
(1016, 6, 25894, 5086, 5875),
(1016, 7, 25918, 5086, 5875);
INSERT INTO `spell_group_stack_rules` (`group_id`, `build`, `stack_rule`) VALUES (1016, 0, 1);

-- Blessing of light
INSERT INTO `spell_group` (`group_id`, `group_spell_id`, `spell_id`, `build_min`, `build_max`) VALUES
(1017, 0, 19977, 0, 5875),
(1017, 1, 19978, 0, 5875),
(1017, 2, 19979, 0, 5875),
(1017, 3, 25890, 5086, 5875);
INSERT INTO `spell_group_stack_rules` (`group_id`, `build`, `stack_rule`) VALUES (1017, 0, 1);

-- Blessing of sanctuary
INSERT INTO `spell_group` (`group_id`, `group_spell_id`, `spell_id`, `build_min`, `build_max`) VALUES
(1018, 0, 20911, 0, 5875),
(1018, 1, 20912, 0, 5875),
(1018, 2, 20913, 0, 5875),
(1018, 3, 20914, 0, 5875),
(1018, 4, 25899, 5086, 5875);
INSERT INTO `spell_group_stack_rules` (`group_id`, `build`, `stack_rule`) VALUES (1018, 0, 1);

-- Blessing of kings
INSERT INTO `spell_group` (`group_id`, `group_spell_id`, `spell_id`, `build_min`, `build_max`) VALUES
(1019, 0, 20217, 0, 5875),
(1019, 1, 25898, 5086, 5875);
INSERT INTO `spell_group_stack_rules` (`group_id`, `build`, `stack_rule`) VALUES (1019, 0, 1);

-- Blessing of salvation
INSERT INTO `spell_group` (`group_id`, `group_spell_id`, `spell_id`, `build_min`, `build_max`) VALUES
(1020, 0, 1038, 0, 5875),
(1020, 1, 25895, 5086, 5875);
INSERT INTO `spell_group_stack_rules` (`group_id`, `build`, `stack_rule`) VALUES (1020, 0, 1);

-- Arcane power + power infusion
INSERT INTO `spell_group` (`group_id`, `group_spell_id`, `spell_id`, `build_min`, `build_max`) VALUES
(1021, 0, 10060, 5302, 5875),
(1021, 1, 12042, 5302, 5875);
INSERT INTO `spell_group_stack_rules` (`group_id`, `build`, `stack_rule`) VALUES (1021, 5302, 3);

-- Attack power winterfall firewater + juju might
INSERT INTO `spell_group` (`group_id`, `group_spell_id`, `spell_id`, `build_min`, `build_max`) VALUES
(1022, 0, 16329, 0, 5875),
(1022, 1, 17038, 0, 5875);
INSERT INTO `spell_group_stack_rules` (`group_id`, `build`, `stack_rule`) VALUES (1022, 0, 1);

-- Stealth + shadowmeld
INSERT INTO `spell_group` (`group_id`, `group_spell_id`, `spell_id`, `build_min`, `build_max`) VALUES
(1023, 0, 20580, 0, 5875),
(1023, 1, 1784, 0, 5875),
(1023, 2, 1785, 0, 5875),
(1023, 3, 1786, 0, 5875),
(1023, 4, 1787, 0, 5875);
INSERT INTO `spell_group_stack_rules` (`group_id`, `build`, `stack_rule`) VALUES (1023, 0, 3);

-- Inspiration + Ancestral Fortitude
INSERT INTO `spell_group` (`group_id`, `group_spell_id`, `spell_id`, `build_min`, `build_max`) VALUES
(1024, 0, 16177, 0, 5875),
(1024, 1, 16236, 0, 5875),
(1024, 2, 16237, 0, 5875),
(1024, 3, 14893, 0, 5875),
(1024, 4, 15357, 0, 5875),
(1024, 5, 15359, 0, 5875);
INSERT INTO `spell_group_stack_rules` (`group_id`, `build`, `stack_rule`) VALUES (1024, 0, 1);

-- Protection potions
INSERT INTO `spell_group` (`group_id`, `group_spell_id`, `spell_id`, `build_min`, `build_max`) VALUES
(1025, 0, 7233, 0, 5875),
(1025, 1, 17543, 0, 5875),
(1026, 0, 7239, 0, 5875),
(1026, 1, 17544, 0, 5875),
(1027, 0, 7254, 0, 5875),
(1027, 1, 17546, 0, 5875),
(1028, 0, 7242, 0, 5875),
(1028, 1, 17548, 0, 5875);
INSERT INTO `spell_group_stack_rules` (`group_id`, `build`, `stack_rule`) VALUES (1025, 0, 1);
INSERT INTO `spell_group_stack_rules` (`group_id`, `build`, `stack_rule`) VALUES (1026, 0, 1);
INSERT INTO `spell_group_stack_rules` (`group_id`, `build`, `stack_rule`) VALUES (1027, 0, 1);
INSERT INTO `spell_group_stack_rules` (`group_id`, `build`, `stack_rule`) VALUES (1028, 0, 1);

-- Love is in the air perfume
INSERT INTO `spell_group` (`group_id`, `group_spell_id`, `spell_id`, `build_min`, `build_max`) VALUES
(1030, 0, 26681, 5086, 5875),
(1030, 1, 26682, 5086, 5875);
INSERT INTO `spell_group_stack_rules` (`group_id`, `build`, `stack_rule`) VALUES (1050, 0, 1);

-- Debuff groups:
-- Demoralizing shout + Demoralizing roar
INSERT INTO `spell_group` (`group_id`, `group_spell_id`, `spell_id`, `build_min`, `build_max`) VALUES
(1040, 0, 99, 0, 5875),
(1040, 1, 1160, 0, 5875),
(1040, 2, 1735, 0, 5875),
(1040, 3, 6190, 0, 5875),
(1040, 4, 9490, 0, 5875),
(1040, 5, 11554, 0, 5875),
(1040, 6, 9747, 0, 5875),
(1040, 7, 11555, 0, 5875),
(1040, 8, 9898, 0, 5875),
(1040, 9, 11556, 0, 5875);
INSERT INTO `spell_group_stack_rules` (`group_id`, `build`, `stack_rule`) VALUES (1040, 0, 3);

-- Sunder armor + expose armor
INSERT INTO `spell_group` (`group_id`, `group_spell_id`, `spell_id`, `build_min`, `build_max`) VALUES
(1041, 0, 15235, 0, 5875),
(1041, 1, 7386, 0, 5875),
(1041, 2, 8647, 0, 5875),
(1041, 3, 7405, 0, 5875),
(1041, 4, 8649, 0, 5875),
(1041, 5, 8380, 0, 5875),
(1041, 6, 8650, 0, 5875),
(1041, 7, 11596, 0, 5875),
(1041, 8, 11197, 0, 5875),
(1041, 9, 11597, 0, 5875),
(1041, 10, 11198, 0, 5875);
INSERT INTO `spell_group_stack_rules` (`group_id`, `build`, `stack_rule`) VALUES (1041, 0, 3);

-- Faerie fire + debuff weapons
INSERT INTO `spell_group` (`group_id`, `group_spell_id`, `spell_id`, `build_min`, `build_max`) VALUES
(1042, 0, 17315, 4878, 5875),
(1042, 1, 11791, 4878, 5875),
(1042, 2, 770, 0, 5875),
(1042, 3, 778, 0, 5875),
(1042, 4, 9749, 0, 5875),
(1042, 5, 9907, 0, 5875),
(1042, 6, 13752, 0, 5875),
(1042, 7, 16857, 0, 5875),
(1042, 8, 17390, 0, 5875),
(1042, 9, 17391, 0, 5875),
(1042, 10, 17392, 0, 5875),
(1042, 11, 21670, 0, 5875),
(1042, 12, 20656, 0, 5875);
INSERT INTO `spell_group_stack_rules` (`group_id`, `build`, `stack_rule`) VALUES (1042, 0, 1);

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
