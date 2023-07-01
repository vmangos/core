DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230701160230');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230701160230');
-- Add your query below.


-- Create new pool to hold Battered Chest spawns in The Barrens.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(33, 5, 'Battered Chests in The Barrens', 0, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(13066, 33, 0, 'Battered Chest', 0, 10),
(13068, 33, 0, 'Battered Chest', 0, 10),
(13071, 33, 0, 'Battered Chest', 0, 10),
(13073, 33, 0, 'Battered Chest', 0, 10),
(13074, 33, 0, 'Battered Chest', 0, 10);

-- Create new pool to hold Battered Chest spawns in Loch Modan.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(32, 3, 'Battered Chests in Loch Modan', 0, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(12909, 32, 0, 'Battered Chest', 0, 10),
(12926, 32, 0, 'Battered Chest', 0, 10),
(13197, 32, 0, 'Battered Chest', 0, 10),
(13437, 32, 0, 'Battered Chest', 0, 10);

-- Create new pool to hold Battered Chest spawns in Westfall.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(37, 5, 'Battered Chests in Westfall', 0, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(42684, 37, 0, 'Battered Chest', 0, 10),
(42734, 37, 0, 'Battered Chest', 0, 10);

-- Create new pool to hold Battered Chest spawns in Redridge Mountains.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(34, 5, 'Battered Chests in Redridge Mountains', 0, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(20651, 34, 0, 'Battered Chest', 0, 10),
(20798, 34, 0, 'Battered Chest', 0, 10),
(28632, 34, 0, 'Battered Chest', 0, 10),
(31122, 34, 0, 'Battered Chest', 0, 10),
(31127, 34, 0, 'Battered Chest', 0, 10),
(31130, 34, 0, 'Battered Chest', 0, 10);

-- Create new pool to hold Battered Chest spawns in Silverpine Forest.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(35, 5, 'Battered Chests in Silverpine Forest', 0, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(35436, 35, 0, 'Battered Chest', 0, 10),
(35447, 35, 0, 'Battered Chest', 0, 10),
(35484, 35, 0, 'Battered Chest', 0, 10),
(35487, 35, 0, 'Battered Chest', 0, 10);

-- Create new pool to hold Battered Chest spawns in Darkshore.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(40, 8, 'Battered Chests in Darkshore', 0, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(48492, 40, 0, 'Battered Chest', 0, 10),
(48531, 40, 0, 'Battered Chest', 0, 10),
(48727, 40, 0, 'Battered Chest', 0, 10),
(48756, 40, 0, 'Battered Chest', 0, 10);

-- Create new pool to hold Battered Chest spawns in Ashenvale.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(39, 3, 'Battered Chests in Ashenvale', 0, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(47813, 39, 0, 'Battered Chest', 0, 10),
(47814, 39, 0, 'Battered Chest', 0, 10);

-- Create new pool to hold Battered Chest spawns in Stonetalon Mountains.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(36, 5, 'Battered Chests in Stonetalon Mountains', 0, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(40707, 36, 0, 'Battered Chest', 0, 10),
(40708, 36, 0, 'Battered Chest', 0, 10),
(40709, 36, 0, 'Battered Chest', 0, 10),
(40710, 36, 0, 'Battered Chest', 0, 10),
(40711, 36, 0, 'Battered Chest', 0, 10);

-- Missing Battered Chest spawns in The Barrens.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(13114, 2849, 1, -2009.46, -2134.78, 91.6725, 0.314158, 0, 0, 0.156434, 0.987688, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 13068 at 175.961288 yards.
(13116, 2849, 1, -2030.24, -1970.71, 91.6668, 0.383971, 0, 0, 0.190808, 0.981627, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 13068 at 29.068947 yards.
(13120, 2849, 1, -2035.27, -2811.45, 91.6679, 6.03884, 0, 0, -0.121869, 0.992546, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 13073 at 242.928513 yards.
(13121, 2849, 1, -1921.44, -2706.81, 92.7856, 2.00713, 0, 0, 0.843391, 0.5373, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 13073 at 217.782578 yards.
(13131, 2849, 1, -2270.67, -2549.13, 91.8283, 2.9496, 0, 0, 0.995396, 0.0958512, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 13073 at 177.073685 yards.
(13132, 2849, 1, -1855.86, -1936.17, 92.8053, 3.4383, 0, 0, -0.989016, 0.147811, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 13071 at 185.006332 yards.
(13139, 2849, 1, 1427.23, -3411.86, 91.7705, 1.37881, 0, 0, 0.636078, 0.771625, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 13074 at 271.669373 yards.
(13143, 2849, 1, 532.814, -1432.29, 91.6667, 4.95674, 0, 0, -0.615661, 0.788011, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 13066 at 291.984406 yards.
(13188, 2849, 1, -2109.41, -1719.49, 91.7509, 2.9496, 0, 0, 0.995396, 0.0958512, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 13071 at 199.484039 yards.
(13189, 2849, 1, 731, -1265.59, 91.6732, 4.39823, 0, 0, -0.809016, 0.587786, 3600, 3600, 1, 100, 0, 10); -- Closest existing guid is 13066 at 118.421127 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(13114, 33, 0, 'Battered Chest', 0, 10), -- Battered Chests in The Barrens
(13116, 33, 0, 'Battered Chest', 0, 10), -- Battered Chests in The Barrens
(13120, 33, 0, 'Battered Chest', 0, 10), -- Battered Chests in The Barrens
(13121, 33, 0, 'Battered Chest', 0, 10), -- Battered Chests in The Barrens
(13131, 33, 0, 'Battered Chest', 0, 10), -- Battered Chests in The Barrens
(13132, 33, 0, 'Battered Chest', 0, 10), -- Battered Chests in The Barrens
(13139, 33, 0, 'Battered Chest', 0, 10), -- Battered Chests in The Barrens
(13143, 33, 0, 'Battered Chest', 0, 10), -- Battered Chests in The Barrens
(13188, 33, 0, 'Battered Chest', 0, 10), -- Battered Chests in The Barrens
(13189, 33, 0, 'Battered Chest', 0, 10); -- Battered Chests in The Barrens

-- Missing Battered Chest spawns in Loch Modan.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(13115, 2849, 0, -5485.15, -3341.43, 261.019, 1.27409, 0, 0, 0.594822, 0.803857, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 12909 at 271.099670 yards.
(13117, 2849, 0, -5700.12, -3867.4, 331.614, 5.00909, 0, 0, -0.594823, 0.803857, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 12926 at 52.799145 yards.
(13133, 2849, 0, -5284.79, -3250.97, 235.57, 1.97222, 0, 0, 0.833885, 0.551938, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 12909 at 98.994720 yards.
(13148, 2849, 0, -5117.36, -3315.32, 250.467, 5.09636, 0, 0, -0.559193, 0.829038, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 12909 at 99.116028 yards.
(13182, 2849, 0, -5636.4, -3893.67, 329.955, 2.63544, 0, 0, 0.968147, 0.250381, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 12926 at 78.784203 yards.
(13208, 2849, 0, -4826.65, -3878.17, 303.603, 3.08918, 0, 0, 0.999657, 0.0262016, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 13197 at 234.171921 yards.
(13485, 2849, 0, -4734.88, -3626.14, 305.354, 3.38594, 0, 0, -0.992546, 0.12187, 7200, 7200, 1, 100, 0, 10); -- Closest existing guid is 13437 at 494.598907 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(13115, 32, 0, 'Battered Chest', 0, 10), -- Battered Chests in Loch Modan
(13117, 32, 0, 'Battered Chest', 0, 10), -- Battered Chests in Loch Modan
(13133, 32, 0, 'Battered Chest', 0, 10), -- Battered Chests in Loch Modan
(13148, 32, 0, 'Battered Chest', 0, 10), -- Battered Chests in Loch Modan
(13182, 32, 0, 'Battered Chest', 0, 10), -- Battered Chests in Loch Modan
(13208, 32, 0, 'Battered Chest', 0, 10), -- Battered Chests in Loch Modan
(13485, 32, 0, 'Battered Chest', 0, 10); -- Battered Chests in Loch Modan

-- Missing Battered Chest spawns in Westfall.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(42926, 2849, 0, -11138.8, 1047.61, 34.5638, 4.29351, 0, 0, -0.83867, 0.54464, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 42734 at 317.586060 yards.
(42698, 2849, 0, -11398.6, 1801.28, 7.46052, 0, 0, 0, 0, 1, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 42684 at 101.432053 yards.
(42930, 2849, 0, -11243.3, 1160.75, 89.0316, 2.02458, 0, 0, 0.848047, 0.529921, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 42734 at 443.757111 yards.
(42927, 2849, 0, -11325.4, 1566.37, 26.491, 3.194, 0, 0, -0.999657, 0.0262016, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 42748 at 132.631699 yards.
(42928, 2849, 0, -11186.5, 1471.16, 15.011, 3.15906, 0, 0, -0.999962, 0.00873464, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 42748 at 123.962891 yards.
(42929, 2849, 0, -11281.2, 1515.82, 37.9021, 1.309, 0, 0, 0.608761, 0.793354, 3600, 3600, 1, 100, 0, 10); -- Closest existing guid is 42748 at 116.191750 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(42926, 37, 0, 'Battered Chest', 0, 10), -- Battered Chests in Westfall
(42698, 37, 0, 'Battered Chest', 0, 10), -- Battered Chests in Westfall
(42930, 37, 0, 'Battered Chest', 0, 10), -- Battered Chests in Westfall
(42927, 37, 0, 'Battered Chest', 0, 10), -- Battered Chests in The Deadmines
(42928, 37, 0, 'Battered Chest', 0, 10), -- Battered Chests in The Deadmines
(42929, 37, 0, 'Battered Chest', 0, 10), -- Battered Chests in The Deadmines
(42748, 37, 0, 'Battered Chest', 0, 10);

-- Missing Battered Chest spawns in Redridge Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(20660, 2849, 0, -9251.55, -2707.21, 88.8043, 1.93731, 0, 0, 0.824125, 0.566408, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 20651 at 180.408035 yards.
(31206, 2849, 0, -9503.47, -1896.73, 79.2749, 0.174532, 0, 0, 0.0871553, 0.996195, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 31127 at 34.121746 yards.
(31221, 2849, 0, -9494.6, -1939.51, 79.0554, 5.32326, 0, 0, -0.461748, 0.887011, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 31127 at 57.633659 yards.
(20720, 2849, 0, -9602.7, -2524.01, 60.5327, 0.610863, 0, 0, 0.300705, 0.953717, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 20651 at 328.928711 yards.
(31242, 2849, 0, -8884.3, -2160.68, 132.445, 6.23083, 0, 0, -0.0261765, 0.999657, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 31122 at 222.445831 yards.
(31252, 2849, 0, -8883.47, -2002.71, 134.528, 2.07694, 0, 0, 0.861629, 0.507539, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 31122 at 74.463432 yards.
(20827, 2849, 0, -9779.8, -2270.56, 59.3705, 2.65289, 0, 0, 0.970295, 0.241925, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 20798 at 95.372963 yards.
(28674, 2849, 0, -8949.61, -2309.69, 132.443, 2.72271, 0, 0, 0.978148, 0.207912, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 28632 at 140.726456 yards.
(31253, 2849, 0, -8985.03, -2179.1, 132.621, 5.34071, 0, 0, -0.45399, 0.891007, 7200, 7200, 1, 100, 0, 10); -- Closest existing guid is 31130 at 190.993195 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(20660, 34, 0, 'Battered Chest', 0, 10), -- Battered Chests in Redridge Mountains
(31206, 34, 0, 'Battered Chest', 0, 10), -- Battered Chests in Redridge Mountains
(31221, 34, 0, 'Battered Chest', 0, 10), -- Battered Chests in Redridge Mountains
(20720, 34, 0, 'Battered Chest', 0, 10), -- Battered Chests in Redridge Mountains
(31242, 34, 0, 'Battered Chest', 0, 10), -- Battered Chests in Redridge Mountains
(31252, 34, 0, 'Battered Chest', 0, 10), -- Battered Chests in Redridge Mountains
(20827, 34, 0, 'Battered Chest', 0, 10), -- Battered Chests in Redridge Mountains
(28674, 34, 0, 'Battered Chest', 0, 10), -- Battered Chests in Redridge Mountains
(31253, 34, 0, 'Battered Chest', 0, 10); -- Battered Chests in Redridge Mountains

-- Missing Battered Chest spawns in Silverpine Forest.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(35437, 2849, 0, 805.334, 165.878, 33.9496, 1.85005, 0, 0, 0.798635, 0.601815, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 35436 at 105.272926 yards.
(35547, 2849, 0, 1007.49, 686.36, 53.8181, 0.977383, 0, 0, 0.469471, 0.882948, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 35487 at 31.269142 yards.
(35453, 2849, 0, 389.709, 645.387, 35.1687, 3.89209, 0, 0, -0.930417, 0.366502, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 35447 at 125.757706 yards.
(35466, 2849, 0, 273.66, 741.958, 45.9023, 5.044, 0, 0, -0.580703, 0.814116, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 35447 at 216.930359 yards.
(35558, 2849, 0, 999.366, 699.265, 53.8207, 1.02974, 0, 0, 0.492423, 0.870356, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 35484 at 26.999895 yards.
(35560, 2849, 0, 1024, 727.992, 59.3686, 0.733038, 0, 0, 0.358368, 0.93358, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 35484 at 11.926972 yards.
(35562, 2849, 0, 987.957, 600.792, 54.9516, 2.56563, 0, 0, 0.958819, 0.284016, 7200, 7200, 1, 100, 0, 10); -- Closest existing guid is 35487 at 112.952118 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(35437, 35, 0, 'Battered Chest', 0, 10), -- Battered Chests in Silverpine Forest
(35547, 35, 0, 'Battered Chest', 0, 10), -- Battered Chests in Silverpine Forest
(35453, 35, 0, 'Battered Chest', 0, 10), -- Battered Chests in Silverpine Forest
(35466, 35, 0, 'Battered Chest', 0, 10), -- Battered Chests in Silverpine Forest
(35558, 35, 0, 'Battered Chest', 0, 10), -- Battered Chests in Silverpine Forest
(35560, 35, 0, 'Battered Chest', 0, 10), -- Battered Chests in Silverpine Forest
(35562, 35, 0, 'Battered Chest', 0, 10); -- Battered Chests in Silverpine Forest

-- Missing Battered Chest spawns in Darkshore.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(48757, 2849, 1, 7357.42, -1019.19, 32.0403, 1.81514, 0, 0, 0.788011, 0.615662, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 48756 at 178.885239 yards.
(48758, 2849, 1, 7461.66, -861.202, 1.05914, 2.11185, 0, 0, 0.870356, 0.492424, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 48756 at 163.566818 yards.
(48759, 2849, 1, 7487.28, -1088.5, 36.0964, 0.767944, 0, 0, 0.374606, 0.927184, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 48756 at 101.778259 yards.
(48760, 2849, 1, 7562.19, -879.454, 17.5976, 2.84488, 0, 0, 0.989016, 0.147811, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 48756 at 135.981079 yards.
(48742, 2849, 1, 7050.3, 426.994, -5.42405, 5.96903, 0, 0, -0.156434, 0.987688, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 48727 at 1200.132935 yards.
(48502, 2849, 1, 4547.06, 153.554, 59.6614, 1.81514, 0, 0, 0.788011, 0.615662, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 48492 at 147.142014 yards.
(48761, 2849, 1, 7644.49, -909.221, 18.4929, 5.16618, 0, 0, -0.529919, 0.848048, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 48756 at 153.696564 yards.
(48505, 2849, 1, 4643.39, 139.273, 58.357, 0.366518, 0, 0, 0.182235, 0.983255, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 48492 at 169.227982 yards.
(48748, 2849, 1, 7443.65, 49.5524, 1.6797, 4.01426, 0, 0, -0.906307, 0.422619, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 48727 at 856.372803 yards.
(48752, 2849, 1, 7186.1, -746.374, 69.9667, 5.98648, 0, 0, -0.147809, 0.989016, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 48727 at 22.542004 yards.
(48762, 2849, 1, 7389.93, -1117.46, 41.8591, 0.541051, 0, 0, 0.267238, 0.963631, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 48756 at 185.371170 yards.
(48533, 2849, 1, 4617.29, 662.068, 14.514, 4.2237, 0, 0, -0.857167, 0.515038, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 48531 at 248.522446 yards.
(48763, 2849, 1, 7194.43, -718.407, 94.1232, 4.76475, 0, 0, -0.688354, 0.725374, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 48727 at 60.360100 yards.
(48539, 2849, 1, 4626.42, 624.678, 6.1055, 5.96903, 0, 0, -0.156434, 0.987688, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 48531 at 217.373917 yards.
(48541, 2849, 1, 4552.87, 566.422, 1.35074, 0.994837, 0, 0, 0.477159, 0.878817, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 48531 at 145.129364 yards.
(48764, 2849, 1, 7355.87, -799.53, 8.23917, 6.24828, 0, 0, -0.0174522, 0.999848, 7200, 7200, 1, 100, 0, 10); -- Closest existing guid is 48727 at 183.335678 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(48757, 40, 0, 'Battered Chest', 0, 10), -- Battered Chests in Darkshore
(48758, 40, 0, 'Battered Chest', 0, 10), -- Battered Chests in Darkshore
(48759, 40, 0, 'Battered Chest', 0, 10), -- Battered Chests in Darkshore
(48760, 40, 0, 'Battered Chest', 0, 10), -- Battered Chests in Darkshore
(48742, 40, 0, 'Battered Chest', 0, 10), -- Battered Chests in Darkshore
(48502, 40, 0, 'Battered Chest', 0, 10), -- Battered Chests in Darkshore
(48761, 40, 0, 'Battered Chest', 0, 10), -- Battered Chests in Darkshore
(48505, 40, 0, 'Battered Chest', 0, 10), -- Battered Chests in Darkshore
(48748, 40, 0, 'Battered Chest', 0, 10), -- Battered Chests in Darkshore
(48752, 40, 0, 'Battered Chest', 0, 10), -- Battered Chests in Darkshore
(48762, 40, 0, 'Battered Chest', 0, 10), -- Battered Chests in Darkshore
(48533, 40, 0, 'Battered Chest', 0, 10), -- Battered Chests in Darkshore
(48763, 40, 0, 'Battered Chest', 0, 10), -- Battered Chests in Darkshore
(48539, 40, 0, 'Battered Chest', 0, 10), -- Battered Chests in Darkshore
(48541, 40, 0, 'Battered Chest', 0, 10), -- Battered Chests in Darkshore
(48764, 40, 0, 'Battered Chest', 0, 10); -- Battered Chests in Darkshore

-- Missing Battered Chest spawns in Ashenvale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(48120, 2849, 1, 3276.38, 406.608, 3.4269, 1.91986, 0, 0, 0.819152, 0.573577, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 47814 at 290.776367 yards.
(48121, 2849, 1, 3469.9, -141.078, 6.74421, 0.715585, 0, 0, 0.350207, 0.936672, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 47814 at 774.110107 yards.
(48122, 2849, 1, 3450.3, 1033.85, 0.674683, 3.03684, 0, 0, 0.998629, 0.0523532, 7200, 7200, 1, 100, 0, 10); -- Closest existing guid is 47814 at 401.089233 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(48120, 39, 0, 'Battered Chest', 0, 10), -- Battered Chests in Ashenvale
(48121, 39, 0, 'Battered Chest', 0, 10), -- Battered Chests in Ashenvale
(48122, 39, 0, 'Battered Chest', 0, 10); -- Battered Chests in Ashenvale

-- Missing Battered Chest spawns in Stonetalon Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(40731, 2849, 1, -66.701, -517.713, -46.1329, 1.48353, 0, 0, 0.67559, 0.737278, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 40707 at 431.891449 yards.
(40732, 2849, 1, 132.013, -349.798, 3.59643, 2.1293, 0, 0, 0.874619, 0.48481, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 40707 at 523.912231 yards.
(40733, 2849, 1, 1262.87, -5.11133, -5.45986, 4.31097, 0, 0, -0.833885, 0.551938, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 40709 at 414.036163 yards.
(40734, 2849, 1, 998.705, -333.697, 0.770707, 4.72984, 0, 0, -0.700909, 0.713251, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 40708 at 36.718708 yards.
(40735, 2849, 1, 1434.8, 3.8839, 25.138, 6.14356, 0, 0, -0.0697556, 0.997564, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 40709 at 559.594055 yards.
(40736, 2849, 1, 5.11241, -692.71, -19.1304, 3.03684, 0, 0, 0.998629, 0.0523532, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 40707 at 248.202286 yards.
(40737, 2849, 1, 1608.78, 141.983, 104.847, 5.3058, 0, 0, -0.469471, 0.882948, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 40709 at 786.657898 yards.
(40738, 2849, 1, 1489.94, 756.841, 143.941, 1.76278, 0, 0, 0.771625, 0.636078, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 40710 at 411.243622 yards.
(40741, 2849, 1, 1751.6, 623.222, 194.972, 5.41052, 0, 0, -0.422618, 0.906308, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 40710 at 521.337219 yards.
(40744, 2849, 1, 1415.53, 1044.07, 157.556, 0.331611, 0, 0, 0.165047, 0.986286, 7200, 7200, 1, 100, 0, 10); -- Closest existing guid is 40710 at 256.840607 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(40731, 36, 0, 'Battered Chest', 0, 10), -- Battered Chests in Stonetalon Mountains
(40732, 36, 0, 'Battered Chest', 0, 10), -- Battered Chests in Stonetalon Mountains
(40733, 36, 0, 'Battered Chest', 0, 10), -- Battered Chests in Stonetalon Mountains
(40734, 36, 0, 'Battered Chest', 0, 10), -- Battered Chests in Stonetalon Mountains
(40735, 36, 0, 'Battered Chest', 0, 10), -- Battered Chests in Stonetalon Mountains
(40736, 36, 0, 'Battered Chest', 0, 10), -- Battered Chests in Stonetalon Mountains
(40737, 36, 0, 'Battered Chest', 0, 10), -- Battered Chests in Stonetalon Mountains
(40738, 36, 0, 'Battered Chest', 0, 10), -- Battered Chests in Stonetalon Mountains
(40741, 36, 0, 'Battered Chest', 0, 10), -- Battered Chests in Stonetalon Mountains
(40744, 36, 0, 'Battered Chest', 0, 10); -- Battered Chests in Stonetalon Mountains



-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
