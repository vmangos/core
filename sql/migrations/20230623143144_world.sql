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
-- Add Missing Blood of Heroes
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(3009, 176214, 0, 1158.58, -2524.99, 60.7516, 5.68977, 0, 0, -0.292372, 0.956305, 7200, 7200, 1, 100, 0, 10),
(3010, 176214, 0, 1374.47, -1289.64, 57.5279, 1.309, 0, 0, 0.608761, 0.793354, 7200, 7200, 1, 100, 0, 10),
(3011, 176214, 0, 1502.38, -1486.16, 57.1851, 6.19592, 0, 0, -0.0436192, 0.999048, 7200, 7200, 1, 100, 0, 10),
(3012, 176214, 0, 1692.87, -2252.25, 58.9754, 5.07891, 0, 0, -0.566406, 0.824126, 7200, 7200, 1, 100, 0, 10),
(3013, 176214, 0, 1742.08, -3792.19, 127.144, 3.90954, 0, 0, -0.927183, 0.374608, 7200, 7200, 1, 100, 0, 10),
(3014, 176214, 0, 1980.37, -4824.86, 93.1408, 0.157079, 0, 0, 0.0784588, 0.996917, 7200, 7200, 1, 100, 0, 10),
(3015, 176214, 0, 2075.37, -2980.35, 92.3482, 0.279252, 0, 0, 0.139173, 0.990268, 7200, 7200, 1, 100, 0, 10),
(3016, 176214, 0, 2395.57, -2495.6, 73.2811, 0.942477, 0, 0, 0.45399, 0.891007, 7200, 7200, 1, 100, 0, 10);

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
-- Add Missing Creature Gremnik Rizzlesprang (note: gossip is still missing) Credit Azerothcore
INSERT INTO `creature` (`guid`, `id`, `position_x`, `position_y`, `position_z`, `orientation`, `wander_distance`, `patch_min`, `patch_max`)
VALUES (222222, 16123, -14457.221680, 448.084534, 20.406971, 6.115618, 0, 8, 10);
UPDATE `creature_template` SET `npc_flags` = 1, `auras` = '27614' WHERE `entry` = 16123;
INSERT INTO `creature_addon` (`guid`, `patch`, `mount_display_id`, `auras`)VALUES 
(222222, 8, 0, 27614);

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


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
