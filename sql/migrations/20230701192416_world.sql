DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230701192416');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230701192416');
-- Add your query below.


-- Create new pool to hold Solid Chest spawns in Stranglethorn Vale.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(42, 5, 'Solid Chests in Stranglethorn Vale', 0, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(11970, 42, 0, 'Solid Chest', 0, 10),
(12048, 42, 0, 'Solid Chest', 0, 10),
(12054, 42, 0, 'Solid Chest', 0, 10);

-- Create new pool to hold Solid Chest spawns in Alterac Mountains.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(47, 5, 'Solid Chests in Alterac Mountains', 0, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(33206, 47, 0, 'Solid Chest', 0, 10),
(33207, 47, 0, 'Solid Chest', 0, 10),
(33304, 47, 0, 'Solid Chest', 0, 10);

-- Create new pool to hold Solid Chest spawns in Arathi Highlands.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(43, 5, 'Solid Chests in Arathi Highlands', 0, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(16648, 43, 0, 'Solid Chest', 0, 10),
(16946, 43, 0, 'Solid Chest', 0, 10),
(16950, 43, 0, 'Solid Chest', 0, 10);

-- Create new pool to hold Solid Chest spawns in Hillsbrad Foothills.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(45, 3, 'Solid Chests in Hillsbrad Foothills', 0, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(29653, 45, 0, 'Solid Chest', 0, 10),
(30033, 45, 0, 'Solid Chest', 0, 10);

-- Create new pool to hold Solid Chest spawns in Thousand Needles.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(44, 1, 'Solid Chests in Thousand Needles', 0, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(16722, 44, 0, 'Solid Chest', 0, 10);

-- Create new pool to hold Solid Chest spawns in Desolace.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(46, 5, 'Solid Chests in Desolace', 0, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(30169, 46, 0, 'Solid Chest', 0, 10),
(30170, 46, 0, 'Solid Chest', 0, 10),
(30171, 46, 0, 'Solid Chest', 0, 10);

-- Missing Solid Chest spawns in Stranglethorn Vale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(12059, 2855, 0, -12423.7, 580.5, -104.112, 3.927, 0, 0, -0.923879, 0.382686, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 12054 at 738.545105 yards.
(12060, 2855, 0, -12432.5, 613.969, -100.412, 3.89209, 0, 0, -0.930417, 0.366502, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 12054 at 743.132935 yards.
(11993, 2855, 0, -11966.2, -501.725, 17.0796, 5.96903, 0, 0, -0.156434, 0.987688, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 11970 at 80.642982 yards.
(12053, 2855, 0, -11567.4, -574.548, 28.9122, 2.42601, 0, 0, 0.936672, 0.350207, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 12048 at 118.644333 yards.
(11999, 2855, 0, -11993.8, -521.213, 11.9682, 4.17134, 0, 0, -0.870356, 0.492424, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 11970 at 74.448578 yards.
(12062, 2855, 0, -11640.3, -628.344, 31.4617, 4.46804, 0, 0, -0.788011, 0.615662, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 12048 at 84.680046 yards.
(12074, 2855, 0, -11596.3, -614.14, 28.3598, 5.49779, 0, 0, -0.382683, 0.92388, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 12048 at 78.757935 yards.
(12075, 2855, 0, -12012.6, 309.553, 4.12253, 1.27409, 0, 0, 0.594822, 0.803857, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 12054 at 473.693329 yards.
(12076, 2855, 0, -11828.7, 86.4582, 17.4597, 3.76991, 0, 0, -0.951056, 0.309017, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 12054 at 595.481079 yards.
(12077, 2855, 0, -12223.7, 665.631, -70.0086, 4.41568, 0, 0, -0.803857, 0.594823, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 12054 at 530.681519 yards.
(12183, 2855, 0, -12148.2, 626.385, -70.0408, 2.86234, 0, 0, 0.990268, 0.139175, 900, 900, 1, 100, 0, 10); -- Closest existing guid is 12054 at 459.404510 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(12059, 42, 0, 'Solid Chest', 0, 10), -- Solid Chests in Stranglethorn Vale
(12060, 42, 0, 'Solid Chest', 0, 10), -- Solid Chests in Stranglethorn Vale
(11993, 42, 0, 'Solid Chest', 0, 10), -- Solid Chests in Stranglethorn Vale
(12053, 42, 0, 'Solid Chest', 0, 10), -- Solid Chests in Stranglethorn Vale
(11999, 42, 0, 'Solid Chest', 0, 10), -- Solid Chests in Stranglethorn Vale
(12062, 42, 0, 'Solid Chest', 0, 10), -- Solid Chests in Stranglethorn Vale
(12074, 42, 0, 'Solid Chest', 0, 10), -- Solid Chests in Stranglethorn Vale
(12075, 42, 0, 'Solid Chest', 0, 10), -- Solid Chests in Stranglethorn Vale
(12076, 42, 0, 'Solid Chest', 0, 10), -- Solid Chests in Stranglethorn Vale
(12077, 42, 0, 'Solid Chest', 0, 10), -- Solid Chests in Stranglethorn Vale
(12183, 42, 0, 'Solid Chest', 0, 10); -- Solid Chests in Stranglethorn Vale

-- Missing Solid Chest spawns in Alterac Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(33339, 2855, 0, 752.184, -377.159, 141.791, 1.79769, 0, 0, 0.782608, 0.622515, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 33304 at 151.383667 yards.
(33209, 2855, 0, 689.118, -998.653, 170.362, 2.26893, 0, 0, 0.906307, 0.422619, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 33207 at 15.441476 yards.
(33340, 2855, 0, 623.352, -295.892, 152.887, 3.85718, 0, 0, -0.936671, 0.35021, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 33304 at 112.844078 yards.
(33345, 2855, 0, 511.342, -333.542, 153.674, 0.925024, 0, 0, 0.446198, 0.894935, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 33304 at 119.135582 yards.
(33210, 2855, 0, 677.372, -926.412, 171.805, 5.55015, 0, 0, -0.358368, 0.93358, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 33207 at 64.863930 yards.
(33211, 2855, 0, 739.793, -972.271, 167.587, 1.53589, 0, 0, 0.694658, 0.71934, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 33207 at 67.017105 yards.
(33212, 2855, 0, 692.648, -981.781, 165.594, 3.4383, 0, 0, -0.989016, 0.147811, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 33207 at 20.090010 yards.
(33213, 2855, 0, 647.083, -943.691, 166.408, 2.09439, 0, 0, 0.866025, 0.500001, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 33206 at 52.546780 yards.
(33284, 2855, 0, 697.147, -930.974, 171.805, 4.46804, 0, 0, -0.788011, 0.615662, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 33207 at 64.021988 yards.
(33285, 2855, 0, 746.14, -938.872, 166.228, 4.57276, 0, 0, -0.754709, 0.656059, 900, 900, 1, 100, 0, 10); -- Closest existing guid is 33207 at 87.968170 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(33339, 47, 0, 'Solid Chest', 0, 10), -- Solid Chests in Alterac Mountains
(33209, 47, 0, 'Solid Chest', 0, 10), -- Solid Chests in Alterac Mountains
(33340, 47, 0, 'Solid Chest', 0, 10), -- Solid Chests in Alterac Mountains
(33345, 47, 0, 'Solid Chest', 0, 10), -- Solid Chests in Alterac Mountains
(33210, 47, 0, 'Solid Chest', 0, 10), -- Solid Chests in Alterac Mountains
(33211, 47, 0, 'Solid Chest', 0, 10), -- Solid Chests in Alterac Mountains
(33212, 47, 0, 'Solid Chest', 0, 10), -- Solid Chests in Alterac Mountains
(33213, 47, 0, 'Solid Chest', 0, 10), -- Solid Chests in Alterac Mountains
(33284, 47, 0, 'Solid Chest', 0, 10), -- Solid Chests in Alterac Mountains
(33285, 47, 0, 'Solid Chest', 0, 10); -- Solid Chests in Alterac Mountains

-- Missing Solid Chest spawns in Arathi Highlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(16652, 2855, 0, -2062.35, -3330.59, 38.5965, 3.00195, 0, 0, 0.997563, 0.0697661, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 16648 at 19.920498 yards.
(16948, 2855, 0, -793.025, -2082.12, 34.9696, 2.28638, 0, 0, 0.909961, 0.414694, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 16946 at 103.265152 yards.
(16951, 2855, 0, -776.629, -2028.77, 34.105, 1.06465, 0, 0, 0.507538, 0.861629, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 16946 at 47.811516 yards.
(16954, 2855, 0, -878.108, -2069.24, 35.637, 0.383971, 0, 0, 0.190808, 0.981627, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 16946 at 148.424332 yards.
(16955, 2855, 0, -1813.15, -3409.62, 45.5308, 1.01229, 0, 0, 0.484809, 0.87462, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 16950 at 223.670380 yards.
(16958, 2855, 0, -1883.55, -3068.64, 57.881, 4.34587, 0, 0, -0.824126, 0.566406, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 16950 at 282.820862 yards.
(16964, 2855, 0, -1697.28, -3524.51, 61.3946, 0.541051, 0, 0, 0.267238, 0.963631, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 16950 at 284.640991 yards.
(16965, 2855, 0, -1762.35, -3156.06, 31.0001, 0.087266, 0, 0, 0.0436192, 0.999048, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 16950 at 132.045746 yards.
(16675, 2855, 0, -2011.8, -3318.34, 54.4797, 0.925024, 0, 0, 0.446198, 0.894935, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 16648 at 52.169624 yards.
(16676, 2855, 0, -1906.28, -3194.22, 56.5897, 5.74214, 0, 0, -0.267238, 0.963631, 900, 900, 1, 100, 0, 10); -- Closest existing guid is 16648 at 207.264053 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(16652, 43, 0, 'Solid Chest', 0, 10), -- Solid Chests in Arathi Highlands
(16948, 43, 0, 'Solid Chest', 0, 10), -- Solid Chests in Arathi Highlands
(16951, 43, 0, 'Solid Chest', 0, 10), -- Solid Chests in Arathi Highlands
(16954, 43, 0, 'Solid Chest', 0, 10), -- Solid Chests in Arathi Highlands
(16955, 43, 0, 'Solid Chest', 0, 10), -- Solid Chests in Arathi Highlands
(16958, 43, 0, 'Solid Chest', 0, 10), -- Solid Chests in Arathi Highlands
(16964, 43, 0, 'Solid Chest', 0, 10), -- Solid Chests in Arathi Highlands
(16965, 43, 0, 'Solid Chest', 0, 10), -- Solid Chests in Arathi Highlands
(16675, 43, 0, 'Solid Chest', 0, 10), -- Solid Chests in Arathi Highlands
(16676, 43, 0, 'Solid Chest', 0, 10); -- Solid Chests in Arathi Highlands

-- Missing Solid Chest spawns in Hillsbrad Foothills.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(29655, 2855, 0, -1036.14, -370.85, 2.56879, 5.13127, 0, 0, -0.544639, 0.838671, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 29653 at 415.907715 yards.
(29656, 2855, 0, -1068.21, -78.6024, 1.3575, 1.43117, 0, 0, 0.656058, 0.75471, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 29653 at 133.119858 yards.
(29659, 2855, 0, -1072.23, -236.136, 2.41571, 0.610863, 0, 0, 0.300705, 0.953717, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 29653 at 276.443298 yards.
(30243, 2855, 0, -191.322, -330.404, 53.1275, 5.93412, 0, 0, -0.173648, 0.984808, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 30033 at 24.081617 yards.
(30247, 2855, 0, -243.951, -378.061, 47.6736, 1.62316, 0, 0, 0.725374, 0.688355, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 30033 at 62.558270 yards.
(30248, 2855, 0, -274.94, -293.013, 51.4281, 1.65806, 0, 0, 0.737277, 0.675591, 900, 900, 1, 100, 0, 10); -- Closest existing guid is 30033 at 88.813950 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(29655, 45, 0, 'Solid Chest', 0, 10), -- Solid Chests in Hillsbrad Foothills
(29656, 45, 0, 'Solid Chest', 0, 10), -- Solid Chests in Hillsbrad Foothills
(29659, 45, 0, 'Solid Chest', 0, 10), -- Solid Chests in Hillsbrad Foothills
(30243, 45, 0, 'Solid Chest', 0, 10), -- Solid Chests in Hillsbrad Foothills
(30247, 45, 0, 'Solid Chest', 0, 10), -- Solid Chests in Hillsbrad Foothills
(30248, 45, 0, 'Solid Chest', 0, 10); -- Solid Chests in Hillsbrad Foothills

-- Missing Solid Chest spawns in Thousand Needles.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(16729, 2855, 1, -6399.73, -3446.07, -77.6406, 0.541051, 0, 0, 0.267238, 0.963631, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 16722 at 138.131989 yards.
(16730, 2855, 1, -6484.66, -3499.6, -70.0346, 6.10865, 0, 0, -0.0871553, 0.996195, 900, 900, 1, 100, 0, 10); -- Closest existing guid is 16722 at 69.979378 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(16729, 44, 0, 'Solid Chest', 0, 10), -- Solid Chests in Thousand Needles
(16730, 44, 0, 'Solid Chest', 0, 10); -- Solid Chests in Thousand Needles

-- Missing Solid Chest spawns in Desolace.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(30240, 2855, 1, -84.2788, 762.965, 132.892, 3.08918, 0, 0, 0.999657, 0.0262016, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 30171 at 182.883804 yards.
(30241, 2855, 1, -794.729, 930.161, 90.7574, 2.16421, 0, 0, 0.882947, 0.469473, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 30169 at 231.378525 yards.
(30242, 2855, 1, -961.253, 880.802, 91.5103, 2.16421, 0, 0, 0.882947, 0.469473, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 30169 at 59.036720 yards.
(30244, 2855, 1, -403.13, 1876.43, 128.41, 4.83456, 0, 0, -0.66262, 0.748956, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 30170 at 87.383583 yards.
(30245, 2855, 1, -330.01, 1768.85, 139.514, 3.54302, 0, 0, -0.979924, 0.19937, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 30170 at 65.541611 yards.
(30246, 2855, 1, -447.218, 1754.23, 153.488, 3.71755, 0, 0, -0.958819, 0.284016, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 30170 at 71.396606 yards.
(30249, 2855, 1, -127.378, 869.742, 119.095, 2.47837, 0, 0, 0.945518, 0.325568, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 30171 at 219.378937 yards.
(30250, 2855, 1, -339.986, 838.234, 99.0587, 3.85718, 0, 0, -0.936671, 0.35021, 900, 900, 1, 100, 0, 10); -- Closest existing guid is 30171 at 177.108765 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(30240, 46, 0, 'Solid Chest', 0, 10), -- Solid Chests in Desolace
(30241, 46, 0, 'Solid Chest', 0, 10), -- Solid Chests in Desolace
(30242, 46, 0, 'Solid Chest', 0, 10), -- Solid Chests in Desolace
(30244, 46, 0, 'Solid Chest', 0, 10), -- Solid Chests in Desolace
(30245, 46, 0, 'Solid Chest', 0, 10), -- Solid Chests in Desolace
(30246, 46, 0, 'Solid Chest', 0, 10), -- Solid Chests in Desolace
(30249, 46, 0, 'Solid Chest', 0, 10), -- Solid Chests in Desolace
(30250, 46, 0, 'Solid Chest', 0, 10); -- Solid Chests in Desolace

UPDATE `gameobject` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `id`= 2855;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
