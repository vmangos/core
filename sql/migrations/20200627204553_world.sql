DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200627204553');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200627204553');
-- Add your query below.

-- remove old scripts and waypoints
DELETE FROM `creature_template_addon` WHERE `entry` = 11328;
DELETE FROM `creature_addon` WHERE `guid` IN (81252, 81249, 81348, 81349, 81250);
DELETE FROM `creature_movement` WHERE `id` IN (81252, 81249, 81348, 81349, 81250);
DELETE FROM `creature_movement_scripts` WHERE `id` IN (8125001, 8125002, 8125003, 8125204, 8125208, 8125209, 8124901, 8124904, 8124905, 8134805, 8134810, 8134811, 8134902, 8134906, 8134907);
UPDATE `creature` SET `movement_type` = 0, `wander_distance` = 0  WHERE `guid` IN (81252, 81249, 81348, 81349, 81250);


-- add corect positions
UPDATE `creature` SET `position_x` = -9535.65, `position_y` = -1329.81, `position_z` = 47.3419, `orientation` = 1.939 WHERE `guid` = 81252;
UPDATE `creature` SET `position_x` = -9529.32, `position_y` = -1323.67, `position_z` = 45.9509, `orientation` = 2.70945 WHERE `guid` = 81249;
UPDATE `creature` SET `position_x` = -9535.3, `position_y` = -1304.7, `position_z` = 44.702, `orientation` = 5.28088 WHERE `guid` = 81348;
UPDATE `creature` SET `position_x` = -9501.6, `position_y` = -1282.86, `position_z` = 43.6379, `orientation` = 6.01566 WHERE `guid` = 81349;
UPDATE `creature` SET `position_x` = -9523.21, `position_y` = -1290.25, `position_z` = 44.1174, `orientation` = 5.23877 WHERE `guid` = 81250;


-- eastvale peasant 81252
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE 'entry' = 11328;

INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (8125201, 11328, 8125201, 1, 0, 100, 1, 0, 0, 255000, 255000, 8125201, 0, 0, 'Westfall Worker 81252 - Start Waypoints OOC');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8125201, 0, 60, 1, 0, 0, 0, 0, 0, 0, 0, 81252, 0, 0, 0, 0, 0, 0, 0, 0, 'Westfall Worker 81252 - Start Waypoints');
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (8125201, 52, 81252, 0, 0, 0, 0);
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (8125202, 11328, 8125201, 1, 0, 100, 0, 0, 0, 0, 0, 8125202, 0, 0, 'Westfall Worker 81252 - Start ChopWood Emote OOC');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8125202, 0, 68, 8125201, 2, 11328, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Westfall Worker 81252 - SSFA Eastvale Peasant');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8125201, 0, 1, 234, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Westfall Worker - ChopWood Emote - Started by Event 8125202');

INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(81252, 1, -9535.65, -1329.81, 47.272, 100, 6000, 0, 8125201),
(81252, 2, -9508.88, -1333.61, 44.3237, 100, 0, 0, 0),
(81252, 3, -9498.48, -1327.6, 42.0789, 100, 0, 0, 0),
(81252, 4, -9478.76, -1307.33, 42.1843, 100, 0, 0, 0),
(81252, 5, -9466.71, -1296.88, 41.4483, 100, 2000, 0, 8125202),
(81252, 6, -9470.67, -1295.27, 41.0593, 100, 0, 0, 0),
(81252, 7, -9471.37, -1289.82, 41.1039, 100, 10000, 0, 8125203),
(81252, 8, -9497.14, -1325.79, 41.7219, 100, 0, 0, 0),
(81252, 9, -9511.88, -1333.19, 44.8482, 100, 0, 0, 0),
(81252, 10, -9523.05, -1335.57, 46.8005, 100, 0, 0, 0),
(81252, 11, -9532.64, -1333.36, 47.621, 100, 0, 0, 0),
(81252, 12, -9535.65, -1329.81, 47.272, 100, 6000, 0, 8125204);

INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8125201, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Eastvale Peasant 81252 - Emote None');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8125201, 4, 23, 89, 1, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Eastvale Peasant 81252 - Morph');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8125202, 2, 23, 308, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Eastvale Peasant 81252 - Morph');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8125203, 1, 16, 6289, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Eastvale Peasant 81252 - Play Sound -  What');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8125203, 1, 35, 0, 0, 0, 0, 81251, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Eastvale Peasant 81252 - Face Target');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8125203, 2, 16, 6288, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Eastvale Peasant 81252 - Play Sound - More Work');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8125203, 4, 39, 1061601, 0, 0, 0, 81251, 0, 9, 2, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Eastvale Peasant 81252 - Start Script Supervisor Raelene');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8125203, 8, 16, 6242, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Eastvale Peasant 81252 - Play Sound - No One Else Available');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8125203, 9, 39, 8125001, 0, 0, 0, 81348, 0, 9, 2, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Eastvale Peasant 81252 - Start Script Eastvale Peasant 81250');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8125204, 0, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1.939, 0, 'Eastvale Peasant 81252 - Orientation');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8125204, 2, 1, 234, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Eastvale Peasant 81252 - Emote ChopWood');


-- eastvale peasant 81348
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8125001, 0, 60, 1, 0, 0, 0, 0, 0, 0, 0, 81348, 0, 0, 0, 0, 0, 0, 0, 0, 'Eastvale Peasant 81348 - Start Waypoints - Started by Eastvale Peasant 81252');

INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(81348, 1, -9535.3, -1304.7, 44.6066, 100, 6000, 0, 8134801),
(81348, 2, -9525.24, -1286.03, 43.7736, 100, 0, 0, 0),
(81348, 3, -9502.34, -1283.87, 43.5437, 100, 0, 0, 0),
(81348, 4, -9472.02, -1296.85, 41.1791, 100, 0, 0, 0),
(81348, 5, -9466.69, -1296.88, 41.4499, 100, 2000, 0, 8134802),
(81348, 6, -9468.66, -1297.33, 41.4075, 100, 0, 0, 0),
(81348, 7, -9471.09, -1294.93, 41.0424, 100, 0, 0, 0),
(81348, 8, -9471.72, -1289.99, 41.0953, 100, 10000, 0, 8134803),
(81348, 9, -9497.3, -1284.53, 42.9337, 100, 0, 0, 0),
(81348, 10, -9523.47, -1284.09, 43.8342, 100, 0, 0, 0),
(81348, 11, -9535.18, -1301.59, 44.4283, 100, 0, 0, 0),
(81348, 12, -9535.3, -1304.7, 44.6075, 100, 6000, 0, 8134804);

INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8134801, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Eastvale Peasant 81348 - Emote None');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8134801, 4, 23, 89, 1, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Eastvale Peasant 81348 - Morph');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8134802, 2, 23, 308, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Eastvale Peasant 81348 - Morph');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8134803, 1, 35, 0, 0, 0, 0, 81251, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Eastvale Peasant 81348 - Face Target');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8134803, 1, 16, 6288, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Eastvale Peasant 81348 - Play Sound - More Work');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8134803, 4, 39, 1061601, 0, 0, 0, 81251, 0, 9, 2, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Eastvale Peasant 81348 - Start Script Supervisor Raelene');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8134803, 8, 16, 6284, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Eastvale Peasant 81348 - Play Sound - Right O');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8134803, 10, 39, 8124901, 0, 0, 0, 81249, 0, 9, 2, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Eastvale Peasant 81348 - Start Script Eastvale Peasant 81249');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8134804, 0, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1.939, 0, 'Eastvale Peasant 81348 - Orientation');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8134804, 2, 1, 234, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Eastvale Peasant 81348 - Emote ChopWood');


-- eastvale peasant 81249
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8124901, 0, 60, 1, 0, 0, 0, 0, 0, 0, 0, 81249, 0, 0, 0, 0, 0, 0, 0, 0, 'Eastvale Peasant 81249 - Start Waypoints - Started by Eastvale Peasant 81348');

INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(81249, 1, -9529.32, -1323.67, 45.7866, 100, 6000, 0, 8124901),
(81249, 2, -9520, -1331.45, 45.9187, 100, 0, 0, 0),
(81249, 3, -9514.88, -1332.6, 45.299, 100, 0, 0, 0),
(81249, 4, -9496.5, -1323.7, 41.4285, 100, 0, 0, 0),
(81249, 5, -9466.73, -1296.88, 41.4469, 100, 2000, 0, 8124902),
(81249, 6, -9468.69, -1297.31, 41.4041, 100, 0, 0, 0),
(81249, 7, -9470.94, -1295.14, 41.0533, 100, 0, 0, 0),
(81249, 8, -9471.44, -1289.93, 41.097, 100, 10000, 0, 8124903),
(81249, 9, -9494.73, -1320.24, 40.9404, 100, 0, 0, 0),
(81249, 10, -9514.85, -1332.59, 45.2935, 100, 0, 0, 0),
(81249, 11, -9525.68, -1325.85, 45.8462, 100, 0, 0, 0),
(81249, 12, -9529.32, -1323.67, 45.7879, 100, 6000, 0, 8124904);

INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8124901, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Eastvale Peasant 81249 - Emote None');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8124901, 4, 23, 89, 1, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Eastvale Peasant 81249 - Morph');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8124902, 2, 23, 308, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Eastvale Peasant 81249 - Morph');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8124903, 1, 35, 0, 0, 0, 0, 81251, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Eastvale Peasant 81249 - Face Target');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8124903, 1, 16, 6290, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Eastvale Peasant 81249 - Play Sound - Ready to Work');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8124903, 4, 39, 1061601, 0, 0, 0, 81251, 0, 9, 2, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Eastvale Peasant 81249 - Start Script Supervisor Raelene');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8124903, 8, 16, 6285, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Eastvale Peasant 81249 - Play Sound - AlRight');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8124903, 9, 16, 6286, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Eastvale Peasant 81249 - Play Sound - Off I go Then');
-- INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8124903, 10, 39, 8124901, 0, 0, 0, 81249, 0, 9, 2, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Eastvale Peasant 81249 - Start Script Eastvale Peasant 81249');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8124904, 0, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2.70945, 0, 'Eastvale Peasant 81249 - Orientation');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8124904, 2, 1, 234, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Eastvale Peasant 81249 - Emote ChopWood');




















-- supervisor raelen scripts
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1061601, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6891, 6892, 6890, 0, 0, 0, 0, 0, 0, 'Supervisor Raelen - Speak');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1061601, 2, 1, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Supervisor Raelen - Emote Point');




-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
