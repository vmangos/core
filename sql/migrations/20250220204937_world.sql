DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250220204937');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250220204937');
-- Add your query below.


-- Update Some Descriptions
UPDATE `pool_template` SET `description` = 'Copper Veins (103713) - Barrens (Master Pool)' WHERE `entry` = 3165;
UPDATE `pool_template` SET `description` = 'Copper Veins - Tirisfal Glades (Master Pool)' WHERE `entry` = 1008;
UPDATE `pool_gameobject` SET `description` = 'Dark Iron Deposit' WHERE `guid` IN (884, 883, 882, 881, 130);
UPDATE `gameobject` SET `id` = 1735 WHERE `guid` = 74266;
UPDATE `pool_template` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale - Crystalvein Mine' WHERE `entry` = 5662;
UPDATE `pool_gameobject` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale - Crystalvein Mine' WHERE `guid` IN (427001, 74265, 74266);
UPDATE `pool_pool` SET `description` = 'Stranglethorn Vale - Crystalvein Mine - Silver Vein / Gold Vein / Iron Deposit' WHERE `pool_id` = 5662;
UPDATE `pool_template` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Badlands - Excavation Center' WHERE `entry` = 1760;
UPDATE `pool_pool` SET `description` = 'Badlands - Excavation Center - Silver Vein / Gold Vein / Iron Deposit' WHERE `pool_id` = 1760;
UPDATE `pool_gameobject` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Badlands - Excavation Center' WHERE `guid` IN (31740, 31798, 31856);
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Small Thorium Vein - Blasted Lands - Serpent\'s Coil' WHERE `entry` = 14403;
UPDATE `pool_gameobject` SET `description`='Truesilver Deposit / Small Thorium Vein - Blasted Lands - Serpent\'s Coil' WHERE  `guid` IN (58103, 58106);
UPDATE `pool_pool` SET `description` = 'Blasted Lands - Serpent\'s Coil - Truesilver Deposit / Small Thorium Vein' WHERE `pool_id` = 14403;
UPDATE `pool_gameobject` SET `description`='Tin Vein / Silver Vein - Blackfathom Deeps' WHERE `guid` IN (2190, 2196, 2191, 2197, 2192, 2198, 2193, 2199, 2194, 2200, 2195, 2201);
UPDATE `pool_template` SET `description` = 'Dark Iron Deposits - Molten Core (Master Pool)' WHERE `entry` = 25609;
UPDATE `pool_template` SET `description` = 'Dark Iron Deposits - BRD (Master Pool)' WHERE `entry` = 25622;
UPDATE `pool_template` SET `description` = 'Lesser Bloodstone Deposits - Arathi Highlands (Master Pool)' WHERE `entry` = 298;
UPDATE `pool_template` SET `description` = 'Western Plaguelands - Mithril Deposit / Gold Vein / Truesilver Deposit (Master Pool)' WHERE `entry` = 1271;
UPDATE `pool_template` SET `description` = 'Western Plaguelands - Truesilver Deposit / Small Thorium Vein (Master Pool)' WHERE `entry` = 1331;
UPDATE `pool_template` SET `description` = 'Western Plaguelands - Hearthglen - Truesilver Deposit / Rich Thorium Vein (Master Pool)' WHERE `entry` = 1262;
UPDATE `pool_template` SET `description` = 'Eastern Plaguelands - Mithril Deposit / Gold Vein / Truesilver Deposit (Master Pool)' WHERE `entry` = 1263;
UPDATE `pool_template` SET `description` = 'Eastern Plaguelands - Truesilver Deposit / Small Thorium Vein (Master Pool)' WHERE `entry` = 1264;
UPDATE `pool_template` SET `description` = 'Eastern Plaguelands - Truesilver Deposit / Rich Thorium Vein (Master Pool)' WHERE `entry` = 325;
UPDATE `pool_template` SET `description` = 'Azshara - Truesilver Deposit / Rich Thorium Vein (Master Pool)' WHERE `entry` = 2337;
UPDATE `pool_template` SET `description` = 'Rich Thorium Veins - Dire Maul (Master Pool)' WHERE `entry` = 4301;

-- Correct Patch and Limits For Dark Iron
UPDATE `pool_template` SET `max_limit` = 9 WHERE `entry` = 25622;
UPDATE `pool_template` SET `max_limit` = 18 WHERE `entry` = 25609;
UPDATE `pool_template` SET `patch_min` = 5 WHERE `entry` IN (25609, 25622);
UPDATE `pool_gameobject` SET `patch_min` = 5 WHERE `pool_entry` IN (25609, 25622);

-- Correct Respawn Times
UPDATE `gameobject` SET `spawntimesecsmin` = 600, `spawntimesecsmax` = 2700 WHERE `id` IN (73940, 73941, 123309, 123310);

-- Update Chance
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Tin Vein / Silver Vein - Hillsbrad Foothills - Azurelode Mine" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 105569);
UPDATE `pool_gameobject` SET `chance` = 95 WHERE `description` = "Tin Vein / Silver Vein - Hillsbrad Foothills - Azurelode Mine" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 103711);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Tin Vein / Silver Vein - Blackfathom Deeps" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1733);
UPDATE `pool_gameobject` SET `chance` = 95 WHERE `description` = "Tin Vein / Silver Vein - Blackfathom Deeps" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1732);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Tin Vein / Silver Vein - Wailing Caverns" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1733);
UPDATE `pool_gameobject` SET `chance` = 95 WHERE `description` = "Tin Vein / Silver Vein - Wailing Caverns" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1732);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` =  "Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale - Crystalvein Mine" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1733);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` =  "Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale - Crystalvein Mine" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 90 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale - Crystalvein Mine" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1735);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` =  "Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale - Mosh'Ogg Ogre Mound" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1733);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` =  "Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale - Mosh'Ogg Ogre Mound" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 90 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale - Mosh'Ogg Ogre Mound" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1735);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit - Badlands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1733);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit - Badlands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 90 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit - Badlands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1735);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit - Badlands - Dustbelch Grotto" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1733);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit - Badlands - Dustbelch Grotto" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 90 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit - Badlands - Dustbelch Grotto" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1735);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit - Badlands - Misc Cave" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1733);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit - Badlands - Misc Cave" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 90 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit - Badlands - Misc Cave" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1735);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit - Badlands - Excavation Center" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1733);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit - Badlands - Excavation Center" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 90 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit - Badlands - Excavation Center" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1735);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 90 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2040);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);
UPDATE `pool_gameobject` SET `chance` = 75 WHERE `guid` = 96;
UPDATE `pool_gameobject` SET `chance` = 15 WHERE `guid` = 31251;
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `guid` = 31215;
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `guid` = 31179;

-- Correct Uldaman Spawn Groups
SET @OGUID = 5291;
SET @PTEMPLATE = 1567;
DELETE FROM `gameobject` WHERE `guid` IN (21836, 21800, 21801, 21802, 21803, 21804, 21805, 21806, 21807, 21808, 21809, 21810, 21811, 21812, 21813, 21814, 21815, 21816, 21817, 21818, 21819, 21820, 21821, 21822, 21823, 21824, 21825, 21826, 21827, 21828, 21829, 21830, 21831, 21832, 21833, 21834, 21835);
DELETE FROM `pool_gameobject` WHERE `guid` IN (21800, 21801, 21802, 21803, 21804, 21805, 21806, 21807, 21808, 21809, 21810, 21811, 21812, 21813, 21814, 21815, 21816, 21817, 21818, 21819, 21820, 21821, 21822, 21823, 21824, 21825, 21826, 21827, 21828, 21829, 21830, 21831, 21832, 21833, 21834, 21835);
DELETE FROM `pool_pool` WHERE `pool_id` IN (2996, 2997, 2998, 2999, 3000, 3001, 3002, 3003, 3004, 3005, 3006, 3007);
DELETE FROM `pool_template` WHERE `entry` IN (3008, 2996, 2997, 2998, 2999, 3000, 3001, 3002, 3003, 3004, 3005, 3006, 3007);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1733, 70, -258.41, 252.235, -49.326, 6.10865, 0, 0, -0.0871553, 0.996195, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1733, 70, -179.772, 95.0592, -48.8041, 2.77507, 0, 0, 0.983254, 0.182238, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 1733, 70, -143.264, 251.363, -47.2695, 6.19592, 0, 0, -0.0436192, 0.999048, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 1733, 70, -60.9316, 199.971, -47.0473, 4.39823, 0, 0, -0.809016, 0.587786, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 1733, 70, -23.9125, 326.636, -44.5684, -1.97222, 0, 0, 0.833886, -0.551937, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 1733, 70, -0.98445, 400.035, -45.7788, 2.80998, 0, 0, 0.986285, 0.16505, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 1733, 70, 70.1268, 443.334, -41.0286, 0.331611, 0, 0, 0.165047, 0.986286, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 1734, 70, -258.41, 252.235, -49.326, 6.10865, 0, 0, -0.0871553, 0.996195, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 1734, 70, -179.772, 95.0592, -48.8041, 2.77507, 0, 0, 0.983254, 0.182238, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 1734, 70, -143.264, 251.363, -47.2695, 6.19592, 0, 0, -0.0436192, 0.999048, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+11, 1734, 70, -60.9316, 199.971, -47.0473, 4.39823, 0, 0, -0.809016, 0.587786, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+12, 1734, 70, -23.9125, 326.636, -44.5684, -1.97222, 0, 0, 0.833886, -0.551937, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+13, 1734, 70, -0.98445, 400.035, -45.7788, 2.80998, 0, 0, 0.986285, 0.16505, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+14, 1734, 70, 70.1268, 443.334, -41.0286, 0.331611, 0, 0, 0.165047, 0.986286, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+15, 1735, 70, -258.41, 252.235, -49.326, 6.10865, 0, 0, -0.0871553, 0.996195, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+16, 1735, 70, -179.772, 95.0592, -48.8041, 2.77507, 0, 0, 0.983254, 0.182238, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+17, 1735, 70, -143.264, 251.363, -47.2695, 6.19592, 0, 0, -0.0436192, 0.999048, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+18, 1735, 70, -60.9316, 199.971, -47.0473, 4.39823, 0, 0, -0.809016, 0.587786, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+19, 1735, 70, -23.9125, 326.636, -44.5684, -1.97222, 0, 0, 0.833886, -0.551937, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+20, 1735, 70, -0.98445, 400.035, -45.7788, 2.80998, 0, 0, 0.986285, 0.16505, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+21, 1735, 70, 70.1268, 443.334, -41.0286, 0.331611, 0, 0, 0.165047, 0.986286, 604800, 604800, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Silver Vein / Gold Vein / Iron Deposit - Uldaman', 10),
(@PTEMPLATE+2, 1, 'Silver Vein / Gold Vein / Iron Deposit - Uldaman', 10),
(@PTEMPLATE+3, 1, 'Silver Vein / Gold Vein / Iron Deposit - Uldaman', 10),
(@PTEMPLATE+4, 1, 'Silver Vein / Gold Vein / Iron Deposit - Uldaman', 10),
(@PTEMPLATE+5, 1, 'Silver Vein / Gold Vein / Iron Deposit - Uldaman', 10),
(@PTEMPLATE+6, 1, 'Silver Vein / Gold Vein / Iron Deposit - Uldaman', 10),
(@PTEMPLATE+7, 1, 'Silver Vein / Gold Vein / Iron Deposit - Uldaman', 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Silver Vein / Gold Vein / Iron Deposit - Uldaman', 10),
(@OGUID+2, @PTEMPLATE+2, 'Silver Vein / Gold Vein / Iron Deposit - Uldaman', 10),
(@OGUID+3, @PTEMPLATE+3, 'Silver Vein / Gold Vein / Iron Deposit - Uldaman', 10),
(@OGUID+4, @PTEMPLATE+4, 'Silver Vein / Gold Vein / Iron Deposit - Uldaman', 10),
(@OGUID+5, @PTEMPLATE+5, 'Silver Vein / Gold Vein / Iron Deposit - Uldaman', 10),
(@OGUID+6, @PTEMPLATE+6, 'Silver Vein / Gold Vein / Iron Deposit - Uldaman', 10),
(@OGUID+7, @PTEMPLATE+7, 'Silver Vein / Gold Vein / Iron Deposit - Uldaman', 10),
(@OGUID+8, @PTEMPLATE+1, 'Silver Vein / Gold Vein / Iron Deposit - Uldaman', 10),
(@OGUID+9, @PTEMPLATE+2, 'Silver Vein / Gold Vein / Iron Deposit - Uldaman', 10),
(@OGUID+10, @PTEMPLATE+3, 'Silver Vein / Gold Vein / Iron Deposit - Uldaman', 10),
(@OGUID+11, @PTEMPLATE+4, 'Silver Vein / Gold Vein / Iron Deposit - Uldaman', 10),
(@OGUID+12, @PTEMPLATE+5, 'Silver Vein / Gold Vein / Iron Deposit - Uldaman', 10),
(@OGUID+13, @PTEMPLATE+6, 'Silver Vein / Gold Vein / Iron Deposit - Uldaman', 10),
(@OGUID+14, @PTEMPLATE+7, 'Silver Vein / Gold Vein / Iron Deposit - Uldaman', 10),
(@OGUID+15, @PTEMPLATE+1, 'Silver Vein / Gold Vein / Iron Deposit - Uldaman', 10),
(@OGUID+16, @PTEMPLATE+2, 'Silver Vein / Gold Vein / Iron Deposit - Uldaman', 10),
(@OGUID+17, @PTEMPLATE+3, 'Silver Vein / Gold Vein / Iron Deposit - Uldaman', 10),
(@OGUID+18, @PTEMPLATE+4, 'Silver Vein / Gold Vein / Iron Deposit - Uldaman', 10),
(@OGUID+19, @PTEMPLATE+5, 'Silver Vein / Gold Vein / Iron Deposit - Uldaman', 10),
(@OGUID+20, @PTEMPLATE+6, 'Silver Vein / Gold Vein / Iron Deposit - Uldaman', 10),
(@OGUID+21, @PTEMPLATE+7, 'Silver Vein / Gold Vein / Iron Deposit - Uldaman', 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(3008, 2, 'Uldaman - Silver Vein / Gold Vein / Iron Deposit (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 3008, 0, 'Uldaman - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+2, 3008, 0, 'Uldaman - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+3, 3008, 0, 'Uldaman - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+4, 3008, 0, 'Uldaman - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+5, 3008, 0, 'Uldaman - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+6, 3008, 0, 'Uldaman - Silver Vein / Gold Vein / Iron Deposit', 0),
(@PTEMPLATE+7, 3008, 0, 'Uldaman - Silver Vein / Gold Vein / Iron Deposit', 0);

-- Mithril
SET @OGUID = 5854;
SET @PTEMPLATE = 1574;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1734, 70, -360.646, 141.757, -48.4138, 6.10865, 0, 0, -0.0871553, 0.996195, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1734, 70, -259.822, 272.068, -50.1133, 5.61996, 0, 0, -0.325567, 0.945519, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 1734, 70, -136.19, 281.179, -52.1819, 2.68781, 0, 0, 0.97437, 0.224951, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 1734, 70, -86.6632, 340.499, -48.0877, 5.55015, 0, 0, -0.358368, 0.93358, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 1734, 70, 26.3165, 209.089, -29.7314, 2.68781, 0, 0, 0.97437, 0.224951, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 1734, 70, -30.7983, 296.949, -45.43, -0.488692, 0, 0, 0.241922, -0.970296, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 2040, 70, -360.646, 141.757, -48.4138, 6.10865, 0, 0, -0.0871553, 0.996195, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 2040, 70, -259.822, 272.068, -50.1133, 5.61996, 0, 0, -0.325567, 0.945519, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 2040, 70, -136.19, 281.179, -52.1819, 2.68781, 0, 0, 0.97437, 0.224951, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 2040, 70, -86.6632, 340.499, -48.0877, 5.55015, 0, 0, -0.358368, 0.93358, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+11, 2040, 70, 26.3165, 209.089, -29.7314, 2.68781, 0, 0, 0.97437, 0.224951, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+12, 2040, 70, -30.7983, 296.949, -45.43, -0.488692, 0, 0, 0.241922, -0.970296, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+13, 2047, 70, -360.646, 141.757, -48.4138, 6.10865, 0, 0, -0.0871553, 0.996195, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+14, 2047, 70, -259.822, 272.068, -50.1133, 5.61996, 0, 0, -0.325567, 0.945519, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+15, 2047, 70, -136.19, 281.179, -52.1819, 2.68781, 0, 0, 0.97437, 0.224951, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+16, 2047, 70, -86.6632, 340.499, -48.0877, 5.55015, 0, 0, -0.358368, 0.93358, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+17, 2047, 70, 26.3165, 209.089, -29.7314, 2.68781, 0, 0, 0.97437, 0.224951, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+18, 2047, 70, -30.7983, 296.949, -45.43, -0.488692, 0, 0, 0.241922, -0.970296, 604800, 604800, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Uldaman', 10),
(@PTEMPLATE+2, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Uldaman', 10),
(@PTEMPLATE+3, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Uldaman', 10),
(@PTEMPLATE+4, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Uldaman', 10),
(@PTEMPLATE+5, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Uldaman', 10),
(@PTEMPLATE+6, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Uldaman', 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Uldaman', 10),
(@OGUID+2, @PTEMPLATE+2, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Uldaman', 10),
(@OGUID+3, @PTEMPLATE+3, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Uldaman', 10),
(@OGUID+4, @PTEMPLATE+4, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Uldaman', 10),
(@OGUID+5, @PTEMPLATE+5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Uldaman', 10),
(@OGUID+6, @PTEMPLATE+6, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Uldaman', 10),
(@OGUID+7, @PTEMPLATE+1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Uldaman', 10),
(@OGUID+8, @PTEMPLATE+2, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Uldaman', 10),
(@OGUID+9, @PTEMPLATE+3, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Uldaman', 10),
(@OGUID+10, @PTEMPLATE+4, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Uldaman', 10),
(@OGUID+11, @PTEMPLATE+5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Uldaman', 10),
(@OGUID+12, @PTEMPLATE+6, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Uldaman', 10),
(@OGUID+13, @PTEMPLATE+1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Uldaman', 10),
(@OGUID+14, @PTEMPLATE+2, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Uldaman', 10),
(@OGUID+15, @PTEMPLATE+3, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Uldaman', 10),
(@OGUID+16, @PTEMPLATE+4, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Uldaman', 10),
(@OGUID+17, @PTEMPLATE+5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Uldaman', 10),
(@OGUID+18, @PTEMPLATE+6, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Uldaman', 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(2996, 2, 'Uldaman - Gold Vein / Mithril Deposit / Truesilver Deposit (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 2996, 0, 'Uldaman - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+2, 2996, 0, 'Uldaman - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+3, 2996, 0, 'Uldaman - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+4, 2996, 0, 'Uldaman - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+5, 2996, 0, 'Uldaman - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+6, 2996, 0, 'Uldaman - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit - Uldaman" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1733);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit - Uldaman" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 90 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit - Uldaman" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1735);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit - Uldaman" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 90 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit - Uldaman" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2040);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit - Uldaman" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);

-- Remove Uneeded Object
DELETE FROM `gameobject` WHERE `guid` = 427070;

-- Pool Some Unpooled Objects
SET @OGUID = 169;
SET @PTEMPLATE = 404;

DELETE FROM `gameobject` WHERE `guid` = 39399;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1734, 349, 245.358, -412.876, -139.555, 2.75762, 0, 0, 0.981627, 0.190809, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 2040, 349, 245.358, -412.876, -139.555, 2.75762, 0, 0, 0.981627, 0.190809, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 2047, 349, 245.358, -412.876, -139.555, 2.75762, 0, 0, 0.981627, 0.190809, 604800, 604800, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 10),
(@OGUID+2, @PTEMPLATE+1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 10),
(@OGUID+3, @PTEMPLATE+1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon', 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 3525, 0, 'Maraudon - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 90 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2040);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit - Maraudon" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);

SET @OGUID = 205;
SET @PTEMPLATE = 406;

DELETE FROM `gameobject` WHERE `guid` = 49244;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1732, 43, 17.0352, -139.235, -74.8176, -1.79769, 0, 0, 0.782608, -0.622515, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1733, 43, 17.0352, -139.235, -74.8176, -1.79769, 0, 0, 0.782608, -0.622515, 604800, 604800, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Tin Vein / Silver Vein - Wailing Caverns', 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Tin Vein / Silver Vein - Wailing Caverns', 10),
(@OGUID+2, @PTEMPLATE+1, 'Tin Vein / Silver Vein - Wailing Caverns', 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 4791, 0, 'Wailing Caverns - Tin Vein / Silver Vein', 0);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Tin Vein / Silver Vein - Wailing Caverns" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1733);
UPDATE `pool_gameobject` SET `chance` = 90 WHERE `description` = "Tin Vein / Silver Vein - Wailing Caverns" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1732);

-- Correct Loot Tables
-- Blood Shard Does Not Drop From 1732
DELETE FROM `gameobject_loot_template` WHERE `entry` = 1503 AND `item` = 5075;

-- Increse Blood Shard Drop Chance For 3764
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance` = 49 WHERE `entry` = 2627 AND `item` = 5075;

-- Increse Blood Shard Drop Chance For 3763
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance` = 49 WHERE `entry` = 2626 AND `item` = 5075;

-- Increse Rethban Ore Drop Chance For 2054
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance` = 41 WHERE `entry` = 1736 AND `item` = 2798;

-- Remove Uneeded Zone Check (Object Only Exists In Barrens)
UPDATE `gameobject_loot_template` SET `condition_id` = 0 WHERE `entry` = 2626 AND `item` = 5075;
UPDATE `gameobject_loot_template` SET `condition_id` = 0 WHERE `entry` = 2627 AND `item` = 5075;

-- Increse Lesser Moonstone Drop Chance For 1734
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance` = 1 WHERE `entry` = 1506 AND `item` = 1705;

-- Correct Loot Template For 181109
UPDATE `gameobject_loot_template` SET `item` = 7910 WHERE `entry` = 17939 AND `item` = 1529;
UPDATE `gameobject_loot_template` SET `item` = 7909, `ChanceOrQuestChance` = 1 WHERE `entry` = 17939 AND `item` = 1705;
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance` = 40 WHERE `entry` = 17939 AND `item` = 11513;

-- Tainted Vitriol Does Not Drop From 1734
DELETE FROM `gameobject_loot_template` WHERE `entry` = 1506 AND `item` = 11513;

-- Tainted Vitriol Does Not Drop From 2040
DELETE FROM `gameobject_loot_template` WHERE `entry` = 1742 AND `item` = 11513;

-- Tainted Vitriol Does Not Drop From 2047
DELETE FROM `gameobject_loot_template` WHERE `entry` = 5045 AND `item` = 11513;

-- Tainted Vitriol Does Not Drop From 324
DELETE FROM `gameobject_loot_template` WHERE `entry` = 9597 AND `item` = 11513;

-- Reduce Tainted Vitriol Drop Chance For 176645
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance` = 40 WHERE `entry` = 13961 AND `item` = 11513;

-- Reduce Tainted Vitriol Drop Chance For 181108
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance` = 40 WHERE `entry` = 17938 AND `item` = 11513;

-- Reduce Tainted Vitriol Drop Chance For 176643
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance` = 40 WHERE `entry` = 13960 AND `item` = 11513;

-- Remove Uneeded Zone Check (Object Only Exists In Felwood)
UPDATE `gameobject_loot_template` SET `condition_id` = 1 WHERE `entry` = 17939 AND `item` = 11513;
UPDATE `gameobject_loot_template` SET `condition_id` = 1 WHERE `entry` = 13961 AND `item` = 11513;
UPDATE `gameobject_loot_template` SET `condition_id` = 1 WHERE `entry` = 17938 AND `item` = 11513;
UPDATE `gameobject_loot_template` SET `condition_id` = 1 WHERE `entry` = 13960 AND `item` = 11513;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
