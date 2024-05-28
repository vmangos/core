DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20240527204002');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20240527204002');
-- Add your query below.

-- ashbringer event trigger
DELETE FROM `scripted_areatrigger` WHERE `entry`=4089;
INSERT INTO `scripted_areatrigger` VALUES (4089, 'at_cathedral_entrance');

-- Events list for Scarlet Sorcerer
-- Events list for Scarlet Sorcerer
DELETE FROM `creature_ai_events` WHERE `creature_id`=4294;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(429401, 4294, 0, 2, 0, 100, 4, 15, 0, 0, 0, 429401, 0, 0, 'Scarlet Sorcerer - Flee at 15% HP'),
-- new add
(429402, 4294, 0, 8, 0, 100, 0, 28441, -1, 0, 0, 429400, 0, 0, 'Scarlet Sorcerer - run ashbringer event');

-- Events list for Scarlet Myrmidon
DELETE FROM `creature_ai_events` WHERE `creature_id`=4295;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(429501, 4295, 0, 4, 0, 10, 2, 0, 0, 0, 0, 429521, 429522, 429523, 'Scarlet Myrmidon - Random Say on Aggro'),
(429502, 4295, 0, 2, 0, 100, 5, 30, 0, 120000, 125000, 429502, 0, 0, 'Scarlet Myrmidon - Cast Frenzy at 30% HP'),
-- new add
(429503, 4295, 0, 8, 0, 100, 0, 28441, -1, 0, 0, 429400, 0, 0, 'Scarlet Myrmidon - run ashbringer event');

-- Events list for Scarlet Defender
DELETE FROM `creature_ai_events` WHERE `creature_id`=4298;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(429801, 4298, 0, 4, 0, 10, 2, 0, 0, 0, 0, 429821, 429822, 429823, 'Scarlet Defender - Random Say on Aggro'),
(429802, 4298, 0, 2, 0, 100, 4, 15, 0, 0, 0, 429805, 0, 0, 'Scarlet Defender - Flee at 15% HP'),
-- new add
(429803, 4298, 0, 8, 0, 100, 0, 28441, -1, 0, 0, 429400, 0, 0, 'Scarlet Defender - run ashbringer event');

-- Events list for Scarlet Chaplain
DELETE FROM `creature_ai_events` WHERE `creature_id`=4299;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(429901, 4299, 0, 1, 0, 100, 1, 1000, 1000, 1800000, 1800000, 429901, 0, 0, 'Scarlet Chaplain - Cast Inner Fire on Spawn'),
(429902, 4299, 0, 4, 0, 10, 2, 0, 0, 0, 0, 429922, 429923, 429924, 'Scarlet Chaplain - Random Say on Aggro'),
(429903, 4299, 0, 16, 0, 100, 1, 6066, 15, 9700, 16900, 429904, 0, 0, 'Scarlet Chaplain - Cast Power Word: Shield on Friendlies Missing Aura'),
(429904, 4299, 0, 14, 0, 100, 1, 1200, 20, 22900, 28800, 429905, 0, 0, 'Scarlet Chaplain - Cast Renew on Friendlies'),
(429905, 4299, 0, 2, 0, 100, 4, 15, 0, 0, 0, 429906, 0, 0, 'Scarlet Chaplain - Flee at 15% HP'),
-- new add
(429906, 4299, 0, 8, 0, 100, 0, 28441, -1, 0, 0, 429400, 0, 0, 'Scarlet Chaplain - run ashbringer event');

-- Events list for Scarlet Wizard
DELETE FROM `creature_ai_events` WHERE `creature_id`=4300;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(430001, 4300, 0, 9, 0, 100, 13, 0, 8, 3600, 12100, 430002, 0, 0, 'Scarlet Wizard - Cast Arcane Explosion'),
(430002, 4300, 0, 2, 0, 100, 4, 15, 0, 0, 0, 430003, 0, 0, 'Scarlet Wizard - Flee at 15% HP'),
-- new add
(430003, 4300, 0, 8, 0, 100, 0, 28441, -1, 0, 0, 429400, 0, 0, 'Scarlet Wizard - run ashbringer event');

-- Events list for Scarlet Centurion
DELETE FROM `creature_ai_events` WHERE `creature_id`=4301;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(430101, 4301, 0, 4, 0, 10, 2, 0, 0, 0, 0, 430121, 430122, 430123, 'Scarlet Centurion - Random Say on Aggro'),
(430102, 4301, 0, 2, 0, 100, 4, 15, 0, 0, 0, 430103, 0, 0, 'Scarlet Centurion - Flee at 15% HP'),
-- new add
(430103, 4301, 0, 8, 0, 100, 0, 28441, -1, 0, 0, 429400, 0, 0, 'Scarlet Centurion - run ashbringer event');

-- Events list for Scarlet Champion
DELETE FROM `creature_ai_events` WHERE `creature_id`=4302;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(430201, 4302, 0, 4, 0, 10, 2, 0, 0, 0, 0, 430221, 430222, 430223, 'Scarlet Champion - Random Say on Aggro'),
(430202, 4302, 0, 2, 0, 100, 4, 15, 0, 0, 0, 430203, 0, 0, 'Scarlet Champion - Flee at 15% HP'),
-- new add 
(430203, 4302, 0, 8, 0, 100, 0, 28441, -1, 0, 0, 429400, 0, 0, 'Scarlet Champion - run ashbringer event');

-- Events list for Scarlet Abbot
DELETE FROM `creature_ai_events` WHERE `creature_id`=4303;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(430301, 4303, 0, 1, 0, 100, 1, 1000, 1000, 1800000, 1800000, 430301, 0, 0, 'Scarlet Abbot - Cast Inner Fire on Spawn'),
(430302, 4303, 0, 4, 0, 10, 2, 0, 0, 0, 0, 430322, 430323, 430324, 'Scarlet Abbot - Random Say on Aggro'),
(430303, 4303, 0, 14, 0, 100, 1, 1800, 40, 13300, 19300, 430304, 0, 0, 'Scarlet Abbot - Cast Heal on Friendlies'),
(430304, 4303, 0, 2, 0, 100, 1, 50, 0, 24100, 30200, 430305, 0, 0, 'Scarlet Abbot - Cast Renew at 50% HP'),
(430305, 4303, 0, 2, 0, 100, 5, 30, 0, 120000, 125000, 430306, 0, 0, 'Scarlet Abbot - Cast Enrage at 30% HP'),
-- new add
(430306, 4303, 0, 8, 0, 100, 0, 28441, -1, 0, 0, 429400, 0, 0, 'Scarlet Abbot - run ashbringer event');

-- Events list for Scarlet Monk
DELETE FROM `creature_ai_events` WHERE `creature_id`=4540;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(454001, 4540, 0, 4, 0, 10, 2, 0, 0, 0, 0, 454022, 454023, 454024, 'Scarlet Monk - Random Say on Aggro'),
(454002, 4540, 0, 0, 0, 100, 13, 3600, 12100, 3600, 12800, 454003, 0, 0, 'Scarlet Monk - Cast Kick'),
(454003, 4540, 0, 2, 0, 100, 4, 15, 0, 0, 0, 454004, 0, 0, 'Scarlet Monk - Flee at 15% HP'),
-- new add
(454004, 4540, 0, 8, 0, 100, 0, 28441, -1, 0, 0, 429400, 0, 0, 'Scarlet Monk - run ashbringer event');

-- ashbringer event script
DELETE FROM `creature_ai_scripts` WHERE `id`=429400;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(429400, 0, 0, 20, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'set movement type idle'),
(429400, 0, 1, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Look at Last action invoker'),
(429400, 0, 2, 22, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'set faction 35'),
(429400, 0, 3, 39, 429400, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'start script 429400');

DELETE FROM `generic_scripts` WHERE `id`=429400;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(429400, 1, 0, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Remove stand state KNEEL'),
(429400, 2, 1, 51, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Set sheath to Unarmed'),
(429400, 2, 2, 28, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Set stand state to KNEEL'),
(429400, 3, 3, 39, 429401, 429402, 0, 0, 0, 0, 0, 0, 30, 30, 0, 0, 0, 0, 0, 0, 0, 'start script Rand Talk');

DELETE FROM `generic_scripts` WHERE `id`=429401;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(429401, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12378, 12379, 12380, 12381, 0, 0, 0, 0, 0, 'Rand Talk');

DELETE FROM `generic_scripts` WHERE `id`=429402;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(429402, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12382, 12383, 12384, 0, 0, 0, 0, 0, 0, 'Rand Talk');

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
