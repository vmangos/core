DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260101094751');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260101094751');
-- Add your query below.


-- Pool Some Rich Thorium in Burning Steppes
SET @PTEMPLATE = 3554;

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
