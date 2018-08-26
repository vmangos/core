DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180701120208');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180701120208');
-- Add your query below.

-- [Missing Quest] Journey to Astranaar - ok
-- https://github.com/LightsHope/issues/issues/445
UPDATE `quest_template` SET `PrevQuestId`=0 WHERE `entry`=1133 AND `patch`=0;


-- Wrong stats on Clutch of Andros (Patch 1.2 to 1.10) - ok
-- https://github.com/LightsHope/issues/issues/492
UPDATE `item_template` SET `patch`=8 WHERE `entry`=13956 AND `patch`=0;
INSERT INTO `item_template` (`entry`, `class`, `subclass`, `name`, `displayid`, `Quality`, `BuyPrice`, `SellPrice`, `InventoryType`, `ItemLevel`, `RequiredLevel`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `armor`, `delay`, `spellcooldown_5`, `spellcategorycooldown_5`, `bonding`, `Material`, `MaxDurability`, `DisenchantID`) VALUES
(13956, 4, 1, 'Clutch of Andros', 24762, 3, 54751, 10950, 6, 61, 56, 7, 3, 5, 22, 6, 8, 49, 0, 0, 0, 1, 7, 30, 49);


-- Fiora Longears - ok
-- https://github.com/LightsHope/issues/issues/468
UPDATE `quest_template` SET `Details`='Oh, to be at sea once again!  To feel the kiss of the wind, and to have the waves rock me like my blessed mother, long ago!$B$BOh, I wish I had your fortune, good $c, for I see the sea in your future!$B$BIt\'s my job to tell eager souls of the land of Kalimdor, the land of opportunity!  If you\'re willing to try your luck across the sea, then take a ship from here to the lovely port of Theramore.  Speak there with my partner, the elf, Fiora Longears.$B$BShe\'ll start you on your Kalimdor adventure!' WHERE `entry`=1132 AND `patch`=0;


-- Laris Geardawdle missing quest-related gossip - ok
-- https://github.com/LightsHope/issues/issues/493

-- Incorrect gossip for Laris Geardawdle -- old menu id 9532
-- Add missing menu option text and move the old ones to correct id
DELETE FROM `gossip_menu_option` WHERE `menu_id` in (9532, 2405);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES 
(2405, 0, 0, 'GOSSIP_OPTION_QUESTGIVER', 0, 2, 2, 0, 0, 0, 0, 0, '', 0, 0),
(2405, 1, 0, 'Is there a difference between ooze and slime?', 5450, 1, 1, 2406, 0, 0, 0, 0, '', 0, 60035),
(2405, 2, 0, 'What do you mean by "pure?"', 5452, 1, 1, 2407, 0, 0, 0, 0, '', 0, 60035),
(2405, 3, 0, 'Are there any areas you can think of that would be so untouched?', 5454, 1, 1, 2408, 0, 0, 0, 0, '', 0, 60035),
(2405, 4, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 406, 0, 0, '', 0, 462),
(2405, 5, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 407, 0, 0, '', 0, 461);

-- Delete old gossip and update id to TC one
DELETE FROM `npc_gossip` WHERE `npc_guid`=2007;
UPDATE `creature_template` SET `gossip_menu_id`=2405 WHERE `entry`=9616 AND `patch`=0; -- ID from TC

-- Add gossip with TC id: 2405
-- unused ids in TC and our core now used for answers: 2406,2407,2408 
DELETE FROM `gossip_menu` WHERE `entry` IN (9532);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES 
(2405, 3077, 0),
(2405, 3098, 60034),
(2405, 8254, 461),
(2405, 8283, 459),
(2405, 8285, 454),
(2405, 8291, 458),
(2405, 8296, 460),
(2405, 8298, 455),
(2406, 3100, 0),-- Answer 1
(2407, 3101, 0),-- Answer 2
(2408, 3102, 0);-- Answer 3
	
-- Add condition
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`) VALUES 
(60034, 8, 4512),
(60035, 9, 4513);

-- Add quest end script for A Little Slime Goes a Long Way (4512)
-- https://vanillawowdb.com/?quest=4512
-- Source: https://www.youtube.com/watch?v=IqZDJpqQFyw
UPDATE `quest_template` SET `CompleteScript`=4512 WHERE `entry`=4512;
DELETE FROM `quest_end_scripts` WHERE `id`=4512;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(4512, 0, 4, 147, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'A Little Slime Goes a Long Way - Laris Geardawdle: npc\_flag questgiver removed'),
(4512, 1, 3, 0, 1800, 69, 1, 0, 0, 0, 0, 0, 0, 0, 0, -4690, -1317, 503.382, 0, 0, 'A Little Slime Goes a Long Way - Laris Geardawdle: Move point 1'),
(4512, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5447, 0, 0, 0, 0, 0, 0, 0, 0, 'A Little Slime Goes a Long Way - Laris Geardawdle: Say text 1'),
(4512, 3, 3, 0, 3800, 69, 1, 0, 0, 0, 0, 0, 0, 0, 0, -4694, -1309, 503.382, 0, 0, 'A Little Slime Goes a Long Way - Laris Geardawdle: Move point 2'),
(4512, 4, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'A Little Slime Goes a Long Way - Laris Geardawdle: Emote talk 1'),
(4512, 7, 3, 0, 3800, 69, 1, 0, 0, 0, 0, 0, 0, 0, 0, -4690, -1317, 503.382, 0, 0, 'A Little Slime Goes a Long Way - Laris Geardawdle: Move point 3'),
(4512, 8, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'A Little Slime Goes a Long Way - Laris Geardawdle: Emote talk 1'),
(4512, 11, 3, 0, 1800, 69, 1, 0, 0, 0, 0, 0, 0, 0, 0, -4692.6, -1312.64, 503.382, 2.93215, 0, 'A Little Slime Goes a Long Way - Laris Geardawdle: Move point 4'),
(4512, 13, 4, 147, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'A Little Slime Goes a Long Way - Laris Geardawdle: npc\_flag questgiver added');

-- One gossip id should be said by the NPC: 5449
-- Speculate that it should be when quest id: 4513 is taken
UPDATE `quest_template` SET `StartScript`=4513 WHERE `entry`=4513;
DELETE FROM `quest_start_scripts` WHERE `id`=4513;
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(4513, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5449, 0, 0, 0, 0, 0, 0, 0, 0, 'A Little Slime Goes a Long Way - Laris Geardawdle: Say text 1');

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
