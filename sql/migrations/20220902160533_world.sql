DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220902160533');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220902160533');
-- Add your query below.


-- Prevent Undercity Training Event Breaking
UPDATE `creature` SET `spawn_flags` = 1 WHERE `id` IN (5653, 5654, 5661);

-- Fresh Threshadon Carcass Should Not Despawn When Looted
UPDATE `gameobject` SET `spawntimesecsmin` = 0, `spawntimesecsmax` = 0 WHERE `guid`=17926;

-- Remove Empty Pool_Templates
DELETE FROM `pool_template`
WHERE (`entry` NOT IN (SELECT `pool_entry` FROM `pool_gameobject`)) && (`entry` NOT IN (SELECT `pool_entry` FROM `pool_creature`)) && (`entry` NOT IN (SELECT `pool_entry` FROM `pool_gameobject_template`)) && (`entry` NOT IN (SELECT `pool_entry` FROM `pool_creature_template`)) && (`entry` NOT IN (SELECT `pool_id` FROM `pool_pool`)) && (`entry` NOT IN (SELECT `mother_pool` FROM `pool_pool`));

-- Update Demon Fall Ridge
UPDATE `creature` SET `id`=11697, `id2`=0, `id3`=0 WHERE  `guid` IN (108865, 108868, 108863, 108864, 33144, 33142, 33143, 33145);

UPDATE `creature` SET `position_x`=1538.94, `position_y`=-2878.93, `position_z`=183.464, `orientation`=1.23918 WHERE  `guid`=33144;
UPDATE `creature` SET `position_x`=1544.03, `position_y`=-2848.75, `position_z`=182.515, `orientation`=5.044 WHERE  `guid`=33143;
UPDATE `creature` SET `position_x`=1581.57, `position_y`=-2897.42, `position_z`=182.329, `orientation`=1.43117 WHERE  `guid`=33145;
UPDATE `creature` SET `position_x`=1606.02, `position_y`=-2979.19, `position_z`=182.067, `orientation`=2.85391 WHERE  `guid`=33139;

INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(1734, 6073, 6115, 11697, 0, 1, 1525.12, -2850.32, 182.265, 2.85391, 300, 300, 5, 100, 100, 1, 0, 0, 0, 10),
(1742, 11697, 0, 0, 0, 1, 1563.02, -2859.16, 182.293, 4.06662, 300, 300, 0, 100, 100, 0, 0, 0, 0, 10),
(1822, 6073, 6115, 11697, 0, 1, 1555.71, -2901.45, 182.44, 2.85391, 300, 300, 5, 100, 100, 1, 0, 0, 0, 10);

-- Quest Should Auto Complete 
UPDATE `quest_template` SET `SpecialFlags` = 2 WHERE `entry` = 4261;

-- Chromatic Dragonspawn - MC Immunity
UPDATE `creature_template` SET `mechanic_immune_mask` = 1 WHERE `entry`=10447;

-- Atalai Deathwalker Immunity
UPDATE `creature_template` SET `school_immune_mask` = 126 WHERE `entry` = 8317;

-- Respawn Shadowthread Cave (credit cmangos)
DELETE FROM `creature` WHERE `guid` IN (46958, 46968, 46971, 46972, 46974, 46981, 46996, 46997, 46998, 46999, 47000, 47001, 47002, 47003, 47004, 47005, 47006, 47007, 47008, 47009, 47010, 47011, 47012, 47013, 47014, 47015, 47016, 47017, 47018, 47019, 47020, 47021, 47022, 47023, 47024, 47029, 47030, 47031, 47037, 47038, 47039, 47052, 47053, 47054, 47055, 47056, 47057, 47058, 47059, 47060, 47061, 47062, 47208, 47249, 47262, 47263, 47266, 47267, 47268, 47269, 47270, 47271, 47350);
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(46958, 1986, 0, 0, 0, 1, 10718.58007812500, 816.39733886718750, 1327.0068359375000, 3.211405754089355468, 300, 300, 30, 100, 0, 1, 0, 0, 0, 10),
(46968, 1986, 0, 0, 0, 1, 10722.47656250000, 877.28808593750000, 1328.2606201171875, 5.830454349517822265, 300, 300, 30, 100, 0, 1, 0, 0, 0, 10),
(46972, 1986, 0, 0, 0, 1, 10681.08593750000, 916.29589843750000, 1322.7342529296875, 0.375913143157958984, 300, 300, 30, 100, 0, 1, 0, 0, 0, 10),
(46974, 1986, 0, 0, 0, 1, 10666.51855468750, 933.33874511718750, 1322.0034179687500, 2.074608564376831054, 300, 300, 30, 100, 0, 1, 0, 0, 0, 10),
(46981, 1986, 0, 0, 0, 1, 10731.81933593750, 950.64831542968750, 1333.2170410156250, 2.124099016189575195, 300, 300, 30, 100, 0, 1, 0, 0, 0, 10),
(46996, 1986, 0, 0, 0, 1, 10715.09082031250, 849.37261962890625, 1325.8514404296875, 2.289318323135375976, 300, 300, 30, 100, 0, 1, 0, 0, 0, 10),
(46997, 1986, 0, 0, 0, 1, 10681.85742187500, 882.40374755859375, 1320.5513916015625, 3.924531459808349609, 300, 300, 30, 100, 0, 1, 0, 0, 0, 10),
(46998, 1986, 0, 0, 0, 1, 10704.61718750000, 944.45452880859375, 1328.3015136718750, 5.204211711883544921, 300, 300, 30, 100, 0, 1, 0, 0, 0, 10),

(46999, 1986, 0, 0, 0, 1, 10753.57421875000, 917.36956787109375, 1338.4082031250000, 3.354250669479370117, 300, 300, 5, 100, 0, 1, 0, 0, 0, 10),
(47000, 1986, 0, 0, 0, 1, 10768.65820312500, 923.96704101562500, 1338.8343505859375, 4.966780185699462890, 300, 300, 5, 100, 0, 1, 0, 0, 0, 10),
(47001, 1986, 0, 0, 0, 1, 10735.10058593750, 900.92950439453125, 1332.0488281250000, 4.206243515014648437, 300, 300, 5, 100, 0, 1, 0, 0, 0, 10),
(47002, 1986, 0, 0, 0, 1, 10786.25976562500, 933.20629882812500, 1337.3990478515625, 4.974691390991210937, 300, 300, 5, 100, 0, 1, 0, 0, 0, 10),
(47003, 1986, 0, 0, 0, 1, 10802.61328125000, 944.36999511718750, 1336.0028076171875, 0.861814975738525390, 300, 300, 5, 100, 0, 1, 0, 0, 0, 10),
(47004, 1986, 0, 0, 0, 1, 10833.63574218750, 934.57812500000000, 1335.8376464843750, 1.055991768836975097, 300, 300, 5, 100, 0, 1, 0, 0, 0, 10),
(47005, 1986, 0, 0, 0, 1, 10823.14062500000, 900.42706298828125, 1335.8253173828125, 0.029533637687563896, 300, 300, 5, 100, 0, 1, 0, 0, 0, 10),
(47006, 1986, 0, 0, 0, 1, 10835.61523437500, 900.36694335937500, 1334.8229980468750, 6.171617507934570312, 300, 300, 5, 100, 0, 1, 0, 0, 0, 10),
(47007, 1986, 0, 0, 0, 1, 10840.27734375000, 885.44830322265625, 1333.4893798828125, 0.492046177387237548, 300, 300, 5, 100, 0, 1, 0, 0, 0, 10),
(47008, 1986, 0, 0, 0, 1, 10866.69140625000, 917.29327392578125, 1331.1962890625000, 0.122693173587322235, 300, 300, 5, 100, 0, 1, 0, 0, 0, 10),
(47009, 1986, 0, 0, 0, 1, 10893.00390625000, 986.80664062500000, 1337.1378173828125, 6.195337295532226562, 300, 300, 5, 100, 0, 1, 0, 0, 0, 10),
(47010, 1986, 0, 0, 0, 1, 10864.86230468750, 979.12384033203125, 1336.5565185546875, 1.603378772735595703, 300, 300, 5, 100, 0, 1, 0, 0, 0, 10),
(47011, 1986, 0, 0, 0, 1, 10868.05664062500, 866.56115722656250, 1326.7774658203125, 4.390202522277832031, 300, 300, 5, 100, 0, 1, 0, 0, 0, 10),
(47012, 1986, 0, 0, 0, 1, 10858.98925781250, 858.99865722656250, 1328.2800292968750, 2.820507049560546875, 300, 300, 5, 100, 0, 1, 0, 0, 0, 10),
(47013, 1986, 0, 0, 0, 1, 10882.50390625000, 874.86529541015625, 1325.4072265625000, 0.966396510601043701, 300, 300, 5, 100, 0, 1, 0, 0, 0, 10),
(47014, 1986, 0, 0, 0, 1, 10899.09375000000, 898.29022216796875, 1323.6564941406250, 1.151917338371276855, 300, 300, 5, 100, 0, 1, 0, 0, 0, 10),
(47015, 1986, 0, 0, 0, 1, 10889.38378906250, 917.58648681640625, 1326.6378173828125, 3.311156272888183593, 300, 300, 5, 100, 0, 1, 0, 0, 0, 10),
(47016, 1986, 0, 0, 0, 1, 10922.04394531250, 938.88751220703125, 1322.2385253906250, 3.417912721633911132, 300, 300, 5, 100, 0, 1, 0, 0, 0, 10),
(47017, 1986, 0, 0, 0, 1, 10941.85937500000, 965.10504150390625, 1327.1232910156250, 5.166174411773681640, 300, 300, 5, 100, 0, 1, 0, 0, 0, 10),
(47018, 1986, 0, 0, 0, 1, 10934.57617187500, 948.42980957031250, 1321.8919677734375, 0.811628043651580810, 300, 300, 5, 100, 0, 1, 0, 0, 0, 10),
(47019, 1986, 0, 0, 0, 1, 10843.15820312500, 957.24945068359375, 1335.4874267578125, 4.145748138427734375, 300, 300, 5, 100, 0, 1, 0, 0, 0, 10),
(47020, 1986, 0, 0, 0, 1, 10897.85351562500, 974.71276855468750, 1337.6535644531250, 2.202968120574951171, 300, 300, 5, 100, 0, 1, 0, 0, 0, 10),
(47021, 1986, 0, 0, 0, 1, 10911.82617187500, 969.35321044921875, 1338.9345703125000, 6.130199432373046875, 300, 300, 5, 100, 0, 1, 0, 0, 0, 10),
(47022, 1986, 0, 0, 0, 1, 10916.43457031250, 957.58575439453125, 1339.6990966796875, 2.808463573455810546, 300, 300, 5, 100, 0, 1, 0, 0, 0, 10),
(47023, 1986, 0, 0, 0, 1, 10979.20019531250, 977.51995849609375, 1335.3133544921875, 5.856158733367919921, 300, 300, 5, 100, 0, 1, 0, 0, 0, 10),
(47024, 1986, 0, 0, 0, 1, 10990.74023437500, 944.18933105468750, 1336.1696777343750, 3.513284683227539062, 300, 300, 5, 100, 0, 1, 0, 0, 0, 10),
(47029, 1986, 0, 0, 0, 1, 10963.46875000000, 925.52038574218750, 1340.4235839843750, 0.173187166452407836, 300, 300, 5, 100, 0, 1, 0, 0, 0, 10),
(47030, 1986, 0, 0, 0, 1, 10973.12304687500, 938.04925537109375, 1337.9687500000000, 1.199934959411621093, 300, 300, 5, 100, 0, 1, 0, 0, 0, 10),
(47031, 1986, 0, 0, 0, 1, 10942.69531250000, 914.79864501953125, 1339.9248046875000, 4.836705207824707031, 300, 300, 5, 100, 0, 1, 0, 0, 0, 10),
(47037, 1986, 0, 0, 0, 1, 10948.62304687500, 892.98126220703125, 1337.5388183593750, 0.305056661367416381, 300, 300, 5, 100, 0, 1, 0, 0, 0, 10),
(47038, 1986, 0, 0, 0, 1, 10931.62695312500, 864.97821044921875, 1332.0297851562500, 0.296750694513320922, 300, 300, 5, 100, 0, 1, 0, 0, 0, 10),
(47039, 1986, 0, 0, 0, 1, 10949.45214843750, 867.87438964843750, 1333.9869384765625, 0.732970058917999267, 300, 300, 5, 100, 0, 1, 0, 0, 0, 10),
(47052, 1986, 0, 0, 0, 1, 10915.72656250000, 867.57299804687500, 1329.3432617187500, 6.207247734069824218, 300, 300, 5, 100, 0, 1, 0, 0, 0, 10),
(47053, 1986, 0, 0, 0, 1, 10899.94628906250, 878.31335449218750, 1329.9327392578125, 0.421981036663055419, 300, 300, 5, 100, 0, 1, 0, 0, 0, 10),
(47054, 1986, 0, 0, 0, 1, 10908.56347656250, 857.28625488281250, 1328.9635009765625, 4.910270690917968750, 300, 300, 5, 100, 0, 1, 0, 0, 0, 10),
(47055, 1986, 0, 0, 0, 1, 10952.84863281250, 939.59332275390625, 1340.6506347656250, 4.127363204956054687, 300, 300, 5, 100, 0, 1, 0, 0, 0, 10),
 
(47056, 1994, 0, 0, 0, 1, 10938.40234375000, 930.25122070312500, 1340.9490966796875, 3.188395738601684570, 300, 300, 5, 100, 0, 1, 0, 0, 0, 10);

UPDATE `creature_template` SET `auras` = '11919' WHERE `entry`=1994;

-- Remove incorrect drops for Idol of Brutality
DELETE FROM `creature_loot_template` WHERE `item` =23198 AND `entry` != 10435; -- Magistrate Barthilas

-- Correct Badge of the Swarmguard Data
UPDATE `spell_proc_event` SET `ppmRate` = 10 WHERE `entry` = 26480;

-- Unstuck Creatures
UPDATE `creature` SET `position_x`=634.3214, `position_y`=-1760.85, `position_z`=35.417 WHERE `guid`=16635;
UPDATE `creature` SET `position_x`=2433.82, `position_y`=586.784, `position_z`=119.387 WHERE `guid`=34954;
UPDATE `creature` SET `position_x`=2410.72, `position_y`=602.581, `position_z`=129.689 WHERE `guid`=34804;
UPDATE `creature` SET `wander_distance`=5 WHERE  `guid`=50190;

-- Add Missing Skinning Templates
UPDATE `creature_template` SET `skinning_loot_id`='1817' WHERE `entry`=10077 AND `patch`=0;

UPDATE `creature_template` SET `skinning_loot_id`=8976 WHERE `entry`=8976 AND `patch`=0;
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES
(8976, 8170, 60, 1, 1, 1, 0, 0, 10),
(8976, 15416, 20, 1, 1, 1, 0, 0, 10),
(8976, 8165, 10, 1, 1, 1, 0, 0, 10),
(8976, 8171, 5, 1, 1, 1, 0, 0, 10),
(8976, 4304, 5, 1, 1, 1, 0, 0, 10);

UPDATE `creature_template` SET `skinning_loot_id`=14233 WHERE `entry`=14233 AND `patch`=0;
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES
(14233, 4234, 90, 1, 1, 1, 0, 0, 10),
(14233, 4304, 10, 1, 1, 1, 0, 0, 10);

UPDATE `creature_template` SET `skinning_loot_id`=728 WHERE `entry`=14232 AND `patch`=0;

-- Add Missing Quests to Gameobject
INSERT INTO `gameobject_questrelation` (`id`, `quest`, `patch_min`, `patch_max`) VALUES
(142122, 2781, 0, 10),
(142122, 2875, 0, 10);

-- Apprentice Fishing and Cooking Dont Require Level 5
UPDATE `npc_trainer` SET `reqlevel`= 0 WHERE `spell` IN (2551, 7733);

-- Update Felwood Plant Quests
UPDATE `quest_template` SET `CompleteScript` = 0 WHERE `entry` = 4443;
DELETE FROM `quest_end_scripts` WHERE `id` = 4443;

UPDATE `quest_template` SET `CompleteEmote` = 0 WHERE `entry` IN (4117, 4443, 4444, 4445, 4446, 4461, 4448, 2523, 2878, 3363, 4114, 4116);

UPDATE `gameobject` SET `spawntimesecsmin` = 3595, `spawntimesecsmax` = 3595 WHERE `id` IN ( 164887, 173327, 174599, 174600, 174601, 174602, 174603, 174604, 174708, 174709, 164886, 171939, 171942, 174594, 174595, 174596, 174598, 174712, 174713, 174597, 164888, 173284, 174605, 174606, 174607, 174686, 164885, 173324, 174608, 174684);

-- UPDATE `quest_template` SET `QuestFlags` = 264 WHERE `entry` = 4445;

-- UPDATE `quest_template` SET `QuestFlags` = 264, `RewXP` = 560 WHERE `entry` = 4467;

UPDATE `quest_template` SET `CompleteEmote` = 0 WHERE `entry` IN (4403, 1514, 998);

UPDATE `gameobject_questrelation` SET `quest` = 3363 WHERE `id` = 174595;
UPDATE `gameobject_involvedrelation` SET `quest` = 3363 WHERE `id` = 174595;

UPDATE `gameobject_questrelation` SET `quest` = 2878 WHERE `id` = 174594;
UPDATE `gameobject_involvedrelation` SET `quest` = 2878 WHERE `id` = 174594;

UPDATE `gameobject_involvedrelation` SET `quest` = 4114 WHERE `id` = 174596;
UPDATE `gameobject_questrelation` SET `quest` = 4114 WHERE `id` = 174596;

UPDATE `gameobject` SET `id` = 174597 WHERE `guid` = 48958;
INSERT INTO `gameobject_questrelation` (`id`, `quest`, `patch_min`, `patch_max`) VALUES (174597, 4116, 0, 10);
INSERT INTO `gameobject_involvedrelation` (`id`, `quest`, `patch_min`, `patch_max`) VALUES (174597, 4116, 0, 10);

UPDATE `gameobject_questrelation` SET `quest` = 4118 WHERE `id` = 174598;
UPDATE `gameobject_involvedrelation` SET `quest` = 4118 WHERE `id` = 174598;

UPDATE `gameobject_questrelation` SET `quest` = 2523 WHERE `id` = 171942;
UPDATE `gameobject_involvedrelation` SET `quest` = 2523 WHERE `id` = 171942;

UPDATE `gameobject_questrelation` SET `quest` = 4401 WHERE `id` = 171939;
UPDATE `gameobject_involvedrelation` SET `quest` = 4401 WHERE `id` = 171939;

UPDATE `gameobject_questrelation` SET `quest` = 4113 WHERE `id` = 164886;
UPDATE `gameobject_involvedrelation` SET `quest` = 4113 WHERE `id` = 164886;

UPDATE `gameobject_questrelation` SET `quest` = 998 WHERE `id` = 174599;
UPDATE `gameobject_involvedrelation` SET `quest` = 998 WHERE `id` = 174599;

UPDATE `gameobject_questrelation` SET `quest` = 996 WHERE `id` = 174600;
UPDATE `gameobject_involvedrelation` SET `quest` = 996 WHERE `id` = 174600;

UPDATE `gameobject_questrelation` SET `quest` = 1514 WHERE `id` = 173327;
UPDATE `gameobject_involvedrelation` SET `quest` = 1514 WHERE `id` = 173327;

UPDATE `gameobject_involvedrelation` SET `quest` = 4403 WHERE `id` = 174601;
UPDATE `gameobject_questrelation` SET `quest` = 4403 WHERE `id` = 174601;

UPDATE `gameobject_questrelation` SET `quest` = 4343 WHERE `id` = 174602;
UPDATE `gameobject_involvedrelation` SET `quest` = 4343 WHERE `id` = 174602;

UPDATE `gameobject_questrelation` SET `quest` = 4222 WHERE `id` = 174603;
UPDATE `gameobject_involvedrelation` SET `quest` = 4222 WHERE `id` = 174603;

UPDATE `gameobject_questrelation` SET `quest` = 4221 WHERE `id` = 174604;
UPDATE `gameobject_involvedrelation` SET `quest` = 4221 WHERE `id` = 174604;

UPDATE `gameobject_questrelation` SET `quest` = 4115 WHERE `id` = 164887;
UPDATE `gameobject_involvedrelation` SET `quest` = 4115 WHERE `id` = 164887;

UPDATE `gameobject_questrelation` SET `quest` = 4448 WHERE `id` = 174608;
UPDATE `gameobject_involvedrelation` SET `quest` = 4448 WHERE `id` = 174608;

UPDATE `gameobject_questrelation` SET `quest` = 4447 WHERE `id` = 173324;
UPDATE `gameobject_involvedrelation` SET `quest` = 4447 WHERE `id` = 173324;

UPDATE `gameobject_questrelation` SET `quest` = 4462 WHERE `id` = 174684;
UPDATE `gameobject_involvedrelation` SET `quest`=4462 WHERE `id` = 174684;

-- Add Merithra of the Dream Missing Gossip
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES
(6766, 8113, 0, 15727);

-- Add Arygos  Missing Gossip
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES
(6767, 8111, 0, 15727);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
