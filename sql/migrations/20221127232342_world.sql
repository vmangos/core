DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20221127232342');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20221127232342');
-- Add your query below.


-- Make Rajaxx active object so he attacks even if players are not in visibility range.
UPDATE `creature` SET `spawn_flags`=1 WHERE `guid`=90871;

-- Make whole Rajaxx wave group respawn when any evades.
UPDATE `creature_groups` SET `flags`=46 WHERE `leader_guid` IN (301057, 301058, 301168, 301169, 301170, 301171, 301172);

-- Delete custom duplicate of Andorov.
DELETE FROM `creature_template` WHERE `entry`=987001;

-- Update Lieutenant General Andorov's group.
UPDATE `creature_groups` SET `flags`=11 WHERE `leader_guid`=301311;
UPDATE `creature_groups` SET `dist`=4.929, `angle`=2.1 WHERE `member_guid`=301315;
UPDATE `creature_groups` SET `dist`=4.813, `angle`=2.6 WHERE `member_guid`=301314;
UPDATE `creature_groups` SET `dist`=4.743, `angle`=3.2 WHERE `member_guid`=301313;
UPDATE `creature_groups` SET `dist`=4.856, `angle`=3.7 WHERE `member_guid`=301312;
UPDATE `creature` SET `spawn_flags`=2, `position_x`=-8638.66, `position_y`=1486.67, `position_z`=32.8086, `orientation`=2.33201 WHERE `guid`=301311;
UPDATE `creature` SET `spawn_flags`=2, `position_x`=-8642.17, `position_y`=1483.27, `position_z`=32.1492, `orientation`=2.34367 WHERE `guid`=301315;
UPDATE `creature` SET `spawn_flags`=2, `position_x`=-8638.79, `position_y`=1481.88, `position_z`=32.3678, `orientation`=2.34722 WHERE `guid`=301314;
UPDATE `creature` SET `spawn_flags`=2, `position_x`=-8635.29, `position_y`=1483.34, `position_z`=32.6653, `orientation`=2.3467 WHERE `guid`=301313;
UPDATE `creature` SET `spawn_flags`=2, `position_x`=-8633.81, `position_y`=1486.9, `position_z`=32.8304, `orientation`=2.34515 WHERE `guid`=301312;

-- Correct faction and flags of Lieutenant General Andorov and Kaldorei Elite.
UPDATE `creature_template` SET `regeneration`=0, `faction`=1608, `unit_flags`=512, `ai_name`='EventAI', `script_name`='', `flags_extra` = (`flags_extra` | 33554432) WHERE `entry` IN (15471, 15473);

-- 1112: Instance Data TYPE_GENERAL_ANDOROV is FAIL
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (1112, 34, 1, 2, 0, 0, 0);

-- Events list for Lieutenant General Andorov
DELETE FROM `creature_ai_events` WHERE `creature_id`=15471;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1547101, 15471, 0, 11, 0, 100, 1, 0, 0, 0, 0, 1547101, 0, 0, 'Lieutenant General Andorov - Set Data and Phase on Spawn');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1547102, 15471, 0, 1, 1, 100, 0, 1000, 1000, 0, 0, 1547102, 0, 0, 'Lieutenant General Andorov - Set Emote State OOC (Phase 1)');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1547103, 15471, 0, 6, 0, 100, 0, 0, 0, 0, 0, 1547103, 0, 0, 'Lieutenant General Andorov - Set Home Position on Death');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1547104, 15471, 3704, 1, 3, 100, 0, 5000, 5000, 0, 0, 1547104, 0, 0, 'Lieutenant General Andorov - Set Immune to NPC Flag 5 seconds after Rajaxx is Dead');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1547105, 15471, 3704, 1, 3, 100, 0, 130000, 130000, 0, 0, 1547105, 0, 0, 'Lieutenant General Andorov - Despawn 130 seconds after Rajaxx is Dead');
DELETE FROM `creature_ai_scripts` WHERE `id`=1547101;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1547101, 0, 0, 37, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1112, 'Lieutenant General Andorov - Set Data TYPE_GENERAL_ANDOROV to NOT_STARTED'),
(1547101, 0, 0, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lieutenant General Andorov - Set Phase to 0');
DELETE FROM `creature_ai_scripts` WHERE `id`=1547102;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1547102, 0, 0, 1, 45, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lieutenant General Andorov - Set Emote State to Ready 1H');
DELETE FROM `creature_ai_scripts` WHERE `id`=1547103;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1547103, 0, 0, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -8870.721, 1648.401, 21.51133, 5.637414, 0, 'Lieutenant General Andorov - Set Home Position');
DELETE FROM `creature_ai_scripts` WHERE `id`=1547104;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1547104, 0, 0, 4, 46, 512, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lieutenant General Andorov - Set Immune to NPC Flag');
DELETE FROM `creature_ai_scripts` WHERE `id`=1547105;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1547105, 0, 0, 39, 1547105, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Lieutenant General Andorov - Start Script to Despawn');
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (154710, 'Ruins of Ahn\'Qiraj - Lieutenant General Andorov', 22591, 100, 1, 0, 0, 0, 9, 13, 10, 14, 0, 25515, 100, 1, 0, 0, 0, 25, 29, 25, 45, 0, 25516, 100, 0, 0, 0, 0, 9, 13, 30, 32, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
UPDATE `creature_template` SET `npc_flags`=1, `spell_list_id`=154710 WHERE `entry`=15471;

-- 301315: Source's Guid Is 301315
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (301315, 52, 301315, 0, 0, 0, 0);
-- 301314: Source's Guid Is 301314
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (301314, 52, 301314, 0, 0, 0, 0);
-- 301313: Source's Guid Is 301313
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (301313, 52, 301313, 0, 0, 0, 0);
-- 301312: Source's Guid Is 301312
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (301312, 52, 301312, 0, 0, 0, 0);

-- Events list for Kaldorei Elite
DELETE FROM `creature_ai_events` WHERE `creature_id`=15473;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(1547301, 15473, 0, 6, 0, 100, 0, 0, 0, 0, 0, 1547301, 0, 0, 'Kaldorei Elite - Set Home Position on Death');
DELETE FROM `creature_ai_scripts` WHERE `id`=1547301;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1547301, 0, 0, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -8873.13, 1645.21, 21.5113, 5.44, 301315, 'Kaldorei Elite - Set Home Position'),
(1547301, 0, 0, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -8871.92, 1646.8, 21.5113, 5.78, 301314, 'Kaldorei Elite - Set Home Position'),
(1547301, 0, 0, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -8869.52, 1650, 21.5113, 5.48, 301313, 'Kaldorei Elite - Set Home Position'),
(1547301, 0, 0, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -8868.31, 1651.6, 21.5113, 5.45, 301312, 'Kaldorei Elite - Set Home Position');
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (154730, 'Ruins of Ahn\'Qiraj - Kaldorei Elite', 16856, 100, 1, 0, 0, 0, 5, 15, 5, 15, 0, 26350, 100, 1, 0, 0, 0, 10, 30, 10, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
UPDATE `creature_template` SET `spell_list_id`=154730 WHERE `entry`=15473;

-- These texts should be yelled.
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry` IN (11028, 11477, 11012, 11032, 11560);
UPDATE `broadcast_text` SET `emote_id1`=5 WHERE `entry`=11560;

-- Spawn waypoints for Lieutenant General Andorov.
DELETE FROM `creature_movement_template` WHERE `entry`=15471;
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(15471, 1, -8638.661133, 1486.667725, 32.808559, 100.000000, 0, 0.000000, 0),
(15471, 2, -8652.152344, 1500.827148, 32.665638, 100.000000, 0, 0.000000, 0),
(15471, 3, -8668.321289, 1520.756958, 32.007122, 100.000000, 0, 0.000000, 0),
(15471, 4, -8694.014648, 1552.808838, 32.086586, 100.000000, 0, 0.000000, 0),
(15471, 5, -8710.787109, 1571.019775, 26.510817, 100.000000, 0, 0.000000, 0),
(15471, 6, -8737.693359, 1596.180664, 21.580246, 100.000000, 0, 0.000000, 0),
(15471, 7, -8771.529297, 1614.135498, 21.579346, 100.000000, 0, 0.000000, 0),
(15471, 8, -8809.159180, 1622.420776, 20.155216, 100.000000, 0, 0.000000, 0),
(15471, 9, -8845.422852, 1633.813477, 19.799856, 100.000000, 1000, 0.000000, 0),
(15471, 10, -8870.720703, 1648.400879, 21.511328, 5.637414, 1000, 0.000000, 1547101),
(15471, 11, -8870.720703, 1648.400879, 21.511328, 5.637414, 0, 0.000000, 0);
DELETE FROM `creature_movement_scripts` WHERE `id`=1547101;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1547101, 0, 0, 20, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lieutenant General Andorov - Move Idle'),
(1547101, 0, 0, 34, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lieutenant General Andorov - Set Home Position'),
(1547101, 0, 0, 84, 6629, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lieutenant General Andorov - Set Gossip Menu'),
(1547101, 0, 1, 3, 0, 0, 2, 0, 301315, 0, 9, 2, 0, 0, 0, 0, -8873.13, 1645.21, 21.5113, 5.44, 0, 'Kaldorei Elite - Move to Furthest Right Position'),
(1547101, 0, 1, 34, 0, 0, 0, 0, 301315, 0, 9, 2, 0, 0, 0, 0, -8873.13, 1645.21, 21.5113, 5.44, 0, 'Kaldorei Elite - Set Home Position to Furthest Right'),
(1547101, 0, 2, 3, 0, 0, 2, 0, 301314, 0, 9, 2, 0, 0, 0, 0, -8871.92, 1646.8, 21.5113, 5.78, 0, 'Kaldorei Elite - Move to Nearest Right Position'),
(1547101, 0, 2, 34, 0, 0, 0, 0, 301314, 0, 9, 2, 0, 0, 0, 0, -8871.92, 1646.8, 21.5113, 5.78, 0, 'Kaldorei Elite - Set Home Position to Nearest Right'),
(1547101, 0, 3, 3, 0, 0, 2, 0, 301313, 0, 9, 2, 0, 0, 0, 0, -8869.52, 1650, 21.5113, 5.48, 0, 'Kaldorei Elite - Move to Nearest Left Position'),
(1547101, 0, 3, 34, 0, 0, 0, 0, 301313, 0, 9, 2, 0, 0, 0, 0, -8869.52, 1650, 21.5113, 5.48, 0, 'Kaldorei Elite - Set Home Position to Nearest Left'),
(1547101, 0, 4, 3, 0, 0, 2, 0, 301312, 0, 9, 2, 0, 0, 0, 0, -8868.31, 1651.6, 21.5113, 5.45, 0, 'Kaldorei Elite - Move to Furthest Left Position'),
(1547101, 0, 4, 34, 0, 0, 0, 0, 301312, 0, 9, 2, 0, 0, 0, 0, -8868.31, 1651.6, 21.5113, 5.45, 0, 'Kaldorei Elite - Set Home Position to Furthest Left');

-- Script upon talking to Lieutenant General Andorov.
DELETE FROM `gossip_scripts` WHERE `id`=6629;
INSERT INTO `gossip_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(6629, 0, 0, 39, 154710, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Lieutenant General Andorov - Start Script to Start Andorov Event');
DELETE FROM `generic_scripts` WHERE `id`=154710;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(154710, 0, 0, 37, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lieutenant General Andorov - Set Data TYPE_GENERAL_ANDOROV to IN_PROGRESS'),
(154710, 0, 2, 1, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lieutenant General Andorov - Emote Shout'),
(154710, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11028, 0, 0, 0, 0, 0, 0, 0, 0, 'Lieutenant General Andorov - Say Text'),
(154710, 2, 0, 60, 3, 0, 0, 0, 0, 0, 0, 0, 0, 15471, 0, 0, 0, 0, 0, 0, 0, 'Lieutenant General Andorov - Move Waypoint'),
(154710, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11477, 0, 0, 0, 0, 0, 0, 0, 0, 'Lieutenant General Andorov - Say Text');

-- Event waypoints for Lieutenant General Andorov.
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(15471, 1, -8881.382813, 1611.213135, 21.441124, 100.000000, 0, 0.000000, 0),
(15471, 2, -8894.543945, 1589.428223, 21.454288, 100.000000, 0, 0.000000, 0),
(15471, 3, -8916.958008, 1557.906372, 21.431034, 100.000000, 0, 0.000000, 0),
(15471, 4, -8939.951172, 1551.126953, 21.566868, 100.000000, 5000, 0.000000, 1547102),
(15471, 5, -8939.951172, 1551.126953, 21.566868, 2.877214, 10000, 0.000000, 1547103),
(15471, 6, -8939.951172, 1551.126953, 21.566868, 2.877214, 0, 0.000000, 0);
DELETE FROM `creature_movement_scripts` WHERE `id`=1547102;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1547102, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11012, 0, 0, 0, 0, 0, 0, 0, 0, 'Lieutenant General Andorov - Say Text'),
(1547102, 2, 0, 1, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lieutenant General Andorov - Emote Shout');
DELETE FROM `creature_movement_scripts` WHERE `id`=1547103;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1547103, 0, 0, 1, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lieutenant General Andorov - Emote Point'),
(1547103, 0, 1, 34, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lieutenant General Andorov - Set Home Position'),
(1547103, 0, 2, 20, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lieutenant General Andorov - Move Idle'),
(1547103, 0, 3, 3, 0, 0, 0, 0, 301312, 0, 9, 2, 0, 0, 0, 0, -8937.8, 1556.23, 21.4079, 2.97824, 0, 'Kaldorei Elite - Move to Furthest Right Position'),
(1547103, 0, 4, 34, 0, 0, 0, 0, 301312, 0, 9, 2, 0, 0, 0, 0, -8937.8, 1556.23, 21.4079, 2.97824, 0, 'Kaldorei Elite - Set Home Position to Furthest Right'),
(1547103, 0, 5, 3, 0, 0, 0, 0, 301313, 0, 9, 2, 0, 0, 0, 0, -8939.17, 1554.02, 21.5905, 2.89695, 0, 'Kaldorei Elite - Move to Nearest Right Position'),
(1547103, 0, 6, 34, 0, 0, 0, 0, 301313, 0, 9, 2, 0, 0, 0, 0, -8939.17, 1554.02, 21.5905, 2.89695, 0, 'Kaldorei Elite - Set Home Position to Nearest Right'),
(1547103, 0, 7, 3, 0, 0, 0, 0, 301314, 0, 9, 2, 0, 0, 0, 0, -8940.74, 1548.23, 21.6848, 2.6754, 0, 'Kaldorei Elite - Move to Nearest Left Position'),
(1547103, 0, 8, 34, 0, 0, 0, 0, 301314, 0, 9, 2, 0, 0, 0, 0, -8940.74, 1548.23, 21.6848, 2.6754, 0, 'Kaldorei Elite - Set Home Position to Nearest Left'),
(1547103, 0, 9, 3, 0, 0, 0, 0, 301315, 0, 9, 2, 0, 0, 0, 0, -8941.52, 1545.34, 21.8723, 2.96206, 0, 'Kaldorei Elite - Move to Furthest Left Position'),
(1547103, 0, 10, 34, 0, 0, 0, 0, 301315, 0, 9, 2, 0, 0, 0, 0, -8941.52, 1545.34, 21.8723, 2.96206, 0, 'Kaldorei Elite - Set Home Position to Furthest Left'),
(1547103, 6, 0, 1, 45, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lieutenant General Andorov - Emote Ready 1H'),
(1547103, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11032, 0, 0, 0, 0, 0, 0, 0, 0, 'Lieutenant General Andorov - Say Text'),
(1547103, 8, 0, 1, 333, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lieutenant General Andorov - Emote State Ready 1H'),
(1547103, 8, 0, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lieutenant General Andorov - Set Phase to 1'),
(1547103, 12, 0, 39, 153911, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Lieutenant General Andorov - Start Script to Start Wave 1');

-- Failure conditions for Andorov Event targets.
-- 1100: (116: Target Is Alive) And (117:  Not (Target Is In Combat))
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (1100, -1, 116, 117, 0, 0, 0);

-- Andorov Event Failed Script
DELETE FROM `generic_scripts` WHERE `id`=153912;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(153912, 0, 0, 37, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Andorov Event Failed: Set Data TYPE_GENERAL_ANDOROV to FAIL'),
(153912, 0, 0, 71, 0, 0, 0, 0, 301057, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Andorov Event Failed: Respawn Captain Qeez'),
(153912, 0, 0, 71, 0, 0, 0, 0, 301058, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Andorov Event Failed: Respawn Captain Tuubid'),
(153912, 0, 0, 71, 0, 0, 0, 0, 301168, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Andorov Event Failed: Respawn Captain Drenn'),
(153912, 0, 0, 71, 0, 0, 0, 0, 301172, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Andorov Event Failed: Respawn Captain Xurrem'),
(153912, 0, 0, 71, 0, 0, 0, 0, 301169, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Andorov Event Failed: Respawn Major Yeggeth'),
(153912, 0, 0, 71, 0, 0, 0, 0, 301171, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Andorov Event Failed: Respawn Major Pakkon'),
(153912, 0, 0, 71, 0, 0, 0, 0, 301170, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Andorov Event Failed: Respawn Colonel Zerran'),
(153912, 0, 0, 34, 0, 0, 0, 0, 301311, 0, 9, 2, 0, 0, 0, 0, -8870.721, 1648.401, 21.51133, 5.637414, 0, 'Lieutenant General Andorov - Set Home Position'),
(153912, 0, 0, 34, 0, 0, 0, 0, 301312, 0, 9, 2, 0, 0, 0, 0, -8868.31, 1651.6, 21.5113, 5.45, 0, 'Kaldorei Elite - Set Home Position'),
(153912, 0, 0, 34, 0, 0, 0, 0, 301313, 0, 9, 2, 0, 0, 0, 0, -8869.52, 1650, 21.5113, 5.48, 0, 'Kaldorei Elite - Set Home Position'),
(153912, 0, 0, 34, 0, 0, 0, 0, 301314, 0, 9, 2, 0, 0, 0, 0, -8871.92, 1646.8, 21.5113, 5.78, 0, 'Kaldorei Elite - Set Home Position'),
(153912, 0, 0, 34, 0, 0, 0, 0, 301315, 0, 9, 2, 0, 0, 0, 0, -8873.13, 1645.21, 21.5113, 5.44, 0, 'Kaldorei Elite - Set Home Position'),
(153912, 1, 0, 90, 154711, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Andorov Event Failed: Lieutenant General Andorov - Despawn');
DELETE FROM `generic_scripts` WHERE `id`=154711;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(154711, 0, 0, 18, 0, 900, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lieutenant General Andorov and Kaldorei Elite - Despawn with 15 min respawn time');

-- Wave 1 Scripts (Captain Qeez)

-- Success condition.
-- 15391: Extra Targets Of Scripted Map Event 15391 Satisfy Condition (121:  Not (Target Is Alive))
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (15391, 47, 15391, 121, 0, 0, 0);

DELETE FROM `generic_scripts` WHERE `id`=153910;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(153910, 0, 0, 49, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Captain Qeez Group - Enter Combat with Zone'),
(153910, 0, 1, 63, 15391, 0, 0, 0, 0, 0, 0, 0, 1100, 0, 0, 0, 0, 0, 0, 0, 0, 'Captain Qeez Group - Add To Scripted Map Event');
DELETE FROM `generic_scripts` WHERE `id`=153911;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(153911, 0, 0, 61, 15391, 180, 0, 0, 0, 0, 0, 0, 0, 153912, 0, 153921, 0, 0, 0, 0, 0, 'Lieutenant General Andorov - Start Scripted Map Event'),
(153911, 0, 1, 90, 153910, 0, 0, 0, 301057, 0, 9, 2, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Captain Qeez - Start Script on Group'),
(153911, 1, 0, 69, 15391, 0, 0, 0, 0, 0, 0, 0, 0, 153912, 15391, 153921, 0, 0, 0, 0, 0, 'Lieutenant General Andorov - Edit Scripted Map Event');

-- Wave 2 Scripts (Captain Tuubid)

-- 15392: Extra Targets Of Scripted Map Event 15392 Satisfy Condition (121:  Not (Target Is Alive))
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (15392, 47, 15392, 121, 0, 0, 0);

DELETE FROM `generic_scripts` WHERE `id`=153920;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(153920, 0, 0, 49, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Captain Tuubid Group - Enter Combat with Zone'),
(153920, 0, 1, 63, 15392, 0, 0, 0, 0, 0, 0, 0, 1100, 0, 0, 0, 0, 0, 0, 0, 0, 'Captain Tuubid Group - Add To Scripted Map Event');
DELETE FROM `generic_scripts` WHERE `id`=153921;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(153921, 0, 0, 16, 8637, 4, 0, 0, 90871, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Andorov Wave 1 Success: General Rajaxx - Play Sound'),
(153921, 0, 0, 61, 15392, 180, 0, 0, 0, 0, 0, 0, 0, 153912, 0, 153891, 0, 0, 0, 0, 0, 'Andorov Wave 1 Success: Start Scripted Map Event'),
(153921, 0, 1, 90, 153920, 0, 0, 0, 301058, 0, 9, 2, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Andorov Wave 1 Success: Captain Tuubid - Start Script on Group'),
(153921, 1, 0, 69, 15392, 0, 0, 0, 0, 0, 0, 0, 0, 153912, 15392, 153891, 0, 0, 0, 0, 0, 'Andorov Wave 1 Success: Edit Scripted Map Event');

-- Wave 3 Scripts (Captain Drenn)

-- 15389: Extra Targets Of Scripted Map Event 15389 Satisfy Condition (121:  Not (Target Is Alive))
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (15389, 47, 15389, 121, 0, 0, 0);

-- The time of our retribution is at hand! Let darkness reign in the hearts of our enemies!
UPDATE `broadcast_text` SET `chat_type`=6, `sound_id`=8645 WHERE `entry`=11440;

DELETE FROM `generic_scripts` WHERE `id`=153890;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(153890, 0, 0, 49, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Captain Drenn Group - Enter Combat with Zone'),
(153890, 0, 1, 63, 15389, 0, 0, 0, 0, 0, 0, 0, 1100, 0, 0, 0, 0, 0, 0, 0, 0, 'Captain Drenn Group - Add To Scripted Map Event');
DELETE FROM `generic_scripts` WHERE `id`=153891;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(153891, 0, 0, 0, 0, 0, 0, 0, 90871, 0, 9, 2, 11440, 0, 0, 0, 0, 0, 0, 0, 0, 'Andorov Wave 2 Success: General Rajaxx - Say Text'),
(153891, 0, 0, 61, 15389, 180, 0, 0, 0, 0, 0, 0, 0, 153912, 0, 153901, 0, 0, 0, 0, 0, 'Andorov Wave 2 Success: Start Scripted Map Event'),
(153891, 0, 1, 90, 153890, 0, 0, 0, 301168, 0, 9, 2, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Andorov Wave 2 Success: Captain Drenn - Start Script on Group'),
(153891, 1, 0, 69, 15389, 0, 0, 0, 0, 0, 0, 0, 0, 153912, 15389, 153901, 0, 0, 0, 0, 0, 'Andorov Wave 2 Success: Edit Scripted Map Event');

-- Wave 4 Scripts (Captain Xurrem)

-- 15390: Extra Targets Of Scripted Map Event 15390 Satisfy Condition (121:  Not (Target Is Alive))
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (15390, 47, 15390, 121, 0, 0, 0);

-- No longer will we wait behind barred doors and walls of stone! No longer will our vengeance be denied! The dragons themselves will tremble before our wrath!
UPDATE `broadcast_text` SET `chat_type`=6, `sound_id`=8644 WHERE `entry`=11439;

DELETE FROM `generic_scripts` WHERE `id`=153900;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(153900, 0, 0, 49, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Captain Xurrem Group - Enter Combat with Zone'),
(153900, 0, 1, 63, 15390, 0, 0, 0, 0, 0, 0, 0, 1100, 0, 0, 0, 0, 0, 0, 0, 0, 'Captain Xurrem Group - Add To Scripted Map Event');
DELETE FROM `generic_scripts` WHERE `id`=153901;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(153901, 0, 0, 0, 0, 0, 0, 0, 90871, 0, 9, 2, 11439, 0, 0, 0, 0, 0, 0, 0, 0, 'Andorov Wave 3 Success: General Rajaxx - Say Text'),
(153901, 0, 0, 61, 15390, 180, 0, 0, 0, 0, 0, 0, 0, 153912, 0, 153861, 0, 0, 0, 0, 0, 'Andorov Wave 3 Success: Start Scripted Map Event'),
(153901, 0, 1, 90, 153900, 0, 0, 0, 301172, 0, 9, 2, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Andorov Wave 3 Success: Captain Xurrem - Start Script on Group'),
(153901, 1, 0, 69, 15390, 0, 0, 0, 0, 0, 0, 0, 0, 153912, 15390, 153861, 0, 0, 0, 0, 0, 'Andorov Wave 3 Success: Edit Scripted Map Event');

-- Wave 5 Scripts (Major Yeggeth)

-- 15386: Extra Targets Of Scripted Map Event 15386 Satisfy Condition (121:  Not (Target Is Alive))
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (15386, 47, 15386, 121, 0, 0, 0);

-- Fear is for the enemy! Fear and death!
UPDATE `broadcast_text` SET `chat_type`=6, `sound_id`=8643 WHERE `entry`=11438;

DELETE FROM `generic_scripts` WHERE `id`=153860;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(153860, 0, 0, 49, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Major Yeggeth Group - Enter Combat with Zone'),
(153860, 0, 1, 63, 15386, 0, 0, 0, 0, 0, 0, 0, 1100, 0, 0, 0, 0, 0, 0, 0, 0, 'Major Yeggeth Group - Add To Scripted Map Event');
DELETE FROM `generic_scripts` WHERE `id`=153861;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(153861, 0, 0, 0, 0, 0, 0, 0, 90871, 0, 9, 2, 11438, 0, 0, 0, 0, 0, 0, 0, 0, 'Andorov Wave 4 Success: General Rajaxx - Say Text'),
(153861, 0, 0, 61, 15386, 180, 0, 0, 0, 0, 0, 0, 0, 153912, 0, 153881, 0, 0, 0, 0, 0, 'Andorov Wave 4 Success: Start Scripted Map Event'),
(153861, 0, 1, 90, 153860, 0, 0, 0, 301169, 0, 9, 2, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Andorov Wave 4 Success: Major Yeggeth - Start Script on Group'),
(153861, 1, 0, 69, 15386, 0, 0, 0, 0, 0, 0, 0, 0, 153912, 15386, 153881, 0, 0, 0, 0, 0, 'Andorov Wave 4 Success: Edit Scripted Map Event');

-- Wave 6 Scripts (Major Pakkon)

-- 15388: Extra Targets Of Scripted Map Event 15388 Satisfy Condition (121:  Not (Target Is Alive))
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (15388, 47, 15388, 121, 0, 0, 0);

-- Staghelm will whimper and beg for his life, just as his whelp of a son did! One thousand years of injustice will end this day!
UPDATE `broadcast_text` SET `chat_type`=6, `sound_id`=8642 WHERE `entry`=11437;

DELETE FROM `generic_scripts` WHERE `id`=153880;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(153880, 0, 0, 49, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Major Pakkon Group - Enter Combat with Zone'),
(153880, 0, 1, 63, 15388, 0, 0, 0, 0, 0, 0, 0, 1100, 0, 0, 0, 0, 0, 0, 0, 0, 'Major Pakkon Group - Add To Scripted Map Event');
DELETE FROM `generic_scripts` WHERE `id`=153881;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(153881, 0, 0, 0, 0, 0, 0, 0, 90871, 0, 9, 2, 11437, 0, 0, 0, 0, 0, 0, 0, 0, 'Andorov Wave 5 Success: General Rajaxx - Say Text'),
(153881, 0, 0, 61, 15388, 180, 0, 0, 0, 0, 0, 0, 0, 153912, 0, 153851, 0, 0, 0, 0, 0, 'Andorov Wave 5 Success: Start Scripted Map Event'),
(153881, 0, 1, 90, 153880, 0, 0, 0, 301171, 0, 9, 2, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Andorov Wave 5 Success: Major Pakkon - Start Script on Group'),
(153881, 1, 0, 69, 15388, 0, 0, 0, 0, 0, 0, 0, 0, 153912, 15388, 153851, 0, 0, 0, 0, 0, 'Andorov Wave 5 Success: Edit Scripted Map Event');

-- Wave 7 Scripts (Colonel Zerran)

-- 15385: Extra Targets Of Scripted Map Event 15385 Satisfy Condition (121:  Not (Target Is Alive))
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (15385, 47, 15385, 121, 0, 0, 0);

-- Fandral! Your time has come! Go and hide in the Emerald Dream and pray we never find you!
UPDATE `broadcast_text` SET `chat_type`=6, `sound_id`=8641 WHERE `entry`=11436;

DELETE FROM `generic_scripts` WHERE `id`=153850;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(153850, 0, 0, 49, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Colonel Zerran Group - Enter Combat with Zone'),
(153850, 0, 1, 63, 15385, 0, 0, 0, 0, 0, 0, 0, 1100, 0, 0, 0, 0, 0, 0, 0, 0, 'Colonel Zerran Group - Add To Scripted Map Event');
DELETE FROM `generic_scripts` WHERE `id`=153851;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(153851, 0, 0, 0, 0, 0, 0, 0, 90871, 0, 9, 2, 11436, 0, 0, 0, 0, 0, 0, 0, 0, 'Andorov Wave 6 Success: General Rajaxx - Say Text'),
(153851, 0, 0, 61, 15385, 180, 0, 0, 0, 0, 0, 0, 0, 153912, 0, 153411, 0, 0, 0, 0, 0, 'Andorov Wave 6 Success: Start Scripted Map Event'),
(153851, 0, 1, 90, 153850, 0, 0, 0, 301170, 0, 9, 2, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Andorov Wave 6 Success: Colonel Zerran - Start Script on Group'),
(153851, 1, 0, 69, 15385, 0, 0, 0, 0, 0, 0, 0, 0, 153912, 15385, 153411, 0, 0, 0, 0, 0, 'Andorov Wave 6 Success: Edit Scripted Map Event');

-- Wave 8 Scripts (General Rajaxx)

-- Impudent fool! I will kill you myself!
UPDATE `broadcast_text` SET `chat_type`=6, `sound_id`=8638 WHERE `entry`=11435;

DELETE FROM `generic_scripts` WHERE `id`=153410;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(153410, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11435, 0, 0, 0, 0, 0, 0, 0, 0, 'General Rajaxx - Say Text'),
(153410, 1, 0, 49, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'General Rajaxx - Enter Combat with Zone');
DELETE FROM `generic_scripts` WHERE `id`=153411;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(153411, 0, 0, 39, 153410, 0, 0, 0, 90871, 0, 9, 2, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Andorov Wave 7 Success: General Rajaxx - Start Script'),
(153411, 0, 0, 37, 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Andorov Wave 7 Success: Set Data TYPE_GENERAL_ANDOROV to DONE'),
(153411, 0, 0, 44, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Andorov Wave 7 Success: Lieutenant General Andorov - Set Phase to 2');

-- Despawn script for Lieutenant General Andorov.
DELETE FROM `generic_scripts` WHERE `id`=1547105;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1547105, 0, 0, 4, 147, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lieutenant General Andorov - Remove Gossip Flag'),
(1547105, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11560, 0, 0, 0, 0, 0, 0, 0, 0, 'Lieutenant General Andorov - Say Text'),
(1547105, 3, 0, 3, 0, 3967, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -8969.76, 1547.85, 22.0191, 0, 0, 'Lieutenant General Andorov - Move'),
(1547105, 7, 0, 3, 0, 6114, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -8941.51, 1552.21, 21.7021, 0, 0, 'Lieutenant General Andorov - Move'),
(1547105, 12, 0, 3, 0, 4472, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -8917.92, 1563.85, 21.4079, 0, 0, 'Lieutenant General Andorov - Move'),
(1547105, 15, 0, 3, 0, 6462, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -8888.59, 1593.67, 21.4053, 0, 0, 'Lieutenant General Andorov - Move'),
(1547105, 20, 0, 90, 154712, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Lieutenant General Andorov - Despawn Creature');
DELETE FROM `generic_scripts` WHERE `id`=154712;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(154712, 0, 0, 18, 0, 345600, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lieutenant General Andorov and Kaldorei Elite - Despawn with 4 day respawn time');

-- Assign sounds and set chat type for Rajaxx texts.
UPDATE `broadcast_text` SET `chat_type`=6, `sound_id`=8640 WHERE `entry`=11434;
UPDATE `broadcast_text` SET `chat_type`=6, `sound_id`=8639 WHERE `entry`=11433;
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=11429;
UPDATE `broadcast_text` SET `chat_type`=6 WHERE `entry`=11660;

-- Delete no longer needed custom table texts.
DELETE FROM `script_texts` WHERE `entry` IN (-1509003, -1509029, -1509030, -1509004, -1509005, -1509006, -1509007, -1509008, -1509009, -1509010, -1509011, -1509012, -1509013, -1509014, -1509015, -1509016, -1509017);

-- 509: Current Map Id Is 509
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (509, 33, 509, 0, 0, 0, 0);

-- Events list for General Rajaxx
DELETE FROM `creature_ai_events` WHERE `creature_id`=15341;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1534101, 15341, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1534101, 0, 0, 'General Rajaxx - Set Instance Data on Aggro');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1534102, 15341, 0, 6, 0, 100, 0, 0, 0, 0, 0, 1534102, 0, 0, 'General Rajaxx - Set Instance Data on Death');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1534103, 15341, 0, 2, 0, 100, 0, 30, 1, 0, 0, 1534103, 0, 0, 'General Rajaxx - Enrage at 30% HP');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1534104, 15341, 0, 5, 0, 100, 1, 30000, 30000, 0, 0, 1534104, 0, 0, 'General Rajaxx - Say Text on Killed Unit');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1534105, 15341, 991, 11, 0, 100, 1, 0, 0, 0, 0, 1534105, 0, 0, 'General Rajaxx - Say Text on Spawn in Kalimdor');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1534106, 15341, 509, 11, 0, 100, 1, 0, 0, 0, 0, 1534106, 0, 0, 'General Rajaxx - Sat Faction on Spawn in Ahn\'Qiraj');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1534107, 15341, 509, 7, 0, 100, 0, 0, 0, 0, 0, 1534107, 0, 0, 'General Rajaxx - Say Text on Evade');
DELETE FROM `creature_ai_scripts` WHERE `id`=1534101;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1534101, 0, 0, 37, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'General Rajaxx - Set Data TYPE_RAJAXX to IN_PROGRESS'),
(1534101, 0, 0, 49, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'General Rajaxx - Set in Combat with Zone');
DELETE FROM `creature_ai_scripts` WHERE `id`=1534102;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1534102, 0, 0, 37, 2, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'General Rajaxx - Set Data TYPE_RAJAXX to DONE'),
(1534102, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11434, 0, 0, 0, 0, 0, 0, 0, 0, 'General Rajaxx - Say Text on Death');
DELETE FROM `creature_ai_scripts` WHERE `id`=1534103;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1534103, 0, 0, 15, 8269, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'General Rajaxx - Cast Spell Enrage'),
(1534103, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2384, 0, 0, 0, 0, 0, 0, 0, 0, 'General Rajaxx - Say Emoted Text');
DELETE FROM `creature_ai_scripts` WHERE `id`=1534104;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1534104, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11433, 0, 0, 0, 0, 0, 0, 0, 0, 'General Rajaxx - Say Text');
DELETE FROM `creature_ai_scripts` WHERE `id`=1534105;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1534105, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11429, 0, 0, 0, 0, 0, 0, 0, 0, 'General Rajaxx - Say Text'),
(1534105, 0, 0, 59, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'General Rajaxx - Set React State to Passive'),
(1534105, 0, 0, 52, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'General Rajaxx - Set Invincibility');
DELETE FROM `creature_ai_scripts` WHERE `id`=1534106;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1534106, 0, 0, 22, 310, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'General Rajaxx - Sat Faction to Silithid');
DELETE FROM `creature_ai_scripts` WHERE `id`=1534107;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1534107, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11660, 0, 0, 0, 0, 0, 0, 0, 0, 'General Rajaxx - Say Text');
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (153410, 'Ruins of Ahn\'Qiraj - General Rajaxx', 25599, 100, 1, 0, 0, 64, 8, 8, 22, 25, 0, 6713, 100, 1, 0, 0, 0, 5, 5, 15, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
UPDATE `creature_template` SET `faction`=16, `unit_flags`=64, `auras`='18943', `spawn_spell_id`=12980, `spell_list_id`=153410, `ai_name`='EventAI', `script_name`='' WHERE `entry`=15341;
UPDATE `creature_onkill_reputation` SET `RewOnKillRepFaction2`=0, `MaxStanding2`=0, `RewOnKillRepValue2`=0 WHERE  `creature_id`=15341;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
