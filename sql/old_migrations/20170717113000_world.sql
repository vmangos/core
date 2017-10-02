INSERT INTO `migrations` VALUES ('20170717113000');

-- Fixed quest The Fargodeep Mine(id:62), area triggers 88 and 197.
-- Fixed quest The Jasperlode Mine(id:76), area triggers 87 and 342.
-- Fixed quest Verifying the Corruption(id:5156), area triggers 2206, 2207, 2208.
INSERT INTO `areatrigger_involvedrelation` ( `id`, `quest`) VALUES
 ('197', '62'),
 ('342', '76'),
 ('2206', '5156'),
 ('2207', '5156'),
 ('2208', '5156');

-- Before patch 2.4, quest Milly Osworth(id:3903) was available after Brotherhood of Thieves(id:18).
UPDATE `quest_template` SET `PrevQuestId` = 18 WHERE `entry` = 3903;

-- Removed outdated lockpicking trainers. Lockpicking cap is increased with player's level.
DELETE FROM `npc_trainer` WHERE `entry` IN('2795', '2796', '3182', '2737');
UPDATE `creature_template` SET `npcflag` = 0 WHERE `entry` = 3182;
UPDATE `creature_template` SET `npcflag` = 0 WHERE `entry` = 2796;
UPDATE `creature_template` SET `npcflag` = 0, `trainer_type` = 0 WHERE `entry` = 2737;
UPDATE `creature_template` SET `npcflag` = 0, `trainer_type` = 0 WHERE `entry` = 2795;

-- Fixed Merissa Stilwell's model.
UPDATE `creature_model_info` SET `modelid_other_gender` = 0 WHERE `modelid` = 11898;

-- Fixed Tabetha's model.
UPDATE `creature_model_info` SET `modelid_other_gender` = 0 WHERE `modelid` = 5375;

-- Fixed a loot table for Small Barnacled Clam.
DELETE FROM `item_loot_template` WHERE `entry` = 5523;
INSERT INTO `item_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES
 ('5523', '5498', '5', '1', '1', '1', '0'),
 ('5523', '5503', '100', '0', '1', '1', '0');

-- Fixed an Archmage Malin gossip, removed a script attached to him. That quest script is from TBC.
UPDATE `creature_template` SET `gossip_menu_id` = '8846',  `ScriptName` = '' WHERE `entry` = '2708';

-- Fixed a mount model for Executor Zygand.
UPDATE `creature_addon` SET `mount` = 235 WHERE `guid` = 29797;

-- Fixed a mount model for Deathguard Lundmark.
UPDATE `creature_addon` SET `mount` = 235 WHERE `guid` = 32028;

-- Rabbits can also be brown.
UPDATE `creature_template` SET `modelid_2` = '4626' WHERE `entry` = '721';
UPDATE `creature` SET `modelid` = 0 WHERE `id` = 721;

-- Rats can also be brown and white.
UPDATE `creature_template` SET `modelid_2` = '1418', `modelid_3` = '2176' WHERE `entry` = '4075';
UPDATE `creature` SET `modelid` = 0 WHERE `id` = 4075;

-- Sheep can also be black.
UPDATE `creature_template` SET `modelid_2` = '857' WHERE `entry` = '1933';
UPDATE `creature` SET `modelid` = 0 WHERE `id` = 1933;

-- Fixed an equipment flag for Brother Benjamin.
UPDATE `creature_addon` SET `b2_0_sheath` = 1 WHERE `guid` = 37556;

-- Added waypoints for Mabel Solaj from Darkshire Inn.
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES
 ('4203', '1', '-10531.8', '-1155.08', '28.1039', '25000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '100', '0', '0'),
 ('4203', '2', '-10531.1', '-1161.78', '28.1039', '5000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '100', '0', '0'),
 ('4203', '3', '-10529.6', '-1164.64', '28.1039', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '100', '0', '0'),
 ('4203', '4', '-10526.6', '-1165.65', '27.4763', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '100', '0', '0'),
 ('4203', '5', '-10523.9', '-1165.83', '27.4775', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '100', '0', '0'),
 ('4203', '6', '-10522.8', '-1171.44', '27.4775', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '100', '0', '0'),
 ('4203', '7', '-10518.9', '-1172.77', '27.9101', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '100', '0', '0'),
 ('4203', '8', '-10512.5', '-1172.22', '31.3067', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '100', '0', '0'),
 ('4203', '9', '-10510.6', '-1169.43', '31.324', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '100', '0', '0'),
 ('4203', '10', '-10512.8', '-1167.31', '31.3354', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '100', '0', '0'),
 ('4203', '11', '-10518.8', '-1167.65', '34.9576', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '100', '0', '0'),
 ('4203', '12', '-10520.9', '-1169.09', '34.9576', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '100', '0', '0'),
 ('4203', '13', '-10521.7', '-1173.81', '34.9576', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '100', '0', '0'),
 ('4203', '14', '-10523.8', '-1173.97', '34.9576', '25000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '100', '0', '0'),
 ('4203', '15', '-10521.7', '-1173.81', '34.9576', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '100', '0', '0'),
 ('4203', '16', '-10520.9', '-1169.09', '34.9576', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '100', '0', '0'),
 ('4203', '17', '-10518.8', '-1167.65', '34.9576', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '100', '0', '0'),
 ('4203', '18', '-10512.8', '-1167.31', '31.3354', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '100', '0', '0'),
 ('4203', '19', '-10510.6', '-1169.43', '31.324', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '100', '0', '0'),
 ('4203', '20', '-10512.5', '-1172.22', '31.3067', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '100', '0', '0'),
 ('4203', '21', '-10518.9', '-1172.77', '27.9101', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '100', '0', '0'),
 ('4203', '22', '-10522.8', '-1171.44', '27.4775', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '100', '0', '0'),
 ('4203', '23', '-10523.9', '-1165.83', '27.4775', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '100', '0', '0'),
 ('4203', '24', '-10526.6', '-1165.65', '27.4763', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '100', '0', '0'),
 ('4203', '25', '-10529.6', '-1164.64', '28.1039', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '100', '0', '0'),
 ('4203', '26', '-10531.1', '-1161.78', '28.1039', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '100', '0', '0');

UPDATE `creature` SET `position_x` = -10531.8, `position_y` = -1155.08, `position_z` = 28.1039, `orientation` = 4.8442, `MovementType` = 2 WHERE `guid` = 4203;

-- Items: Felwood Slime Sample(id:12230) and Un'Goro Slime Sample(id:12235) should drop only during quest and their chance should be 100%.
-- Also fixed quest item drop rate for The Ongar(npc_id:14345)
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = -100 WHERE `item` = 12230;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = -100 WHERE `item` = 12235;

-- Ogres shouldn't drop Pure Un'Goro Sample(id:12236). It shouldn't drop from mobs at all.
DELETE FROM `creature_loot_template` WHERE `item` = 12236;

-- Added gossip texts for "Testing equipment" objects.
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES ('2581', '3273', '0'), ('3050', '3273', '0');

-- Fixed faction id for The Ongar(npc_id:14345).
UPDATE `creature_template` SET `faction_A` = 14, `faction_H` = 14 WHERE `entry` = 14345;

-- Removed duplicate "Testing Equipment" gameobject spawns.
DELETE FROM `gameobject` WHERE `guid` = 399339;
DELETE FROM `gameobject` WHERE `guid` = 399338;

-- Fixed skinning loot for Bloodshot
DELETE FROM `skinning_loot_template` WHERE `entry` = 10151 AND `item` = 8154;

-- All graveyards in the Hinterlands should be cross-faction.
UPDATE `game_graveyard_zone` SET `faction` = 0 WHERE `id` = 789;
UPDATE `game_graveyard_zone` SET `faction` = 0 WHERE `id` = 349;

-- Fix graveyard at Bloodhoof Village in Mulgore for the Alliance.
-- Before this fix Alliance died at Bloodhoof Village and were teleported to Ratchet.
UPDATE `game_graveyard_zone` SET `faction` = 0 WHERE `id` = 89 AND `ghost_zone` = 215;

-- Fixed George Candarte's(id:2698) model
UPDATE `creature_model_info` SET `modelid_other_gender` = 0 WHERE `modelid` = 3680;

-- Enable Graveyard at Darkshore, Twilight Vale. It should be cross-faction.
INSERT INTO `game_graveyard_zone` VALUES (469, 148, 0);
INSERT INTO `game_graveyard_zone` VALUES (469, 141, 67);
INSERT INTO `game_graveyard_zone` VALUES (469, 1657, 67);
DELETE FROM `game_graveyard_zone` WHERE `id` = 512 AND `ghost_zone` = 148;

-- Enable Undercity graveyard.
DELETE FROM `game_graveyard_zone` WHERE `id` = 429 AND `ghost_zone` = 1497;
INSERT INTO `game_graveyard_zone` VALUES (853, 1497, 469);

-- Fix quest level (id:3181 The Horn of the Beast). It was 48 lvl before wotlk.
UPDATE `quest_template` SET `QuestLevel` = 48 WHERE `entry` = 3181;

-- Fix typo in text for quest (id:3092 Etched Note)
UPDATE `quest_template` SET `RequestItemsText` = 'Welcome to Camp Narache, $N. I hear good things about you. Your bloodline is strong, and many of the elders consider you skilled already. But that we will test.$B$BThe plains of Mulgore will be your home for sometime--you should do your best to learn it very well. One day you will travel to unfamilar lands to master greater skills. You must be ready.' WHERE `entry` = 3092;

-- Remove random Defias Brotherhood texts from the mobs that shouldn't have it
DELETE FROM `creature_ai_scripts` WHERE `comment` = 'Skeletal Mage - Random Aggro Say';
DELETE FROM `creature_ai_scripts` WHERE `comment` = 'Bloodsail Warlock - Random Aggro Say';
DELETE FROM `creature_ai_scripts` WHERE `comment` = 'Burning Blade Apprentice - Random Aggro Say';

-- Fix texts for some kobolds. You no take candle!
-- Gogger Rock Keeper - Random Say on Aggro
UPDATE `creature_ai_scripts` SET `action1_param1` = -7, `action1_param2` = 0, `action1_param3` = 0 WHERE `id` = 1191501;
-- Gogger Geomancer - Random Say on Aggro
UPDATE `creature_ai_scripts` SET `action1_param1` = -7, `action1_param2` = 0, `action1_param3` = 0 WHERE `id` = 1191702;
-- Gogger Stonepounder - Random Say on Aggro
UPDATE `creature_ai_scripts` SET `action1_param1` = -7, `action1_param2` = 0, `action1_param3` = 0 WHERE `id` = 1191801;
