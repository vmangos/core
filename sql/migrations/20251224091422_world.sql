DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20251224091422');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20251224091422');
-- Add your query below.


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


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
