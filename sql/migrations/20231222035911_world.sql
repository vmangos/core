DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20231222035911');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20231222035911');
-- Add your query below.


-- Razorfen Defender
DELETE FROM `creature_ai_scripts` WHERE `id` IN (444202);
DELETE FROM `creature_ai_events` WHERE `creature_id`=4442;
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (44420, 'Razorfen Kraul - Razorfen Defender', 7164, 100, 0, 0, 0, 0, 1, 6, 180, 190, 0, 3248, 100, 0, 0, 0, 0, 6, 14, 10, 30, 0, 11972, 100, 1, 0, 0, 0, 2, 16, 10, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
UPDATE `creature_template` SET `script_name`='' WHERE `entry`=4442;

-- Shadowforge Peasant
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (88960, 'Blackrock Depths - Shadowforge Peasant', 3604, 10, 1, 0, 0, 0, 5, 10, 120, 120, 0, 6713, 10, 1, 0, 0, 0, 7, 12, 120, 120, 0, 7978, 100, 1, 0, 0, 128, 7, 12, 10, 16, 0, 9053, 100, 1, 0, 0, 128, 7, 12, 7, 10, 0, 11642, 100, 15, 0, 0, 0, 15, 22, 20, 25, 0, 13584, 100, 1, 0, 0, 0, 3, 20, 10, 20, 0, 6660, 100, 1, 0, 0, 8, 0, 0, 2, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
UPDATE `creature_template` SET `spell_list_id`=88960, `script_name`='' WHERE `entry`=8896;

-- Shadowforge Citizen
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (89020, 'Blackrock Depths - Shadowforge Citizen', 5532, 100, 1, 0, 0, 0, 5, 15, 5, 15, 0, 9613, 100, 1, 0, 0, 128, 5, 8, 7, 12, 0, 11831, 100, 1, 0, 0, 64, 8, 12, 120, 120, 0, 13339, 100, 1, 0, 0, 0, 7, 14, 7, 14, 0, 13444, 100, 1, 0, 0, 0, 5, 8, 7, 11, 0, 13446, 100, 1, 0, 0, 0, 10, 15, 15, 30, 0, 15547, 100, 1, 0, 0, 8, 0, 0, 2, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
UPDATE `creature_template` SET `spell_list_id`=89020, `script_name`='' WHERE `entry`=8902;

-- Shadowforge Senator
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (89040, 'Blackrock Depths - Shadowforge Senator', 2601, 100, 18, 0, 0, 0, 1, 20, 120, 120, 0, 11436, 100, 4, 0, 0, 0, 5, 10, 10, 20, 0, 11831, 100, 1, 0, 0, 64, 6, 18, 120, 120, 0, 14868, 100, 1, 0, 0, 32, 5, 10, 7, 15, 0, 12471, 100, 1, 0, 0, 0, 0, 9, 3, 10, 0, 14034, 100, 1, 0, 0, 0, 0, 9, 3, 10, 0, 15498, 100, 1, 0, 0, 0, 0, 9, 3, 10, 0, 15547, 100, 1, 0, 0, 8, 0, 0, 2, 3, 0);
UPDATE `creature_template` SET `spell_list_id`=89040, `script_name`='' WHERE `entry`=8904;

-- Twilight Emissary
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (89130, 'Blackrock Depths - Twilight Emissary', 13745, 100, 1, 0, 0, 64, 5, 10, 10, 30, 0, 15063, 100, 1, 0, 0, 64, 4, 10, 15, 30, 0, 15288, 100, 17, 0, 0, 0, 0, 3, 1800, 1800, 0, 12466, 100, 1, 0, 0, 0, 3, 12, 15, 30, 0, 15043, 50, 1, 0, 0, 0, 0, 0, 3, 6, 0, 13748, 100, 1, 0, 0, 8, 0, 10, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
UPDATE `creature_template` SET `spell_list_id`=89130, `script_name`='' WHERE `entry`=8913;

-- Twilight's Hammer Ambassador
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (89150, 'Blackrock Depths - Twilight\'s Hammer Ambassador', 11980, 100, 4, 0, 0, 0, 7, 10, 120, 120, 0, 15096, 50, 1, 0, 0, 0, 5, 8, 30, 45, 0, 15499, 50, 1, 0, 0, 0, 5, 8, 30, 45, 0, 15500, 50, 1, 0, 0, 0, 5, 8, 30, 45, 0, 15501, 100, 1, 0, 0, 0, 1, 7, 1, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
UPDATE `creature_template` SET `spell_list_id`=89130, `script_name`='' WHERE `entry`=8915;

-- Houndmaster Grebmar
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (93190, 'Blackrock Depths - Houndmaster Grebmar', 13730, 100, 1, 0, 0, 0, 9, 10, 15, 60, 0, 15615, 100, 1, 0, 0, 256, 7, 25, 7, 25, 0, 21049, 100, 18, 0, 0, 0, 4, 12, 4, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
UPDATE `creature_template` SET `spell_list_id`=89130, `script_name`='' WHERE `entry`=9319;

-- Blackhand Summoner
DELETE FROM `script_texts` WHERE `entry` IN (-1900166, -1900167);
DELETE FROM `creature_ai_events` WHERE `creature_id`=9818;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (981801, 9818, 0, 2, 0, 100, 4, 15, 0, 0, 0, 981801, 0, 0, 'Blackhand Summoner - Flee at 15% HP');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (981802, 9818, 0, 6, 0, 100, 0, 0, 0, 0, 0, 981802, 0, 0, 'Blackhand Summoner - Set Data on Death');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (981803, 9818, 0, 0, 0, 100, 7, 6000, 22000, 16000, 24000, 981803, 981804, 0, 'Blackhand Summoner - Summon Blackhand Veteran or Dreadweaver in Combat');
DELETE FROM `creature_ai_scripts` WHERE `id`=981801;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(981801, 0, 0, 47, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Blackhand Summoner - Flee');
DELETE FROM `creature_ai_scripts` WHERE `id`=981802;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(981802, 0, 0, 38, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Blackhand Summoner - Set Data 64 TYPE_ROOM_EVENT to GUID');
DELETE FROM `creature_ai_scripts` WHERE `id`=981803;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(981803, 0, 0, 15, 16134, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Blackhand Summoner - Cast Spell Blackhand Summoner Presummon Emote'),
(981803, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5613, 0, 0, 0, 0, 0, 0, 0, 0, 'Blackhand Summoner - Say Text'),
(981803, 0, 2, 15, 15792, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Blackhand Summoner - Cast Spell Summon Blackhand Veteran');
DELETE FROM `creature_ai_scripts` WHERE `id`=981804;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(981804, 0, 0, 15, 16135, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Blackhand Summoner - Cast Spell Blackhand Summoner Presummon Emote'),
(981804, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5611, 0, 0, 0, 0, 0, 0, 0, 0, 'Blackhand Summoner - Say Text'),
(981804, 0, 2, 15, 15794, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Blackhand Summoner - Cast Spell Summon Blackhand Veteran');
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (98180, 'Blackrock Spire - Blackhand Summoner', 15532, 100, 1, 0, 0, 64, 10, 20, 120, 120, 0, 12466, 100, 1, 0, 0, 136, 0, 0, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
UPDATE `creature_template` SET `spell_list_id`=98180, `ai_name`='EventAI', `script_name`='' WHERE `entry`=9818;

-- Syndicate Watchman
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (22610, 'Hillsbrad Foothills - Syndicate Watchman', 3602, 100, 1, 0, 0, 0, 0, 12, 15, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
UPDATE `creature_template` SET `spell_list_id`=22610, `script_name`='' WHERE `entry`=2261;
DELETE FROM `spell_disabled` WHERE `entry`=3602;

-- Skullsplitter Witch Doctor
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (6700, 'Stranglethorn Vale - Skullsplitter Witch Doctor', 8376, 100, 0, 0, 0, 0, 6, 15, 30, 60, 0, 5605, 100, 15, 0, 0, 0, 10, 15, 15, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
UPDATE `creature_template` SET `spell_list_id`=6700, `script_name`='' WHERE `entry`=670;

-- Scargil
UPDATE `creature_template` SET `script_name`='' WHERE `entry`=14276;

-- Saean
UPDATE `creature_template` SET `script_name`='' WHERE `entry`=1380;

-- Ro'Bark
UPDATE `creature_template` SET `script_name`='' WHERE `entry`=14278;

-- Comar Villard
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (56830, 'Wetlands - Comar Villard', 12540, 100, 1, 0, 0, 0, 10, 20, 10, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
UPDATE `creature_template` SET `spell_list_id`=56830, `script_name`='' WHERE `entry`=5683;

-- Prince Nazjak
UPDATE `creature_template` SET `script_name`='' WHERE `entry`=2779;

-- Lady Zephris
UPDATE `creature_template` SET `script_name`='' WHERE `entry`=14277;

-- Cenarion Druid
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (405204, 4052, 2, 100, 4, 15, 405204, 'Cenarion Druid - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (405204, 47, 'Cenarion Druid - Flee');

-- Mirkfallon Keeper
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (405602, 4056, 2, 100, 4, 15, 405602, 'Mirkfallon Keeper - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (405602, 47, 'Mirkfallon Keeper - Flee');

-- Ward Guardian
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (442702, 4427, 2, 100, 4, 15, 442702, 'Ward Guardian - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (442702, 47, 'Ward Guardian - Flee');

-- Razorfen Warrior
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (443501, 4435, 2, 100, 4, 15, 443501, 'Razorfen Warrior - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (443501, 47, 'Razorfen Warrior - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=4435;

-- Razorfen Quilguard
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (443602, 4436, 2, 100, 4, 15, 443602, 'Razorfen Quilguard - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (443602, 47, 'Razorfen Quilguard - Flee');

-- Razorfen Warden
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (443701, 4437, 2, 100, 4, 15, 443701, 'Razorfen Warden - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (443701, 47, 'Razorfen Warden - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=4437;

-- Razorfen Spearhide
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (443801, 4438, 2, 100, 4, 15, 443801, 'Razorfen Spearhide - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (443801, 47, 'Razorfen Spearhide - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=4438;

-- Razorfen Totemic
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (444002, 4440, 2, 100, 4, 15, 444002, 'Razorfen Totemic - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (444002, 47, 'Razorfen Totemic - Flee');

-- Razorfen Defender
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (444201, 4442, 2, 100, 4, 15, 444201, 'Razorfen Defender - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (444201, 47, 'Razorfen Defender - Flee');

-- Death's Head Acolyte
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (451503, 4515, 2, 100, 4, 15, 451503, 'Death\'s Head Acolyte - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (451503, 47, 'Death\'s Head Acolyte - Flee');

-- Death's Head Sage
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (451801, 4518, 2, 100, 4, 15, 451801, 'Death\'s Head Sage - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (451801, 47, 'Death\'s Head Sage - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=4518;

-- Death's Head Seer
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (451901, 4519, 2, 100, 4, 15, 451901, 'Death\'s Head Seer - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (451901, 47, 'Death\'s Head Seer - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=4519;

-- Razorfen Dustweaver
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (452203, 4522, 2, 100, 4, 15, 452203, 'Razorfen Dustweaver - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (452203, 47, 'Razorfen Dustweaver - Flee');

-- Razorfen Groundshaker
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (452303, 4523, 2, 100, 4, 15, 452303, 'Razorfen Groundshaker - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (452303, 47, 'Razorfen Groundshaker - Flee');

-- Razorfen Earthbreaker
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (452503, 4525, 2, 100, 4, 15, 452503, 'Razorfen Earthbreaker - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (452503, 47, 'Razorfen Earthbreaker - Flee');

-- Razorfen Beast Trainer
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (453104, 4531, 2, 100, 4, 15, 453104, 'Razorfen Beast Trainer - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (453104, 47, 'Razorfen Beast Trainer - Flee');

-- Quilguard Champion
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (462308, 4623, 2, 100, 4, 15, 462308, 'Quilguard Champion - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (462308, 47, 'Quilguard Champion - Flee');

-- Razorfen Stalker
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (603502, 6035, 2, 100, 4, 15, 603502, 'Razorfen Stalker - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (603502, 47, 'Razorfen Stalker - Flee');

-- Razorfen Servitor
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (613201, 6132, 2, 100, 4, 15, 613201, 'Razorfen Servitor - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (613201, 47, 'Razorfen Servitor - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=6132;

-- Grimtotem Bandit
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (1075801, 10758, 2, 100, 4, 15, 1075801, 'Grimtotem Bandit - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (1075801, 47, 'Grimtotem Bandit - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=10758;

-- Grimtotem Stomper
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (1075901, 10759, 2, 100, 4, 15, 1075901, 'Grimtotem Stomper - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (1075901, 47, 'Grimtotem Stomper - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=10759;

-- Saltscale Warrior
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (87101, 871, 2, 100, 4, 15, 87101, 'Saltscale Warrior - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (87101, 47, 'Saltscale Warrior - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=871;

-- Dalaran Protector
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (191201, 1912, 2, 100, 4, 15, 191201, 'Dalaran Protector - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (191201, 47, 'Dalaran Protector - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=1912;

-- Apothecary Berard
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (210601, 2106, 2, 100, 4, 15, 210601, 'Apothecary Berard - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (210601, 47, 'Apothecary Berard - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=2106;

-- Dabyrie Laborer
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (258201, 2582, 2, 100, 4, 15, 258201, 'Dabyrie Laborer - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (258201, 47, 'Dabyrie Laborer - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=2582;

-- Daggerspine Marauder
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (277501, 2775, 2, 100, 4, 15, 277501, 'Daggerspine Marauder - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (277501, 47, 'Daggerspine Marauder - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=2775;

-- Southsea Brigand
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (338101, 3381, 2, 100, 4, 15, 338101, 'Southsea Brigand - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (338101, 47, 'Southsea Brigand - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=3381;

-- Pyrewood Armorer
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (352801, 3528, 2, 100, 4, 15, 352801, 'Pyrewood Armorer - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (352801, 47, 'Pyrewood Armorer - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=3528;

-- Pyrewood Leatherworker
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (353201, 3532, 2, 100, 4, 15, 353201, 'Pyrewood Leatherworker - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (353201, 47, 'Pyrewood Leatherworker - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=3532;

-- Fardel Dabyrie
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (447901, 4479, 2, 100, 4, 20, 447901, 'Fardel Dabyrie - Flee at 20% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (447901, 47, 'Fardel Dabyrie - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=4479;

-- Kenata Dabyrie
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (448001, 4480, 2, 100, 4, 15, 448001, 'Kenata Dabyrie - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (448001, 47, 'Kenata Dabyrie - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=4480;

-- Marcel Dabyrie
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (448102, 4481, 2, 100, 4, 30, 448102, 'Marcel Dabyrie - Flee at 30% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (448102, 47, 'Marcel Dabyrie - Flee');

-- Kolkar Mauler
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (463401, 4634, 2, 100, 4, 15, 463401, 'Kolkar Mauler - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (463401, 47, 'Kolkar Mauler - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=4634;

-- Kolkar Windchaser
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (463501, 4635, 2, 100, 4, 15, 463501, 'Kolkar Windchaser - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (463501, 47, 'Kolkar Windchaser - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=4635;

-- Kolkar Destroyer
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (463703, 4637, 2, 100, 4, 15, 463703, 'Kolkar Destroyer - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (463703, 47, 'Kolkar Destroyer - Flee');

-- Gelkis Outrunner
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (464601, 4646, 2, 100, 4, 15, 464601, 'Gelkis Outrunner - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (464601, 47, 'Gelkis Outrunner - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=4646;

-- Gelkis Scout
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (464701, 4647, 2, 100, 4, 15, 464701, 'Gelkis Scout - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (464701, 47, 'Gelkis Scout - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=4647;

-- Gelkis Stamper
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (464802, 4648, 2, 100, 4, 15, 464802, 'Gelkis Stamper - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (464802, 47, 'Gelkis Stamper - Flee');

-- Gelkis Windchaser
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (464901, 4649, 2, 100, 4, 15, 464901, 'Gelkis Windchaser - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (464901, 47, 'Gelkis Windchaser - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=4649;

-- Gelkis Earthcaller
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (465102, 4651, 2, 100, 4, 15, 465102, 'Gelkis Earthcaller - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (465102, 47, 'Gelkis Earthcaller - Flee');

-- Gelkis Mauler
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (465201, 4652, 2, 100, 4, 15, 465201, 'Gelkis Mauler - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (465201, 47, 'Gelkis Mauler - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=4652;

-- Gelkis Marauder
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (465301, 4653, 2, 100, 4, 15, 465301, 'Gelkis Marauder - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (465301, 47, 'Gelkis Marauder - Flee');

-- Slitherblade Naga
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (471102, 4711, 2, 100, 4, 15, 471102, 'Slitherblade Naga - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (471102, 47, 'Slitherblade Naga - Flee');

-- Slitherblade Sorceress
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (471203, 4712, 2, 100, 4, 15, 471203, 'Slitherblade Sorceress - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (471203, 47, 'Slitherblade Sorceress - Flee');

-- Slitherblade Warrior
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (471303, 4713, 2, 100, 4, 15, 471303, 'Slitherblade Warrior - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (471303, 47, 'Slitherblade Warrior - Flee');

-- Slitherblade Myrmidon
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (471402, 4714, 2, 100, 4, 15, 471402, 'Slitherblade Myrmidon - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (471402, 47, 'Slitherblade Myrmidon - Flee');

-- Slitherblade Razortail
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (471502, 4715, 2, 100, 4, 15, 471502, 'Slitherblade Razortail - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (471502, 47, 'Slitherblade Razortail - Flee');

-- Slitherblade Oracle
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (471801, 4718, 2, 100, 4, 15, 471801, 'Slitherblade Oracle - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (471801, 47, 'Slitherblade Oracle - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=4718;

-- Slitherblade Sea Witch
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (471902, 4719, 2, 100, 4, 15, 471902, 'Slitherblade Sea Witch - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (471902, 47, 'Slitherblade Sea Witch - Flee');

-- Khan Dez'hepah
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (560003, 5600, 2, 100, 4, 15, 560003, 'Khan Dez\'hepah - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (560003, 47, 'Khan Dez\'hepah - Flee');

-- Kolkar Waylayer
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (1297601, 12976, 2, 100, 4, 15, 1297601, 'Kolkar Waylayer - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (1297601, 47, 'Kolkar Waylayer - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=12976;

-- Fleet Master Firallon
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (254601, 2546, 2, 100, 4, 15, 254601, 'Fleet Master Firallon - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (254601, 47, 'Fleet Master Firallon - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=2546;

-- Captain Stillwater
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (255001, 2550, 2, 100, 4, 15, 255001, 'Captain Stillwater - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (255001, 47, 'Captain Stillwater - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=2550;

-- Stonevault Shaman
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (289402, 2894, 2, 100, 4, 15, 289402, 'Stonevault Shaman - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (289402, 47, 'Stonevault Shaman - Flee');

-- Magregan Deepshadow
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (293201, 2932, 2, 100, 4, 15, 293201, 'Magregan Deepshadow - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (293201, 47, 'Magregan Deepshadow - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=2932;

-- Bloodsail Swabby
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (450601, 4506, 2, 100, 4, 15, 450601, 'Bloodsail Swabby - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (450601, 47, 'Bloodsail Swabby - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=4506;

-- Maraudine Scout
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (465401, 4654, 2, 100, 4, 15, 465401, 'Maraudine Scout - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (465401, 47, 'Maraudine Scout - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=4654;

-- Maraudine Wrangler
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (465501, 4655, 2, 100, 4, 15, 465501, 'Maraudine Wrangler - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (465501, 47, 'Maraudine Wrangler - Flee');

-- Maraudine Mauler
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (465601, 4656, 2, 100, 4, 15, 465601, 'Maraudine Mauler - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (465601, 47, 'Maraudine Mauler - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=4656;

-- Maraudine Marauder
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (465901, 4659, 2, 100, 4, 15, 465901, 'Maraudine Marauder - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (465901, 47, 'Maraudine Marauder - Flee');

-- Atal'ai High Priest
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (527302, 5273, 2, 100, 4, 15, 527302, 'Atal\'ai High Priest - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (527302, 47, 'Atal\'ai High Priest - Flee');

-- Sandfury Slave
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (778701, 7787, 2, 100, 4, 15, 778701, 'Sandfury Slave - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (778701, 47, 'Sandfury Slave - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=7787;

-- Sandfury Acolyte
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (887601, 8876, 2, 100, 4, 15, 887601, 'Sandfury Acolyte - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (887601, 47, 'Sandfury Acolyte - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=8876;

-- Dustwraith
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (1008103, 10081, 2, 100, 4, 15, 1008103, 'Dustwraith - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (1008103, 47, 'Dustwraith - Flee');

-- Maraudine Windchaser
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (465701, 4657, 2, 100, 4, 15, 465701, 'Maraudine Windchaser - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (465701, 47, 'Maraudine Windchaser - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=4657;

-- Maraudine Stormer
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (465802, 4658, 2, 100, 4, 15, 465802, 'Maraudine Stormer - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (465802, 47, 'Maraudine Stormer - Flee');

-- Death's Head Cultist
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (787201, 7872, 2, 100, 4, 15, 787201, 'Death\'s Head Cultist - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (787201, 47, 'Death\'s Head Cultist - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=7872;

-- Razorfen Battleguard
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (787301, 7873, 2, 100, 4, 15, 787301, 'Razorfen Battleguard - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (787301, 47, 'Razorfen Battleguard - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=7873;

-- Razorfen Thornweaver
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (787403, 7874, 2, 100, 4, 15, 787403, 'Razorfen Thornweaver - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (787403, 47, 'Razorfen Thornweaver - Flee');

-- Slave Worker
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (584301, 5843, 2, 100, 4, 25, 584301, 'Slave Worker - Flee at 25% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (584301, 47, 'Slave Worker - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=5843;

-- Anvilrage Overseer
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (888901, 8889, 2, 100, 4, 15, 888901, 'Anvilrage Overseer - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (888901, 47, 'Anvilrage Overseer - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=8889;

-- Shadowforge Peasant
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (889601, 8896, 2, 100, 4, 15, 889601, 'Shadowforge Peasant - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (889601, 47, 'Shadowforge Peasant - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=8896;

-- Doomforge Dragoon
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (889901, 8899, 2, 100, 4, 15, 889901, 'Doomforge Dragoon - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (889901, 47, 'Doomforge Dragoon - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=8899;

-- Shadowforge Citizen
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (890201, 8902, 2, 100, 4, 15, 890201, 'Shadowforge Citizen - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (890201, 47, 'Shadowforge Citizen - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=8902;

-- Shadowforge Senator
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (890401, 8904, 2, 100, 4, 15, 890401, 'Shadowforge Senator - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (890401, 47, 'Shadowforge Senator - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=8904;

-- Twilight Emissary
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (891301, 8913, 2, 100, 4, 15, 891301, 'Twilight Emissary - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (891301, 47, 'Twilight Emissary - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=8913;

-- Twilight's Hammer Ambassador
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (891501, 8915, 2, 100, 4, 15, 891501, 'Twilight\'s Hammer Ambassador - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (891501, 47, 'Twilight\'s Hammer Ambassador - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=8915;

-- Arena Spectator
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (891601, 8916, 2, 100, 4, 15, 891601, 'Arena Spectator - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (891601, 47, 'Arena Spectator - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=8916;

-- Weapon Technician
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (892001, 8920, 2, 100, 4, 15, 892001, 'Weapon Technician - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (892001, 47, 'Weapon Technician - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=8920;

-- Scarshield Acolyte
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (904501, 9045, 2, 100, 4, 15, 904501, 'Scarshield Acolyte - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (904501, 47, 'Scarshield Acolyte - Flee');

-- Smolderthorn Mystic
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (923901, 9239, 2, 100, 4, 15, 923901, 'Smolderthorn Mystic - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (923901, 47, 'Smolderthorn Mystic - Flee');

-- Smolderthorn Shadow Priest
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (924001, 9240, 2, 100, 4, 15, 924001, 'Smolderthorn Shadow Priest - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (924001, 47, 'Smolderthorn Shadow Priest - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=9240;

-- Smolderthorn Shadow Hunter
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (926501, 9265, 2, 100, 4, 15, 926501, 'Smolderthorn Shadow Hunter - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (926501, 47, 'Smolderthorn Shadow Hunter - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=9265;

-- Smolderthorn Witch Doctor
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (926601, 9266, 2, 100, 4, 15, 926601, 'Smolderthorn Witch Doctor - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (926601, 47, 'Smolderthorn Witch Doctor - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=9266;

-- Houndmaster Grebmar
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (931901, 9319, 2, 100, 4, 15, 931901, 'Houndmaster Grebmar - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (931901, 47, 'Houndmaster Grebmar - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=9319;

-- Bloodaxe Summoner
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (971703, 9717, 2, 100, 4, 15, 971703, 'Bloodaxe Summoner - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (971703, 47, 'Bloodaxe Summoner - Flee');

-- Dalaran Warder
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (191301, 1913, 2, 100, 4, 15, 191301, 'Dalaran Warder - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (191301, 47, 'Dalaran Warder - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=1913;

-- Haggard Refugee
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (205301, 2053, 2, 100, 4, 15, 205301, 'Haggard Refugee - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (205301, 47, 'Haggard Refugee - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=2053;

-- Syndicate Rogue
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (226002, 2260, 2, 100, 4, 15, 226002, 'Syndicate Rogue - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (226002, 47, 'Syndicate Rogue - Flee');

-- Syndicate Watchman
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (226101, 2261, 2, 100, 4, 15, 226101, 'Syndicate Watchman - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (226101, 47, 'Syndicate Watchman - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=2261;

-- Hammertoe Grez
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (290901, 2909, 2, 100, 4, 15, 290901, 'Hammertoe Grez - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (290901, 47, 'Hammertoe Grez - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=2909;

-- Zalazane
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (320501, 3205, 2, 100, 4, 15, 320501, 'Zalazane - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (320501, 47, 'Zalazane - Flee');

-- Voodoo Troll
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (320604, 3206, 2, 100, 4, 15, 320604, 'Voodoo Troll - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (320604, 47, 'Voodoo Troll - Flee');

-- Baron Longshore
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (346701, 3467, 2, 100, 4, 15, 346701, 'Baron Longshore - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (346701, 47, 'Baron Longshore - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=3467;

-- Venture Co. Enforcer
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (328301, 3283, 2, 100, 4, 15, 328301, 'Venture Co. Enforcer - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (328301, 47, 'Venture Co. Enforcer - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=3283;

-- Firebrand Dreadweaver
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (926301, 9263, 2, 100, 4, 15, 926301, 'Firebrand Dreadweaver - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (926301, 47, 'Firebrand Dreadweaver - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=9263;

-- Firebrand Pyromancer
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (926401, 9264, 2, 100, 4, 15, 926401, 'Firebrand Pyromancer - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (926401, 47, 'Firebrand Pyromancer - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=9264;

-- Shadowforge Flame Keeper
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (995602, 9956, 2, 100, 4, 15, 995602, 'Shadowforge Flame Keeper - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (995602, 47, 'Shadowforge Flame Keeper - Flee');

-- Summoned Blackhand Veteran
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (1068102, 10681, 2, 100, 4, 15, 1068102, 'Summoned Blackhand Veteran - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (1068102, 47, 'Summoned Blackhand Veteran - Flee');

-- Crimson Sorcerer
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (1042203, 10422, 2, 100, 4, 15, 1042203, 'Crimson Sorcerer - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (1042203, 47, 'Crimson Sorcerer - Flee');

-- Crimson Priest
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (1042303, 10423, 2, 100, 4, 15, 1042303, 'Crimson Priest - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (1042303, 47, 'Crimson Priest - Flee');

-- Crimson Inquisitor
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (1042603, 10426, 2, 100, 4, 15, 1042603, 'Crimson Inquisitor - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (1042603, 47, 'Crimson Inquisitor - Flee');

-- Crimson Monk
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (1104302, 11043, 2, 100, 4, 15, 1104302, 'Crimson Monk - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (1104302, 47, 'Crimson Monk - Flee');

-- Skullsplitter Headhunter
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (78101, 781, 2, 100, 4, 15, 78101, 'Skullsplitter Headhunter - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (78101, 47, 'Skullsplitter Headhunter - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=781;

-- Dagun the Ravenous
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (293701, 2937, 2, 100, 4, 15, 293701, 'Dagun the Ravenous - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (293701, 47, 'Dagun the Ravenous - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=2937;

-- Bael'dun Excavator
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (337407, 3374, 2, 100, 4, 15, 337407, 'Bael\'dun Excavator - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (337407, 47, 'Bael\'dun Excavator - Flee');

-- Bael'dun Foreman
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (337502, 3375, 2, 100, 4, 15, 337502, 'Bael\'dun Foreman - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (337502, 47, 'Bael\'dun Foreman - Flee');

-- Prospector Stonehewer
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (1381601, 13816, 2, 100, 4, 15, 1381601, 'Prospector Stonehewer - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (1381601, 47, 'Prospector Stonehewer - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=13816;

-- Bloodfury Harpy
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (402201, 4022, 2, 100, 4, 15, 402201, 'Bloodfury Harpy - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (402201, 47, 'Bloodfury Harpy - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=4022;

-- Scarlet Lumberjack
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (188402, 1884, 2, 100, 4, 15, 188402, 'Scarlet Lumberjack - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (188402, 47, 'Scarlet Lumberjack - Flee');

-- Razormane Seer
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (345801, 3458, 2, 100, 4, 15, 345801, 'Razormane Seer - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (345801, 47, 'Razormane Seer - Flee');

-- Ongeku
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (562201, 5622, 2, 100, 4, 15, 562201, 'Ongeku - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (562201, 47, 'Ongeku - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=5622;

-- Highvale Ranger
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (269402, 2694, 2, 100, 4, 15, 269402, 'Highvale Ranger - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (269402, 47, 'Highvale Ranger - Flee');

-- Wastewander Scofflaw
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (780501, 7805, 2, 100, 4, 15, 780501, 'Wastewander Scofflaw - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (780501, 47, 'Wastewander Scofflaw - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=7805;

-- Krang Stonehoof
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (306302, 3063, 2, 100, 4, 15, 306302, 'Krang Stonehoof - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (306302, 47, 'Krang Stonehoof - Flee');

-- Rascal Sprite
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (200201, 2002, 2, 100, 4, 15, 200201, 'Rascal Sprite - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (200201, 47, 'Rascal Sprite - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=2002;

-- Shadow Sprite
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (200301, 2003, 2, 100, 4, 15, 200301, 'Shadow Sprite - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (200301, 47, 'Shadow Sprite - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=2003;

-- Dark Sprite
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (200401, 2004, 2, 100, 4, 15, 200401, 'Dark Sprite - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (200401, 47, 'Dark Sprite - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=2004;

-- Vicious Grell
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (200502, 2005, 2, 100, 4, 15, 200502, 'Vicious Grell - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (200502, 47, 'Vicious Grell - Flee');

-- Gnarlpine Warrior
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (200802, 2008, 2, 100, 4, 15, 200802, 'Gnarlpine Warrior - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (200802, 47, 'Gnarlpine Warrior - Flee');

-- Bloodfeather Harpy
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (201503, 2015, 2, 100, 4, 15, 201503, 'Bloodfeather Harpy - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (201503, 47, 'Bloodfeather Harpy - Flee');

-- Bloodfeather Rogue
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (201702, 2017, 2, 100, 4, 15, 201702, 'Bloodfeather Rogue - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (201702, 47, 'Bloodfeather Rogue - Flee');

-- Bloodfeather Sorceress
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (201803, 2018, 2, 100, 4, 15, 201803, 'Bloodfeather Sorceress - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (201803, 47, 'Bloodfeather Sorceress - Flee');

-- Bloodfeather Fury
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (201903, 2019, 2, 100, 4, 15, 201903, 'Bloodfeather Fury - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (201903, 47, 'Bloodfeather Fury - Flee');

-- Bloodfeather Wind Witch
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (202003, 2020, 2, 100, 4, 15, 202003, 'Bloodfeather Wind Witch - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (202003, 47, 'Bloodfeather Wind Witch - Flee');

-- Bloodfeather Matriarch
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (202101, 2021, 2, 100, 4, 15, 202101, 'Bloodfeather Matriarch - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (202101, 47, 'Bloodfeather Matriarch - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=2021;

-- Lord Melenas
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (203805, 2038, 2, 100, 4, 15, 203805, 'Lord Melenas - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (203805, 47, 'Lord Melenas - Flee');

-- Moonstalker Runt
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (207001, 2070, 2, 100, 4, 15, 207001, 'Moonstalker Runt - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (207001, 47, 'Moonstalker Runt - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=2070;

-- Gnarlpine Ambusher
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (215201, 2152, 2, 100, 4, 15, 215201, 'Gnarlpine Ambusher - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (215201, 47, 'Gnarlpine Ambusher - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=2152;

-- Blackwood Pathfinder
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (216703, 2167, 2, 100, 4, 15, 216703, 'Blackwood Pathfinder - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (216703, 47, 'Blackwood Pathfinder - Flee');

-- Vile Sprite
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (218901, 2189, 2, 100, 4, 15, 218901, 'Vile Sprite - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (218901, 47, 'Vile Sprite - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=2189;

-- Deth'ryll Satyr
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (221201, 2212, 2, 100, 4, 15, 221201, 'Deth\'ryll Satyr - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (221201, 47, 'Deth\'ryll Satyr - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=2212;

-- Blackwood Windtalker
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (232401, 2324, 2, 100, 4, 15, 232401, 'Blackwood Windtalker - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (232401, 47, 'Blackwood Windtalker - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=2324;

-- Fury Shelda
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (1443101, 14431, 2, 100, 4, 15, 1443101, 'Fury Shelda - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (1443101, 47, 'Fury Shelda - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=14431;

-- Blackwood Warrior
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (216803, 2168, 2, 100, 4, 15, 216803, 'Blackwood Warrior - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (216803, 47, 'Blackwood Warrior - Flee');

-- Blackwood Totemic
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (216901, 2169, 2, 100, 4, 15, 216901, 'Blackwood Totemic - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (216901, 47, 'Blackwood Totemic - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=2169;

-- Blackwood Ursa
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (217002, 2170, 2, 100, 4, 15, 217002, 'Blackwood Ursa - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (217002, 47, 'Blackwood Ursa - Flee');

-- Stormscale Wave Rider
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (217901, 2179, 2, 100, 4, 15, 217901, 'Stormscale Wave Rider - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (217901, 47, 'Stormscale Wave Rider - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=2179;

-- Stormscale Siren
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (218001, 2180, 2, 100, 4, 15, 218001, 'Stormscale Siren - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (218001, 47, 'Stormscale Siren - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=2180;

-- Stormscale Sorceress
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (218203, 2182, 2, 100, 4, 15, 218203, 'Stormscale Sorceress - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (218203, 47, 'Stormscale Sorceress - Flee');

-- Stormscale Warrior
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (218301, 2183, 2, 100, 4, 15, 218301, 'Stormscale Warrior - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (218301, 47, 'Stormscale Warrior - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=2183;

-- Dark Strand Excavator
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (373001, 3730, 2, 100, 4, 15, 373001, 'Dark Strand Excavator - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (373001, 47, 'Dark Strand Excavator - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=3730;

-- Balizar the Umbrage
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (389902, 3899, 2, 100, 4, 15, 389902, 'Balizar the Umbrage - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (389902, 47, 'Balizar the Umbrage - Flee');

-- Stormscale Toxicologist
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (1232101, 12321, 2, 100, 4, 15, 1232101, 'Stormscale Toxicologist - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (1232101, 47, 'Stormscale Toxicologist - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=12321;

-- Farmer Ray
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (23201, 232, 2, 100, 4, 15, 23201, 'Farmer Ray - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (23201, 47, 'Farmer Ray - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=232;

-- Jailor Eston
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (242701, 2427, 2, 100, 4, 15, 242701, 'Jailor Eston - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (242701, 47, 'Jailor Eston - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=2427;

-- Bristleback Water Seeker
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (326001, 3260, 2, 100, 4, 15, 326001, 'Bristleback Water Seeker - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (326001, 47, 'Bristleback Water Seeker - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=3260;

-- Bristleback Thornweaver
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (326102, 3261, 2, 100, 4, 15, 326102, 'Bristleback Thornweaver - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (326102, 47, 'Bristleback Thornweaver - Flee');

-- Northspring Harpy
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (536202, 5362, 2, 100, 4, 15, 536202, 'Northspring Harpy - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (536202, 47, 'Northspring Harpy - Flee');

-- Northspring Roguefeather
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (536301, 5363, 2, 100, 4, 15, 536301, 'Northspring Roguefeather - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (536301, 47, 'Northspring Roguefeather - Flee');

-- Northspring Slayer
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (536403, 5364, 2, 100, 4, 15, 536403, 'Northspring Slayer - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (536403, 47, 'Northspring Slayer - Flee');

-- Northspring Windcaller
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (536601, 5366, 2, 100, 4, 15, 536601, 'Northspring Windcaller - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (536601, 47, 'Northspring Windcaller - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=5366;

-- Nak
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (343401, 3434, 2, 100, 4, 15, 343401, 'Nak - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (343401, 47, 'Nak - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=3434;

-- Lok Orcbane
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (343501, 3435, 2, 100, 4, 15, 343501, 'Lok Orcbane - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (343501, 47, 'Lok Orcbane - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=3435;

-- Kuz
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (343602, 3436, 2, 100, 4, 15, 343602, 'Kuz - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (343602, 47, 'Kuz - Flee');

-- Razormane Stalker
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (345701, 3457, 2, 100, 4, 15, 345701, 'Razormane Stalker - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (345701, 47, 'Razormane Stalker - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=3457;

-- Razormane Warfrenzy
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (345901, 3459, 2, 100, 4, 15, 345901, 'Razormane Warfrenzy - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (345901, 47, 'Razormane Warfrenzy - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=3459;

-- Gerenzo Wrenchwhistle
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (420201, 4202, 2, 100, 4, 15, 420201, 'Gerenzo Wrenchwhistle - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (420201, 47, 'Gerenzo Wrenchwhistle - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=4202;

-- Twilight Stonecaller
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (1188202, 11882, 2, 100, 4, 15, 1188202, 'Twilight Stonecaller - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (1188202, 47, 'Twilight Stonecaller - Flee');

-- Palemane Tanner
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (294902, 2949, 2, 100, 4, 15, 294902, 'Palemane Tanner - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (294902, 47, 'Palemane Tanner - Flee');

-- Palemane Skinner
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (295002, 2950, 2, 100, 4, 15, 295002, 'Palemane Skinner - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (295002, 47, 'Palemane Skinner - Flee');

-- Adult Plainstrider
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (295601, 2956, 2, 100, 4, 15, 295601, 'Adult Plainstrider - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (295601, 47, 'Adult Plainstrider - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=2956;

-- Elder Plainstrider
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (295701, 2957, 2, 100, 4, 15, 295701, 'Elder Plainstrider - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (295701, 47, 'Elder Plainstrider - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=2957;

-- Venture Co. Hireling
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (297501, 2975, 2, 100, 4, 15, 297501, 'Venture Co. Hireling - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (297501, 47, 'Venture Co. Hireling - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=2975;

-- Venture Co. Supervisor
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (297901, 2979, 2, 100, 4, 15, 297901, 'Venture Co. Supervisor - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (297901, 47, 'Venture Co. Supervisor - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=2979;

-- Bael'dun Appraiser
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (299002, 2990, 2, 100, 4, 15, 299002, 'Bael\'dun Appraiser - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (299002, 47, 'Bael\'dun Appraiser - Flee');

-- Supervisor Fizsprocket
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (305101, 3051, 2, 100, 4, 15, 305101, 'Supervisor Fizsprocket - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (305101, 47, 'Supervisor Fizsprocket - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=3051;

-- Greater Plainstrider
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (324401, 3244, 2, 100, 4, 15, 324401, 'Greater Plainstrider - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (324401, 47, 'Greater Plainstrider - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=3244;

-- Ornery Plainstrider
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (324501, 3245, 2, 100, 4, 15, 324501, 'Ornery Plainstrider - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (324501, 47, 'Ornery Plainstrider - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=3245;

-- Razormane Defender
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (326602, 3266, 2, 100, 4, 15, 326602, 'Razormane Defender - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (326602, 47, 'Razormane Defender - Flee');

-- Razormane Water Seeker
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (326701, 3267, 2, 100, 4, 15, 326701, 'Razormane Water Seeker - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (326701, 47, 'Razormane Water Seeker - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=3267;

-- Razormane Thornweaver
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (326802, 3268, 2, 100, 4, 15, 326802, 'Razormane Thornweaver - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (326802, 47, 'Razormane Thornweaver - Flee');

-- Witchwing Slayer
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (327803, 3278, 2, 100, 4, 15, 327803, 'Witchwing Slayer - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (327803, 47, 'Witchwing Slayer - Flee');

-- Venture Co. Mercenary
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (328201, 3282, 2, 100, 4, 15, 328201, 'Venture Co. Mercenary - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (328201, 47, 'Venture Co. Mercenary - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=3282;

-- Theramore Preserver
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (338601, 3386, 2, 100, 4, 15, 338601, 'Theramore Preserver - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (338601, 47, 'Theramore Preserver - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=3386;

-- Hezrul Bloodmark
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (339602, 3396, 2, 100, 4, 15, 339602, 'Hezrul Bloodmark - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (339602, 47, 'Hezrul Bloodmark - Flee');

-- Tinkerer Sniggles
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (347101, 3471, 2, 100, 4, 15, 347101, 'Tinkerer Sniggles - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (347101, 47, 'Tinkerer Sniggles - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=3471;

-- Deviate Coiler
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (363001, 3630, 2, 100, 4, 15, 363001, 'Deviate Coiler - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (363001, 47, 'Deviate Coiler - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=3630;

-- Murloc Nightcrawler
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (54401, 544, 2, 100, 4, 15, 54401, 'Murloc Nightcrawler - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (54401, 47, 'Murloc Nightcrawler - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=544;

-- Rohh the Silent
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (94703, 947, 2, 100, 4, 15, 94703, 'Rohh the Silent - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (94703, 47, 'Rohh the Silent - Flee');

-- Kurzen Subchief
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (97801, 978, 2, 100, 4, 15, 97801, 'Kurzen Subchief - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (97801, 47, 'Kurzen Subchief - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=978;

-- Venture Co. Miner
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (109401, 1094, 2, 100, 4, 15, 109401, 'Venture Co. Miner - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (109401, 47, 'Venture Co. Miner - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=1094;

-- Dawnwatcher Selgorm
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (478301, 4783, 2, 100, 4, 15, 478301, 'Dawnwatcher Selgorm - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (478301, 47, 'Dawnwatcher Selgorm - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=4783;

-- Mudsnout Gnoll
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (237202, 2372, 2, 100, 4, 15, 237202, 'Mudsnout Gnoll - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (237202, 47, 'Mudsnout Gnoll - Flee');

-- Bael'dun Soldier
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (337601, 3376, 2, 100, 4, 15, 337601, 'Bael\'dun Soldier - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (337601, 47, 'Bael\'dun Soldier - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=3376;

-- Bael'dun Officer
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (337801, 3378, 2, 100, 4, 15, 337801, 'Bael\'dun Officer - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (337801, 47, 'Bael\'dun Officer - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=3378;

-- Sorcerer Ashcrombe
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (385001, 3850, 2, 100, 4, 15, 385001, 'Sorcerer Ashcrombe - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (385001, 47, 'Sorcerer Ashcrombe - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=3850;

-- Bloodfury Roguefeather
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (402301, 4023, 2, 100, 4, 15, 402301, 'Bloodfury Roguefeather - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (402301, 47, 'Bloodfury Roguefeather - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=4023;

-- Bloodfury Slayer
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (402401, 4024, 2, 100, 4, 15, 402401, 'Bloodfury Slayer - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (402401, 47, 'Bloodfury Slayer - Flee');

-- Bloodfury Ambusher
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (402502, 4025, 2, 100, 4, 15, 402502, 'Bloodfury Ambusher - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (402502, 47, 'Bloodfury Ambusher - Flee');

-- Bloodfury Windcaller
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (402602, 4026, 2, 100, 4, 15, 402602, 'Bloodfury Windcaller - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (402602, 47, 'Bloodfury Windcaller - Flee');

-- Bloodfury Storm Witch
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (402701, 4027, 2, 100, 4, 15, 402701, 'Bloodfury Storm Witch - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (402701, 47, 'Bloodfury Storm Witch - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=4027;

-- Son of Cenarius
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (405702, 4057, 2, 100, 4, 15, 405702, 'Son of Cenarius - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (405702, 47, 'Son of Cenarius - Flee');

-- Kolkar Centaur
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (463201, 4632, 2, 100, 4, 15, 463201, 'Kolkar Centaur - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (463201, 47, 'Kolkar Centaur - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=4632;

-- Magram Scout
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (463801, 4638, 2, 100, 4, 15, 463801, 'Magram Scout - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (463801, 47, 'Magram Scout - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=4638;

-- Magram Wrangler
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (464001, 4640, 2, 100, 4, 15, 464001, 'Magram Wrangler - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (464001, 47, 'Magram Wrangler - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=4640;

-- Magram Windchaser
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (464101, 4641, 2, 100, 4, 15, 464101, 'Magram Windchaser - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (464101, 47, 'Magram Windchaser - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=4641;

-- Magram Stormer
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (464202, 4642, 2, 100, 4, 15, 464202, 'Magram Stormer - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (464202, 47, 'Magram Stormer - Flee');

-- Magram Marauder
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (464401, 4644, 2, 100, 4, 15, 464401, 'Magram Marauder - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (464401, 47, 'Magram Marauder - Flee');

-- Magram Mauler
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (464501, 4645, 2, 100, 4, 15, 464501, 'Magram Mauler - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (464501, 47, 'Magram Mauler - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=4645;

-- Blackfathom Myrmidon
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (480701, 4807, 2, 100, 4, 15, 480701, 'Blackfathom Myrmidon - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (480701, 47, 'Blackfathom Myrmidon - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=4807;

-- Dun Garok Soldier
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (736001, 7360, 2, 100, 4, 15, 736001, 'Dun Garok Soldier - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (736001, 47, 'Dun Garok Soldier - Flee');

-- Oakpaw
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (1064002, 10640, 2, 100, 4, 15, 1064002, 'Oakpaw - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (1064002, 47, 'Oakpaw - Flee');

-- Grimtotem Geomancer
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (1076001, 10760, 2, 100, 4, 15, 1076001, 'Grimtotem Geomancer - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (1076001, 47, 'Grimtotem Geomancer - Flee');

-- Grimtotem Reaver
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (1076101, 10761, 2, 100, 4, 15, 1076101, 'Grimtotem Reaver - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (1076101, 47, 'Grimtotem Reaver - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=10761;

-- Windshear Digger
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (399901, 3999, 2, 100, 4, 15, 399901, 'Windshear Digger - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (399901, 47, 'Windshear Digger - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=3999;

-- Galak Flame Guard
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (740401, 7404, 2, 100, 4, 15, 740401, 'Galak Flame Guard - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (740401, 47, 'Galak Flame Guard - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=7404;

-- Gruna
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (370801, 3708, 2, 100, 4, 15, 370801, 'Gruna - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (370801, 47, 'Gruna - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=3708;

-- Muckshell Razorclaw
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (440501, 4405, 2, 100, 4, 15, 440501, 'Muckshell Razorclaw - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (440501, 47, 'Muckshell Razorclaw - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=4405;

-- Skullsplitter Warrior
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (66701, 667, 2, 100, 4, 15, 66701, 'Skullsplitter Warrior - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (66701, 47, 'Skullsplitter Warrior - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=667;

-- Skullsplitter Hunter
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (66902, 669, 2, 100, 4, 15, 66902, 'Skullsplitter Hunter - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (66902, 47, 'Skullsplitter Hunter - Flee');

-- Skullsplitter Witch Doctor
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (67001, 670, 2, 100, 4, 15, 67001, 'Skullsplitter Witch Doctor - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (67001, 47, 'Skullsplitter Witch Doctor - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=670;

-- Skullsplitter Spiritchaser
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (67201, 672, 2, 100, 4, 15, 67201, 'Skullsplitter Spiritchaser - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (67201, 47, 'Skullsplitter Spiritchaser - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=672;

-- Venture Co. Surveyor
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (67601, 676, 2, 100, 4, 15, 67601, 'Venture Co. Surveyor - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (67601, 47, 'Venture Co. Surveyor - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=676;

-- Skullsplitter Scout
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (78201, 782, 2, 100, 4, 15, 78201, 'Skullsplitter Scout - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (78201, 47, 'Skullsplitter Scout - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=782;

-- Skullsplitter Beastmaster
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (78402, 784, 2, 100, 4, 15, 78402, 'Skullsplitter Beastmaster - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (78402, 47, 'Skullsplitter Beastmaster - Flee');

-- Nezzliok the Dire
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (106201, 1062, 2, 100, 4, 15, 106201, 'Nezzliok the Dire - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (106201, 47, 'Nezzliok the Dire - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=1062;

-- Zanzil Witch Doctor
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (149001, 1490, 2, 100, 4, 15, 149001, 'Zanzil Witch Doctor - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (149001, 47, 'Zanzil Witch Doctor - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=1490;

-- Naga Explorer
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (190702, 1907, 2, 100, 4, 15, 190702, 'Naga Explorer - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (190702, 47, 'Naga Explorer - Flee');

-- Zanzil the Outcast
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (253402, 2534, 2, 100, 4, 15, 253403, 'Zanzil the Outcast - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (253403, 47, 'Zanzil the Outcast - Flee');

-- Lord Sakrasis
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (254101, 2541, 2, 100, 4, 15, 254101, 'Lord Sakrasis - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (254101, 47, 'Lord Sakrasis - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=2541;

-- "Pretty Boy" Duncan
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (254501, 2545, 2, 100, 4, 15, 254501, '\"Pretty Boy\" Duncan - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (254501, 47, '\"Pretty Boy\" Duncan - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=2545;

-- Moonrage Armorer
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (352901, 3529, 2, 100, 4, 15, 352901, 'Moonrage Armorer - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (352901, 47, 'Moonrage Armorer - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=3529;

-- Muckshell Scrabbler
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (440401, 4404, 2, 100, 4, 15, 440401, 'Muckshell Scrabbler - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (440401, 47, 'Muckshell Scrabbler - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=4404;

-- Noboru the Cudgel
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (547701, 5477, 2, 100, 4, 15, 547701, 'Noboru the Cudgel - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (547701, 47, 'Noboru the Cudgel - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=5477;

-- Sentinel Keldara Sunblade
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (839701, 8397, 2, 100, 4, 15, 839701, 'Sentinel Keldara Sunblade - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (839701, 47, 'Sentinel Keldara Sunblade - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=8397;

-- Mosshoof Runner
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (875901, 8759, 2, 100, 4, 15, 875901, 'Mosshoof Runner - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (875901, 47, 'Mosshoof Runner - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=8759;

-- Outcast Necromancer
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (1155901, 11559, 2, 100, 4, 15, 1155901, 'Outcast Necromancer - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (1155901, 47, 'Outcast Necromancer - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=11559;

-- Renato Gallina
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (143201, 1432, 2, 100, 4, 15, 143201, 'Renato Gallina - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (143201, 47, 'Renato Gallina - Flee');

-- Stormwind City Patroller
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (197602, 1976, 2, 100, 4, 15, 197602, 'Stormwind City Patroller - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (197602, 47, 'Stormwind City Patroller - Flee');

-- Sarah Tanner
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (786801, 7868, 2, 100, 4, 15, 786801, 'Sarah Tanner - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (786801, 47, 'Sarah Tanner - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=7868;

-- Berserk Trogg
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (139303, 1393, 2, 100, 4, 15, 139303, 'Berserk Trogg - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (139303, 47, 'Berserk Trogg - Flee');

-- Jeremiah Payson
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (840301, 8403, 2, 100, 4, 15, 840301, 'Jeremiah Payson - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (840301, 47, 'Jeremiah Payson - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=8403;

-- Blackwood Shaman
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (217101, 2171, 2, 100, 4, 15, 217101, 'Blackwood Shaman - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (217101, 47, 'Blackwood Shaman - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=2171;

-- Fleeting Plainstrider
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (324601, 3246, 2, 100, 4, 15, 324601, 'Fleeting Plainstrider - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (324601, 47, 'Fleeting Plainstrider - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=3246;

-- Bleakheart Hellcaller
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (377104, 3771, 2, 100, 4, 15, 377104, 'Bleakheart Hellcaller - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (377104, 47, 'Bleakheart Hellcaller - Flee');

-- Dark Strand Assassin
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (387901, 3879, 2, 100, 4, 15, 387901, 'Dark Strand Assassin - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (387901, 47, 'Dark Strand Assassin - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=3879;

-- Forsaken Scout
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (389301, 3893, 2, 100, 4, 15, 389301, 'Forsaken Scout - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (389301, 47, 'Forsaken Scout - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=3893;

-- Caedakar the Vicious
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (390003, 3900, 2, 100, 4, 15, 390003, 'Caedakar the Vicious - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (390003, 47, 'Caedakar the Vicious - Flee');

-- Bloodtooth Guard
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (393202, 3932, 2, 100, 4, 15, 393202, 'Bloodtooth Guard - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (393202, 47, 'Bloodtooth Guard - Flee');

-- Dark Iron Bombardier
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (406202, 4062, 2, 100, 4, 15, 406202, 'Dark Iron Bombardier - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (406202, 47, 'Dark Iron Bombardier - Flee');

-- Mugglefin
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (1064301, 10643, 2, 100, 4, 15, 1064301, 'Mugglefin - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (1064301, 47, 'Mugglefin - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=10643;

-- Lost One Cook
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (110602, 1106, 2, 100, 4, 15, 110602, 'Lost One Cook - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (110602, 47, 'Lost One Cook - Flee');

-- Daggerspine Shorestalker
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (236801, 2368, 2, 100, 4, 15, 236801, 'Daggerspine Shorestalker - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (236801, 47, 'Daggerspine Shorestalker - Flee');

-- Muckshell Clacker
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (440102, 4401, 2, 100, 4, 15, 440102, 'Muckshell Clacker - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (440102, 47, 'Muckshell Clacker - Flee');

-- Muckshell Snapclaw
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (440201, 4402, 2, 100, 4, 15, 440201, 'Muckshell Snapclaw - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (440201, 47, 'Muckshell Snapclaw - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=4402;

-- Kolkar Scout
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (463301, 4633, 2, 100, 4, 15, 463301, 'Kolkar Scout - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (463301, 47, 'Kolkar Scout - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=4633;

-- Scargil
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (1427601, 14276, 2, 100, 4, 15, 1427601, 'Scargil - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (1427601, 47, 'Scargil - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=14276;

-- Twilight Flamereaver
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (1520101, 15201, 2, 100, 4, 15, 1520101, 'Twilight Flamereaver - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (1520101, 47, 'Twilight Flamereaver - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=15201;

-- Saean
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (138001, 1380, 2, 100, 4, 15, 138001, 'Saean - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (138001, 47, 'Saean - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=1380;

-- Dark Iron Ambusher
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (198101, 1981, 2, 100, 4, 15, 198101, 'Dark Iron Ambusher - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (198101, 47, 'Dark Iron Ambusher - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=1981;

-- Darsok Swiftdagger
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (344901, 3449, 2, 100, 4, 15, 344901, 'Darsok Swiftdagger - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (344901, 47, 'Darsok Swiftdagger - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=3449;

-- Gazrog
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (346401, 3464, 2, 100, 4, 15, 346401, 'Gazrog - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (346401, 47, 'Gazrog - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=3464;

-- Traugh
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (347801, 3478, 2, 100, 4, 15, 347801, 'Traugh - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (347801, 47, 'Traugh - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=3478;

-- Nargal Deatheye
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (347901, 3479, 2, 100, 4, 15, 347901, 'Nargal Deatheye - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (347901, 47, 'Nargal Deatheye - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=3479;

-- Jahan Hawkwing
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (348301, 3483, 2, 100, 4, 15, 348301, 'Jahan Hawkwing - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (348301, 47, 'Jahan Hawkwing - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=3483;

-- Hula'mahi
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (349001, 3490, 2, 100, 4, 15, 349001, 'Hula\'mahi - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (349001, 47, 'Hula\'mahi - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=3490;

-- Vrang Wildgore
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (368201, 3682, 2, 100, 4, 15, 368201, 'Vrang Wildgore - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (368201, 47, 'Vrang Wildgore - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=3682;

-- Khan Shaka
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (560203, 5602, 2, 100, 4, 15, 560203, 'Khan Shaka - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (560203, 47, 'Khan Shaka - Flee');

-- Larhka
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (587101, 5871, 2, 100, 4, 15, 587101, 'Larhka - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (587101, 47, 'Larhka - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=5871;

-- Expeditionary Mountaineer
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (1439001, 14390, 2, 100, 4, 20, 1439001, 'Expeditionary Mountaineer - Flee at 20% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (1439001, 47, 'Expeditionary Mountaineer - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=14390;

-- Peon
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (1490101, 14901, 2, 100, 4, 25, 1490101, 'Peon - Flee at 25% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (1490101, 47, 'Peon - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=14901;

-- Corporal Bluth
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (73401, 734, 2, 100, 4, 15, 73401, 'Corporal Bluth - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (73401, 47, 'Corporal Bluth - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=734;

-- Brother Nimetz
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (73901, 739, 2, 100, 4, 15, 73901, 'Brother Nimetz - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (73901, 47, 'Brother Nimetz - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=739;

-- Rebel Watchman
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (75401, 754, 2, 100, 4, 15, 75401, 'Rebel Watchman - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (75401, 47, 'Rebel Watchman - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=754;

-- Corporal Kaleb
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (77001, 770, 2, 100, 4, 15, 77001, 'Corporal Kaleb - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (77001, 47, 'Corporal Kaleb - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=770;

-- Corporal Sethman
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (142201, 1422, 2, 100, 4, 15, 142201, 'Corporal Sethman - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (142201, 47, 'Corporal Sethman - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=1422;

-- Prince Galen Trollbane
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (260707, 2607, 2, 100, 4, 15, 260707, 'Prince Galen Trollbane - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (260707, 47, 'Prince Galen Trollbane - Flee');

-- Caretaker Nevlin
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (278001, 2780, 2, 100, 4, 15, 278001, 'Caretaker Nevlin - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (278001, 47, 'Caretaker Nevlin - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=2780;

-- Caretaker Weston
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (278101, 2781, 2, 100, 4, 15, 278101, 'Caretaker Weston - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (278101, 47, 'Caretaker Weston - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=2781;

-- Caretaker Alaric
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (278201, 2782, 2, 100, 4, 15, 278201, 'Caretaker Alaric - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (278201, 47, 'Caretaker Alaric - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=2782;

-- Kira Songshine
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (393701, 3937, 2, 100, 4, 15, 393701, 'Kira Songshine - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (393701, 47, 'Kira Songshine - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=3937;

-- Zalas Witherbark
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (260501, 2605, 2, 100, 4, 15, 260501, 'Zalas Witherbark - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (260501, 47, 'Zalas Witherbark - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=2605;

-- Pyrewood Tailor
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (353001, 3530, 2, 100, 4, 15, 353001, 'Pyrewood Tailor - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (353001, 47, 'Pyrewood Tailor - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=3530;

-- Moonrage Tailor
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (353102, 3531, 2, 100, 4, 15, 353102, 'Moonrage Tailor - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (353102, 47, 'Moonrage Tailor - Flee');

-- Zixil
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (353701, 3537, 2, 100, 4, 15, 353701, 'Zixil - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (353701, 47, 'Zixil - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=3537;

-- Dalaran Miner
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (357801, 3578, 2, 100, 4, 15, 357801, 'Dalaran Miner - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (357801, 47, 'Dalaran Miner - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=3578;

-- Ro'Bark
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (1427801, 14278, 2, 100, 4, 15, 1427801, 'Ro\'Bark - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (1427801, 47, 'Ro\'Bark - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=14278;

-- Serena Bloodfeather
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (345201, 3452, 2, 100, 4, 15, 345201, 'Serena Bloodfeather - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (345201, 47, 'Serena Bloodfeather - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=3452;

-- Cannoneer Smythe
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (345401, 3454, 2, 100, 4, 15, 345401, 'Cannoneer Smythe - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (345401, 47, 'Cannoneer Smythe - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=3454;

-- Cannoneer Whessan
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (345501, 3455, 2, 100, 4, 15, 345501, 'Cannoneer Whessan - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (345501, 47, 'Cannoneer Whessan - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=3455;

-- Dalin Forgewright
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (568203, 5682, 2, 100, 4, 15, 568203, 'Dalin Forgewright - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (568203, 47, 'Dalin Forgewright - Flee');

-- Comar Villard
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (568301, 5683, 2, 100, 4, 15, 568301, 'Comar Villard - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (568301, 47, 'Comar Villard - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=5683;

-- Prince Nazjak
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (277901, 2779, 2, 100, 4, 15, 277901, 'Prince Nazjak - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (277901, 47, 'Prince Nazjak - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=2779;

-- Screeching Harpy
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (410001, 4100, 2, 100, 4, 15, 410001, 'Screeching Harpy - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (410001, 47, 'Screeching Harpy - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=4100;

-- Screeching Roguefeather
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (410101, 4101, 2, 100, 4, 15, 410101, 'Screeching Roguefeather - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (410101, 47, 'Screeching Roguefeather - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=4101;

-- Screeching Windcaller
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (410401, 4104, 2, 100, 4, 15, 410401, 'Screeching Windcaller - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (410401, 47, 'Screeching Windcaller - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=4104;

-- Sister Riven
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (593001, 5930, 2, 100, 4, 15, 593001, 'Sister Riven - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (593001, 47, 'Sister Riven - Flee');

-- Gibblesnik
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (1442702, 14427, 2, 100, 4, 15, 1442702, 'Gibblesnik - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (1442702, 47, 'Gibblesnik - Flee');

-- Sandfury Cretin
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (778902, 7789, 2, 100, 4, 15, 778902, 'Sandfury Cretin - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (778902, 47, 'Sandfury Cretin - Flee');

-- Twilight Lord Everun
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (1447901, 14479, 2, 100, 4, 15, 1447901, 'Twilight Lord Everun - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (1447901, 47, 'Twilight Lord Everun - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=14479;

-- Gath'Ilzogg
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (33401, 334, 2, 100, 4, 15, 33401, 'Gath\'Ilzogg - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (33401, 47, 'Gath\'Ilzogg - Flee');

-- Gradok
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (247701, 2477, 2, 100, 4, 15, 247701, 'Gradok - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (247701, 47, 'Gradok - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=2477;

-- Haren Swifthoof
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (247801, 2478, 2, 100, 4, 15, 247801, 'Haren Swifthoof - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (247801, 47, 'Haren Swifthoof - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=2478;

-- Thragomm
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (717001, 7170, 2, 100, 4, 15, 717001, 'Thragomm - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (717001, 47, 'Thragomm - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=7170;

-- Galak Centaur
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (296701, 2967, 2, 100, 4, 15, 296701, 'Galak Centaur - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (296701, 47, 'Galak Centaur - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=2967;

-- Snagglespear
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (578602, 5786, 2, 100, 4, 15, 578602, 'Snagglespear - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (578602, 47, 'Snagglespear - Flee');

-- Captain Gerogg Hammertoe
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (585102, 5851, 2, 100, 4, 15, 585102, 'Captain Gerogg Hammertoe - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (585102, 47, 'Captain Gerogg Hammertoe - Flee');

-- Dalaran Brewmaster
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (357702, 3577, 2, 100, 4, 15, 357702, 'Dalaran Brewmaster - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (357702, 47, 'Dalaran Brewmaster - Flee');

-- Magram Pack Runner
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (464301, 4643, 2, 100, 4, 15, 464301, 'Magram Pack Runner - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (464301, 47, 'Magram Pack Runner - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=4643;

-- Warug's Bodyguard
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (606801, 6068, 2, 100, 4, 15, 606801, 'Warug\'s Bodyguard - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (606801, 47, 'Warug\'s Bodyguard - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=6068;

-- Daggerspine Screamer
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (237001, 2370, 2, 100, 4, 15, 237001, 'Daggerspine Screamer - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (237001, 47, 'Daggerspine Screamer - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=2370;

-- Pelturas Whitemoon
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (389401, 3894, 2, 100, 4, 15, 389401, 'Pelturas Whitemoon - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (389401, 47, 'Pelturas Whitemoon - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=3894;

-- Tandaan Lightmane
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (395301, 3953, 2, 100, 4, 15, 395301, 'Tandaan Lightmane - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (395301, 47, 'Tandaan Lightmane - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=3953;

-- Dalria
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (395401, 3954, 2, 100, 4, 15, 395401, 'Dalria - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (395401, 47, 'Dalria - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=3954;

-- Lardan
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (395801, 3958, 2, 100, 4, 15, 395801, 'Lardan - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (395801, 47, 'Lardan - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=3958;

-- Southsea Kidnapper
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (1568501, 15685, 2, 100, 4, 15, 1568501, 'Southsea Kidnapper - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (1568501, 47, 'Southsea Kidnapper - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=15685;

-- Irondeep Miner
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (1339606, 13396, 2, 100, 4, 25, 1339606, 'Irondeep Miner - Flee at 25% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (1339606, 47, 'Irondeep Miner - Flee');

-- Geopriest Gukk'rok
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (586304, 5863, 2, 100, 4, 15, 586304, 'Geopriest Gukk\'rok - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (586304, 47, 'Geopriest Gukk\'rok - Flee');

-- High Sorcerer Andromath
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (569401, 5694, 2, 100, 4, 15, 569401, 'High Sorcerer Andromath - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (569401, 47, 'High Sorcerer Andromath - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=5694;

-- Achellios the Banished
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (593302, 5933, 2, 100, 4, 15, 593302, 'Achellios the Banished - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (593302, 47, 'Achellios the Banished - Flee');

-- Dargon
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (1201901, 12019, 2, 100, 4, 15, 1201901, 'Dargon - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (1201901, 47, 'Dargon - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=12019;

-- Daeolyn Summerleaf
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (1202101, 12021, 2, 100, 4, 15, 1202101, 'Daeolyn Summerleaf - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (1202101, 47, 'Daeolyn Summerleaf - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=12021;

-- Meliri
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (1202401, 12024, 2, 100, 4, 15, 1202401, 'Meliri - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (1202401, 47, 'Meliri - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=12024;

-- My'lanna
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (1202601, 12026, 2, 100, 4, 15, 1202601, 'My\'lanna - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (1202601, 47, 'My\'lanna - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=12026;

-- Narianna
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (1202901, 12029, 2, 100, 4, 15, 1202901, 'Narianna - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (1202901, 47, 'Narianna - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=12029;

-- Loganaar
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (1204201, 12042, 2, 100, 4, 15, 1204201, 'Loganaar - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (1204201, 47, 'Loganaar - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=12042;

-- Gorn
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (106801, 1068, 2, 100, 4, 15, 106801, 'Gorn - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (106801, 47, 'Gorn - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=1068;

-- Abe Winters
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (213501, 2135, 2, 100, 4, 15, 213501, 'Abe Winters - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (213501, 47, 'Abe Winters - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=2135;

-- Eliza Callen
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (213701, 2137, 2, 100, 4, 15, 213701, 'Eliza Callen - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (213701, 47, 'Eliza Callen - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=2137;

-- Grawl
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (290801, 2908, 2, 100, 4, 15, 290801, 'Grawl - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (290801, 47, 'Grawl - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=2908;

-- Trak'gen
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (331301, 3313, 2, 100, 4, 15, 331301, 'Trak\'gen - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (331301, 47, 'Trak\'gen - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=3313;

-- Regthar Deathgate
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (338902, 3389, 2, 100, 4, 15, 338902, 'Regthar Deathgate - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (338902, 47, 'Regthar Deathgate - Flee');

-- Bowen Brisboise
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (352301, 3523, 2, 100, 4, 15, 352301, 'Bowen Brisboise - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (352301, 47, 'Bowen Brisboise - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=3523;

-- Hamlin Atkins
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (354701, 3547, 2, 100, 4, 15, 354701, 'Hamlin Atkins - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (354701, 47, 'Hamlin Atkins - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=3547;

-- Selina Weston
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (354801, 3548, 2, 100, 4, 15, 354801, 'Selina Weston - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (354801, 47, 'Selina Weston - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=3548;

-- Athrikus Narassin
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (366001, 3660, 2, 100, 4, 15, 366001, 'Athrikus Narassin - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (366001, 47, 'Athrikus Narassin - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=3660;

-- Nazeer Bloodpike
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (479101, 4791, 2, 100, 4, 15, 479101, 'Nazeer Bloodpike - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (479101, 47, 'Nazeer Bloodpike - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=4791;

-- Krog
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (492601, 4926, 2, 100, 4, 15, 492601, 'Krog - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (492601, 47, 'Krog - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=4926;

-- Sentry Point Captain
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (508601, 5086, 2, 100, 4, 15, 508601, 'Sentry Point Captain - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (508601, 47, 'Sentry Point Captain - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=5086;

-- Vance Undergloom
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (569501, 5695, 2, 100, 4, 15, 569501, 'Vance Undergloom - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (569501, 47, 'Vance Undergloom - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=5695;

-- Burkrum
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (602801, 6028, 2, 100, 4, 15, 602801, 'Burkrum - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (602801, 47, 'Burkrum - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=6028;

-- Ghok'kah
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (656701, 6567, 2, 100, 4, 15, 656701, 'Ghok\'kah - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (656701, 47, 'Ghok\'kah - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=6567;

-- Kixxle
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (830501, 8305, 2, 100, 4, 15, 830501, 'Kixxle - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (830501, 47, 'Kixxle - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=8305;

-- Zanara
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (955201, 9552, 2, 100, 4, 15, 955201, 'Zanara - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (955201, 47, 'Zanara - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=9552;

-- Morganus
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (1005501, 10055, 2, 100, 4, 15, 1005501, 'Morganus - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (1005501, 47, 'Morganus - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=10055;

-- Storm Shadowhoof
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (1030301, 10303, 2, 100, 4, 15, 1030301, 'Storm Shadowhoof - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (1030301, 47, 'Storm Shadowhoof - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=10303;

-- Innkeeper Abeqwa
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (1111601, 11116, 2, 100, 4, 15, 1111601, 'Innkeeper Abeqwa - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (1111601, 47, 'Innkeeper Abeqwa - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=11116;

-- Awenasa
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (1111701, 11117, 2, 100, 4, 15, 1111701, 'Awenasa - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (1111701, 47, 'Awenasa - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=11117;

-- Horde Grunt
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (1168202, 11682, 2, 100, 4, 15, 1168202, 'Horde Grunt - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (1168202, 47, 'Horde Grunt - Flee');

-- Fahrak
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (1182901, 11829, 2, 100, 4, 15, 1182901, 'Fahrak - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (1182901, 47, 'Fahrak - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=11829;

-- Marukai
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (1271901, 12719, 2, 100, 4, 15, 1271901, 'Marukai - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (1271901, 47, 'Marukai - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=12719;

-- Mitsuwa
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (1272101, 12721, 2, 100, 4, 15, 1272101, 'Mitsuwa - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (1272101, 47, 'Mitsuwa - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=12721;

-- Vyral the Vile
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (1520201, 15202, 2, 100, 4, 15, 1520201, 'Vyral the Vile - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (1520201, 47, 'Vyral the Vile - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=15202;

-- Watcher Backus
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (84001, 840, 2, 100, 4, 15, 84001, 'Watcher Backus - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (84001, 47, 'Watcher Backus - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=840;

-- Young Reef Crawler
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (223401, 2234, 2, 100, 4, 20, 223401, 'Young Reef Crawler - Flee at 20% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (223401, 47, 'Young Reef Crawler - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=2234;

-- Threggil
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (1443201, 14432, 2, 100, 4, 15, 1443201, 'Threggil - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (1443201, 47, 'Threggil - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=14432;

-- Watcher Dodds
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (88801, 888, 2, 100, 4, 15, 88801, 'Watcher Dodds - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (88801, 47, 'Watcher Dodds - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=888;

-- Angus Stern
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (114101, 1141, 2, 100, 4, 15, 114101, 'Angus Stern - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (114101, 47, 'Angus Stern - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=1141;

-- Blackwater Deckhand
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (263601, 2636, 2, 100, 4, 15, 263601, 'Blackwater Deckhand - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (263601, 47, 'Blackwater Deckhand - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=2636;

-- Matt Johnson
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (313701, 3137, 2, 100, 4, 15, 313701, 'Matt Johnson - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (313701, 47, 'Matt Johnson - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=3137;

-- Connor Rivers
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (508101, 5081, 2, 100, 4, 15, 508101, 'Connor Rivers - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (508101, 47, 'Connor Rivers - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=5081;

-- Coldmine Miner
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (1331706, 13317, 2, 100, 4, 30, 1331706, 'Coldmine Miner - Flee at 30% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (1331706, 47, 'Coldmine Miner - Flee');

-- Lady Zephris
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (1427701, 14277, 2, 100, 4, 15, 1427701, 'Lady Zephris - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (1427701, 47, 'Lady Zephris - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=14277;

-- Verifonix
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (1449201, 14492, 2, 100, 4, 15, 1449201, 'Verifonix - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (1449201, 47, 'Verifonix - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=14492;

-- Captain Beld
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (612401, 6124, 2, 100, 4, 15, 612401, 'Captain Beld - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (612401, 47, 'Captain Beld - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=6124;

-- Lord Shalzaru
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (813602, 8136, 2, 100, 4, 15, 813602, 'Lord Shalzaru - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (813602, 47, 'Lord Shalzaru - Flee');

-- Mosshoof Stag
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (876001, 8760, 2, 100, 4, 15, 876001, 'Mosshoof Stag - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (876001, 47, 'Mosshoof Stag - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=8760;

-- Tazan
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (649401, 6494, 2, 100, 4, 15, 649401, 'Tazan - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (649401, 47, 'Tazan - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=6494;

-- Diamond Head
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (534501, 5345, 2, 100, 4, 15, 534501, 'Diamond Head - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (534501, 47, 'Diamond Head - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=5345;

-- Foreman Rigger
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (593103, 5931, 2, 100, 4, 15, 593103, 'Foreman Rigger - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (593103, 47, 'Foreman Rigger - Flee');

-- Peter Galen
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (786601, 7866, 2, 100, 4, 15, 786601, 'Peter Galen - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (786601, 47, 'Peter Galen - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=7866;

-- Coral Moongale
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (1170801, 11708, 2, 100, 4, 15, 1170801, 'Coral Moongale - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (1170801, 47, 'Coral Moongale - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=11708;

-- Kreenig Snarlsnout
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `action1_script`, `comment`) VALUES (343801, 3438, 2, 100, 4, 15, 343801, 'Kreenig Snarlsnout - Flee at 15% HP');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `comments`) VALUES (343801, 47, 'Kreenig Snarlsnout - Flee');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=3438;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
