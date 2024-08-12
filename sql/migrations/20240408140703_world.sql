DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20240408140703');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20240408140703');
-- Add your query below.


-- Remove texts from custom table.
DELETE FROM `script_texts` WHERE `entry` IN (-1309009, -1309010, -1309027, -1309028);
UPDATE `broadcast_text` SET `sound_id`=8419 WHERE `entry`=10455;
UPDATE `broadcast_text` SET `sound_id`=8424 WHERE `entry`=10451;

-- Remove wrong copy of Thekal.
UPDATE `creature` SET `id`=14509 WHERE `id`=14599;
DELETE FROM `creature_template` WHERE `entry`=14599;

-- Set Thekal's group to respawn together.
UPDATE `creature_groups` SET `flags`=(2 | 8 | 32) WHERE `leader_guid`=49310;

-- 14509:  Not (Thekal Encounter - Has Unit That Can Rez)
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (14509, 18, 309, 1, 0, 0, 1);
-- 14510:  Thekal Encounter - Has Unit That Needs Rez
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (14510, 18, 309, 2, 0, 0, 0);

-- Events list for High Priest Thekal
DELETE FROM `creature_ai_events` WHERE `creature_id`=14509;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(1450901, 14509, 0, 1, 0, 100, 1, 3000, 20000, 3000, 20000, 1450901, 0, 0, 'High Priest Thekal - Random Emote OOC'),
(1450902, 14509, 0, 2, 6, 100, 1, 1, 0, 2000, 2000, 1450902, 0, 0, 'High Priest Thekal - Feign Death on Low Health (Phase 0)'),
(1450903, 14509, 14509, 0, 5, 100, 1, 2000, 2000, 2000, 2000, 1450903, 0, 0, 'High Priest Thekal - Enter Phase 2 on All Dead (Phase 1)'),
(1450904, 14509, 14510, 0, 6, 100, 5, 10000, 10000, 10000, 10000, 1450904, 0, 0, 'High Priest Thekal - Revive Fallen Zealot (Phase 0)'),
(1450905, 14509, 0, 2, 3, 100, 12, 20, 1, 0, 0, 1450905, 0, 0, 'High Priest Thekal - Enrage at 20% HP (Phase 2)'),
(1450906, 14509, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1450906, 0, 0, 'High Priest Thekal - Set Instance Data on Aggro'),
(1450907, 14509, 0, 7, 0, 100, 0, 0, 0, 0, 0, 1450907, 0, 0, 'High Priest Thekal - Set Instance Data on Evade'),
(1450908, 14509, 0, 6, 0, 100, 0, 0, 0, 0, 0, 1450908, 0, 0, 'High Priest Thekal - Set Instance Data on Death');
DELETE FROM `creature_ai_scripts` WHERE `id`=1450901;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1450901, 0, 0, 1, 1, 23, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Priest Thekal - Emote');
DELETE FROM `creature_ai_scripts` WHERE `id`=1450902;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1450902, 0, 0, 39, 14508, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'High Priest Thekal - Start Script to Feign Death');
DELETE FROM `generic_scripts` WHERE `id`=14508;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(14508, 0, 0, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Priest Thekal - Set Phase to 1'),
(14508, 0, 1, 42, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Priest Thekal - Disable Melee Attack'),
(14508, 0, 2, 43, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Priest Thekal - Disable Combat Movement'),
(14508, 0, 3, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Priest Thekal - Remove Auras'),
(14508, 0, 4, 15, 19951, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Priest Thekal - Cast Spell Pacify'),
(14508, 0, 5, 28, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Priest Thekal - Set Stand State to Dead'),
(14508, 0, 6, 4, 46, 33816576, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Priest Thekal - Add Not Selectable Flag'),
(14508, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10453, 0, 0, 0, 0, 0, 0, 0, 0, 'High Priest Thekal - Say Emoted Text'),
(14508, 0, 8, 37, 7, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Priest Thekal - Set Instance Data TYPE_THEKAL_DEATH_TIME to SPECIAL');
DELETE FROM `creature_ai_scripts` WHERE `id`=1450903;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1450903, 0, 0, 44, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Priest Thekal - Set Phase to 2'),
(1450903, 0, 1, 39, 1450903, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'High Priest Thekal - Start Script to Enter Phase 2');
DELETE FROM `generic_scripts` WHERE `id`=1450903;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1450903, 0, 0, 4, 46, 262144, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Priest Thekal - Remove Stunned Flag'),
(1450903, 0, 1, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Priest Thekal - Set Stand State to Stand'),
(1450903, 0, 2, 15, 24171, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Priest Thekal - Cast Spell Resurrection Impact Visual'),
(1450903, 2, 0, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Priest Thekal - Remove Equipment'),
(1450903, 2, 1, 1, 53, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Priest Thekal - Emote Battle Roar'),
(1450903, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10455, 0, 0, 0, 0, 0, 0, 0, 0, 'High Priest Thekal - Say Text'),
(1450903, 4, 0, 15, 24169, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Priest Thekal - Cast Spell Thekal Transform'),
(1450903, 4, 1, 55, 145091, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'High Priest Thekal - Set Spell List'),
(1450903, 4, 2, 4, 46, 33554432, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Priest Thekal - Remove Not Selectable Flag'),
(1450903, 4, 3, 14, 19951, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Priest Thekal - Remove Pacify Self Aura'),
(1450903, 4, 4, 42, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Priest Thekal - Enable Melee Attack'),
(1450903, 4, 5, 43, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Priest Thekal - Enable Combat Movement'),
(1450903, 5, 0, 52, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Priest Thekal - Disable Invincibility');
DELETE FROM `creature_ai_scripts` WHERE `id`=1450904;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1450904, 0, 0, 37, 8, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Priest Thekal - Set Instance Data TYPE_THEKAL_REZ_TIME to SPECIAL'),
(1450904, 0, 1, 15, 24173, 0, 0, 0, 19, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Priest Thekal - Cast Spell Resurrection'),
(1450904, 0, 2, 39, 14509, 0, 0, 0, 19, 0, 10, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'High Priest Thekal - Start Script to Resurrect Target');
DELETE FROM `generic_scripts` WHERE `id`=14509;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(14509, 2, 0, 4, 46, 33816576, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Zealot - Remove Not Selectable Flag'),
(14509, 2, 1, 15, 23329, 2, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Zealot - Cast Spell Heal Max Health'),
(14509, 2, 2, 15, 24171, 2, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Zealot - Cast Spell Resurrection Impact Visual'),
(14509, 2, 3, 28, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Zealot - Set Stand State Stand'),
(14509, 2, 4, 14, 19951, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Zealot - Remove Pacify Self Aura'),
(14509, 2, 4, 42, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Zealot - Enable Melee Attack'),
(14509, 2, 5, 43, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Zealot - Enable Combat Movement'),
(14509, 2, 6, 44, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Zealot - Set Phase to 0'),
(14509, 2, 7, 0, 0, 0, 0, 0, 0, 0, 0, 1, 10454, 0, 0, 0, 0, 0, 0, 0, 0, 'Zealot - Say Emoted Text');
DELETE FROM `creature_ai_scripts` WHERE `id`=1450905;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1450905, 0, 0, 15, 8269, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Priest Thekal - Cast Spell Enrage'),
(1450905, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2384, 0, 0, 0, 0, 0, 0, 0, 0, 'High Priest Thekal - Say Emoted Text');
DELETE FROM `creature_ai_scripts` WHERE `id`=1450906;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1450906, 0, 0, 37, 6, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Priest Thekal - Set Instance Data TYPE_THEKAL to IN_PROGRESS');
DELETE FROM `creature_ai_scripts` WHERE `id`=1450907;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1450907, 0, 0, 37, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Priest Thekal - Set Instance Data TYPE_THEKAL to NOT_STARTED'),
(1450907, 0, 0, 37, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Priest Thekal - Set Instance Data TYPE_THEKAL_DEATH_TIME to NOT_STARTED'),
(1450907, 0, 0, 37, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Priest Thekal - Set Instance Data TYPE_THEKAL_REZ_TIME to NOT_STARTED'),
(1450907, 0, 0, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Priest Thekal - Set Phase to 0'),
(1450907, 0, 0, 52, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Priest Thekal - Set Invincibility Threshold'),
(1450907, 0, 0, 4, 46, 33816576, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Priest Thekal - Remove Not Selectable Flag');
DELETE FROM `creature_ai_scripts` WHERE `id`=1450908;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1450908, 0, 0, 37, 6, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Priest Thekal - Set Instance Data TYPE_THEKAL to DONE'),
(1450908, 0, 1, 37, 7, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Priest Thekal - Set Instance Data TYPE_THEKAL_DEATH_TIME to DONE'),
(1450908, 0, 2, 37, 8, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Priest Thekal - Set Instance Data TYPE_THEKAL_REZ_TIME to DONE'),
(1450908, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10451, 0, 0, 0, 0, 0, 0, 0, 0, 'High Priest Thekal - Say Text');
-- Spell List for Thekal in Phase 1
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (145090, 'Zul\'Gurub - High Priest Thekal', 22666, 100, 4, 6, 0, 256, 6, 18, 6, 24, 0, 22859, 100, 1, 0, 0, 0, 12, 24, 12, 24, 0, 24185, 100, 18, 0, 0, 0, 20, 40, 20, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
-- Spell List for Thekal in Phase 2
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (145091, 'Zul\'Gurub - High Priest Thekal Phase 2', 24193, 100, 4, 130, 0, 0, 12, 12, 15, 22, 0, 24183, 100, 1, 0, 0, 0, 2, 3, 50, 50, 0, 24189, 100, 1, 0, 0, 0, 4, 4, 16, 21, 0, 24192, 100, 1, 0, 0, 0, 15, 20, 20, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
UPDATE `creature_template` SET `spell_list_id`=145090, `ai_name`='EventAI', `script_name`='' WHERE `entry`=14509;
UPDATE `creature_template` SET `display_scale1`=0 WHERE `entry`=14966;

-- Events list for Zealot Lor'Khan
DELETE FROM `creature_ai_events` WHERE `creature_id`=11347;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(1134701, 11347, 0, 1, 0, 100, 1, 3000, 20000, 3000, 20000, 1134701, 0, 0, 'Zealot Lor\'Khan - Random Emote OOC'),
(1134702, 11347, 0, 2, 6, 100, 1, 1, 0, 2000, 2000, 1134702, 0, 0, 'Zealot Lor\'Khan - Feign Death on Low Health (Phase 0)'),
(1134703, 11347, 14509, 0, 5, 100, 1, 2000, 2000, 2000, 2000, 1134703, 0, 0, 'Zealot Lor\'Khan - Despawn on All Dead (Phase 1)'),
(1134704, 11347, 14510, 0, 6, 100, 5, 10000, 10000, 10000, 10000, 1134704, 0, 0, 'Zealot Lor\'Khan - Revive Fallen Zealot (Phase 0)'),
(1134705, 11347, 0, 7, 0, 100, 0, 0, 0, 0, 0, 1134705, 0, 0, 'Zealot Lor\'Khan - Reset Phase on Evade'),
(1134706, 11347, 0, 11, 0, 100, 1, 0, 0, 0, 0, 1134705, 0, 0, 'Zealot Lor\'Khan - Reset Phase on Respawn');
DELETE FROM `creature_ai_scripts` WHERE `id`=1134701;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1134701, 0, 0, 1, 5, 6, 273, 274, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Zealot Lor\'Khan - Emote');
DELETE FROM `creature_ai_scripts` WHERE `id`=1134702;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1134702, 0, 0, 39, 14508, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Zealot Lor\'Khan - Start Script to Feign Death');
DELETE FROM `creature_ai_scripts` WHERE `id`=1134703;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1134703, 0, 0, 52, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Zealot Lor\'Khan - Disable Invincibility'),
(1134703, 0, 1, 18, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Zealot Lor\'Khan - Despawn Creature');
DELETE FROM `creature_ai_scripts` WHERE `id`=1134704;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1134704, 0, 0, 37, 8, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Zealot Lor\'Khan - Set Instance Data TYPE_THEKAL_REZ_TIME to SPECIAL'),
(1134704, 0, 1, 15, 24173, 0, 0, 0, 19, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Zealot Lor\'Khan - Cast Spell Resurrection'),
(1134704, 0, 2, 39, 14509, 0, 0, 0, 19, 0, 10, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Zealot Lor\'Khan - Start Script to Resurrect Target');
DELETE FROM `creature_ai_scripts` WHERE `id`=1134705;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1134705, 0, 0, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Zealot Lor\'Khan - Set Phase to 0'),
(1134705, 0, 1, 52, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Zealot Lor\'Khan - Set Invincibility Threshold'),
(1134705, 0, 2, 4, 46, 33816576, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Zealot Lor\'Khan - Remove Not Selectable Flags');
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (113470, 'Zul\'Gurub - Zealot Lor\'Khan', 6713, 100, 1, 0, 0, 0, 18, 22, 28, 42, 0, 17201, 100, 14, 0, 0, 0, 15, 25, 15, 25, 0, 20545, 100, 0, 0, 0, 32, 25, 35, 25, 35, 0, 24208, 100, 15, 0, 0, 0, 10, 20, 15, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
UPDATE `creature_template` SET `spell_list_id`=113470, `ai_name`='EventAI', `script_name`='' WHERE `entry`=11347;

-- Events list for Zealot Zath
DELETE FROM `creature_ai_events` WHERE `creature_id`=11348;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(1134801, 11348, 0, 1, 0, 100, 1, 3000, 20000, 3000, 20000, 1134801, 0, 0, 'Zealot Zath - Random Emote OOC'),
(1134802, 11348, 0, 2, 6, 100, 1, 1, 0, 2000, 2000, 1134802, 0, 0, 'Zealot Zath - Feign Death on Low Health (Phase 0)'),
(1134803, 11348, 14509, 0, 5, 100, 1, 2000, 2000, 2000, 2000, 1134803, 0, 0, 'Zealot Zath - Despawn on All Dead (Phase 1)'),
(1134804, 11348, 14510, 0, 6, 100, 5, 10000, 10000, 10000, 10000, 1134804, 0, 0, 'Zealot Zath - Revive Fallen Zealot (Phase 0)'),
(1134805, 11348, 0, 7, 0, 100, 0, 0, 0, 0, 0, 1134805, 0, 0, 'Zealot Zath - Reset Phase on Evade'),
(1134806, 11348, 0, 11, 0, 100, 1, 0, 0, 0, 0, 1134805, 0, 0, 'Zealot Zath - Reset Phase on Respawn');
DELETE FROM `creature_ai_scripts` WHERE `id`=1134801;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1134801, 0, 0, 1, 1, 20, 273, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Zealot Zath - Emote');
DELETE FROM `creature_ai_scripts` WHERE `id`=1134802;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1134802, 0, 0, 39, 14508, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Zealot Zath - Start Script to Feign Death');
DELETE FROM `creature_ai_scripts` WHERE `id`=1134803;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1134803, 0, 0, 52, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Zealot Zath - Disable Invincibility'),
(1134803, 0, 1, 18, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Zealot Zath - Despawn Creature');
DELETE FROM `creature_ai_scripts` WHERE `id`=1134804;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1134804, 0, 0, 37, 8, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Zealot Zath - Set Instance Data TYPE_THEKAL_REZ_TIME to SPECIAL'),
(1134804, 0, 1, 15, 24173, 0, 0, 0, 19, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Zealot Zath - Cast Spell Resurrection'),
(1134804, 0, 2, 39, 14509, 0, 0, 0, 19, 0, 10, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Zealot Zath - Start Script to Resurrect Target');
DELETE FROM `creature_ai_scripts` WHERE `id`=1134805;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1134805, 0, 0, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Zealot Zath - Set Phase to 0'),
(1134805, 0, 1, 52, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Zealot Zath - Set Invincibility Threshold'),
(1134805, 0, 2, 4, 46, 33816576, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Zealot Zath - Remove Not Selectable Flags');
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (113480, 'Zul\'Gurub - Zealot Zath', 12540, 100, 1, 0, 0, 0, 12, 24, 20, 40, 0, 18765, 100, 0, 0, 0, 0, 20, 40, 20, 30, 0, 15581, 100, 1, 0, 0, 0, 4, 10, 4, 16, 0, 15614, 100, 4, 2, 0, 256, 6, 12, 6, 12, 0, 21060, 100, 1, 0, 0, 0, 20, 35, 35, 45, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
UPDATE `creature_template` SET `spell_list_id`=113480, `ai_name`='EventAI', `script_name`='' WHERE `entry`=11348;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
