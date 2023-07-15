DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230715204759');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230715204759');
-- Add your query below.


-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Darkmoon Faire
-- Missing Darkmoon Faire Banner spawns in Mulgore.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(3124, 179965, 1, -1308.96, 70.7016, 128.84, 5.67232, 0, 0, -0.300705, 0.953717, 25, 25, 1, 100, 4, 10), -- Closest existing guid is 3123 at 226.183655 yards.
(3125, 179965, 1, -1298.27, 104.962, 131.219, 0.331611, 0, 0, 0.165047, 0.986286, 25, 25, 1, 100, 4, 10); -- Closest existing guid is 3123 at 223.126831 yards.

-- Correct position of Cannon Target in Elwynn Forest (position is off by 2.20151 yards).
UPDATE `gameobject` SET `position_x`=-9503.83, `position_y`=-373.21, `position_z`=57.7377, `orientation`=0.314158, `rotation0`=0, `rotation1`=0, `rotation2`=0.156434, `rotation3`=0.987688 WHERE `guid`=12992;

-- Missing Cannon Target spawns in Mulgore.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(3995982, 180573, 1, -2183.33, -250.843, -14.9857, 4.93928, 0, 0, -0.622514, 0.782609, 25, 25, 1, 100, 6, 10); -- Closest existing guid is 3995981 at 242.836166 yards.

DELETE FROM `gameobject` WHERE `guid` = 3995981;
DELETE FROM `game_event_gameobject`  WHERE `guid` = 3995981;

INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES
(3124, 5),
(3125, 5),
(3995982, 5);

-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Fireworks
-- Missing Cheer Speaker spawns in Teldrassil.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(365323, 180749, 1, 8590.17, 1013.61, 5.25628, 5.44543, 0, 0, -0.406736, 0.913546, 120, 120, 1, 100, 6, 10); -- Closest existing guid is 365319 at 108.983604 yards.

INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES
(365323, 6);

-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Lunar Festival
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(662, 1, 'Firecrackers', 0, 0, 7, 10);
UPDATE `gameobject` SET `spawntimesecsmin` = 10, `spawntimesecsmax` = 10 WHERE `id` IN (180763, 180764, 180870, 180871, 180872, 180873);

SET @OGUID = 47208;
SET @PTEMPLATE = 4251;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 180763, 0, -8760.69, 1068.68, 92.3914, 3.07177, 0, 0, 0.999391, 0.0349061, 10, 10, 100, 1, 0, 0, 7, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES 
(@OGUID+1, 463, 'Firecrackers', 7, 10);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES
(@OGUID+1, 7);

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+2, 180763, 0, -8734.83, 1076.31, 92.3113, 0.541051, 0, 0, 0.267238, 0.963631, 10, 10, 100, 1, 0, 0, 7, 10),
(@OGUID+3, 180764, 0, -8734.83, 1076.31, 92.3113, 0.541051, 0, 0, 0.267238, 0.963631, 10, 10, 100, 1, 0, 0, 7, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES 
(@OGUID+2, 464, 'Firecrackers', 7, 10),
(@OGUID+3, 464, 'Firecrackers', 7, 10);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES
(@OGUID+2, 7),
(@OGUID+3, 7);

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+4, 180764, 0, -4677.99, -959.548, 503.617, 0.314158, 0, 0, 0.156434, 0.987688, 10, 10, 100, 1, 0, 0, 7, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES 
(@OGUID+4, 465, 'Firecrackers', 7, 10);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES
(@OGUID+4, 7);

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+5, 180764, 0, -4669.9, -941.939, 503.624, 5.21854, 0, 0, -0.507538, 0.861629, 10, 10, 100, 1, 0, 0, 7, 10),
(@OGUID+6, 180763, 0, -4669.9, -941.939, 503.624, 5.21854, 0, 0, -0.507538, 0.861629, 10, 10, 100, 1, 0, 0, 7, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES 
(@OGUID+5, 466, 'Firecrackers', 7, 10),
(@OGUID+6, 466, 'Firecrackers', 7, 10);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES
(@OGUID+5, 7),
(@OGUID+6, 7);

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+7, 180763, 1, -1024.76, -237.99, 160.384, 1.95477, 0, 0, 0.829038, 0.559193, 10, 10, 100, 1, 0, 0, 7, 10),
(@OGUID+8, 180764, 1, -1024.76, -237.99, 160.384, 1.95477, 0, 0, 0.829038, 0.559193, 10, 10, 100, 1, 0, 0, 7, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Lunar Festival - Moonglade Lanterns', 7, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES 
(@OGUID+7, @PTEMPLATE+1, 'Firecrackers', 7, 10),
(@OGUID+8, @PTEMPLATE+1, 'Firecrackers', 7, 10);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES
(@OGUID+7, 7),
(@OGUID+8, 7);

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+9, 180764, 1, 10149.7, 2592.52, 1332.08, 3.35105, 0, 0, -0.994521, 0.104536, 10, 10, 100, 1, 0, 0, 7, 10),
(@OGUID+10, 180763, 1, 10149.7, 2592.52, 1332.08, 3.35105, 0, 0, -0.994521, 0.104536, 10, 10, 100, 1, 0, 0, 7, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+2, 1, 'Lunar Festival - Moonglade Lanterns', 7, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES 
(@OGUID+9, @PTEMPLATE+2, 'Firecrackers', 7, 10),
(@OGUID+10, @PTEMPLATE+2, 'Firecrackers', 7, 10);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES
(@OGUID+9, 7),
(@OGUID+10, 7);

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+11, 180773, 0, -5020.66, -834.843, 515.468, 2.25147, 0, 0, 0.902585, 0.430512, 120, 120, 100, 1, 0, 0, 7, 10);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES
(@OGUID+11, 7);

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+12, 180764, 0, -8760.69, 1068.68, 92.3914, 3.07177, 0, 0, 0.999391, 0.0349061, 10, 10, 100, 1, 0, 0, 7, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES 
(@OGUID+12, 463, 'Firecrackers', 7, 10);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES
(@OGUID+12, 7);

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+13, 180763, 0, -4677.99, -959.548, 503.617, 0.314158, 0, 0, 0.156434, 0.987688, 10, 10, 100, 1, 0, 0, 7, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES 
(@OGUID+13, 465, 'Firecrackers', 7, 10);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES
(@OGUID+13, 7);

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+14, 180763, 1, 10141.8, 2600.27, 1332.35, 0.296705, 0, 0, 0.147809, 0.989016, 10, 10, 100, 1, 0, 0, 7, 10),
(@OGUID+15, 180764, 1, 10141.8, 2600.27, 1332.35, 0.296705, 0, 0, 0.147809, 0.989016, 10, 10, 100, 1, 0, 0, 7, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES 
(@OGUID+14, @PTEMPLATE+3, 'Firecrackers', 7, 10),
(@OGUID+15, @PTEMPLATE+3, 'Firecrackers', 7, 10);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES
(@OGUID+14, 7),
(@OGUID+15, 7);

UPDATE `gameobject` SET `map` = 1 WHERE `guid` IN (10321, 10314, 10307, 10300);
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Hallows End
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+16, 180471, 0, -12443.3, 216.361, 8.26588, 4.10153, 0, 0, -0.887011, 0.461749, 120, 120, 100, 1, 0, 0, 6, 10);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES
(@OGUID+16, 12);
UPDATE `gameobject` SET `spawntimesecsmin` = 120, `spawntimesecsmax` = 120, `animprogress` = 100 WHERE `id` = 180471;

-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Scourge Invasion
UPDATE `gameobject` SET `position_x`=-5122.8, `position_y`=-697.666, `position_z`=505.467, `orientation`=0.0349062, `rotation0`=0, `rotation1`=0, `rotation2`=0.0174522, `rotation3`=0.999848 WHERE `guid`=67003;

-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Post Firework Toasting Goblets
SET @OGUID = 55703;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 180754, 1, -1456.71, -39.4583, 158.845, 1.20428, 0, 0, 0.566406, 0.824126, 120, 120, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 180754, 1, -1455.85, -39.0256, 158.857, 2.84488, 0, 0, 0.989016, 0.147811, 120, 120, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 180754, 1, -1455.49, -40.2395, 158.84, 2.54818, 0, 0, 0.956305, 0.292372, 120, 120, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 180754, 1, -1455.1, -38.9667, 158.87, 2.04204, 0, 0, 0.85264, 0.522499, 120, 120, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 180754, 1, -1454.77, -39.7512, 158.851, 2.49582, 0, 0, 0.948323, 0.317306, 120, 120, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 180754, 1, -1321.81, 105.21, 132.429, 0.95993, 0, 0, 0.461748, 0.887011, 120, 120, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 180754, 1, -1321.63, 101.779, 132.429, 1.06465, 0, 0, 0.507538, 0.861629, 120, 120, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 180754, 1, -1321.45, 104.02, 132.436, 1.83259, 0, 0, 0.793353, 0.608762, 120, 120, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 180754, 1, -1321.17, 102.467, 132.429, 3.83973, 0, 0, -0.939692, 0.34202, 120, 120, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 180754, 1, -1320.67, 101.221, 132.443, 1.44862, 0, 0, 0.66262, 0.748956, 120, 120, 100, 1, 0, 0, 0, 10),
(@OGUID+11, 180754, 1, -1320.46, 103.922, 132.457, 0.418879, 0, 0, 0.207911, 0.978148, 120, 120, 100, 1, 0, 0, 0, 10),
(@OGUID+12, 180754, 1, -1320.34, 102.538, 132.422, 5.74214, 0, 0, -0.267238, 0.963631, 120, 120, 100, 1, 0, 0, 0, 10),
(@OGUID+13, 180754, 1, -1320.16, 105.306, 132.443, 3.47321, 0, 0, -0.986285, 0.16505, 120, 120, 100, 1, 0, 0, 0, 10),
(@OGUID+14, 180754, 1, -1320.12, 104.528, 132.436, 3.42085, 0, 0, -0.990268, 0.139175, 120, 120, 100, 1, 0, 0, 0, 10),
(@OGUID+15, 180754, 1, -1320.07, 101.056, 132.443, 4.62512, 0, 0, -0.737277, 0.675591, 120, 120, 100, 1, 0, 0, 0, 10),
(@OGUID+16, 180754, 1, -1217.19, -89.9486, 162.9, 0.296705, 0, 0, 0.147809, 0.989016, 120, 120, 100, 1, 0, 0, 0, 10),
(@OGUID+17, 180754, 1, -1217.02, -88.968, 162.903, 1.3439, 0, 0, 0.622514, 0.782609, 120, 120, 100, 1, 0, 0, 0, 10),
(@OGUID+18, 180754, 1, -1216.53, -90.4129, 162.9, 5.13127, 0, 0, -0.544639, 0.838671, 120, 120, 100, 1, 0, 0, 0, 10),
(@OGUID+19, 180754, 1, -1216.25, -88.8155, 162.907, 2.74016, 0, 0, 0.979924, 0.19937, 120, 120, 100, 1, 0, 0, 0, 10),
(@OGUID+20, 180754, 1, -1215.59, -89.9309, 162.923, 2.09439, 0, 0, 0.866025, 0.500001, 120, 120, 100, 1, 0, 0, 0, 10),
(@OGUID+21, 180754, 1, -1215.57, -89.0477, 162.903, 5.81195, 0, 0, -0.233445, 0.97237, 120, 120, 100, 1, 0, 0, 0, 10),
(@OGUID+22, 180754, 1, -1209.31, -90.6418, 162.86, 5.67232, 0, 0, -0.300705, 0.953717, 120, 120, 100, 1, 0, 0, 0, 10),
(@OGUID+23, 180754, 1, -1208.9, -91.6519, 162.863, 5.74214, 0, 0, -0.267238, 0.963631, 120, 120, 100, 1, 0, 0, 0, 10),
(@OGUID+24, 180754, 1, -1208.52, -90.7337, 162.866, 5.81195, 0, 0, -0.233445, 0.97237, 120, 120, 100, 1, 0, 0, 0, 10),
(@OGUID+25, 180754, 1, -1208.08, -89.9221, 162.878, 4.79966, 0, 0, -0.67559, 0.737278, 120, 120, 100, 1, 0, 0, 0, 10),
(@OGUID+26, 180754, 1, -1207.98, -91.8775, 162.874, 3.12412, 0, 0, 0.999962, 0.00873464, 120, 120, 100, 1, 0, 0, 0, 10),
(@OGUID+27, 180754, 1, -1207.59, -90.6434, 162.875, 0.418879, 0, 0, 0.207911, 0.978148, 120, 120, 100, 1, 0, 0, 0, 10),
(@OGUID+28, 180754, 1, -1201.6, -90.0652, 163.142, 2.72271, 0, 0, 0.978148, 0.207912, 120, 120, 100, 1, 0, 0, 0, 10),
(@OGUID+29, 180754, 1, -1200.95, -90.8516, 163.158, 6.24828, 0, 0, -0.0174522, 0.999848, 120, 120, 100, 1, 0, 0, 0, 10),
(@OGUID+30, 180754, 1, -1200.66, -89.2177, 163.138, 0.628317, 0, 0, 0.309016, 0.951057, 120, 120, 100, 1, 0, 0, 0, 10),
(@OGUID+31, 180754, 1, -1199.95, -89.5551, 163.152, 2.3911, 0, 0, 0.930417, 0.366502, 120, 120, 100, 1, 0, 0, 0, 10),
(@OGUID+32, 180754, 1, -1199.79, -90.5481, 163.134, 3.50812, 0, 0, -0.983254, 0.182238, 120, 120, 100, 1, 0, 0, 0, 10),
(@OGUID+33, 180754, 1, 8587.59, 1010.29, 6.33336, 5.95157, 0, 0, -0.165047, 0.986286, 120, 120, 100, 1, 0, 0, 0, 10),
(@OGUID+34, 180754, 1, 8587.78, 1011.42, 6.31071, 2.79252, 0, 0, 0.984807, 0.173652, 120, 120, 100, 1, 0, 0, 0, 10),
(@OGUID+35, 180754, 1, 8588.37, 1010.7, 6.3177, 4.92183, 0, 0, -0.62932, 0.777146, 120, 120, 100, 1, 0, 0, 0, 10),
(@OGUID+36, 180754, 1, 8588.86, 1010, 6.33269, 0.925024, 0, 0, 0.446198, 0.894935, 120, 120, 100, 1, 0, 0, 0, 10),
(@OGUID+37, 180754, 1, 8589.02, 1011.21, 6.30349, 5.67232, 0, 0, -0.300705, 0.953717, 120, 120, 100, 1, 0, 0, 0, 10);

INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES
(@OGUID+1, 39),
(@OGUID+2, 39),
(@OGUID+3, 39),
(@OGUID+4, 39),
(@OGUID+5, 39),
(@OGUID+6, 39),
(@OGUID+7, 39),
(@OGUID+8, 39),
(@OGUID+9, 39),
(@OGUID+10, 39),
(@OGUID+11, 39),
(@OGUID+12, 39),
(@OGUID+13, 39),
(@OGUID+14, 39),
(@OGUID+15, 39),
(@OGUID+16, 39),
(@OGUID+17, 39),
(@OGUID+18, 39),
(@OGUID+19, 39),
(@OGUID+20, 39),
(@OGUID+21, 39),
(@OGUID+22, 39),
(@OGUID+23, 39),
(@OGUID+24, 39),
(@OGUID+25, 39),
(@OGUID+26, 39),
(@OGUID+27, 39),
(@OGUID+28, 39),
(@OGUID+29, 39),
(@OGUID+30, 39),
(@OGUID+31, 39),
(@OGUID+32, 39),
(@OGUID+33, 39),
(@OGUID+34, 39),
(@OGUID+35, 39),
(@OGUID+36, 39),
(@OGUID+37, 39);

UPDATE `gameobject` SET `spawntimesecsmin` = 10, `spawntimesecsmax` = 10, `animprogress` = 100 WHERE `id` IN (180754, 180905);

-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- New Years Eve
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+38, 180700, 0, 1925.34, 257.455, 48.8972, 5.28835, 0, 0, -0.477159, 0.878817, 120, 120, 100, 1, 0, 0, 0, 10);

INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES
(@OGUID+38, 34),
(@OGUID+38, 38);

-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Event PVP Silithus
-- Missing Silithyst Geyser spawns in Silithus.
SET @OGUID = 57490;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 181598, 1, -6448.94, 1345.23, 3.04718, 2.23402, 0, 0, 0.898793, 0.438373, 180, 180, 1, 100, 10, 10), -- Closest existing guid is 49340 at 201.083466 yards.
(@OGUID+2, 181598, 1, -6576.1, 1324.81, 4.78865, 0.645772, 0, 0, 0.317305, 0.948324, 180, 180, 1, 100, 10, 10), -- Closest existing guid is 49345 at 88.992516 yards.
(@OGUID+3, 181598, 1, -7348.31, 348.449, 10.0677, 3.99681, 0, 0, -0.909961, 0.414694, 180, 180, 1, 100, 10, 10), -- Closest existing guid is 49350 at 107.414352 yards.
(@OGUID+4, 181598, 1, -7222.17, 954.327, 3.92101, 5.11382, 0, 0, -0.551936, 0.833886, 180, 180, 1, 100, 10, 10), -- Closest existing guid is 49343 at 194.487976 yards.
(@OGUID+5, 181598, 1, -6933.7, 1045.84, 1.90702, 2.74016, 0, 0, 0.979924, 0.19937, 180, 180, 1, 100, 10, 10), -- Closest existing guid is 49336 at 232.554733 yards.
(@OGUID+6, 181598, 1, -6990.93, 315.349, 2.8231, 0.471238, 0, 0, 0.233445, 0.97237, 180, 180, 1, 100, 10, 10), -- Closest existing guid is 49351 at 236.910706 yards.
(@OGUID+7, 181598, 1, -6566.02, 1214.98, 2.02324, 2.44346, 0, 0, 0.939692, 0.34202, 180, 180, 1, 100, 10, 10), -- Closest existing guid is 49345 at 109.123512 yards.
(@OGUID+8, 181598, 1, -7923.45, 1241.1, -2.82965, 3.15906, 0, 0, -0.999962, 0.00873464, 180, 180, 1, 100, 10, 10), -- Closest existing guid is 49344 at 105.111595 yards.
(@OGUID+9, 181598, 1, -7900.99, 1057.31, 1.10137, 2.68781, 0, 0, 0.97437, 0.224951, 180, 180, 1, 100, 10, 10), -- Closest existing guid is 49344 at 140.629883 yards.
(@OGUID+10, 181598, 1, -7150.96, 662.697, 11.7404, 4.34587, 0, 0, -0.824126, 0.566406, 180, 180, 1, 100, 10, 10), -- Closest existing guid is 49343 at 118.382813 yards.
(@OGUID+11, 181598, 1, -7084.57, 458.54, 2.37607, 3.56047, 0, 0, -0.978148, 0.207912, 180, 180, 1, 100, 10, 10), -- Closest existing guid is 49351 at 65.885979 yards.
(@OGUID+12, 181598, 1, -7751.31, 1582.35, -0.980123, 5.46288, 0, 0, -0.398748, 0.91706, 180, 180, 1, 100, 10, 10), -- Closest existing guid is 49337 at 106.032791 yards.
(@OGUID+13, 181598, 1, -7780.33, 1747.64, 0.851937, 4.13643, 0, 0, -0.878817, 0.47716, 180, 180, 1, 100, 10, 10), -- Closest existing guid is 49338 at 94.554810 yards.
(@OGUID+14, 181598, 1, -6715.63, 1013.58, 3.91696, 1.01229, 0, 0, 0.484809, 0.87462, 180, 180, 1, 100, 10, 10), -- Closest existing guid is 49340 at 272.484802 yards.
(@OGUID+15, 181598, 1, -6684.63, 1161.98, 2.45525, 5.18363, 0, 0, -0.522498, 0.85264, 180, 180, 1, 100, 10, 10), -- Closest existing guid is 49345 at 122.596489 yards.
(@OGUID+16, 181598, 1, -6586.35, 1086.76, 3.60263, 3.68265, 0, 0, -0.96363, 0.267241, 180, 180, 1, 100, 10, 10), -- Closest existing guid is 49340 at 123.938187 yards.
(@OGUID+17, 181598, 1, -7834.21, 1095.89, 4.26499, 4.79966, 0, 0, -0.67559, 0.737278, 180, 180, 1, 100, 10, 10), -- Closest existing guid is 49344 at 86.537560 yards.
(@OGUID+18, 181598, 1, -7946.98, 1742.17, -2.99056, 1.67551, 0, 0, 0.743144, 0.669131, 180, 180, 1, 100, 10, 10), -- Closest existing guid is 49338 at 119.552399 yards.
(@OGUID+19, 181598, 1, -7949.14, 1941.53, 6.34631, 4.43314, 0, 0, -0.798635, 0.601815, 180, 180, 1, 100, 10, 10), -- Closest existing guid is 49342 at 140.649551 yards.
(@OGUID+20, 181598, 1, -7042.22, 887.93, 8.64065, 6.24828, 0, 0, -0.0174522, 0.999848, 180, 180, 1, 100, 10, 10), -- Closest existing guid is 49336 at 77.460327 yards.
(@OGUID+21, 181598, 1, -7942.18, 990.718, 3.73395, 0.645772, 0, 0, 0.317305, 0.948324, 180, 180, 1, 100, 10, 10), -- Closest existing guid is 49346 at 154.215714 yards.
(@OGUID+22, 181598, 1, -7958.16, 926.969, 1.57018, 0.244346, 0, 0, 0.121869, 0.992546, 180, 180, 1, 100, 10, 10), -- Closest existing guid is 49346 at 93.156364 yards.
(@OGUID+23, 181598, 1, -6684.59, 1440.77, 1.66227, 0.0698117, 0, 0, 0.0348988, 0.999391, 180, 180, 1, 100, 10, 10), -- Closest existing guid is 49345 at 163.364960 yards.
(@OGUID+24, 181598, 1, -6784.92, 1371.87, 2.09836, 2.42601, 0, 0, 0.936672, 0.350207, 180, 180, 1, 100, 10, 10), -- Closest existing guid is 49347 at 109.774826 yards.
(@OGUID+25, 181598, 1, -7518.23, 1208.2, 0.012321, 0.104719, 0, 0, 0.0523357, 0.99863, 180, 180, 1, 100, 10, 10), -- Closest existing guid is 49339 at 242.870178 yards.
(@OGUID+26, 181598, 1, -7626.45, 1562.61, 7.87493, 2.9845, 0, 0, 0.996917, 0.0784664, 180, 180, 1, 100, 10, 10); -- Closest existing guid is 49339 at 187.061264 yards.

-- Create new pool to hold Silithyst Geyser spawns in Silithus.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(76, 19, 'Silithyst Geysers in Silithus', 10, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject_template` (`id`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(181598, 76, 0, 'Silithyst Geyser', 10, 10);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
