DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250504105856');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250504105856');
-- Add your query below.


-- Wetlands
SET @GGUID = 1064;
SET @PTEMPLATE = 1167;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1732, 0, -3571.635986328125, -3279.060546875, 38.97162246704101562, 1.221729278564453125, 0, 0, 0.573575973510742187, 0.819152355194091796, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1733, 0, -3571.635986328125, -3279.060546875, 38.97162246704101562, 1.221729278564453125, 0, 0, 0.573575973510742187, 0.819152355194091796, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Tin Vein / Silver Vein - Wetlands', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 95, 'Tin Vein / Silver Vein - Wetlands', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+0, 5, 'Tin Vein / Silver Vein - Wetlands', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 1348, 0, 'Wetlands - Tin Vein / Silver Vein', 0);

-- Silverpine
SET @GGUID = 1105;
SET @PTEMPLATE = 1178;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1732, 0, -225.326385498046875, 893.23223876953125, 94.25185394287109375, 2.565631866455078125, 0, 0, 0.958819389343261718, 0.284016460180282592, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1733, 0, -225.326385498046875, 893.23223876953125, 94.25185394287109375, 2.565631866455078125, 0, 0, 0.958819389343261718, 0.284016460180282592, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Tin Vein / Silver Vein - Silverpine Forest', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 95, 'Tin Vein / Silver Vein - Silverpine Forest', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+0, 5, 'Tin Vein / Silver Vein - Silverpine Forest', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 1354, 0, 'Silverpine Forest - Tin Vein / Silver Vein', 0);

-- Desolace
SET @GGUID = 1183;
SET @PTEMPLATE = 1187;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1732, 1, -413.72320556640625, 757.9171142578125, 113.2914962768554687, 1.308995485305786132, 0, 0, 0.608760833740234375, 0.793353796005249023, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1733, 1, -413.72320556640625, 757.9171142578125, 113.2914962768554687, 1.308995485305786132, 0, 0, 0.608760833740234375, 0.793353796005249023, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Tin Vein / Silver Vein - Desolace', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 95, 'Tin Vein / Silver Vein - Desolace', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+0, 5, 'Tin Vein / Silver Vein - Desolace', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 9909, 0, 'Desolace - Tin Vein / Silver Vein', 0);

-- Stonetalon
SET @GGUID = 1754;
SET @PTEMPLATE = 1255;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1732, 1, 1481.7764892578125, 720.87286376953125, 148.8095703125, 4.293513298034667968, 0, 0, -0.8386697769165039, 0.544640243053436279, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1732, 1, 679.83184814453125, 1881.1009521484375, -1.40938794612884521, 6.230826377868652343, 0, 0, -0.02617645263671875, 0.999657332897186279, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 1733, 1, 1481.7764892578125, 720.87286376953125, 148.8095703125, 4.293513298034667968, 0, 0, -0.8386697769165039, 0.544640243053436279, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+3, 1733, 1, 679.83184814453125, 1881.1009521484375, -1.40938794612884521, 6.230826377868652343, 0, 0, -0.02617645263671875, 0.999657332897186279, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Tin Vein / Silver Vein - Stonetalon Mountains', 0, 0, 0, 10),
(@PTEMPLATE+1, 1, 'Tin Vein / Silver Vein - Stonetalon Mountains', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 95, 'Tin Vein / Silver Vein - Stonetalon Mountains', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+1, 95, 'Tin Vein / Silver Vein - Stonetalon Mountains', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+0, 5, 'Tin Vein / Silver Vein - Stonetalon Mountains', 0, 0, 10),
(@GGUID+3, @PTEMPLATE+1, 5, 'Tin Vein / Silver Vein - Stonetalon Mountains', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 1090, 0, 'Stonetalon Mountains - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+1, 1090, 0, 'Stonetalon Mountains - Tin Vein / Silver Vein', 0);

-- Ashenvale
SET @GGUID = 1767;
SET @PTEMPLATE = 1293;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1732, 1, 3098.744384765625, -629.2218017578125, 173.8267364501953125, 5.89921426773071289, 0, 0, -0.19080829620361328, 0.981627285480499267, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1732, 1, 2043.9332275390625, -328.77593994140625, 108.4703826904296875, 1.919861555099487304, 0, 0, 0.819151878356933593, 0.573576688766479492, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 1733, 1, 3098.744384765625, -629.2218017578125, 173.8267364501953125, 5.89921426773071289, 0, 0, -0.19080829620361328, 0.981627285480499267, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+3, 1733, 1, 2043.9332275390625, -328.77593994140625, 108.4703826904296875, 1.919861555099487304, 0, 0, 0.819151878356933593, 0.573576688766479492, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Tin Vein / Silver Vein - Ashenvale', 0, 0, 0, 10),
(@PTEMPLATE+1, 1, 'Tin Vein / Silver Vein - Ashenvale', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 95, 'Tin Vein / Silver Vein - Ashenvale', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+1, 95, 'Tin Vein / Silver Vein - Ashenvale', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+0, 5, 'Tin Vein / Silver Vein - Ashenvale', 0, 0, 10),
(@GGUID+3, @PTEMPLATE+1, 5, 'Tin Vein / Silver Vein - Ashenvale', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 1080, 0, 'Ashenvale - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+1, 1080, 0, 'Ashenvale - Tin Vein / Silver Vein', 0);

-- Thousand Needles
SET @GGUID = 1899;
SET @PTEMPLATE = 1382;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1732, 1, -5440.21875, -3940.542236328125, -55.2508735656738281, 3.52557229995727539, 0, 0, -0.98162651062011718, 0.190812408924102783, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1732, 1, -5343.9306640625, -3077.88720703125, -40.2967414855957031, 1.675513744354248046, 0, 0, 0.743144035339355468, 0.669131457805633544, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 1732, 1, -5962.87109375, -4360.095703125, -55.0374603271484375, 0.907570242881774902, 0, 0, 0.438370704650878906, 0.898794233798980712, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+3, 1733, 1, -5440.21875, -3940.542236328125, -55.2508735656738281, 3.52557229995727539, 0, 0, -0.98162651062011718, 0.190812408924102783, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+4, 1733, 1, -5343.9306640625, -3077.88720703125, -40.2967414855957031, 1.675513744354248046, 0, 0, 0.743144035339355468, 0.669131457805633544, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+5, 1733, 1, -5962.87109375, -4360.095703125, -55.0374603271484375, 0.907570242881774902, 0, 0, 0.438370704650878906, 0.898794233798980712, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Tin Vein / Silver Vein - Thousand Needles', 0, 0, 0, 10),
(@PTEMPLATE+1, 1, 'Tin Vein / Silver Vein - Thousand Needles', 0, 0, 0, 10),
(@PTEMPLATE+2, 1, 'Tin Vein / Silver Vein - Thousand Needles', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 95, 'Tin Vein / Silver Vein - Thousand Needles', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+1, 95, 'Tin Vein / Silver Vein - Thousand Needles', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+2, 95, 'Tin Vein / Silver Vein - Thousand Needles', 0, 0, 10),
(@GGUID+3, @PTEMPLATE+0, 5, 'Tin Vein / Silver Vein - Thousand Needles', 0, 0, 10),
(@GGUID+4, @PTEMPLATE+1, 5, 'Tin Vein / Silver Vein - Thousand Needles', 0, 0, 10),
(@GGUID+5, @PTEMPLATE+2, 5, 'Tin Vein / Silver Vein - Thousand Needles', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 1131, 0, 'Thousand Needles - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+1, 1131, 0, 'Thousand Needles - Tin Vein / Silver Vein', 0),
(@PTEMPLATE+2, 1131, 0, 'Thousand Needles - Tin Vein / Silver Vein', 0);

-- Boulderslide Cavern
SET @GGUID = 2018;
SET @PTEMPLATE = 1188;
UPDATE `pool_template` SET `max_limit` = 1 WHERE  `entry` = 1090;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1732, 1, -21.6052513122558593, 445.534088134765625, 103.657440185546875, 5.602506637573242187, 0, 0, -0.33380699157714843, 0.942641437053680419, 300, 900, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1733, 1, -21.6052513122558593, 445.534088134765625, 103.657440185546875, 5.602506637573242187, 0, 0, -0.33380699157714843, 0.942641437053680419, 300, 900, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Tin Vein / Silver Vein - Stonetalon Mountains - Boulderslide Cavern', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 95, 'Tin Vein / Silver Vein - Stonetalon Mountains - Boulderslide Cavern', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+0, 5, 'Tin Vein / Silver Vein - Stonetalon Mountains - Boulderslide Cavern', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 334, 0, 'Stonetalon Mountains - Boulderslide Cavern - Tin Vein / Silver Vein', 0);

-- Vul'Gol Ogre Mound
SET @GGUID = 2060;
SET @PTEMPLATE = 1195;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1732, 0, -11190.732421875, -154.594512939453125, 5.961926937103271484, 2.809975385665893554, 0, 0, 0.986285209655761718, 0.165049895644187927, 300, 900, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1733, 0, -11190.732421875, -154.594512939453125, 5.961926937103271484, 2.809975385665893554, 0, 0, 0.986285209655761718, 0.165049895644187927, 300, 900, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Tin Vein / Silver Vein - Duskwood - Vul\'Gol Ogre Mound', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 95, 'Tin Vein / Silver Vein - Duskwood - Vul\'Gol Ogre Mound', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+0, 5, 'Tin Vein / Silver Vein - Duskwood - Vul\'Gol Ogre Mound', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 266, 0, 'Duskwood - Vul\'Gol Ogre Mound - Tin Vein / Silver Vein', 0);

-- Windshear Mine
SET @GGUID = 2186;
SET @PTEMPLATE = 1201;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1732, 1, 877.40362548828125, -322.099517822265625, 15.46705341339111328, 4.607671737670898437, 0, 0, -0.74314403533935546, 0.669131457805633544, 300, 900, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1733, 1, 877.40362548828125, -322.099517822265625, 15.46705341339111328, 4.607671737670898437, 0, 0, -0.74314403533935546, 0.669131457805633544, 300, 900, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Tin Vein / Silver Vein - Stonetalon Mountains - Windshear Mine', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 95, 'Tin Vein / Silver Vein - Stonetalon Mountains - Windshear Mine', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+0, 5, 'Tin Vein / Silver Vein - Stonetalon Mountains - Windshear Mine', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 386, 0, 'Stonetalon Mountains - Windshear Mine - Tin Vein / Silver Vein', 0);

-- Rethban Caverns
SET @GGUID = 2202;
SET @PTEMPLATE = 1202;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 2054, 0, -8939.2158203125, -1966.7449951171875, 139.8206634521484375, 0.715584874153137207, 0, 0, 0.350207328796386718, 0.936672210693359375, 300, 900, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1733, 0, -8939.2158203125, -1966.7449951171875, 139.8206634521484375, 0.715584874153137207, 0, 0, 0.350207328796386718, 0.936672210693359375, 300, 900, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Tin Vein / Silver Vein - Redridge Mountains - Rethban Caverns', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 95, 'Tin Vein / Silver Vein - Redridge Mountains - Rethban Caverns', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+0, 5, 'Tin Vein / Silver Vein - Redridge Mountains - Rethban Caverns', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 8079, 0, 'Redridge Mountains - Rethban Caverns - Tin Vein / Silver Vein', 0);

-- Thousand Needles (should be tin/silver)
UPDATE `pool_template` SET `description`='Tin Vein / Silver Vein - Thousand Needles' WHERE  `entry`=17046;
DELETE FROM `gameobject` WHERE  `guid`=427043;
DELETE FROM `pool_gameobject` WHERE  `guid`=427043;
UPDATE `pool_gameobject` SET `chance`=95 WHERE  `guid`=427049;
UPDATE `pool_pool` SET `mother_pool`=1131 WHERE  `pool_id`=17046;
UPDATE `gameobject` SET `id`=1732 WHERE  `guid`=427049;
UPDATE `gameobject` SET `id`=1733 WHERE  `guid`=427046;
UPDATE `pool_gameobject` SET `description`='Tin Vein / Silver Vein - Thousand Needles' WHERE  `guid`=427046;
UPDATE `pool_gameobject` SET `description`='Tin Vein / Silver Vein - Thousand Needles' WHERE  `guid`=427049;
UPDATE `pool_pool` SET `description`='Thousand Needles - Tin Vein / Silver Vein' WHERE  `pool_id`=17046;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
