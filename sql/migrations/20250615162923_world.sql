DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250615162923');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250615162923');
-- Add your query below.


-- Dun Morogh
SET @GGUID = 2590;
SET @PTEMPLATE = 1503;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 3658, 0, -5852.27, -1497.6, 358.891, 0.331611, 0, 0, 0.165047, 0.986286, 180, 180, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 3719, 0, -5852.27, -1497.6, 358.891, 0.331611, 0, 0, 0.165047, 0.986286, 180, 180, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Water Barrel / Food Crate - Dun Morogh', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 0, 'Water Barrel / Food Crate - Dun Morogh', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+0, 0, 'Water Barrel / Food Crate - Dun Morogh', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 192, 0, 'Water Barrel / Food Crate - Dun Morogh', 0);

-- Teldrasil
SET @GGUID = 3834;
SET @PTEMPLATE = 3196;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 3658, 1, 9108.94, 1684.46, 1324.72, 1.29154, 0, 0, 0.601814, 0.798636, 180, 180, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 3658, 1, 9186.58, 1362.24, 1315.19, 1.39626, 0, 0, 0.642787, 0.766045, 180, 180, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 3658, 1, 9661.76, 455.735, 1310.66, 2.87979, 0, 0, 0.991445, 0.130528, 180, 180, 100, 1, 0, 0, 0, 10),
(@GGUID+3, 3719, 1, 9108.94, 1684.46, 1324.72, 1.29154, 0, 0, 0.601814, 0.798636, 180, 180, 100, 1, 0, 0, 0, 10),
(@GGUID+4, 3719, 1, 9186.58, 1362.24, 1315.19, 1.39626, 0, 0, 0.642787, 0.766045, 180, 180, 100, 1, 0, 0, 0, 10),
(@GGUID+5, 3719, 1, 9661.76, 455.735, 1310.66, 2.87979, 0, 0, 0.991445, 0.130528, 180, 180, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Water Barrel / Food Crate - Teldrassil', 0, 0, 0, 10),
(@PTEMPLATE+1, 1, 'Water Barrel / Food Crate - Teldrassil', 0, 0, 0, 10),
(@PTEMPLATE+2, 1, 'Water Barrel / Food Crate - Teldrassil', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 0, 'Water Barrel / Food Crate - Teldrassil', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+1, 0, 'Water Barrel / Food Crate - Teldrassil', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+2, 0, 'Water Barrel / Food Crate - Teldrassil', 0, 0, 10),
(@GGUID+3, @PTEMPLATE+0, 0, 'Water Barrel / Food Crate - Teldrassil', 0, 0, 10),
(@GGUID+4, @PTEMPLATE+1, 0, 'Water Barrel / Food Crate - Teldrassil', 0, 0, 10),
(@GGUID+5, @PTEMPLATE+2, 0, 'Water Barrel / Food Crate - Teldrassil', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 241, 0, 'Water Barrel / Food Crate - Teldrassil', 0),
(@PTEMPLATE+1, 241, 0, 'Water Barrel / Food Crate - Teldrassil', 0),
(@PTEMPLATE+2, 241, 0, 'Water Barrel / Food Crate - Teldrassil', 0);

-- Loch
SET @GGUID = 2808;
SET @PTEMPLATE = 1594;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 3662, 0, -4835.66, -4044.92, 316.165, 3.82227, 0, 0, -0.942641, 0.333808, 180, 180, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 3705, 0, -4835.66, -4044.92, 316.165, 3.82227, 0, 0, -0.942641, 0.333808, 180, 180, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Food Crate / Barrel of Milk - Loch Modan', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 0, 'Food Crate / Barrel of Milk - Loch Modan', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+0, 0, 'Food Crate / Barrel of Milk - Loch Modan', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 7110, 0, 'Food Crate / Barrel of Milk - Loch Modan', 0);

-- Stonetalon
SET @GGUID = 2849;
SET @PTEMPLATE = 1704;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 3662, 1, 81.6949, -729.856, -20.8107, 2.09439, 0, 0, 0.866025, 0.500001, 180, 180, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 3705, 1, 81.6949, -729.856, -20.8107, 2.09439, 0, 0, 0.866025, 0.500001, 180, 180, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Food Crate / Barrel of Milk - Stonetalon Mountains', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 0, 'Food Crate / Barrel of Milk - Stonetalon Mountains', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+0, 0, 'Food Crate / Barrel of Milk - Stonetalon Mountains', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 14396, 0, 'Food Crate / Barrel of Milk - Stonetalon Mountains', 0);

-- Darkshore
SET @GGUID = 2855;
SET @PTEMPLATE = 1756;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 3662, 1, 7031.61, 202.698, -0.035214, 2.79252, 0, 0, 0.984807, 0.173652, 180, 180, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 3705, 1, 7031.61, 202.698, -0.035214, 2.79252, 0, 0, 0.984807, 0.173652, 180, 180, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Food Crate / Barrel of Milk - Darkshore', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 0, 'Food Crate / Barrel of Milk - Darkshore', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+0, 0, 'Food Crate / Barrel of Milk - Darkshore', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 2760, 0, 'Food Crate / Barrel of Milk - Darkshore', 0);

-- Durotar
SET @GGUID = 2864;
SET @PTEMPLATE = 1763;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 3658, 1, 859.76, -4792.43, 36.3753, 3.10665, 0, 0, 0.999847, 0.0174693, 180, 180, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 3719, 1, 859.76, -4792.43, 36.3753, 3.10665, 0, 0, 0.999847, 0.0174693, 180, 180, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Water Barrel / Food Crate - Durotar', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 0, 'Water Barrel / Food Crate - Durotar', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+0, 0, 'Water Barrel / Food Crate - Durotar', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 3877, 0, 'Water Barrel / Food Crate - Durotar', 0);

-- Mulgore
SET @GGUID = 3926;
SET @PTEMPLATE = 3532;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 3719, 1, -2342.43, 502.438, 42.5587, 5.74214, 0, 0, -0.267238, 0.963631, 180, 180, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 3719, 1, -1976.98, 406.042, 133.597, 2.63544, 0, 0, 0.968147, 0.250381, 180, 180, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 3719, 1, -1633.04, -1338.4, 132.736, 3.75246, 0, 0, -0.953716, 0.180708, 180, 180, 100, 1, 0, 0, 0, 10),
(@GGUID+3, 3719, 1, -1523.32, -1078.19, 150.148, 0.541051, 0, 0, 0.267238, 0.963631, 180, 180, 100, 1, 0, 0, 0, 10),
(@GGUID+4, 3658, 1, -2342.43, 502.438, 42.5587, 5.74214, 0, 0, -0.267238, 0.963631, 180, 180, 100, 1, 0, 0, 0, 10),
(@GGUID+5, 3658, 1, -1976.98, 406.042, 133.597, 2.63544, 0, 0, 0.968147, 0.250381, 180, 180, 100, 1, 0, 0, 0, 10),
(@GGUID+6, 3658, 1, -1633.04, -1338.4, 132.736, 3.75246, 0, 0, -0.953716, 0.180708, 180, 180, 100, 1, 0, 0, 0, 10),
(@GGUID+7, 3658, 1, -1523.32, -1078.19, 150.148, 0.541051, 0, 0, 0.267238, 0.963631, 180, 180, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Water Barrel / Food Crate - Mulgore', 0, 0, 0, 10),
(@PTEMPLATE+1, 1, 'Water Barrel / Food Crate - Mulgore', 0, 0, 0, 10),
(@PTEMPLATE+2, 1, 'Water Barrel / Food Crate - Mulgore', 0, 0, 0, 10),
(@PTEMPLATE+3, 1, 'Water Barrel / Food Crate - Mulgore', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 0, 'Water Barrel / Food Crate - Mulgore', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+1, 0, 'Water Barrel / Food Crate - Mulgore', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+2, 0, 'Water Barrel / Food Crate - Mulgore', 0, 0, 10),
(@GGUID+3, @PTEMPLATE+3, 0, 'Water Barrel / Food Crate - Mulgore', 0, 0, 10),
(@GGUID+4, @PTEMPLATE+0, 0, 'Water Barrel / Food Crate - Mulgore', 0, 0, 10),
(@GGUID+5, @PTEMPLATE+1, 0, 'Water Barrel / Food Crate - Mulgore', 0, 0, 10),
(@GGUID+6, @PTEMPLATE+2, 0, 'Water Barrel / Food Crate - Mulgore', 0, 0, 10),
(@GGUID+7, @PTEMPLATE+3, 0, 'Water Barrel / Food Crate - Mulgore', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 3501, 0, 'Water Barrel / Food Crate - Mulgore', 0),
(@PTEMPLATE+1, 3501, 0, 'Water Barrel / Food Crate - Mulgore', 0),
(@PTEMPLATE+2, 3501, 0, 'Water Barrel / Food Crate - Mulgore', 0),
(@PTEMPLATE+3, 3501, 0, 'Water Barrel / Food Crate - Mulgore', 0);

-- Wetlands
SET @GGUID = 3138;
SET @PTEMPLATE = 3254;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 3695, 0, -4218.92, -2681.51, 41.1922, 2.23402, 0, 0, 0.898793, 0.438373, 180, 180, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 3695, 0, -3061.95, -1687.86, 9.2426, 2.37364, 0, 0, 0.927183, 0.374608, 180, 180, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 3659, 0, -4218.92, -2681.51, 41.1922, 2.23402, 0, 0, 0.898793, 0.438373, 180, 180, 100, 1, 0, 0, 0, 10),
(@GGUID+3, 3659, 0, -3061.95, -1687.86, 9.2426, 2.37364, 0, 0, 0.927183, 0.374608, 180, 180, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Barrel of Melon Juice / Food Crate - Wetlands', 0, 0, 0, 10),
(@PTEMPLATE+1, 1, 'Barrel of Melon Juice / Food Crate - Wetlands', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 0, 'Barrel of Melon Juice / Food Crate - Wetlands', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+1, 0, 'Barrel of Melon Juice / Food Crate - Wetlands', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+0, 0, 'Barrel of Melon Juice / Food Crate - Wetlands', 0, 0, 10),
(@GGUID+3, @PTEMPLATE+1, 0, 'Barrel of Melon Juice / Food Crate - Wetlands', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 2704, 0, 'Barrel of Melon Juice / Food Crate - Wetlands', 0),
(@PTEMPLATE+1, 2704, 0, 'Barrel of Melon Juice / Food Crate - Wetlands', 0);

-- Ashenvale
SET @GGUID = 3167;
SET @PTEMPLATE = 3258;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 3659, 1, 1589.18, -2905.8, 182.441, 6.19592, 0, 0, -0.0436192, 0.999048, 180, 180, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 3659, 1, 1465.57, -2788.05, 154.881, 1.51844, 0, 0, 0.688354, 0.725374, 180, 180, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 3695, 1, 1589.18, -2905.8, 182.441, 6.19592, 0, 0, -0.0436192, 0.999048, 180, 180, 100, 1, 0, 0, 0, 10),
(@GGUID+3, 3695, 1, 1465.57, -2788.05, 154.881, 1.51844, 0, 0, 0.688354, 0.725374, 180, 180, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Barrel of Melon Juice / Food Crate - Ashenvale', 0, 0, 0, 10),
(@PTEMPLATE+1, 1, 'Barrel of Melon Juice / Food Crate - Ashenvale', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 0, 'Barrel of Melon Juice / Food Crate - Ashenvale', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+1, 0, 'Barrel of Melon Juice / Food Crate - Ashenvale', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+0, 0, 'Barrel of Melon Juice / Food Crate - Ashenvale', 0, 0, 10),
(@GGUID+3, @PTEMPLATE+1, 0, 'Barrel of Melon Juice / Food Crate - Ashenvale', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 4244, 0, 'Barrel of Melon Juice / Food Crate - Ashenvale', 0),
(@PTEMPLATE+1, 4244, 0, 'Barrel of Melon Juice / Food Crate - Ashenvale', 0);

-- Silverpine
SET @GGUID = 3174;
SET @PTEMPLATE = 3297;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 3705, 0, -148.048, 831.325, 63.784, 5.86431, 0, 0, -0.207911, 0.978148, 180, 180, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 3705, 0, -80.0683, 932.117, 68.9203, 6.26573, 0, 0, -0.00872612, 0.999962, 180, 180, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 3694, 0, -148.048, 831.325, 63.784, 5.86431, 0, 0, -0.207911, 0.978148, 180, 180, 100, 1, 0, 0, 0, 10),
(@GGUID+3, 3694, 0, -80.0683, 932.117, 68.9203, 6.26573, 0, 0, -0.00872612, 0.999962, 180, 180, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Food Crate / Barrel of Milk - Silverpine Forest', 0, 0, 0, 10),
(@PTEMPLATE+1, 1, 'Food Crate / Barrel of Milk - Silverpine Forest', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 0, 'Food Crate / Barrel of Milk - Silverpine Forest', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+1, 0, 'Food Crate / Barrel of Milk - Silverpine Forest', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+0, 0, 'Food Crate / Barrel of Milk - Silverpine Forest', 0, 0, 10),
(@GGUID+3, @PTEMPLATE+1, 0, 'Food Crate / Barrel of Milk - Silverpine Forest', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 2449, 0, 'Food Crate / Barrel of Milk - Silverpine Forest', 0),
(@PTEMPLATE+1, 2449, 0, 'Food Crate / Barrel of Milk - Silverpine Forest', 0);

-- Westfall
SET @GGUID = 2938;
SET @PTEMPLATE = 1772;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 3705, 0, -10638.3, 2125.94, 1.19725, -0.122173, 0, 0, -0.0610485, 0.998135, 180, 180, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 3662, 0, -10638.3, 2125.94, 1.19725, -0.122173, 0, 0, -0.0610485, 0.998135, 180, 180, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Food Crate / Barrel of Milk - Westfall', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 0, 'Food Crate / Barrel of Milk - Westfall', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+0, 0, 'Food Crate / Barrel of Milk - Westfall', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 2129, 0, 'Food Crate / Barrel of Milk - Westfall', 0);

-- Barrens
SET @GGUID = 3032;
SET @PTEMPLATE = 1806;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 3705, 1, -1631.43, -1760.36, 91.6667, 2.46091, 0, 0, 0.942641, 0.333808, 180, 180, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 3662, 1, -1631.43, -1760.36, 91.6667, 2.46091, 0, 0, 0.942641, 0.333808, 180, 180, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Food Crate / Barrel of Milk - Barrens', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 0, 'Food Crate / Barrel of Milk - Barrens', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+0, 0, 'Food Crate / Barrel of Milk - Barrens', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 4195, 0, 'Food Crate / Barrel of Milk - Barrens', 0);

-- Stonetalon
SET @GGUID = 3146;
SET @PTEMPLATE = 1857;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 3662, 1, 135.481, -530.326, 3.00726, 4.88692, 0, 0, -0.642787, 0.766045, 180, 180, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 3705, 1, 135.481, -530.326, 3.00726, 4.88692, 0, 0, -0.642787, 0.766045, 180, 180, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Food Crate / Barrel of Milk - Stonetalon Mountains', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 0, 'Food Crate / Barrel of Milk - Stonetalon Mountains', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+0, 0, 'Food Crate / Barrel of Milk - Stonetalon Mountains', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 14396, 0, 'Food Crate / Barrel of Milk - Stonetalon Mountains', 0);

-- Tirisfal
SET @GGUID = 3152;
SET @PTEMPLATE = 1858;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 3658, 0, 2947.72, 962.064, 122.298, 1.85005, 0, 0, 0.798635, 0.601815, 180, 180, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 153472, 0, 2947.72, 962.064, 122.298, 1.85005, 0, 0, 0.798635, 0.601815, 180, 180, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 0, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+0, 0, 'Water Barrel / Food Crate - Tirisfal Glades', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 3902, 0, 'Water Barrel / Food Crate - Tirisfal Glades', 0);

-- Arathi
SET @GGUID = 3183;
SET @PTEMPLATE = 1860;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 3706, 0, -1763.89, -3152.73, 30.4592, 2.16421, 0, 0, 0.882947, 0.469473, 180, 180, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 3707, 0, -1763.89, -3152.73, 30.4592, 2.16421, 0, 0, 0.882947, 0.469473, 180, 180, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Barrel of Sweet Nectar / Food Crate - Arathi Highlands', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 0, 'Barrel of Sweet Nectar / Food Crate - Arathi Highlands', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+0, 0, 'Barrel of Sweet Nectar / Food Crate - Arathi Highlands', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 3461, 0, 'Barrel of Sweet Nectar / Food Crate - Arathi Highlands', 0);

-- Uldaman
SET @GGUID = 3188;
SET @PTEMPLATE = 1861;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 3707, 70, -157.731, 278.459, -46.7731, 5.044, 0, 0, -0.580703, 0.814116, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 3707, 70, -31.3015, 335.075, -39.3651, 2.40855, 0, 0, 0.93358, 0.358368, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 3707, 70, 6.11263, 418.295, -47.6003, 4.57276, 0, 0, -0.754709, 0.656059, 604800, 604800, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 6, 'Uldaman - Food Crate (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 0, 'Food Crate - Uldaman', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+0, 0, 'Food Crate - Uldaman', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+0, 0, 'Food Crate - Uldaman', 0, 0, 10),
(33283, @PTEMPLATE+0, 0, 'Food Crate - Uldaman', 0, 0, 10),
(33282, @PTEMPLATE+0, 0, 'Food Crate - Uldaman', 0, 0, 10),
(40670, @PTEMPLATE+0, 0, 'Food Crate - Uldaman', 0, 0, 10),
(40671, @PTEMPLATE+0, 0, 'Food Crate - Uldaman', 0, 0, 10),
(40672, @PTEMPLATE+0, 0, 'Food Crate - Uldaman', 0, 0, 10),
(66457, @PTEMPLATE+0, 0, 'Food Crate - Uldaman', 0, 0, 10),
(66458, @PTEMPLATE+0, 0, 'Food Crate - Uldaman', 0, 0, 10),
(66460, @PTEMPLATE+0, 0, 'Food Crate - Uldaman', 0, 0, 10),
(66461, @PTEMPLATE+0, 0, 'Food Crate - Uldaman', 0, 0, 10),
(66462, @PTEMPLATE+0, 0, 'Food Crate - Uldaman', 0, 0, 10),
(66463, @PTEMPLATE+0, 0, 'Food Crate - Uldaman', 0, 0, 10),
(66464, @PTEMPLATE+0, 0, 'Food Crate - Uldaman', 0, 0, 10),
(66465, @PTEMPLATE+0, 0, 'Food Crate - Uldaman', 0, 0, 10),
(66466, @PTEMPLATE+0, 0, 'Food Crate - Uldaman', 0, 0, 10),
(66467, @PTEMPLATE+0, 0, 'Food Crate - Uldaman', 0, 0, 10),
(66468, @PTEMPLATE+0, 0, 'Food Crate - Uldaman', 0, 0, 10),
(66471, @PTEMPLATE+0, 0, 'Food Crate - Uldaman', 0, 0, 10),
(156, @PTEMPLATE+0, 0, 'Food Crate - Uldaman', 0, 0, 10);

-- WPL
SET @GGUID = 1124;
UPDATE `pool_template` SET `description`='Western Plaguelands - Food Crates' WHERE  `entry`=2514 AND `patch_min`=0 AND `patch_max`=10;
UPDATE pool_gameobject SET `description`='Western Plaguelands - Food Crates' WHERE pool_entry = 2514;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 153471, 0, 2700.26, -1932.67, 72.1442, 1.50098, 0, 0, 0.681998, 0.731354, 180, 180, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 2514, 0, 'Food Crate - Western Plaguelands', 0, 0, 10);

-- Boulder Lode
SET @GGUID = 3193;
SET @PTEMPLATE = 1864;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 3693, 1, 1343.09, -3647.27, 92.7527, 0.261798, 0, 0, 0.130526, 0.991445, 180, 180, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 3690, 1, 1428.08, -3415.64, 92.0101, 0.087266, 0, 0, 0.0436192, 0.999048, 180, 180, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 3, 'Barrens - Boulder Lode Mine - Food Crate (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 0, 'Food Crate - Barrens - Boulder Lode Mine', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+0, 0, 'Food Crate - Barrens - Boulder Lode Mine', 0, 0, 10),
(13440, @PTEMPLATE+0, 0, 'Food Crate - Barrens - Boulder Lode Mine', 0, 0, 10),
(82071, @PTEMPLATE+0, 0, 'Food Crate - Barrens - Boulder Lode Mine', 0, 0, 10),
(82076, @PTEMPLATE+0, 0, 'Food Crate - Barrens - Boulder Lode Mine', 0, 0, 10),
(13448, @PTEMPLATE+0, 0, 'Food Crate - Barrens - Boulder Lode Mine', 0, 0, 10),
(82073, @PTEMPLATE+0, 0, 'Food Crate - Barrens - Boulder Lode Mine', 0, 0, 10),
(82075, @PTEMPLATE+0, 0, 'Food Crate - Barrens - Boulder Lode Mine', 0, 0, 10);

-- Merchant Coast
SET @GGUID = 1131;
SET @PTEMPLATE = 1873;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 3691, 1, -1713.03, -3818.88, 12.7229, 3.99681, 0, 0, -0.909961, 0.414694, 180, 180, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 2, 'Barrens - Merchant Coast - Food Crate (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 0, 'Food Crate - Barrens - Merchant Coast', 0, 0, 10),
(13442, @PTEMPLATE+0, 0, 'Food Crate - Barrens - Merchant Coast', 0, 0, 10),
(82072, @PTEMPLATE+0, 0, 'Food Crate - Barrens - Merchant Coast', 0, 0, 10),
(82074, @PTEMPLATE+0, 0, 'Food Crate - Barrens - Merchant Coast', 0, 0, 10);

UPDATE `gameobject` SET `id` = 153473 WHERE `guid` = 38981;

-- Should be Tin / Silver
UPDATE `pool_pool` SET `description`='Alterac Mountains - Tin Vein / Silver Vein' WHERE `pool_id` IN (5094, 5086, 5087, 5088, 5089, 5090, 5091, 5092, 5093, 5095, 5096, 5097);
UPDATE `pool_template` SET `description`='Alterac Mountains - Tin Vein / Silver Vein (Master Pool)' WHERE `entry` = 9902;
DELETE FROM `pool_gameobject` WHERE `guid` IN (396411, 220423, 220424, 220425, 220426, 220427, 220428, 85248, 85249, 220422, 85251, 85252);
DELETE FROM `gameobject` WHERE `guid` IN (396411, 220423, 220424, 220425, 220426, 220427, 220428, 85248, 85249, 220422, 85251, 85252);
UPDATE `pool_gameobject` SET `description`='Tin Vein / Silver Vein - Alterac Mountains' WHERE `guid` IN (2406, 42202, 42204, 33198, 42203, 33196, 42200, 42201, 2405, 2407, 396412, 31523, 85242, 85243, 85244, 85245, 85246, 85247, 31521, 31522, 2408, 85250, 427073);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Tin Vein / Silver Vein - Alterac Mountains" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1733);
UPDATE `pool_gameobject` SET `chance` = 95 WHERE `description` = "Tin Vein / Silver Vein - Alterac Mountains" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1732);
UPDATE `pool_template` SET `description` = 'Tin Vein / Silver Vein - Alterac Mountains' WHERE `entry` IN (5086, 5087, 5088, 5089, 5090, 5091, 5094, 5092, 5093, 5095, 5096, 5097);
DELETE FROM `pool_template` WHERE `entry` = 9728;
DELETE FROM `pool_pool` WHERE `pool_id` = 9728;
DELETE FROM `pool_gameobject` WHERE `guid` = 325671;
DELETE FROM `gameobject` WHERE `guid` = 325671;
UPDATE `pool_gameobject` SET `pool_entry` = 5097 WHERE `guid` = 325628;
UPDATE `pool_gameobject` SET `description`='Tin Vein / Silver Vein - Alterac Mountains' WHERE `guid` = 325628;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
