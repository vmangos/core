DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20201123161154');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20201123161154');
-- Add your query below.


-- Okla and Kranal Waypoints and Scripts
-- Okla
UPDATE `creature` SET `position_x` = 279.679, `position_y` = -3029.64, `position_z` = 97.3706, `movement_type` = 2 WHERE `guid` = 13179;
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(14873, 1, 279.679, -3029.64, 97.3706, 100, 360000, 5, 0),
(14873, 2, 271.534, -3035.29, 97.6256, 100, 0, 0, 0),
(14873, 3, 269.209, -3037.2, 97.4951, 100, 0, 0, 0),
(14873, 4, 263.300995, -3041.100098, 96.705200, 100, 23000, 0, 1487301),
(14873, 5, 257.614014, -3059.580078, 97.154900, 100, 0, 0, 0),
(14873, 6, 246.029007, -3101.580078, 92.124702, 100, 0, 0, 0),
(14873, 7, 237.667007, -3122.389893, 92.933800, 100, 0, 0, 0),
(14873, 8, 210.218002, -3160.209961, 90.474998, 100, 120000, 10, 1487302),
(14873, 9, 216.104004, -3134.459961, 92.184402, 100, 0, 0, 0),
(14873, 10, 225.587006, -3107.979980, 93.721901, 100, 0, 0, 0),
(14873, 11, 238.444000, -3087.949951, 91.788101, 100, 0, 0, 0),
(14873, 12, 254.783005, -3051.820068, 96.416702, 100, 0, 0, 0),
(14873, 13, 258.145996, -3043.860107, 96.291702, 100, 0, 0, 0);

-- 1487301
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1487301, 0, 25, 1, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Okla - Run');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1487301, 4, 3, 2, 0, 0, 0, 13174, 0, 9, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 'Okla - Move');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1487301, 5, 20, 0, 0, 0, 1, 13174, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Okla - Kranal Fiss -  Set Movement Type');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1487301, 7, 35, 0, 0, 0, 0, 13174, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Okla - Orientation');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1487301, 8, 0, 0, 0, 0, 0, 0, 0, 0, 4, 10274, 0, 0, 0, 0, 0, 0, 0, 0, 'Okla - Talk');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1487301, 14, 0, 0, 0, 0, 0, 13174, 0, 9, 2, 10275, 0, 0, 0, 0, 0, 0, 0, 0, 'Okla - Kranal Fiss - Talk');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1487301, 14, 35, 0, 0, 0, 0, 13174, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Okla - Kranal Fiss -  Orientation ');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1487301, 20, 0, 0, 0, 0, 0, 0, 0, 0, 4, 10276, 0, 0, 0, 0, 0, 0, 0, 0, 'Okla - Talk');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1487301, 22, 20, 2, 1, 0, 1, 13174, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Okla - Kranal Fiss -  Set Movement Type');

-- 1487302
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1487302, 0, 25, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Okla - Walk');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1487302, 24, 0, 0, 0, 0, 0, 0, 0, 0, 4, 10277, 0, 0, 0, 0, 0, 0, 0, 0, 'Okla - Talk');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1487302, 37, 0, 0, 0, 0, 0, 0, 0, 0, 4, 10278, 0, 0, 0, 0, 0, 0, 0, 0, 'Okla - Talk');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1487302, 62, 0, 0, 0, 0, 0, 0, 0, 0, 4, 10279, 0, 0, 0, 0, 0, 0, 0, 0, 'Okla - Talk');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1487302, 82, 0, 0, 0, 0, 0, 0, 0, 0, 4, 10280, 0, 0, 0, 0, 0, 0, 0, 0, 'Okla - Talk');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1487302, 112, 0, 0, 0, 0, 0, 0, 0, 0, 4, 10281, 0, 0, 0, 0, 0, 0, 0, 0, 'Okla - Talk');

-- Kranal
UPDATE `creature` SET `position_x` = 265.171, `position_y` = -3037.09, `position_z` = 96.9497, `movement_type` = 2 WHERE `guid` = 13174;
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(5907, 1, 265.171, -3037.09, 96.9497, 3.21141, 50000, 0, 0),
(5907, 2, 262.729, -3047.14, 96.5834, 100, 0, 0, 0),
(5907, 3, 264.465, -3050.62, 96.8858, 100, 0, 0, 0),
(5907, 4, 267.512, -3053.74, 97.2081, 100, 0, 0, 0),
(5907, 5, 269.826, -3061.46, 97.5983, 4.8522, 30000, 0, 0),
(5907, 6, 262.729, -3047.14, 96.5834, 100, 0, 0, 0),
(5907, 7, 262.779, -3040.37, 96.7544, 100, 0, 0, 0);

-- Taskmaster Fizzule waypoints
UPDATE `creature` SET `movement_type` = 2 WHERE `entry` = 7233;
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(7233, 1, 1250.2, -2989.1, 92.013, 100, 5000, 0, 0),
(7233, 2, 1243.54, -2995.17, 91.7152, 100, 0, 0, 0),
(7233, 3, 1236.79, -2994.62, 91.6789, 4.46804, 15000, 0, 0);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
