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
-- add correct positions
UPDATE `creature` SET `position_x` = -10598, `position_y` = 1160.48, `position_z` = 38.4546, `orientation` = 6.16101 WHERE `guid` = 45524;

-- correct movement and enable event ai
UPDATE `creature` SET `movement_type` = 2, `wander_distance` = 0  WHERE `guid` IN (89861);
UPDATE `creature` SET `movement_type` = 0, `wander_distance` = 0  WHERE `guid` IN (44296);
DELETE FROM `creature_addon` WHERE `guid` IN (45524, 44296, 89861, 45477, 45521);

-- add gameobjects
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(363457, 105568, 0, -10640.9, 1110.26, 35.6359, 0.191985, 0, 0, 0.0958452, 0.995396, 900, 900, 100, 1, 0, 0, 0, 10);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(363458, 105568, 0, -10651, 1115.64, 35.6105, 4.04917, 0, 0, -0.898793, 0.438373, 900, 900, 100, 1, 0, 0, 0, 10);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(363463, 105568, 0, -10642.1, 1108.35, 35.6388, 0.436332, 0, 0, 0.216439, 0.976296, 900, 900, 100, 1, 0, 0, 0, 10);

-- waypoints
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(89861, 1, -10584.8, 1144.22, 40.1724, 100, 6000, 0, 8986101),
(89861, 2, -10582.9, 1140.78, 39.7932, 100, 0, 0, 0),
(89861, 3, -10596.8, 1121.05, 38.2363, 100, 0, 0, 0),
(89861, 4, -10603.1, 1114.45, 37.2475, 100, 0, 0, 0),
(89861, 5, -10610.4, 1106.32, 36.1937, 100, 0, 0, 0),
(89861, 6, -10614.2, 1103.13, 35.4732, 100, 0, 0, 0),
(89861, 7, -10620.3, 1100.17, 34.2845, 100, 0, 0, 0),
(89861, 8, -10628.1, 1098.77, 33.7758, 100, 0, 0, 0),
(89861, 9, -10634.1, 1103.27, 34.4996, 100, 0, 0, 0),
(89861, 10, -10639.8, 1108.25, 35.6211, 100, 4000, 0, 8986102),
(89861, 11, -10637.3, 1105.48, 35.1571, 100, 0, 0, 0),
(89861, 12, -10636.4, 1104.58, 34.3649, 100, 0, 0, 0),
(89861, 13, -10629.9, 1100.08, 33.9228, 100, 0, 0, 0),
(89861, 14, -10628.8, 1099.44, 33.7816, 100, 0, 0, 0),
(89861, 15, -10615.4, 1102.65, 35.3178, 100, 0, 0, 0),
(89861, 16, -10611.4, 1105.3, 35.9968, 100, 0, 0, 0),
(89861, 17, -10603.9, 1113.54, 37.1459, 100, 0, 0, 0),
(89861, 18, -10597.7, 1119.95, 38.073, 100, 0, 0, 0),
(89861, 19, -10582.7, 1137.78, 39.256, 100, 0, 0, 0),
(89861, 20, -10581.9, 1138.66, 39.3293, 100, 0, 0, 0),
(89861, 21, -10583.6, 1144.18, 40.1724, 100, 0, 0, 0),
(89861, 23, -10584.8, 1144.22, 40.1724, 100, 225000, 0, 8986103);

-- movement scripts
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8986101, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'lumberjack 89861 - emote none');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8986101, 4, 23, 89, 1, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'lumberjack 89861 - morph');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8986102, 1, 82, 363463, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'lumberjack 89861 - spawn woodpile');
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
(4552101, 2, -10643, 1109.38, 35.659, 100, 6000, 0, 4552103),
(4552101, 3, -10646.4, 1113.33, 35.6273, 100, 0, 0, 4552101);

-- movement scripts
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4552101, 0, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.925025, 0, 'woodworker 45521 - set orientation');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4552101, 0, 1, 69, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'woodworker 45521 - start work');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4552101, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 2552, 0, 0, 0, 0, 0, 0, 0, 0, 'woodworker 45521 - emote');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4552102, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'woodworker 45521 - stop working');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4552103, 3, 1, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'woodworker 45521 - kneel');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4552103, 5, 41, 0, 0, 0, 0, 363463, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'woodworker 45521 - remove woodpile');


-- lumberjack 45524
-- waypoints
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(45524, 1, -10598, 1160.48, 38.4546, 100, 6000, 0, 4552401),
(45524, 2, -10609.6, 1158.24, 36.2267, 100, 0, 0, 0),
(45524, 3, -10620.5, 1153.52, 34.6432, 100, 0, 0, 0),
(45524, 4, -10631, 1141.76, 33.8276, 100, 0, 0, 0),
(45524, 5, -10632, 1137.06, 33.8021, 100, 0, 0, 0),
(45524, 6, -10630, 1129.64, 33.8139, 100, 0, 0, 0),
(45524, 7, -10627.8, 1121.5, 33.8149, 100, 0, 0, 0),
(45524, 8, -10627, 1117.83, 33.8139, 100, 0, 0, 0),
(45524, 9, -10624.9, 1109.76, 33.86, 100, 0, 0, 0),
(45524, 10, -10623.9, 1105.81, 33.9065, 100, 0, 0, 0),
(45524, 11, -10624.1, 1102.05, 33.8899, 100, 0, 0, 0),
(45524, 12, -10625.9, 1098.68, 33.8158, 100, 0, 0, 0),
(45524, 13, -10629.5, 1098.14, 33.7816, 100, 0, 0, 0),
(45524, 14, -10632.5, 1100.61, 34.1909, 100, 0, 0, 0),
(45524, 15, -10635.9, 1104.49, 35.0224, 100, 0, 0, 0),
(45524, 16, -10639.9, 1107.97, 35.6203, 100, 6000, 0, 4552402),
(45524, 17, -10635.9, 1104.49, 35.0224, 100, 0, 0, 0),
(45524, 18, -10631.8, 1099.91, 34.0758, 100, 0, 0, 0),
(45524, 19, -10628.5, 1097.94, 33.7816, 100, 0, 0, 0),
(45524, 20, -10625.2, 1099.38, 33.8388, 100, 0, 0, 0),
(45524, 21, -10623.9, 1102.99, 33.903, 100, 0, 0, 0),
(45524, 22, -10624.2, 1106.91, 33.8935, 100, 0, 0, 0),
(45524, 23, -10625.9, 1113.67, 33.8139, 100, 0, 0, 0),
(45524, 24, -10627.2, 1118.65, 33.8139, 100, 0, 0, 0),
(45524, 25, -10631.1, 1134.32, 33.808, 100, 0, 0, 0),
(45524, 26, -10629.9, 1147.38, 33.9631, 100, 0, 0, 0),
(45524, 27, -10615.7, 1158.63, 35.2899, 100, 0, 0, 0),
(45524, 28, -10598, 1160.48, 38.4546, 100, 4000, 0, 4552403);

-- movement scripts
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4552401, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'lumberjack 45524 - emote none');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4552401, 4, 23, 89, 1, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'lumberjack 45524 - morph');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4552402, 1, 82, 363457, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'lumberjack 45524 - spawn woodpile');
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
(4552102, 2, -10642.4, 1111.02, 35.6608, 100, 6000, 0, 4552104),
(4552102, 3, -10646.4, 1113.33, 35.6273, 100, 0, 0, 4552101);

-- movement scripts
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4552104, 3, 1, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'woodworker - kneel');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4552104, 5, 41, 0, 0, 0, 0, 363457, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'woodworker - remove woodpile');


-- lumberjack 45477
-- waypoints
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(45477, 1, -10645.2, 1141.44, 33.7257, 100, 6000, 0, 4547701),
(45477, 2, -10651.2, 1136.13, 34.2026, 100, 0, 0, 0),
(45477, 3, -10656.4, 1130.36, 34.1967, 100, 0, 0, 0),
(45477, 4, -10656.8, 1125.83, 34.1967, 100, 0, 0, 0),
(45477, 5, -10656.2, 1122.89, 34.2222, 100, 0, 0, 0),
(45477, 6, -10653.8, 1120.1, 35.6397, 100, 0, 0, 0),
(45477, 7, -10649, 1115.99, 35.6343, 100, 6000, 0, 4547702),
(45477, 8, -10650.8, 1117.93, 35.6273, 100, 0, 0, 0),
(45477, 9, -10654.8, 1121.51, 35.168, 100, 0, 0, 0),
(45477, 10, -10657.5, 1126.74, 34.1967, 100, 0, 0, 0),
(45477, 11, -10654.9, 1130.71, 34.1967, 100, 0, 0, 0),
(45477, 12, -10647.9, 1138.52, 33.7831, 100, 0, 0, 0),
(45477, 13, -10645.2, 1141.44, 33.7257, 100, 4000, 0, 4547703);

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
(4552103, 2, -10647.1, 1115.19, 35.6417, 100, 6000, 0, 4552105),
(4552103, 3, -10646.4, 1113.33, 35.6273, 100, 0, 0, 4552101);

-- movement scripts
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4552105, 3, 1, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'woodworker - kneel');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4552105, 5, 41, 0, 0, 0, 0, 42789, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'woodworker - remove woodpile');


-- lumberjack 44296
-- waypoints
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(44296, 1, -10612.2, 1181.08, 34.5176, 100, 6000, 0, 4429601),
(44296, 2, -10613, 1181.74, 34.2806, 100, 0, 0, 0),
(44296, 3, -10622, 1175.48, 34.1209, 100, 0, 0, 0),
(44296, 4, -10627.5, 1169.66, 34.5439, 100, 0, 0, 0),
(44296, 5, -10634.8, 1160.01, 33.879, 100, 0, 0, 0),
(44296, 6, -10641.2, 1155.05, 33.4266, 100, 0, 0, 0),
(44296, 7, -10644.8, 1154.22, 33.5571, 100, 0, 0, 0),
(44296, 8, -10651.7, 1150.54, 33.768, 100, 0, 0, 0),
(44296, 9, -10651.2, 1143.95, 33.7228, 100, 0, 0, 0),
(44296, 10, -10649.7, 1140.43, 33.8344, 100, 0, 0, 0),
(44296, 11, -10650.9, 1137.79, 33.9133, 100, 0, 0, 0),
(44296, 12, -10656.4, 1130.81, 34.1963, 100, 0, 0, 0),
(44296, 13, -10658.7, 1127.74, 34.1967, 100, 0, 0, 0),
(44296, 14, -10659.2, 1125.18, 34.1967, 100, 0, 0, 0),
(44296, 15, -10658.7, 1123.95, 34.1967, 100, 0, 0, 0),
(44296, 16, -10656, 1121.42, 34.7641, 100, 0, 0, 0),
(44296, 17, -10651.6, 1118.63, 35.629, 100, 0, 0, 0),
(44296, 18, -10649.5, 1116.96, 35.6324, 100, 4000, 0, 4429602),
(44296, 19, -10651.6, 1118.65, 35.6292, 100, 0, 0, 0),
(44296, 20, -10656, 1121.44, 34.7467, 100, 0, 0, 0),
(44296, 21, -10659.1, 1124.63, 34.1967, 100, 0, 0, 0),
(44296, 22, -10659.6, 1127.62, 34.1967, 100, 0, 0, 0),
(44296, 23, -10658.6, 1128.62, 34.1967, 100, 0, 0, 0),
(44296, 24, -10658.3, 1129.98, 34.1967, 100, 0, 0, 0),
(44296, 25, -10651, 1137.76, 33.9222, 100, 0, 0, 0),
(44296, 26, -10652.6, 1147.13, 33.7942, 100, 0, 0, 0),
(44296, 27, -10651.1, 1151.75, 33.6359, 100, 0, 0, 0),
(44296, 28, -10643.9, 1154.42, 33.3902, 100, 0, 0, 0),
(44296, 29, -10641.2, 1155.05, 33.4266, 100, 0, 0, 0),
(44296, 30, -10634.8, 1160.01, 33.879, 100, 0, 0, 0),
(44296, 31, -10627.5, 1169.66, 34.5439, 100, 0, 0, 0),
(44296, 32, -10622, 1175.48, 34.1209, 100, 0, 0, 0),
(44296, 33, -10613, 1181.74, 34.2806, 100, 0, 0, 0),
(44296, 34, -10612.2, 1181.08, 34.5176, 100, 6000, 0, 4429603);

-- movement scripts
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4429601, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'lumberjack 44296 - emote none');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4429601, 4, 23, 89, 1, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'lumberjack 44296 - morph');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4429602, 1, 82, 363458, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'lumberjack 44296 - spawn woodpile');
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
(4552104, 2, -10650.1, 1115.03, 35.6308, 100, 6000, 0, 4552106),
(4552104, 3, -10646.4, 1113.33, 35.6273, 100, 0, 0, 4552101);

-- movement scripts
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4552106, 3, 1, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'woodworker - kneel');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4552106, 5, 41, 0, 0, 0, 0, 363458, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'woodworker - remove woodpile');


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
