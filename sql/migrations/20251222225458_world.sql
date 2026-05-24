DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20251222225458');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20251222225458');
-- Add your query below.


-- Wrong Hillsbrad Councilman spawn.
DELETE FROM `creature` WHERE `guid`=15993;
DELETE FROM `creature_movement` WHERE `id`=15993;

-- These spawns are added in TBC.
DELETE FROM `creature` WHERE `guid` IN (15782, 16508, 15956);
DELETE FROM `creature` WHERE `guid` IN (15954, 15959, 15960, 15962);
DELETE FROM `creature_addon` WHERE `guid`=15960;

-- These npcs should wander.
UPDATE `creature` SET `movement_type`=1, `wander_distance`=2 WHERE `guid`=16327;
UPDATE `creature` SET `movement_type`=1, `wander_distance`=1 WHERE `guid`=15733;
UPDATE `creature` SET `movement_type`=1, `wander_distance`=2 WHERE `guid`=16033;
UPDATE `creature` SET `position_x`=-593.104, `position_y`=-121.884, `position_z`=48.3264, `orientation`=0.595045, `movement_type`=1, `wander_distance`=8 WHERE `guid`=16455;
UPDATE `creature` SET `position_x`=-578.743, `position_y`=16.4826, `position_z`=48.9764, `orientation`=0.154825, `wander_distance`=9, `movement_type`=1 WHERE `guid`=15957;

-- Add missing spawn for Hillsbrad Peasant.
INSERT INTO `creature` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `wander_distance`, `movement_type`, `spawntimesecsmin`, `spawntimesecsmax`) VALUES (15993, 2267, 0, -544.576, -91.3888, 45.916, 1.40212, 8, 1, 300, 300);
INSERT INTO `creature` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `movement_type`, `wander_distance`, `spawntimesecsmin`, `spawntimesecsmax`) VALUES (16508, 2267, 0, -498.414, 118.526, 59.1425, 6.17847, 0, 0, 300, 300);

-- Add missing spawns for Blacksmith Verringtan.
INSERT INTO `creature` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `wander_distance`, `movement_type`, `spawntimesecsmin`, `spawntimesecsmax`) VALUES (16193, 2404, 0, -580.233, 24.6726, 49.3111, 3.75246, 0, 0, 300, 300);
INSERT INTO `creature` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `wander_distance`, `movement_type`, `spawntimesecsmin`, `spawntimesecsmax`) VALUES (16194, 2404, 0, -574.068, 35.7521, 49.9676, 0.959931, 0, 0, 300, 300);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES (4060, 1, 'Blacksmith Verringtan - Hillsbrad Foothills', 0, 0, 0, 10);
INSERT INTO `pool_creature_template` (`id`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (2404, 4060, 0, 'Blacksmith Verringtan', 0, 0, 10);

-- Add missing spawns for Farmer Getz.
INSERT INTO `creature` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `movement_type`, `wander_distance`, `spawntimesecsmin`, `spawntimesecsmax`) VALUES (15954, 2403, 0, -405.025, -64.5448, 54.44, 5.13674, 1, 1.5, 300, 480);
INSERT INTO `creature` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `movement_type`, `wander_distance`, `spawntimesecsmin`, `spawntimesecsmax`) VALUES (15959, 2403, 0, -469.619, -62.9646, 54.908, 0.963677, 1, 1.5, 300, 480);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES (4061, 1, 'Farmer Getz - Hillsbrad Foothills', 0, 0, 0, 10);
INSERT INTO `pool_creature_template` (`id`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (2403, 4061, 0, 'Farmer Getz', 0, 0, 10);

-- Add missing spawns for Hillsbrad Apprentice Blacksmith.
INSERT INTO `creature` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `wander_distance`, `movement_type`, `spawntimesecsmin`, `spawntimesecsmax`) VALUES (16195, 2265, 0, -577.489, 39.8143, 49.9354, 2.5019, 2, 1, 300, 300);
INSERT INTO `creature` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `wander_distance`, `movement_type`, `spawntimesecsmin`, `spawntimesecsmax`) VALUES (16196, 2265, 0, -568.264, 36.0345, 49.9391, 3.87463, 2, 1, 300, 300);

-- Add missing spawns for Hillsbrad Footman.
INSERT INTO `creature` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `wander_distance`, `movement_type`, `spawntimesecsmin`, `spawntimesecsmax`) VALUES (16197, 2268, 0, -530.282, 39.7013, 50.143, 4.99252, 5, 1, 300, 480);
INSERT INTO `creature` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `wander_distance`, `movement_type`, `spawntimesecsmin`, `spawntimesecsmax`) VALUES (16199, 2268, 0, -521.38, 120.908, 59.1425, 1.37881, 0, 0, 300, 480);
INSERT INTO `creature` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `movement_type`, `wander_distance`, `spawntimesecsmin`, `spawntimesecsmax`) VALUES (15960, 2268, 0, -592.788, 41.4801, 49.0915, 3.38594, 0, 0, 300, 480);
INSERT INTO `creature` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `movement_type`, `wander_distance`, `spawntimesecsmin`, `spawntimesecsmax`) VALUES (15962, 2268, 0, -617.097, 51.9865, 45.4333, 1.36269, 1, 9, 300, 480);

-- Add missing spawns for Hillsbrad Councilman.
INSERT INTO `creature` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `wander_distance`, `movement_type`, `spawntimesecsmin`, `spawntimesecsmax`) VALUES (16198, 2387, 0, -510.773, 45.241, 52.0148, 0.210209, 10, 1, 300, 480);
INSERT INTO `creature` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `movement_type`, `wander_distance`, `spawntimesecsmin`, `spawntimesecsmax`) VALUES (15782, 2387, 0, -503.615, 120.834, 59.238, 3.11784, 1, 2, 300, 480);
INSERT INTO `creature` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `movement_type`, `wander_distance`, `spawntimesecsmin`, `spawntimesecsmax`) VALUES (16201, 2387, 0, -496.897, 111.443, 59.1419, 0.663225, 0, 0, 300, 480);

-- These two Hillsbrad Coincilman should be Footman.
UPDATE `creature` SET `id`=2268, `position_x`=-495.391, `position_y`=105.087, `position_z`=59.1434, `orientation`=3.05433 WHERE `guid`=15989;
UPDATE `creature` SET `id`=2268, `position_x`=-515.248, `position_y`=100.844, `position_z`=58.2404, `orientation`=1.50098 WHERE `guid`=15988;

-- Add waypoints for a Hillsbrad Footman.
UPDATE `creature` SET `position_x`=-496.875, `position_y`=77.6959, `position_z`=56.7041, `orientation`=4.29351, `movement_type`=2 WHERE `guid`=15966;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(15966, 1, -508.667328, 32.989693, 49.531319, 100.000000, 0, 0.000000, 0),
(15966, 2, -500.371521, 93.700302, 59.058296, 100.000000, 0, 0.000000, 0),
(15966, 3, -500.847229, 77.809677, 56.617115, 100.000000, 0, 0.000000, 0),
(15966, 4, -496.880096, 77.695992, 56.623474, 100.000000, 0, 0.000000, 0),
(15966, 5, -496.880096, 77.695992, 56.623474, 4.293510, 2000, 0.000000, 0),
(15966, 6, -496.880096, 77.695992, 56.623474, 4.660029, 13000, 0.000000, 0);

-- Add waypoints for a Hillsbrad Footman.
UPDATE `creature` SET `position_x`=-524.953, `position_y`=37.1343, `position_z`=49.556, `orientation`=5.16617 WHERE `guid`=16181;
DELETE FROM `creature_movement` WHERE `id`=16181;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
-- moving up
(16181, 1, -524.953125, 37.134331, 49.437794, 5.166174, 30000, 0.000000, 0),
(16181, 2, -524.644775, 34.173576, 49.103672, 100.000000, 0, 0.000000, 0),
(16181, 3, -501.405273, 25.876780, 50.240322, 100.000000, 0, 0.000000, 0),
(16181, 4, -474.398071, 23.163271, 52.696217, 100.000000, 0, 0.000000, 0),
(16181, 5, -458.817841, 24.766766, 53.609894, 100.000000, 0, 0.000000, 0),
(16181, 6, -419.894684, 24.117622, 54.266010, 100.000000, 0, 0.000000, 0),
(16181, 7, -408.444214, 22.353523, 54.147419, 100.000000, 0, 0.000000, 0),
(16181, 8, -386.833649, 21.020317, 54.150410, 100.000000, 0, 0.000000, 0),
(16181, 9, -362.449982, 25.536459, 54.159378, 100.000000, 0, 0.000000, 0),
(16181, 10, -354.927643, 40.747940, 54.061607, 100.000000, 0, 0.000000, 0),
(16181, 11, -351.830139, 62.261612, 54.061607, 100.000000, 0, 0.000000, 0),
(16181, 12, -353.239380, 51.102104, 54.061607, 100.000000, 0, 0.000000, 0),
(16181, 13, -355.364685, 39.198334, 54.061607, 100.000000, 0, 0.000000, 0),
(16181, 14, -360.865479, 28.650459, 54.129417, 100.000000, 0, 0.000000, 0),
(16181, 15, -364.839325, 24.786957, 54.159378, 100.000000, 0, 0.000000, 0),
(16181, 16, -373.469238, 21.967205, 54.115417, 100.000000, 0, 0.000000, 0),
(16181, 17, -400.513672, 21.661186, 54.140057, 100.000000, 0, 0.000000, 0),
(16181, 18, -430.610626, 25.320089, 54.147419, 100.000000, 0, 0.000000, 0),
(16181, 19, -445.711639, 24.788443, 53.947392, 100.000000, 0, 0.000000, 0),
(16181, 20, -448.479675, 24.238522, 53.854252, 100.000000, 0, 0.000000, 0),
(16181, 21, -448.809448, 17.255795, 53.918282, 100.000000, 0, 0.000000, 0),
(16181, 22, -437.253265, 2.263563, 54.196293, 100.000000, 0, 0.000000, 0),
(16181, 23, -428.633362, -13.346002, 54.177387, 100.000000, 0, 0.000000, 0),
(16181, 24, -452.727966, 21.059412, 53.788662, 100.000000, 0, 0.000000, 0),
(16181, 25, -463.722748, 23.250967, 53.227612, 100.000000, 0, 0.000000, 0),
(16181, 26, -488.095886, 24.224340, 51.492821, 100.000000, 0, 0.000000, 0),
(16181, 27, -495.057831, 24.578568, 50.774612, 100.000000, 0, 0.000000, 0),
(16181, 28, -526.532104, 30.838913, 48.682919, 100.000000, 0, 0.000000, 0),
(16181, 29, -545.848572, 26.218615, 47.925598, 100.000000, 0, 0.000000, 0),
(16181, 30, -551.183472, 24.542210, 47.985058, 100.000000, 0, 0.000000, 0),
(16181, 31, -568.082581, 4.791668, 47.358707, 100.000000, 0, 0.000000, 0),
(16181, 32, -568.632324, 0.855694, 47.335133, 100.000000, 0, 0.000000, 0),
(16181, 33, -544.862915, -26.760639, 45.794804, 100.000000, 0, 0.000000, 0),
(16181, 34, -535.529114, -48.917469, 45.725746, 100.000000, 0, 0.000000, 0),
(16181, 35, -533.362000, -76.927498, 45.706802, 100.000000, 0, 0.000000, 0),
(16181, 36, -536.413208, -80.868927, 45.706802, 100.000000, 10000, 0.000000, 0),
(16181, 37, -532.934387, -61.541489, 45.706802, 100.000000, 0, 0.000000, 0),
(16181, 38, -534.044922, -52.856445, 45.706802, 100.000000, 0, 0.000000, 0),
(16181, 39, -538.645386, -36.508137, 45.956802, 100.000000, 0, 0.000000, 0),
(16181, 40, -545.120422, -26.548883, 45.789738, 100.000000, 0, 0.000000, 0),
(16181, 41, -554.810852, -18.344505, 46.031536, 100.000000, 0, 0.000000, 0),
(16181, 42, -570.341553, 0.299778, 47.219929, 100.000000, 0, 0.000000, 0),
(16181, 43, -578.154114, 3.383604, 47.188511, 100.000000, 0, 0.000000, 0),
(16181, 44, -585.343567, 4.501506, 46.699139, 100.000000, 0, 0.000000, 0),
(16181, 45, -590.226868, 4.021701, 46.174015, 100.000000, 0, 0.000000, 0),
(16181, 46, -602.180664, 11.068034, 44.944153, 100.000000, 0, 0.000000, 0),
(16181, 47, -619.417847, 28.140141, 43.579044, 100.000000, 0, 0.000000, 0),
(16181, 48, -636.300049, 38.316189, 44.505733, 100.000000, 0, 0.000000, 0),
(16181, 49, -602.180664, 11.068034, 44.944153, 100.000000, 0, 0.000000, 0),
(16181, 50, -598.171021, 8.434244, 45.515690, 100.000000, 0, 0.000000, 0),
(16181, 51, -594.648010, 6.475015, 45.985413, 100.000000, 0, 0.000000, 0),
(16181, 52, -579.125549, 3.434935, 47.139843, 100.000000, 0, 0.000000, 0),
(16181, 53, -562.954651, 13.555490, 47.786812, 100.000000, 0, 0.000000, 0),
(16181, 54, -546.347656, 25.210995, 47.926968, 100.000000, 0, 0.000000, 0),
(16181, 55, -527.254333, 30.856228, 48.658539, 100.000000, 0, 0.000000, 0),
(16181, 56, -524.953125, 37.134331, 49.437794, 100.000000, 0, 0.000000, 0);

-- Add waypoints for Hillsbrad Farmer.
UPDATE `creature` SET `wander_distance`=0, `movement_type`=2 WHERE `guid`=16482;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(16482, 1, -419.904938, -46.762589, 54.137733, 100.000000, 0, 0.000000, 0),
(16482, 2, -414.036774, -45.321301, 54.425732, 100.000000, 0, 0.000000, 0),
(16482, 3, -396.013153, -42.668076, 54.503532, 100.000000, 0, 0.000000, 0),
(16482, 4, -384.351074, -44.669266, 55.984524, 100.000000, 0, 0.000000, 0),
(16482, 5, -381.067566, -58.283699, 55.780647, 100.000000, 0, 0.000000, 0),
(16482, 6, -376.971710, -79.046745, 54.270191, 100.000000, 0, 0.000000, 0),
(16482, 7, -376.361877, -83.495392, 54.517368, 100.000000, 0, 0.000000, 0),
(16482, 8, -379.800873, -98.284546, 54.391281, 100.000000, 0, 0.000000, 0),
(16482, 9, -396.139587, -110.629532, 54.633224, 100.000000, 0, 0.000000, 0),
(16482, 10, -412.749237, -106.818115, 56.575005, 100.000000, 0, 0.000000, 0),
(16482, 11, -424.794586, -90.764297, 54.172794, 100.000000, 0, 0.000000, 0),
(16482, 12, -425.502472, -76.885719, 54.172798, 100.000000, 0, 0.000000, 0),
(16482, 13, -424.572754, -61.148270, 54.172802, 100.000000, 0, 0.000000, 0),
(16482, 14, -422.338684, -49.292511, 54.172802, 100.000000, 0, 0.000000, 0);


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
