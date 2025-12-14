DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20231219224105');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20231219224105');
-- Add your query below.


-- Events list for Deadwood Den Watcher
DELETE FROM `creature_ai_events` WHERE `creature_id`=7156;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (715601, 7156, 0, 6, 0, 100, 0, 0, 0, 0, 0, 715601, 0, 0, 'Deadwood Den Watcher - Send Script Event on Death');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (715602, 7156, 0, 2, 0, 100, 0, 15, 0, 0, 0, 715602, 0, 0, 'Deadwood Den Watcher - Flee at 15% HP');
DELETE FROM `creature_ai_scripts` WHERE `id`=715601;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(715601, 0, 0, 85, 7157, 7157, 0, 0, 7157, 10, 8, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Deadwood Den Watcher - Send Script Event');

-- Events list for Deadwood Avenger
DELETE FROM `creature_ai_events` WHERE `creature_id`=7157;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (715701, 7157, 0, 6, 0, 100, 0, 0, 0, 0, 0, 715701, 0, 0, 'Deadwood Avenger - Send Script Event on Death');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (715702, 7157, 0, 31, 0, 100, 0, 7157, 7157, 0, 0, 715702, 0, 0, 'Deadwood Avenger - Cast Enrage on Script Event Happened');
DELETE FROM `creature_ai_scripts` WHERE `id`=715701;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(715701, 0, 0, 85, 7157, 7157, 0, 0, 7157, 10, 8, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Deadwood Avenger - Send Script Event');
DELETE FROM `creature_ai_scripts` WHERE `id`=715702;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(715702, 0, 0, 15, 8599, 1, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Deadwood Avenger - Cast Spell Enrage'),
(715702, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1151, 0, 0, 0, 0, 0, 0, 0, 0, 'Deadwood Avenger - Say Text');

-- Events list for Deadwood Shaman
DELETE FROM `creature_ai_events` WHERE `creature_id`=7158;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (715801, 7158, 0, 1, 0, 100, 1, 1000, 1000, 600000, 600000, 715801, 0, 0, 'Deadwood Shaman - Cast Lightning Shield on Spawn');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (715802, 7158, 0, 6, 0, 100, 0, 0, 0, 0, 0, 715802, 0, 0, 'Deadwood Shaman - Send Script Event on Death');
DELETE FROM `creature_ai_scripts` WHERE `id`=715802;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(715802, 0, 0, 85, 7157, 7157, 0, 0, 7157, 10, 8, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Deadwood Shaman - Send Script Event');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
