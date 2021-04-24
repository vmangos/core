DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200104131943');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200104131943');
-- Add your query below.


-- Greatfather Winter is Here!
UPDATE `quest_template` SET `DetailsEmote1`=5, `DetailsEmote2`=1, `DetailsEmote3`=4, `OfferRewardEmote1`=1, `OfferRewardEmote2`=1 WHERE `entry` IN (6961, 7021, 7022, 7023, 7024);
-- Treats for Greatfather Winter
UPDATE `quest_template` SET `DetailsEmote1`=6, `DetailsEmote2`=1, `IncompleteEmote`=1, `CompleteEmote`=1, `OfferRewardEmote1`=7, `OfferRewardEmote2`=1, `RewRepFaction1`=169, `RewRepFaction2`=0, `RewRepFaction3`=0, `RewRepFaction4`=0, `RewRepValue1`=25, `RewRepValue2`=0, `RewRepValue3`=0, `RewRepValue4`=0 WHERE `entry` IN (6962, 7025);
-- New Year Celebrations!
UPDATE `quest_template` SET `DetailsEmote1`=5, `DetailsEmoteDelay1`=3000, `CompleteEmote`=2, `IncompleteEmote`=2, `OfferRewardEmote1`=4, `OfferRewardEmote2`=2, `RewRepValue1`=100, `RewOrReqMoney`=900 WHERE `entry`IN (8860, 8861);
-- The Reason for the Season
UPDATE `quest_template` SET `DetailsEmote1`=5, `DetailsEmote2`=1, `DetailsEmote3`=274, `OfferRewardEmote1`=6, `OfferRewardEmote2`=1, `RewXP`=650 WHERE `entry` IN (6964, 7062);
-- Winter's Presents
UPDATE `quest_template` SET `OfferRewardEmote1`=11, `OfferRewardEmote2`=1, `RewXP`=0 WHERE `entry`=8827;
UPDATE `quest_template` SET `OfferRewardEmote1`=11, `OfferRewardEmote2`=1 WHERE `entry`=8828;
-- Stolen Winter Veil Treats
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `RewMoneyMaxLevel`=9900 WHERE `entry` IN (6963, 7042);
-- Metzen the Reindeer
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `OfferRewardEmote1`=4, `OfferRewardEmote2`=1, `RewRepValue1`=200 WHERE `entry` IN (8746, 8762);
-- The Feast of Winter Veil
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `CompleteEmote`=1, `OfferRewardEmote1`=1, `OfferRewardEmote2`=1, `OfferRewardEmote3`=66 WHERE `entry` IN (7061, 7063);
-- You're a Mean One...
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=5, `DetailsEmote3`=1, `CompleteEmote`=5, `OfferRewardEmote1`=5, `OfferRewardEmote2`=4, `OfferRewardEmote3`=1 WHERE `entry` IN (6983, 7043);
-- A Smokywood Pastures' Thank You!
UPDATE  `quest_template` SET `DetailsEmote1`=2, `DetailsEmote2`=1, `DetailsEmote3`=1, `RewRepFaction1`=169, `RewRepValue1`=100 WHERE `entry` IN (6984, 7045);

-- Correct spawn location of Goli Krumn.
UPDATE `creature` SET `position_x`=-4882.71, `position_y`=-952.68, `position_z`=501.464, `orientation`=3.17408 WHERE `id`=1365;

-- Remove gossip from Goli Krumn.
UPDATE `creature_template` SET `gossip_menu_id`=0, `npc_flags`=2 WHERE `entry`=1365;
DELETE FROM `gossip_menu` WHERE `entry`=9058;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=9058;

-- Add gossip menu to Wonderform Operator.
UPDATE `creature_template` SET `gossip_menu_id`=6802 WHERE `entry`=15732;
INSERT INTO `gossip_menu` VALUES (6802, 8125, 0);

-- Add missing spawns for Greatfather Winter's Helper.
INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `MovementType`) VALUES (62028, 15745, 0, 0, 0, -4912.68, -976.28, 501.533, 2.49582, 300, 300, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `MovementType`) VALUES (62029, 15746, 1, 0, 0, 1628.58, -4414.49, 16.036, 6.10882, 300, 300, 0, 0);
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES (62028, 2);
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES (62029, 2);

-- Events list for Greatfather Winter's Helper
DELETE FROM `creature_ai_events` WHERE `creature_id`=15745;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1574501, 15745, 0, 1, 0, 100, 1, 0, 0, 600000, 600000, 1574501, 0, 0, 'Greatfather Winter\'s Helper - Yell OOC');
DELETE FROM `creature_ai_scripts` WHERE `id`=1574501;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1574501, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 11430, 0, 0, 0, 0, 0, 0, 0, 0, 'Greatfather Winter\'s Helper - Say Text');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=15745;

-- Events list for Great-father Winter's Helper
DELETE FROM `creature_ai_events` WHERE `creature_id`=15746;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1574601, 15746, 0, 1, 0, 100, 1, 0, 0, 600000, 600000, 1574601, 0, 0, 'Great-father Winter\'s Helper - Yell OOC');
DELETE FROM `creature_ai_scripts` WHERE `id`=1574601;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1574601, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11430, 0, 0, 0, 0, 0, 0, 0, 0, 'Great-father Winter\'s Helper - Say Text');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=15746;

-- Missing Wonderform Operator in Tanaris.
INSERT INTO `creature` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `MovementType`, `patch_min`, `patch_max`) VALUES (54903, 15732, 1, -7163.48, -3913.22, 9.61368, 0.0523599, 180, 180, 0, 0, 6, 10);
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES (54903, 2);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (41958, 180796, 1, -7166.08, -3918.11, 9.39414, 0.994837, 0, 0, 0, 0, 180, 180, 100, 1);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (41959, 180797, 1, -7166.08, -3918.05, 9.39524, -2.00713, 0, 0, 0, 0, 180, 180, 100, 1);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (41960, 178746, 1, -7162.93, -3911.53, 9.63193, 0.383971, 0, 0, 0, 0, 180, 180, 100, 1);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (41962, 178434, 1, -7164.25, -3916.59, 14.8622, 0.349065, 0, 0, 0, 0, 180, 180, 100, 1);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (41963, 178435, 1, -7163.8, -3918.61, 14.5926, 0.139624, 0, 0, 0, 0, 180, 180, 100, 1);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (41964, 180798, 1, -7165.23, -3915.61, 9.42218, -0.174532, 0, 0, 0, 0, 180, 180, 100, 1);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (41965, 180799, 1, -7166.09, -3915.61, 9.44391, 1.37881, 0, 0, 0, 0, 180, 180, 100, 1);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (41958, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (41959, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (41960, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (41962, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (41963, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (41964, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (41965, 2);

-- Missing Wonderform Operator in Menethil.
INSERT INTO `creature` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `MovementType`, `patch_min`, `patch_max`) VALUES (54901, 15732, 0, -3756.79, -770.778, 9.6816, 3.29867, 180, 180, 0, 0, 6, 10);
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES (54901, 2);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (41950, 180796, 0, -3755.18, -775.606, 9.87997, -2.46091, 0, 0, 0, 0, 180, 180, 100, 1);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (41951, 180797, 0, -3755.38, -775.585, 9.87012, 0.59341, 0, 0, 0, 0, 180, 180, 100, 1);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (41952, 178746, 0, -3757.98, -769.912, 9.46039, 2.35619, 0, 0, 0, 0, 180, 180, 100, 1);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (41953, 178667, 0, -3751.6, -767.777, 9.84089, -0.104719, 0, 0, 0, 0, 180, 180, 100, 1);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (41954, 178434, 0, -3757.23, -775.569, 14.8131, -3.01941, 0, 0, 0, 0, 180, 180, 100, 1);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (41955, 178435, 0, -3756.75, -774.392, 14.7831, 2.63544, 0, 0, 0, 0, 180, 180, 100, 1);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (41956, 180798, 0, -3756.7, -777.645, 9.89885, -2.16421, 0, 0, 0, 0, 180, 180, 100, 1);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES (41957, 180799, 0, -3755.98, -778.003, 9.89892, -2.07694, 0, 0, 0, 0, 180, 180, 100, 1);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (41950, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (41951, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (41952, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (41953, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (41954, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (41955, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (41956, 2);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES (41957, 2);

-- Pat's Snowcloud Guy spawns from cmangos.
UPDATE `creature_template` SET `patch`=6 WHERE `entry`=15730;
UPDATE `creature_template_addon` SET `patch`=6 WHERE `entry`=15730;
DELETE FROM `game_event_creature` WHERE `guid` IN (SELECT `guid` FROM `creature` WHERE `id`=15730);
DELETE FROM `creature` WHERE `id`=15730;
INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `patch_min`, `patch_max`) VALUES (54908, 15730, 0, 0, 0, -14294.5, 516.209, 9.07392, -2.47837, 180, 180, 0, 0, 100, 0, 0, 0, 6, 10);
INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `patch_min`, `patch_max`) VALUES (54905, 15730, 0, 0, 0, -8823.58, 540.349, 97.0268, 2.44346, 180, 180, 0, 0, 100, 0, 0, 0, 6, 10);
INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `patch_min`, `patch_max`) VALUES (54902, 15730, 1, 0, 0, -7166.18, -3918.02, 9.4828, 2.44346, 180, 180, 0, 0, 100, 0, 0, 0, 6, 10);
INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `patch_min`, `patch_max`) VALUES (54904, 15730, 0, 0, 0, -5049.6, -817.202, 495.352, 2.09439, 180, 180, 0, 0, 100, 0, 0, 0, 6, 10);
INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `patch_min`, `patch_max`) VALUES (54900, 15730, 0, 0, 0, -3754.8, -775.607, 9.98073, 1.81514, 180, 180, 0, 0, 100, 0, 0, 0, 6, 10);
INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `patch_min`, `patch_max`) VALUES (54907, 15730, 1, 0, 0, 1332.11, -4607.79, 23.9229, -1.95477, 180, 180, 0, 0, 100, 0, 0, 0, 6, 10);
INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `patch_min`, `patch_max`) VALUES (54906, 15730, 0, 0, 0, 2051.28, 272.469, 57.0336, -2.44346, 180, 180, 0, 0, 100, 0, 0, 0, 6, 10);
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES (54900, 2);
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES (54902, 2);
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES (54904, 2);
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES (54905, 2);
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES (54906, 2);
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES (54907, 2);
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES (54908, 2);

-- Gaily Wrapped Present
UPDATE `gameobject_template` SET `data0`=43, `data3`=6797 WHERE `entry`=180747;
INSERT INTO `gossip_menu` VALUES (6797, 8109, 0);

-- Ticking Present
UPDATE `gameobject_template` SET `data0`=43, `data3`=6792 WHERE `entry`=180748;
INSERT INTO `gossip_menu` VALUES (6792, 8109, 0);

-- Festive Gift
UPDATE `gameobject_template` SET `data0`=43, `data3`=6798 WHERE `entry`=180793;
INSERT INTO `gossip_menu` VALUES (6798, 8109, 0);

-- Gently Shaken Gift
UPDATE `gameobject_template` SET `data0`=43 WHERE `entry`=180746;

-- Carefully Wrapped Present
UPDATE `gameobject_template` SET `data0`=43 WHERE `entry`=180743;

-- Add missing spawn points for The Abominable Greench.
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (90379, 13602, 0, 0, 0, 0, 0, 0, 228.695, -178.387, 140.21, 3.50941, 600, 600, 15, 0, 100, 0, 0, 1, 0, 0, 0, 10);
INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES (91750, 13602, 0, 0, 0, 361.078, -54.289, 145.192, 2.182, 600, 600, 15, 0, 100, 0, 0, 1);
INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES (91751, 13602, 0, 0, 0, 313.328, -376.999, 169.598, 0.914, 600, 600, 15, 0, 100, 0, 0, 1);
INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES (91752, 13602, 0, 0, 0, 550.981, -101.974, 145.18, 2.755, 600, 600, 15, 0, 100, 0, 0, 1);
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES (90379, 2);
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES (91750, 2);
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES (91751, 2);
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES (91752, 2);
UPDATE `creature` SET `modelid`=0, `spawndist`=15, `MovementType`=1 WHERE `id`=13602;
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES (43525, 1, 'Alterac Mountains: The Abominable Greench', 0, 0, 0, 10);
INSERT INTO `pool_creature` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (90379, 43525, 0, 'The Abominable Greench', 0, 0, 10);
INSERT INTO `pool_creature` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (91750, 43525, 0, 'The Abominable Greench', 0, 0, 10);
INSERT INTO `pool_creature` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (91751, 43525, 0, 'The Abominable Greench', 0, 0, 10);
INSERT INTO `pool_creature` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (91752, 43525, 0, 'The Abominable Greench', 0, 0, 10);

-- Spell Snowman should be negative.
UPDATE `spell_template` SET `customFlags`=`customFlags`+2 WHERE `entry`=21847;

-- Spells list for The Abominable Greench.
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (136020, 'Alterac Mountains - The Abominable Greench', 21847, 100, 1, 0, 0, 0, 6, 6, 23, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
UPDATE `creature_template` SET `spell_list_id`=136020 WHERE `entry`=13602;

-- Correct damage for The Abominable Greench.
UPDATE `creature_template` SET `dmg_min`=65, `dmg_max`=88 WHERE `entry`=13602;

-- Correct respawn time for Metzen the Reindeer.
UPDATE `creature` SET `spawntimesecsmin`=20, `spawntimesecsmax`=20 WHERE `id`=15664;

-- Add gossip menu for Winter Reveler.
UPDATE `creature_template` SET `gossip_menu_id`=6813 WHERE `entry`=15760;
INSERT INTO `gossip_menu` VALUES (6813, 8139, 0);

-- Add gossip flag to Greatfather Winter.
UPDATE `creature_template` SET `npc_flags`=3 WHERE `entry` IN (13444, 13445);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
