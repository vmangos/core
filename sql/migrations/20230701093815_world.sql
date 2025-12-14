DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230701093815');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230701093815');
-- Add your query below.


-- Create new pool to hold Solid Chest spawns in Duskwood.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(21, 11, 'Solid Chests in Duskwood', 0, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(15672, 21, 0, 'Solid Chest', 0, 10),
(16763, 21, 0, 'Solid Chest', 0, 10),
(16989, 21, 0, 'Solid Chest', 0, 10),
(17134, 21, 0, 'Solid Chest', 0, 10),
(18547, 21, 0, 'Solid Chest', 0, 10),
(18562, 21, 0, 'Solid Chest', 0, 10),
(33431, 21, 0, 'Solid Chest', 0, 10),
(33434, 21, 0, 'Solid Chest', 0, 10);

-- Create new pool to hold Solid Chest spawns in Wetlands.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(20, 5, 'Solid Chests in Wetlands', 0, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(14653, 20, 0, 'Solid Chest', 0, 10),
(14660, 20, 0, 'Solid Chest', 0, 10),
(14861, 20, 0, 'Solid Chest', 0, 10),
(15098, 20, 0, 'Solid Chest', 0, 10),
(15153, 20, 0, 'Solid Chest', 0, 10);

-- Create new pool to hold Solid Chest spawns in Hillsbrad Foothills.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(23, 2, 'Solid Chests in Hillsbrad Foothills', 0, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(29292, 23, 0, 'Solid Chest', 0, 10),
(29647, 23, 0, 'Solid Chest', 0, 10);

-- Create new pool to hold Solid Chest spawns in Ashenvale.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(24, 5, 'Solid Chests in Ashenvale', 0, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(47824, 24, 0, 'Solid Chest', 0, 10),
(47825, 24, 0, 'Solid Chest', 0, 10),
(47826, 24, 0, 'Solid Chest', 0, 10),
(47827, 24, 0, 'Solid Chest', 0, 10);

-- Create new pool to hold Solid Chest spawns in Thousand Needles.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(22, 5, 'Solid Chests in Thousand Needles', 0, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(16715, 22, 0, 'Solid Chest', 0, 10),
(16718, 22, 0, 'Solid Chest', 0, 10),
(16719, 22, 0, 'Solid Chest', 0, 10),
(16720, 22, 0, 'Solid Chest', 0, 10),
(16721, 22, 0, 'Solid Chest', 0, 10),
(170117, 22, 0, 'Solid Chest', 0, 10);

-- Missing Solid Chest spawns in Duskwood.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(17135, 2852, 0, -10931.8, -943.108, 76.8906, 1.01229, 0, 0, 0.484809, 0.87462, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 17134 at 173.781982 yards.
(33432, 2852, 0, -10299.7, -1291.57, 43.431, 4.06662, 0, 0, -0.894934, 0.446199, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 33431 at 515.062256 yards.
(16993, 2852, 0, -11089.2, -951.572, 65.3283, 3.75246, 0, 0, -0.953716, 0.300708, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 16989 at 143.365906 yards.
(16765, 2852, 0, -11110.8, -498.81, 32.8518, 2.26893, 0, 0, 0.906307, 0.422619, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 16763 at 34.517822 yards.
(33433, 2852, 0, -10358.1, -1243.02, 35.4821, 6.17847, 0, 0, -0.0523357, 0.99863, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 33431 at 452.539612 yards.
(33435, 2852, 0, -10647.3, -903.599, 50.2875, 3.7001, 0, 0, -0.961261, 0.27564, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 33431 at 210.316223 yards.
(33439, 2852, 0, -10374.7, -1254.46, 35.8818, 6.26573, 0, 0, -0.00872612, 0.999962, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 33431 at 460.198944 yards.
(17136, 2852, 0, -10962, -945.145, 71.1925, 2.26893, 0, 0, 0.906307, 0.422619, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 17134 at 157.722305 yards.
(17137, 2852, 0, -11012.3, -1101.52, 41.8718, 0.122173, 0, 0, 0.0610485, 0.998135, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 17134 at 14.131103 yards.
(18563, 2852, 0, -11082.7, -97.2737, 16.9502, 5.84685, 0, 0, -0.216439, 0.976296, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 18562 at 30.915913 yards.
(18553, 2852, 0, -11165.6, -163.196, 9.35385, 1.41372, 0, 0, 0.649447, 0.760406, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 18547 at 37.931393 yards.
(15673, 2852, 0, -10373.4, 130.12, 1.71372, 0.139624, 0, 0, 0.0697556, 0.997564, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 15672 at 228.941345 yards.
(33440, 2852, 0, -10270.2, -727.604, 46.2897, 0.401425, 0, 0, 0.199368, 0.979925, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 33431 at 206.732361 yards.
(15674, 2852, 0, -10324.5, 489.261, 12.8491, 5.8294, 0, 0, -0.224951, 0.97437, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 15672 at 138.368591 yards.
(17138, 2852, 0, -11013.9, -1141.27, 39.8619, 3.99681, 0, 0, -0.909961, 0.414694, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 17134 at 52.355450 yards.
(18555, 2852, 0, -11076.6, -253.918, 16.1559, 5.46288, 0, 0, -0.398748, 0.91706, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 18547 at 153.602798 yards.
(18566, 2852, 0, -10966.5, -65.8315, 15.5488, 5.67232, 0, 0, -0.300705, 0.953717, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 18562 at 120.305855 yards.
(15675, 2852, 0, -10235.8, 392.371, 10.4135, 4.50295, 0, 0, -0.777145, 0.629321, 3600, 3600, 1, 100, 0, 10), -- Closest existing guid is 15672 at 138.401718 yards.
(17022, 2852, 0, -11030.6, -901.201, 63.9518, 4.04917, 0, 0, -0.898793, 0.438373, 3600, 3600, 1, 100, 0, 10); -- Closest existing guid is 16989 at 102.722427 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(17135, 21, 0, 'Solid Chest', 0, 10), -- Solid Chests in Duskwood
(33432, 21, 0, 'Solid Chest', 0, 10), -- Solid Chests in Duskwood
(16993, 21, 0, 'Solid Chest', 0, 10), -- Solid Chests in Duskwood
(16765, 21, 0, 'Solid Chest', 0, 10), -- Solid Chests in Duskwood
(33433, 21, 0, 'Solid Chest', 0, 10), -- Solid Chests in Duskwood
(33435, 21, 0, 'Solid Chest', 0, 10), -- Solid Chests in Duskwood
(33439, 21, 0, 'Solid Chest', 0, 10), -- Solid Chests in Duskwood
(17136, 21, 0, 'Solid Chest', 0, 10), -- Solid Chests in Duskwood
(17137, 21, 0, 'Solid Chest', 0, 10), -- Solid Chests in Duskwood
(18563, 21, 0, 'Solid Chest', 0, 10), -- Solid Chests in Duskwood
(18553, 21, 0, 'Solid Chest', 0, 10), -- Solid Chests in Duskwood
(15673, 21, 0, 'Solid Chest', 0, 10), -- Solid Chests in Duskwood
(33440, 21, 0, 'Solid Chest', 0, 10), -- Solid Chests in Duskwood
(15674, 21, 0, 'Solid Chest', 0, 10), -- Solid Chests in Duskwood
(17138, 21, 0, 'Solid Chest', 0, 10), -- Solid Chests in Duskwood
(18555, 21, 0, 'Solid Chest', 0, 10), -- Solid Chests in Duskwood
(18566, 21, 0, 'Solid Chest', 0, 10), -- Solid Chests in Duskwood
(15675, 21, 0, 'Solid Chest', 0, 10), -- Solid Chests in Duskwood
(17022, 21, 0, 'Solid Chest', 0, 10); -- Solid Chests in Duskwood

-- Missing Solid Chest spawns in Wetlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(15101, 2852, 0, -2586.38, -2383.61, 79.8838, 4.62512, 0, 0, -0.737277, 0.675591, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 15098 at 34.033504 yards.
(15102, 2852, 0, -2636.96, -2397.31, 89.1529, 3.00195, 0, 0, 0.997563, 0.0697661, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 15098 at 83.116226 yards.
(14680, 2852, 0, -3416.58, -2428.37, 51.9087, 4.64258, 0, 0, -0.731354, 0.681998, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 14653 at 112.901825 yards.
(14682, 2852, 0, -3418.88, -2505.52, 27.1158, 3.10665, 0, 0, 0.999847, 0.0174693, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 14653 at 191.006531 yards.
(15164, 2852, 0, -3321.84, -2279.77, 51.8986, 1.0472, 0, 0, 0.5, 0.866025, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 15153 at 98.134041 yards.
(14684, 2852, 0, -3656.05, -2609.74, 51.9026, 0.488691, 0, 0, 0.241921, 0.970296, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 14653 at 368.144257 yards.
(15165, 2852, 0, -3413.19, -1982.01, 115.444, 3.29869, 0, 0, -0.996917, 0.0784664, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 15153 at 302.008057 yards.
(14960, 2852, 0, -2939.76, -2976.83, 30.5666, 0.366518, 0, 0, 0.182235, 0.983255, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 14861 at 164.143692 yards.
(14685, 2852, 0, -3033.15, -3234.4, 54.2858, 6.10865, 0, 0, -0.0871553, 0.996195, 7200, 7200, 1, 100, 0, 10); -- Closest existing guid is 14660 at 114.369263 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(15101, 20, 0, 'Solid Chest', 0, 10), -- Solid Chests in Wetlands
(15102, 20, 0, 'Solid Chest', 0, 10), -- Solid Chests in Wetlands
(14680, 20, 0, 'Solid Chest', 0, 10), -- Solid Chests in Wetlands
(14682, 20, 0, 'Solid Chest', 0, 10), -- Solid Chests in Wetlands
(15164, 20, 0, 'Solid Chest', 0, 10), -- Solid Chests in Wetlands
(14684, 20, 0, 'Solid Chest', 0, 10), -- Solid Chests in Wetlands
(15165, 20, 0, 'Solid Chest', 0, 10), -- Solid Chests in Wetlands
(14960, 20, 0, 'Solid Chest', 0, 10), -- Solid Chests in Wetlands
(14685, 20, 0, 'Solid Chest', 0, 10); -- Solid Chests in Wetlands

-- Missing Solid Chest spawns in Hillsbrad Foothills.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(29294, 2852, 0, -1171.09, 110.701, 0.876851, 1.71042, 0, 0, 0.754709, 0.656059, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 29292 at 66.373192 yards.
(29651, 2852, 0, -890.011, -1052.25, 31.2693, 4.69494, 0, 0, -0.71325, 0.70091, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 29647 at 132.233566 yards.
(29654, 2852, 0, -917.275, -1003.38, 30.3479, 0.715585, 0, 0, 0.350207, 0.936672, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 29647 at 76.370758 yards.
(29295, 2852, 0, -966.952, 323.832, 3.57871, 2.58308, 0, 0, 0.961261, 0.27564, 7200, 7200, 1, 100, 0, 10); -- Closest existing guid is 29292 at 238.436584 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(29294, 23, 0, 'Solid Chest', 0, 10), -- Solid Chests in Hillsbrad Foothills
(29651, 23, 0, 'Solid Chest', 0, 10), -- Solid Chests in Hillsbrad Foothills
(29654, 23, 0, 'Solid Chest', 0, 10), -- Solid Chests in Hillsbrad Foothills
(29295, 23, 0, 'Solid Chest', 0, 10); -- Solid Chests in Hillsbrad Foothills

-- Missing Solid Chest spawns in Ashenvale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(48110, 2852, 1, 1799.25, -2696.54, 41.0134, 0.226892, 0, 0, 0.113203, 0.993572, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 47826 at 86.231506 yards.
(48111, 2852, 1, 2747.48, -2982.93, 140.794, 5.11382, 0, 0, -0.551936, 0.833886, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 47827 at 105.931145 yards.
(48112, 2852, 1, 2934.9, -2841.09, 212.852, 1.85005, 0, 0, 0.798635, 0.601815, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 47827 at 183.927948 yards.
(48113, 2852, 1, 2500.62, -2121.34, 201.213, 1.93731, 0, 0, 0.824125, 0.566408, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 47824 at 302.593903 yards.
(48114, 2852, 1, 2603.36, -2135.84, 194.963, 2.30383, 0, 0, 0.913545, 0.406738, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 47824 at 208.673294 yards.
(48115, 2852, 1, 1872.33, -2765.32, 62.6937, 2.65289, 0, 0, 0.970295, 0.241925, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 47826 at 163.350632 yards.
(48116, 2852, 1, 2774.58, -3016.76, 154.125, 0.855211, 0, 0, 0.414693, 0.909961, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 47827 at 138.014252 yards.
(48117, 2852, 1, 2762.61, -2939.74, 143.158, 2.32129, 0, 0, 0.91706, 0.39875, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 47827 at 61.081028 yards.
(48118, 2852, 1, 1876.36, -2794.27, 37.592, 4.62512, 0, 0, -0.737277, 0.675591, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 47826 at 193.386826 yards.
(48119, 2852, 1, 2890.25, -2827.92, 208.831, 3.4383, 0, 0, -0.989016, 0.147811, 7200, 7200, 1, 100, 0, 10); -- Closest existing guid is 47827 at 146.545227 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(48110, 24, 0, 'Solid Chest', 0, 10), -- Solid Chests in Ashenvale
(48111, 24, 0, 'Solid Chest', 0, 10), -- Solid Chests in Ashenvale
(48112, 24, 0, 'Solid Chest', 0, 10), -- Solid Chests in Ashenvale
(48113, 24, 0, 'Solid Chest', 0, 10), -- Solid Chests in Ashenvale
(48114, 24, 0, 'Solid Chest', 0, 10), -- Solid Chests in Ashenvale
(48115, 24, 0, 'Solid Chest', 0, 10), -- Solid Chests in Ashenvale
(48116, 24, 0, 'Solid Chest', 0, 10), -- Solid Chests in Ashenvale
(48117, 24, 0, 'Solid Chest', 0, 10), -- Solid Chests in Ashenvale
(48118, 24, 0, 'Solid Chest', 0, 10), -- Solid Chests in Ashenvale
(48119, 24, 0, 'Solid Chest', 0, 10); -- Solid Chests in Ashenvale

-- Missing Solid Chest spawns in Thousand Needles.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(170118, 2852, 1, -4648.06, -1265.94, -52.0322, 3.75246, 0, 0, -0.953716, 0.300708, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 170117 at 47.575432 yards.
(16723, 2852, 1, -4896.51, -2290.6, -59.8061, 6.17847, 0, 0, -0.0523357, 0.99863, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 16720 at 120.298523 yards.
(16724, 2852, 1, -5046.39, -2326.3, -52.8083, 6.0912, 0, 0, -0.0958452, 0.995396, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 16721 at 73.583000 yards.
(16725, 2852, 1, -4591.11, -1218.49, -54.842, 3.49067, 0, 0, -0.984807, 0.173652, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 16718 at 33.577488 yards.
(16716, 2852, 1, -5508.08, -1629.43, 25.3012, 0.855211, 0, 0, 0.414693, 0.909961, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 16715 at 50.882717 yards.
(16726, 2852, 1, -5192.65, -1209.24, 49.3863, 2.09439, 0, 0, 0.866025, 0.500001, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 16719 at 192.445618 yards.
(16727, 2852, 1, -4952.89, -2295.17, -64.6408, 5.21854, 0, 0, -0.507538, 0.861629, 7200, 7200, 1, 100, 0, 10), -- Closest existing guid is 16720 at 121.615189 yards.
(16728, 2852, 1, -5063.35, -2291.98, -53.2819, 1.48353, 0, 0, 0.67559, 0.737278, 7200, 7200, 1, 100, 0, 10); -- Closest existing guid is 16721 at 64.336845 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(170118, 22, 0, 'Solid Chest', 0, 10), -- Solid Chests in Thousand Needles
(16723, 22, 0, 'Solid Chest', 0, 10), -- Solid Chests in Thousand Needles
(16724, 22, 0, 'Solid Chest', 0, 10), -- Solid Chests in Thousand Needles
(16725, 22, 0, 'Solid Chest', 0, 10), -- Solid Chests in Thousand Needles
(16716, 22, 0, 'Solid Chest', 0, 10), -- Solid Chests in Thousand Needles
(16726, 22, 0, 'Solid Chest', 0, 10), -- Solid Chests in Thousand Needles
(16727, 22, 0, 'Solid Chest', 0, 10), -- Solid Chests in Thousand Needles
(16728, 22, 0, 'Solid Chest', 0, 10); -- Solid Chests in Thousand Needles

UPDATE `gameobject` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `id`= 2852;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
