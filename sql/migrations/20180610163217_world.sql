DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180610163217');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180610163217');
-- Add your query below.

-- Azshara - A Meeting with the Master should be removed with patch 1.7 - ok
-- https://github.com/LightsHope/issues/issues/366
DELETE FROM `quest_template` WHERE `entry`=3381 AND `patch`=5;
INSERT INTO `quest_template` (`entry`, `patch`, `Method`, `ZoneOrSort`, `MinLevel`, `QuestLevel`, `QuestFlags`, `NextQuestId`, `Title`, `Details`, `Objectives`, `OfferRewardText`, `RequestItemsText`, `ReqItemId1`, `ReqItemCount1`, `RewMoneyMaxLevel`, `RewSpellCast`, `CompleteEmote`) VALUES 
(3381, 5, 1, 16, 45, 48, 8, 0, 'A Meeting with the Master', 'Ah, a young $r come to speak to Sanath. What a wonderful day! I am so honored to have you grace me with your presence. Thank you!$B$BPlease... do not be so arrogant to assume my sarcasm was a compliment. Let us get one thing straight: I don\'t like you. But this little conversation doesn\'t have anything to do with us--it has to do with my master.$B$BBring me a couple hippogryph feathers for my arrows and I\'ll give you leave to see him. He\'s asked that I send adventurers to him if they proved worthy enough.', 'Bring 2 Undamaged Hippogryph Feathers to Sanath Lim-yo in Azshara if you wish to speak to his master.', 'Two feathers, just as I asked. And not bad ones at all.$b$bReady then? Just say the word and you\'re on your way.$b$bOh, and once again, mind yourself... my master doesn\'t take kindly to imbeciles, but he is very generous to those that please him.', 'I remain here at my master\'s bidding. I\'ve been given leave to ask any price I wish for transportation up to his tower. For now, I ask for only the two feathers from each traveler so I can continue to make my signature arrows.$b$bIf you\'re not careful, I\'ll up the price. How does half a dozen gold sound?$b$bYeah, I thought as much. Just mind yourself and I\'ll keep the price where it is.', 10450, 2, 1860, 12510, 1);
DELETE FROM `quest_template` WHERE `entry`=3503 AND `patch`=5;
INSERT INTO `quest_template` (`entry`, `patch`, `Method`, `ZoneOrSort`, `MinLevel`, `QuestLevel`, `SpecialFlags`, `Title`, `OfferRewardText`, `RewSpellCast`, `CompleteEmote`, `OfferRewardEmote1`, `OfferRewardEmote2`) VALUES 
(3503, 5, 0, 16, 45, 55, 1, 'Meeting with the Master', 'There was a time when I could ask whatever I wished from those who sought out my master.  But now, you need only ask and I will send you to him.$b$bIt is upsetting to me, but I do not question his orders.  I can only take enjoyment in making fun of the ridiculous clothes you wear or the pathetic look on your face.  Even that bores me...$b$bEven this rambling bores me!  Do you wish to see my master or not?', 12510, 1, 1, 6);


-- NPC's with missing combat behavior - ok
-- https://github.com/LightsHope/issues/issues/129

-- Brainwashed Noble - Same AI and spells as Marisa du'Paige
DELETE FROM `creature_ai_events` WHERE `creature_id`=596;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (59601, 596, 0, 24, 0, 100, 1, 512, 1, 30000, 30000, 59601, 0, 0, 'Brainwashed Noble - Run Away on Target Frozen');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (59602, 596, 0, 2, 0, 100, 1, 50, 0, 35000, 35000, 59602, 0, 0, 'Brainwashed Noble - Cast Chains of Ice at 50\% HP');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (59603, 596, 0, 2, 0, 100, 0, 15, 0, 0, 0, 59603, 0, 0, 'Brainwashed Noble - Flee at 15% HP');
DELETE FROM `creature_ai_scripts` WHERE `id`=59601;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (59601, 0, 3, 2, 0, 133, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 2428, 'Brainwashed Noble - Run Away from Target');
DELETE FROM `creature_ai_scripts` WHERE `id`=59602;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (59602, 0, 15, 512, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brainwashed Noble - Cast Spell Chains of Ice');
DELETE FROM `creature_ai_scripts` WHERE `id`=59603;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (59603, 0, 47, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brainwashed Noble - Flee');
UPDATE `creature_template` SET `AIName`='EventAI', `spells_template`=5990 WHERE `entry`=596;

-- Zorbin Fandazzle was added in patch 1.5.
UPDATE `creature` SET `patch_min`=3 WHERE `id`=14637;
UPDATE `creature_addon` SET `patch`=3 WHERE `guid`=50014;
UPDATE `creature_template` SET `patch`=3 WHERE `entry`=14637;
UPDATE `gameobject` SET `patch_min`=3 WHERE `guid` IN (49884, 50055);

-- Feralas - Incorrect shop + gossip - ok
-- https://github.com/LightsHope/issues/issues/314
-- gossip id from TC 11361
UPDATE `creature_template` SET `npcflag`=7, `gossip_menu_id`=11361 WHERE `entry`=14637 AND `patch`=0;
DELETE FROM `npc_gossip` WHERE `npc_guid`=50014;

DELETE FROM `gossip_menu` WHERE `entry` IN (11361);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES 
(11361, 7114, 0),
(11361, 7116, 60020);

DELETE FROM `gossip_menu_option` WHERE `menu_id` in (11361);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES 
(11361, 0, 0, 'GOSSIP_OPTION_QUESTGIVER', 0, 2, 2, 0, 0, 0, 0, 0, '', 0, 0),
(11361, 1, 1, 'Got anything interesting for sale, Zorbin?', 9817, 3, 4, 0, 0, 0, 0, 0, '', 0, 60020);

INSERT INTO `npc_text` (`ID`, `BroadcastTextID0`, `Probability0`) VALUES (7114, 9816, 1);

-- The ID for this text was likely 9816 but that ID is used already.
-- The text likely have changed with cataclysm and blizzard reused the old id.
UPDATE `broadcast_text` SET `MaleText`='Maybe this wasn\'t the best place for a shop after all...' WHERE `ID`=9816;

-- Add needed conditions
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES 
(60018, 8, 7721, 0),
(60019, 8, 7003, 0),
(60020, -1, 60018, 60019);


-- Thousand Needles - Wizzle Brassbolts vendor issue - ok
-- https://github.com/LightsHope/issues/issues/273
-- Not a vendor during vanilla
UPDATE `creature_template` SET `npcflag`=2 WHERE `entry`=4453 AND `patch`=0;

DELETE FROM `quest_greeting` WHERE `entry` IN (4453, 2546);
INSERT INTO `quest_greeting` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES 
(4453, 'Be careful where you put that foot of yours, $g sir : ma\'am;. We\'re not all blessed with the lofty height of a $R.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- Add missing quest greeting from TC - check
INSERT INTO `quest_greeting` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES 
(2546, 'Yarrr... ye best not be trifling with my time, matey!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


-- Accidentally broke a few conditions :(
REPLACE INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `flags`) VALUES 
(40000, 23, 11482, 1, 1),        -- Has no Crystal Pylon User's Manual
(40001, -1, 40000, 4321, 0),     -- Quest complete and has item
(40002, 23, 17691, 1, 1),
(40003, 8, 7162, 0, 0);

-- 40000 --> 60000
UPDATE `gossip_menu` SET `condition_id`=60000 WHERE `entry`=1621 AND `text_id`=2274;
UPDATE `gossip_menu` SET `condition_id`=60000 WHERE `entry`=1622 AND `text_id`=2277;
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`) VALUES (60000, 8, 3741);

-- 40001 --> 60001
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`) VALUES (60001, 8, 3845);
UPDATE `gossip_menu` SET `condition_id`=60001 WHERE `entry`=1961 AND `text_id`=2634;

-- 40002 --> 60002
UPDATE `gossip_menu_option` SET `condition_id`=60002 WHERE `menu_id`=1629 AND `id`=1;
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`) VALUES (60002, 8, 3761);

-- 40003 --> 60003
UPDATE `gossip_menu_option` SET `condition_id`=60003 WHERE `menu_id`=2189 AND `id`=1;
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`) VALUES (60003, 9, 4300);

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
