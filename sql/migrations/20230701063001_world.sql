DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230701063001');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230701063001');
-- Add your query below.


-- Create new pool to hold Battered Chest spawns in The Barrens.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(11, 10, 'Battered Chests in The Barrens', 0, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(13327, 11, 0, 'Battered Chest', 0, 10),
(13338, 11, 0, 'Battered Chest', 0, 10),
(13339, 11, 0, 'Battered Chest', 0, 10),
(13345, 11, 0, 'Battered Chest', 0, 10),
(13346, 11, 0, 'Battered Chest', 0, 10),
(13347, 11, 0, 'Battered Chest', 0, 10),
(13348, 11, 0, 'Battered Chest', 0, 10),
(13349, 11, 0, 'Battered Chest', 0, 10);

-- Create new pool to hold Battered Chest spawns in Loch Modan.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(10, 9, 'Battered Chests in Loch Modan', 0, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(12796, 10, 0, 'Battered Chest', 0, 10),
(12877, 10, 0, 'Battered Chest', 0, 10),
(12998, 10, 0, 'Battered Chest', 0, 10),
(13209, 10, 0, 'Battered Chest', 0, 10),
(13246, 10, 0, 'Battered Chest', 0, 10),
(13248, 10, 0, 'Battered Chest', 0, 10),
(13426, 10, 0, 'Battered Chest', 0, 10);

-- Create new pool to hold Battered Chest spawns in Westfall.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(13, 13, 'Battered Chests in Westfall', 0, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(42680, 13, 0, 'Battered Chest', 0, 10),
(42718, 13, 0, 'Battered Chest', 0, 10),
(42719, 13, 0, 'Battered Chest', 0, 10),
(42736, 13, 0, 'Battered Chest', 0, 10),
(42738, 13, 0, 'Battered Chest', 0, 10),
(42739, 13, 0, 'Battered Chest', 0, 10),
(42749, 13, 0, 'Battered Chest', 0, 10),
(42681, 13, 0, 'Battered Chest', 0, 10),
(42788, 13, 0, 'Battered Chest', 0, 10);

-- Create new pool to hold Battered Chest spawns in Silverpine Forest.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(12, 10, 'Battered Chests in Silverpine Forest', 0, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(35483, 12, 0, 'Battered Chest', 0, 10),
(35569, 12, 0, 'Battered Chest', 0, 10),
(42067, 12, 0, 'Battered Chest', 0, 10),
(42068, 12, 0, 'Battered Chest', 0, 10),
(42069, 12, 0, 'Battered Chest', 0, 10),
(42077, 12, 0, 'Battered Chest', 0, 10),
(42957, 12, 0, 'Battered Chest', 0, 10);

-- Create new pool to hold Battered Chest spawns in Darkshore.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(15, 5, 'Battered Chests in Darkshore', 0, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(48537, 15, 0, 'Battered Chest', 0, 10),
(48602, 15, 0, 'Battered Chest', 0, 10),
(48623, 15, 0, 'Battered Chest', 0, 10),
(48695, 15, 0, 'Battered Chest', 0, 10);

-- Missing Battered Chest spawns in The Barrens.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(13340, 106319, 1, 1019.25, -3119.55, 80.7686, 2.09439, 0, 0, 0.866025, 0.500001, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 13339 at 466.756683 yards.
(13341, 106319, 1, 1021.24, -3091.91, 91.7103, 2.61799, 0, 0, 0.965925, 0.258821, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 13339 at 442.354797 yards.
(13355, 106319, 1, -1581.39, -3894.96, 13.6611, 0.994837, 0, 0, 0.477159, 0.878817, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 13349 at 225.193863 yards.
(13357, 106319, 1, -1385.64, -2732.88, 91.6845, 4.03171, 0, 0, -0.902585, 0.430512, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 13346 at 410.420380 yards.
(13358, 106319, 1, -1505.74, -3811.72, 23.4231, 5.65487, 0, 0, -0.309016, 0.951057, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 13349 at 247.420792 yards.
(13362, 106319, 1, -175.803, -1799.15, 91.6667, 6.0912, 0, 0, -0.0958452, 0.995396, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 13347 at 357.259064 yards.
(13363, 106319, 1, -1010.49, -2335.26, 91.6865, 1.44862, 0, 0, 0.66262, 0.748956, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 13345 at 291.411865 yards.
(13367, 106319, 1, -52.4683, -1644.27, 91.6667, 0, 0, 0, 0, 1, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 13347 at 282.208160 yards.
(13342, 106319, 1, -1123.9, -2786.77, 91.6816, 0.0698117, 0, 0, 0.0348988, 0.999391, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 13338 at 380.174103 yards.
(13421, 106319, 1, -1296.6, -2839.76, 93.7541, 0.872664, 0, 0, 0.422618, 0.906308, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 13346 at 300.979309 yards.
(13422, 106319, 1, -1710.46, -3836.71, 11.2646, 0.558504, 0, 0, 0.275637, 0.961262, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 13349 at 105.062050 yards.
(13430, 106319, 1, -1051.13, -2027.63, 64.2893, 0.977383, 0, 0, 0.469471, 0.882948, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 13345 at 114.527359 yards.
(13431, 106319, 1, -245.361, -3332.41, 92.4171, 4.08407, 0, 0, -0.891006, 0.453991, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 13348 at 213.802231 yards.
(13432, 106319, 1, -1485.27, -3045.18, 91.6731, 1.58825, 0, 0, 0.71325, 0.70091, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 13346 at 183.703476 yards.
(13343, 106319, 1, 892.032, -2694.98, 100.275, 3.26377, 0, 0, -0.998135, 0.0610518, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 13339 at 62.391731 yards.
(13484, 106319, 1, 72.5329, -2089.05, 91.696, 1.11701, 0, 0, 0.529919, 0.848048, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 13347 at 306.878326 yards.
(13334, 106319, 1, 533.871, -2135.81, 92.5965, 2.80998, 0, 0, 0.986285, 0.16505, 3600, 3600, 1, 100, 0, 10); -- Closest existing guid is 13327 at 188.598953 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(13340, 11, 0, 'Battered Chest', 0, 10), -- Battered Chests in The Barrens
(13341, 11, 0, 'Battered Chest', 0, 10), -- Battered Chests in The Barrens
(13355, 11, 0, 'Battered Chest', 0, 10), -- Battered Chests in The Barrens
(13357, 11, 0, 'Battered Chest', 0, 10), -- Battered Chests in The Barrens
(13358, 11, 0, 'Battered Chest', 0, 10), -- Battered Chests in The Barrens
(13362, 11, 0, 'Battered Chest', 0, 10), -- Battered Chests in The Barrens
(13363, 11, 0, 'Battered Chest', 0, 10), -- Battered Chests in The Barrens
(13367, 11, 0, 'Battered Chest', 0, 10), -- Battered Chests in The Barrens
(13342, 11, 0, 'Battered Chest', 0, 10), -- Battered Chests in The Barrens
(13421, 11, 0, 'Battered Chest', 0, 10), -- Battered Chests in The Barrens
(13422, 11, 0, 'Battered Chest', 0, 10), -- Battered Chests in The Barrens
(13430, 11, 0, 'Battered Chest', 0, 10), -- Battered Chests in The Barrens
(13431, 11, 0, 'Battered Chest', 0, 10), -- Battered Chests in The Barrens
(13432, 11, 0, 'Battered Chest', 0, 10), -- Battered Chests in The Barrens
(13343, 11, 0, 'Battered Chest', 0, 10), -- Battered Chests in The Barrens
(13484, 11, 0, 'Battered Chest', 0, 10), -- Battered Chests in The Barrens
(13334, 11, 0, 'Battered Chest', 0, 10); -- Battered Chests in The Barrens

-- Missing Battered Chest spawns in Loch Modan.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(12905, 106319, 0, -4965.29, -3494.63, 305.484, 3.9619, 0, 0, -0.91706, 0.39875, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 12877 at 163.856018 yards.
(13249, 106319, 0, -5545.99, -2735.77, 366.15, 0.523598, 0, 0, 0.258819, 0.965926, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 13246 at 245.235519 yards.
(13290, 106319, 0, -5395.51, -2709.64, 366.297, 5.44543, 0, 0, -0.406736, 0.913546, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 13246 at 97.180969 yards.
(13328, 106319, 0, -4781.68, -3033.98, 301.639, 2.37364, 0, 0, 0.927183, 0.374608, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 13248 at 147.854706 yards.
(13329, 106319, 0, -4717.31, -3088.1, 306.458, 3.00195, 0, 0, 0.997563, 0.0697661, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 13248 at 225.693665 yards.
(13011, 106319, 0, -4868.91, -3318.01, 305.733, 0.925024, 0, 0, 0.446198, 0.894935, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 12877 at 169.354797 yards.
(13429, 106319, 0, -4978.75, -2963.04, 316.422, 1.62316, 0, 0, 0.725374, 0.688355, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 13426 at 20.925613 yards.
(13330, 106319, 0, -4786.32, -2979.21, 323.459, 2.63544, 0, 0, 0.968147, 0.250381, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 13248 at 135.123459 yards.
(13212, 106319, 0, -5876.54, -2857.96, 366.134, 5.2709, 0, 0, -0.484809, 0.87462, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 13209 at 167.410919 yards.
(13107, 106319, 0, -6094.4, -2773.77, 415.758, 0, 0, 0, 0, 1, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 12998 at 76.417015 yards.
(13213, 106319, 0, -6043.68, -2985.55, 402.241, 6.26573, 0, 0, -0.00872612, 0.999962, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 13209 at 46.307205 yards.
(13331, 106319, 0, -4935.93, -2963.61, 317.672, 5.74214, 0, 0, -0.267238, 0.963631, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 13248 at 36.503899 yards.
(13217, 106319, 0, -6075.44, -3031.93, 401.729, 2.14675, 0, 0, 0.878817, 0.47716, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 13209 at 101.232735 yards.
(12873, 106319, 0, -6145.14, -2943.76, 397.839, 5.044, 0, 0, -0.580703, 0.814116, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 12796 at 21.659779 yards.
(13332, 106319, 0, -4946.25, -2975.34, 321.752, 0.95993, 0, 0, 0.461748, 0.887011, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 13248 at 33.156040 yards.
(13333, 106319, 0, -5053.31, -2681.58, 320.147, 0.733038, 0, 0, 0.358368, 0.93358, 7200, 7200, 1, 100, 0, 10); -- Closest existing guid is 13246 at 253.380997 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(12905, 10, 0, 'Battered Chest', 0, 10), -- Battered Chests in Loch Modan
(13249, 10, 0, 'Battered Chest', 0, 10), -- Battered Chests in Loch Modan
(13290, 10, 0, 'Battered Chest', 0, 10), -- Battered Chests in Loch Modan
(13328, 10, 0, 'Battered Chest', 0, 10), -- Battered Chests in Loch Modan
(13329, 10, 0, 'Battered Chest', 0, 10), -- Battered Chests in Loch Modan
(13011, 10, 0, 'Battered Chest', 0, 10), -- Battered Chests in Loch Modan
(13429, 10, 0, 'Battered Chest', 0, 10), -- Battered Chests in Loch Modan
(13330, 10, 0, 'Battered Chest', 0, 10), -- Battered Chests in Loch Modan
(13212, 10, 0, 'Battered Chest', 0, 10), -- Battered Chests in Loch Modan
(13107, 10, 0, 'Battered Chest', 0, 10), -- Battered Chests in Loch Modan
(13213, 10, 0, 'Battered Chest', 0, 10), -- Battered Chests in Loch Modan
(13331, 10, 0, 'Battered Chest', 0, 10), -- Battered Chests in Loch Modan
(13217, 10, 0, 'Battered Chest', 0, 10), -- Battered Chests in Loch Modan
(12873, 10, 0, 'Battered Chest', 0, 10), -- Battered Chests in Loch Modan
(13332, 10, 0, 'Battered Chest', 0, 10), -- Battered Chests in Loch Modan
(13333, 10, 0, 'Battered Chest', 0, 10); -- Battered Chests in Loch Modan

-- Missing Battered Chest spawns in Westfall.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(42882, 106319, 0, -10646.8, 1381, 41.2197, 5.00909, 0, 0, -0.594823, 0.803857, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 42788 at 368.571930 yards.
(42740, 106319, 0, -10853.5, 1158.33, 37.1684, 3.71755, 0, 0, -0.958819, 0.284016, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 42736 at 278.076843 yards.
(42883, 106319, 0, -10500, 1330.48, 42.5685, 5.65487, 0, 0, -0.309016, 0.951057, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 42788 at 214.593933 yards.
(42754, 106319, 0, -9579.93, 1445.71, 0.427918, 4.66003, 0, 0, -0.725374, 0.688355, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 42749 at 63.144806 yards.
(42693, 106319, 0, -10504.4, 1980.73, 10.7782, 5.13127, 0, 0, -0.544639, 0.838671, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 42680 at 54.837120 yards.
(42755, 106319, 0, -9845.5, 1040.19, 34.0109, 3.94445, 0, 0, -0.920505, 0.390732, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 42739 at 438.000153 yards.
(42720, 106319, 0, -9884.88, 1423.31, 39.9257, 3.05433, 0, 0, 0.999048, 0.0436193, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 42718 at 82.034904 yards.
(42694, 106319, 0, -10430.5, 1929.75, 9.43948, 0.087266, 0, 0, 0.0436192, 0.999048, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 42680 at 48.693802 yards.
(42732, 106319, 0, -10355.7, 1563.4, 41.7598, 1.09956, 0, 0, 0.522498, 0.85264, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 42719 at 279.409668 yards.
(42764, 106319, 0, -11039.1, 1460.17, 45.3211, 3.7001, 0, 0, -0.961261, 0.27564, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 42738 at 201.445038 yards.
(42767, 106319, 0, -11006.6, 1538.17, 44.07, 4.7473, 0, 0, -0.694658, 0.71934, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 42738 at 124.773384 yards.
(42884, 106319, 0, -10204.2, 1181.17, 37.5443, 0.645772, 0, 0, 0.317305, 0.948324, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 42788 at 117.074852 yards.
(42783, 106319, 0, -9576.99, 1069.09, 1.29648, 1.71042, 0, 0, 0.754709, 0.656059, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 42749 at 439.611328 yards.
(42695, 106319, 0, -10720.5, 1851.11, 34.3774, 1.18682, 0, 0, 0.559193, 0.829038, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 42680 at 256.050201 yards.
(42696, 106319, 0, -10537.5, 1995.89, -8.45719, 1.72787, 0, 0, 0.760406, 0.649449, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 42680 at 87.911873 yards.
(42784, 106319, 0, -10995, 1477.86, 50.5872, 0.610863, 0, 0, 0.300705, 0.953717, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 42738 at 186.336121 yards.
(42885, 106319, 0, -10820.5, 1320.3, 34.2893, 2.9496, 0, 0, 0.995396, 0.0958512, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 42738 at 398.740295 yards.
(42886, 106319, 0, -9847.33, 1409.7, 38.8322, 5.91667, 0, 0, -0.182235, 0.983255, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 42718 at 120.171921 yards.
(42887, 106319, 0, -9872.5, 1327.28, 43.0347, 4.41568, 0, 0, -0.803857, 0.594823, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 42718 at 167.275681 yards.
(42697, 106319, 0, -10469.7, 1997.04, 8.38445, 4.67748, 0, 0, -0.719339, 0.694659, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 42680 at 65.541817 yards.
(42889, 106319, 0, -11043.9, 1426.59, 44.3597, 6.23083, 0, 0, -0.0261765, 0.999657, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 42738 at 235.256714 yards.
(42898, 106319, 0, -10300.4, 1402.69, 40.1549, 0.087266, 0, 0, 0.0436192, 0.999048, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 42788 at 174.826538 yards.
(42925, 106319, 0, -9909, 1443.03, 38.9455, 3.21142, 0, 0, -0.999391, 0.0349061, 3600, 3600, 1, 100, 0, 10); -- Closest existing guid is 42718 at 50.909740 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(42882, 13, 0, 'Battered Chest', 0, 10), -- Battered Chests in Westfall
(42740, 13, 0, 'Battered Chest', 0, 10), -- Battered Chests in Westfall
(42883, 13, 0, 'Battered Chest', 0, 10), -- Battered Chests in Westfall
(42754, 13, 0, 'Battered Chest', 0, 10), -- Battered Chests in Westfall
(42693, 13, 0, 'Battered Chest', 0, 10), -- Battered Chests in Westfall
(42755, 13, 0, 'Battered Chest', 0, 10), -- Battered Chests in Westfall
(42720, 13, 0, 'Battered Chest', 0, 10), -- Battered Chests in Westfall
(42694, 13, 0, 'Battered Chest', 0, 10), -- Battered Chests in Westfall
(42732, 13, 0, 'Battered Chest', 0, 10), -- Battered Chests in Westfall
(42764, 13, 0, 'Battered Chest', 0, 10), -- Battered Chests in Westfall
(42767, 13, 0, 'Battered Chest', 0, 10), -- Battered Chests in Westfall
(42884, 13, 0, 'Battered Chest', 0, 10), -- Battered Chests in Westfall
(42783, 13, 0, 'Battered Chest', 0, 10), -- Battered Chests in Westfall
(42695, 13, 0, 'Battered Chest', 0, 10), -- Battered Chests in Westfall
(42696, 13, 0, 'Battered Chest', 0, 10), -- Battered Chests in Westfall
(42784, 13, 0, 'Battered Chest', 0, 10), -- Battered Chests in Westfall
(42885, 13, 0, 'Battered Chest', 0, 10), -- Battered Chests in Westfall
(42886, 13, 0, 'Battered Chest', 0, 10), -- Battered Chests in Westfall
(42887, 13, 0, 'Battered Chest', 0, 10), -- Battered Chests in Westfall
(42697, 13, 0, 'Battered Chest', 0, 10), -- Battered Chests in Westfall
(42889, 13, 0, 'Battered Chest', 0, 10), -- Battered Chests in Westfall
(42898, 13, 0, 'Battered Chest', 0, 10), -- Battered Chests in Westfall
(42925, 13, 0, 'Battered Chest', 0, 10); -- Battered Chests in Westfall

-- Missing Battered Chest spawns in Silverpine Forest.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(35573, 106319, 0, 1298.63, 665.104, 32.3069, 0.855211, 0, 0, 0.414693, 0.909961, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 35569 at 68.963860 yards.
(42097, 106319, 0, 1007.36, 1566.84, 28.9856, 1.32645, 0, 0, 0.615661, 0.788011, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 42069 at 86.944069 yards.
(42129, 106319, 0, 983.86, 1199.85, 48.4682, 0.680677, 0, 0, 0.333806, 0.942642, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 42068 at 29.424250 yards.
(42174, 106319, 0, 981.954, 1425.01, 38.3619, 0.226892, 0, 0, 0.113203, 0.993572, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 42069 at 187.650620 yards.
(35505, 106319, 0, -338.33, 1597.92, 17.0153, 5.68977, 0, 0, -0.292372, 0.956305, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 35483 at 145.120895 yards.
(42175, 106319, 0, 1054.63, 1601.91, 29.0636, 5.02655, 0, 0, -0.587785, 0.809017, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 42069 at 47.454609 yards.
(42176, 106319, 0, 1036.52, 1620.64, 25.1019, 0.820303, 0, 0, 0.398748, 0.91706, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 42069 at 73.204010 yards.
(42177, 106319, 0, 1115.22, 1107.16, 41.4903, 4.38078, 0, 0, -0.814116, 0.580703, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 42068 at 187.907303 yards.
(42178, 106319, 0, 875.372, 1241.4, 46.9581, 5.63741, 0, 0, -0.317305, 0.948324, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 42068 at 95.352806 yards.
(35590, 106319, 0, 1208.59, 896.665, 33.4174, 2.61799, 0, 0, 0.965925, 0.258821, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 35569 at 203.411636 yards.
(35591, 106319, 0, 1175.96, 931.949, 33.0883, 3.89209, 0, 0, -0.930417, 0.366502, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 35569 at 251.073822 yards.
(35597, 106319, 0, 1158.05, 965.709, 32.3014, 3.07177, 0, 0, 0.999391, 0.0349061, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 35569 at 288.949890 yards.
(42179, 106319, 0, 996.038, 1571.19, 28.7842, 1.11701, 0, 0, 0.529919, 0.848048, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 42069 at 97.939308 yards.
(42961, 106319, 0, 110.101, 1446.49, 114.696, 4.86947, 0, 0, -0.649447, 0.760406, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 42957 at 101.871544 yards.
(35519, 106319, 0, -336.079, 1516.02, 16.8309, 5.07891, 0, 0, -0.566406, 0.824126, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 35483 at 81.993172 yards.
(42966, 106319, 0, 134.839, 1506.64, 114.412, 3.76991, 0, 0, -0.951056, 0.309017, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 42957 at 36.940536 yards.
(42180, 106319, 0, 844.727, 1920.26, -4.62497, 2.44346, 0, 0, 0.939692, 0.34202, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 42067 at 309.361847 yards.
(42181, 106319, 0, 874.681, 1237.96, 52.6016, 6.00393, 0, 0, -0.139173, 0.990268, 7200, 7200, 1, 100, 0, 10); -- Closest existing guid is 42068 at 95.621971 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(35573, 12, 0, 'Battered Chest', 0, 10), -- Battered Chests in Silverpine Forest
(42097, 12, 0, 'Battered Chest', 0, 10), -- Battered Chests in Silverpine Forest
(42129, 12, 0, 'Battered Chest', 0, 10), -- Battered Chests in Silverpine Forest
(42174, 12, 0, 'Battered Chest', 0, 10), -- Battered Chests in Silverpine Forest
(35505, 12, 0, 'Battered Chest', 0, 10), -- Battered Chests in Silverpine Forest
(42175, 12, 0, 'Battered Chest', 0, 10), -- Battered Chests in Silverpine Forest
(42176, 12, 0, 'Battered Chest', 0, 10), -- Battered Chests in Silverpine Forest
(42177, 12, 0, 'Battered Chest', 0, 10), -- Battered Chests in Silverpine Forest
(42178, 12, 0, 'Battered Chest', 0, 10), -- Battered Chests in Silverpine Forest
(35590, 12, 0, 'Battered Chest', 0, 10), -- Battered Chests in Silverpine Forest
(35591, 12, 0, 'Battered Chest', 0, 10), -- Battered Chests in Silverpine Forest
(35597, 12, 0, 'Battered Chest', 0, 10), -- Battered Chests in Silverpine Forest
(42179, 12, 0, 'Battered Chest', 0, 10), -- Battered Chests in Silverpine Forest
(42961, 12, 0, 'Battered Chest', 0, 10), -- Battered Chests in Silverpine Forest
(35519, 12, 0, 'Battered Chest', 0, 10), -- Battered Chests in Silverpine Forest
(42966, 12, 0, 'Battered Chest', 0, 10), -- Battered Chests in Silverpine Forest
(42180, 12, 0, 'Battered Chest', 0, 10), -- Battered Chests in Silverpine Forest
(42181, 12, 0, 'Battered Chest', 0, 10); -- Battered Chests in Silverpine Forest

-- Missing Battered Chest spawns in Darkshore.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(48629, 106319, 1, 7137.15, 537.865, 0.242076, 2.30383, 0, 0, 0.913545, 0.406738, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 48623 at 804.497437 yards.
(48697, 106319, 1, 6750.87, -694.535, 89.5886, 5.3058, 0, 0, -0.469471, 0.882948, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 48695 at 87.766159 yards.
(48604, 106319, 1, 5792.47, 214.896, 30.0395, 3.03684, 0, 0, 0.998629, 0.0523532, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 48602 at 94.872337 yards.
(48638, 106319, 1, 5627.37, 163.007, 32.416, 4.79966, 0, 0, -0.67559, 0.737278, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 48602 at 148.545975 yards.
(48646, 106319, 1, 6744.83, -207.431, 33.7675, 3.15906, 0, 0, -0.999962, 0.00873464, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 48623 at 65.830460 yards.
(48704, 106319, 1, 6719.12, -642.526, 69.5251, 5.68977, 0, 0, -0.292372, 0.956305, 7200, 7200, 1, 100, 0, 10); -- Closest existing guid is 48695 at 146.405090 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(48629, 15, 0, 'Battered Chest', 0, 10), -- Battered Chests in Darkshore
(48697, 15, 0, 'Battered Chest', 0, 10), -- Battered Chests in Darkshore
(48604, 15, 0, 'Battered Chest', 0, 10), -- Battered Chests in Darkshore
(48638, 15, 0, 'Battered Chest', 0, 10), -- Battered Chests in Darkshore
(48646, 15, 0, 'Battered Chest', 0, 10), -- Battered Chests in Darkshore
(48704, 15, 0, 'Battered Chest', 0, 10); -- Battered Chests in Darkshore
UPDATE `gameobject` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `id`= 106319;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
