DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230318122813');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230318122813');
-- Add your query below.

UPDATE `creature_template` SET `script_name` = '' WHERE `entry` = 7168;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry`=7167;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry`=7168;

-- Polly (pre E.C.A.C)
DELETE FROM `creature_ai_events` WHERE `creature_id`=7167;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES 
(716701, 7167, 0, 1, 0, 100, 1, 73000, 73000, 60000, 60000, 716701, 0, 0, 'Polly - OOC - Cast Stealth'),
(716702, 7167, 0, 4, 0, 100, 0, 0, 0, 0, 0, 716702, 0, 0, 'Polly - On Aggro - Say Aggro');

DELETE FROM `creature_ai_scripts` WHERE `id` IN (716701, 716702);
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(716701, 0, 0, 15, 8822, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Polly - OOC - Cast Stealth'),
(716702, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3164, 3170, 0, 0, 0, 0, 0, 0, 0, 'Polly - On Aggro - Say Aggro');

-- Polly (after E.C.A.C)
DELETE FROM `creature_ai_events` WHERE `creature_id`=7168;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(716801, 7168, 0, 4, 0, 100, 0, 0, 0, 0, 0, 716801, 0, 0, 'Polly - On Aggro - Say Cracker'),
(716802, 7168, 0, 4, 0, 100, 0, 0, 0, 0, 0, 716802, 0, 0, 'Polly - On Aggro - Say Squawk');


DELETE FROM `creature_ai_scripts` WHERE `id` IN (716801);
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(716801, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3165, 0, 0, 0, 0, 0, 0, 0, 0, 'Polly - On Aggro - Say Cracker'),
(716802, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3167, 0, 0, 0, 0, 0, 0, 0, 0, 'Polly - On Aggro - Say Squawk');

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
