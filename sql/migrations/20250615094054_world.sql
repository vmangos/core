DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250615094054');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250615094054');
-- Add your query below.


-- Thelgen
SET @GGUID = 2540;
SET @PTEMPLATE = 1500;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1732, 0, -3923.21, -2278.38, 41.9379, 4.88692, 0, 0, -0.642787, 0.766045, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1733, 0, -3923.21, -2278.38, 41.9379, 4.88692, 0, 0, -0.642787, 0.766045, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Tin Vein / Silver Vein - Wetlands - Thelgen Rock', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 95, 'Tin Vein / Silver Vein - Wetlands - Thelgen Rock', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+0, 5, 'Tin Vein / Silver Vein - Wetlands - Thelgen Rock', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 9916, 0, 'Wetlands - Thelgen Rock - Tin Vein / Silver Vein', 0);

-- Barrens
SET @GGUID = 2598;
SET @PTEMPLATE = 1554;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1732, 1, -1425.96, -1546.55, 103.494, 2.74016, 0, 0, 0.979924, 0.19937, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1733, 1, -1425.96, -1546.55, 103.494, 2.74016, 0, 0, 0.979924, 0.19937, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Tin Vein / Silver Vein - Barrens', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 95, 'Tin Vein / Silver Vein - Barrens', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+0, 5, 'Tin Vein / Silver Vein - Barrens', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 1033, 0, 'Barrens - Tin Vein / Silver Vein', 0);

-- Demon Fall
SET @GGUID = 2680;
-- Silver
SET @PTEMPLATE = 1566;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1732, 1, 1505.63, -2834.14, 186.348, 2.63544, 0, 0, 0.968147, 0.250381, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1733, 1, 1505.63, -2834.14, 186.348, 2.63544, 0, 0, 0.968147, 0.250381, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Tin Vein / Silver Vein - Ashenvale - Demon Fall Canyon', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 95, 'Tin Vein / Silver Vein - Ashenvale - Demon Fall Canyon', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+0, 5, 'Tin Vein / Silver Vein - Ashenvale - Demon Fall Canyon', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 265, 0, 'Ashenvale - Demon Fall Canyon - Tin Vein / Silver Vein', 0);

-- Ashenvale
SET @GGUID = 2684;
SET @PTEMPLATE = 1571;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1732, 1, 2858.69, 659.776, 110.586, 2.11185, 0, 0, 0.870356, 0.492424, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1733, 1, 2858.69, 659.776, 110.586, 2.11185, 0, 0, 0.870356, 0.492424, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Tin Vein / Silver Vein - Ashenvale', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 95, 'Tin Vein / Silver Vein - Ashenvale', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+0, 5, 'Tin Vein / Silver Vein - Ashenvale', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 1080, 0, 'Ashenvale - Tin Vein / Silver Vein', 0);

-- Cliffspring
SET @GGUID = 2801;
SET @PTEMPLATE = 1583;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1732, 1, 6789.46, -749.952, 69.6737, 1.78024, 0, 0, 0.777146, 0.62932, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1733, 1, 6789.46, -749.952, 69.6737, 1.78024, 0, 0, 0.777146, 0.62932, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Tin Vein / Silver Vein - Darkshore - Cliffspring Falls', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 95, 'Tin Vein / Silver Vein - Darkshore - Cliffspring Falls', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+0, 5, 'Tin Vein / Silver Vein - Darkshore - Cliffspring Falls', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 8062, 0, 'Darkshore - Cliffspring Falls - Tin Vein / Silver Vein', 0);

-- Iron
-- Stranglethorn Vale
SET @GGUID = 3027;
SET @PTEMPLATE = 1600;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1733, 0, -12686.5, -950.185, 77.658, 3.64774, 0, 0, -0.968147, 0.250381, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1734, 0, -12686.5, -950.185, 77.658, 3.64774, 0, 0, -0.968147, 0.250381, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 1735, 0, -12686.5, -950.185, 77.658, 3.64774, 0, 0, -0.968147, 0.250381, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 5, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+0, 5, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+0, 90, 'Silver Vein / Gold Vein / Iron Deposit - Stranglethorn Vale', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 9911, 0, 'Stranglethorn Vale - Silver Vein / Gold Vein / Iron Deposit', 0);

-- Ooze Covered Rich Thorium Vein
-- Hive Regal
SET @GGUID = 3778;
SET @PTEMPLATE = 3293;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 177388, 1, -7928.56, 680.302, -57.2959, 3.05433, 0, 0, 0.999048, 0.0436193, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 177388, 1, -7856.23, 234.057, -65.7971, 4.83456, 0, 0, -0.66262, 0.748956, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 177388, 1, -8182.89, 705.483, -65.2579, 5.09636, 0, 0, -0.559193, 0.829038, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+3, 177388, 1, -8028.06, 694.675, -58.5339, 5.60251, 0, 0, -0.333807, 0.942641, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+4, 123309, 1, -7928.56, 680.302, -57.2959, 3.05433, 0, 0, 0.999048, 0.0436193, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+5, 123309, 1, -7856.23, 234.057, -65.7971, 4.83456, 0, 0, -0.66262, 0.748956, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+6, 123309, 1, -8182.89, 705.483, -65.2579, 5.09636, 0, 0, -0.559193, 0.829038, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+7, 123309, 1, -8028.06, 694.675, -58.5339, 5.60251, 0, 0, -0.333807, 0.942641, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Ooze Covered Truesilver Deposit / Ooze Covered Rich Thorium Vein - Silithus - Hive\'Regal', 0, 0, 0, 10),
(@PTEMPLATE+1, 1, 'Ooze Covered Truesilver Deposit / Ooze Covered Rich Thorium Vein - Silithus - Hive\'Regal', 0, 0, 0, 10),
(@PTEMPLATE+2, 1, 'Ooze Covered Truesilver Deposit / Ooze Covered Rich Thorium Vein - Silithus - Hive\'Regal', 0, 0, 0, 10),
(@PTEMPLATE+3, 1, 'Ooze Covered Truesilver Deposit / Ooze Covered Rich Thorium Vein - Silithus - Hive\'Regal', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 95, 'Ooze Covered Truesilver Deposit / Ooze Covered Rich Thorium Vein - Silithus - Hive\'Regal', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+1, 95, 'Ooze Covered Truesilver Deposit / Ooze Covered Rich Thorium Vein - Silithus - Hive\'Regal', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+2, 95, 'Ooze Covered Truesilver Deposit / Ooze Covered Rich Thorium Vein - Silithus - Hive\'Regal', 0, 0, 10),
(@GGUID+3, @PTEMPLATE+3, 95, 'Ooze Covered Truesilver Deposit / Ooze Covered Rich Thorium Vein - Silithus - Hive\'Regal', 0, 0, 10),
(@GGUID+4, @PTEMPLATE+0, 5, 'Ooze Covered Truesilver Deposit / Ooze Covered Rich Thorium Vein - Silithus - Hive\'Regal', 0, 0, 10),
(@GGUID+5, @PTEMPLATE+1, 5, 'Ooze Covered Truesilver Deposit / Ooze Covered Rich Thorium Vein - Silithus - Hive\'Regal', 0, 0, 10),
(@GGUID+6, @PTEMPLATE+2, 5, 'Ooze Covered Truesilver Deposit / Ooze Covered Rich Thorium Vein - Silithus - Hive\'Regal', 0, 0, 10),
(@GGUID+7, @PTEMPLATE+3, 5, 'Ooze Covered Truesilver Deposit / Ooze Covered Rich Thorium Vein - Silithus - Hive\'Regal', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 8145, 0, 'Silithus - Hive\'Regal - Ooze Covered Truesilver Deposit / Ooze Covered Rich Thorium Vein', 0),
(@PTEMPLATE+1, 8145, 0, 'Silithus - Hive\'Regal - Ooze Covered Truesilver Deposit / Ooze Covered Rich Thorium Vein', 0),
(@PTEMPLATE+2, 8145, 0, 'Silithus - Hive\'Regal - Ooze Covered Truesilver Deposit / Ooze Covered Rich Thorium Vein', 0),
(@PTEMPLATE+3, 8145, 0, 'Silithus - Hive\'Regal - Ooze Covered Truesilver Deposit / Ooze Covered Rich Thorium Vein', 0);

-- Hive Zora
SET @GGUID = 3805;
SET @PTEMPLATE = 3304;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 177388, 1, -7623.82, 1707.22, -35.1333, 2.60054, 0, 0, 0.96363, 0.267241, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 177388, 1, -7548.71, 1476, -73.4945, 2.44346, 0, 0, 0.939692, 0.34202, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 177388, 1, -7489.95, 1728.41, -48.8228, 2.61799, 0, 0, 0.965925, 0.258821, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+3, 177388, 1, -7251.91, 1535.34, -78.5938, 3.7001, 0, 0, -0.961261, 0.27564, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+4, 123309, 1, -7623.82, 1707.22, -35.1333, 2.60054, 0, 0, 0.96363, 0.267241, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+5, 123309, 1, -7548.71, 1476, -73.4945, 2.44346, 0, 0, 0.939692, 0.34202, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+6, 123309, 1, -7489.95, 1728.41, -48.8228, 2.61799, 0, 0, 0.965925, 0.258821, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+7, 123309, 1, -7251.91, 1535.34, -78.5938, 3.7001, 0, 0, -0.961261, 0.27564, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Ooze Covered Truesilver Deposit / Ooze Covered Rich Thorium Vein - Silithus - Hive\'Zora', 0, 0, 0, 10),
(@PTEMPLATE+1, 1, 'Ooze Covered Truesilver Deposit / Ooze Covered Rich Thorium Vein - Silithus - Hive\'Zora', 0, 0, 0, 10),
(@PTEMPLATE+2, 1, 'Ooze Covered Truesilver Deposit / Ooze Covered Rich Thorium Vein - Silithus - Hive\'Zora', 0, 0, 0, 10),
(@PTEMPLATE+3, 1, 'Ooze Covered Truesilver Deposit / Ooze Covered Rich Thorium Vein - Silithus - Hive\'Zora', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 95, 'Ooze Covered Truesilver Deposit / Ooze Covered Rich Thorium Vein - Silithus - Hive\'Zora', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+1, 95, 'Ooze Covered Truesilver Deposit / Ooze Covered Rich Thorium Vein - Silithus - Hive\'Zora', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+2, 95, 'Ooze Covered Truesilver Deposit / Ooze Covered Rich Thorium Vein - Silithus - Hive\'Zora', 0, 0, 10),
(@GGUID+3, @PTEMPLATE+3, 95, 'Ooze Covered Truesilver Deposit / Ooze Covered Rich Thorium Vein - Silithus - Hive\'Zora', 0, 0, 10),
(@GGUID+4, @PTEMPLATE+0, 5, 'Ooze Covered Truesilver Deposit / Ooze Covered Rich Thorium Vein - Silithus - Hive\'Zora', 0, 0, 10),
(@GGUID+5, @PTEMPLATE+1, 5, 'Ooze Covered Truesilver Deposit / Ooze Covered Rich Thorium Vein - Silithus - Hive\'Zora', 0, 0, 10),
(@GGUID+6, @PTEMPLATE+2, 5, 'Ooze Covered Truesilver Deposit / Ooze Covered Rich Thorium Vein - Silithus - Hive\'Zora', 0, 0, 10),
(@GGUID+7, @PTEMPLATE+3, 5, 'Ooze Covered Truesilver Deposit / Ooze Covered Rich Thorium Vein - Silithus - Hive\'Zora', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 8146, 0, 'Silithus - Hive\'Zora - Ooze Covered Truesilver Deposit / Ooze Covered Rich Thorium Vein', 0),
(@PTEMPLATE+1, 8146, 0, 'Silithus - Hive\'Zora - Ooze Covered Truesilver Deposit / Ooze Covered Rich Thorium Vein', 0),
(@PTEMPLATE+2, 8146, 0, 'Silithus - Hive\'Zora - Ooze Covered Truesilver Deposit / Ooze Covered Rich Thorium Vein', 0),
(@PTEMPLATE+3, 8146, 0, 'Silithus - Hive\'Zora - Ooze Covered Truesilver Deposit / Ooze Covered Rich Thorium Vein', 0);

-- Dark Iron BRD
SET @GGUID = 1107;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 165658, 230, 645.26, 193.787, -71.8876, 0.523598, 0, 0, 0.258819, 0.965926, 604800, 604800, 100, 1, 0, 0, 5, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 25622, 0, 'Dark Iron Deposit', 0, 5, 10);

-- Incedite
SET @GGUID = 2812;
SET @PTEMPLATE = 1615;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1667, 0, -3856.98, -2304.95, 43.1795, 2.51327, 0, 0, 0.951056, 0.309017, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1610, 0, -3856.98, -2304.95, 43.1795, 2.51327, 0, 0, 0.951056, 0.309017, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Incendicite Mineral Vein - Wetlands - Thelgen Rock', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 0, 'Incendicite Mineral Vein - Wetlands - Thelgen Rock', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+0, 0, 'Incendicite Mineral Vein - Wetlands - Thelgen Rock', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 3257, 0, 'Wetlands - Thelgen Rock - Incendicite Mineral Vein', 0);

-- Should be Iron
SET @GGUID = 1115;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1735, 0, -1155.32, -1349.64, 58.0543, 3.42085, 0, 0, -0.990268, 0.139175, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1504, 90, 'Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills', 0, 0, 10);
UPDATE `gameobject` SET `id`=1734 WHERE  `guid`=22036;
UPDATE `pool_template` SET `description`='Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills' WHERE  `entry`=1504 AND `patch_min`=0 AND `patch_max`=10;
UPDATE `pool_gameobject` SET `chance`=5, `description`='Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills' WHERE  `guid`=22036;
UPDATE `pool_gameobject` SET `description`='Silver Vein / Gold Vein / Iron Deposit - Hillsbrad Foothills' WHERE  `guid`=22083;
UPDATE `pool_pool` SET `description`='Hillsbrad Foothills - Silver Vein / Gold Vein / Iron Deposit' WHERE  `pool_id`=1504;
UPDATE `pool_pool` SET `mother_pool`=1274 WHERE  `pool_id`=1504;

-- Should be Gold
UPDATE `gameobject` SET `id`=1734 WHERE  `guid`=57435;
UPDATE `pool_template` SET `description`='Silver Vein / Gold Vein / Iron Deposit - Ashenvale' WHERE  `entry`=9337 AND `patch_min`=0 AND `patch_max`=10;
UPDATE `pool_gameobject` SET `description`='Silver Vein / Gold Vein / Iron Deposit - Ashenvale' WHERE  `guid`=57435;
UPDATE `pool_gameobject` SET `description`='Silver Vein / Gold Vein / Iron Deposit - Ashenvale' WHERE  `guid`=57438;
UPDATE `pool_gameobject` SET `description`='Silver Vein / Gold Vein / Iron Deposit - Ashenvale' WHERE  `guid`=57441;
UPDATE `pool_gameobject` SET `chance`=5 WHERE  `guid`=57435;
UPDATE `pool_gameobject` SET `chance`=90 WHERE  `guid`=57441;
UPDATE `pool_pool` SET `mother_pool`=1351, `description`='Ashenvale - Silver Vein / Gold Vein / Iron Deposit' WHERE  `pool_id`=9337;

UPDATE `pool_pool` SET `description` = 'Blasted Lands - Garrison Armory - Truesilver Deposit / Small Thorium Vein' WHERE `mother_pool` = 4345;
UPDATE `pool_pool` SET `mother_pool` = 1280 WHERE `mother_pool` = 4345;
UPDATE `pool_template` SET `max_limit`=5 WHERE  `entry`=1280 AND `patch_min`=0 AND `patch_max`=10;
DELETE FROM `pool_template` WHERE  `entry`=4345 AND `patch_min`=0 AND `patch_max`=10;
UPDATE `pool_template` SET `description`='Blasted Lands - Garrison Armory - Minerals  (Master Pool)' WHERE  `entry`=1280 AND `patch_min`=0 AND `patch_max`=10;

UPDATE `gameobject` SET `spawntimesecsmin` = 600, `spawntimesecsmax` = 2700 WHERE `id` IN (1735, 1732, 2054, 3764, 103711, 1733, 1734, 2047, 150080, 181109, 105569, 150081, 181108, 73939, 73940, 73941, 123309, 123310, 123848, 177388, 165658) AND `map` IN (0, 1);


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
