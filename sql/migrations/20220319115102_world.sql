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
(74500, 'Winterspring - Ragged Owlbeast', 15848, 100, 1, 0, 0, 32, 0, 5, 3, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
UPDATE `creature_template` SET `ai_name`='', `spell_list_id`=74500 WHERE `entry`=7450;

-- Events list for Crazed Owlbeast
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(745201, 0, 15, 15716, 1, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Crazed Owlbeast - Cast Spell ');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (745201, 7452, 0, 2, 0, 100, 1, 50, 0, 120000, 120000, 745201, 0, 0, 'Crazed Owlbeast - Cast Enrage at 50% HP');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=7452;

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

-- text fix (Hints of a New Plague?)
UPDATE quest_template SET
RequestItemsText = 'The time for talk is done. Protect Kinelory if you care about the people of Hillsbrad at all.'
WHERE entry = 660;

-- text fix (Sunken Treasure)
UPDATE quest_template SET
RequestItemsText = 'This is no time to talk! The goggles need to be charged with the power of the stone!'
WHERE entry = 665;

-- text fix (Winterhoof Cleansing)
UPDATE quest_template SET
RequestItemsText = 'Do not delay, $N.  The Winterhoof Well''s taint must be removed!'
WHERE entry = 754;

-- text fix (Thunderhorn Cleansing)
UPDATE quest_template SET
RequestItemsText = 'The Thunderhorn Water Well is still tainted, $N.  Please, you must perform the ritual!'
WHERE entry = 758;

-- text fix (Wildmane Cleansing)
UPDATE quest_template SET
RequestItemsText = 'The last water well remains fetid and poisonous, $N.  You must not delay!'
WHERE entry = 760;

-- text fix (The Forgotten Pools)
UPDATE quest_template SET
RequestItemsText = 'Have you been to the Forgotten Pools, $N?  Did you find anything?'
WHERE entry = 870;

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

-- text fix (Tooga's Quest)
UPDATE quest_template SET
RequestItemsText = 'Where is Tooga?'
WHERE entry = 1560;

-- text fix (Beat Bartleby)
UPDATE quest_template SET
RequestItemsText = 'The only way you''ll get this mug is if you pry it from my cold, dead fingers...'
WHERE entry = 1640;

-- text fix (The Tome of Valor)
UPDATE quest_template SET
RequestItemsText = 'We''ll make our stand at the house!'
WHERE entry = 1651;

-- text fix (The Rethban Gauntlet)
UPDATE quest_template SET
RequestItemsText = 'Time is wasting, $N.  If I were you, I''d get going...'
WHERE entry = 1699;

-- text fix (The Affray)
UPDATE quest_template SET
RequestItemsText = 'Have you completed your challenge?'
WHERE entry = 1719;

-- text fix (Scarlet Diversions)
UPDATE quest_template SET
RequestItemsText = 'A surprise raid on the Scarlet Crusade''s tenuous forward position will give us a buffer of time to be able to march on Andorhal.  I trust you are here to report success!$b$bOnce this is successfully executed, we will need to work diligently and quickly.  We do not have the materiel and manpower to fight both the Scourge and the Scarlet Crusade at the same time if they do not buy our little ruse.'
WHERE entry = 5096;

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

-- text fix (Mold Rhymes With...)
UPDATE quest_template SET
OfferRewardText = 'Arbington said you''d deliver the goods, and deliver you have! A deal is a deal; let me pack the fragments into the mold for you.$b$bDid Arbington imbue them already? Excellent... otherwise, it would have been a long trip back to the Chillwind Point for you.',
RequestItemsText = 'Yeah, I know who you are, and I know why you''re here. Arbington sent word to me before you arrived. Let''s cut to deal at hand, now shall we?$b$bI''ve got a mold you can use for the skeleton key, but it will cost you - fifteen gold, up front, no negotiation. I''ll pack the skeletal fragments into the mold for you, and I''ll also teach you on how to forge the stem of the key without any knowledge of blacksmithing... all free of charge no less.$b$bWho says mercenaries don''t offer competitive deals!'
WHERE entry = 5538;

-- text fix (Rise and Be Recognized) Horde
UPDATE quest_template SET
OfferRewardText = 'This new insignia reflects your rank amongst the Frostwolf. Keep it on you at all times.$b$bAnd $c... Die with honor!',
RequestItemsText = '<Warmaster Laggrond salutes you.>$b$bIt is your time, $N. You have done much for the Frostwolf Clan and in doing so, earned a place as not only a soldier of Frostwolf but also as a friend.$b$bWell done! Present your initiate''s insignia.'
WHERE entry = 7163;

-- text fix (Rise and Be Recognized) Alliance
UPDATE quest_template SET
RequestItemsText = 'Most do not live long enough to rise above their own mediocrity. You have proven yourself to be an exemplary soldier, $c. The time has come.$b$bPresent your insignia.'
WHERE entry = 7168;

-- text fix (Honored Amongst the Clan) Horde
UPDATE quest_template SET
RequestItemsText = 'It is good to see you again, $c. I had not expected you to return. Alas, you have proven yourself a brave and honorable soldier of the Frostwolf.$b$bYour time has come again, $N. You have earned a new ranking and as such, a new insignia denoting this rise in stature.$b$bPresent your insignia.'
WHERE entry = 7164;

-- text fix (Honored Amongst the Guard) Alliance
UPDATE quest_template SET
RequestItemsText = 'The base buzzes with news of your exploits in the Field of Strife! You have struck mighty blows against our enemy - crushing their morale! For this, you have earned a rank of honor among the Stormpike.$b$bPresent your insignia.'
WHERE entry = 7169;

-- text fix (Earned Reverence) Horde
UPDATE quest_template SET
OfferRewardText = '<Warmaster Laggrond roars.>$b$bThey have already begun telling tales of your deeds, soldier. The Stormpike shakes in fear when your name is uttered. Carry on!',
RequestItemsText = 'So many slain. Blood drenches the fields. Yet... You live... You have persevered. You have led our armies to many victories. For this, then, soldier, you have earned a new rank.$b$bPresent your insignia.'
WHERE entry = 7165;

-- text fix (Earned Reverence) Alliance
UPDATE quest_template SET
RequestItemsText = 'I must know, $N. When you look directly into the eyes of the enemy, do you see fear? Do they now cower in your presence? They must realize that they are defeated!$b$bYou have earned reverence among the Guard. Present your insignia!'
WHERE entry = 7170;

-- text fix (Legendary Heroes) Horde
UPDATE quest_template SET
RequestItemsText = 'Your radiate command and power, $c. Exalted in the eyes of Frostwolf - the enemy cowers at the mention of your name.$b$bRise, Hero of Frostwolf. Rise and be honored!$b$bPresent your insignia.'
WHERE entry = 7166;

-- text fix (Legendary Heroes) Alliance
UPDATE quest_template SET
OfferRewardText = 'Surely it will be you who carries the Eye of Command!',
RequestItemsText = 'Before me stands an exalted hero of the Alliance.$b$b<Lieutenant Haggerdin salutes.>$b$bFew have earned such a rank among the Stormpike. I have watched the enemy fall before you. I have seen their resolve crumble in your presence. When you enter the fray, you become the beacon of hope for our forces!$b$bPresent your insignia.'
WHERE entry = 7171;

-- text fix (The Eye of Command) Horde
UPDATE quest_template SET
RequestItemsText = 'Drek''Thar sings your praises. Kalimdor is abuzz with tales of your heroics. The Warchief glows - your stalwart defense of our clan has pleased him greatly.$b$bYou have earned the Eye of Command.$b$bPresent your insignia, Commander $N.'
WHERE entry = 7167;

-- text fix (The Eye of Command) Alliance
UPDATE quest_template SET
OfferRewardText = 'It is you who must lead our troops to victory, Commander! The soldiers are under your command. They will follow your direct orders. Lead them.... Crush the Frostwolf.',
RequestItemsText = 'Let them hear your voice, Commander $N! Let them know fear. Show them what power the Stormpike holds in their rank!$b$bPresent your insignia.'
WHERE entry = 7172;

-- text fix (A Gallon of Blood)
UPDATE quest_template SET
RequestItemsText = 'You have the option of offering larger quantities of the blood taken from our enemies. I will be glad to accept gallon sized offerings, $N.'
WHERE entry = 7385;

-- text fix (Crystal Cluster)
UPDATE quest_template SET
RequestItemsText = 'There are times which you may be entrenched in battle for days or weeks on end. During those longer periods of activity you may end up collecting large clusters of the Frostwolf''s storm crystals.$b$bThe Circle accepts such offerings, $N.'
WHERE entry = 7386;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
