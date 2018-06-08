DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180426223835');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180426223835');
-- Add your query below.


-- This Imp can have it's AI auto assigned now.
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=416;

-- Fix wrong Summon Imp spell being used by Burning Blade Summoner.
DELETE FROM `creature_ai_scripts` WHERE `id`=466802;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (466802, 0, 15, 11939, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Burning Blade Summoner - Cast Spell Summon Imp');

-- Fix Imp Minion summoned by various creatures not behaving like a pet.
DELETE FROM `creature_ai_events` WHERE `creature_id`=12922;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1292201, 12922, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1292201, 0, 0, 'Imp Minion - Cast Fireball on Aggro (Not Really Needed)');
DELETE FROM `creature_ai_scripts` WHERE `id`=1292201;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1292201, 0, 15, 20801, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Imp Minion - Cast Fireball');
UPDATE `creature_template` SET `AIName`='EventAI' WHERE `entry`=12922;

-- Fix Hukku's Imp not behaving like a pet.
DELETE FROM `creature_ai_events` WHERE `creature_id`=8658;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (865801, 8658, 0, 4, 0, 100, 0, 0, 0, 0, 0, 865801, 0, 0, 'Hukku\'s Imp - Cast Fireball on Aggro (Not Really Needed)');
DELETE FROM `creature_ai_scripts` WHERE `id`=865801;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (865801, 0, 15, 11762, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Hukku\'s Imp - Cast Fireball');
UPDATE `creature_template` SET `AIName`='EventAI' WHERE `entry`=8658;

-- Removing not needed event for Tamed Battleboar.
DELETE FROM `creature_ai_events` WHERE `creature_id`=4535;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (453501, 4535, 0, 4, 0, 100, 0, 0, 0, 0, 0, 453501, 0, 0, 'Tamed Battleboar - Cast Rushing Charge on Aggro');
DELETE FROM `creature_ai_scripts` WHERE `id` IN (453502);

-- Fix mana for Hukku's Succubus.
UPDATE `creature_template` SET `minmana`=1923, `maxmana`=1923 WHERE `entry`=8657;

-- Timbermaw Ancestor
INSERT INTO `conditions` VALUES (15720, 41, 50, 2, 0);
DELETE FROM `creature_ai_events` WHERE `creature_id`=15720;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1572001, 15720, 0, 1, 0, 100, 0, 1000, 1000, 0, 0, 1572001, 0, 0, 'Timbermaw Ancestor - Cast Healing Touch on Injured Owner when OOC');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1572002, 15720, 0, 11, 0, 100, 0, 0, 0, 0, 0, 1572002, 0, 0, 'Timbermaw Ancestor - Set Reaction State To Defensive on Spawn');
DELETE FROM `creature_ai_scripts` WHERE `id`=1572001;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1572001, 0, 15, 26097, 1, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15720, 'Timbermaw Ancestor - Cast Healing Wave');
DELETE FROM `creature_ai_scripts` WHERE `id`=1572002;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1572002, 0, 59, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Timbermaw Ancestor - Set Reaction State To Defensive');
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (157200, 'Pet - Timbermaw Ancestor', 26097, 100, 15, 40, 50, 0, 0, 0, 7, 7, 0, 9532, 100, 1, 0, 0, 8, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
UPDATE `creature_template` SET `AIName`='EventAI', `ScriptName`='', `spells_template`=157200 WHERE `entry`=15720;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
