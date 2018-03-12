DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180226050544');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180226050544');
-- Add your query below.


-- Jubling
-- https://github.com/LightsHope/server/issues/1153
UPDATE `creature_template` SET `modelid_1`=14938 WHERE  `entry`=14878 AND `patch`=0;

-- Searing Needle
-- https://github.com/LightsHope/server/issues/957
REPLACE INTO `spell_effect_mod` (`Id`, `EffectIndex`, `EffectApplyAuraName`, `Comment`) VALUES (16454, 1, 14, 'Searing Blast damage taken');

-- Faction exclusive loot
UPDATE `creature_loot_template` SET `condition_id`=3 WHERE `item`=21889;
UPDATE `reference_loot_template` SET `condition_id`=3 WHERE item in (22400,22401,23203,23201,23006,22402,21288,21289,21290);
UPDATE `reference_loot_template` SET `condition_id`=2 WHERE item in (23199,23200,22345,22395,22396,23005,21291,21292,21293);

-- Sagefish Delight
-- https://github.com/LightsHope/server/issues/1277
REPLACE INTO `spell_mod` (`Id`, `SpellVisual`, `Comment`) VALUES (25889, 52, 'Brain Food: Change Visual to allow stacking with 25888');

-- Arikara
-- https://github.com/LightsHope/server/issues/1245
UPDATE `creature_template` SET `type_flags`=1 WHERE `entry`=10882;

-- Warsong Runes
-- https://github.com/LightsHope/server/issues/1238
REPLACE INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) 
VALUES (14754, 21565, 0, 0),(14754, 21566, 0, 0);

-- Silithus Quest chain
-- https://github.com/LightsHope/server/issues/919
UPDATE `quest_template` SET `NextQuestId`=8280 WHERE  `entry`=8275 AND `patch`=6;
UPDATE `quest_template` SET `NextQuestId`=8280 WHERE  `entry`=8276 AND `patch`=6;
UPDATE `quest_template` SET `PrevQuestId`=0 WHERE  `entry`=8280 AND `patch`=6;

-- Anvilrage Reservist
-- https://github.com/LightsHope/server/issues/883
DELETE FROM `creature_ai_scripts` WHERE  `id`=890110;
DELETE FROM `creature_ai_scripts` WHERE  `id`=890111;

-- Pamela's Doll
-- https://github.com/LightsHope/server/issues/858
DELETE FROM `gameobject` WHERE `guid`=21552;
UPDATE `gameobject` SET `spawntimesecsmin`=120, `spawntimesecsmax`=120 WHERE `id`=176117;
UPDATE `gameobject` SET `position_x`=1476.86, `position_y`=-3718.67, `position_z`=80.5149 WHERE `guid`=21604;

-- Facing Negolash
-- https://github.com/LightsHope/server/issues/834
UPDATE `quest_template` SET `NextQuestInChain`=618 WHERE  `entry`=615 AND `patch`=0;

-- Warlock quests
-- https://github.com/LightsHope/server/issues/705
REPLACE INTO `creature_questrelation` (`id`, `quest`) VALUES (5172, 4965);
UPDATE `quest_template` SET `RequiredRaces`=178 WHERE  `entry`=4967;
UPDATE `quest_template` SET `RequiredRaces`=77 WHERE  `entry`=4968;
REPLACE INTO `creature_questrelation` (`id`, `quest`) VALUES (3326, 4736);
UPDATE `quest_template` SET `RequiredRaces`=2 WHERE  `entry`=4736;
UPDATE `quest_template` SET `RequiredRaces`=16 WHERE  `entry`=4737;
UPDATE `quest_template` SET `ExclusiveGroup`=4737 WHERE  `entry`=4736;
UPDATE `quest_template` SET `ExclusiveGroup`=4737 WHERE  `entry`=4739;

-- Seal Fate family flags
UPDATE `spell_proc_event` SET `SpellFamilyMask0`=1107296782 WHERE `entry`=14186;

-- Ring of Law spectators
-- https://github.com/LightsHope/server/issues/262
DELETE FROM `creature` WHERE `id`=8916;
REPLACE INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES 
(47634, 8916, 230, 9072, 0, 547.512, -168.355, -36.8797, 5.93412, 7200, 7200, 0, 0, 2561, 1923, 0, 0),
(47641, 8916, 230, 9072, 0, 539.627, -189.186, -35.5125, 0, 7200, 7200, 0, 0, 2561, 1923, 0, 0),
(47643, 8916, 230, 9069, 0, 538.864, -166.645, -34.0779, 5.91667, 7200, 7200, 0, 0, 2561, 1923, 0, 0),
(47654, 8916, 230, 9072, 0, 649.264, -176.105, -36.907, 3.36848, 7200, 7200, 0, 0, 2561, 1923, 0, 0),
(47655, 8916, 230, 9069, 0, 647.568, -172.909, -36.9245, 3.42085, 7200, 7200, 0, 0, 2561, 1923, 0, 0),
(47667, 8916, 230, 9070, 0, 628.883, -236.882, -35.5437, 2.18166, 7200, 7200, 0, 0, 2561, 1923, 0, 0),
(47668, 8916, 230, 9072, 0, 629.115, -232.726, -36.89, 2.21657, 7200, 7200, 0, 0, 2561, 1923, 0, 0),
(47676, 8916, 230, 9072, 0, 572.808, -140.939, -36.8044, 5.18363, 7200, 7200, 0, 0, 2561, 1923, 0, 0),
(47677, 8916, 230, 9070, 0, 558.88, -137.183, -34.0844, 5.34071, 7200, 7200, 0, 0, 2561, 1923, 0, 0),
(47678, 8916, 230, 9071, 0, 578.281, -139.209, -36.7895, 5.09636, 7200, 7200, 0, 0, 2561, 1923, 0, 0),
(47679, 8916, 230, 9070, 0, 581.317, -133.988, -35.456, 4.99164, 7200, 7200, 0, 0, 2561, 1923, 0, 0),
(47680, 8916, 230, 9069, 0, 574.24, -136.707, -35.4314, 5.13127, 7200, 7200, 0, 0, 2561, 1923, 0, 0),
(47681, 8916, 230, 9071, 0, 580.626, -138.046, -36.7586, 5.06145, 7200, 7200, 0, 0, 2561, 1923, 0, 0),
(47682, 8916, 230, 9070, 0, 564.922, -132.282, -34.0677, 5.23599, 7200, 7200, 0, 0, 2561, 1923, 0, 0),
(47685, 8916, 230, 9069, 0, 570.107, -244.451, -34.0701, 1.11701, 7200, 7200, 0, 0, 2561, 1923, 0, 0),
(47686, 8916, 230, 9070, 0, 571.724, -237.314, -36.847, 1.0821, 7200, 7200, 0, 0, 2561, 1923, 0, 0),
(47687, 8916, 230, 9069, 0, 564.052, -232.826, -36.8618, 0.942478, 7200, 7200, 0, 0, 2561, 1923, 0, 0),
(47688, 8916, 230, 9069, 0, 559.582, -242.593, -34.094, 0.977384, 7200, 7200, 0, 0, 2561, 1923, 0, 0),
(47689, 8916, 230, 9069, 0, 573.1, -245.279, -34.0668, 1.16937, 7200, 7200, 0, 0, 2561, 1923, 0, 0),
(47690, 8916, 230, 9071, 0, 560.295, -235.085, -35.4579, 0.925025, 7200, 7200, 0, 0, 2561, 1923, 0, 0),
(47691, 8916, 230, 9070, 0, 577.724, -242.723, -35.4771, 1.41372, 7200, 7200, 0, 0, 2561, 1923, 0, 0),
(47694, 8916, 230, 9069, 0, 630.548, -141.538, -35.5298, 4.11898, 7200, 7200, 0, 0, 2561, 1923, 0, 0),
(47695, 8916, 230, 9070, 0, 638.577, -149.822, -35.5189, 3.94444, 7200, 7200, 0, 0, 2561, 1923, 0, 0),
(47696, 8916, 230, 9070, 0, 633.551, -150.085, -36.9221, 4.01426, 7200, 7200, 0, 0, 2561, 1923, 0, 0),
(47644, 8894, 230, 8752, 0, 542.846, -178.15, -36.887, 6.10865, 7200, 7200, 0, 0, 4980, 9300, 0, 0),
(47645, 8896, 230, 8793, 0, 539.557, -179.862, -35.5257, 6.14356, 7200, 7200, 0, 0, 2466, 1923, 0, 0),
(47649, 8896, 230, 8796, 0, 545.277, -172.964, -36.8681, 6.02139, 7200, 7200, 0, 0, 2466, 1923, 0, 0),
(47650, 8902, 230, 8799, 0, 545.488, -162.486, -35.4606, 5.86431, 7200, 7200, 0, 0, 2026, 2041, 0, 0),
(47652, 8902, 230, 8799, 0, 539.612, -184.316, -35.5069, 6.21337, 7200, 7200, 0, 0, 2026, 2041, 0, 0),
(47653, 8894, 230, 8752, 0, 534.287, -173.755, -34.1096, 6.07375, 7200, 7200, 0, 0, 4980, 9300, 0, 0),
(47656, 8895, 230, 8753, 0, 650.016, -184.77, -36.9107, 3.22886, 7200, 7200, 0, 0, 5886, 3964, 0, 0),
(47657, 8896, 230, 8796, 0, 650.177, -180.163, -36.8973, 3.29867, 7200, 7200, 0, 0, 2466, 1923, 0, 0),
(47658, 8896, 230, 8794, 0, 651.877, -172.598, -35.5238, 3.40339, 7200, 7200, 0, 0, 2466, 1923, 0, 0),
(47659, 8902, 230, 8800, 0, 650.484, -168.606, -35.5156, 3.47321, 7200, 7200, 0, 0, 2026, 2041, 0, 0),
(47664, 8902, 230, 8801, 0, 658.992, -186.378, -34.0766, 3.07178, 7200, 7200, 0, 0, 2026, 2041, 0, 0),
(47665, 8904, 230, 8826, 0, 653.344, -190.509, -35.5261, 3.12414, 7200, 7200, 0, 0, 2471, 5013, 0, 0),
(47666, 8893, 230, 8757, 0, 659.228, -181.813, -34.0787, 3.24631, 7200, 7200, 0, 0, 7113, 0, 0, 0),
(47669, 8895, 230, 8753, 0, 633.597, -227.325, -36.9129, 2.33874, 7200, 7200, 0, 0, 5886, 3964, 0, 0),
(47670, 8896, 230, 8795, 0, 626.613, -244.684, -34.0836, 2.09439, 7200, 7200, 0, 0, 2466, 1923, 0, 0),
(47671, 8896, 230, 8796, 0, 633.121, -232.962, -35.4894, 2.26893, 7200, 7200, 0, 0, 2466, 1923, 0, 0),
(47672, 8902, 230, 8799, 0, 636.298, -239.461, -34.0903, 2.25148, 7200, 7200, 0, 0, 2026, 2041, 0, 0),
(47673, 8902, 230, 8798, 0, 640.897, -225.034, -35.1749, 2.49582, 7200, 7200, 0, 0, 2026, 2041, 0, 0),
(47674, 8904, 230, 8826, 0, 638.203, -229.41, -35.3931, 2.37365, 7200, 7200, 0, 0, 2471, 5013, 0, 0),
(47675, 8893, 230, 8757, 0, 625.097, -235.386, -36.8931, 2.14675, 7200, 7200, 0, 0, 7113, 0, 0, 0),
(47683, 8893, 230, 8757, 0, 568.816, -142.538, -36.8602, 5.25344, 7200, 7200, 0, 0, 7113, 0, 0, 0),
(47684, 8894, 230, 8752, 0, 571.426, -137.882, -35.4362, 5.18363, 7200, 7200, 0, 0, 4980, 9300, 0, 0),
(47692, 8893, 230, 8757, 0, 575.489, -238.36, -36.8509, 1.15192, 7200, 7200, 0, 0, 7113, 0, 0, 0),
(47693, 8894, 230, 8752, 0, 565.406, -238.728, -35.5046, 1.01229, 7200, 7200, 0, 0, 4980, 9300, 0, 0),
(47697, 8894, 230, 8752, 0, 639.042, -143.629, -34.0727, 3.9968, 7200, 7200, 0, 0, 4980, 9300, 0, 0),
(47698, 8896, 230, 8793, 0, 633.191, -144.662, -35.5235, 4.06662, 7200, 7200, 0, 0, 2466, 1923, 0, 0),
(47699, 8896, 230, 8796, 0, 635.871, -147.005, -35.5167, 4.01426, 7200, 7200, 0, 0, 2466, 1923, 0, 0),
(47700, 8902, 230, 8799, 0, 644.298, -149.025, -34.0718, 3.89208, 7200, 7200, 0, 0, 2026, 2041, 0, 0),
(47701, 8902, 230, 8799, 0, 638.765, -155.361, -36.9171, 3.63029, 7200, 7200, 0, 0, 2026, 2041, 0, 0),
(47702, 8894, 230, 8752, 0, 630.439, -147.045, -36.9195, 4.08407, 7200, 7200, 0, 0, 4980, 9300, 0, 0);

-- Vorrel's Revenge cry
-- https://github.com/LightsHope/server/issues/574
UPDATE `quest_template` SET `CompleteEmote`=18 WHERE `entry`=1051;

-- Punctured Voodoo Doll
-- https://github.com/LightsHope/server/issues/591
UPDATE `creature_loot_template` SET `condition_id`=2 WHERE `item`=19817;
UPDATE `reference_loot_template` SET `condition_id`=2 WHERE `item`=19817;
UPDATE `creature_loot_template` SET `condition_id`=3 WHERE `item`=19815;
UPDATE `reference_loot_template` SET `condition_id`=3 WHERE `item`=19815;

-- Naxx rat
-- https://github.com/LightsHope/server/issues/664
DELETE FROM `creature` WHERE  `guid`=127739;

-- Twilight Marauder models
-- https://github.com/LightsHope/server/issues/785
UPDATE `creature_model_info` SET `gender`=2, `modelid_other_gender`=0 WHERE `modelid` in (15552,15551);

-- Pools of Arlithrien Moonwell
-- https://github.com/LightsHope/server/issues/800
UPDATE `gameobject_template` SET `displayId`=0 WHERE `entry`=19551;

-- Lord General's Sword allow stacking
-- https://github.com/LightsHope/server/issues/897
REPLACE INTO `spell_mod` (`Id`, `SpellFamilyName`, `Comment`) VALUES (15602, 0, 'Lord General\'s Sword spell family general');

-- Crate With Holes
-- https://github.com/LightsHope/server/issues/946
UPDATE `item_template` SET `spellcharges_1`=-5 WHERE `entry`=5880;

-- Laughing Sister
-- https://github.com/LightsHope/server/issues/1020
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry`=4054;

-- Kolkar's Booty no respawn
-- https://github.com/LightsHope/server/issues/1090
UPDATE `gameobject` SET `spawntimesecsmin`=2, `spawntimesecsmax`=2 WHERE `guid`=13162;
UPDATE `gameobject` SET `spawntimesecsmin`=2, `spawntimesecsmax`=2 WHERE `guid`=13061;

-- Myizz Luckycatch not a vendor
-- https://github.com/LightsHope/server/issues/1112
DELETE FROM `npc_vendor` WHERE `entry`=2834;

-- Hearthsinger Forresten
-- https://github.com/LightsHope/server/issues/1131
UPDATE `creature_template` SET `rank`=2 WHERE  `entry`=10558 AND `patch`=0;

-- Narain's Scrying Goggles boss drops
-- https://github.com/LightsHope/server/issues/1206
REPLACE INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES 
(12118, 20951, -0.6635, 0, 1, 1, 0),
(11982, 20951, -0.6635, 0, 1, 1, 0),
(12259, 20951, -0.6635, 0, 1, 1, 0),
(12057, 20951, -0.6635, 0, 1, 1, 0),
(12056, 20951, -0.6635, 0, 1, 1, 0),
(12264, 20951, -0.6635, 0, 1, 1, 0),
(12098, 20951, -0.6635, 0, 1, 1, 0),
(11988, 20951, -0.6635, 0, 1, 1, 0),
(11502, 20951, -0.6635, 0, 1, 1, 0);
REPLACE INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) 
VALUES (16719, 20951, -0.6635, 0, 1, 1, 0);

-- AV mobs faction
-- https://github.com/LightsHope/server/issues/326
UPDATE `creature_template` SET `faction_A`=1217, `faction_H`=1217 WHERE `entry` IN (
13086,12048,13442,11949,13422,13424,13426,13523,13427,13096,13087,13317,13319,13320,13318,13139,13447,13443,14762,14763,14768,14766,14764,
13080,13396,13098,13298,13296,13299,13300,13138,13297,13797,13257,13816,13326,13324,13325,13521,13327,14765,14284,13358,12050,13598,12127,
13356,12047,14283,13577,13617,14767,13078,11948,13331,13333,13335,13522,13336,14769,10990,5118,7410,12197); -- Alliance
UPDATE `creature_template` SET `faction_A`=1215, `faction_H`=1215 WHERE `entry` IN (
11947,13421,13425,13519,13428,13089,13316,13097,13140,13154,13152,13153,12121,11946,14770,14771,12122,14772,14285,14282,13359,13597,12053,
11998,12051,13357,13284,13616,12052,13441,14773,14774,13099,13397,13081,13798,13079,13145,13147,13146,13137,13143,13144,13088,13236,13328,
13329,13517,13330,13448,13618,14775,14776,13332,13334,13518,13337,14777,10981,347,7427,14942); -- Horde

-- Razorfen Spearhide
-- https://github.com/LightsHope/server/issues/950
UPDATE `creature_template` SET `rank`=2 WHERE `entry`=4438;

-- Illusionary Nightmare
-- https://github.com/LightsHope/server/issues/1022
UPDATE `creature_template` SET `type`=3 WHERE `entry`=4785;

-- Herbalism and Mining required levels
UPDATE `npc_trainer` SET `reqlevel`=10 WHERE `spell`=2373;
UPDATE `npc_trainer` SET `reqlevel`=20 WHERE `spell`=3571;
UPDATE `npc_trainer` SET `reqlevel`=35 WHERE `spell`=11994;
UPDATE `npc_trainer` SET `reqlevel`=10 WHERE `spell`=2582;
UPDATE `npc_trainer` SET `reqlevel`=20 WHERE `spell`=3568;
UPDATE `npc_trainer` SET `reqlevel`=35 WHERE `spell`=10249;

-- Missing Rare mobs
-- https://github.com/LightsHope/server/issues/392
UPDATE `creature` SET `position_x`=-758.331, `position_y`=132.167, `position_z`=2.77833 WHERE `guid`=51845; -- Ghost Howl
UPDATE `creature_template` SET `minhealth`=3633, `maxhealth`=3633, `faction_A`=50, `faction_H`=50, `rank`=4 WHERE `entry`=1063; -- Jade
REPLACE INTO `creature` VALUES (38975, 1063, 0, 0, 0, -10435, -3827.77, 18.0516, 2.92438, 54000, 54000, 0, 0, 6431, 6309, 0, 1, 0, 0, 0, 10);
UPDATE `creature_template` SET `rank`=2, `faction_H`=37, `faction_A`=37 WHERE `entry`=5399; -- Veyzhak the Cannibal
REPLACE INTO `creature` VALUES (160358, 5399, 0, 0, 0, -10301, -4028.2, -74.8377, 2.79036, 28800, 28800, 0, 0, 6261, 0, 0, 0, 0, 0, 0, 10);
UPDATE `creature_template` SET `rank`=2, `faction_H`=37, `faction_A`=37, `rank`=2 WHERE `entry`=5400; -- Zekkis
REPLACE INTO `creature` VALUES (160355, 5400, 0, 0, 0, -10250.9, -4006.4, -99.7118, 0.401091, 28800, 28800, 0, 0, 6352, 0, 0, 0, 0, 0, 0, 10);
UPDATE `creature` SET `position_x`=-7970.9, `position_y`=1507.22, `position_z`=-1.55187, `patch_min`=7 WHERE `guid`=51838; -- Setis
UPDATE `creature_template` SET `name`='Skarr the Broken' WHERE `entry`=11498; -- Skarr the Broken
UPDATE `creature_template` SET `rank`=2 WHERE entry in (2601,5841,5934,10202,14275,14475,4425,7354,3652,11497,11498,11447); -- Rare Elites

-- Mount restrictions were lifted in 3.08
-- https://github.com/LightsHope/server/issues/214
-- https://www.engadget.com/2008/12/11/mount-race-restrictions-lifted-tauren-rejoice/
UPDATE `item_template` SET `AllowableRace`=68 WHERE name like '%Mechanostrider%';
UPDATE `item_template` SET `AllowableRace`=146 WHERE name like '%skeletal%horse%';
UPDATE `item_template` SET `AllowableRace`=146 WHERE name like '%whistle%raptor%' or entry in (18788,18789,18790);

-- The Super Egg-o-Matic
-- https://github.com/LightsHope/server/issues/138
UPDATE `gameobject_questrelation` SET `patch`=7 WHERE `quest`=8893;
UPDATE `gameobject_involvedrelation` SET `patch`=7 WHERE `quest`=8893;
UPDATE `quest_template` SET `patch`=7 WHERE `entry`=8893;
UPDATE `quest_template` SET `SpecialFlags`=1 WHERE  `entry`=2741 AND `patch`=0;
REPLACE INTO `quest_template` (`entry`, `patch`, `Method`, `ZoneOrSort`, `MinLevel`, `QuestLevel`, `Title`, `Objectives`, `OfferRewardText`, `RequestItemsText`, `ReqItemId1`, `ReqItemCount1`, `RewItemId1`, `RewItemCount1`, `RewMoneyMaxLevel`, `CompleteEmote`) VALUES 
(2741, 7, 0, 440, 42, 47, 'The Super Egg-O-Matic', ' ', 'You place the hippogryph egg into the machine. A series of beeps follows along with some strange mechanical sounds.$B$BIt appears that the Eggometer has weighed, measured, and packaged your egg. Now that\'s speedy service!', 'The Super Egg-O-Matic is the latest of Curgle Cranklehop\'s inventions. It is quite an impressive piece of machinery.$B$BThe Super Egg-O-Matic sputters wildly as you approach the control panel.', 8564, 1, 8647, 1, 630, 1);
UPDATE `quest_template` SET `RewMoneyMaxLevel`=630 WHERE `entry`=2741;
UPDATE `quest_template` SET `RewMoneyMaxLevel`=630 WHERE `entry`=2749;
UPDATE `quest_template` SET `RewMoneyMaxLevel`=315 WHERE `entry`=2750;
UPDATE `quest_template` SET `RewMoneyMaxLevel`=1260 WHERE `entry`=2748;
UPDATE `quest_template` SET `RewMoneyMaxLevel`=2520 WHERE `entry`=2747;

-- Sathrah's Sacrifice event
-- https://github.com/LightsHope/server/issues/641
UPDATE `creature_template` SET `MovementType`=2, `speed_walk`=0.70 WHERE `entry`=7411;
REPLACE INTO `creature_movement_template` VALUES 
(7411, 1, 9641.96,2521.98,1331.73, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7411, 2, 9639.39,2529.28,1331.73, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7411, 3, 9633.71,2533.33,1331.6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7411, 4, 9627.38,2528.75,1331.64, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7411, 5, 9624.93,2525.26,1331.62, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7411, 6, 9627.89,2518.1,1331.68, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7411, 7, 9631.27,2514.43,1331.79, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7411, 8, 9637.92,2516.34,1331.63, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7411, 9, 9642.14,2522.07,1331.62, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
UPDATE `event_scripts` SET `x`=9641.96, `y`=2521.98, `z`=1331.73, `o`=1.6194, `datalong2`=30000 WHERE `id`=2313;

-- Abercrombie not attackable
-- https://github.com/LightsHope/server/issues/977
UPDATE `creature_template` SET `unit_flags`=4610 WHERE `entry`=289;

-- Secret safe groupid
-- https://github.com/LightsHope/issues/issues/23
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`=0, `groupid`=1 WHERE `entry`=11104;

-- Long Forgotten Memories
-- https://github.com/LightsHope/issues/issues/34
UPDATE `quest_template` SET `Method`=2, `SpecialFlags`=2, `StartScript`=8305 WHERE `entry`=8305;
REPLACE INTO `quest_start_scripts` VALUES (8305, 0, 7, 8305, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Long Forgotten Memories: Complete Quest');

-- Added Medium Shot Pouch to vendors
-- https://github.com/LightsHope/issues/issues/33
REPLACE INTO `npc_vendor` (`entry`, `item`) VALUES (6028, 11363),(2685, 11363);

-- Moved Golem out of Remtravel's range
-- https://github.com/LightsHope/issues/issues/36
UPDATE `creature` SET `position_x`=4651.41, `position_y`=612.556, `position_z`=8.58061, `orientation`=1.13913 WHERE `guid`=37093;

-- Stratholme Holy Water
-- https://github.com/LightsHope/issues/issues/28
REPLACE INTO `spell_bonus_data` VALUES (17291, 1, 0, 0, 0, 'Stratholme Holy Water 100% coefficient');

-- Wolfrunner Shoes agility
-- https://github.com/LightsHope/issues/issues/45
UPDATE `item_template` SET `stat_type4`=3, `stat_value4`=11 WHERE `entry`=13101 AND `patch`=0;

-- Startup errors introduced by this migration.
UPDATE `creature` SET `curhealth`=2768 WHERE `guid` IN (47699, 47698, 47649, 47645, 47671, 47670, 47658, 47657);
UPDATE `creature` SET `curhealth`=7151 WHERE `guid` IN (47692, 47683, 47675, 47666);
UPDATE `creature` SET `MovementType`=0 WHERE `guid`=38975;
UPDATE `creature` SET `curhealth`=5945, `curmana`=4026 WHERE `guid` IN (47669, 47656);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
