DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200706205532');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200706205532');
-- Add your query below.


-- grom gol base camp
-- add missing grom gol grunt
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `display_id`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(94748, 1064, 0, 0, 0, 0, 0, 0, -12384.4, 173.336, 3.24808, 1.01615, 300, 300, 0, 100, 0, 2, 0, 0, 0, 10);

-- add grom gol grunt waypoints
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(94748, 1, -12369, 154.027, 2.97559, 100, 50000, 0, 0),
(94748, 2, -12371.6, 155.394, 2.81416, 100, 0, 0, 0),
(94748, 3, -12374.4, 156.719, 2.84573, 100, 0, 0, 0),
(94748, 4, -12380.2, 158.36, 2.84261, 100, 0, 0, 0),
(94748, 5, -12388.9, 157.468, 2.67425, 100, 0, 0, 0),
(94748, 6, -12393.7, 153.945, 2.73388, 100, 0, 0, 0),
(94748, 7, -12396.6, 148.972, 2.8709, 100, 0, 0, 0),
(94748, 8, -12396.6, 138.978, 3.66229, 100, 13000, 0, 0),
(94748, 9, -12397.1, 140.612, 3.55516, 100, 0, 0, 0),
(94748, 10, -12397.2, 146.16, 3.04669, 100, 0, 0, 0),
(94748, 11, -12396.1, 152.329, 2.80381, 100, 0, 0, 0),
(94748, 12, -12390.6, 163.016, 2.46791, 100, 0, 0, 0),
(94748, 13, -12384.4, 173.336, 3.14583, 100, 13000, 0, 0);

-- add missing grom gol grunt
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `display_id`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(94749, 1064, 0, 0, 0, 0, 0, 0, -12372.8, 179.325, 3.28885, 2.89725, 300, 300, 0, 100, 0, 0, 0, 0, 0, 10);

-- add missing grom gol grunt
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `display_id`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(94750, 1064, 0, 0, 0, 0, 0, 0, -12374, 184.474, 3.24808, 3.34054, 300, 300, 0, 100, 0, 0, 0, 0, 0, 10);

-- add correct waypoints to grom gol grunt
DELETE FROM `creature_movement` WHERE `id` = 610;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(610, 1, -12383.7, 227.084, 2.67865, 100, 13000, 0, 0),
(610, 2, -12384.2, 224.195, 2.64434, 100, 0, 0, 0),
(610, 3, -12383.3, 215.205, 2.3636, 100, 0, 0, 0),
(610, 4, -12383.4, 206.133, 2.02113, 100, 0, 0, 0),
(610, 5, -12383.7, 203.173, 1.99872, 100, 0, 0, 0),
(610, 6, -12385, 200.433, 2.13383, 100, 0, 0, 0),
(610, 7, -12386.6, 197.907, 2.20216, 100, 0, 0, 0),
(610, 8, -12391.9, 195.553, 1.84427, 3.03687, 78000, 0, 0),
(610, 9, -12386.6, 197.907, 2.20216, 100, 0, 0, 0),
(610, 10, -12385, 200.433, 2.13383, 100, 0, 0, 0),
(610, 11, -12383.7, 203.173, 1.99872, 100, 0, 0, 0),
(610, 12, -12383.4, 206.133, 2.02113, 100, 0, 0, 0),
(610, 13, -12383.3, 215.205, 2.3636, 100, 0, 0, 0),
(610, 14, -12384.2, 224.195, 2.64434, 100, 0, 0, 0);

-- commander aggro gosh should roam
UPDATE `creature` SET `movement_type` = 1, `wander_distance` = 3 WHERE `guid` = 721;


-- rebel camp
-- add rebel watchman waypoints
UPDATE `creature` SET `movement_type` = 2 WHERE `id` = 754;
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(754, 1, -11324, -213.783, 76.5032, 2.25148, 87000, 0, 0),
(754, 2, -11327.2, -212.021, 75.9563, 100, 0, 0, 0),
(754, 3, -11334.8, -209.889, 75.2551, 100, 0, 0, 0),
(754, 4, -11342.8, -210.905, 75.2215, 100, 0, 0, 0),
(754, 5, -11346.8, -210.962, 75.2223, 100, 0, 0, 0),
(754, 6, -11354.8, -210.423, 75.2585, 100, 0, 0, 0),
(754, 7, -11366.8, -212.733, 75.2209, 100, 0, 0, 0),
(754, 8, -11370.6, -213.99, 75.2973, 100, 0, 0, 0),
(754, 9, -11376.5, -219.242, 75.0468, 100, 0, 0, 0),
(754, 10, -11379.7, -226.428, 73.4426, 100, 0, 0, 0),
(754, 11, -11381.6, -237.335, 68.7688, 100, 0, 0, 0),
(754, 12, -11382.6, -248.607, 65.2183, 100, 25000, 0, 0),
(754, 13, -11381.9, -240.936, 67.6475, 100, 0, 0, 0),
(754, 14, -11379.7, -229.946, 72.1583, 100, 0, 0, 0),
(754, 15, -11378.7, -226.508, 73.5829, 100, 0, 0, 0),
(754, 16, -11375.4, -219.386, 75.0807, 100, 0, 0, 0),
(754, 17, -11373, -216.171, 75.2465, 100, 0, 0, 0),
(754, 18, -11365.7, -212.828, 75.2215, 100, 0, 0, 0),
(754, 19, -11353.7, -211.491, 75.2339, 100, 0, 0, 0),
(754, 20, -11345.6, -211.416, 75.2236, 100, 0, 0, 0),
(754, 21, -11337.5, -210.781, 75.2219, 100, 0, 0, 0),
(754, 22, -11333.4, -210.355, 75.283, 100, 0, 0, 0);

-- add private merle waypoints
UPDATE `creature` SET `movement_type` = 2 WHERE `id` = 1421;
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(1421, 1, -11330.7, -248.137, 73.1889, 100, 20000, 0, 0),
(1421, 2, -11329.2, -244.447, 73.9503, 100, 0, 0, 0),
(1421, 3, -11328.6, -240.528, 74.545, 100, 0, 0, 0),
(1421, 4, -11327.2, -232.493, 75.1051, 100, 0, 0, 0),
(1421, 5, -11328, -229.059, 75.277, 100, 0, 0, 0),
(1421, 6, -11330.1, -225.739, 75.1965, 100, 0, 0, 0),
(1421, 7, -11329.8, -221.863, 75.2206, 100, 0, 0, 0),
(1421, 8, -11328.1, -218.944, 75.881, 100, 0, 0, 0),
(1421, 9, -11329.4, -211.039, 75.7732, 100, 0, 0, 0),
(1421, 10, -11330.4, -207.144, 75.4199, 100, 0, 0, 0),
(1421, 11, -11330.1, -201.702, 75.3271, 100, 20000, 0, 0),
(1421, 12, -11334.5, -208.484, 75.3069, 100, 0, 0, 0),
(1421, 13, -11336.9, -211.741, 75.2205, 100, 0, 0, 0),
(1421, 14, -11338.2, -215.378, 75.2206, 100, 0, 0, 0),
(1421, 15, -11337.6, -219.402, 75.2172, 100, 0, 0, 0),
(1421, 16, -11337.8, -227.284, 74.5209, 100, 10000, 0, 0),
(1421, 17, -11334.1, -225.796, 75.0422, 100, 0, 0, 0),
(1421, 18, -11331.2, -228.612, 74.9793, 100, 0, 0, 0),
(1421, 19, -11329.7, -232.287, 74.9004, 100, 0, 0, 0),
(1421, 20, -11329.3, -236.289, 74.723, 100, 0, 0, 0),
(1421, 21, -11330.2, -240.199, 74.323, 100, 0, 0, 0);


-- yojamba isle
-- zandalar headshrinker should be static
DELETE FROM `creature_movement` WHERE `id` = 282;
UPDATE `creature` SET `movement_type` = 0 WHERE `guid` IN (282, 284, 280, 285, 283);

-- add correct waypoints to zandalar headshrinker patrol
DELETE FROM `creature_movement` WHERE `id` IN (286, 287);
UPDATE `creature` SET `movement_type` = 0 WHERE `guid` = 287;
INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES
(286, 287, 5, 0, 1);
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(286, 1, -11801.2, 1248.68, 1.18973, 100, 0, 0, 0),
(286, 2, -11804.5, 1243.66, 1.19681, 100, 0, 0, 0),
(286, 3, -11808.6, 1242.5, 1.21663, 100, 0, 0, 0),
(286, 4, -11812.7, 1242.43, 1.45882, 100, 0, 0, 0),
(286, 5, -11817.4, 1241.48, 1.54158, 100, 0, 0, 0),
(286, 6, -11820.1, 1243.54, 1.86022, 100, 0, 0, 0),
(286, 7, -11822.6, 1246.61, 2.2884, 100, 0, 0, 0),
(286, 8, -11825.1, 1249.9, 2.47429, 100, 0, 0, 0),
(286, 9, -11827.5, 1253.12, 2.21873, 100, 0, 0, 0),
(286, 10, -11830, 1256.31, 2.06568, 100, 0, 0, 0),
(286, 11, -11831.8, 1259.94, 1.88211, 100, 0, 0, 0),
(286, 12, -11833.5, 1263.68, 1.87893, 100, 0, 0, 0),
(286, 13, -11835.2, 1267.41, 1.75358, 100, 0, 0, 0),
(286, 14, -11836.8, 1271.13, 1.59482, 100, 0, 0, 0),
(286, 15, -11838.4, 1274.8, 1.938, 100, 0, 0, 0),
(286, 16, -11840, 1278.49, 2.28543, 100, 0, 0, 0),
(286, 17, -11841.6, 1282.29, 2.44659, 100, 0, 0, 0),
(286, 18, -11843.7, 1286.47, 2.47736, 100, 0, 0, 0),
(286, 19, -11841.5, 1285.48, 2.33165, 100, 0, 0, 0),
(286, 20, -11838.5, 1283.37, 2.11056, 100, 0, 0, 0),
(286, 21, -11834.5, 1281.89, 1.38936, 100, 0, 0, 0),
(286, 22, -11832.8, 1278.43, 1.35931, 100, 0, 0, 0),
(286, 23, -11831.5, 1274.62, 1.42271, 100, 0, 0, 0),
(286, 24, -11830.4, 1270.69, 1.41211, 100, 0, 0, 0),
(286, 25, -11829.3, 1266.75, 1.48572, 100, 0, 0, 0),
(286, 26, -11828.2, 1262.79, 1.54585, 100, 0, 0, 0),
(286, 27, -11827.2, 1258.83, 1.85202, 100, 0, 0, 0),
(286, 28, -11826, 1254.72, 2.24698, 100, 0, 0, 0),
(286, 29, -11825.7, 1250.54, 2.46791, 100, 0, 0, 0),
(286, 30, -11822.5, 1248.5, 2.45389, 100, 0, 0, 0),
(286, 31, -11818.8, 1246.89, 2.34011, 100, 0, 0, 0),
(286, 32, -11815.1, 1245.38, 2.06279, 100, 0, 0, 0),
(286, 33, -11812.3, 1242.41, 1.37126, 100, 0, 0, 0),
(286, 34, -11809.4, 1244.36, 1.44271, 100, 0, 0, 0),
(286, 35, -11806.3, 1247.39, 1.40787, 100, 0, 0, 0),
(286, 36, -11803.3, 1250.64, 1.40226, 100, 0, 0, 0),
(286, 37, -11800.3, 1253.93, 1.30904, 100, 0, 0, 0),
(286, 38, -11798.3, 1257.94, 1.40569, 100, 0, 0, 0),
(286, 39, -11794.9, 1259.86, 1.38988, 100, 0, 0, 0),
(286, 40, -11791.2, 1261.36, 1.48794, 100, 0, 0, 0),
(286, 41, -11787.4, 1262.75, 1.90648, 100, 0, 0, 0),
(286, 42, -11783.5, 1264.15, 2.11844, 100, 0, 0, 0),
(286, 43, -11779.3, 1265.66, 2.4056, 100, 0, 0, 0),
(286, 44, -11775.7, 1266.94, 2.86616, 100, 0, 0, 0),
(286, 45, -11772.4, 1269.22, 3.37324, 100, 0, 0, 0),
(286, 46, -11767.8, 1270.9, 3.41008, 100, 0, 0, 0),
(286, 47, -11768.4, 1274.85, 3.51901, 100, 0, 0, 0),
(286, 48, -11766.6, 1278.32, 2.89803, 100, 0, 0, 0),
(286, 49, -11764, 1281.65, 2.82379, 100, 0, 0, 0),
(286, 50, -11762, 1284.49, 2.78354, 100, 0, 0, 0),
(286, 51, -11759.2, 1287.61, 2.61564, 100, 0, 0, 0),
(286, 52, -11756.7, 1290.55, 1.93895, 100, 0, 0, 0),
(286, 53, -11753.7, 1293.53, 1.46968, 100, 0, 0, 0),
(286, 54, -11751.8, 1297.33, 1.05243, 100, 0, 0, 0),
(286, 55, -11748, 1301.76, 1.38028, 100, 0, 0, 0),
(286, 56, -11749.5, 1300.35, 1.06056, 100, 0, 0, 0),
(286, 57, -11751.2, 1297.42, 0.999978, 100, 0, 0, 0),
(286, 58, -11753.1, 1294, 1.39147, 100, 0, 0, 0),
(286, 59, -11754.9, 1290.31, 1.79511, 100, 0, 0, 0),
(286, 60, -11757, 1286.93, 2.18695, 100, 0, 0, 0),
(286, 61, -11759.8, 1283.82, 2.16487, 100, 0, 0, 0),
(286, 62, -11762.2, 1280.43, 2.13831, 100, 0, 0, 0),
(286, 63, -11763.5, 1276.28, 2.52108, 100, 0, 0, 0),
(286, 64, -11765.7, 1273.12, 3.12197, 100, 0, 0, 0),
(286, 65, -11768.7, 1270.08, 3.45316, 100, 0, 0, 0),
(286, 66, -11771.4, 1267.16, 3.25428, 100, 0, 0, 0),
(286, 67, -11774.9, 1265.39, 2.8891, 100, 0, 0, 0),
(286, 68, -11778.8, 1263.81, 2.28986, 100, 0, 0, 0),
(286, 69, -11782.5, 1262.35, 1.9445, 100, 0, 0, 0),
(286, 70, -11786, 1261, 1.73866, 100, 0, 0, 0),
(286, 71, -11789.6, 1260.1, 1.46629, 100, 0, 0, 0),
(286, 72, -11792.7, 1257.47, 1.15522, 100, 0, 0, 0),
(286, 73, -11795.6, 1254.51, 1.11812, 100, 0, 0, 0),
(286, 74, -11798.5, 1251.46, 1.13584, 100, 0, 0, 0);

-- update exzhal - execution event
DELETE FROM `creature_movement` WHERE `id` = 312;
DELETE FROM `creature_movement_scripts` WHERE `id` IN (1491001, 1491002, 1491003);
UPDATE `creature` SET `position_x` = -11828.3, `position_y` = 1246.78, `position_z` = 2.3936, `orientation` = 2.40855, `movement_type` = 0 WHERE `guid` = 312;
UPDATE `creature` SET `position_x` = -11835.7, `position_y` = 1258.31, `position_z` = 2.26483, `orientation` = 5.68977 WHERE `guid` = 314;
UPDATE `creature` SET `position_x` = -11838.5, `position_y` = 1256.12, `position_z` = 2.15493, `orientation` = 5.81195 WHERE `guid` = 2368;

-- update exzhal scripts
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 14910;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1491001, 14910, 0, 1, 0, 100, 1, 20000, 20000, 1800000, 1800000, 1491001, 0, 0, 'Exzhal - Execution Event');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1491001, 0, 39, 1491001, 0, 0, 0, 0, 0, 0, 4, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Exzhal - Start Script');
DELETE FROM `event_scripts` WHERE `id`=1491001;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1491001, 0, 4, 147, 3, 2, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Exzhal - Remove Npc Flags Quest Giver & Gossip');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1491001, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 10306, 0, 0, 0, 0, 0, 0, 0, 0, 'Exzhal - Say Text');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1491001, 1, 1, 25, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Exzhal - Emote Point');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1491001, 5, 35, 0, 0, 0, 0, 12165, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Exzhal - Orientation');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1491001, 5, 15, 23949, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Exzhal - Cast Spell');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1491001, 5, 82, 12165, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Exzhal - Respawn Gobject');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1491001, 5, 60, 3, 0, 0, 0, 314, 0, 9, 2, 0, 14911, 0, 0, 0, 0, 0, 0, 0, 'Exzhal -  Start Waypoints (Creature ID: 14911)');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1491001, 30, 60, 3, 0, 0, 0, 2368, 0, 9, 2, 0, 14912, 0, 0, 0, 0, 0, 0, 0, 'Exzhal -  Start Waypoints (Creature ID: 14912) ');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1491001, 41, 0, 0, 0, 0, 0, 0, 0, 0, 4, 10309, 0, 0, 0, 0, 0, 0, 0, 0, 'Exzhal - Say Text');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1491001, 42, 1, 25, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Exzhal - Emote Point');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1491001, 47, 0, 0, 0, 0, 0, 2368, 0, 9, 2, 10310, 0, 0, 0, 0, 0, 0, 0, 0, 'Exzhal - Say Text (Creature ID: 14912)');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1491001, 53, 0, 0, 0, 0, 0, 0, 0, 0, 4, 10311, 0, 0, 0, 0, 0, 0, 0, 0, 'Exzhal - Say Text');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1491001, 55, 2, 138, 8, 0, 0, 2368, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Exzhal - Set Bytes1 (Creature ID: 14912)');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1491001, 59, 0, 0, 0, 0, 0, 0, 0, 0, 4, 10312, 0, 0, 0, 0, 0, 0, 0, 0, 'Exzhal - Say Text');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1491001, 65, 0, 0, 0, 0, 0, 2368, 0, 9, 2, 10313, 0, 0, 0, 0, 0, 0, 0, 0, 'Exzhal - Say Text (Creature ID: 14912)');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1491001, 72, 0, 0, 0, 0, 0, 0, 0, 0, 4, 10314, 0, 0, 0, 0, 0, 0, 0, 0, 'Exzhal - Say Text');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1491001, 73, 1, 15, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Exzhal - Emote');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1491001, 79, 0, 2, 0, 0, 0, 2368, 0, 9, 2, 10315, 0, 0, 0, 0, 0, 0, 0, 0, 'Exzhal - Say Text (Creature ID: 14912)');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1491001, 82, 0, 0, 0, 0, 0, 2368, 0, 9, 2, 10316, 0, 0, 0, 0, 0, 0, 0, 0, 'Exzhal - Say Text (Creature ID: 14912)');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1491001, 94, 0, 0, 0, 0, 0, 0, 0, 0, 4, 10317, 0, 0, 0, 0, 0, 0, 0, 0, 'Exzhal - Say Text');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1491001, 98, 0, 2, 0, 0, 0, 2368, 0, 9, 2, 10315, 0, 0, 0, 0, 0, 0, 0, 0, 'Exzhal - Say Text (Creature ID: 14912)');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1491001, 100, 0, 0, 0, 0, 0, 2368, 0, 9, 2, 10318, 0, 0, 0, 0, 0, 0, 0, 0, 'Exzhal - Say Text (Creature ID: 14912)');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1491001, 109, 0, 0, 0, 0, 0, 2368, 0, 9, 2, 10319, 0, 0, 0, 0, 0, 0, 0, 0, 'Exzhal - Say Text (Creature ID: 14912)');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1491001, 118, 0, 0, 0, 0, 0, 0, 0, 0, 4, 10320, 0, 0, 0, 0, 0, 0, 0, 0, 'Exzhal - Say Text');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1491001, 119, 1, 25, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Exzhal - Emote Point');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1491001, 128, 0, 2, 0, 0, 0, 2368, 0, 9, 2, 10321, 0, 0, 0, 0, 0, 0, 0, 0, 'Exzhal - Say Text (Creature ID: 14912)');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1491001, 132, 0, 0, 0, 0, 0, 2368, 0, 9, 2, 10322, 0, 0, 0, 0, 0, 0, 0, 0, 'Exzhal - Say Text (Creature ID: 14912)');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1491001, 133, 1, 25, 0, 0, 0, 2368, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Exzhal - Emote (Creature ID: 14912)');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1491001, 143, 0, 0, 0, 0, 0, 2368, 0, 9, 2, 10323, 0, 0, 0, 0, 0, 0, 0, 0, 'Exzhal - Say Text (Creature ID: 14912)');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1491001, 150, 0, 0, 0, 0, 0, 2368, 0, 9, 2, 10324, 0, 0, 0, 0, 0, 0, 0, 0, 'Exzhal - Say Text (Creature ID: 14912)');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1491001, 153, 1, 25, 0, 0, 0, 2368, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Exzhal - Emote (Creature ID: 14912)');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1491001, 162, 0, 0, 0, 0, 0, 0, 0, 0, 4, 10325, 0, 0, 0, 0, 0, 0, 0, 0, 'Exzhal - Say Text');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1491001, 167, 0, 2, 0, 0, 0, 2368, 0, 9, 2, 10315, 0, 0, 0, 0, 0, 0, 0, 0, 'Exzhal - Say Text (Creature ID: 14912)');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1491001, 170, 0, 0, 0, 0, 0, 2368, 0, 9, 2, 10326, 0, 0, 0, 0, 0, 0, 0, 0, 'Exzhal - Say Text (Creature ID: 14912)');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1491001, 177, 0, 0, 0, 0, 0, 2368, 0, 9, 2, 10327, 0, 0, 0, 0, 0, 0, 0, 0, 'Exzhal - Say Text (Creature ID: 14912)');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1491001, 185, 0, 0, 0, 0, 0, 2368, 0, 9, 2, 10328, 0, 0, 0, 0, 0, 0, 0, 0, 'Exzhal - Say Text (Creature ID: 14912)');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1491001, 185, 0, 2, 0, 0, 0, 2368, 0, 9, 2, 10329, 0, 0, 0, 0, 0, 0, 0, 0, 'Exzhal - Say Text (Creature ID: 14912)');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1491001, 192, 0, 0, 0, 0, 0, 0, 0, 0, 4, 10330, 0, 0, 0, 0, 0, 0, 0, 0, 'Exzhal - Say Text');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1491001, 198, 0, 0, 0, 0, 0, 2368, 0, 9, 2, 10331, 0, 0, 0, 0, 0, 0, 0, 0, 'Exzhal - Say Text (Creature ID: 14912)');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1491001, 205, 15, 23950, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Exzhal - Cast Spell');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1491001, 207, 15, 23950, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Exzhal - Cast Spell');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1491001, 209, 15, 23950, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Exzhal - Cast Spell');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1491001, 212, 0, 2, 0, 0, 0, 0, 0, 0, 4, 10332, 0, 0, 0, 0, 0, 0, 0, 0, 'Exzhal - Say Text');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1491001, 216, 0, 0, 0, 0, 0, 2368, 0, 9, 2, 10333, 0, 0, 0, 0, 0, 0, 0, 0, 'Exzhal - Say Text (Creature ID: 14912)');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1491001, 217, 1, 11, 0, 0, 0, 2368, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Exzhal - Emote (Creature ID: 14912)');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1491001, 219, 35, 1, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 2.40855, 0, 'Exzhal - Orientation');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1491001, 226, 0, 0, 0, 0, 0, 2368, 0, 9, 2, 10334, 0, 0, 0, 0, 0, 0, 0, 0, 'Exzhal - Say Text (Creature ID: 14912)');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1491001, 231, 0, 2, 0, 0, 0, 2368, 0, 9, 2, 10335, 0, 0, 0, 0, 0, 0, 0, 0, 'Exzhal - Say Text (Creature ID: 14912)');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1491001, 232, 35, 1, 0, 0, 0, 314, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0.8801, 0, 'Exzhal - Orientation (Creature ID: 14912)');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1491001, 232, 2, 138, 0, 0, 0, 2368, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Exzhal - Set Bytes1 (Creature ID: 14912)');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1491001, 233, 48, 50000, 0, 0, 0, 2368, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Exzhal - Deal 50k Damage (Creature ID: 14912)');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1491001, 233, 1, 36, 0, 0, 0, 314, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Exzhal - Play Emote (Creature ID: 14911)');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1491001, 236, 0, 2, 0, 0, 0, 314, 0, 9, 2, 10336, 0, 0, 0, 0, 0, 0, 0, 0, 'Exzhal - Say Text (Creature ID: 14911)');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1491001, 240, 41, 0, 0, 0, 0, 12165, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Exzhal - Despawn Gobject');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1491001, 240, 4, 147, 3, 1, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Exzhal - Add Npc Flags Quest Giver & Gossip');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1491001, 245, 18, 0, 0, 0, 0, 2368, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Exzhal - Despawn Creature (Creature ID: 14912)');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1491001, 245, 34, 2, 0, 0, 0, 2368, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Exzhal - Set Home (Creature ID: 14912)');

-- update zandalari enforcer scripts
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(14911, 1, -11835.7, 1258.31, 2.14127, 100, 5000, 0, 1491101),
(14911, 2, -11834.4, 1256.34, 2.20851, 100, 0, 0, 0),
(14911, 3, -11835.8, 1254.65, 2.17807, 100, 10000, 0, 1491102),
(14911, 4, -11833.1, 1258.41, 2.05416, 100, 7000, 0, 1491103),
(14911, 5, -11826.3, 1253.94, 2.31451, 100, 0, 0, 0),
(14911, 6, -11820.2, 1248.14, 2.43893, 100, 0, 0, 0),
(14911, 7, -11819.1, 1244.68, 2.02891, 100, 0, 0, 0),
(14911, 8, -11826, 1240.57, 1.53743, 100, 198000, 0, 1491104),
(14911, 9, -11826.9, 1250.12, 2.4449, 100, 0, 0, 0),
(14911, 10, -11835.7, 1258.31, 2.14137, 100, 5000, 0, 1491105);
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1491101, 0, 35, 0, 0, 0, 0, 312, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Zandalar Enforcer - Orientation');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1491101, 2, 0, 0, 0, 0, 0, 0, 0, 0, 4, 10307, 0, 0, 0, 0, 0, 0, 0, 0, 'Zandalar Enforcer - Say Text');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1491101, 3, 1, 66, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Zandalar Enforcer -  Emote');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1491102, 1, 35, 0, 0, 0, 0, 2368, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Zandalar Enforcer - Orientation');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1491102, 2, 1, 69, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Zandalar Enforcer - Emote Work');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1491102, 6, 1, 30, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Zandalar Enforcer - Emote None');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1491102, 7, 11, 11027, 25, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Zandalar Enforcer - Activate Gameobject');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1491103, 2, 35, 0, 0, 0, 0, 2368, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Zandalar Enforcer - Orientation');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1491103, 3, 0, 0, 0, 0, 0, 0, 0, 0, 4, 10308, 0, 0, 0, 0, 0, 0, 0, 0, 'Zandalar Enforcer - Say Text');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1491103, 4, 1, 25, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Zandalar Enforcer - Emote');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1491104, 0, 25, 1, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Zandalar Enforcer - Run');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1491104, 1, 35, 0, 0, 0, 0, 312, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Zandalar Enforcer - Orientation');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1491105, 0, 25, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Zandalar Enforcer - Walk');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1491105, 1, 35, 0, 0, 0, 0, 312, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Zandalar Enforcer - Orientation');

-- update captured hakari zealot scripts
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(14912, 1, -11838.5, 1256.12, 2.07029, 100, 0, 0, 0),
(14912, 2, -11834.8, 1254.37, 2.22775, 100, 0, 0, 0),
(14912, 3, -11827.2, 1253, 2.34738, 100, 0, 0, 0),
(14912, 4, -11823.4, 1244.34, 2.03717, 100, 240000, 0, 1491201);
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1491201, 1, 35, 0, 0, 0, 0, 312, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Captured Hakkari Zealot - Orientation');


-- ziata jai ruins
-- add skullsplitter patrol
UPDATE `creature` SET `position_x` = -12505.6, `position_y` = -748.509, `position_z` = 37.4733 WHERE `guid` IN (1405, 1406, 1407);
UPDATE `creature` SET `movement_type` = 2, `wander_distance` = 0 WHERE `guid` = 1405;
UPDATE `creature` SET `movement_type` = 0, `wander_distance` = 0 WHERE `guid`IN (1407, 1406);
INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES
(1405, 1406, 4, 3, 11),
(1405, 1407, 4, 17, 11);
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(1405, 1, -12505.6, -748.509, 37.4733, 100, 0, 0, 0),
(1405, 2, -12502.9, -758.203, 37.4595, 100, 0, 0, 0),
(1405, 3, -12518.9, -790.723, 37.9103, 100, 0, 0, 0),
(1405, 4, -12526.8, -804.906, 38.3087, 100, 0, 0, 0),
(1405, 5, -12542.9, -822.725, 41.0361, 100, 0, 0, 0),
(1405, 6, -12553.8, -834.302, 43.8454, 100, 0, 0, 0),
(1405, 7, -12565.8, -844.824, 46.4901, 100, 0, 0, 0),
(1405, 8, -12570.5, -850.869, 48.1285, 100, 0, 0, 0),
(1405, 9, -12576, -861.556, 49.8767, 100, 0, 0, 0),
(1405, 10, -12582.1, -886.265, 48.7459, 100, 30000, 0, 0),
(1405, 11, -12593.4, -896.793, 50.4639, 100, 0, 0, 0),
(1405, 12, -12629.7, -882.075, 52.303, 100, 0, 0, 0),
(1405, 13, -12644.5, -875.323, 52.3698, 100, 0, 0, 0),
(1405, 14, -12672, -868.502, 51.0329, 100, 0, 0, 0),
(1405, 15, -12697.5, -879.137, 54.5915, 100, 0, 0, 0),
(1405, 16, -12729.3, -883.734, 55.2066, 100, 0, 0, 0),
(1405, 17, -12757.2, -885.654, 53.3629, 100, 0, 0, 0),
(1405, 18, -12773.4, -885.254, 53.8699, 100, 0, 0, 0),
(1405, 19, -12785.3, -883.501, 55.0784, 100, 0, 0, 0),
(1405, 20, -12796, -879.049, 57.0381, 100, 0, 0, 0),
(1405, 21, -12805.1, -871.277, 58.5779, 100, 0, 0, 0),
(1405, 22, -12816.2, -860.279, 60.3142, 100, 0, 0, 0),
(1405, 23, -12834, -844.302, 56.9032, 100, 0, 0, 0),
(1405, 24, -12858.2, -824.133, 54.5293, 100, 30000, 0, 0),
(1405, 25, -12854.2, -823.224, 54.699, 100, 0, 0, 0),
(1405, 26, -12842.9, -818.939, 55.3834, 100, 0, 0, 0),
(1405, 27, -12834.8, -810.795, 58.4522, 100, 0, 0, 0),
(1405, 28, -12825.9, -803.276, 61.0659, 100, 0, 0, 0),
(1405, 29, -12815.3, -797.553, 61.8574, 100, 0, 0, 0),
(1405, 30, -12799.9, -792.906, 62.2464, 100, 0, 0, 0),
(1405, 31, -12779.4, -795.687, 61.6628, 100, 0, 0, 0),
(1405, 32, -12755.7, -798.848, 60.0422, 100, 0, 0, 0),
(1405, 33, -12739.5, -799.549, 60.8576, 100, 0, 0, 0),
(1405, 34, -12723.3, -799.902, 60.9062, 100, 0, 0, 0),
(1405, 35, -12702.9, -799.558, 60.7436, 100, 0, 0, 0),
(1405, 36, -12674.7, -796.753, 59.3341, 100, 0, 0, 0),
(1405, 37, -12664.7, -791.207, 59.1141, 100, 0, 0, 0),
(1405, 38, -12651.7, -782.325, 56.1493, 100, 0, 0, 0),
(1405, 39, -12623.1, -773.396, 44.1436, 100, 0, 0, 0),
(1405, 40, -12606.7, -762.372, 41.8668, 100, 0, 0, 0),
(1405, 41, -12600, -757.836, 42.3014, 100, 0, 0, 0),
(1405, 42, -12586.7, -748.843, 44.0255, 100, 0, 0, 0),
(1405, 43, -12579.8, -744.662, 43.5917, 100, 0, 0, 0),
(1405, 44, -12569.5, -738.798, 40.9609, 100, 0, 0, 0),
(1405, 45, -12559.2, -735.755, 39.1732, 100, 30000, 0, 0),
(1405, 46, -12552.4, -734.985, 39.1693, 100, 0, 0, 0),
(1405, 47, -12548.5, -733.411, 39.1987, 100, 0, 0, 0),
(1405, 48, -12545.2, -731.308, 39.4668, 100, 0, 0, 0),
(1405, 49, -12540.8, -724.491, 39.8921, 100, 30000, 0, 0),
(1405, 50, -12537.6, -731.317, 38.9928, 100, 0, 0, 0),
(1405, 51, -12525.3, -737.404, 38.9094, 100, 0, 0, 0);

-- add skullsplitter patrol
UPDATE `creature` SET `position_x` = -12762, `position_y` = -890.346, `position_z` = 52.7586 WHERE `guid` IN (1408, 2539, 1409);
UPDATE `creature` SET `movement_type` = 2, `wander_distance` = 0 WHERE `guid` = 1408;
UPDATE `creature` SET `movement_type` = 0, `wander_distance` = 0 WHERE `guid` IN (2539, 1409);
INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES
(1408, 2539, 4, 3, 11),
(1408, 1409, 4, 17, 11);
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(1408, 1, -12762, -890.346, 52.7586, 100, 0, 0, 0),
(1408, 2, -12730.1, -887.774, 55.5323, 100, 0, 0, 0),
(1408, 3, -12714.3, -885.025, 53.4196, 100, 0, 0, 0),
(1408, 4, -12699.1, -879.825, 54.4919, 100, 0, 0, 0),
(1408, 5, -12681.8, -869.564, 52.6233, 100, 0, 0, 0),
(1408, 6, -12674.4, -869.165, 51.188, 100, 0, 0, 0),
(1408, 7, -12666.7, -871.35, 51.4219, 100, 0, 0, 0),
(1408, 8, -12650.9, -873.392, 52.5857, 100, 0, 0, 0),
(1408, 9, -12638.7, -876.715, 52.3258, 100, 0, 0, 0),
(1408, 10, -12628.2, -882.72, 52.3613, 100, 0, 0, 0),
(1408, 11, -12614.1, -890.653, 53.2341, 100, 0, 0, 0),
(1408, 12, -12607.4, -894.497, 52.9249, 100, 0, 0, 0),
(1408, 13, -12596.1, -898.259, 50.9869, 100, 0, 0, 0),
(1408, 14, -12584.8, -891.217, 48.1915, 100, 30000, 0, 0),
(1408, 15, -12581.3, -875.678, 49.6814, 100, 0, 0, 0),
(1408, 16, -12563.8, -839.487, 46.2891, 100, 0, 0, 0),
(1408, 17, -12548.5, -821.83, 42.4999, 100, 0, 0, 0),
(1408, 18, -12528.2, -802.737, 38.3867, 100, 0, 0, 0),
(1408, 19, -12517.3, -790.733, 37.6283, 100, 0, 0, 0),
(1408, 20, -12504.1, -761.325, 37.2703, 100, 0, 0, 0),
(1408, 21, -12504.8, -749.482, 37.1879, 100, 30000, 0, 0),
(1408, 22, -12525.3, -740.081, 39.0834, 100, 0, 0, 0),
(1408, 23, -12531, -735.172, 38.9141, 100, 0, 0, 0),
(1408, 24, -12534.3, -733.351, 38.8407, 100, 0, 0, 0),
(1408, 25, -12541.9, -731.708, 39.2788, 100, 0, 0, 0),
(1408, 26, -12549.2, -722.585, 40.6961, 100, 0, 0, 0),
(1408, 27, -12556.6, -713.417, 39.0303, 100, 0, 0, 0),
(1408, 28, -12563.1, -708.661, 39.1064, 100, 0, 0, 0),
(1408, 29, -12573.6, -702.577, 39.3474, 100, 0, 0, 0),
(1408, 30, -12583.1, -690.176, 39.9489, 100, 0, 0, 0),
(1408, 31, -12588.2, -679.075, 39.7129, 100, 0, 0, 0),
(1408, 32, -12595, -664.307, 39.9864, 100, 0, 0, 0),
(1408, 33, -12599.4, -652.97, 39.8231, 100, 0, 0, 0),
(1408, 34, -12599.9, -645.003, 39.8947, 100, 0, 0, 0),
(1408, 35, -12597.3, -637.418, 40.4238, 100, 0, 0, 0),
(1408, 36, -12594.9, -629.737, 40.2418, 100, 0, 0, 0),
(1408, 37, -12594.6, -625.751, 40.4491, 100, 0, 0, 0),
(1408, 38, -12595.2, -613.827, 38.8148, 100, 0, 0, 0),
(1408, 39, -12594.7, -593.58, 36.5525, 100, 0, 0, 0),
(1408, 40, -12600.2, -579.04, 34.2872, 100, 0, 0, 0),
(1408, 41, -12611.5, -562.366, 31.9708, 100, 0, 0, 0),
(1408, 42, -12620, -553.872, 31.7559, 100, 0, 0, 0),
(1408, 43, -12630.2, -547.365, 31.936, 100, 0, 0, 0),
(1408, 44, -12640, -540.128, 32.2561, 100, 0, 0, 0),
(1408, 45, -12645.3, -534.178, 31.9934, 100, 0, 0, 0),
(1408, 46, -12651.1, -523.508, 31.2743, 100, 0, 0, 0),
(1408, 47, -12665, -509.139, 29.4158, 100, 0, 0, 0),
(1408, 48, -12671.9, -506.452, 29.5088, 100, 0, 0, 0),
(1408, 49, -12679.5, -504.044, 29.5854, 100, 0, 0, 0),
(1408, 50, -12686.7, -500.509, 29.0686, 100, 0, 0, 0),
(1408, 51, -12689.9, -498.088, 29.1882, 100, 0, 0, 0),
(1408, 52, -12693, -487.472, 29.2998, 100, 30000, 0, 0),
(1408, 53, -12693.2, -491.533, 29.438, 100, 0, 0, 0),
(1408, 54, -12700.5, -494.845, 30.2639, 100, 0, 0, 0),
(1408, 55, -12716.4, -491.824, 29.6841, 100, 0, 0, 0),
(1408, 56, -12741.2, -516.6, 30.2787, 100, 0, 0, 0),
(1408, 57, -12767.2, -535.472, 34.1034, 100, 0, 0, 0),
(1408, 58, -12801.5, -530.203, 36.8804, 100, 0, 0, 0),
(1408, 59, -12821.9, -537.812, 46.1076, 100, 0, 0, 0),
(1408, 60, -12836.6, -544.153, 47.7871, 100, 0, 0, 0),
(1408, 61, -12864.3, -543.38, 47.7794, 100, 0, 0, 0),
(1408, 62, -12879.5, -554.229, 48.8942, 100, 0, 0, 0),
(1408, 63, -12877.9, -568.303, 50.6014, 100, 0, 0, 0),
(1408, 64, -12862.4, -579.861, 53.7743, 100, 0, 0, 0),
(1408, 65, -12856.3, -589.198, 54.669, 100, 0, 0, 0),
(1408, 66, -12859.6, -604.335, 56.8006, 100, 30000, 0, 0),
(1408, 67, -12878, -624.164, 52.679, 100, 0, 0, 0),
(1408, 68, -12891.5, -632.918, 51.3038, 100, 0, 0, 0),
(1408, 69, -12901.8, -644.776, 51.2709, 100, 0, 0, 0),
(1408, 70, -12906.7, -660.089, 51.0987, 100, 0, 0, 0),
(1408, 71, -12924.3, -691.778, 51.1009, 100, 30000, 0, 0),
(1408, 72, -12910.9, -724.205, 51.1811, 100, 0, 0, 0),
(1408, 73, -12906, -772.41, 51.5967, 100, 0, 0, 0),
(1408, 74, -12896, -789.531, 51.9119, 100, 0, 0, 0),
(1408, 75, -12880.5, -807.939, 54.6357, 100, 0, 0, 0),
(1408, 76, -12858.4, -823.952, 54.5228, 100, 30000, 0, 0),
(1408, 77, -12854.9, -825.987, 54.6521, 100, 0, 0, 0),
(1408, 78, -12844.5, -832.331, 55.2178, 100, 0, 0, 0),
(1408, 79, -12834.5, -838.677, 56.7409, 100, 0, 0, 0),
(1408, 80, -12825.1, -845.945, 59.0249, 100, 0, 0, 0),
(1408, 81, -12817.3, -854.857, 61.2077, 100, 0, 0, 0),
(1408, 82, -12804.1, -870.033, 59.086, 100, 0, 0, 0),
(1408, 83, -12780.5, -884.721, 54.3719, 100, 0, 0, 0);

-- add skullsplitter patrol
UPDATE `creature` SET `position_x` = -12663.6, `position_y` = -508.931, `position_z` = 29.5798 WHERE `guid` IN (2516, 2517, 2518);
UPDATE `creature` SET `movement_type` = 2, `wander_distance` = 0 WHERE `guid` = 2516;
INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES
(2516, 2517, 4, 3, 11),
(2516, 2518, 4, 17, 11);
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(2516, 1, -12663.6, -508.931, 29.5798, 100, 0, 0, 0),
(2516, 2, -12640.7, -540.48, 32.2609, 100, 0, 0, 0),
(2516, 3, -12616.7, -554.255, 31.883, 100, 0, 0, 0),
(2516, 4, -12605.3, -572.367, 33.3503, 100, 0, 0, 0),
(2516, 5, -12593.4, -587.799, 35.9762, 100, 0, 0, 0),
(2516, 6, -12596.4, -635.345, 40.4541, 100, 0, 0, 0),
(2516, 7, -12601.9, -650.487, 39.7871, 100, 0, 0, 0),
(2516, 8, -12588.7, -676.953, 39.759, 100, 0, 0, 0),
(2516, 9, -12574.3, -701.697, 39.288, 100, 0, 0, 0),
(2516, 10, -12555.6, -712.722, 38.7759, 100, 0, 0, 0),
(2516, 11, -12540.6, -722.316, 39.7217, 100, 30000, 0, 0),
(2516, 12, -12536.7, -723.138, 39.1306, 100, 0, 0, 0),
(2516, 13, -12532.8, -724.051, 38.9953, 100, 0, 0, 0),
(2516, 14, -12527.8, -730.385, 38.8131, 100, 0, 0, 0),
(2516, 15, -12519.3, -738.912, 38.653, 100, 0, 0, 0),
(2516, 16, -12512.8, -743.277, 38.4347, 100, 0, 0, 0),
(2516, 17, -12506.4, -747.885, 37.7085, 100, 0, 0, 0),
(2516, 18, -12504.5, -751.205, 37.1529, 100, 0, 0, 0),
(2516, 19, -12504.5, -759.188, 37.3704, 100, 0, 0, 0),
(2516, 20, -12508.4, -770.642, 36.6436, 100, 0, 0, 0),
(2516, 21, -12512.6, -782.086, 37.2624, 100, 0, 0, 0),
(2516, 22, -12516, -789.548, 37.5997, 100, 0, 0, 0),
(2516, 23, -12521.6, -795.084, 37.9125, 100, 0, 0, 0),
(2516, 24, -12524.7, -797.578, 38.2524, 100, 0, 0, 0),
(2516, 25, -12528.8, -808.885, 38.1886, 100, 0, 0, 0),
(2516, 26, -12529.8, -812.729, 37.8954, 100, 0, 0, 0),
(2516, 27, -12536.3, -817.095, 39.3836, 100, 0, 0, 0),
(2516, 28, -12542.5, -821.944, 40.8698, 100, 0, 0, 0),
(2516, 29, -12553.6, -833.322, 43.7255, 100, 0, 0, 0),
(2516, 30, -12562.2, -841.567, 45.7154, 100, 0, 0, 0),
(2516, 31, -12570.4, -850.198, 47.9946, 100, 0, 0, 0),
(2516, 32, -12574.5, -857.03, 49.26, 100, 0, 0, 0),
(2516, 33, -12580.4, -872.052, 49.8233, 100, 0, 0, 0),
(2516, 34, -12581.4, -886.514, 48.5391, 100, 30000, 0, 0),
(2516, 35, -12584, -889.562, 48.3149, 100, 0, 0, 0),
(2516, 36, -12589.7, -895.215, 49.4118, 100, 0, 0, 0),
(2516, 37, -12592.9, -897.15, 50.3205, 100, 0, 0, 0),
(2516, 38, -12604.7, -895.833, 52.3949, 100, 0, 0, 0),
(2516, 39, -12615.9, -891.214, 53.0229, 100, 0, 0, 0),
(2516, 40, -12625.2, -883.652, 52.4735, 100, 0, 0, 0),
(2516, 41, -12635.8, -877.763, 52.2481, 100, 0, 0, 0),
(2516, 42, -12655.5, -873.401, 52.3643, 100, 0, 0, 0),
(2516, 43, -12667.4, -871.234, 51.3445, 100, 0, 0, 0),
(2516, 44, -12679.4, -870.943, 52.0598, 100, 0, 0, 0),
(2516, 45, -12686.6, -873.635, 53.3724, 100, 0, 0, 0),
(2516, 46, -12705.1, -881.311, 53.8575, 100, 0, 0, 0),
(2516, 47, -12728.6, -886.687, 55.3895, 100, 0, 0, 0),
(2516, 48, -12768.8, -888.368, 53.0689, 100, 0, 0, 0),
(2516, 49, -12784.3, -885.804, 54.4875, 100, 0, 0, 0),
(2516, 50, -12798.3, -878.592, 57.7295, 100, 0, 0, 0),
(2516, 51, -12806.5, -869.737, 58.8736, 100, 0, 0, 0),
(2516, 52, -12813.9, -860.724, 60.5766, 100, 0, 0, 0),
(2516, 53, -12837.7, -839.618, 56.168, 100, 0, 0, 0),
(2516, 54, -12858.8, -823.824, 54.5093, 100, 30000, 0, 0),
(2516, 55, -12855, -824.006, 54.6605, 100, 0, 0, 0),
(2516, 56, -12851, -823.168, 54.8511, 100, 0, 0, 0),
(2516, 57, -12841.3, -816.427, 55.588, 100, 0, 0, 0),
(2516, 58, -12838.6, -813.54, 56.4768, 100, 0, 0, 0),
(2516, 59, -12830.3, -805.415, 60.0935, 100, 0, 0, 0),
(2516, 60, -12816.4, -797.57, 61.8897, 100, 0, 0, 0),
(2516, 61, -12802.2, -789.839, 61.9909, 100, 0, 0, 0),
(2516, 62, -12790, -779.394, 61.5143, 100, 0, 0, 0),
(2516, 63, -12779.7, -766.841, 60.8136, 100, 0, 0, 0),
(2516, 64, -12770.9, -758.718, 60.3391, 100, 0, 0, 0),
(2516, 65, -12756.5, -752.015, 62.8276, 100, 0, 0, 0),
(2516, 66, -12745.7, -746.585, 63.667, 100, 0, 0, 0),
(2516, 67, -12737.3, -737.875, 63.9252, 100, 0, 0, 0),
(2516, 68, -12732.5, -727.264, 64.8006, 100, 0, 0, 0),
(2516, 69, -12727.8, -703.421, 63.0317, 100, 0, 0, 0),
(2516, 70, -12724, -687.973, 59.9778, 100, 0, 0, 0),
(2516, 71, -12721.6, -680.692, 57.5211, 100, 0, 0, 0),
(2516, 72, -12712.4, -663.815, 44.1446, 100, 0, 0, 0),
(2516, 73, -12707.8, -649.805, 38.5891, 100, 0, 0, 0),
(2516, 74, -12708.2, -633.98, 40.951, 100, 0, 0, 0),
(2516, 75, -12709.6, -614.003, 39.81, 100, 0, 0, 0),
(2516, 76, -12711.2, -585.787, 36.8269, 100, 0, 0, 0),
(2516, 77, -12716.1, -558.074, 33.4151, 100, 0, 0, 0),
(2516, 78, -12721.2, -542.879, 31.1939, 100, 0, 0, 0),
(2516, 79, -12729.9, -529.278, 30.0038, 100, 0, 0, 0),
(2516, 80, -12734.8, -518.281, 30.0734, 100, 0, 0, 0),
(2516, 81, -12734.6, -510.688, 29.8902, 100, 0, 0, 0),
(2516, 82, -12728.5, -500.512, 29.0533, 100, 0, 0, 0),
(2516, 83, -12719.4, -487.5, 28.7728, 100, 0, 0, 0),
(2516, 84, -12712.5, -477.983, 29.2377, 100, 0, 0, 0),
(2516, 85, -12704.8, -467.574, 30.1593, 100, 30000, 0, 0),
(2516, 86, -12701.2, -468.997, 30.1922, 100, 0, 0, 0),
(2516, 87, -12694.1, -478.794, 29.5006, 100, 0, 0, 0),
(2516, 88, -12691.8, -498.844, 29.2305, 100, 0, 0, 0);

-- add skullsplitter patrol
UPDATE `creature` SET `position_x` = -12808.8, `position_y` = -790.261, `position_z` = 61.4108 WHERE `guid` IN (857, 858, 859);
UPDATE `creature` SET `movement_type` = 2, `wander_distance` = 0 WHERE `guid` = 857;
INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES
(857, 858, 4, 3, 11),
(857, 859, 4, 17, 11);
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(857, 1, -12808.8, -790.261, 61.4108, 100, 0, 0, 0),
(857, 2, -12798.2, -784.473, 62.2808, 100, 0, 0, 0),
(857, 3, -12786.1, -774.162, 61.2438, 100, 0, 0, 0),
(857, 4, -12771.3, -761.481, 60.316, 100, 0, 0, 0),
(857, 5, -12756.8, -754.828, 62.6106, 100, 0, 0, 0),
(857, 6, -12749.6, -751.143, 63.3112, 100, 0, 0, 0),
(857, 7, -12739, -739.303, 63.8856, 100, 0, 0, 0),
(857, 8, -12735.1, -732.225, 64.3525, 100, 0, 0, 0),
(857, 9, -12728.2, -713.169, 64.4459, 100, 0, 0, 0),
(857, 10, -12725.2, -701.539, 62.6778, 100, 0, 0, 0),
(857, 11, -12720.4, -686.493, 59.1679, 100, 0, 0, 0),
(857, 12, -12712.7, -663.773, 44.3386, 100, 0, 0, 0),
(857, 13, -12708.5, -649.872, 38.7075, 100, 0, 0, 0),
(857, 14, -12708.3, -641.947, 38.9813, 100, 0, 0, 0),
(857, 15, -12707.5, -622.09, 41.0591, 100, 0, 0, 0),
(857, 16, -12698.9, -609.684, 39.5117, 100, 0, 0, 0),
(857, 17, -12684.6, -602.683, 38.1895, 100, 0, 0, 0),
(857, 18, -12675.1, -590.482, 36.8763, 100, 0, 0, 0),
(857, 19, -12668.8, -572.061, 32.4446, 100, 0, 0, 0),
(857, 20, -12666.3, -556.351, 33.5797, 100, 0, 0, 0),
(857, 21, -12664.8, -528.21, 32.2876, 100, 0, 0, 0),
(857, 22, -12664.2, -512.286, 29.5436, 100, 0, 0, 0),
(857, 23, -12663.6, -492.078, 29.7032, 100, 0, 0, 0),
(857, 24, -12663, -483.57, 29.5811, 100, 0, 0, 0),
(857, 25, -12662.8, -475.462, 30.1972, 100, 0, 0, 0),
(857, 26, -12663.4, -463.4, 30.1114, 100, 0, 0, 0),
(857, 27, -12662.3, -452.503, 27.4379, 100, 30000, 0, 0),
(857, 28, -12663.4, -468.134, 30.4193, 100, 0, 0, 0),
(857, 29, -12664.5, -480.243, 29.7838, 100, 0, 0, 0),
(857, 30, -12672.3, -493.402, 30.0779, 100, 0, 0, 0),
(857, 31, -12680.3, -502.59, 29.6548, 100, 0, 0, 0),
(857, 32, -12690.2, -500.314, 29.1463, 100, 0, 0, 0),
(857, 33, -12701.2, -495.446, 30.33, 100, 0, 0, 0),
(857, 34, -12713, -493.72, 30.5647, 100, 0, 0, 0),
(857, 35, -12729, -504.393, 30.0121, 100, 0, 0, 0),
(857, 36, -12738.7, -517.266, 30.0721, 100, 0, 0, 0),
(857, 37, -12753.3, -530.768, 33.1066, 100, 0, 0, 0),
(857, 38, -12771.2, -539.731, 34.6667, 100, 0, 0, 0),
(857, 39, -12797.1, -532.118, 36.3557, 100, 0, 0, 0),
(857, 40, -12818.5, -536.019, 44.5534, 100, 0, 0, 0),
(857, 41, -12832.5, -542.717, 47.8185, 100, 0, 0, 0),
(857, 42, -12848, -544.823, 49.4328, 100, 0, 0, 0),
(857, 43, -12868.2, -543.583, 47.659, 100, 0, 0, 0),
(857, 44, -12881.8, -556.548, 48.9577, 100, 0, 0, 0),
(857, 45, -12876.7, -569.919, 50.9357, 100, 0, 0, 0),
(857, 46, -12860.1, -580.463, 54.1022, 100, 0, 0, 0),
(857, 47, -12855.3, -596.746, 54.9877, 100, 30000, 0, 0),
(857, 48, -12876.4, -620.271, 53.5266, 100, 0, 0, 0),
(857, 49, -12895.1, -635.351, 51.4542, 100, 0, 0, 0),
(857, 50, -12904.4, -657.241, 51.1925, 100, 0, 0, 0),
(857, 51, -12927, -692.569, 51.0642, 100, 30000, 0, 0),
(857, 52, -12911.1, -720.953, 51.1509, 100, 0, 0, 0),
(857, 53, -12907.9, -760.966, 51.3873, 100, 0, 0, 0),
(857, 54, -12900.2, -783.897, 51.7958, 100, 0, 0, 0),
(857, 55, -12890.5, -796.604, 52.4773, 100, 0, 0, 0),
(857, 56, -12876.6, -811.234, 54.5698, 100, 0, 0, 0),
(857, 57, -12859.3, -826.326, 54.4844, 100, 30000, 0, 0),
(857, 58, -12856.3, -825.979, 54.5954, 100, 0, 0, 0),
(857, 59, -12844.4, -816.441, 55.3631, 100, 0, 0, 0),
(857, 60, -12837, -807.25, 58.0551, 100, 0, 0, 0),
(857, 61, -12827.3, -800.899, 60.6489, 100, 0, 0, 0);












-- add private thorsen waypoints and scripts ** delete old creature movement scripts
UPDATE `creature` SET `position_x` = -11313.9, `position_y` = -202.766, `position_z` = 75.395 WHERE `id` = 738;
UPDATE `creature_template` SET `npc_flags` = 1 WHERE `entry` = 738;
DELETE FROM `creature_movement` WHERE `id` = 2243;INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(738, 1, -11313.9, -202.766, 75.395, 100, 0, 0, 73801),
(738, 2, -11316.8, -203.916, 75.316, 100, 0, 0, 0),
(738, 3, -11324.6, -212.077, 76.2363, 100, 0, 0, 0),
(738, 4, -11328.2, -218.913, 75.8114, 100, 0, 0, 0),
(738, 5, -11333.7, -223.069, 75.2037, 100, 0, 0, 0),
(738, 6, -11347.6, -215.984, 75.2442, 100, 0, 0, 0),
(738, 7, -11358.6, -212.341, 75.2207, 100, 0, 0, 0),
(738, 8, -11370, -215.514, 75.2442, 100, 0, 0, 0),
(738, 9, -11377.6, -223.995, 74.3537, 100, 0, 0, 0),
(738, 10, -11379.3, -234.53, 70.0932, 100, 0, 0, 0),
(738, 11, -11381.5, -249.342, 65.1676, 100, 0, 0, 0),
(738, 12, -11384.3, -264.911, 61.4105, 100, 0, 0, 0),
(738, 13, -11389.4, -273.725, 59.6832, 100, 1000, 0, 73802),
(738, 14, -11396.6, -284.985, 58.3481, 100, 0, 0, 0),
(738, 15, -11415.7, -287.402, 53.9826, 100, 0, 0, 0),
(738, 16, -11426.8, -287.418, 50.4211, 100, 0, 0, 0),
(738, 17, -11448.8, -287.209, 43.3921, 100, 0, 0, 0),
(738, 18, -11480.8, -294.045, 36.0647, 100, 0, 0, 0),
(738, 19, -11506.7, -313.858, 35.807, 100, 0, 0, 0),
(738, 20, -11516.2, -320.712, 35.7982, 100, 0, 0, 0),
(738, 21, -11524.1, -328.567, 35.7574, 100, 0, 0, 0),
(738, 22, -11527.6, -353.22, 37.7469, 100, 30000, 0, 73803),
(738, 23, -11527.6, -353.22, 37.7469, 100, 1000, 0, 73804),
(738, 24, -11523.1, -344.517, 37.5403, 100, 0, 0, 0),
(738, 25, -11508.1, -315.891, 35.7581, 100, 0, 0, 0),
(738, 26, -11480.8, -294.045, 36.0666, 100, 0, 0, 0),
(738, 27, -11459.6, -288.214, 40.3782, 100, 0, 0, 0),
(738, 28, -11426.2, -287.765, 50.558, 100, 0, 0, 0),
(738, 29, -11403.8, -286.564, 56.93, 100, 0, 0, 0),
(738, 30, -11396.6, -284.985, 58.3481, 100, 0, 0, 0),
(738, 31, -11384.7, -257.563, 62.7445, 100, 1000, 0, 73805),
(738, 32, -11383.4, -249.876, 64.8444, 100, 0, 0, 0),
(738, 33, -11382.6, -242.23, 67.2165, 100, 0, 0, 0),
(738, 34, -11382.2, -234.665, 69.8806, 100, 0, 0, 0),
(738, 35, -11380.8, -227.514, 73.12, 100, 0, 0, 0),
(738, 36, -11379.2, -224.26, 74.126, 100, 0, 0, 0),
(738, 37, -11374.4, -217.811, 75.21, 100, 0, 0, 0),
(738, 38, -11368.3, -212.911, 75.2508, 100, 0, 0, 0),
(738, 39, -11360.5, -210.667, 75.2206, 100, 0, 0, 0),
(738, 40, -11356.5, -210.498, 75.2252, 100, 0, 0, 0),
(738, 41, -11348.4, -210.834, 75.2222, 100, 0, 0, 0),
(738, 42, -11344.3, -210.761, 75.2211, 100, 0, 0, 0),
(738, 43, -11336.4, -209.551, 75.2204, 100, 0, 0, 0),
(738, 44, -11328.8, -206.55, 75.391, 100, 0, 0, 0),
(738, 45, -11318.5, -202.401, 75.6196, 100, 0, 0, 0),
(738, 46, -11313.9, -202.766, 75.395, 100, 30000, 0, 73806);


INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (73801, 1, 0, 0, 0, 0, 0, 0, 0, 0, 4, 102, 0, 0, 0, 0, 0, 0, 0, 0, 'Private Thorsen - Speak');

INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (73802, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 103, 0, 0, 0, 0, 0, 0, 0, 0, 'Private Thorsen - Speak');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (73802, 0, 25, 1, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Private Thorsen - Run');

INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (73803, 1, 0, 0, 0, 0, 0, 0, 0, 0, 4, 23, 0, 0, 0, 0, 0, 0, 0, 0, 'Private Thorsen - Speak');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (73803, 1, 10, 775, 198000, 0, 0, 0, 0, 0, 4, 1, 77501, 6, 7, -11516.7, -434.378, 40.5358, 0, 0, 'Private Thorsen - Summon Kurzens Agent');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (73803, 2, 10, 775, 198000, 0, 0, 0, 0, 0, 4, 1, 77502, 6, 7, -11516.7, -434.378, 40.5358, 0, 0, 'Private Thorsen - Summon Kurzens Agent 2');

INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (73804, 1, 0, 0, 0, 0, 0, 0, 0, 0, 4, 105, 0, 0, 0, 0, 0, 0, 0, 0, 'Private Thorsen - Speak');

INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (73804, 1, 0, 0, 0, 0, 0, 0, 0, 0, 4, 105, 0, 0, 0, 0, 0, 0, 0, 0, 'Private Thorsen - Speak');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (73806, 0, 35, 0, 0, 0, 0, 1398, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Private Thorsen - Orientation');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (73806, 2, 0, 0, 0, 0, 0, 0, 0, 0, 4, 106, 0, 0, 0, 0, 0, 0, 0, 0, 'Private Thorsen - Speak');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (73806, 7, 0, 0, 0, 0, 0, 1398, 0, 9, 2, 108, 0, 0, 0, 0, 0, 0, 0, 0, 'Private Thorsen - Speak (Creature ID: 733)');

















-- add kurzens agent 1 waypoints and scripts
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (77501, 0, 60, 3, 0, 0, 0, 0, 0, 0, 4, 0, 77501, 0, 0, 0, 0, 0, 0, 0, 'Kurzens Agent - Start Waypoints');

INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(77501, 1, -11516.7, -434.378, 40.5358, 100, 0, 0, 77501),
(77501, 2, -11516, -424.896, 38.3987, 100, 0, 0, 0),
(77501, 3, -11517.3, -405.868, 37.0146, 100, 0, 0, 0),
(77501, 4, -11519, -397.098, 37.9161, 100, 2000, 0, 77502),
(77501, 5, -11519.3, -389.269, 39.008, 100, 0, 0, 0),
(77501, 6, -11517.6, -380.275, 39.3757, 100, 0, 0, 0),
(77501, 7, -11515.9, -371.952, 38.6723, 100, 0, 0, 0),
(77501, 8, -11517.8, -363.71, 38.0627, 100, 0, 0, 0),
(77501, 9, -11518.9, -358.243, 37.6753, 100, 30000, 0, 77503),
(77501, 10, -11518.3, -361.352, 37.8621, 100, 0, 0, 0),
(77501, 11, -11517.1, -377.9, 39.1602, 100, 0, 0, 0),
(77501, 12, -11518.4, -384.31, 39.5131, 100, 0, 0, 0),
(77501, 13, -11519.5, -393.299, 38.4269, 100, 0, 0, 0),
(77501, 14, -11518.4, -400.074, 37.6105, 100, 0, 0, 0),
(77501, 15, -11515.5, -415.856, 37.4521, 100, 0, 0, 0),
(77501, 16, -11516.7, -434.378, 40.5358, 100, 0, 0, 77505);

INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (77501, 0, 22, 35, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kurzens Agent - Set Faction');

INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (77502, 0, 25, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kurzens Agent - Walk');

INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (77503, 0, 22, 43, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kurzens Agent - Set Faction');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (77503, 1, 0, 0, 0, 0, 0, 0, 0, 0, 4, 24, 0, 0, 0, 0, 0, 0, 0, 0, 'Kurzens Agent - Speak');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (77503, 1, 26, 0, 0, 0, 0, 2243, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kurzens Agent - Attack');

INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (77505, 0, 18, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kurzens Agent - Despawn');




-- add kurzens agent 2 waypoints and scripts
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (77502, 0, 60, 3, 0, 0, 0, 0, 0, 0, 4, 0, 77502, 0, 0, 0, 0, 0, 0, 0, 'Kurzens Agent 2 - Start Waypoints');

INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(77502, 1, -11516.7, -434.378, 40.5358, 100, 0, 0, 77501),
(77502, 2, -11516, -424.896, 38.3987, 100, 0, 0, 0),
(77502, 3, -11517.3, -405.868, 37.0146, 100, 0, 0, 0),
(77502, 4, -11518.4, -400.074, 37.6105, 100, 2000, 0, 77502),
(77502, 5, -11519, -397.098, 37.9161, 100, 0, 0, 0),
(77502, 6, -11519.3, -389.269, 39.008, 100, 0, 0, 0),
(77502, 7, -11517.6, -380.275, 39.3757, 100, 0, 0, 0),
(77502, 8, -11515.9, -371.952, 38.6723, 100, 0, 0, 0),
(77502, 9, -11517.8, -363.71, 38.0627, 100, 0, 0, 0),
(77502, 10, -11518.3, -361.352, 37.8621, 100, 30000, 0, 77504),
(77502, 11, -11517.1, -377.9, 39.1602, 100, 0, 0, 0),
(77502, 12, -11518.4, -384.31, 39.5131, 100, 0, 0, 0),
(77502, 13, -11519.5, -393.299, 38.4269, 100, 0, 0, 0),
(77502, 14, -11518.4, -400.074, 37.6105, 100, 0, 0, 0),
(77502, 15, -11515.5, -415.856, 37.4521, 100, 0, 0, 0),
(77502, 16, -11516.7, -434.378, 40.5358, 100, 0, 0, 77505);


INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (77504, 0, 22, 43, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kurzens Agent - Set Faction');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (77504, 1, 0, 0, 0, 0, 0, 0, 0, 0, 4, 101, 0, 0, 0, 0, 0, 0, 0, 0, 'Kurzens Agent - Speak');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (77504, 1, 26, 0, 0, 0, 0, 2243, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kurzens Agent - Attack');





























-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
