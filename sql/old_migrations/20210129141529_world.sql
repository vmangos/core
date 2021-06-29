DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210129141529');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210129141529');
-- Add your query below.


-- Remove wrong option from Innkeeper Farley's gossip menu.
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1291 AND `id` = 5;

-- Remove wrong option from Innkeeper Belm's gossip menu.
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1297 AND `id` = 4;

-- Correct gossip menu id for Innkeeper Hearthstove.
UPDATE `creature_template` SET `gossip_menu_id`=345 WHERE `entry`=6734;

-- Remove wrong option from Innkeeper Keldamyr's gossip menu.
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1293 AND `id` = 4;

-- Remove wrong option from Innkeeper Kauth's gossip menu.
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1294 AND `id` = 4;

-- Gossip menu for Innkeeper Renee.
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1296;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES 
(1296, 0, 0, 'Trick or Treat!', 10693, 1, 1, -1, 0, 342, 0, 0, NULL, 0, 164),
(1296, 1, 5, 'Make this inn your home.', 2822, 8, 128, 0, 0, 0, 0, 0, '', 0, 0),
(1296, 2, 1, 'Let me browse your goods.', 8097, 3, 4, 1, 0, 0, 0, 0, '', 0, 0),
(1296, 3, 0, 'What can I do at an inn?', 4308, 1, 1, 1221, 0, 0, 0, 0, NULL, 0, 0),
(1296, 4, 0, 'Does that heart mean you\'re looking for love?', 11823, 1, 1, 5110, 0, 0, 0, 0, '', 0, 440),
(1296, 5, 1, 'Let me browse your seasonal fare.', 8786, 3, 4, 2, 0, 0, 0, 0, '', 0, 440);

-- Gossip menu for Innkeeper Grosk.
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1290;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES 
(1290, 0, 0, 'Trick or Treat!', 10693, 1, 1, -1, 0, 342, 0, 0, NULL, 0, 164),
(1290, 2, 5, 'Make this inn your home.', 2822, 8, 128, 0, 0, 0, 0, 0, '', 0, 0),
(1290, 3, 0, 'What can I do at an inn?', 4308, 1, 1, 1221, 0, 0, 0, 0, NULL, 0, 0),
(1290, 4, 1, 'I want to browse your goods.', 3370, 3, 4, 1, 0, 0, 0, 0, '', 0, 0),
(1290, 5, 0, 'Does that heart mean you\'re looking for love?', 11823, 1, 1, 5110, 0, 0, 0, 0, '', 0, 440),
(1290, 6, 1, 'Let me browse your seasonal fare.', 8786, 3, 4, 2, 0, 0, 0, 0, '', 0, 440);

-- Correct gossip menu id for Innkeeper Karakul.
UPDATE `creature_template` SET `gossip_menu_id`=441 WHERE `entry`=6930;

-- fix erelas ambersky broken gossip menu option
UPDATE `gossip_menu_option` SET `action_menu_id` = 1481 WHERE `menu_id` = 1482 AND `id` = 0;

-- fix quest typo for trial of the lake
UPDATE `quest_template` SET `OfferRewardText` = 'Well now. It looks like yet another druid has successfully completed the Trial of the Lake! Well done, my young friend - well done.$B$BAs I\'ve said, my name is Tajarri. It is my duty and my privilege to serve as a warden for Moonglade, and specifically this shrine. Keeper Remulos guides the Cenarion Circle in preservation of nature and balance, and his shrine serves as a lasting tribute to such. By using the bauble here, it serves as a nod to the importance of this place within the Circle.' WHERE `entry` IN (28, 29);

-- Fix Lord Melenas spawn point. (Credit: Trinitycore)
DELETE FROM `creature` WHERE `id` = 2038;
INSERT INTO `creature` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `health_percent`, `mana_percent`, `wander_distance`, `patch_max`) VALUES
(1554, 2038, 1, 10107.08, 1206.241, 1311.55, 4.468043, 300, 300, 100, 100, 0, 10),
(1551, 2038, 1, 10127.8, 1202.00, 1323.30, 3.01113, 300, 300, 100, 100, 0, 10),
(1552, 2038, 1, 10126.5, 1124.8, 1338.02, 3.68265, 300, 300, 100, 100, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(108, 1, 'Lord Melenas (2038)', 10);
INSERT INTO `pool_creature` (`guid`, `pool_entry`, `description`) VALUES
(1554, 108, 'Lord Melenas #1'),
(1551, 108, 'Lord Melenas #2'),
(1552, 108, 'Lord Melenas #3');

-- Fix Lady Sathra spawn point. (Credit: Trinitycore)
INSERT INTO `creature` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `patch_max`) VALUES
(12597, 7319, 1, 10950.3, 1397.79, 1311.63, 2.32941, 300, 300, 5, 100, 100, 1, 10),
(73001, 7319, 1, 10980.6, 1699.2, 1298.57, 1.72064, 300, 300, 5, 100, 100, 1, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(109, 1, 'Lady Sathra (7319)', 10);
INSERT INTO `pool_creature` (`guid`, `pool_entry`, `description`) VALUES
(12596, 109, 'Lady Sathra #1'),
(12597, 109, 'Lady Sathra #2'),
(73001, 109, 'Lady Sathra #3');

-- remove unused template
DELETE FROM `pool_template` WHERE `entry` = 14223;

-- remove tome of fire blast from kireena
DELETE FROM `npc_vendor` WHERE `entry` = 9636 AND `item` = 8878;

-- Correct the meetingstone gossip menu ids.
UPDATE `gossip_menu` SET `entry`=6025 WHERE `entry`=6029;
UPDATE `gossip_menu_option` SET `menu_id`=6025 WHERE `menu_id`=6029;
UPDATE `gossip_menu_option` SET `action_menu_id`=6025 WHERE `action_menu_id`=6029;

-- q.1191 'Zamek's Distraction'
-- Update End Script
-- Based on TC Script
DELETE FROM `quest_end_scripts` WHERE `id`=1191;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1191, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Zamek - Modify Flags');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1191, 0, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Zamek - Run');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1191, 1, 60, 2, 0, 0, 0, 0, 0, 0, 0, 0, 4709, 0, 0, 0, 0, 0, 0, 0, 'Zamek - Start Waypoints');
-- Add waypoints and scripts
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `script_id`) VALUES
-- Zamek 4709
(4709, 1, -6237.13, -3911.58, -60.5103, 100, 0, 0),
(4709, 2, -6257.43, -3879.56, -58.8595, 100, 0, 0),
(4709, 3, -6267.61, -3850.91, -58.7503, 100, 0, 0),
(4709, 4, -6266.24, -3846.35, -58.7503, 100, 5000, 470901),
(4709, 5, -6267.61, -3850.91, -58.7503, 100, 0, 0),
(4709, 6, -6257.43, -3879.56, -58.8595, 100, 0, 0),
(4709, 7, -6237.13, -3911.58, -60.5103, 100, 0, 0),
(4709, 8, -6226.13, -3944.94, -58.6251, 100, 1000, 470902),
-- Rizzle Brassbolts 4720
(4720, 1, -6243.39, -3845.91, -58.7498, 100, 2000, 472001),
(4720, 2, -6250.63, -3847.35, -58.7491, 100, 0, 0),
(4720, 3, -6255.06, -3853.64, -58.7491, 100, 0, 0),
(4720, 4, -6262.2,  -3851.84, -58.7491, 100, 0, 0),
(4720, 5, -6266.24, -3846.35, -58.7503, 100, 30000, 472002),
(4720, 6, -6262.2,  -3851.84, -58.7491, 100, 0, 0),
(4720, 7, -6255.06, -3853.64, -58.7491, 100, 0, 0),
(4720, 8, -6250.63, -3847.35, -58.7491, 100, 0, 0),
(4720, 9, -6243.39, -3845.91, -58.7498, 100, 0, 0),
(4720, 10, -6236.99, -3831.23, -58.1364, 100, 1000, 472003);
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (470901, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1540, 0, 0, 0, 0, 0, 0, 0, 0, 'Zamek - Talk');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (470901, 3, 9, 20, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Zamek - Respawn Gobject');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (470901, 4, 25, 1, 0, 0, 0, 21577, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rizzle Brassbolts - Run');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (470901, 10, 0, 0, 0, 0, 0, 21577, 0, 9, 2, 1541, 0, 0, 0, 0, 0, 0, 0, 0, 'Rizzle Brassbolts - Talk');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (470901, 10, 60, 2, 0, 0, 0, 21577, 0, 9, 2, 0, 4720, 0, 0, 0, 0, 0, 0, 0, 'Rizzle Brassbolts - Start Waypoints');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (470902, 34, 4, 147, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Zamek - Modify Flags');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (472001, 1, 9, 13621, 42, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rizzle Brassbolts - Respawn Gobject');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (472001, 2, 81, 17087, 41, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rizzle Brassbolts - Despawn Gobject');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (472002, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1542, 0, 0, 0, 0, 0, 0, 0, 0, 'Rizzle Brassbolts - Talk');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (472002, 27, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1543, 0, 0, 0, 0, 0, 0, 0, 0, 'Rizzle Brassbolts - Talk');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (472003, 0, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3.38594, 0, 'Rizzle Brassbolts - Orientation');
-- in case if object despawns before player accept next one
UPDATE `quest_template` SET `RequiredCondition` = 20227, `PrevQuestId`=0 WHERE `entry` = 1191;
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES 
(20225, 9, 1190, 0),
(20226, 19, 1194, 0),
(20227, -2, 20226, 20225);
-- Objects
-- Rizzle's Guarded Plans 179888
UPDATE `gameobject_template` SET `flags` = 0 WHERE entry = 179888;
UPDATE `gameobject` SET `spawntimesecsmin` = 45, `spawntimesecsmax` = 45 WHERE `id` = 179888;
DELETE FROM `gossip_menu` WHERE `entry` = 6029;
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES
(6029, 7182);
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 6029;
-- Rizzle's Unguarded Plans 20805
UPDATE `gameobject` SET `position_x` = -6236.64, `position_y` = -3830.48, `position_z` = -58.1364, `orientation` = -0.907571, `rotation0` = 0, `rotation1` = 0, `rotation2` = 0.438371, `rotation3` = -0.898794 WHERE `id` = 20805;
UPDATE `gameobject_template` SET `data3` = 0 WHERE `entry` = 20805;
-- Explosive Charge 144065 - added
DELETE FROM `gameobject` WHERE `guid` = 20;
INSERT INTO `gameobject` VALUES (20, 144065,1, -6266.46, -3845.4, -58.7498, 0.550892, 0, 0, 0.271976, 0.962304, -5, -5, 255, 1, 0, 0, 0, 10);

-- add missing npcs to azshara (credit to  alexkulya for this)
INSERT INTO `creature` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `movement_type`) VALUES
(160359, 8387, 1, 1747.24, -5859.6, -90.3817, 3.98543, 300, 300, 0, 0),
(160360, 8388, 1, 1747.62, -5862.27, -90.9249, 3.17332, 300, 300, 0, 0),
(160361, 8389, 1, 1748.87, -5863.46, -90.2665, 2.83088, 300, 300, 0, 0),
(160362, 8394, 1, 1746.45, -5861.29, -91.4165, 3.20841, 300, 300, 0, 0),
(160363, 8478, 1, 1916.44, -5733.37, 10.1936, 4.10397, 300, 300, 0, 0);
UPDATE `creature_template` SET `inhabit_type` = 1 WHERE `entry` IN (8387, 8388, 8389, 8394);
INSERT INTO `creature_addon` (`guid`, `stand_state`, `sheath_state`, `auras`) VALUES
(160363, 8, 1, '');

-- add Trigore the Lasher spawn
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(452, 3652, 0, 0, 0, 1, -639.394, -2254.77, 13.2385, 2.51149, 172800, 259200, 2, 100, 0, 1, 0, 0, 0, 10);

-- remove Burning Key from creature 2760 loot table
DELETE FROM `creature_loot_template` WHERE `item` = 4483 AND `entry` = 2760;

-- Some Westfall duplicates
DELETE FROM `creature` WHERE `guid` IN (90271,90014,90375,90216,89906,90434,90341);
DELETE FROM `creature_addon` WHERE `guid` IN (90271,90014,90375,90216,89906,90434,90341);
UPDATE `creature` SET `position_x` = -10829.554688, `position_y` = 733.747437, `position_z` = 34.381603, `orientation` = 3.798669 WHERE `guid` = 90362;

-- Troll Tribal Necklace should always drop as quest 2881 is repeatable
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 40 WHERE `item` = 9259;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 30 WHERE `item` = 9259 && `entry` IN (8218, 8219, 8216, 7995);
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 20 WHERE `item` = 9259 && `entry` IN (8217, 10802, 7996);

-- add Klaven Mortwake EAI (taken from https://github.com/cmangos/classic-db/commit/b69297f0c908f206b58cd9a2dacb1870f568f56a)
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(705301, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3092, 0, 0, 0, 0, 0, 0, 0, 0, 'Klaven Mortwake - Say Text');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (705301, 7053, 0, 10, 0, 100, 1, 0, 30, 60000, 60000, 705301, 0, 0, 'Klaven Mortwake - Say on LOS(q.2359)');
-- Part of Klaven Mortwake EAI - aura check for LOS
DELETE FROM `conditions` WHERE `condition_entry` = 20264;
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`) VALUES 
(20264,1,1784,0,0,0);

-- allow Dane Winslow to summon an imp
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 6373;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `event_type`, `event_chance`, `action1_script`, `comment`) VALUES
(637301, 6373, 11, 100, 637301, 'Dane Winslow - Summon Imp on Spawn');
INSERT INTO `creature_ai_scripts` (`id`, `command`, `datalong`, `data_flags`, `comments`) VALUES
(637301, 15, 11939, 4, 'Dane Winslow - Summon Imp on Spawn');

-- fix error in eastvale logging camp script
DELETE FROM `creature_movement_scripts` WHERE `id`=8125203;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8125203, 1, 16, 6289, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Eastvale Peasant 81252 - Play Sound -  What');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8125203, 1, 35, 0, 0, 0, 0, 81251, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Eastvale Peasant 81252 - Face Target');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8125203, 2, 16, 6288, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Eastvale Peasant 81252 - Play Sound - More Work');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8125203, 4, 39, 1061601, 0, 0, 0, 81251, 0, 9, 2, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Eastvale Peasant 81252 - Start Script Supervisor Raelene');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8125203, 8, 16, 6242, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Eastvale Peasant 81252 - Play Sound - No One Else Available');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8125203, 10, 39, 8134801, 0, 0, 0, 81348, 0, 9, 2, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Eastvale Peasant 81252 - Start Script Eastvale Peasant 81348');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8134801, 0, 60, 1, 0, 0, 0, 0, 0, 0, 0, 81348, 0, 0, 0, 0, 0, 0, 0, 0, 'Eastvale Peasant 81348 - Start Waypoints - Started by Eastvale Peasant 81252');

-- sognar cliffbeard should be holding his meat
DELETE FROM `creature_addon` WHERE `guid` = (SELECT `guid` FROM `creature` WHERE `id` = 5124);

-- remove incorrect quest text
UPDATE `quest_template` SET `RequestItemsText` = '' WHERE  `entry` = 1679;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
