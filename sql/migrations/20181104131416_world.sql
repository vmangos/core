DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20181104131416');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20181104131416');
-- Add your query below.


-- Make sure quest giver flag is added back to Falfindel Waywarder.
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1059, 75, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Falfindel Waywarder - Add Questgiver Flag');

-- Vile Fin Minor Oracle was using the wrong Lightning Shield spell.
DELETE FROM `creature_ai_events` WHERE `creature_id`=1544;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (154401, 1544, 0, 27, 0, 100, 1, 12550, 1, 15000, 30000, 154401, 0, 0, 'Vile Fin Minor Oracle - Cast Lightning Shield on Missing Buff');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (154402, 1544, 0, 1, 0, 100, 1, 1000, 1000, 600000, 600000, 154402, 0, 0, 'Vile Fin Minor Oracle - Cast Lightning Shield on Spawn');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (154403, 1544, 0, 2, 0, 100, 0, 15, 0, 0, 0, 154403, 0, 0, 'Vile Fin Minor Oracle - Flee at 15% HP');
DELETE FROM `creature_ai_scripts` WHERE `id`=154401;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (154401, 0, 15, 12550, 1, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Vile Fin Minor Oracle - Cast Spell Lightning Shield');
DELETE FROM `creature_ai_scripts` WHERE `id`=154402;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (154402, 0, 15, 12550, 1, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Vile Fin Minor Oracle - Cast Spell Lightning Shield');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
