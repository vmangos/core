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
(14873, 4, 263.666, -3040.67, 96.7799, 100, 23000, 0, 1487301),
(14873, 5, 258.394, -3056.6, 96.9665, 100, 0, 0, 0),
(14873, 6, 257.546, -3074.49, 95.9003, 100, 0, 0, 0),
(14873, 7, 250.316, -3092.9, 91.6677, 100, 0, 0, 0),
(14873, 8, 235.912, -3128.75, 92.4212, 100, 0, 0, 0),
(14873, 9, 209.098, -3160.45, 90.4509, 100, 120000, 10, 1487302),
(14873, 10, 215.011, -3148.35, 91.4527, 100, 0, 0, 0),
(14873, 11, 216.143, -3135.25, 92.0509, 100, 0, 0, 0),
(14873, 12, 224.635, -3109.24, 93.8019, 100, 0, 0, 0),
(14873, 13, 232.62, -3094.19, 92.4219, 100, 0, 0, 0),
(14873, 14, 243.791, -3079.7, 92.2762, 100, 0, 0, 0),
(14873, 15, 254.944, -3051.44, 96.3146, 100, 0, 0, 0),
(14873, 16, 258.146, -3043.86, 96.2321, 100, 0, 0, 0);

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


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
