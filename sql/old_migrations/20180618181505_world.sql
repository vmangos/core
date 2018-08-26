DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180618181505');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180618181505');
-- Add your query below.

-- Western Plaguelands
-- Start of vid 41: https://www.youtube.com/watch?v=FFx7pDxRRrE&feature=youtu.be&list=PL49Ga_-r7iKkxrbckm9CkUhWzxqrOnw-n&t=2

-- A Call to Arms: The Plaguelands! - all 3 Horde and 3 Ally kept the same
UPDATE `quest_template` SET `DetailsEmote1`=5, `OfferRewardEmote1`=66 WHERE `entry`=5066 AND `patch`=0;
UPDATE `quest_template` SET `DetailsEmote1`=5, `OfferRewardEmote1`=66 WHERE `entry`=5090 AND `patch`=0;
UPDATE `quest_template` SET `DetailsEmote1`=5, `OfferRewardEmote1`=66 WHERE `entry`=5091 AND `patch`=0;
UPDATE `quest_template` SET `DetailsEmote1`=5, `OfferRewardEmote1`=66 WHERE `entry`=5093 AND `patch`=0;
UPDATE `quest_template` SET `DetailsEmote1`=5, `OfferRewardEmote1`=66 WHERE `entry`=5094 AND `patch`=0;
UPDATE `quest_template` SET `DetailsEmote1`=5, `OfferRewardEmote1`=66 WHERE `entry`=5095 AND `patch`=0;

-- Camp Mojache should be available from all heralds
DELETE FROM `creature_questrelation` WHERE `quest`=7492 AND `patch`=1;
INSERT INTO `creature_questrelation` (`id`, `quest`, `patch`) VALUES 
(10879, 7492, 1),
(10880, 7492, 1),
(10881, 7492, 1);

-- Start of vid 51: https://www.youtube.com/watch?v=jKPDoC8EraY&feature=youtu.be&list=PL49Ga_-r7iKkxrbckm9CkUhWzxqrOnw-n&t=3

-- Scarlet Diversions
UPDATE `quest_template` SET `DetailsEmote1`=1, `OfferRewardEmote1`=4 WHERE `entry`=5096 AND `patch`=0;

-- Argent Dawn Commission

-- A Plague Upon Thee pt. 1 
UPDATE `quest_template` SET `DetailsEmote1`=1, `CompleteEmote`=6, `OfferRewardEmote1`=1 WHERE `entry`=5901 AND `patch`=0;

-- Better Late Than Never pt. 1

-- Janice Felstone incorrect gossip behavior - TC id: 2961
DELETE FROM `npc_gossip` WHERE `npc_guid`=45440;

DELETE FROM `gossip_menu` WHERE `entry`=2961;
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (2961, 3668);

UPDATE `creature_template` SET `gossip_menu_id`=2961 WHERE `entry`=10778 AND `patch`=0;
UPDATE `npc_text` SET `Probability0`=0.2, `Probability1`=0.2, `Probability2`=0.2, `Probability3`=0.2, `Probability4`=0.2 WHERE `ID`=3668;

-- Better Late Than Never pt. 2
UPDATE `quest_template` SET `CompleteEmote`=6, `OfferRewardEmote1`=1 WHERE `entry`=5023 AND `patch`=0;

-- The Scourge Cauldrons
UPDATE `quest_template` SET `DetailsEmote1`=1, `OfferRewardEmote1`=2 WHERE `entry`=5228 AND `patch`=0;

-- All Along the Watchtowers
UPDATE `quest_template` SET `PrevQuestId`=5096, `DetailsEmote1`=1, `OfferRewardEmote1`=5 WHERE `entry`=5098 AND `patch`=0;

-- Target: Felstone Field 
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5229 AND `patch`=0;

-- Return to the Bulwark pt. 1
UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=5230 AND `patch`=0;

-- Target: Dalson's Tears
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5231 AND `patch`=0;

-- Return to the Bulwark pt. 2 - already ok 

-- Shadow Priestess Vandis (11055) has incorrect gossip
-- Apothecary Dithers (11057) has core scripts
-- DB/Gossip: Apothecary Dithers and Shadow Priestess Vandis - Mission Accomplished!
-- https://github.com/TrinityCore/TrinityCore/issues/20523
DELETE FROM `npc_gossip` WHERE `npc_guid`=28422;
-- gossip id from TC: 3183
UPDATE `creature_template` SET `gossip_menu_id`=3183 WHERE `entry`=11055 AND `patch`=0;

DELETE FROM `gossip_menu` WHERE `entry` IN (3183);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES 
(3183, 3939, 0),
(3183, 4040, 60007);

-- Add condition for Return to the Bulwark pt. 1 (5230) completed 
-- https://www.youtube.com/watch?v=jKPDoC8EraY&feature=youtu.be&list=PL49Ga_-r7iKkxrbckm9CkUhWzxqrOnw-n&t=1375
-- DELETE FROM `conditions` WHERE `condition_entry` IN (60007);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`) VALUES 
(60007, 8, 5230);

-- Shadow Priestess Vandis should have gossip menu options with changing status reports as quest chain "The Scourge Cauldrons" is played through
-- [3.3.5] DB/Gossip: add missing gossip option to High Priestess MacDonnell and Shadow Priestess Vandis
-- https://github.com/TrinityCore/TrinityCore/issues/20542
DELETE FROM `gossip_menu_option` WHERE `menu_id` in (3183);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES 
(3183, 0, 0, 'GOSSIP_OPTION_QUESTGIVER', 0, 2, 2, 0, 0, 0, 0, 0, '', 0, 0),
(3183, 1, 0, 'How are we doing in the battle to subvert the cauldrons?', 6552, 1, 1, 3241, 0, 0, 0, 0, '', 0, 60007);

-- DELETE FROM `conditions` WHERE `condition_entry` IN (60008, 60009, 60010, 60012, 60013, 60014, 60015, 60016, 60017);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES 
(60008, 8, 5232, 0), -- Horde
(60009, 8, 5234, 0), -- Horde
(60010, 8, 5236, 0), -- Horde
(60012, 8, 5220, 0), -- Ally
(60013, 8, 5223, 0), -- Ally
(60014, 8, 5226, 0), -- Ally
(60015, -2, 60008, 60012), -- Horde or Ally
(60016, -2, 60009, 60013), -- Horde or Ally
(60017, -2, 60010, 60014); -- Horde or Ally

 -- Horde or Ally quest condition used
DELETE FROM `gossip_menu` WHERE `entry` IN (3241);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES 
(3241, 3996, 0),
(3241, 3997, 60015),
(3241, 3998, 60016),
(3241, 3999, 60017);

-- Add same gossip to High Priestess MacDonnell (11053) - check
-- DB/Gossip: Alchemist Arbington and High Priestess MacDonnell - Mission Accomplished!
-- https://github.com/TrinityCore/TrinityCore/issues/20522
DELETE FROM `npc_gossip` WHERE `npc_guid`=45238;
-- gossip id from TC: 3184
UPDATE `creature_template` SET `gossip_menu_id`=3184 WHERE `entry`=11053 AND `patch`=0;

DELETE FROM `gossip_menu` WHERE `entry` IN (3184);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES 
(3184, 3940, 0),
(3184, 4039, 60011);

-- Add condition for Return to Chillwind Camp (5217) completed 
-- DELETE FROM `conditions` WHERE `condition_entry` IN (60011);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`) VALUES 
(60011, 8, 5217);

-- Add gossip menu options with changing status reports as quest chain "The Scourge Cauldrons" is played through - Ally version
DELETE FROM `gossip_menu_option` WHERE `menu_id` in (3184);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES 
(3184, 0, 0, 'GOSSIP_OPTION_QUESTGIVER', 0, 2, 2, 0, 0, 0, 0, 0, '', 0, 0),
(3184, 1, 0, 'How are we doing in the battle to subvert the cauldrons?', 6552, 1, 1, 3241, 0, 0, 0, 0, '', 0, 60011);

-- Target: Writhing Haunt
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5233 AND `patch`=0;

-- The Wildlife Suffers Too pt. 1

-- Return to the Bulwark pt. 3

-- Target: Gahrron's Withering
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5235 AND `patch`=0;

-- Return to the Bulwark pt. 4

-- Mission Accomplished!
UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=5237 AND `patch`=0;

-- Start of vid 52: https://www.youtube.com/watch?v=kmRoYJfSwdU&feature=youtu.be&list=PL49Ga_-r7iKkxrbckm9CkUhWzxqrOnw-n&t=2

-- The Jeremiah Blues
UPDATE `quest_template` SET `DetailsEmote1`=1, `CompleteEmote`=18 WHERE `entry`=5049 AND `patch`=0;

-- Jeremiah Payson incorrect gossip OLD id: 9518
UPDATE `creature_template` SET `gossip_menu_id`=2952 WHERE `entry`=8403 AND `patch`=0;

-- Add gossip with TC id: 2952
DELETE FROM `gossip_menu` WHERE `entry` IN (9518, 2952);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES 
(2952, 3666, 0),
(2952, 8255, 461),
(2952, 8283, 459),
(2952, 8285, 454),
(2952, 8291, 458),
(2952, 8296, 460),
(2952, 8298, 455);

-- Add missing menu option text and move the old ones to new id
DELETE FROM `gossip_menu_option` WHERE `menu_id` in (9518, 2952);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES 
(2952, 0, 0, 'GOSSIP_OPTION_QUESTGIVER', 0, 2, 2, 0, 0, 0, 0, 0, '', 0, 0),
(2952, 1, 1, 'I would like to buy from you.', 2583, 3, 4, 0, 0, 0, 0, 0, '', 0, 0),
(2952, 2, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 418, 0, 0, '', 0, 462),
(2952, 3, 0, 'Here, I\'d like to give you this token of my love.', 11723, 1, 1, -1, 0, 419, 0, 0, '', 0, 461);

-- Good Luck Charm
UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=5050 AND `patch`=0;

-- Start of vid 53:

-- A Plague Upon Thee pt. 2
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5902 AND `patch`=0;

-- Gossip option for Northridge Lumber Mill Crate, menu available when quest 5902 is active
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4362; 
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_script_id`, `condition_id`) VALUES 
(4362, 0, 'Place Termite Barrel on the crate.', 8223, 1, 3, -1, 436201, 60026), -- Quest taken condition
(4362, 1, 'Place Termite Barrel on the crate.', 8223, 1, 3, -1, 436201, 60027); -- Quest completed condition

-- Spawn Barrel on activating gossip option
DELETE FROM `gossip_scripts` WHERE `id`=436201;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `comments`) VALUES 
(436201, 1, 9, 257528, 60, 'Gossip Menu 4362 - Northridge Lumber Mill Crate: Spawn Termite Barrel for 60 sec');

-- Add conditions needed above
-- DELETE FROM `conditions` WHERE `condition_entry` IN (60022, 60023, 60024, 60025, 60026, 60027); -- Empty conditions
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES 
(60022, 9, 5902, 0), -- Horde q taken
(60023, 9, 5904, 0), -- Ally q taken
(60024, 8, 5902, 0), -- Horde q complete
(60025, 8, 5904, 0), -- Ally q complete
(60026, -2, 60022, 60023), -- Is on q5902 
(60027, -2, 60024, 60025); -- Is on q5902 or completed q5902 and not taken q6390 -> show gossip

-- Termite Barrel - make only spawnable on gossip option and move to middle of crate
UPDATE `gameobject` SET `position_x`=2449.44, `position_y`=-1662.34, `spawntimesecsmin`=-60, `spawntimesecsmax`=-60 WHERE `guid`=257528;

-- Two Halves Become One
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=5051 AND `patch`=0;

-- A Plague Upon Thee pt. 3
UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=6390 AND `patch`=0;

-- Unfinished Business pt. 1
UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=6004 AND `patch`=0;

-- Unfinished Business pt. 2
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `OfferRewardEmote1`=1 WHERE `entry`=6023 AND `patch`=0;

-- Unfinished Business pt. 3
UPDATE `quest_template` SET `DetailsEmote1`=1, `OfferRewardEmote1`=1 WHERE `entry`=6025 AND `patch`=0;

-- The Wildlife Suffers Too pt. 2

-- Mulgris Deepriver incorrect gossip - old id: 0
UPDATE `creature_template` SET `gossip_menu_id`=2921 WHERE `entry`=10739 AND `patch`=0;
DELETE FROM `npc_gossip` WHERE `npc_guid`=45439;

-- Add gossip with TC id: 2921
DELETE FROM `gossip_menu` WHERE `entry` IN (2921);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES 
(2921, 3633, 2), -- Horde
(2921, 3634, 3), -- Ally
(2921, 3635, 60028); -- After quests completed for both

-- Add conditions needed above
-- DELETE FROM `conditions` WHERE `condition_entry` IN (60028); -- Empty conditions
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES 
(60028, 8, 4985, 0);

-- Glyphed Oaken Branch - Horde and alliance
UPDATE `quest_template` SET `CompleteEmote`=0, `OfferRewardEmote1`=6 WHERE `entry`=4986 AND `patch`=0;
UPDATE `quest_template` SET `CompleteEmote`=0, `OfferRewardEmote1`=6 WHERE `entry`=4987 AND `patch`=0;

-- Nara Wildmane (5770) missing quest greeting
INSERT INTO `quest_greeting` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES 
(5770, 'If we are to protect nature, then we must embrace its strengths.  And we must show this strength to those who would harm the land.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- A Strange Historian
UPDATE `quest_template` SET `CompleteEmote`=6, `OfferRewardEmote1`=1 WHERE `entry`=5153 AND `patch`=0;

-- Missing event
UPDATE `gameobject_template` SET `data6`=20000 WHERE `entry`=176145 AND `patch`=0;

DELETE FROM `event_scripts` WHERE `id`=20000;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(20000, 2, 10, 10936, 3000, 0, 0, 0, 0, 0, 0, 0, 0, 6, 3, 1165, -1719, 57, 2, 0, 'A Strange Historian - Joseph Redpath\'s Monument: Summon "Joseph Redpath"'),
(20000, 4, 0, 4, 0, 0, 0, 10936, 50, 8, 2, 6274, 0, 0, 0, 0, 0, 0, 0, 0, 'A Strange Historian - Joseph Redpath: Wisper text 1');

-- The Annals of Darrowshire - accept ok
UPDATE `quest_template` SET `CompleteEmote`=6, `OfferRewardEmote1`=1 WHERE `entry`=5154 AND `patch`=0;

-- No gossip flag removal for quest end script
DELETE FROM `quest_end_scripts` WHERE `id`=5154;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(5154, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6418, 0, 0, 0, 0, 0, 0, 0, 0, 'The Annals of Darrowshire - Chromie: Say text 1'),
(5154, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Annals of Darrowshire - Chromie: Emote talk'),
(5154, 2, 15, 17285, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Annals of Darrowshire - Chromie: Cast spell "Enchant Annals of Darrowshire"'),
(5154, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6419, 0, 0, 0, 0, 0, 0, 0, 0, 'The Annals of Darrowshire - Chromie: Say text 2');

-- A Matter of Time - accept ok

-- Chromie incorrect gossip - old id: 0
UPDATE `creature_template` SET `gossip_menu_id`=2911 WHERE `entry`=10667 AND `patch`=0;
DELETE FROM `npc_gossip` WHERE `npc_guid`=45453;

-- Add gossip condition to gossip with TC id: 2911
UPDATE `gossip_menu` SET `condition_id`=60029 WHERE `entry`=2911 AND `text_id`=3585;

-- DELETE FROM `conditions` WHERE `condition_entry` IN (60029); -- Empty conditions
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES 
(60029, 8, 4971, 0);

-- Add emote on spawn for Temporal Parasite and port stats from CMangos 
-- Source: https://www.youtube.com/watch?v=fEPo050WscM&feature=youtu.be&list=PL49Ga_-r7iKkxrbckm9CkUhWzxqrOnw-n&t=8194
-- Should have emote, mana and hit for less than current - CMangos seems more correct
UPDATE `creature_template` SET `AIName`='EventAI' WHERE `entry`=10717 AND `patch`=0;
UPDATE `creature_template` SET `minmana`=2117, `maxmana`=2241, `mindmg`=93, `maxdmg`=130, `baseattacktime`=2000 WHERE `entry`=10717 AND `patch`=0;

-- Events list for Temporal Parasite
DELETE FROM `creature_ai_events` WHERE `creature_id`=10717;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES 
(1071701, 10717, 0, 11, 0, 100, 0, 0, 0, 0, 0, 1071701, 0, 0, 'Temporal Parasite - Emote text on spawn');

DELETE FROM `creature_ai_scripts` WHERE `id` IN (1071701);
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(1071701, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6033, 0, 0, 0, 0, 0, 0, 0, 0, 'Temporal Parasite - Emote text');

-- Brother Carlin
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5210 AND `patch`=0;

-- Counting Out Time - accept ok

-- Alas, Andorhal
UPDATE `quest_template` SET `DetailsEmote1`=5, `DetailsEmote2`=1 WHERE `entry`=105 AND `patch`=0;

-- Scholomance
UPDATE `quest_template` SET `DetailsEmote1`=1, `OfferRewardEmote1`=1 WHERE `entry`=838 AND `patch`=0;

-- Skeletal Fragments
UPDATE `quest_template` SET `DetailsEmote1`=1, `OfferRewardEmote1`=5 WHERE `entry`=964 AND `patch`=0;

-- Mold Rhymes With... - details ok

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
