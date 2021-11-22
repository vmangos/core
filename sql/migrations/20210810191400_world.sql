DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210810191400');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210810191400');
-- Add your query below.


-- -----------------------------------------------------------------------------------------

-- Update Creatures and Gameobjects Associated With Quest Clam Bait 
UPDATE `gameobject_template` SET `data9` = 0, `flags` = 4 WHERE `entry` = 177784;
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

-- -----------------------------------------------------------------------------------------

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

-- -----------------------------------------------------------------------------------------

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
DELETE FROM `creature` WHERE `guid` IN (34193);
UPDATE `creature` SET `position_x` = -831.5, `position_y` = -2614.1, `position_z` = 91.9, `orientation` = 3 WHERE `guid` = 18658;
UPDATE `creature` SET `position_x` = -1736.846, `position_y` = 2867.57, `position_z` = 70.0435 WHERE `guid` = 28907;

-- -----------------------------------------------------------------------------------------

-- Correct Loot Template For Riverpaw Gnoll
DELETE FROM `creature_loot_template` WHERE `entry` = 117 AND `item` IN (30039, 1710);

-- -----------------------------------------------------------------------------------------

-- Update Quest Text
UPDATE `quest_template` SET `OfferRewardText` = 'The humans have taught us a great deal about the Holy Light and how important their order is to them... and to protecting all of Azeroth. We have a great respect for how steeped in tradition it is, and how just one figure, one sacrifice, can make the difference between pain and salvation.$B$BThe two of us are gonna be working together for a bit. Any time you think you\'re ready, come back to me and we\'ll see about getting you some training. Can\'t have you go out into the world unprepared, now, can we?' WHERE `entry` = 3107;

-- -----------------------------------------------------------------------------------------

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

-- -----------------------------------------------------------------------------------------

-- NOTE: There seems to be a missing escort quest associated with this NPC
-- Add Missing Creature Guard Didier
UPDATE `creature_template` SET `gossip_menu_id` = 7168, `faction` = 1624 WHERE `entry` = 16226;
INSERT INTO `creature` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `health_percent`, `patch_min`, `patch_max`, `wander_distance`) VALUES
(1383, 16226, 0, 2305.29, -5286.12, 82.0618, 4.83456, 120, 120, 100, 9, 10, 0);

-- -----------------------------------------------------------------------------------------

-- Remove Some Skinning Loot IDs
UPDATE `creature_template` SET `skinning_loot_id` = 0 WHERE entry IN (10116, 2230, 6728, 12202, 14646, 14869);

-- -----------------------------------------------------------------------------------------

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

-- -----------------------------------------------------------------------------------------

-- Fix drop rate of items used in quest 5725 (The Power to Destroy...) in Ragefire Chasm (credit cmangos)
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = -5 WHERE `item` IN (14395, 14396);

-- -----------------------------------------------------------------------------------------

-- Fix drop rate of item used in quest 443 (Rot Hide Ichor) in Silverpine Forest (credit cmangos)
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = -30 WHERE `item` = 3236;

-- -----------------------------------------------------------------------------------------

-- Fix drop rate of items used in quest 451 (A Recipe For Death) in Silverpine Forest (credit cmangos)
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = -50 WHERE `item` = 3257;

-- -----------------------------------------------------------------------------------------

-- Remove Teebus Blazing Longsword, Alcors Sunrazor, Blanchards Stout and Shadowblade From Lockboxes
DELETE FROM `item_loot_template` WHERE `entry` = 16885 AND `item` = 1014;
DELETE FROM `reference_loot_template` WHERE `entry` = 1014;

-- -----------------------------------------------------------------------------------------

-- Increase Dropchance for Crystallized Note
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance` = 30 WHERE `entry` IN (9676, 9820, 9819) AND `item`=10840;

-- -----------------------------------------------------------------------------------------

-- Highborne Relic Summons Creature
INSERT INTO `gameobject_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (48995, 0, 39, 175891, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Highborne Relic Fragment - Start Script');
INSERT INTO `gameobject_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (48999, 0, 39, 175891, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Highborne Relic Fragment - Start Script');
INSERT INTO `gameobject_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (48993, 0, 39, 175891, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Highborne Relic Fragment - Start Script');
INSERT INTO `gameobject_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (48998, 0, 39, 175891, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Highborne Relic Fragment - Start Script');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (175891, 0, 10, 7524, 180000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 'Highborne Relic Fragment - Summon Creature');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (175891, 0, 10, 7523, 180000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 'Highborne Relic Fragment - Summon Creature');

-- -----------------------------------------------------------------------------------------

-- Move From pool_creature to pool_creature_template
DELETE FROM `pool_creature` WHERE `pool_entry` IN (108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 123, 124, 521, 2598, 2605, 2606, 2779, 2850, 3200, 9002, 10003, 10004, 12902, 14222, 14281, 25468, 42939, 43157, 43525, 43517);
UPDATE `pool_template` SET `max_limit`=8 WHERE `entry` = 10003;
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
(832, 10003, 0, 'Dust Devil', 0, 0, 10),
(3671, 10004, 0, 'Lady Anacondra', 0, 0, 10),
(12902, 12902, 0, 'Lorgus Jett', 0, 0, 10),
(14222, 14222, 0, 'Araga', 0, 0, 10),
(14281, 14281, 0, 'Jimmy the Bleeder', 0, 0, 10),
(10558, 25468, 25, 'Hearthsinger Forresten', 0, 0, 10),
(14231, 42939, 0, 'Drogoth the Roamer', 0, 0, 10),
(14233, 43157, 0, 'Ripscale', 0, 0, 10),
(14230, 43517, 0, 'Burgle Eye', 0, 0, 10),
(13602, 43525, 0, 'The Abominable Greench', 0, 0, 10);

-- -----------------------------------------------------------------------------------------

-- Mudrock Borer Skinning Template
UPDATE `creature_template` SET `skinning_loot_id`= 4400 WHERE `entry` = 4399;

-- -----------------------------------------------------------------------------------------

-- Reduce droprate of Mistvale Giblets
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`= -20 WHERE `entry` = 1557 AND `item` = 3919;

-- -----------------------------------------------------------------------------------------

-- Recipe: Undermine Clam Chowder should have 30 min restock timer
UPDATE `npc_vendor` SET `incrtime` = 1800 WHERE `entry` = 8139 AND `item` = 16767;

-- -----------------------------------------------------------------------------------------

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

-- Events list for Spectral Defender
DELETE FROM `creature_ai_events` WHERE `creature_id`=11289;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1128901, 11289, 0, 1, 0, 100, 1, 5000, 5000, 5000, 5000, 1128901, 0, 0, 'Spectral Defender - Summon Spectral Betrayer - OOC');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1128902, 11289, 0, 0, 0, 100, 3, 5000, 20000, 20000, 35000, 1128902, 1128903, 0, 'Spectral Defender - Talk - In Combat');
DELETE FROM `creature_ai_scripts` WHERE `id`=1128901;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1128901, 0, 10, 11288, 40000, 0, 0, 11289, 20, 8, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 'Spectral Defender - Summon Creature');
DELETE FROM `creature_ai_scripts` WHERE `id`=1128902;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1128902, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6840, 6836, 6841, 6837, 0, 0, 0, 0, 0, 'Spectral Defender - Talk');
DELETE FROM `creature_ai_scripts` WHERE `id`=1128903;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1128903, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6838, 6835, 6842, 6839, 0, 0, 0, 0, 0, 'Spectral Defender - Talk');

-- Events list for Spectral Betrayer
DELETE FROM `creature_ai_events` WHERE `creature_id`=11288;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1128801, 11288, 0, 0, 0, 100, 3, 5000, 20000, 20000, 35000, 1128801, 1128802, 0, 'Spectral Betrayer - Talk - In Combat');
DELETE FROM `creature_ai_scripts` WHERE `id`=1128801;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1128801, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6834, 6832, 6827, 6829, 0, 0, 0, 0, 0, 'Spectral Betrayer - Talk');
DELETE FROM `creature_ai_scripts` WHERE `id`=1128802;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1128802, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6831, 6833, 6830, 6828, 0, 0, 0, 0, 0, 'Spectral Betrayer - Talk');

-- -----------------------------------------------------------------------------------------

UPDATE `item_loot_template` SET `ChanceOrQuestChance` = 100 WHERE `entry` = 10773 AND `item` IN (10780, 10781, 10782);

-- -----------------------------------------------------------------------------------------

UPDATE `gameobject_template` SET `flags` = 4 WHERE `entry` = 1761;

-- -----------------------------------------------------------------------------------------

-- Add Zixil Missing Scripts
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (353701, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1119, 0, 0, 0, 0, 0, 0, 0, 0, 'Zixil - Talk on Arriving to Southshore / Tarren Mill');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (353702, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1122, 0, 0, 0, 0, 0, 0, 0, 0, 'Zixil - Talk on Leaving Southshore');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (353703, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1123, 0, 0, 0, 0, 0, 0, 0, 0, 'Zixil - Talk on Leaving Tarren Mill');

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

-- -----------------------------------------------------------------------------------------

-- Achellios Should Run
DELETE FROM `creature_movement` WHERE `id` = 21388;
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(5933, 1, -5056.58, -1539.16, -49.074, 100, 0, 0, 0),
(5933, 2, -5050.61, -1527.85, -48.7505, 100, 0, 0, 0),
(5933, 3, -5045.1, -1516.29, -48.7706, 100, 0, 0, 0),
(5933, 4, -5042.88, -1491.24, -50.0702, 100, 0, 0, 0),
(5933, 5, -5052.57, -1467.68, -50.1105, 100, 0, 0, 0),
(5933, 6, -5058.98, -1456.44, -50.174, 100, 0, 0, 0),
(5933, 7, -5067.86, -1432.4, -51.9953, 100, 0, 0, 0),
(5933, 8, -5063.83, -1408.12, -52.3136, 100, 0, 0, 0),
(5933, 9, -5056.35, -1399.06, -51.449, 100, 0, 0, 0),
(5933, 10, -5031.23, -1397.28, -48.6515, 100, 0, 0, 0),
(5933, 11, -5006.69, -1395.93, -43.2672, 100, 0, 0, 0),
(5933, 12, -4981.75, -1389.79, -44.9201, 100, 0, 0, 0),
(5933, 13, -4969.33, -1386.66, -45.222, 100, 0, 0, 0),
(5933, 14, -4957.41, -1382.73, -47.1683, 100, 0, 0, 0),
(5933, 15, -4953.97, -1360.73, -46.1892, 100, 0, 0, 0),
(5933, 16, -4952.77, -1349.02, -44.264, 100, 0, 0, 0),
(5933, 17, -4932.77, -1316.87, -47.3359, 100, 0, 0, 0),
(5933, 18, -4934.91, -1292.27, -46.2558, 100, 0, 0, 0),
(5933, 19, -4938.88, -1279.99, -47.151, 100, 0, 0, 0),
(5933, 20, -4963.89, -1252.02, -46.3098, 100, 0, 0, 0),
(5933, 21, -4985.72, -1239.1, -48.0124, 100, 0, 0, 0),
(5933, 22, -5005.21, -1223.71, -50.7321, 100, 0, 0, 0),
(5933, 23, -5024.05, -1206.39, -53.8683, 100, 0, 0, 0),
(5933, 24, -5045.6, -1203.39, -54.633, 100, 0, 0, 0),
(5933, 25, -5067.7, -1216.39, -53.8362, 100, 0, 0, 0),
(5933, 26, -5097.51, -1256.82, -48.548, 100, 0, 0, 0),
(5933, 27, -5115.29, -1291.22, -49.7362, 100, 0, 0, 0),
(5933, 28, -5128.18, -1314.89, -49.6497, 100, 0, 0, 0),
(5933, 29, -5141.1, -1337.4, -50.0854, 100, 0, 0, 0),
(5933, 30, -5156.98, -1357, -50.7519, 100, 0, 0, 0),
(5933, 31, -5167.02, -1364.64, -51.1282, 100, 0, 0, 0),
(5933, 32, -5185.79, -1382.24, -52.2553, 100, 0, 0, 0),
(5933, 33, -5210.03, -1412.3, -52.5824, 100, 0, 0, 0),
(5933, 34, -5217.76, -1422.74, -53.2908, 100, 0, 0, 0),
(5933, 35, -5236.83, -1456.26, -54.3586, 100, 0, 0, 0),
(5933, 36, -5241.49, -1482.31, -55.0414, 100, 0, 0, 0),
(5933, 37, -5240.6, -1494.95, -55.1321, 100, 0, 0, 0),
(5933, 38, -5221.83, -1528.54, -52.8623, 100, 0, 0, 0),
(5933, 39, -5207.69, -1547.14, -51.06, 100, 0, 0, 0),
(5933, 40, -5176.75, -1569.58, -53.4408, 100, 0, 0, 0),
(5933, 41, -5153.26, -1574.8, -53.1897, 100, 0, 0, 0),
(5933, 42, -5140.73, -1572.53, -51.0097, 100, 0, 0, 0),
(5933, 43, -5115.85, -1567.78, -47.3948, 100, 0, 0, 0),
(5933, 44, -5078.98, -1557.16, -46.7559, 100, 0, 0, 0),
(5933, 45, -5068.11, -1552.25, -48.4021, 100, 0, 0, 0),
(5933, 46, -5052.69, -1531.79, -48.805, 100, 0, 0, 0);
UPDATE `creature_movement_template` SET `script_id` = 11 WHERE `entry` = 5933 AND `point` = 1;
UPDATE `creature` SET `position_x` = -5056.58, `position_y` = -1539.16, `position_z` = -49.074 WHERE `guid` IN (21388, 21677, 21678, 21679);

-- -----------------------------------------------------------------------------------------

-- Update Hagg Taurenbane Spawn Points
UPDATE `creature` SET `position_x` = -3988.903564453125, `position_y` = -1862.833740234375, `position_z` = 91.7680816650390625, `orientation` = 1.640609502792358398 WHERE `guid` = 20942;
UPDATE `creature` SET `position_x` = -3709.73095703125, `position_y` = -1587.8887939453125, `position_z` = 91.9688873291015625, `orientation` = 0.05235987901687622 WHERE `guid` = 20941;
UPDATE `creature` SET `position_x` = -3893.58642578125, `position_y` = -1627.259765625, `position_z` = 91.75, `orientation` = 4.886921882629394531 WHERE `guid` = 20943;

-- -----------------------------------------------------------------------------------------

-- Add Serpent Statue Script
UPDATE `gameobject_template` SET `script_name`='' WHERE  `entry`=177673;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_max`) VALUES
(202202, 177705, 1, 252.547, 2963.69, 1.64267, 5.58505, 0, 0, -0.34202, 0.939693, -120, -120, 100, 1, 10);

DELETE FROM `gameobject_scripts` WHERE `id`=12609;
INSERT INTO `gameobject_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (12609, 1, 9, 202202, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Naga Beam - Respawn');
INSERT INTO `gameobject_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (12609, 3, 15, 19473, 0, 0, 0, 177705, 5, 11, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Naga Beam - Cast Spell Naga Statue Spell');
INSERT INTO `gameobject_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (12609, 4, 41, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Serpent Statue - Despawn');
INSERT INTO `gameobject_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (12609, 5, 10, 12369, 60000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, 252.57, 2963.7, 1.72356, 1.29154, 0, 'Player - Summon Creature Lord Kragaru');
INSERT INTO `gameobject_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (12609, 120, 82, 12609, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Serpent Statue - Spawn');

-- -----------------------------------------------------------------------------------------

-- Giant Plains Creeper Should not be Skinnable
UPDATE `creature_template` SET `skinning_loot_id` = 0 WHERE `entry`=2565;
DELETE FROM `skinning_loot_template` WHERE `entry`=2565 AND `item`=4234;

-- -----------------------------------------------------------------------------------------

-- Correct Quest Start Script fot The Shattered Salute
UPDATE `quest_template` SET `StartScript` = 2460 WHERE `entry`= 2460;
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (2460, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3278, 0, 0, 0, 0, 0, 0, 0, 0, 'The Shattered Salute: Shenthul - Talk');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (2460, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3279, 0, 0, 0, 0, 0, 0, 0, 0, 'The Shattered Salute: Shenthul - Talk');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (2460, 12, 0, 2, 0, 0, 0, 0, 0, 0, 0, 3280, 0, 0, 0, 0, 0, 0, 0, 0, 'The Shattered Salute: Shenthul - Talk');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (2460, 18, 1, 66, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Shattered Salute: Shenthul - Emote');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (2460, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3281, 0, 0, 0, 0, 0, 0, 0, 0, 'The Shattered Salute: Shenthul - Talk');

UPDATE `creature_template` SET `ai_name`='EventAI', `script_name`='' WHERE  `entry`=3401;
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (806, 9, 2460, 1, 0, 0, 0);
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (340101, 3401, 806, 22, 0, 100, 1, 78, 0, 0, 0, 340101, 0, 0, 'The Shattered Salute: Shenthul - Talk - Recieved Emote');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (340101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3287, 0, 0, 0, 0, 0, 0, 0, 0, 'The Shattered Salute: Shenthul - Talk');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (340101, 0, 7, 2460, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Shattered Salute: Shenthul - Complete Quest');

-- -----------------------------------------------------------------------------------------

-- Events list for Twilight Disciple
DELETE FROM `creature_ai_events` WHERE `creature_id`=2338;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (233801, 2338, 0, 14, 0, 100, 1, 150, 40, 18000, 21000, 233801, 0, 0, 'Twilight Disciple - Cast Renew on Friendlies');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (233802, 2338, 0, 14, 0, 100, 1, 280, 40, 21000, 25000, 233802, 0, 0, 'Twilight Disciple - Cast Heal on Friendlies');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (233803, 2338, 0, 2, 0, 100, 0, 15, 0, 0, 0, 233803, 0, 0, 'Twilight Disciple - Flee at 15% HP');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (233804, 2338, 0, 6, 0, 100, 2, 0, 0, 0, 0, 233804, 233805, 0, 'Twilight Disciple - Talk - Death');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (233805, 2338, 0, 4, 0, 100, 2, 0, 0, 0, 0, 233806, 233807, 0, 'Twilight Disciple - Talk - Aggro');
DELETE FROM `creature_ai_scripts` WHERE `id`=233804;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (233804, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 829, 830, 831, 832, 0, 0, 0, 0, 0, 'Twilight Disciple - Talk');
DELETE FROM `creature_ai_scripts` WHERE `id`=233805;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (233805, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 825, 826, 827, 828, 0, 0, 0, 0, 0, 'Twilight Disciple - Talk');
DELETE FROM `creature_ai_scripts` WHERE `id`=233806;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (233806, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 833, 834, 835, 836, 0, 0, 0, 0, 0, 'Twilight Disciple - Talk');
DELETE FROM `creature_ai_scripts` WHERE `id`=233807;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (233807, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 837, 838, 839, 840, 0, 0, 0, 0, 0, 'Twilight Disciple - Talk');

-- Events list for Twilight Thug
DELETE FROM `creature_ai_events` WHERE `creature_id`=2339;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (233901, 2339, 0, 11, 0, 100, 0, 0, 0, 0, 0, 233901, 0, 0, 'Twilight Thug - Cast Battle Stance on Spawn');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (233902, 2339, 0, 4, 0, 100, 2, 0, 0, 0, 0, 233902, 233903, 0, 'Twilight Thug - Say Text on Aggro');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (233904, 2339, 0, 2, 0, 100, 0, 15, 0, 0, 0, 233904, 0, 0, 'Twilight Thug - Flee at 15% HP');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (233905, 2339, 0, 6, 0, 100, 2, 0, 0, 0, 0, 233905, 233906, 0, 'Twilight Thug - Chance Say on Death');

-- -----------------------------------------------------------------------------------------

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

-- -----------------------------------------------------------------------------------------

-- Remove Low Level Loot from Silvermane Wolf
DELETE FROM `creature_loot_template` WHERE `entry`=2924 AND `item`=30011;

-- -----------------------------------------------------------------------------------------

-- Remove Incorrect Skinning Templates
UPDATE `creature_template` SET `skinning_loot_id`=0 WHERE `entry` IN (11788, 11787, 12218);

-- -----------------------------------------------------------------------------------------

/*

Comments from https://classicdb.ch/?npc=11286

By Anonymous on 06/24/2006 (Patch 1.11.0)
Moved in 1.11.2. He's now outside near Eva and Lucien Sarkhoff.

By Anonymous on 02/22/2005 (Patch 1.2.0)
Hes located upstairs in the Throne Room of Caer Darrow. You can only see him if you have the Spectral Essence

By Anonymous on 01/29/2005 (Patch 1.2.0)
He's inside Scholomance, but not inside the instance.&nbsp He's upstairs, in the place where you'd normally expect to find the boss of a typical barracks (up the stairs, up the incline).

By Anonymous on 06/24/2006 (Patch 1.11.0)
When you walk up to scholomance, you can take a left to go through the door to the instance, or a right to go up a small flight of stairs. Take a right. Or if you dont understand that, as soon as you are inside the door (from the instance [not inside the instance]) open it, and just walk straight.

By Anonymous on 06/24/2006 (Patch 1.11.0)
I had the same problem of not being able to see any ghosts including Marduke.&nbsp I had the trinket equipped in the top slot but when i switched to the bottom slot I could see the ghosts.&nbsp So tool around with where the trinket is placed and you should be fine.&nbsp
Also, as a previous poster said Marduke is now just outside of the instnace near Eva and her husband, so don't look at his old spot up the steps.&nbsp Just look for the yellow quest dot on your mini map.

By Anonymous on 06/24/2006 (Patch 1.11.0)
I ran up there knowing ahead of time where he would be and still nothing.&nbsp I had equipped the right trinket, but still nothing.&nbsp I even ran down to town to meet with the Vendor ghosts.&nbsp But couldn't find Marduke.
Turns out my wardrobe addon was switching trinkets for EPL automaticallyy and putting my mindtap Talisman on and off in place of it.&nbsp I had to manually pop the thing on while in the room and voila!
So watch your wardrobe when looking for him if you have any addons.

By Anonymous on 11/16/2006 (Patch 1.12.2)
He is now at outside just near to the entrance. Therefore so called "bug" is not necessary anymore.

By Anonymous on 07/09/2005 (Patch 1.5.1)
i actually asked most guilds i have been in about this series of quests , non seem to have done it , as i understand it is that caer darrow is an invisible horde town , right ? with vendors and other npcs , but u have to get that essence from the butcher series of quests , i here that this quest is also open to allaince but they woudnt benefit as this is horde town right ? the thing is its really funny ppl think the essence is just another toy in the game like the orb of deception and pets , so they use the essence once and chuck it or keep it at the bank , plus this guy isnt out in the open hes in the throne room inside a building , most ppl dont see him , also can allaince attack these ghosts ? r they all undead ? i cant wait to do these and findout but in the meanwhile it would be good to know ... thnx for any 1 how can help me ...

By Anonymous on 06/24/2006 (Patch 1.11.0)
I know where he is supposed to be, and im on one of the last parts of this quest..
But still cant find him after 1.11...
He has supposedly been moved outside, but cant see him there either, even when im using the essence..
anyone have any idea what might be wrong?

By Anonymous on 06/04/2006 (Patch 1.10.2)
He is not inside scholo, when u come there is door to left leading instance itself and if u go right then u come to a room where he stays but i need that trinket to see him

Comments from https://classicdb.ch/?quest=5461

By Anonymous on 10/15/2005 (Patch 1.8.0)
You have to complete the quests from the ghosts right outside of scholo to get a trinket that lets you see the NPCs there.&nbsp After that, he is up in the castle where the scholomance instance starts.

By Anonymous on 06/28/2006 (Patch 1.11.1)
As of 1.11, the Trinket only works in Caer Darrow.&nbsp Magistrate Marduke is now in front of the instance next to a cart.&nbsp You'll have to listen to his story similar to the first quest NPC there.&nbsp

By Anonymous on 05/22/2006 (Patch 1.10.2)
Magistrate Marduke
Is in the top of the building at Scholo, turning Right instead of going into the Instance head upstairs and there he is.....

By Anonymous on 04/16/2006 (Patch 1.10.1)
you need complet a chain quest for get spectral essence for see ghost in cear darrow
after that you&nbsp go in castle of scholo at top and you will find a ghost that give you that quest =D

By Anonymous on 05/22/2006 (Patch 1.10.2)
6. The magistrate is in a large room above the scholomance instance (NOT IN THE INSTANCE) instead of going into the scholomance door, turn right. go up the wooden stairs and turn left. You should enter a large room. If you are wearing the trinket then there is a ghost there.

*/
-- Magistrate Marduke was spawned inside the building before 1.11.
-- I've manually spawned him based on comments and a screenshot.
DELETE FROM `creature` WHERE `id`=11286;
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES (18037, 11286, 0, 0, 0, 0, 1290.54, -2567.25, 111.522, 3.59174, 25, 25, 0, 100, 0, 0, 0, 0, 0, 8);
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES (18044, 11286, 0, 0, 0, 0, 1245.52, -2616.74, 90.4419, 2.23402, 25, 25, 0, 100, 0, 0, 0, 0, 9, 10);

-- Magistrate Marduke Should be a Questgiver and Add Missing Gossip
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

-- There is a hidden faction requirement, to only show the quest once you click the gossip.
-- It uses a spell to set your faction to friendly once you've read all the gossip options.
DELETE FROM `gossip_scripts` WHERE `id`=336400;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (336400, 0, 15, 17681, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Magistrate Marduke - Cast Spell Reputation - Caer Darrow');
UPDATE `gossip_menu_option` SET `action_script_id`=336400 WHERE `menu_id`=3364;
UPDATE `quest_template` SET `RequiredMinRepFaction`=574, `RequiredMinRepValue`=6000 WHERE `entry`=5461;

-- -----------------------------------------------------------------------------------------

-- Add Some More Missing Text to Guard Howe
DELETE FROM `creature_ai_scripts` WHERE `id`=90301;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (90301, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 51, 52, 53, 0, 0, 0, 0, 0, 0, 'Guard Howe - Say Text');

-- -----------------------------------------------------------------------------------------

-- Add Scripts to Prospect of Faith Quests
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (723, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Prospect of Faith: Hammertoe Grez - Modify Flags');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (723, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 957, 0, 0, 0, 0, 0, 0, 0, 0, 'Prospect of Faith: Hammertoe Grez - Talk');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (723, 3, 15, 4984, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Prospect of Faith: Hammertoe Grez - Cast Spell');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (723, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 979, 0, 0, 0, 0, 0, 0, 0, 0, 'Prospect of Faith: Hammertoe Grez - Talk');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (723, 4, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Prospect of Faith: Hammertoe Grez - Modify Flags');
UPDATE `quest_template` SET `StartScript` = 723 WHERE `entry` = 723;

INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (724, 0, 4, 147, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Prospect of Faith: Historian Karnik - Modify Flags');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (724, 2, 15, 4985, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Prospect of Faith: Historian Karnik - Cast Spell');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (724, 2, 10, 2915, 29000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 3, -4629.12, -1325.91, 503.465, 2.86234, 0, 'Prospect of Faith: Historian Karnik - Summon Creature');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (724, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 917, 0, 0, 0, 0, 0, 0, 0, 0, 'Prospect of Faith: Historian Karnik - Talk');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (724, 10, 0, 0, 0, 0, 0, 2915, 5, 8, 2, 916, 0, 0, 0, 0, 0, 0, 0, 0, 'Prospect of Faith: Hammertoes Spirit - Talk');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (724, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 956, 0, 0, 0, 0, 0, 0, 0, 0, 'Prospect of Faith: Historian Karnik - Talk');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (724, 20, 0, 0, 0, 0, 0, 2915, 5, 8, 2, 918, 0, 0, 0, 0, 0, 0, 0, 0, 'Prospect of Faith: Hammertoes Spirit - Talk');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (724, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 958, 0, 0, 0, 0, 0, 0, 0, 0, 'Prospect of Faith: Historian Karnik - Talk');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (724, 27, 4, 147, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Prospect of Faith: Historian Karnik - Modify Flags');
UPDATE `quest_template` SET `CompleteScript` = 724 WHERE `entry` = 724;

-- -----------------------------------------------------------------------------------------

-- Add Missing Gossip For Quest Get the Scoop
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES
(282, 779, 983), -- Goblin Pit Crewman
(284, 781, 983), -- Gnome Pit Crewman
(433, 930, 983); -- Race Master Kronkrider
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (983, 9, 1950, 1, 0, 0, 0);

-- -----------------------------------------------------------------------------------------

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

-- -----------------------------------------------------------------------------------------

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

-- -----------------------------------------------------------------------------------------

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

-- -----------------------------------------------------------------------------------------

-- Add Missing Thunder Bluff Reveler and Waypoints
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(140068, 15719, 0, 0, 0, 1, -1244.63, 67.5991, 127.914, 4.08576, 120, 120, 0, 100, 0, 2, 0, 0, 6, 10);
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES
(140068, 34),
(140068, 38);
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(140068, 1, -1172.45, 119.396, 135.106, 100, 0, 0, 0),
(140068, 2, -1184.28, 120.872, 135.207, 100, 0, 0, 0),
(140068, 3, -1192.27, 120.281, 135.206, 100, 0, 0, 0),
(140068, 4, -1202.92, 119.533, 134.884, 100, 0, 0, 0),
(140068, 5, -1205.57, 111.916, 134.43, 100, 0, 0, 0),
(140068, 6, -1213.63, 100.682, 133.778, 100, 0, 0, 0),
(140068, 7, -1221.77, 91.7981, 132.092, 100, 0, 0, 0),
(140068, 8, -1225.93, 87.7314, 131.294, 100, 0, 0, 0),
(140068, 9, -1230.37, 82.3712, 130.489, 100, 0, 0, 0),
(140068, 10, -1239.16, 74.9042, 129.171, 100, 0, 0, 0),
(140068, 11, -1242.99, 69.609, 128.003, 100, 0, 0, 0),
(140068, 12, -1248.53, 62.6843, 127.12, 100, 0, 0, 0),
(140068, 13, -1255.16, 57.1051, 126.957, 100, 0, 0, 0),
(140068, 14, -1264.68, 57.7782, 126.971, 100, 0, 0, 0),
(140068, 15, -1269.16, 60.87, 127.151, 100, 0, 0, 0),
(140068, 16, -1276.64, 63.7197, 128.29, 100, 0, 0, 0),
(140068, 17, -1286.8, 62.4132, 128.557, 100, 0, 0, 0),
(140068, 18, -1303.73, 60.0783, 128.573, 100, 0, 0, 0),
(140068, 19, -1319.74, 56.2617, 129.036, 100, 0, 0, 0),
(140068, 20, -1328.44, 50.3823, 129.036, 100, 0, 0, 0),
(140068, 21, -1332.66, 40.1368, 129.076, 100, 0, 0, 0),
(140068, 22, -1327.5, 25.6062, 129.253, 100, 0, 0, 0),
(140068, 23, -1332.66, 40.1368, 129.076, 100, 0, 0, 0),
(140068, 24, -1328.44, 50.3823, 129.036, 100, 0, 0, 0),
(140068, 25, -1319.74, 56.2617, 129.036, 100, 0, 0, 0),
(140068, 26, -1303.73, 60.0783, 128.573, 100, 0, 0, 0),
(140068, 27, -1286.8, 62.4132, 128.557, 100, 0, 0, 0),
(140068, 28, -1276.64, 63.7197, 128.29, 100, 0, 0, 0),
(140068, 29, -1269.17, 60.8769, 127.152, 100, 0, 0, 0),
(140068, 30, -1264.68, 57.7782, 126.971, 100, 0, 0, 0),
(140068, 31, -1255.16, 57.1051, 126.957, 100, 0, 0, 0),
(140068, 32, -1248.53, 62.6843, 127.12, 100, 0, 0, 0),
(140068, 33, -1242.99, 69.609, 128.003, 100, 0, 0, 0),
(140068, 34, -1239.16, 74.9042, 129.171, 100, 0, 0, 0),
(140068, 35, -1230.37, 82.3712, 130.49, 100, 0, 0, 0),
(140068, 36, -1225.93, 87.7314, 131.294, 100, 0, 0, 0),
(140068, 37, -1221.77, 91.7981, 132.092, 100, 0, 0, 0),
(140068, 38, -1213.63, 100.682, 133.778, 100, 0, 0, 0),
(140068, 39, -1205.57, 111.916, 134.431, 100, 0, 0, 0),
(140068, 40, -1202.92, 119.533, 134.884, 100, 0, 0, 0),
(140068, 41, -1192.27, 120.281, 135.206, 100, 0, 0, 0),
(140068, 42, -1184.28, 120.872, 135.206, 100, 0, 0, 0);

-- -----------------------------------------------------------------------------------------

-- Convert Stormwind School Trip to Creature Groups
-- Add Missing Creature
INSERT INTO `creature` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `health_percent`, `mana_percent`, `patch_min`, `patch_max`) VALUES (87023, 3509, 0, -8839.57, 666.54, 97.95, 0.48, 300, 300, 100, 0, 0, 10);

-- Remove Old Waypoints and Scripts
DELETE FROM `creature_movement` WHERE `id`  IN (87092, 87091, 87090, 87089, 87082, 87088, 87023, 84028);
DELETE FROM `creature_movement_scripts` WHERE `id` IN (
8708224, 
8708942, 
8708943,
8402820,
8402821,
8402823,
8402824,
8402838,
8402839,
8402840,
8402841,
8402843,
8402857,
8402858,
8402859,
8402860,
8402861
);

-- Add New Waypoints and Scripts
INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES
(84028, 84028, 2, 6.25244, 11),
(84028, 87089, 2, 4.71, 11),
(84028, 87091, 2, 4, 11),
(84028, 87092, 2, 3.5, 11),
(84028, 87088, 2, 3.14, 11),
(84028, 87023, 2, 2.5, 11),
(84028, 87090, 2, 2, 11),
(84028, 87082, 2, 1.57, 11);
UPDATE `creature` SET `wander_distance` = 0, `movement_type` = 0 WHERE `guid` IN (87092, 87091, 87090, 87089, 87082, 87088, 87023);
UPDATE `creature` SET `position_x` = -8586.1, `position_y` = 730.992, `position_z` = 96.7626 WHERE `guid` in (
84028,
87089,
87091,
87092,
87088,
87023,
87090,
87082
);
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(3513, 1, -8586.1, 730.992, 96.7626, 100, 0, 0, 0),
(3513, 2, -8590.87, 724.43, 96.7283, 100, 0, 0, 0),
(3513, 3, -8592.83, 716.823, 96.6489, 100, 0, 0, 0),
(3513, 4, -8577.87, 693.417, 97.0165, 100, 0, 0, 0),
(3513, 5, -8565.31, 677.547, 97.0165, 100, 0, 0, 0),
(3513, 6, -8562.08, 675.545, 97.0165, 100, 0, 0, 0),
(3513, 7, -8555.43, 678.17, 97.0165, 100, 0, 0, 0),
(3513, 8, -8545.46, 684.961, 97.4431, 100, 0, 0, 0),
(3513, 9, -8534.18, 685.017, 97.8142, 100, 0, 0, 0),
(3513, 10, -8524.46, 673.714, 102.468, 100, 0, 0, 0),
(3513, 11, -8515.55, 660.255, 101.619, 100, 0, 0, 0),
(3513, 12, -8514.26, 648.95, 100.29, 100, 0, 0, 0),
(3513, 13, -8522.85, 641.323, 99.9655, 100, 0, 0, 0),
(3513, 14, -8539.73, 630.132, 100.511, 100, 0, 0, 0),
(3513, 15, -8555.84, 618.02, 102.104, 100, 0, 0, 0),
(3513, 16, -8563.08, 614.793, 102.339, 100, 0, 0, 0),
(3513, 17, -8572.45, 607.601, 102.836, 100, 0, 0, 0),
(3513, 18, -8580.89, 594.231, 103.504, 100, 0, 0, 0),
(3513, 19, -8585.41, 578.774, 103.219, 100, 0, 0, 0),
(3513, 20, -8585.63, 566.722, 102.333, 100, 0, 0, 0),
(3513, 21, -8582.36, 555.343, 101.842, 100, 0, 0, 0),
(3513, 22, -8573.9, 541.671, 101.777, 100, 0, 0, 0),
(3513, 23, -8559.24, 522.385, 100.366, 100, 0, 0, 0),
(3513, 24, -8552.56, 512.361, 98.7487, 100, 0, 0, 0),
(3513, 25, -8540.87, 495.993, 99.3584, 100, 0, 0, 0),
(3513, 26, -8536.97, 485.185, 101.343, 100, 0, 0, 0),
(3513, 27, -8543.08, 475.838, 103.489, 100, 0, 0, 0),
(3513, 28, -8548.66, 468.824, 104.489, 5.35816, 31000, 0, 351301),
(3513, 29, -8548.66, 468.824, 104.489, 100, 0, 0, 0),
(3513, 30, -8560.46, 465.971, 104.521, 100, 0, 0, 0),
(3513, 31, -8570.7, 470.286, 104.356, 100, 0, 0, 0),
(3513, 32, -8584.83, 484.662, 104.167, 100, 0, 0, 0),
(3513, 33, -8595.32, 497.046, 103.878, 100, 0, 0, 0),
(3513, 34, -8604.51, 504.825, 103.723, 100, 0, 0, 0),
(3513, 35, -8615.98, 516.119, 103.294, 100, 0, 0, 0),
(3513, 36, -8638.32, 539.16, 99.4273, 100, 0, 0, 0),
(3513, 37, -8654.13, 551.405, 96.904, 100, 0, 0, 0),
(3513, 38, -8669.57, 551.796, 97.1061, 100, 0, 0, 0),
(3513, 39, -8683.7, 545.057, 97.5905, 100, 0, 0, 0),
(3513, 40, -8698.51, 531.414, 97.7681, 100, 0, 0, 0),
(3513, 41, -8707.82, 523.625, 97.6242, 100, 0, 0, 0),
(3513, 42, -8711.2, 521.904, 97.469, 100, 0, 0, 0),
(3513, 43, -8727.9, 537.282, 100.773, 100, 0, 0, 0),
(3513, 44, -8743.6, 555.309, 98.3075, 100, 0, 0, 0),
(3513, 45, -8746.48, 562.404, 97.4049, 100, 0, 0, 0),
(3513, 46, -8742.99, 568.677, 97.4152, 100, 0, 0, 0),
(3513, 47, -8739.97, 571.394, 97.3819, 100, 0, 0, 0),
(3513, 48, -8749.37, 587.487, 97.3785, 100, 0, 0, 0),
(3513, 49, -8766.19, 604.742, 96.882, 100, 0, 0, 0),
(3513, 50, -8769.09, 607.409, 97.0518, 100, 0, 0, 0),
(3513, 51, -8775.97, 604.759, 97.2579, 100, 0, 0, 0),
(3513, 52, -8787.85, 594.274, 97.4835, 100, 0, 0, 0),
(3513, 53, -8794.89, 591.587, 97.5533, 100, 0, 0, 0),
(3513, 54, -8806.75, 601.339, 96.4468, 100, 0, 0, 0),
(3513, 55, -8820.86, 615.76, 94.9095, 100, 0, 0, 0),
(3513, 56, -8831.26, 619.72, 93.8224, 100, 0, 0, 0),
(3513, 57, -8843.74, 610.234, 92.7738, 100, 0, 0, 0),
(3513, 58, -8861.96, 594.241, 92.1522, 100, 0, 0, 0),
(3513, 59, -8887.1, 573.899, 92.7194, 100, 0, 0, 0),
(3513, 60, -8906.22, 558.894, 93.3155, 100, 0, 0, 0),
(3513, 61, -8922.33, 546.641, 94.2241, 100, 0, 0, 0),
(3513, 62, -8924.3, 539.96, 94.2866, 100, 0, 0, 0),
(3513, 63, -8914.73, 522.824, 94.0511, 100, 0, 0, 0),
(3513, 64, -8913.93, 507.292, 93.9269, 100, 0, 0, 0),
(3513, 65, -8933.47, 487.777, 93.8371, 100, 23000, 0, 351302),
(3513, 66, -8917.73, 499.33, 93.8759, 100, 0, 0, 0),
(3513, 67, -8912.57, 505.272, 93.9255, 100, 0, 0, 0),
(3513, 68, -8912.43, 516.744, 93.9203, 100, 0, 0, 0),
(3513, 69, -8920.9, 530.265, 94.7263, 100, 0, 0, 0),
(3513, 70, -8923.21, 533.562, 94.746, 100, 0, 0, 0),
(3513, 71, -8925.27, 540.683, 94.2893, 100, 0, 0, 0),
(3513, 72, -8908.42, 557.356, 93.4769, 100, 0, 0, 0),
(3513, 73, -8892.63, 570.025, 92.5347, 100, 0, 0, 0),
(3513, 74, -8854.95, 600.619, 92.0411, 100, 0, 0, 0),
(3513, 75, -8840.61, 614.867, 92.8369, 100, 0, 0, 0),
(3513, 76, -8834.83, 620.488, 93.3059, 100, 0, 0, 0),
(3513, 77, -8832.22, 631.391, 94.14, 100, 0, 0, 0),
(3513, 78, -8848.99, 653.373, 96.7825, 100, 0, 0, 0),
(3513, 79, -8851, 660.278, 97.1141, 100, 0, 0, 0),
(3513, 80, -8839.12, 669.909, 98.0694, 100, 0, 0, 0),
(3513, 81, -8831.96, 674.067, 98.3812, 100, 0, 0, 0),
(3513, 82, -8828.4, 675.891, 97.8327, 100, 0, 0, 0),
(3513, 83, -8831.81, 693.699, 97.4397, 100, 0, 0, 0),
(3513, 84, -8841.73, 715.967, 97.5358, 100, 0, 0, 0),
(3513, 85, -8841.02, 723.175, 97.3278, 100, 0, 0, 0),
(3513, 86, -8819.64, 735.856, 98.0073, 100, 0, 0, 0),
(3513, 87, -8804.9, 742.377, 97.6624, 100, 0, 0, 0),
(3513, 88, -8793.15, 745.512, 98.053, 100, 0, 0, 0),
(3513, 89, -8781.76, 743.726, 99.1186, 100, 0, 0, 0),
(3513, 90, -8770.86, 738.54, 99.3152, 100, 0, 0, 0),
(3513, 91, -8758.39, 728.444, 98.2658, 100, 0, 0, 0),
(3513, 92, -8750.51, 719.338, 97.8736, 100, 0, 0, 0),
(3513, 93, -8744.6, 714.563, 98.2487, 100, 0, 0, 0),
(3513, 94, -8722.44, 728.87, 99.6364, 100, 0, 0, 0),
(3513, 95, -8715.89, 732.084, 97.914, 100, 0, 0, 0),
(3513, 96, -8704.01, 721.524, 97.0592, 100, 0, 0, 0),
(3513, 97, -8701.32, 718.212, 97.0342, 100, 0, 0, 0),
(3513, 98, -8681.77, 728.979, 97.0165, 100, 0, 0, 0),
(3513, 99, -8665.7, 741.326, 97.0165, 100, 0, 0, 0),
(3513, 100, -8660.92, 747.349, 96.6662, 100, 0, 0, 0),
(3513, 101, -8662.33, 754.29, 96.6767, 100, 0, 0, 0),
(3513, 102, -8665.09, 761.163, 96.6813, 100, 0, 0, 0),
(3513, 103, -8639.52, 782.918, 96.6642, 100, 0, 0, 0),
(3513, 104, -8636.32, 785.355, 96.6517, 100, 0, 0, 0),
(3513, 105, -8645.83, 801.054, 96.7129, 100, 0, 0, 0),
(3513, 106, -8656.33, 813.345, 96.6698, 100, 0, 0, 0),
(3513, 107, -8659.57, 820.359, 96.6649, 100, 0, 0, 0),
(3513, 108, -8636, 840.85, 96.6541, 100, 0, 0, 0),
(3513, 109, -8617.01, 855.936, 96.7029, 100, 0, 0, 0),
(3513, 110, -8610.18, 859.708, 96.6905, 100, 0, 0, 0),
(3513, 111, -8600.86, 854.151, 96.6632, 100, 0, 0, 0),
(3513, 112, -8602.36, 847.296, 96.7139, 100, 5000, 0, 0),
(3513, 113, -8614.17, 837.884, 96.7135, 100, 0, 0, 0),
(3513, 114, -8628.62, 823.755, 96.6673, 100, 0, 0, 0),
(3513, 115, -8633.14, 808.69, 96.6497, 100, 0, 0, 0),
(3513, 116, -8630.26, 789.115, 96.6452, 100, 0, 0, 0),
(3513, 117, -8622.1, 776.401, 96.6814, 0.767945, 23000, 0, 351303),
(3513, 118, -8622.1, 776.401, 96.6814, 100, 0, 0, 0),
(3513, 119, -8615.95, 768.691, 96.7005, 100, 0, 0, 0),
(3513, 120, -8602.55, 759.907, 96.7185, 100, 0, 0, 0),
(3513, 121, -8595.26, 756.489, 96.6934, 100, 0, 0, 0),
(3513, 122, -8584.51, 745.176, 96.6669, 100, 0, 0, 0),
(3513, 123, -8585.08, 734.299, 96.7894, 100, 0, 0, 0);
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (351301, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1140, 0, 0, 0, 0, 0, 0, 0, 0, 'Miss Danna - Talk');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (351301, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1161, 0, 0, 0, 0, 0, 0, 0, 0, 'Miss Danna - Talk');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (351301, 25, 39, 351101, 351102, 0, 0, 3511, 10, 8, 2, 50, 50, 0, 0, 0, 0, 0, 0, 0, 'Steven - Start Script');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (351301, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1162, 0, 0, 0, 0, 0, 0, 0, 0, 'Miss Danna - Talk');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (351101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1130, 1131, 1132, 1133, 0, 0, 0, 0, 0, 'Steven - Talk');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (351102, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1134, 1136, 1138, 1139, 0, 0, 0, 0, 0, 'Steven - Talk');

INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (351302, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1163, 0, 0, 0, 0, 0, 0, 0, 0, 'Miss Danna - Talk');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (351302, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1165, 0, 0, 0, 0, 0, 0, 0, 0, 'Miss Danna - Talk');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (351302, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1166, 0, 0, 0, 0, 0, 0, 0, 0, 'Miss Danna - Talk');

INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (351303, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1129, 0, 0, 0, 0, 0, 0, 0, 0, 'Miss Danna - Talk');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (351303, 10, 0, 0, 0, 0, 0, 3512, 10, 8, 2, 1153, 0, 0, 0, 0, 0, 0, 0, 0, 'Jimmy - Talk');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (351303, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1154, 0, 0, 0, 0, 0, 0, 0, 0, 'Miss Danna - Talk');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (351303, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1155, 0, 0, 0, 0, 0, 0, 0, 0, 'Miss Danna - Talk');

-- -----------------------------------------------------------------------------------------

-- Some Stormwind Creatures Despawn at Night
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES
(84028, -27),
(87089, -27),
(87091, -27),
(87092, -27),
(87088, -27),
(87023, -27),
(87090, -27),
(87082, -27),
(79720, -27),
(79721, -27),
(90439, -27),
(90440, -27),
(90443, -27);

-- -----------------------------------------------------------------------------------------

-- Some corrections to Karlee Chaddis Waypoints
UPDATE `creature_movement` SET `waittime` = 0 WHERE `id` = 90439;
UPDATE `creature_movement` SET `orientation` = 100 WHERE `id` = 90439;
UPDATE `creature_movement` SET `orientation` = 1.17061 WHERE `id` = 90439 AND `point` = 28;
UPDATE `creature_movement` SET `orientation` = 1.17061 WHERE `id` = 90439 AND `point` = 29;
UPDATE `creature_movement` SET `orientation` = 1.17061 WHERE `id` = 90439 AND `point` = 30;
UPDATE `creature_movement` SET `waittime` = 20000 WHERE `id` = 90439 AND `point`=29;

-- -----------------------------------------------------------------------------------------

-- Convert Janey Anship to Use Creature Groups
-- Remove Old Waypoints and Scripts
DELETE FROM `creature_movement` WHERE `id` IN (86596, 89294, 86597);
DELETE FROM `creature_movement_scripts` WHERE `id` IN (
8659606,
8659611,
8659625,
8659630,
8659646,
8659655,
8659659,
8929401,
8929414,
8929416,
8929421,
8929427,
8929437,
8929443,
8929451,
8929457,
8929459,
8929462,
8659703,
8659708,
8659709,
8659717,
8659718,
8659727,
8659728,
8659730,
8659731,
8659733,
8659734,
8659738,
8659739,
8659744,
8659745,
8659749,
8659750,
8659751,
8659752,
8659754,
8659755
);

-- Add New Waypoints and Scripts
INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES
(86596, 86596, 2, 6.25244, 11),
(86596, 89294, 2, 9.71, 11),
(86596, 86597, 2, 1.57, 11);
UPDATE `creature` SET `wander_distance` = 0, `movement_type` = 0 WHERE `guid` IN (89294, 86597);
UPDATE `creature` SET `position_x` = -8992.18, `position_y` = 859.027, `position_z` = 105.635 WHERE `guid` in (86596, 89294, 86597);
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(1413, 1, -8992.18, 859.027, 105.635, 100, 5000, 0, 141302),
(1413, 2, -8987.35, 852.659, 105.858, 100, 0, 0, 0),
(1413, 3, -8981.44, 849.407, 105.45, 100, 0, 0, 0),
(1413, 4, -8976.52, 854.349, 105.759, 100, 0, 0, 0),
(1413, 5, -8964.17, 861.494, 105.85, 100, 0, 0, 0),
(1413, 6, -8944.16, 861.552, 103.938, 100, 0, 0, 0),
(1413, 7, -8924.93, 857.888, 98.9587, 100, 0, 0, 0),
(1413, 8, -8911.99, 849.132, 96.3773, 100, 0, 0, 0),
(1413, 9, -8897.98, 861.054, 96.1721, 100, 0, 0, 0),
(1413, 10, -8894.06, 867.76, 97.6427, 100, 0, 0, 0),
(1413, 11, -8889.57, 882.693, 101.455, 100, 0, 0, 0),
(1413, 12, -8887.53, 894.155, 104.659, 100, 0, 0, 0),
(1413, 13, -8887.39, 895.123, 104.945, 100, 0, 0, 0),
(1413, 14, -8887.39, 895.123, 104.945, 100, 0, 0, 0),
(1413, 15, -8892.1, 905.552, 108.811, 100, 0, 0, 0),
(1413, 16, -8893.69, 909.069, 110.152, 100, 0, 0, 0),
(1413, 17, -8878.22, 920.672, 107.737, 100, 0, 0, 0),
(1413, 18, -8860.27, 930.71, 102.752, 100, 0, 0, 0),
(1413, 19, -8852.82, 931.701, 102.084, 100, 0, 0, 0),
(1413, 20, -8839.2, 937.39, 105.309, 100, 0, 0, 0),
(1413, 21, -8823.46, 949.317, 101.936, 100, 0, 0, 0),
(1413, 22, -8820.39, 951.719, 100.833, 100, 0, 0, 0),
(1413, 23, -8807.76, 945.114, 101.241, 100, 0, 0, 0),
(1413, 24, -8798.01, 932.212, 101.209, 100, 0, 0, 0),
(1413, 25, -8785.16, 916.084, 100.083, 100, 0, 0, 0),
(1413, 26, -8781.98, 912.184, 100.051, 100, 0, 0, 0),
(1413, 27, -8781.98, 912.184, 100.051, 100, 0, 0, 0),
(1413, 28, -8771.52, 899.881, 100.803, 100, 0, 0, 0),
(1413, 29, -8757.75, 892.457, 101.714, 100, 0, 0, 0),
(1413, 30, -8741.84, 893.232, 101.446, 100, 0, 0, 0),
(1413, 31, -8735.16, 889.69, 101.361, 100, 0, 0, 0),
(1413, 32, -8725.04, 877.22, 102.684, 100, 0, 0, 0),
(1413, 33, -8715.31, 864.97, 99.3783, 100, 0, 0, 0),
(1413, 34, -8712.45, 858.37, 97.0098, 100, 0, 0, 0),
(1413, 35, -8717.7, 848.065, 96.5434, 100, 0, 0, 0),
(1413, 36, -8725.84, 834.177, 96.1498, 100, 0, 0, 0),
(1413, 37, -8727, 818.369, 97.039, 100, 0, 0, 0),
(1413, 38, -8720.66, 802.783, 97.2072, 100, 0, 0, 0),
(1413, 39, -8720.66, 802.783, 97.2072, 100, 0, 0, 0),
(1413, 40, -8718.9, 799.156, 97.1275, 100, 0, 0, 0),
(1413, 41, -8718.09, 795.413, 96.9687, 100, 0, 0, 0),
(1413, 42, -8720.14, 787.599, 97.4173, 100, 0, 0, 0),
(1413, 43, -8730.3, 770.223, 98.1146, 100, 0, 0, 0),
(1413, 44, -8731.01, 762.63, 98.173, 100, 0, 0, 0),
(1413, 45, -8728.23, 755.644, 98.1843, 100, 0, 0, 0),
(1413, 46, -8718.69, 742.264, 97.8203, 100, 0, 0, 0),
(1413, 47, -8717.41, 738.992, 97.7998, 100, 0, 0, 0),
(1413, 48, -8725.55, 727.062, 100.594, 100, 0, 0, 0),
(1413, 49, -8741.12, 714.828, 99.0258, 100, 0, 0, 0),
(1413, 50, -8742.65, 711.734, 98.4812, 100, 0, 0, 0),
(1413, 51, -8740, 704.441, 98.6558, 100, 0, 0, 0),
(1413, 52, -8739.46, 700.919, 98.7405, 100, 0, 0, 0),
(1413, 53, -8750.26, 689.706, 100.174, 100, 0, 0, 0),
(1413, 54, -8770.15, 674.225, 102.771, 100, 0, 0, 0),
(1413, 55, -8773.31, 671.771, 103.092, 100, 0, 0, 0),
(1413, 56, -8773.65, 671.129, 103.092, 100, 0, 0, 0),
(1413, 57, -8773.65, 671.129, 103.092, 100, 0, 0, 0),
(1413, 58, -8770.41, 663.707, 103.432, 100, 0, 0, 0),
(1413, 59, -8762.89, 649.433, 103.732, 100, 0, 0, 0),
(1413, 60, -8760.23, 641.849, 103.57, 100, 0, 0, 0),
(1413, 61, -8759.03, 629.885, 102.34, 100, 0, 0, 0),
(1413, 62, -8763.17, 618.296, 99.0049, 100, 0, 0, 0),
(1413, 63, -8773.27, 606.275, 97.1872, 100, 0, 0, 0),
(1413, 64, -8788.91, 593.753, 97.5071, 100, 0, 0, 0),
(1413, 65, -8796.13, 591.648, 97.5045, 100, 0, 0, 0),
(1413, 66, -8807.29, 601.57, 96.4212, 100, 0, 0, 0),
(1413, 67, -8817.7, 613.879, 95.1609, 100, 0, 0, 0),
(1413, 68, -8829.9, 629.898, 94.1095, 100, 0, 0, 0),
(1413, 69, -8840.91, 643.266, 95.6745, 100, 0, 0, 0),
(1413, 70, -8840.91, 643.266, 95.6745, 100, 0, 0, 0),
(1413, 71, -8843.64, 646.411, 96.3192, 100, 0, 0, 0),
(1413, 72, -8848.13, 653.052, 96.8237, 100, 0, 0, 0),
(1413, 73, -8850.48, 660.404, 97.1616, 100, 0, 0, 0),
(1413, 74, -8842.59, 668.51, 97.8585, 100, 0, 0, 0),
(1413, 75, -8831.96, 674.408, 98.3446, 100, 0, 0, 0),
(1413, 76, -8828.22, 676.336, 97.7566, 100, 0, 0, 0),
(1413, 77, -8831.77, 694.226, 97.4518, 100, 0, 0, 0),
(1413, 78, -8840.92, 712.773, 97.559, 100, 0, 0, 0),
(1413, 79, -8844.86, 719.813, 97.3341, 100, 0, 0, 0),
(1413, 80, -8856.22, 740.659, 100.647, 100, 0, 0, 0),
(1413, 81, -8864.9, 754.068, 98.3243, 100, 0, 0, 0),
(1413, 82, -8870.25, 759.502, 96.9009, 100, 0, 0, 0),
(1413, 83, -8873.67, 759.233, 96.5771, 100, 0, 0, 0),
(1413, 84, -8876.77, 756.622, 96.3981, 100, 0, 0, 0),
(1413, 85, -8886.7, 762.597, 94.2014, 100, 0, 0, 0),
(1413, 86, -8886.7, 762.597, 94.2014, 100, 0, 0, 0),
(1413, 87, -8894.42, 771.944, 91.3347, 100, 0, 0, 0),
(1413, 88, -8904.53, 784.725, 88.5273, 100, 0, 0, 0),
(1413, 89, -8907.03, 787.907, 87.8516, 100, 0, 0, 0),
(1413, 90, -8919.81, 782.126, 87.3135, 100, 0, 0, 0),
(1413, 91, -8933.58, 774.239, 88.4461, 100, 0, 0, 0),
(1413, 92, -8945.09, 771.364, 90.5049, 100, 0, 0, 0),
(1413, 93, -8961.03, 772.111, 93.8477, 100, 0, 0, 0),
(1413, 94, -8971.25, 777.248, 95.9609, 100, 0, 0, 0),
(1413, 95, -8983.38, 788.449, 99.1967, 100, 0, 0, 0),
(1413, 96, -8990.12, 802.378, 102.665, 100, 0, 0, 0),
(1413, 97, -8993.38, 814.989, 103.877, 100, 0, 0, 0),
(1413, 98, -8993.38, 814.989, 103.877, 100, 0, 0, 0),
(1413, 99, -8992.66, 831.123, 105.34, 100, 0, 0, 0),
(1413, 100, -8991.16, 857.465, 105.746, 100, 0, 0, 0),
(1413, 101, -8992.18, 859.027, 105.635, 5.21853, 1800000, 0, 141301);

INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (141301, 1, 3, 0, 0, 0, 0, 1414, 10, 8, 2, 0, 0, 0, 0, -8989.6, 857.96, 105.623, 3.56047, 0, 'Lisan Pierce - Move');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (141301, 1, 3, 0, 0, 0, 0, 1415, 10, 8, 2, 0, 0, 0, 0, -8991.8, 856.143, 105.753, 1.23918, 0, 'Suzanne - Move');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (141301, 5, 28, 1, 0, 0, 0, 1414, 10, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lisan Pierce - Set Stand State');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (141301, 5, 28, 1, 0, 0, 0, 1415, 10, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Suzanne  - Set Stand State');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (141301, 5, 28, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Janey Anship - Set Stand State');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (141302, 0, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Janey Anship - Set Stand State');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (141302, 0, 28, 0, 0, 0, 0, 1415, 10, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Suzanne - Set Stand State');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (141302, 0, 28, 0, 0, 0, 0, 1414, 10, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lisan Pierce - Set Stand State');

-- Events list for Janey Anship
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry` = 1413;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (141301, 1413, 0, 1, 0, 100, 1, 60000, 60000, 60000, 60000, 141301, 0, 0, 'Janey Anship - Talk - OOC');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (141301, 0, 39, 141301, 141302, 0, 0, 0, 0, 0, 0, 50, 50, 0, 0, 0, 0, 0, 0, 0, 'Janey Anship - Start Script');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (141301, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 201, 203, 204, 205, 0, 0, 0, 0, 0, 'Janey Anship - Talk');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (141301, 5, 0, 0, 0, 0, 0, 1414, 10, 8, 2, 210, 211, 212, 213, 0, 0, 0, 0, 0, 'Lisan Pierce - Talk');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (141301, 8, 0, 0, 0, 0, 0, 1415, 10, 8, 2, 218, 219, 220, 221, 0, 0, 0, 0, 0, 'Suzanne - Talk');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (141302, 0, 0, 0, 0, 0, 0, 1414, 10, 8, 2, 206, 207, 208, 209, 0, 0, 0, 0, 0, 'Lisan Pierce - Talk');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (141302, 5, 0, 0, 0, 0, 0, 1415, 10, 8, 2, 214, 215, 216, 217, 0, 0, 0, 0, 0, 'Suzanne - Talk');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (141302, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 222, 223, 224, 225, 0, 0, 0, 0, 0, 'Janey Anship - Talk');

-- -----------------------------------------------------------------------------------------

-- Add Snarler Waypoints
UPDATE `creature` SET `position_x` = -4142.19, `position_y` = -423.252, `position_z` = 24.9747, `movement_type` = 2 WHERE `id` = 5356;
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(5356, 1, -4142.19, -423.252, 24.9747, 100, 0, 0, 0),
(5356, 2, -4145.7, -393.472, 35.8493, 100, 0, 0, 0),
(5356, 3, -4153.35, -369.855, 47.826, 100, 0, 0, 0),
(5356, 4, -4158.44, -355.944, 54.0496, 100, 0, 0, 0),
(5356, 5, -4168.28, -319.475, 58.0327, 100, 0, 0, 0),
(5356, 6, -4175, -292.348, 55.67, 100, 0, 0, 0),
(5356, 7, -4193.54, -274.789, 52.0208, 100, 0, 0, 0),
(5356, 8, -4214.44, -279.072, 43.9941, 100, 0, 0, 0),
(5356, 9, -4212.99, -263.449, 48.2295, 100, 0, 0, 0),
(5356, 10, -4197.5, -232.024, 54.9398, 100, 0, 0, 0),
(5356, 11, -4175.88, -203.194, 58.7209, 100, 0, 0, 0),
(5356, 12, -4182.99, -182.133, 57.8489, 100, 0, 0, 0),
(5356, 13, -4203.5, -147.809, 58.4159, 100, 0, 0, 0),
(5356, 14, -4185.34, -111.887, 59.8366, 100, 0, 0, 0),
(5356, 15, -4163.75, -83.3017, 56.5057, 100, 0, 0, 0),
(5356, 16, -4142.89, -54.1321, 58.8099, 100, 0, 0, 0),
(5356, 17, -4139.57, -22.6688, 57.1284, 100, 0, 0, 0),
(5356, 18, -4146.48, 24.9606, 58.4542, 100, 0, 0, 0),
(5356, 19, -4166.3, 72.8927, 57.1682, 100, 0, 0, 0),
(5356, 20, -4170.52, 112.552, 56.1258, 100, 0, 0, 0),
(5356, 21, -4158.12, 162.799, 58.5915, 100, 0, 0, 0),
(5356, 22, -4114.6, 181.278, 60.4693, 100, 0, 0, 0),
(5356, 23, -4069.28, 195.043, 58.6779, 100, 0, 0, 0),
(5356, 24, -4026.31, 228.288, 58.0024, 100, 0, 0, 0),
(5356, 25, -4060.11, 199.915, 57.3903, 100, 0, 0, 0),
(5356, 26, -4108.47, 183.286, 61.3805, 100, 0, 0, 0),
(5356, 27, -4153.34, 167.014, 58.6702, 100, 0, 0, 0),
(5356, 28, -4170.25, 119.481, 55.5661, 100, 0, 0, 0),
(5356, 29, -4167.58, 79.606, 57.6089, 100, 0, 0, 0),
(5356, 30, -4148.05, 31.6435, 58.4097, 100, 0, 0, 0),
(5356, 31, -4140.12, -15.9016, 56.5497, 100, 0, 0, 0),
(5356, 32, -4141.41, -47.7954, 59.2948, 100, 0, 0, 0),
(5356, 33, -4159.77, -78.0076, 56.2936, 100, 0, 0, 0),
(5356, 34, -4181.53, -106.443, 59.9593, 100, 0, 0, 0),
(5356, 35, -4203.33, -138.827, 57.9872, 100, 0, 0, 0),
(5356, 36, -4186.04, -176.073, 57.5805, 100, 0, 0, 0),
(5356, 37, -4176.17, -197.377, 57.0343, 100, 0, 0, 0),
(5356, 38, -4193.49, -226.107, 56.4164, 100, 0, 0, 0),
(5356, 39, -4209.16, -253.483, 51.3743, 100, 0, 0, 0),
(5356, 40, -4215.93, -275.508, 44.8289, 100, 0, 0, 0),
(5356, 41, -4199.4, -274.222, 49.4723, 100, 0, 0, 0),
(5356, 42, -4178.59, -287.217, 54.1218, 100, 0, 0, 0),
(5356, 43, -4168.96, -316.811, 58.0481, 100, 0, 0, 0),
(5356, 44, -4160.9, -347.617, 54.9743, 100, 0, 0, 0),
(5356, 45, -4147.27, -386.461, 40.1627, 100, 0, 0, 0),
(5356, 46, -4142.74, -418.413, 25.628, 100, 0, 0, 0),
(5356, 47, -4118.48, -447.891, 19.8953, 100, 0, 0, 0),
(5356, 48, -4106.68, -482.678, 12.4655, 100, 0, 0, 0),
(5356, 49, -4113.46, -456.848, 19.0156, 100, 0, 0, 0);

-- -----------------------------------------------------------------------------------------

-- Gnarl Leafbrother Correct Waypoints
DELETE FROM `creature_movement` WHERE `id` = 51842;
UPDATE `creature` SET `position_x` = -5074.64, `position_y` = 382.334, `position_z` = 12.3643 WHERE `id` = 5354;
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(5354, 1, -5074.64, 382.334, 12.3643, 100, 0, 0, 0),
(5354, 2, -5061.62, 346.072, 22.8781, 100, 0, 0, 0),
(5354, 3, -5062.88, 318.318, 24.3753, 100, 0, 0, 0),
(5354, 4, -5077.48, 296.145, 30.6872, 100, 0, 0, 0),
(5354, 5, -5094.98, 266.267, 40.7641, 100, 0, 0, 0),
(5354, 6, -5098.34, 219.73, 48.4327, 100, 0, 0, 0),
(5354, 7, -5097.78, 184, 51.7513, 100, 0, 0, 0),
(5354, 8, -5091.18, 138.173, 58.225, 100, 0, 0, 0),
(5354, 9, -5097.18, 177.114, 51.4141, 100, 0, 0, 0),
(5354, 10, -5098.39, 212.937, 49.8549, 100, 0, 0, 0),
(5354, 11, -5096.98, 259.85, 40.6962, 100, 0, 0, 0),
(5354, 12, -5081.39, 290.682, 32.5694, 100, 0, 0, 0),
(5354, 13, -5067.04, 308.754, 25.6239, 100, 0, 0, 0),
(5354, 14, -5061.11, 339.321, 24.4601, 100, 0, 0, 0),
(5354, 15, -5073.69, 379.633, 13.3633, 100, 0, 0, 0),
(5354, 16, -5090.09, 415.905, 11.0174, 100, 0, 0, 0),
(5354, 17, -5080.93, 445.346, 14.8141, 100, 0, 0, 0),
(5354, 18, -5056.84, 476.242, 12.4701, 100, 0, 0, 0),
(5354, 19, -5046.78, 517.301, 19.4991, 100, 0, 0, 0),
(5354, 20, -5046.83, 549.162, 19.666, 100, 0, 0, 0),
(5354, 21, -5042.96, 583.385, 30.3958, 100, 0, 0, 0),
(5354, 22, -5021.04, 615.831, 32.5593, 100, 0, 0, 0),
(5354, 23, -5017.21, 643.357, 34.6607, 100, 0, 0, 0),
(5354, 24, -5017.12, 678.899, 43.1892, 100, 0, 0, 0),
(5354, 25, -5038.04, 699.452, 47.7738, 100, 0, 0, 0),
(5354, 26, -5040.6, 719.204, 58.7576, 100, 0, 0, 0),
(5354, 27, -5028.71, 723.404, 64.3248, 100, 0, 0, 0),
(5354, 28, -5016.2, 729.962, 69.8525, 100, 0, 0, 0),
(5354, 29, -5016.05, 745.381, 77.1881, 100, 0, 0, 0),
(5354, 30, -5014.52, 734.915, 71.4298, 100, 0, 0, 0),
(5354, 31, -5019.59, 727.361, 66.8449, 100, 0, 0, 0),
(5354, 32, -5036.98, 722.399, 60.4771, 100, 0, 0, 0),
(5354, 33, -5040.21, 704.384, 49.7679, 100, 0, 0, 0),
(5354, 34, -5021.46, 687.16, 42.1963, 100, 0, 0, 0),
(5354, 35, -5016.81, 650.473, 35.7873, 100, 0, 0, 0),
(5354, 36, -5019.27, 622.637, 33.5584, 100, 0, 0, 0),
(5354, 37, -5040.02, 589.303, 32.575, 100, 0, 0, 0),
(5354, 38, -5046.35, 556.431, 20.6275, 100, 0, 0, 0),
(5354, 39, -5046.35, 524.739, 20.081, 100, 0, 0, 0),
(5354, 40, -5053.76, 482.315, 11.3621, 100, 0, 0, 0),
(5354, 41, -5077.47, 451.358, 15.9716, 100, 0, 0, 0),
(5354, 42, -5090.56, 422.281, 12.1893, 100, 0, 0, 0),
(5354, 43, -5076.26, 385.89, 11.3363, 100, 0, 0, 0);

-- -----------------------------------------------------------------------------------------

-- Add WPL Patrol
UPDATE `creature` SET `position_x` = 1854.4, `position_y` = -1337.17, `position_z` = 61.8205 WHERE `guid` IN (46760, 46761, 46762);
UPDATE `creature` SET `movement_type` = 2 WHERE `guid` = 46760;
INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES
(46760, 46760, 2, 6.25244, 11),
(46760, 46761, 4, 3.14, 11),
(46760, 46762, 2, 2.57, 11);
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(46760, 1, 1854.4, -1337.17, 61.8205, 100, 0, 0, 0),
(46760, 2, 1850.52, -1337.09, 62.3191, 100, 0, 0, 0),
(46760, 3, 1844.46, -1337.53, 62.8409, 100, 0, 0, 0),
(46760, 4, 1841.14, -1337.71, 63.0709, 100, 0, 0, 0),
(46760, 5, 1837.51, -1338.01, 62.9027, 100, 0, 0, 0),
(46760, 6, 1834.11, -1338.41, 62.7457, 100, 0, 0, 0),
(46760, 7, 1830.49, -1339.11, 62.4428, 100, 0, 0, 0),
(46760, 8, 1824.66, -1340.56, 61.982, 100, 0, 0, 0),
(46760, 9, 1821.52, -1341.4, 61.7829, 100, 0, 0, 0),
(46760, 10, 1818.31, -1342.29, 61.5869, 100, 0, 0, 0),
(46760, 11, 1814.8, -1343.27, 61.6701, 100, 0, 0, 0),
(46760, 12, 1810.89, -1344.36, 61.5573, 100, 0, 0, 0),
(46760, 13, 1807.16, -1345.38, 61.5537, 100, 0, 0, 0),
(46760, 14, 1801.25, -1346.84, 60.7837, 100, 0, 0, 0),
(46760, 15, 1798.05, -1347.44, 60.2343, 100, 0, 0, 0),
(46760, 16, 1794.72, -1347.95, 60.0605, 100, 0, 0, 0),
(46760, 17, 1791.02, -1348.49, 60.2168, 100, 0, 0, 0),
(46760, 18, 1784.95, -1349.43, 60.1554, 100, 0, 0, 0),
(46760, 19, 1781.66, -1349.89, 60.1839, 100, 0, 0, 0),
(46760, 20, 1778.62, -1350.33, 60.4584, 100, 0, 0, 0),
(46760, 21, 1775.19, -1350.83, 61.0089, 100, 0, 0, 0),
(46760, 22, 1769.2, -1351.76, 61.9005, 100, 0, 0, 0),
(46760, 23, 1766.06, -1352.19, 62.3379, 100, 0, 0, 0),
(46760, 24, 1762.75, -1352.63, 62.6149, 100, 0, 0, 0),
(46760, 25, 1759.22, -1353.16, 62.7902, 100, 0, 0, 0),
(46760, 26, 1753.25, -1354.23, 63.3207, 100, 0, 0, 0),
(46760, 27, 1750.12, -1354.75, 63.5153, 100, 0, 0, 0),
(46760, 28, 1746.83, -1355.32, 63.9704, 100, 0, 0, 0),
(46760, 29, 1743.26, -1355.96, 64.2442, 100, 0, 0, 0),
(46760, 30, 1737.39, -1357.21, 65.0046, 100, 0, 0, 0),
(46760, 31, 1734.62, -1357.61, 65.4665, 100, 0, 0, 0),
(46760, 32, 1731.22, -1358.18, 66.1764, 100, 0, 0, 0),
(46760, 33, 1727.57, -1358.82, 67.2252, 100, 0, 0, 0),
(46760, 34, 1723.83, -1359.47, 67.879, 100, 0, 0, 0),
(46760, 35, 1720.01, -1360.2, 68.1483, 100, 0, 0, 0),
(46760, 36, 1714.35, -1362.14, 68.8736, 100, 0, 0, 0),
(46760, 37, 1711.74, -1363.43, 68.8009, 100, 0, 0, 0),
(46760, 38, 1708.8, -1365.23, 68.6897, 100, 0, 0, 0),
(46760, 39, 1705.67, -1367.29, 68.5823, 100, 0, 0, 0),
(46760, 40, 1700.63, -1370.67, 68.8987, 100, 0, 0, 0),
(46760, 41, 1698.25, -1372.34, 69.1988, 100, 0, 0, 0),
(46760, 42, 1695.51, -1373.01, 69.3566, 100, 0, 0, 0),
(46760, 43, 1689.52, -1372.96, 69.4696, 100, 0, 0, 0),
(46760, 44, 1686.37, -1371.94, 69.5402, 100, 0, 0, 0),
(46760, 45, 1683.14, -1370.55, 69.8425, 100, 0, 0, 0),
(46760, 46, 1680.76, -1369.3, 69.8741, 100, 0, 0, 0),
(46760, 47, 1677.27, -1368.93, 69.8686, 100, 0, 0, 0),
(46760, 48, 1673.86, -1369.88, 69.737, 100, 0, 0, 0),
(46760, 49, 1668.42, -1372.64, 69.2586, 100, 0, 0, 0),
(46760, 50, 1665.95, -1374.42, 68.9316, 100, 0, 0, 0),
(46760, 51, 1663.11, -1376.55, 68.6751, 100, 0, 0, 0),
(46760, 52, 1660.08, -1378.8, 68.6362, 100, 0, 0, 0),
(46760, 53, 1655.09, -1382.4, 68.4398, 100, 0, 0, 0),
(46760, 54, 1652.65, -1384.1, 68.3425, 100, 0, 0, 0),
(46760, 55, 1649.74, -1386.02, 68.2609, 100, 0, 0, 0),
(46760, 56, 1646.57, -1388.07, 68.0459, 100, 0, 0, 0),
(46760, 57, 1641.41, -1391.39, 67.8412, 100, 0, 0, 0),
(46760, 58, 1638.93, -1392.99, 67.6897, 100, 0, 0, 0),
(46760, 59, 1636, -1394.87, 67.5612, 100, 0, 0, 0),
(46760, 60, 1632.79, -1396.73, 67.4276, 100, 0, 0, 0),
(46760, 61, 1627.41, -1399.54, 67.202, 100, 0, 0, 0),
(46760, 62, 1624.44, -1400.88, 66.9925, 100, 0, 0, 0),
(46760, 63, 1621.4, -1402.21, 66.8832, 100, 0, 0, 0),
(46760, 64, 1618.06, -1403.66, 66.7116, 100, 0, 0, 0),
(46760, 65, 1612.53, -1406.14, 66.1853, 100, 0, 0, 0),
(46760, 66, 1609.6, -1407.41, 65.9854, 100, 0, 0, 0),
(46760, 67, 1606.59, -1408.72, 65.7557, 100, 0, 0, 0),
(46760, 68, 1603.19, -1410, 65.7914, 100, 0, 0, 0),
(46760, 69, 1599.54, -1411.2, 65.7936, 100, 0, 0, 0),
(46760, 70, 1593.78, -1413.08, 65.7933, 100, 0, 0, 0),
(46760, 71, 1590.87, -1413.88, 65.8173, 100, 0, 0, 0),
(46760, 72, 1587.33, -1414.91, 65.7541, 100, 0, 0, 0),
(46760, 73, 1584.02, -1416.25, 65.7315, 100, 0, 0, 0),
(46760, 74, 1584.02, -1416.25, 65.7315, 100, 0, 0, 0),
(46760, 75, 1578.43, -1419.19, 65.588, 100, 0, 0, 0),
(46760, 76, 1574.47, -1421.64, 65.4985, 100, 0, 0, 0),
(46760, 77, 1569.32, -1424.88, 65.4292, 100, 0, 0, 0),
(46760, 78, 1566.37, -1426.83, 65.402, 100, 0, 0, 0),
(46760, 79, 1563.27, -1428.72, 65.3957, 100, 0, 0, 0),
(46760, 80, 1558.71, -1432.98, 65.4111, 100, 0, 0, 0),
(46760, 81, 1535.3, -1441.72, 64.2805, 100, 0, 0, 0),
(46760, 82, 1531.69, -1444.22, 64.0883, 100, 0, 0, 0),
(46760, 83, 1508.44, -1455.88, 62.1292, 100, 0, 0, 0),
(46760, 84, 1503.99, -1457.67, 61.6657, 100, 0, 0, 0),
(46760, 85, 1499.95, -1458.82, 61.3714, 100, 0, 0, 0),
(46760, 86, 1495.92, -1459.72, 60.9847, 100, 0, 0, 0),
(46760, 87, 1492, -1460.61, 60.4977, 100, 0, 0, 0),
(46760, 88, 1488.03, -1461.16, 59.9993, 100, 0, 0, 0),
(46760, 89, 1483.97, -1461.38, 59.6609, 100, 0, 0, 0),
(46760, 90, 1479.87, -1461.35, 59.2836, 100, 0, 0, 0),
(46760, 91, 1475.9, -1461.44, 58.8786, 100, 0, 0, 0),
(46760, 92, 1471.83, -1461.46, 58.5774, 100, 0, 0, 0),
(46760, 93, 1467.77, -1461.43, 58.1185, 100, 0, 0, 0),
(46760, 94, 1463.77, -1461.38, 57.5565, 100, 0, 0, 0),
(46760, 95, 1459.75, -1461.45, 57.0551, 100, 0, 0, 0),
(46760, 96, 1455.74, -1461.47, 56.5553, 100, 0, 0, 0),
(46760, 97, 1451.75, -1461.48, 55.9336, 100, 0, 0, 0),
(46760, 98, 1447.7, -1461.45, 55.4264, 100, 0, 0, 0),
(46760, 99, 1443.68, -1461.5, 54.931, 100, 0, 0, 0),
(46760, 100, 1439.61, -1461.52, 54.676, 100, 0, 0, 0),
(46760, 101, 1435.54, -1461.54, 54.3741, 100, 0, 0, 0),
(46760, 102, 1431.48, -1461.49, 54.1483, 100, 0, 0, 0),
(46760, 103, 1429.47, -1461.47, 54.0895, 100, 0, 0, 0),
(46760, 104, 1429.47, -1461.47, 54.0895, 100, 0, 0, 0),
(46760, 105, 1426.09, -1459.96, 53.9645, 100, 0, 0, 0),
(46760, 106, 1426.51, -1460.04, 53.9645, 100, 0, 0, 0),
(46760, 107, 1427.36, -1461.15, 53.9645, 100, 5000, 0, 46760);
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (46760, 0, 20, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Hunter - Set Movement Type');

-- -----------------------------------------------------------------------------------------

-- Add Sentinel Amarassan Waypoints
UPDATE `creature` SET `position_x` = 2413.89, `position_y` = 1675.03, `position_z` = 316.675, `movement_type` = 2, `wander_distance` = 0 WHERE `id` = 5916;
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(5916, 1, 2413.89, 1675.03, 316.675, 100, 0, 0, 0),
(5916, 2, 2421.39, 1677.82, 315.579, 100, 0, 0, 0),
(5916, 3, 2432.04, 1689.19, 316.338, 100, 0, 0, 0),
(5916, 4, 2442.65, 1705.27, 321.744, 100, 0, 0, 0),
(5916, 5, 2443.22, 1724.82, 335.125, 100, 0, 0, 0),
(5916, 6, 2440.24, 1736.66, 344.848, 100, 0, 0, 0),
(5916, 7, 2438.24, 1751.78, 357.654, 100, 0, 0, 0),
(5916, 8, 2438.29, 1763.59, 368.378, 100, 0, 0, 0),
(5916, 9, 2426.11, 1778.25, 383.437, 100, 0, 0, 0),
(5916, 10, 2437.21, 1767.02, 371.244, 100, 0, 0, 0),
(5916, 11, 2438.15, 1755.77, 360.951, 100, 0, 0, 0),
(5916, 12, 2438.74, 1743.72, 350.708, 100, 0, 0, 0),
(5916, 13, 2441.64, 1732.33, 340.48, 100, 0, 0, 0),
(5916, 14, 2443.99, 1709.96, 323.978, 100, 0, 0, 0),
(5916, 15, 2442.65, 1705.27, 321.744, 100, 0, 0, 0),
(5916, 16, 2432.04, 1689.19, 316.338, 100, 0, 0, 0),
(5916, 17, 2421.39, 1677.82, 315.579, 100, 0, 0, 0),
(5916, 18, 2413.89, 1675.03, 316.675, 100, 0, 0, 0),
(5916, 19, 2409.46, 1672.53, 316.767, 100, 0, 0, 0),
(5916, 20, 2388.61, 1660.39, 316.765, 100, 0, 0, 0),
(5916, 21, 2378.54, 1654.27, 314.059, 100, 0, 0, 0),
(5916, 22, 2368.4, 1648.76, 310.542, 100, 0, 0, 0),
(5916, 23, 2358.37, 1643.31, 307.307, 100, 0, 0, 0),
(5916, 24, 2345.91, 1635.96, 301.219, 100, 0, 0, 0),
(5916, 25, 2339.18, 1628.05, 295.862, 100, 0, 0, 0),
(5916, 26, 2334.99, 1613.84, 290.247, 100, 0, 0, 0),
(5916, 27, 2333.4, 1606.09, 288.732, 100, 0, 0, 0),
(5916, 28, 2328.57, 1593.41, 286.436, 100, 0, 0, 0),
(5916, 29, 2324.94, 1586.21, 285.475, 100, 0, 0, 0),
(5916, 30, 2324.99, 1570.78, 282.693, 100, 0, 0, 0),
(5916, 31, 2331.96, 1551.97, 283.218, 100, 0, 0, 0),
(5916, 32, 2338.28, 1537.03, 283.134, 100, 0, 0, 0),
(5916, 33, 2342.41, 1525.88, 281.24, 100, 0, 0, 0),
(5916, 34, 2358.65, 1516.22, 279.813, 100, 0, 0, 0),
(5916, 35, 2365.36, 1512.02, 278.8, 100, 0, 0, 0),
(5916, 36, 2371.55, 1502.26, 278.186, 100, 0, 0, 0),
(5916, 37, 2378.09, 1487.72, 275.72, 100, 0, 0, 0),
(5916, 38, 2384.01, 1477.21, 274.993, 100, 0, 0, 0),
(5916, 39, 2388.68, 1470.63, 274.126, 100, 0, 0, 0),
(5916, 40, 2393.78, 1464.66, 272.488, 100, 0, 0, 0),
(5916, 41, 2398.67, 1458.31, 271.582, 100, 0, 0, 0),
(5916, 42, 2407.53, 1450.92, 269.655, 100, 0, 0, 0),
(5916, 43, 2415.25, 1449.29, 268.023, 100, 0, 0, 0),
(5916, 44, 2419.21, 1449.14, 267.466, 100, 0, 0, 0),
(5916, 45, 2431.17, 1451.44, 266.68, 100, 0, 0, 0),
(5916, 46, 2439.02, 1453.41, 266.085, 100, 0, 0, 0),
(5916, 47, 2449.45, 1452.83, 265.977, 100, 0, 0, 0),
(5916, 48, 2445.52, 1453.77, 265.982, 100, 0, 0, 0),
(5916, 49, 2437.63, 1453.05, 266.203, 100, 0, 0, 0),
(5916, 50, 2429.81, 1451.12, 266.797, 100, 0, 0, 0),
(5916, 51, 2421.91, 1449.49, 267.17, 100, 0, 0, 0),
(5916, 52, 2413.92, 1449.47, 268.248, 100, 0, 0, 0),
(5916, 53, 2406.32, 1451.48, 269.845, 100, 0, 0, 0),
(5916, 54, 2397.97, 1459.4, 271.756, 100, 0, 0, 0),
(5916, 55, 2392.92, 1465.63, 272.857, 100, 0, 0, 0),
(5916, 56, 2387.88, 1471.65, 274.382, 100, 0, 0, 0),
(5916, 57, 2381.37, 1481.86, 275.451, 100, 0, 0, 0),
(5916, 58, 2375.49, 1492.51, 276.274, 100, 0, 0, 0),
(5916, 59, 2371.15, 1503.58, 278.426, 100, 0, 0, 0),
(5916, 60, 2364.25, 1512.91, 278.906, 100, 0, 0, 0),
(5916, 61, 2345.98, 1521, 281.162, 100, 0, 0, 0),
(5916, 62, 2340.55, 1531.06, 281.768, 100, 0, 0, 0),
(5916, 63, 2336.11, 1542.18, 283.631, 100, 0, 0, 0),
(5916, 64, 2326.62, 1564.51, 282.14, 100, 0, 0, 0),
(5916, 65, 2323.76, 1580.12, 284.677, 100, 0, 0, 0),
(5916, 66, 2327.46, 1591.21, 286.184, 100, 0, 0, 0),
(5916, 67, 2333.4, 1606.09, 288.732, 100, 0, 0, 0),
(5916, 68, 2334.99, 1613.84, 290.247, 100, 0, 0, 0),
(5916, 69, 2339.18, 1628.05, 295.862, 100, 0, 0, 0),
(5916, 70, 2345.91, 1635.96, 301.219, 100, 0, 0, 0),
(5916, 71, 2358.37, 1643.31, 307.307, 100, 0, 0, 0),
(5916, 72, 2368.4, 1648.76, 310.542, 100, 0, 0, 0),
(5916, 73, 2378.54, 1654.27, 314.059, 100, 0, 0, 0),
(5916, 74, 2388.61, 1660.39, 316.765, 100, 0, 0, 0),
(5916, 75, 2409.46, 1672.53, 316.767, 100, 0, 0, 0);

-- -----------------------------------------------------------------------------------------

-- Update Bingles Blastenheimer Template
UPDATE `creature_template` SET `faction` = 55, `unit_flags` = 512 WHERE `entry`=6577;

-- -----------------------------------------------------------------------------------------

-- Update Lord Azrethoc
DELETE FROM `creature_movement` WHERE `id` = 29062;
DELETE FROM `creature_movement_template` WHERE `entry` = 5760;
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(5760, 1, -1868.5, 1700.33, 61.2578, 100, 0, 0, 0),
(5760, 2, -1861.79, 1690.23, 61.5172, 100, 0, 0, 0),
(5760, 3, -1860.74, 1678.82, 62.0185, 100, 0, 0, 0),
(5760, 4, -1874.85, 1667.6, 61.5244, 100, 0, 0, 0),
(5760, 5, -1898.69, 1664.82, 61.2599, 100, 0, 0, 0),
(5760, 6, -1917.5, 1658.15, 61.2361, 100, 0, 0, 0),
(5760, 7, -1924.02, 1644.39, 61.7361, 100, 0, 0, 0),
(5760, 8, -1920.78, 1628.89, 61.4167, 100, 0, 0, 0),
(5760, 9, -1899.25, 1590.18, 61.0304, 100, 0, 0, 0),
(5760, 10, -1893.36, 1585.24, 61.5333, 100, 0, 0, 0),
(5760, 11, -1890.08, 1583.42, 62.7493, 100, 0, 0, 0),
(5760, 12, -1888.48, 1574.03, 67.3806, 100, 15000, 0, 57601),
(5760, 13, -1877.01, 1573.24, 62.3037, 100, 0, 0, 0),
(5760, 14, -1852.13, 1576.27, 61.4124, 100, 0, 0, 0),
(5760, 15, -1819.14, 1593.31, 61.3124, 100, 0, 0, 57602),
(5760, 16, -1816.92, 1601.07, 61.5146, 100, 0, 0, 0),
(5760, 17, -1809.79, 1619.94, 61.2259, 100, 0, 0, 0),
(5760, 18, -1812.4, 1635.26, 61.2405, 100, 0, 0, 0),
(5760, 19, -1806.51, 1653.54, 61.2571, 100, 0, 0, 0),
(5760, 20, -1801.35, 1664.44, 61.2544, 100, 0, 0, 0),
(5760, 21, -1780.53, 1673.01, 61.7519, 100, 0, 0, 0),
(5760, 22, -1754.19, 1654.37, 70.7089, 100, 0, 0, 0),
(5760, 23, -1746.88, 1652.28, 74.7238, 100, 10000, 0, 57601),
(5760, 24, -1735.37, 1651.65, 69.4952, 100, 0, 0, 0),
(5760, 25, -1716.69, 1660.84, 62.3143, 100, 0, 0, 0),
(5760, 26, -1713.36, 1693.96, 61.0796, 100, 0, 0, 57602),
(5760, 27, -1716.03, 1701.7, 61.5953, 100, 0, 0, 0),
(5760, 28, -1722.26, 1711.2, 64.5297, 100, 0, 0, 0),
(5760, 29, -1728.62, 1714.9, 66.2689, 100, 0, 0, 0),
(5760, 30, -1736.61, 1723.08, 71.2305, 0.750492, 20000, 0, 57601),
(5760, 31, -1736.61, 1723.08, 71.2305, 100, 0, 0, 0),
(5760, 32, -1745.79, 1717.01, 67.6897, 100, 0, 0, 0),
(5760, 33, -1760.39, 1699.42, 62.5874, 100, 0, 0, 0),
(5760, 34, -1763.74, 1687.73, 61.6909, 100, 0, 0, 0),
(5760, 35, -1786.28, 1675.35, 62.0045, 100, 0, 0, 0),
(5760, 36, -1798.33, 1672, 61.3117, 100, 0, 0, 0),
(5760, 37, -1823.5, 1674.61, 61.8829, 100, 0, 0, 57602),
(5760, 38, -1827.48, 1674.13, 61.5692, 100, 0, 0, 0),
(5760, 39, -1839.08, 1675.99, 61.3097, 100, 0, 0, 0),
(5760, 40, -1852.29, 1684.86, 61.6812, 100, 0, 0, 0);
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (57601, 0, 25, 1, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lord Azrethoc - Run');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (57602, 0, 25, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lord Azrethoc - Walk');

-- -----------------------------------------------------------------------------------------

-- Convert Another Patrol to Use Groups
UPDATE `creature` SET `position_x` = -8760.26, `position_y` = 1130.4, `position_z` = 92.521 WHERE `guid` = 90482;
DELETE FROM `creature_movement_template` WHERE `entry` = 11828;
DELETE FROM `creature_movement` WHERE `id` IN (90481, 90482);
UPDATE `creature` SET `movement_type` = 0 WHERE `guid` = 90481;
INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES
(90482, 90482, 1, 6.25244, 11),
(90482, 90481, 1, 4.71, 11);
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`) VALUES
(11828, 1, -8760.26, 1130.4, 92.521, 100, 0, 0),
(11828, 2, -8763.2, 1128.62, 92.5326, 100, 0, 0),
(11828, 3, -8766.71, 1126.8, 92.5365, 100, 0, 0),
(11828, 4, -8771.03, 1125.31, 92.5328, 100, 0, 0),
(11828, 5, -8774.52, 1126.97, 92.523, 100, 0, 0),
(11828, 6, -8777.83, 1129.28, 92.2961, 100, 0, 0),
(11828, 7, -8781.07, 1131.7, 91.6685, 100, 0, 0),
(11828, 8, -8784.08, 1133.99, 90.7809, 100, 0, 0),
(11828, 9, -8787.2, 1136.37, 90.7803, 100, 0, 0),
(11828, 10, -8788.09, 1134.55, 90.7803, 100, 0, 0),
(11828, 11, -8789.13, 1131.53, 90.7803, 100, 0, 0),
(11828, 12, -8790.39, 1127.85, 90.7803, 100, 0, 0),
(11828, 13, -8791.7, 1124.02, 90.7803, 100, 0, 0),
(11828, 14, -8793.05, 1120.08, 90.4783, 100, 0, 0),
(11828, 15, -8794.35, 1116.3, 90.5195, 100, 0, 0),
(11828, 16, -8795.4, 1112.89, 90.6021, 100, 0, 0),
(11828, 17, -8794.98, 1109.05, 90.737, 100, 0, 0),
(11828, 18, -8794.25, 1105.11, 90.7803, 100, 0, 0),
(11828, 19, -8793.46, 1101.16, 90.7803, 100, 0, 0),
(11828, 20, -8792.65, 1097.2, 90.7803, 100, 0, 0),
(11828, 21, -8791.84, 1093.23, 90.7759, 100, 0, 0),
(11828, 22, -8791.03, 1089.27, 90.5079, 100, 0, 0),
(11828, 23, -8790.22, 1085.34, 90.433, 100, 0, 0),
(11828, 24, -8788.26, 1082.35, 90.5933, 100, 0, 0),
(11828, 25, -8785.8, 1079.26, 90.7818, 100, 0, 0),
(11828, 26, -8783.22, 1076.14, 90.7806, 100, 0, 0),
(11828, 27, -8780.63, 1073.02, 90.7803, 100, 0, 0),
(11828, 28, -8778, 1069.87, 90.7803, 100, 0, 0),
(11828, 29, -8775.15, 1068.51, 90.7757, 100, 0, 0),
(11828, 30, -8771.39, 1067.55, 90.7355, 100, 0, 0),
(11828, 31, -8767.44, 1066.67, 90.7803, 100, 0, 0),
(11828, 32, -8763.45, 1065.8, 90.7803, 100, 0, 0),
(11828, 33, -8759.46, 1064.94, 90.7247, 100, 0, 0),
(11828, 34, -8757.01, 1064.42, 90.6301, 100, 0, 0),
(11828, 35, -8757.01, 1064.42, 90.6301, 100, 0, 0),
(11828, 36, -8760.49, 1065.16, 90.7648, 100, 0, 0),
(11828, 37, -8764.6, 1064.45, 90.7803, 100, 0, 0),
(11828, 38, -8768.63, 1064.96, 90.7803, 100, 0, 0),
(11828, 39, -8772.58, 1065.74, 90.7803, 100, 0, 0),
(11828, 40, -8776.67, 1066.6, 90.7803, 100, 0, 0),
(11828, 41, -8779.54, 1068.9, 90.7803, 100, 0, 0),
(11828, 42, -8782.3, 1071.97, 90.7803, 100, 0, 0),
(11828, 43, -8785.02, 1075.18, 90.7803, 100, 0, 0),
(11828, 44, -8787.74, 1078.43, 90.7483, 100, 0, 0),
(11828, 45, -8790.45, 1081.68, 90.5466, 100, 0, 0),
(11828, 46, -8792.1, 1085.65, 90.3534, 100, 0, 0),
(11828, 47, -8793.09, 1089.59, 90.3739, 100, 0, 0),
(11828, 48, -8793.99, 1093.8, 90.7368, 100, 0, 0),
(11828, 49, -8794.77, 1097.56, 90.7803, 100, 0, 0),
(11828, 50, -8795.58, 1101.5, 90.7803, 100, 0, 0),
(11828, 51, -8796.39, 1105.45, 90.7803, 100, 0, 0),
(11828, 52, -8797.2, 1109.42, 90.7095, 100, 0, 0),
(11828, 53, -8797.02, 1113.68, 90.5344, 100, 0, 0),
(11828, 54, -8795.94, 1117.61, 90.4357, 100, 0, 0),
(11828, 55, -8794.68, 1121.46, 90.4508, 100, 0, 0),
(11828, 56, -8793.37, 1125.33, 90.7497, 100, 0, 0),
(11828, 57, -8792.07, 1129.14, 90.7803, 100, 0, 0),
(11828, 58, -8790.69, 1133.16, 90.7803, 100, 0, 0),
(11828, 59, -8789.43, 1136.84, 90.7803, 100, 0, 0),
(11828, 60, -8785.65, 1136.92, 90.7803, 100, 0, 0),
(11828, 61, -8782.51, 1135.14, 90.8562, 100, 0, 0),
(11828, 62, -8779.32, 1132.84, 91.8061, 100, 0, 0),
(11828, 63, -8776.08, 1130.39, 92.3481, 100, 0, 0),
(11828, 64, -8772.8, 1127.9, 92.5332, 100, 0, 0),
(11828, 65, -8770.25, 1127.66, 92.5291, 100, 0, 0),
(11828, 66, -8766.8, 1129.06, 92.5325, 100, 0, 0),
(11828, 67, -8763.15, 1130.82, 92.5329, 100, 0, 0),
(11828, 68, -8758.9, 1131.41, 92.5267, 100, 0, 0),
(11828, 69, -8754.92, 1130.29, 92.5369, 100, 0, 0),
(11828, 70, -8751.37, 1128.97, 92.535, 100, 0, 0),
(11828, 71, -8747.54, 1127.46, 92.5432, 100, 0, 0),
(11828, 72, -8743.47, 1125.32, 92.5471, 100, 0, 0),
(11828, 73, -8740.53, 1122.91, 92.5353, 100, 0, 0),
(11828, 74, -8737.51, 1120.28, 92.5203, 100, 0, 0),
(11828, 75, -8734.46, 1117.6, 92.5378, 100, 0, 0),
(11828, 76, -8732.21, 1113.81, 92.5326, 100, 0, 0),
(11828, 77, -8731.87, 1109.66, 92.5325, 100, 0, 0),
(11828, 78, -8731.9, 1105.29, 92.5333, 100, 0, 0),
(11828, 79, -8732.47, 1101.06, 92.5357, 100, 0, 0),
(11828, 80, -8734.28, 1097.41, 92.5353, 100, 0, 0),
(11828, 81, -8736.31, 1093.94, 92.5324, 100, 0, 0),
(11828, 82, -8735.9, 1091.13, 92.5239, 100, 0, 0),
(11828, 83, -8734.43, 1087.66, 92.3907, 100, 0, 0),
(11828, 84, -8732.73, 1084.05, 91.8957, 100, 0, 0),
(11828, 85, -8730.85, 1080.8, 91.0779, 100, 0, 0),
(11828, 86, -8728.44, 1077.74, 90.7707, 100, 0, 0),
(11828, 87, -8727.65, 1079.41, 90.7845, 100, 0, 0),
(11828, 88, -8726.31, 1082.34, 90.7803, 100, 0, 0),
(11828, 89, -8724.68, 1085.91, 90.7803, 100, 0, 0),
(11828, 90, -8723.3, 1089.35, 90.6736, 100, 0, 0),
(11828, 91, -8721.96, 1093.15, 90.5134, 100, 0, 0),
(11828, 92, -8720.61, 1097.03, 90.3501, 100, 0, 0),
(11828, 93, -8719.28, 1100.91, 90.2748, 100, 0, 0),
(11828, 94, -8717.94, 1104.81, 90.3954, 100, 0, 0),
(11828, 95, -8717.53, 1108.04, 90.5143, 100, 0, 0),
(11828, 96, -8718.12, 1111.9, 90.6804, 100, 0, 0),
(11828, 97, -8718.92, 1115.9, 90.7803, 100, 0, 0),
(11828, 98, -8719.77, 1119.91, 90.7803, 100, 0, 0),
(11828, 99, -8720.63, 1123.94, 90.7803, 100, 0, 0),
(11828, 100, -8721.61, 1127.29, 90.7803, 100, 0, 0),
(11828, 101, -8724.04, 1130.28, 90.7069, 100, 0, 0),
(11828, 102, -8726.8, 1133.22, 90.5544, 100, 0, 0),
(11828, 103, -8729.63, 1136.15, 90.4026, 100, 0, 0),
(11828, 104, -8732.23, 1138.62, 90.2692, 100, 0, 0),
(11828, 105, -8735.57, 1140.31, 90.2257, 100, 0, 0),
(11828, 106, -8739.29, 1141.93, 90.2376, 100, 0, 0),
(11828, 107, -8743.08, 1143.54, 90.2376, 100, 0, 0),
(11828, 108, -8746.91, 1145.14, 90.2376, 100, 0, 0),
(11828, 109, -8750.62, 1146.7, 90.3267, 100, 0, 0),
(11828, 110, -8754.12, 1146.91, 90.4542, 100, 0, 0),
(11828, 111, -8758.04, 1146.58, 90.604, 100, 0, 0),
(11828, 112, -8762.26, 1146.11, 90.7654, 100, 0, 0),
(11828, 113, -8766.12, 1145.65, 90.7814, 100, 0, 0),
(11828, 114, -8770.13, 1145.18, 90.7803, 100, 0, 0),
(11828, 115, -8773.76, 1144.18, 90.7803, 100, 0, 0),
(11828, 116, -8777.46, 1142.36, 90.7803, 100, 0, 0),
(11828, 117, -8781.14, 1140.38, 90.7803, 100, 0, 0),
(11828, 118, -8784.82, 1138.35, 90.7803, 100, 0, 0),
(11828, 119, -8788.51, 1136.32, 90.7803, 100, 0, 0),
(11828, 120, -8791.98, 1134.41, 90.7803, 100, 0, 0),
(11828, 121, -8793.53, 1131.46, 90.7803, 100, 0, 0),
(11828, 122, -8794.99, 1127.84, 90.7803, 100, 0, 0),
(11828, 123, -8796.42, 1124.07, 90.4823, 100, 0, 0),
(11828, 124, -8797.86, 1120.27, 90.3122, 100, 0, 0),
(11828, 125, -8798.57, 1116.84, 90.4728, 100, 0, 0),
(11828, 126, -8798.23, 1112.95, 90.6213, 100, 0, 0),
(11828, 127, -8797.66, 1108.9, 90.7616, 100, 0, 0),
(11828, 128, -8797.06, 1104.95, 90.7803, 100, 0, 0),
(11828, 129, -8796.33, 1101.04, 90.7803, 100, 0, 0),
(11828, 130, -8795.42, 1097.12, 90.7803, 100, 0, 0),
(11828, 131, -8794.49, 1093.18, 90.6558, 100, 0, 0),
(11828, 132, -8793.51, 1089.13, 90.3115, 100, 0, 0),
(11828, 133, -8791.83, 1085.91, 90.3607, 100, 0, 0),
(11828, 134, -8789.8, 1082.5, 90.5387, 100, 0, 0),
(11828, 135, -8787.71, 1079.04, 90.728, 100, 0, 0),
(11828, 136, -8785.61, 1075.59, 90.7806, 100, 0, 0),
(11828, 137, -8783.5, 1072.12, 90.7803, 100, 0, 0),
(11828, 138, -8780.73, 1069.97, 90.7803, 100, 0, 0),
(11828, 139, -8777.08, 1068.09, 90.7803, 100, 0, 0),
(11828, 140, -8773.89, 1066.6, 90.7803, 100, 0, 0),
(11828, 141, -8770.19, 1064.9, 90.7803, 100, 0, 0),
(11828, 142, -8766.91, 1063.7, 90.7803, 100, 0, 0),
(11828, 143, -8763.04, 1063.8, 90.7803, 100, 0, 0),
(11828, 144, -8759.1, 1064.18, 90.7069, 100, 0, 0),
(11828, 145, -8754.81, 1064.65, 90.5487, 100, 0, 0),
(11828, 146, -8750.99, 1065.08, 90.289, 100, 0, 0),
(11828, 147, -8748.19, 1065.4, 90.0831, 100, 0, 0),
(11828, 148, -8748.19, 1065.4, 90.0831, 100, 0, 0),
(11828, 149, -8751.61, 1065.02, 90.3349, 100, 0, 0),
(11828, 150, -8755.36, 1062.99, 90.5603, 100, 0, 0),
(11828, 151, -8759.31, 1062.21, 90.7039, 100, 0, 0),
(11828, 152, -8763.28, 1061.69, 90.7803, 100, 0, 0),
(11828, 153, -8767.68, 1061.99, 90.7803, 100, 0, 0),
(11828, 154, -8771.63, 1063.45, 90.7803, 100, 0, 0),
(11828, 155, -8775.5, 1065.15, 90.7803, 100, 0, 0),
(11828, 156, -8778.77, 1066.64, 90.7803, 100, 0, 0),
(11828, 157, -8782.31, 1068.26, 90.7803, 100, 0, 0),
(11828, 158, -8785.21, 1071.48, 90.7803, 100, 0, 0),
(11828, 159, -8787.49, 1074.91, 90.7803, 100, 0, 0),
(11828, 160, -8789.64, 1078.37, 90.6915, 100, 0, 0),
(11828, 161, -8791.76, 1081.83, 90.4995, 100, 0, 0),
(11828, 162, -8793.88, 1085.31, 90.3083, 100, 0, 0),
(11828, 163, -8795.42, 1089.23, 90.3811, 100, 0, 0),
(11828, 164, -8796.5, 1093.16, 90.6689, 100, 0, 0),
(11828, 165, -8797.47, 1097.09, 90.7779, 100, 0, 0),
(11828, 166, -8798.4, 1101.09, 90.7803, 100, 0, 0),
(11828, 167, -8799.09, 1105.1, 90.7803, 100, 0, 0),
(11828, 168, -8799.72, 1109.11, 90.7803, 100, 0, 0),
(11828, 169, -8800.35, 1113.12, 90.7498, 100, 0, 0),
(11828, 170, -8800.56, 1117.48, 90.5727, 100, 0, 0),
(11828, 171, -8799.45, 1121.48, 90.326, 100, 0, 0),
(11828, 172, -8798.12, 1125.22, 90.6025, 100, 0, 0),
(11828, 173, -8796.71, 1129.02, 90.7827, 100, 0, 0),
(11828, 174, -8795.28, 1132.83, 90.7827, 100, 0, 0),
(11828, 175, -8792.94, 1135.73, 90.7803, 100, 0, 0),
(11828, 176, -8789.53, 1137.95, 90.7803, 100, 0, 0),
(11828, 177, -8785.89, 1140.04, 90.7803, 100, 0, 0),
(11828, 178, -8782.21, 1142.08, 90.7803, 100, 0, 0),
(11828, 179, -8778.52, 1144.12, 90.7803, 100, 0, 0),
(11828, 180, -8775.03, 1146.05, 90.7803, 100, 0, 0),
(11828, 181, -8770.79, 1147, 90.7803, 100, 0, 0),
(11828, 182, -8766.71, 1147.57, 90.7803, 100, 0, 0),
(11828, 183, -8762.69, 1148.07, 90.7803, 100, 0, 0),
(11828, 184, -8758.66, 1148.55, 90.7033, 100, 0, 0),
(11828, 185, -8754.64, 1149.03, 90.61, 100, 0, 0),
(11828, 186, -8750.3, 1148.41, 90.4146, 100, 0, 0),
(11828, 187, -8746.37, 1147.02, 90.2729, 100, 0, 0),
(11828, 188, -8742.54, 1145.46, 90.2813, 100, 0, 0),
(11828, 189, -8738.73, 1143.88, 90.2581, 100, 0, 0),
(11828, 190, -8734.9, 1142.28, 90.2344, 100, 0, 0),
(11828, 191, -8731.38, 1140.36, 90.2533, 100, 0, 0),
(11828, 192, -8728.33, 1137.59, 90.3951, 100, 0, 0),
(11828, 193, -8725.38, 1134.64, 90.5504, 100, 0, 0),
(11828, 194, -8722.45, 1131.64, 90.7064, 100, 0, 0),
(11828, 195, -8719.99, 1128.33, 90.7808, 100, 0, 0),
(11828, 196, -8718.79, 1124.42, 90.7803, 100, 0, 0),
(11828, 197, -8717.85, 1120.4, 90.7803, 100, 0, 0),
(11828, 198, -8716.96, 1116.32, 90.7803, 100, 0, 0),
(11828, 199, -8716.09, 1112.24, 90.6774, 100, 0, 0),
(11828, 200, -8715.3, 1108.57, 90.5203, 100, 0, 0),
(11828, 201, -8716.13, 1104.4, 90.3947, 100, 0, 0),
(11828, 202, -8717.37, 1100.42, 90.2721, 100, 0, 0),
(11828, 203, -8718.69, 1096.48, 90.3568, 100, 0, 0),
(11828, 204, -8720.04, 1092.55, 90.522, 100, 0, 0),
(11828, 205, -8721.39, 1088.6, 90.6881, 100, 0, 0),
(11828, 206, -8723.05, 1084.74, 90.7799, 100, 0, 0),
(11828, 207, -8724.77, 1080.93, 90.7803, 100, 0, 0),
(11828, 208, -8726.32, 1077.51, 90.7713, 100, 0, 0),
(11828, 209, -8729.77, 1077.3, 90.7611, 100, 0, 0),
(11828, 210, -8732.53, 1079.86, 91.051, 100, 0, 0),
(11828, 211, -8734.48, 1083.22, 91.8994, 100, 0, 0),
(11828, 212, -8736.26, 1086.78, 92.4778, 100, 0, 0),
(11828, 213, -8737.99, 1090.34, 92.5305, 100, 0, 0),
(11828, 214, -8737.66, 1094.57, 92.5366, 100, 0, 0),
(11828, 215, -8735.86, 1098.28, 92.5384, 100, 0, 0),
(11828, 216, -8734.38, 1101.2, 92.5407, 100, 0, 0),
(11828, 217, -8733.95, 1105.16, 92.5401, 100, 0, 0),
(11828, 218, -8733.75, 1109.4, 92.5386, 100, 0, 0),
(11828, 219, -8733.61, 1113.31, 92.5375, 100, 0, 0),
(11828, 220, -8735.5, 1115.65, 92.5414, 100, 0, 0),
(11828, 221, -8738.37, 1118.34, 92.5474, 100, 0, 0),
(11828, 222, -8741.4, 1121.06, 92.5347, 100, 0, 0),
(11828, 223, -8744.4, 1123.72, 92.5514, 100, 0, 0),
(11828, 224, -8747.77, 1125.33, 92.5501, 100, 0, 0),
(11828, 225, -8751.44, 1126.86, 92.5442, 100, 0, 0),
(11828, 226, -8755.19, 1128.37, 92.548, 100, 0, 0);

-- -----------------------------------------------------------------------------------------

-- Add Harves Festival Feast Pools
-- IRONFORGE
DELETE FROM `gameobject` WHERE `id` IN (180370, 180371, 180372);
-- HARVEST FRUIT
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(9862, 180370, 0, -5089.05, -799.469, 496.03, -2.11185, 0, 0, 0.870356, -0.492423, 180, 180, 100, 1, 0, 0, 5, 10),
(9863, 180370, 0, -5085.64, -799.931, 496.03, -0.226893, 0, 0, 0.113203, -0.993572, 180, 180, 100, 1, 0, 0, 5, 10),
(9864, 180370, 0, -5082.25, -800.448, 496.03, -0.191986, 0, 0, 0.095846, -0.995396, 180, 180, 100, 1, 0, 0, 5, 10),
(9865, 180370, 0, -5080.8, -799.561, 496.03, 1.8675, 0, 0, 0.803857, 0.594823, 180, 180, 100, 1, 0, 0, 5, 10),
(9866, 180370, 0, -5077.29, -800.179, 496.03, 2.32129, 0, 0, 0.91706, 0.398749, 180, 180, 100, 1, 0, 0, 5, 10),
(9867, 180370, 0, -5075.2, -799.255, 496.038, -1.29154, 0, 0, 0.601815, -0.798635, 180, 180, 100, 1, 0, 0, 5, 10),
(9868, 180370, 0, -5073.67, -799.944, 496.03, -0.15708, 0, 0, 0.078459, -0.996917, 180, 180, 100, 1, 0, 0, 5, 10);

-- HARVEST BOAR
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(9869, 180371, 0, -5089.05, -799.469, 496.03, -2.11185, 0, 0, 0.870356, -0.492423, 180, 180, 100, 1, 0, 0, 5, 10),
(9870, 180371, 0, -5085.64, -799.931, 496.03, -0.226893, 0, 0, 0.113203, -0.993572, 180, 180, 100, 1, 0, 0, 5, 10),
(9871, 180371, 0, -5082.25, -800.448, 496.03, -0.191986, 0, 0, 0.095846, -0.995396, 180, 180, 100, 1, 0, 0, 5, 10),
(9872, 180371, 0, -5080.8, -799.561, 496.03, 1.8675, 0, 0, 0.803857, 0.594823, 180, 180, 100, 1, 0, 0, 5, 10),
(9873, 180371, 0, -5077.29, -800.179, 496.03, 2.32129, 0, 0, 0.91706, 0.398749, 180, 180, 100, 1, 0, 0, 5, 10),
(9874, 180371, 0, -5075.2, -799.255, 496.038, -1.29154, 0, 0, 0.601815, -0.798635, 180, 180, 100, 1, 0, 0, 5, 10),
(9875, 180371, 0, -5073.67, -799.944, 496.03, -0.15708, 0, 0, 0.078459, -0.996917, 180, 180, 100, 1, 0, 0, 5, 10);

-- HARVEST FISH
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(9876, 180372, 0, -5089.05, -799.469, 496.03, -2.11185, 0, 0, 0.870356, -0.492423, 180, 180, 100, 1, 0, 0, 5, 10),
(9877, 180372, 0, -5085.64, -799.931, 496.03, -0.226893, 0, 0, 0.113203, -0.993572, 180, 180, 100, 1, 0, 0, 5, 10),
(9878, 180372, 0, -5082.25, -800.448, 496.03, -0.191986, 0, 0, 0.095846, -0.995396, 180, 180, 100, 1, 0, 0, 5, 10),
(9879, 180372, 0, -5080.8, -799.561, 496.03, 1.8675, 0, 0, 0.803857, 0.594823, 180, 180, 100, 1, 0, 0, 5, 10),
(9880, 180372, 0, -5077.29, -800.179, 496.03, 2.32129, 0, 0, 0.91706, 0.398749, 180, 180, 100, 1, 0, 0, 5, 10),
(9881, 180372, 0, -5075.2, -799.255, 496.038, -1.29154, 0, 0, 0.601815, -0.798635, 180, 180, 100, 1, 0, 0, 5, 10),
(9882, 180372, 0, -5073.67, -799.944, 496.03, -0.15708, 0, 0, 0.078459, -0.996917, 180, 180, 100, 1, 0, 0, 5, 10);

-- ADD POOL TEMPLATE
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(272, 1, 'Harvest Festival Food - Ironforge', 5, 10),
(273, 1, 'Harvest Festival Food - Ironforge', 5, 10),
(274, 1, 'Harvest Festival Food - Ironforge', 5, 10),
(275, 1, 'Harvest Festival Food - Ironforge', 5, 10),
(276, 1, 'Harvest Festival Food - Ironforge', 5, 10),
(277, 1, 'Harvest Festival Food - Ironforge', 5, 10),
(278, 1, 'Harvest Festival Food - Ironforge', 5, 10);

-- ADD POOL GAMEOBJECTS
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES 
(9862, 272, 'Harvest Festival Food - Ironforge', 5, 10),
(9869, 272, 'Harvest Festival Food - Ironforge', 5, 10),
(9876, 272, 'Harvest Festival Food - Ironforge', 5, 10),
(9863, 273, 'Harvest Festival Food - Ironforge', 5, 10),
(9870, 273, 'Harvest Festival Food - Ironforge', 5, 10),
(9877, 273, 'Harvest Festival Food - Ironforge', 5, 10),
(9864, 274, 'Harvest Festival Food - Ironforge', 5, 10),
(9871, 274, 'Harvest Festival Food - Ironforge', 5, 10),
(9878, 274, 'Harvest Festival Food - Ironforge', 5, 10),
(9865, 275, 'Harvest Festival Food - Ironforge', 5, 10),
(9872, 275, 'Harvest Festival Food - Ironforge', 5, 10),
(9879, 275, 'Harvest Festival Food - Ironforge', 5, 10),
(9866, 276, 'Harvest Festival Food - Ironforge', 5, 10),
(9873, 276, 'Harvest Festival Food - Ironforge', 5, 10),
(9880, 276, 'Harvest Festival Food - Ironforge', 5, 10),
(9867, 277, 'Harvest Festival Food - Ironforge', 5, 10),
(9874, 277, 'Harvest Festival Food - Ironforge', 5, 10),
(9881, 277, 'Harvest Festival Food - Ironforge', 5, 10),
(9868, 278, 'Harvest Festival Food - Ironforge', 5, 10),
(9875, 278, 'Harvest Festival Food - Ironforge', 5, 10),
(9882, 278, 'Harvest Festival Food - Ironforge', 5, 10);

-- ORGRIMMAR
-- HARVEST FRUIT
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(9883, 180370, 1, 1326.97, -4416.36, 27.5984, -1.6057, 0, 0, 0.71934, -0.694658, 180, 180, 100, 1, 0, 0, 5, 10),
(9884, 180370, 1, 1327.37, -4423.33, 27.4349, 2.53073, 0, 0, 0.953717, 0.300706, 180, 180, 100, 1, 0, 0, 5, 10),
(9885, 180370, 1, 1329.31, -4413.13, 27.6023, 0.680678, 0, 0, 0.333807, 0.942641, 180, 180, 100, 1, 0, 0, 5, 10),
(9886, 180370, 1, 1330.72, -4425.71, 27.4281, 0.750492, 0, 0, 0.366501, 0.930418, 180, 180, 100, 1, 0, 0, 5, 10),
(9887, 180370, 1, 1336.56, -4426.84, 27.6309, -2.9147, 0, 0, 0.993572, -0.113203, 180, 180, 100, 1, 0, 0, 5, 10),
(9888, 180370, 1, 1337.53, -4411.01, 28.0848, -0.680679, 0, 0, 0.333807, -0.942641, 180, 180, 100, 1, 0, 0, 5, 10),
(9889, 180370, 1, 1340.36, -4414.08, 28.0881, 1.98968, 0, 0, 0.838671, 0.544639, 180, 180, 100, 1, 0, 0, 5, 10),
(9890, 180370, 1, 1341.04, -4421.81, 27.6249, 0.383972, 0, 0, 0.190809, 0.981627, 180, 180, 100, 1, 0, 0, 5, 10);

-- HARVEST BOAR
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(9891, 180371, 1, 1326.97, -4416.36, 27.5984, -1.6057, 0, 0, 0.71934, -0.694658, 180, 180, 100, 1, 0, 0, 5, 10),
(9892, 180371, 1, 1327.37, -4423.33, 27.4349, 2.53073, 0, 0, 0.953717, 0.300706, 180, 180, 100, 1, 0, 0, 5, 10),
(9893, 180371, 1, 1329.31, -4413.13, 27.6023, 0.680678, 0, 0, 0.333807, 0.942641, 180, 180, 100, 1, 0, 0, 5, 10),
(9894, 180371, 1, 1330.72, -4425.71, 27.4281, 0.750492, 0, 0, 0.366501, 0.930418, 180, 180, 100, 1, 0, 0, 5, 10),
(9895, 180371, 1, 1336.56, -4426.84, 27.6309, -2.9147, 0, 0, 0.993572, -0.113203, 180, 180, 100, 1, 0, 0, 5, 10),
(9896, 180371, 1, 1337.53, -4411.01, 28.0848, -0.680679, 0, 0, 0.333807, -0.942641, 180, 180, 100, 1, 0, 0, 5, 10),
(9897, 180371, 1, 1340.36, -4414.08, 28.0881, 1.98968, 0, 0, 0.838671, 0.544639, 180, 180, 100, 1, 0, 0, 5, 10),
(9898, 180371, 1, 1341.04, -4421.81, 27.6249, 0.383972, 0, 0, 0.190809, 0.981627, 180, 180, 100, 1, 0, 0, 5, 10);

-- HARVEST FISH
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(9899, 180372, 1, 1326.97, -4416.36, 27.5984, -1.6057, 0, 0, 0.71934, -0.694658, 180, 180, 100, 1, 0, 0, 5, 10),
(9900, 180372, 1, 1327.37, -4423.33, 27.4349, 2.53073, 0, 0, 0.953717, 0.300706, 180, 180, 100, 1, 0, 0, 5, 10),
(9901, 180372, 1, 1329.31, -4413.13, 27.6023, 0.680678, 0, 0, 0.333807, 0.942641, 180, 180, 100, 1, 0, 0, 5, 10),
(9902, 180372, 1, 1330.72, -4425.71, 27.4281, 0.750492, 0, 0, 0.366501, 0.930418, 180, 180, 100, 1, 0, 0, 5, 10),
(9903, 180372, 1, 1336.56, -4426.84, 27.6309, -2.9147, 0, 0, 0.993572, -0.113203, 180, 180, 100, 1, 0, 0, 5, 10),
(9904, 180372, 1, 1337.53, -4411.01, 28.0848, -0.680679, 0, 0, 0.333807, -0.942641, 180, 180, 100, 1, 0, 0, 5, 10),
(9905, 180372, 1, 1340.36, -4414.08, 28.0881, 1.98968, 0, 0, 0.838671, 0.544639, 180, 180, 100, 1, 0, 0, 5, 10),
(9906, 180372, 1, 1341.04, -4421.81, 27.6249, 0.383972, 0, 0, 0.190809, 0.981627, 180, 180, 100, 1, 0, 0, 5, 10);

-- ADD POOL TEMPLATE
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(280, 1, 'Harvest Festival Food - Orgrimmar', 5, 10),
(281, 1, 'Harvest Festival Food - Orgrimmar', 5, 10),
(282, 1, 'Harvest Festival Food - Orgrimmar', 5, 10),
(283, 1, 'Harvest Festival Food - Orgrimmar', 5, 10),
(284, 1, 'Harvest Festival Food - Orgrimmar', 5, 10),
(285, 1, 'Harvest Festival Food - Orgrimmar', 5, 10),
(286, 1, 'Harvest Festival Food - Orgrimmar', 5, 10),
(287, 1, 'Harvest Festival Food - Orgrimmar', 5, 10);

-- ADD POOL GAMEOBJECTS
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES 
(9883, 280, 'Harvest Festival Food - Orgrimmar', 5, 10),
(9891, 280, 'Harvest Festival Food - Orgrimmar', 5, 10),
(9899, 280, 'Harvest Festival Food - Orgrimmar', 5, 10),
(9884, 281, 'Harvest Festival Food - Orgrimmar', 5, 10),
(9892, 281, 'Harvest Festival Food - Orgrimmar', 5, 10),
(9900, 281, 'Harvest Festival Food - Orgrimmar', 5, 10),
(9885, 282, 'Harvest Festival Food - Orgrimmar', 5, 10),
(9893, 282, 'Harvest Festival Food - Orgrimmar', 5, 10),
(9901, 282, 'Harvest Festival Food - Orgrimmar', 5, 10),
(9886, 283, 'Harvest Festival Food - Orgrimmar', 5, 10),
(9894, 283, 'Harvest Festival Food - Orgrimmar', 5, 10),
(9902, 283, 'Harvest Festival Food - Orgrimmar', 5, 10),
(9887, 284, 'Harvest Festival Food - Orgrimmar', 5, 10),
(9895, 284, 'Harvest Festival Food - Orgrimmar', 5, 10),
(9903, 284, 'Harvest Festival Food - Orgrimmar', 5, 10),
(9888, 285, 'Harvest Festival Food - Orgrimmar', 5, 10),
(9896, 285, 'Harvest Festival Food - Orgrimmar', 5, 10),
(9904, 285, 'Harvest Festival Food - Orgrimmar', 5, 10),
(9889, 286, 'Harvest Festival Food - Orgrimmar', 5, 10),
(9897, 286, 'Harvest Festival Food - Orgrimmar', 5, 10),
(9905, 286, 'Harvest Festival Food - Orgrimmar', 5, 10),
(9890, 287, 'Harvest Festival Food - Orgrimmar', 5, 10),
(9898, 287, 'Harvest Festival Food - Orgrimmar', 5, 10),
(9906, 287, 'Harvest Festival Food - Orgrimmar', 5, 10);

-- UPDATE RESPAWN TIMES
UPDATE `gameobject` SET `spawntimesecsmin` = 10, `spawntimesecsmax` = 10  WHERE `id` IN (180370, 180371, 180372, 180373, 180374);

-- ADD GAMEOBJECTS TO EVENT
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES
(9862, 11),
(9863, 11),
(9864, 11),
(9865, 11),
(9866, 11),
(9867, 11),
(9868, 11),
(9869, 11),
(9870, 11),
(9871, 11),
(9872, 11),
(9873, 11),
(9874, 11),
(9875, 11),
(9876, 11),
(9877, 11),
(9878, 11),
(9879, 11),
(9880, 11),
(9881, 11),
(9882, 11),
(9883, 11),
(9884, 11),
(9885, 11),
(9886, 11),
(9887, 11),
(9888, 11),
(9889, 11),
(9890, 11),
(9891, 11),
(9892, 11),
(9893, 11),
(9894, 11),
(9895, 11),
(9896, 11),
(9897, 11),
(9898, 11),
(9899, 11),
(9900, 11),
(9901, 11),
(9902, 11),
(9903, 11),
(9904, 11),
(9905, 11),
(9906, 11);

-- -----------------------------------------------------------------------------------------

-- Add Missing Songflower Spawn
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(48958, 174713, 1, 6599.87, -1266.64, 448.412, 1.97222, 0, 0, 0.833885, 0.551938, 7200, 7200, 100, 1, 0, 0, 0, 10);

-- -----------------------------------------------------------------------------------------

-- Update Seeking Spiritual Aid End Script
DELETE FROM `quest_end_scripts` WHERE `id`=5158;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5158, 0, 4, 147, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Seeking Spiritual Aid - Islen Waterseer - Remove Flags');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5158, 1, 60, 3, 1, 0, 0, 0, 0, 0, 0, 0, 13172, 0, 0, 0, 0, 0, 0, 0, 'Seeking Spiritual Aid - Islen Waterseer - Start Waypoints');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (5158, 45, 4, 147, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Seeking Spiritual Aid - Islen Waterseer - Modify Flags');

INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1317201, 2, 28, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Seeking Spiritual Aid: Islen Waterseer - Set Stand State');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1317201, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6586, 0, 0, 0, 0, 0, 0, 0, 0, 'Seeking Spiritual Aid: Islen Waterseer - Talk');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1317201, 5, 9, 3, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Seeking Spiritual Aid: Islen Waterseer - Respawn Gameobject');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1317201, 13, 10, 11256, 11000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, -1344.85, -4072.3, -0.828955, 1.50098, 0, 'Seeking Spiritual Aid: Islen Waterseer - Summon Creature');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1317201, 16, 0, 0, 0, 0, 0, 11256, 10, 8, 2, 6607, 0, 0, 0, 0, 0, 0, 0, 0, 'Seeking Spiritual Aid: Manifestation of Water - Talk');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1317201, 17, 15, 18113, 0, 0, 0, 11256, 10, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Seeking Spiritual Aid: Manifestation of Water - Cast Spell');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1317201, 23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6599, 0, 0, 0, 0, 0, 0, 0, 0, 'Seeking Spiritual Aid: Islen Waterseer - Talk');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1317201, 24, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Seeking Spiritual Aid: Islen Waterseer - Set Stand State');

INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(13172, 1, -1342.7, -4054.72, 3.7679, 100, 0, 0, 0),
(13172, 2, -1344.13, -4065.49, -0.674068, 100, 26000, 0, 1317201),
(13172, 3, -1342.68, -4054.67, 3.78157, 100, 0, 0, 0),
(13172, 4, -1344, -4047.97, 5.80303, 100, 0, 0, 0),
(13172, 5, -1345.12, -4047.61, 5.93119, 4.345870, 2000, 0, 0);

UPDATE `creature_template` SET `faction` = 35, `unit_flags` = 832 WHERE `entry` = 11256;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(3, 106528, 1, -1344.85, -4072.3, -0.922163, 4.46804, 0, 0, -0.788011, 0.615662, -180, -180, 100, 1, 0, 0, 0, 10);

-- -----------------------------------------------------------------------------------------

-- Add Searscale Drake Waypoints
UPDATE `creature` SET `position_x` = -8194.86, `position_y` = -943.927, `position_z` = 133.782, `movement_type` = 2, `wander_distance` = 0 WHERE `guid` = 3303;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`) VALUES
(3303, 1, -8194.86, -943.927, 133.782, 100, 0, 0),
(3303, 2, -8187.38, -975.215, 134.59, 100, 0, 0),
(3303, 3, -8205.21, -997.872, 144.353, 100, 0, 0),
(3303, 4, -8224.36, -1018.42, 145.175, 100, 0, 0),
(3303, 5, -8249.77, -1038.1, 146.617, 100, 0, 0),
(3303, 6, -8281.12, -1020.57, 155.732, 100, 0, 0),
(3303, 7, -8301.41, -1009.95, 171.442, 100, 0, 0),
(3303, 8, -8325.58, -998.223, 179.866, 100, 0, 0),
(3303, 9, -8350.24, -978.861, 185.467, 100, 0, 0),
(3303, 10, -8381.37, -961.927, 193.479, 100, 0, 0),
(3303, 11, -8408.18, -959.593, 200.063, 100, 0, 0),
(3303, 12, -8432.33, -940.711, 214.405, 100, 0, 0),
(3303, 13, -8412.96, -957.113, 202.407, 100, 0, 0),
(3303, 14, -8386.81, -960.398, 194.912, 100, 0, 0),
(3303, 15, -8355.35, -975.374, 186.536, 100, 0, 0),
(3303, 16, -8333.61, -992.794, 181.668, 100, 0, 0),
(3303, 17, -8310.15, -1005.64, 174.118, 100, 0, 0),
(3303, 18, -8285.47, -1017.88, 158.396, 100, 0, 0),
(3303, 19, -8257.84, -1038.04, 147.953, 100, 0, 0),
(3303, 20, -8228.71, -1022.31, 144.628, 100, 0, 0),
(3303, 21, -8209.15, -1002.13, 145.071, 100, 0, 0),
(3303, 22, -8188.49, -980.147, 135.101, 100, 0, 0),
(3303, 23, -8193.27, -953.475, 134.003, 100, 0, 0),
(3303, 24, -8198.06, -909.279, 133.142, 100, 0, 0),
(3303, 25, -8194.16, -884.404, 133.41, 100, 0, 0),
(3303, 26, -8191.84, -851.153, 131.59, 100, 0, 0),
(3303, 27, -8193.59, -879.261, 133.428, 100, 0, 0),
(3303, 28, -8197.76, -903.211, 133.256, 100, 0, 0);

DELETE FROM `creature_movement` WHERE `id` = 3297;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`) VALUES
(3297, 1, -8140.69, -749.678, 134.925, 100, 0, 0),
(3297, 2, -8155.04, -782.311, 129.737, 100, 0, 0),
(3297, 3, -8184.1, -813.038, 129.505, 100, 0, 0),
(3297, 4, -8160.75, -790.076, 130.109, 100, 0, 0),
(3297, 5, -8142.55, -754.932, 133.873, 100, 0, 0),
(3297, 6, -8137.9, -739.919, 137.046, 100, 0, 0),
(3297, 7, -8112.66, -753.525, 134.589, 100, 0, 0),
(3297, 8, -8089.13, -769.124, 131.979, 100, 0, 0),
(3297, 9, -8057.89, -776.914, 131.322, 100, 0, 0),
(3297, 10, -8026.88, -786.352, 129.814, 100, 0, 0),
(3297, 11, -7998.15, -807.954, 131.193, 100, 0, 0),
(3297, 12, -7977.41, -846.557, 130.738, 100, 0, 0),
(3297, 13, -7956.94, -876.523, 128.404, 100, 0, 0),
(3297, 14, -7946.45, -917.672, 131.743, 100, 0, 0),
(3297, 15, -7954.54, -948.406, 133.997, 100, 0, 0),
(3297, 16, -7934.67, -987.737, 131.874, 100, 0, 0),
(3297, 17, -7891.51, -1013.99, 137.893, 100, 0, 0),
(3297, 18, -7930.33, -993.029, 132.122, 100, 0, 0),
(3297, 19, -7952.83, -954.641, 133.89, 100, 0, 0),
(3297, 20, -7948.97, -924.375, 132.175, 100, 0, 0),
(3297, 21, -7949.63, -884.541, 130.178, 100, 0, 0),
(3297, 22, -7973.64, -852.892, 130.665, 100, 0, 0),
(3297, 23, -7991.34, -816.614, 129.911, 100, 0, 0),
(3297, 24, -8020.6, -790.064, 129.719, 100, 0, 0),
(3297, 25, -8050.72, -778.895, 131.22, 100, 0, 0);

UPDATE `creature` SET `movement_type` = 2 WHERE `guid` = 3301;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`) VALUES
(3301, 1, -8240.93, -1192.12, 142.65, 100, 0, 0),
(3301, 2, -8240.99, -1216.35, 142.676, 100, 0, 0),
(3301, 3, -8238.65, -1233.15, 142.703, 100, 0, 0),
(3301, 4, -8233.14, -1259.21, 142.754, 100, 0, 0),
(3301, 5, -8239.86, -1227.44, 142.692, 100, 0, 0),
(3301, 6, -8240.94, -1195.2, 142.653, 100, 0, 0),
(3301, 7, -8220.13, -1161.14, 142.757, 100, 0, 0),
(3301, 8, -8208.14, -1114.45, 147.382, 100, 0, 0),
(3301, 9, -8216.41, -1088.02, 146.528, 100, 0, 0),
(3301, 10, -8233.52, -1066.12, 143.069, 100, 0, 0),
(3301, 11, -8234.79, -1027.16, 144.003, 100, 0, 0),
(3301, 12, -8208, -1014.76, 146.962, 100, 0, 0),
(3301, 13, -8198.15, -990.955, 141.834, 100, 0, 0),
(3301, 14, -8183.11, -983.677, 135.305, 100, 0, 0),
(3301, 15, -8157.04, -1005.96, 134.876, 100, 0, 0),
(3301, 16, -8141.37, -1051.33, 132.259, 100, 0, 0),
(3301, 17, -8139.76, -1083.56, 131.847, 100, 0, 0),
(3301, 18, -8145.92, -1110.91, 134.402, 100, 0, 0),
(3301, 19, -8155.06, -1154.34, 137.564, 100, 0, 0),
(3301, 20, -8152.69, -1186.12, 135.1, 100, 0, 0),
(3301, 21, -8129, -1231.43, 133.148, 100, 0, 0),
(3301, 22, -8150.44, -1193.47, 137.052, 100, 0, 0),
(3301, 23, -8155.8, -1162.56, 137.301, 100, 0, 0),
(3301, 24, -8148.04, -1119.04, 135.101, 100, 0, 0),
(3301, 25, -8140.53, -1091.91, 131.862, 100, 0, 0),
(3301, 26, -8140.08, -1059.89, 132.32, 100, 0, 0),
(3301, 27, -8152.4, -1013.04, 134.065, 100, 0, 0),
(3301, 28, -8175.73, -985.769, 135.325, 100, 0, 0),
(3301, 29, -8193.63, -985.976, 138.237, 100, 0, 0),
(3301, 30, -8202.89, -1009.19, 146.02, 100, 0, 0),
(3301, 31, -8230.57, -1020.33, 144.332, 100, 0, 0),
(3301, 32, -8237.05, -1057.66, 143.15, 100, 0, 0),
(3301, 33, -8221.27, -1079.63, 144.702, 100, 0, 0),
(3301, 34, -8208.51, -1108.65, 148.01, 100, 0, 0),
(3301, 35, -8217.92, -1155.33, 142.764, 100, 0, 0),
(3301, 36, -8239.12, -1189.42, 142.66, 100, 0, 0);

-- -----------------------------------------------------------------------------------------

-- Update Hematos Waypoints
UPDATE `creature` SET `position_x` = -8019.27, `position_y` = -1032.82, `position_z` = 130.385 WHERE `guid` = 300764;
DELETE FROM `creature_movement_template` WHERE `entry` = 8976;
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`) VALUES
(8976, 1, -8019.27, -1032.82, 130.385, 100, 0, 0),
(8976, 2, -8038.09, -1050.24, 130.809, 100, 0, 0),
(8976, 3, -8053.99, -1083.04, 131.139, 100, 0, 0),
(8976, 4, -8067.54, -1119.04, 131.418, 100, 0, 0),
(8976, 5, -8083.86, -1153.58, 131.57, 100, 0, 0),
(8976, 6, -8096.61, -1202.8, 134.237, 100, 0, 0),
(8976, 7, -8124.85, -1219.96, 132.833, 100, 0, 0),
(8976, 8, -8158.56, -1206.66, 135.09, 100, 0, 0),
(8976, 9, -8190.6, -1172.05, 141.971, 100, 0, 0),
(8976, 10, -8204.58, -1150.39, 143.345, 100, 0, 0),
(8976, 11, -8218.3, -1114.55, 146.133, 100, 0, 0),
(8976, 12, -8220.81, -1076.41, 144.139, 100, 0, 0),
(8976, 13, -8218.96, -1050.59, 142.839, 100, 0, 0),
(8976, 14, -8207.59, -1014.46, 147.032, 100, 0, 0),
(8976, 15, -8195.81, -979.974, 135.891, 100, 0, 0),
(8976, 16, -8194.07, -942.157, 133.698, 100, 0, 0),
(8976, 17, -8194.56, -914.741, 133.002, 100, 0, 0),
(8976, 18, -8194.17, -876.118, 133.909, 100, 0, 0),
(8976, 19, -8193.03, -850.317, 131.606, 100, 0, 0),
(8976, 20, -8185.33, -812.582, 129.822, 100, 0, 0),
(8976, 21, -8172.62, -790.785, 129.71, 100, 0, 0),
(8976, 22, -8140.18, -770.084, 129.92, 100, 0, 0),
(8976, 23, -8100.08, -766.998, 132.581, 100, 0, 0),
(8976, 24, -8125.93, -766.594, 131.839, 100, 0, 0),
(8976, 25, -8160.73, -781.172, 129.27, 100, 0, 0),
(8976, 26, -8170.87, -788.924, 129.7, 100, 0, 0),
(8976, 27, -8188.46, -822.408, 129.512, 100, 0, 0),
(8976, 28, -8193.62, -860.401, 132.24, 100, 0, 0),
(8976, 29, -8194.32, -886.039, 133.275, 100, 0, 0),
(8976, 30, -8194.49, -925.012, 133.105, 100, 0, 0),
(8976, 31, -8193.62, -950.872, 133.944, 100, 0, 0),
(8976, 32, -8197.62, -987.858, 140.16, 100, 0, 0),
(8976, 33, -8211.73, -1022.61, 146.834, 100, 0, 0),
(8976, 34, -8219.88, -1059.51, 142.871, 100, 0, 0),
(8976, 35, -8221.05, -1085.12, 145.642, 100, 0, 0),
(8976, 36, -8216.45, -1123.18, 144.983, 100, 0, 0),
(8976, 37, -8199.84, -1158.14, 142.815, 100, 0, 0),
(8976, 38, -8177.88, -1189.23, 140.686, 100, 0, 0),
(8976, 39, -8139.6, -1218.72, 133.141, 100, 0, 0),
(8976, 40, -8116.35, -1217.62, 136.531, 100, 0, 0),
(8976, 41, -8092.31, -1181.14, 131.942, 100, 0, 0),
(8976, 42, -8079.9, -1144.54, 131.154, 100, 0, 0),
(8976, 43, -8063.07, -1110.18, 131.882, 100, 0, 0),
(8976, 44, -8052.24, -1073.4, 130.623, 100, 0, 0),
(8976, 45, -8031.33, -1043.98, 130.591, 100, 0, 0),
(8976, 46, -8008.94, -1012.96, 129.333, 100, 0, 0),
(8976, 47, -7992.37, -977.85, 127.943, 100, 0, 0),
(8976, 48, -7987.01, -940.104, 129.097, 100, 0, 0),
(8976, 49, -7982.87, -915.083, 129.722, 100, 0, 0),
(8976, 50, -7970.99, -878.061, 129.525, 100, 0, 0),
(8976, 51, -7949.22, -844.015, 129.105, 100, 0, 0),
(8976, 52, -7951.89, -809.783, 128.44, 100, 0, 0),
(8976, 53, -7982.48, -791.759, 126.057, 100, 0, 0),
(8976, 54, -8020.24, -786.643, 129.361, 100, 0, 0),
(8976, 55, -8058.4, -781.581, 132.01, 100, 0, 0),
(8976, 56, -8101.94, -748.879, 134.75, 100, 0, 0),
(8976, 57, -8072.6, -773.778, 131.356, 100, 0, 0),
(8976, 58, -8049.35, -783.323, 131.503, 100, 0, 0),
(8976, 59, -8010.81, -786.69, 128.138, 100, 0, 0),
(8976, 60, -7973.26, -794.248, 126.161, 100, 0, 0),
(8976, 61, -7948.55, -818.34, 129.319, 100, 0, 0),
(8976, 62, -7962.66, -862.009, 128.942, 100, 0, 0),
(8976, 63, -7973.56, -884.477, 129.299, 100, 0, 0),
(8976, 64, -7984.34, -921.598, 130.27, 100, 0, 0),
(8976, 65, -7987.32, -959.807, 129.032, 100, 0, 0),
(8976, 66, -7995.05, -984.029, 127.795, 100, 0, 0),
(8976, 67, -8012.05, -1019, 129.701, 100, 0, 0);
UPDATE `creature_movement_template` SET `script_id` = 11 WHERE `entry` = 8976 AND `point` = 1;

-- -----------------------------------------------------------------------------------------

-- Risen Aberration Should Not Be Immune to Physical and Holy
UPDATE `creature_template` SET `auras`='', `ai_name`= '', `school_immune_mask` = 124 WHERE `entry`=10485;
DELETE FROM `creature_ai_scripts` WHERE `id` IN (1048502, 1048503, 1048504);
DELETE FROM `creature_ai_events` WHERE `creature_id` = 10485;

-- -----------------------------------------------------------------------------------------

-- Skorn Whitecloud Should Call You A Stud if Quest 770 is Complete
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES 
(24, 521, 701);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (701, 8, 770, 0, 0, 0, 0);

-- -----------------------------------------------------------------------------------------

-- Decoded Twilight Text Should Not Drop From Creatures (Ex 20545)
DELETE FROM `creature_loot_template` WHERE `entry` = 11738 AND `item` = 20541;
DELETE FROM `creature_loot_template` WHERE `entry` = 11881 AND `item` = 20541;
DELETE FROM `creature_loot_template` WHERE `entry` = 11738 AND `item` = 20552;
DELETE FROM `creature_loot_template` WHERE `entry` = 11881 AND `item` = 20678;
DELETE FROM `creature_loot_template` WHERE `entry` = 7449 AND `item` = 20679;
DELETE FROM `creature_loot_template` WHERE `entry` = 8602 AND `item` = 20679;
DELETE FROM `creature_loot_template` WHERE `entry` = 11803 AND `item` = 20679;
DELETE FROM `creature_loot_template` WHERE `entry` = 11881 AND `item` = 20679;

-- -----------------------------------------------------------------------------------------

-- Delete Plans: Corruption from various NPCs (credit Azerothcore)
DELETE FROM `creature_loot_template` WHERE `entry` IN (10398, 10399, 10400, 10406, 10407, 10408, 10409, 10412, 10413, 10463, 10464) AND `item` = 12830;

-- -----------------------------------------------------------------------------------------

-- Update Quest Start Script For 3625
DELETE FROM `quest_start_scripts` WHERE `id`=3625;
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (3625, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3828, 0, 0, 0, 0, 0, 0, 0, 0, 'Enchanted Azsharite Fel Weaponry: Galvan the Ancient - Talk');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (3625, 2, 1, 233, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Enchanted Azsharite Fel Weaponry: Galvan the Ancient - Emote');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (3625, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3825, 0, 0, 0, 0, 0, 0, 0, 0, 'Enchanted Azsharite Fel Weaponry: Galvan the Ancient - Talk');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (3625, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3826, 0, 0, 0, 0, 0, 0, 0, 0, 'Enchanted Azsharite Fel Weaponry: Galvan the Ancient - Talk');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (3625, 8, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Enchanted Azsharite Fel Weaponry: Galvan the Ancient - Emote');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (3625, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4542, 0, 0, 0, 0, 0, 0, 0, 0, 'Enchanted Azsharite Fel Weaponry: Galvan the Ancient - Talk');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (3625, 13, 7, 3625, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Enchanted Azsharite Fel Weaponry: Galvan the Ancient - Complete Quest');

-- -----------------------------------------------------------------------------------------

-- Add Missing Gossip Option to Fallen Hero of the Horde
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES
(840, 3, 0, 'I have destroyed my Azsharite weaponry! I need your assistance in defeating the triad of power.', 5260, 1, 1, -1, 0, 84001, 0, 0, NULL, 0, 333);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (333, 9, 3627, 0, 0, 0, 0);
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (84001, 0, 15, 15247, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Uniting the Shattered Amulet: Fallen Hero of the Horde - Cast Spell');

-- -----------------------------------------------------------------------------------------

-- Remove Incorrect Aura
UPDATE `creature_template` SET `auras`='' WHERE  `entry`=8543;

-- -----------------------------------------------------------------------------------------

-- Update Loot For Item Cuergo's Hidden Treasure
INSERT INTO `item_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES
(9265, 9361, 9, 0, 1, 1, 0, 0, 10);
UPDATE `item_loot_template` SET `ChanceOrQuestChance` = 86 WHERE `entry` = 9265 AND `item` = 9360;

-- -----------------------------------------------------------------------------------------

-- Add Missing Ground Pounder (Uses Waypoints set to wander for now)
INSERT INTO `creature` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `movement_type`,`patch_max`) VALUES 
(3505, 9396, 1, -7359.93, -3739.76, 11.2501, 3.11049, 300, 300, 20, 100, 1, 10),
(3506, 9396, 1, -7333.07, -3590.84, 11.3300, 3.11049, 300, 300, 20, 100, 1, 10),
(3507, 9396, 1, -7280.86, -3359.77, 9.7712, 3.11049, 300, 300, 20, 100, 1, 10);

-- -----------------------------------------------------------------------------------------

-- Apple Bobs Should Not Despawn After Use
UPDATE `gameobject` SET `spawntimesecsmin` = 0, `spawntimesecsmax` = 0 WHERE `id` = 180523;

-- -----------------------------------------------------------------------------------------

-- Add Missing Aggro Text
DELETE FROM `creature_ai_events` WHERE `creature_id`=1121;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (112101, 1121, 0, 4, 0, 100, 0, 0, 0, 0, 0, 112101, 0, 0, 'Frostmane Snowstrider - Cast Thorns on Aggro');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (112103, 1121, 0, 2, 0, 100, 0, 15, 0, 0, 0, 112103, 0, 0, 'Frostmane Snowstrider - Flee at 15% HP');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (112104, 1121, 0, 4, 0, 10, 0, 0, 0, 0, 0, 112104, 0, 0, 'Frostmane Snowstrider - Say Text on Aggro');
DELETE FROM `creature_ai_scripts` WHERE `id`=112104;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (112104, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1908, 1909, 10434, 10435, 0, 0, 0, 0, 0, 'Frostmane Snowstrider - Say Text');

-- -----------------------------------------------------------------------------------------

-- Convert Patrol to Creature Groups
DELETE FROM `creature_movement` WHERE `id` = 2284;
INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES
(2283, 2283, 2, 6.25244, 11),
(2283, 2284, 2, 1.57, 11);

-- -----------------------------------------------------------------------------------------

-- Update Start and End Time For Night Event
UPDATE `game_event` SET `start_time` = '2020-01-02 21:00:00', `end_time` = '2030-12-31 08:00:00' WHERE `entry`=27;

-- -----------------------------------------------------------------------------------------

-- Remove Loot for Rookery Whelp 10161 (credit cmangos)
UPDATE `creature_template` SET `gold_min` = 0, `gold_max` = 0, `loot_id` = 0 WHERE `loot_id`=10161;
DELETE FROM `creature_loot_template` WHERE `entry` = 10161;

-- -----------------------------------------------------------------------------------------

-- Add Missing Text to Gilnid
DELETE FROM `creature_ai_scripts` WHERE `id`=176301;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (176301, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1145, 1146, 1147, 0, 0, 0, 0, 0, 0, 'Gilnid - Say Text');

-- -----------------------------------------------------------------------------------------

-- Arikara Should Cast Spell on Spawn (Credit Cmangos)
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 10882;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1088201, 10882, 0, 11, 0, 100, 1, 0, 0, 0, 0, 1088201, 0, 0, 'Arikara - Cast Spell On Spawn');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1088201, 0, 15, 10389, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Arikara - Cast Spell');

-- -----------------------------------------------------------------------------------------

-- Update Start Script For Quest Gnomer-gooooone!
DELETE FROM `quest_start_scripts` WHERE `id`=2843;
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (2843, 0, 4, 147, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Scooty - Modify Flags');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (2843, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3904, 0, 0, 0, 0, 0, 0, 0, 0, 'Scooty - Talk');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (2843, 6, 7, 2843, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Scooty - Complete Quest');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (2843, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3905, 0, 0, 0, 0, 0, 0, 0, 0, 'Scooty - Talk');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (2843, 9, 4, 147, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Scooty - Modify Flags');

-- -----------------------------------------------------------------------------------------

-- Add Missing Script For Quest Passing the Burden
UPDATE `quest_template` SET `CompleteScript` = 3448 WHERE `entry` = 3448;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (3448, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4451, 0, 0, 0, 0, 0, 0, 0, 0, 'Tymor - Talk');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
