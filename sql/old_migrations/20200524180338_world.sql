DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200524180338');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200524180338');
-- Add your query below.


-- set faction for defias rioter
UPDATE `creature_template` SET `faction` = 17 WHERE entry = 5043;

-- add middle lane pathing
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(504301, 1, -8716.43, 884.722, 76.3504, 100, 0, 0, 0),
(504301, 2, -8742.05, 864.404, 76.5227, 100, 0, 0, 0),
(504301, 3, -8754.53, 854.314, 82.5392, 100, 0, 0, 0),
(504301, 4, -8762.12, 848.166, 86.1997, 100, 0, 0, 0),
(504301, 5, -8764.43, 846.379, 87.2971, 100, 0, 0, 0),
(504301, 6, -8772.04, 840.429, 90.9329, 100, 0, 0, 0),
(504301, 7, -8780.68, 833.842, 95.0307, 100, 0, 0, 0);

-- add left lane pathing
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(504302, 1, -8713.28, 884.912, 76.351, 100, 0, 0, 0),
(504302, 2, -8740.69, 863.015, 76.448, 100, 0, 0, 0),
(504302, 3, -8753.21, 852.692, 82.5292, 100, 0, 0, 0),
(504302, 4, -8760.63, 846.642, 86.1184, 100, 0, 0, 0),
(504302, 5, -8762.88, 844.698, 87.2342, 100, 0, 0, 0),
(504302, 6, -8770.44, 838.699, 90.8653, 100, 0, 0, 0),
(504302, 7, -8778.45, 831.800, 94.8518, 100, 0, 0, 0);

-- add right lane pathing
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(504303, 1, -8715.18, 887.661, 76.3511, 100, 0, 0, 0),
(504303, 2, -8742.84, 865.801, 76.4288, 100, 0, 0, 0),
(504303, 3, -8755.53, 855.885, 82.4662, 100, 0, 0, 0),
(504303, 4, -8763.28, 849.84, 86.1526, 100, 0, 0, 0),
(504303, 5, -8765.64, 847.962, 87.2845, 100, 0, 0, 0),
(504303, 6, -8773.36, 842.437, 90.8508, 100, 0, 0, 0),
(504303, 7, -8781.85, 835.478, 94.9935, 100, 0, 0, 0);

-- add event
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (171902, 1719, 0, 1, 0, 100, 1, 1800000, 1800000, 1800000, 1800000, 171902, 0, 0, 'Warden Thelwater - Start Stockade Jailbreak Event');

-- add event scripts
DELETE FROM `creature_ai_scripts` WHERE `id`=171902;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (171902, 0, 10, 5043, 20000, 0, 0, 0, 0, 0, 0, 1, 504301, 6, 1, -8712.94, 887.305, 76.3511, 3.84802, 0, 'jailbreak - summon middle lane 3');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (171902, 0, 10, 5043, 20000, 0, 0, 0, 0, 0, 0, 1, 504301, 6, 1, -8714.18, 886.399, 76.3511, 3.84802, 0, 'jailbreak - summon middle lane 2');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (171902, 0, 10, 5043, 20000, 0, 0, 0, 0, 0, 0, 1, 504303, 6, 1, -8715.18, 887.661, 76.3511, 3.84802, 0, 'jailbreak - summon right lane 1');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (171902, 0, 10, 5043, 20000, 0, 0, 0, 0, 0, 0, 1, 504302, 6, 1, -8713.28, 884.912, 76.351, 3.84802, 0, 'jailbreak - summon left lane 1');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (171902, 0, 10, 5043, 20000, 0, 0, 0, 0, 0, 0, 1, 504301, 6, 1, -8716.43, 884.722, 76.3504, 3.84802, 0, 'jailbreak - summon middle lane 1');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (171902, 0, 10, 5043, 20000, 0, 0, 0, 0, 0, 0, 1, 504302, 6, 1, -8711.87, 885.939, 76.3511, 3.84802, 0, 'jailbreak - summon left lane 2');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (171902, 0, 10, 5043, 20000, 0, 0, 0, 0, 0, 0, 1, 504303, 6, 1, -8714.06, 888.635, 76.3511, 3.84802, 0, 'jailbreak - summon right lane 2');


-- add event scripts, scripts
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (504301, 0, 60, 3, 0, 0, 0, 0, 0, 0, 0, 0, 504301, 0, 0, 0, 0, 0, 0, 0, 'jailbreak - middle lane move');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (504302, 0, 60, 3, 0, 0, 0, 0, 0, 0, 0, 0, 504302, 0, 0, 0, 0, 0, 0, 0, 'jailbreak - left lane move');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (504303, 0, 60, 3, 0, 0, 0, 0, 0, 0, 0, 0, 504303, 0, 0, 0, 0, 0, 0, 0, 'jailbreak - right lane move');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
