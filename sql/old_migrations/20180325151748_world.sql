DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180325151748');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180325151748');
-- Add your query below.

-- Stonetalon mts. quality fix
-- Start of vid 5: https://www.youtube.com/watch?v=e9Ri0ucrHtU&feature=youtu.be&list=PL49Ga_-r7iKkxrbckm9CkUhWzxqrOnw-n&t=5

-- Goblin Invaders
UPDATE `quest_template` SET `DetailsEmote1`=1, `OfferRewardEmote1`=1 WHERE `entry`=1062 AND `patch`=0;
-- quest end script added in Quest fixes, scripts and greetings

-- Avenge My Village
UPDATE `quest_template` SET `DetailsEmote1`=1, `OfferRewardEmote1`=1 WHERE `entry`=6548 AND `patch`=0;

-- Kill Grundig Darkcloud
UPDATE `quest_template` SET `CompleteEmote`=1, `OfferRewardEmote1`=1 WHERE `entry`=6629 AND `patch`=0;

-- Start of vid 7: https://www.youtube.com/watch?v=5UWZaZjKS14&list=PL49Ga_-r7iKkxrbckm9CkUhWzxqrOnw-n&index=7

-- Blood Feeders
UPDATE `quest_template` SET `DetailsEmote1`=1, `OfferRewardEmote1`=1 WHERE `entry`=6461 AND `patch`=0;

-- Letter to Jin'Zil in Barres_Quality fix

-- Jin'Zil's Forest Magic
UPDATE `quest_template` SET `DetailsEmote1`=4, `CompleteEmote`=11, `CompleteScript`=1058 WHERE `entry`=1058 AND `patch`=0;

DELETE FROM `quest_end_scripts` WHERE `id`=1058;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(1058, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Jin\'Zil\'s Forest Magic - Jin\'Zil\'s: npc_flag questgiver removed'),
(1058, 2, 3, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, -272.48, -394.084, 17.2051, 4.0078, 'Jin\'Zil\'s Forest Magic - Jin\'Zil\'s: Turn'),
(1058, 3, 1, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Jin\'Zil\'s Forest Magic - Jin\'Zil\'s: Roar emote'),
(1058, 3, 0, 0, 0, 0, 0, 0, 0, 0, 1405, 0, 0, 0, 0, 0, 0, 0, 'Jin\'Zil\'s Forest Magic - Jin\'Zil\'s: Say text 1'),
(1058, 5, 0, 0, 0, 0, 0, 0, 0, 0, 1406, 0, 0, 0, 0, 0, 0, 0, 'Jin\'Zil\'s Forest Magic - Jin\'Zil\'s: Say text 2'),
(1058, 5, 1, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Jin\'Zil\'s Forest Magic - Jin\'Zil\'s: Laugh emote'),
(1058, 5, 15, 6584, 0, 0, 32292, 0, 9, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Jin\'Zil\'s Forest Magic - Jin\'Zil\'s: Cast spell Jin\'Zil\'s Curse on Elf 1'),
(1058, 5, 15, 6584, 0, 0, 32293, 0, 9, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Jin\'Zil\'s Forest Magic - Jin\'Zil\'s: Cast spell Jin\'Zil\'s Curse on Elf 2'),
(1058, 5, 15, 6584, 0, 0, 32294, 0, 9, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Jin\'Zil\'s Forest Magic - Jin\'Zil\'s: Cast spell Jin\'Zil\'s Curse on Elf 3'),
(1058, 7, 3, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, -268.12, -397.16, 16.97, 5.53, 'Jin\'Zil\'s Forest Magic - Jin\'Zil\'s: Walk to Elf'),
(1058, 10, 15, 5, 0, 0, 32292, 0, 9, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Jin\'Zil\'s Forest Magic - Jin\'Zil\'s: Cast spell Death Touch'),
(1058, 10, 15, 5, 0, 0, 32293, 0, 9, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Jin\'Zil\'s Forest Magic - Jin\'Zil\'s: Cast spell Death Touch'),
(1058, 10, 15, 5, 0, 0, 32294, 0, 9, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Jin\'Zil\'s Forest Magic - Jin\'Zil\'s: Cast spell Death Touch'),
(1058, 12, 0, 0, 0, 0, 0, 0, 0, 0, 1407, 0, 0, 0, 0, 0, 0, 0, 'Jin\'Zil\'s Forest Magic - Jin\'Zil\'s: Say text 3'),
(1058, 13, 3, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, -272.48, -394.084, 17.2051, 3.053, 'Jin\'Zil\'s Forest Magic - Jin\'Zil\'s: Walk back'),
(1058, 16, 3, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, -272.48, -394.084, 17.2051, 6.19592, 'Jin\'Zil\'s Forest Magic - Jin\'Zil\'s: Turn'),
(1058, 17, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Jin\'Zil\'s Forest Magic - Jin\'Zil\'s: npc_flag questgiver added');

-- Respawn prisoners quicker
UPDATE `creature` SET `spawntimesecsmin`=30, `spawntimesecsmax`=30 WHERE `guid` IN (32292, 32293, 32294);

-- Deepmoss Eggs 
-- Add traps to 24 of the eggs
DELETE FROM `gameobject` WHERE `id`=19543;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawnFlags`) VALUES 
(31800, 19543, 1, 962.659, 85.6017, 20.7847, -0.034907, 0.017452, -0.999848, 360, 360, 100, 1, 8),
(31801, 19543, 1, 602.857, 660.715, 79.6928, -3.12414, 0.999962, -0.008727, 360, 360, 100, 1, 8),
(31802, 19543, 1, 544.568, 667.32, 78.8672, 1.18682, 0.559193, 0.829038, 360, 360, 100, 1, 8),
(31803, 19543, 1, 501.52, 685.815, 79.4108, 0, 0, 1, 360, 360, 100, 1, 8),
(31804, 19543, 1, 456.917, 677.47, 78.431, -2.94961, 0.995396, -0.095846, 360, 360, 100, 1, 8),
(31805, 19543, 1, 524.556, 580.345, 90.9927, 0.034907, 0.017452, 0.999848, 360, 360, 100, 1, 8),
(31806, 19543, 1, 543.946, 595.887, 74.1724, -0.296706, 0.147809, -0.989016, 360, 360, 100, 1, 8),
(31807, 19543, 1, 1498.51, -566.273, 61.4355, -0.139626, 0.069756, -0.997564, 360, 360, 100, 1, 8),
(31808, 19543, 1, 1525.06, -389.071, 32.0918, 1.90241, 0.814116, 0.580703, 360, 360, 100, 1, 8),
(31809, 19543, 1, 989.752, 166.383, 22.7116, -0.383972, 0.190809, -0.981627, 360, 360, 100, 1, 8),
(31810, 19543, 1, 918.995, 200.072, 27.677, 1.79769, 0.782608, 0.622515, 360, 360, 100, 1, 8),
(31811, 19543, 1, 1495.26, -482.557, 38.5625, -0.593412, 0.292372, -0.956305, 360, 360, 100, 1, 8),
(31812, 19543, 1, 1503.16, 1011.93, 142.6, -0.942478, 0.453991, -0.891006, 360, 360, 100, 1, 8),
(31813, 19543, 1, 1524.46, 604.206, 145.681, -2.47837, 0.945519, -0.325568, 360, 360, 100, 1, 8),
(31814, 19543, 1, 862.677, 209.647, 27.7091, 1.76278, 0.771625, 0.636078, 360, 360, 100, 1, 8),
(31815, 19543, 1, 1402.17, 853.09, 146.997, 1.79769, 0.782608, 0.622515, 360, 360, 100, 1, 8),
(31816, 19543, 1, 1297.68, 313.875, 25.4999, -2.16421, 0.882948, -0.469472, 360, 360, 100, 1, 8),
(31817, 19543, 1, 1257.89, -615.094, 24.6667, -1.39626, 0.642788, -0.766044, 360, 360, 100, 1, 8),
(31818, 19543, 1, 1436.58, -78.9992, 22.0202, 2.46091, 0.942641, 0.333807, 360, 360, 100, 1, 8),
(31819, 19543, 1, 1425.79, -197.039, 20.3348, 0.349066, 0.173648, 0.984808, 360, 360, 100, 1, 8),
(31820, 19543, 1, 1597.57, 767.384, 132.161, 1.6057, 0.71934, 0.694658, 360, 360, 100, 1, 8),
(31821, 19543, 1, 1205.69, -536.305, 7.69451, -0.15708, 0.078459, -0.996917, 360, 360, 100, 1, 8),
(31822, 19543, 1, 1139.26, -545.701, 7.48719, 3.00197, 0.997564, 0.069757, 360, 360, 100, 1, 8),
(31823, 19543, 1, 1069, 247.825, 19.5764, -1.90241, 0.814116, -0.580703, 360, 360, 100, 1, 8);

-- Add emote on spawn for Deepmoss Hatchling
DELETE FROM `creature_ai_events` WHERE `creature_id`=4263;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES 
(426301, 4263, 0, 2, 0, 50, 0, 30, 0, 0, 0, 426301, 0, 0, 'Deepmoss Hatchling - Summon Deepmoss Matriarch at 30\% HP'),
(426302, 4263, 0, 11, 0, 100, 0, 0, 0, 0, 0, 426302, 0, 0, 'Deepmoss Hatchling - Emote on spawn');

DELETE FROM `creature_ai_scripts` WHERE `id`=426302;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(426302, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1413, 0, 0, 0, 0, 0, 0, 0, 0, 'Deepmoss Hatchling - Emote on spawn');

-- Boulderslide Ravine
UPDATE `quest_template` SET `DetailsEmote1`=1, `OfferRewardEmote1`=1, `CompleteScript`=6421 WHERE `entry`=6421 AND `patch`=0;

DELETE FROM `quest_end_scripts` WHERE `id`=6421;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `target_param1`, `target_param2`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(6421, 0, 15, 20528, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Boulderslide Ravine - Mor\'rogal: Cast spell Mor\'rogal Enchant'),
(6421, 3, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Boulderslide Ravine - Mor\'rogal: Talk emote');

-- Tsunaman 11862 waypoint movement and correct position
UPDATE `creature` SET `position_x`=823.2, `position_y`=932.8, `position_z`=155.47, `orientation`=1.571 WHERE `guid`=29247;
UPDATE `creature` SET `MovementType`=2 WHERE `guid`=29247;
UPDATE `creature_template` SET `MovementType`=2 WHERE `entry`=11862 AND `patch`=0;

DELETE FROM `creature_movement_template` WHERE `entry`=11862;
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `orientation`, `model1`, `model2`) VALUES
(11862, 1, 818.9, 941.4, 154.31, 30000, 1186201, 2.13, 0, 0),
(11862, 2, 823.2, 932.8, 155.47, 30000, 0, 1.571, 0, 0);

DELETE FROM `creature_movement_scripts` WHERE `id`=1186201;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(1186201, 3, 1, 61, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Tsunaman: Attack animation 1'),
(1186201, 8, 1, 61, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Tsunaman: Attack animation 2'),
(1186201, 13, 1, 61, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Tsunaman: Attack animation 3'),
(1186201, 18, 1, 61, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Tsunaman: Attack animation 4'),
(1186201, 23, 1, 61, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Tsunaman: Attack animation 5'),
(1186201, 28, 1, 61, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Tsunaman: Attack animation 6');

-- The Elder Crone
UPDATE `quest_template` SET `DetailsEmote1`=1, `OfferRewardEmote1`=2, `CompleteScript`=1063 WHERE `entry`=1063 AND `patch`=0;

DELETE FROM `quest_end_scripts` WHERE `id`=1063;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `target_param1`, `target_param2`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(1063, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Elder Crone - Magatha Grimtotem: npc_flag questgiver removed'),
(1063, 1, 0, 0, 0, 0, 0, 0, 0, 1416, 0, 0, 0, 0, 0, 0, 0, 'The Elder Crone - Magatha Grimtotem: Emote text 1'),
(1063, 4, 0, 0, 0, 0, 0, 0, 0, 1417, 0, 0, 0, 0, 0, 0, 0, 'The Elder Crone - Magatha Grimtotem: Say text 1'),
(1063, 5, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Elder Crone - Magatha Grimtotem: npc_flag questgiver added');

-- Shredding Machines
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=2, `OfferRewardEmoteDelay2`=2000 WHERE `entry`=1068 AND `patch`=0;

-- Start of vid 10: https://www.youtube.com/watch?v=ZSoDEJxsXtg&list=PL49Ga_-r7iKkxrbckm9CkUhWzxqrOnw-n&index=10

-- Cenarius' Legacy
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1087 AND `patch`=0;

-- Cycle of Rebirth
UPDATE `quest_template` SET `DetailsEmote1`=1, `CompleteScript`=6301 WHERE `entry`=6301 AND `patch`=0;

DELETE FROM `quest_end_scripts` WHERE `id`=6301;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `target_param1`, `target_param2`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(6301, 0, 15, 20041, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cycle of Rebirth - Tammra Windfield: Cast spell Tammra Sapling');

-- Tammra Windfield should stand and not face the dirt pile
UPDATE `creature` SET `orientation`=2.84 WHERE `guid`=29248;
UPDATE `creature_addon` SET `bytes1`=0 WHERE `guid`=29248 AND `patch`=0;

-- Calling in the Reserves
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5881 AND `patch`=0;

-- Harpies Threaten
UPDATE `quest_template` SET `DetailsEmote1`=1, `IncompleteEmote`=1, `OfferRewardEmote1`=1 WHERE `entry`=6282 AND `patch`=0;

-- Earthen Arise
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardEmoteDelay2`=1000 WHERE `entry`=6481 AND `patch`=0;

-- Trouble in the Deeps
UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=6562 AND `patch`=0;

-- Elemental War

-- Arachnophobia
UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=6284 AND `patch`=0;

-- New Life
UPDATE `quest_template` SET `DetailsEmote1`=1, `StartScript`=6381 WHERE `entry`=6381 AND `patch`=0;

DELETE FROM `quest_start_scripts` WHERE `id`=6381;
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `target_param1`, `target_param2`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(6381, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1015.68, 928.041, 103.519, 1.29154, 'New Life - Tammra Windfield: Face dirtpile'),
(6381, 1, 28, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'New Life - Tammra Windfield: Kneel start'),
(6381, 15, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'New Life - Tammra Windfield: Kneel end'),
(6381, 16, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1015.68, 928.041, 103.519, 2.84, 'New Life - Tammra Windfield: Face normal');

-- Ordanus
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=1088 AND `patch`=0;

-- Bloodfury Bloodline
UPDATE `quest_template` SET `DetailsEmote1`=1, `OfferRewardEmote1`=1 WHERE `entry`=6283 AND `patch`=0;

-- Start of vid 12: https://www.youtube.com/watch?v=-VL55SdDw-A&feature=youtu.be&list=PL49Ga_-r7iKkxrbckm9CkUhWzxqrOnw-n&t=1

-- The Sacred Flame pt. 1
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1195 AND `patch`=0;

-- Forsaken Aid
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1064 AND `patch`=0;

-- Start of vid 14: https://www.youtube.com/watch?v=mA1vYEAbdgI&feature=youtu.be&list=PL49Ga_-r7iKkxrbckm9CkUhWzxqrOnw-n&t=1

-- The Den
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1089 AND `patch`=0;

-- The Sacred Flame pt. 2
UPDATE `quest_template` SET `DetailsEmote1`=1, `CompleteEmote`=6 WHERE `entry`=1196 AND `patch`=0;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
