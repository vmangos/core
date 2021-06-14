DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210527142102');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210527142102');
-- Add your query below.


-- Add pool for Gold Veins in Dustwallow Marsh.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES (1335, 2, 'Gold Veins in Dustwallow Marsh', 0, 0, 0, 10);
UPDATE `pool_gameobject` SET `pool_entry`=1335 WHERE `guid`=40773;

-- Add pool for Gold Veins in Un'Goro Crater.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES (1346, 2, 'Gold Veins in Un\'Goro Crater', 0, 0, 0, 10);
UPDATE `pool_gameobject` SET `pool_entry`=1346 WHERE `guid` IN (5866, 5883, 5886, 5949, 5951, 5988, 5875, 5920);

-- Add pool for Gold Veins in Desolace.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES (1347, 2, 'Gold Veins in Desolace', 0, 0, 0, 10);
UPDATE `pool_gameobject` SET `pool_entry`=1347 WHERE `guid`=34167;

-- Add pool for Gold Veins in Arathi Highlands.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES (1348, 2, 'Gold Veins in Arathi Highlands', 0, 0, 0, 10);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`) VALUES (6108, 1734, 0, -1281.79, -2677.53, 66.1927, 2.11185, 0, 0, 0.870356, 0.492424, 1800, 1800, 1, 100);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES (6108, 1348, 0, 'Gold Vein', 0, 10);

-- Add pool for Gold Veins in Hillsbrad Foothills.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES (1349, 2, 'Gold Veins in Hillsbrad Foothills', 0, 0, 0, 10);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`) VALUES (6001, 1734, 0, -403.738, -1772.86, 103.414, 6.03884, 0, 0, -0.121869, 0.992546, 1800, 1800, 1, 100);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES (6001, 1349, 0, 'Gold Vein', 0, 10);

-- Gold Vein in Badlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`) VALUES (16906, 1734, 0, -6084.95, -3034.08, 250.361, 3.99681, 0, 0, -0.909961, 0.414694, 1800, 1800, 1, 100);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES (16906, 1288, 0, 'Gold Vein', 0, 10);

-- Add pool for Gold Veins in Searing Gorge.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES (1350, 2, 'Gold Veins in Searing Gorge', 0, 0, 0, 10);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`) VALUES (5802, 1734, 0, -7207.76, -783.353, 329.509, 4.7473, 0, 0, -0.694658, 0.71934, 1800, 1800, 1, 100);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES (5802, 1350, 0, 'Gold Vein', 0, 10);

-- Add pool for Gold Veins in Ashenvale.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES (1351, 2, 'Gold Veins in Ashenvale', 0, 0, 0, 10);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`) VALUES (5768, 1734, 1, 2632.32, -2411.95, 174.618, 2.1293, 0, 0, 0.874619, 0.48481, 1800, 1800, 1, 100);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES (5768, 1351, 0, 'Gold Vein', 0, 10);

-- Add pool for Gold Veins in Azshara.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES (1352, 2, 'Gold Veins in Azshara', 0, 0, 0, 10);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`) VALUES (7164, 1734, 1, 2828.26, -3994.61, 117.324, 1.65806, 0, 0, 0.737277, 0.675591, 1800, 1800, 1, 100);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES (7164, 1352, 0, 'Gold Vein', 0, 10);

-- Add pool for Gold Veins in Alterac Mountains.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES (1353, 2, 'Gold Veins in Alterac Mountains', 0, 0, 0, 10);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`) VALUES (6420, 1734, 0, 617.05, -648.97, 154.328, 6.14356, 0, 0, -0.0697555, 0.997564, 1800, 1800, 1, 100);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES (6420, 1353, 0, 'Gold Vein', 0, 10);

-- Add pool for Gold Veins in Eastern Plaguelands.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES (1354, 2, 'Gold Veins in Eastern Plaguelands', 0, 0, 0, 10);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`) VALUES (5965, 1734, 0, 2212.95, -3043.52, 102.832, 1.02974, 0, 0, 0.492423, 0.870356, 1800, 1800, 1, 100);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES (5965, 1354, 0, 'Gold Vein', 0, 10);

-- Add pool for Gold Veins in Wetlands.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES (1355, 2, 'Gold Veins in Wetlands', 0, 0, 0, 10);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`) VALUES (7352, 1734, 0, -3533.33, -2399.93, 66.7631, 3.68265, 0, 0, -0.96363, 0.267241, 1800, 1800, 1, 100);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES (7352, 1355, 0, 'Gold Vein', 0, 10);

-- Add pool for Gold Veins in Winterspring.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES (1356, 2, 'Gold Veins in Winterspring', 0, 0, 0, 10);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`) VALUES (6873, 1734, 1, 6395.65, -2627.46, 588.774, 4.10152, 0, 0, -0.887011, 0.461749, 1800, 1800, 1, 100);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES (6873, 1356, 0, 'Gold Vein', 0, 10);

-- Add pool for Gold Veins in Feralas.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES (1357, 2, 'Gold Veins in Feralas', 0, 0, 0, 10);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`) VALUES (6622, 1734, 1, -4014.75, 1942.18, 104.728, 1.3439, 0, 0, 0.622514, 0.782609, 1800, 1800, 1, 100);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES (6622, 1357, 0, 'Gold Vein', 0, 10);

-- Add pool for Gold Veins in Hinterlands.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES (1358, 2, 'Gold Veins in Hinterlands', 0, 0, 0, 10);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`) VALUES (7349, 1734, 0, -454.09, -2943.15, 97.862, 2.21656, 0, 0, 0.894934, 0.446199, 1800, 1800, 1, 100);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES (7349, 1358, 0, 'Gold Vein', 0, 10);

-- Add pool for Gold Veins in Blasted Lands.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES (1359, 2, 'Gold Veins in Blasted Lands', 0, 0, 0, 10);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`) VALUES (6233, 1734, 0, -11347.9, -2880.95, 12.63, 3.90954, 0, 0, -0.927183, 0.374608, 1800, 1800, 1, 100);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES (6233, 1359, 0, 'Gold Vein', 0, 10);

-- Correct position of Gold Vein in Stranglethorn Vale (position is off by 1.15788 yards).
UPDATE `gameobject` SET `position_x`=-11490.4, `position_y`=276.76, `position_z`=22.9154, `orientation`=4.50295, `rotation0`=0, `rotation1`=0, `rotation2`=-0.777145, `rotation3`=0.629321 WHERE `guid`=5854;

-- Correct position of Gold Vein in Tanaris (position is off by 1.20965 yards).
UPDATE `gameobject` SET `position_x`=-7106.94, `position_y`=-2582.7, `position_z`=13.6203, `orientation`=4.50295, `rotation0`=0, `rotation1`=0, `rotation2`=-0.777145, `rotation3`=0.629321 WHERE `guid`=5999;

-- Missing Gold Vein spawns in Badlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(5843, 1734, 0, -6234.93, -3475.95, 250.017, 4.45059, 0, 0, -0.793353, 0.608762, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 5833 at 191.660095 yards.
(5774, 1734, 0, -6750.15, -2931.61, 249.867, 3.49067, 0, 0, -0.984807, 0.173652, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 5767 at 246.262299 yards.
(7574, 1734, 0, -6620.91, -2883.36, 256.751, 4.90438, 0, 0, -0.636078, 0.771625, 1800, 1800, 1, 100, 0, 10); -- Closest existing guid is 5767 at 136.843292 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(5843, 1288, 0, 'Gold Vein', 0, 10), -- Gold Veins in Badlands 8 objects total
(5774, 1288, 0, 'Gold Vein', 0, 10), -- Gold Veins in Badlands 8 objects total
(7574, 1288, 0, 'Gold Vein', 0, 10); -- Gold Veins in Badlands 8 objects total

-- Missing Gold Vein spawns in Blasted Lands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(6262, 1734, 0, -11280.7, -3478.4, 7.66078, 2.04204, 0, 0, 0.85264, 0.522499, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6233 at 601.237915 yards.
(6324, 1734, 0, -11253.7, -2698.1, 15.4379, 1.16937, 0, 0, 0.551936, 0.833886, 1800, 1800, 1, 100, 0, 10); -- Closest existing guid is 6233 at 205.707626 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(6262, 1359, 0, 'Gold Vein', 0, 10), -- Gold Veins in Blasted Lands
(6324, 1359, 0, 'Gold Vein', 0, 10); -- Gold Veins in Blasted Lands

-- Missing Gold Vein spawns in Swamp of Sorrows.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(5816, 1734, 0, -10307.9, -3859.91, -15.864, 0.663223, 0, 0, 0.325567, 0.945519, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 5815 at 234.523178 yards.
(5879, 1734, 0, -10285.2, -2883.33, 27.7251, 4.43314, 0, 0, -0.798635, 0.601815, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 5868 at 348.084778 yards.
(5801, 1734, 0, -10617.8, -2858.78, 43.9617, 0.191985, 0, 0, 0.0958452, 0.995396, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 5765 at 226.112823 yards.
(5961, 1734, 0, -10831.1, -3691.35, 23.2697, 3.83973, 0, 0, -0.939692, 0.342021, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 5865 at 126.261208 yards.
(6524, 1734, 0, -10629.5, -2461.66, 38.145, 1.6057, 0, 0, 0.719339, 0.694659, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 5765 at 173.066437 yards.
(7597, 1734, 0, -10992.9, -3674.35, 25.4381, 3.61284, 0, 0, -0.972369, 0.233448, 1800, 1800, 1, 100, 0, 10); -- Closest existing guid is 5995 at 34.915688 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(5816, 1332, 0, 'Gold Vein', 0, 10), -- Gold Vein in Swamp of sorrows 9 objects total
(5879, 1332, 0, 'Gold Vein', 0, 10), -- Gold Vein in Swamp of sorrows 9 objects total
(5801, 1332, 0, 'Gold Vein', 0, 10), -- Gold Vein in Swamp of sorrows 9 objects total
(5961, 1332, 0, 'Gold Vein', 0, 10), -- Gold Vein in Swamp of sorrows 9 objects total
(6524, 1332, 0, 'Gold Vein', 0, 10), -- Gold Vein in Swamp of sorrows 9 objects total
(7597, 1332, 0, 'Gold Vein', 0, 10); -- Gold Vein in Swamp of sorrows 9 objects total

-- Missing Gold Vein spawns in Duskwood.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(5985, 1734, 0, -10415.6, -1253.79, 52.5802, 3.49067, 0, 0, -0.984807, 0.173652, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 5978 at 487.998108 yards.
(5994, 1734, 0, -10362.5, -1404.4, 81.8085, 1.22173, 0, 0, 0.573576, 0.819152, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 5978 at 645.614563 yards.
(16912, 1734, 0, -11183.7, -135.158, 8.11372, 2.09439, 0, 0, 0.866025, 0.500001, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 16904 at 715.114136 yards.
(6100, 1734, 0, -10559.5, -724.451, 76.4627, 5.49779, 0, 0, -0.382683, 0.92388, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 5978 at 88.103226 yards.
(5938, 1734, 0, -11010, -989.044, 69.0113, 4.93928, 0, 0, -0.622514, 0.782609, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 5929 at 140.988678 yards.
(6259, 1734, 0, -10662.4, -894.27, 58.8167, 0.994837, 0, 0, 0.477158, 0.878817, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 5978 at 215.236267 yards.
(7382, 1734, 0, -10301.6, -1467.02, 90.2184, 5.91667, 0, 0, -0.182235, 0.983255, 1800, 1800, 1, 100, 0, 10); -- Closest existing guid is 5978 at 720.563660 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(5985, 1121, 0, 'Gold Vein', 0, 10), -- Gold Veins in Duskwood 5 objects total
(5994, 1121, 0, 'Gold Vein', 0, 10), -- Gold Veins in Duskwood 5 objects total
(16912, 1121, 0, 'Gold Vein', 0, 10), -- Gold Veins in Duskwood 5 objects total
(6100, 1121, 0, 'Gold Vein', 0, 10), -- Gold Veins in Duskwood 5 objects total
(5938, 1121, 0, 'Gold Vein', 0, 10), -- Gold Veins in Duskwood 5 objects total
(6259, 1121, 0, 'Gold Vein', 0, 10), -- Gold Veins in Duskwood 5 objects total
(7382, 1121, 0, 'Gold Vein', 0, 10); -- Gold Veins in Duskwood 5 objects total

-- Missing Gold Vein spawns in Wetlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(7357, 1734, 0, -3584.02, -2588.48, 79.383, 5.20108, 0, 0, -0.515037, 0.857168, 1800, 1800, 1, 100, 0, 10); -- Closest existing guid is 7352 at 195.652374 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(7357, 1355, 0, 'Gold Vein', 0, 10); -- Gold Veins in Wetlands

-- Missing Gold Vein spawns in Dustwallow Marsh.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(40774, 1734, 1, -2694.8, -4296.36, 8.4852, 2.46091, 0, 0, 0.942641, 0.333808, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 40773 at 2363.032471 yards.
(40775, 1734, 1, -3279.71, -3840.21, 52.5267, 2.51327, 0, 0, 0.951056, 0.309017, 1800, 1800, 1, 100, 0, 10); -- Closest existing guid is 40773 at 1631.587280 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(40774, 1335, 0, 'Gold Vein', 0, 10), -- Gold Veins in Dustwallow Marsh
(40775, 1335, 0, 'Gold Vein', 0, 10); -- Gold Veins in Dustwallow Marsh

-- Missing Gold Vein spawns in Azshara.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(7204, 1734, 1, 4280.4, -7293.17, 17.8182, 1.51844, 0, 0, 0.688354, 0.725375, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 7164 at 3605.427490 yards.
(7208, 1734, 1, 4111.43, -5137.35, 146.158, 3.90954, 0, 0, -0.927183, 0.374608, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 7164 at 1718.491089 yards.
(7210, 1734, 1, 4004.27, -5020.26, 144.709, 3.14159, 0, 0, -1, 0, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 7164 at 1560.675049 yards.
(7263, 1734, 1, 3973.14, -5413.5, 124.489, 3.31614, 0, 0, -0.996194, 0.087165, 1800, 1800, 1, 100, 0, 10); -- Closest existing guid is 7164 at 1823.197632 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(7204, 1352, 0, 'Gold Vein', 0, 10), -- Gold Veins in Azshara
(7208, 1352, 0, 'Gold Vein', 0, 10), -- Gold Veins in Azshara
(7210, 1352, 0, 'Gold Vein', 0, 10), -- Gold Veins in Azshara
(7263, 1352, 0, 'Gold Vein', 0, 10); -- Gold Veins in Azshara

-- Missing Gold Vein spawns in Western Plaguelands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(5846, 1734, 0, 1351.98, -1781.53, 76.1072, 4.97419, 0, 0, -0.608761, 0.793354, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 5819 at 68.792618 yards.
(5905, 1734, 0, 1238.13, -1780.96, 68.3152, 5.34071, 0, 0, -0.45399, 0.891007, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 5819 at 53.604309 yards.
(7351, 1734, 0, 1832.74, -1031.8, 83.7296, 5.39307, 0, 0, -0.43051, 0.902586, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 5770 at 437.133972 yards.
(7359, 1734, 0, 1491.92, -1351.54, 63.0037, 3.4383, 0, 0, -0.989016, 0.147811, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6000 at 167.692230 yards.
(7614, 1734, 0, 1682.83, -1010.24, 79.0426, 4.62512, 0, 0, -0.737277, 0.675591, 1800, 1800, 1, 100, 0, 10); -- Closest existing guid is 5770 at 296.369537 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(5846, 1331, 0, 'Gold Vein', 0, 10), -- Gold Vein in Western Plaguelands 19 objects total
(5905, 1331, 0, 'Gold Vein', 0, 10), -- Gold Vein in Western Plaguelands 19 objects total
(7351, 1331, 0, 'Gold Vein', 0, 10), -- Gold Vein in Western Plaguelands 19 objects total
(7359, 1331, 0, 'Gold Vein', 0, 10), -- Gold Vein in Western Plaguelands 19 objects total
(7614, 1331, 0, 'Gold Vein', 0, 10); -- Gold Vein in Western Plaguelands 19 objects total

-- Missing Gold Vein spawns in Stranglethorn Vale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(5896, 1734, 0, -11777.7, -424.371, 27.5906, 5.2709, 0, 0, -0.484809, 0.87462, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 5812 at 211.561234 yards.
(5959, 1734, 0, -11934, 458.191, 44.5061, 6.19592, 0, 0, -0.0436192, 0.999048, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 5954 at 163.286530 yards.
(6570, 1734, 0, -11754.5, 223.55, 21.0039, 1.83259, 0, 0, 0.793353, 0.608762, 1800, 1800, 1, 100, 0, 10); -- Closest existing guid is 5836 at 45.915546 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(5896, 1176, 0, 'Gold Vein', 0, 10), -- Gold Veins in Stranglethorn 51 objects total
(5959, 1176, 0, 'Gold Vein', 0, 10), -- Gold Veins in Stranglethorn 51 objects total
(6570, 1176, 0, 'Gold Vein', 0, 10); -- Gold Veins in Stranglethorn 51 objects total

-- Missing Gold Vein spawns in Alterac Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(6460, 1734, 0, 550.242, -438.635, 170.444, 4.15388, 0, 0, -0.874619, 0.48481, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6420 at 221.277710 yards.
(6487, 1734, 0, 444.986, -906.441, 132.939, 5.34071, 0, 0, -0.45399, 0.891007, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6420 at 310.410736 yards.
(6494, 1734, 0, 581.203, -703.031, 153.828, 6.16101, 0, 0, -0.0610485, 0.998135, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6420 at 64.867958 yards.
(6509, 1734, 0, 267.907, -277.657, 151.659, 5.96903, 0, 0, -0.156434, 0.987688, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6420 at 509.687408 yards.
(6517, 1734, 0, 648.067, -590.311, 164.736, 0.122173, 0, 0, 0.0610485, 0.998135, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6420 at 67.165916 yards.
(6575, 1734, 0, 412.711, -672.618, 179.944, 1.09956, 0, 0, 0.522498, 0.852641, 1800, 1800, 1, 100, 0, 10); -- Closest existing guid is 6420 at 207.291656 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(6460, 1353, 0, 'Gold Vein', 0, 10), -- Gold Veins in Alterac Mountains
(6487, 1353, 0, 'Gold Vein', 0, 10), -- Gold Veins in Alterac Mountains
(6494, 1353, 0, 'Gold Vein', 0, 10), -- Gold Veins in Alterac Mountains
(6509, 1353, 0, 'Gold Vein', 0, 10), -- Gold Veins in Alterac Mountains
(6517, 1353, 0, 'Gold Vein', 0, 10), -- Gold Veins in Alterac Mountains
(6575, 1353, 0, 'Gold Vein', 0, 10); -- Gold Veins in Alterac Mountains

-- Missing Gold Vein spawns in Arathi Highlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(6143, 1734, 0, -890.106, -2366.56, 67.8352, 0.349065, 0, 0, 0.173648, 0.984808, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6108 at 500.121368 yards.
(6149, 1734, 0, -915.477, -1973.57, 53.7444, 1.71042, 0, 0, 0.754709, 0.656059, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6108 at 793.662415 yards.
(6163, 1734, 0, -961.645, -2236.57, 58.6912, 3.47321, 0, 0, -0.986285, 0.16505, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6108 at 544.972290 yards.
(6167, 1734, 0, -2241.04, -1835.02, -20.1633, 0.418879, 0, 0, 0.207912, 0.978148, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6108 at 1279.625366 yards.
(6173, 1734, 0, -990.192, -2587.46, 65.2202, 1.97222, 0, 0, 0.833885, 0.551938, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6108 at 305.193329 yards.
(6333, 1734, 0, -1674.69, -1442.03, 45.8495, 5.41052, 0, 0, -0.422618, 0.906308, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6108 at 1296.628174 yards.
(6564, 1734, 0, -972.981, -3184.12, 52.1261, 5.49779, 0, 0, -0.382683, 0.92388, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6108 at 593.459717 yards.
(6615, 1734, 0, -870.664, -3417.08, 81.2847, 0.331611, 0, 0, 0.165047, 0.986286, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6108 at 846.278076 yards.
(6629, 1734, 0, -2183.83, -1728.47, -63.0671, 1.46608, 0, 0, 0.66913, 0.743145, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6108 at 1315.712524 yards.
(7569, 1734, 0, -2307.24, -1790.67, -22.6112, 0.453785, 0, 0, 0.224951, 0.97437, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6108 at 1358.659058 yards.
(7609, 1734, 0, -1827.82, -2643.53, 59.8704, 6.23083, 0, 0, -0.0261765, 0.999657, 1800, 1800, 1, 100, 0, 10); -- Closest existing guid is 6108 at 547.123962 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(6143, 1348, 0, 'Gold Vein', 0, 10), -- Gold Veins in Arathi Highlands
(6149, 1348, 0, 'Gold Vein', 0, 10), -- Gold Veins in Arathi Highlands
(6163, 1348, 0, 'Gold Vein', 0, 10), -- Gold Veins in Arathi Highlands
(6167, 1348, 0, 'Gold Vein', 0, 10), -- Gold Veins in Arathi Highlands
(6173, 1348, 0, 'Gold Vein', 0, 10), -- Gold Veins in Arathi Highlands
(6333, 1348, 0, 'Gold Vein', 0, 10), -- Gold Veins in Arathi Highlands
(6564, 1348, 0, 'Gold Vein', 0, 10), -- Gold Veins in Arathi Highlands
(6615, 1348, 0, 'Gold Vein', 0, 10), -- Gold Veins in Arathi Highlands
(6629, 1348, 0, 'Gold Vein', 0, 10), -- Gold Veins in Arathi Highlands
(7569, 1348, 0, 'Gold Vein', 0, 10), -- Gold Veins in Arathi Highlands
(7609, 1348, 0, 'Gold Vein', 0, 10); -- Gold Veins in Arathi Highlands

-- Missing Gold Vein spawns in Burning Steppes.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(5871, 1734, 0, -8265.21, -2501.09, 151.887, 0.261798, 0, 0, 0.130526, 0.991445, 1800, 1800, 1, 100, 0, 10); -- Closest existing guid is 5842 at 285.887360 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(5871, 1333, 0, 'Gold Vein', 0, 10); -- Gold Vein in Burning Steppes 8 objects total

-- Missing Gold Vein spawns in The Hinterlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(7350, 1734, 0, -67.5581, -2473.1, 138.161, 0.157079, 0, 0, 0.0784588, 0.996917, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 7349 at 609.899780 yards.
(7395, 1734, 0, 395.458, -3830.24, 117.181, 1.58825, 0, 0, 0.71325, 0.70091, 1800, 1800, 1, 100, 0, 10); -- Closest existing guid is 7349 at 1228.427368 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(7350, 1358, 0, 'Gold Vein', 0, 10), -- Gold Veins in Hinterlands
(7395, 1358, 0, 'Gold Vein', 0, 10); -- Gold Veins in Hinterlands

-- Missing Gold Vein spawns in Searing Gorge.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(5821, 1734, 0, -6935.9, -1202.91, 148.082, 1.20428, 0, 0, 0.566406, 0.824126, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 5802 at 531.837952 yards.
(5826, 1734, 0, -6473.71, -1195.53, 183.154, 1.29154, 0, 0, 0.601814, 0.798636, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 5802 at 854.481628 yards.
(5831, 1734, 0, -7079.5, -998.117, 243.831, 3.49067, 0, 0, -0.984807, 0.173652, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 5802 at 264.414154 yards.
(5837, 1734, 0, -6683.49, -1230.44, 181.85, 2.1293, 0, 0, 0.874619, 0.48481, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 5802 at 704.661926 yards.
(5845, 1734, 0, -7314.01, -1597.51, 315.985, 0.261798, 0, 0, 0.130526, 0.991445, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 5802 at 821.172058 yards.
(5850, 1734, 0, -6869.47, -1410.38, 172.377, 3.50812, 0, 0, -0.983254, 0.182238, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 5802 at 729.584229 yards.
(5880, 1734, 0, -6865.97, -1191.79, 182.557, 0.383971, 0, 0, 0.190808, 0.981627, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 5802 at 552.481445 yards.
(6563, 1734, 0, -7117.15, -1606, 258.349, 3.4383, 0, 0, -0.989016, 0.147811, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 5802 at 830.675598 yards.
(7561, 1734, 0, -6599.25, -1432.17, 167.379, 2.37364, 0, 0, 0.927183, 0.374608, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 5802 at 904.175720 yards.
(7573, 1734, 0, -6862.05, -1551.08, 242.068, 3.10665, 0, 0, 0.999847, 0.0174693, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 5802 at 846.502197 yards.
(7591, 1734, 0, -7325.74, -1755.42, 267.655, 2.33874, 0, 0, 0.920505, 0.390732, 1800, 1800, 1, 100, 0, 10); -- Closest existing guid is 5802 at 981.152222 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(5821, 1350, 0, 'Gold Vein', 0, 10), -- Gold Veins in Searing Gorge
(5826, 1350, 0, 'Gold Vein', 0, 10), -- Gold Veins in Searing Gorge
(5831, 1350, 0, 'Gold Vein', 0, 10), -- Gold Veins in Searing Gorge
(5837, 1350, 0, 'Gold Vein', 0, 10), -- Gold Veins in Searing Gorge
(5845, 1350, 0, 'Gold Vein', 0, 10), -- Gold Veins in Searing Gorge
(5850, 1350, 0, 'Gold Vein', 0, 10), -- Gold Veins in Searing Gorge
(5880, 1350, 0, 'Gold Vein', 0, 10), -- Gold Veins in Searing Gorge
(6563, 1350, 0, 'Gold Vein', 0, 10), -- Gold Veins in Searing Gorge
(7561, 1350, 0, 'Gold Vein', 0, 10), -- Gold Veins in Searing Gorge
(7573, 1350, 0, 'Gold Vein', 0, 10), -- Gold Veins in Searing Gorge
(7591, 1350, 0, 'Gold Vein', 0, 10); -- Gold Veins in Searing Gorge

-- Missing Gold Vein spawns in Eastern Plaguelands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(5969, 1734, 0, 1903.44, -3134.22, 107.396, 5.21854, 0, 0, -0.507538, 0.861629, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 5965 at 322.558136 yards.
(6091, 1734, 0, 2226.71, -2750.54, 88.3278, 0.558504, 0, 0, 0.275637, 0.961262, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 5965 at 293.661316 yards.
(6187, 1734, 0, 1651.95, -3570.09, 130.989, 3.94445, 0, 0, -0.920505, 0.390732, 1800, 1800, 1, 100, 0, 10); -- Closest existing guid is 5965 at 769.928467 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(5969, 1354, 0, 'Gold Vein', 0, 10), -- Gold Veins in Eastern Plaguelands
(6091, 1354, 0, 'Gold Vein', 0, 10), -- Gold Veins in Eastern Plaguelands
(6187, 1354, 0, 'Gold Vein', 0, 10); -- Gold Veins in Eastern Plaguelands

-- Missing Gold Vein spawns in Hillsbrad Foothills.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(6051, 1734, 0, -190.746, -312.664, 73.9734, 2.53072, 0, 0, 0.953716, 0.300708, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6001 at 1475.942017 yards.
(6056, 1734, 0, -1373.79, -1072.68, 19.7061, 2.21656, 0, 0, 0.894934, 0.446199, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6001 at 1199.274658 yards.
(6215, 1734, 0, -200.169, -357.171, 72.8802, 1.88495, 0, 0, 0.809016, 0.587786, 1800, 1800, 1, 100, 0, 10); -- Closest existing guid is 6001 at 1430.576050 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(6051, 1349, 0, 'Gold Vein', 0, 10), -- Gold Veins in Hillsbrad Foothills
(6056, 1349, 0, 'Gold Vein', 0, 10), -- Gold Veins in Hillsbrad Foothills
(6215, 1349, 0, 'Gold Vein', 0, 10); -- Gold Veins in Hillsbrad Foothills

-- Missing Gold Vein spawns in Ashenvale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(5772, 1734, 1, 1835.91, -2319.56, 130.228, 0.680677, 0, 0, 0.333806, 0.942642, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 5768 at 802.979004 yards.
(5777, 1734, 1, 1739.69, -2038.2, 108.563, 0.383971, 0, 0, 0.190808, 0.981627, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 5768 at 969.969543 yards.
(5784, 1734, 1, 1582.52, -1824.91, 127.361, 5.55015, 0, 0, -0.358368, 0.933581, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 5768 at 1203.714722 yards.
(5794, 1734, 1, 2467.52, -2607.81, 172.817, 3.08918, 0, 0, 0.999657, 0.0262017, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 5768 at 255.975555 yards.
(5907, 1734, 1, 2168.69, -2413.1, 119.598, 3.82227, 0, 0, -0.942641, 0.333808, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 5768 at 466.884796 yards.
(5925, 1734, 1, 3209.16, -1811.62, 189.909, 1.8675, 0, 0, 0.803857, 0.594823, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 5768 at 832.690857 yards.
(5960, 1734, 1, 2696.44, -2375.86, 213.072, 0.715585, 0, 0, 0.350207, 0.936672, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 5768 at 83.021355 yards.
(7613, 1734, 1, 2227.35, -3529.37, 54.6161, 5.20108, 0, 0, -0.515037, 0.857168, 1800, 1800, 1, 100, 0, 10); -- Closest existing guid is 5768 at 1194.583130 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(5772, 1351, 0, 'Gold Vein', 0, 10), -- Gold Veins in Ashenvale
(5777, 1351, 0, 'Gold Vein', 0, 10), -- Gold Veins in Ashenvale
(5784, 1351, 0, 'Gold Vein', 0, 10), -- Gold Veins in Ashenvale
(5794, 1351, 0, 'Gold Vein', 0, 10), -- Gold Veins in Ashenvale
(5907, 1351, 0, 'Gold Vein', 0, 10), -- Gold Veins in Ashenvale
(5925, 1351, 0, 'Gold Vein', 0, 10), -- Gold Veins in Ashenvale
(5960, 1351, 0, 'Gold Vein', 0, 10), -- Gold Veins in Ashenvale
(7613, 1351, 0, 'Gold Vein', 0, 10); -- Gold Veins in Ashenvale

-- Missing Gold Vein spawns in Feralas.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(6626, 1734, 1, -5411.21, 1230.15, 38.2596, 2.54818, 0, 0, 0.956305, 0.292372, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6622 at 1568.918457 yards.
(7583, 1734, 1, -4493.3, 761.976, 69.7072, 5.42798, 0, 0, -0.414693, 0.909962, 1800, 1800, 1, 100, 0, 10); -- Closest existing guid is 6622 at 1274.016479 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(6626, 1357, 0, 'Gold Vein', 0, 10), -- Gold Veins in Feralas
(7583, 1357, 0, 'Gold Vein', 0, 10); -- Gold Veins in Feralas

-- Missing Gold Vein spawns in Thousand Needles.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(6070, 1734, 1, -5640.35, -2641.38, -53.4689, 3.68265, 0, 0, -0.96363, 0.267241, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 5972 at 341.436157 yards.
(5890, 1734, 1, -4774.29, -1954.05, -48.3147, 5.96903, 0, 0, -0.156434, 0.987688, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 5811 at 194.482788 yards.
(5900, 1734, 1, -5033.33, -2374.65, -54.6469, 1.36136, 0, 0, 0.62932, 0.777146, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 5844 at 179.828430 yards.
(5913, 1734, 1, -4810.13, -1983.76, -53.1975, 2.56563, 0, 0, 0.958819, 0.284016, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 5811 at 152.027573 yards.
(5942, 1734, 1, -5457.67, -2200.77, -57.5791, 3.45576, 0, 0, -0.987688, 0.156436, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 5935 at 209.576187 yards.
(5919, 1734, 1, -4996.56, -856.463, -4.48619, 2.53072, 0, 0, 0.953716, 0.300708, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 5800 at 278.557526 yards.
(5944, 1734, 1, -4300.21, -1016.96, -51.5876, 5.70723, 0, 0, -0.284015, 0.95882, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 5934 at 541.595093 yards.
(5948, 1734, 1, -6714.54, -3789.62, -24.6829, 5.46288, 0, 0, -0.398748, 0.91706, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 5785 at 927.686462 yards.
(6353, 1734, 1, -5072.24, -2388.78, -53.4579, 2.21656, 0, 0, 0.894934, 0.446199, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 5844 at 212.634354 yards.
(7321, 1734, 1, -4682.48, -1486.84, -48.1071, 1.50098, 0, 0, 0.681998, 0.731354, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 5781 at 65.342506 yards.
(7616, 1734, 1, -4521.09, -1129.81, -52.7595, 6.03884, 0, 0, -0.121869, 0.992546, 1800, 1800, 1, 100, 0, 10); -- Closest existing guid is 5934 at 316.505859 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(6070, 1135, 0, 'Gold Vein', 0, 10), -- Gold Veins in Thousand Needles 37 objects total
(5890, 1135, 0, 'Gold Vein', 0, 10), -- Gold Veins in Thousand Needles 37 objects total
(5900, 1135, 0, 'Gold Vein', 0, 10), -- Gold Veins in Thousand Needles 37 objects total
(5913, 1135, 0, 'Gold Vein', 0, 10), -- Gold Veins in Thousand Needles 37 objects total
(5942, 1135, 0, 'Gold Vein', 0, 10), -- Gold Veins in Thousand Needles 37 objects total
(5919, 1135, 0, 'Gold Vein', 0, 10), -- Gold Veins in Thousand Needles 37 objects total
(5944, 1135, 0, 'Gold Vein', 0, 10), -- Gold Veins in Thousand Needles 37 objects total
(5948, 1135, 0, 'Gold Vein', 0, 10), -- Gold Veins in Thousand Needles 37 objects total
(6353, 1135, 0, 'Gold Vein', 0, 10), -- Gold Veins in Thousand Needles 37 objects total
(7321, 1135, 0, 'Gold Vein', 0, 10), -- Gold Veins in Thousand Needles 37 objects total
(7616, 1135, 0, 'Gold Vein', 0, 10); -- Gold Veins in Thousand Needles 37 objects total

-- Missing Gold Vein spawns in Desolace.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(34188, 1734, 1, -926.993, 1758.54, 65.4485, 4.97419, 0, 0, -0.608761, 0.793354, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 34167 at 667.365112 yards.
(34189, 1734, 1, -1002.77, 2398.71, 101.129, 2.58308, 0, 0, 0.961261, 0.27564, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 34167 at 914.956665 yards.
(34190, 1734, 1, -1636.06, 2065.69, 75.1803, 5.81195, 0, 0, -0.233445, 0.97237, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 34167 at 1382.044678 yards.
(34191, 1734, 1, -1838.55, 882.157, 103.443, 3.45576, 0, 0, -0.987688, 0.156436, 1800, 1800, 1, 100, 0, 10); -- Closest existing guid is 34167 at 1840.277344 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(34188, 1347, 0, 'Gold Vein', 0, 10), -- Gold Veins in Desolace
(34189, 1347, 0, 'Gold Vein', 0, 10), -- Gold Veins in Desolace
(34190, 1347, 0, 'Gold Vein', 0, 10), -- Gold Veins in Desolace
(34191, 1347, 0, 'Gold Vein', 0, 10); -- Gold Veins in Desolace

-- Missing Gold Vein spawns in Stonetalon Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(5924, 1734, 1, 2450.95, 1559.48, 277.567, 2.86233, 0, 0, 0.990268, 0.139175, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 5874 at 1024.248779 yards.
(7389, 1734, 1, 2291.5, 1287.59, 346.897, 0.244346, 0, 0, 0.121869, 0.992546, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 5874 at 891.866699 yards.
(7602, 1734, 1, 793.298, 1391.64, -0.47419, 1.32645, 0, 0, 0.615661, 0.788011, 1800, 1800, 1, 100, 0, 10); -- Closest existing guid is 5990 at 70.288254 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(5924, 1093, 0, 'Gold Vein', 0, 10), -- Gold Veins in Stonetalon 14 objects total
(7389, 1093, 0, 'Gold Vein', 0, 10), -- Gold Veins in Stonetalon 14 objects total
(7602, 1093, 0, 'Gold Vein', 0, 10); -- Gold Veins in Stonetalon 14 objects total

-- Missing Gold Vein spawns in Tanaris.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(5782, 1734, 1, -7065.73, -3248.89, 15.4797, 0.610863, 0, 0, 0.300705, 0.953717, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 5779 at 147.397888 yards.
(5901, 1734, 1, -7372.94, -2578.46, 14.7424, 2.30383, 0, 0, 0.913545, 0.406738, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 5856 at 79.943474 yards.
(6850, 1734, 1, -7255.52, -4241.1, 18.2609, 1.13446, 0, 0, 0.537299, 0.843392, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 5820 at 267.361206 yards.
(7348, 1734, 1, -7963.94, -2809.08, 32.9922, 0.628317, 0, 0, 0.309016, 0.951057, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 5858 at 26.898560 yards.
(7388, 1734, 1, -7369.77, -4287.44, 9.05438, 1.95477, 0, 0, 0.829038, 0.559193, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 5876 at 178.180466 yards.
(7598, 1734, 1, -8756.43, -4210.46, 13.8247, 2.04204, 0, 0, 0.85264, 0.522499, 1800, 1800, 1, 100, 0, 10); -- Closest existing guid is 5902 at 170.395599 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(5782, 1201, 0, 'Gold Vein', 0, 10), -- Gold Veins in Tanaris 60 objects total
(5901, 1201, 0, 'Gold Vein', 0, 10), -- Gold Veins in Tanaris 60 objects total
(6850, 1201, 0, 'Gold Vein', 0, 10), -- Gold Veins in Tanaris 60 objects total
(7348, 1201, 0, 'Gold Vein', 0, 10), -- Gold Veins in Tanaris 60 objects total
(7388, 1201, 0, 'Gold Vein', 0, 10), -- Gold Veins in Tanaris 60 objects total
(7598, 1201, 0, 'Gold Vein', 0, 10); -- Gold Veins in Tanaris 60 objects total

-- Missing Gold Vein spawns in Un'Goro Crater.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(7621, 1734, 1, -7967.46, -866.854, -265.651, 0.994837, 0, 0, 0.477158, 0.878817, 1800, 1800, 1, 100, 0, 10); -- Closest existing guid is 5875 at 1576.852783 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(7621, 1346, 0, 'Gold Vein', 0, 10); -- Gold Veins in Un'Goro Crater

-- Missing Gold Vein spawns in Winterspring.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(7013, 1734, 1, 6421.83, -3610.23, 701.964, 2.11185, 0, 0, 0.870356, 0.492424, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6873 at 989.613220 yards.
(7304, 1734, 1, 6694.52, -2552.11, 533.295, 0.820303, 0, 0, 0.398748, 0.91706, 1800, 1800, 1, 100, 0, 10), -- Closest existing guid is 6873 at 313.175446 yards.
(7358, 1734, 1, 7252.51, -4223.3, 732.848, 1.02974, 0, 0, 0.492423, 0.870356, 1800, 1800, 1, 100, 0, 10); -- Closest existing guid is 6873 at 1817.050049 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(7013, 1356, 0, 'Gold Vein', 0, 10), -- Gold Veins in Winterspring
(7304, 1356, 0, 'Gold Vein', 0, 10), -- Gold Veins in Winterspring
(7358, 1356, 0, 'Gold Vein', 0, 10); -- Gold Veins in Winterspring


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
