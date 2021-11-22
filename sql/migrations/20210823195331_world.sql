DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210823195331');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210823195331');
-- Add your query below.


-- Events list for Aurius
DELETE FROM `creature_ai_events` WHERE `creature_id`=10917;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1091701, 10917, 0, 11, 6, 100, 1, 0, 0, 0, 0, 1091701, 0, 0, 'Aurius - Kneel on Spawn  (Phase 0)');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1091702, 10917, 0, 10, 6, 100, 1, 2, 5, 30000, 30000, 1091702, 0, 0, 'Aurius - Stand Up and Emote on Friendly in LoS (Phase 0)');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1091703, 10917, 0, 1, 5, 100, 0, 10000, 10000, 0, 0, 1091703, 0, 0, 'Aurius - Fake Death after Leaving Combat (Phase 1)');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1091704, 10917, 0, 2, 5, 100, 0, 30, 1, 0, 0, 1091703, 0, 0, 'Aurius - Fake Death at 30% HP (Phase 1)');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1091705, 10917, 3758, 1, 3, 100, 0, 0, 0, 0, 0, 1091705, 0, 0, 'Aurius - Add Quest Giver Flag on Rivendare Dead (Phase 2)');
DELETE FROM `creature_ai_scripts` WHERE `id`=1091703;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(1091703, 0, 44, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Aurius - Set Phase to 2'),
(1091703, 0, 73, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Aurius - Combat Stop'),
(1091703, 0, 4, 46, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Aurius - Add Unattackable Flag'),
(1091703, 0, 20, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Aurius - Move Idle'),
(1091703, 0, 28, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Aurius - Set Stand State to Dead'),
(1091703, 0, 18, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Aurius - Despawn in 5 minutes'),
(1091703, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6237, 0, 0, 0, 0, 0, 0, 0, 0, 'Aurius - Say Text'),
(1091703, 0, 37, 7, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Aurius - Set Data');
DELETE FROM `creature_ai_scripts` WHERE `id`=1091705;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1091705, 0, 4, 147, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Aurius - Add Quest Giver Flag');
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (3758, 34, 5, 3, 0, 0, 0);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
