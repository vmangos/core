DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230701201101');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230701201101');
-- Add your query below.


-- Create new pool to hold Solid Chest spawns in Badlands.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(50, 3, 'Solid Chests in Badlands', 0, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(11440, 50, 0, 'Solid Chest', 0, 10),
(11501, 50, 0, 'Solid Chest', 0, 10),
(11503, 50, 0, 'Solid Chest', 0, 10);

-- Create new pool to hold Solid Chest spawns in Swamp of Sorrows.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(54, 3, 'Solid Chests in Swamp of Sorrows', 0, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(30992, 54, 0, 'Solid Chest', 0, 10),
(31014, 54, 0, 'Solid Chest', 0, 10),
(31016, 54, 0, 'Solid Chest', 0, 10);

-- Create new pool to hold Solid Chest spawns in Dustwallow Marsh.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(48, 4, 'Solid Chests in Dustwallow Marsh', 0, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(9096, 48, 0, 'Solid Chest', 0, 10),
(13632, 48, 0, 'Solid Chest', 0, 10),
(14618, 48, 0, 'Solid Chest', 0, 10),
(55967, 48, 0, 'Solid Chest', 0, 10);

-- Create new pool to hold Solid Chest spawns in Stranglethorn Vale.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(51, 4, 'Solid Chests in Stranglethorn Vale', 0, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(11691, 51, 0, 'Solid Chest', 0, 10),
(12049, 51, 0, 'Solid Chest', 0, 10),
(12119, 51, 0, 'Solid Chest', 0, 10),
(12169, 51, 0, 'Solid Chest', 0, 10);

-- Create new pool to hold Solid Chest spawns in Alterac Mountains.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(55, 3, 'Solid Chests in Alterac Mountains', 0, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(33193, 55, 0, 'Solid Chest', 0, 10),
(33200, 55, 0, 'Solid Chest', 0, 10),
(33208, 55, 0, 'Solid Chest', 0, 10);

-- Create new pool to hold Solid Chest spawns in Arathi Highlands.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(52, 8, 'Solid Chests in Arathi Highlands', 0, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(16789, 52, 0, 'Solid Chest', 0, 10),
(16794, 52, 0, 'Solid Chest', 0, 10),
(16949, 52, 0, 'Solid Chest', 0, 10),
(16977, 52, 0, 'Solid Chest', 0, 10),
(16978, 52, 0, 'Solid Chest', 0, 10);

-- Create new pool to hold Solid Chest spawns in Desolace.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(53, 5, 'Solid Chests in Desolace', 0, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(30178, 53, 0, 'Solid Chest', 0, 10),
(30182, 53, 0, 'Solid Chest', 0, 10),
(30183, 53, 0, 'Solid Chest', 0, 10),
(30184, 53, 0, 'Solid Chest', 0, 10);

-- Missing Solid Chest spawns in Badlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(11516, 2857, 0, -6368.06, -3135.1, 283.889, 1.46608, 0, 0, 0.66913, 0.743145, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 11501 at 47.945583 yards.
(11442, 2857, 0, -7018.64, -3341.54, 241.667, 6.19592, 0, 0, -0.0436192, 0.999048, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 11440 at 552.857544 yards.
(11517, 2857, 0, -6823.49, -2813.37, 242.632, 2.84488, 0, 0, 0.989016, 0.147811, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 11503 at 496.787292 yards.
(11458, 2857, 0, -6381.32, -3413.04, 241.666, 3.00195, 0, 0, 0.997563, 0.0697661, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 11440 at 88.510536 yards.
(11518, 2857, 0, -6321.2, -3088.82, 301.113, 5.65487, 0, 0, -0.309016, 0.951057, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 11501 at 36.241318 yards.
(11519, 2857, 0, -6324.55, -3111.33, 300.279, 3.49067, 0, 0, -0.984807, 0.173652, 7200, 7200, 1, 100, 0, 10); -- Closest existing guid is 11501 at 38.238125 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(11516, 50, 0, 'Solid Chest', 0, 10), -- Solid Chests in Badlands
(11442, 50, 0, 'Solid Chest', 0, 10), -- Solid Chests in Badlands
(11517, 50, 0, 'Solid Chest', 0, 10), -- Solid Chests in Badlands
(11458, 50, 0, 'Solid Chest', 0, 10), -- Solid Chests in Badlands
(11518, 50, 0, 'Solid Chest', 0, 10), -- Solid Chests in Badlands
(11519, 50, 0, 'Solid Chest', 0, 10); -- Solid Chests in Badlands

-- Missing Solid Chest spawns in Swamp of Sorrows.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(31019, 2857, 0, -10477.4, -2541.66, 19.6449, 4.01426, 0, 0, -0.906307, 0.422619, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 31016 at 234.161453 yards.
(30993, 2857, 0, -9985.92, -3625.97, 22.379, 4.38078, 0, 0, -0.814116, 0.580703, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 30992 at 72.803703 yards.
(30999, 2857, 0, -9977.39, -3658.88, 21.8357, 1.36136, 0, 0, 0.62932, 0.777146, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 30992 at 38.951431 yards.
(31024, 2857, 0, -10143.9, -2490.89, 24.6832, 3.90954, 0, 0, -0.927183, 0.374608, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 31016 at 569.906677 yards.
(31010, 2857, 0, -9942.67, -3645.36, 23.6189, 1.51844, 0, 0, 0.688354, 0.725374, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 30992 at 53.673172 yards.
(31015, 2857, 0, -10002, -3529.93, 22.3611, 2.72271, 0, 0, 0.978148, 0.207912, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 31014 at 87.629051 yards.
(31013, 2857, 0, -9957.83, -3600.77, 22.7541, 3.31614, 0, 0, -0.996194, 0.087165, 3600, 3600, 1, 100, 0, 10); -- Closest existing guid is 30992 at 94.410912 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(31019, 54, 0, 'Solid Chest', 0, 10), -- Solid Chests in Swamp of Sorrows
(30993, 54, 0, 'Solid Chest', 0, 10), -- Solid Chests in Swamp of Sorrows
(30999, 54, 0, 'Solid Chest', 0, 10), -- Solid Chests in Swamp of Sorrows
(31024, 54, 0, 'Solid Chest', 0, 10), -- Solid Chests in Swamp of Sorrows
(31010, 54, 0, 'Solid Chest', 0, 10), -- Solid Chests in Swamp of Sorrows
(31015, 54, 0, 'Solid Chest', 0, 10), -- Solid Chests in Swamp of Sorrows
(31013, 54, 0, 'Solid Chest', 0, 10); -- Solid Chests in Swamp of Sorrows

-- Missing Solid Chest spawns in Dustwallow Marsh.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(55972, 2857, 1, -2987.63, -4292.42, 0.062737, 6.10865, 0, 0, -0.0871553, 0.996195, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 55967 at 67.159653 yards.
(13633, 2857, 1, -2668.7, -4211.17, 0.174256, 3.01941, 0, 0, 0.998135, 0.0610518, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 13632 at 254.883499 yards.
(55973, 2857, 1, -2699.24, -4286.74, 5.33991, 0.610863, 0, 0, 0.300705, 0.953717, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 55967 at 284.348083 yards.
(13637, 2857, 1, -2562.67, -3982.02, 8.77391, 1.41372, 0, 0, 0.649447, 0.760406, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 13632 at 74.184601 yards.
(13638, 2857, 1, -2372.9, -4076.46, 6.72439, 4.11898, 0, 0, -0.882947, 0.469473, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 13632 at 140.627121 yards.
(13639, 2857, 1, -2609.92, -4002.35, 4.1186, 0.0523589, 0, 0, 0.0261765, 0.999657, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 13632 at 111.109161 yards.
(14622, 2857, 1, -2817.19, -2582.32, 33.2436, 5.79449, 0, 0, -0.241921, 0.970296, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 14618 at 52.997810 yards.
(14623, 2857, 1, -2757.04, -2596.21, 28.899, 5.81195, 0, 0, -0.233445, 0.97237, 7200, 7200, 1, 100, 0, 10); -- Closest existing guid is 14618 at 41.448399 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(55972, 48, 0, 'Solid Chest', 0, 10), -- Solid Chests in Dustwallow Marsh
(13633, 48, 0, 'Solid Chest', 0, 10), -- Solid Chests in Dustwallow Marsh
(55973, 48, 0, 'Solid Chest', 0, 10), -- Solid Chests in Dustwallow Marsh
(13637, 48, 0, 'Solid Chest', 0, 10), -- Solid Chests in Dustwallow Marsh
(13638, 48, 0, 'Solid Chest', 0, 10), -- Solid Chests in Dustwallow Marsh
(13639, 48, 0, 'Solid Chest', 0, 10), -- Solid Chests in Dustwallow Marsh
(14622, 48, 0, 'Solid Chest', 0, 10), -- Solid Chests in Dustwallow Marsh
(14623, 48, 0, 'Solid Chest', 0, 10); -- Solid Chests in Dustwallow Marsh

-- Missing Solid Chest spawns in Stranglethorn Vale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(12213, 2857, 0, -12140.4, -187.807, 31.6856, 2.04204, 0, 0, 0.85264, 0.522499, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 12119 at 154.290222 yards.
(12002, 2857, 0, -11667.2, 919.916, 3.42246, 1.88495, 0, 0, 0.809016, 0.587786, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 11691 at 333.149780 yards.
(12214, 2857, 0, -11401.3, -788.461, 15.1698, 3.52557, 0, 0, -0.981627, 0.190812, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 12049 at 99.885208 yards.
(12005, 2857, 0, -11535.5, 547.522, 50.7442, 1.81514, 0, 0, 0.788011, 0.615662, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 11691 at 69.257172 yards.
(12215, 2857, 0, -11504.7, -945.71, 29.2273, 1.13446, 0, 0, 0.537299, 0.843392, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 12049 at 100.901634 yards.
(12217, 2857, 0, -12520.1, -729.142, 39.9971, 2.89725, 0, 0, 0.992546, 0.12187, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 12169 at 359.458832 yards.
(12219, 2857, 0, -12479.1, -178.103, 14.1062, 2.04204, 0, 0, 0.85264, 0.522499, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 12119 at 326.131195 yards.
(12220, 2857, 0, -12682.9, -446.287, 32.5956, 3.89209, 0, 0, -0.930417, 0.366502, 3600, 3600, 1, 100, 0, 10); -- Closest existing guid is 12169 at 401.411804 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(12213, 51, 0, 'Solid Chest', 0, 10), -- Solid Chests in Stranglethorn Vale
(12002, 51, 0, 'Solid Chest', 0, 10), -- Solid Chests in Stranglethorn Vale
(12214, 51, 0, 'Solid Chest', 0, 10), -- Solid Chests in Stranglethorn Vale
(12005, 51, 0, 'Solid Chest', 0, 10), -- Solid Chests in Stranglethorn Vale
(12215, 51, 0, 'Solid Chest', 0, 10), -- Solid Chests in Stranglethorn Vale
(12217, 51, 0, 'Solid Chest', 0, 10), -- Solid Chests in Stranglethorn Vale
(12219, 51, 0, 'Solid Chest', 0, 10), -- Solid Chests in Stranglethorn Vale
(12220, 51, 0, 'Solid Chest', 0, 10); -- Solid Chests in Stranglethorn Vale

-- Missing Solid Chest spawns in Alterac Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(33202, 2857, 0, 457.387, -219.749, 152.522, 0.488691, 0, 0, 0.241921, 0.970296, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 33200 at 48.214565 yards.
(33204, 2857, 0, 512.952, -213.591, 176.603, 2.51327, 0, 0, 0.951056, 0.309017, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 33200 at 27.407286 yards.
(33286, 2857, 0, 1215.36, -326.468, 48.3828, 0.942477, 0, 0, 0.45399, 0.891007, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 33208 at 24.083048 yards.
(33287, 2857, 0, 1115.39, -344.917, 43.6731, 5.51524, 0, 0, -0.374606, 0.927184, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 33208 at 115.622452 yards.
(33195, 2857, 0, 1108.17, -719.517, 71.5193, 3.99681, 0, 0, -0.909961, 0.414694, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 33193 at 139.736832 yards.
(33288, 2857, 0, 1218.23, -266.605, 34.6575, 5.14872, 0, 0, -0.537299, 0.843392, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 33208 at 39.262211 yards.
(33205, 2857, 0, 491.948, -202.401, 167.739, 4.83456, 0, 0, -0.66262, 0.748956, 7200, 7200, 1, 100, 0, 10); -- Closest existing guid is 33200 at 19.100042 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(33202, 55, 0, 'Solid Chest', 0, 10), -- Solid Chests in Alterac Mountains
(33204, 55, 0, 'Solid Chest', 0, 10), -- Solid Chests in Alterac Mountains
(33286, 55, 0, 'Solid Chest', 0, 10), -- Solid Chests in Alterac Mountains
(33287, 55, 0, 'Solid Chest', 0, 10), -- Solid Chests in Alterac Mountains
(33195, 55, 0, 'Solid Chest', 0, 10), -- Solid Chests in Alterac Mountains
(33288, 55, 0, 'Solid Chest', 0, 10), -- Solid Chests in Alterac Mountains
(33205, 55, 0, 'Solid Chest', 0, 10); -- Solid Chests in Alterac Mountains

-- Missing Solid Chest spawns in Arathi Highlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(16979, 2857, 0, -1712.67, -1793.71, 101.708, 3.85718, 0, 0, -0.936671, 0.35021, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 16978 at 94.287552 yards.
(16858, 2857, 0, -1749.69, -1682.1, 52.7428, 4.7473, 0, 0, -0.694658, 0.71934, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 16789 at 153.391525 yards.
(16859, 2857, 0, -2230.21, -1469.4, -46.3219, 3.85718, 0, 0, -0.936671, 0.35021, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 16794 at 163.797531 yards.
(16870, 2857, 0, -1789.1, -1580.76, 52.8563, 0.314158, 0, 0, 0.156434, 0.987688, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 16789 at 104.803162 yards.
(16980, 2857, 0, -1677.67, -1769.35, 81.2149, 4.59022, 0, 0, -0.748956, 0.66262, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 16978 at 121.858360 yards.
(16871, 2857, 0, -1732.96, -1522.51, 55.1346, 4.32842, 0, 0, -0.829037, 0.559194, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 16789 at 43.780312 yards.
(16880, 2857, 0, -2169.96, -1708.87, -46.6102, 1.18682, 0, 0, 0.559193, 0.829038, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 16794 at 87.750122 yards.
(16903, 2857, 0, -1690.85, -1662.12, 59.7234, 1.44862, 0, 0, 0.66262, 0.748956, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 16789 at 122.506477 yards.
(16904, 2857, 0, -2283.33, -1611.53, -66.2569, 6.21337, 0, 0, -0.0348988, 0.999391, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 16794 at 116.510132 yards.
(16966, 2857, 0, -2051.7, -2796.66, 72.4766, 5.20108, 0, 0, -0.515038, 0.857168, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 16949 at 133.562668 yards.
(16981, 2857, 0, -1641.21, -1894.65, 81.4397, 3.00195, 0, 0, 0.997563, 0.0697661, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 16978 at 73.033188 yards.
(16967, 2857, 0, -2092.36, -2817.31, 81.4316, 0.174532, 0, 0, 0.0871553, 0.996195, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 16949 at 176.432556 yards.
(16982, 2857, 0, -934.741, -3846.92, 147.729, 5.93412, 0, 0, -0.173648, 0.984808, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 16977 at 105.658112 yards.
(16968, 2857, 0, -1986.08, -2782.04, 81.5256, 0.925024, 0, 0, 0.446198, 0.894935, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 16949 at 69.068619 yards.
(16969, 2857, 0, -1950.47, -2803.63, 80.7643, 3.83973, 0, 0, -0.939692, 0.34202, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 16949 at 36.070541 yards.
(16988, 2857, 0, -862.458, -3948.8, 152.344, 6.26573, 0, 0, -0.00872612, 0.999962, 7200, 7200, 1, 100, 0, 10); -- Closest existing guid is 16977 at 45.698059 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(16979, 52, 0, 'Solid Chest', 0, 10), -- Solid Chests in Arathi Highlands
(16858, 52, 0, 'Solid Chest', 0, 10), -- Solid Chests in Arathi Highlands
(16859, 52, 0, 'Solid Chest', 0, 10), -- Solid Chests in Arathi Highlands
(16870, 52, 0, 'Solid Chest', 0, 10), -- Solid Chests in Arathi Highlands
(16980, 52, 0, 'Solid Chest', 0, 10), -- Solid Chests in Arathi Highlands
(16871, 52, 0, 'Solid Chest', 0, 10), -- Solid Chests in Arathi Highlands
(16880, 52, 0, 'Solid Chest', 0, 10), -- Solid Chests in Arathi Highlands
(16903, 52, 0, 'Solid Chest', 0, 10), -- Solid Chests in Arathi Highlands
(16904, 52, 0, 'Solid Chest', 0, 10), -- Solid Chests in Arathi Highlands
(16966, 52, 0, 'Solid Chest', 0, 10), -- Solid Chests in Arathi Highlands
(16981, 52, 0, 'Solid Chest', 0, 10), -- Solid Chests in Arathi Highlands
(16967, 52, 0, 'Solid Chest', 0, 10), -- Solid Chests in Arathi Highlands
(16982, 52, 0, 'Solid Chest', 0, 10), -- Solid Chests in Arathi Highlands
(16968, 52, 0, 'Solid Chest', 0, 10), -- Solid Chests in Arathi Highlands
(16969, 52, 0, 'Solid Chest', 0, 10), -- Solid Chests in Arathi Highlands
(16988, 52, 0, 'Solid Chest', 0, 10); -- Solid Chests in Arathi Highlands

-- Missing Solid Chest spawns in Desolace.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(30251, 2857, 1, -1757.97, 911.563, 92.4926, 2.49582, 0, 0, 0.948323, 0.317306, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 30183 at 414.788879 yards.
(30252, 2857, 1, -1191.4, 2860.78, 139.005, 5.5676, 0, 0, -0.350207, 0.936672, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 30184 at 212.587509 yards.
(30253, 2857, 1, -1364.17, 2916.2, 127.253, 4.4855, 0, 0, -0.782608, 0.622515, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 30184 at 151.205841 yards.
(30254, 2857, 1, -1333.23, 2760.84, 113.199, 2.44346, 0, 0, 0.939692, 0.34202, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 30184 at 47.242317 yards.
(30255, 2857, 1, -1696.59, 1021.16, 89.2987, 3.6652, 0, 0, -0.965925, 0.258821, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 30183 at 367.927338 yards.
(30256, 2857, 1, -1905.2, 998.873, 90.611, 5.67232, 0, 0, -0.300705, 0.953717, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 30183 at 277.356689 yards.
(30257, 2857, 1, -2384.47, 2408.75, 76.4762, 3.75246, 0, 0, -0.953716, 0.300708, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 30178 at 36.092865 yards.
(30258, 2857, 1, -1200.01, 2761.32, 111.421, 1.50098, 0, 0, 0.681998, 0.731354, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 30184 at 180.189621 yards.
(30259, 2857, 1, -1133.85, 2694.59, 111.414, 2.93214, 0, 0, 0.994521, 0.104536, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 30184 at 256.573273 yards.
(30260, 2857, 1, -1287.23, 2903.94, 113.557, 4.4855, 0, 0, -0.782608, 0.622515, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 30184 at 165.839798 yards.
(30261, 2857, 1, -1902.34, 1107.68, 92.3415, 0.122173, 0, 0, 0.0610485, 0.998135, 7200, 7200, 1, 100, 0, 10); -- Closest existing guid is 30183 at 174.296082 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(30251, 53, 0, 'Solid Chest', 0, 10), -- Solid Chests in Desolace
(30252, 53, 0, 'Solid Chest', 0, 10), -- Solid Chests in Desolace
(30253, 53, 0, 'Solid Chest', 0, 10), -- Solid Chests in Desolace
(30254, 53, 0, 'Solid Chest', 0, 10), -- Solid Chests in Desolace
(30255, 53, 0, 'Solid Chest', 0, 10), -- Solid Chests in Desolace
(30256, 53, 0, 'Solid Chest', 0, 10), -- Solid Chests in Desolace
(30257, 53, 0, 'Solid Chest', 0, 10), -- Solid Chests in Desolace
(30258, 53, 0, 'Solid Chest', 0, 10), -- Solid Chests in Desolace
(30259, 53, 0, 'Solid Chest', 0, 10), -- Solid Chests in Desolace
(30260, 53, 0, 'Solid Chest', 0, 10), -- Solid Chests in Desolace
(30261, 53, 0, 'Solid Chest', 0, 10); -- Solid Chests in Desolace

UPDATE `gameobject` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `id`= 2857;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
