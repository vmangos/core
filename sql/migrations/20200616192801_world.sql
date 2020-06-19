DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200616192801');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200616192801');
-- Add your query below.


-- Remove static spawn for Gyth in UBRS.
DELETE FROM `creature` WHERE `id`=10339;

-- Correct spawns of Nefarian and Rend in UBRS.
UPDATE `creature` SET `position_x`=163.168, `position_y`=-444.165, `position_z`=122.059, `orientation`=3.12414, `spawntimesecsmin`=1000000, `spawntimesecsmax`=1000000 WHERE `guid`=41877;
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `display_id`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES (41809, 10429, 0, 0, 0, 229, 0, 0, 159.276, -443.619, 122.059, 6.26573, 1000000, 1000000, 0, 100, 0, 0, 0, 0, 0, 10);

-- Change default movement type to idle.
UPDATE `creature_template` SET `movement_type`=0 WHERE `entry` IN (10442, 10447, 10742, 10339, 10429, 10162, 9819, 10317);

-- Increase aggro radius for stadium event mobs.
UPDATE `creature_template` SET `detection_range`=25 WHERE `entry` IN (10442, 10447, 10742);

-- Add waypoints for mobs summoned during stadium event.
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`) VALUES 
(10442, 1, 177.85, -421.282, 110.472, 100),
(10442, 2, 175.62, -413.621, 110.863, 100),
(10442, 3, 168.71, -409.398, 110.863, 100),
(10442, 4, 161.046, -403.908, 110.863, 100),
(10442, 5, 152.812, -402.17, 110.863, 100),
(10442, 6, 141.017, -403.946, 110.863, 100),
(10442, 7, 131.584, -405.95, 110.863, 100),
(10442, 8, 122.644, -411, 110.863, 100),
(10442, 9, 122.206, -417.566, 110.488, 100),
(10442, 10, 124.851, -431.84, 110.863, 100),
(10442, 11, 132.464, -435.998, 110.863, 100),
(10442, 12, 145.458, -435.786, 110.863, 100),
(10442, 13, 151.911, -436.3, 110.863, 100),
(10442, 14, 166.307, -436.156, 110.863, 100),
(10442, 15, 175.394, -431.882, 110.863, 100);

-- Add waypoints for Lord Victor Nefarius.
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`) VALUES (10162, 1, 169.33, -444.8, 121.98, 6.27848, 0);
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`) VALUES (10162, 2, 161.91, -444.92, 121.98, 3.28768, 0);

-- Add waypoints for Gyth.
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `script_id`) VALUES 
(10339, 1, 211.762, -397.589, 111.182, 100, 0, 0),
(10339, 2, 209.232, -409.57, 110.939, 100, 0, 0),
(10339, 3, 190.982, -420.506, 110.89, 100, 0, 0),
(10339, 4, 163.62, -420.33, 110.47, 100, 60000, 1033904),
(10339, 5, 163.62, -420.33, 110.47, 100, 0, 0);
DELETE FROM `creature_movement_scripts` WHERE `id`=1033904;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1033904, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gyth - Move Idle');

-- Events list for Gyth
DELETE FROM `creature_ai_events` WHERE `creature_id`=10339;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1033901, 10339, 0, 2, 0, 100, 0, 50, 1, 0, 0, 1033901, 0, 0, 'Gyth - Cast Chromatic Power below 50% HP');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1033902, 10339, 0, 2, 0, 100, 0, 20, 0, 0, 0, 1033902, 0, 0, 'Gyth - Summon Rend below 20% HP');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1033903, 10339, 0, 11, 0, 100, 0, 0, 0, 0, 0, 1033903, 0, 0, 'Gyth - Enable Death Prevention on Spawn');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1033904, 10339, 0, 17, 0, 100, 0, 10429, 0, 0, 0, 1033904, 0, 0, 'Gyth - Say Emoted Text on Summoning Rend');
DELETE FROM `creature_ai_scripts` WHERE `id`=1033901;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1033901, 0, 0, 0, 0, 0, 0, 10162, 0, 10, 2, 5726, 0, 0, 0, 0, 0, 0, 0, 0, 'Lord VIctor Nefarius - Say Text');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1033901, 0, 15, 16337, 2, 0, 0, 10162, 0, 10, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lord VIctor Nefarius - Cast Spell Chromatic Chaos');
DELETE FROM `creature_ai_scripts` WHERE `id`=1033902;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1033902, 0, 14, 16167, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gyth - Remove Aura Rend Blackhand Mounts');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1033902, 0, 52, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gyth - Disable Death Prevention');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1033902, 0, 15, 16328, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gyth - Cast Spell Summon Rend Blackhand');
DELETE FROM `creature_ai_scripts` WHERE `id`=1033903;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1033903, 0, 52, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gyth - Enable Death Prevention');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1033903, 0, 15, 16167, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gyth - Cast Spell Rend Blackhand Mounts');
DELETE FROM `creature_ai_scripts` WHERE `id`=1033904;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1033904, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 5711, 0, 0, 0, 0, 0, 0, 0, 0, 'Warchief Rend Blackhand - Say Text');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1033904, 0, 4, 46, 768, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Warchief Rend Blackhand - Remove Immune to Player Flag');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1033904, 0, 15, 13360, 2, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Warchief Rend Blackhand - Cast Spell Knockdown');
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (103390, 'Blackrock Spire - Gyth', 16359, 100, 1, 0, 0, 0, 8, 8, 7, 7, 0, 16350, 100, 1, 0, 0, 0, 11, 11, 16, 16, 0, 16390, 100, 1, 0, 0, 0, 4, 4, 10, 10, 0, 10101, 100, 1, 0, 0, 0, 23, 23, 23, 23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
UPDATE `creature_template` SET `spell_list_id`=103390, `ai_name`='EventAI', `script_name`='' WHERE `entry`=10339;

-- Events list for Warchief Rend Blackhand
DELETE FROM `creature_ai_events` WHERE `creature_id`=10429;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1042901, 10429, 0, 2, 0, 100, 0, 20, 1, 0, 0, 1042901, 0, 0, 'Warchief Rend Blackhand - Cast Enrage at 20% HP');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1042902, 10429, 110, 11, 0, 100, 0, 0, 0, 0, 0, 1042902, 0, 0, 'Warchief Rend Blackhand - Morph on Spawn during Winter Veil');
DELETE FROM `creature_ai_scripts` WHERE `id`=1042901;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1042901, 0, 15, 8269, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Warchief Rend Blackhand - Cast Enrage');
DELETE FROM `creature_ai_scripts` WHERE `id`=1042902;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1042902, 0, 23, 15736, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Warchief Rend Blackhand - Morph');
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (104290, 'Blackrock Spire - Warchief Rend Blackhand', 13736, 100, 1, 0, 0, 64, 20, 20, 18, 18, 0, 15708, 100, 1, 0, 0, 0, 9, 9, 16, 16, 0, 15754, 100, 1, 0, 0, 0, 5, 5, 10, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
UPDATE `creature_template` SET `unit_flags`=832, `spell_list_id`=104290, `ai_name`='EventAI', `script_name`='' WHERE `entry`=10429;

-- Add slight delay before Chromatic Whelp starts casting.
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (104420, 'Blackrock Spire - Chromatic Whelp', 16249, 100, 4, 0, 0, 0, 2, 2, 4, 6, 0, 16250, 100, 4, 0, 0, 0, 6, 10, 12, 20, 0, 12167, 100, 1, 0, 0, 8, 2, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- Correct Cleave spell id used by Chromatic Dragonspawn.
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (104470, 'Blackrock Spire - Chromatic Dragonspawn', 15580, 100, 1, 0, 0, 0, 5, 8, 6, 9, 0, 15663, 100, 1, 0, 0, 0, 4, 9, 7, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- nefarius SAY_INTRO_1
UPDATE `broadcast_text` SET `chat_type`=1, `emote_id1`=1 WHERE `entry`=5635;
-- nefarius SAY_INTRO_2
UPDATE `broadcast_text` SET `chat_type`=1, `emote_id1`=1 WHERE `entry`=5640;
-- nefarius SAY_NEFARIUS_LOSE1
UPDATE `broadcast_text` SET `chat_type`=1, `emote_id1`=1 WHERE `entry`=5709;
-- rend SAY_REND_ATTACK
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=5722;
-- nefarius SAY_WARCHIEF
UPDATE `broadcast_text` SET `chat_type`=1, `emote_id1`=25 WHERE `entry`=5720;
-- nefarius SAY_VICTORY
UPDATE `broadcast_text` SET `chat_type`=1, `emote_id1`=1 WHERE `entry`=5824;
-- nefarius SAY_NEFARIUS_TAUNT1
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=5665;
-- nefarius SAY_NEFARIUS_TAUNT2
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=5671;
-- nefarius SAY_NEFARIUS_TAUNT3
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=5666;
-- nefarius SAY_NEFARIUS_TAUNT4
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=5667;
-- nefarius SAY_NEFARIUS_TAUNT5
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=5668;
-- nefarius SAY_NEFARIUS_TAUNT6
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=5669;
-- nefarius SAY_NEFARIUS_TAUNT7
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=5664;
-- nefarius SAY_NEFARIUS_TAUNT8
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=5719;
-- nefarius SAY_NEFARIUS_BUFF_GYTH
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=5726;
-- rend SAY_REND_TAUNT1
UPDATE `broadcast_text` SET `chat_type`=1, `emote_id1`=1 WHERE `entry`=5672;
-- rend SAY_REND_TAUNT2
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=5678;
-- rend SAY_REND_TAUNT3
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=5673;
-- rend SAY_REND_TAUNT4
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry`=5674;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
