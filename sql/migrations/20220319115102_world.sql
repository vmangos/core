DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220319115102');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220319115102');
-- Add your query below.


-- Add Missing Raene Wolfrunner Gossip
-- Remove Uneeded Condition
DELETE FROM `conditions` WHERE `condition_entry` = 401;
UPDATE `gossip_menu` SET `condition_id` = 0 WHERE `entry` = 5502 AND `text_id` = 6553;

-- Correct Condition
-- 400: Target Has Done Quest 1046
UPDATE `conditions` SET `value1`=1046 WHERE `condition_entry`=400;

-- Add Missing Gossip Menu Option
INSERT INTO `gossip_menu_option` (`menu_id`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_script_id`, `condition_id`) VALUES
(5502, 'Raene, I lost Dartol\'s Rod of Transformation.', 9025, 1, 1, 5501, 5502, 389);

INSERT INTO `gossip_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(5502, 0, 0, 15, 22227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Raene Wolfrunner - Cast Spell');

INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES
(5501, 6554);

INSERT INTO `npc_text` (`ID`, `BroadcastTextID0`, `Probability0`, `BroadcastTextID1`, `Probability1`, `BroadcastTextID2`, `Probability2`, `BroadcastTextID3`, `Probability3`, `BroadcastTextID4`, `Probability4`, `BroadcastTextID5`, `Probability5`, `BroadcastTextID6`, `Probability6`, `BroadcastTextID7`, `Probability7`) VALUES
(6554, 9026, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- Add Conditions
-- 387: Target Can Accept Quest 1045
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (387, 19, 1045, 0, 0, 0, 0);
-- 388:  Not (Target Has 1 Stacks of Item 5462 In Inventory Or Bank)
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (388, 23, 5462, 1, 0, 0, 1);
-- 389: (387: Target Can Accept Quest 1045) And (388:  Not (Target Has 1 Stacks of Item 5462 In Inventory Or Bank))
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (389, -1, 387, 388, 0, 0, 0);

-- ------------------------------------------------------------------------------------------------------------------------------------------------------

-- Update Some Creature Abilities
-- Events list for Webwood Lurker
DELETE FROM `creature_ai_events` WHERE `creature_id`=1998;
DELETE FROM `creature_ai_scripts` WHERE `id` IN (199801);
UPDATE `creature_template` SET `ai_name`='' WHERE `entry`=1998;
UPDATE `creature_template` SET `auras`='11959', `ai_name`='' WHERE  `entry`=1998 AND `patch`=0;

-- Events list for Ragged Owlbeast
DELETE FROM `creature_ai_scripts` WHERE `id` IN (745001);
DELETE FROM `creature_ai_events` WHERE `creature_id`=7450;
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES
(74500, 'Winterspring - Ragged Owlbeast', 15848, 100, 1, 0, 0, 32, 7, 21, 26, 29, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
UPDATE `creature_template` SET `ai_name`='', `spell_list_id`=74500 WHERE `entry`=7450;

-- ------------------------------------------------------------------------------------------------------------------------------------------------------

-- Supplies for the Crossroads Has No Pre Quest
UPDATE `quest_template` SET `PrevQuestId`=0 WHERE  `entry`=5041 AND `patch`=0;

-- ------------------------------------------------------------------------------------------------------------------------------------------------------

-- Add Missing Timberling Spawns
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(1557, 2022, 0, 0, 0, 1, 9381.51, 850.173, 1261.25, 3.92492, 300, 300, 5, 100, 0, 1, 0, 0, 0, 10),
(1559, 2022, 0, 0, 0, 1, 9416.69, 851.614, 1255.5, 5.3344, 300, 300, 5, 100, 0, 1, 0, 0, 0, 10),
(1560, 2022, 0, 0, 0, 1, 9417.65, 881.206, 1259.13, 5.3344, 300, 300, 5, 100, 0, 1, 0, 0, 0, 10),
(1561, 2022, 0, 0, 0, 1, 9449.68, 885.044, 1256.24, 5.3344, 300, 300, 5, 100, 0, 1, 0, 0, 0, 10),
(1665, 2022, 0, 0, 0, 1, 9450.4, 850.795, 1249.93, 5.3344, 300, 300, 5, 100, 0, 1, 0, 0, 0, 10); 

-- ------------------------------------------------------------------------------------------------------------------------------------------------------

-- Lunar Fungal Bloom Can Drop In Stacks Of 2
UPDATE `gameobject_loot_template` SET `maxcount` = 2 WHERE `entry` = 14562 AND `item` = 15851;

-- ------------------------------------------------------------------------------------------------------------------------------------------------------

-- Misc Text Fixes (credit cmangos)
-- these quests have no RequestItemsText
UPDATE quest_template SET
RequestItemsText = NULL
WHERE entry IN (5, 109, 163, 1361, 1464, 1489, 1679, 3570);

-- text fix (Missing In Action)
UPDATE quest_template SET
RequestItemsText = 'Yes?'
WHERE entry = 219;

-- text fix (Protecting the Shipment)
UPDATE quest_template SET
RequestItemsText = 'Where is my powder, $N? My need grows more desperate every day.'
WHERE entry = 309;

-- text fix (Proving Your Worth)
UPDATE quest_template SET
RequestItemsText = 'Battle hard, $N. And do not despair, for despair is evil''s greatest weapon.'
WHERE entry = 323;

-- text fix (Escorting Erland)
UPDATE quest_template SET
RequestItemsText = 'Please be brief.  There is much danger about and we cannot stand idle in conversation.'
WHERE entry = 435;

-- text fix (Galen's Escape)
UPDATE quest_template SET
RequestItemsText = 'The keyhole of this strongbox is filled with black resin.  It is impossible to open.'
WHERE entry = 1393;

-- text fix (The Missing Diplomat)
UPDATE quest_template SET
Details = 'Yeah, you''re obviously not the smartest $c to come into Stormwind, but you''re about to be one of the dumbest to never leave.$b$bHave you met me friends?'
WHERE entry = 1447;

-- text fix (To The Hinterlands)
UPDATE quest_template SET
OfferRewardText = 'What do you want, $gladdy:missy;? Can''t you see I''ve got problems to take care of here? Who has time to stand around yapping with some $R chatterbox?$b$bThere are trolls coming out of the woodwork! Make it snappy.'
WHERE entry = 1449;

-- text fix (Earth Sapta)
UPDATE quest_template SET
OfferRewardText = 'I give you one in good faith. You already proved yourself once, but me tinkin'' you should be more careful in the future.'
WHERE entry = 1463;

-- text fix (Devourer of Souls)
UPDATE quest_template SET
OfferRewardText = 'You were sent by Carendin? $N, then.$b$bDo not think light of me because my sight is gone. I see things that lie behind now, with clarity I had never known. What I once thought a curse, is now a boon.'
WHERE entry = 1472;

-- text fix (Beat Bartleby)
UPDATE quest_template SET
RequestItemsText = 'The only way you''ll get this mug is if you pry it from my cold, dead fingers...'
WHERE entry = 1640;

-- text fix (The Rethban Gauntlet)
UPDATE quest_template SET
RequestItemsText = 'Time is wasting, $N.  If I were you, I''d get going...'
WHERE entry = 1699;

-- text fix (Lorax's Tale)
UPDATE quest_template SET
RequestItemsText = '...'
WHERE entry = 5126;

-- text fix (The Key to Scholomance) Alliance
UPDATE quest_template SET
OfferRewardText = 'Well, here you are, $n - the completed Skeleton Key.  I am certain as I can be that this key will allow you within the confines of the Scholomance.  There''s only one way to be absolutely sure it works, though.  Waste no time in trying it out, I say.$b$bGood luck, mighty hero.  May you continue to bring light unto the darkness!',
RequestItemsText = NULL
WHERE entry = 5505;

-- text fix (The Key to Scholomance) Horde
UPDATE quest_template SET
OfferRewardText = 'Well, here you are, $n - the completed Skeleton Key.  I am certain as I can be that this key will allow you within the confines of the Scholomance.  There''s only one way to be absolutely sure it works, though.  Waste no time in trying it out, I say.$b$bGood luck, mighty hero.  May your victories continue to bring you fame and power as you lay waste to Scholomance!',
RequestItemsText = NULL
WHERE entry = 5511;

-- text fix (Rise and Be Recognized) Horde
UPDATE quest_template SET
OfferRewardText = 'This new insignia reflects your rank amongst the Frostwolf. Keep it on you at all times.$b$bAnd $c... Die with honor!',
RequestItemsText = '<Warmaster Laggrond salutes you.>$b$bIt is your time, $N. You have done much for the Frostwolf Clan and in doing so, earned a place as not only a soldier of Frostwolf but also as a friend.$b$bWell done! Present your initiate''s insignia.'
WHERE entry = 7163;

-- text fix (Honored Amongst the Clan) Horde
UPDATE quest_template SET
RequestItemsText = 'It is good to see you again, $c. I had not expected you to return. Alas, you have proven yourself a brave and honorable soldier of the Frostwolf.$b$bYour time has come again, $N. You have earned a new ranking and as such, a new insignia denoting this rise in stature.$b$bPresent your insignia.'
WHERE entry = 7164;

-- text fix (Earned Reverence) Horde
UPDATE quest_template SET
OfferRewardText = '<Warmaster Laggrond roars.>$b$bThey have already begun telling tales of your deeds, soldier. The Stormpike shakes in fear when your name is uttered. Carry on!',
RequestItemsText = 'So many slain. Blood drenches the fields. Yet... You live... You have persevered. You have led our armies to many victories. For this, then, soldier, you have earned a new rank.$b$bPresent your insignia.'
WHERE entry = 7165;

-- text fix (Legendary Heroes) Horde
UPDATE quest_template SET
RequestItemsText = 'Your radiate command and power, $c. Exalted in the eyes of Frostwolf - the enemy cowers at the mention of your name.$b$bRise, Hero of Frostwolf. Rise and be honored!$b$bPresent your insignia.'
WHERE entry = 7166;

-- text fix (The Eye of Command) Horde
UPDATE quest_template SET
RequestItemsText = 'Drek''Thar sings your praises. Kalimdor is abuzz with tales of your heroics. The Warchief glows - your stalwart defense of our clan has pleased him greatly.$b$bYou have earned the Eye of Command.$b$bPresent your insignia, Commander $N.'
WHERE entry = 7167;

-- text fix (A Gallon of Blood)
UPDATE quest_template SET
RequestItemsText = 'You have the option of offering larger quantities of the blood taken from our enemies. I will be glad to accept gallon sized offerings, $N.'
WHERE entry = 7385;

-- ------------------------------------------------------------------------------------------------------------------------------------------------------

-- Add Start Script For Remorseful Highborne (credit cmangos)
DELETE FROM `quest_start_scripts` WHERE `id`=5252;
INSERT INTO `quest_start_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(5252, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6505, 6506, 6507, 0, 0, 0, 0, 0, 0, 'Remorseful Highborne - Talk');

UPDATE `quest_template` SET `StartScript` = 5252 WHERE `entry` = 5252;
UPDATE `broadcast_text` SET `chat_type` = 1 WHERE `entry` IN(6505, 6506, 6507);

-- ------------------------------------------------------------------------------------------------------------------------------------------------------

-- Set Correct Creature ID
UPDATE `creature` SET `id` = 8566 WHERE `guid` = 300647;

-- ------------------------------------------------------------------------------------------------------------------------------------------------------

-- Events list for Techbot (credit cmangos) 
DELETE FROM `creature_ai_events` WHERE `creature_id`=6231;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(623101, 6231, 0, 0, 0, 100, 3, 1000, 1000, 11000, 11000, 623101, 623102, 623103, 'Techbot - Talk - In Combat');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(623101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2426, 2427, 2428, 2429, 0, 0, 0, 0, 0, 'Techbot - Talk');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(623102, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2430, 2431, 2433, 2434, 0, 0, 0, 0, 0, 'Techbot - Talk');
DELETE FROM `creature_ai_scripts` WHERE `id`=623103;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(623103, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2435, 2436, 2437, 2438, 0, 0, 0, 0, 0, 'Techbot - Talk');

-- Add Missing Spell 10860 (NOTE: This spell seems to be broken, it should heal, instead it causes damage.)
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `inverseEffectMask`) VALUES (10860, 1, 7732, 0);
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (62310, 'Gnomeregan - Techbot', 10852, 100, 1, 0, 0, 32, 5, 5, 19, 19, 0, 10855, 100, 1, 0, 0, 32, 4, 8, 15, 25, 0, 10858, 100, 1, 0, 0, 0, 10, 10, 22, 22, 0, 10860, 100, 0, 0, 0, 0, 20, 30, 30, 60, 0, 0, 100, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 1, 0, 0, 0, 0, 0, 0, 0, 0);

UPDATE `creature_template` SET `ai_name`='EventAI' WHERE  `entry`=6231 AND `patch`=0;
UPDATE `creature` SET `position_x` = -4925.538, `position_y` = 824.91534, `position_z` = 247.46948, `orientation` = 1.731216192245483398, `wander_distance` = 3, `movement_type` = 1 WHERE `id` = 6231;
DELETE FROM `creature` WHERE `id` = 7732;

-- ------------------------------------------------------------------------------------------------------------------------------------------------------

-- Add Some Immunities (credit cmangos)
UPDATE `creature_template` SET `school_immune_mask` = 4 WHERE `entry` IN (
7044, -- Black Drake
7045, -- Scalding Drake
7046, -- Searscale Drake
7846, -- Teremus the Devourer (https://classic.wowhead.com/npc=7846/teremus-the-devourer#comments:id=2838902)
8976, -- Hematos
14388, -- Rogue Black Drake
14601, -- Ebonroc
11981, -- Flamegor
11983 -- Firemaw
);

-- ------------------------------------------------------------------------------------------------------------------------------------------------------

-- Update Quest Script For Pristine Spider Silk
DELETE FROM `quest_end_scripts` WHERE `id`=1940;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1940, 0, 0, 4, 147, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pristine Spider Silk - Wynne Larson: npc_flag questgiver removed'),
(1940, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2649, 0, 0, 0, 0, 0, 0, 0, 0, 'Pristine Spider Silk - Wynne Larson: Say text 1'),
(1940, 5, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pristine Spider Silk - Wynne Larson: Emote'),
(1940, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2651, 0, 0, 0, 0, 0, 0, 0, 0, 'Pristine Spider Silk - Wynne Larson: Say text 2'),
(1940, 8, 0, 3, 0, 1800, 69, 1, 0, 0, 0, 0, 0, 0, 0, 0, -8964.6, 824.703, 109.447, 3.80513, 0, 'Pristine Spider Silk - Wynne Larson: Move point 1'),
(1940, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2650, 0, 0, 0, 0, 0, 0, 0, 0, 'Pristine Spider Silk - Wynne Larson: Say text 3'),
(1940, 11, 0, 15, 9157, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pristine Spider Silk - Wynne Larson: Cast spell "Create Mage\'s Robe"'),
(1940, 16, 0, 1, 71, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pristine Spider Silk - Wynne Larson: Emote'),
(1940, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2648, 0, 0, 0, 0, 0, 0, 0, 0, 'Pristine Spider Silk - Wynne Larson: Say text 4'),
(1940, 19, 0, 3, 0, 1800, 69, 1, 0, 0, 0, 0, 0, 0, 0, 0, -8963, 822.517, 109.447, 3.846, 0, 'Pristine Spider Silk - Wynne Larson: Move point 1'),
(1940, 19, 0, 4, 147, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pristine Spider Silk - Wynne Larson: npc_flag questgiver added');

-- ------------------------------------------------------------------------------------------------------------------------------------------------------

-- Remove Creature Under Map
DELETE FROM `creature` WHERE `guid` = 89490;

-- ------------------------------------------------------------------------------------------------------------------------------------------------------

-- Add Missing Texts To Quest Script (credit cmangos)
DELETE FROM `quest_start_scripts` WHERE `id`=1363;
INSERT INTO `quest_start_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1363, 1, 0, 1, 5, 0, 0, 0, 90459, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Acolyte Dellis - Emote'),
(1363, 1, 0, 0, 0, 0, 0, 0, 90459, 0, 9, 2, 1828, 1829, 1830, 1831, 0, 0, 0, 0, 0, 'Acolyte Dellis - Talk');

-- ------------------------------------------------------------------------------------------------------------------------------------------------------

-- Add Complete Script to Quest 8791
UPDATE `quest_template` SET `CompleteScript` = 8791 WHERE `entry`=8791;
UPDATE `broadcast_text` SET `chat_type`= 1 WHERE  `entry`=11355;

DELETE FROM `quest_end_scripts` WHERE `id`=8791;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(8791, 1, 0, 1, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Commander Mar\'alith - Emote'),
(8791, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11355, 0, 0, 0, 0, 0, 0, 0, 0, 'Commander Mar\'alith - Talk');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
