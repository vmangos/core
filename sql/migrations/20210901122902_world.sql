DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210901122902');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210901122902');
-- Add your query below.


-- Events list for Gazban
DELETE FROM `creature_ai_events` WHERE `creature_id`=2624;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (262401, 2624, 0, 2, 0, 100, 0, 90, 10, 0, 0, 262401, 0, 0, 'Gazban - Cast Gazban Transform and Set Phase 1');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (262402, 2624, 0, 0, 1, 100, 0, 1000, 1000, 0, 0, 262402, 0, 0, 'Gazban - Cast Gazban Water Form (Phase 1)');

-- Scripts added that are triggered by the above events
DELETE FROM `creature_ai_scripts` WHERE `id`=262401;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (262401, 0, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gazban - Set Phase 1');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (262401, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1113, 0, 0, 0, 0, 0, 0, 0, 0, 'Gazban - Say Text');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (262401, 0, 15, 5402, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gazban - Cast Gazban Transform');
DELETE FROM `creature_ai_scripts` WHERE `id`=262402;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (262402, 0, 15, 5404, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gazban - Cast Gazban Water Form');

-- Position of Gazban on spawn and unique limit.
DELETE FROM `event_scripts` WHERE `id`=364;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (364, 5, 10, 2624, 900000, 1, 100, 0, 0, 0, 0, 8, 0, -1, 1, -12167.9, 630.3, -63.78, 3.65, 0, 'Summon Gazban From Altar of the Tides');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
