DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250614164145');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250614164145');
-- Add your query below.


-- Small Thorium
-- Winterspring
SET @GGUID = 6272;
SET @PTEMPLATE = 3228;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 2047, 1, 4318.47, -4450.98, 912.71, 0.244346, 0, 0, 0.121869, 0.992546, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 2047, 1, 4401.49, -4176.44, 959.534, 4.25861, 0, 0, -0.848047, 0.529921, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 2047, 1, 4704.32, -4937.17, 909.331, 4.34587, 0, 0, -0.824126, 0.566406, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+3, 2047, 1, 4990.41, -4837.05, 901.471, 4.08407, 0, 0, -0.891006, 0.453991, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+4, 2047, 1, 5354.3, -4447.26, 842.925, 0.366518, 0, 0, 0.182235, 0.983255, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+5, 2047, 1, 5580.27, -4585.89, 781.276, 4.72984, 0, 0, -0.700909, 0.713251, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+6, 2047, 1, 5971.84, -4629.53, 720.941, 5.60251, 0, 0, -0.333807, 0.942641, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+7, 2047, 1, 6897.81, -4905.29, 711.166, 0.366518, 0, 0, 0.182235, 0.983255, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+8, 2047, 1, 7200.86, -5050.07, 743.897, 0.087266, 0, 0, 0.0436192, 0.999048, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+9, 2047, 1, 7576.3, -3825.8, 697.371, 1.09956, 0, 0, 0.522498, 0.85264, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+10, 324, 1, 4318.47, -4450.98, 912.71, 0.244346, 0, 0, 0.121869, 0.992546, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+11, 324, 1, 4401.49, -4176.44, 959.534, 4.25861, 0, 0, -0.848047, 0.529921, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+12, 324, 1, 4704.32, -4937.17, 909.331, 4.34587, 0, 0, -0.824126, 0.566406, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+13, 324, 1, 4990.41, -4837.05, 901.471, 4.08407, 0, 0, -0.891006, 0.453991, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+14, 324, 1, 5354.3, -4447.26, 842.925, 0.366518, 0, 0, 0.182235, 0.983255, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+15, 324, 1, 5580.27, -4585.89, 781.276, 4.72984, 0, 0, -0.700909, 0.713251, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+16, 324, 1, 5971.84, -4629.53, 720.941, 5.60251, 0, 0, -0.333807, 0.942641, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+17, 324, 1, 6897.81, -4905.29, 711.166, 0.366518, 0, 0, 0.182235, 0.983255, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+18, 324, 1, 7200.86, -5050.07, 743.897, 0.087266, 0, 0, 0.0436192, 0.999048, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+19, 324, 1, 7576.3, -3825.8, 697.371, 1.09956, 0, 0, 0.522498, 0.85264, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Truesilver Deposit / Small Thorium Vein - Winterspring', 0, 0, 0, 10),
(@PTEMPLATE+1, 1, 'Truesilver Deposit / Small Thorium Vein - Winterspring', 0, 0, 0, 10),
(@PTEMPLATE+2, 1, 'Truesilver Deposit / Small Thorium Vein - Winterspring', 0, 0, 0, 10),
(@PTEMPLATE+3, 1, 'Truesilver Deposit / Small Thorium Vein - Winterspring', 0, 0, 0, 10),
(@PTEMPLATE+4, 1, 'Truesilver Deposit / Small Thorium Vein - Winterspring', 0, 0, 0, 10),
(@PTEMPLATE+5, 1, 'Truesilver Deposit / Small Thorium Vein - Winterspring', 0, 0, 0, 10),
(@PTEMPLATE+6, 1, 'Truesilver Deposit / Small Thorium Vein - Winterspring', 0, 0, 0, 10),
(@PTEMPLATE+7, 1, 'Truesilver Deposit / Small Thorium Vein - Winterspring', 0, 0, 0, 10),
(@PTEMPLATE+8, 1, 'Truesilver Deposit / Small Thorium Vein - Winterspring', 0, 0, 0, 10),
(@PTEMPLATE+9, 1, 'Truesilver Deposit / Small Thorium Vein - Winterspring', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 5, 'Truesilver Deposit / Small Thorium Vein - Winterspring', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+1, 5, 'Truesilver Deposit / Small Thorium Vein - Winterspring', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+2, 5, 'Truesilver Deposit / Small Thorium Vein - Winterspring', 0, 0, 10),
(@GGUID+3, @PTEMPLATE+3, 5, 'Truesilver Deposit / Small Thorium Vein - Winterspring', 0, 0, 10),
(@GGUID+4, @PTEMPLATE+4, 5, 'Truesilver Deposit / Small Thorium Vein - Winterspring', 0, 0, 10),
(@GGUID+5, @PTEMPLATE+5, 5, 'Truesilver Deposit / Small Thorium Vein - Winterspring', 0, 0, 10),
(@GGUID+6, @PTEMPLATE+6, 5, 'Truesilver Deposit / Small Thorium Vein - Winterspring', 0, 0, 10),
(@GGUID+7, @PTEMPLATE+7, 5, 'Truesilver Deposit / Small Thorium Vein - Winterspring', 0, 0, 10),
(@GGUID+8, @PTEMPLATE+8, 5, 'Truesilver Deposit / Small Thorium Vein - Winterspring', 0, 0, 10),
(@GGUID+9, @PTEMPLATE+9, 5, 'Truesilver Deposit / Small Thorium Vein - Winterspring', 0, 0, 10),
(@GGUID+10, @PTEMPLATE+0, 95, 'Truesilver Deposit / Small Thorium Vein - Winterspring', 0, 0, 10),
(@GGUID+11, @PTEMPLATE+1, 95, 'Truesilver Deposit / Small Thorium Vein - Winterspring', 0, 0, 10),
(@GGUID+12, @PTEMPLATE+2, 95, 'Truesilver Deposit / Small Thorium Vein - Winterspring', 0, 0, 10),
(@GGUID+13, @PTEMPLATE+3, 95, 'Truesilver Deposit / Small Thorium Vein - Winterspring', 0, 0, 10),
(@GGUID+14, @PTEMPLATE+4, 95, 'Truesilver Deposit / Small Thorium Vein - Winterspring', 0, 0, 10),
(@GGUID+15, @PTEMPLATE+5, 95, 'Truesilver Deposit / Small Thorium Vein - Winterspring', 0, 0, 10),
(@GGUID+16, @PTEMPLATE+6, 95, 'Truesilver Deposit / Small Thorium Vein - Winterspring', 0, 0, 10),
(@GGUID+17, @PTEMPLATE+7, 95, 'Truesilver Deposit / Small Thorium Vein - Winterspring', 0, 0, 10),
(@GGUID+18, @PTEMPLATE+8, 95, 'Truesilver Deposit / Small Thorium Vein - Winterspring', 0, 0, 10),
(@GGUID+19, @PTEMPLATE+9, 95, 'Truesilver Deposit / Small Thorium Vein - Winterspring', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 1233, 0, 'Winterspring - Truesilver Deposit / Small Thorium Vein', 0),
(@PTEMPLATE+1, 1233, 0, 'Winterspring - Truesilver Deposit / Small Thorium Vein', 0),
(@PTEMPLATE+2, 1233, 0, 'Winterspring - Truesilver Deposit / Small Thorium Vein', 0),
(@PTEMPLATE+3, 1233, 0, 'Winterspring - Truesilver Deposit / Small Thorium Vein', 0),
(@PTEMPLATE+4, 1233, 0, 'Winterspring - Truesilver Deposit / Small Thorium Vein', 0),
(@PTEMPLATE+5, 1233, 0, 'Winterspring - Truesilver Deposit / Small Thorium Vein', 0),
(@PTEMPLATE+6, 1233, 0, 'Winterspring - Truesilver Deposit / Small Thorium Vein', 0),
(@PTEMPLATE+7, 1233, 0, 'Winterspring - Truesilver Deposit / Small Thorium Vein', 0),
(@PTEMPLATE+8, 1233, 0, 'Winterspring - Truesilver Deposit / Small Thorium Vein', 0),
(@PTEMPLATE+9, 1233, 0, 'Winterspring - Truesilver Deposit / Small Thorium Vein', 0);

-- Ice Thistle Hill
SET @GGUID = 2930;
SET @PTEMPLATE = 3098;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 2047, 1, 6554.83, -5217.15, 763.636, 1.58825, 0, 0, 0.71325, 0.70091, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 2047, 1, 6593.73, -5284.18, 754.336, 0.872664, 0, 0, 0.422618, 0.906308, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 324, 1, 6554.83, -5217.15, 763.636, 1.58825, 0, 0, 0.71325, 0.70091, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+3, 324, 1, 6593.73, -5284.18, 754.336, 0.872664, 0, 0, 0.422618, 0.906308, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Truesilver Deposit / Small Thorium Vein - Winterspring - Ice Thistle Hills', 0, 0, 0, 10),
(@PTEMPLATE+1, 1, 'Truesilver Deposit / Small Thorium Vein - Winterspring - Ice Thistle Hills', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 5, 'Truesilver Deposit / Small Thorium Vein - Winterspring - Ice Thistle Hills', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+1, 5, 'Truesilver Deposit / Small Thorium Vein - Winterspring - Ice Thistle Hills', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+0, 95, 'Truesilver Deposit / Small Thorium Vein - Winterspring - Ice Thistle Hills', 0, 0, 10),
(@GGUID+3, @PTEMPLATE+1, 95, 'Truesilver Deposit / Small Thorium Vein - Winterspring - Ice Thistle Hills', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 8122, 0, 'Winterspring - Ice Thistle Hills - Truesilver Deposit / Small Thorium Vein', 0),
(@PTEMPLATE+1, 8122, 0, 'Winterspring - Ice Thistle Hills - Truesilver Deposit / Small Thorium Vein', 0);

-- Felwood
SET @GGUID = 3021;
SET @PTEMPLATE = 3100;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 181108, 1, 3616.17, -914.92, 306.257, -0.959931, 0, 0, 0.461749, -0.887011, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 181108, 1, 3909.28, -819.98, 326.803, 0.506145, 0, 0, 0.25038, 0.968148, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 176643, 1, 3616.17, -914.92, 306.257, -0.959931, 0, 0, 0.461749, -0.887011, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+3, 176643, 1, 3909.28, -819.98, 326.803, 0.506145, 0, 0, 0.25038, 0.968148, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Truesilver Deposit / Small Thorium Vein - Felwood', 0, 0, 0, 10),
(@PTEMPLATE+1, 1, 'Truesilver Deposit / Small Thorium Vein - Felwood', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 5, 'Truesilver Deposit / Small Thorium Vein - Felwood', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+1, 5, 'Truesilver Deposit / Small Thorium Vein - Felwood', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+0, 95, 'Truesilver Deposit / Small Thorium Vein - Felwood', 0, 0, 10),
(@GGUID+3, @PTEMPLATE+1, 95, 'Truesilver Deposit / Small Thorium Vein - Felwood', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 1232, 0, 'Felwood - Truesilver Deposit / Small Thorium Vein', 0),
(@PTEMPLATE+1, 1232, 0, 'Felwood - Truesilver Deposit / Small Thorium Vein', 0);

-- Garrison
SET @GGUID = 3116;
SET @PTEMPLATE = 3104;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 150081, 0, -10776.8, -3546.58, -27.8987, 4.39823, 0, 0, -0.809016, 0.587786, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 150081, 0, -10692.1, -3406.85, -12.8674, 2.44346, 0, 0, 0.939692, 0.34202, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 150082, 0, -10776.8, -3546.58, -27.8987, 4.39823, 0, 0, -0.809016, 0.587786, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+3, 150082, 0, -10692.1, -3406.85, -12.8674, 2.44346, 0, 0, 0.939692, 0.34202, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Truesilver Deposit / Small Thorium Vein - Blasted Lands - Garrison Armory', 0, 0, 0, 10),
(@PTEMPLATE+1, 1, 'Truesilver Deposit / Small Thorium Vein - Blasted Lands - Garrison Armory', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 5, 'Truesilver Deposit / Small Thorium Vein - Blasted Lands - Garrison Armory', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+1, 5, 'Truesilver Deposit / Small Thorium Vein - Blasted Lands - Garrison Armory', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+0, 95, 'Truesilver Deposit / Small Thorium Vein - Blasted Lands - Garrison Armory', 0, 0, 10),
(@GGUID+3, @PTEMPLATE+1, 95, 'Truesilver Deposit / Small Thorium Vein - Blasted Lands - Garrison Armory', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 4345, 0, 'Blasted Lands - Garrison Armory - Truesilver Deposit / Small Thorium Vein', 0),
(@PTEMPLATE+1, 4345, 0, 'Blasted Lands - Garrison Armory - Truesilver Deposit / Small Thorium Vein', 0);

-- Mazthoril
SET @GGUID = 2452;
SET @PTEMPLATE = 1634;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 2047, 1, 6208.8, -4311.59, 661.415, 0.0174525, 0, 0, 0.00872612, 0.999962, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 324, 1, 6208.8, -4311.59, 661.415, 0.0174525, 0, 0, 0.00872612, 0.999962, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Truesilver Deposit / Small Thorium Vein - Winterspring - Mazthoril', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 5, 'Truesilver Deposit / Small Thorium Vein - Winterspring - Mazthoril', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+0, 95, 'Truesilver Deposit / Small Thorium Vein - Winterspring - Mazthoril', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 8123, 0, 'Winterspring - Mazthoril - Truesilver Deposit / Small Thorium Vein', 0);

-- Rich Thorium
-- Azshara
SET @GGUID = 19566;
SET @PTEMPLATE = 3238;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 2047, 1, 4397.65, -6751.84, 112.611, 5.09636, 0, 0, -0.559193, 0.829038, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 2047, 1, 4306.57, -5758.4, 107.496, 0.0349062, 0, 0, 0.0174522, 0.999848, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 2047, 1, 4257.17, -6413.31, -8.16773, 4.31097, 0, 0, -0.833885, 0.551938, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+3, 2047, 1, 4185.95, -7778.6, 14.3329, 5.49779, 0, 0, -0.382683, 0.92388, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+4, 2047, 1, 4079.15, -7289.24, 31.59, 6.23083, 0, 0, -0.0261765, 0.999657, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+5, 2047, 1, 3982.01, -7043.71, -7.81989, 0.383971, 0, 0, 0.190808, 0.981627, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+6, 2047, 1, 3789.14, -7062.48, -2.82837, 2.26893, 0, 0, 0.906307, 0.422619, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+7, 2047, 1, 3577.75, -6546.06, -43.1633, 0.0523589, 0, 0, 0.0261765, 0.999657, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+8, 2047, 1, 3423.63, -7029.43, -16.4713, 6.03884, 0, 0, -0.121869, 0.992546, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+9, 2047, 1, 3405.11, -6785.34, -44.5951, 6.16101, 0, 0, -0.0610485, 0.998135, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+10, 2047, 1, 2841.44, -6310.81, -6.873, 5.044, 0, 0, -0.580703, 0.814116, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+11, 2047, 1, 2676.93, -6593.96, -14.8289, 4.41568, 0, 0, -0.803857, 0.594823, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+12, 2047, 1, 2562.87, -6772.2, 115.066, 3.73501, 0, 0, -0.956305, 0.292372, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+13, 2047, 1, 2155.76, -6787.16, 8.84977, 5.044, 0, 0, -0.580703, 0.814116, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+14, 2047, 1, 2032.62, -6932.71, -11.7928, 1.41372, 0, 0, 0.649447, 0.760406, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+15, 2047, 1, 1906.48, -6149.17, -18.6406, 2.23402, 0, 0, 0.898793, 0.438373, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+16, 175404, 1, 4397.65, -6751.84, 112.611, 5.09636, 0, 0, -0.559193, 0.829038, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+17, 175404, 1, 4306.57, -5758.4, 107.496, 0.0349062, 0, 0, 0.0174522, 0.999848, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+18, 175404, 1, 4257.17, -6413.31, -8.16773, 4.31097, 0, 0, -0.833885, 0.551938, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+19, 175404, 1, 4185.95, -7778.6, 14.3329, 5.49779, 0, 0, -0.382683, 0.92388, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+20, 175404, 1, 4079.15, -7289.24, 31.59, 6.23083, 0, 0, -0.0261765, 0.999657, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+21, 175404, 1, 3982.01, -7043.71, -7.81989, 0.383971, 0, 0, 0.190808, 0.981627, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+22, 175404, 1, 3789.14, -7062.48, -2.82837, 2.26893, 0, 0, 0.906307, 0.422619, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+23, 175404, 1, 3577.75, -6546.06, -43.1633, 0.0523589, 0, 0, 0.0261765, 0.999657, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+24, 175404, 1, 3423.63, -7029.43, -16.4713, 6.03884, 0, 0, -0.121869, 0.992546, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+25, 175404, 1, 3405.11, -6785.34, -44.5951, 6.16101, 0, 0, -0.0610485, 0.998135, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+26, 175404, 1, 2841.44, -6310.81, -6.873, 5.044, 0, 0, -0.580703, 0.814116, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+27, 175404, 1, 2676.93, -6593.96, -14.8289, 4.41568, 0, 0, -0.803857, 0.594823, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+28, 175404, 1, 2562.87, -6772.2, 115.066, 3.73501, 0, 0, -0.956305, 0.292372, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+29, 175404, 1, 2155.76, -6787.16, 8.84977, 5.044, 0, 0, -0.580703, 0.814116, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+30, 175404, 1, 2032.62, -6932.71, -11.7928, 1.41372, 0, 0, 0.649447, 0.760406, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+31, 175404, 1, 1906.48, -6149.17, -18.6406, 2.23402, 0, 0, 0.898793, 0.438373, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 0, 0, 0, 10),
(@PTEMPLATE+1, 1, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 0, 0, 0, 10),
(@PTEMPLATE+2, 1, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 0, 0, 0, 10),
(@PTEMPLATE+3, 1, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 0, 0, 0, 10),
(@PTEMPLATE+4, 1, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 0, 0, 0, 10),
(@PTEMPLATE+5, 1, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 0, 0, 0, 10),
(@PTEMPLATE+6, 1, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 0, 0, 0, 10),
(@PTEMPLATE+7, 1, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 0, 0, 0, 10),
(@PTEMPLATE+8, 1, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 0, 0, 0, 10),
(@PTEMPLATE+9, 1, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 0, 0, 0, 10),
(@PTEMPLATE+10, 1, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 0, 0, 0, 10),
(@PTEMPLATE+11, 1, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 0, 0, 0, 10),
(@PTEMPLATE+12, 1, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 0, 0, 0, 10),
(@PTEMPLATE+13, 1, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 0, 0, 0, 10),
(@PTEMPLATE+14, 1, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 0, 0, 0, 10),
(@PTEMPLATE+15, 1, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 5, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+1, 5, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+2, 5, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 0, 0, 10),
(@GGUID+3, @PTEMPLATE+3, 5, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 0, 0, 10),
(@GGUID+4, @PTEMPLATE+4, 5, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 0, 0, 10),
(@GGUID+5, @PTEMPLATE+5, 5, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 0, 0, 10),
(@GGUID+6, @PTEMPLATE+6, 5, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 0, 0, 10),
(@GGUID+7, @PTEMPLATE+7, 5, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 0, 0, 10),
(@GGUID+8, @PTEMPLATE+8, 5, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 0, 0, 10),
(@GGUID+9, @PTEMPLATE+9, 5, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 0, 0, 10),
(@GGUID+10, @PTEMPLATE+10, 5, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 0, 0, 10),
(@GGUID+11, @PTEMPLATE+11, 5, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 0, 0, 10),
(@GGUID+12, @PTEMPLATE+12, 5, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 0, 0, 10),
(@GGUID+13, @PTEMPLATE+13, 5, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 0, 0, 10),
(@GGUID+14, @PTEMPLATE+14, 5, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 0, 0, 10),
(@GGUID+15, @PTEMPLATE+15, 5, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 0, 0, 10),
(@GGUID+16, @PTEMPLATE+0, 95, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 0, 0, 10),
(@GGUID+17, @PTEMPLATE+1, 95, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 0, 0, 10),
(@GGUID+18, @PTEMPLATE+2, 95, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 0, 0, 10),
(@GGUID+19, @PTEMPLATE+3, 95, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 0, 0, 10),
(@GGUID+20, @PTEMPLATE+4, 95, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 0, 0, 10),
(@GGUID+21, @PTEMPLATE+5, 95, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 0, 0, 10),
(@GGUID+22, @PTEMPLATE+6, 95, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 0, 0, 10),
(@GGUID+23, @PTEMPLATE+7, 95, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 0, 0, 10),
(@GGUID+24, @PTEMPLATE+8, 95, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 0, 0, 10),
(@GGUID+25, @PTEMPLATE+9, 95, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 0, 0, 10),
(@GGUID+26, @PTEMPLATE+10, 95, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 0, 0, 10),
(@GGUID+27, @PTEMPLATE+11, 95, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 0, 0, 10),
(@GGUID+28, @PTEMPLATE+12, 95, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 0, 0, 10),
(@GGUID+29, @PTEMPLATE+13, 95, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 0, 0, 10),
(@GGUID+30, @PTEMPLATE+14, 95, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 0, 0, 10),
(@GGUID+31, @PTEMPLATE+15, 95, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 2337, 0, 'Azshara - Truesilver Deposit / Rich Thorium Vein', 0),
(@PTEMPLATE+1, 2337, 0, 'Azshara - Truesilver Deposit / Rich Thorium Vein', 0),
(@PTEMPLATE+2, 2337, 0, 'Azshara - Truesilver Deposit / Rich Thorium Vein', 0),
(@PTEMPLATE+3, 2337, 0, 'Azshara - Truesilver Deposit / Rich Thorium Vein', 0),
(@PTEMPLATE+4, 2337, 0, 'Azshara - Truesilver Deposit / Rich Thorium Vein', 0),
(@PTEMPLATE+5, 2337, 0, 'Azshara - Truesilver Deposit / Rich Thorium Vein', 0),
(@PTEMPLATE+6, 2337, 0, 'Azshara - Truesilver Deposit / Rich Thorium Vein', 0),
(@PTEMPLATE+7, 2337, 0, 'Azshara - Truesilver Deposit / Rich Thorium Vein', 0),
(@PTEMPLATE+8, 2337, 0, 'Azshara - Truesilver Deposit / Rich Thorium Vein', 0),
(@PTEMPLATE+9, 2337, 0, 'Azshara - Truesilver Deposit / Rich Thorium Vein', 0),
(@PTEMPLATE+10, 2337, 0, 'Azshara - Truesilver Deposit / Rich Thorium Vein', 0),
(@PTEMPLATE+11, 2337, 0, 'Azshara - Truesilver Deposit / Rich Thorium Vein', 0),
(@PTEMPLATE+12, 2337, 0, 'Azshara - Truesilver Deposit / Rich Thorium Vein', 0),
(@PTEMPLATE+13, 2337, 0, 'Azshara - Truesilver Deposit / Rich Thorium Vein', 0),
(@PTEMPLATE+14, 2337, 0, 'Azshara - Truesilver Deposit / Rich Thorium Vein', 0),
(@PTEMPLATE+15, 2337, 0, 'Azshara - Truesilver Deposit / Rich Thorium Vein', 0);

-- Darkwhisper
SET @GGUID = 6614;
SET @PTEMPLATE = 3675;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 2047, 1, 4255.37, -3929.98, 947.441, 6.0912, 0, 0, -0.0958452, 0.995396, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 2047, 1, 4303.44, -4320.39, 919.763, 1.29154, 0, 0, 0.601814, 0.798636, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 2047, 1, 4357.63, -4552.67, 919.146, 0.139624, 0, 0, 0.0697556, 0.997564, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+3, 2047, 1, 4459.17, -4461.28, 912.031, 4.04917, 0, 0, -0.898793, 0.438373, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+4, 2047, 1, 4461.88, -4291.85, 918.976, 4.34587, 0, 0, -0.824126, 0.566406, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+5, 2047, 1, 4478.38, -4009.18, 954.018, 4.36332, 0, 0, -0.819152, 0.573577, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+6, 2047, 1, 4498.03, -4722.87, 899.012, 6.05629, 0, 0, -0.113203, 0.993572, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+7, 2047, 1, 4588.13, -4074.83, 953.75, 4.83456, 0, 0, -0.66262, 0.748956, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+8, 2047, 1, 4615.26, -4756.67, 901.413, 4.39823, 0, 0, -0.809016, 0.587786, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+9, 2047, 1, 4708.07, -4340.32, 916.965, 6.07375, 0, 0, -0.104528, 0.994522, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+10, 2047, 1, 4764.14, -4669.79, 886.496, 3.4034, 0, 0, -0.991445, 0.130528, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+11, 2047, 1, 4765.06, -4177.92, 913.898, 6.16101, 0, 0, -0.0610485, 0.998135, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+12, 2047, 1, 4841.48, -4826.24, 897.894, 2.74016, 0, 0, 0.979924, 0.19937, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+13, 175404, 1, 4255.37, -3929.98, 947.441, 6.0912, 0, 0, -0.0958452, 0.995396, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+14, 175404, 1, 4303.44, -4320.39, 919.763, 1.29154, 0, 0, 0.601814, 0.798636, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+15, 175404, 1, 4357.63, -4552.67, 919.146, 0.139624, 0, 0, 0.0697556, 0.997564, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+16, 175404, 1, 4459.17, -4461.28, 912.031, 4.04917, 0, 0, -0.898793, 0.438373, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+17, 175404, 1, 4461.88, -4291.85, 918.976, 4.34587, 0, 0, -0.824126, 0.566406, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+18, 175404, 1, 4478.38, -4009.18, 954.018, 4.36332, 0, 0, -0.819152, 0.573577, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+19, 175404, 1, 4498.03, -4722.87, 899.012, 6.05629, 0, 0, -0.113203, 0.993572, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+20, 175404, 1, 4588.13, -4074.83, 953.75, 4.83456, 0, 0, -0.66262, 0.748956, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+21, 175404, 1, 4615.26, -4756.67, 901.413, 4.39823, 0, 0, -0.809016, 0.587786, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+22, 175404, 1, 4708.07, -4340.32, 916.965, 6.07375, 0, 0, -0.104528, 0.994522, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+23, 175404, 1, 4764.14, -4669.79, 886.496, 3.4034, 0, 0, -0.991445, 0.130528, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+24, 175404, 1, 4765.06, -4177.92, 913.898, 6.16101, 0, 0, -0.0610485, 0.998135, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+25, 175404, 1, 4841.48, -4826.24, 897.894, 2.74016, 0, 0, 0.979924, 0.19937, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Truesilver Deposit / Rich Thorium Vein - Winterspring - Darkwhisper Gorge', 0, 0, 0, 10),
(@PTEMPLATE+1, 1, 'Truesilver Deposit / Rich Thorium Vein - Winterspring - Darkwhisper Gorge', 0, 0, 0, 10),
(@PTEMPLATE+2, 1, 'Truesilver Deposit / Rich Thorium Vein - Winterspring - Darkwhisper Gorge', 0, 0, 0, 10),
(@PTEMPLATE+3, 1, 'Truesilver Deposit / Rich Thorium Vein - Winterspring - Darkwhisper Gorge', 0, 0, 0, 10),
(@PTEMPLATE+4, 1, 'Truesilver Deposit / Rich Thorium Vein - Winterspring - Darkwhisper Gorge', 0, 0, 0, 10),
(@PTEMPLATE+5, 1, 'Truesilver Deposit / Rich Thorium Vein - Winterspring - Darkwhisper Gorge', 0, 0, 0, 10),
(@PTEMPLATE+6, 1, 'Truesilver Deposit / Rich Thorium Vein - Winterspring - Darkwhisper Gorge', 0, 0, 0, 10),
(@PTEMPLATE+7, 1, 'Truesilver Deposit / Rich Thorium Vein - Winterspring - Darkwhisper Gorge', 0, 0, 0, 10),
(@PTEMPLATE+8, 1, 'Truesilver Deposit / Rich Thorium Vein - Winterspring - Darkwhisper Gorge', 0, 0, 0, 10),
(@PTEMPLATE+9, 1, 'Truesilver Deposit / Rich Thorium Vein - Winterspring - Darkwhisper Gorge', 0, 0, 0, 10),
(@PTEMPLATE+10, 1, 'Truesilver Deposit / Rich Thorium Vein - Winterspring - Darkwhisper Gorge', 0, 0, 0, 10),
(@PTEMPLATE+11, 1, 'Truesilver Deposit / Rich Thorium Vein - Winterspring - Darkwhisper Gorge', 0, 0, 0, 10),
(@PTEMPLATE+12, 1, 'Truesilver Deposit / Rich Thorium Vein - Winterspring - Darkwhisper Gorge', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 5, 'Truesilver Deposit / Rich Thorium Vein - Winterspring - Darkwhisper Gorge', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+1, 5, 'Truesilver Deposit / Rich Thorium Vein - Winterspring - Darkwhisper Gorge', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+2, 5, 'Truesilver Deposit / Rich Thorium Vein - Winterspring - Darkwhisper Gorge', 0, 0, 10),
(@GGUID+3, @PTEMPLATE+3, 5, 'Truesilver Deposit / Rich Thorium Vein - Winterspring - Darkwhisper Gorge', 0, 0, 10),
(@GGUID+4, @PTEMPLATE+4, 5, 'Truesilver Deposit / Rich Thorium Vein - Winterspring - Darkwhisper Gorge', 0, 0, 10),
(@GGUID+5, @PTEMPLATE+5, 5, 'Truesilver Deposit / Rich Thorium Vein - Winterspring - Darkwhisper Gorge', 0, 0, 10),
(@GGUID+6, @PTEMPLATE+6, 5, 'Truesilver Deposit / Rich Thorium Vein - Winterspring - Darkwhisper Gorge', 0, 0, 10),
(@GGUID+7, @PTEMPLATE+7, 5, 'Truesilver Deposit / Rich Thorium Vein - Winterspring - Darkwhisper Gorge', 0, 0, 10),
(@GGUID+8, @PTEMPLATE+8, 5, 'Truesilver Deposit / Rich Thorium Vein - Winterspring - Darkwhisper Gorge', 0, 0, 10),
(@GGUID+9, @PTEMPLATE+9, 5, 'Truesilver Deposit / Rich Thorium Vein - Winterspring - Darkwhisper Gorge', 0, 0, 10),
(@GGUID+10, @PTEMPLATE+10, 5, 'Truesilver Deposit / Rich Thorium Vein - Winterspring - Darkwhisper Gorge', 0, 0, 10),
(@GGUID+11, @PTEMPLATE+11, 5, 'Truesilver Deposit / Rich Thorium Vein - Winterspring - Darkwhisper Gorge', 0, 0, 10),
(@GGUID+12, @PTEMPLATE+12, 5, 'Truesilver Deposit / Rich Thorium Vein - Winterspring - Darkwhisper Gorge', 0, 0, 10),
(@GGUID+13, @PTEMPLATE+0, 95, 'Truesilver Deposit / Rich Thorium Vein - Winterspring - Darkwhisper Gorge', 0, 0, 10),
(@GGUID+14, @PTEMPLATE+1, 95, 'Truesilver Deposit / Rich Thorium Vein - Winterspring - Darkwhisper Gorge', 0, 0, 10),
(@GGUID+15, @PTEMPLATE+2, 95, 'Truesilver Deposit / Rich Thorium Vein - Winterspring - Darkwhisper Gorge', 0, 0, 10),
(@GGUID+16, @PTEMPLATE+3, 95, 'Truesilver Deposit / Rich Thorium Vein - Winterspring - Darkwhisper Gorge', 0, 0, 10),
(@GGUID+17, @PTEMPLATE+4, 95, 'Truesilver Deposit / Rich Thorium Vein - Winterspring - Darkwhisper Gorge', 0, 0, 10),
(@GGUID+18, @PTEMPLATE+5, 95, 'Truesilver Deposit / Rich Thorium Vein - Winterspring - Darkwhisper Gorge', 0, 0, 10),
(@GGUID+19, @PTEMPLATE+6, 95, 'Truesilver Deposit / Rich Thorium Vein - Winterspring - Darkwhisper Gorge', 0, 0, 10),
(@GGUID+20, @PTEMPLATE+7, 95, 'Truesilver Deposit / Rich Thorium Vein - Winterspring - Darkwhisper Gorge', 0, 0, 10),
(@GGUID+21, @PTEMPLATE+8, 95, 'Truesilver Deposit / Rich Thorium Vein - Winterspring - Darkwhisper Gorge', 0, 0, 10),
(@GGUID+22, @PTEMPLATE+9, 95, 'Truesilver Deposit / Rich Thorium Vein - Winterspring - Darkwhisper Gorge', 0, 0, 10),
(@GGUID+23, @PTEMPLATE+10, 95, 'Truesilver Deposit / Rich Thorium Vein - Winterspring - Darkwhisper Gorge', 0, 0, 10),
(@GGUID+24, @PTEMPLATE+11, 95, 'Truesilver Deposit / Rich Thorium Vein - Winterspring - Darkwhisper Gorge', 0, 0, 10),
(@GGUID+25, @PTEMPLATE+12, 95, 'Truesilver Deposit / Rich Thorium Vein - Winterspring - Darkwhisper Gorge', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 8124, 0, 'Winterspring - Darkwhisper Gorge - Truesilver Deposit / Rich Thorium Vein', 0),
(@PTEMPLATE+1, 8124, 0, 'Winterspring - Darkwhisper Gorge - Truesilver Deposit / Rich Thorium Vein', 0),
(@PTEMPLATE+2, 8124, 0, 'Winterspring - Darkwhisper Gorge - Truesilver Deposit / Rich Thorium Vein', 0),
(@PTEMPLATE+3, 8124, 0, 'Winterspring - Darkwhisper Gorge - Truesilver Deposit / Rich Thorium Vein', 0),
(@PTEMPLATE+4, 8124, 0, 'Winterspring - Darkwhisper Gorge - Truesilver Deposit / Rich Thorium Vein', 0),
(@PTEMPLATE+5, 8124, 0, 'Winterspring - Darkwhisper Gorge - Truesilver Deposit / Rich Thorium Vein', 0),
(@PTEMPLATE+6, 8124, 0, 'Winterspring - Darkwhisper Gorge - Truesilver Deposit / Rich Thorium Vein', 0),
(@PTEMPLATE+7, 8124, 0, 'Winterspring - Darkwhisper Gorge - Truesilver Deposit / Rich Thorium Vein', 0),
(@PTEMPLATE+8, 8124, 0, 'Winterspring - Darkwhisper Gorge - Truesilver Deposit / Rich Thorium Vein', 0),
(@PTEMPLATE+9, 8124, 0, 'Winterspring - Darkwhisper Gorge - Truesilver Deposit / Rich Thorium Vein', 0),
(@PTEMPLATE+10, 8124, 0, 'Winterspring - Darkwhisper Gorge - Truesilver Deposit / Rich Thorium Vein', 0),
(@PTEMPLATE+11, 8124, 0, 'Winterspring - Darkwhisper Gorge - Truesilver Deposit / Rich Thorium Vein', 0),
(@PTEMPLATE+12, 8124, 0, 'Winterspring - Darkwhisper Gorge - Truesilver Deposit / Rich Thorium Vein', 0);

-- Mazthoril
SET @GGUID = 3763;
SET @PTEMPLATE = 3106;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 2047, 1, 5820.73, -4131.65, 594.786, 4.32842, 0, 0, -0.829037, 0.559194, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 2047, 1, 5964.03, -4039.62, 599.935, 6.02139, 0, 0, -0.130526, 0.991445, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 2047, 1, 6030.14, -4209.83, 628.189, 0.139624, 0, 0, 0.0697556, 0.997564, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+3, 175404, 1, 5820.73, -4131.65, 594.786, 4.32842, 0, 0, -0.829037, 0.559194, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+4, 175404, 1, 5964.03, -4039.62, 599.935, 6.02139, 0, 0, -0.130526, 0.991445, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+5, 175404, 1, 6030.14, -4209.83, 628.189, 0.139624, 0, 0, 0.0697556, 0.997564, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Truesilver Deposit / Rich Thorium Vein - Winterspring - Mazthoril', 0, 0, 0, 10),
(@PTEMPLATE+1, 1, 'Truesilver Deposit / Rich Thorium Vein - Winterspring - Mazthoril', 0, 0, 0, 10),
(@PTEMPLATE+2, 1, 'Truesilver Deposit / Rich Thorium Vein - Winterspring - Mazthoril', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 5, 'Truesilver Deposit / Rich Thorium Vein - Winterspring - Mazthoril', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+1, 5, 'Truesilver Deposit / Rich Thorium Vein - Winterspring - Mazthoril', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+2, 5, 'Truesilver Deposit / Rich Thorium Vein - Winterspring - Mazthoril', 0, 0, 10),
(@GGUID+3, @PTEMPLATE+0, 95, 'Truesilver Deposit / Rich Thorium Vein - Winterspring - Mazthoril', 0, 0, 10),
(@GGUID+4, @PTEMPLATE+1, 95, 'Truesilver Deposit / Rich Thorium Vein - Winterspring - Mazthoril', 0, 0, 10),
(@GGUID+5, @PTEMPLATE+2, 95, 'Truesilver Deposit / Rich Thorium Vein - Winterspring - Mazthoril', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 8127, 0, 'Winterspring - Mazthoril - Truesilver Deposit / Rich Thorium Vein', 0),
(@PTEMPLATE+1, 8127, 0, 'Winterspring - Mazthoril - Truesilver Deposit / Rich Thorium Vein', 0),
(@PTEMPLATE+2, 8127, 0, 'Winterspring - Mazthoril - Truesilver Deposit / Rich Thorium Vein', 0);

-- Ice Thistle
SET @GGUID = 3131;
SET @PTEMPLATE = 3194;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 2047, 1, 6526.26, -5295, 756.079, 1.65806, 0, 0, 0.737277, 0.675591, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 2047, 1, 6755.22, -5360.43, 767.649, 3.45576, 0, 0, -0.987688, 0.156436, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 175404, 1, 6526.26, -5295, 756.079, 1.65806, 0, 0, 0.737277, 0.675591, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+3, 175404, 1, 6755.22, -5360.43, 767.649, 3.45576, 0, 0, -0.987688, 0.156436, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Truesilver Deposit / Rich Thorium Vein - Winterspring - Ice Thistle Hills', 0, 0, 0, 10),
(@PTEMPLATE+1, 1, 'Truesilver Deposit / Rich Thorium Vein - Winterspring - Ice Thistle Hills', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 5, 'Truesilver Deposit / Rich Thorium Vein - Winterspring - Ice Thistle Hills', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+1, 5, 'Truesilver Deposit / Rich Thorium Vein - Winterspring - Ice Thistle Hills', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+0, 95, 'Truesilver Deposit / Rich Thorium Vein - Winterspring - Ice Thistle Hills', 0, 0, 10),
(@GGUID+3, @PTEMPLATE+1, 95, 'Truesilver Deposit / Rich Thorium Vein - Winterspring - Ice Thistle Hills', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 8129, 0, 'Winterspring - Ice Thistle Hills - Truesilver Deposit / Rich Thorium Vein', 0),
(@PTEMPLATE+1, 8129, 0, 'Winterspring - Ice Thistle Hills - Truesilver Deposit / Rich Thorium Vein', 0);

-- Frostsaber Rock
SET @GGUID = 2518;
SET @PTEMPLATE = 1499;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 2047, 1, 8159.54, -3950.62, 691.875, 0.872664, 0, 0, 0.422618, 0.906308, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 175404, 1, 8159.54, -3950.62, 691.875, 0.872664, 0, 0, 0.422618, 0.906308, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Truesilver Deposit / Rich Thorium Vein - Winterspring - Frostsaber Rock', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 5, 'Truesilver Deposit / Rich Thorium Vein - Winterspring - Frostsaber Rock', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+0, 95, 'Truesilver Deposit / Rich Thorium Vein - Winterspring - Frostsaber Rock', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 8131, 0, 'Winterspring - Frostsaber Rock - Truesilver Deposit / Rich Thorium Vein', 0);

DELETE FROM `gameobject` WHERE `guid` IN (5309, 5302, 5295);
DELETE FROM `pool_gameobject` WHERE `guid` IN (5309, 5302, 5295);
DELETE FROM `pool_template` WHERE `entry` = 1571;
DELETE FROM `pool_pool` WHERE `pool_id` = 1571;

UPDATE `gameobject` SET `spawntimesecsmin` = 600, `spawntimesecsmax` = 2700 WHERE `id` IN (324, 175404, 150082, 176643) AND `map` IN (0, 1);

DELETE FROM `pool_pool` WHERE  `pool_id`=5858;
DELETE FROM `pool_pool` WHERE  `pool_id`=1503;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
