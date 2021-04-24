DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210127234235');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210127234235');
-- Add your query below.


-- Add vendor menu option to innkeeper grosk.
-- https://github.com/the-hyjal-project/bugtracker/issues/122
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES 
(1290, 4, 1, "I want to browse your goods.", 3370, 3, 4, 1, 0, 0, 0, 0, "", 0, 0);

-- Don't remove Immune to NPC flag from Calvin Montague when quest A Rogue's Deal starts.
-- https://github.com/the-hyjal-project/bugtracker/issues/210
DELETE FROM `quest_start_scripts` WHERE `id`=590;
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (590, 0, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'A Rogue\'s Deal 2: Calvin Montague - Set Phase to 1');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (590, 0, 52, 5, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'A Rogue\'s Deal 2: Calvin Montague - Make Unkillable');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (590, 0, 61, 590, 120, 0, 0, 0, 0, 0, 0, 0, 591, 249, 590, 0, 0, 0, 0, 0, 'A Rogue\'s Deal 2 - Start Scripted Map Event');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (590, 0, 22, 168, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'A Rogue\'s Deal 2: Calvin Montague - Set Faction to Enemy');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (590, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'A Rogue\'s Deal 2: Calvin Montague - Remove Quest Giver Flag');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (590, 0, 4, 46, 256, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'A Rogue\'s Deal 2: Calvin Montague - Remove Immune To Player Flag');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (590, 1, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'A Rogue\'s Deal 2: Calvin Montague - Start Attack');

-- Remove Hillsbrad Human Skull from pickpocketing loot table.
DELETE FROM `pickpocketing_loot_template` WHERE item = 3692;

-- Prevent following creatures from casting lightning shield while another spell is being casted Fix #179
-- https://github.com/the-hyjal-project/bugtracker/issues/179
-- 4642 Magram Stormer 
DELETE FROM `creature_ai_scripts` WHERE `id` = 464203;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(464203, 0, 15, 8788, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Magram Stormer - Cast Spell Lightning Shield');
-- 6138 Arkorran Summoner
DELETE FROM `creature_ai_scripts` WHERE `id` = 613803;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(613803, 0, 15, 12550, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Arkkoran Oracle - Cast Spell Lightning Shield');
-- 5826 Geolord Mottle
DELETE FROM `creature_ai_scripts` WHERE `id` = 582602;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(582602, 0, 15, 324, 32, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Geolord Mottle - Cast Spell Lightning Shield');
-- 5236 Gordunni Shaman
DELETE FROM `creature_ai_scripts` WHERE `id` = 523602;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(523602, 0, 15, 8134, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gordunni Shaman - Cast Spell Lightning Shield');
-- 752 Marsh Oracle
DELETE FROM `creature_ai_scripts` WHERE `id` = 75203;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(75203, 0, 15, 12550, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Marsh Oracle - Cast Spell Lightning Shield');
-- 1544 Vile fin minor oracle
DELETE FROM `creature_ai_scripts` WHERE `id` = 154401;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(154401, 0, 15, 12550, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Vile Fin Minor Oracle - Cast Spell Lightning Shield');
-- Prevent following creatures from casting Frost Armor while another spell is being casted
-- 507 fenros
DELETE FROM `creature_ai_scripts` WHERE `id` = 50704;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(50704, 0, 15, 12544, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Fenros - Cast Spell Frost Armor');
-- 1507 Scarlet Initiate
DELETE FROM `creature_ai_scripts` WHERE `id` = 150701;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(150701, 0, 15, 12544, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Initiate - Cast Spell Frost Armor');
-- 1729 Defias Evoker
DELETE FROM `creature_ai_scripts` WHERE `id` = 172904;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(172904, 0, 15, 12544, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Defias Evoker - Cast Spell Frost Armor');
-- 1732 Defias Squalshaper
DELETE FROM `creature_ai_scripts` WHERE `id` = 173204;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(173204, 0, 15, 12544, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Defias Squallshaper - Cast Spell Frost Armor');

-- Remove "Disease Cloud" from NPC "Delfrum Flintbeard".
-- https://github.com/the-hyjal-project/bugtracker/issues/230
UPDATE `creature_template` SET `auras`='' WHERE  `entry` = 6299;

-- https://github.com/the-hyjal-project/bugtracker/issues/186
-- Jadefire Felsworn shouldn't flee
DELETE FROM `creature_ai_scripts` WHERE `id` = 710901;
DELETE FROM `creature_ai_events` WHERE `creature_id` = 7109;
UPDATE `creature_template` SET `ai_name`='' WHERE  `entry` = 7109;
-- Jadefire Hellcaller shouldn't flee
DELETE FROM `creature_ai_scripts` WHERE `id` = 711101;
DELETE FROM `creature_ai_events` WHERE `creature_id` = 7111;
UPDATE `creature_template` SET `ai_name`='' WHERE  `entry`=7111 AND `patch`=0;

-- Item "Samophlange Manual Page" requires now the specific quest to drop.
-- Fix https://github.com/the-hyjal-project/bugtracker/issues/213
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = -8 WHERE `item` = 11148;

-- Add missing spawns for "The Shade of Elura".
-- Fix https://github.com/the-hyjal-project/bugtracker/issues/234
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `state`, `spawntimesecsmin`, `spawntimesecsmax`) VALUES (48873, 86492, 1, 6426.58, 790.671, -18.493, 5.77704, 0, 0, -0.25038, 0.968148, 1, 180, 180);
UPDATE `gameobject` SET `orientation`=5.34071, `rotation2`=-0.45399, `rotation3`=0.891007 WHERE `guid`=48793;
UPDATE `gameobject` SET `orientation`=0.698131, `rotation2`=0.34202, `rotation3`=0.939693 WHERE `guid`=48796;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `state`, `spawntimesecsmin`, `spawntimesecsmax`) VALUES (48874, 86492, 1, 6316.11, 754.744, -12.9295, 0.820303, 0, 0, 0.398748, 0.91706, 1, 180, 180);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `state`, `spawntimesecsmin`, `spawntimesecsmax`) VALUES (48875, 86492, 1, 6375.59, 871.36, -36.6744, 4.86947, 0, 0, -0.649447, 0.760406, 1, 180, 180);
UPDATE `gameobject` SET `orientation`=-2.30383, `rotation2`=-0.913545, `rotation3`=0.406738 WHERE `guid`=48639;

-- Quest "Supplies for the Crossroads" no longer require quest "Disrupt the Attacks" to pick up.
-- Fix https://github.com/the-hyjal-project/bugtracker/issues/197
UPDATE `quest_template` SET `PrevQuestId`= 0 WHERE `entry` = 5041;

-- NPC "Whip Lashers" are now immune to nature spells.
-- Fix https://github.com/the-hyjal-project/bugtracker/issues/187
UPDATE `creature_template` SET `school_immune_mask` = 8 WHERE `entry` = 13022;

-- Quest "Kurzen's Mystery" should requrie "Bad Medicine" and "The Second Rebellion".
-- Fix https://github.com/the-hyjal-project/bugtracker/issues/181
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (776, 8, 203, 0, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (777, 8, 204, 0, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (778, -1, 776, 777, 0, 0, 0);
UPDATE `quest_template` SET `RequiredCondition`=778, `PrevQuestId`= 0 WHERE `entry` = 207;

-- Quest "Forsaken Diseases" is no longer available without completing the prerequisite quest "Kayneth Stillwind".
-- Fix https://github.com/the-hyjal-project/bugtracker/issues/156
UPDATE `quest_template` SET `PrevQuestId`= 4581 WHERE `entry` = 1011;

-- Quest "Deeprun Rat Roundup" has fixed.
-- Fix https://github.com/the-hyjal-project/bugtracker/issues/124
UPDATE `creature_template` SET `faction`= 35 WHERE `entry` = 13017;

-- Reduce the total amount of spawning mining nodes in Westfall mines.
-- Fix https://github.com/the-hyjal-project/bugtracker/issues/19
UPDATE `pool_template` SET `max_limit`= 9 WHERE `entry` = 1112;
UPDATE `pool_template` SET `max_limit`= 8 WHERE `entry` = 1111;

-- Shade of Jin'do should be immune to AoE
UPDATE `creature_template` SET `health_min`= 1526, `health_max`= 1526, `flags_extra`=`flags_extra` | 16384 WHERE `entry` = 14986;

-- Inferno shouldn't drop money
UPDATE `creature_template` SET `gold_min` = 0, `gold_max` = 0 WHERE `entry` = 89;

-- Fix Mage quest Report to Jennea #287
INSERT INTO `creature_questrelation` (`id`, `quest`, `patch_max`) VALUES
(328, 1919, 10);

-- Fix The drop rate of Crawler Leg is too high #298
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`= -32 WHERE `entry` = 2165 AND `item` = 5414;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`= -18 WHERE `entry` = 6788 AND `item` = 5414;

-- Fix The drop rate of Ancient Moonstone Seal is too high #297
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`= -34 WHERE `entry` = 2212 AND `item` = 5338;

-- Fix The drop rate of Grell Earring is too high #296
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`= -42 WHERE `entry` = 2190 AND `item` = 5336;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`= -41 WHERE `entry` = 2189 AND `item` = 5336;

-- Fix The drop rate of Bloodfeather Belt is too high #295
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`= -42 WHERE `entry` = 2015 AND `item` = 5204;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`= -40 WHERE `entry` = 2017 AND `item` = 5204;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`= -40 WHERE `entry` = 2018 AND `item` = 5204;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`= -36 WHERE `entry` = 2019 AND `item` = 5204;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`= -36 WHERE `entry` = 2020 AND `item` = 5204;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`= -34 WHERE `entry` = 2021 AND `item` = 5204;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`= -28 WHERE `entry` = 14431 AND `item` = 5204;

-- Fix Stone drop rates from mining veins are too low #289
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`= 45 WHERE `entry` = 1502 AND `item` = 2835;
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`= 67 WHERE `entry` = 1735 AND `item` = 2835;
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`= 67 WHERE `entry` = 2626 AND `item` = 2835;
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`= 40 WHERE `entry` = 1503 AND `item` = 2836;
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`= 65 WHERE `entry` = 1736 AND `item` = 2836;
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`= 66 WHERE `entry` = 2627 AND `item` = 2836;
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`= 41 WHERE `entry` = 1503 AND `item` = 2836;
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`= 40 WHERE `entry` = 1505 AND `item` = 2838;
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`= 40 WHERE `entry` = 1742 AND `item` = 7912;
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`= 40 WHERE `entry` = 13961 AND `item` = 7912;
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`= 40 WHERE `entry` = 9597 AND `item` = 12365;
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`= 40 WHERE `entry` = 13960 AND `item` = 12365;
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`= 40 WHERE `entry` = 12883 AND `item` = 12365;
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`= 39 WHERE `entry` = 17241 AND `item` = 12365;

-- Fix Defias Cutpurse spawned on a tree.
UPDATE `creature` SET `position_x` = -9472.01, `position_z` = 52.971 WHERE `guid` = 80377;

-- Fixes for Gordunni Dirt Mound.
UPDATE `gameobject_template` SET `size`=0.75, `data7`=0, `data9`=0 WHERE  `entry`=144064; 
UPDATE `spell_script_target` SET `conditionId`=122 WHERE `entry`=11757;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
