DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200620213802');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200620213802');
-- Add your query below.


-- update general items
-- add correct positions **update all**
UPDATE `creature` SET `position_x` = -10598, `position_y` = 1160.48, `position_z` = 38.4546, `orientation` = 6.16101 WHERE `guid` = 45524;

-- correct movement and enable event ai
UPDATE `creature` SET `movement_type` = 0, `wander_distance` = 0  WHERE `guid` IN (89861, 44296);
DELETE FROM `creature_addon` WHERE `guid` IN (45524, 44296, 89861, 45477, 45521);
UPDATE `creature_template` SET `ai_name` = "EventAI" WHERE entry = 842;

-- add custom gameobjects
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(371650, 105568, 0, -10642, 1108.38, 35.6399, 0.925025, 0, 0, 0.961275, -0.27559, 900, 900, 100, 1, 0, 0, 0, 10);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(371651, 105568, 0, -10650.9, 1115.66, 35.6114, 0.925025, 0, 0, 0.466008, 0.884781, 900, 900, 100, 1, 0, 0, 0, 10);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(371652, 105568, 0, -10641, 1109.96, 35.6341, 0.925025, 0, 0, 0.465647, 0.88497, 900, 900, 100, 1, 0, 0, 0, 10);


-- lumberjack 89861
-- ai_events and ai_scripts
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (8986101, 842, 8986101, 1, 0, 100, 1, 0, 0, 225000, 225000, 8986101, 0, 0, 'lumberjack 89861 - start waypoints');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8986101, 0, 60, 1, 0, 0, 0, 0, 0, 0, 0, 89861, 0, 0, 0, 0, 0, 0, 0, 0, 'lumberjack 89861 - start waypoints');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (8986102, 842, 0, 1, 0, 100, 0, 0, 0, 0, 0, 8986102, 0, 0, 'lumberjacks - start chopping');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8986102, 0, 68, 8986101, 2, 842, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'lumberjacks - start chopping');
-- event script to start lumberjacks chopping
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8986101, 0, 1, 234, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'lumberjacks - start chopping');
-- condition so that this only applies to 89861
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (8986101, 52, 89861, 0, 0, 0, 0);

-- waypoints
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(89861, 1, -10584.8, 1144.22, 40.2218, 3.85718, 6000, 0, 8986101),
(89861, 2, -10582.4, 1140.78, 39.6677, 100, 0, 0, 0),
(89861, 3, -10583.4, 1137.05, 39.0197, 100, 0, 0, 0),
(89861, 4, -10599.1, 1117.84, 37.7277, 100, 0, 0, 0),
(89861, 5, -10612.5, 1104.19, 35.7086, 100, 0, 0, 0),
(89861, 6, -10623.1, 1099.17, 33.8978, 100, 0, 0, 0),
(89861, 7, -10629, 1098.85, 33.7041, 100, 0, 0, 0),
(89861, 8, -10631.9, 1101.75, 34.2869, 100, 0, 0, 0),
(89861, 9, -10635.8, 1104.81, 34.3713, 100, 0, 0, 0),
(89861, 10, -10637.6, 1106.16, 35.5819, 100, 0, 0, 0),
(89861, 11, -10640.9, 1109.15, 35.6318, 100, 6000, 0, 8986102),
(89861, 12, -10638, 1106.67, 35.6192, 100, 0, 0, 0),
(89861, 13, -10633.4, 1102.46, 34.4237, 100, 0, 0, 0),
(89861, 14, -10628.3, 1098.14, 33.7034, 100, 0, 0, 0),
(89861, 15, -10617.2, 1100.93, 34.7838, 100, 0, 0, 0),
(89861, 16, -10608.4, 1108.52, 36.6023, 100, 0, 0, 0),
(89861, 17, -10597.7, 1119.31, 37.9428, 100, 0, 0, 0),
(89861, 18, -10582.2, 1138.37, 39.1972, 100, 0, 0, 0),
(89861, 19, -10582.3, 1141.47, 39.7775, 100, 0, 0, 0),
(89861, 20, -10583.1, 1143.39, 40.0436, 100, 0, 0, 0),
(89861, 21, -10584.8, 1144.22, 40.2218, 3.85718, 4000, 0, 8986103);

-- movement scripts
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8986101, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'lumberjack 89861 - emote none');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8986101, 4, 23, 89, 1, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'lumberjack 89861 - morph');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8986102, 1, 82, 371650, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'lumberjack 89861 - spawn woodpile');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8986102, 2, 23, 308, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'lumberjack 89861 - morph');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8986102, 6, 39, 4552101, 0, 0, 0, 45521, 0, 9, 2, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'lumberjack 89861 - start woodworker 45521 event script');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8986102, 0, 39, 4552401, 0, 0, 0, 45524, 0, 9, 2, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'lumberjack 89861 - start lumberjack 45524 event script');
-- event script to start lumberjacks 45524 scripts
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4552401, 0, 60, 1, 0, 0, 0, 0, 0, 0, 0, 45524, 0, 0, 0, 0, 0, 0, 0, 0, 'start lumberjack 45524 script - started by lumberjack 89861');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8986103, 0, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3.85718, 0, 'lumberjack 89861 - set orientation');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8986103, 2, 1, 234, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'lumberjack 89861 - emote chop wood');

-- woodworker 45521 scripts started by 89861
-- event script
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4552101, 0, 60, 3, 0, 0, 0, 0, 0, 0, 0, 0, 4552101, 0, 0, 0, 0, 0, 0, 0, 'woodworker 45521 - start waypoints');

-- waypoints
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(4552101, 1, -10646.4, 1113.33, 35.6273, 100, 0, 0, 4552102),
(4552101, 2, -10642.5, 1109.16, 35.6479, 100, 6000, 0, 4552103),
(4552101, 3, -10646.4, 1113.33, 35.6273, 100, 0, 0, 4552101);

-- movement scripts
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4552101, 0, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.925025, 0, 'woodworker 45521 - set orientation');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4552101, 0, 1, 69, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'woodworker 45521 - start work');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4552101, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 2552, 0, 0, 0, 0, 0, 0, 0, 0, 'woodworker 45521 - emote');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4552102, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'woodworker 45521 - stop working');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4552103, 3, 1, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'woodworker 45521 - kneel');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4552103, 5, 41, 0, 0, 0, 0, 371650, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'woodworker 45521 - remove woodpile');


-- lumberjack 45524
-- waypoints
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(45524, 1, -10598, 1160.48, 38.4546, 6.16101, 6000, 0, 4552401),
(45524, 2, -10617.4, 1155.97, 35.0127, 100, 0, 0, 0),
(45524, 3, -10625.9, 1148.23, 33.9496, 100, 0, 0, 0),
(45524, 4, -10631.4, 1138.24, 33.7479, 100, 0, 0, 0),
(45524, 5, -10627.2, 1121.33, 33.716, 100, 0, 0, 0),
(45524, 6, -10624, 1106.93, 33.8152, 100, 0, 0, 0),
(45524, 7, -10624.1, 1100.77, 33.7959, 100, 0, 0, 0),
(45524, 8, -10626.7, 1098.35, 33.7094, 100, 0, 0, 0),
(45524, 9, -10630.9, 1099.76, 33.8695, 100, 0, 0, 0),
(45524, 10, -10635.8, 1105, 34.3641, 100, 0, 0, 0),
(45524, 11, -10640.3, 1108.47, 35.6244, 100, 6000, 0, 4552402),
(45524, 12, -10635.1, 1104.41, 34.4399, 100, 0, 0, 0),
(45524, 13, -10630.2, 1098.87, 33.7023, 100, 0, 0, 0),
(45524, 14, -10626.3, 1098.61, 33.7164, 100, 0, 0, 0),
(45524, 15, -10623.7, 1101.87, 33.8117, 100, 0, 0, 0),
(45524, 16, -10624.5, 1109.31, 33.7766, 100, 0, 0, 0),
(45524, 17, -10627.9, 1123.15, 33.7433, 100, 0, 0, 0),
(45524, 18, -10630.4, 1140.12, 33.7574, 100, 0, 0, 0),
(45524, 19, -10624.5, 1149.79, 34.0631, 100, 0, 0, 0),
(45524, 20, -10616, 1156.68, 35.1913, 100, 0, 0, 0),
(45524, 21, -10598, 1160.48, 38.4546, 6.16101, 4000, 0, 4552403);

-- movement scripts
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4552401, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'lumberjack 45524 - emote none');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4552401, 4, 23, 89, 1, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'lumberjack 45524 - morph');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4552402, 1, 82, 371652, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'lumberjack 45524 - spawn woodpile');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4552402, 2, 23, 308, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'lumberjack 45524 - morph');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4552402, 6, 39, 4552102, 0, 0, 0, 45521, 0, 9, 2, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'lumberjack 45524 - start woodworker 45521 event script');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4552402, 13, 39, 4547701, 0, 0, 0, 45477, 0, 9, 2, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'lumberjack 45524 - start lumberjack 45477 event script');
-- event script to start lumberjacks 45477 scripts
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4547701, 0, 60, 1, 0, 0, 0, 0, 0, 0, 0, 45477, 0, 0, 0, 0, 0, 0, 0, 0, 'start lumberjack 45477 script - started by lumberjack 45524');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4552403, 0, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6.16101, 0, 'lumberjack - set orientation');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4552403, 2, 1, 234, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'lumberjack - emote chop wood');

-- woodworker 45521 scripts started by 45524
-- event script
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4552102, 0, 60, 3, 0, 0, 0, 0, 0, 0, 0, 0, 4552102, 0, 0, 0, 0, 0, 0, 0, 'woodworker 45521 - start waypoints');

-- waypoints
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(4552102, 1, -10646.4, 1113.33, 35.6273, 100, 0, 0, 4552102),
(4552102, 2, -10641.7, 1110.64, 35.6482, 100, 6000, 0, 4552104),
(4552102, 3, -10646.4, 1113.33, 35.6273, 100, 0, 0, 4552101);

-- movement scripts
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4552104, 3, 1, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'woodworker - kneel');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4552104, 5, 41, 0, 0, 0, 0, 371652, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'woodworker - remove woodpile');


-- lumberjack 45477
-- waypoints
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(45477, 1, -10645.2, 1141.44, 33.7162, 100, 6000, 0, 4547701),
(45477, 2, -10649.9, 1136.17, 34.205, 100, 0, 0, 0),
(45477, 3, -10658.1, 1129.51, 34.1976, 100, 0, 0, 0),
(45477, 4, -10660.5, 1127.72, 34.1976, 100, 0, 0, 0),
(45477, 5, -10661, 1125.53, 34.1976, 100, 0, 0, 0),
(45477, 6, -10659.6, 1123.15, 34.1976, 100, 0, 0, 0),
(45477, 7, -10654.1, 1119.39, 35.6409, 100, 0, 0, 0),
(45477, 8, -10648.7, 1115.64, 35.6121, 100, 6000, 0, 4547702),
(45477, 9, -10654.1, 1119.39, 35.6409, 100, 0, 0, 0),
(45477, 10, -10659.6, 1123.15, 34.1976, 100, 0, 0, 0),
(45477, 11, -10661, 1125.53, 34.1976, 100, 0, 0, 0),
(45477, 12, -10660.5, 1127.72, 34.1976, 100, 0, 0, 0),
(45477, 13, -10658.1, 1129.51, 34.1976, 100, 0, 0, 0),
(45477, 14, -10649.9, 1136.17, 34.205, 100, 0, 0, 0),
(45477, 15, -10645.2, 1141.44, 33.7162, 100, 4000, 0, 4547703);

-- movement scripts
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4547701, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'lumberjack 45477 - emote none');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4547701, 4, 23, 89, 1, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'lumberjack 45477 - morph');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4547702, 1, 82, 42789, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'lumberjack 45477 - spawn woodpile');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4547702, 2, 23, 308, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'lumberjack 45477 - morph');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4547702, 6, 39, 4552103, 0, 0, 0, 45521, 0, 9, 2, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'lumberjack- start woodworker 44296 script');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4547702, 0, 39, 4429601, 0, 0, 0, 44296, 0, 9, 2, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'lumberjack 45477 event script - start lumberjack 44296 event script');
-- event script to start lumberjacks 45477 scripts
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4429601, 0, 60, 1, 0, 0, 0, 0, 0, 0, 0, 44296, 0, 0, 0, 0, 0, 0, 0, 0, 'start lumberjack 44296 script - started by lumberjack 45477');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4547703, 0, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1.20428, 0, 'lumberjack 45477 - set orientation');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4547703, 2, 1, 234, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'lumberjack 45477 - emote chop wood');

-- woodworker 45521 scripts started by 45477
-- event script
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4552103, 0, 60, 3, 0, 0, 0, 0, 0, 0, 0, 0, 4552103, 0, 0, 0, 0, 0, 0, 0, 'woodworker 45521 - start waypoints');

-- waypoints
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(4552103, 1, -10646.4, 1113.33, 35.6273, 100, 0, 0, 4552102),
(4552103, 2, -10647.4, 1115.45, 35.618, 100, 6000, 0, 4552105),
(4552103, 3, -10646.4, 1113.33, 35.6273, 100, 0, 0, 4552101);

-- movement scripts
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4552105, 3, 1, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'woodworker - kneel');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4552105, 5, 41, 0, 0, 0, 0, 42789, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'woodworker - remove woodpile');


-- lumberjack 44296
-- waypoints
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(44296, 1, -10612.2, 1181.08, 34.3929, 5.11381, 6000, 0, 4429601),
(44296, 2, -10625.5, 1172.63, 34.2415, 100, 0, 0, 0),
(44296, 3, -10639.1, 1157.01, 33.3856, 100, 0, 0, 0),
(44296, 4, -10643.8, 1154.6, 33.3617, 100, 0, 0, 0),
(44296, 5, -10651, 1152.99, 33.4886, 100, 0, 0, 0),
(44296, 6, -10653.1, 1148.23, 33.7335, 100, 0, 0, 0),
(44296, 7, -10649.3, 1141.3, 33.7097, 100, 0, 0, 0),
(44296, 8, -10651.8, 1136.93, 34.2028, 100, 0, 0, 0),
(44296, 9, -10660.2, 1128.05, 34.197, 100, 0, 0, 0),
(44296, 10, -10659, 1125.07, 34.1971, 100, 0, 0, 0),
(44296, 11, -10657.3, 1121.95, 34.197, 100, 0, 0, 0),
(44296, 12, -10653.5, 1119.96, 35.6413, 100, 0, 0, 0),
(44296, 13, -10649.9, 1117.06, 35.6163, 100, 6000, 0, 4429602),
(44296, 14, -10657.1, 1122.31, 34.1967, 100, 0, 0, 0),
(44296, 15, -10658.9, 1124.45, 34.1969, 100, 0, 0, 0),
(44296, 16, -10660.2, 1127.8, 34.1967, 100, 0, 0, 0),
(44296, 17, -10649.3, 1139.81, 33.7333, 100, 0, 0, 0),
(44296, 18, -10650.1, 1143.1, 33.7355, 100, 0, 0, 0),
(44296, 19, -10653, 1148.6, 33.737, 100, 0, 0, 0),
(44296, 20, -10651.6, 1152.36, 33.527, 100, 0, 0, 0),
(44296, 21, -10648.3, 1153.99, 33.4183, 100, 0, 0, 0),
(44296, 22, -10643.1, 1154.56, 33.3588, 100, 0, 0, 0),
(44296, 23, -10637.5, 1158.12, 33.4554, 100, 0, 0, 0),
(44296, 24, -10625.3, 1172.88, 34.2107, 100, 0, 0, 0),
(44296, 25, -10616.4, 1182.21, 33.7023, 100, 0, 0, 0),
(44296, 26, -10612.2, 1181.08, 34.3929, 5.11381, 4000, 0, 4429603);

-- movement scripts
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4429601, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'lumberjack 44296 - emote none');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4429601, 4, 23, 89, 1, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'lumberjack 44296 - morph');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4429602, 1, 82, 371651, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'lumberjack 44296 - spawn woodpile');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4429602, 2, 23, 308, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'lumberjack 44296 - morph');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4429602, 4, 39, 4552104, 0, 0, 0, 45521, 0, 9, 2, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'lumberjack- start woodworker 45521 script');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4429603, 0, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5.11381, 0, 'lumberjack - set orientation');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4429603, 2, 1, 234, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'lumberjack - emote chop wood');

-- woodworker 45521 scripts started by 44296
-- event script
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4552104, 0, 60, 3, 0, 0, 0, 0, 0, 0, 0, 0, 4552104, 0, 0, 0, 0, 0, 0, 0, 'woodworker 45521 - start waypoints');

-- waypoints
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(4552104, 1, -10646.4, 1113.33, 35.6273, 100, 0, 0, 4552102),
(4552104, 2, -10650.2, 1115.30, 35.607, 100, 6000, 0, 4552106),
(4552104, 3, -10646.4, 1113.33, 35.6273, 100, 0, 0, 4552101);

-- movement scripts
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4552106, 3, 1, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'woodworker - kneel');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4552106, 5, 41, 0, 0, 0, 0, 371651, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'woodworker - remove woodpile');


-- woodworker 44303
UPDATE `creature` SET `movement_type` = 2 WHERE `guid` = 44303;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(44303, 1, -10661.3, 1113.16, 34.1967, 4.15388, 66000, 0, 0),
(44303, 2, -10662.1, 1130.83, 34.1967, 2.51327, 75000, 0, 0);


-- woodworker 89860
UPDATE `creature` SET `movement_type` = 2 WHERE `guid` = 89860;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(89860, 1, -10656.2, 1126.87, 34.1967, 5.60251, 63000, 0, 0),
(89860, 2, -10667.4, 1121.39, 34.1967, 3.59686, 69000, 0, 0);


-- woodworker 45472
UPDATE `creature` SET `movement_type` = 2 WHERE `guid` = 45472;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(45472, 1, -10650.8, 1128.61, 34.1958, 4.43314, 81000, 0, 0),
(45472, 2, -10658.8, 1134.62, 34.1967, 2.49455, 72000, 0, 0);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
