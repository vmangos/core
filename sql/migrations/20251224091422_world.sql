DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20251224091422');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20251224091422');
-- Add your query below.


-- Remove Duplicate Sharks
DELETE FROM `creature` WHERE `guid` IN (88969, 88979, 88978, 88977, 88976, 88973, 88972, 88971, 88970);

-- Thunderheads Should Have Large Wander Distance
UPDATE `creature` SET `movement_type` = 1 WHERE `guid` IN (36205, 36212);
UPDATE `creature` SET `wander_distance` = 40 WHERE `id` IN (6380, 6377, 6379, 6375) AND `movement_type` = 1;

-- Cliff Walkers Should Have Large Wander Distance
UPDATE `creature` SET `movement_type` = 1 WHERE `guid` IN (35139, 35167);
UPDATE `creature` SET `wander_distance` = 70 WHERE `id` IN (6148, 6147, 6146) AND `movement_type` = 1;

-- Frenzied Plaguehound (8598) should share spawn with Monstrous Plaguebat (8602)
UPDATE `creature` SET `id` = 8598, `id2` = 8602 WHERE `id` IN (8598, 8602);

-- Plaguehound (8597) should share spawn with Noxious Plaguebat (8601)
UPDATE `creature` SET `id` = 8597, `id2` = 8601 WHERE `id` IN (8597, 8601);

-- Blue Dragonspawn (193) should share spawn with Blue Scalebane (6130) Draconic Mageweaver (6131)
UPDATE `creature` SET `id` = 193, `id2` = 6130, `id3` = 6131 WHERE `id` IN (193, 6130, 6131);

-- Thunderhead Patriarch (6379) should share spawn with Thunderhead Consort (6380)
UPDATE `creature` SET `id` = 6379, `id2` = 6380 WHERE `id` IN (6379, 6380);

-- Cliff Breaker (6146) should share spawn with Cliff Thunderer (6147)
UPDATE `creature` SET `id` = 6146, `id2` = 6147 WHERE `id` IN (6146, 6147);

-- Servant of Arkkoroc (6143) should share spawn with Servant of Arkkoroc (6144)
UPDATE `creature` SET `id` = 6143, `id2` = 6144 WHERE `id` IN (6143, 6144);

-- Arkkoran Muckdweller (6136) should share spawn with Arkkoran Clacker (6135) Arkkoran Pincer (6137) Arkkoran Oracle (6138)
UPDATE `creature` SET `id` = 6135, `id2` = 6136, `id3` = 6137, `id4` = 6138 WHERE `id` IN (6135, 6136, 6137, 6138);

-- Firetail Scorpid (9697) should share spawn with Giant Ember Worg (9698)
UPDATE `creature` SET `id` = 9697, `id2` = 9698 WHERE `id` IN (9697, 9698);

-- Ember Worg (9690) should share spawn with Venomtip Scorpid (9691)
UPDATE `creature` SET `id` = 9690, `id2` = 9691 WHERE `id` IN (9690, 9691);

-- Entropic Beast (9878) should share spawn with Entropic Horror (9879)
UPDATE `creature` SET `id` = 9878, `id2` = 9879 WHERE `id` IN (9878, 9879);

-- Add Missing Complete Scripts
INSERT INTO `quest_end_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(5218, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6553, 0, 0, 0, 0, 0, 0, 0, 0, 'Felstone Field Cauldron: Scourge Cauldron - Talk'),
(5221, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6553, 0, 0, 0, 0, 0, 0, 0, 0, 'Dalson\'s Tears Cauldron: Scourge Cauldron - Talk'),
(5224, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6553, 0, 0, 0, 0, 0, 0, 0, 0, 'Writhing Haunt Cauldron: Scourge Cauldron - Talk'),
(5227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6553, 0, 0, 0, 0, 0, 0, 0, 0, 'Gahrron\'s Withering Cauldron: Scourge Cauldron - Talk');
UPDATE `quest_template` SET `CompleteScript` = 5218 WHERE `entry` = 5218 AND `patch` = 0;
UPDATE `quest_template` SET `CompleteScript` = 5221 WHERE `entry` = 5221 AND `patch` = 0;
UPDATE `quest_template` SET `CompleteScript` = 5224 WHERE `entry` = 5224 AND `patch` = 0;
UPDATE `quest_template` SET `CompleteScript` = 5227 WHERE `entry` = 5227 AND `patch` = 0;

-- The Shadow Guard (9213) and The Ice Guard (9211) Require Argent Dawn Honored
UPDATE `quest_template` SET `RequiredMinRepFaction` = 529, `RequiredMinRepValue` = 9000 WHERE `entry` IN (9211, 9213);

-- Events list for Devlin Agamand
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(165703, 1657, 0, 1, 0, 100, 3, 180000, 300000, 180000, 300000, 165703, 165704, 0, 'Devlin Agamand - Random Say OOC');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(165703, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 567, 568, 569, 570, 0, 0, 0, 0, 0, 'Devlin Agamand - Random Say OOC'),
(165704, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 571, 572, 573, 0, 0, 0, 0, 0, 0, 'Devlin Agamand - Random Say OOC');

-- Events list for Lillith Nefara
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 1946;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(194601, 1946, 0, 4, 0, 100, 0, 0, 0, 0, 0, 194601, 0, 0, 'Lillith Nefara - Say on Aggro');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(194601, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 427, 0, 0, 0, 0, 0, 0, 0, 0, 'Lillith Nefara - Say on Aggro');

-- Events list for Caretaker Caice
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 2307;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(230701, 2307, 0, 1, 0, 100, 1, 180000, 300000, 180000, 300000, 230701, 0, 0, 'Caretaker Caice - Random Say OOC');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(230701, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 583, 584, 585, 586, 0, 0, 0, 0, 0, 'Caretaker Caice - Random Say OOC');

-- Correct Patch for Attunement to the Core
UPDATE `creature_questrelation` SET `patch_max` = 2 WHERE `id` = 14387 AND `quest` = 7487;
UPDATE `creature_involvedrelation` SET `patch_max` = 2 WHERE `id` = 14387 AND `quest` = 7487;

-- Daphne Stilwell 6182 (credit cmangos)
-- custom made path corrected
UPDATE `creature` SET `position_x` = -11482.304,  `position_y` = 1557.4106,  `position_z` = 48.70583,  `orientation` = 4.26775 WHERE `id` = 6182;
DELETE FROM `creature_movement` WHERE `Id` = 66979;
DELETE FROM `creature_movement_template` WHERE `entry` = 6182;
INSERT INTO `creature_movement_template` (`entry`,  `point`,  `position_x`,  `position_y`,  `position_z`,  `orientation`,  `waittime`,  `script_id`) VALUES
(6182, 1, -11482.304, 1557.4106, 48.70583, 100, 11000, 0), 
(6182, 2, -11476.278, 1557.6038, 48.70583, 100, 0, 0), 
(6182, 3, -11470.299, 1559.1139, 48.58083, 100, 2000, 0), 
(6182, 4, -11470.382, 1563.5004, 48.58083, 100, 1000, 0), 
(6182, 5, -11464.786, 1565.625, 48.846966, 100, 10000, 618201), 
(6182, 6, -11465.664, 1567.7332, 48.7971, 100, 0, 0), 
(6182, 7, -11465.914, 1569.9832, 48.7971, 100, 0, 0), 
(6182, 8, -11465.041, 1570.8412, 48.747234, 100, 0, 0), 
(6182, 9, -11465.041, 1570.8412, 48.747234, 6.21337, 10000, 618201), 
(6182, 10, -11471.896, 1573.1904, 48.59549, 100, 0, 0), 
(6182, 11, -11477.807, 1573.1018, 48.59549, 100, 0, 0), 
(6182, 12, -11480.656, 1574.8416, 48.59549, 100, 10000, 618201), 
(6182, 13, -11482.617, 1567.7522, 48.59549, 100, 0, 0), 
(6182, 14, -11480.854, 1560.6074, 48.58083, 100, 0, 0);
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(618201, 1, 0, 1, 69, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Daphne Stilwell - Emote'),
(618201, 8, 0, 1, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Daphne Stilwell - Emote');

-- Remove Duplicate Blood of Heroes
DELETE FROM `gameobject` WHERE `guid` = 25371;

-- Remove Rogue PLaguebloom
DELETE FROM `gameobject` WHERE `guid` = 20108;
DELETE FROM `pool_gameobject` WHERE `guid` = 20108;

-- Can we see if cmangos has any additional spawns here https://github.com/cmangos/tbc-db/blob/18387b80f4d14da5905baf184c98444d94e14223/Updates/0556_vanilla_veins.sql
-- Add Some Missing Tin Vein / Silver Vein (credit cmangos)
-- Wetlands
SET @GGUID = 246;
SET @PTEMPLATE = 3007;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1732, 0, -2596.69970703125, -1893.5811767578125, 20.57378578186035156, 1.099556446075439453, 0, 0, 0.522498130798339843, 0.852640450000762939, 300, 900, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1733, 0, -2596.69970703125, -1893.5811767578125, 20.57378578186035156, 1.099556446075439453, 0, 0, 0.522498130798339843, 0.852640450000762939, 300, 900, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Tin Vein / Silver Vein - Wetlands', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 95, 'Tin Vein / Silver Vein - Wetlands', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+0, 5, 'Tin Vein / Silver Vein - Wetlands', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 1348, 0, 'Wetlands - Tin Vein / Silver Vein', 0);

-- Silverpine Forest
SET @GGUID = 4009;
SET @PTEMPLATE = 3536;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1732, 0, -444.3253173828125, 1074.275390625, 92.75608062744140625, 5.218535900115966796, 0, 0, -0.507537841796875, 0.861629426479339599, 300, 900, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1733, 0, -444.3253173828125, 1074.275390625, 92.75608062744140625, 5.218535900115966796, 0, 0, -0.507537841796875, 0.861629426479339599, 300, 900, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Tin Vein / Silver Vein - Silverpine Forest', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 95, 'Tin Vein / Silver Vein - Silverpine Forest', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+0, 5, 'Tin Vein / Silver Vein - Silverpine Forest', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 1354, 0, 'Silverpine Forest - Tin Vein / Silver Vein', 0);

-- Darkshore
SET @GGUID = 4011;
SET @PTEMPLATE = 3537;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1732, 1, 7420.14501953125, -789.52685546875, 16.9228973388671875, 5.637413978576660156, 0, 0, -0.31730461120605468, 0.948323667049407958, 300, 900, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1733, 1, 7420.14501953125, -789.52685546875, 16.9228973388671875, 5.637413978576660156, 0, 0, -0.31730461120605468, 0.948323667049407958, 300, 900, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Tin Vein / Silver Vein - Darkshore', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 95, 'Tin Vein / Silver Vein - Darkshore', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+0, 5, 'Tin Vein / Silver Vein - Darkshore', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 1099, 0, 'Darkshore - Tin Vein / Silver Vein', 0);
UPDATE `gameobject` SET `position_x` = 7968.3974609375, `position_y` = -1087.4107666015625, `position_z` = 44.57505416870117187, `orientation` = 0.122172988951206207, `rotation2` = 0.061048507690429687, `rotation3` = 0.998134791851043701 WHERE `guid` IN (365548, 365584);

-- Windshear Mine
SET @GGUID = 4013;
SET @PTEMPLATE = 3538;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1732, 1, 954.4083251953125, -352.142669677734375, 5.487726211547851562, 3.94444584846496582, 0, 0, -0.92050457000732421, 0.3907318115234375, 300, 900, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1733, 1, 954.4083251953125, -352.142669677734375, 5.487726211547851562, 3.94444584846496582, 0, 0, -0.92050457000732421, 0.3907318115234375, 300, 900, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Tin Vein / Silver Vein - Stonetalon Mountains - Windshear Mine', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 95, 'Tin Vein / Silver Vein - Stonetalon Mountains - Windshear Mine', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+0, 5, 'Tin Vein / Silver Vein - Stonetalon Mountains - Windshear Mine', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 386, 0, 'Stonetalon Mountains - Windshear Mine - Tin Vein / Silver Vein', 0);
SET @GGUID = 4015;
SET @PTEMPLATE = 3539;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1732, 1, 962.618408203125, -270.985687255859375, -1.75297904014587402, 1.134462952613830566, 0, 0, 0.537299156188964843, 0.843391716480255126, 300, 900, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1733, 1, 962.618408203125, -270.985687255859375, -1.75297904014587402, 1.134462952613830566, 0, 0, 0.537299156188964843, 0.843391716480255126, 300, 900, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Tin Vein / Silver Vein - Stonetalon Mountains - Windshear Mine', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 95, 'Tin Vein / Silver Vein - Stonetalon Mountains - Windshear Mine', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+0, 5, 'Tin Vein / Silver Vein - Stonetalon Mountains - Windshear Mine', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 386, 0, 'Stonetalon Mountains - Windshear Mine - Tin Vein / Silver Vein', 0);

-- Correct Patch For Dark Iron Inside Instances
UPDATE `gameobject` SET `patch_min` = 0 WHERE `id`=165658 AND (`map` = 230 OR `map` = 409);
UPDATE `pool_gameobject` SET `patch_min` = 0 WHERE `pool_entry` = 25622 OR `pool_entry` = 25609;
update `pool_template` SET `patch_min` = 0 WHERE `entry` = 25609 OR `entry` = 25622;

-- Correct Gossip for Ranshalla
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES
(3131, 4787, 1023);
-- 1021: Target Has Complete Quest 4901 In Log
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (1021, 9, 4901, 2, 0, 0, 0);
-- 1022: Target Has Done Quest 4901
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (1022, 8, 4901, 0, 0, 0, 0);
-- 1023: (1021: Target Has Complete Quest 4901 In Log) Or (1022: Target Has Done Quest 4901)
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (1023, -2, 1021, 1022, 0, 0, 0);


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
