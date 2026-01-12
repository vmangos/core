DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260111100230');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260111100230');
-- Add your query below.


-- Pool Plaguebloom in Eastern Plaguelands
SET @PTEMPLATE = 4062;
SET @GGUID = 4902;
-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- The Fungal Vale
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES
(@GGUID+1, 176587, 0, 2528.759033203125, -3721.857177734375, 178.918914794921875, 1.692969322204589843, 0, 0, 0.748955726623535156, 0.662620067596435546, 300, 300, 100, 1),
(@GGUID+2, 176587, 0, 2282.431884765625, -3562.95751953125, 154.13677978515625, -2.56563162803649902, 0, 0, -0.95881938934326171, 0.284016460180282592, 300, 300, 100, 1);

DELETE FROM `pool_gameobject` WHERE `guid` IN (1372, 45942, 57788, 57777);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Eastern Plaguelands - The Fungal Vale - Plaguebloom', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(1372, @PTEMPLATE+1, 0, 'Plaguebloom - Eastern Plaguelands - The Fungal Vale', 0, 0, 10),
(45942, @PTEMPLATE+1, 0, 'Plaguebloom - Eastern Plaguelands - The Fungal Vale', 0, 0, 10),
(57788, @PTEMPLATE+1, 0, 'Plaguebloom - Eastern Plaguelands - The Fungal Vale', 0, 0, 10),
(57777, @PTEMPLATE+1, 0, 'Plaguebloom - Eastern Plaguelands - The Fungal Vale', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+1, 0, 'Plaguebloom - Eastern Plaguelands - The Fungal Vale', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+1, 0, 'Plaguebloom - Eastern Plaguelands - The Fungal Vale', 0, 0, 10);

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- The Noxious Glade
DELETE FROM `pool_gameobject` WHERE `guid` IN (57780, 57779, 57781, 57786, 45957, 57782);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+2, 1, 'Eastern Plaguelands - The Noxious Glade - Plaguebloom', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(57780, @PTEMPLATE+2, 0, 'Plaguebloom - Eastern Plaguelands - The Noxious Glade', 0, 0, 10),
(57779, @PTEMPLATE+2, 0, 'Plaguebloom - Eastern Plaguelands - The Noxious Glade', 0, 0, 10),
(57781, @PTEMPLATE+2, 0, 'Plaguebloom - Eastern Plaguelands - The Noxious Glade', 0, 0, 10),
(57786, @PTEMPLATE+2, 0, 'Plaguebloom - Eastern Plaguelands - The Noxious Glade', 0, 0, 10),
(45957, @PTEMPLATE+2, 0, 'Plaguebloom - Eastern Plaguelands - The Noxious Glade', 0, 0, 10),
(57782, @PTEMPLATE+2, 0, 'Plaguebloom - Eastern Plaguelands - The Noxious Glade', 0, 0, 10);

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Zul\'Mashar
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES
(@GGUID+3, 176587, 0, 3200.817626953125, -4660.552734375, 120.8011932373046875, 2.373644113540649414, 0, 0, 0.927183151245117187, 0.37460830807685852, 300, 300, 100, 1),
(@GGUID+4, 176587, 0, 3355.60498046875, -4984.62939453125, 159.252532958984375, 2.042035102844238281, 0, 0, 0.852640151977539062, 0.522498607635498046, 300, 300, 100, 1);

DELETE FROM `pool_gameobject` WHERE `guid` IN (57776, 57837, 68810, 57760);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+3, 1, 'Eastern Plaguelands - Zul\'Mashar - Plaguebloom', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(57776, @PTEMPLATE+3, 0, 'Plaguebloom - Eastern Plaguelands - Zul\'Mashar', 0, 0, 10),
(57837, @PTEMPLATE+3, 0, 'Plaguebloom - Eastern Plaguelands - Zul\'Mashar', 0, 0, 10),
(68810, @PTEMPLATE+3, 0, 'Plaguebloom - Eastern Plaguelands - Zul\'Mashar', 0, 0, 10),
(57760, @PTEMPLATE+3, 0, 'Plaguebloom - Eastern Plaguelands - Zul\'Mashar', 0, 0, 10),
(@GGUID+3, @PTEMPLATE+3, 0, 'Plaguebloom - Eastern Plaguelands - Zul\'Mashar', 0, 0, 10),
(@GGUID+4, @PTEMPLATE+3, 0, 'Plaguebloom - Eastern Plaguelands - Zul\'Mashar', 0, 0, 10);

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- The Marris Stead Group 1 (blue)
DELETE FROM `pool_gameobject` WHERE `guid` IN (57792, 45870, 68809, 57801, 19960, 20013);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+4, 1, 'Eastern Plaguelands - The Marris Stead Group 1 - Plaguebloom', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(57792, @PTEMPLATE+4, 0, 'Plaguebloom - Eastern Plaguelands - The Marris Stead Group 1', 0, 0, 10),
(45870, @PTEMPLATE+4, 0, 'Plaguebloom - Eastern Plaguelands - The Marris Stead Group 1', 0, 0, 10),
(68809, @PTEMPLATE+4, 0, 'Plaguebloom - Eastern Plaguelands - The Marris Stead Group 1', 0, 0, 10),
(57801, @PTEMPLATE+4, 0, 'Plaguebloom - Eastern Plaguelands - The Marris Stead Group 1', 0, 0, 10),
(19960, @PTEMPLATE+4, 0, 'Plaguebloom - Eastern Plaguelands - The Marris Stead Group 1', 0, 0, 10),
(20013, @PTEMPLATE+4, 0, 'Plaguebloom - Eastern Plaguelands - The Marris Stead Group 1', 0, 0, 10);

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- The Marris Stead Group 2 (yellow)
DELETE FROM `pool_gameobject` WHERE `guid` IN (45816, 57787, 68807, 68805, 68812, 57762);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+5, 1, 'Eastern Plaguelands - The Marris Stead Group 2 - Plaguebloom', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(45816, @PTEMPLATE+5, 0, 'Plaguebloom - Eastern Plaguelands - The Marris Stead Group 2', 0, 0, 10),
(57787, @PTEMPLATE+5, 0, 'Plaguebloom - Eastern Plaguelands - The Marris Stead Group 2', 0, 0, 10),
(68807, @PTEMPLATE+5, 0, 'Plaguebloom - Eastern Plaguelands - The Marris Stead Group 2', 0, 0, 10),
(68805, @PTEMPLATE+5, 0, 'Plaguebloom - Eastern Plaguelands - The Marris Stead Group 2', 0, 0, 10),
(68812, @PTEMPLATE+5, 0, 'Plaguebloom - Eastern Plaguelands - The Marris Stead Group 2', 0, 0, 10),
(57762, @PTEMPLATE+5, 0, 'Plaguebloom - Eastern Plaguelands - The Marris Stead Group 2', 0, 0, 10);

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Darrowshire (black)
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES
(@GGUID+5, 176587, 0, 1545.5445556640625, -3805.982666015625, 115.6128921508789062, 3.071766614913940429, 0, 0, 0.999390602111816406, 0.034906134009361267, 300, 300, 100, 1);

DELETE FROM `pool_gameobject` WHERE `guid` IN (45856, 57802, 57772, 57770, 19910);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+6, 1, 'Eastern Plaguelands - Darrowshire - Plaguebloom', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(45856, @PTEMPLATE+6, 0, 'Plaguebloom - Eastern Plaguelands - Darrowshire', 0, 0, 10),
(57802, @PTEMPLATE+6, 0, 'Plaguebloom - Eastern Plaguelands - Darrowshire', 0, 0, 10),
(57772, @PTEMPLATE+6, 0, 'Plaguebloom - Eastern Plaguelands - Darrowshire', 0, 0, 10),
(57770, @PTEMPLATE+6, 0, 'Plaguebloom - Eastern Plaguelands - Darrowshire', 0, 0, 10),
(19910, @PTEMPLATE+6, 0, 'Plaguebloom - Eastern Plaguelands - Darrowshire', 0, 0, 10),
(@GGUID+5, @PTEMPLATE+6, 0, 'Plaguebloom - Eastern Plaguelands - Darrowshire', 0, 0, 10);

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Corrin\'s Crossing Group 1 (white)
DELETE FROM `pool_gameobject` WHERE `guid` IN (57758, 57763, 19901, 33864, 66941, 57769);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+7, 1, 'Eastern Plaguelands - Corrin\'s Crossing Group 1 - Plaguebloom', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(57758, @PTEMPLATE+7, 0, 'Plaguebloom - Eastern Plaguelands - Corrin\'s Crossing Group 1', 0, 0, 10),
(57763, @PTEMPLATE+7, 0, 'Plaguebloom - Eastern Plaguelands - Corrin\'s Crossing Group 1', 0, 0, 10),
(19901, @PTEMPLATE+7, 0, 'Plaguebloom - Eastern Plaguelands - Corrin\'s Crossing Group 1', 0, 0, 10),
(33864, @PTEMPLATE+7, 0, 'Plaguebloom - Eastern Plaguelands - Corrin\'s Crossing Group 1', 0, 0, 10),
(66941, @PTEMPLATE+7, 0, 'Plaguebloom - Eastern Plaguelands - Corrin\'s Crossing Group 1', 0, 0, 10),
(57769, @PTEMPLATE+7, 0, 'Plaguebloom - Eastern Plaguelands - Corrin\'s Crossing Group 1', 0, 0, 10);

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Lake Mereldar (purple)
DELETE FROM `pool_gameobject` WHERE `guid` IN (57783, 57768, 57761, 57785, 45784, 57789);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+8, 1, 'Eastern Plaguelands - Lake Mereldar - Plaguebloom', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(57783, @PTEMPLATE+8, 0, 'Plaguebloom - Eastern Plaguelands - Lake Mereldar', 0, 0, 10),
(57768, @PTEMPLATE+8, 0, 'Plaguebloom - Eastern Plaguelands - Lake Mereldar', 0, 0, 10),
(57761, @PTEMPLATE+8, 0, 'Plaguebloom - Eastern Plaguelands - Lake Mereldar', 0, 0, 10),
(57785, @PTEMPLATE+8, 0, 'Plaguebloom - Eastern Plaguelands - Lake Mereldar', 0, 0, 10),
(45784, @PTEMPLATE+8, 0, 'Plaguebloom - Eastern Plaguelands - Lake Mereldar', 0, 0, 10),
(57789, @PTEMPLATE+8, 0, 'Plaguebloom - Eastern Plaguelands - Lake Mereldar', 0, 0, 10);

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Pestilent Scar
DELETE FROM `pool_gameobject` WHERE `guid` IN (68816, 57771, 45939, 20127, 68815, 57790);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+9, 1, 'Eastern Plaguelands - Pestilent Scar - Plaguebloom', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(68816, @PTEMPLATE+9, 0, 'Plaguebloom - Eastern Plaguelands - Pestilent Scar', 0, 0, 10),
(57771, @PTEMPLATE+9, 0, 'Plaguebloom - Eastern Plaguelands - Pestilent Scar', 0, 0, 10),
(45939, @PTEMPLATE+9, 0, 'Plaguebloom - Eastern Plaguelands - Pestilent Scar', 0, 0, 10),
(20127, @PTEMPLATE+9, 0, 'Plaguebloom - Eastern Plaguelands - Pestilent Scar', 0, 0, 10),
(68815, @PTEMPLATE+9, 0, 'Plaguebloom - Eastern Plaguelands - Pestilent Scar', 0, 0, 10),
(57790, @PTEMPLATE+9, 0, 'Plaguebloom - Eastern Plaguelands - Pestilent Scar', 0, 0, 10);

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Blackwood Lake
DELETE FROM `pool_gameobject` WHERE `guid` IN (57825, 57826, 45787, 68818, 68803, 68817, 68808);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+10, 1, 'Eastern Plaguelands - Blackwood Lake - Plaguebloom', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(57825, @PTEMPLATE+10, 0, 'Plaguebloom - Eastern Plaguelands - Blackwood Lake', 0, 0, 10),
(57826, @PTEMPLATE+10, 0, 'Plaguebloom - Eastern Plaguelands - Blackwood Lake', 0, 0, 10),
(45787, @PTEMPLATE+10, 0, 'Plaguebloom - Eastern Plaguelands - Blackwood Lake', 0, 0, 10),
(68818, @PTEMPLATE+10, 0, 'Plaguebloom - Eastern Plaguelands - Blackwood Lake', 0, 0, 10),
(68803, @PTEMPLATE+10, 0, 'Plaguebloom - Eastern Plaguelands - Blackwood Lake', 0, 0, 10),
(68817, @PTEMPLATE+10, 0, 'Plaguebloom - Eastern Plaguelands - Blackwood Lake', 0, 0, 10),
(68808, @PTEMPLATE+10, 0, 'Plaguebloom - Eastern Plaguelands - Blackwood Lake', 0, 0, 10);

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Plaguewood Group 1 (purple)
DELETE FROM `pool_gameobject` WHERE `guid` IN (1374, 68811, 45833, 57835, 20094, 68813);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+11, 1, 'Eastern Plaguelands - Plaguewood Group 1 - Plaguebloom', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(1374, @PTEMPLATE+11, 0, 'Plaguebloom - Eastern Plaguelands - Plaguewood Group 1', 0, 0, 10),
(68811, @PTEMPLATE+11, 0, 'Plaguebloom - Eastern Plaguelands - Plaguewood Group 1', 0, 0, 10),
(45833, @PTEMPLATE+11, 0, 'Plaguebloom - Eastern Plaguelands - Plaguewood Group 1', 0, 0, 10),
(57835, @PTEMPLATE+11, 0, 'Plaguebloom - Eastern Plaguelands - Plaguewood Group 1', 0, 0, 10),
(20094, @PTEMPLATE+11, 0, 'Plaguebloom - Eastern Plaguelands - Plaguewood Group 1', 0, 0, 10),
(68813, @PTEMPLATE+11, 0, 'Plaguebloom - Eastern Plaguelands - Plaguewood Group 1', 0, 0, 10);

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Plaguewood Group 2 (black)
DELETE FROM `pool_gameobject` WHERE `guid` IN (68814, 45705, 57775, 57829, 57764, 19905);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+12, 1, 'Eastern Plaguelands - Plaguewood Group 2 - Plaguebloom', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(68814, @PTEMPLATE+12, 0, 'Plaguebloom - Eastern Plaguelands - Plaguewood Group 2', 0, 0, 10),
(45705, @PTEMPLATE+12, 0, 'Plaguebloom - Eastern Plaguelands - Plaguewood Group 2', 0, 0, 10),
(57775, @PTEMPLATE+12, 0, 'Plaguebloom - Eastern Plaguelands - Plaguewood Group 2', 0, 0, 10),
(57829, @PTEMPLATE+12, 0, 'Plaguebloom - Eastern Plaguelands - Plaguewood Group 2', 0, 0, 10),
(57764, @PTEMPLATE+12, 0, 'Plaguebloom - Eastern Plaguelands - Plaguewood Group 2', 0, 0, 10),
(19905, @PTEMPLATE+12, 0, 'Plaguebloom - Eastern Plaguelands - Plaguewood Group 2', 0, 0, 10);

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Plaguewood Group 3 (green)
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES
(@GGUID+6, 176587, 0, 2846.370361328125, -3551.9697265625, 106.5083236694335937, 3.316144466400146484, 0, 0, -0.99619388580322265, 0.087165042757987976, 300, 300, 100, 1);

DELETE FROM `pool_gameobject` WHERE `guid` IN (57766, 57836, 57774, 19970, 45914, 57830);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+13, 1, 'Eastern Plaguelands - Plaguewood Group 3 - Plaguebloom', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(57766, @PTEMPLATE+13, 0, 'Plaguebloom - Eastern Plaguelands - Plaguewood Group 3', 0, 0, 10),
(57836, @PTEMPLATE+13, 0, 'Plaguebloom - Eastern Plaguelands - Plaguewood Group 3', 0, 0, 10),
(57774, @PTEMPLATE+13, 0, 'Plaguebloom - Eastern Plaguelands - Plaguewood Group 3', 0, 0, 10),
(19970, @PTEMPLATE+13, 0, 'Plaguebloom - Eastern Plaguelands - Plaguewood Group 3', 0, 0, 10),
(45914, @PTEMPLATE+13, 0, 'Plaguebloom - Eastern Plaguelands - Plaguewood Group 3', 0, 0, 10),
(57830, @PTEMPLATE+13, 0, 'Plaguebloom - Eastern Plaguelands - Plaguewood Group 3', 0, 0, 10),
(@GGUID+6, @PTEMPLATE+13, 0, 'Plaguebloom - Eastern Plaguelands - Plaguewood Group 3', 0, 0, 10);

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- The Infectis Scar
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES
(@GGUID+7, 176587, 0, 2204.121826171875, -3841.4345703125, 162.62872314453125, 1.099556446075439453, 0, 0, 0.522498130798339843, 0.852640450000762939, 300, 300, 100, 1),
(@GGUID+8, 176587, 0, 2388.1064453125, -4093.083740234375, 77.0275421142578125, 2.199114561080932617, 0, 0, 0.8910064697265625, 0.453990638256072998, 300, 300, 100, 1);

DELETE FROM `pool_gameobject` WHERE `guid` IN (68804, 57778, 57806, 45810);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+14, 1, 'Eastern Plaguelands - The Infectis Scar - Plaguebloom', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(68804, @PTEMPLATE+14, 0, 'Plaguebloom - Eastern Plaguelands - The Infectis Scar', 0, 0, 10),
(57778, @PTEMPLATE+14, 0, 'Plaguebloom - Eastern Plaguelands - The Infectis Scar', 0, 0, 10),
(57806, @PTEMPLATE+14, 0, 'Plaguebloom - Eastern Plaguelands - The Infectis Scar', 0, 0, 10),
(45810, @PTEMPLATE+14, 0, 'Plaguebloom - Eastern Plaguelands - The Infectis Scar', 0, 0, 10),
(@GGUID+7, @PTEMPLATE+14, 0, 'Plaguebloom - Eastern Plaguelands - The Infectis Scar', 0, 0, 10),
(@GGUID+8, @PTEMPLATE+14, 0, 'Plaguebloom - Eastern Plaguelands - The Infectis Scar', 0, 0, 10);

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Eastwall Tower
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES
(@GGUID+9, 176587, 0, 2617.41259765625, -4910.3837890625, 82.33286285400390625, 2.268925428390502929, 0, 0, 0.906307220458984375, 0.422619491815567016, 300, 300, 100, 1),
(@GGUID+10, 176587, 0, 2924.437255859375, -4801.052734375, 96.565155029296875, 0.698131501674652099, 0, 0, 0.342020034790039062, 0.939692676067352294, 300, 300, 100, 1);

DELETE FROM `pool_gameobject` WHERE `guid` IN (20122, 45851, 57759, 57828);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+15, 1, 'Eastern Plaguelands - Eastwall Tower - Plaguebloom', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(20122, @PTEMPLATE+15, 0, 'Plaguebloom - Eastern Plaguelands - Eastwall Tower', 0, 0, 10),
(45851, @PTEMPLATE+15, 0, 'Plaguebloom - Eastern Plaguelands - Eastwall Tower', 0, 0, 10),
(57759, @PTEMPLATE+15, 0, 'Plaguebloom - Eastern Plaguelands - Eastwall Tower', 0, 0, 10),
(57828, @PTEMPLATE+15, 0, 'Plaguebloom - Eastern Plaguelands - Eastwall Tower', 0, 0, 10),
(@GGUID+9, @PTEMPLATE+15, 0, 'Plaguebloom - Eastern Plaguelands - Eastwall Tower', 0, 0, 10),
(@GGUID+10, @PTEMPLATE+15, 0, 'Plaguebloom - Eastern Plaguelands - Eastwall Tower', 0, 0, 10);

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Northpass Tower
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES
(@GGUID+11, 176587, 0, 3287.32763671875, -4396.5078125, 111.586883544921875, 0.645771682262420654, 0, 0, 0.317304611206054687, 0.948323667049407958, 300, 300, 100, 1);

DELETE FROM `pool_gameobject` WHERE `guid` IN (45815, 57791, 57832, 57765, 57834);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+16, 1, 'Eastern Plaguelands - Eastwall Tower - Plaguebloom', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(45815, @PTEMPLATE+16, 0, 'Plaguebloom - Eastern Plaguelands - Northpass Tower', 0, 0, 10),
(57791, @PTEMPLATE+16, 0, 'Plaguebloom - Eastern Plaguelands - Northpass Tower', 0, 0, 10),
(57832, @PTEMPLATE+16, 0, 'Plaguebloom - Eastern Plaguelands - Northpass Tower', 0, 0, 10),
(57765, @PTEMPLATE+16, 0, 'Plaguebloom - Eastern Plaguelands - Northpass Tower', 0, 0, 10),
(57834, @PTEMPLATE+16, 0, 'Plaguebloom - Eastern Plaguelands - Northpass Tower', 0, 0, 10),
(@GGUID+11, @PTEMPLATE+16, 0, 'Plaguebloom - Eastern Plaguelands - Northpass Tower', 0, 0, 10);

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Corrin\'s Crossing Group 2 (pink)
DELETE FROM `pool_gameobject` WHERE `guid` IN (57767, 57773, 57823, 45811, 33308);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+17, 1, 'Eastern Plaguelands - Corrin\'s Crossing Group 2 - Plaguebloom', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(57767, @PTEMPLATE+17, 0, 'Plaguebloom - Eastern Plaguelands - Corrin\'s Crossing Group 2', 0, 0, 10),
(57773, @PTEMPLATE+17, 0, 'Plaguebloom - Eastern Plaguelands - Corrin\'s Crossing Group 2', 0, 0, 10),
(57823, @PTEMPLATE+17, 0, 'Plaguebloom - Eastern Plaguelands - Corrin\'s Crossing Group 2', 0, 0, 10),
(45811, @PTEMPLATE+17, 0, 'Plaguebloom - Eastern Plaguelands - Corrin\'s Crossing Group 2', 0, 0, 10),
(33308, @PTEMPLATE+17, 0, 'Plaguebloom - Eastern Plaguelands - Corrin\'s Crossing Group 2', 0, 0, 10);

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Northdale
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES
(@GGUID+12, 176587, 0, 2981.592041015625, -4648.55859375, 93.14572906494140625, 3.961898565292358398, 0, 0, -0.91705989837646484, 0.398749500513076782, 300, 300, 100, 1);

DELETE FROM `pool_gameobject` WHERE `guid` IN (1373, 45835, 57784, 68806);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+18, 1, 'Eastern Plaguelands - Northdale - Plaguebloom', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(1373, @PTEMPLATE+18, 0, 'Plaguebloom - Eastern Plaguelands - Northdale', 0, 0, 10),
(45835, @PTEMPLATE+18, 0, 'Plaguebloom - Eastern Plaguelands - Northdale', 0, 0, 10),
(57784, @PTEMPLATE+18, 0, 'Plaguebloom - Eastern Plaguelands - Northdale', 0, 0, 10),
(68806, @PTEMPLATE+18, 0, 'Plaguebloom - Eastern Plaguelands - Northdale', 0, 0, 10),
(@GGUID+12, @PTEMPLATE+18, 0, 'Plaguebloom - Eastern Plaguelands - Northdale', 0, 0, 10);

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Remove Rogue Plaguebloom
DELETE FROM `gameobject` WHERE `guid` = 57838;
DELETE FROM `pool_gameobject` WHERE `guid` = 57838;

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Delete Old Group
DELETE FROM `pool_template` WHERE `entry` = 1265;

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
