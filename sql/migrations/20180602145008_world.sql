DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180602145008');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180602145008');
-- Add your query below.

-- Un'Goro Crater
-- Start of vid 40: https://www.youtube.com/watch?v=KO1iKRoKDyI&feature=youtu.be&list=PL49Ga_-r7iKkxrbckm9CkUhWzxqrOnw-n&t=2

-- Bungle in the Jungle should only be available after:
-- https://github.com/TrinityCore/TrinityCore/issues/20607
-- March of the Silithid - Alliance
UPDATE `quest_template` SET `NextQuestId`=4496, `ExclusiveGroup`=4493 WHERE `entry`=4493 AND `patch`=0;

-- March of the Silithid - Horde
UPDATE `quest_template` SET `NextQuestId`=4496,`ExclusiveGroup`=4493 WHERE `entry`=4494 AND `patch`=0;

-- Start of vid 41: https://www.youtube.com/watch?v=FFx7pDxRRrE&feature=youtu.be&list=PL49Ga_-r7iKkxrbckm9CkUhWzxqrOnw-n&t=2

-- Bone-Bladed Weapons - already ok

-- Jes'rimon missing gossip
-- https://github.com/TrinityCore/TrinityCore/issues/21542

-- Incorrect gossip for Jes'rimon -- old menu id 9522
DELETE FROM `npc_gossip` WHERE `npc_guid`=702;
UPDATE `creature_template` SET `gossip_menu_id`=2189 WHERE `entry`=8659 AND `patch`=0; -- ID from TC

-- Add gossip with TC id
DELETE FROM `gossip_menu` WHERE `entry` IN (2189, 2190, 9522);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES 
(2189, 2822, 0),
(2189, 8263, 461),
(2189, 8283, 459),
(2189, 8285, 454),
(2189, 8291, 458),
(2189, 8296, 460),
(2189, 8298, 455),
(2190, 2823, 0);

-- Add missing menu option text and move the old ones to new id
DELETE FROM `gossip_menu_option` WHERE `menu_id` in (2189, 9522);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES 
(2189, 0, 0, 'GOSSIP_OPTION_QUESTGIVER', 0, 2, 2, 0, 0, 0, 0, 0, '', 0, 0),
(2189, 1, 0, 'Where is Un\'Goro Crater?', 5184, 1, 1, 2190, 0, 0, 0, 0, '', 0, 40003),
(2189, 2, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 414, 0, 0, '', 0, 462),
(2189, 3, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 415, 0, 0, '', 0, 461);

-- Add condition
DELETE FROM `conditions` WHERE `condition_entry`=40003;
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`) VALUES (40003, 9, 4300);

-- ... and a Batch of Ooze
UPDATE `quest_template` SET `DetailsEmote1`=1, `OfferRewardEmote1`=1 WHERE `entry`=4294 AND `patch`=0;

-- Start of vid 42: https://www.youtube.com/watch?v=8lKFNczM-wY&feature=youtu.be&list=PL49Ga_-r7iKkxrbckm9CkUhWzxqrOnw-n&t=2

-- Volcanic Activity - already ok

-- Start of vid 43: https://www.youtube.com/watch?v=Up_ThglOopY&feature=youtu.be&list=PL49Ga_-r7iKkxrbckm9CkUhWzxqrOnw-n&t=2

-- Bungle in the Jungle - quest emotes already ok

-- Start of vid 44: https://www.youtube.com/watch?v=1T7DXg88SgQ&feature=youtu.be&list=PL49Ga_-r7iKkxrbckm9CkUhWzxqrOnw-n&t=2

-- The Apes of Un'Goro - already ok

-- The Fare of Lar'korwi - already ok

-- Williden's Journal - already ok

-- Chasing A-Me 01 pt. 1 - accept ok

-- Shizzle's Flyer

-- Lost!

-- Beware of Pterrordax - already ok

-- Spark Nilminer missing gossip 23719
DELETE FROM `npc_gossip` WHERE `npc_guid`=23719;
UPDATE `creature_template` SET `gossip_menu_id`=2422 WHERE `entry`=9272 AND `patch`=0;

DELETE FROM `gossip_menu_option` WHERE `menu_id`=2422;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES 
(2422, 0, 0, 'What do you think of Dadanga?', 5512, 1, 1, 2721, 0, 0, 0, 0, '', 0, 0);

DELETE FROM `gossip_menu` WHERE `entry`=2721;
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (2721, 3380, 0);

-- Roll the Bones

-- Alien Ecology - already ok

-- Expedition Salvation - already ok

-- Larion and Muigin
UPDATE `quest_template` SET `DetailsEmote1`=5 WHERE `entry`=4145 AND `patch`=0;

-- Chasing A-Me 01 pt. 2

-- It's a Secret to Everybody pt. 1

-- It's a Secret to Everybody pt. 2
UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=3845 AND `patch`=0;

-- Add missing gossip text to Linken (8737)
UPDATE `creature_template` SET `gossip_menu_id`=1961 WHERE `entry`=8737 AND `patch`=0;

-- It's a Secret to Everybody pt. 2 rewarded
DELETE FROM `conditions` WHERE `condition_entry`=40001;
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`) VALUES (40001, 8, 3845);
UPDATE `gossip_menu` SET `condition_id`=40001 WHERE `entry`=1961 AND `text_id`=2634;

-- The Mighty U'cha - accept ok
UPDATE `quest_template` SET `IncompleteEmote`=1 WHERE `entry`=4301 AND `patch`=0;

-- The Scent of Lar'korwi - already ok

-- Finding the Source

-- A Little Help From My Friends - already ok

-- Crystals of Power

-- The Northern Pylon - quest emotes already ok

-- The Eastern Pylon - quest emotes already ok

-- The Western Pylon - quest emotes already ok

-- Marvon's Workshop
UPDATE `quest_template` SET `DetailsEmote1`=1, `OfferRewardEmote1`=6 WHERE `entry`=4147 AND `patch`=0;

-- It's a Secret to Everybody pt. 3
UPDATE `quest_template` SET `CompleteEmote`=0, `OfferRewardEmote1`=1 WHERE `entry`=3908 AND `patch`=0;

-- Update timing of throw emote in end script
-- https://github.com/TrinityCore/TrinityCore/issues/21716
DELETE FROM `quest_end_scripts` WHERE `id`=3908;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(3908, 0, 4, 147, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Its a Secret to Everybody - Donova Snowden: npc\_flag quest giver and gossip removed'),
(3908, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6153, 0, 0, 0, 0, 0, 0, 0, 0, 'Its a Secret to Everybody - Donova Snowden: Say text 1'),
(3908, 2, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6384.54, -2527.25, 538.736, 2.52438, 0, 'Its a Secret to Everybody - Donova Snowden: Move 1'),
(3908, 8, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6370.12, -2525.52, 532.268, 2.82283, 0, 'Its a Secret to Everybody - Donova Snowden: Move 2'),
(3908, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6154, 0, 0, 0, 0, 0, 0, 0, 0, 'Its a Secret to Everybody - Donova Snowden: Say text 2'),
(3908, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6155, 0, 0, 0, 0, 0, 0, 0, 0, 'Its a Secret to Everybody - Donova Snowden: Emote text 1'),
(3908, 21, 1, 61, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Its a Secret to Everybody - Donova Snowden: Emote throw'),
(3908, 23, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6364.25, -2524, 527.058, 2.9265, 0, 'Its a Secret to Everybody - Donova Snowden: Move 3'),
(3908, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6156, 0, 0, 0, 0, 0, 0, 0, 0, 'Its a Secret to Everybody - Donova Snowden: Say text 3'),
(3908, 27, 1, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Its a Secret to Everybody - Donova Snowden: Emote kneel'),
(3908, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6157, 0, 0, 0, 0, 0, 0, 0, 0, 'Its a Secret to Everybody - Donova Snowden: Say text 4'),
(3908, 31, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6370.3, -2524.19, 532.27, 6.26836, 0, 'Its a Secret to Everybody - Donova Snowden: Move 4'),
(3908, 34, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6385.99, -2529.26, 539.03, 5.66753, 0, 'Its a Secret to Everybody - Donova Snowden: Move 5'),
(3908, 42, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6395.57, -2536.75, 541.548, 5.66753, 0, 'Its a Secret to Everybody - Donova Snowden: Move 6'),
(3908, 47, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6395.57, -2536.75, 541.548, 2.86475, 0, 'Its a Secret to Everybody - Donova Snowden: Move 7'),
(3908, 48, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6158, 0, 0, 0, 0, 0, 0, 0, 0, 'Its a Secret to Everybody - Donova Snowden: Say text 5'),
(3908, 49, 4, 147, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Its a Secret to Everybody - Donova Snowden: npc\_flag quest giver and gossip added');

-- The Bait for Lar'korwi - already ok

-- The New Springs - already ok

-- Making Sense of It

-- Pawn Captures Queen

-- Un'Goro Soil
UPDATE `quest_template` SET `DetailsEmote1`=1, `CompleteEmote`=25 WHERE `entry`=3761 AND `patch`=0;

-- Morrowgrain Research pt. 1
UPDATE `quest_template` SET `DetailsEmote1`=1, `CompleteEmote`=2, `OfferRewardEmote1`=1 WHERE `entry`=3782 AND `patch`=0;

-- Morrowgrain Research pt. 2
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=3786 AND `patch`=0;

-- Arch Druid Hamuul Runetotem incorrect gossip -- old menu id 9437
DELETE FROM `npc_gossip` WHERE `npc_guid`=24917; -- delete old 
UPDATE `creature_template` SET `gossip_menu_id`=1629 WHERE `entry`=5769 AND `patch`=0; -- ID from TC

-- Add gossip with TC id
DELETE FROM `gossip_menu` WHERE `entry` IN (1629, 40002, 9437);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES 
(1629, 2284, 0),
(1629, 8244, 461),
(1629, 8283, 459),
(1629, 8285, 454),
(1629, 8291, 458),
(1629, 8296, 460),
(1629, 8298, 455),
(40002, 2574, 0);

-- Add menu option and move the old ones to new id
DELETE FROM `gossip_menu_option` WHERE `menu_id` in (1629, 9437);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES 
(1629, 0, 0, 'GOSSIP_OPTION_QUESTGIVER', 0, 2, 2, 0, 0, 0, 0, 0, '', 0, 0),
(1629, 1, 0, 'I\'m not a journeyman herbalist -- am I able to still assist you in your work?', 4848, 1, 1, 40002, 0, 0, 0, 0, '', 0, 40002),
(1629, 2, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 422, 0, 0, '', 0, 462),
(1629, 3, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 423, 0, 0, '', 0, 461);

-- Add condition
DELETE FROM `conditions` WHERE `condition_entry`=40002;
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`) VALUES (40002, 8, 3761);

-- Incorrect gossip for Bashana Runetotem -- old menu id 9527
DELETE FROM `npc_gossip` WHERE `npc_guid`=24796;
UPDATE `creature_template` SET `gossip_menu_id`=1701 WHERE `entry`=9087 AND `patch`=0; -- ID from TC

-- Add gossip with TC id
DELETE FROM `gossip_menu` WHERE `entry` IN (1701, 9527);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES 
(1701, 2353, 0),
(1701, 8244, 461),
(1701, 8283, 459),
(1701, 8285, 454),
(1701, 8291, 458),
(1701, 8296, 460),
(1701, 8298, 455);

-- Add missing menu option text and move the old ones to new id
DELETE FROM `gossip_menu_option` WHERE `menu_id` in (1701, 9527);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES 
(1701, 0, 0, 'GOSSIP_OPTION_QUESTGIVER', 0, 2, 2, 0, 0, 0, 0, 0, '', 0, 0),
(1701, 1, 1, 'I\'d like to purchase more Tharlendris seeds.', 4845, 3, 4, 0, 0, 0, 0, 0, '', 0, 0),
(1701, 2, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 422, 0, 0, '', 0, 462),
(1701, 3, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 423, 0, 0, '', 0, 461);

-- DB/Gossip: Quintis Jonespyre #21937 + gossip from TC
-- https://github.com/TrinityCore/TrinityCore/issues/21937
UPDATE `creature_template` SET `gossip_menu_id`=1922 WHERE `entry`=7879 AND `patch`=0; -- ID from TC

DELETE FROM `gossip_menu` WHERE `entry` IN (1922);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES 
(1922, 2575, 0);
 
DELETE FROM `gossip_menu_option` WHERE `menu_id` in (1922);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES 
(1922, 0, 0, 'GOSSIP_OPTION_QUESTGIVER', 0, 2, 2, 0, 0, 0, 0, 0, '', 0, 0),
(1922, 1, 1, 'I\'d like to purchase more Tharlendris seeds.', 4845, 3, 4, 0, 0, 0, 0, 0, '', 0, 0);

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
