DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220826220326');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220826220326');
-- Add your query below.


-- Misc
UPDATE `creature_template` set `faction` = 21, `script_name` = '' WHERE `entry` IN (
14521,
14520,
14519,
14518,
14516,
14514,
14513,
14512,
14511
);

UPDATE `creature_template` SET `detection_range` = 45 WHERE `entry` IN (
14521,
14520,
14519,
14518,
14514,
14513,
14512,
14511);

UPDATE `creature_template` SET `level_min` = 60 WHERE `entry` = 14514 AND `patch` = 2;
UPDATE `creature_template` SET `level_min` = 60 WHERE `entry` = 14519 AND `patch` = 2;
UPDATE `creature_template` SET `auras` = '23245' WHERE `entry` = 14512 AND `patch` = 2;
UPDATE `creature_template` SET `gold_min` = 0, `gold_max` = 0 WHERE `entry` = 14514 AND `patch` = 2;
UPDATE `creature_template` SET `gold_min` = 0, `gold_max` = 0 WHERE `entry` = 14513 AND `patch` = 2;
UPDATE `creature_template` SET `gold_min` = 0, `gold_max` = 0 WHERE `entry` = 14512 AND `patch` = 2;
UPDATE `creature_template` SET `gold_min` = 0, `gold_max` = 0 WHERE `entry` = 14511 AND `patch` = 2;
UPDATE `gameobject` SET `spawn_flags` = 1 WHERE `guid` IN (43191, 99866);

-- Shadowed Spirit
UPDATE `creature_template` SET `spell_list_id` = 145110 WHERE `entry` = 14511 AND `patch`=2;
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (145110, 'Scholomance - Shadowed Spirit', 12739, 100, 1, 0, 0, 0, 0, 3, 0, 21, 0, 22417, 100, 0, 0, 0, 32, 2, 16, 21, 21, 0, 15245, 100, 1, 0, 0, 0, 10, 20, 23, 23, 0, 22575, 100, 1, 0, 0, 0, 11, 13, 18, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- Corrupted Spirit
UPDATE `creature_template` SET `spell_id1` = 0, `spell_id2` = 0 WHERE `entry` = 14512 AND `patch`=2;

-- Malicious Spirit
UPDATE `creature_template` SET `spell_id1` = 0, `spell_id2` = 0, `spell_list_id` = 145130 WHERE `entry` = 14513 AND `patch`=2;
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (145130, 'Scholomance - Malicious Spirit', 13738, 100, 1, 0, 0, 32, 2, 15, 8, 18, 0, 12721, 100, 1, 0, 0, 32, 14, 14, 14, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- Banal Spirit
UPDATE `creature_template` SET `spell_id1` = 0, `spell_id2` = 0, `spell_id3` = 0, `spell_list_id` = 145140 WHERE `entry` = 14514 AND `patch`=2;
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (145140, 'Scholomance - Banal Spirit', 23262, 100, 1, 0, 0, 32, 0, 23, 0, 23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- Aspect of Banality
UPDATE `creature_template` SET `ai_name` = 'EventAI', `spell_id1` = 0, `spell_id2` = 0, `spell_id3` = 0, `spell_list_id` = 145180, `spawn_spell_id`=10389 WHERE `entry` = 14518 AND `patch`=2;
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (145180, 'Scholomance - Aspect of Banality', 16247, 100, 1, 0, 0, 32, 13, 13, 29, 29, 0, 8140, 100, 4, 0, 0, 32, 5, 5, 15, 18, 0, 16244, 100, 1, 0, 0, 32, 11, 11, 11, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- Aspect of Corruption (NOTE: I think spell 13619 may proc from another spell)
UPDATE `creature_template` SET `ai_name` = 'EventAI', `spell_id1` = 0, `spell_id2` = 0, `spell_list_id` = 145190, `spawn_spell_id`=10389 WHERE `entry` = 14519 AND `patch`=2;
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (145190, 'Scholomance - Aspect of Corruption', 23268, 100, 1, 0, 0, 32, 15, 15, 15, 15, 0, 13619, 100, 1, 0, 0, 32, 15, 15, 15, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- Aspect of Malice
UPDATE `creature_template` SET `ai_name` = 'EventAI', `spell_id1`= 0, `spell_id2` = 0, `spell_id3` = 0, `spell_list_id` = 145200, `spawn_spell_id`=10389 WHERE `entry` = 14520 AND `patch` = 2;
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (145200, 'Scholomance - Aspect of Malice', 13738, 100, 1, 0, 0, 0, 15, 15, 15, 15, 0, 16098, 100, 1, 0, 0, 32, 11, 11, 11, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- Aspect of Shadow
UPDATE `creature_template` SET `ai_name` = 'EventAI', `spell_id1` = 0, `spell_id2` = 0, `spell_list_id` = 145210, `spawn_spell_id` = 10389 WHERE `entry` = 14521 AND `patch`=2;
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (145210, 'Scholomance - Aspect of Shadow', 17289, 100, 1, 0, 0, 0, 21, 21, 21, 21, 0, 15472, 100, 1, 0, 0, 0, 0, 3, 3, 9, 0, 17228, 100, 1, 0, 0, 0, 13, 13, 10, 10, 0, 22417, 100, 0, 0, 0, 32, 12, 12, 12, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- Death Knight Darkreaver
UPDATE `creature_template` SET `spawn_spell_id`=12980 WHERE `entry`=14516;

-- Add AI For Paladin Stuns
-- Banal Spirit / Aspect of Banality
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 14514 AND `patch`=2;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1451802, 14518, 0, 8, 0, 100, 1, 20355, 2, 0, 0, 1451401, 0, 0, 'Aspect of Banality - Cast Spell On Hit By Spell');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1451401, 14514, 0, 8, 0, 100, 1, 20355, 2, 0, 0, 1451401, 0, 0, 'Banal Spirit - Cast Spell On Hit By Spell');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1451401, 0, 0, 15, 23269, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Banal Spirit - Cast Spell'),
(1451401, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9732, 0, 0, 0, 0, 0, 0, 0, 0, 'Banal Spirit - Talk');

-- Malicious Spirit / Aspect of Malice
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 14513 AND `patch`=2;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1452002, 14520, 0, 8, 0, 100, 1, 20184, 2, 0, 0, 1451301, 0, 0, 'Aspect of Malice - Cast Spell On Hit By Spell');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1451301, 14513, 0, 8, 0, 100, 1, 20184, 2, 0, 0, 1451301, 0, 0, 'Malicious Spirit - Cast Spell On Hit By Spell');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1451301, 0, 0, 15, 23269, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Malicious Spirit - Cast Spell'),
(1451301, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9774, 0, 0, 0, 0, 0, 0, 0, 0, 'Malicious Spirit - Talk');

-- Corrupted Spirit / Aspect of Corruption
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 14512 AND `patch`=2;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1451902, 14519, 0, 8, 0, 100, 1, 20286, 2, 0, 0, 1451201, 0, 0, 'Aspect of Corruption - Cast Spell On Hit By Spell');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (14512, 14512, 0, 8, 0, 100, 1, 20286, 2, 0, 0, 1451201, 0, 0, 'Corrupted Spirit - Cast Spell On Hit By Spell');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1451201, 0, 0, 15, 23269, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Corrupted Spirit - Cast Spell'),
(1451201, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9775, 0, 0, 0, 0, 0, 0, 0, 0, 'Corrupted Spirit - Talk');

-- Shadowed Spirit / Aspect of Shadow
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 14511 AND `patch`=2;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1452102, 14521, 0, 8, 0, 100, 1, 20346, 2, 0, 0, 1451101, 0, 0, 'Aspect of Shadow - Cast Spell On Hit By Spell');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1451101, 14511, 0, 8, 0, 100, 1, 20346, 2, 0, 0, 1451101, 0, 0, 'Shadowed Spirit - Cast Spell On Hit By Spell');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1451101, 0, 0, 15, 23269, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shadowed Spirit - Cast Spell'),
(1451101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9773, 0, 0, 0, 0, 0, 0, 0, 0, 'Shadowed Spirit - Talk');

-- Add Conditions To Check If All Creatures In Waves Are Dead
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES
(561, 47, 843601, 121, 0, 0, 0),
(562, 47, 843602, 121, 0, 0, 0),
(563, 47, 843603, 121, 0, 0, 0),
(564, 47, 843604, 121, 0, 0, 0),
(565, 47, 843605, 121, 0, 0, 0),
(566, 47, 843606, 121, 0, 0, 0),
(567, 47, 843607, 121, 0, 0, 0),
(568, 47, 843608, 121, 0, 0, 0),
(569, 47, 843609, 121, 0, 0, 0),
(570, 47, 843610, 121, 0, 0, 0);

-- 571: Stored Value In Index 15 From Instance Script Is Equal To 0
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (571, 34, 15, 0, 0, 0, 0);

-- 238: No Player in 60 Yards
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (238, 56, 0, 60, 0, 0, 1);

-- Fail Script To Despawn Creatures
DELETE FROM `generic_scripts` WHERE `id`=1356;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1356, 0, 0, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Generic - Despawn Creature');

-- Fail Script To Reopen Gates
DELETE FROM `generic_scripts` WHERE `id`=843600;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(843600, 0, 0, 87, 0, 0, 0, 0, 43191, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Divination Scryer - Reset Door'),
(843600, 0, 0, 37, 15, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Divination Scryer - Set Data Darkreaver to Failed'),
(843600, 0, 0, 41, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Divination Scryer - Remove GameObject');

-- Script on Using Item
DELETE FROM `event_scripts` WHERE `id`=8436;
INSERT INTO `event_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(8436, 0, 0, 39, 843601, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 571, 'Divination Scryer - Start Script');

-- Wave 1
DELETE FROM `generic_scripts` WHERE `id`=843601;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(843601, 0, 0, 61, 843601, 300, 0, 0, 300144, 50, 11, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Divination Scryer Wave 1: Start Map Event'),
(843601, 0, 1, 37, 15, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Divination Scryer Wave 1: Set Data Darkreaver to In Progress'),
(843601, 1, 0, 13, 0, 0, 0, 0, 43191, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Divination Scryer Wave 1: Door - Activate GameObject'),
(843601, 1, 0, 10, 14514, 0, 0, 0, 0, 0, 0, 0, 0, 1451101, 0, 5, 103.035, 141.296, 93.9416, 1.41372, 0, 'Divination Scryer Wave 1: Summon Creature Banal Spirit'),
(843601, 1, 0, 10, 14514, 0, 0, 0, 0, 0, 0, 0, 0, 1451101, 0, 5, 157.055, 191.011, 93.1686, 2.02458, 0, 'Divination Scryer Wave 1: Summon Creature Banal Spirit'),
(843601, 1, 0, 10, 14514, 0, 0, 0, 0, 0, 0, 0, 0, 1451101, 0, 5, 135.822, 193.203, 93.5791, 1.16937, 0, 'Divination Scryer Wave 1: Summon Creature Banal Spirit'),
(843601, 1, 0, 10, 14514, 0, 0, 0, 0, 0, 0, 0, 0, 1451101, 0, 5, 150.902, 139.409, 93.1686, 2.25147, 0, 'Divination Scryer Wave 1: Summon Creature Banal Spirit'),
(843601, 1, 0, 10, 14514, 0, 0, 0, 0, 0, 0, 0, 0, 1451101, 0, 5, 160.644, 149.564, 93.1686, 3.22886, 0, 'Divination Scryer Wave 1: Summon Creature Banal Spirit'),
(843601, 1, 0, 10, 14514, 0, 0, 0, 0, 0, 0, 0, 0, 1451101, 0, 5, 101.088, 195.53, 93.1686, 6.10865, 0, 'Divination Scryer Wave 1: Summon Creature Banal Spirit'),
(843601, 1, 0, 10, 14514, 0, 0, 0, 0, 0, 0, 0, 0, 1451101, 0, 5, 134.204, 138.349, 93.1686, 1.41372, 0, 'Divination Scryer Wave 1: Summon Creature Banal Spirit'),
(843601, 1, 0, 10, 14514, 0, 0, 0, 0, 0, 0, 0, 0, 1451101, 0, 5, 118.552, 193.25, 93.1587, 5.06145, 0, 'Divination Scryer Wave 1: Summon Creature Banal Spirit'),
(843601, 1, 0, 10, 14514, 0, 0, 0, 0, 0, 0, 0, 0, 1451101, 0, 5, 161.478, 169.113, 93.1686, 2.6529, 0, 'Divination Scryer Wave 1: Summon Creature Banal Spirit'),
(843601, 1, 0, 10, 14514, 0, 0, 0, 0, 0, 0, 0, 0, 1451101, 0, 5, 121.763, 136.966, 93.483, 1.01229, 0, 'Divination Scryer Wave 1: Summon Creature Banal Spirit'),
(843601, 3, 0, 69, 843601, 0, 0, 0, 300144, 50, 11, 9, 561, 843602, 238, 843600, 0, 0, 0, 0, 0, 'Divination Scryer Wave 1: Edit Map Event');

DELETE FROM `generic_scripts` WHERE `id`=1451101;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1451101, 0, 0, 63, 843601, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1356, 0, 0, 0, 0, 0, 'Divination Scryer Wave 1: Add Map Event Target');

-- Wave 2
DELETE FROM `generic_scripts` WHERE `id`=843602;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(843602, 0, 0, 61, 843602, 300, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Divination Scryer Wave 2: Start Map Event - Wave 2'),
(843602, 1, 0, 10, 14514, 0, 0, 0, 0, 0, 0, 0, 0, 1451102, 0, 5, 137.853, 171.902, 95.9426, 5.51524, 0, 'Divination Scryer Wave 2: Summon Creature Banal Spirit'),
(843602, 1, 0, 10, 14514, 0, 0, 0, 0, 0, 0, 0, 0, 1451102, 0, 5, 129.104, 171.006, 94.203, 1.22173, 0, 'Divination Scryer Wave 2: ummon Creature Banal Spirit'),
(843602, 1, 0, 10, 14514, 0, 0, 0, 0, 0, 0, 0, 0, 1451102, 0, 5, 130.401, 179.008, 94.5192, 5.11381, 0, 'Divination Scryer Wave 2: Summon Creature Banal Spirit'),
(843602, 1, 0, 10, 14518, 300000, 0, 0, 0, 0, 0, 0, 0, 1451102, 0, 1, 132.562, 174.16, 95.2267, 3.71755, 0, 'Divination Scryer Wave 2: Summon Creature Aspect of Banality'),
(843602, 3, 0, 69, 843602, 0, 0, 0, 0, 0, 0, 0, 562, 843603, 238, 843600, 0, 0, 0, 0, 0, 'Divination Scryer Wave 2: Edit Map Event');

DELETE FROM `generic_scripts` WHERE `id`=1451102;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1451102, 0, 0, 63, 843602, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1356, 0, 0, 0, 0, 0, 'Divination Scryer Wave 2: Add Map Event Target');

-- Wave 3
DELETE FROM `generic_scripts` WHERE `id`=843603;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(843603, 0, 0, 61, 843603, 300, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Divination Scryer Wave 3: Start Map Event'),
(843603, 1, 0, 10, 14513, 0, 0, 0, 0, 0, 0, 0, 0, 1451103, 0, 5, 158.209, 141.706, 95.1845, 2.11185, 0, 'Divination Scryer Wave 3: Summon Creature Malicious Spirit'),
(843603, 1, 0, 0, 0, 0, 0, 0, 14513, 50, 8, 2, 9781, 0, 0, 0, 0, 0, 0, 0, 0, 'Divination Scryer Wave 3: Malicious Spirit - Say Text'),
(843603, 1, 0, 10, 14513, 0, 0, 0, 0, 0, 0, 0, 0, 1451103, 0, 5, 102.186, 195.79, 93.3086, 4.46804, 0, 'Divination Scryer Wave 3: Summon Creature Malicious Spirit'),
(843603, 3, 0, 69, 843603, 0, 0, 0, 0, 0, 0, 0, 563, 843604, 238, 843600, 0, 0, 0, 0, 0, 'Divination Scryer Wave 3: Edit Map Event');

DELETE FROM `generic_scripts` WHERE `id`=1451103;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1451103, 0, 0, 63, 843603, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1356, 0, 0, 0, 0, 0, 'Divination Scryer Wave 3: Add Map Event Target');

-- Wave 4
DELETE FROM `generic_scripts` WHERE `id`=843604;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(843604, 0, 0, 61, 843604, 300, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Divination Scryer Wave 4: Start Map Event'),
(843604, 1, 0, 10, 14513, 0, 0, 0, 0, 0, 0, 0, 0, 1451104, 0, 5, 133.682, 194.397, 93.3896, 2.04204, 0, 'Divination Scryer Wave 4: Summon Creature Malicious Spirit'),
(843604, 1, 0, 10, 14513, 0, 0, 0, 0, 0, 0, 0, 0, 1451104, 0, 5, 106.945, 140.678, 95.442, 3.26377, 0, 'Divination Scryer Wave 4: Summon Creature Malicious Spirit'),
(843604, 1, 0, 10, 14513, 0, 0, 0, 0, 0, 0, 0, 0, 1451104, 0, 5, 160.685, 175.273, 93.1686, 0.226893, 0, 'Divination Scryer Wave 4: Summon Creature Malicious Spirit'),
(843604, 3, 0, 69, 843604, 0, 0, 0, 0, 0, 0, 0, 564, 843605, 238, 843600, 0, 0, 0, 0, 0, 'Divination Scryer Wave 4: Edit Map Event');

DELETE FROM `generic_scripts` WHERE `id`=1451104;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1451104, 0, 0, 63, 843604, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1356, 0, 0, 0, 0, 0, 'Divination Scryer Wave 4: Add Map Event Target');

-- Wave 5
DELETE FROM `generic_scripts` WHERE `id`=843605;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(843605, 0, 0, 61, 843605, 300, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Divination Scryer Wave 5: Start Map Event'),
(843605, 1, 0, 10, 14513, 0, 0, 0, 0, 0, 0, 0, 0, 1451105, 0, 5, 145.126, 196.999, 93.1686, 2.77507, 0, 'Divination Scryer Wave 5: Summon Creature Malicious Spirit'),
(843605, 1, 0, 10, 14513, 0, 0, 0, 0, 0, 0, 0, 0, 1451105, 0, 5, 99.6381, 144.21, 93.1686, 1.23918, 0, 'Divination Scryer Wave 5: Summon Creature Malicious Spirit'),
(843605, 1, 0, 10, 14513, 0, 0, 0, 0, 0, 0, 0, 0, 1451105, 0, 5, 114.373, 138.182, 93.3719, 5.58505, 0, 'Divination Scryer Wave 5: Summon Creature Malicious Spirit'),
(843605, 1, 0, 10, 14513, 0, 0, 0, 0, 0, 0, 0, 0, 1451105, 0, 5, 159.269, 186.271, 93.1686, 2.23402, 0, 'Divination Scryer Wave 5: Summon Creature Malicious Spirit'),
(843605, 3, 0, 69, 843605, 0, 0, 0, 0, 0, 0, 0, 565, 843606, 238, 843600, 0, 0, 0, 0, 0, 'Divination Scryer Wave 5: Edit Map Event');

DELETE FROM `generic_scripts` WHERE `id`=1451105;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1451105, 0, 0, 63, 843605, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1356, 0, 0, 0, 0, 0, 'Divination Scryer Wave 5: Add Map Event Target');

-- Wave 6
DELETE FROM `generic_scripts` WHERE `id`=843606;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(843606, 0, 0, 61, 843606, 300, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Divination Scryer Wave 6: Start Map Event'),
(843606, 1, 0, 10, 14520, 300000, 0, 0, 0, 0, 0, 0, 0, 1451106, 0, 1, 134.731, 172.909, 95.8094, 3.05433, 0, 'Divination Scryer Wave 6: Summon Creature Aspect of Malice'),
(843606, 3, 0, 69, 843606, 0, 0, 0, 0, 0, 0, 0, 566, 843607, 238, 843600, 0, 0, 0, 0, 0, 'Divination Scryer Wave 6: Edit Map Event - Wave 6');

DELETE FROM `generic_scripts` WHERE `id`=1451106;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1451106, 0, 0, 63, 843606, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1356, 0, 0, 0, 0, 0, 'Divination Scryer Wave 6: Add Map Event Target');

-- Wave 7
DELETE FROM `generic_scripts` WHERE `id`=843607;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(843607, 0, 0, 61, 843607, 300, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Divination Scryer Wave 7: Start Map Event'),
(843607, 1, 0, 10, 14512, 0, 0, 0, 0, 0, 0, 0, 0, 1451107, 0, 5, 156.156, 147.682, 93.1686, 2.84489, 0, 'Divination Scryer Wave 7: Summon Creature Corrupted Spirit'),
(843607, 1, 0, 10, 14512, 0, 0, 0, 0, 0, 0, 0, 0, 1451107, 0, 5, 156.757, 142.998, 93.6772, 5.51524, 0, 'Divination Scryer Wave 7: Summon Creature Corrupted Spirit'),
(843607, 1, 0, 10, 14512, 0, 0, 0, 0, 0, 0, 0, 0, 1451107, 0, 5, 161.308, 146.645, 93.4221, 0.261799, 0, 'Divination Scryer Wave 7: Summon Creature Corrupted Spirit'),
(843607, 1, 0, 10, 14512, 0, 0, 0, 0, 0, 0, 0, 0, 1451107, 0, 5, 138.514, 168.074, 94.9902, 1.18682, 0, 'Divination Scryer Wave 7: Summon Creature Corrupted Spirit'),
(843607, 1, 0, 10, 14512, 0, 0, 0, 0, 0, 0, 0, 0, 1451107, 0, 5, 136.063, 174.658, 95.6329, 2.21657, 0, 'Divination Scryer Wave 7: Summon Creature Corrupted Spirit'),
(843607, 1, 0, 10, 14512, 0, 0, 0, 0, 0, 0, 0, 0, 1451107, 0, 5, 139.5, 172.236, 95.9087, 5.5676, 0, 'Divination Scryer Wave 7: Summon Creature Corrupted Spirit'),
(843607, 1, 0, 10, 14512, 0, 0, 0, 0, 0, 0, 0, 0, 1451107, 0, 5, 107.785, 188.747, 93.1142, 3.49066, 0, 'Divination Scryer Wave 7: Summon Creature Corrupted Spirit'),
(843607, 1, 0, 10, 14512, 0, 0, 0, 0, 0, 0, 0, 0, 1451107, 0, 5, 103.429, 187.578, 93.1686, 6.14356, 0, 'Divination Scryer Wave 7: Summon Creature Corrupted Spirit'),
(843607, 1, 0, 0, 0, 0, 0, 0, 14512, 50, 8, 2, 9781, 0, 0, 0, 0, 0, 0, 0, 0, 'Divination Scryer Wave 7: Corrupted Spirit - Say Text'),
(843607, 1, 0, 10, 14512, 0, 0, 0, 0, 0, 0, 0, 0, 1451107, 0, 5, 104.292, 191.483, 93.1686, 5.51524, 0, 'Divination Scryer Wave 7: Summon Creature Corrupted Spirit'),
(843607, 3, 0, 69, 843607, 0, 0, 0, 0, 0, 0, 0, 567, 843608, 238, 843600, 0, 0, 0, 0, 0, 'Divination Scryer Wave 7: Edit Map Event');

DELETE FROM `generic_scripts` WHERE `id`=1451107;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1451107, 0, 0, 63, 843607, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1356, 0, 0, 0, 0, 0, 'Divination Scryer Wave 7: Add Map Event Target');

-- Wave 8
DELETE FROM `generic_scripts` WHERE `id`=843608;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(843608, 0, 0, 61, 843608, 300, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Divination Scryer Wave 8: Start Map Event'),
(843608, 1, 0, 10, 14519, 300000, 0, 0, 0, 0, 0, 0, 0, 1451108, 0, 1, 134.094, 172.661, 95.672, 0.750492, 0, 'Divination Scryer Wave 8: Summon Creature Aspect of Corruption'),
(843608, 1, 0, 0, 0, 0, 0, 0, 14519, 50, 8, 2, 9781, 0, 0, 0, 0, 0, 0, 0, 0, 'Divination Scryer Wave 8: Aspect of Corruption - Say Text'),
(843608, 3, 0, 69, 843608, 0, 0, 0, 0, 0, 0, 0, 568, 843609, 238, 843600, 0, 0, 0, 0, 0, 'Divination Scryer Wave 8: Edit Map Event');

DELETE FROM `generic_scripts` WHERE `id`=1451108;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1451108, 0, 0, 63, 843608, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1356, 0, 0, 0, 0, 0, 'Divination Scryer Wave 8: Add Map Event Target');

-- Wave 9
DELETE FROM `generic_scripts` WHERE `id`=843609;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(843609, 0, 0, 61, 843609, 400, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Divination Scryer Wave 9: Start Map Event'),
(843609, 1, 0, 10, 14511, 0, 0, 0, 0, 0, 0, 0, 0, 1451109, 0, 5, 104.977, 170.914, 93.1266, 0.10472, 0, 'Divination Scryer Wave 9: Summon Creature - Shadowed Spirit'),
(843609, 1, 0, 10, 14511, 0, 0, 0, 0, 0, 0, 0, 0, 1451109, 0, 5, 157.179, 143.024, 93.7753, 2.14675, 0, 'Divination Scryer Wave 9: Summon Creature - Shadowed Spirit'),
(843609, 1, 0, 0, 0, 0, 0, 0, 14511, 50, 8, 2, 9781, 0, 0, 0, 0, 0, 0, 0, 0, 'Divination Scryer Wave 9: Shadowed Spirit - Say Text'),
(843609, 1, 0, 10, 14511, 0, 0, 0, 0, 0, 0, 0, 0, 1451109, 0, 5, 151.155, 193.707, 93.5431, 4.10152, 0, 'Divination Scryer Wave 9: Summon Creature Shadowed Spirit'),
(843609, 30, 0, 10, 14511, 0, 0, 0, 0, 0, 0, 0, 0, 1451109, 0, 5, 150.797, 193.709, 93.4583, 3.9619, 0, 'Divination Scryer Wave 9: Summon Creature Shadowed Spirit'),
(843609, 60, 0, 10, 14511, 0, 0, 0, 0, 0, 0, 0, 0, 1451109, 0, 5, 156.827, 142.947, 93.7397, 2.26893, 0, 'Divination Scryer Wave 9: Summon Creature Shadowed Spirit'),
(843609, 90, 0, 10, 14511, 0, 0, 0, 0, 0, 0, 0, 0, 1451109, 0, 5, 150.328, 193.797, 93.4219, 4.04916, 0, 'Divination Scryer Wave 9: Summon Creature Shadowed Spirit'),
(843609, 120, 0, 10, 14511, 0, 0, 0, 0, 0, 0, 0, 0, 1451109, 0, 5, 156.587, 142.843, 93.7598, 2.35619, 0, 'Divination Scryer Wave 9: Summon Creature Shadowed Spirit'),
(843609, 150, 0, 10, 14511, 0, 0, 0, 0, 0, 0, 0, 0, 1451109, 0, 5, 149.988, 194.053, 93.5163, 4.13643, 0, 'Divination Scryer Wave 9: Summon Creature Shadowed Spirit'),
(843609, 180, 0, 10, 14511, 0, 0, 0, 0, 0, 0, 0, 0, 1451109, 0, 5, 156.118, 142.653, 93.786, 2.25147, 0, 'Divination Scryer Wave 9: Summon Creature Shadowed Spirit'),
(843609, 210, 0, 10, 14521, 300000, 0, 0, 0, 0, 0, 0, 0, 1451109, 0, 1, 136.457, 172.565, 95.8663, 3.19395, 0, 'Divination Scryer Wave 9: Summon Creature Aspect of Shadow'),
(843609, 213, 0, 69, 843609, 0, 0, 0, 0, 0, 0, 0, 569, 843610, 238, 843600, 0, 0, 0, 0, 0, 'Divination Scryer Wave 9: Edit Map Event - Wave 9');

DELETE FROM `generic_scripts` WHERE `id`=1451109;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1451109, 0, 0, 63, 843609, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1356, 0, 0, 0, 0, 0, 'Divination Scryer Wave 9: Add Map Event Target');

-- Wave 10
DELETE FROM `generic_scripts` WHERE `id`=843610;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(843610, 0, 0, 61, 843610, 600, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Divination Scryer Wave 10: Start Map Event'),
(843610, 1, 0, 10, 14516, 600000, 0, 0, 0, 0, 0, 0, 0, 1451110, -1, 1, 135.97, 170.855, 95.7897, 2.98451, 0, 'Divination Scryer Wave 10: Summon Creature Death Knight Darkreaver'),
(843610, 3, 0, 69, 843610, 0, 0, 0, 0, 0, 0, 0, 570, 843611, 238, 843600, 0, 0, 0, 0, 0, 'Divination Scryer Wave 10: Edit Map Event');

DELETE FROM `generic_scripts` WHERE `id`=1451110;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1451110, 0, 0, 63, 843610, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1356, 0, 0, 0, 0, 0, 'Divination Scryer Wave 10: Add Map Event Target');

DELETE FROM `generic_scripts` WHERE `id`=843611;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(843611, 0, 0, 87, 0, 0, 0, 0, 43191, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Divination Scryer - Reset Door'),
(843611, 0, 0, 37, 15, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Divination Scryer - Set Data Darkreaver to Done');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
