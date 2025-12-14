DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230628163157');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230628163157');
-- Add your query below.


-- Create new pool to hold Battered Footlocker spawns in Wetlands.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(49, 9, 'Battered Footlockers in Wetlands', 1, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(14910, 49, 0, 'Battered Footlocker', 1, 10),
(14911, 49, 0, 'Battered Footlocker', 1, 10),
(14912, 49, 0, 'Battered Footlocker', 1, 10),
(14913, 49, 0, 'Battered Footlocker', 1, 10),
(14963, 49, 0, 'Battered Footlocker', 1, 10);

-- Create new pool to hold Battered Footlocker spawns in Hillsbrad Foothills.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(403, 9, 'Battered Footlockers in Hillsbrad Foothills', 1, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(20807, 403, 0, 'Battered Footlocker', 1, 10),
(20880, 403, 0, 'Battered Footlocker', 1, 10),
(21265, 403, 0, 'Battered Footlocker', 1, 10),
(21266, 403, 0, 'Battered Footlocker', 1, 10),
(21267, 403, 0, 'Battered Footlocker', 1, 10);

-- Create new pool to hold Battered Footlocker spawns in Stonetalon Mountains.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(404, 5, 'Battered Footlockers in Stonetalon Mountains', 1, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(39943, 404, 0, 'Battered Footlocker', 1, 10),
(40703, 404, 0, 'Battered Footlocker', 1, 10),
(40704, 404, 0, 'Battered Footlocker', 1, 10),
(40705, 404, 0, 'Battered Footlocker', 1, 10),
(40706, 404, 0, 'Battered Footlocker', 1, 10);

-- Missing Battered Footlocker spawns in Wetlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(14921, 179488, 0, -3221.37, -1020.48, 7.92467, 3.61284, 0, 0, -0.972369, 0.233448, 10, 10, 1, 100, 1, 10), -- Closest existing guid is 14911 at 82.042282 yards.
(14922, 179488, 0, -3208.96, -1023, 10.0995, 0, 0, 0, 0, 1, 10, 10, 1, 100, 1, 10), -- Closest existing guid is 14911 at 81.909317 yards.
(14966, 179488, 0, -3053.2, -988.194, 8.76575, 4.10153, 0, 0, -0.887011, 0.461749, 10, 10, 1, 100, 1, 10), -- Closest existing guid is 14963 at 6.680152 yards.
(14923, 179488, 0, -3291.57, -953.24, 9.11977, 3.12412, 0, 0, 0.999962, 0.00873464, 10, 10, 1, 100, 1, 10), -- Closest existing guid is 14913 at 10.754777 yards.
(14924, 179488, 0, -3287.25, -943.397, 8.92945, 2.05949, 0, 0, 0.857167, 0.515038, 10, 10, 1, 100, 1, 10), -- Closest existing guid is 14913 at 14.625512 yards.
(14925, 179488, 0, -3235.09, -1148.29, 8.72373, 3.73501, 0, 0, -0.956305, 0.292372, 10, 10, 1, 100, 1, 10), -- Closest existing guid is 14910 at 12.425591 yards.
(14929, 179488, 0, -3230.19, -1147.53, 7.79682, 0.122173, 0, 0, 0.0610485, 0.998135, 10, 10, 1, 100, 1, 10), -- Closest existing guid is 14910 at 15.012830 yards.
(14933, 179488, 0, -3145.93, -1054.7, 8.56969, 2.60054, 0, 0, 0.96363, 0.267241, 10, 10, 1, 100, 1, 10), -- Closest existing guid is 14912 at 15.066031 yards.
(14967, 179488, 0, -3048.99, -969.674, 9.01211, 2.00713, 0, 0, 0.843391, 0.5373, 10, 10, 1, 100, 1, 10), -- Closest existing guid is 14963 at 12.383120 yards.
(14934, 179488, 0, -3201.64, -957.986, 8.90404, 5.13127, 0, 0, -0.544639, 0.838671, 10, 10, 1, 100, 1, 10), -- Closest existing guid is 14911 at 16.561735 yards.
(14969, 179488, 0, -3104.77, -947.625, 8.90692, 2.51327, 0, 0, 0.951056, 0.309017, 10, 10, 1, 100, 1, 10), -- Closest existing guid is 14963 at 63.779865 yards.
(14970, 179488, 0, -3106.28, -960.787, 8.48963, 2.65289, 0, 0, 0.970295, 0.241925, 10, 10, 1, 100, 1, 10), -- Closest existing guid is 14963 at 59.193684 yards.
(14971, 179488, 0, -2987.6, -1062.95, 7.83829, 0.0698117, 0, 0, 0.0348988, 0.999391, 10, 10, 1, 100, 1, 10), -- Closest existing guid is 14963 at 102.897888 yards.
(14980, 179488, 0, -2992.43, -1082.74, 8.07506, 0.0174525, 0, 0, 0.00872612, 0.999962, 10, 10, 1, 100, 1, 10), -- Closest existing guid is 14963 at 116.612068 yards.
(14981, 179488, 0, -2996.25, -1067.17, 9.36874, 3.194, 0, 0, -0.999657, 0.0262016, 10, 10, 1, 100, 1, 10); -- Closest existing guid is 14963 at 101.327263 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(14921, 49, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Wetlands
(14922, 49, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Wetlands
(14966, 49, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Wetlands
(14923, 49, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Wetlands
(14924, 49, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Wetlands
(14925, 49, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Wetlands
(14929, 49, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Wetlands
(14933, 49, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Wetlands
(14967, 49, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Wetlands
(14934, 49, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Wetlands
(14969, 49, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Wetlands
(14970, 49, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Wetlands
(14971, 49, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Wetlands
(14980, 49, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Wetlands
(14981, 49, 0, 'Battered Footlocker', 1, 10); -- Battered Footlockers in Wetlands

-- Missing Battered Footlocker spawns in Hillsbrad Foothills.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(20882, 179488, 0, -596.135, -1434.1, 65.0242, 2.1293, 0, 0, 0.874619, 0.48481, 10, 10, 1, 100, 1, 10), -- Closest existing guid is 20880 at 67.314713 yards.
(20883, 179488, 0, -586.978, -1398.59, 64.8736, 0.767944, 0, 0, 0.374606, 0.927184, 10, 10, 1, 100, 1, 10), -- Closest existing guid is 20880 at 70.561996 yards.
(21268, 179488, 0, -464.1, -1308.28, 64.7549, 4.46804, 0, 0, -0.788011, 0.615662, 10, 10, 1, 100, 1, 10), -- Closest existing guid is 21265 at 114.089622 yards.
(21269, 179488, 0, -425.479, -1321.48, 64.8703, 5.16618, 0, 0, -0.529919, 0.848048, 10, 10, 1, 100, 1, 10), -- Closest existing guid is 21265 at 97.504028 yards.
(20915, 179488, 0, -535.313, -1338.79, 64.8361, 5.55015, 0, 0, -0.358368, 0.93358, 10, 10, 1, 100, 1, 10), -- Closest existing guid is 20880 at 100.194740 yards.
(21270, 179488, 0, -477.884, -1472.52, 87.8191, 2.70526, 0, 0, 0.976295, 0.216442, 10, 10, 1, 100, 1, 10), -- Closest existing guid is 21267 at 40.382214 yards.
(21284, 179488, 0, -404.957, -1336.19, 64.8962, 3.21142, 0, 0, -0.999391, 0.0349061, 10, 10, 1, 100, 1, 10), -- Closest existing guid is 21265 at 88.123703 yards.
(21285, 179488, 0, -538.906, -1586.92, 64.7883, 1.79769, 0, 0, 0.782608, 0.622515, 10, 10, 1, 100, 1, 10), -- Closest existing guid is 21266 at 86.584160 yards.
(20817, 179488, 0, -480.84, -1444.27, 87.685, 1.8675, 0, 0, 0.803857, 0.594823, 10, 10, 1, 100, 1, 10), -- Closest existing guid is 20807 at 51.925484 yards.
(21286, 179488, 0, -487.744, -1490.33, 87.7138, 3.80482, 0, 0, -0.945518, 0.325568, 10, 10, 1, 100, 1, 10), -- Closest existing guid is 21267 at 30.835201 yards.
(21287, 179488, 0, -440.542, -1558.91, 64.9393, 3.15906, 0, 0, -0.999962, 0.00873464, 10, 10, 1, 100, 1, 10), -- Closest existing guid is 21266 at 34.618484 yards.
(21288, 179488, 0, -479.151, -1529.03, 65.2002, 4.41568, 0, 0, -0.803857, 0.594823, 10, 10, 1, 100, 1, 10), -- Closest existing guid is 21267 at 33.887054 yards.
(20918, 179488, 0, -617.808, -1554.5, 64.8736, 1.76278, 0, 0, 0.771625, 0.636078, 10, 10, 1, 100, 1, 10), -- Closest existing guid is 20880 at 145.880142 yards.
(20956, 179488, 0, -544.347, -1379.27, 64.757, 3.10665, 0, 0, 0.999847, 0.0174693, 10, 10, 1, 100, 1, 10), -- Closest existing guid is 20880 at 61.469379 yards.
(21289, 179488, 0, -464.953, -1614.66, 64.8736, 2.61799, 0, 0, 0.965925, 0.258821, 10, 10, 1, 100, 1, 10); -- Closest existing guid is 21266 at 26.395107 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(20882, 403, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Hillsbrad Foothills
(20883, 403, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Hillsbrad Foothills
(21268, 403, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Hillsbrad Foothills
(21269, 403, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Hillsbrad Foothills
(20915, 403, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Hillsbrad Foothills
(21270, 403, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Hillsbrad Foothills
(21284, 403, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Hillsbrad Foothills
(21285, 403, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Hillsbrad Foothills
(20817, 403, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Hillsbrad Foothills
(21286, 403, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Hillsbrad Foothills
(21287, 403, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Hillsbrad Foothills
(21288, 403, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Hillsbrad Foothills
(20918, 403, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Hillsbrad Foothills
(20956, 403, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Hillsbrad Foothills
(21289, 403, 0, 'Battered Footlocker', 1, 10); -- Battered Footlockers in Hillsbrad Foothills

-- Missing Battered Footlocker spawns in Stonetalon Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(40721, 179488, 1, 981.934, -369.518, 16.1245, 2.21657, 0, 0, 0.894934, 0.446199, 10, 10, 1, 100, 1, 10), -- Closest existing guid is 40704 at 12.835145 yards.
(40723, 179488, 1, 959.733, -323.349, -0.973847, 1.46608, 0, 0, 0.66913, 0.743145, 10, 10, 1, 100, 1, 10), -- Closest existing guid is 40706 at 33.809834 yards.
(40724, 179488, 1, 957.002, -358.111, 5.45155, 0.314158, 0, 0, 0.156434, 0.987688, 10, 10, 1, 100, 1, 10); -- Closest existing guid is 40706 at 14.599030 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(40721, 404, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Stonetalon Mountains
(40723, 404, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Stonetalon Mountains
(40724, 404, 0, 'Battered Footlocker', 1, 10); -- Battered Footlockers in Stonetalon Mountains

UPDATE `gameobject` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `id` = 179488;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
