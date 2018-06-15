DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180614175525');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180614175525');
-- Add your query below.

-- Quests

-- Missing Texts for Barithras Moonshade on Quests Taken - Already ok (LH implementation is correct)
-- https://github.com/TrinityCore/TrinityCore/issues/20258
-- Source: https://www.youtube.com/watch?v=nSSOfjaTiTI&feature=youtu.be&list=PLAD1ABDC820215E28&t=211


-- Missing event on quest 'The Moss-twined Heart' finished - ok
-- https://github.com/TrinityCore/TrinityCore/issues/20261
UPDATE `quest_template` SET `CompleteScript`=927 WHERE `entry`=927;
DELETE FROM `quest_end_scripts` WHERE `id`=927;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(927, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Moss-twined Heart - Denalan: npc\_flag questgiver removed'),
(927, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1126, 0, 0, 0, 0, 0, 0, 0, 0, 'The Moss-twined Heart - Denalan: Emote text 1'),
(927, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1127, 0, 0, 0, 0, 0, 0, 0, 0, 'The Moss-twined Heart - Denalan: Say text 1'),
(927, 4, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Moss-twined Heart - Denalan: Emote talk 1'),
(927, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1128, 0, 0, 0, 0, 0, 0, 0, 0, 'The Moss-twined Heart - Denalan: Say text 2'),
(927, 8, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Moss-twined Heart - Denalan: Emote talk 2'),
(927, 8, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Moss-twined Heart - Denalan: npc\_flag questgiver added');


-- Missing event on quest 'Wait for Sirra to Finish' taken - ok
-- https://github.com/TrinityCore/TrinityCore/issues/20270
DELETE FROM `quest_start_scripts` WHERE `id`=401;
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(401, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Wait for Sirra to Finish - Sirra Von\'Indi: npc\_flag questgiver removed'),
(401, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 563, 0, 0, 0, 0, 0, 0, 0, 0, 'Wait for Sirra to Finish - Sirra Von\'Indi: Emote text 1'),
(401, 1, 1, 69, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Wait for Sirra to Finish - Sirra Von\'Indi: State use standing'),
(401, 8, 1, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Wait for Sirra to Finish - Sirra Von\'Indi: State stand'),
(401, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 564, 0, 0, 0, 0, 0, 0, 0, 0, 'Wait for Sirra to Finish - Sirra Von\'Indi: Say text 1'),
(401, 9, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Wait for Sirra to Finish - Sirra Von\'Indi: Emote talk'),
(401, 10, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Wait for Sirra to Finish - Sirra Von\'Indi: npc\_flag questgiver added');


-- Missing Texts for Brother Kristoff on Quest Finished - ok
-- https://github.com/TrinityCore/TrinityCore/issues/20271
UPDATE `quest_template` SET `CompleteScript`=346 WHERE `entry`=346;
DELETE FROM `quest_end_scripts` WHERE `id`=346;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(346, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 282, 0, 0, 0, 0, 0, 0, 0, 0, 'Return to Kristoff - Brother Kristoff: Say text 1'),
(346, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Return to Kristoff - Brother Kristoff: Emote talk 1');


-- Missing Text for Archmage Ansirem Runeweaver on Quest 'Magical Analysis' Finished - ok
-- https://github.com/TrinityCore/TrinityCore/issues/20274
UPDATE `quest_template` SET `CompleteScript`=602 WHERE `entry`=602;
DELETE FROM `quest_end_scripts` WHERE `id`=602;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(602, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 761, 0, 0, 0, 0, 0, 0, 0, 0, 'Magical Analysis - Archmage Ansirem Runeweaver: Say text 1');


-- Missing event on quest 'Bathran's Hair' finished - ok
-- https://github.com/TrinityCore/TrinityCore/issues/20299
UPDATE `quest_template` SET `CompleteScript`=1010 WHERE `entry`=1010;
DELETE FROM `quest_end_scripts` WHERE `id`=1010;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(1010, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Bathran\'s Hair - Orendil Broadleaf: npc\_flag questgiver removed'),
(1010, 0, 1, 69, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Bathran\'s Hair - Orendil Broadleaf: State use standing'),
(1010, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1307, 0, 0, 0, 0, 0, 0, 0, 0, 'Bathran\'s Hair - Orendil Broadleaf: Emote text 1'),
(1010, 6, 1, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Bathran\'s Hair - Orendil Broadleaf: State stand'),
(1010, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1308, 0, 0, 0, 0, 0, 0, 0, 0, 'Bathran\'s Hair - Orendil Broadleaf: Say text 1'),
(1010, 7, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Bathran\'s Hair - Orendil Broadleaf: Emote talk 1'),
(1010, 8, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Bathran\'s Hair - Orendil Broadleaf: npc\_flag questgiver added');


-- Missing event on quest "Raene's Cleansing (Part 5)" finished - ok
-- https://github.com/TrinityCore/TrinityCore/issues/20346
UPDATE `quest_template` SET `CompleteScript`=1027 WHERE `entry`=1027 AND `patch`=0;
DELETE FROM `quest_end_scripts` WHERE `id`=1027;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(1027, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Raene\'s Cleansing - Shael\'dryn: npc\_flag questgiver removed'),
(1027, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1380, 0, 0, 0, 0, 0, 0, 0, 0, 'Raene\'s Cleansing - Shael\'dryn: Say text 1'),
(1027, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1381, 0, 0, 0, 0, 0, 0, 0, 0, 'Raene\'s Cleansing - Shael\'dryn: Say text 2'),
(1027, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1382, 0, 0, 0, 0, 0, 0, 0, 0, 'Raene\'s Cleansing - Shael\'dryn: Say text 3'),
(1027, 10, 15, 16633, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Raene\'s Cleansing - Shael\'dryn: Cast spell "Create Item Visual (DND)"'),
(1027, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1383, 0, 0, 0, 0, 0, 0, 0, 0, 'Raene\'s Cleansing - Shael\'dryn: Say text 4'),
(1027, 17, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Raene\'s Cleansing - Shael\'dryn: npc\_flag questgiver added');


-- Fix reward text for quest "Retribution of the Light" - ok
-- https://github.com/TrinityCore/TrinityCore/issues/20424
UPDATE `quest_template` SET `OfferRewardText`='You gather the paladin\'s remains as carefully as you can, recalling that at least his spirit has been released from any pain or suffering that might have been forced upon him.' WHERE `entry`=5204 AND `patch`=0;


-- Eridan Bluewind's event should trigger after quest "Purified!" is taken - ok
-- https://github.com/TrinityCore/TrinityCore/issues/20425
UPDATE `quest_template` SET `StartScript`=4442 WHERE `entry`=4442 AND `patch`=0;
DELETE FROM `quest_start_scripts` WHERE `id`=4442;
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(4442, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Purified! - Eridan Bluewind: npc\_flag questgiver removed'),
(4442, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8366, 0, 0, 0, 0, 0, 0, 0, 0, 'Purified! - Eridan Bluewind: Say text 1'),
(4442, 1, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2.59669, 0, 'Purified! - Eridan Bluewind: Orientation 1'),
(4442, 2, 15, 13540, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Purified! - Eridan Bluewind: Cast spell "Green Channeling"'),
(4442, 7, 5, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Purified! - Eridan Bluewind: Stop cast'),
(4442, 8, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2.72271, 0, 'Purified! - Eridan Bluewind: Orientation 2'),
(4442, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8367, 0, 0, 0, 0, 0, 0, 0, 0, 'Purified! - Eridan Bluewind: Say text 2'),
(4442, 9, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Purified! - Eridan Bluewind: npc\_flag questgiver added');


-- Missing event on quest "Fragments of the Past (Part 2)" finished - ok
-- https://github.com/TrinityCore/TrinityCore/issues/20428
UPDATE `quest_template` SET `CompleteScript`=5247 WHERE `entry`=5247;
DELETE FROM `quest_end_scripts` WHERE `id`=5247;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(5247, 0, 4, 147, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Fragments of the Past - Aurora Skycaller: npc\_flag questgiver+gossip removed'),
(5247, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8332, 0, 0, 0, 0, 0, 0, 0, 0, 'Fragments of the Past - Aurora Skycaller: Say text 1'),
(5247, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8333, 0, 0, 0, 0, 0, 0, 0, 0, 'Fragments of the Past - Aurora Skycaller: Say text 2'),
(5247, 4, 15, 9156, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Fragments of the Past - Aurora Skycaller: Cast spell "Create Mage\'s Orb"'),
(5247, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8338, 0, 0, 0, 0, 0, 0, 0, 0, 'Fragments of the Past - Aurora Skycaller: Say text 2'),
(5247, 10, 4, 147, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Fragments of the Past - Aurora Skycaller: npc\_flag questgiver+gossip added');


-- DB/Creature: Alexi Barov & Weldon Barov - ok
-- https://github.com/TrinityCore/TrinityCore/issues/20642
UPDATE `quest_template` SET `CompleteScript`=5343 WHERE `entry`=5343;
DELETE FROM `quest_end_scripts` WHERE `id`=5343;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(5343, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6555, 0, 0, 0, 0, 0, 0, 0, 0, 'Barov Family Fortune - Weldon Barov: Say text 1'),
(5343, 1, 1, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Barov Family Fortune - Weldon Barov: Emote laugh');

DELETE FROM `quest_end_scripts` WHERE `id`=5341;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(5341, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6554, 0, 0, 0, 0, 0, 0, 0, 0, 'Barov Family Fortune - Alexi Barov: Say text 1'),
(5341, 1, 1, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Barov Family Fortune - Alexi Barov: Emote laugh');

-- Events list for Alexi Barov
DELETE FROM `creature_ai_events` WHERE `creature_id`=11022;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES 
(1102201, 11022, 0, 9, 0, 100, 1, 0, 5, 13000, 18000, 1102201, 0, 0, 'Alexi Barov - Cast Rupture'),
(1102202, 11022, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1102202, 0, 0, 'Alexi Barov - Yell on Aggro'),
(1102204, 11022, 0, 13, 0, 100, 1, 6000, 10000, 0, 0, 1102204, 0, 0, 'Alexi Barov - Cast Kick on Target Spell Casting');

DELETE FROM `creature_ai_scripts` WHERE `id`=1102202;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(1102202, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 7979, 0, 0, 0, 0, 0, 0, 0, 0, 'Alexi Barov - Yell text');

-- Events list for Weldon Barov
DELETE FROM `creature_ai_scripts` WHERE `id` IN (1102302, 1102303);
DELETE FROM `creature_ai_events` WHERE `creature_id`=11023;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES 
(1102301, 11023, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1102301, 0, 0, 'Weldon Barov - Yell on Aggro');
DELETE FROM `creature_ai_scripts` WHERE `id`=1102301;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(1102301, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 7979, 0, 0, 0, 0, 0, 0, 0, 0, 'Weldon Barov - Yell text');
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (110230, 'Western Plaguelands - Weldon Barov', 16244, 100, 0, 0, 0, 0, 1, 5, 12, 18, 0, 15284, 100, 1, 0, 0, 1, 8, 13, 13, 16, 0, 9080, 100, 1, 0, 0, 32, 0, 0, 13, 16, 0, 15580, 100, 1, 0, 0, 0, 2, 2, 6, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);


-- Missing event on quest "Orendil's Cure" finished - ok
-- https://github.com/TrinityCore/TrinityCore/issues/20340
UPDATE `quest_template` SET `CompleteScript`=1020 WHERE `entry`=1020;
DELETE FROM `quest_end_scripts` WHERE `id`=1020;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(1020, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Orendil\'s Cure - Pelturas Whitemoon: npc\_flag questgiver removed'),
(1020, 1, 35, 0, 0, 0, 0, 32349, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Orendil\'s Cure - Pelturas Whitemoon: Orient to Relara Whitemoon'),
(1020, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1335, 0, 0, 0, 0, 0, 0, 0, 0, 'Orendil\'s Cure - Pelturas Whitemoon: Say text 1'),
(1020, 3, 0, 0, 0, 0, 0, 32349, 0, 9, 3, 1336, 0, 0, 0, 0, 0, 0, 0, 0, 'Orendil\'s Cure - Relara Whitemoon: Emote text 1'),
(1020, 5, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1.88496, 0, 'Orendil\'s Cure - Pelturas Whitemoon: Orient home'),
(1020, 8, 0, 0, 0, 0, 0, 32349, 0, 9, 3, 1337, 0, 0, 0, 0, 0, 0, 0, 0, 'Orendil\'s Cure - Relara Whitemoon: Say text 1'),
(1020, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1338, 0, 0, 0, 0, 0, 0, 0, 0, 'Orendil\'s Cure - Pelturas Whitemoon: Say text 2'),
(1020, 9, 35, 0, 0, 0, 0, 32349, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Orendil\'s Cure - Pelturas Whitemoon: Orient to Relara Whitemoon'),
(1020, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1339, 0, 0, 0, 0, 0, 0, 0, 0, 'Orendil\'s Cure - Pelturas Whitemoon: Say text 3'),
(1020, 15, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Orendil\'s Cure - Pelturas Whitemoon: Orient player'),
(1020, 16, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Orendil\'s Cure - Pelturas Whitemoon: Emote bow'),
(1020, 19, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1.88496, 0, 'Orendil\'s Cure - Pelturas Whitemoon: Orient home'),
(1020, 19, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Orendil\'s Cure - Pelturas Whitemoon: npc\_flag questgiver added');


-- Missing event on quest "Elune's Tear" finished - ok
-- https://github.com/TrinityCore/TrinityCore/issues/20342
UPDATE `quest_template` SET `CompleteScript`=1033 WHERE `entry`=1033;
DELETE FROM `quest_end_scripts` WHERE `id`=1033;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(1033, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Elune\'s Tear - Pelturas Whitemoon: npc\_flag questgiver removed'),
(1033, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1438, 0, 0, 0, 0, 0, 0, 0, 0, 'Elune\'s Tear - Pelturas Whitemoon: Emote text 1'),
(1033, 3, 3, 0, 800, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2682.65, -456.624, 109.234, 0, 0, 'Elune\'s Tear - Pelturas Whitemoon: Move point 1'),
(1033, 4, 35, 0, 0, 0, 0, 32349, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Elune\'s Tear - Pelturas Whitemoon: Orient to Relara Whitemoon'),
(1033, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1439, 0, 0, 0, 0, 0, 0, 0, 0, 'Elune\'s Tear - Pelturas Whitemoon: Say text 1'),
(1033, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1440, 0, 0, 0, 0, 0, 0, 0, 0, 'Elune\'s Tear - Pelturas Whitemoon: Say text 1'),
(1033, 12, 3, 0, 800, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2682.14, -454.808, 109.233, 1.88496, 0, 'Elune\'s Tear - Pelturas Whitemoon: Move point 2'),
(1033, 13, 0, 0, 0, 0, 0, 32349, 0, 9, 3, 1441, 0, 0, 0, 0, 0, 0, 0, 0, 'Elune\'s Tear - Relara Whitemoon: Emote text 1'),
(1033, 16, 0, 0, 0, 0, 0, 32349, 0, 9, 3, 1442, 0, 0, 0, 0, 0, 0, 0, 0, 'Elune\'s Tear - Relara Whitemoon: Say text 1'),
(1033, 17, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Elune\'s Tear - Pelturas Whitemoon: npc\_flag questgiver added');


-- Missing event on quest "The Ruins of Stardust" finished - ok
-- https://github.com/TrinityCore/TrinityCore/issues/20343
UPDATE `quest_template` SET `CompleteScript`=1034 WHERE `entry`=1034;
DELETE FROM `quest_end_scripts` WHERE `id`=1034;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(1034, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Ruins of Stardust - Pelturas Whitemoon: npc\_flag questgiver removed'),
(1034, 1, 3, 0, 800, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2682.65, -456.624, 109.234, 0, 0, 'The Ruins of Stardust - Pelturas Whitemoon: Move point 1'),
(1034, 2, 35, 0, 0, 0, 0, 32349, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Ruins of Stardust - Pelturas Whitemoon: Orient to Relara Whitemoon'),
(1034, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1443, 0, 0, 0, 0, 0, 0, 0, 0, 'The Ruins of Stardust - Pelturas Whitemoon: Emote text 1'),
(1034, 5, 3, 0, 800, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2682.14, -454.808, 109.233, 1.88496, 0, 'The Ruins of Stardust - Pelturas Whitemoon: Move point 2'),
(1034, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1444, 0, 0, 0, 0, 0, 0, 0, 0, 'The Ruins of Stardust - Pelturas Whitemoon: Emote text 2'),
(1034, 9, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Ruins of Stardust - Pelturas Whitemoon: npc\_flag questgiver added');


-- Missing event on quest "Fallen Sky Lake" finished - ok
-- https://github.com/TrinityCore/TrinityCore/issues/20344
UPDATE `quest_template` SET `CompleteScript`=1035 WHERE `entry`=1035;
DELETE FROM `quest_end_scripts` WHERE `id`=1035;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(1035, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Fallen Sky Lake - Pelturas Whitemoon: npc\_flag questgiver removed'),
(1035, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1346, 0, 0, 0, 0, 0, 0, 0, 0, 'Fallen Sky Lake - Pelturas Whitemoon: Emote text 1'),
(1035, 2, 35, 0, 0, 0, 0, 32349, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Fallen Sky Lake - Pelturas Whitemoon: Orient to Relara Whitemoon'),
(1035, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1347, 0, 0, 0, 0, 0, 0, 0, 0, 'Fallen Sky Lake - Pelturas Whitemoon: Say text 1'),
(1035, 3, 1, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Fallen Sky Lake - Pelturas Whitemoon: Emote kneel'),
(1035, 7, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1.88496, 0, 'Fallen Sky Lake - Pelturas Whitemoon: Orient home'),
(1035, 9, 0, 0, 0, 0, 0, 32349, 0, 9, 3, 1349, 0, 0, 0, 0, 0, 0, 0, 0, 'Fallen Sky Lake - Relara Whitemoon: Say text 1'),
(1035, 11, 35, 0, 0, 0, 0, 32349, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Fallen Sky Lake - Pelturas Whitemoon: Orient to Relara Whitemoon'),
(1035, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1350, 0, 0, 0, 0, 0, 0, 0, 0, 'Fallen Sky Lake - Pelturas Whitemoon: Say text 2'),
(1035, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1351, 0, 0, 0, 0, 0, 0, 0, 0, 'Fallen Sky Lake - Pelturas Whitemoon: Say text 3'),
(1035, 15, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Fallen Sky Lake - Pelturas Whitemoon: Emote talk'),
(1035, 18, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Fallen Sky Lake - Pelturas Whitemoon: Orient player'),
(1035, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1352, 0, 0, 0, 0, 0, 0, 0, 0, 'Fallen Sky Lake - Pelturas Whitemoon: Emote text 2'),
(1035, 20, 1, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Fallen Sky Lake - Pelturas Whitemoon: Emote cry'),
(1035, 22, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Fallen Sky Lake - Pelturas Whitemoon: Emote bow'),
(1035, 25, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1.88496, 0, 'Fallen Sky Lake - Pelturas Whitemoon: Orient home'),
(1035, 25, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Fallen Sky Lake - Pelturas Whitemoon: npc\_flag questgiver added');

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
