DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210102164029');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210102164029');
-- Add your query below.


-- Correct location of existing objects.
UPDATE `gameobject` SET `position_x`=1115.69, `position_y`=-254.806, `position_z`=32.94, `orientation`=2.30383, `rotation0`=0, `rotation1`=0, `rotation2`=0.913545, `rotation3`=0.406738 WHERE `guid`=7396;
UPDATE `gameobject` SET `position_x`=-3077.74, `position_y`=-1994.2, `position_z`=7.12134, `orientation`=4.79966, `rotation0`=0, `rotation1`=0, `rotation2`=-0.67559, `rotation3`=0.737278 WHERE `guid`=7417;


INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES (998, 1, 'Liferoot in Hillsbrad Foothills', 0, 0, 0, 10);


-- Missing spawns in Alterac Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (6777, 2041, 0, 352.731, -1452.43, 39.5358, 2.58308, 0, 0, 0.961261, 0.27564, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (6777, 1063, 'Liferoot');

-- Missing spawns in Arathi Highlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (6681, 2041, 0, -1853.69, -2548.98, 54.381, 4.76475, 0, 0, -0.688354, 0.725375, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (6681, 1184, 'Liferoot');

-- Missing spawns in Desolace.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (21386, 2041, 1, -1659.96, 1469.15, 59.5975, 2.54818, 0, 0, 0.956305, 0.292372, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (21386, 1144, 'Liferoot');

-- Missing spawns in Dustwallow Marsh.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (19441, 2041, 1, -4085.57, -3025.3, 31.9925, 4.53786, 0, 0, -0.766044, 0.642789, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (19441, 1104, 'Liferoot');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (19442, 2041, 1, -2791.54, -3519.12, 29.3699, 0.209439, 0, 0, 0.104528, 0.994522, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (19442, 1104, 'Liferoot');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (19444, 2041, 1, -2786.07, -3127.25, 30.1961, 2.93214, 0, 0, 0.994521, 0.104535, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (19444, 1104, 'Liferoot');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (20971, 2041, 1, -4107.86, -3427.9, 30.6956, 2.11185, 0, 0, 0.870356, 0.492424, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (20971, 1104, 'Liferoot');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (21106, 2041, 1, -4200.37, -3329.22, 30.2588, 3.07177, 0, 0, 0.999391, 0.0349061, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (21106, 1104, 'Liferoot');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (21109, 2041, 1, -3731.32, -3187.41, 32.0722, 5.60251, 0, 0, -0.333807, 0.942641, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (21109, 1104, 'Liferoot');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (21120, 2041, 1, -3563.34, -2881.77, 29.8927, 2.74016, 0, 0, 0.979924, 0.19937, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (21120, 1104, 'Liferoot');

-- Missing spawns in Feralas.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (21443, 2041, 1, -3042.13, 1967.54, 28.5348, 4.85202, 0, 0, -0.656058, 0.75471, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (21443, 1193, 'Liferoot');

-- Missing spawns in Hillsbrad Foothills.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (6664, 2041, 0, -290.843, -1114.09, 36.566, 1.74533, 0, 0, 0.766044, 0.642789, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (6664, 998, 'Liferoot');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (6724, 2041, 0, -363.167, -1073.16, 35.5518, 3.97936, 0, 0, -0.913545, 0.406738, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (6724, 998, 'Liferoot');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (6778, 2041, 0, -181.093, -1135.63, 38.3253, 4.36332, 0, 0, -0.819152, 0.573577, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (6778, 998, 'Liferoot');

-- Missing spawns in Scarlet Monastery.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (21576, 2041, 189, 938.935, 1398.88, 18.34, 2.42601, 0, 0, 0.936672, 0.350207, 604800, 604800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (21576, 1054, 'Liferoot');

-- Missing spawns in Stranglethorn Vale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (6642, 2041, 0, -12423.7, -335.87, 15.0723, 4.85202, 0, 0, -0.656058, 0.75471, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (6642, 1179, 'Liferoot');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (6656, 2041, 0, -13349.2, 745.214, 4.4602, 0.90757, 0, 0, 0.438371, 0.898794, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (6656, 1179, 'Liferoot');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (10614, 2041, 0, -13985.5, 368.891, 29.6164, 6.03884, 0, 0, -0.121869, 0.992546, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (10614, 1179, 'Liferoot');

-- Missing spawns in Swamp of Sorrows.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (6648, 2041, 0, -10607.5, -4078.95, 19.2055, 4.34587, 0, 0, -0.824126, 0.566406, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (6648, 1317, 'Liferoot');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (6687, 2041, 0, -10761.8, -4158.78, 19.8357, 0.523598, 0, 0, 0.258819, 0.965926, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (6687, 1317, 'Liferoot');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (6773, 2041, 0, -10195.8, -4084.3, 19.2791, 5.96903, 0, 0, -0.156434, 0.987688, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (6773, 1317, 'Liferoot');

-- Missing spawns in Wetlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (6779, 2041, 0, -3009.18, -2612.51, 7.93079, 0.104719, 0, 0, 0.0523357, 0.99863, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (6779, 1153, 'Liferoot');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (6781, 2041, 0, -3144.12, -2672.27, 7.48634, 1.41372, 0, 0, 0.649447, 0.760406, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (6781, 1153, 'Liferoot');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (10234, 2041, 0, -3197.96, -2636.1, 7.63684, 2.26892, 0, 0, 0.906307, 0.422619, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (10234, 1153, 'Liferoot');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (10613, 2041, 0, -3013.65, -2502.55, 8.11191, 3.87463, 0, 0, -0.93358, 0.358368, 1800, 1800, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (10613, 1153, 'Liferoot');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
