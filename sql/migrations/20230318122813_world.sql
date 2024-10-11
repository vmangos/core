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
(716701, 7167, 0, 4, 0, 100, 0, 0, 0, 0, 0, 716701, 0, 0, 'Polly - On Aggro - Say Random Aggro'),
(716702, 7167, 0, 8, 0, 100, 0, 9976, -1, 0, 0, 716702, 0, 0, 'Polly - On Spellhit - Set Home Position'),
(716703, 7167, 0, 8, 0, 100, 0, 9976, -1, 0, 0, 716703, 0, 0, 'Polly - On Spellhit - Set Faction 35'),
(716704, 7167, 0, 8, 0, 100, 0, 9976, -1, 0, 0, 716704, 0, 0, 'Polly - On Spellhit - Start generic script'); -- generic script to work with delayed actions

DELETE FROM `creature_ai_scripts` WHERE `id` IN (716701, 716702, 716703, 716704);
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(716701, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3164, 3170, 0, 0, 0, 0, 0, 0, 0, 'Polly - On Aggro - Say Random Aggro'),
(716702, 0, 0, 34, 1, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Polly - On Spellhit - Set Home Position'),
(716703, 0, 0, 22, 35, 1, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Polly - On Spellhit - Set Faction to Friendly'),
(716704, 0, 0, 39, 716704, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Polly - On Spellhit - Start generic script');

DELETE FROM `generic_scripts` WHERE `id` IN (716704);
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(716704, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 3167, 0, 0, 0, 0, 0, 0, 0, 0, 'Polly - On Spellhit - Say Cracker'),
(716704, 2, 0, 15, 9998, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Polly - On Spellhit - Cast Spell Summon Polly Jr.'),
(716704, 3, 0, 18, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Polly - On Spellhit - Despawn');

-- Polly (after E.C.A.C)
DELETE FROM `creature_ai_events` WHERE `creature_id`=7168;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(716801, 7168, 0, 11, 0, 100, 0, 0, 0, 0, 0, 716801, 0, 0, 'Polly - On Just Spawned - Start generic script');

DELETE FROM `creature_ai_scripts` WHERE `id`=716801;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(716801, 0, 0, 39, 716801, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Polly - On Just Spawned - Start generic script');  -- generic script to work with delayed actions (just spawned needs delay to actually show text)

DELETE FROM `generic_scripts` WHERE `id`=716801;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(716801, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3165, 0, 0, 0, 0, 0, 0, 0, 0, 'Polly - On Just Spawned - Say what the Squawk');

-- Script event (object=123462) - Summon 7167
UPDATE `event_scripts` SET `x`=-1463.40, `y`=-3926.96, `z`=0.24, `o`=4.88 WHERE `id`=2153;

-- Despawn Polly after 3 minutes OOC
DELETE FROM `event_scripts` WHERE `id`=2153;
INSERT INTO `event_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(2153, 5, 0, 10, 7167, 180000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 4, -1463.4, -3926.96, 0.24, 4.88, 0, 'Summon Polly for quest 2381');

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
