DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20201125031644');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20201125031644');
-- Add your query below.


-- Correct location of existing objects.
UPDATE `gameobject` SET `position_x`=1316.55, `position_y`=680.78, `position_z`=35.2747, `orientation`=4.50295, `rotation0`=0, `rotation1`=0, `rotation2`=-0.777145, `rotation3`=0.629321 WHERE `guid`=2298;
UPDATE `gameobject` SET `position_x`=-9495.91, `position_y`=-2337.42, `position_z`=69.3455, `orientation`=0.977383, `rotation0`=0, `rotation1`=0, `rotation2`=0.469471, `rotation3`=0.882948 WHERE `guid`=2243;
UPDATE `gameobject` SET `position_x`=849.742, `position_y`=1241.85, `position_z`=33.9615, `orientation`=1.29154, `rotation0`=0, `rotation1`=0, `rotation2`=0.601814, `rotation3`=0.798636 WHERE `guid`=2251;
UPDATE `gameobject` SET `position_x`=718.524, `position_y`=1453.72, `position_z`=61.1236, `orientation`=2.84488, `rotation0`=0, `rotation1`=0, `rotation2`=0.989016, `rotation3`=0.147811 WHERE `guid`=2090;
UPDATE `gameobject` SET `position_x`=-81.7723, `position_y`=-770.163, `position_z`=56.3972, `orientation`=2.67035, `rotation0`=0, `rotation1`=0, `rotation2`=0.972369, `rotation3`=0.233448 WHERE `guid`=2399;
UPDATE `gameobject` SET `position_x`=-9670.18, `position_y`=-1768.52, `position_z`=55.2737, `orientation`=4.7822, `rotation0`=0, `rotation1`=0, `rotation2`=-0.681998, `rotation3`=0.731354 WHERE `guid`=2288;


-- Missing spawns in Ashenvale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2014, 1620, 1, 2939.44, -3543.78, 109.3, 1.36136, 0, 0, 0.62932, 0.777146, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2014, 1077, 'Mageroyal');

-- Missing spawns in Durotar.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2015, 1620, 1, 1131.9, -4685.81, 20.0887, 4.2237, 0, 0, -0.857167, 0.515038, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2015, 1023, 'Mageroyal');

-- Missing spawns in Loch Modan.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2024, 1620, 0, -4799.45, -3015.7, 305.452, 4.57276, 0, 0, -0.754709, 0.656059, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2024, 1163, 'Mageroyal');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2032, 1620, 0, -5042.01, -3358.18, 298.81, 5.48033, 0, 0, -0.390731, 0.920505, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2032, 1163, 'Mageroyal');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2033, 1620, 0, -5856.29, -3448.97, 318.345, 3.71755, 0, 0, -0.958819, 0.284016, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2033, 1163, 'Mageroyal');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2047, 1620, 0, -5011.31, -3508.53, 299.731, 0.95993, 0, 0, 0.461748, 0.887011, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2047, 1163, 'Mageroyal');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2059, 1620, 0, -5407.17, -2842.9, 349.277, 5.77704, 0, 0, -0.25038, 0.968148, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2059, 1163, 'Mageroyal');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2074, 1620, 0, -4992.66, -3306.73, 299.76, 5.65487, 0, 0, -0.309016, 0.951057, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2074, 1163, 'Mageroyal');

-- Missing spawns in Silverpine Forest.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2077, 1620, 0, 958.84, 1069.46, 36.558, 6.21337, 0, 0, -0.0348988, 0.999391, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2077, 1043, 'Mageroyal');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2094, 1620, 0, 676.372, 1213.96, 65.2791, 4.67748, 0, 0, -0.719339, 0.694659, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2094, 1043, 'Mageroyal');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2102, 1620, 0, 1212.28, 1081.24, 38.5364, 5.95157, 0, 0, -0.165047, 0.986286, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2102, 1043, 'Mageroyal');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2132, 1620, 0, 1336.83, 743.906, 34.2843, 2.54818, 0, 0, 0.956305, 0.292372, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2132, 1043, 'Mageroyal');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2157, 1620, 0, 809.661, 1477.3, 33.4895, 2.75761, 0, 0, 0.981627, 0.190812, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2157, 1043, 'Mageroyal');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2215, 1620, 0, 805.578, 1547.65, 43.077, 4.57276, 0, 0, -0.754709, 0.656059, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2215, 1043, 'Mageroyal');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2239, 1620, 0, 708.846, 1229.78, 62.9129, 4.34587, 0, 0, -0.824126, 0.566406, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2239, 1043, 'Mageroyal');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2248, 1620, 0, 868.94, 1162.26, 35.5119, 4.13643, 0, 0, -0.878817, 0.47716, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2248, 1043, 'Mageroyal');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2269, 1620, 0, -293.199, 1221.4, 47.9139, 3.78737, 0, 0, -0.948323, 0.317306, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2269, 1043, 'Mageroyal');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2302, 1620, 0, 886.554, 1540.91, 26.2854, 2.3911, 0, 0, 0.930417, 0.366502, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2302, 1043, 'Mageroyal');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2331, 1620, 0, 1123.37, 1095.89, 40.1016, 3.90954, 0, 0, -0.927183, 0.374608, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2331, 1043, 'Mageroyal');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2364, 1620, 0, 1284.96, 910.183, 39.4659, 0.279252, 0, 0, 0.139173, 0.990268, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2364, 1043, 'Mageroyal');

-- Missing spawns in Wailing Caverns.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2368, 1620, 1, -545.644, -2245.66, 42.6309, 2.96704, 0, 0, 0.996194, 0.087165, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2368, 1053, 'Mageroyal');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2371, 1620, 1, -652.396, -2330.84, 19.6195, 5.93412, 0, 0, -0.173648, 0.984808, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2371, 1053, 'Mageroyal');

-- Missing spawns in Wetlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2373, 1620, 0, -4232.42, -2674.76, 41.5726, 3.17653, 0, 0, -0.999847, 0.0174693, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2373, 1154, 'Mageroyal');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2391, 1620, 0, -3065.17, -2583.33, 11.2463, 3.31614, 0, 0, -0.996194, 0.087165, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2391, 1154, 'Mageroyal');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2396, 1620, 0, -3847.47, -2681.57, 31.1856, 5.39307, 0, 0, -0.43051, 0.902586, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2396, 1154, 'Mageroyal');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2416, 1620, 0, -3918.23, -2716.54, 26.4426, 5.20108, 0, 0, -0.515037, 0.857168, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2416, 1154, 'Mageroyal');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2435, 1620, 0, -3139.51, -2545.52, 9.23924, 2.30383, 0, 0, 0.913545, 0.406738, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2435, 1154, 'Mageroyal');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2449, 1620, 0, -3348.16, -3278.91, 23.1451, 2.28638, 0, 0, 0.909961, 0.414694, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2449, 1154, 'Mageroyal');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2465, 1620, 0, -2962.5, -2679.83, 13.754, 4.29351, 0, 0, -0.83867, 0.54464, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2465, 1154, 'Mageroyal');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (2484, 1620, 0, -3317.16, -2676.49, 14.5292, 6.02139, 0, 0, -0.130526, 0.991445, 900, 900, 255, 1);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (2484, 1154, 'Mageroyal');



-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
