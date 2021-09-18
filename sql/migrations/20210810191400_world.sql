DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210810191400');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210810191400');
-- Add your query below.


-- Update Creatures and Gameobjects Associated With Quest Clam Bait 
UPDATE `gameobject_template` SET `Data8` = 6142, `data9` = 0, `flags` = 4 WHERE `entry` = 177784;
UPDATE `gameobject` SET `spawntimesecsmin`= 120, `spawntimesecsmax`= 120 WHERE id = 177784;
UPDATE `creature` SET `movement_type` = 1, `wander_distance`= 50 WHERE `id` = 12347;

INSERT INTO `creature` (`guid`, `id`,`map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(1345, 12347, 1, -709.65, 3079.03, -30.12, 3.16598, 300, 300, 50, 100, 0, 1, 0, 0, 0, 10),
(1361, 12347, 1, -732.872, 3116.84, -25.9876, 3.16598, 300, 300, 50, 100, 0, 1, 0, 0, 0, 10),
(1369, 12347, 1, -819.322, 3151.19, -29.0014, 3.16598, 300, 300, 50, 100, 0, 1, 0, 0, 0, 10),
(1374, 12347, 1, -927.963, 3116.89, -25.2395, 3.16598, 300, 300, 50, 100, 0, 1, 0, 0, 0, 10),
(1377, 12347, 1, -779.266, 3044.03, -22.1945, 3.16598, 300, 300, 50, 100, 0, 1, 0, 0, 0, 10),
(1382, 12347, 1, -672.3, 2973.36, -21.8494, 3.16598, 300, 300, 50, 100, 0, 1, 0, 0, 0, 10);

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(2555, 177784, 1, -979.745, 3089.43, -23.5718, 4.31097, 0, 0, -0.833885, 0.551938, 120, 120, 1, 100, 0, 10),
(2892, 177784, 1, -867.013, 3126.95, -27.1865, 4.04917, 0, 0, -0.898793, 0.438373, 120, 120, 1, 100, 0, 10),
(4727, 177784, 1, -778.617, 3046.94, -22.5933, 3.97936, 0, 0, -0.913545, 0.406738, 120, 120, 1, 100, 0, 10),
(8929, 177784, 1, -760.882, 3161.17, -25.7622, 5.5676, 0, 0, -0.350207, 0.936672, 120, 120, 1, 100, 0, 10),
(8974, 177784, 1, -712.414, 3080.17, -30.5822, 4.50295, 0, 0, -0.777145, 0.629321, 120, 120, 1, 100, 0, 10),
(8981, 177784, 1, -673.472, 2976.08, -22.2912, 2.3911, 0, 0, 0.930417, 0.366502, 120, 120, 1, 100, 0, 10),
(8983, 177784, 1, -645.7, 2896.28, -26.6011, 4.59022, 0, 0, -0.748956, 0.66262, 120, 120, 1, 100, 0, 10),
(8985, 177784, 1, -644.002, 3055.52, -24.7697, 4.88692, 0, 0, -0.642787, 0.766045, 120, 120, 1, 100, 0, 10),
(8988, 177784, 1, -569.263, 2965.02, -61.9416, 2.40855, 0, 0, 0.93358, 0.358368, 120, 120, 1, 100, 0, 10);

INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1234702, 12347, 187, 1, 0, 100, 1, 30000, 120000, 30000, 120000, 1234702, 0, 0, 'Enraged Reef Crawler - Despawn Gameobject OOC');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1234702, 0, 3, 2, 0, 5, 2, 177784, 20, 11, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 'Enraged Reef Crawler - Move');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1234702, 0, 81, 0, 0, 0, 0, 177784, 20, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Enraged Reef Crawler - Despawn Gameobject');
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (187, 21, 177784, 19, 0, 0, 2);

-- Update Gameobjects
UPDATE `gameobject_template` SET `flags` = 4, `data8` = 894 WHERE `entry` IN (4072, 61935);

-- Redo Devilsaur Movement (credit cmangos)
DELETE FROM `creature` WHERE `guid` IN (23743, 23744, 23745, 23741, 95009, 24172);
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(23743, 6498, 6499, 6500, 0, 1, -7495.01, -1591.01, -273.613, 3.8834, 600, 600, 0, 100, 0, 2, 5, 0, 0, 10),
(23744, 6498, 6499, 6500, 0, 1, -6822.65, -2215.74, -272.048, 2.83219, 600, 600, 0, 100, 0, 2, 5, 0, 0, 10),
(23745, 6498, 6499, 6500, 0, 1, -7463.66, -1317.78, -271.871, 5.32128, 600, 600, 0, 100, 0, 2, 5, 0, 0, 10),
(23741, 6498, 6499, 6500, 0, 1, -6881.97, -654.259, -270.695, 2.69939, 600, 600, 0, 100, 0, 2, 5, 0, 0, 10),
(95009, 6498, 6499, 6500, 0, 1, -6552.77, -751.063, -275.102, 4.24611, 900, 900, 0, 100, 0, 2, 5, 0, 0, 10),
(24172, 6498, 6499, 6500, 0, 1, -6581.49, -1593.33, -272.097, 3.25922, 600, 600, 0, 100, 0, 2, 5, 0, 0, 10);

DELETE FROM `creature_movement` WHERE `id` = 23743;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `script_id`) VALUES
(23743, 1, -7495.01, -1591.01, -273.613, 0, 0, 0),
(23743, 2, -7495.01, -1591.01, -273.613, 0, 0, 0),
(23743, 3, -7482.33, -1606.67, -277.247, 0, 0, 0),
(23743, 4, -7477.42, -1629.62, -279.994, 0, 0, 0),
(23743, 5, -7488.03, -1647.35, -282.685, 0, 0, 0),
(23743, 6, -7489.08, -1648.67, -282.745, 0, 0, 0),
(23743, 7, -7503.88, -1663.56, -281.359, 0, 0, 0),
(23743, 8, -7523.2, -1686.37, -280.61, 0, 0, 0),
(23743, 9, -7525.15, -1689.84, -280.06, 0, 0, 0),
(23743, 10, -7530.11, -1703.93, -278.029, 0, 0, 0),
(23743, 11, -7536.19, -1719.54, -277.469, 0, 0, 0),
(23743, 12, -7548, -1722.84, -274.554, 0, 0, 0),
(23743, 13, -7548, -1722.84, -274.554, 0, 0, 0),
(23743, 14, -7574.96, -1730.3, -271.972, 0, 0, 0),
(23743, 15, -7582.42, -1736.17, -273.269, 0, 0, 0),
(23743, 16, -7594.6, -1741.79, -273.703, 0, 0, 0),
(23743, 17, -7607.58, -1738.49, -271.602, 0, 0, 0),
(23743, 18, -7620.25, -1731.34, -270.952, 0, 0, 0),
(23743, 19, -7620.25, -1731.34, -270.952, 0, 0, 0),
(23743, 20, -7637.22, -1727.82, -273.027, 0, 0, 0),
(23743, 21, -7651.67, -1726.51, -272.406, 0, 0, 0),
(23743, 22, -7681.32, -1724.84, -270.926, 0, 0, 0),
(23743, 23, -7692.12, -1711.98, -270.566, 0, 0, 0),
(23743, 24, -7695.6, -1695.59, -271.87, 0, 0, 0),
(23743, 25, -7697.08, -1674.66, -272.043, 0, 0, 0),
(23743, 26, -7696.42, -1653.21, -272.05, 0, 0, 0),
(23743, 27, -7691.14, -1633.79, -272.037, 0, 0, 0),
(23743, 28, -7689.78, -1623.81, -271.227, 0, 0, 0),
(23743, 29, -7684.67, -1612.65, -271.682, 0, 0, 0),
(23743, 30, -7683.2, -1610.25, -271.906, 0, 0, 0),
(23743, 31, -7663.33, -1589, -272.065, 0, 0, 0),
(23743, 32, -7649.26, -1577.03, -272.208, 0, 0, 0),
(23743, 33, -7621.94, -1569.79, -271.864, 0, 0, 0),
(23743, 34, -7621.94, -1569.79, -271.864, 0, 0, 0),
(23743, 35, -7601.03, -1571.47, -270.887, 0, 0, 0),
(23743, 36, -7588.66, -1578.34, -271.272, 0, 0, 0),
(23743, 37, -7582.48, -1579.52, -271.525, 0, 0, 0),
(23743, 38, -7579.8, -1558.15, -272.273, 0, 0, 0),
(23743, 39, -7570.2, -1551.47, -271.791, 0, 0, 0),
(23743, 40, -7554.22, -1543.54, -271.355, 0, 0, 0),
(23743, 41, -7542.87, -1535.33, -271.743, 0, 0, 0),
(23743, 42, -7528.66, -1518.04, -271.652, 0, 0, 0),
(23743, 43, -7511.63, -1496.54, -272.806, 0, 0, 0),
(23743, 44, -7494.85, -1489.6, -271.439, 0, 0, 0),
(23743, 45, -7470.11, -1494.75, -271.738, 0, 0, 0),
(23743, 46, -7470.11, -1494.75, -271.738, 0, 0, 0),
(23743, 47, -7482.02, -1510.96, -271.379, 0, 0, 0),
(23743, 48, -7488.79, -1523.78, -271.728, 0, 0, 0),
(23743, 49, -7497.21, -1556.06, -272.041, 0, 0, 0),
(23743, 50, -7497.21, -1556.06, -272.041, 0, 0, 0),
(23743, 51, -7489.88, -1575.74, -275.083, 0, 0, 0);

DELETE FROM `creature_movement` WHERE `id` = 23744;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `script_id`) VALUES
(23744, 1, -6822.65, -2215.74, -272.048, 0, 0, 0),
(23744, 2, -6847.12, -2220.2, -272.097, 0, 0, 0),
(23744, 3, -6877.78, -2212.78, -271.847, 0, 0, 0),
(23744, 4, -6917.13, -2191.34, -271.454, 0, 0, 0),
(23744, 5, -6922.84, -2212.59, -271.847, 0, 0, 0),
(23744, 6, -6952.16, -2221.52, -272.964, 0, 0, 0),
(23744, 7, -6980.05, -2250.2, -273.603, 0, 0, 0),
(23744, 8, -7015.74, -2253.75, -271.262, 0, 0, 0),
(23744, 9, -7048.96, -2249.78, -271.061, 0, 0, 0),
(23744, 10, -7081.29, -2254.48, -270.41, 0, 0, 0),
(23744, 11, -7113.14, -2225.67, -271.388, 0, 0, 0),
(23744, 12, -7144.08, -2205.06, -275.553, 0, 0, 0),
(23744, 13, -7181.44, -2201.89, -272.439, 0, 0, 0),
(23744, 14, -7190.57, -2175.7, -270.807, 0, 0, 0),
(23744, 15, -7192.83, -2146.22, -270.867, 0, 0, 0),
(23744, 16, -7210.82, -2118.65, -272.106, 0, 0, 0),
(23744, 17, -7229.12, -2106.46, -272.142, 0, 0, 0),
(23744, 18, -7251.36, -2095.05, -272.596, 0, 0, 0),
(23744, 19, -7280.81, -2085.63, -271.449, 0, 0, 0),
(23744, 20, -7313.04, -2071.2, -269.545, 0, 0, 0),
(23744, 21, -7335.29, -2062.19, -272.228, 0, 0, 0),
(23744, 22, -7359.13, -2049.84, -272.409, 0, 0, 0),
(23744, 23, -7381.56, -2046.35, -272.058, 0, 0, 0),
(23744, 24, -7389.79, -2024.9, -271.697, 0, 0, 0),
(23744, 25, -7392.71, -2006.98, -271.221, 0, 0, 0),
(23744, 26, -7396.01, -1981.84, -270.751, 0, 0, 0),
(23744, 27, -7404.4, -1951.79, -271.928, 0, 0, 0),
(23744, 28, -7419.29, -1921.91, -270.018, 0, 0, 0),
(23744, 29, -7430.96, -1890.18, -272.338, 0, 0, 0),
(23744, 30, -7456.54, -1864.96, -271.624, 0, 0, 0),
(23744, 31, -7448.39, -1831.53, -272.097, 0, 0, 0),
(23744, 32, -7429.15, -1811.63, -270.106, 0, 0, 0),
(23744, 33, -7423.44, -1777.7, -272.1, 0, 0, 0),
(23744, 34, -7429.15, -1811.63, -270.106, 0, 0, 0),
(23744, 35, -7448.39, -1831.53, -272.097, 0, 0, 0),
(23744, 36, -7456.54, -1864.96, -271.624, 0, 0, 0),
(23744, 37, -7430.96, -1890.18, -272.338, 0, 0, 0),
(23744, 38, -7419.29, -1921.91, -270.018, 0, 0, 0),
(23744, 39, -7404.4, -1951.79, -271.928, 0, 0, 0),
(23744, 40, -7396.01, -1981.84, -270.751, 0, 0, 0),
(23744, 41, -7392.71, -2006.98, -271.221, 0, 0, 0),
(23744, 42, -7389.79, -2024.9, -271.697, 0, 0, 0),
(23744, 43, -7381.56, -2046.35, -272.058, 0, 0, 0),
(23744, 44, -7359.13, -2049.84, -272.409, 0, 0, 0),
(23744, 45, -7335.29, -2062.19, -272.228, 0, 0, 0),
(23744, 46, -7313.04, -2071.2, -269.545, 0, 0, 0),
(23744, 47, -7280.81, -2085.63, -271.449, 0, 0, 0),
(23744, 48, -7251.36, -2095.05, -272.596, 0, 0, 0),
(23744, 49, -7229.12, -2106.46, -272.142, 0, 0, 0),
(23744, 50, -7210.82, -2118.65, -272.106, 0, 0, 0),
(23744, 51, -7192.83, -2146.22, -270.867, 0, 0, 0),
(23744, 52, -7190.57, -2175.7, -270.807, 0, 0, 0),
(23744, 53, -7181.44, -2201.89, -272.439, 0, 0, 0),
(23744, 54, -7144.08, -2205.06, -275.553, 0, 0, 0),
(23744, 55, -7113.14, -2225.67, -271.388, 0, 0, 0),
(23744, 56, -7081.29, -2254.48, -270.41, 0, 0, 0),
(23744, 57, -7048.96, -2249.78, -271.061, 0, 0, 0),
(23744, 58, -7015.74, -2253.75, -271.136, 0, 0, 0),
(23744, 59, -6980.05, -2250.2, -273.603, 0, 0, 0),
(23744, 60, -6952.16, -2221.52, -273.184, 0, 0, 0),
(23744, 61, -6922.84, -2212.59, -271.847, 0, 0, 0),
(23744, 62, -6917.13, -2191.34, -271.454, 0, 0, 0),
(23744, 63, -6877.78, -2212.78, -271.847, 0, 0, 0),
(23744, 64, -6847.12, -2220.2, -272.097, 0, 0, 0),
(23744, 65, -6822.65, -2215.74, -272.048, 0, 0, 0),
(23744, 66, -6782.56, -2216.16, -272.052, 0, 0, 0);

DELETE FROM `creature_movement` WHERE `id` = 23745;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `script_id`) VALUES
(23745, 1, -7463.66, -1317.78, -271.871, 0, 0, 0),
(23745, 2, -7465.22, -1307.3, -272.22, 0, 0, 0),
(23745, 3, -7457.3, -1281.89, -270.476, 0, 0, 0),
(23745, 4, -7452.34, -1276.64, -269.08, 0, 0, 0),
(23745, 5, -7439.56, -1268.89, -267.948, 0, 0, 0),
(23745, 6, -7421.82, -1262.27, -270.104, 0, 0, 0),
(23745, 7, -7416.3, -1258.44, -270.454, 0, 0, 0),
(23745, 8, -7400.15, -1245.09, -269.298, 0, 0, 0),
(23745, 9, -7388.43, -1234.26, -268.929, 0, 0, 0),
(23745, 10, -7372.91, -1216.54, -270.424, 0, 0, 0),
(23745, 11, -7361.44, -1190.44, -271.503, 0, 0, 0),
(23745, 12, -7366.15, -1185.67, -271.911, 0, 0, 0),
(23745, 13, -7379.09, -1177.95, -271.47, 0, 0, 0),
(23745, 14, -7379.09, -1177.95, -271.47, 0, 0, 0),
(23745, 15, -7409.31, -1163.59, -268.292, 0, 0, 0),
(23745, 16, -7423.26, -1147.89, -268.663, 0, 0, 0),
(23745, 17, -7434.95, -1136.2, -269.317, 0, 0, 0),
(23745, 18, -7450.92, -1122.57, -271.134, 0, 0, 0),
(23745, 19, -7475.06, -1111.03, -272.133, 0, 0, 0),
(23745, 20, -7475.06, -1111.03, -272.133, 0, 0, 0),
(23745, 21, -7496.65, -1102.47, -272.222, 0, 0, 0),
(23745, 22, -7518.56, -1116.95, -271.967, 0, 0, 0),
(23745, 23, -7528.19, -1133.81, -271.568, 0, 0, 0),
(23745, 24, -7531.42, -1147.45, -271.572, 0, 0, 0),
(23745, 25, -7539.71, -1166.73, -270.002, 0, 0, 0),
(23745, 26, -7542.06, -1172.16, -269.717, 0, 0, 0),
(23745, 27, -7551.27, -1189.94, -271.864, 0, 0, 0),
(23745, 28, -7552.32, -1191.9, -271.743, 0, 0, 0),
(23745, 29, -7555.48, -1209.87, -270.224, 0, 0, 0),
(23745, 30, -7551.56, -1212.95, -270.571, 0, 0, 0),
(23745, 31, -7546.58, -1223.41, -271.254, 0, 0, 0),
(23745, 32, -7546.99, -1242.43, -270.097, 0, 0, 0),
(23745, 33, -7546.99, -1242.43, -270.097, 0, 0, 0),
(23745, 34, -7543.22, -1282.28, -271.6, 0, 0, 0),
(23745, 35, -7546.93, -1300.38, -270.362, 0, 0, 0),
(23745, 36, -7546.93, -1300.38, -270.362, 0, 0, 0),
(23745, 37, -7548.77, -1315.83, -271.561, 0, 0, 0),
(23745, 38, -7545.21, -1330.97, -270.009, 0, 0, 0),
(23745, 39, -7532.73, -1365.11, -272.136, 0, 0, 0),
(23745, 40, -7531.65, -1394.78, -270.73, 0, 0, 0),
(23745, 41, -7531.65, -1394.78, -270.73, 0, 0, 0),
(23745, 42, -7526.67, -1427.39, -271.949, 0, 0, 0),
(23745, 43, -7518.96, -1412.68, -268.4, 0, 0, 0),
(23745, 44, -7523.97, -1417.16, -269.559, 0, 0, 0),
(23745, 45, -7523.97, -1417.16, -269.559, 0, 0, 0),
(23745, 46, -7537.07, -1439.99, -272.01, 0, 0, 0),
(23745, 47, -7534.08, -1453.42, -271.917, 0, 0, 0),
(23745, 48, -7525.85, -1472.74, -271.641, 0, 0, 0),
(23745, 49, -7516.71, -1490.12, -272.106, 0, 0, 0),
(23745, 50, -7504.4, -1493.52, -272.433, 0, 0, 0),
(23745, 51, -7483.83, -1489.3, -271.683, 0, 0, 0),
(23745, 52, -7463.29, -1485, -271.735, 0, 0, 0),
(23745, 53, -7437.6, -1479.61, -271.459, 0, 0, 0),
(23745, 54, -7437.6, -1479.61, -271.459, 0, 0, 0),
(23745, 55, -7432.43, -1463.74, -270.494, 0, 0, 0),
(23745, 56, -7430.87, -1454.89, -270.055, 0, 0, 0),
(23745, 57, -7425.34, -1443.9, -269.948, 0, 0, 0),
(23745, 58, -7412.89, -1410.9, -271.436, 0, 0, 0),
(23745, 59, -7412.89, -1410.9, -271.436, 0, 0, 0),
(23745, 60, -7417.38, -1384.69, -271.29, 0, 0, 0),
(23745, 61, -7417.38, -1384.69, -271.29, 0, 0, 0),
(23745, 62, -7429, -1367.21, -270.584, 0, 0, 0),
(23745, 63, -7441.89, -1350.65, -269.425, 0, 0, 0),
(23745, 64, -7457.21, -1332.09, -270.49, 0, 0, 0);

DELETE FROM `creature_movement` WHERE `id` = 23741;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `script_id`) VALUES
(23741, 1, -6881.97, -654.259, -270.695, 0, 0, 0),
(23741, 2, -6888.87, -689.117, -271.966, 0, 0, 0),
(23741, 3, -6910.72, -718.094, -271.652, 0, 0, 0),
(23741, 4, -6940, -749.937, -271.539, 0, 0, 0),
(23741, 5, -6957.6, -776.296, -272.097, 0, 0, 0),
(23741, 6, -6981.07, -809.327, -271.805, 0, 0, 0),
(23741, 7, -7009.36, -833.71, -271.347, 0, 0, 0),
(23741, 8, -7034.78, -858.327, -271.021, 0, 0, 0),
(23741, 9, -7058.56, -880.882, -271.394, 0, 0, 0),
(23741, 10, -7086.56, -887.931, -272.062, 0, 0, 0),
(23741, 11, -7111.18, -891.087, -271.243, 0, 0, 0),
(23741, 12, -7132.38, -916.367, -271.996, 0, 0, 0),
(23741, 13, -7166.53, -913.612, -271.422, 0, 0, 0),
(23741, 14, -7193.5, -913.241, -270.986, 0, 0, 0),
(23741, 15, -7226.39, -915.187, -270.986, 0, 0, 0),
(23741, 16, -7257.76, -919.555, -272.003, 0, 0, 0),
(23741, 17, -7288.33, -938.032, -271.066, 0, 0, 0),
(23741, 18, -7312.43, -935.952, -271.807, 0, 0, 0),
(23741, 19, -7350.69, -907.964, -271.727, 0, 0, 0),
(23741, 20, -7377.69, -907.491, -271.972, 0, 0, 0),
(23741, 21, -7416.87, -919.706, -269.023, 0, 0, 0),
(23741, 22, -7459.61, -929.607, -272.241, 0, 0, 0),
(23741, 23, -7492.95, -942.218, -271.671, 0, 0, 0),
(23741, 24, -7525.22, -975.852, -270.396, 0, 0, 0),
(23741, 25, -7540.87, -1009.02, -269.066, 0, 0, 0),
(23741, 26, -7525.22, -975.852, -270.396, 0, 0, 0),
(23741, 27, -7492.95, -942.218, -271.671, 0, 0, 0),
(23741, 28, -7459.61, -929.607, -272.241, 0, 0, 0),
(23741, 29, -7416.87, -919.706, -269.023, 0, 0, 0),
(23741, 30, -7377.69, -907.491, -271.972, 0, 0, 0),
(23741, 31, -7350.69, -907.964, -271.727, 0, 0, 0),
(23741, 32, -7312.43, -935.952, -271.807, 0, 0, 0),
(23741, 33, -7288.33, -938.032, -271.066, 0, 0, 0),
(23741, 34, -7257.76, -919.555, -272.003, 0, 0, 0),
(23741, 35, -7226.39, -915.187, -270.986, 0, 0, 0),
(23741, 36, -7193.5, -913.241, -270.986, 0, 0, 0),
(23741, 37, -7166.53, -913.612, -271.422, 0, 0, 0),
(23741, 38, -7132.38, -916.367, -271.996, 0, 0, 0),
(23741, 39, -7111.18, -891.087, -271.243, 0, 0, 0),
(23741, 40, -7086.56, -887.931, -272.062, 0, 0, 0),
(23741, 41, -7058.56, -880.882, -271.394, 0, 0, 0),
(23741, 42, -7034.78, -858.327, -271.021, 0, 0, 0),
(23741, 43, -7009.36, -833.71, -271.347, 0, 0, 0),
(23741, 44, -6981.07, -809.327, -271.805, 0, 0, 0),
(23741, 45, -6957.6, -776.296, -272.097, 0, 0, 0),
(23741, 46, -6940, -749.937, -271.539, 0, 0, 0),
(23741, 47, -6910.72, -718.094, -271.652, 0, 0, 0),
(23741, 48, -6888.87, -689.117, -271.966, 0, 0, 0),
(23741, 49, -6881.97, -654.259, -270.695, 0, 0, 0),
(23741, 50, -6864.71, -619.128, -271.304, 0, 0, 0);

DELETE FROM `creature_movement` WHERE `id` = 95009;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `script_id`) VALUES
(95009, 1, -6552.77, -751.063, -275.102, 0, 0, 0),
(95009, 2, -6588.3, -751.256, -273.952, 0, 0, 0),
(95009, 3, -6622.24, -749.529, -274.85, 0, 0, 0),
(95009, 4, -6649.64, -747.921, -272.115, 0, 0, 0),
(95009, 5, -6663.77, -772.029, -269.804, 0, 0, 0),
(95009, 6, -6689.91, -783.428, -270.832, 0, 0, 0),
(95009, 7, -6724.66, -788.21, -271.25, 0, 0, 0),
(95009, 8, -6755.69, -792.095, -270.307, 0, 0, 0),
(95009, 9, -6779.43, -812.87, -271.079, 0, 0, 0),
(95009, 10, -6818.71, -818.299, -271.306, 0, 0, 0),
(95009, 11, -6846.48, -813.22, -271.608, 0, 0, 0),
(95009, 12, -6877.01, -787.429, -270.888, 0, 0, 0),
(95009, 13, -6890.82, -746.281, -271.277, 0, 0, 0),
(95009, 14, -6909.96, -722.168, -271.652, 0, 0, 0),
(95009, 15, -6941.43, -693.058, -271.508, 0, 0, 0),
(95009, 16, -6980.12, -684.966, -270.017, 0, 0, 0),
(95009, 17, -7015.24, -679.366, -272.136, 0, 0, 0),
(95009, 18, -7051.74, -674.373, -270.461, 0, 0, 0),
(95009, 19, -7083.51, -646.93, -271.266, 0, 0, 0),
(95009, 20, -7085.59, -615.777, -270.844, 0, 0, 0),
(95009, 21, -7083.51, -646.93, -271.266, 0, 0, 0),
(95009, 22, -7051.74, -674.373, -270.461, 0, 0, 0),
(95009, 23, -7015.24, -679.366, -272.136, 0, 0, 0),
(95009, 24, -6980.12, -684.966, -270.017, 0, 0, 0),
(95009, 25, -6941.43, -693.058, -271.508, 0, 0, 0),
(95009, 26, -6909.96, -722.168, -271.652, 0, 0, 0),
(95009, 27, -6890.82, -746.281, -271.277, 0, 0, 0),
(95009, 28, -6877.01, -787.429, -270.888, 0, 0, 0),
(95009, 29, -6846.48, -813.22, -271.608, 0, 0, 0),
(95009, 30, -6818.92, -818.252, -271.222, 0, 0, 0),
(95009, 31, -6779.43, -812.87, -271.079, 0, 0, 0),
(95009, 32, -6755.69, -792.095, -270.307, 0, 0, 0),
(95009, 33, -6724.66, -788.21, -271.25, 0, 0, 0),
(95009, 34, -6689.91, -783.428, -270.832, 0, 0, 0),
(95009, 35, -6663.77, -772.029, -269.804, 0, 0, 0),
(95009, 36, -6649.64, -747.921, -272.115, 0, 0, 0),
(95009, 37, -6622.69, -749.451, -274.85, 0, 0, 0),
(95009, 38, -6588.3, -751.256, -273.952, 0, 0, 0),
(95009, 39, -6552.77, -751.063, -275.102, 0, 0, 0),
(95009, 40, -6513.47, -749.088, -270.073, 0, 0, 0);

DELETE FROM `creature_movement` WHERE `id` = 24172;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `script_id`) VALUES
(24172, 1, -6581.49, -1593.33, -272.097, 0, 0, 0),
(24172, 2, -6620.02, -1615.33, -271.939, 0, 0, 0),
(24172, 3, -6642.93, -1614.74, -271.553, 0, 0, 0),
(24172, 4, -6665.92, -1636.54, -272.097, 0, 0, 0),
(24172, 5, -6657.17, -1672.83, -272.097, 0, 0, 0),
(24172, 6, -6644.03, -1715.73, -272.06, 0, 0, 0),
(24172, 7, -6628.42, -1751.04, -272.097, 0, 0, 0),
(24172, 8, -6609.31, -1783.58, -272.097, 0, 0, 0),
(24172, 9, -6611.37, -1819.98, -271.683, 0, 0, 0),
(24172, 10, -6614.99, -1855.27, -272.097, 0, 0, 0),
(24172, 11, -6618.78, -1885.75, -272.429, 0, 0, 0),
(24172, 12, -6627.07, -1913.77, -271.788, 0, 0, 0),
(24172, 13, -6617.85, -1941.03, -271.955, 0, 0, 0),
(24172, 14, -6587.06, -1960.61, -271.485, 0, 0, 0),
(24172, 15, -6581.56, -1981.39, -271.199, 0, 0, 0),
(24172, 16, -6583.63, -2012.89, -270.144, 0, 0, 0),
(24172, 17, -6591.32, -2044.96, -271.389, 0, 0, 0),
(24172, 18, -6622.14, -2060.48, -270.377, 0, 0, 0),
(24172, 19, -6658.77, -2080.26, -272.115, 0, 0, 0),
(24172, 20, -6689.48, -2078.73, -272.072, 0, 0, 0),
(24172, 21, -6726.17, -2053.65, -272.15, 0, 0, 0),
(24172, 22, -6737.06, -2017.68, -271.897, 0, 0, 0),
(24172, 23, -6759.52, -1988.4, -268.496, 0, 0, 0),
(24172, 24, -6741.28, -1956.01, -271.916, 0, 0, 0),
(24172, 25, -6741.58, -1927.41, -271.682, 0, 0, 0),
(24172, 26, -6750.1, -1889.46, -272.102, 0, 0, 0),
(24172, 27, -6784.8, -1854.71, -272.06, 0, 0, 0),
(24172, 28, -6816.66, -1859.18, -270.312, 0, 0, 0),
(24172, 29, -6830.73, -1875.49, -271.273, 0, 0, 0),
(24172, 30, -6816.66, -1859.18, -270.312, 0, 0, 0),
(24172, 31, -6785.42, -1854.17, -272.06, 0, 0, 0),
(24172, 32, -6750.1, -1889.46, -272.102, 0, 0, 0),
(24172, 33, -6741.58, -1927.41, -271.682, 0, 0, 0),
(24172, 34, -6741.28, -1956.01, -271.916, 0, 0, 0),
(24172, 35, -6759.38, -1987.5, -268.586, 0, 0, 0),
(24172, 36, -6737.06, -2017.68, -271.897, 0, 0, 0),
(24172, 37, -6726.17, -2053.65, -271.915, 0, 0, 0),
(24172, 38, -6689.48, -2078.73, -272.072, 0, 0, 0),
(24172, 39, -6658.77, -2080.26, -272.115, 0, 0, 0),
(24172, 40, -6622.14, -2060.48, -270.377, 0, 0, 0),
(24172, 41, -6591.32, -2044.96, -272.118, 0, 0, 0),
(24172, 42, -6583.63, -2012.89, -270.144, 0, 0, 0),
(24172, 43, -6581.56, -1981.39, -271.199, 0, 0, 0),
(24172, 44, -6587.06, -1960.61, -271.485, 0, 0, 0),
(24172, 45, -6617.85, -1941.03, -271.955, 0, 0, 0),
(24172, 46, -6627.07, -1913.77, -271.788, 0, 0, 0),
(24172, 47, -6618.78, -1885.75, -272.429, 0, 0, 0),
(24172, 48, -6614.99, -1855.27, -272.097, 0, 0, 0),
(24172, 49, -6611.37, -1819.98, -271.683, 0, 0, 0),
(24172, 50, -6609.31, -1783.58, -272.097, 0, 0, 0),
(24172, 51, -6628.42, -1751.04, -272.097, 0, 0, 0),
(24172, 52, -6644.03, -1715.73, -272.06, 0, 0, 0),
(24172, 53, -6657.17, -1672.83, -272.097, 0, 0, 0),
(24172, 54, -6665.92, -1636.54, -272.097, 0, 0, 0),
(24172, 55, -6642.93, -1614.74, -271.553, 0, 0, 0),
(24172, 56, -6620.02, -1615.33, -271.939, 0, 0, 0),
(24172, 57, -6581.49, -1593.33, -272.097, 0, 0, 0),
(24172, 58, -6555.97, -1586.05, -272.097, 0, 0, 0);

-- Update Creatures (credit cmangos)
UPDATE `creature` SET `position_x` = -10581.95, `position_y` = -1185.32, `position_z` = 26.74362, `orientation` = 3.197518 WHERE `guid` = 5960 AND `id` = 2470; -- Watcher Fraizer <The Night Watch>
UPDATE `creature` SET `position_x` = -3839.476, `position_y` = -837.3205, `position_z` = 16.94844, `orientation` = 5.579004 WHERE `guid` = 9519 AND `id` = 3181; -- Fremal Doohickey <Bandage Trainer>
UPDATE `creature` SET `position_x` = -10559.5, `position_y` = -1152.25, `position_z` = 28.07649, `orientation` = 4.712389 WHERE `guid` = 4194 AND `id` = 264; -- Commander Althea Ebonlocke
UPDATE `creature` SET `position_x` = -8424.685, `position_y` = 608.8398, `position_z` = 95.30206, `orientation` = 3.228859 WHERE `guid` = 5169 AND `id` = 957; -- Dane Lindgren <Apprentice Blacksmith>
UPDATE `creature` SET `position_x` = -8577.496, `position_y` = 881.4656, `position_z` = 106.602, `orientation` = 5.427974 WHERE `guid` = 5000 AND `id` = 928; -- Lord Grayson Shadowbreaker <Paladin Trainer>
UPDATE `creature` SET `position_x` = -8799.62, `position_y` = 828.3229, `position_z` = 97.63464, `orientation` = 0.9684036 WHERE `guid` = 89325 AND `id` = 1719; -- Warden Thelwater
UPDATE `creature` SET `position_x` = -8533.592, `position_y` = 367.1262, `position_z` = 108.5689, `orientation` = 2.286381 WHERE `guid` = 10500 AND `id` = 1752; -- Caledra Dawnbreeze
UPDATE `creature` SET `position_x` = -8332.951, `position_y` = 394.8197, `position_z` = 122.4578, `orientation` = 2.251475 WHERE `guid` = 10502 AND `id` = 1754; -- Lord Gregor Lescovar
UPDATE `creature` SET `position_x` = -8991.901, `position_y` = 847.4841, `position_z` = 29.70399, `orientation` = 0.6632251 WHERE `guid` = 90441 AND `id` = 2485; -- Larimaine Purdue <Portal Trainer>
UPDATE `creature` SET `position_x` = -8556.372, `position_y` = 835.8596, `position_z` = 106.602, `orientation` = 5.323254 WHERE `guid` = 44022 AND `id` = 7917; -- Brother Sarno
UPDATE `creature` SET `position_x` = -8422.173, `position_y` = 630.877, `position_z` = 95.84023, `orientation` = 5.044002 WHERE `guid` = 43705 AND `id` = 7798; -- Hank the Hammer
UPDATE `creature` SET `position_x` = -8408.254, `position_y` = 451.8958, `position_z` = 123.7598, `orientation` = 5.529869 WHERE `guid` = 45707 AND `id` = 8856; -- Tyrion's Spybot
UPDATE `creature` SET `position_x` = -8407.93, `position_y` = 450.6629, `position_z` = 123.8431, `orientation` = 0.05235988 WHERE `guid` = 43667 AND `id` = 7766; -- Tyrion
UPDATE `creature` SET `position_x` = -4881.298, `position_y` = -981.426, `position_z` = 504.0237, `orientation` = 3.839724 WHERE `guid` = 1749 AND `id` = 7292; -- Dinita Stonemantle
UPDATE `creature` SET `position_x` = -8392.688, `position_y` = 690.845, `position_z` = 95.35676, `orientation` = 5.358161 WHERE `guid` = 42580 AND `id` = 7232; -- Borgus Steelhand
UPDATE `creature` SET `position_x` = -8468.642, `position_y` = 501.2799, `position_z` = 99.91192, `orientation` = 2.687807 WHERE `guid` = 2435 AND `id` = 656; -- Wilder Thistlenettle
UPDATE `creature` SET `position_x` = -8516.888, `position_y` = 862.3218, `position_z` = 109.9223, `orientation` = 4.13643 WHERE `guid` = 39538 AND `id` = 6173; -- Gazin Tenorm
UPDATE `creature` SET `position_x` = -8349.884, `position_y` = 647.6125, `position_z` = 95.87355, `orientation` = 4.276057 WHERE `guid` = 48358 AND `id` = 11026; -- Sprite Jumpsprocket
UPDATE `creature` SET `position_x` = -8432.739, `position_y` = 554.6815, `position_z` = 95.35028, `orientation` = 1.27409 WHERE `guid` = 48424 AND `id` = 11069; -- Jenova Stoneshield
UPDATE `creature` SET `position_x` = -8522.61, `position_y` = 848.7832, `position_z` = 106.702, `orientation` = 3.717551 WHERE `guid` = 7566 AND `id` = 1284; -- Archbishop Benedictus
UPDATE `creature` SET `position_x` = -8963.189, `position_y` = 822.1249, `position_z` = 109.6296, `orientation` = 3.700098 WHERE `guid` = 52922 AND `id` = 1309; -- Wynne Larson
UPDATE `creature` SET `position_x` = -8965.183, `position_y` = 807.9796, `position_z` = 109.6296, `orientation` = 1.64061 WHERE `guid` = 52923 AND `id` = 1310; -- Evan Larson
UPDATE `creature` SET `position_x` = -9085.855, `position_y` = 829.0433, `position_z` = 108.6043, `orientation` = 0.4537856 WHERE `guid` = 52924 AND `id` = 1311; -- Joachim Brenlow
UPDATE `creature` SET `position_x` = -8862.452, `position_y` = 804.5145, `position_z` = 97.50573, `orientation` = 2.984513 WHERE `guid` = 52925 AND `id` = 1312; -- Ardwyn Cailen
UPDATE `creature` SET `position_x` = -8865.553, `position_y` = 822.2861, `position_z` = 98.40019, `orientation` = 0.5759587 WHERE `guid` = 53686 AND `id` = 1316; -- Adair Gilroy
UPDATE `creature` SET `position_x` = -8634.219, `position_y` = 886.7424, `position_z` = 103.2655, `orientation` = 5.462881 WHERE `guid` = 7626 AND `id` = 1348; -- Gregory Ardus
UPDATE `creature` SET `position_x` = -8520.597, `position_y` = 796.2466, `position_z` = 106.602, `orientation` = 0.715585 WHERE `guid` = 7629 AND `id` = 1351; -- Brother Cassius
UPDATE `creature` SET `position_x` = -8961.837, `position_y` = 809.2073, `position_z` = 109.6296, `orientation` = 2.076942 WHERE `guid` = 89298 AND `id` = 1429; -- Thurman Schneider
UPDATE `creature` SET `position_x` = -8345.721, `position_y` = 383.7659, `position_z` = 122.3577, `orientation` = 2.129302 WHERE `guid` = 8704 AND `id` = 1440; -- Milton Sheaf
UPDATE `creature` SET `position_x` = -5049.987, `position_y` = -1270.264, `position_z` = 510.4077, `orientation` = 0.03490658 WHERE `guid` = 86263 AND `id` = 15351; -- Alliance Brigadier General
UPDATE `creature` SET `position_x` = -8469.34, `position_y` = 582.9312, `position_z` = 96.05196, `orientation` = 5.375614 WHERE `guid` = 8733 AND `id` = 1472; -- Morgg Stormshot
UPDATE `creature` SET `position_x` = -9010.778, `position_y` = 876.5748, `position_z` = 148.7018, `orientation` = 4.869469 WHERE `guid` = 90470 AND `id` = 5694; -- High Sorcerer Andromath
UPDATE `creature` SET `position_x`=-8958.817, `position_y`=816.4159, `position_z`=109.5296, `orientation`=3.787364 WHERE `guid`=90469 AND `id`=5567; -- Sellandus <Apprentice Tailor>
UPDATE `creature` SET `position_x`=-8342.247, `position_y`=638.3235, `position_z`=95.42044, `orientation`=3.700098 WHERE `guid`=37612 AND `id`=5519; -- Billibub Cogspinner <Engineering Supplies>
UPDATE `creature` SET `position_x`=-8412.8, `position_y`=541.3968, `position_z`=102.5777, `orientation`=0.7330383 WHERE `guid`=37610 AND `id`=5517; -- Thorfin Stoneshield <Hunter Trainer>
UPDATE `creature` SET `position_x`=-8410.293, `position_y`=548.566, `position_z`=95.53172, `orientation`=3.647738 WHERE `guid`=37609 AND `id`=5516; -- Ulfir Ironbeard
UPDATE `creature` SET `position_x`=-8415.757, `position_y`=552.6982, `position_z`=95.53172, `orientation`=3.822271 WHERE `guid`=37608 AND `id`=5515; -- Einris Brightspear
UPDATE `creature` SET `position_x`=-8433.988, `position_y`=693.3966, `position_z`=103.4471, `orientation`=0.6981317 WHERE `guid`=37606 AND `id`=5513; -- Gelman Stonehand
UPDATE `creature` SET `position_x`=-8432.998, `position_y`=623.7123, `position_z`=95.41587, `orientation`=5.794493 WHERE `guid`=37605 AND `id`=5512; -- Kaita Deepforge
UPDATE `creature` SET `position_x`=-8424.49, `position_y`=616.9439, `position_z`=95.54292, `orientation`=2.234021 WHERE `guid`=37604 AND `id`=5511; -- Therum Deepforge
UPDATE `creature` SET `position_x`=-8419.298, `position_y`=646.6034, `position_z`=97.53243, `orientation`=0.6981317 WHERE `guid`=37603 AND `id`=5510; -- Thulman Flintcrag
UPDATE `creature` SET `position_x`=-8387.604, `position_y`=692.5061, `position_z`=95.35676, `orientation`=3.926991 WHERE `guid`=37602 AND `id`=5509; -- Kathrum Axehand
UPDATE `creature` SET `position_x`=-9006.113, `position_y`=885.3751, `position_z`=29.70399, `orientation`=0.8028514 WHERE `guid`=90463 AND `id`=5498; -- Elsharin
UPDATE `creature` SET `position_x`=-8989.699, `position_y`=861.8811, `position_z`=29.70399, `orientation`=4.729842 WHERE `guid`=90462 AND `id`=5497; -- Jennea Cannon
UPDATE `creature` SET `position_x`=-8564.393, `position_y`=880.634, `position_z`=106.602, `orientation`=3.822271 WHERE `guid`=37586 AND `id`=5492; -- Katherine the Pure
UPDATE `creature` SET `position_x`=-8573.129, `position_y`=861.0734, `position_z`=106.602, `orientation`=0.715585 WHERE `guid`=37585 AND `id`=5491; -- Arthur the Faithful
UPDATE `creature` SET `position_x`=-8519.56, `position_y`=862.8282, `position_z`=109.911, `orientation`=4.642576 WHERE `guid`=37571 AND `id`=5489; -- Brother Joshua
UPDATE `creature` SET `position_x`=-8850.787, `position_y`=829.8005, `position_z`=104.7796, `orientation`=2.495821 WHERE `guid`=90459 AND `id`=5387; -- Acolyte Dellis
UPDATE `creature` SET `position_x`=-8681.224, `position_y`=432.526, `position_z`=99.30119, `orientation`=1.658063 WHERE `guid`=79741 AND `id`=4961; -- Dashel Stonefist
UPDATE `creature` SET `position_x`=-8512.399, `position_y`=862.3635, `position_z`=109.9274, `orientation`=3.822271 WHERE `guid`=1079 AND `id`=376; -- High Priestess Laurena <Priest Trainer>
UPDATE `creature` SET `position_x`=-8855.714, `position_y`=822.8125, `position_z`=98.40005, `orientation`=6.213372 WHERE `guid`=26836 AND `id`=338; -- Mazen Mac'Nadir <Academy of Arcane Arts and Sciences>
UPDATE `creature` SET `position_x`=-9012.534, `position_y`=867.1419, `position_z`=29.70399, `orientation`=3.735005 WHERE `guid`=26835 AND `id`=331; -- Maginor Dumas <Master Mage>
UPDATE `creature` SET `position_x`=-8422.209, `position_y`=553.2047, `position_z`=95.53172, `orientation`=5.393067 WHERE `guid`=18402 AND `id`=2879; -- Karrina Mekenda <Pet Trainer>
UPDATE `creature` SET `position_x`=-9008.976, `position_y`=845.3499, `position_z`=105.9214, `orientation`=0 WHERE `guid`=90442 AND `id`=2708; -- Archmage Malin
UPDATE `creature` SET `position_x`=-10573.86, `position_y`=-1127.319, `position_z`=29.16688, `orientation`=2.388486 WHERE `guid`=4188 AND `id`=268; -- Sirra Von'Indi <Historian of Darkshire>
UPDATE `creature` SET `position_x`=-10560.27, `position_y`=-1125.186, `position_z`=30.07091, `orientation`=2.454883 WHERE `guid`=4187 AND `id`=267; -- Clerk Daltry
UPDATE `creature` SET `position_x`=-8344.687, `position_y`=418.8854, `position_z`=122.3578, `orientation`=0.7853982 WHERE `guid`=16365 AND `id`=2504; -- Donyal Tovald <Librarian>
UPDATE `creature` SET `position_x`=-8421.198, `position_y`=405.485, `position_z`=120.9689, `orientation`=3.577925 WHERE `guid`=16182 AND `id`=2439; -- Major Samuelson <Stormwind City Guard>
UPDATE `creature` SET `position_x`=-8513.312, `position_y`=802.0707, `position_z`=106.602, `orientation`=2.268928 WHERE `guid`=15216 AND `id`=2327; -- Shaina Fuller <First Aid Trainer>
UPDATE `creature` SET `position_x`=-3585.973, `position_y`=-865.1568, `position_z`=12.93235, `orientation`=3.716582 WHERE `guid`=9445 AND `id`=2096; -- Tarrel Rockweaver
UPDATE `creature` SET `position_x`=-8804.085, `position_y`=337.3364, `position_z`=95.09763, `orientation`=5.235829 WHERE `guid`=79781 AND `id`=7208; -- Noarm
UPDATE `creature` SET `position_x`=-4681.927, `position_y`=-3170.793, `position_z`=310.1451 WHERE `guid`=8241 AND `id`=2524; -- Mountaineer Haggis
UPDATE `creature` SET `position_x`=-4685.103, `position_y`=-3458.959, `position_z`=310.1398 WHERE `guid`=8243 AND `id`=2528; -- Mountaineer Haggil
UPDATE `creature` SET `position_x`=-8528.548, `position_y`=855.3099, `position_z`=106.702, `orientation`=4.014257 WHERE `guid`=300992 AND `id`=1212; -- Bishop Farthing
UPDATE `creature` SET `position_x`=-8496.028, `position_y`=808.554, `position_z`=96.86679, `orientation`=2.268928 WHERE `guid`=52472 AND `id`=12336; -- Brother Crowley
UPDATE `creature` SET `position_x`=-8355.779, `position_y`=414.382, `position_z`=122.4578, `orientation`=5.427974 WHERE `guid`=10526 AND `id`=1756; -- Stormwind Royal Guard
UPDATE `creature` SET `position_x`=-8394.09, `position_y`=449.4266, `position_z`=123.7598, `orientation`=0.6457718 WHERE `guid`=10523 AND `id`=1756; -- Stormwind Royal Guard
UPDATE `creature` SET `position_x`=-8363.297, `position_y`=407.9141, `position_z`=122.4578, `orientation`=5.340707 WHERE `guid`=10525 AND `id`=1756; -- Stormwind Royal Guard
UPDATE `creature` SET `position_x`=-8388.837, `position_y`=453.0844, `position_z`=123.7598, `orientation`=3.804818 WHERE `guid`=10524 AND `id`=1756; -- Stormwind Royal Guard
UPDATE `creature` SET `position_x`=-8469.938, `position_y`=361.2088, `position_z`=116.9331, `orientation`=0.715585 WHERE `guid`=10511 AND `id`=1756; -- Stormwind Royal Guard
UPDATE `creature` SET `position_x`=-8462.326, `position_y`=367.3633, `position_z`=116.9134, `orientation`=3.787364 WHERE `guid`=10512 AND `id`=1756; -- Stormwind Royal Guard
UPDATE `creature` SET `position_x`=-8528.844, `position_y`=384.9724, `position_z`=108.5689, `orientation`=2.234021 WHERE `guid`=10509 AND `id`=1756; -- Stormwind Royal Guard
UPDATE `creature` SET `position_x`=-8532.826, `position_y`=389.9119, `position_z`=108.5689, `orientation`=5.410521 WHERE `guid`=10507 AND `id`=1756; -- Stormwind Royal Guard
UPDATE `creature` SET `position_x`=-8524.291, `position_y`=444.5789, `position_z`=105.2098, `orientation`=3.787364 WHERE `guid`=10510 AND `id`=1756; -- Stormwind Royal Guard
UPDATE `creature` SET `position_x`=-8531.288, `position_y`=438.9937, `position_z`=105.2114, `orientation`=0.6806784 WHERE `guid`=10508 AND `id`=1756; -- Stormwind Royal Guard
UPDATE `creature` SET `position_x`=-8541.232, `position_y`=450.2025, `position_z`=105.1, `orientation`=2.216568 WHERE `guid`=79747 AND `id`=1756; -- Stormwind Royal Guard
UPDATE `creature` SET `position_x`=-8533.351, `position_y`=456.6552, `position_z`=105.1, `orientation`=2.303835 WHERE `guid`=10506 AND `id`=1756; -- Stormwind Royal Guard
UPDATE `creature` SET `position_x`=-9558.441, `position_y`=-700.3073, `position_z`=99.21194, `orientation`=3.72837 WHERE `guid`=80930 AND `id`=1949; -- Servant of Azora
UPDATE `creature` SET `position_x`=-9574.038, `position_y`=-713.2145, `position_z`=99.17397, `orientation`=5.05916 WHERE `guid`=80926 AND `id`=1949; -- Servant of Azora
UPDATE `creature` SET `position_x`=-9550.344, `position_y`=-685.855, `position_z`=63.18303, `orientation`=0.6368229 WHERE `guid`=80928 AND `id`=1949; -- Servant of Azora
UPDATE `creature` SET `position_x`=-8817.274, `position_y`=809.0402, `position_z`=98.72545, `orientation`=3.921446 WHERE `guid`=19272 AND `id`=68; -- Stormwind City Guard
UPDATE `creature` SET `position_x`=-8803.506, `position_y`=862.7813, `position_z`=98.97499, `orientation`=2.286381 WHERE `guid`=19273 AND `id`=68; -- Stormwind City Guard
UPDATE `creature` SET `position_x`=-8800.121, `position_y`=865.28, `position_z`=98.97421, `orientation`=2.199115 WHERE `guid`=26833 AND `id`=68; -- Stormwind City Guard
DELETE FROM `creature` WHERE `guid` = 9678;
UPDATE `creature` SET `position_x` = -108.08, `position_y` = -3529.83, `position_z` = 118.49  WHERE `id` = 2926 AND `guid` = 93058;
UPDATE `creature` SET `position_x` = 182.04, `position_y` = -3549.64, `position_z` = 130, `movement_type` = 1, `wander_distance` = 5 WHERE `id` = 2928 AND `guid` = 92955;
UPDATE `creature` SET `position_z` = 12 WHERE `guid` = 9716;
UPDATE `creature` SET `position_x` = -4166.32, `position_y` = -2899.79, `position_z` = 13.0099, `movement_type` = 1, `wander_distance` = 10 WHERE `guid` = 9417;
UPDATE `creature` SET `position_z` = 121 WHERE `guid`=92879;
DELETE FROM `creature` WHERE `guid` IN (91936, 92482, 92471);
UPDATE `creature` SET `position_z` = 10.097719 WHERE `guid` = 34164;
UPDATE `creature` SET `position_z` = 0.982520 WHERE `guid` = 37376;
UPDATE `creature` SET `position_z` = 2.425548 WHERE `guid` = 35251;

-- Correct Loot Template For Riverpaw Gnoll
DELETE FROM `creature_loot_template` WHERE `entry` = 117 AND `item` IN (30039, 1710);

-- Update Quest Text
UPDATE `quest_template` SET `OfferRewardText` = 'The humans have taught us a great deal about the Holy Light and how important their order is to them... and to protecting all of Azeroth. We have a great respect for how steeped in tradition it is, and how just one figure, one sacrifice, can make the difference between pain and salvation.$B$BThe two of us are gonna be working together for a bit. Any time you think you\'re ready, come back to me and we\'ll see about getting you some training. Can\'t have you go out into the world unprepared, now, can we?' WHERE `entry` = 3107;

-- Update Quest Start Script For Did You Lose This?
UPDATE `quest_template` SET `CompleteScript` = 0 WHERE `entry` = 3321;
DELETE FROM `quest_end_scripts` WHERE `id` = 3321;
UPDATE `broadcast_text` SET `emote_id1` = 22 WHERE `entry` = 4365;
DELETE FROM `quest_start_scripts` WHERE `id`=3321;
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (3321, 0, 4, 147, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Did You Lose This?: Trenton Lighthammer - Modify Flags');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (3321, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Did You Lose This?: Trenton Lighthammer - Emote');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (3321, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4365, 0, 0, 0, 0, 0, 0, 0, 0, 'Did You Lose This?: Trenton Lighthammer - Talk');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (3321, 4, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Did You Lose This?: Trenton Lighthammer - Orientation');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (3321, 6, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Did You Lose This?: Trenton Lighthammer - Emote');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (3321, 8, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1.32645, 0, 'Did You Lose This?: Trenton Lighthammer - Orientation');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (3321, 9, 7, 3321, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Did You Lose This?: Trenton Lighthammer - Complete Quest');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (3321, 9, 4, 147, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Did You Lose This?: Trenton Lighthammer - Modify Flags');

-- NOTE: There seems to be a missing escort quest associated with this NPC
-- Add Missing Creature Guard Didier
UPDATE `creature_template` SET `gossip_menu_id` = 7168, `display_scale1` = 1, `faction` = 1624 WHERE `entry` = 16226;
INSERT INTO `creature` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `health_percent`, `patch_min`, `patch_max`, `wander_distance`) VALUES
(1383, 16226, 0, 2305.29, -5286.12, 82.0618, 4.83456, 120, 120, 100, 9, 10, 0);

-- Correct Quest Requirements
UPDATE `quest_template` SET `PrevQuestId` = 1799 WHERE `entry` = 4962;
UPDATE `quest_template` SET `PrevQuestId` = 1799 WHERE `entry` = 4963;

-- Remove Some Skinning Loot IDs
UPDATE `creature_template` SET `skinning_loot_id` = 0 WHERE entry IN (10116, 2230, 6728, 12202, 14646, 14869);

-- Add Some Missing Gossips
-- Arygos Gossip
UPDATE `creature_template` SET `gossip_menu_id` = 6767, `npc_flags` = 3 WHERE `entry` = 15380;
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES
(6767, 8080);

-- Merithra of the Dream Gossip
UPDATE `creature_template` SET `gossip_menu_id` = 6766, `npc_flags` = 3 WHERE `entry`=15378;
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES
(6766, 8079);

-- Guard Didier Gossip
UPDATE `creature_template` SET `npc_flags` = 3 WHERE `entry` = 16226;
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES
(7168, 8438);

-- Elder Torntusk
UPDATE `creature_template` SET `gossip_menu_id` = 6102 WHERE `entry` = 14757;
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES
(6102, 7257);

-- Kelm Hargunth
UPDATE `creature_template` SET `gossip_menu_id` = 6141, `npc_flags` = 16391 WHERE `entry` = 14754;
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES
(6141, 7294);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`) VALUES
(6141, 0, 1, 'What goods have I earned the right to purchase for use in Warsong Gulch?', 10021, 3, 4);

-- Primal Torntusk
UPDATE `creature_template` SET `gossip_menu_id` = 6084 WHERE `entry` = 14736;
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES
(6084, 7238);

-- Corporal Noreg Stormpike
UPDATE `creature_template` SET `gossip_menu_id` = 5081, `npc_flags` = 3 WHERE `entry`=13447;
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES
(5081, 6288);

-- Seersa Copperpinch, Guchie Jinglepocket and Jaycrue Copperpinch
UPDATE `creature_template` SET `gossip_menu_id` = 5181 WHERE `entry` IN (13432, 13436, 13430);
UPDATE `creature_template` SET `npc_flags` = 7 WHERE `entry` = 13432;
UPDATE `creature_template` SET `npc_flags` = 5 WHERE `entry` = 13436;
UPDATE `creature_template` SET `npc_flags` = 5 WHERE `entry` = 13430;

-- Cyrus Therepentous
UPDATE `creature_template` SET `gossip_menu_id` = 1841 WHERE `entry` = 9459;
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES
(1841, 2493);

-- Dreka'Sur
UPDATE `creature_template` SET `gossip_menu_id` = 4067 WHERE `entry` = 9620;
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES
(4067, 4960);

-- Fix drop rate of items used in quest 5725 (The Power to Destroy...) in Ragefire Chasm (credit cmangos)
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = -5 WHERE `item` IN (14395, 14396);

-- Fix drop rate of item used in quest 443 (Rot Hide Ichor) in Silverpine Forest (credit cmangos)
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = -30 WHERE `item` = 3236;

-- Fix drop rate of items used in quest 451 (A Recipe For Death) in Silverpine Forest (credit cmangos)
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = -50 WHERE `item` = 3257;

-- Correct Diplay ID For Energetic Rod
UPDATE `item_template` SET `display_id` = 30915 WHERE `entry` = 18321;

-- Remove Teebus Blazing Longsword, Alcors Sunrazor, Blanchards Stout and Shadowblade From Lockboxes
DELETE FROM `item_loot_template` WHERE `entry` = 16885 AND `item` = 1014;
DELETE FROM `reference_loot_template` WHERE `entry` = 1014;

-- Increase Dropchance for Crystallized Note
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance` = 30 WHERE `entry` IN (9676, 9820, 9819) AND `item`=10840;

-- Correct Requirements for Quest Grark Lorkrub
UPDATE `quest_template` SET `PrevQuestId` = 4082 WHERE `entry` = 4122;

-- Highborne Relic Summons Creature
INSERT INTO `gameobject_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (48995, 0, 39, 175891, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Highborne Relic Fragment - Start Script');
INSERT INTO `gameobject_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (48999, 0, 39, 175891, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Highborne Relic Fragment - Start Script');
INSERT INTO `gameobject_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (48993, 0, 39, 175891, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Highborne Relic Fragment - Start Script');
INSERT INTO `gameobject_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (48998, 0, 39, 175891, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Highborne Relic Fragment - Start Script');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (175891, 0, 10, 7524, 180000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 'Highborne Relic Fragment - Summon Creature');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (175891, 0, 10, 7523, 180000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 'Highborne Relic Fragment - Summon Creature');

-- Move From pool_creature to pool_creature_template
DELETE FROM `pool_creature` WHERE `pool_entry` IN (108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 123, 124, 521, 2598, 2605, 2606, 2779, 2850, 3200, 9002, 10003, 10004, 12902, 14222, 14281, 25468, 42939, 43157, 43525, 43517);
DELETE FROM `pool_template` WHERE `entry` = 10003;
INSERT INTO `pool_creature_template` (`id`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(2038, 108, 0, 'Lord Melenas', 0, 0, 10),
(7319, 109, 0, 'Lady Sathra', 0, 0, 10),
(3467, 110, 0, 'Baron Longshore', 0, 0, 10),
(3204, 111, 0, 'Gazz\'uz', 0, 0, 10),
(2304, 112, 0, 'Captain Ironhill', 0, 0, 10),
(5822, 113, 0, 'Felweaver Scornn', 0, 0, 10),
(5808, 114, 0, 'Warlord Kolkanis', 0, 0, 10),
(5824, 115, 0, 'Captain Flat Tusk', 0, 0, 10),
(5826, 116, 0, 'Geolord Mottle', 0, 0, 10),
(5809, 117, 0, 'Watch Commander Zalaphil', 0, 0, 10),
(3392, 118, 0, 'Prospector Khazgorm', 0, 0, 10),
(5847, 119, 0, 'Heggin Stonewhisker', 0, 0, 10),
(5859, 120, 0, 'Hagg Taurenbane', 0, 0, 10),
(3472, 121, 0, 'Washte Pawne', 0, 0, 10),
(3473, 122, 0, 'Owatanka', 0, 0, 10),
(3474, 123, 0, 'Lakota\'mani', 0, 0, 10),
(14275, 124, 0, 'Tamra Stormpike', 0, 0, 10),
(521, 521, 0, 'Lupos', 0, 0, 10),
(2598, 2598, 0, 'Darbel Montrose', 0, 0, 10),
(2605, 2605, 0, 'Zalas Witherbark', 0, 0, 10),
(2606, 2606, 0, 'Nimar the Slayer', 0, 0, 10),
(2779, 2779, 0, 'Prince Nazjak', 0, 0, 10),
(2850, 2850, 0, 'Broken Tooth', 0, 0, 10),
(61, 3200, 0, 'Thuros Lightfingers', 0, 0, 10),
(7850, 9002, 0, 'Kernobee', 0, 0, 10),
(3671, 10004, 0, 'Lady Anacondra', 0, 0, 10),
(12902, 12902, 0, 'Lorgus Jett', 0, 0, 10),
(14222, 14222, 0, 'Araga', 0, 0, 10),
(14281, 14281, 0, 'Jimmy the Bleeder', 0, 0, 10),
(10558, 25468, 25, 'Hearthsinger Forresten', 0, 0, 10),
(14231, 42939, 0, 'Drogoth the Roamer', 0, 0, 10),
(14233, 43157, 0, 'Ripscale', 0, 0, 10),
(14230, 43517, 0, 'Burgle Eye', 0, 0, 10),
(13602, 43525, 0, 'The Abominable Greench', 0, 0, 10);

-- Mudrock Borer Skinning Template
UPDATE `creature_template` SET `skinning_loot_id`= 4400 WHERE `entry` = 4399;

-- Reduce droprate of Mistvale Giblets
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`= -20 WHERE `entry` = 1557 AND `item` = 3919;

-- Recipe: Undermine Clam Chowder should have 30 min restock timer
UPDATE `npc_vendor` SET `incrtime` = 1800 WHERE `entry` = 8139 AND `item` = 16767;

-- Remove Flags From npc_vendor
UPDATE `npc_vendor` SET `itemflags` = 0 WHERE `itemflags` != 0;

-- Add Battle Under Blackwood Lake Script
-- Remove Duplicate Spawns
DELETE FROM `creature` WHERE `guid` IN (
92828,
92827,
92824,
92831,
92823,
92826,
92248,
92244,
92249,
92247,
92246,
92245,
92829
);


-- Spectral Betrayer AI
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry` IN (11289, 11288);
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1128801, 11288, 0, 0, 0, 100, 1, 5000, 20000, 20000, 35000, 1128801, 0, 0, 'Spectral Betrayer - Talk - In Combat');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1128801, 0, 39, 1128801, 1128802, 0, 0, 0, 0, 0, 0, 50, 50, 0, 0, 0, 0, 0, 0, 0, 'Spectral Betrayer - Start Script');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1128801, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6834, 6832, 6827, 6829, 0, 0, 0, 0, 0, 'Spectral Betrayer - Talk');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1128802, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6831, 6833, 6830, 6828, 0, 0, 0, 0, 0, 'Spectral Betrayer - Talk');

-- Spectral Defender AI
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1128901, 11289, 0, 1, 0, 100, 1, 5000, 5000, 5000, 5000, 1128901, 0, 0, 'Spectral Defender - Summon Spectral Betrayer - OOC');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1128901, 0, 10, 11288, 40000, 0, 0, 0, 0, 0, 0, 0, 1128901, 0, 2, 0, 0, 0, 0, 0, 'Spectral Defender - Summon Creature');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1128901, 0, 26, 0, 0, 0, 0, 11289, 20, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Spectral Betrayer - Start Attack');

INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1128902, 11289, 0, 0, 0, 100, 1, 5000, 20000, 20000, 35000, 1128902, 0, 0, 'Spectral Defender - Talk - In Combat');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1128902, 0, 39, 1128902, 1128903, 0, 0, 0, 0, 0, 0, 50, 50, 0, 0, 0, 0, 0, 0, 0, 'Spectral Defender - Start Script');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1128902, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6840, 6836, 6841, 6837, 0, 0, 0, 0, 0, 'Scarlet Defender - Talk');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1128903, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6838, 6835, 6842, 6839, 0, 0, 0, 0, 0, 'Spectral Defender - Talk');

UPDATE `item_loot_template` SET `ChanceOrQuestChance` = 100 WHERE `entry` = 10773 AND `item` IN (10780, 10781, 10782);

UPDATE `gameobject_template` SET `flags` = 4 WHERE `entry` = 1761;

-- Add Zixil Missing Scripts
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (353701, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1119, 0, 0, 0, 0, 0, 0, 0, 0, 'Zixil - Talk - Arriving - Southshore / Tarren Mill');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (353702, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1122, 0, 0, 0, 0, 0, 0, 0, 0, 'Zixil - Talk - Leaving - Southshore');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (353703, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1123, 0, 0, 0, 0, 0, 0, 0, 0, 'Zixil - Talk - Leaving - Tarren Mill');

DELETE FROM `creature_movement` WHERE `id` = 15424;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(15424, 1, -342.026, -714.092, 57.7331, 1.08443, 600000, 0, 353701),
(15424, 2, -336.671, -702.508, 57.7294, 1.2042, 0, 0, 0),
(15424, 3, -326.701, -682.173, 54.5218, 4.2751, 0, 0, 0),
(15424, 4, -305.659, -678.024, 55.4281, 3.33656, 0, 0, 0),
(15424, 5, -266.074, -737.545, 57.0246, 2.14865, 0, 0, 0),
(15424, 6, -229.128, -725.284, 60.5835, 0.316694, 0, 0, 0),
(15424, 7, -174.654, -716.426, 63.6176, 0.031986, 0, 0, 0),
(15424, 8, -94.8141, -714.302, 66.8001, 0.012352, 0, 0, 0),
(15424, 9, -57.2886, -717.962, 68.3569, 6.21896, 0, 0, 0),
(15424, 10, -25.8647, -714.42, 69.598, 0.138012, 0, 0, 0),
(15424, 11, -18.8824, -720.272, 69.2508, 5.39036, 0, 0, 0),
(15424, 12, -18.6463, -740.293, 65.7397, 4.46556, 0, 0, 0),
(15424, 13, -24.2948, -767.126, 61.2219, 1.46926, 0, 0, 0),
(15424, 14, -15.7009, -794.541, 59.3187, 4.23976, 0, 0, 0),
(15424, 15, -20.6007, -806.224, 58.3449, 2.48048, 0, 0, 0),
(15424, 16, -48.0455, -828.875, 56.8089, 0.599455, 0, 0, 0),
(15424, 17, -53.8056, -846.362, 56.344, 1.22778, 0, 0, 0),
(15424, 18, -49.8417, -867.505, 55.547, 4.83669, 0, 0, 0),
(15424, 19, -35.2433, -882.086, 56.119, 5.48857, 0, 0, 0),
(15424, 20, -18.0644, -877.428, 58.5963, 3.01652, 600000, 0, 0),
(15424, 21, -18.0644, -877.428, 58.5963, 3.01652, 0, 0, 353703),
(15424, 22, -49.6889, -867.71, 55.5455, 1.7756, 0, 0, 0),
(15424, 23, -53.6747, -846.325, 56.3471, 1.65975, 0, 0, 0),
(15424, 24, -47.9708, -829.328, 56.8256, 0.858645, 0, 0, 0),
(15424, 25, -20.5868, -806.76, 58.2997, 0.736909, 0, 0, 0),
(15424, 26, -15.8765, -794.635, 59.3084, 1.23171, 0, 0, 0),
(15424, 27, -24.2948, -767.126, 61.2219, 1.4045, 0, 0, 0),
(15424, 28, -17.9489, -738.981, 65.9948, 1.46733, 0, 0, 0),
(15424, 29, -18.963, -720.735, 69.1976, 4.73655, 0, 0, 0),
(15424, 30, -24.283, -714.043, 69.6603, 0.251921, 0, 0, 0),
(15424, 31, -57.4854, -717.839, 68.3591, 3.15397, 0, 0, 0),
(15424, 32, -94.9915, -714.591, 66.7784, 3.05972, 0, 0, 0),
(15424, 33, -174.764, -716.487, 63.6126, 3.1736, 0, 0, 0),
(15424, 34, -228.693, -725.39, 60.6095, 3.37584, 0, 0, 0),
(15424, 35, -266.124, -737.507, 57.0224, 3.30123, 0, 0, 0),
(15424, 36, -322.237, -754.022, 54.145, 0.359908, 0, 0, 0),
(15424, 37, -374.206, -777.388, 54.4583, 3.62912, 0, 0, 0),
(15424, 38, -381.336, -773.427, 54.6048, 2.24487, 0, 0, 0),
(15424, 39, -380.183, -760.353, 54.588, 1.69902, 0, 0, 0),
(15424, 40, -385.652, -734.109, 54.4995, 1.80504, 0, 0, 0),
(15424, 41, -422.063, -636.185, 54.5017, 1.92678, 0, 0, 0),
(15424, 42, -434.054, -585.65, 53.6544, 2.9046, 0, 0, 0),
(15424, 43, -519.576, -560.494, 40.2415, 2.85552, 0, 0, 0),
(15424, 44, -537.587, -559.688, 37.4918, 6.2818, 0, 0, 0),
(15424, 45, -578.429, -573.394, 32.6912, 0.202822, 0, 0, 0),
(15424, 46, -607.932, -574.855, 30.8931, 3.18733, 0, 0, 0),
(15424, 47, -640.541, -560.609, 26.5369, 5.90483, 0, 0, 0),
(15424, 48, -661.569, -559.69, 25.5658, 0.047728, 0, 0, 0),
(15424, 49, -685.979, -552.031, 28.3419, 5.9657, 600000, 0, 353701),
(15424, 50, -685.979, -552.031, 28.3419, 5.9657, 0, 0, 353702),
(15424, 51, -661.484, -559.318, 25.5647, 5.99318, 0, 0, 0),
(15424, 52, -640.657, -560.183, 26.4999, 6.06583, 0, 0, 0),
(15424, 53, -607.728, -574.767, 30.9059, 6.17382, 0, 0, 0),
(15424, 54, -578.209, -573.697, 32.711, 0.049682, 0, 0, 0),
(15424, 55, -537.534, -559.464, 37.4948, 0.340279, 0, 0, 0),
(15424, 56, -519.329, -560.319, 40.2651, 6.15812, 0, 0, 0),
(15424, 57, -435.538, -585.659, 53.6071, 2.7868, 0, 0, 0),
(15424, 58, -422.243, -636.294, 54.5015, 4.97021, 0, 0, 0),
(15424, 59, -411.159, -667.752, 54.4995, 5.88716, 0, 0, 0),
(15424, 60, -333.495, -667.834, 55.0344, 6.27397, 0, 0, 0),
(15424, 61, -326.524, -682.113, 54.5241, 4.32029, 0, 0, 0),
(15424, 62, -336.3, -701.885, 57.7294, 4.24764, 0, 0, 0);

-- Achellios Should Run
UPDATE `creature_movement` SET `script_id` = 11 WHERE `id` = 21388 AND `point` = 1;
UPDATE `creature` SET `position_x` = -5065.41, `position_y` = -1433.43, `position_z` = -52.0541 WHERE `guid` IN (21388, 21677, 21678, 21679);

-- Update Hagg Taurenbane Spawn Points
UPDATE `creature` SET `position_x` = -3988.903564453125, `position_y` = -1862.833740234375, `position_z` = 91.7680816650390625, `orientation` = 1.640609502792358398 WHERE `guid` = 20942;
UPDATE `creature` SET `position_x` = -3709.73095703125, `position_y` = -1587.8887939453125, `position_z` = 91.9688873291015625, `orientation` = 0.05235987901687622 WHERE `guid` = 20941;
UPDATE `creature` SET `position_x` = -3893.58642578125, `position_y` = -1627.259765625, `position_z` = 91.75, `orientation` = 4.886921882629394531 WHERE `guid` = 20943;

-- Add Serpent Statue Script (NOTE: spell 19473 is not being cast by gameobject for some unknown reason also cannot use gameobject guid 12609 when it respawns)
UPDATE `gameobject_template` SET `script_name`='' WHERE  `entry`=177673;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_max`) VALUES
(202202, 177705, 1, 252.547, 2963.69, 1.64267, 5.58505, 0, 0, -0.34202, 0.939693, -120, -120, 100, 1, 10);

DELETE FROM `gameobject_scripts` WHERE `id`=12609;
INSERT INTO `gameobject_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (12609, 1, 9, 202202, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Serpent Statue - Respawn Gameobject');
INSERT INTO `gameobject_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (12609, 3, 15, 19473, 0, 0, 0, 177705, 5, 11, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Serpent Statue - Cast Spell');
INSERT INTO `gameobject_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (12609, 4, 81, 12609, 120, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Serpent Statue - Despawn Gameobject');
INSERT INTO `gameobject_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (12609, 5, 10, 12369, 60000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, 252.57, 2963.7, 1.72356, 1.29154, 0, 'Serpent Statue - Summon Creature');

-- Giant Plains Creeper Should not be Skinnable
UPDATE `creature_template` SET `skinning_loot_id` = 0 WHERE `entry`=2565;
DELETE FROM `skinning_loot_template` WHERE `entry`=2565 AND `item`=4234;

-- Correct Quest Start Script fot The Shattered Salute
UPDATE `quest_template` SET `StartScript` = 2460 WHERE `entry`= 2460;
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (2460, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3278, 0, 0, 0, 0, 0, 0, 0, 0, 'The Shattered Salute: Shenthul - Talk');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (2460, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3279, 0, 0, 0, 0, 0, 0, 0, 0, 'The Shattered Salute: Shenthul - Talk');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (2460, 18, 1, 66, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Shattered Salute: Shenthul - Emote');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (2460, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3281, 0, 0, 0, 0, 0, 0, 0, 0, 'The Shattered Salute: Shenthul - Talk');

UPDATE `creature_template` SET `ai_name`='EventAI', `script_name`='' WHERE  `entry`=3401;
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (806, 9, 2460, 1, 0, 0, 0);
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (340101, 3401, 806, 22, 0, 100, 1, 78, 0, 0, 0, 340101, 0, 0, 'The Shattered Salute: Shenthul - Talk - Recieved Emote');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (340101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3287, 0, 0, 0, 0, 0, 0, 0, 0, 'The Shattered Salute: Shenthul - Talk');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (340101, 0, 7, 2460, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Shattered Salute: Shenthul - Complete Quest');

-- Correct Sunken Temple Quest Chain
UPDATE `quest_template` SET `NextQuestId` = 0 WHERE `entry` = 3446;
UPDATE `quest_template` SET `PrevQuestId` = 3444 WHERE `entry` = 3447;
INSERT INTO `creature_questrelation` (`id`, `quest`, `patch_max`)
VALUES (7771, 3447, 10);
DELETE FROM `gameobject_questrelation` WHERE  `id` = 148836 AND `quest` = 3447;
UPDATE `quest_template` SET `StartScript` = 0 WHERE `entry` = 3447;

-- Events list for Twilight Disciple
DELETE FROM `creature_ai_events` WHERE `creature_id`=2338;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (233801, 2338, 0, 14, 0, 100, 1, 150, 40, 18000, 21000, 233801, 0, 0, 'Twilight Disciple - Cast Renew on Friendlies');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (233802, 2338, 0, 14, 0, 100, 1, 280, 40, 21000, 25000, 233802, 0, 0, 'Twilight Disciple - Cast Heal on Friendlies');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (233803, 2338, 0, 2, 0, 100, 0, 15, 0, 0, 0, 233803, 0, 0, 'Twilight Disciple - Flee at 15% HP');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (233804, 2338, 0, 6, 0, 100, 0, 0, 0, 0, 0, 233804, 0, 0, 'Twilight Disciple - Talk - Death');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (233805, 2338, 0, 4, 0, 100, 0, 0, 0, 0, 0, 233805, 0, 0, 'Twilight Disciple - Talk - Aggro');
DELETE FROM `creature_ai_scripts` WHERE `id`=233804;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (233804, 0, 39, 233804, 233805, 0, 0, 0, 0, 0, 0, 50, 50, 0, 0, 0, 0, 0, 0, 0, 'Twilight Disciple - Start Script');
DELETE FROM `generic_scripts` WHERE `id`=233804;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (233804, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 829, 830, 831, 832, 0, 0, 0, 0, 0, 'Twilight Disciple - Talk');
DELETE FROM `generic_scripts` WHERE `id`=233805;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (233805, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 825, 826, 827, 828, 0, 0, 0, 0, 0, 'Twilight Disciple - Talk');
DELETE FROM `creature_ai_scripts` WHERE `id`=233805;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (233805, 0, 39, 233801, 233802, 0, 0, 0, 0, 0, 0, 50, 50, 0, 0, 0, 0, 0, 0, 0, 'Twilight Disciple - Start Script');
DELETE FROM `generic_scripts` WHERE `id`=233801;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (233801, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 833, 834, 835, 836, 0, 0, 0, 0, 0, 'Twilight Disciple - Talk');
DELETE FROM `generic_scripts` WHERE `id`=233802;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (233802, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 837, 838, 839, 840, 0, 0, 0, 0, 0, 'Twilight Disciple - Talk');

-- Events list for Twilight Thug
DELETE FROM `creature_ai_events` WHERE `creature_id`=2339;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (233901, 2339, 0, 11, 0, 100, 0, 0, 0, 0, 0, 233901, 0, 0, 'Twilight Thug - Cast Battle Stance on Spawn');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (233902, 2339, 0, 4, 0, 100, 2, 0, 0, 0, 0, 233902, 233903, 0, 'Twilight Thug - Say Text on Aggro');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (233904, 2339, 0, 2, 0, 100, 0, 15, 0, 0, 0, 233904, 0, 0, 'Twilight Thug - Flee at 15% HP');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (233905, 2339, 0, 6, 0, 100, 2, 0, 0, 0, 0, 233905, 233906, 0, 'Twilight Thug - Chance Say on Death');

-- Argent Dawn Shoulder enchants also require quest to unlock
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (551, 8, 5504, 0, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (552, 8, 5507, 0, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (553, 8, 5513, 0, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (554, -2, 551, 552, 553, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (555, -1, 554, 73, 0, 0, 0);
UPDATE `npc_vendor` SET `condition_id` = 555 WHERE `entry` IN (10856, 10857, 11536) AND `item` IN (18169, 18170, 18171, 18172, 18173);

INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (556, 8, 5517, 0, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (557, 8, 5521, 0, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (558, 8, 5524, 0, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (559, -2, 556, 557, 558, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (560, -1, 559, 74, 0, 0, 0);
UPDATE `npc_vendor` SET `condition_id` = 560 WHERE `entry` IN (10856, 10857, 11536) AND `item` = 18182;
UPDATE `gossip_menu_option` SET `condition_id` = 0, `action_script_id` = 0 WHERE `menu_id` = 3421 AND `id` = 1;

UPDATE `quest_template` SET `SpecialFlags` = 1 WHERE `entry` = 9223;

-- Remove Low Level Loot from Silvermane Wolf
DELETE FROM `creature_loot_template` WHERE `entry`=2924 AND `item`=30011;

-- Remove Incorrect Skinning Templates
UPDATE `creature_template` SET `skinning_loot_id`='' WHERE `entry` IN (11788, 11787, 12218);

-- Magistrate Marduke Should be a Questgiver and Add Missing Gossip (he should only offer the quest once you have read through his gossip, not sure how to implement that)
UPDATE `creature_template` SET `npc_flags` = 3 WHERE `entry` = 11286;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES
(3372, 0, 0, 'Tell me about the Cult of the Damned.', 0, 1, 1, 3371, 0, 0, 0, 0, NULL, 0, 0),
(3371, 0, 0, 'Impossible.', 0, 1, 1, 3370, 0, 0, 0, 0, NULL, 0, 0),
(3370, 0, 0, 'This is disheartening. Is there anything I can do to stop this?', 0, 1, 1, 3369, 0, 0, 0, 0, NULL, 0, 0),
(3369, 0, 0, 'Who do I need to kill?', 0, 1, 1, 3368, 0, 0, 0, 0, NULL, 0, 0),
(3368, 0, 0, 'What is this plan?', 0, 1, 1, 3367, 0, 0, 0, 0, NULL, 0, 0),
(3367, 0, 0, 'Ras Frostwhat? Who is that?', 0, 1, 1, 3366, 0, 0, 0, 0, NULL, 0, 0),
(3366, 0, 0, 'Continue, please.\n', 0, 1, 1, 3365, 0, 0, 0, 0, NULL, 0, 0),
(3365, 0, 0, 'Yes I do.', 0, 1, 1, 3364, 0, 0, 0, 0, NULL, 0, 0),
(3364, 0, 0, 'Yes I am.', 0, 1, 1, -1, 0, 0, 0, 0, NULL, 0, 0);

INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES
(3371, 4122),
(3370, 4123),
(3369, 4124),
(3368, 4125),
(3367, 4126),
(3366, 4127),
(3365, 4128),
(3364, 4129);

-- Add Some More Missing Text to Guard Howe
DELETE FROM `creature_ai_scripts` WHERE `id`=90301;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (90301, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 53, 51, 52, 0, 0, 0, 0, 0, 0, 'Guard Howe - Say Text');

-- Add Scripts to Prospect of Faith Quests
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (723, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Prospect of Faith: Hammertoe Grez - Modify Flags');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (723, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 957, 0, 0, 0, 0, 0, 0, 0, 0, 'Prospect of Faith: Hammertoe Grez - Talk');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (723, 3, 15, 4984, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Prospect of Faith: Hammertoe Grez - Cast Spell');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (723, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 979, 0, 0, 0, 0, 0, 0, 0, 0, 'Prospect of Faith: Hammertoe Grez - Talk');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (723, 4, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Prospect of Faith: Hammertoe Grez - Modify Flags - Copy');
UPDATE `quest_template` SET `StartScript` = 723 WHERE `entry` = 723;

INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (724, 0, 4, 147, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Prospect of Faith: Historian Karnik - Modify Flags');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (724, 1, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2.30863, 0, 'Prospect of Faith: Historian Karnik - Orientation');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (724, 2, 15, 4985, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Prospect of Faith: Historian Karnik - Cast Spell');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (724, 2, 10, 2915, 21000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 3, -4633.14, -1324.99, 503.383, 5.44702, 0, 'Prospect of Faith: Historian Karnik - Summon Creature');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (724, 5, 0, 0, 0, 0, 0, 2915, 5, 8, 2, 916, 0, 0, 0, 0, 0, 0, 0, 0, 'Prospect of Faith: Hammertoes Spirit - Talk');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (724, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 956, 0, 0, 0, 0, 0, 0, 0, 0, 'Prospect of Faith: Historian Karnik - Talk');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (724, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 917, 0, 0, 0, 0, 0, 0, 0, 0, 'Prospect of Faith: Historian Karnik - Talk');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (724, 17, 0, 0, 0, 0, 0, 2915, 5, 8, 2, 918, 0, 0, 0, 0, 0, 0, 0, 0, 'Prospect of Faith: Hammertoes Spirit - Talk');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (724, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 958, 0, 0, 0, 0, 0, 0, 0, 0, 'Prospect of Faith: Historian Karnik - Talk');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (724, 22, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1.76278, 0, 'Prospect of Faith: Historian Karnik - Orientation');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (724, 23, 4, 147, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Prospect of Faith: Historian Karnik - Modify Flags');
UPDATE `quest_template` SET `CompleteScript` = 724 WHERE `entry` = 724;

-- Add Missing Gossip For Quest Get the Scoop
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES
(282, 779, 983), -- Goblin Pit Crewman
(284, 781, 983), -- Gnome Pit Crewman
(433, 930, 983); -- Race Master Kronkrider
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (983, 9, 1950, 1, 0, 0, 0);

-- Northern Crystal Pylon
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES
(2177, 2810, 984), -- quest incomplete
(2177, 2933, 4321), -- quest complete
(2181, 2812, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (984, 22, 4321, 0, 0, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES
(2177, 0, 0, 'I want to examine this pylon.', 0, 1, 1, 2181, 0, 2177, 0, 0, NULL, 0, 985);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (985, 9, 4285, 0, 0, 0, 0);
UPDATE `gameobject_template` SET `script_name`='' WHERE `entry` = 164955;

-- Eastern Crystal Pylon
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES 
(2178, 2810, 984),
(2178, 2933, 4321),
(2180, 2811, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES
(2178, 0, 0, 'I want to examine this pylon.', 0, 1, 1, 2180, 0, 2178, 0, 0, NULL, 0, 986);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (986, 9, 4287, 0, 0, 0, 0);
UPDATE `gameobject_template` SET `script_name`='' WHERE `entry` = 164957;

-- Western Crystal Pylon
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES 
(2179, 2810, 984),
(2179, 2933, 4321),
(2182, 2813, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES
(2179, 0, 0, 'I want to examine this pylon.', 0, 1, 1, 2182, 0, 2179, 0, 0, NULL, 0, 987);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (987, 9, 4288, 0, 0, 0, 0);
UPDATE `gameobject_template` SET `script_name`='' WHERE `entry` = 164956;

INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(2177, 0, 7, 4285, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Northern Crystal Pylon - Complete Quest'),
(2178, 0, 7, 4287, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Eastern Crystal Pylon - Complete Quest'),
(2179, 0, 7, 4288, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Western Crystal Pylon - Complete Quest');

-- Add Modify Flags Command to Script
DELETE FROM `generic_scripts` WHERE `id`=2608;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (2608, 0, 4, 147, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Doc Mixilpixil - Modify Flags');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (2608, 1, 0, 2, 0, 0, 0, 0, 0, 0, 0, 3563, 0, 0, 0, 0, 0, 0, 0, 0, 'Doc Mixilpixil - Say Emote Text 1');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (2608, 1, 1, 69, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Doc Mixilpixil - Emote Crafting');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (2608, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Doc Mixilpixil - Stop Emoting');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (2608, 4, 3, 1, 0, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 'Doc Mixilpixil - Go to player');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (2608, 6, 1, 353, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Doc Mixilpixil - Emote Spell');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (2608, 7, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Doc Mixilpixil - Stop Emoting');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (2608, 9, 0, 2, 0, 0, 0, 0, 0, 0, 0, 3564, 0, 0, 0, 0, 0, 0, 0, 0, 'Doc Mixilpixil - Say Emote Text 2');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (2608, 9, 1, 69, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Doc Mixilpixil - Emote Crafting');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (2608, 11, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Doc Mixilpixil - Stop Emoting');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (2608, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3565, 0, 0, 0, 0, 0, 0, 0, 0, 'Doc Mixilpixil - Say Text 3');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (2608, 14, 3, 0, 0, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -8805.29, 338.5, 95.09, 1.7, 0, 'Doc Mixilpixil - Move to Horatio');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (2608, 20, 3, 0, 0, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -8804.15, 325.58, 95.09, 4.9, 0, 'Doc Mixilpixil - Move to Noarm');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (2608, 26, 0, 2, 0, 0, 0, 0, 0, 0, 0, 3566, 0, 0, 0, 0, 0, 0, 0, 0, 'Doc Mixilpixil - Say Emote Text 4');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (2608, 30, 3, 0, 0, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -8805.56, 331.96, 95.09, 3.15, 0, 'Doc Mixilpixil - Move to default position');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (2608, 33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3568, 0, 0, 0, 0, 0, 0, 0, 0, 'Doc Mixilpixil - Say Text 5');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (2608, 33, 7, 2608, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Doc Mixilpixil - Complete Quest The Touch of Zanzil');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (2608, 34, 4, 147, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Doc Mixilpixil - Modify Flags');

-- Move Quest End Script 4321 to Quest Start Script
UPDATE `quest_template` SET `StartScript` = 4321, `CompleteScript` = 0 WHERE `entry` = 4321;
DELETE FROM `quest_end_scripts` WHERE `id`=4321;
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4321, 0, 4, 147, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'J.D. Collie - Remove Gossip and Quest flags');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4321, 0, 9, 63180, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'J.D. Collie - Spawn Gameobject J.D.\'s Manual');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4321, 1, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 'J.D. Collie - Face J.D.\'s Manual');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4321, 2, 1, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'J.D. Collie - Emote Cheer');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4321, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5287, 0, 0, 0, 0, 0, 0, 0, 0, 'J.D. Collie - Say Text 1');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4321, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5288, 0, 0, 0, 0, 0, 0, 0, 0, 'J.D. Collie - Say Text 2');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4321, 9, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.872, 0, 'J.D. Collie - Reset Orientation');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4321, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5289, 0, 0, 0, 0, 0, 0, 0, 0, 'J.D. Collie - Say Text 3');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4321, 11, 4, 147, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'J.D. Collie - Add Gossip and Quest flags');

-- Add JD Collie OOC Event
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry` = 9117;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (911701, 9117, 0, 1, 0, 100, 1, 5000, 10000, 90000, 120000, 911701, 0, 0, 'J.D. Collie - Talk - OOC');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (911701, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4843, 0, 0, 0, 0, 0, 0, 0, 0, 'J.D. Collie - Talk - OOC');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (911701, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4846, 0, 0, 0, 0, 0, 0, 0, 0, 'J.D. Collie - Talk - OOC');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (911701, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4847, 0, 0, 0, 0, 0, 0, 0, 0, 'J.D. Collie - Talk - OOC');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (911701, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4852, 0, 0, 0, 0, 0, 0, 0, 0, 'J.D. Collie - Talk - OOC');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (911701, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4853, 0, 0, 0, 0, 0, 0, 0, 0, 'J.D. Collie - Talk - OOC');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
