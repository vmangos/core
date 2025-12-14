DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20251022020013');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20251022020013');
-- Add your query below.


-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Add Missing Script
UPDATE `gameobject_template` SET `flags`=4, `script_name` = 'go_corrupted_plant' WHERE `entry` = 174597;
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
(2514, 2452, 20, 0, 1, 2, 0, 0, 10),
(2515, 2452, 40, 0, 1, 2, 0, 0, 10);

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
UPDATE `creature_template` SET `spell_id1` = 0, `auras` = '15733 11966' WHERE `entry` = 15201;
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
DELETE FROM `skinning_loot_template` WHERE `entry` = 8204;
UPDATE `creature_template` SET `skinning_loot_id` = 0 WHERE `entry` = 8204;
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Other unskinnable mobs.
UPDATE `creature_template` SET `skinning_loot_id` = 0 WHERE `entry` IN (14476, 4242, 4243, 5347, 6582, 7376, 10619, 10979, 11181, 11671, 11672, 11710, 11896, 11897, 14344, 14477, 14566, 15172, 15338, 15718, 11741, 11740, 14476, 14344);
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Correct Serpentbloom Spawns Ammount
UPDATE `pool_template` SET `max_limit` = 13 WHERE `entry` = 4893;
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Events list for Trade Master Kovic
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(844402, 8444, 0, 4, 0, 100, 0, 0, 0, 0, 0, 844402, 0, 0, 'Trade Master Kovic - Talk on Aggro');
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
-- Remove Duplicate Object
DELETE FROM `gameobject` WHERE `guid` = 21;
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Remove Incorrect Pre-Quests
UPDATE `quest_template` SET `PrevQuestId` = 0 WHERE `entry` IN (8846, 8847, 8848, 8849, 8850, 8851, 8852, 8853, 8854, 8855);
UPDATE `quest_template` SET `PrevQuestId` = 0 WHERE `PrevQuestId` IN (8795, 8792);
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Correct Rethban Gauntlet Complete Script (credit cmangos)
DELETE FROM `quest_end_scripts` WHERE `id`=1699;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1699, 0, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Rethban Gauntlet: Yorus Barleybrew - Remove NpcFlags'),
(1699, 0, 1, 1, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Rethban Gauntlet: Yorus Barleybrew - Emote Shout'),
(1699, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2308, 0, 0, 0, 0, 0, 0, 0, 0, 'The Rethban Gauntlet: Yorus Barleybrew - Say Text'),
(1699, 0, 3, 20, 0, 0, 0, 0, 379, 20, 10, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Rethban Gauntlet: Darcy - Stop Waypoint'),
(1699, 0, 4, 35, 0, 0, 0, 0, 379, 20, 10, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Rethban Gauntlet: Darcy - Face Player'),
(1699, 1, 0, 1, 4, 0, 0, 0, 5620, 20, 10, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Rethban Gauntlet: Bartender Wental - Emote Cheer'),
(1699, 3, 0, 1, 21, 0, 0, 0, 346, 20, 10, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Rethban Gauntlet: Barkeep Daniels - Emote OneShotApplaud'),
(1699, 3, 1, 1, 21, 0, 0, 0, 379, 20, 10, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Rethban Gauntlet: Darcy - Emote OneShotApplaud'),
(1699, 5, 0, 1, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Rethban Gauntlet: Yorus Barleybrew - Emote Cheer'),
(1699, 5, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2309, 0, 0, 0, 0, 0, 0, 0, 0, 'The Rethban Gauntlet: Yorus Barleybrew - Say Text'),
(1699, 6, 0, 1, 4, 0, 0, 0, 379, 20, 10, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Rethban Gauntlet: Darcy - Emote OneShotCheer'),
(1699, 6, 1, 1, 21, 0, 0, 0, 5620, 20, 10, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Rethban Gauntlet: Bartender Wental - Emote OneShotApplaud'),
(1699, 9, 0, 1, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Rethban Gauntlet: Yorus Barleybrew - Emote Cheer'),
(1699, 9, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2309, 0, 0, 0, 0, 0, 0, 0, 0, 'The Rethban Gauntlet: Yorus Barleybrew - Say Text'),
(1699, 10, 0, 20, 2, 0, 12, 0, 379, 20, 10, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Rethban Gauntlet: Darcy - Start Waypoint'),
(1699, 13, 0, 1, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Rethban Gauntlet: Yorus Barleybrew - Emote Cheer'),
(1699, 13, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2309, 0, 0, 0, 0, 0, 0, 0, 0, 'The Rethban Gauntlet: Yorus Barleybrew - Say Text'),
(1699, 14, 0, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Rethban Gauntlet: Yorus Barleybrew - Add NpcFlags');
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
(5763, 0, 0, 15, 22943, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Doc Mixilpixil - Cast Spell Player Lost Eau d\' Mixilpixil DND');
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Correct Sully Balloo\'s Letter Complete Script (credit cmangos)
DELETE FROM `quest_end_scripts` WHERE `id`=637;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(637, 0, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sully Balloo\'s Letter: Sara Balloo - Remove NpcFlags'),
(637, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 792, 0, 0, 0, 0, 0, 0, 0, 0, 'Sully Balloo\'s Letter: Sara Balloo - Say EmotedText'),
(637, 6, 0, 1, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sully Balloo\'s Letter: Sara Balloo - Emote Roar'),
(637, 6, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 793, 0, 0, 0, 0, 0, 0, 0, 0, 'Sully Balloo\'s Letter: Sara Balloo - Say Text'),
(637, 10, 0, 1, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sully Balloo\'s Letter: Sara Balloo - Emote Cry'),
(637, 15, 0, 1, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sully Balloo\'s Letter: Sara Balloo - Emote Beg'),
(637, 20, 0, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sully Balloo\'s Letter: Sara Balloo - Add NpcFlags');
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Correct The Scythe of Elune Script (credit cmangos)
DELETE FROM `event_scripts` WHERE `id`=664;
INSERT INTO `event_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(664, 0, 0, 10, 3946, 13000, 1, 10, 0, 0, 0, 0, 8, 0, -1, 1, -11141.1, -1152.68, 43.5816, 4.7822, 0, 'The Scythe of Elune: Mound of Dirt - Summon Creature Velinde Starsong'),
(664, 1, 0, 35, 0, 0, 0, 0, 3946, 30, 10, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Scythe of Elune: Velinde Starsong - Set Orientation'),
(664, 5, 0, 0, 0, 0, 0, 0, 3946, 30, 10, 2, 1359, 0, 0, 0, 0, 0, 0, 0, 0, 'The Scythe of Elune: Velinde Starsong - Say Text'),
(664, 9, 0, 0, 0, 0, 0, 0, 3946, 30, 10, 2, 1360, 0, 0, 0, 0, 0, 0, 0, 0, 'The Scythe of Elune: Velinde Starsong - Say Text'),
(664, 9, 1, 1, 18, 0, 0, 0, 3946, 30, 10, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Scythe of Elune: Velinde Starsong - Emote OneShotCry');
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Add Pearl Diving Script (credit cmangos)
UPDATE `quest_template` SET `CompleteScript`=705 WHERE  `entry`=705 AND `patch`=0;

DELETE FROM `generic_scripts` WHERE `id` IN (70501, 70502);
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(70501, 1, 0, 60, 3, 1, 0, 0, 0, 0, 0, 0, 0, 601301, 0, 0, 0, 0, 0, 0, 0, 'Pearl Diving: Wayward Buzzard - Start Waypoints'),
(70502, 1, 0, 60, 3, 1, 0, 0, 0, 0, 0, 0, 0, 601301, 0, 0, 0, 0, 0, 0, 0, 'Pearl Diving: Wayward Buzzard - Start Waypoints');
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
(705, 0, 0, 31, 6013, 60, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pearl Diving: Rigglefuzz - Terminate Script'),
(705, 0, 1, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3.66519, 0, 'Pearl Diving: Rigglefuzz - Set Orientation'),
(705, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1021, 0, 0, 0, 0, 0, 0, 0, 0, 'Pearl Diving: Rigglefuzz - Say Text'),
(705, 0, 3, 10, 6013, 22951, 0, 0, 0, 0, 0, 0, 0, 70502, -1, 1, -6744, -3170.58, 249.026, 2.3911, 0, 'Pearl Diving: Rigglefuzz - Summon Creature Wayward Buzzard'),
(705, 0, 4, 10, 6013, 22951, 0, 0, 0, 0, 0, 0, 0, 70501, -1, 1, -6749.5, -3168.62, 246.617, 1.97383, 0, 'Pearl Diving: Rigglefuzz - Summon Creature Wayward Buzzard'),
(705, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1023, 0, 0, 0, 0, 0, 0, 0, 0, 'Pearl Diving: Rigglefuzz - Say Text'),
(705, 7, 0, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5.20016, 0, 'Pearl Diving: Rigglefuzz - Set Orientation'),
(705, 7, 0, 0, 0, 0, 0, 0, 6013, 60, 10, 0, 1022, 0, 0, 0, 0, 0, 0, 0, 0, 'Pearl Diving: Rigglefuzz - Say Text'),
(705, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1024, 0, 0, 0, 0, 0, 0, 0, 0, 'Pearl Diving: Rigglefuzz - Say Text'),
(705, 10, 0, 15, 5134, 0, 0, 0, 6013, 60, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pearl Diving: Rigglefuzz - Cast Spell Flash Bomb'),
(705, 11, 0, 15, 5134, 0, 0, 0, 6013, 60, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pearl Diving: Rigglefuzz - Cast Spell Flash Bomb'),
(705, 11, 0, 15, 5134, 0, 0, 0, 6013, 60, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pearl Diving: Rigglefuzz - Cast Spell Flash Bomb');
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
(632, 0, 0, 31, 4062, 50, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Thandol Span: Terminate Script'),
(632, 0, 1, 10, 4062, 300000, 0, 0, 0, 0, 0, 0, 0, 63101, -1, 1, -2370.93, -2523.82, 74.639, 2.56563, 390, 'The Thandol Span: Summon Creature'),
(632, 0, 2, 10, 4062, 300000, 0, 0, 0, 0, 0, 0, 0, 63102, -1, 1, -2372.22, -2483.47, 74.639, 0.174533, 390, 'The Thandol Span: Summon Creature');

-- Events list for Dark Iron Saboteur
DELETE FROM `creature_ai_events` WHERE `creature_id`=1052;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(105202, 1052, 0, 2, 0, 100, 0, 15, 0, 0, 0, 105202, 0, 0, 'Dark Iron Saboteur - Say and Text Emote then Cast Sapper Explode at 15% HP'),
(105203, 1052, 0, 4, 0, 100, 0, 0, 0, 0, 0, 105201, 0, 0, 'Dark Iron Saboteur - Talk on Aggro');
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
(1886, 11702, 0, 0, 0, 0, 1, -6342.67, -660.912, -179.816, 2.32129, 300, 300, 0, 100, 0, 0, 0, 0, 0, 10),
(1947, 11884, 0, 0, 0, 0, 1, -6342.67, -660.912, -179.83, 3.59357, 300, 300, 15, 100, 0, 1, 0, 0, 0, 10);
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Add Missing Shen'dralar Zealot Spawns (credit cmangos)
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `id5`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(2026, 14369, 0, 0, 0, 0, 429, 121.172, 468.779, -48.3799, 4.67748, 7200, 7200, 0, 100, 100, 0, 0, 0, 0, 10), -- Shen'dralar Zealot
(2070, 14369, 0, 0, 0, 0, 429, 121.754, 476.583, -48.3816, 1.58825, 7200, 7200, 0, 100, 100, 0, 0, 0, 0, 10), -- Shen'dralar Zealot
(2072, 14369, 0, 0, 0, 0, 429, 186.675, 457.618, -48.3594, 4.79965, 7200, 7200, 0, 100, 100, 0, 0, 0, 0, 10), -- Shen'dralar Zealot
(2080, 14369, 0, 0, 0, 0, 429, 186.983, 479.252, -48.371, 1.5708, 7200, 7200, 0, 100, 100, 0, 0, 0, 0, 10), -- Shen'dralar Zealot
(2095, 14369, 0, 0, 0, 0, 429, 114.44, 602.178, -27.8082, 3.10669, 7200, 7200, 0, 100, 100, 0, 0, 0, 0, 10), -- Shen'dralar Zealot
(2115, 14369, 0, 0, 0, 0, 429, 153.425, 626.966, -27.8899, 0.017453, 7200, 7200, 0, 100, 100, 0, 0, 0, 0, 10), -- Shen'dralar Zealot
(2120, 14369, 0, 0, 0, 0, 429, 192.928, 587.385, -48.3836, 6.17846, 7200, 7200, 0, 100, 100, 0, 0, 0, 0, 10), -- Shen'dralar Zealot
(2126, 14369, 0, 0, 0, 0, 429, 163.733, 555.391, -48.3836, 3.1765, 7200, 7200, 0, 100, 100, 0, 0, 0, 0, 10), -- Shen'dralar Zealot
(2196, 14369, 0, 0, 0, 0, 429, 188.172, 537.305, -48.467, 1.5966, 7200, 7200, 5, 100, 100, 1, 0, 0, 0, 10), -- Shen'dralar Zealot
(2212, 14369, 0, 0, 0, 0, 429, 130.955, 524.283, -48.0481, 1.61341, 7200, 7200, 5, 100, 100, 1, 0, 0, 0, 10); -- Shen'dralar Zealot
DELETE FROM `creature` WHERE `guid` IN (84206, 84207);
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Creatures Dont Have Mana
UPDATE `creature` SET `mana_percent` = 0 WHERE  `guid` IN (75066, 75065);
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Unstuck Creature
UPDATE `creature` SET `position_x` = -471.59, `position_y` = 1956.37, `position_z` = 115.50, `movement_type` = 1, `wander_distance` = 10 WHERE `guid` = 28811;
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Add Missing Quest Giver (credit cmangos)
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES
(6929, 5927); -- Innkeeper Gryshka
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Remove Redundant npc_gossip Entries
DELETE FROM `npc_gossip` WHERE `npc_guid` IN (42301, 53646, 86167, 86184, 89359, 89360, 89361, 89362, 89363, 89364, 89365, 89366, 89367, 89368, 89369, 89370, 89371, 89372, 89375, 89376, 89379, 89380, 89381, 89382, 89383, 89384, 89385, 89386, 89387, 89388, 89389, 89390, 89391, 89392, 89393, 89394, 89395, 89396, 89397, 89398, 89405, 89406, 89413, 89414, 89416, 89417, 89418, 89432, 89440);
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Gaffer Jacks Requires Fishing 30
UPDATE `quest_template` SET `RequiredSkillValue` = 30 WHERE `entry`= 1579;
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Events list for Ancient Equine Spirit
UPDATE `creature_template` SET `auras` = '17327', `ai_name` = 'EventAI' WHERE `entry` = 14566;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(1456601, 14566, 0, 11, 0, 100, 0, 0, 0, 0, 0, 1456601, 0, 0, 'Ancient Equine Spirit - Talk on Spawn');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1456601, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9763, 0, 0, 0, 0, 0, 0, 0, 0, 'Ancient Equine Spirit - Talk');
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Add Missing Aura
UPDATE `creature_template` SET `auras` = '17327' WHERE `entry` = 14306;
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Correct Creature Position
UPDATE `creature` SET `position_x` = -1686.72, `position_y` = -4326.52, `position_z` = 3.89036, `orientation` = 4.75596 WHERE `guid` = 14358;
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Correct Creature Position
UPDATE `creature` SET `position_x`=-12358.4, `position_y`=-977.508, `position_z`=14.1008, `orientation`=1.2761 WHERE  `guid`=855;
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Creatures Should Wander
UPDATE `creature` SET `wander_distance` = 2, `movement_type` = 1 WHERE `guid` IN (2488, 2161, 2173, 2163, 2165, 2176, 2488, 2491, 2511);
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Low Level Creatures Should Not Be Skinnable
UPDATE `creature_template` SET `skinning_loot_id` = 0  WHERE `skinning_loot_id` = 100008;
DELETE FROM `skinning_loot_template` WHERE `entry`=100008;
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Stop Creature Clipping Through Walls
UPDATE `creature` SET `wander_distance` = 2 WHERE `guid` = 16985;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
