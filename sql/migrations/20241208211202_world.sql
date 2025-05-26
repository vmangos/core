DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20241208211202');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20241208211202');
-- Add your query below.

-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Add Missing Script
UPDATE `gameobject_template` SET `script_name` = 'go_corrupted_plant' WHERE `entry` = 174597;
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Creature 5469 Shares Spawns With 5470
UPDATE `creature` SET `id2` = 5470 WHERE `id`= 5469;
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Correct Call For Help For Silithid Hive Drone
UPDATE `creature_ai_scripts` SET `x` = 20 WHERE `id` IN (413301, 413302);
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Correct State For Object
UPDATE `gameobject` SET `state` = 1 WHERE `guid` = 60099;
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Prevent Creature From Evading
UPDATE `creature` SET `position_z`=42.3186 WHERE `guid`=11352;
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Add Swifthistle to Barrens Herbs
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES
(2514, 2452, 20, 0, 1, 3, 0, 0, 10),
(2515, 2452, 40, 0, 1, 3, 0, 0, 10);

-- Barrens Herbs Should Drop Betreen 1 and 3 Herbs
UPDATE `gameobject_loot_template` SET `mincountOrRef` = 1, `maxcount` = 3 WHERE `entry` = 2514 AND `item` = 785;
UPDATE `gameobject_loot_template` SET `mincountOrRef` = 1, `maxcount` = 3 WHERE `entry` = 2515 AND `item` = 2450;
UPDATE `gameobject_loot_template` SET `mincountOrRef` = 1, `maxcount` = 3 WHERE `entry` = 2512 AND `item` = 2447;
UPDATE `gameobject_loot_template` SET `mincountOrRef` = 1, `maxcount` = 3 WHERE `entry` = 2513 AND `item` = 2449;
UPDATE `gameobject_loot_template` SET `mincountOrRef` = 1, `maxcount` = 3 WHERE `entry` = 2511 AND `item` = 765;
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Remove Unused Quest From NPC
DELETE FROM `creature_questrelation` WHERE  `id` = 14358 AND `quest` = 7462;
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Correct Spell and Aura For Twilight Flamereaver
UPDATE `creature_template` SET `spell_id1` = 0, `spell_list_id` = 152010, `auras` = '15733 11966' WHERE `entry` = 15201;
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES
(152010, 'Silithus - Twilight Flamereaver', 15732, 100, 1, 0, 0, 0, 1, 27, 4, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Correct Spell and Aura For Smolderthorn Witch Doctor
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES
(92660, 'Blackrock Spire - Smolderthorn Witch Doctor', 15867, 100, 0, 0, 0, 0, 6, 18, 30, 30, 0, 15869, 100, 0, 0, 0, 0, 6, 18, 30, 30, 0, 8262, 100, 0, 0, 0, 0, 6, 18, 30, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
UPDATE `creature_template` SET `spell_id1` = 9574 WHERE `entry` = 10217;
UPDATE `creature_template` SET `spell_id1` = 0, `spell_id2` = 0, `spell_id3` = 0 WHERE `entry` = 9266;
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Correct Spellid for Maraudine Windchaser -  credit cmangos (we should sync with ACID)
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES
(46570, 'Desolace - Maraudine Windchaser', 6728, 100, 5, 0, 0, 0, 7, 11, 15, 18, 0, 11986, 100, 15, 0, 0, 0, 0, 0, 17, 21, 0, 9532, 100, 1, 0, 0, 8, 0, 0, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Events list for Therylune (creature uses cpp script added for future)
UPDATE `creature` SET `wander_distance` = 3, `movement_type` = 1 WHERE `guid` = 36533;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(358401, 3584, 0, 1, 0, 100, 1, 0, 3000, 60000, 100000, 358401, 0, 0, 'Therylune - Talk OOC');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(358401, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 1186, 0, 0, 0, 0, 0, 0, 0, 0, 'Therylune - Talk OOC');
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Add Some Missing Pools
SET @PTEMPLATE = 4900;

-- Add Pool For Draenethyst Crystals
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+2, 5, 'Swamp of Sorrows - Draenethyst Crystals', 10);
INSERT INTO `pool_gameobject_template` (`id`, `pool_entry`, `chance`, `description`, `patch_max`) VALUES
(22550, @PTEMPLATE+2, 0, 'Swamp of Sorrows - Draenethyst Crystals', 10);
UPDATE `gameobject` SET `spawntimesecsmin` = 10, `spawntimesecsmax` = 10 WHERE `id` = 22550;

-- Add Pool For Alterac Granite
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+3, 5, 'Hillsbrad Foothills - Alterac Granite', 10);
INSERT INTO `pool_gameobject_template` (`id`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(2714, @PTEMPLATE+3, 0, 'Hillsbrad Foothills - Alterac Granite', 1, 10);
UPDATE `gameobject` SET `spawntimesecsmin` = 10, `spawntimesecsmax` = 10 WHERE `id` = 2714;

-- Add Pool For Lunar Fungal Bloom
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+4, 9, 'Darkshore - Lunar Fungal Bloom', 10);
INSERT INTO `pool_gameobject_template` (`id`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(177750, @PTEMPLATE+4, 0, 'Darkshore - Lunar Fungal Bloom', 1, 10);
UPDATE `gameobject` SET `spawntimesecsmin` = 60, `spawntimesecsmax` = 60 WHERE `id` = 177750;

-- Add Pool For Lunar Violet Tragan
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+5, 1, 'Hinterlands - Violet Tragan', 10);
INSERT INTO `pool_gameobject_template` (`id`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(141853, @PTEMPLATE+5, 0, 'Hinterlands - Violet Tragan', 1, 10);
UPDATE `gameobject` SET `spawntimesecsmin` = 10, `spawntimesecsmax` = 10 WHERE `id` = 141853;

-- Add Pool For Sack of Meat
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+6, 5, 'Desolace - Sack of Meat', 10);
INSERT INTO `pool_gameobject_template` (`id`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(22245, @PTEMPLATE+6, 0, 'Desolace - Sack of Meat', 1, 10);
UPDATE `gameobject` SET `spawntimesecsmin` = 10, `spawntimesecsmax` = 10 WHERE `id` = 22245;

-- Add Pool For Elune's Tear
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+7, 3, 'Ashenvale - Elunes Tear', 10);
INSERT INTO `pool_gameobject_template` (`id`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(19015, @PTEMPLATE+7, 0, 'Ashenvale - Elunes Tear', 1, 10);
UPDATE `gameobject` SET `spawntimesecsmin` = 10, `spawntimesecsmax` = 10 WHERE `id` = 19015;

-- Pool Atal'ai Tablet
-- Inside Instance
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+9, 20, 'Sunken Temple - Atal\'ai Tablet', 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(54953, @PTEMPLATE+9, 0, 'Sunken Temple - Atal\'ai Tablet', 0, 0, 10),
(54954, @PTEMPLATE+9, 0, 'Sunken Temple - Atal\'ai Tablet', 0, 0, 10),
(54955, @PTEMPLATE+9, 0, 'Sunken Temple - Atal\'ai Tablet', 0, 0, 10),
(9608, @PTEMPLATE+9, 0, 'Sunken Temple - Atal\'ai Tablet', 0, 0, 10),
(9605, @PTEMPLATE+9, 0, 'Sunken Temple - Atal\'ai Tablet', 0, 0, 10),
(9604, @PTEMPLATE+9, 0, 'Sunken Temple - Atal\'ai Tablet', 0, 0, 10),
(9595, @PTEMPLATE+9, 0, 'Sunken Temple - Atal\'ai Tablet', 0, 0, 10),
(9565, @PTEMPLATE+9, 0, 'Sunken Temple - Atal\'ai Tablet', 0, 0, 10),
(9549, @PTEMPLATE+9, 0, 'Sunken Temple - Atal\'ai Tablet', 0, 0, 10),
(9538, @PTEMPLATE+9, 0, 'Sunken Temple - Atal\'ai Tablet', 0, 0, 10),
(9535, @PTEMPLATE+9, 0, 'Sunken Temple - Atal\'ai Tablet', 0, 0, 10),
(9531, @PTEMPLATE+9, 0, 'Sunken Temple - Atal\'ai Tablet', 0, 0, 10),
(9528, @PTEMPLATE+9, 0, 'Sunken Temple - Atal\'ai Tablet', 0, 0, 10),
(9525, @PTEMPLATE+9, 0, 'Sunken Temple - Atal\'ai Tablet', 0, 0, 10),
(9523, @PTEMPLATE+9, 0, 'Sunken Temple - Atal\'ai Tablet', 0, 0, 10),
(9515, @PTEMPLATE+9, 0, 'Sunken Temple - Atal\'ai Tablet', 0, 0, 10),
(9511, @PTEMPLATE+9, 0, 'Sunken Temple - Atal\'ai Tablet', 0, 0, 10),
(9509, @PTEMPLATE+9, 0, 'Sunken Temple - Atal\'ai Tablet', 0, 0, 10),
(9506, @PTEMPLATE+9, 0, 'Sunken Temple - Atal\'ai Tablet', 0, 0, 10),
(9505, @PTEMPLATE+9, 0, 'Sunken Temple - Atal\'ai Tablet', 0, 0, 10),
(9456, @PTEMPLATE+9, 0, 'Sunken Temple - Atal\'ai Tablet', 0, 0, 10),
(9446, @PTEMPLATE+9, 0, 'Sunken Temple - Atal\'ai Tablet', 0, 0, 10),
(9443, @PTEMPLATE+9, 0, 'Sunken Temple - Atal\'ai Tablet', 0, 0, 10),
(9441, @PTEMPLATE+9, 0, 'Sunken Temple - Atal\'ai Tablet', 0, 0, 10),
(9438, @PTEMPLATE+9, 0, 'Sunken Temple - Atal\'ai Tablet', 0, 0, 10),
(9434, @PTEMPLATE+9, 0, 'Sunken Temple - Atal\'ai Tablet', 0, 0, 10),
(9420, @PTEMPLATE+9, 0, 'Sunken Temple - Atal\'ai Tablet', 0, 0, 10),
(9419, @PTEMPLATE+9, 0, 'Sunken Temple - Atal\'ai Tablet', 0, 0, 10),
(9414, @PTEMPLATE+9, 0, 'Sunken Temple - Atal\'ai Tablet', 0, 0, 10),
(9408, @PTEMPLATE+9, 0, 'Sunken Temple - Atal\'ai Tablet', 0, 0, 10),
(9406, @PTEMPLATE+9, 0, 'Sunken Temple - Atal\'ai Tablet', 0, 0, 10),
(9402, @PTEMPLATE+9, 0, 'Sunken Temple - Atal\'ai Tablet', 0, 0, 10),
(9401, @PTEMPLATE+9, 0, 'Sunken Temple - Atal\'ai Tablet', 0, 0, 10),
(9399, @PTEMPLATE+9, 0, 'Sunken Temple - Atal\'ai Tablet', 0, 0, 10),
(9391, @PTEMPLATE+9, 0, 'Sunken Temple - Atal\'ai Tablet', 0, 0, 10),
(9389, @PTEMPLATE+9, 0, 'Sunken Temple - Atal\'ai Tablet', 0, 0, 10),
(9385, @PTEMPLATE+9, 0, 'Sunken Temple - Atal\'ai Tablet', 0, 0, 10),
(9375, @PTEMPLATE+9, 0, 'Sunken Temple - Atal\'ai Tablet', 0, 0, 10),
(9372, @PTEMPLATE+9, 0, 'Sunken Temple - Atal\'ai Tablet', 0, 0, 10),
(9371, @PTEMPLATE+9, 0, 'Sunken Temple - Atal\'ai Tablet', 0, 0, 10),
(9368, @PTEMPLATE+9, 0, 'Sunken Temple - Atal\'ai Tablet', 0, 0, 10),
(9367, @PTEMPLATE+9, 0, 'Sunken Temple - Atal\'ai Tablet', 0, 0, 10),
(9358, @PTEMPLATE+9, 0, 'Sunken Temple - Atal\'ai Tablet', 0, 0, 10);
UPDATE `gameobject` SET `spawntimesecsmin` = 604800, `spawntimesecsmax` = 604800 WHERE `id` = 37099;

-- Outside Instance
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+8, 4, 'Swamp of Sorrows - Atal\'ai Tablet', 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(30368, @PTEMPLATE+8, 0, 'Swamp of Sorrows - Atal\'ai Tablet', 0, 0, 10),
(30367, @PTEMPLATE+8, 0, 'Swamp of Sorrows - Atal\'ai Tablet', 0, 0, 10),
(30366, @PTEMPLATE+8, 0, 'Swamp of Sorrows - Atal\'ai Tablet', 0, 0, 10),
(30359, @PTEMPLATE+8, 0, 'Swamp of Sorrows - Atal\'ai Tablet', 0, 0, 10),
(30358, @PTEMPLATE+8, 0, 'Swamp of Sorrows - Atal\'ai Tablet', 0, 0, 10),
(30357, @PTEMPLATE+8, 0, 'Swamp of Sorrows - Atal\'ai Tablet', 0, 0, 10),
(30355, @PTEMPLATE+8, 0, 'Swamp of Sorrows - Atal\'ai Tablet', 0, 0, 10),
(30354, @PTEMPLATE+8, 0, 'Swamp of Sorrows - Atal\'ai Tablet', 0, 0, 10),
(30353, @PTEMPLATE+8, 0, 'Swamp of Sorrows - Atal\'ai Tablet', 0, 0, 10),
(30352, @PTEMPLATE+8, 0, 'Swamp of Sorrows - Atal\'ai Tablet', 0, 0, 10),
(30351, @PTEMPLATE+8, 0, 'Swamp of Sorrows - Atal\'ai Tablet', 0, 0, 10),
(30345, @PTEMPLATE+8, 0, 'Swamp of Sorrows - Atal\'ai Tablet', 0, 0, 10),
(30344, @PTEMPLATE+8, 0, 'Swamp of Sorrows - Atal\'ai Tablet', 0, 0, 10),
(30342, @PTEMPLATE+8, 0, 'Swamp of Sorrows - Atal\'ai Tablet', 0, 0, 10),
(9350, @PTEMPLATE+8, 0, 'Swamp of Sorrows - Atal\'ai Tablet', 0, 0, 10);
UPDATE `gameobject` SET `spawntimesecsmin` = 10, `spawntimesecsmax` = 10 WHERE `guid` IN (30368, 30367, 30366, 30359, 30358, 30357, 30355, 30354, 30353, 30352, 30351, 30345, 30344, 30342, 9350);

-- Pool Twilight Tablet Fragment
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+10, 12, 'Silithus - Twilight Tablet Fragment (Master Pool)', 6, 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(809, @PTEMPLATE+10, 0, 'Silithus - Twilight Tablet Fragment', 0),
(810, @PTEMPLATE+10, 0, 'Silithus - Twilight Tablet Fragment', 0),
(811, @PTEMPLATE+10, 0, 'Silithus - Twilight Tablet Fragment', 0),
(812, @PTEMPLATE+10, 0, 'Silithus - Twilight Tablet Fragment', 0),
(813, @PTEMPLATE+10, 0, 'Silithus - Twilight Tablet Fragment', 0),
(814, @PTEMPLATE+10, 0, 'Silithus - Twilight Tablet Fragment', 0),
(815, @PTEMPLATE+10, 0, 'Silithus - Twilight Tablet Fragment', 0),
(816, @PTEMPLATE+10, 0, 'Silithus - Twilight Tablet Fragment', 0),
(817, @PTEMPLATE+10, 0, 'Silithus - Twilight Tablet Fragment', 0),
(818, @PTEMPLATE+10, 0, 'Silithus - Twilight Tablet Fragment', 0),
(819, @PTEMPLATE+10, 0, 'Silithus - Twilight Tablet Fragment', 0),
(820, @PTEMPLATE+10, 0, 'Silithus - Twilight Tablet Fragment', 0),
(821, @PTEMPLATE+10, 0, 'Silithus - Twilight Tablet Fragment', 0),
(822, @PTEMPLATE+10, 0, 'Silithus - Twilight Tablet Fragment', 0),
(823, @PTEMPLATE+10, 0, 'Silithus - Twilight Tablet Fragment', 0),
(824, @PTEMPLATE+10, 0, 'Silithus - Twilight Tablet Fragment', 0),
(825, @PTEMPLATE+10, 0, 'Silithus - Twilight Tablet Fragment', 0),
(826, @PTEMPLATE+10, 0, 'Silithus - Twilight Tablet Fragment', 0),
(827, @PTEMPLATE+10, 0, 'Silithus - Twilight Tablet Fragment', 0),
(828, @PTEMPLATE+10, 0, 'Silithus - Twilight Tablet Fragment', 0),
(829, @PTEMPLATE+10, 0, 'Silithus - Twilight Tablet Fragment', 0),
(830, @PTEMPLATE+10, 0, 'Silithus - Twilight Tablet Fragment', 0),
(831, @PTEMPLATE+10, 0, 'Silithus - Twilight Tablet Fragment', 0),
(832, @PTEMPLATE+10, 0, 'Silithus - Twilight Tablet Fragment', 0),
(833, @PTEMPLATE+10, 0, 'Silithus - Twilight Tablet Fragment', 0),
(834, @PTEMPLATE+10, 0, 'Silithus - Twilight Tablet Fragment', 0),
(835, @PTEMPLATE+10, 0, 'Silithus - Twilight Tablet Fragment', 0),
(836, @PTEMPLATE+10, 0, 'Silithus - Twilight Tablet Fragment', 0),
(837, @PTEMPLATE+10, 0, 'Silithus - Twilight Tablet Fragment', 0),
(838, @PTEMPLATE+10, 0, 'Silithus - Twilight Tablet Fragment', 0),
(839, @PTEMPLATE+10, 0, 'Silithus - Twilight Tablet Fragment', 0),
(840, @PTEMPLATE+10, 0, 'Silithus - Twilight Tablet Fragment', 0),
(841, @PTEMPLATE+10, 0, 'Silithus - Twilight Tablet Fragment', 0),
(842, @PTEMPLATE+10, 0, 'Silithus - Twilight Tablet Fragment', 0),
(843, @PTEMPLATE+10, 0, 'Silithus - Twilight Tablet Fragment', 0),
(1764, @PTEMPLATE+10, 0, 'Silithus - Twilight Tablet Fragment', 0),
(1765, @PTEMPLATE+10, 0, 'Silithus - Twilight Tablet Fragment', 0),
(1766, @PTEMPLATE+10, 0, 'Silithus - Twilight Tablet Fragment', 0),
(1767, @PTEMPLATE+10, 0, 'Silithus - Twilight Tablet Fragment', 0),
(1768, @PTEMPLATE+10, 0, 'Silithus - Twilight Tablet Fragment', 0),
(1769, @PTEMPLATE+10, 0, 'Silithus - Twilight Tablet Fragment', 0);
UPDATE `gameobject` SET `spawntimesecsmin` = 60, `spawntimesecsmax` = 60 WHERE `id` IN (180501, 180436);
DELETE FROM `gameobject` WHERE `guid` IN (263, 252, 246);
DELETE FROM `pool_template` WHERE `entry` = 1764;
DELETE FROM `pool_gameobject` WHERE `guid` IN (252, 246);
DELETE FROM `pool_pool` WHERE `pool_id` = 1764;

DELETE FROM `gameobject` WHERE `guid` IN (261, 247, 253);
DELETE FROM `pool_template` WHERE `entry` = 1765;
DELETE FROM `pool_gameobject` WHERE `guid` IN (247, 253);
DELETE FROM `pool_pool` WHERE `pool_id` = 1765;

DELETE FROM `gameobject` WHERE `guid` IN (262, 254, 248);
DELETE FROM `pool_template` WHERE `entry` = 1766;
DELETE FROM `pool_gameobject` WHERE `guid` IN (254, 248);
DELETE FROM `pool_pool` WHERE `pool_id` = 1766;
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Update Respawn Times
UPDATE `gameobject` SET `spawntimesecsmin` = 0, `spawntimesecsmax` = 0 WHERE `guid` IN (42673, 42662, 35422, 13767, 16617, 16611, 16610, 13260, 15090, 15099, 32614, 47598, 47599, 47600, 47602, 45008, 6929, 12671, 12194, 11829, 47699, 45014, 35412, 15719, 42620, 49828, 13166, 6849, 45332, 10663, 45719, 45720, 45721, 32686, 49376, 46198, 46199, 13525, 27085, 9986 , 10135, 10030, 17201, 10043, 47905, 12699, 11418, 32387, 14067, 29362);
UPDATE `gameobject` SET `spawntimesecsmin` = 10, `spawntimesecsmax` = 10 WHERE `guid` IN (3996164, 26772, 49695, 12863, 14137, 40668, 11014, 12872, 12864, 12871, 40688, 30277, 15008, 40688, 234778, 350470, 362149, 35792, 29680);
UPDATE `gameobject` SET `animprogress` = 100 WHERE `guid` IN (35876, 82575);
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Fix Creature Under Map (credit cmangos)
UPDATE `creature` SET `position_x` = 544.298828, `position_y` = -3755.502930, `position_z` = 15.736476, `wander_distance` = 10, `movement_type` = 1 WHERE `guid` = 13565;
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Restore Stranglekelp Pre 1.7
UPDATE `pool_template` SET `max_limit` = 3 WHERE `entry` = 1064 AND `patch_min`=0 AND `patch_max`=4;
UPDATE `pool_template` SET `max_limit` = 4 WHERE `entry` = 1322 AND `patch_min`=0 AND `patch_max`=4;
UPDATE `pool_template` SET `max_limit` = 2 WHERE `entry` = 1145 AND `patch_min`=0 AND `patch_max`=4;
UPDATE `pool_template` SET `max_limit` = 2 WHERE `entry` = 1190 AND `patch_min`=0 AND `patch_max`=4;
UPDATE `pool_template` SET `max_limit` = 3 WHERE `entry` = 1123 AND `patch_min`=0 AND `patch_max`=4;
UPDATE `pool_template` SET `patch_min` = 0 WHERE `entry` = 43522 AND `patch_min`=7 AND `patch_max`=10;
UPDATE `pool_template` SET `max_limit` = 2 WHERE `entry` = 1065 AND `patch_min`=0 AND `patch_max`=4;
UPDATE `pool_template` SET `max_limit` = 2 WHERE `entry` = 984 AND `patch_min`=0 AND `patch_max`=4;
UPDATE `pool_template` SET `max_limit` = 4 WHERE `entry` = 1122 AND `patch_min`=0 AND `patch_max`=4;
UPDATE `pool_template` SET `max_limit` = 5 WHERE `entry` = 1149 AND `patch_min`=0 AND `patch_max`=4;
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Deathclasp Should Only Be Accompanied with Stonelash Flayers
UPDATE `creature` SET `id2`=0 WHERE  `guid` IN (44396, 44397);
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Add Missing Condition to Josephine Lister
UPDATE `gossip_menu_option` SET `condition_id` = 374 WHERE `menu_id` = 4844 AND `id` = 0;
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Remove Duplicate Creatures
DELETE FROM `creature` WHERE `guid` IN (16672, 16722);
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Defias Rogue Wizard Should Wander
UPDATE `creature` SET `movement_type` = 1, `wander_distance` = 10 WHERE `guid` IN (81164, 81160, 81159, 81166, 81162, 81165, 81161, 81320, 81311, 81294, 81299, 81167, 81172, 81171, 81170, 81176, 81173);
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Soriid the Devourer Should Not Be Skinnable
DELETE FROM `skinning_loot_template` WHERE `entry` = 100003;
UPDATE `creature_template` SET `skinning_loot_id` = 0 WHERE `entry` = 8204;
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Correct Serpentbloom Spawns Ammount
UPDATE `pool_template` SET `max_limit` = 13 WHERE `entry` = 4893;
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Events list for Trade Master Kovic
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(844402, 8444, 0, 4, 0, 100, 1, 0, 0, 0, 0, 844402, 0, 0, 'Trade Master Kovic - Talk on Aggro');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(844402, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4422, 4421, 0, 0, 0, 0, 0, 0, 0, 'Trade Master Kovic - Talk on Aggro');
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Creatures Should Share ID's
UPDATE `creature` SET `id` = 5333, id2 = 5336 WHERE `guid` IN (51496, 51637, 51497, 51636, 51494, 51635, 51608, 51493, 51554, 51492);
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Add Description
UPDATE `pool_gameobject` SET `description` = 'Black Lotus' WHERE `guid` IN(3998092, 3998091, 3998090, 3998089, 3998088, 3998087, 3998085, 3998084, 3998081, 3998078, 3998143, 3998148, 3998149, 3998152, 3998153, 3998156, 3998157, 3998176, 3998187, 3998193, 3998197, 3998202, 3998203, 3998204, 3998206, 3998224, 3998245, 3998246, 3998248, 3998249, 3998251);
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Correct Some Skinning Tables
UPDATE `creature` SET `id` = 4396, `id2` = 4397 WHERE id IN (4396, 4397);

-- Mudrock Spikeshell
UPDATE `skinning_loot_template` SET `ChanceOrQuestChance` = 77, `groupid` = 1 WHERE `entry` = 4397 AND `item` = 4234;
UPDATE `skinning_loot_template` SET `ChanceOrQuestChance` = 3, `groupid` = 1 WHERE `entry` = 4397 AND `item` = 4235;
UPDATE `skinning_loot_template` SET `ChanceOrQuestChance` = 20, `groupid` = 1 WHERE `entry` = 4397 AND `item` = 4304;
UPDATE `skinning_loot_template` SET `ChanceOrQuestChance` = 25, `groupid` = 2 WHERE `entry` = 4397 AND `item` = 8167;

-- Mudrock Tortoise
UPDATE `skinning_loot_template` SET `ChanceOrQuestChance` = 77, `groupid` = 1 WHERE `entry` = 4397 AND `item` = 4234;
UPDATE `skinning_loot_template` SET `ChanceOrQuestChance` = 26, `groupid` = 2 WHERE `entry` = 4397 AND `item` = 8167;
UPDATE `skinning_loot_template` SET `ChanceOrQuestChance` = 20, `groupid` = 1 WHERE `entry` = 4397 AND `item` = 4304;
UPDATE `skinning_loot_template` SET `ChanceOrQuestChance` = 3, `groupid` = 1 WHERE `entry` = 4397 AND `item` = 4235;

-- Mudrock Snapjaw
UPDATE `skinning_loot_template` SET `ChanceOrQuestChance` = 51, `groupid` = 2 WHERE `entry` = 4400 AND `item` = 8167;
UPDATE `skinning_loot_template` SET `ChanceOrQuestChance` = 49, `groupid` = 1 WHERE `entry` = 4400 AND `item` = 4304;
UPDATE `skinning_loot_template` SET `ChanceOrQuestChance` = 44, `groupid` = 1 WHERE `entry` = 4400 AND `item` = 4234;
UPDATE `skinning_loot_template` SET `ChanceOrQuestChance` = 4, `groupid` = 1 WHERE `entry` = 4400 AND `item` = 8169;
UPDATE `skinning_loot_template` SET `ChanceOrQuestChance` = 3, `groupid` = 1 WHERE `entry` = 4400 AND `item` = 4235;

-- Mudrock Burrower
UPDATE `creature_template` SET `skinning_loot_id` = 4398 WHERE `entry` = 4398;
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`) VALUES
(4398, 4234, 77, 1),
(4398, 8167, 26, 2),
(4398, 4304, 19, 1),
(4398, 4235, 4, 1);

-- Saltwater Snapjaw
UPDATE `skinning_loot_template` SET `ChanceOrQuestChance` = 50 WHERE `entry` = 2505 AND `item` = 8167;

-- Steeljaw Snapper
UPDATE `skinning_loot_template` SET `ChanceOrQuestChance` = 50, `groupid` = 2 WHERE `entry` = 14123 AND `item` = 8167;
UPDATE `skinning_loot_template` SET `ChanceOrQuestChance` = 49, `groupid` = 1 WHERE `entry` = 14123 AND `item` = 4304;
UPDATE `skinning_loot_template` SET `ChanceOrQuestChance` = 43, `groupid` = 1 WHERE `entry` = 14123 AND `item` = 4234;
UPDATE `skinning_loot_template` SET `ChanceOrQuestChance` = 3, `groupid` = 1 WHERE `entry` = 14123 AND `item` = 8169;
UPDATE `skinning_loot_template` SET `ChanceOrQuestChance` = 3, `groupid` = 1 WHERE `entry` = 14123 AND `item` = 4235;

-- Stolid Snapjaw
UPDATE `skinning_loot_template` SET `ChanceOrQuestChance` = 77, `groupid` = 1 WHERE `entry` = 13599 AND `item` = 4304;
UPDATE `skinning_loot_template` SET `ChanceOrQuestChance` = 49, `groupid` = 2 WHERE `entry` = 13599 AND `item` = 8167;
UPDATE `skinning_loot_template` SET `ChanceOrQuestChance` = 20, `groupid` = 1 WHERE `entry` = 13599 AND `item` = 8170;
UPDATE `skinning_loot_template` SET `ChanceOrQuestChance` = 3, `groupid` = 1 WHERE `entry` = 13599 AND `item` = 8169;

-- Gammerita
UPDATE `skinning_loot_template` SET `ChanceOrQuestChance` = 70, `groupid` = 1 WHERE `entry` = 7977 AND `item` = 4304;
UPDATE `skinning_loot_template` SET `ChanceOrQuestChance` = 51, `groupid` = 2 WHERE `entry` = 7977 AND `item` = 8167;
UPDATE `skinning_loot_template` SET `ChanceOrQuestChance` = 24, `groupid` = 1 WHERE `entry` = 7977 AND `item` = 8170;
UPDATE `skinning_loot_template` SET `ChanceOrQuestChance` = 6, `groupid` = 1 WHERE `entry` = 7977 AND `item` = 8169;

-- Ironback
UPDATE `skinning_loot_template` SET `ChanceOrQuestChance` = 50, `groupid` = 1 WHERE `entry` = 8213 AND `item` = 8170;
UPDATE `skinning_loot_template` SET `ChanceOrQuestChance` = 48, `groupid` = 1 WHERE `entry` = 8213 AND `item` = 4304;
UPDATE `skinning_loot_template` SET `ChanceOrQuestChance` = 44, `groupid` = 2 WHERE `entry` = 8213 AND `item` = 8167;
UPDATE `skinning_loot_template` SET `ChanceOrQuestChance` = 1, `groupid` = 1 WHERE `entry` = 8213 AND `item` = 8169;
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`) VALUES
(8213, 8171, 1, 1);

-- Scalebeard
UPDATE `skinning_loot_template` SET `ChanceOrQuestChance` = 49, `groupid` = 1 WHERE `entry` = 13896 AND `item` = 8170;
UPDATE `skinning_loot_template` SET `ChanceOrQuestChance` = 45, `groupid` = 1 WHERE `entry` = 13896 AND `item` = 4304;
UPDATE `skinning_loot_template` SET `ChanceOrQuestChance` = 40, `groupid` = 2 WHERE `entry` = 13896 AND `item` = 8167;
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`) VALUES
(13896, 8171, 5, 1),
(13896, 8169, 1, 1);
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Remove Dire Pool Object Added In Classic
DELETE FROM `gameobject` WHERE `guid` = 1936;
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Add Derina Rumdnul Script
UPDATE `creature` SET `wander_distance` = 0, `movement_type` = 2 WHERE `guid` = 9569;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(148401, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 394, 395, 396, 0, 0, 0, 0, 0, 0, 'Derina Rumdnul - Talk');
INSERT INTO `creature_movement_template` VALUES
(1484, 1, -3743.43, -886.878, 11.0101, 100, 360000, 1, 0, 0),
(1484, 2, -3742.26, -876.78, 9.90981, 100, 0, 0, 0, 0),
(1484, 3, -3741.16, -871.94, 9.90022, 100, 8000, 0, 148401, 0);
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Correct SPAWN Orientation For Squire Maltrake
UPDATE `creature` SET `orientation` = 2.86234 WHERE `guid` = 5598;
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Add Events list for Kalaran Windblade
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 8479;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(847901, 8479, 0, 1, 0, 100, 1, 360000, 600000, 360000, 600000, 847901, 0, 0, 'Kalaran Windblade - Emote - OOC');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(847901, 0, 0, 39, 847901, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Kalaran Windblade - Start Script');
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(847901, 0, 0, 1, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kalaran Windblade - Emote'),
(847901, 5, 0, 1, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kalaran Windblade - Emote'),
(847901, 9, 0, 1, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kalaran Windblade - Emote');
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Add Correct Gossip to Joseph Redpath (NOTE: currently his gossip is controlled by a cpp script that only displays the placeholder gossip. If the script is converted to DB in the future this correct gossip menu will be used.)
UPDATE `creature_template` SET `gossip_menu_id` = 3861 WHERE `entry` = 10936;
INSERT INTO `gossip_menu` VALUES
(3861, 4778, 0, 0);
UPDATE `creature` SET `wander_distance` = 1.5, `movement_type` = 1 WHERE `guid` = 53736;
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Correct Apothecary Lycanus Waypoints (credit cmangos)
DELETE FROM `creature_movement` WHERE `id` = 38093;
UPDATE `creature` SET `position_x` = 1453.947, `position_y` = 351.2875, `position_z` = -62.10241, `orientation` = 0.5569137 WHERE `guid`= 38093;
SET @POINT := 0;
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(5733, (@POINT := @POINT + 1), 1479.409, 372.6641, -62.18579),
(5733, (@POINT := @POINT + 1), 1490.668, 382.7879, -62.13049),
(5733, (@POINT := @POINT + 1), 1507.254, 392.7480, -57.15340),
(5733, (@POINT := @POINT + 1), 1510.655, 391.4390, -57.15269),
(5733, (@POINT := @POINT + 1), 1518.012, 377.2852, -50.84839),
(5733, (@POINT := @POINT + 1), 1526.585, 360.7172, -57.15204),
(5733, (@POINT := @POINT + 1), 1530.330, 362.3312, -57.15204),
(5733, (@POINT := @POINT + 1), 1537.363, 367.8207, -62.18076),
(5733, (@POINT := @POINT + 1), 1541.788, 366.9868, -62.18503),
(5733, (@POINT := @POINT + 1), 1543.513, 362.1345, -62.18871),
(5733, (@POINT := @POINT + 1), 1537.399, 358.0874, -61.50328),
(5733, (@POINT := @POINT + 1), 1523.827, 350.3899, -61.47989),
(5733, (@POINT := @POINT + 1), 1516.754, 348.5895, -60.78263),
(5733, (@POINT := @POINT + 1), 1506.970, 341.4081, -60.08857),
(5733, (@POINT := @POINT + 1), 1494.426, 328.6796, -60.08972),
(5733, (@POINT := @POINT + 1), 1485.358, 324.8369, -60.78840),
(5733, (@POINT := @POINT + 1), 1481.448, 320.6308, -60.76874),
(5733, (@POINT := @POINT + 1), 1477.088, 312.4247, -57.15205),
(5733, (@POINT := @POINT + 1), 1474.103, 311.8581, -57.15205),
(5733, (@POINT := @POINT + 1), 1460.298, 320.6215, -50.84841),
(5733, (@POINT := @POINT + 1), 1446.570, 328.6499, -57.15267),
(5733, (@POINT := @POINT + 1), 1443.132, 327.8983, -57.15334),
(5733, (@POINT := @POINT + 1), 1438.031, 318.6035, -62.30432),
(5733, (@POINT := @POINT + 1), 1434.720, 317.2854, -62.25796),
(5733, (@POINT := @POINT + 1), 1431.855, 318.8524, -62.24274),
(5733, (@POINT := @POINT + 1), 1430.826, 325.7559, -62.18589),
(5733, (@POINT := @POINT + 1), 1422.317, 340.9035, -62.18488),
(5733, (@POINT := @POINT + 1), 1412.049, 346.4379, -66.01148),
(5733, (@POINT := @POINT + 1), 1393.417, 363.7184, -66.04475),
(5733, (@POINT := @POINT + 1), 1383.044, 366.0187, -66.00156),
(5733, (@POINT := @POINT + 1), 1365.521, 370.2274, -70.45621),
(5733, (@POINT := @POINT + 1), 1363.163, 377.8648, -70.51649),
(5733, (@POINT := @POINT + 1), 1367.676, 391.4300, -71.58265),
(5733, (@POINT := @POINT + 1), 1373.875, 401.1192, -73.41265),
(5733, (@POINT := @POINT + 1), 1382.895, 409.3970, -75.89713),
(5733, (@POINT := @POINT + 1), 1389.492, 415.1714, -77.23779),
(5733, (@POINT := @POINT + 1), 1396.454, 415.7548, -77.23812),
(5733, (@POINT := @POINT + 1), 1408.307, 403.3368, -84.96553),
(5733, (@POINT := @POINT + 1), 1414.507, 401.6818, -84.96911),
(5733, (@POINT := @POINT + 1), 1428.567, 386.7604, -85.00344),
(5733, (@POINT := @POINT + 1), 1439.069, 395.1042, -85.27096),
(5733, (@POINT := @POINT + 1), 1448.465, 404.8771, -84.99477),
(5733, (@POINT := @POINT + 1), 1443.744, 412.5832, -84.98980),
(5733, (@POINT := @POINT + 1), 1435.269, 421.8757, -84.96635),
(5733, (@POINT := @POINT + 1), 1430.059, 429.9826, -83.02303),
(5733, (@POINT := @POINT + 1), 1419.351, 439.9147, -77.23872),
(5733, (@POINT := @POINT + 1), 1420.962, 445.0159, -77.23551),
(5733, (@POINT := @POINT + 1), 1434.677, 457.1974, -70.46587),
(5733, (@POINT := @POINT + 1), 1444.693, 453.6557, -70.45750),
(5733, (@POINT := @POINT + 1), 1454.077, 444.2845, -65.72675),
(5733, (@POINT := @POINT + 1), 1459.657, 438.8900, -65.72455),
(5733, (@POINT := @POINT + 1), 1470.865, 441.2971, -64.91907),
(5733, (@POINT := @POINT + 1), 1481.018, 448.8758, -61.92701),
(5733, (@POINT := @POINT + 1), 1491.781, 449.9227, -61.20277),
(5733, (@POINT := @POINT + 1), 1502.774, 444.2577, -63.65751),
(5733, (@POINT := @POINT + 1), 1507.677, 435.0599, -65.22881),
(5733, (@POINT := @POINT + 1), 1504.628, 426.7937, -63.94162),
(5733, (@POINT := @POINT + 1), 1494.864, 421.1157, -62.18553),
(5733, (@POINT := @POINT + 1), 1494.723, 410.3156, -62.18560),
(5733, (@POINT := @POINT + 1), 1499.950, 402.4439, -62.18579),
(5733, (@POINT := @POINT + 1), 1492.950, 388.4385, -62.17412),
(5733, (@POINT := @POINT + 1), 1482.611, 374.4702, -62.18579),
(5733, (@POINT := @POINT + 1), 1465.898, 357.5466, -62.18579),
(5733, (@POINT := @POINT + 1), 1454.054, 347.8523, -62.20852),
(5733, (@POINT := @POINT + 1), 1435.188, 340.4975, -62.18568),
(5733, (@POINT := @POINT + 1), 1428.785, 327.0564, -62.18573),
(5733, (@POINT := @POINT + 1), 1432.436, 318.3015, -62.24369),
(5733, (@POINT := @POINT + 1), 1438.110, 318.5949, -62.30505),
(5733, (@POINT := @POINT + 1), 1442.610, 326.1132, -57.15322),
(5733, (@POINT := @POINT + 1), 1446.589, 333.3574, -57.15327),
(5733, (@POINT := @POINT + 1), 1450.780, 340.8258, -62.25450),
(5733, (@POINT := @POINT + 1), 1455.385, 349.8915, -62.19318),
(5733, (@POINT := @POINT + 1), 1463.855, 357.4573, -62.18579);
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Update Creature Flags
UPDATE `creature_template` SET `static_flags1` = 4718598 WHERE `entry` = 6237;
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Remove Duplicate Object
DELETE FROM `gameobject` WHERE `guid` = 21;
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Remove Incorrect Pre-Quests
UPDATE `quest_template` SET `PrevQuestId` = 0 WHERE `entry` IN (8846, 8847, 8848, 8849, 8850, 8851, 8852, 8853, 8854, 8855);
UPDATE `quest_template` SET `PrevQuestId` = 0 WHERE `PrevQuestId` IN (8795, 8792);
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Wandering Forest Walker Waypoints (credit cmangos)
UPDATE `creature` SET `position_x` = -4504.44921875, `position_y` = -342.414947509765625, `position_z` = 61.77738189697265625, `orientation` = 4.292000293731689453 WHERE `guid` = 50798;
DELETE FROM `creature_movement` WHERE `id` = 50798;
SET @POINT := 0;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`) VALUES
(50798, (@POINT := @POINT + 1), -4500.909, -310.46887, 56.327484, 100),
(50798, (@POINT := @POINT + 1), -4477.75, -295.35754, 52.810394, 100),
(50798, (@POINT := @POINT + 1), -4465.6167, -255.44879, 56.663136, 100),
(50798, (@POINT := @POINT + 1), -4466.179, -214.20378, 60.902283, 100),
(50798, (@POINT := @POINT + 1), -4451.3564, -177.16982, 60.365196, 100),
(50798, (@POINT := @POINT + 1), -4457.499, -146.32477, 57.05494, 100),
(50798, (@POINT := @POINT + 1), -4477.178, -123.24848, 64.43213, 100),
(50798, (@POINT := @POINT + 1), -4465.2446, -75.87479, 58.387253, 100),
(50798, (@POINT := @POINT + 1), -4437.4346, -38.897137, 57.44476, 100),
(50798, (@POINT := @POINT + 1), -4390.371, -29.297634, 58.17448, 100),
(50798, (@POINT := @POINT + 1), -4354.9927, -17.692165, 61.465622, 100),
(50798, (@POINT := @POINT + 1), -4322.8247, -15.102105, 59.51825, 100),
(50798, (@POINT := @POINT + 1), -4288.3306, -13.416341, 58.544865, 100),
(50798, (@POINT := @POINT + 1), -4270.592, 23.66211, 58.05705, 100),
(50798, (@POINT := @POINT + 1), -4252.012, 58.693253, 56.40872, 100),
(50798, (@POINT := @POINT + 1), -4216.2544, 91.836044, 55.474274, 100),
(50798, (@POINT := @POINT + 1), -4192.4204, 121.35287, 55.533657, 100),
(50798, (@POINT := @POINT + 1), -4189.751, 153.16026, 57.570507, 100),
(50798, (@POINT := @POINT + 1), -4175.2734, 194.64188, 60.600338, 100),
(50798, (@POINT := @POINT + 1), -4156.3604, 219.12521, 55.874474, 100),
(50798, (@POINT := @POINT + 1), -4143.105, 242.95096, 54.321896, 100),
(50798, (@POINT := @POINT + 1), -4154.697, 279.89166, 55.307117, 100),
(50798, (@POINT := @POINT + 1), -4168.7817, 310.62842, 59.4198, 100),
(50798, (@POINT := @POINT + 1), -4183.1587, 338.75424, 58.844513, 100),
(50798, (@POINT := @POINT + 1), -4209.824, 358.77386, 57.935825, 100),
(50798, (@POINT := @POINT + 1), -4239.967, 375.7786, 56.71311, 100),
(50798, (@POINT := @POINT + 1), -4268.541, 402.9421, 55.35815, 100),
(50798, (@POINT := @POINT + 1), -4295.3735, 436.4388, 55.801064, 100),
(50798, (@POINT := @POINT + 1), -4319.289, 460.42572, 52.003834, 100),
(50798, (@POINT := @POINT + 1), -4309.7344, 495.50592, 57.65575, 100),
(50798, (@POINT := @POINT + 1), -4304.538, 529.5641, 56.62767, 100),
(50798, (@POINT := @POINT + 1), -4308.3496, 561.31445, 54.779617, 100),
(50798, (@POINT := @POINT + 1), -4323.67, 586.90936, 59.49353, 100),
(50798, (@POINT := @POINT + 1), -4341.9165, 620.68427, 60.816574, 100),
(50798, (@POINT := @POINT + 1), -4385.539, 626.05664, 60.20575, 100),
(50798, (@POINT := @POINT + 1), -4420.5127, 625.1376, 60.150826, 100),
(50798, (@POINT := @POINT + 1), -4460.353, 624.0608, 60.50186, 100),
(50798, (@POINT := @POINT + 1), -4479.397, 646.80054, 60.344368, 100),
(50798, (@POINT := @POINT + 1), -4498.5728, 669.2337, 67.67601, 100),
(50798, (@POINT := @POINT + 1), -4527.049, 694.8314, 60.696438, 100),
(50798, (@POINT := @POINT + 1), -4498.5728, 669.2337, 67.67601, 100),
(50798, (@POINT := @POINT + 1), -4479.397, 646.80054, 60.344368, 100),
(50798, (@POINT := @POINT + 1), -4460.353, 624.0608, 60.50186, 100),
(50798, (@POINT := @POINT + 1), -4420.5127, 625.1376, 60.150826, 100),
(50798, (@POINT := @POINT + 1), -4385.539, 626.05664, 60.20575, 100),
(50798, (@POINT := @POINT + 1), -4341.9165, 620.68427, 60.816574, 100),
(50798, (@POINT := @POINT + 1), -4323.67, 586.90936, 59.49353, 100),
(50798, (@POINT := @POINT + 1), -4308.3496, 561.31445, 54.779617, 100),
(50798, (@POINT := @POINT + 1), -4304.538, 529.5641, 56.62767, 100),
(50798, (@POINT := @POINT + 1), -4309.7344, 495.50592, 57.65575, 100),
(50798, (@POINT := @POINT + 1), -4319.289, 460.42572, 52.003834, 100),
(50798, (@POINT := @POINT + 1), -4295.3735, 436.4388, 55.801064, 100),
(50798, (@POINT := @POINT + 1), -4268.541, 402.9421, 55.35815, 100),
(50798, (@POINT := @POINT + 1), -4239.967, 375.7786, 56.71311, 100),
(50798, (@POINT := @POINT + 1), -4209.824, 358.77386, 57.935825, 100),
(50798, (@POINT := @POINT + 1), -4183.1587, 338.75424, 58.844513, 100),
(50798, (@POINT := @POINT + 1), -4168.7817, 310.62842, 59.4198, 100),
(50798, (@POINT := @POINT + 1), -4154.697, 279.89166, 55.307117, 100),
(50798, (@POINT := @POINT + 1), -4143.105, 242.95096, 54.321896, 100),
(50798, (@POINT := @POINT + 1), -4156.3604, 219.12521, 55.874474, 100),
(50798, (@POINT := @POINT + 1), -4175.2734, 194.64188, 60.600338, 100),
(50798, (@POINT := @POINT + 1), -4189.751, 153.16026, 57.570507, 100),
(50798, (@POINT := @POINT + 1), -4192.4204, 121.35287, 55.533657, 100),
(50798, (@POINT := @POINT + 1), -4216.2544, 91.836044, 55.474274, 100),
(50798, (@POINT := @POINT + 1), -4252.012, 58.693253, 56.40872, 100),
(50798, (@POINT := @POINT + 1), -4270.592, 23.66211, 58.05705, 100),
(50798, (@POINT := @POINT + 1), -4288.3306, -13.416341, 58.544865, 100),
(50798, (@POINT := @POINT + 1), -4322.8247, -15.102105, 59.51825, 100),
(50798, (@POINT := @POINT + 1), -4354.9927, -17.692165, 61.465622, 100),
(50798, (@POINT := @POINT + 1), -4390.371, -29.297634, 58.17448, 100),
(50798, (@POINT := @POINT + 1), -4437.4346, -38.897137, 57.44476, 100),
(50798, (@POINT := @POINT + 1), -4465.2446, -75.87479, 58.387253, 100),
(50798, (@POINT := @POINT + 1), -4477.178, -123.24848, 64.43213, 100),
(50798, (@POINT := @POINT + 1), -4457.499, -146.32477, 57.05494, 100),
(50798, (@POINT := @POINT + 1), -4451.3564, -177.16982, 60.365196, 100),
(50798, (@POINT := @POINT + 1), -4466.179, -214.20378, 60.902283, 100),
(50798, (@POINT := @POINT + 1), -4465.6167, -255.44879, 56.663136, 100),
(50798, (@POINT := @POINT + 1), -4477.75, -295.35754, 52.810394, 100);

UPDATE `creature` SET `position_x` = -5150.93701171875, `position_y` = 718.4910888671875, `position_z` = 58.34488677978515625, `orientation` = 1.867502331733703613 WHERE `guid` = (50801);
DELETE FROM `creature_movement` WHERE `id` = 50801;
SET @POINT := 0;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`) VALUES
(50801, (@POINT := @POINT + 1), -5149.844, 686.69556, 56.017036, 100),
(50801, (@POINT := @POINT + 1), -5156.406, 651.8975, 51.433685, 100),
(50801, (@POINT := @POINT + 1), -5148.362, 620.21216, 41.976147, 100),
(50801, (@POINT := @POINT + 1), -5120.5273, 608.80554, 38.6795, 100),
(50801, (@POINT := @POINT + 1), -5104.2812, 585.29846, 32.59212, 100),
(50801, (@POINT := @POINT + 1), -5076.4707, 577.0293, 26.85495, 100),
(50801, (@POINT := @POINT + 1), -5042.979, 549.3069, 20.009893, 100),
(50801, (@POINT := @POINT + 1), -5043.4663, 515.05054, 19.17832, 100),
(50801, (@POINT := @POINT + 1), -5051.7725, 477.7858, 11.086406, 100),
(50801, (@POINT := @POINT + 1), -5086.065, 445.8978, 13.501592, 100),
(50801, (@POINT := @POINT + 1), -5119.053, 418.91357, 16.79367, 100),
(50801, (@POINT := @POINT + 1), -5080.4443, 391.45764, 10.832468, 100),
(50801, (@POINT := @POINT + 1), -5074.21, 356.07108, 16.851252, 100),
(50801, (@POINT := @POINT + 1), -5065.2603, 319.8897, 24.402578, 100),
(50801, (@POINT := @POINT + 1), -5062.1523, 283.03516, 32.445816, 100),
(50801, (@POINT := @POINT + 1), -5033.9517, 269.83453, 38.775833, 100),
(50801, (@POINT := @POINT + 1), -5015.0337, 256.85016, 41.816452, 100),
(50801, (@POINT := @POINT + 1), -4977.7754, 249.20508, 36.379642, 100),
(50801, (@POINT := @POINT + 1), -5013.01, 270.18555, 33.07568, 100),
(50801, (@POINT := @POINT + 1), -5038.346, 283.2052, 34.43871, 100),
(50801, (@POINT := @POINT + 1), -5040.1284, 307.27603, 25.559357, 100),
(50801, (@POINT := @POINT + 1), -5035.0283, 341.56506, 19.206244, 100),
(50801, (@POINT := @POINT + 1), -5040.25, 374.17773, 13.355078, 100),
(50801, (@POINT := @POINT + 1), -5023.389, 384.41406, 13.338457, 100),
(50801, (@POINT := @POINT + 1), -4993.9185, 384.34613, 14.147807, 100),
(50801, (@POINT := @POINT + 1), -4954.918, 384.04102, 14.1628275, 100),
(50801, (@POINT := @POINT + 1), -4938.183, 364.181, 14.745544, 100),
(50801, (@POINT := @POINT + 1), -4912.6104, 339.08865, 21.547281, 100),
(50801, (@POINT := @POINT + 1), -4887.8315, 333.57437, 26.542439, 100),
(50801, (@POINT := @POINT + 1), -4860.9053, 327.7761, 27.544336, 100),
(50801, (@POINT := @POINT + 1), -4837.9663, 300.6684, 27.209063, 100),
(50801, (@POINT := @POINT + 1), -4829.3867, 281.09143, 33.804188, 100),
(50801, (@POINT := @POINT + 1), -4806.6562, 277.45312, 34.849693, 100),
(50801, (@POINT := @POINT + 1), -4779.3496, 282.82553, 27.017885, 100),
(50801, (@POINT := @POINT + 1), -4760.8037, 299.07336, 20.240458, 100),
(50801, (@POINT := @POINT + 1), -4750.309, 319.90332, 19.75255, 100),
(50801, (@POINT := @POINT + 1), -4744.5806, 345.81067, 19.692791, 100),
(50801, (@POINT := @POINT + 1), -4724.296, 383.49084, 9.221004, 100),
(50801, (@POINT := @POINT + 1), -4744.5806, 345.81067, 19.692791, 100),
(50801, (@POINT := @POINT + 1), -4750.309, 319.90332, 19.75255, 100),
(50801, (@POINT := @POINT + 1), -4760.8037, 299.07336, 20.240458, 100),
(50801, (@POINT := @POINT + 1), -4779.3496, 282.82553, 27.017885, 100),
(50801, (@POINT := @POINT + 1), -4806.6562, 277.45312, 34.849693, 100),
(50801, (@POINT := @POINT + 1), -4829.3867, 281.09143, 33.804188, 100),
(50801, (@POINT := @POINT + 1), -4837.9663, 300.6684, 27.209063, 100),
(50801, (@POINT := @POINT + 1), -4860.9053, 327.7761, 27.544336, 100),
(50801, (@POINT := @POINT + 1), -4887.8315, 333.57437, 26.542439, 100),
(50801, (@POINT := @POINT + 1), -4912.6104, 339.08865, 21.547281, 100),
(50801, (@POINT := @POINT + 1), -4938.183, 364.181, 14.745544, 100),
(50801, (@POINT := @POINT + 1), -4954.918, 384.04102, 14.1628275, 100),
(50801, (@POINT := @POINT + 1), -4993.9185, 384.34613, 14.147807, 100),
(50801, (@POINT := @POINT + 1), -5023.389, 384.41406, 13.338457, 100),
(50801, (@POINT := @POINT + 1), -5040.25, 374.17773, 13.355078, 100),
(50801, (@POINT := @POINT + 1), -5035.0283, 341.56506, 19.206244, 100),
(50801, (@POINT := @POINT + 1), -5040.1284, 307.27603, 25.559357, 100),
(50801, (@POINT := @POINT + 1), -5038.346, 283.2052, 34.43871, 100),
(50801, (@POINT := @POINT + 1), -5013.01, 270.18555, 33.07568, 100),
(50801, (@POINT := @POINT + 1), -4977.7754, 249.20508, 36.379642, 100),
(50801, (@POINT := @POINT + 1), -5015.0337, 256.85016, 41.816452, 100),
(50801, (@POINT := @POINT + 1), -5033.9517, 269.83453, 38.775833, 100),
(50801, (@POINT := @POINT + 1), -5062.1523, 283.03516, 32.445816, 100),
(50801, (@POINT := @POINT + 1), -5065.2603, 319.8897, 24.402578, 100),
(50801, (@POINT := @POINT + 1), -5074.21, 356.07108, 16.851252, 100),
(50801, (@POINT := @POINT + 1), -5080.4443, 391.45764, 10.832468, 100),
(50801, (@POINT := @POINT + 1), -5119.053, 418.91357, 16.79367, 100),
(50801, (@POINT := @POINT + 1), -5086.065, 445.8978, 13.501592, 100),
(50801, (@POINT := @POINT + 1), -5051.7725, 477.7858, 11.086406, 100),
(50801, (@POINT := @POINT + 1), -5043.4663, 515.05054, 19.17832, 100),
(50801, (@POINT := @POINT + 1), -5042.979, 549.3069, 20.009893, 100),
(50801, (@POINT := @POINT + 1), -5076.4707, 577.0293, 26.85495, 100),
(50801, (@POINT := @POINT + 1), -5104.2812, 585.29846, 32.59212, 100),
(50801, (@POINT := @POINT + 1), -5120.5273, 608.80554, 38.6795, 100),
(50801, (@POINT := @POINT + 1), -5148.362, 620.21216, 41.976147, 100),
(50801, (@POINT := @POINT + 1), -5156.406, 651.8975, 51.433685, 100);

UPDATE `creature` SET `position_x` = -4562.158203125, `position_y` = 1907.7369384765625, `position_z` = 112.4131622314453125, `orientation` = 1.311820268630981445 WHERE `guid` = 50799;
DELETE FROM `creature_movement` WHERE `id` = 50799;
SET @POINT := 0;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`) VALUES
(50799, (@POINT := @POINT + 1), -4593.0493, 1898.6501, 109.435, 100),
(50799, (@POINT := @POINT + 1), -4621.4165, 1875.2921, 99.39326, 100),
(50799, (@POINT := @POINT + 1), -4635.6934, 1840.5259, 91.59562, 100),
(50799, (@POINT := @POINT + 1), -4620.944, 1816.0178, 93.46214, 100),
(50799, (@POINT := @POINT + 1), -4583.201, 1823.8739, 89.42591, 100),
(50799, (@POINT := @POINT + 1), -4546.5435, 1826.9252, 91.75048, 100),
(50799, (@POINT := @POINT + 1), -4518.8516, 1807.169, 97.97678, 100),
(50799, (@POINT := @POINT + 1), -4501.244, 1786.2488, 106.51216, 100),
(50799, (@POINT := @POINT + 1), -4521.371, 1749.8672, 93.255486, 100),
(50799, (@POINT := @POINT + 1), -4518.884, 1720.4601, 103.80128, 100),
(50799, (@POINT := @POINT + 1), -4552.0415, 1693.6162, 97.0989, 100),
(50799, (@POINT := @POINT + 1), -4567.284, 1655.7745, 101.65932, 100),
(50799, (@POINT := @POINT + 1), -4568.3003, 1611.6283, 96.71297, 100),
(50799, (@POINT := @POINT + 1), -4550.0063, 1581.111, 102.35941, 100),
(50799, (@POINT := @POINT + 1), -4526.126, 1551.0695, 108.17348, 100),
(50799, (@POINT := @POINT + 1), -4535.65, 1506.9761, 103.40976, 100),
(50799, (@POINT := @POINT + 1), -4565.673, 1471.1476, 99.36735, 100),
(50799, (@POINT := @POINT + 1), -4601.7036, 1455.1285, 98.71919, 100),
(50799, (@POINT := @POINT + 1), -4587.4297, 1414.324, 99.944466, 100),
(50799, (@POINT := @POINT + 1), -4577.777, 1378.9547, 106.14775, 100),
(50799, (@POINT := @POINT + 1), -4573.8013, 1346.2765, 110.108604, 100),
(50799, (@POINT := @POINT + 1), -4587.3447, 1319.6714, 108.45594, 100),
(50799, (@POINT := @POINT + 1), -4620.133, 1292.3859, 106.06546, 100),
(50799, (@POINT := @POINT + 1), -4639.759, 1261.8112, 102.12931, 100),
(50799, (@POINT := @POINT + 1), -4676.528, 1242.9338, 100.32449, 100),
(50799, (@POINT := @POINT + 1), -4709.1934, 1231.0455, 103.31362, 100),
(50799, (@POINT := @POINT + 1), -4747.6113, 1241.1512, 103.06663, 100),
(50799, (@POINT := @POINT + 1), -4780.1704, 1274.6558, 100.48988, 100),
(50799, (@POINT := @POINT + 1), -4773.432, 1310.929, 88.48869, 100),
(50799, (@POINT := @POINT + 1), -4773.854, 1352.7867, 97.67491, 100),
(50799, (@POINT := @POINT + 1), -4780.3296, 1376.4265, 105.77222, 100),
(50799, (@POINT := @POINT + 1), -4763.6953, 1401.0605, 104.84009, 100),
(50799, (@POINT := @POINT + 1), -4743.5312, 1408.1096, 93.67626, 100),
(50799, (@POINT := @POINT + 1), -4714.2725, 1418.705, 88.045044, 100),
(50799, (@POINT := @POINT + 1), -4743.5312, 1408.1096, 93.67626, 100),
(50799, (@POINT := @POINT + 1), -4763.6953, 1401.0605, 104.84009, 100),
(50799, (@POINT := @POINT + 1), -4780.3296, 1376.4265, 105.77222, 100),
(50799, (@POINT := @POINT + 1), -4773.854, 1352.7867, 97.67491, 100),
(50799, (@POINT := @POINT + 1), -4773.432, 1310.929, 88.48869, 100),
(50799, (@POINT := @POINT + 1), -4780.1704, 1274.6558, 100.48988, 100),
(50799, (@POINT := @POINT + 1), -4747.6113, 1241.1512, 103.06663, 100),
(50799, (@POINT := @POINT + 1), -4709.1934, 1231.0455, 103.31362, 100),
(50799, (@POINT := @POINT + 1), -4676.528, 1242.9338, 100.32449, 100),
(50799, (@POINT := @POINT + 1), -4639.759, 1261.8112, 102.12931, 100),
(50799, (@POINT := @POINT + 1), -4620.133, 1292.3859, 106.06546, 100),
(50799, (@POINT := @POINT + 1), -4587.3447, 1319.6714, 108.45594, 100),
(50799, (@POINT := @POINT + 1), -4573.8013, 1346.2765, 110.108604, 100),
(50799, (@POINT := @POINT + 1), -4577.777, 1378.9547, 106.14775, 100),
(50799, (@POINT := @POINT + 1), -4587.4297, 1414.324, 99.944466, 100),
(50799, (@POINT := @POINT + 1), -4601.7036, 1455.1285, 98.71919, 100),
(50799, (@POINT := @POINT + 1), -4565.673, 1471.1476, 99.36735, 100),
(50799, (@POINT := @POINT + 1), -4535.65, 1506.9761, 103.40976, 100),
(50799, (@POINT := @POINT + 1), -4526.126, 1551.0695, 108.17348, 100),
(50799, (@POINT := @POINT + 1), -4550.0063, 1581.111, 102.35941, 100),
(50799, (@POINT := @POINT + 1), -4568.3003, 1611.6283, 96.71297, 100),
(50799, (@POINT := @POINT + 1), -4567.284, 1655.7745, 101.65932, 100),
(50799, (@POINT := @POINT + 1), -4552.0415, 1693.6162, 97.0989, 100),
(50799, (@POINT := @POINT + 1), -4518.884, 1720.4601, 103.80128, 100),
(50799, (@POINT := @POINT + 1), -4521.371, 1749.8672, 93.255486, 100),
(50799, (@POINT := @POINT + 1), -4501.244, 1786.2488, 106.51216, 100),
(50799, (@POINT := @POINT + 1), -4518.8516, 1807.169, 97.97678, 100),
(50799, (@POINT := @POINT + 1), -4546.5435, 1826.9252, 91.75048, 100),
(50799, (@POINT := @POINT + 1), -4583.201, 1823.8739, 89.42591, 100),
(50799, (@POINT := @POINT + 1), -4620.944, 1816.0178, 93.46214, 100),
(50799, (@POINT := @POINT + 1), -4635.6934, 1840.5259, 91.59562, 100),
(50799, (@POINT := @POINT + 1), -4621.4165, 1875.2921, 99.39326, 100);
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Correct Rethban Gauntlet Complete Script (credit cmangos)
DELETE FROM `quest_end_scripts` WHERE `id`=1699;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1699, 0, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Rethban Gauntlet - Yorus Barleybrew - Remove NpcFlags'),
(1699, 0, 1, 1, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Rethban Gauntlet - Yorus Barleybrew - Emote Shout'),
(1699, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2308, 0, 0, 0, 0, 0, 0, 0, 0, 'The Rethban Gauntlet - Yorus Barleybrew - Say Text'),
(1699, 0, 3, 20, 0, 0, 0, 0, 379, 20, 10, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Rethban Gauntlet - Darcy - Stop Waypoint'),
(1699, 0, 4, 35, 0, 0, 0, 0, 379, 20, 10, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Rethban Gauntlet - Darcy - Face Player'),
(1699, 1, 0, 1, 4, 0, 0, 0, 5620, 20, 10, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Rethban Gauntlet - Bartender Wental - Emote Cheer'),
(1699, 3, 0, 1, 21, 0, 0, 0, 346, 20, 10, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Rethban Gauntlet - Barkeep Daniels - Emote OneShotApplaud'),
(1699, 3, 1, 1, 21, 0, 0, 0, 379, 20, 10, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Rethban Gauntlet - Darcy - Emote OneShotApplaud'),
(1699, 5, 0, 1, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Rethban Gauntlet - Yorus Barleybrew - Emote Cheer'),
(1699, 5, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2309, 0, 0, 0, 0, 0, 0, 0, 0, 'The Rethban Gauntlet - Yorus Barleybrew - Say Text'),
(1699, 6, 0, 1, 4, 0, 0, 0, 379, 20, 10, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Rethban Gauntlet - Darcy - Emote OneShotCheer'),
(1699, 6, 1, 1, 21, 0, 0, 0, 5620, 20, 10, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Rethban Gauntlet - Bartender Wental - Emote OneShotApplaud'),
(1699, 9, 0, 1, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Rethban Gauntlet - Yorus Barleybrew - Emote Cheer'),
(1699, 9, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2309, 0, 0, 0, 0, 0, 0, 0, 0, 'The Rethban Gauntlet - Yorus Barleybrew - Say Text'),
(1699, 10, 0, 20, 2, 0, 12, 0, 379, 20, 10, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Rethban Gauntlet - Darcy - Start Waypoint'),
(1699, 13, 0, 1, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Rethban Gauntlet - Yorus Barleybrew - Emote Cheer'),
(1699, 13, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2309, 0, 0, 0, 0, 0, 0, 0, 0, 'The Rethban Gauntlet - Yorus Barleybrew - Say Text'),
(1699, 14, 0, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Rethban Gauntlet - Yorus Barleybrew - Add NpcFlags');
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Add Missing Gossip Option (credit cmangos) (FULL BLIZZLIKE SCRIPT:https://github.com/cmangos/tbc-db/commit/96c8008958671945b39d1912645e1d80afaa8c7c)
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_script_id`, `condition_id`) VALUES
(5763, 1, 'I\'ve lost the cure, Doc! Tell me you got more!!!', 9532, 1, 1, -1, 5763, 5765);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES
(5763, 8, 2609, 0, 0, 0, 0),
(5764, 2, 8432, 1, 0, 0, 1),
(5765, -1, 5763, 5764, 0, 0, 0);
DELETE FROM `gossip_scripts` WHERE `id`=5763;
INSERT INTO `gossip_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(5763, 0, 0, 15, 22943, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Doc Mixilpixil - cast Player Lost Eau d\' Mixilpixil DND');
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Correct Sully Balloo\'s Letter Complete Script (credit cmangos)
DELETE FROM `quest_end_scripts` WHERE `id`=637;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(637, 0, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sully Balloo\'s Letter - Sara Balloo - Remove NpcFlags'),
(637, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 792, 0, 0, 0, 0, 0, 0, 0, 0, 'Sully Balloo\'s Letter - Sara Balloo - Say EmotedText'),
(637, 6, 0, 1, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sully Balloo\'s Letter - Sara Balloo - Emote Roar'),
(637, 6, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 793, 0, 0, 0, 0, 0, 0, 0, 0, 'Sully Balloo\'s Letter - Sara Balloo - Say Text'),
(637, 10, 0, 1, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sully Balloo\'s Letter - Sara Balloo - Emote Cry'),
(637, 15, 0, 1, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sully Balloo\'s Letter - Sara Balloo - Emote Beg'),
(637, 20, 0, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sully Balloo\'s Letter - Sara Balloo - Add NpcFlags');
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Correct The Scythe of Elune Script (credit cmangos)
DELETE FROM `event_scripts` WHERE `id`=664;
INSERT INTO `event_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(664, 0, 0, 10, 3946, 13000, 1, 10, 0, 0, 0, 0, 8, 0, -1, 1, -11141.1, -1152.68, 43.5816, 4.7822, 0, 'The Scythe of Elune: Mound of Dirt - Summon Creature Velinde Starsong'),
(664, 1, 0, 35, 0, 0, 0, 0, 0, 0, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Scythe of Elune: Velinde Starsong - Set Orientation'),
(664, 5, 0, 0, 0, 0, 0, 0, 0, 0, 8, 2, 1359, 0, 0, 0, 0, 0, 0, 0, 0, 'The Scythe of Elune: Velinde Starsong - Say Text'),
(664, 9, 0, 0, 0, 0, 0, 0, 0, 0, 8, 2, 1360, 0, 0, 0, 0, 0, 0, 0, 0, 'The Scythe of Elune: Velinde Starsong - Say Text'),
(664, 9, 1, 1, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Scythe of Elune - Velinde Starsong - Emote OneShotCry');
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Add Pearl Diving Script (credit cmangos)
UPDATE `quest_template` SET `CompleteScript`=705 WHERE  `entry`=705 AND `patch`=0;

DELETE FROM `generic_scripts` WHERE `id` IN (70501, 70502);
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(70501, 1, 0, 60, 3, 1, 0, 0, 0, 0, 0, 0, 0, 601301, 0, 0, 0, 0, 0, 0, 0, 'Pearl Diving - Wayward Buzzard - Start Waypoints'),
(70502, 1, 0, 60, 3, 1, 0, 0, 0, 0, 0, 0, 0, 601301, 0, 0, 0, 0, 0, 0, 0, 'Pearl Diving - Wayward Buzzard - Start Waypoints');
DELETE FROM `creature_movement_special` WHERE `id` = 601301;
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`, `path_id`) VALUES
(601301, 1, -6752.36, -3161.91, 244.696, 100, 0, 0, 0, 0),
(601301, 2, -6756.26, -3154.47, 243.139, 100, 0, 0, 0, 0),
(601301, 3, -6759.12, -3146.12, 242.102, 100, 0, 0, 11, 0),
(601301, 4, -6759.85, -3144.31, 241.801, 100, 0, 0, 0, 0),
(601301, 5, -6766.58, -3169, 240.869, 100, 0, 0, 0, 0),
(601301, 6, -6760.42, -3182.86, 240.869, 100, 0, 0, 0, 0),
(601301, 7, -6752.39, -3193.63, 240.869, 100, 0, 0, 0, 0),
(601301, 8, -6739.17, -3199.83, 241.064, 100, 0, 0, 0, 0),
(601301, 9, -6730.48, -3200.03, 244.274, 100, 0, 0, 4, 0);

DELETE FROM `quest_end_scripts` WHERE `id`=705;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(705, 0, 0, 31, 6013, 60, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pearl Diving - Rigglefuzz - Terminate Script'),
(705, 0, 1, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3.66519, 0, 'Pearl Diving - Rigglefuzz - Set Orientation'),
(705, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1021, 0, 0, 0, 0, 0, 0, 0, 0, 'Pearl Diving - Rigglefuzz - Say Text'),
(705, 0, 3, 10, 6013, 22951, 0, 0, 0, 0, 0, 0, 0, 70502, -1, 1, -6744, -3170.58, 249.026, 2.3911, 0, 'Pearl Diving - Rigglefuzz - Summon Creature Wayward Buzzard'),
(705, 0, 4, 10, 6013, 22951, 0, 0, 0, 0, 0, 0, 0, 70501, -1, 1, -6749.5, -3168.62, 246.617, 1.97383, 0, 'Pearl Diving - Rigglefuzz - Summon Creature Wayward Buzzard'),
(705, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1023, 0, 0, 0, 0, 0, 0, 0, 0, 'Pearl Diving - Rigglefuzz - Say Text'),
(705, 7, 0, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5.20016, 0, 'Pearl Diving - Rigglefuzz - Set Orientation'),
(705, 7, 0, 0, 0, 0, 0, 0, 6013, 60, 10, 0, 1022, 0, 0, 0, 0, 0, 0, 0, 0, 'Pearl Diving - Rigglefuzz - Say Text'),
(705, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1024, 0, 0, 0, 0, 0, 0, 0, 0, 'Pearl Diving - Rigglefuzz - Say Text'),
(705, 10, 0, 15, 5134, 0, 0, 0, 6013, 60, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pearl Diving - Rigglefuzz - Cast Spell Flash Bomb'),
(705, 11, 0, 15, 5134, 0, 0, 0, 6013, 60, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pearl Diving - Rigglefuzz - Cast Spell Flash Bomb'),
(705, 11, 0, 15, 5134, 0, 0, 0, 6013, 60, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pearl Diving - Rigglefuzz - Cast Spell Flash Bomb');
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Add Thandol Span Script
UPDATE `quest_template` SET `StartScript`=632 WHERE  `entry`=632;

-- 390: Creature 4062 Is Dead Within 50 Yards Of The Target
DELETE FROM `conditions` WHERE `condition_entry` = 390;
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES
(390, 20, 4062, 50, 1, 0, 1);

DELETE FROM `creature_movement_special` WHERE `id` = 63101;
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`, `path_id`) VALUES
(63101, 1, -2372.22388, -2483.4741, 74.6390, 100, 0, 0, 0, 0),
(63101, 2, -2367.6418, -2490.2195, 75.35177, 100, 0, 0, 0, 0),
(63101, 3, -2376.869, -2491.26, 75.351776, 100, 0, 0, 0, 0),
(63101, 4, -2372.9832, -2495.345, 75.35177, 100, 0, 0, 0, 0),
(63101, 5, -2372.842, -2498.6948, 75.35177, 100, 0, 0, 0, 0),
(63101, 6, -2376.5527, -2499.2554, 75.35176, 100, 0, 0, 0, 0),
(63101, 7, -2376.8274, -2504.2578, 78.392426, 100, 0, 0, 0, 0),
(63101, 8, -2376.3125, -2511.2085, 82.58866, 100, 0, 0, 0, 0),
(63101, 9, -2372.1162, -2514.5889, 82.35177, 100, 0, 0, 0, 0);

DELETE FROM `generic_scripts` WHERE `id`=63101;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(63101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 782, 0, 0, 0, 0, 0, 0, 0, 0, 'Dark Iron Bombardier - Talk'),
(63101, 0, 1, 26, 0, 0, 0, 0, 30, 0, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dark Iron Bombardier - Start Attack');

DELETE FROM `generic_scripts` WHERE `id`=63102;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(63102, 0, 0, 60, 3, 1, 0, 0, 0, 0, 0, 0, 0, 63101, 0, 0, 0, 0, 0, 0, 0, 'Dark Iron Bombardier - Start Waypoints'),
(63102, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 783, 784, 0, 0, 0, 0, 0, 0, 0, 'Dark Iron Bombardier - Talk');

DELETE FROM `quest_start_scripts` WHERE `id`=632;
INSERT INTO `quest_start_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(632, 0, 0, 31, 4062, 50, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Thandol Span - Terminate Script'),
(632, 0, 1, 10, 4062, 300000, 0, 0, 0, 0, 0, 0, 0, 63101, -1, 1, -2370.93, -2523.82, 74.639, 2.56563, 390, 'The Thandol Span - Summon Creature'),
(632, 0, 2, 10, 4062, 300000, 0, 0, 0, 0, 0, 0, 0, 63102, -1, 1, -2372.22, -2483.47, 74.639, 0.174533, 390, 'The Thandol Span - Summon Creature');

-- Events list for Dark Iron Saboteur
DELETE FROM `creature_ai_events` WHERE `creature_id`=1052;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(105202, 1052, 0, 2, 0, 100, 0, 15, 0, 0, 0, 105202, 0, 0, 'Dark Iron Saboteur - Say and Text Emote then Cast Sapper Explode at 15% HP'),
(105203, 1052, 0, 4, 0, 100, 1, 0, 0, 0, 0, 105201, 0, 0, 'Dark Iron Saboteur - Talk on Aggro');
DELETE FROM `creature_ai_scripts` WHERE `id`=105201;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(105201, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1935, 1934, 1936, 0, 0, 0, 0, 0, 0, 'Dark Iron Saboteur - Talk');

UPDATE `creature` SET `movement_type` = 2 WHERE `guid` = 12039;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`, `path_id`) VALUES
(12039, 1, -2374.99, -2492.29, 82.2887, 100, 20000, 0, 0, 0),
(12039, 2, -2367.67, -2495.42, 82.2887, 100, 0, 0, 0, 0),
(12039, 3, -2366.35, -2501.89, 82.2887, 100, 0, 0, 0, 0),
(12039, 4, -2367.59, -2510.21, 82.2887, 100, 0, 0, 0, 0),
(12039, 5, -2372.84, -2513.92, 82.2887, 100, 20000, 0, 0, 0),
(12039, 6, -2367.59, -2510.21, 82.2887, 100, 0, 0, 0, 0),
(12039, 7, -2366.35, -2501.89, 82.2887, 100, 0, 0, 0, 0),
(12039, 8, -2367.67, -2495.42, 82.2887, 100, 0, 0, 0, 0);
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Increase Enraged Stanley Xp Multiplier (credit cmangos)
UPDATE `creature_template` SET `xp_multiplier` = 7 WHERE `entry` = 2275;
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Add Correct Completion Text to Quest Id 7907 (Taken from WoWHead)
UPDATE `quest_template` SET `OfferRewardText` = 'So you have put together a deck of Beasts. Your gesture of returning it to us will create a tie between you and the Darkmoon that will not soon be forgotten. Allow me to present you with one of the greater darkmoon cards as a small token of our appreciation.' WHERE `entry` = 7907;
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Stop Creature Flying Across Map
UPDATE `creature` SET `position_x` = -1034.05, `position_y` = -2803.35, `position_z` = 49.2393 WHERE `guid` = 12048;
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Add Missing Arin'sor and Obi 1 Spawn
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `id5`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(1881, 11702, 0, 0, 0, 0, 1, -6342.67, -660.912, -179.816, 2.32129, 300, 300, 0, 100, 0, 0, 0, 0, 0, 10),
(1882, 11884, 0, 0, 0, 0, 1, -6342.67, -660.912, -179.83, 3.59357, 300, 300, 15, 100, 0, 1, 0, 0, 0, 10);
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Add Missing Shen'dralar Zealot Spawns (credit cmangos)
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `id5`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(1885, 14369, 0, 0, 0, 0, 429, 121.172, 468.779, -48.3799, 4.67748, 7200, 7200, 0, 100, 0, 0, 0, 0, 0, 10), -- Shen'dralar Zealot
(1886, 14369, 0, 0, 0, 0, 429, 121.754, 476.583, -48.3816, 1.58825, 7200, 7200, 0, 100, 0, 0, 0, 0, 0, 10), -- Shen'dralar Zealot
(1947, 14369, 0, 0, 0, 0, 429, 186.675, 457.618, -48.3594, 4.79965, 7200, 7200, 0, 100, 0, 0, 0, 0, 0, 10), -- Shen'dralar Zealot
(2026, 14369, 0, 0, 0, 0, 429, 186.983, 479.252, -48.371, 1.5708, 7200, 7200, 0, 100, 0, 0, 0, 0, 0, 10), -- Shen'dralar Zealot
(2070, 14369, 0, 0, 0, 0, 429, 114.44, 602.178, -27.8082, 3.10669, 7200, 7200, 0, 100, 0, 0, 0, 0, 0, 10), -- Shen'dralar Zealot
(2072, 14369, 0, 0, 0, 0, 429, 153.425, 626.966, -27.8899, 0.017453, 7200, 7200, 0, 100, 0, 0, 0, 0, 0, 10), -- Shen'dralar Zealot
(2080, 14369, 0, 0, 0, 0, 429, 192.928, 587.385, -48.3836, 6.17846, 7200, 7200, 0, 100, 0, 0, 0, 0, 0, 10), -- Shen'dralar Zealot
(2095, 14369, 0, 0, 0, 0, 429, 163.733, 555.391, -48.3836, 3.1765, 7200, 7200, 0, 100, 0, 0, 0, 0, 0, 10), -- Shen'dralar Zealot
(2196, 14369, 0, 0, 0, 0, 429, 188.172, 537.305, -48.467, 1.5966, 7200, 7200, 5, 100, 0, 1, 0, 0, 0, 10), -- Shen'dralar Zealot
(2212, 14369, 0, 0, 0, 0, 429, 130.955, 524.283, -48.0481, 1.61341, 7200, 7200, 5, 100, 0, 1, 0, 0, 0, 10); -- Shen'dralar Zealot
DELETE FROM `creature` WHERE `guid` IN (84206, 84207);

-- For Future Ref: More Blizzlike Goodness From Cmangos https://github.com/cmangos/tbc-db/pull/1251


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
