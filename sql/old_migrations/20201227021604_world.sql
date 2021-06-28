DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20201227021604');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20201227021604');
-- Add your query below.


-- Events list for Mindless Undead
DELETE FROM `creature_ai_events` WHERE `creature_id`=11030;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1103001, 11030, 0, 7, 0, 100, 0, 0, 0, 0, 0, 1103001, 0, 0, 'Mindless Undead - Set Inst Data on Evade (FAIL)');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1103002, 11030, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1103002, 0, 0, 'Mindless Undead - Set Inst Data on Aggro (SPECIAL)');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1103003, 11030, 0, 29, 0, 100, 0, 8, 1, 0, 0, 1103003, 0, 0, 'Mindless Undead - Move Point on Reached Point 1');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1103004, 11030, 0, 29, 0, 100, 0, 8, 2, 0, 0, 1103004, 0, 0, 'Mindless Undead - Move Point on Reached Point 2');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1103005, 11030, 0, 29, 0, 100, 0, 8, 3, 0, 0, 1103005, 0, 0, 'Mindless Undead - Move Random on Reached Point 3');
DELETE FROM `creature_ai_scripts` WHERE `id`=1103001;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1103001, 0, 37, 4, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mindless Undead - Set Instance Data');
DELETE FROM `creature_ai_scripts` WHERE `id`=1103002;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1103002, 0, 37, 4, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mindless Undead - Set Instance Data');
DELETE FROM `creature_ai_scripts` WHERE `id`=1103003;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1103003, 0, 3, 3, 0, 4, 2, 0, 0, 0, 0, 2, 0, 0, 0, 3980.094, -3395.439, 119, 5, 0, 'Mindless Undead - Move');
DELETE FROM `creature_ai_scripts` WHERE `id`=1103004;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1103004, 0, 3, 3, 0, 4, 2, 0, 0, 0, 0, 3, 0, 0, 0, 4012, -3418.92, 117.294, 5, 0, 'Mindless Undead - Move');
DELETE FROM `creature_ai_scripts` WHERE `id`=1103005;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1103005, 0, 20, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 'Mindless Undead - Move Random');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
