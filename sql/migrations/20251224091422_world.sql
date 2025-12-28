DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20251224091422');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20251224091422');
-- Add your query below.


-- Arkkoran Muckdweller (6136) should share spawn with Arkkoran Clacker (6135)
UPDATE `creature` SET `id` = 6135, `id2` = 6136 WHERE `id` IN (6135, 6136);

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

-- Fix Console Errors
UPDATE `creature` SET `mana_percent` = 100 WHERE  `guid` IN (17021, 17018, 17017, 17013, 17010, 17004);

-- Pool Some Rich Thorium in Burning Steppes
SET @PTEMPLATE = 3589;

-- Misc
DELETE FROM `pool_pool` WHERE `pool_id` IN (21436, 21441, 21437, 21416);
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Dark Iron Deposit / Rich Thorium Vein - Burning Steppes - Misc' WHERE `entry` IN (21436, 21441, 21437, 21416);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Dark Iron Deposit / Rich Thorium Vein - Burning Steppes - Misc' WHERE `pool_entry` IN (21436, 21441, 21437, 21416);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Burning Steppes - Misc - Truesilver Deposit / Dark Iron Deposit / Rich Thorium Vein (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(21436, @PTEMPLATE+1, 0, 'Burning Steppes - Misc - Truesilver Deposit / Dark Iron Deposit / Rich Thorium Vein', 0),
(21441, @PTEMPLATE+1, 0, 'Burning Steppes - Misc - Truesilver Deposit / Dark Iron Deposit / Rich Thorium Vein', 0),
(21437, @PTEMPLATE+1, 0, 'Burning Steppes - Misc - Truesilver Deposit / Dark Iron Deposit / Rich Thorium Vein', 0),
(21416, @PTEMPLATE+1, 0, 'Burning Steppes - Misc - Truesilver Deposit / Dark Iron Deposit / Rich Thorium Vein', 0);

-- Ruins of Thaurissian
DELETE FROM `pool_pool` WHERE `pool_id` IN (21438, 21433, 21435, 21432, 21440);
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Dark Iron Deposit / Rich Thorium Vein - Burning Steppes - Ruins of Thaurissian' WHERE `entry` IN (21438, 21433, 21435, 21432, 21440);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Dark Iron Deposit / Rich Thorium Vein - Burning Steppes - Ruins of Thaurissian' WHERE `pool_entry` IN (21438, 21433, 21435, 21432, 21440);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+2, 1, 'Burning Steppes - Ruins of Thaurissian - Truesilver Deposit / Dark Iron Deposit / Rich Thorium Vein (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(21438, @PTEMPLATE+2, 0, 'Burning Steppes - Ruins of Thaurissian - Truesilver Deposit / Dark Iron Deposit / Rich Thorium Vein', 0),
(21433, @PTEMPLATE+2, 0, 'Burning Steppes - Ruins of Thaurissian - Truesilver Deposit / Dark Iron Deposit / Rich Thorium Vein', 0),
(21435, @PTEMPLATE+2, 0, 'Burning Steppes - Ruins of Thaurissian - Truesilver Deposit / Dark Iron Deposit / Rich Thorium Vein', 0),
(21432, @PTEMPLATE+2, 0, 'Burning Steppes - Ruins of Thaurissian - Truesilver Deposit / Dark Iron Deposit / Rich Thorium Vein', 0),
(21440, @PTEMPLATE+2, 0, 'Burning Steppes - Ruins of Thaurissian - Truesilver Deposit / Dark Iron Deposit / Rich Thorium Vein', 0);

-- Blackrock Stronghold
DELETE FROM `pool_pool` WHERE `pool_id` IN (21434, 21431, 21429, 21430, 21439);
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Dark Iron Deposit / Rich Thorium Vein - Burning Steppes - Blackrock Stronghold' WHERE `entry` IN (21434, 21431, 21429, 21430, 21439);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Dark Iron Deposit / Rich Thorium Vein - Burning Steppes - Blackrock Stronghold' WHERE `pool_entry` IN (21434, 21431, 21429, 21430, 21439);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+3, 1, 'Burning Steppes - Blackrock Stronghold - Truesilver Deposit / Dark Iron Deposit / Rich Thorium Vein (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(21434, @PTEMPLATE+3, 0, 'Burning Steppes - Blackrock Stronghold - Truesilver Deposit / Dark Iron Deposit / Rich Thorium Vein', 0),
(21431, @PTEMPLATE+3, 0, 'Burning Steppes - Blackrock Stronghold - Truesilver Deposit / Dark Iron Deposit / Rich Thorium Vein', 0),
(21429, @PTEMPLATE+3, 0, 'Burning Steppes - Blackrock Stronghold - Truesilver Deposit / Dark Iron Deposit / Rich Thorium Vein', 0),
(21430, @PTEMPLATE+3, 0, 'Burning Steppes - Blackrock Stronghold - Truesilver Deposit / Dark Iron Deposit / Rich Thorium Vein', 0),
(21439, @PTEMPLATE+3, 0, 'Burning Steppes - Blackrock Stronghold - Truesilver Deposit / Dark Iron Deposit / Rich Thorium Vein', 0);

-- Draco\'dar
DELETE FROM `pool_pool` WHERE `pool_id` IN (21427, 21418, 21423, 21426, 21428);
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Dark Iron Deposit / Rich Thorium Vein - Burning Steppes - Draco\'dar' WHERE `entry` IN (21427, 21418, 21423, 21426, 21428);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Dark Iron Deposit / Rich Thorium Vein - Burning Steppes - Draco\'dar' WHERE `pool_entry` IN (21427, 21418, 21423, 21426, 21428);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+4, 1, 'Burning Steppes - Draco\'dar - Truesilver Deposit / Dark Iron Deposit / Rich Thorium Vein (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(21427, @PTEMPLATE+4, 0, 'Burning Steppes - Draco\'dar - Truesilver Deposit / Dark Iron Deposit / Rich Thorium Vein', 0),
(21418, @PTEMPLATE+4, 0, 'Burning Steppes - Draco\'dar - Truesilver Deposit / Dark Iron Deposit / Rich Thorium Vein', 0),
(21423, @PTEMPLATE+4, 0, 'Burning Steppes - Draco\'dar - Truesilver Deposit / Dark Iron Deposit / Rich Thorium Vein', 0),
(21426, @PTEMPLATE+4, 0, 'Burning Steppes - Draco\'dar - Truesilver Deposit / Dark Iron Deposit / Rich Thorium Vein', 0),
(21428, @PTEMPLATE+4, 0, 'Burning Steppes - Draco\'dar - Truesilver Deposit / Dark Iron Deposit / Rich Thorium Vein', 0);

-- Pillar of Ash
DELETE FROM `pool_pool` WHERE `pool_id` IN (21417, 21425, 21420, 21419, 21421);
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Dark Iron Deposit / Rich Thorium Vein - Burning Steppes - Pillar of Ash' WHERE `entry` IN (21417, 21425, 21420, 21419, 21421);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Dark Iron Deposit / Rich Thorium Vein - Burning Steppes - Pillar of Ash' WHERE `pool_entry` IN (21417, 21425, 21420, 21419, 21421);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+5, 1, 'Burning Steppes - Pillar of Ash - Truesilver Deposit / Dark Iron Deposit / Rich Thorium Vein (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(21417, @PTEMPLATE+5, 0, 'Burning Steppes - Pillar of Ash - Truesilver Deposit / Dark Iron Deposit / Rich Thorium Vein', 0),
(21425, @PTEMPLATE+5, 0, 'Burning Steppes - Pillar of Ash - Truesilver Deposit / Dark Iron Deposit / Rich Thorium Vein', 0),
(21420, @PTEMPLATE+5, 0, 'Burning Steppes - Pillar of Ash - Truesilver Deposit / Dark Iron Deposit / Rich Thorium Vein', 0),
(21419, @PTEMPLATE+5, 0, 'Burning Steppes - Pillar of Ash - Truesilver Deposit / Dark Iron Deposit / Rich Thorium Vein', 0),
(21421, @PTEMPLATE+5, 0, 'Burning Steppes - Pillar of Ash - Truesilver Deposit / Dark Iron Deposit / Rich Thorium Vein', 0);

DELETE FROM `pool_template` WHERE `entry` = 1297;

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


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
