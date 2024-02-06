DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20240206152221');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20240206152221');
-- Add your query below.


-- Start script for The Missing Diplomat.
DELETE FROM `quest_start_scripts` WHERE `id`=1324;
INSERT INTO `quest_start_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1324, 0, 0, 61, 1324, 300, 0, 0, 0, 0, 0, 8, 0, 132401, 6304, 132400, 0, 0, 0, 0, 0, 'The Missing Diplomat: Start Scripted Map Event'),
(1324, 0, 1, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Missing Diplomat: Private Hendel - Set Phase to 1'),
(1324, 0, 2, 52, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Missing Diplomat: Private Hendel - Set Invincibility'),
(1324, 0, 3, 22, 17, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Missing Diplomat: Private Hendel - Set Faction to Defias Brotherhood'),
(1324, 0, 4, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Missing Diplomat: Private Hendel - Remove NPC Flags'),
(1324, 0, 5, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Missing Diplomat: Private Hendel - Start Attack'),
(1324, 0, 6, 22, 17, 3, 0, 0, 303721, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Missing Diplomat: Theramore Sentry - Set Faction to Defias Brotherhood'),
(1324, 0, 7, 26, 0, 0, 0, 0, 303721, 0, 9, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Missing Diplomat: Theramore Sentry - Start Attack'),
(1324, 0, 8, 22, 17, 3, 0, 0, 303722, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Missing Diplomat: Theramore Sentry - Set Faction to Defias Brotherhood'),
(1324, 0, 9, 26, 0, 0, 0, 0, 303722, 0, 9, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Missing Diplomat: Theramore Sentry - Start Attack');
UPDATE `quest_template` SET `StartScript`=1324 WHERE `entry`=1324;

-- Add permanent spawns for Theramore Sentry.
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `id5`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES (303721, 5184, 0, 0, 0, 0, 1, -2891.22, -3344.7, 32.3499, 3.34432, 300, 300, 5, 100, 100, 1, 0, 0, 0, 10);
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `id5`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES (303722, 5184, 0, 0, 0, 0, 1, -2889.72, -3337.92, 32.4705, 0.0541443, 300, 300, 5, 100, 100, 1, 0, 0, 0, 10);

-- Events list for Private Hendel
DELETE FROM `creature_ai_events` WHERE `creature_id`=4966;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(496601, 4966, 0, 7, 1, 100, 0, 0, 0, 0, 0, 496601, 0, 0, 'Private Hendel - End Scripted Map Event on Evade (Phase 1)'),
(496602, 4966, 0, 2, 1, 100, 0, 30, 0, 0, 0, 496602, 0, 0, 'Private Hendel - End Scripted Map Event at 30% HP'),
(496603, 4966, 0, 11, 0, 100, 1, 0, 0, 0, 0, 496603, 0, 0, 'Private Hendel - Reset Phase on Respawn');
DELETE FROM `creature_ai_scripts` WHERE `id`=496601;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(496601, 0, 0, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Private Hendel - Set Phase to 0'),
(496601, 0, 1, 62, 1324, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Private Hendel - End Scripted Map Event');
DELETE FROM `creature_ai_scripts` WHERE `id`=496602;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(496602, 0, 0, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Private Hendel - Set Phase to 0'),
(496602, 0, 1, 62, 1324, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Private Hendel - End Scripted Map');
DELETE FROM `creature_ai_scripts` WHERE `id`=496603;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(496603, 0, 0, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Private Hendel - Set Phase to 0'),
(496603, 0, 1, 52, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Private Hendel - Remove Invincibility'),
(496603, 0, 2, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Private Hendel - Add Quest Giver Flag'),
(496603, 0, 3, 4, 46, 256, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Private Hendel - Remove Immune to Player Flag'),
(496603, 0, 4, 71, 0, 0, 0, 0, 303721, 0, 9, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Theramore Sentry - Respawn'),
(496603, 0, 5, 71, 0, 0, 0, 0, 303722, 0, 9, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Theramore Sentry - Respawn');
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (49660, 'Dustwallow Marsh - Private Hendel', 11977, 100, 1, 0, 0, 0, 20, 20, 20, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
UPDATE `creature_template` SET `spell_list_id`=49660, `ai_name`='EventAI', `script_name`='' WHERE `entry`=4966;

-- Private Hendel does not need to be an active object and should respawn in 5 minutes.
UPDATE `creature` SET `spawntimesecsmin`=300, `spawntimesecsmax`=300, `spawn_flags`=0 WHERE `id`=4966;

-- Events list for Theramore Sentry
DELETE FROM `creature_ai_events` WHERE `creature_id`=5184;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(518401, 5184, 0, 2, 0, 100, 4, 15, 0, 0, 0, 518401, 0, 0, 'Theramore Sentry - Flee at 15% HP'),
(518402, 5184, 0, 29, 0, 100, 0, 9, 1324, 0, 0, 518402, 0, 0, 'Theramore Sentry - Despawn on Reaching Point (The Missing Diplomat)');
DELETE FROM `creature_ai_scripts` WHERE `id`=518402;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(518402, 0, 0, 18, 1, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Theramore Sentry - Despawn Creature');

-- Fail script for The Missing Diplomat.
DELETE FROM `generic_scripts` WHERE `id`=132400;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(132400, 0, 0, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Missing Diplomat: Private Hendel - Set Phase to 0'),
(132400, 0, 1, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Missing Diplomat: Private Hendel - Reset Faction'),
(132400, 0, 2, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Missing Diplomat: Private Hendel - Add Quest Giver Flag'),
(132400, 0, 3, 22, 0, 0, 0, 0, 303721, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Missing Diplomat: Theramore Sentry - Restore Faction'),
(132400, 0, 4, 22, 0, 0, 0, 0, 303722, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Missing Diplomat: Theramore Sentry - Restore Faction'),
(132400, 0, 5, 70, 1324, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Missing Diplomat: Player - Fail Quest');

-- Success script for The Missing Diplomat.
DELETE FROM `generic_scripts` WHERE `id`=132401;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(132401, 0, 0, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Missing Diplomat: Private Hendel - Set Phase to 0'),
(132401, 0, 1, 22, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Missing Diplomat: Private Hendel - Set Faction to Friendly'),
(132401, 0, 2, 4, 46, 256, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Missing Diplomat: Private Hendel - Add Immune to Player Flag'),
(132401, 0, 3, 73, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Missing Diplomat: Private Hendel - Combat Stop'),
(132401, 0, 4, 20, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Missing Diplomat: Private Hendel - Move Idle'),
(132401, 0, 5, 3, 0, 0, 69, 3, 0, 0, 0, 0, 0, 0, 0, 0, -2895.94, -3348.84, 31.4142, 0.401426, 0, 'The Missing Diplomat: Private Hendel - Move'),
(132401, 0, 6, 10, 4968, 140000, 0, 0, 0, 0, 0, 0, 0, 132402, -1, 1, -2875.03, -3349.14, 35.9534, 1.8326, 0, 'The Missing Diplomat: Summon Creature Lady Jaina Proudmoore'),
(132401, 0, 7, 10, 4967, 140000, 0, 0, 0, 0, 0, 0, 0, 132403, -1, 1, -2876.28, -3347.27, 35.7761, 2.84489, 0, 'The Missing Diplomat: Summon Creature Archmage Tervosh'),
(132401, 0, 8, 10, 4965, 140000, 0, 0, 0, 0, 0, 0, 0, 132404, -1, 1, -2873.21, -3346.3, 35.8944, 3.7001, 0, 'The Missing Diplomat: Summon Creature Pained'),
(132401, 0, 9, 3, 0, 0, 69, 2, 303721, 0, 9, 2, 1324, 0, 0, 0, -2916.96, -3352.19, 29.3314, 0, 1000, 'The Missing Diplomat: Theramore Sentry - Move'),
(132401, 0, 10, 3, 0, 0, 69, 2, 303722, 0, 9, 2, 1324, 0, 0, 0, -2916.89, -3333.04, 30.229, 0, 1000, 'The Missing Diplomat: Theramore Sentry - Move'),
(132401, 0, 11, 0, 0, 0, 0, 0, 303721, 0, 9, 2, 7325, 7340, 0, 0, 0, 0, 0, 0, 1000, 'The Missing Diplomat: Theramore Sentry - Say Text'),
(132401, 0, 12, 0, 0, 0, 0, 0, 303722, 0, 9, 2, 7324, 7341, 7342, 0, 0, 0, 0, 0, 1000, 'The Missing Diplomat: Theramore Sentry - Say Text'),
(132401, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8224, 0, 0, 0, 0, 0, 0, 0, 0, 'The Missing Diplomat: Private Hendel - Say Text'),
(132401, 1, 1, 1, 64, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Missing Diplomat: Private Hendel - Set Emote State to STATE_STUN'),
(132401, 17, 0, 1, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Missing Diplomat: Private Hendel - Emote OneShotBeg'),
(132401, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1759, 0, 0, 0, 0, 0, 0, 0, 0, 'The Missing Diplomat: Private Hendel - Say Text'),
(132401, 21, 0, 7, 1324, 100, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Missing Diplomat: Complete Quest The Missing Diplomat'),
(132401, 21, 1, 18, 0, 280, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Missing Diplomat: Private Hendel - Despawn Creature');

-- Spawn script for Lady Jaina Proudmoore.
DELETE FROM `generic_scripts` WHERE `id`=132402;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(132402, 0, 0, 15, 7143, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Missing Diplomat: Lady Jaina Proudmoore - Cast Spell Simple Teleport Group'),
(132402, 3, 0, 3, 0, 2052, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -2882.03, -3348.98, 34.1378, 3.10449, 0, 'The Missing Diplomat: Lady Jaina Proudmoore - Move'),
(132402, 131, 0, 1, 70, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Missing Diplomat: Lady Jaina Proudmoore - Emote OneShotWaveNoSheathe'),
(132402, 134, 0, 15, 7078, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Missing Diplomat: Lady Jaina Proudmoore - Cast Spell Simple Teleport Group');

-- Spawn script for Archmage Tervosh.
DELETE FROM `generic_scripts` WHERE `id`=132403;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(132403, 3, 0, 3, 0, 948, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -2883.52, -3347.64, 33.669, 3.20931, 0, 'The Missing Diplomat: Archmage Tervosh - Move'),
(132403, 6, 0, 15, 7081, 0, 0, 0, 4966, 100, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Missing Diplomat: Archmage Tervosh - Cast Spell Encage'),
(132403, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1663, 0, 0, 0, 0, 0, 0, 0, 0, 'The Missing Diplomat: Archmage Tervosh - Say Text'),
(132403, 19, 0, 15, 7079, 0, 0, 0, 4966, 100, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Missing Diplomat: Archmage Tervosh - Cast Spell Simple Teleport Other'),
(132403, 19, 0, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Missing Diplomat: Archmage Tervosh - Add Npc Flags'),
(132403, 25, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Missing Diplomat: Archmage Tervosh - Emote OneShotTalk'),
(132403, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1761, 0, 0, 0, 0, 0, 0, 0, 0, 'The Missing Diplomat: Archmage Tervosh - Say Text'),
(132403, 34, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Missing Diplomat: Archmage Tervosh - Emote OneShotTalk'),
(132403, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1808, 0, 0, 0, 0, 0, 0, 0, 0, 'The Missing Diplomat: Archmage Tervosh - Say Text'),
(132403, 124, 0, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Missing Diplomat: Archmage Tervosh - Emote OneShotBow'),
(132403, 124, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1772, 0, 0, 0, 0, 0, 0, 0, 0, 'The Missing Diplomat: Archmage Tervosh - Say Text');

-- Spawn script for Pained.
DELETE FROM `generic_scripts` WHERE `id`=132404;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(132404, 3, 0, 3, 0, 1050, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, -2874.52, -3346.33, 35.8878, 0, 0, 'The Missing Diplomat: Pained - Move'),
(132404, 4, 0, 3, 0, 2045, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -2882.18, -3346.15, 33.9913, 3.27056, 0, 'The Missing Diplomat: Pained - Move');

-- Remove no longer needed texts.
DELETE FROM `script_texts` WHERE `entry` IN (-1000411, -1000412, -1000413, -1000414, -1999901, -1999911, -1999912, -1999913, -1000415);

-- Remove custom creature used in old script.
DELETE FROM `creature_template` WHERE `entry`=25000;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
