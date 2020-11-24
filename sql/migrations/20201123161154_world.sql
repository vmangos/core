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

-- Taskmaster Fizzule Waypoints
UPDATE `creature` SET `movement_type` = 2 WHERE `entry` = 7233;
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(7233, 1, 1250.2, -2989.1, 92.013, 100, 5000, 0, 0),
(7233, 2, 1243.54, -2995.17, 91.7152, 100, 0, 0, 0),
(7233, 3, 1236.79, -2994.62, 91.6789, 4.46804, 15000, 0, 0);

-- Peon Farm Waypoints and Scripts
-- Peon 1
UPDATE `creature` SET `movement_type` = 2 WHERE `guid` = 13759;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(13759, 1, -3.25799, -3652.25, 27.4564, 100, 0, 0, 0),
(13759, 2, 0.177813, -3648.13, 27.4543, 100, 2000, 0, 0),
(13759, 3, 0.144287, -3647.29, 27.444, 100, 7000, 0, 0),
(13759, 4, -2.63763, -3650.74, 27.4736, 100, 0, 0, 0),
(13759, 5, -7.90023, -3654.5, 27.5215, 100, 0, 0, 0),
(13759, 6, -20.9433, -3653.2, 28.1662, 100, 0, 0, 0),
(13759, 7, -24.7774, -3654.66, 28.2013, 100, 30000, 10, 0),
(13759, 8, -14.5986, -3658.9, 27.5461, 100, 0, 0, 0),
(13759, 9, -9.02303, -3658.26, 27.4323, 100, 0, 0, 0);

-- Peon 2
UPDATE `creature` SET `movement_type` = 2 WHERE `guid` = 13773;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(13773, 1, -15.4464, -3596.94, 29.3809, 100, 180000, 5, 0),
(13773, 2, -11.3165, -3598.43, 29.5024, 100, 0, 0, 0),
(13773, 3, -0.019636, -3604.77, 28.0801, 100, 0, 0, 0),
(13773, 4, 6.76175, -3610.11, 27.2468, 100, 0, 0, 0),
(13773, 5, 5.11723, -3616.32, 27.2354, 100, 0, 0, 0),
(13773, 6, -8.21167, -3632.89, 27.4275, 100, 0, 0, 0),
(13773, 7, -12.9296, -3628.42, 27.3826, 1.37923, 10000, 0, 1377301),
(13773, 8, -10.0537, -3630.23, 27.3955, 100, 0, 0, 0),
(13773, 9, -5.77771, -3629.71, 27.3532, 100, 0, 0, 0),
(13773, 10, 1.80455, -3622.63, 27.2553, 100, 0, 0, 0),
(13773, 11, 5.96865, -3613.71, 27.2366, 100, 0, 0, 0),
(13773, 12, 9.78298, -3604.09, 27.2572, 100, 0, 0, 0),
(13773, 13, 7.8457, -3593.53, 27.3611, 100, 0, 0, 0),
(13773, 14, -2.5139, -3587.95, 27.5999, 100, 2000, 0, 0),
(13773, 15, 4.58175, -3590.9, 27.4462, 100, 0, 0, 0),
(13773, 16, 8.31512, -3599.14, 27.3059, 100, 0, 0, 0),
(13773, 17, 9.08023, -3604.5, 27.2624, 100, 0, 0, 0),
(13773, 18, 2.52405, -3605.41, 27.4355, 100, 0, 0, 0);
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1377301, 4, 1, 25, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Peon - Emote');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
