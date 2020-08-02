DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200802210659');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200802210659');
-- Add your query below.


-- kargath grunt should roam not pathfind
DELETE FROM `creature_movement` WHERE `id` = 6898;
UPDATE `creature` SET `position_x` = -6620.42, `position_y` = -2215.8, `position_z` = 244.269, `movement_type` = 1, `wander_distance` = 5 WHERE `guid` = 6898;

-- add servo waypoints and scripts
UPDATE `creature_template` SET `ai_name` = '' WHERE `entry` = 2922;
UPDATE `creature` SET `movement_type` = 2 WHERE `guid` = 7249;
DELETE FROM `creature_ai_events` WHERE `creature_id`=2922;
DELETE FROM `creature_ai_scripts` WHERE `id`IN (292201, 292202, 292203);
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(2922, 1, -6631.39, -2726.79, 243.585, 2.96706, 25000, 0, 0),
(2922, 2, -6633.1, -2718.19, 243.968, 100, 0, 0, 0),
(2922, 3, -6644.94, -2710.01, 245.064, 100, 0, 0, 0),
(2922, 4, -6656.24, -2711.52, 242.568, 100, 0, 0, 0),
(2922, 5, -6667.67, -2720.87, 242.893, 100, 0, 0, 0),
(2922, 6, -6668.86, -2731.74, 243.128, 100, 0, 0, 0),
(2922, 7, -6661.89, -2740.65, 242.946, 100, 0, 0, 0),
(2922, 8, -6650.72, -2744.83, 242.467, 100, 0, 0, 0),
(2922, 9, -6641.93, -2744, 242.577, 100, 0, 0, 0),
(2922, 10, -6637.6, -2737.69, 243.057, 100, 0, 0, 0),
(2922, 11, -6632.26, -2730.05, 243.632, 100, 10000, 0, 292201),
(2922, 12, -6629.83, -2731.84, 243.952, 100, 0, 0, 0),
(2922, 13, -6626.84, -2731.86, 244.322, 100, 0, 0, 0),
(2922, 14, -6625.9, -2729.02, 244.383, 100, 0, 0, 0),
(2922, 15, -6630.4, -2726.7, 243.669, 100, 0, 0, 0),
(2922, 16, -6635.28, -2729.64, 243.431, 100, 0, 0, 0),
(2922, 17, -6638.85, -2734.38, 243.176, 100, 0, 0, 0),
(2922, 18, -6648.6, -2740.83, 242.495, 100, 0, 0, 0),
(2922, 19, -6655.65, -2750.56, 242.569, 100, 10000, 0, 292201),
(2922, 20, -6655.65, -2750.56, 242.569, 100, 0, 0, 292202),
(2922, 21, -6649.62, -2742.92, 242.473, 100, 0, 0, 0),
(2922, 22, -6650.89, -2735.79, 242.594, 100, 0, 0, 0),
(2922, 23, -6659.62, -2735.75, 242.864, 100, 0, 0, 0),
(2922, 24, -6668.86, -2731.74, 243.128, 100, 0, 0, 0),
(2922, 25, -6670.68, -2726.46, 242.937, 100, 0, 0, 0),
(2922, 26, -6657.19, -2715.05, 242.438, 100, 0, 0, 0),
(2922, 27, -6648.02, -2713.55, 243.86, 100, 0, 0, 0),
(2922, 28, -6638.08, -2716.45, 243.919, 100, 0, 0, 0),
(2922, 29, -6634.84, -2722.57, 243.386, 100, 10000, 0, 292201),
(2922, 30, -6634.84, -2722.57, 243.386, 100, 0, 0, 292203),
(2922, 31, -6631.83, -2722.68, 243.622, 100, 0, 0, 0),
(2922, 32, -6629.03, -2723.16, 243.893, 100, 0, 0, 0),
(2922, 33, -6626.65, -2728.26, 244.264, 100, 0, 0, 0),
(2922, 34, -6623.51, -2736.7, 244.597, 100, 0, 0, 0),
(2922, 35, -6625.27, -2743.45, 244.163, 100, 0, 0, 0),
(2922, 36, -6635.42, -2754.56, 243.485, 100, 0, 0, 0),
(2922, 37, -6649.49, -2753.88, 242.677, 100, 0, 0, 0),
(2922, 38, -6654.42, -2750.81, 242.555, 100, 0, 0, 0),
(2922, 39, -6650.2, -2739.49, 242.514, 100, 0, 0, 0),
(2922, 40, -6655.12, -2726.67, 242.787, 100, 0, 0, 0),
(2922, 41, -6652.57, -2715.81, 242.98, 100, 0, 0, 0),
(2922, 42, -6645.45, -2718.09, 243.475, 100, 0, 0, 0),
(2922, 43, -6634.76, -2714.72, 244.51, 100, 0, 0, 0),
(2922, 44, -6629.11, -2713.59, 244.916, 100, 0, 0, 0),
(2922, 45, -6626.1, -2713.86, 244.906, 100, 0, 0, 0),
(2922, 46, -6629.46, -2719.4, 244.099, 100, 10000, 0, 292201);
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (292201, 1, 39, 292201, 292202, 0, 0, 0, 0, 0, 0, 50, 50, 0, 0, 0, 0, 0, 0, 0, 'Servo - Start Script');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (292201, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 901, 902, 903, 904, 0, 0, 0, 0, 0, 'Servo - Talk');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (292202, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 905, 898, 900, 899, 0, 0, 0, 0, 0, 'Servo - Talk');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (292202, 0, 25, 1, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Servo - Run');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (292203, 0, 25, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Servo - Walk');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
