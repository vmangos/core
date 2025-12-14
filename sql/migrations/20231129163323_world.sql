DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20231129163323');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20231129163323');
-- Add your query below.


-- Events list for Ambassador Flamelash
DELETE FROM `creature_ai_events` WHERE `creature_id`=9156;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (915601, 9156, 0, 4, 0, 100, 0, 0, 0, 0, 0, 915601, 0, 0, 'Ambassador Flamelash - Set Data on Aggro');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (915602, 9156, 0, 7, 0, 100, 0, 0, 0, 0, 0, 915602, 0, 0, 'Ambassador Flamelash - Set Data on Evade');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (915603, 9156, 0, 6, 0, 100, 0, 0, 0, 0, 0, 915603, 0, 0, 'Ambassador Flamelash - Set Data on Death');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (915604, 9156, 0, 0, 0, 100, 1, 5000, 5000, 5000, 5000, 915604, 0, 0, 'Ambassador Flamelash - Consume Burning Spirits in Combat');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (915605, 9156, 0, 8, 0, 100, 1, 13489, -1, 0, 0, 915605, 0, 0, 'Ambassador Flamelash - Cast Burning Spirit on Hit By Spell Burning Spirit');
DELETE FROM `creature_ai_scripts` WHERE `id`=915601;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(915601, 0, 0, 37, 43, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ambassador Flamelash - Set Data TYPE_FLAMELASH to IN_PROGRESS');
DELETE FROM `creature_ai_scripts` WHERE `id`=915602;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(915602, 0, 0, 37, 43, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ambassador Flamelash - Set Data TYPE_FLAMELASH to NOT_STARTED');
DELETE FROM `creature_ai_scripts` WHERE `id`=915603;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(915603, 0, 0, 37, 43, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ambassador Flamelash - Set Data TYPE_FLAMELASH to DONE');
DELETE FROM `creature_ai_scripts` WHERE `id`=915604;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(915604, 0, 0, 68, 915604, 2, 9178, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ambassador Flamelash - Start Script on all Burning Spirits');
DELETE FROM `generic_scripts` WHERE `id`=915604;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(915604, 0, 0, 15, 13489, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Burning Spirit - Cast Spell Burning Spirit');
DELETE FROM `creature_ai_scripts` WHERE `id`=915605;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(915605, 0, 0, 15, 14744, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ambassador Flamelash - Cast Spell Burning Spirit');
UPDATE `creature_template` SET `auras`='15573', `ai_name`='EventAI', `script_name`='' WHERE `entry`=9156;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
