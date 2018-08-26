DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180627072347');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180627072347');
-- Add your query below.


-- Enraged Panther
DELETE FROM `creature_ai_events` WHERE `creature_id`=10992;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1099201, 10992, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1099201, 0, 0, 'Enraged Panther - Remove Not Attackable Flag on Aggro');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1099202, 10992, 0, 1, 0, 100, 0, 1000, 1000, 0, 0, 1099202, 0, 0, 'Enraged Panther - Add Not Attackable Flag on OOC');
DELETE FROM `creature_ai_scripts` WHERE `id`=1099201;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1099201, 0, 4, 46, 258, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Enraged Panther - Remove Not Attackable Flag');
DELETE FROM `creature_ai_scripts` WHERE `id`=1099202;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1099202, 0, 4, 46, 258, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Enraged Panther - Add Not Attackable Flag');
UPDATE `creature_template` SET `AIName`='EventAI', `ScriptName`='' WHERE `entry`=10992;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
