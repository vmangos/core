DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20240201070527');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20240201070527');
-- Add your query below.


-- Mark of Didier should not be removed on evade.
UPDATE `spell_template` SET `customFlags`=(`customFlags` | 0x400) WHERE `entry`=28114;

-- Gossip menu for Guard Didier before escort starts.
INSERT INTO `npc_text` (`ID`, `BroadcastTextID0`, `Probability0`, `BroadcastTextID1`, `Probability1`, `BroadcastTextID2`, `Probability2`, `BroadcastTextID3`, `Probability3`, `BroadcastTextID4`, `Probability4`, `BroadcastTextID5`, `Probability5`, `BroadcastTextID6`, `Probability6`, `BroadcastTextID7`, `Probability7`) VALUES (8435, 12110, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (7165, 8435, 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=7165, `npc_flags`=1 WHERE `entry`=16226;

-- Gossip menu for Guard Didier when escort is over.
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (7167, 8437, 0, 0);

-- Assign script to Guard Didier.
UPDATE `creature_template` SET `spell_list_id`=162260, `ai_name`='', `script_name`='npc_guard_didier', `flags_extra`=(`flags_extra` | 0x01000000) WHERE `entry`=16226;
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (162260, 'Eastern Plaguelands - Guard Didier', 22120, 100, 4, 0, 0, 0, 0, 0, 30, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- Add Caravan Mule spawns.
INSERT INTO `creature` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `wander_distance`, `movement_type`, `spawntimesecsmin`, `spawntimesecsmax`, `spawn_flags`) VALUES 
(160009, 16232, 0, 2305.88, -5290.34, 82.3359, 1.8326, 0, 0, 14400, 14400, 1), -- 193
(160010, 16232, 0, 2308.86, -5290.45, 82.1197, 1.79769, 0, 0, 14400, 14400, 1), -- 194
(160011, 16232, 0, 2306.39, -5294.27, 82.0796, 1.81514, 0, 0, 14400, 14400, 1), -- 195
(160012, 16232, 0, 2309.44, -5294.44, 82.0796, 1.72788, 0, 0, 14400, 14400, 1), -- 196
(160013, 16232, 0, 2308.2, -5297.16, 82.0796, 1.78024, 0, 0, 14400, 14400, 1); -- 197

-- Assign script to Caravan Mules.
UPDATE `creature_template` SET `ai_name`='', `script_name`='npc_caravan_mule', `flags_extra`=(`flags_extra` & ~2) WHERE `entry`=16232;

-- Removing unused script actions.
DELETE FROM `creature_ai_scripts` WHERE `id` IN (1623201);
DELETE FROM `creature_ai_events` WHERE `creature_id`=16232;
DELETE FROM `creature_ai_scripts` WHERE `id` IN (1622601, 1622602);
DELETE FROM `creature_ai_events` WHERE `creature_id`=16226;

-- Guard Didier should use waypoint movement and has 4 hours respawn time.
UPDATE `creature` SET `position_x`=2305.295166, `position_y`=-5286.123535, `position_z`=82.061813, `movement_type`=2, `spawn_flags`=1, `spawntimesecsmin`=14400, `spawntimesecsmax`=14400 WHERE `id`=16226;

-- Creature group for Guard Didier and Caravan Mules.
INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES (1383, 1383, 0, 0, 79);
INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES (1383, 160010, 4, 3.44, 79);
INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES (1383, 160009, 4, 2.84, 79);
INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES (1383, 160011, 7, 2.84, 79);
INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES (1383, 160012, 7, 3.44, 79);
INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES (1383, 160013, 9, 3.14, 79);

-- Waypoint script for Guard Didier.
DELETE FROM `creature_movement_scripts` WHERE `id`=1622601;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1622601, 7, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Didier - Emote OneShotTalk'),
(1622601, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12105, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Didier - Say Text'),
(1622601, 8, 1, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Didier - Emote OneShotExclamation'),
(1622601, 12, 1, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Didier - Emote OneShotExclamation'),
(1622601, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12113, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Didier - Say Text');
DELETE FROM `creature_movement_scripts` WHERE `id`=1622602;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1622602, 1, 1, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Didier - Emote OneShotPoint'),
(1622602, 5, 4, 147, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Didier - Remove Npc Flags');
DELETE FROM `creature_movement_scripts` WHERE `id`=1622606;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1622606, 0, 0, 15, 28114, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Didier - Cast Spell Mark of Didier'),
(1622606, 0, 0, 90, 28114, 0, 0, 0, 0, 0, 0, 4, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Didier - Start Script on Group');
DELETE FROM `generic_scripts` WHERE `id`=28114;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(28114, 0, 0, 15, 28114, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Caravan Mule - Cast Spell Mark of Didier');
DELETE FROM `creature_movement_scripts` WHERE `id`=1622653;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1622653, 0, 0, 4, 147, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Didier - Add NPC Flags'),
(1622653, 0, 1, 84, 7167, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Didier - Set Gossip Menu'),
(1622653, 0, 2, 20, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Didier - Move Idle'),
(1622653, 0, 3, 34, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Didier - Set Home Position'),
(1622653, 0, 4, 14, 28114, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Didier - Remove Aura Mark of Didier'),
(1622653, 0, 5, 90, 28115, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Didier - Start Script on Group'),
(1622653, 1, 0, 3, 0, 1548, 1, 2, 160011, 0, 9, 2, 0, 0, 0, 0, 2675, -4017.87, 95.6268, 6.22968, 0, 'Caravan Mule - Move'),
(1622653, 1, 1, 3, 0, 1478, 1, 2, 160012, 0, 9, 2, 0, 0, 0, 0, 2675.11, -4020.95, 95.1401, 6.22105, 0, 'Caravan Mule - Move'),
(1622653, 1, 2, 3, 0, 1474, 1, 2, 160013, 0, 9, 2, 0, 0, 0, 0, 2677.01, -4023.39, 93.913, 6.28202, 0, 'Caravan Mule - Move'),
(1622653, 1, 3, 3, 0, 1482, 0, 2, 160009, 0, 9, 2, 0, 0, 0, 0, 2679.63, -4014.25, 95.2028, 0.23073, 0, 'Caravan Mule - Move'),
(1622653, 1, 4, 3, 0, 1528, 1, 2, 160010, 0, 9, 2, 0, 0, 0, 0, 2676.73, -4015.3, 95.8655, 0.030702, 0, 'Caravan Mule - Move'),
(1622653, 300, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Didier - Remove Quest Giver Flag'),
(1622653, 300, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12128, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Didier - Say Text'),
(1622653, 300, 2, 1, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Didier - Emote Exclamation'),
(1622653, 600, 0, 10, 16254, 660000, 0, 0, 0, 0, 0, 0, 3, 0, -1, 1, 2853.93, -3872.1, 108.221, 4.13643, 0, 'Guard Didier - Summon Creature Field Marshal Chambers');
DELETE FROM `generic_scripts` WHERE `id`=28115;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(28115, 0, 0, 14, 28114, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Caravan Mule - Remove Aura Mark of Didier');

-- Waypoints for Guard Didier.
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(16226, 1, 2305.295166, -5286.123535, 82.061813, 4.834562, 17000, 0.000000, 1622601),
(16226, 2, 2305.295166, -5286.123535, 82.061813, 1.221730, 5000, 0.000000, 1622602),
(16226, 3, 2304.958740, -5278.051270, 82.037170, 100.000000, 0, 0.000000, 0),
(16226, 4, 2301.375732, -5254.054199, 83.622154, 100.000000, 0, 0.000000, 0),
(16226, 5, 2298.724121, -5233.995117, 84.466286, 100.000000, 0, 0.000000, 0),
(16226, 6, 2306.656738, -5214.951660, 84.244301, 100.000000, 0, 0.000000, 1622606),
(16226, 7, 2317.326904, -5209.731934, 81.727707, 100.000000, 0, 0.000000, 0),
(16226, 8, 2335.831787, -5202.361328, 79.599594, 100.000000, 0, 0.000000, 0),
(16226, 9, 2364.589600, -5189.858887, 76.927193, 100.000000, 0, 0.000000, 0),
(16226, 10, 2380.178711, -5156.090820, 74.656464, 100.000000, 0, 0.000000, 0),
(16226, 11, 2377.029053, -5124.200684, 77.953575, 100.000000, 0, 0.000000, 0),
(16226, 12, 2376.634033, -5092.105957, 76.032593, 100.000000, 0, 0.000000, 0),
(16226, 13, 2382.222412, -5075.435059, 82.843475, 100.000000, 0, 0.000000, 0),
(16226, 14, 2386.557373, -5065.139160, 84.901855, 100.000000, 0, 0.000000, 0),
(16226, 15, 2394.117432, -5047.335449, 80.057091, 100.000000, 0, 0.000000, 0),
(16226, 16, 2399.721680, -5016.627441, 74.901588, 100.000000, 0, 0.000000, 0),
(16226, 17, 2400.703369, -4984.254395, 73.275650, 100.000000, 0, 0.000000, 0),
(16226, 18, 2400.915283, -4947.792969, 74.345634, 100.000000, 0, 0.000000, 0),
(16226, 19, 2404.568848, -4928.093262, 76.535187, 100.000000, 0, 0.000000, 0),
(16226, 20, 2413.550537, -4883.351074, 64.905685, 100.000000, 0, 0.000000, 0),
(16226, 21, 2413.507324, -4834.812012, 63.854179, 100.000000, 0, 0.000000, 0),
(16226, 22, 2411.277832, -4790.530273, 60.641937, 100.000000, 0, 0.000000, 0),
(16226, 23, 2410.519043, -4778.381836, 61.382889, 100.000000, 0, 0.000000, 0),
(16226, 24, 2408.024414, -4741.952637, 63.337467, 100.000000, 0, 0.000000, 0),
(16226, 25, 2430.794434, -4716.634277, 71.718941, 100.000000, 0, 0.000000, 0),
(16226, 26, 2455.767822, -4698.756348, 78.026413, 100.000000, 0, 0.000000, 0),
(16226, 27, 2489.994873, -4664.620117, 75.591881, 100.000000, 0, 0.000000, 0),
(16226, 28, 2507.795410, -4655.414063, 75.979385, 100.000000, 0, 0.000000, 0),
(16226, 29, 2517.067871, -4631.546387, 80.027374, 100.000000, 0, 0.000000, 0),
(16226, 30, 2518.343262, -4603.447754, 77.496391, 100.000000, 0, 0.000000, 0),
(16226, 31, 2513.394043, -4572.058105, 75.425514, 100.000000, 0, 0.000000, 0),
(16226, 32, 2520.230469, -4541.020020, 77.527405, 100.000000, 0, 0.000000, 0),
(16226, 33, 2528.149170, -4514.039551, 80.497765, 100.000000, 0, 0.000000, 0),
(16226, 34, 2541.483887, -4476.216309, 79.061790, 100.000000, 0, 0.000000, 0),
(16226, 35, 2546.189453, -4441.178711, 82.113243, 100.000000, 0, 0.000000, 0),
(16226, 36, 2546.464844, -4422.007324, 81.168121, 100.000000, 0, 0.000000, 0),
(16226, 37, 2546.487549, -4410.370117, 77.741966, 100.000000, 0, 0.000000, 0),
(16226, 38, 2544.968506, -4378.061035, 77.424728, 100.000000, 0, 0.000000, 0),
(16226, 39, 2555.259766, -4340.996094, 68.400314, 100.000000, 0, 0.000000, 0),
(16226, 40, 2577.702637, -4314.516602, 73.101761, 100.000000, 0, 0.000000, 0),
(16226, 41, 2594.586182, -4294.723145, 77.103668, 100.000000, 0, 0.000000, 0),
(16226, 42, 2619.869141, -4293.396484, 83.690598, 100.000000, 0, 0.000000, 0),
(16226, 43, 2636.624756, -4286.478516, 90.460403, 100.000000, 0, 0.000000, 0),
(16226, 44, 2646.757324, -4257.995117, 87.120979, 100.000000, 0, 0.000000, 0),
(16226, 45, 2661.865234, -4235.863770, 84.231056, 100.000000, 0, 0.000000, 0),
(16226, 46, 2684.386475, -4221.544434, 90.944550, 100.000000, 0, 0.000000, 0),
(16226, 47, 2686.888672, -4188.853516, 84.214127, 100.000000, 0, 0.000000, 0),
(16226, 48, 2674.123291, -4155.041992, 85.489815, 100.000000, 0, 0.000000, 0),
(16226, 49, 2676.061523, -4092.239746, 88.066315, 100.000000, 0, 0.000000, 0),
(16226, 50, 2681.487549, -4064.493408, 88.375664, 100.000000, 0, 0.000000, 0),
(16226, 51, 2683.408447, -4048.497314, 89.064461, 100.000000, 0, 0.000000, 0),
(16226, 52, 2679.807373, -4019.243408, 93.605904, 100.000000, 5000, 0.000000, 0),
(16226, 53, 2679.807373, -4019.243408, 93.605904, 0.034907, 1000, 0.000000, 1622653);

-- Gossip menu for Field Marshal Chambers.
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (7170, 8444, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (7170, 0, 0, 'Yes, sir! Thank you, sir!', 12124, 1, 1, -1, 0, 7170, 0, 0, NULL, 0, 0);
DELETE FROM `gossip_scripts` WHERE `id`=7170;
INSERT INTO `gossip_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(7170, 0, 0, 83, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Field Marshal Chambers - Quest Credit');
UPDATE `creature_template` SET `gossip_menu_id`=7170, `movement_type`=2, `mount_display_id`=2402 WHERE `entry`=16254;

-- Waypoint scripts for Field Marshal Chambers.
DELETE FROM `creature_movement_scripts` WHERE `id`=1625413;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1625413, 0, 0, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Field Marshal Chambers - Set Walk'),
(1625413, 2, 0, 24, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Field Marshal Chambers - Dismount'),
(1625413, 7, 0, 15, 13008, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Field Marshal Chambers - Cast Spell Retribution Aura');
DELETE FROM `creature_movement_scripts` WHERE `id`=1625414;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1625414, 1, 0, 1, 66, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Field Marshal Chambers - Emote Salute'),
(1625414, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12126, 0, 0, 0, 0, 0, 0, 0, 0, 'Field Marshal Chambers - Say Text'),
(1625414, 2, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Field Marshal Chambers - Emote Talk'),
(1625414, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12127, 0, 0, 0, 0, 0, 0, 0, 0, 'Field Marshal Chambers - Say Text'),
(1625414, 5, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Field Marshal Chambers - Emote Talk'),
(1625414, 5, 2, 1, 66, 0, 0, 0, 16226, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Didier - Emote Salute');
DELETE FROM `creature_movement_scripts` WHERE `id`=1625415;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1625415, 2, 0, 34, 2, 0, 0, 0, 16226, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Didier - Reset Home Position'),
(1625415, 2, 1, 90, 3, 0, 0, 0, 16226, 30, 8, 2, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Didier - Start Script on Group'),
(1625415, 2, 2, 18, 0, 0, 0, 0, 16226, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Didier - Despawn');
DELETE FROM `creature_movement_scripts` WHERE `id`=1625419;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1625419, 0, 0, 4, 147, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Field Marshal Chambers - Add Gossip Flag'),
(1625419, 0, 1, 20, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Field Marshal Chambers - Move Idle'),
(1625419, 0, 2, 34, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Field Marshal Chambers - Set Home Position');

-- Waypoints for Field Marshal Chambers.
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(16254, 1, 2853.928467, -3872.098877, 108.221283, 100.000000, 0, 0.000000, 0),
(16254, 2, 2834.571289, -3895.621826, 104.904747, 100.000000, 0, 0.000000, 0),
(16254, 3, 2830.124756, -3910.209229, 103.908966, 100.000000, 0, 0.000000, 0),
(16254, 4, 2829.032959, -3929.482178, 104.910095, 100.000000, 0, 0.000000, 0),
(16254, 5, 2831.123779, -3940.753418, 103.111458, 100.000000, 0, 0.000000, 0),
(16254, 6, 2836.838867, -3955.320557, 104.320290, 100.000000, 0, 0.000000, 0),
(16254, 7, 2840.606201, -3970.375488, 105.079987, 100.000000, 0, 0.000000, 0),
(16254, 8, 2821.207031, -3994.553711, 102.567543, 100.000000, 0, 0.000000, 0),
(16254, 9, 2807.023438, -4000.581299, 103.449745, 100.000000, 0, 0.000000, 0),
(16254, 10, 2780.914063, -4006.783203, 99.198311, 100.000000, 0, 0.000000, 0),
(16254, 11, 2765.598633, -4009.207031, 97.750809, 100.000000, 0, 0.000000, 0),
(16254, 12, 2750.116211, -4010.640869, 95.981270, 100.000000, 0, 0.000000, 0),
(16254, 13, 2707.572021, -4014.214844, 91.210472, 100.000000, 4000, 0.000000, 1625413),
(16254, 14, 2682.706299, -4018.704590, 93.053513, 100.000000, 0, 0.000000, 1625414),
(16254, 15, 2682.706299, -4018.704590, 93.053513, 3.325364, 9000, 0.000000, 1625415),
(16254, 16, 2694.409912, -4015.781738, 91.520943, 100.000000, 0, 0.000000, 0),
(16254, 17, 2697.940186, -4014.087891, 91.524277, 100.000000, 0, 0.000000, 0),
(16254, 18, 2701.572754, -4006.733643, 92.193382, 100.000000, 5000, 0.000000, 0),
(16254, 19, 2701.572754, -4006.733643, 92.193382, 5.881760, 1000, 0.000000, 1625419);


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
