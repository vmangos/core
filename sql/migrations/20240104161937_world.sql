DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20240104161937');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20240104161937');
-- Add your query below.


-- Events list for Scarlet Commander Mograine
DELETE FROM `creature_ai_events` WHERE `creature_id`=3976;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(397601, 3976, 0, 4, 0, 100, 0, 0, 0, 0, 0, 397601, 0, 0, 'Scarlet Commander Mograine - Say Text, Set Data, Phase and Invincibility on Aggro'),
(397602, 3976, 0, 7, 0, 100, 0, 0, 0, 0, 0, 397602, 0, 0, 'Scarlet Commander Mograine - Enable Melee Attack and Combat Movement, Set Data and Phase on Evade'),
(397603, 3976, 0, 1, 0, 100, 0, 0, 0, 0, 0, 397603, 0, 0, 'Scarlet Commander Mograine - Cast Retribution Aura OOC'),
(397604, 3976, 0, 27, 2, 100, 0, 8990, 1, 0, 0, 397603, 0, 0, 'Scarlet Commander Mograine - Cast Retribution Aura on Missing Aura (Phase 0 and 2)'),
(397605, 3976, 0, 2, 6, 100, 0, 1, 0, 0, 0, 397605, 0, 0, 'Scarlet Commander Mograine - Fake Death on 1 HP (Phase 0)'),
(397606, 3976, 0, 8, 5, 100, 0, 9232, -1, 0, 0, 397606, 0, 0, 'Scarlet Commander Mograine - Revive on Hit By Spell Scarlet Resurrection (Phase 1)'),
(397607, 3976, 0, 2, 3, 100, 0, 50, 1, 0, 0, 397607, 0, 0, 'Scarlet Commander Mograine - Cast Divine Shield at 50% HP (Phase 2)'),
(397608, 3976, 0, 5, 0, 100, 0, 0, 0, 0, 0, 397608, 0, 0, 'Scarlet Commander Mograine - Say Text on Kill');
DELETE FROM `creature_ai_scripts` WHERE `id`=397601;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(397601, 0, 0, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Commander Mograine - Set Phase to 0'),
(397601, 0, 0, 37, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Commander Mograine - Set Data MOGRAINE to IN_PROGRESS'),
(397601, 0, 0, 52, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Commander Mograine - Set Invincibility at 1 HP'),
(397601, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2847, 0, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Commander Mograine - Say Text');
DELETE FROM `creature_ai_scripts` WHERE `id`=397602;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(397602, 0, 0, 37, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Commander Mograine - Set Data MOGRAINE to NOT_STARTED'),
(397602, 0, 0, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Commander Mograine - Set Phase to 0'),
(397602, 0, 0, 43, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Commander Mograine - Enable Combat Movement'),
(397602, 0, 0, 42, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Commander Mograine - Enable Melee Attack'),
(397602, 0, 0, 4, 46, 33554944, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Commander Mograine - Remove Immune to NPC and Unselectable Flags');
DELETE FROM `creature_ai_scripts` WHERE `id`=397603;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(397603, 0, 0, 15, 8990, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Commander Mograine - Cast Retribution Aura');
DELETE FROM `creature_ai_scripts` WHERE `id`=397605;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(397605, 0, 0, 42, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Commander Mograine - Disable Melee Attack'),
(397605, 0, 1, 43, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Commander Mograine - Disable Combat Movement'),
(397605, 0, 2, 28, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Commander Mograine - Set Stand State to Dead'),
(397605, 0, 3, 4, 46, 33554944, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Commander Mograine - Add Immune To NPC and Unselectable Flags'),
(397605, 0, 4, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Commander Mograine - Remove All Auras'),
(397605, 0, 5, 16, 1326, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Commander Mograine - Play Sound HumanMaleNPC1Death'),
(397605, 0, 6, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Commander Mograine - Set Phase to 1'),
(397605, 0, 7, 37, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Commander Mograine - Set Data MOGRAINE to DIED_ONCE'),
(397605, 0, 8, 55, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Commander Mograine - Remove Spell List');
DELETE FROM `creature_ai_scripts` WHERE `id`=397606;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(397606, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 6532, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Whitemane - Say Text'),
(397606, 0, 1, 55, 39770, 0, 0, 0, 0, 0, 0, 1, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Whitemane - Set Spell List'),
(397606, 0, 1, 42, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Whitemane - Enable Melee Attack'),
(397606, 0, 1, 43, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Whitemane - Enable Combat Movement'),
(397606, 0, 1, 52, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Whitemane - Disable Invinciblity'),
(397606, 0, 4, 39, 9232, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Commander Mograine - Start Script');
DELETE FROM `generic_scripts` WHERE `id`=9232;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(9232, 3, 0, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Commander Mograine - Set Stand State to Standing'),
(9232, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6533, 0, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Commander Mograine - Say Text'),
(9232, 3, 2, 15, 9257, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Commander Mograine - Cast Spell Lay on Hands'),
(9232, 4, 0, 4, 46, 33554944, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Commander Mograine - Remove Immune to NPC and Unselectable Flags'),
(9232, 4, 1, 42, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Commander Mograine - Enable Melee Attack'),
(9232, 4, 2, 43, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Commander Mograine - Enable Combat Movement'),
(9232, 4, 3, 37, 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Commander Mograine - Set Data MOGRAINE to REVIVED'),
(9232, 4, 4, 44, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Commander Mograine - Set Phase to 2'),
(9232, 4, 5, 52, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Commander Mograine - Disable Invincibility'),
(9232, 4, 6, 55, 39760, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Commander Mograine - Set Spell List');
DELETE FROM `creature_ai_scripts` WHERE `id`=397607;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(397607, 0, 0, 15, 1020, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Commander Mograine - Cast Spell Divine Shield');
DELETE FROM `creature_ai_scripts` WHERE `id`=397608;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(397608, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6197, 0, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Commander Mograine - Say Text');
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (39760, 'Scarlet Monastery - Scarlet Commander Mograine', 14518, 100, 1, 0, 0, 0, 6, 12, 6, 18, 0, 5589, 100, 1, 0, 0, 0, 7, 16, 60, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
UPDATE `creature_template` SET `spell_list_id`=39760, `ai_name`='EventAI', `script_name`='' WHERE `entry`=3976;

-- 999:  Not (Source Is In Combat)
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (999, 43, 0, 0, 0, 0, 3);

-- Events list for High Inquisitor Whitemane
DELETE FROM `creature_ai_events` WHERE `creature_id`=3977;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(397701, 3977, 0, 1, 0, 100, 0, 0, 0, 0, 0, 397701, 0, 0, 'High Inquisitor Whitemane - Set Invincibility and Phase OOC'),
(397702, 3977, 0, 2, 2, 100, 0, 50, 0, 0, 0, 397702, 0, 0, 'High Inquisitor Whitemane - Cast Deep Sleep at 50% HP (Phase 0)'),
(397703, 3977, 999, 29, 2, 100, 0, 9, 100, 0, 0, 397703, 0, 0, 'High Inquisitor Whitemane - Cast Scarlet Resurrection on Reached Mograine OOC (Phase 0)'),
(397704, 3977, 0, 29, 2, 100, 0, 9, 101, 0, 0, 397703, 0, 0, 'High Inquisitor Whitemane - Cast Scarlet Resurrection on Reached Mograine (Phase 0)'),
(397705, 3977, 0, 7, 0, 100, 0, 0, 0, 0, 0, 397705, 0, 0, 'High Inquisitor Whitemane - Set Data on Evade'),
(397706, 3977, 0, 5, 0, 100, 0, 0, 0, 0, 0, 397706, 0, 0, 'High Inquisitor Whitemane - Say Text on Kill');
DELETE FROM `creature_ai_scripts` WHERE `id`=397701;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(397701, 0, 0, 52, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Whitemane - Set Invincibility at 1 HP'),
(397701, 0, 0, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Whitemane - Set Phase to 0');
DELETE FROM `creature_ai_scripts` WHERE `id`=397702;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(397702, 0, 0, 55, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Whitemane - Remove Spell List'),
(397702, 0, 1, 15, 9256, 3, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Whitemane - Cast Spell Deep Sleep'),
(397702, 0, 2, 42, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Whitemane - Disable Melee Attack'),
(397702, 0, 3, 43, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Whitemane - Disable Combat Movement'),
(397702, 0, 4, 3, 2, 0, 69, 2, 2, 0, 10, 0, 101, 0, 0, 0, 3, 0, 0, 0, 0, 'High Inquisitor Whitemane - Move to Mograine');
DELETE FROM `creature_ai_scripts` WHERE `id`=397703;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(397703, 0, 0, 15, 9232, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Whitemane - Cast Scarlet Resurrection'),
(397703, 0, 0, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Whitemane - Set Phase to 1');
DELETE FROM `creature_ai_scripts` WHERE `id`=397705;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(397705, 0, 0, 37, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Whitemane - Set Data MOGRAINE to NOT_STARTED');
DELETE FROM `creature_ai_scripts` WHERE `id`=397706;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(397706, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6198, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Whitemane - Say Text');
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (39770, 'Scarlet Monastery - High Inquisitor Whitemane', 14515, 100, 5, 0, 0, 0, 15, 30, 60, 60, 0, 12039, 100, 15, 0, 0, 0, 30, 60, 30, 60, 0, 22187, 100, 17, 0, 0, 0, 10, 30, 10, 30, 0, 9481, 100, 1, 0, 0, 0, 0, 2, 2, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
UPDATE `creature_template` SET `spell_list_id`=39770, `ai_name`='EventAI', `script_name`='' WHERE `entry`=3977;



-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
