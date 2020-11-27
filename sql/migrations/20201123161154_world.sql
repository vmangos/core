DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20201123161154');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20201123161154');
-- Add your query below.


-- okla and kranal waypoints and scripts
-- okla
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

-- kranal
UPDATE `creature` SET `position_x` = 265.171, `position_y` = -3037.09, `position_z` = 96.9497, `movement_type` = 2 WHERE `guid` = 13174;
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(5907, 1, 265.171, -3037.09, 96.9497, 3.21141, 50000, 0, 0),
(5907, 2, 262.729, -3047.14, 96.5834, 100, 0, 0, 0),
(5907, 3, 264.465, -3050.62, 96.8858, 100, 0, 0, 0),
(5907, 4, 267.512, -3053.74, 97.2081, 100, 0, 0, 0),
(5907, 5, 269.826, -3061.46, 97.5983, 4.8522, 30000, 0, 0),
(5907, 6, 262.729, -3047.14, 96.5834, 100, 0, 0, 0),
(5907, 7, 262.779, -3040.37, 96.7544, 100, 0, 0, 0);

-- taskmaster fizzule waypoints
UPDATE `creature` SET `movement_type` = 2 WHERE `entry` = 7233;
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(7233, 1, 1250.2, -2989.1, 92.013, 100, 5000, 0, 0),
(7233, 2, 1243.54, -2995.17, 91.7152, 100, 0, 0, 0),
(7233, 3, 1236.79, -2994.62, 91.6789, 4.46804, 15000, 0, 0);

-- peon farm waypoints and scripts
-- peon 1
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

-- peon 2
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

-- add horde labourer script
UPDATE `creature` SET `movement_type` = 0 WHERE `guid` IN (14429, 14430, 14431, 14432);
DELETE FROM `creature_movement` WHERE `id` IN (14429, 14430, 14431, 14432);
DELETE FROM `creature_movement_scripts` WHERE `id` IN (1471801, 1471802, 1471803, 1471804);
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1471803, 14718, 1471803, 1, 0, 100, 1, 0, 0, 84000, 84000, 1471803, 0, 0, 'Horde Laborer - Start Script OOC');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1471803, 0, 39, 1471803, 0, 0, 0, 0, 0, 0, 4, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Horde Laborer - Start Script');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1471803, 0, 1, 1, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Horde Laborer - Emote');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1471803, 10, 28, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Horde Laborer - Stand');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1471803, 12, 35, 0, 0, 0, 0, 14430, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Horde Laborer - Set Orientation');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1471803, 12, 1, 22, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Horde Laborer - Emote');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1471803, 13, 35, 0, 0, 0, 0, 14429, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Horde Laborer - Set Orientation');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1471803, 13, 35, 0, 0, 0, 0, 14430, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Horde Laborer - Set Orientation');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1471803, 13, 35, 0, 0, 0, 0, 14431, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Horde Laborer - Set Orientation');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1471803, 13, 35, 0, 0, 0, 0, 14432, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Horde Laborer - Set Orientation');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1471803, 13, 1, 0, 0, 0, 0, 14429, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Horde Laborer - Emote');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1471803, 13, 1, 0, 0, 0, 0, 14430, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Horde Laborer - Emote');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1471803, 13, 1, 0, 0, 0, 0, 14431, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Horde Laborer - Emote');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1471803, 13, 1, 0, 0, 0, 0, 14432, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Horde Laborer - Emote');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1471803, 16, 35, 0, 0, 0, 0, 14429, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Horde Laborer - Set Orientation');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1471803, 17, 1, 1, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Horde Laborer - Emote');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1471803, 21, 1, 25, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Horde Laborer - Emote');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1471803, 23, 28, 1, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Horde Laborer - Sit');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1471803, 23, 35, 1, 0, 0, 0, 14429, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 4.03462, 0, 'Horde Laborer - Set Orientation');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1471803, 23, 35, 1, 0, 0, 0, 14430, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 4.03462, 0, 'Horde Laborer - Set Orientation');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1471803, 23, 35, 1, 0, 0, 0, 14431, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 4.03462, 0, 'Horde Laborer - Set Orientation');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1471803, 23, 35, 1, 0, 0, 0, 14432, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 4.03462, 0, 'Horde Laborer - Set Orientation');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1471803, 24, 1, 234, 0, 0, 0, 14429, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Horde Laborer - Emote');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1471803, 24, 1, 234, 0, 0, 0, 14430, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Horde Laborer - Emote');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1471803, 24, 1, 234, 0, 0, 0, 14431, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Horde Laborer - Emote');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1471803, 24, 1, 234, 0, 0, 0, 14432, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Horde Laborer - Emote');

-- make mogg script more blizzlike
UPDATE `creature_equip_template` SET `equipentry1` = 0 WHERE `entry` = 14908;
DELETE FROM `creature_movement_template` WHERE `entry` = 14908;
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(14908, 1, 1022.24, -2235.11, 93.3114, 0, 0, 0, 0),
(14908, 2, 1023.37, -2238.18, 92.3744, 0, 0, 0, 0),
(14908, 3, 1024.2, -2243.96, 92.4697, 0, 0, 0, 0),
(14908, 4, 1022.05, -2244.86, 92.3385, 0, 0, 0, 0),
(14908, 5, 1020.21, -2242.92, 92.2321, 2.64285, 8000, 0, 1490801),
(14908, 6, 1034.19, -2250.56, 92.8656, 5.42316, 6000, 0, 1490802),
(14908, 7, 1033.85, -2258.61, 93.6338, 5.97687, 5000, 0, 1490803),
(14908, 8, 1037.68, -2262.02, 93.8145, 0, 0, 0, 0),
(14908, 9, 1036.96, -2269.7, 93.7554, 0, 0, 0, 1490809),
(14908, 10, 1042, -2273.46, 93.6932, 0, 0, 0, 0),
(14908, 11, 1042.7, -2275.52, 93.5781, 0, 0, 0, 0),
(14908, 12, 1046.52, -2274.46, 93.6045, 0, 0, 0, 0),
(14908, 13, 1050.26, -2270.44, 93.4986, 0, 0, 0, 0),
(14908, 14, 1049.74, -2266.86, 93.3475, 0, 0, 0, 0),
(14908, 15, 1048.05, -2263.53, 93.2249, 0, 0, 0, 0),
(14908, 16, 1041.05, -2258.77, 93.4525, 0, 0, 0, 0),
(14908, 17, 1039.14, -2253.68, 92.9611, 100, 6000, 0, 1490804),
(14908, 18, 1032.8, -2253.55, 93.3633, 0, 0, 0, 0),
(14908, 19, 1025.83, -2258.54, 93.1641, 0, 0, 0, 0),
(14908, 20, 1021.94, -2266.24, 92.8306, 0, 0, 0, 0),
(14908, 21, 1022.81, -2272.14, 92.6617, 0, 0, 0, 0),
(14908, 22, 1027.02, -2277.89, 92.6709, 0, 0, 0, 0),
(14908, 23, 1036.56, -2280.12, 93.1197, 0, 0, 0, 0),
(14908, 24, 1046.66, -2275.73, 93.5356, 0, 0, 0, 0),
(14908, 25, 1049.61, -2269.77, 93.5509, 0, 0, 0, 0),
(14908, 26, 1045.76, -2261.03, 93.2522, 0, 0, 0, 0),
(14908, 27, 1038.3, -2254.31, 93.1039, 100, 6000, 0, 1490805),
(14908, 28, 1028.89, -2245.04, 92.4171, 2.15198, 14000, 0, 1490806),
(14908, 29, 1020.21, -2242.92, 92.2321, 2.64285, 2000, 0, 1490808),
(14908, 30, 1016.87, -2225.77, 93.1025, 100, 80000, 0, 1490807);
DELETE FROM `creature_movement_scripts` WHERE `id`=1490801;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1490801, 1, 19, 0, 0, 0, 0, 0, 0, 0, 4, 3350, 0, 0, 0, 0, 0, 0, 0, 0, 'Mogg  - Set Equip');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1490801, 1, 20, 1, 1, 0, 1, 13980, 0, 9, 2, 0, 0, 0, 0, 5, 0, 0, 0, 0, 'Mogg - Set Random Movement 5 Yards (Pooka)');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1490801, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10293, 0, 0, 0, 0, 0, 0, 0, 0, 'Mogg - Say Text');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1490801, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10294, 0, 0, 0, 0, 0, 0, 0, 0, 'Mogg - Say Text');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1490808, 0, 19, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mogg - Set Equip');

-- tarban hearthgrain waypoints and scripts
UPDATE `creature` SET `movement_type` = 2 WHERE `id` = 8307;
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(8307, 1, -555.068, -2966.62, 91.6705, 100, 120000, 1.5, 0),
(8307, 2, -557.7, -2966.81, 91.6677, 100, 0, 0, 0),
(8307, 3, -557.72, -2967.72, 91.6677, 100, 5000, 0, 830701);
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (830701, 2, 28, 8, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Tarban - Kneel');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (830701, 4, 28, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Tarban - Stand');

-- make gruk script more blizzlike
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1485004, 1, 19, 0, 0, 0, 0, 0, 0, 0, 4, 2197, 0, 0, 0, 0, 0, 0, 0, 0, 'Gruk - Set Equip');
UPDATE `creature_movement_template` SET `script_id` = 1485004 WHERE `entry` = 14850 AND `point` = 21;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1485002, 4, 19, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gruk - Set Equip');

-- make karu script more blizzlike
DELETE FROM `creature_movement_template` WHERE `entry` = 14874;
DELETE FROM `creature_movement_scripts` WHERE `id` IN (1487401, 1487409, 1487402);
UPDATE `creature` SET `position_x` = 207.876, `position_y` = -2843.02, `position_z` = 91.4980 WHERE `guid` = 20186;
UPDATE `creature` SET `position_x` = 224.489, `position_y` = -2842.92, `position_z` = 91.4084 WHERE `guid` = 20181;
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(23, 10685, 0, 0, 0, 1, 207.594, -2850.94, 91.4079, 3.84253, 413, 413, 3, 100, 0, 1, 0, 0, 0, 10),
(24, 10685, 0, 0, 0, 1, 212.875, -2862.13, 91.6347, 3.84253, 413, 413, 3, 100, 0, 1, 0, 0, 0, 10),
(80, 10685, 0, 0, 0, 1, 224.453, -2852.23, 91.3600, 3.84253, 413, 413, 3, 100, 0, 1, 0, 0, 0, 10);
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(14874, 1, 240.791, -2901.43, 98.0078, 100, 180000, 5, 0),
(14874, 2, 240.791, -2901.43, 98.0078, 100, 0, 0, 0),
(14874, 3, 241.054, -2908.06, 98.0216, 5.8626, 20000, 0, 1487401),
(14874, 4, 236.939, -2902.39, 98.1296, 100, 0, 0, 0),
(14874, 5, 231.025, -2900.67, 98.2101, 100, 20000, 0, 1487402),
(14874, 6, 227.179, -2899.7, 97.374, 100, 0, 0, 0),
(14874, 7, 221.223, -2893.77, 95.8963, 100, 0, 0, 0),
(14874, 8, 215.929, -2884.73, 92.9291, 100, 0, 0, 0),
(14874, 9, 214.699, -2874.8, 92.1099, 100, 10000, 0, 1487403),
(14874, 10, 208.415, -2870.42, 91.6701, 100, 5000, 0, 1487404),
(14874, 11, 211.695, -2872.78, 92.09, 100, 0, 0, 0),
(14874, 12, 217.448, -2866.87, 91.6662, 100, 0, 0, 0),
(14874, 13, 218.222, -2850.27, 90.6764, 100, 20000, 0, 1487405),
(14874, 14, 217.239, -2860.9, 91.5709, 100, 0, 0, 0),
(14874, 15, 214.668, -2880.73, 92.0654, 100, 0, 0, 0),
(14874, 16, 219.152, -2890.38, 94.8972, 100, 0, 0, 0),
(14874, 17, 225.141, -2898.63, 97.1942, 100, 0, 0, 0);
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1487401, 10, 19, 0, 0, 0, 0, 0, 0, 0, 4, 2196, 0, 0, 0, 0, 0, 0, 0, 0, 'Karu - Set Equip');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1487401, 11, 0, 0, 0, 0, 0, 0, 0, 0, 4, 10251, 0, 0, 0, 0, 0, 0, 0, 0, 'Karu - Talk');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1487402, 3, 0, 0, 0, 0, 0, 0, 0, 0, 4, 10252, 0, 0, 0, 0, 0, 0, 0, 0, 'Karu - Talk');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1487402, 9, 0, 0, 0, 0, 0, 0, 0, 0, 4, 10253, 0, 0, 0, 0, 0, 0, 0, 0, 'Karu - Talk');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1487402, 15, 19, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Karu - Set Equip');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1487402, 18, 0, 0, 0, 0, 0, 0, 0, 0, 4, 10292, 0, 0, 0, 0, 0, 0, 0, 0, 'Karu - Talk');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1487403, 6, 0, 0, 0, 0, 0, 0, 0, 0, 4, 10255, 0, 0, 0, 0, 0, 0, 0, 0, 'Karu - Talk');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1487404, 4, 19, 0, 0, 0, 0, 0, 0, 0, 4, 12744, 0, 0, 0, 0, 0, 0, 0, 0, 'Karu - Set Equip');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1487405, 3, 0, 0, 0, 0, 0, 0, 0, 0, 4, 10256, 0, 0, 0, 0, 0, 0, 0, 0, 'Karu - Talk');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1487405, 3, 25, 1, 0, 0, 0, 20186, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Karu - Swine - Run');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1487405, 3, 25, 1, 0, 0, 0, 20181, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Karu - Swine - Run');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1487405, 3, 25, 1, 0, 0, 0, 23, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Karu - Swine - Run');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1487405, 3, 25, 1, 0, 0, 0, 24, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Karu - Swine - Run');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1487405, 3, 25, 1, 0, 0, 0, 80, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Karu - Swine - Run');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1487405, 4, 20, 14, 0, 0, 0, 20186, 0, 9, 2, 0, 0, 0, 0, 2, 0, 0, 0, 0, 'Karu - Swine - Set Movement');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1487405, 4, 20, 14, 0, 0, 0, 23, 0, 9, 2, 0, 0, 0, 0, 2, 0, 0, 1, 0, 'Karu - Swine - Set Movement');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1487405, 4, 20, 14, 0, 0, 0, 80, 0, 9, 2, 0, 0, 0, 0, 2, 0, 0, 5, 0, 'Karu - Swine - Set Movement');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1487405, 4, 20, 14, 0, 0, 0, 20181, 0, 9, 2, 0, 0, 0, 0, 2, 0, 0, 6, 0, 'Karu - Swine - Set Movement');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1487405, 4, 20, 14, 0, 0, 0, 24, 0, 9, 2, 0, 0, 0, 0, 2, 0, 0, 8, 0, 'Karu - Swine - Set Movement');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1487405, 5, 25, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Karu - Walk');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1487405, 16, 0, 0, 0, 0, 0, 0, 0, 0, 4, 10257, 0, 0, 0, 0, 0, 0, 0, 0, 'Karu - Talk');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1487405, 18, 19, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Karu - Set Equip');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1487405, 25, 20, 1, 0, 0, 1, 20181, 0, 9, 2, 0, 0, 0, 0, 3, 0, 0, 0, 0, 'Karu - Swine - Set Movement');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1487405, 25, 20, 1, 0, 0, 1, 20186, 0, 9, 2, 0, 0, 0, 0, 3, 0, 0, 0, 0, 'Karu - Swine - Set Movement');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1487405, 25, 20, 1, 0, 0, 1, 80, 0, 9, 2, 0, 0, 0, 0, 3, 0, 0, 0, 0, 'Karu - Swine - Set Movement');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1487405, 25, 20, 1, 0, 0, 1, 23, 0, 9, 2, 0, 0, 0, 0, 3, 0, 0, 0, 0, 'Karu - Swine - Set Movement');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1487405, 25, 20, 1, 0, 0, 1, 24, 0, 9, 2, 0, 0, 0, 0, 3, 0, 0, 0, 0, 'Karu - Swine - Set Movement');

-- thorn hill mine
-- add horde guard waypoints and scripts
DELETE FROM `creature_movement` WHERE `id` = 19411;
UPDATE `creature` SET `position_x` = -624.492, `position_y` = -3246.95, `position_z` = 123.319 WHERE `guid` = 19411;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(19411, 1, -624.492, -3246.95, 123.319, 100, 10000, 0, 1941102),
(19411, 2, -622.047, -3238.3, 123.232, 100, 0, 0, 0),
(19411, 3, -617.49, -3239.1, 123.286, 100, 0, 0, 0),
(19411, 4, -613.307, -3246.55, 123.307, 100, 0, 0, 0),
(19411, 5, -618.355, -3256.11, 123.318, 100, 0, 0, 0),
(19411, 6, -627.519, -3257.73, 123.307, 100, 0, 0, 0),
(19411, 7, -636.38, -3246.4, 116.761, 100, 0, 0, 0),
(19411, 8, -627.711, -3239.12, 116.778, 100, 0, 0, 0),
(19411, 9, -621.057, -3239.85, 116.778, 100, 0, 0, 0),
(19411, 10, -619.24, -3249.56, 114.201, 100, 0, 0, 0),
(19411, 11, -625.921, -3250.9, 111.685, 100, 0, 0, 0),
(19411, 12, -627.578, -3243.44, 108.855, 100, 0, 0, 0),
(19411, 13, -618.537, -3241.71, 105.138, 100, 0, 0, 0),
(19411, 14, -618.391, -3254.76, 99.5936, 100, 0, 0, 0),
(19411, 15, -625.83, -3260.94, 99.2666, 100, 0, 0, 0),
(19411, 16, -633.097, -3261.93, 98.9714, 100, 0, 0, 0),
(19411, 17, -638.664, -3257.49, 98.6941, 100, 0, 0, 0),
(19411, 18, -637.154, -3255.82, 98.4757, 100, 2000, 0, 0),
(19411, 19, -643.785, -3247.91, 99.016, 100, 0, 0, 0),
(19411, 20, -648.018, -3237.59, 98.0337, 100, 0, 0, 0),
(19411, 21, -657.183, -3231.78, 92.6463, 100, 0, 0, 0),
(19411, 22, -661.049, -3224.4, 92.4389, 100, 0, 0, 0),
(19411, 23, -659.423, -3206.36, 91.7915, 100, 0, 0, 0),
(19411, 24, -659.401, -3190.03, 91.6865, 100, 0, 0, 0),
(19411, 25, -656.54, -3181.27, 92.1305, 100, 0, 0, 0),
(19411, 26, -641.299, -3174.31, 91.7991, 100, 0, 0, 0),
(19411, 27, -626.702, -3168.92, 91.6669, 100, 0, 0, 0),
(19411, 28, -611.722, -3165.03, 92.6398, 100, 0, 0, 0),
(19411, 29, -598.991, -3161.96, 93.1144, 100, 0, 0, 0),
(19411, 30, -596.276, -3165.49, 93.1114, 100, 6000, 0, 0),
(19411, 31, -604.883, -3163.43, 93.1171, 100, 0, 0, 0),
(19411, 32, -620.473, -3167.28, 91.667, 100, 0, 0, 0),
(19411, 33, -626.316, -3174.63, 91.667, 100, 0, 0, 0),
(19411, 34, -625.972, -3178.46, 91.667, 100, 9000, 0, 1941101),
(19411, 35, -636.081, -3176.6, 91.6727, 100, 0, 0, 0),
(19411, 36, -646.209, -3181.81, 92.0552, 100, 0, 0, 0),
(19411, 37, -647.458, -3194, 91.9997, 100, 0, 0, 0),
(19411, 38, -643.096, -3206.79, 92.0956, 100, 0, 0, 0),
(19411, 39, -635.141, -3218.37, 98.1374, 100, 0, 0, 0),
(19411, 40, -643.063, -3232.61, 98.4165, 100, 0, 0, 0),
(19411, 41, -644.91, -3244.05, 98.8257, 100, 0, 0, 0),
(19411, 42, -641.17, -3253.5, 98.9707, 100, 0, 0, 0),
(19411, 43, -635.35, -3260.77, 98.4814, 100, 0, 0, 0),
(19411, 44, -628.547, -3262.06, 99.3097, 100, 0, 0, 0),
(19411, 45, -618.822, -3258.56, 99.5192, 100, 0, 0, 0),
(19411, 46, -618.625, -3242.57, 105.141, 100, 0, 0, 0),
(19411, 47, -626.882, -3243.69, 108.88, 100, 0, 0, 0),
(19411, 48, -626.192, -3250.5, 111.665, 100, 0, 0, 0),
(19411, 49, -620.024, -3249.86, 114.191, 100, 0, 0, 0),
(19411, 50, -620.908, -3240, 116.78, 100, 0, 0, 0),
(19411, 51, -631.102, -3238.88, 116.768, 100, 0, 0, 0),
(19411, 52, -635.563, -3247.12, 116.769, 100, 0, 0, 0),
(19411, 53, -627.182, -3257.56, 123.309, 100, 0, 0, 0),
(19411, 54, -618.102, -3255.83, 123.331, 100, 0, 0, 0),
(19411, 55, -612.978, -3246.75, 123.296, 100, 0, 0, 0),
(19411, 56, -617.102, -3239.08, 123.279, 100, 0, 0, 0),
(19411, 57, -622.077, -3238.7, 123.245, 100, 0, 0, 0);
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1941101, 5, 1, 1, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Horde Guard - Emote');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1941102, 1, 28, 3, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Horde Guard - Set Stand State');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1941102, 9, 28, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Horde Guard - Set Stand State');

-- add waypoints to peon
UPDATE `creature` SET `movement_type` = 2 WHERE `guid` = 13765;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(13765, 1, -637.907, -3183.19, 91.7072, 1.89202, 30000, 0, 0),
(13765, 2, -636.732, -3174.65, 91.6902, 100, 0, 0, 0),
(13765, 3, -620.18, -3167.53, 91.6675, 100, 0, 0, 0),
(13765, 4, -599.111, -3162.18, 93.1155, 100, 0, 0, 0),
(13765, 5, -574.775, -3153.58, 94.2043, 100, 0, 0, 0),
(13765, 6, -564.19, -3153.67, 95.0419, 100, 0, 0, 0),
(13765, 7, -556.996, -3161.58, 94.3286, 100, 0, 0, 0),
(13765, 8, -546.97, -3162.24, 93.7031, 100, 0, 0, 0),
(13765, 9, -538.959, -3160.92, 94.4818, 100, 0, 0, 0),
(13765, 10, -528.785, -3162.16, 95.8867, 100, 0, 0, 0),
(13765, 11, -522.78, -3156.72, 96.1399, 100, 0, 0, 0),
(13765, 12, -521.123, -3147.5, 95.7039, 100, 0, 0, 0),
(13765, 13, -521.724, -3151.82, 95.9453, 100, 0, 0, 0),
(13765, 14, -524.466, -3161.04, 95.6044, 100, 0, 0, 0),
(13765, 15, -534.292, -3161.37, 95.3432, 100, 0, 0, 0),
(13765, 16, -543.029, -3161.37, 93.7978, 100, 0, 0, 0),
(13765, 17, -554.31, -3162.36, 93.638, 100, 0, 0, 0),
(13765, 18, -560.826, -3156.8, 95.0231, 100, 0, 0, 0),
(13765, 19, -570.156, -3152.62, 95.0602, 100, 0, 0, 0),
(13765, 20, -590.048, -3159.57, 93.1951, 100, 0, 0, 0),
(13765, 21, -612.051, -3165.42, 92.5788, 100, 0, 0, 0),
(13765, 22, -628.929, -3170.78, 91.6668, 100, 0, 0, 0),
(13765, 23, -638.008, -3178.55, 91.6705, 100, 0, 0, 0);

-- correct equipment for mining peons
UPDATE `creature_equip_template` SET `equipentry1` = 1910 WHERE entry = 14901;
UPDATE `creature_addon` SET `stand_state` = 0, `equipment_id` = 1078 WHERE `guid` = 13765;
REPLACE INTO `creature_addon` (`guid`, `equipment_id`) VALUES
(13772, 3092),
(13751, 3092);
REPLACE INTO `creature_addon` (`guid`, `equipment_id`, `emote_state`) VALUES
(13776, 3092, 69);

-- allow barrens guard to roam
UPDATE `creature` SET `movement_type` = 1, `wander_distance` = 3 WHERE `guid` IN (14071, 14073);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
