DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20201224122604');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20201224122604');
-- Add your query below.


-- remove incorrect Gadgetzan Bruisers
DELETE FROM `creature` WHERE `guid` IN (60002, 60000, 60001, 23576, 23582, 23583);
DELETE FROM `creature_movement` WHERE `id` = 60000;

-- add Trenton Lighthammer script
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry` = 7804;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (780401, 7804, 0, 1, 0, 100, 1, 0, 0, 78000, 78000, 780401, 0, 0, 'Trenton Lighthammer - Emote OOC');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (780401, 0, 39, 780401, 0, 0, 0, 0, 0, 0, 4, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Trenton Lighthammer - Start Script');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (780401, 0, 39, 780401, 0, 0, 0, 0, 0, 0, 4, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Trenton Lighthammer - Start Script');

-- Chronalis correct position
UPDATE `creature` SET `position_x` = -8182.6, `position_y` = -4693.49, `position_z` = 16.4608 WHERE `guid` = 21774;

-- Tick correct position
UPDATE `creature` SET `position_x` = -8189.83, `position_y` = -4586.73, `position_z` = 8.14232, `movement_type` = 1, `wander_distance` = 7 WHERE `guid` = 21775;

-- Occulus correct position
UPDATE `creature` SET `position_x` = -8195.5, `position_y` = -4480.25, `position_z` = 9.20932, `movement_type` = 1, `wander_distance` = 7 WHERE `guid` = 21773;


-- Thousand Needles
-- Tarkreu Shadowstalker should roam
UPDATE `creature` SET `movement_type` = 1, `wander_distance` = 2 WHERE `guid` = 21697;

-- Nagzehn waypoints
UPDATE `creature` SET `movement_type` = 2 WHERE `guid` = 21695;
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(4545, 1, -5854.42, -3418.36, -50.9324, 100, 5000, 0, 0),
(4545, 2, -5853.9, -3410.98, -50.9325, 100, 0, 0, 0),
(4545, 3, -5852.32, -3407.94, -50.9325, 100, 0, 0, 0),
(4545, 4, -5849.7, -3407.4, -50.9335, 100, 5000, 0, 0),
(4545, 5, -5843.16, -3408.65, -50.9749, 100, 0, 0, 0),
(4545, 6, -5840.28, -3409.66, -50.9317, 100, 0, 0, 0),
(4545, 7, -5837.72, -3410.56, -50.9328, 100, 0, 0, 0),
(4545, 8, -5832.82, -3415.98, -50.9326, 100, 5000, 0, 0),
(4545, 9, -5834.44, -3418.55, -50.9325, 100, 0, 0, 0),
(4545, 10, -5839.25, -3421.45, -50.9325, 100, 0, 0, 0),
(4545, 11, -5850.07, -3415.56, -50.9325, 100, 0, 0, 0);



-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
