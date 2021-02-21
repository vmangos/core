DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20201216203835');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20201216203835');
-- Add your query below.


-- update cear darrow citizen template
UPDATE `creature_template` SET `auras` = '10848 17622', `ai_name`='EventAI', `level_min` = 14, `gossip_menu_id` = 3362, `speed_walk` = 1, `base_attack_time` = 2000, `ranged_attack_time` = 2000, `faction` = 35, `npc_flags` = 1 WHERE `entry` = 11277;

UPDATE `creature` SET `position_x` = 1146.79, `position_y` = -2561.22, `position_z` = 60.1145,`orientation` = 0.959931 WHERE `guid` = 13179;
UPDATE `creature` SET `position_x` = 1095.56, `position_y` = -2529.47, `position_z` = 61.1291, `orientation` = 2.37365 WHERE `guid` = 300335;
UPDATE `creature` SET `position_x` = 1093.95, `position_y` = -2528.63, `position_z` = 61.2475, `orientation` = 5.74213 WHERE `guid` = 300334;
UPDATE `creature` SET `position_x` = 1148.08, `position_y` = -2559.31, `position_z` = 60.1493, `orientation` = 4.15388 WHERE `guid` = 300337;
UPDATE `creature` SET `position_x` = 1098.58, `position_y` = -2589.77, `position_z` = 60.6845, `orientation` = 6.10865 WHERE `guid` = 300336;
UPDATE `creature` SET `position_x` = 1146.79, `position_y` = -2561.22, `position_z` = 60.1145, `orientation` = 0.959931 WHERE `guid` = 300338;
UPDATE `creature` SET `position_x` = 1026.56, `position_y` = -2514.09, `position_z` = 59.236, `orientation` = 4.49877, `movement_type` = 2 WHERE `guid` = 300339;
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(118, 11277, 0, 0, 0, 0, 1127.87, -2387.57, 59.297, 1.58825, 25, 25, 0, 100, 0, 0, 0, 0, 0, 10);
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(120, 11277, 0, 0, 0, 0, 1201.59, -2595.37, 78.5883, 2.76145, 25, 25, 0, 100, 0, 2, 0, 0, 0, 10);

REPLACE INTO `creature_addon` (`guid`, `stand_state`) VALUES
(300336, 1),
(118, 3);

INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(120, 1, 1174.25, -2610.72, 72.8297, 100, 0, 0, 0),
(120, 2, 1179.46, -2599.8, 72.8422, 100, 0, 0, 0),
(120, 3, 1187.82, -2592.99, 73.8428, 100, 0, 0, 0),
(120, 4, 1202.09, -2595.57, 78.5905, 100, 0, 0, 0),
(120, 5, 1211.82, -2600.81, 83.0063, 100, 0, 0, 0),
(120, 6, 1222.93, -2601.57, 87.2163, 100, 0, 0, 0),
(120, 7, 1233.54, -2596.76, 89.6665, 100, 0, 0, 0),
(120, 8, 1234.81, -2578.97, 90.7113, 100, 0, 0, 0),
(120, 9, 1236.69, -2551.75, 91.9315, 100, 0, 0, 0),
(120, 10, 1234.24, -2571.39, 91.0141, 100, 0, 0, 0),
(120, 11, 1236.66, -2591.24, 90.1614, 100, 0, 0, 0),
(120, 12, 1229.78, -2598.95, 88.8933, 100, 0, 0, 0),
(120, 13, 1218.81, -2601.86, 85.7477, 100, 0, 0, 0),
(120, 14, 1208.49, -2598.82, 81.4217, 100, 0, 0, 0),
(120, 15, 1194.73, -2592.63, 75.712, 100, 0, 0, 0),
(120, 16, 1187.46, -2593.08, 73.7622, 100, 0, 0, 0);

INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(300339, 1, 1037.59, -2520.08, 59.1975, 100, 0, 0, 0),
(300339, 2, 1059.84, -2529.31, 59.1416, 100, 0, 0, 0),
(300339, 3, 1078.41, -2537.18, 59.1416, 100, 0, 0, 0),
(300339, 4, 1093.91, -2541.7, 59.1415, 100, 0, 0, 0),
(300339, 5, 1098.3, -2547.17, 59.1417, 100, 0, 0, 0),
(300339, 6, 1103.02, -2558.3, 59.1417, 100, 0, 0, 0),
(300339, 7, 1107.78, -2573.6, 59.1416, 100, 0, 0, 0),
(300339, 8, 1113.42, -2588.67, 59.1417, 100, 0, 0, 0),
(300339, 9, 1118.82, -2599.45, 59.2915, 100, 0, 0, 0),
(300339, 10, 1129.65, -2610.17, 62.4416, 100, 0, 0, 0),
(300339, 11, 1143.2, -2616.22, 66.2523, 100, 0, 0, 0),
(300339, 12, 1162.21, -2620.41, 71.0543, 100, 0, 0, 0),
(300339, 13, 1150.61, -2618.12, 68.5461, 100, 0, 0, 0),
(300339, 14, 1139.77, -2615.17, 65.0578, 100, 0, 0, 0),
(300339, 15, 1126.2, -2607.7, 61.5598, 100, 0, 0, 0),
(300339, 16, 1116.77, -2595.66, 59.1916, 100, 0, 0, 0),
(300339, 17, 1110.07, -2580.98, 59.1477, 100, 0, 0, 0),
(300339, 18, 1105.93, -2565.44, 59.1414, 100, 0, 0, 0),
(300339, 19, 1101.07, -2554.54, 59.143, 100, 0, 0, 0),
(300339, 20, 1098.24, -2546.98, 59.1414, 100, 0, 0, 0),
(300339, 21, 1085.88, -2539.67, 59.161, 100, 0, 0, 0),
(300339, 22, 1067.08, -2532.35, 59.1427, 100, 0, 0, 0),
(300339, 23, 1044.73, -2523.06, 59.1417, 100, 0, 0, 0),
(300339, 24, 1029.84, -2516.75, 59.1415, 100, 0, 0, 0),
(300339, 25, 1029.75, -2499.39, 59.1623, 100, 0, 0, 0),
(300339, 26, 1030.99, -2483.29, 59.4107, 100, 0, 0, 0),
(300339, 27, 1035.7, -2468.01, 60.0058, 100, 0, 0, 0),
(300339, 28, 1053.01, -2452.51, 60.298, 100, 0, 0, 0),
(300339, 29, 1070.5, -2442.4, 61.0925, 100, 0, 0, 0),
(300339, 30, 1086.01, -2424.22, 60.9356, 100, 0, 0, 0),
(300339, 31, 1107.57, -2406.15, 59.5427, 100, 0, 0, 0),
(300339, 32, 1126.16, -2398.59, 59.4921, 100, 0, 0, 0),
(300339, 33, 1142.64, -2397.18, 59.9884, 100, 0, 0, 0),
(300339, 34, 1166.43, -2396.14, 59.8892, 100, 0, 0, 0),
(300339, 35, 1203.9, -2393.08, 60.0793, 100, 0, 0, 0),
(300339, 36, 1174.97, -2395.52, 59.949, 100, 0, 0, 0),
(300339, 37, 1150.77, -2396.8, 60.0325, 100, 0, 0, 0),
(300339, 38, 1130.93, -2397.7, 59.7421, 100, 0, 0, 0),
(300339, 39, 1114.92, -2402.71, 59.2353, 100, 0, 0, 0),
(300339, 40, 1092.08, -2418.61, 60.8714, 100, 0, 0, 0),
(300339, 41, 1076.38, -2436.89, 61.2644, 100, 0, 0, 0),
(300339, 42, 1056.62, -2450.29, 60.3203, 100, 0, 0, 0),
(300339, 43, 1039.75, -2461.33, 60.3542, 100, 0, 0, 0),
(300339, 44, 1032.71, -2475.43, 59.6458, 100, 0, 0, 0),
(300339, 45, 1030.64, -2491.08, 59.2788, 100, 0, 0, 0),
(300339, 46, 1027.25, -2510.92, 59.158, 100, 0, 0, 0);

INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1127701, 11277, 1127701, 1, 0, 100, 1, 0, 0, 22000, 22000, 1127701, 0, 0, 'Caer Darrow Citizen Emote - OOC');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1127701, 0, 39, 1127701, 0, 0, 0, 0, 0, 0, 4, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Caer Darrow Citizen - Start Script');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1127701, 0, 1, 1, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Caer Darrow Citizen - Emote');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1127701, 4, 1, 6, 0, 0, 0, 300337, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Caer Darrow Citizen 300337 - Emote');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1127701, 6, 1, 5, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Caer Darrow Citizen - Emote');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1127701, 8, 1, 1, 0, 0, 0, 300337, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Caer Darrow Citizen 300337 - Emote');
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (1127701, 52, 300338, 0, 0, 0, 0);

INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1127702, 11277, 1127702, 1, 0, 100, 1, 6000, 6000, 24000, 24000, 1127702, 0, 0, 'Caer Darrow Citizen Emote - OOC');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1127702, 0, 39, 1127702, 0, 0, 0, 0, 0, 0, 4, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Caer Darrow Citizen - Start Script');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1127702, 0, 1, 1, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Caer Darrow Citizen - Emote');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1127702, 4, 1, 6, 0, 0, 0, 300334, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Caer Darrow Citizen 300334 - Emote');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1127702, 6, 1, 5, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Caer Darrow Citizen - Emote');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1127702, 8, 1, 1, 0, 0, 0, 300334, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Caer Darrow Citizen 300334 - Emote');
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (1127702, 52, 300335, 0, 0, 0, 0);

INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES
(3362, 4118);

UPDATE `npc_text` SET `Probability0` = 1, `Probability1` = 1, `Probability2` = 1, `Probability3` = 1, `Probability4` = 1 WHERE `id` = 4118;


-- update caer darrow guardsman template
UPDATE `creature_template` SET `auras` = '10848 17622', `gossip_menu_id` = 3363, `level_max` = 55, `faction` = 35, `npc_flags` = 1, `speed_walk` = 1, `base_attack_time` = 2000, `ranged_attack_time` = 2000 WHERE `entry` = 11279;
UPDATE `creature` SET `position_x` = 1056.5, `position_y` = -2536.54, `position_z` = 59.9694, `orientation` = 2.35619 WHERE `guid` = 300342;
UPDATE `creature` SET `position_x` = 1064.06, `position_y` = -2519.78, `position_z` = 60.2259, `orientation` = 3.19395 WHERE `guid` = 300343;
UPDATE `creature` SET `position_x` = 1239.31, `position_y` = -2587.39, `position_z` = 90.4068, `orientation` = 3.66519 WHERE `guid` = 300345;
UPDATE `creature` SET `position_x` = 1245.02, `position_y` = -2597.47, `position_z` = 90.3675, `orientation` = 3.52556 WHERE `guid` = 300344;

INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES
(3363, 4119);

UPDATE `npc_text` SET `Probability0` = 1, `Probability1` = 1, `Probability2` = 1, `Probability3` = 1, `Probability4` = 1 WHERE `id` = 4119;


-- update caer darrow cannoneer template
UPDATE `creature_template` SET `auras` = '10848 17622', `level_min` = 50, `level_max` = 54, `faction` = 35, `speed_walk` = 1, `base_attack_time` = 2000, `ranged_attack_time` = 2000 WHERE `entry` = 11280;

UPDATE `creature` SET `position_x` = 1162.86, `position_y` = -2595.08, `position_z` = 75.4329, `orientation` = 2.71204 WHERE `guid` = 300347;
UPDATE `creature` SET `position_x` = 1180.07, `position_y` = -2536.72, `position_z` = 85.3681, `orientation` = 1.0821 WHERE `guid` = 300348;
UPDATE `creature` SET `position_x` = 1187.12, `position_y` = -2532.58, `position_z` = 85.3681, `orientation` = 2.16421 WHERE `guid` = 300349;
UPDATE `creature` SET `position_x` = 1163.91, `position_y` = -2591.62, `position_z` = 75.5474, `orientation` = 4.20133 WHERE `guid` = 300350;
UPDATE `creature` SET `position_x` = 1210.32, `position_y` = -2575.44, `position_z` = 94.3508, `orientation` = 4.56343 WHERE `guid` = 300351;
UPDATE `creature` SET `position_x` = 1208.19, `position_y` = -2583.32, `position_z` = 98.2479, `orientation` = 2.72271 WHERE `guid` = 300352;

REPLACE INTO `creature_addon` (`guid`, `emote_state`) VALUES
(300348, 133),
(300349, 133);


-- update magistrate marduke template
UPDATE `creature_template` SET `auras` = '10848 17622', `health_min` = 3758, `health_max` = 3758, `gossip_menu_id` = 3372, `npc_flags` = 1, `speed_walk` = 1, `base_attack_time` = 2000, `ranged_attack_time` = 2000 WHERE `entry` = 11286;
UPDATE `creature` SET `position_x` = 1245.52, `position_y` = -2616.74, `position_z` = 90.4419, `orientation` = 2.23402 WHERE `guid` = 18037;

INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES
(3372, 4130);


-- update baker masterson template
UPDATE `creature_template` SET `auras` = '10848 17622', `speed_walk` = 1, `base_attack_time` = 2000, `ranged_attack_time` = 2000 WHERE `entry` = 11287;
UPDATE `creature` SET `position_x` = 1086.09, `position_y` = -2573.8, `position_z` = 60.0421, `orientation` = 0.383972 WHERE `guid` = 300333;


-- update joseph dirte template
UPDATE `creature_template` SET `auras` = '10848 17622', `gossip_menu_id` = 3381, `npc_flags` = 1, `health_min` = 1107, `health_max` = 1107, `speed_walk` = 1, `base_attack_time` = 2000, `ranged_attack_time` = 2000 WHERE `entry` = 11316;
UPDATE `creature` SET `position_x` = 1223.27, `position_y` = -2506.41, `position_z` = 72.9261, `orientation` = 4.10152 WHERE `guid` = 300346;

INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES
(3381, 4133);

UPDATE `npc_text` SET `Probability0` = 1, `Probability1` = 1, `Probability2` = 1, `Probability3` = 1 WHERE `id` = 4133;


-- update eva sarkhoff template
UPDATE `creature_template` SET `health_min` = 3293, `health_max` = 3293, `speed_walk` = 1, `base_attack_time` = 2000, `ranged_attack_time` = 2000 WHERE `entry` = 11216;


-- update magnus frostwake template
UPDATE `creature_template` SET `auras` = '10848 17622', `npc_flags` = 4, `faction` = 35, `health_min` = 2769, `health_max` = 2769, `speed_walk` = 1, `base_attack_time` = 2000, `ranged_attack_time` = 2000 WHERE `entry` = 11278;
UPDATE `creature` SET `position_x` = 1144.51, `position_y` = -2510.08, `position_z` = 62.1604, `orientation` = 4.03171 WHERE `guid` = 300332;


-- update caer darrow horseman template
UPDATE `creature_template` SET `auras` = '17622', `gossip_menu_id` = 3363, `level_max` = 56, `faction` = 35, `npc_flags` = 1, `speed_walk` = 1, `speed_run` = 1.28968, `base_attack_time` = 2000, `ranged_attack_time` = 2000 WHERE `entry` = 11281;

INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(130, 11281, 0, 0, 0, 0, 1198.16, -2594.55, 76.9266, 3.12597, 25, 25, 0, 100, 0, 2, 0, 0, 0, 10);
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(153, 11281, 0, 0, 0, 0, 1200.16, -2591.76, 77.71333, 2.63314, 25, 25, 0, 100, 0, 0, 0, 0, 0, 10);

REPLACE INTO `creature_addon` (`guid`, `mount_display_id`) VALUES
(130, 5228),
(153, 5228);

INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES
(130, 153, 15, 3, 11);

INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(130, 1, 1120.64, -2594.72, 59.5809, 100, 0, 0, 0),
(130, 2, 1109.46, -2573.43, 59.1419, 100, 0, 0, 0),
(130, 3, 1120.76, -2554.03, 59.1422, 100, 0, 0, 0),
(130, 4, 1117.48, -2539.45, 59.142, 100, 0, 0, 0),
(130, 5, 1104.34, -2539.33, 59.2346, 100, 0, 0, 0),
(130, 6, 1081.32, -2534.15, 59.2664, 100, 0, 0, 0),
(130, 7, 1037.37, -2513.98, 59.2643, 100, 0, 0, 0),
(130, 8, 1037.09, -2480.76, 59.5437, 100, 0, 0, 0),
(130, 9, 1046.13, -2458.41, 60.3884, 100, 0, 0, 0),
(130, 10, 1072.81, -2434.54, 60.8786, 100, 0, 0, 0),
(130, 11, 1091.57, -2417.18, 60.6185, 100, 0, 0, 0),
(130, 12, 1127.22, -2398.39, 59.5734, 100, 0, 0, 0),
(130, 13, 1147.47, -2396.82, 60.015, 100, 0, 0, 0),
(130, 14, 1179.35, -2397.33, 60.0947, 100, 0, 0, 0),
(130, 15, 1209.78, -2392.84, 60.0336, 100, 0, 0, 0),
(130, 16, 1193.53, -2392.96, 60.0837, 100, 0, 0, 0),
(130, 17, 1157.57, -2398.09, 59.9849, 100, 0, 0, 0),
(130, 18, 1133.83, -2394.88, 59.7526, 100, 0, 0, 0),
(130, 19, 1105.24, -2407.41, 59.6726, 100, 0, 0, 0),
(130, 20, 1085.41, -2427.46, 61.0316, 100, 0, 0, 0),
(130, 21, 1034.59, -2475.28, 59.6437, 100, 0, 0, 0),
(130, 22, 1024.87, -2505.57, 59.1417, 100, 0, 0, 0),
(130, 23, 993.214, -2506.81, 59.2632, 100, 0, 0, 0),
(130, 24, 950.067, -2500.07, 57.5287, 100, 0, 0, 0),
(130, 25, 914.893, -2493.03, 60.5528, 100, 0, 0, 0),
(130, 26, 940.762, -2499.59, 58.92, 100, 0, 0, 0),
(130, 27, 987.705, -2507.58, 59.827, 100, 0, 0, 0),
(130, 28, 1026.47, -2517.49, 59.1416, 100, 0, 0, 0),
(130, 29, 1049.27, -2525.59, 59.1415, 100, 0, 0, 0),
(130, 30, 1082.85, -2539.36, 59.1545, 100, 0, 0, 0),
(130, 31, 1101.33, -2569.46, 59.1939, 100, 0, 0, 0),
(130, 32, 1123.6, -2607.38, 61.0704, 100, 0, 0, 0),
(130, 33, 1162.59, -2622.34, 71.3506, 100, 0, 0, 0),
(130, 34, 1194.35, -2626.21, 74.4255, 100, 0, 0, 0),
(130, 35, 1217.23, -2608.6, 84.76, 100, 0, 0, 0),
(130, 36, 1205.03, -2595.9, 79.8302, 100, 0, 0, 0),
(130, 37, 1186.37, -2594.36, 73.3604, 100, 0, 0, 0),
(130, 38, 1164.17, -2616.01, 71.3378, 100, 0, 0, 0),
(130, 39, 1138.21, -2611.25, 64.5378, 100, 0, 0, 0);


-- update rory template
UPDATE `creature_template` SET `auras` = '10848 17622', `faction` = 35, `gossip_menu_id` = 3361, `npc_flags` = 1, `speed_walk` = 1, `base_attack_time` = 2000, `ranged_attack_time` = 2000 WHERE `entry` = 11285;
UPDATE `creature` SET `position_x` = 1221.76, `position_y` = -2317.21, `position_z` = 57.1717, `movement_type` = 1, `wander_distance` = 7 WHERE `guid` = 300353;

INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES
(3361, 4117);


-- update sammy and melia template
UPDATE `creature_template` SET `auras` = '10848 17622', `speed_walk` = 1, `base_attack_time` = 2000, `ranged_attack_time` = 2000 WHERE `entry` IN (11282, 11283);

UPDATE `creature` SET `movement_type` = 2, `position_x` = 1113.59, `position_y` = -2555.59, `position_z` = 59.2532 WHERE `guid` = 300340;

UPDATE `creature` SET `position_x` = 1111.49, `position_y` = -2556.4, `position_z` = 59.2532 WHERE `guid` = 300341;

INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(11282, 1, 1113.59, -2555.59, 59.1993, 100, 129000, 0, 1128203),
(11282, 2, 1113.59, -2555.59, 59.1994, 100, 1000, 0, 1128201),
(11282, 3, 1118.4, -2545.76, 59.1689, 100, 0, 0, 0),
(11282, 4, 1109.59, -2539.25, 59.1498, 100, 0, 0, 0),
(11282, 5, 1100.85, -2547.02, 59.1427, 100, 0, 0, 0),
(11282, 6, 1109.6, -2558.2, 59.1416, 100, 6000, 0, 1128202);
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1128201, 0, 25, 1, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Melia - Run');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1128201, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 6806, 0, 0, 0, 0, 0, 0, 0, 0, 'Melia - Talk');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1128201, 3, 0, 0, 0, 0, 0, 300341, 0, 9, 2, 6807, 0, 0, 0, 0, 0, 0, 0, 0, 'Sammy - Talk');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1128201, 5, 60, 2, 0, 0, 0, 300341, 0, 9, 2, 0, 11283, 0, 0, 0, 0, 0, 0, 0, 'Melia - Start Waypoints');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1128202, 5, 0, 0, 0, 0, 0, 0, 0, 0, 4, 6808, 0, 0, 0, 0, 0, 0, 0, 0, 'Melia - Talk');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1128203, 5, 35, 0, 0, 0, 0, 300341, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Melia - Orientation');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1128203, 6, 0, 0, 0, 0, 0, 300341, 0, 9, 2, 6810, 0, 0, 0, 0, 0, 0, 0, 0, 'Sammy - Talk');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1128203, 8, 0, 0, 0, 0, 0, 0, 0, 0, 4, 6809, 0, 0, 0, 0, 0, 0, 0, 0, 'Melia - Talk');

INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(11283, 1, 1120.33, -2547.83, 59.1464, 100, 0, 0, 0),
(11283, 2, 1111.22, -2538.78, 59.1418, 100, 0, 0, 0),
(11283, 3, 1101.14, -2548.09, 59.1417, 100, 0, 0, 0),
(11283, 4, 1109.56, -2557.59, 59.1415, 100, 6000, 0, 1128302),
(11283, 5, 1111.49, -2556.4, 59.1738, 100, 1000, 0, 1128301);
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1128301, 0, 25, 1, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sammy - Run');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1128302, 0, 25, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sammy - Walk');

-- update artist renfray template
UPDATE `creature_template` SET `auras` = '' WHERE `entry` = 11936;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
