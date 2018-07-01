DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180616201500');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180616201500');
-- Add your query below.

-- Silithus
-- Start of vid 50: https://www.youtube.com/watch?v=cvrioRR8sGY&feature=youtu.be&list=PL49Ga_-r7iKkxrbckm9CkUhWzxqrOnw-n&t=2

-- The Twilight Mystery - accept ok

-- Securing the Supply Lines
UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=8280 AND `patch`=6;

UPDATE `quest_template` SET `NextQuestId`=0 WHERE `entry`=8276 AND `patch`=6;
UPDATE `quest_template` SET `NextQuestId`=0 WHERE `entry`=8275 AND `patch`=6;

-- DB/Gossip: gossip text change for Windcaller Proudhorn 
-- https://github.com/TrinityCore/TrinityCore/issues/20554

-- Incorrect gossip for Windcaller Proudhorn -- old menu id 0
DELETE FROM `npc_gossip` WHERE `npc_guid`=42918;
UPDATE `creature_template` SET `gossip_menu_id`=6541 WHERE `entry`=15191 AND `patch`=0; -- ID from TC

-- Add gossip with TC id
DELETE FROM `gossip_menu` WHERE `entry` IN (6541);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES 
(6541, 7746, 0),
(6541, 7747, 60005);

-- DELETE FROM `conditions` WHERE `condition_entry` IN (60005);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`) VALUES (60005, 8, 8281);

-- Add missing menu option text new id
DELETE FROM `gossip_menu_option` WHERE `menu_id` in (6541);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES 
(6541, 0, 0, 'GOSSIP_OPTION_QUESTGIVER', 0, 2, 2, 0, 0, 0, 0, 0, '', 0, 0);

-- Deadly Desert Venom - accept ok
UPDATE `quest_template` SET `CompleteScript`=8277 WHERE `entry`=8277 AND `patch`=6;

DELETE FROM `quest_end_scripts` WHERE `id`=8277;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(8277, 1, 0, 0, 0, 0, 0, 42917, 0, 9, 7, 10672, 0, 0, 0, 0, 0, 0, 0, 0, 'Deadly Desert Venom - Noggle Ficklespragg: Say text 1'),
(8277, 1, 28, 0, 0, 0, 0, 42917, 0, 9, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Deadly Desert Venom - Noggle Ficklespragg: State stand'),
(8277, 2, 1, 64, 0, 0, 0, 42917, 0, 9, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Deadly Desert Venom - Noggle Ficklespragg: State stunned'),
(8277, 8, 28, 7, 0, 0, 0, 42917, 0, 9, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Deadly Desert Venom - Noggle Ficklespragg: State dead');

-- Stepping Up Security
UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=8281 AND `patch`=6;

-- DB/Creature: texts for Beetix Ficklespragg & Noggle Ficklespragg 
-- https://github.com/TrinityCore/TrinityCore/issues/20555

-- Add correct script say to Beetix Ficklespragg
UPDATE `creature_template` SET `AIName`='EventAI' WHERE `entry`=15189 AND `patch`=0;

-- Events list for Beetix Ficklespragg
DELETE FROM `creature_ai_events` WHERE `creature_id`=15189;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES 
(1518901, 15189, 0, 1, 0, 100, 1, 15000, 18000, 150000, 180000, 1518901, 0, 0, 'Beetix Ficklespragg - Say text OOC');

DELETE FROM `creature_ai_scripts` WHERE `id`=1518901;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(1518901, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10751, 0, 0, 0, 0, 0, 0, 0, 0, 'Beetix Ficklespragg - Say text 1');

-- Add correct gossip to Noggle Ficklespragg
DELETE FROM `npc_gossip` WHERE `npc_guid`=42917; -- delete old data
UPDATE `creature_template` SET `gossip_menu_id`=6544 WHERE `entry`=15190 AND `patch`=0; -- id from TC

DELETE FROM `gossip_menu` WHERE `entry` IN (6544);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES 
(6544, 7753, 0),
(6544, 7752, 60004);

-- Add condition for when Noggle's Last Hope is rewarded
-- DELETE FROM `conditions` WHERE `condition_entry` IN (60004);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`) VALUES (60004, 8, 8278);

-- Noggle's Last Hope
UPDATE `quest_template` SET `OfferRewardEmote1`=4, `CompleteScript`=8278 WHERE `entry`=8278 AND `patch`=6;

DELETE FROM `quest_end_scripts` WHERE `id`=8278;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(8278, 1, 28, 0, 0, 0, 0, 42917, 0, 9, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Noggle\'s Last Hope - Noggle Ficklespragg: State stand'),
(8278, 2, 0, 0, 0, 0, 0, 42917, 0, 9, 7, 10675, 0, 0, 0, 0, 0, 0, 0, 0, 'Noggle\'s Last Hope - Noggle Ficklespragg: Say text 1'),
(8278, 2, 1, 4, 0, 0, 0, 42917, 0, 9, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Noggle\'s Last Hope - Noggle Ficklespragg: Emote cheer'),
(8278, 4, 1, 64, 0, 0, 0, 42917, 0, 9, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Deadly Desert Venom - Noggle Ficklespragg: State stunned'),
(8278, 9, 28, 7, 0, 0, 0, 42917, 0, 9, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Noggle\'s Last Hope - Noggle Ficklespragg: State dead');

-- The Deserter
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=8285 AND `patch`=6;

-- Fix Gossip Text for Hermit Ortell
-- https://github.com/TrinityCore/TrinityCore/issues/20579

-- Incorrect gossip for Hermit Ortell -- old menu id 0
DELETE FROM `npc_gossip` WHERE `npc_guid`=42919;
UPDATE `creature_template` SET `gossip_menu_id`=6596 WHERE `entry`=15194 AND `patch`=0; -- ID from TC

-- Add gossip with TC id
DELETE FROM `gossip_menu` WHERE `entry` IN (6596);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES 
(6596, 7816, 0),
(6596, 7817, 60006);

-- DELETE FROM `conditions` WHERE `condition_entry` IN (60006);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`) VALUES (60006, 8, 8285);

-- Add missing menu option text new id
DELETE FROM `gossip_menu_option` WHERE `menu_id` in (6596);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES 
(6596, 0, 0, 'GOSSIP_OPTION_QUESTGIVER', 0, 2, 2, 0, 0, 0, 0, 0, '', 0, 0);

-- Noggle's Lost Satchel
UPDATE `quest_template` SET `CompleteScript`=8282, `DetailsEmote1`=0 WHERE `entry`=8282 AND `patch`=6;

DELETE FROM `quest_end_scripts` WHERE `id`=8282;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(8282, 1, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Noggle\'s Last Hope - Noggle Ficklespragg: State stand'),
(8282, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10676, 0, 0, 0, 0, 0, 0, 0, 0, 'Noggle\'s Last Hope - Noggle Ficklespragg: Say text 1'),
(8282, 3, 28, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Noggle\'s Last Hope - Noggle Ficklespragg: State sit'),
(8282, 9, 28, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Noggle\'s Last Hope - Noggle Ficklespragg: State dead');

-- The Twilight Lexicon
UPDATE `quest_template` SET `DetailsEmote1`=0 WHERE `entry`=8279 AND `patch`=6;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
