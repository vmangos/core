DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230623143144');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230623143144');
-- Add your query below.


-- Defias Dockworker 6927 Convert to Creature Group
UPDATE `creature` SET `position_x` = -9961.2, `position_y` = -153.40921, `position_z` = 21.847925, `movement_type` = 0 WHERE `guid` IN (84587, 80730, 80732);
DELETE FROM `creature_movement` WHERE `id` IN (84587, 80730, 80732);

INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES
(84587, 84587, 0, 6.25244, 11),
(84587, 80730, 3, 3.14, 11),
(84587, 80732, 6, 3.14, 11);

UPDATE `creature` SET `movement_type` = 2 WHERE `guid` = 84587;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `script_id`) VALUES
(84587, 1, -9961.2, -153.40921, 21.847925, 100, 1000, 0), 
(84587, 2, -9956.517, -159.12874, 22.818628, 100, 0, 0), 
(84587, 3, -9951.445, -163.15524, 24.69314, 100, 0, 0), 
(84587, 4, -9946.228, -165.53757, 27.017359, 100, 0, 0), 
(84587, 5, -9944.468, -163.84106, 27.131617, 100, 0, 0), 
(84587, 6, -9944.139, -153.49643, 25.133081, 100, 0, 0), 
(84587, 7, -9943.608, -147.81813, 25.008081, 100, 0, 0), 
(84587, 8, -9936.224, -135.3706, 25.780787, 100, 0, 0), 
(84587, 9, -9929.365, -131.3284, 25.417545, 100, 0, 0), 
(84587, 10, -9928.282, -121.96587, 25.139225, 100, 0, 0), 
(84587, 11, -9935.369, -114.50511, 25.765055, 100, 0, 0), 
(84587, 12, -9945.132, -113.93359, 25.394205, 100, 0, 0), 
(84587, 13, -9956.19, -116.17986, 25.25944, 100, 0, 0), 
(84587, 14, -9965.036, -125.75975, 25.56315, 100, 0, 0), 
(84587, 15, -9966.419, -130.92566, 24.818033, 100, 0, 0), 
(84587, 16, -9967.337, -137.82283, 24.607573, 100, 0, 0), 
(84587, 17, -9965.224, -140.53967, 24.583359, 100, 1000, 0),
(84587, 18, -9967.337, -137.82283, 24.607573, 100, 0, 0), 
(84587, 19, -9966.419, -130.92566, 24.818033, 100, 0, 0), 
(84587, 20, -9965.036, -125.75975, 25.56315, 100, 0, 0), 
(84587, 21, -9956.19, -116.17986, 25.25944, 100, 0, 0), 
(84587, 22, -9945.132, -113.93359, 25.394205, 100, 0, 0), 
(84587, 23, -9935.369, -114.50511, 25.765055, 100, 0, 0), 
(84587, 24, -9928.282, -121.96587, 25.139225, 100, 0, 0), 
(84587, 25, -9929.365, -131.3284, 25.417545, 100, 0, 0), 
(84587, 26, -9936.224, -135.3706, 25.780787, 100, 0, 0), 
(84587, 27, -9943.608, -147.81813, 25.008081, 100, 0, 0), 
(84587, 28, -9944.139, -153.49643, 25.133081, 100, 0, 0), 
(84587, 29, -9944.468, -163.84106, 27.131617, 100, 0, 0), 
(84587, 30, -9946.228, -165.53757, 27.017359, 100, 0, 0),
(84587, 31, -9951.445, -163.15524, 24.69314, 100, 0, 0),
(84587, 32, -9956.517, -159.12874, 22.818628, 100, 0, 0);

-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Add Events to Barov Servants
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` IN (11636, 11637);
-- Events list for Servant of Alexi Barov
DELETE FROM `creature_ai_events` WHERE `creature_id`=11637;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(1163701, 11637, 0, 4, 0, 20, 2, 0, 0, 0, 0, 1163601, 1163602, 0, 'Servant of Alexi Barov - Talk On Aggro');

-- Events list for Servant of Weldon Barov
DELETE FROM `creature_ai_events` WHERE `creature_id`=11636;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(1163601, 11636, 0, 4, 0, 20, 2, 0, 0, 0, 0, 1163601, 1163602, 0, 'Servant of Weldon Barov - Talk On Aggro');

DELETE FROM `creature_ai_scripts` WHERE `id`=1163601;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1163601, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7150, 7151, 7152, 7153, 0, 0, 0, 0, 0, 'Servant of Alexi\Weldon Barov - Talk');

DELETE FROM `creature_ai_scripts` WHERE `id`=1163602;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1163602, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7154, 7153, 7152, 7151, 0, 0, 0, 0, 0, 'Servant of Alexi\Weldon Barov - Talk');

-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Convert Klaven Mortwake to Stealth Alert
DELETE FROM `creature_ai_events` WHERE `creature_id`=7053;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(705301, 7053, 0, 35, 0, 100, 1, 10000, 10000, 0, 0, 705301, 0, 0, 'Klaven Mortwake - Say on Stealth Alert');

-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Set Correct Patch For Dark Iron Deposit
UPDATE `gameobject` SET `patch_min` = 5 WHERE `id` = 165658;

-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Correct Mining Node Position
UPDATE `gameobject` SET `position_x`=26.0743, `position_y`=-1906.15, `position_z`=84.0589, `orientation`=4.69494 WHERE  `guid`=34711;

-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Update Cook Ghilm Script
DELETE FROM `creature_movement_scripts` WHERE `id`=135501;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(135501, 3, 0, 82, 10837, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cook Ghilm - Load Gameobject'),
(135501, 3, 0, 1, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cook Ghilm - Emote'),
(135501, 4, 0, 19, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cook Ghilm - Set Equipment'),
(135501, 7, 0, 41, 0, 0, 0, 0, 10837, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cook Ghilm - Remove Object');

-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Stranglethorn Tigress and Shadowmaw Panther Share Spawns
UPDATE `creature` SET `id` = 684, `id2` = 772 WHERE `id` IN (684, 772);

-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--  Align Guard Respawntime
UPDATE `creature` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `id` IN (
68, -- Stormwind City Guard
727, -- Ironforge Mountaineer
1423, -- Stormwind Guard
1976, -- Stormwind City Patroller
3084, -- Bluffwatcher
3212, -- Brave Ironhorn
3215, -- Brave Strongbash
3217, -- Brave Dawneagle
3218, -- Brave Swiftwind
3219, -- Brave Leaping Deer
3220, -- Brave Darksky
3221, -- Brave Rockhorn
3222, -- Brave Wildrunner
3223, -- Brave Rainchaser
3224, -- Brave Cloudmane
3296, -- Orgrimmar Grunt
5595, -- Ironforge Guard
5624, -- Undercity Guardian
12996, -- Mounted Ironforge Mountaineer
13076); -- Dun Morogh Mountaineer

-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Convert Engineer Trainers to Use Conditions
UPDATE `creature_template` SET `trainer_spell` = 0 WHERE `entry` IN (8738, 8126);
UPDATE `gossip_menu_option` SET `condition_id` = 1367 WHERE `menu_id` = 1469 AND `id` = 0;
UPDATE `gossip_menu_option` SET `condition_id` = 1367 WHERE `menu_id` = 1465 AND `id` = 0;
UPDATE `gossip_menu_option` SET `option_broadcast_text`= 4551 WHERE `menu_id` = 1465 AND `id` = 0;

UPDATE `creature_template` SET `trainer_spell`= 0 WHERE `entry` IN (7406, 7944);
UPDATE `gossip_menu_option` SET `condition_id` = 1368 WHERE `menu_id` = 1467 AND `id` = 0;
UPDATE `gossip_menu_option` SET `condition_id` = 1368 WHERE `menu_id` = 1468 AND `id` = 0;

-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
UPDATE `creature` SET `wander_distance`='5' WHERE  `guid`=4185;
DELETE FROM `creature_movement_template` WHERE `entry` = 468;

-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Corrections to Rogue Class Quests
UPDATE `quest_template` SET `BreadcrumbForQuestId` = 1886, `NextQuestInChain` = 0 WHERE `entry` = 1885;
UPDATE `quest_template` SET `PrevQuestId` = 0 WHERE `entry` = 1886;

UPDATE `quest_template` SET `BreadcrumbForQuestId` = 1963, `NextQuestInChain` = 0 WHERE `entry` = 1859;
UPDATE `quest_template` SET `PrevQuestId` = 0 WHERE `entry` = 1963;
UPDATE `quest_template` SET `RequiredRaces` = 130 WHERE `entry` = 1859;

UPDATE `quest_template` SET `NextQuestId`= 0, `BreadcrumbForQuestId` = 2238, `NextQuestInChain` = 0, `QuestFlags` = 0 WHERE `entry` = 2218;
UPDATE `quest_template` SET `PrevQuestId`= 0 WHERE `entry` = 2238;

UPDATE `quest_template` SET `NextQuestId` = 0, `BreadcrumbForQuestId` = 2206 WHERE `entry` = 2205;
UPDATE `quest_template` SET `PrevQuestId` = 0 WHERE `entry` = 2206;

UPDATE `quest_template` SET `NextQuestId` = 0, `BreadcrumbForQuestId` = 2242 WHERE `entry` = 2241;
UPDATE `quest_template` SET `PrevQuestId` = 0 WHERE `entry` = 2242;

REPLACE INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES 
(805, -2, 804, 803, 802, 0, 1),
(804, 22, 2206, 0, 0, 0, 1),
(803, 22, 2238, 0, 0, 0, 1),
(802, 22, 2242, 0, 0, 0, 1);

UPDATE `quest_template` SET `RequiredCondition` = 805 WHERE `entry` IN (2218, 2205, 2241);

-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Ancient of War Does Not Have Gossip
UPDATE `creature_template` SET `npc_flags` = 0 WHERE `entry`=3469;

-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Update Some Creature Group Angles
UPDATE `creature_groups` SET `angle` = 3.12 WHERE `member_guid` IN (42898, 60006, 287, 153);
UPDATE `creature_groups` SET `angle` = 3.12 WHERE `member_guid` = 3477;
UPDATE `creature_groups` SET `angle` = 3.23 WHERE `member_guid` = 3560;

-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Add Script For Quest Frostmaw
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`) VALUES
(3114, 19875, 0, 263.424, -268.076, 145.521, 4.34587, 0, 0, -0.824126, 0.566406, -180, -180, 1, 100),
(3115, 965, 0, 263.262, -267.665, 145.024, 4.57276, 0, 0, -0.754709, 0.656059, -180, -180, 1, 100);

DELETE FROM `event_scripts` WHERE `id`=727;
INSERT INTO `event_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(727, 0, 0, 10, 4504, 0, 1, 0, 0, 0, 0, 0, 8, 0, -1, 7, 234.227, -239.227, 141.325, 2.84489, 0, 'Frostmaw: Summon Creature Frostmaw'),
(727, 0, 0, 9, 3114, 180, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Frostmaw: Respawn GameObject Fresh Lion Carcass'),
(727, 0, 0, 9, 3115, 180, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Frostmaw: Respawn GameObject Black Smoke - scale 2');

DELETE FROM `creature_movement_template` WHERE `entry` = 4504;
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `script_id`) VALUES
(4504, 1, 221.10156, -254.34375, 145.13052, 100, 0, 0), 
(4504, 2, 221.40279, -262.92282, 145.25552, 100, 0, 0), 
(4504, 3, 229.7501, -267.23904, 145.87318, 100, 7000, 0), 
(4504, 4, 241.35802, -267.15924, 144.7831, 100, 0, 0), 
(4504, 5, 247.68039, -266.39713, 144.98044, 100, 0, 0), 
(4504, 6, 261.16113, -267.38702, 144.8716, 100, 7000, 450401), 
(4504, 7, 248.05843, -267.17468, 145.08376, 100, 0, 0), 
(4504, 8, 242.37035, -266.9359, 144.5908, 100, 0, 0), 
(4504, 9, 237.8304, -267.07703, 145.80971, 100, 0, 0), 
(4504, 10, 229.01921, -267.1084, 145.80151, 100, 0, 0), 
(4504, 11, 222.44646, -260.98682, 145.13052, 100, 0, 0), 
(4504, 12, 222.2341, -253.12283, 144.81778, 100, 0, 0), 
(4504, 13, 230.49452, -242.26663, 142.41824, 100, 3000, 450402);

DELETE FROM `creature_movement_scripts` WHERE `id`=450401;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(450401, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1464, 0, 0, 0, 0, 0, 0, 0, 0, 'Frostmaw - Talk'),
(450401, 5, 0, 81, 3114, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Frostmaw - Despawn Object'),
(450401, 5, 0, 81, 3115, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Frostmaw - Despawn Object');

DELETE FROM `creature_movement_scripts` WHERE `id`=450402;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(450402, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1465, 0, 0, 0, 0, 0, 0, 0, 0, 'Frostmaw - Talk'),
(450402, 2, 0, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Frostmaw - Despawn');

UPDATE `creature_template` SET `movement_type` = 2 WHERE `entry` = 4504;

-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- All Humanoids Should Swim
UPDATE `creature_template` SET `inhabit_type` = 3 WHERE `type` = 7 AND `inhabit_type` = 1;

-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Holy Spring Does Not Require Quest To Loot
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance` = 100 WHERE `entry` = 938 AND `item` = 737;

-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Corrections to The Captain's Chest Patch Progression
UPDATE `quest_template` SET `CompleteEmote` = 1 WHERE `entry` = 8551 AND `patch`=7;
DELETE FROM `quest_template` WHERE `entry` = 614 AND `patch` = 7;
UPDATE `creature_questrelation` SET `patch_max` = 6 WHERE `id` = 2500 AND `quest` = 614;

-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Remove Incorrect Creatures
DELETE FROM `creature` WHERE `guid` IN (21707, 21708);

-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Set Correct Target For Script
DELETE FROM `creature_ai_scripts` WHERE `id`=852401;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(852401, 0, 0, 15, 16567, 39, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cursed Mage - Cast Spell Tainted Mind');

-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Set Southshore Guard Default Movement to Wander
UPDATE `creature_template` SET `movement_type` = 1 WHERE `entry` = 2386;

-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Correct High Executor Darthalia Spawn Position
UPDATE `creature` SET `position_x`= -33.3555, `position_y`= -927.892, `position_z`= 54.5261, `orientation`= 1.54421 WHERE `guid` = 15542;

-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Add Roland Geardabbler Aura
UPDATE `creature_template` SET `auras` = '12508' WHERE `entry`=8394 AND `patch`=0;

-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Add Mai'Zoth Aura
UPDATE `creature_template` SET `auras` = '12544' WHERE `entry`=818 AND `patch`=0;

-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Pool Alien Egg
UPDATE `gameobject` SET `spawntimesecsmin` = 10, `spawntimesecsmax` = 10 WHERE `id` = 175565;
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(3585, 1, 'Thousand Needles - Alien Egg', 0, 10);
INSERT INTO `pool_gameobject_template` (`id`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(175565, 3585, 0, 'Thousand Needles - Alien Egg', 0, 10);

-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Correct Patch Min
UPDATE `pool_template` SET `patch_min`= 0 WHERE  `entry` IN (21603, 21604);

-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Creatures Should Wander
UPDATE `creature` SET `movement_type` = 1, `wander_distance` = 2 WHERE `guid` IN (6782, 6784, 6787, 6790, 6797, 6794);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;