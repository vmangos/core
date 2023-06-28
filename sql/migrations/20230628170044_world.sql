DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230628170044');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230628170044');
-- Add your query below.


-- Create new pool to hold Battered Footlocker spawns in Wetlands.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(408, 14, 'Battered Footlockers in Wetlands', 1, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(14572, 408, 0, 'Battered Footlocker', 1, 10),
(14649, 408, 0, 'Battered Footlocker', 1, 10),
(14650, 408, 0, 'Battered Footlocker', 1, 10),
(14855, 408, 0, 'Battered Footlocker', 1, 10),
(14893, 408, 0, 'Battered Footlocker', 1, 10),
(14909, 408, 0, 'Battered Footlocker', 1, 10);

-- Create new pool to hold Battered Footlocker spawns in Hillsbrad Foothills.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(409, 14, 'Battered Footlockers in Hillsbrad Foothills', 1, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(20969, 409, 0, 'Battered Footlocker', 1, 10),
(21235, 409, 0, 'Battered Footlocker', 1, 10),
(21239, 409, 0, 'Battered Footlocker', 1, 10),
(30005, 409, 0, 'Battered Footlocker', 1, 10),
(30006, 409, 0, 'Battered Footlocker', 1, 10),
(30007, 409, 0, 'Battered Footlocker', 1, 10),
(30008, 409, 0, 'Battered Footlocker', 1, 10),
(30012, 409, 0, 'Battered Footlocker', 1, 10);

-- Create new pool to hold Battered Footlocker spawns in Stonetalon Mountains.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(410, 20, 'Battered Footlockers in Stonetalon Mountains', 1, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(34178, 410, 0, 'Battered Footlocker', 1, 10),
(34181, 410, 0, 'Battered Footlocker', 1, 10),
(34186, 410, 0, 'Battered Footlocker', 1, 10),
(35007, 410, 0, 'Battered Footlocker', 1, 10),
(35008, 410, 0, 'Battered Footlocker', 1, 10),
(35012, 410, 0, 'Battered Footlocker', 1, 10),
(35014, 410, 0, 'Battered Footlocker', 1, 10),
(35015, 410, 0, 'Battered Footlocker', 1, 10),
(35017, 410, 0, 'Battered Footlocker', 1, 10),
(35018, 410, 0, 'Battered Footlocker', 1, 10),
(35025, 410, 0, 'Battered Footlocker', 1, 10);

-- Missing Battered Footlocker spawns in Wetlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(14896, 179486, 0, -3159.01, -1022.51, 7.19671, 5.00909, 0, 0, -0.594823, 0.803857, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 14893 at 80.210014 yards.
(14899, 179486, 0, -3138.7, -981.94, 7.86911, 3.21142, 0, 0, -0.999391, 0.0349061, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 14893 at 119.591263 yards.
(14663, 179486, 0, -3092.38, -1276.26, 7.68682, 0.191985, 0, 0, 0.0958452, 0.995396, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 14649 at 47.623379 yards.
(14664, 179486, 0, -3139.77, -1226.99, 7.55713, 4.57276, 0, 0, -0.754709, 0.656059, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 14649 at 21.812510 yards.
(14935, 179486, 0, -3260.83, -1094.46, 7.53431, 0.750491, 0, 0, 0.366501, 0.930418, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 14909 at 110.105713 yards.
(14665, 179486, 0, -3050.55, -1210.72, 7.88541, 5.09636, 0, 0, -0.559193, 0.829038, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 14649 at 79.480469 yards.
(14668, 179486, 0, -3175.31, -1339.34, 7.79502, 3.54302, 0, 0, -0.979924, 0.19937, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 14649 at 111.190063 yards.
(14669, 179486, 0, -3230.34, -1403.67, 8.9191, 4.72984, 0, 0, -0.700909, 0.713251, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 14649 at 194.598846 yards.
(14672, 179486, 0, -3243.73, -1312.03, 6.06156, 6.03884, 0, 0, -0.121869, 0.992546, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 14649 at 139.430313 yards.
(14901, 179486, 0, -3091.55, -1133.3, 8.17147, 3.63029, 0, 0, -0.970295, 0.241925, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 14893 at 61.821922 yards.
(14902, 179486, 0, -3083.1, -1062.89, 8.07908, 3.01941, 0, 0, 0.998135, 0.0610518, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 14893 at 72.472191 yards.
(14903, 179486, 0, -3009.9, -1150.78, 9.15748, 2.51327, 0, 0, 0.951056, 0.309017, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 14893 at 143.378647 yards.
(14673, 179486, 0, -3028.16, -1249.71, 7.59117, 1.76278, 0, 0, 0.771625, 0.636078, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 14650 at 52.495811 yards.
(14936, 179486, 0, -3239.02, -1042.47, 7.59312, 0.0523589, 0, 0, 0.0261765, 0.999657, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 14893 at 111.382225 yards.
(14937, 179486, 0, -3204, -1087.91, 9.14602, 3.45576, 0, 0, -0.987688, 0.156436, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 14893 at 61.014874 yards.
(14877, 179486, 0, -3310.85, -1004.25, 7.65514, 3.83973, 0, 0, -0.939692, 0.34202, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 14855 at 97.019035 yards.
(14881, 179486, 0, -3223.31, -989.095, 5.42115, 2.56563, 0, 0, 0.958819, 0.284016, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 14855 at 109.839447 yards.
(14603, 179486, 0, -3122.36, -1420.57, 11.2572, 5.02655, 0, 0, -0.587785, 0.809017, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 14572 at 119.706886 yards.
(14938, 179486, 0, -3173.54, -924.95, 7.74012, 1.55334, 0, 0, 0.700909, 0.713251, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 14855 at 125.413963 yards.
(14939, 179486, 0, -2953.72, -1035, 7.84795, 5.25344, 0, 0, -0.492423, 0.870356, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 14893 at 202.001968 yards.
(14940, 179486, 0, -3031.18, -1100.91, 6.25554, 1.02974, 0, 0, 0.492423, 0.870356, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 14893 at 113.338135 yards.
(14674, 179486, 0, -2966.98, -1147.13, 7.30024, 4.7473, 0, 0, -0.694658, 0.71934, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 14650 at 155.709351 yards.
(14941, 179486, 0, -3234.56, -1227.86, 8.19779, 5.20108, 0, 0, -0.515038, 0.857168, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 14909 at 69.685471 yards.
(14942, 179486, 0, -3250.55, -930.144, 8.67531, 1.88495, 0, 0, 0.809016, 0.587786, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 14855 at 52.490597 yards.
(14944, 179486, 0, -3286.68, -1161.27, 8.09106, 3.31614, 0, 0, -0.996194, 0.087165, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 14909 at 100.416359 yards.
(14957, 179486, 0, -3077.5, -934.708, 5.50814, 0.994837, 0, 0, 0.477159, 0.878817, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 14893 at 179.664276 yards.
(14958, 179486, 0, -3014.69, -1033.26, 7.44476, 1.93731, 0, 0, 0.824125, 0.566408, 180, 180, 1, 100, 1, 10); -- Closest existing guid is 14893 at 146.604752 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(14896, 408, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Wetlands
(14899, 408, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Wetlands
(14663, 408, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Wetlands
(14664, 408, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Wetlands
(14935, 408, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Wetlands
(14665, 408, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Wetlands
(14668, 408, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Wetlands
(14669, 408, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Wetlands
(14672, 408, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Wetlands
(14901, 408, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Wetlands
(14902, 408, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Wetlands
(14903, 408, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Wetlands
(14673, 408, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Wetlands
(14936, 408, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Wetlands
(14937, 408, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Wetlands
(14877, 408, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Wetlands
(14881, 408, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Wetlands
(14603, 408, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Wetlands
(14938, 408, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Wetlands
(14939, 408, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Wetlands
(14940, 408, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Wetlands
(14674, 408, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Wetlands
(14941, 408, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Wetlands
(14942, 408, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Wetlands
(14944, 408, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Wetlands
(14957, 408, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Wetlands
(14958, 408, 0, 'Battered Footlocker', 1, 10); -- Battered Footlockers in Wetlands

-- Missing Battered Footlocker spawns in Hillsbrad Foothills.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(21236, 179486, 0, -583.034, -1517.14, 52.6381, 2.51327, 0, 0, 0.951056, 0.309017, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 21235 at 41.986523 yards.
(30010, 179486, 0, -590.016, -1460.08, 53.7956, 4.27606, 0, 0, -0.843391, 0.5373, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 30007 at 9.769987 yards.
(30011, 179486, 0, -552.433, -1438.01, 52.4409, 3.54302, 0, 0, -0.979924, 0.19937, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 30008 at 22.425257 yards.
(30034, 179486, 0, -531.949, -1420.86, 54.4529, 2.54818, 0, 0, 0.956305, 0.292372, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 30006 at 15.581399 yards.
(30035, 179486, 0, -488.138, -1338.01, 53.637, 3.83973, 0, 0, -0.939692, 0.34202, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 30006 at 94.412148 yards.
(30066, 179486, 0, -454.786, -1351.8, 53.604, 1.02974, 0, 0, 0.492423, 0.870356, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 30006 at 109.389244 yards.
(30069, 179486, 0, -601.285, -1529.93, 53.66, 0.418879, 0, 0, 0.207911, 0.978148, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 30012 at 58.273521 yards.
(21238, 179486, 0, -578.57, -1543.06, 53.5969, 5.79449, 0, 0, -0.241921, 0.970296, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 21235 at 46.476067 yards.
(21241, 179486, 0, -544.115, -1559.32, 52.5438, 5.86431, 0, 0, -0.207911, 0.978148, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 21235 at 43.842266 yards.
(30071, 179486, 0, -450.625, -1358.9, 52.4847, 4.11898, 0, 0, -0.882947, 0.469473, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 30006 at 109.173042 yards.
(30074, 179486, 0, -496.88, -1396.31, 52.4617, 3.85718, 0, 0, -0.936671, 0.35021, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 30006 at 51.348278 yards.
(30075, 179486, 0, -496.892, -1355.18, 53.6745, 2.30383, 0, 0, 0.913545, 0.406738, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 30006 at 75.530777 yards.
(30098, 179486, 0, -590.885, -1479.43, 53.846, 2.75761, 0, 0, 0.981627, 0.190812, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 30012 at 8.437509 yards.
(30103, 179486, 0, -598.473, -1502.89, 54.0429, 4.50295, 0, 0, -0.777145, 0.629321, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 30012 at 32.020172 yards.
(21242, 179486, 0, -565.42, -1499.83, 52.5574, 2.00713, 0, 0, 0.843391, 0.5373, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 21235 at 29.005678 yards.
(30105, 179486, 0, -516.654, -1362.59, 52.4409, 3.87463, 0, 0, -0.93358, 0.358368, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 30006 at 58.102730 yards.
(21243, 179486, 0, -548.937, -1544.72, 52.5503, 1.11701, 0, 0, 0.529919, 0.848048, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 21235 at 30.180832 yards.
(21244, 179486, 0, -570.178, -1555.09, 53.4028, 1.0821, 0, 0, 0.515038, 0.857168, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 21235 at 49.059471 yards.
(30106, 179486, 0, -490.905, -1365.88, 52.4414, 4.93928, 0, 0, -0.622514, 0.782609, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 30006 at 72.099030 yards.
(30110, 179486, 0, -453.322, -1335.52, 53.8442, 4.13643, 0, 0, -0.878817, 0.47716, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 30006 at 120.389412 yards.
(30114, 179486, 0, -474.349, -1331.79, 52.4409, 2.61799, 0, 0, 0.965925, 0.258821, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 30006 at 107.965469 yards.
(30120, 179486, 0, -473.703, -1366.01, 52.4819, 4.25861, 0, 0, -0.848047, 0.529921, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 30006 at 85.772362 yards.
(30125, 179486, 0, -468.091, -1383.6, 52.5109, 1.83259, 0, 0, 0.793353, 0.608762, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 30006 at 82.746429 yards.
(21245, 179486, 0, -548.366, -1488.67, 52.4409, 3.45576, 0, 0, -0.987688, 0.156436, 180, 180, 1, 100, 1, 10); -- Closest existing guid is 21235 at 27.902477 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(21236, 409, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Hillsbrad Foothills
(30010, 409, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Hillsbrad Foothills
(30011, 409, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Hillsbrad Foothills
(30034, 409, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Hillsbrad Foothills
(30035, 409, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Hillsbrad Foothills
(30066, 409, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Hillsbrad Foothills
(30069, 409, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Hillsbrad Foothills
(21238, 409, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Hillsbrad Foothills
(21241, 409, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Hillsbrad Foothills
(30071, 409, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Hillsbrad Foothills
(30074, 409, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Hillsbrad Foothills
(30075, 409, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Hillsbrad Foothills
(30098, 409, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Hillsbrad Foothills
(30103, 409, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Hillsbrad Foothills
(21242, 409, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Hillsbrad Foothills
(30105, 409, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Hillsbrad Foothills
(21243, 409, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Hillsbrad Foothills
(21244, 409, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Hillsbrad Foothills
(30106, 409, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Hillsbrad Foothills
(30110, 409, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Hillsbrad Foothills
(30114, 409, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Hillsbrad Foothills
(30120, 409, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Hillsbrad Foothills
(30125, 409, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Hillsbrad Foothills
(21245, 409, 0, 'Battered Footlocker', 1, 10); -- Battered Footlockers in Hillsbrad Foothills

-- Missing Battered Footlocker spawns in Stonetalon Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(34193, 179486, 1, 1219.48, -323.364, 4.34928, 1.16937, 0, 0, 0.551936, 0.833886, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 34181 at 89.118652 yards.
(35011, 179486, 1, 1120.22, -360.83, -0.368548, 2.19911, 0, 0, 0.891006, 0.453991, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 35008 at 126.651596 yards.
(34201, 179486, 1, 1182.92, -416.675, 16.2559, 1.76278, 0, 0, 0.771625, 0.636078, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 34181 at 182.110413 yards.
(35027, 179486, 1, 1203.5, -31.3563, -2.82677, 3.45576, 0, 0, -0.987688, 0.156436, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 35025 at 75.001717 yards.
(34202, 179486, 1, 1156.75, -181.654, 1.68444, 0.383971, 0, 0, 0.190808, 0.981627, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 34181 at 77.083549 yards.
(34203, 179486, 1, 1160.72, 191.981, 4.09873, 2.51327, 0, 0, 0.951056, 0.309017, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 34186 at 30.550817 yards.
(35013, 179486, 1, 1349.64, 225.174, 13.3361, 4.60767, 0, 0, -0.743144, 0.669131, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 35012 at 110.224007 yards.
(35020, 179486, 1, 1087.92, -431.242, 0.979811, 1.16937, 0, 0, 0.551936, 0.833886, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 35008 at 186.560577 yards.
(35021, 179486, 1, 1053.41, -434.463, 3.52878, 0.95993, 0, 0, 0.461748, 0.887011, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 35008 at 189.123840 yards.
(35022, 179486, 1, 1123.68, 28.9255, 4.57795, 1.67551, 0, 0, 0.743144, 0.669131, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 35017 at 108.203758 yards.
(35023, 179486, 1, 1269.38, -182.082, 5.46835, 5.58505, 0, 0, -0.34202, 0.939693, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 35007 at 60.114716 yards.
(34204, 179486, 1, 1318.57, 99.8749, 3.27564, 3.68265, 0, 0, -0.96363, 0.267241, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 34178 at 88.347176 yards.
(35242, 179486, 1, 1247.54, 83.1062, -2.83286, 2.1293, 0, 0, 0.874619, 0.48481, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 35025 at 65.779709 yards.
(35243, 179486, 1, 1368.76, 14.8609, 7.23989, 2.60054, 0, 0, 0.96363, 0.267241, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 35025 at 110.168938 yards.
(35024, 179486, 1, 1430.5, -32.8395, 26.4264, 4.2237, 0, 0, -0.857167, 0.515038, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 35007 at 180.886353 yards.
(35244, 179486, 1, 1360.1, -356.289, 14.8436, 2.14675, 0, 0, 0.878817, 0.47716, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 35015 at 109.334213 yards.
(34205, 179486, 1, 1142.94, -258.566, -2.10636, 0.436332, 0, 0, 0.216439, 0.976296, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 34181 at 65.439873 yards.
(35245, 179486, 1, 1134.98, -98.4274, 2.25652, 6.12611, 0, 0, -0.0784588, 0.996917, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 35017 at 68.748642 yards.
(35246, 179486, 1, 1027.94, 5.94765, 14.068, 0.994837, 0, 0, 0.477159, 0.878817, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 35017 at 86.633781 yards.
(35247, 179486, 1, 1326.78, -31.8027, 7.5694, 2.00713, 0, 0, 0.843391, 0.5373, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 35025 at 85.129242 yards.
(35248, 179486, 1, 1400.45, 79.8333, 16.0442, 2.25147, 0, 0, 0.902585, 0.430512, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 35025 at 155.337830 yards.
(34206, 179486, 1, 1133.32, -158.61, 2.92415, 1.44862, 0, 0, 0.66262, 0.748956, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 34181 at 109.070412 yards.
(35249, 179486, 1, 1270.48, -90.5138, 2.7399, 2.3911, 0, 0, 0.930417, 0.366502, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 35007 at 108.485313 yards.
(35250, 179486, 1, 1447.52, 90.7417, 19.8746, 3.01941, 0, 0, 0.998135, 0.0610518, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 35025 at 203.125656 yards.
(35251, 179486, 1, 1272.48, 208.63, 12.1666, 4.79966, 0, 0, -0.67559, 0.737278, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 35012 at 36.076599 yards.
(34207, 179486, 1, 1196, 84.5773, -6.96745, 3.35105, 0, 0, -0.994521, 0.104536, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 34178 at 88.872475 yards.
(35252, 179486, 1, 1327.62, 46.2403, 13.1024, 3.83973, 0, 0, -0.939692, 0.34202, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 35025 at 76.040192 yards.
(35253, 179486, 1, 1317.26, -326.386, 10.6947, 1.85005, 0, 0, 0.798635, 0.601815, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 35015 at 64.972610 yards.
(35254, 179486, 1, 1363.94, -130.593, 0.77537, 2.49582, 0, 0, 0.948323, 0.317306, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 35007 at 61.676022 yards.
(35255, 179486, 1, 1344.6, -221.029, -4.98569, 3.85718, 0, 0, -0.936671, 0.35021, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 35007 at 43.714046 yards.
(34208, 179486, 1, 1362.49, 121.718, 12.9175, 1.78023, 0, 0, 0.777145, 0.629321, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 34178 at 118.160507 yards.
(34209, 179486, 1, 1097.99, 145.711, 5.48243, 3.08918, 0, 0, 0.999657, 0.0262016, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 34186 at 91.396187 yards.
(35256, 179486, 1, 1417.42, -122.598, 17.4324, 5.044, 0, 0, -0.580703, 0.814116, 180, 180, 1, 100, 1, 10); -- Closest existing guid is 35007 at 106.452530 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(34193, 410, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Stonetalon Mountains
(35011, 410, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Stonetalon Mountains
(34201, 410, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Stonetalon Mountains
(35027, 410, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Stonetalon Mountains
(34202, 410, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Stonetalon Mountains
(34203, 410, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Stonetalon Mountains
(35013, 410, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Stonetalon Mountains
(35020, 410, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Stonetalon Mountains
(35021, 410, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Stonetalon Mountains
(35022, 410, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Stonetalon Mountains
(35023, 410, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Stonetalon Mountains
(34204, 410, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Stonetalon Mountains
(35242, 410, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Stonetalon Mountains
(35243, 410, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Stonetalon Mountains
(35024, 410, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Stonetalon Mountains
(35244, 410, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Stonetalon Mountains
(34205, 410, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Stonetalon Mountains
(35245, 410, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Stonetalon Mountains
(35246, 410, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Stonetalon Mountains
(35247, 410, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Stonetalon Mountains
(35248, 410, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Stonetalon Mountains
(34206, 410, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Stonetalon Mountains
(35249, 410, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Stonetalon Mountains
(35250, 410, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Stonetalon Mountains
(35251, 410, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Stonetalon Mountains
(34207, 410, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Stonetalon Mountains
(35252, 410, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Stonetalon Mountains
(35253, 410, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Stonetalon Mountains
(35254, 410, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Stonetalon Mountains
(35255, 410, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Stonetalon Mountains
(34208, 410, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Stonetalon Mountains
(34209, 410, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Stonetalon Mountains
(35256, 410, 0, 'Battered Footlocker', 1, 10); -- Battered Footlockers in Stonetalon Mountains

UPDATE `gameobject` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `id` = 179486;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
