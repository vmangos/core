DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20241208211202');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20241208211202');
-- Add your query below.


-- Add Missing Script
UPDATE `gameobject_template` SET `script_name` = 'go_corrupted_plant' WHERE `entry` = 174597;

-- Creature 5469 Shares Spawns With 5470
UPDATE `creature` SET `id2` = 5470 WHERE `id`= 5469;

-- Correct Call For Help For Silithid Hive Drone
UPDATE `creature_ai_scripts` SET `x` = 20 WHERE `id` IN (413301, 413302);

-- Correct State For Object
UPDATE `gameobject` SET `state` = 1 WHERE `guid` = 60099;

-- Prevent Creature From Evading
UPDATE `creature` SET `position_z`=42.3186 WHERE `guid`=11352;

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

-- Remove Unused Quest From NPC
DELETE FROM `creature_questrelation` WHERE  `id` = 14358 AND `quest` = 7462;

-- Correct Spell and Aura For Twilight Flamereaver
UPDATE `creature_template` SET `spell_id1` = 0, `spell_list_id` = 152010, `auras` = '15733 11966' WHERE `entry` = 15201;
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES
(152010, 'Silithus - Twilight Flamereaver', 15732, 100, 1, 0, 0, 0, 1, 27, 4, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- Correct Spell and Aura For Smolderthorn Witch Doctor
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES
(92660, 'Blackrock Spire - Smolderthorn Witch Doctor', 15867, 100, 0, 0, 0, 0, 6, 18, 30, 30, 0, 15869, 100, 0, 0, 0, 0, 6, 18, 30, 30, 0, 8262, 100, 0, 0, 0, 0, 6, 18, 30, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
UPDATE `creature_template` SET `spell_id1` = 9574 WHERE `entry` = 10217;
UPDATE `creature_template` SET `spell_id1` = 0, `spell_id2` = 0, `spell_id3` = 0 WHERE `entry` = 9266;

-- Correct Spellid for Maraudine Windchaser -  credit cmangos (we should sync with ACID)
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES
(46570, 'Desolace - Maraudine Windchaser', 6728, 100, 5, 0, 0, 0, 7, 11, 15, 18, 0, 11986, 100, 15, 0, 0, 0, 0, 0, 17, 21, 0, 9532, 100, 1, 0, 0, 8, 0, 0, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- Events list for Therylune (creature uses cpp script added for future)
UPDATE `creature` SET `wander_distance` = 3, `movement_type` = 1 WHERE `guid` = 36533;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(358401, 3584, 0, 1, 0, 100, 1, 0, 3000, 60000, 100000, 358401, 0, 0, 'Therylune - Talk OOC');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(358401, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 1186, 0, 0, 0, 0, 0, 0, 0, 0, 'Therylune - Talk OOC');

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

-- Update Respawn Times
UPDATE `gameobject` SET `spawntimesecsmin` = 0, `spawntimesecsmax` = 0 WHERE `guid` IN (42673, 42662, 35422, 13767, 16617, 16611, 16610, 13260, 15090, 15099, 32614, 47598, 47599, 47600, 47602, 45008, 6929, 12671, 12194, 11829, 47699, 45014, 35412, 15719, 42620, 49828, 13166, 6849, 45332, 10663, 45719, 45720, 45721, 32686, 49376, 46198, 46199, 13525, 27085, 9986 , 10135, 10030, 17201, 10043, 47905, 12699, 11418, 32387, 14067, 29362);
UPDATE `gameobject` SET `spawntimesecsmin` = 10, `spawntimesecsmax` = 10 WHERE `guid` IN (3996164, 26772, 49695, 12863, 14137, 40668, 11014, 12872, 12864, 12871, 40688, 30277, 15008, 40688, 234778, 350470, 362149, 35792, 29680);
UPDATE `gameobject` SET `animprogress` = 100 WHERE `guid` IN (35876, 82575);

-- Fix Creature Under Map (credit cmangos)
UPDATE `creature` SET `position_x` = 544.298828, `position_y` = -3755.502930, `position_z` = 15.736476, `wander_distance` = 10, `movement_type` = 1 WHERE `guid` = 13565;

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

-- Deathclasp Should Only Be Accompanied with Stonelash Flayers
UPDATE `creature` SET `id2`=0 WHERE  `guid` IN (44396, 44397);

-- Add Missing Condition to Josephine Lister
UPDATE `gossip_menu_option` SET `condition_id` = 374 WHERE `menu_id` = 4844 AND `id` = 0;

-- Remove Duplicate Creatures
DELETE FROM `creature` WHERE `guid` IN (16672, 16722);

-- Defias Rogue Wizard Should Wander
UPDATE `creature` SET `movement_type` = 1, `wander_distance` = 10 WHERE `guid` IN (81164, 81160, 81159, 81166, 81162, 81165, 81161, 81320, 81311, 81294, 81299, 81167, 81172, 81171, 81170, 81176, 81173);

-- Soriid the Devourer Should Not Be Skinnable
DELETE FROM `skinning_loot_template` WHERE `entry` = 100003;
UPDATE `creature_template` SET `skinning_loot_id` = 0 WHERE `entry` = 8204;

-- Correct Serpentbloom Spawns Ammount
UPDATE `pool_template` SET `max_limit` = 13 WHERE `entry` = 4893;

-- Events list for Trade Master Kovic
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(844402, 8444, 0, 4, 0, 100, 1, 0, 0, 0, 0, 844402, 0, 0, 'Trade Master Kovic - Talk on Aggro');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(844402, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4422, 4421, 0, 0, 0, 0, 0, 0, 0, 'Trade Master Kovic - Talk on Aggro');

-- Creatures Should Share ID's
UPDATE `creature` SET `id` = 5333, id2 = 5336 WHERE `guid` IN (51496, 51637, 51497, 51636, 51494, 51635, 51608, 51493, 51554, 51492);

-- Add Description
UPDATE `pool_gameobject` SET `description` = 'Black Lotus' WHERE `guid` IN(3998092, 3998091, 3998090, 3998089, 3998088, 3998087, 3998085, 3998084, 3998081, 3998078, 3998143, 3998148, 3998149, 3998152, 3998153, 3998156, 3998157, 3998176, 3998187, 3998193, 3998197, 3998202, 3998203, 3998204, 3998206, 3998224, 3998245, 3998246, 3998248, 3998249, 3998251);

-- Make Mudrock Spikeshell Skinning Loot Temaplate Eq 100 and add groupid
UPDATE `skinning_loot_template` SET `ChanceOrQuestChance` = 77, `groupid` = 1 WHERE `entry` = 4397 AND `item` = 4234;
UPDATE `skinning_loot_template` SET `ChanceOrQuestChance` = 3, `groupid` = 1 WHERE `entry` = 4397 AND `item` = 4235;
UPDATE `skinning_loot_template` SET `ChanceOrQuestChance` = 20, `groupid` = 1 WHERE `entry` = 4397 AND `item` = 4304;
UPDATE `skinning_loot_template` SET `ChanceOrQuestChance` = 25, `groupid` = 2 WHERE `entry` = 4397 AND `item` = 8167;

-- Remove Dire Pool Object Added In Classic
DELETE FROM `gameobject` WHERE `guid` = 1936;

-- Add Derina Rumdnul Script
UPDATE `creature` SET `wander_distance` = 0, `movement_type` = 2 WHERE `guid` = 9569;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(148401, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 394, 395, 396, 0, 0, 0, 0, 0, 0, 'Derina Rumdnul - Talk');
INSERT INTO `creature_movement_template` VALUES
(1484, 1, -3743.43, -886.878, 11.0101, 100, 360000, 1, 0, 0),
(1484, 2, -3742.26, -876.78, 9.90981, 100, 0, 0, 0, 0),
(1484, 3, -3741.16, -871.94, 9.90022, 100, 8000, 0, 148401, 0);

-- Correct SPAWN Orientation For Squire Maltrake
UPDATE `creature` SET `orientation` = 2.86234 WHERE `guid` = 5598;

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

-- Add Correct Gossip to Joseph Redpath (NOTE: currently his gossip is controlled by a cpp script that only displays the placeholder gossip. If the script is converted to DB in the future this correct gossip menu will be used.)
UPDATE `creature_template` SET `gossip_menu_id` = 3861 WHERE `entry` = 10936;
INSERT INTO `gossip_menu` VALUES
(3861, 4778, 0, 0);
UPDATE `creature` SET `wander_distance` = 1.5, `movement_type` = 1 WHERE `guid` = 53736;

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

-- Update Creature Flags
UPDATE `creature_template` SET `static_flags1` = 4718598 WHERE `entry` = 6237;

-- Remove Duplicate Object
DELETE FROM `gameobject` WHERE `guid` = 21;

-- Remove Incorrect Pre-Quests
UPDATE `quest_template` SET `PrevQuestId` = 0 WHERE `entry` IN (8846, 8847, 8848, 8849, 8850, 8851, 8852, 8853, 8854, 8855);
UPDATE `quest_template` SET `PrevQuestId` = 0 WHERE `PrevQuestId` IN (8795);


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
