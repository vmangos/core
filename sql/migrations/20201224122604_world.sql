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

-- chronalis correct position
UPDATE `creature` SET `position_x` = -8182.6, `position_y` = -4693.49, `position_z` = 16.4608 WHERE `guid` = 21774;

-- tick correct position
UPDATE `creature` SET `position_x` = -8189.83, `position_y` = -4586.73, `position_z` = 8.14232, `movement_type` = 1, `wander_distance` = 7 WHERE `guid` = 21775;

-- occulus correct position
UPDATE `creature` SET `position_x` = -8195.5, `position_y` = -4480.25, `position_z` = 9.20932, `movement_type` = 1, `wander_distance` = 7 WHERE `guid` = 21773;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
