DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190510165941');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190510165941');
-- Add your query below.


-- Condition to only heal if victim is player owned.
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (12397, 28, 1, 0, 0, 0, 0);

-- Kazzak yell on kill should not include target name in vanilla.
-- https://www.youtube.com/watch?v=6xhgvouRprw
UPDATE `broadcast_text` SET `MaleText`='Your own strength feeds me!' WHERE `ID`=8461;

-- Kazzak should yell all his texts.
UPDATE `broadcast_text` SET `Type`=1 WHERE `ID` IN (8651, 8650, 8461);

-- Delete texts from custom table. A lot of these are from TBC actually.
DELETE FROM `script_texts` WHERE `entry` IN (-1000161, -1000160, -1000159, -1000158, -1000157, -1000156, -1000155, -1000154, -1000153, -1000152, -1000151, -1000150, -1000149, -1000148, -1000147);

-- Events list for Lord Kazzak.
DELETE FROM `creature_ai_events` WHERE `creature_id`=12397;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1239701, 12397, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1239701, 0, 0, 'Lord Kazzak - Say Text on Aggro');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1239702, 12397, 12397, 5, 0, 100, 1, 0, 0, 0, 0, 1239702, 0, 0, 'Lord Kazzak - Cast Capture Soul on Killed Player');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1239703, 12397, 0, 0, 0, 100, 0, 180000, 180000, 0, 0, 1239703, 0, 0, 'Lord Kazzak - Enrage after 3 minutes');
DELETE FROM `creature_ai_scripts` WHERE `id`=1239701;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1239701, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8650, 0, 0, 0, 0, 0, 0, 0, 0, 'Lord Kazzak - Say Text');
DELETE FROM `creature_ai_scripts` WHERE `id`=1239702;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1239702, 0, 15, 21054, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lord Kazzak - Cast Spell Capture Soul');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1239702, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8461, 0, 0, 0, 0, 0, 0, 0, 0, 'Lord Kazzak - Say Text');
DELETE FROM `creature_ai_scripts` WHERE `id`=1239703;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1239703, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8651, 0, 0, 0, 0, 0, 0, 0, 0, 'Lord Kazzak - Say Text');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1239703, 0, 55, 123971, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Lord Kazzak - Set Spells List');

-- Spell lists for Lord Kazzak.
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (123970, 'Blasted Lands - Lord Kazzak', 21341, 100, 0, 0, 0, 2, 8, 12, 4, 6, 0, 16044, 100, 1, 0, 0, 0, 3, 3, 7, 10, 0, 8078, 100, 0, 0, 0, 2, 4, 8, 7, 12, 0, 22709, 100, 1, 0, 0, 0, 10, 10, 9, 12, 0, 21056, 100, 4, 0, 0, 0, 10, 10, 10, 10, 0, 21063, 100, 4, 0, 0, 0, 12, 12, 15, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (123971, 'Blasted Lands - Lord Kazzak (Enraged)', 21341, 100, 0, 0, 0, 2, 1, 1, 1, 1, 0, 16044, 100, 1, 0, 0, 0, 3, 3, 7, 10, 0, 8078, 100, 0, 0, 0, 2, 4, 8, 7, 12, 0, 22709, 100, 1, 0, 0, 0, 10, 10, 9, 12, 0, 21056, 100, 4, 0, 0, 0, 10, 10, 10, 10, 0, 21063, 100, 4, 0, 0, 0, 12, 12, 15, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- Assign script to Lord Kazzak.
UPDATE `creature_template` SET `spell_list_id`=123970, `ai_name`='EventAI', `script_name`='' WHERE `entry`=12397;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
