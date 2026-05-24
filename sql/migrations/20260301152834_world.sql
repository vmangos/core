DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260301152834');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260301152834');
-- Add your query below.

-- Pool Mountain Silversage in Silithus
SET @PTEMPLATE = 3990;
-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- North East
DELETE FROM `pool_gameobject` WHERE `guid` IN (49412, 68794, 618, 616);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Silithus - North East - Mountain Silversage', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(49412, @PTEMPLATE+1, 0, 'Mountain Silversage - Silithus - North East', 0, 0, 10),
(68794, @PTEMPLATE+1, 0, 'Mountain Silversage - Silithus - North East', 0, 0, 10),
(618, @PTEMPLATE+1, 0, 'Mountain Silversage - Silithus - North East', 0, 0, 10),
(616, @PTEMPLATE+1, 0, 'Mountain Silversage - Silithus - North East', 0, 0, 10);

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- North West
DELETE FROM `pool_gameobject` WHERE `guid` IN (66840, 49406, 620, 622);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+2, 1, 'Silithus - North West - Mountain Silversage', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(66840, @PTEMPLATE+2, 0, 'Mountain Silversage - Silithus - North West', 0, 0, 10),
(49406, @PTEMPLATE+2, 0, 'Mountain Silversage - Silithus - North West', 0, 0, 10),
(620, @PTEMPLATE+2, 0, 'Mountain Silversage - Silithus - North West', 0, 0, 10),
(622, @PTEMPLATE+2, 0, 'Mountain Silversage - Silithus - North West', 0, 0, 10);

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- West
DELETE FROM `pool_gameobject` WHERE `guid` IN (66839, 68796, 49407, 609);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+3, 1, 'Silithus - West - Mountain Silversage', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(66839, @PTEMPLATE+3, 0, 'Mountain Silversage - Silithus - West', 0, 0, 10),
(68796, @PTEMPLATE+3, 0, 'Mountain Silversage - Silithus - West', 0, 0, 10),
(49407, @PTEMPLATE+3, 0, 'Mountain Silversage - Silithus - West', 0, 0, 10),
(609, @PTEMPLATE+3, 0, 'Mountain Silversage - Silithus - West', 0, 0, 10);

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- South West
DELETE FROM `pool_gameobject` WHERE `guid` IN (66838, 66843, 49408, 606);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+4, 1, 'Silithus - South West - Mountain Silversage', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(66838, @PTEMPLATE+4, 0, 'Mountain Silversage - Silithus - South West', 0, 0, 10),
(66843, @PTEMPLATE+4, 0, 'Mountain Silversage - Silithus - South West', 0, 0, 10),
(49408, @PTEMPLATE+4, 0, 'Mountain Silversage - Silithus - South West', 0, 0, 10),
(606, @PTEMPLATE+4, 0, 'Mountain Silversage - Silithus - South West', 0, 0, 10);

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- South
DELETE FROM `pool_gameobject` WHERE `guid` IN (16626, 68795, 49411, 605, 49409);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+5, 1, 'Silithus - South - Mountain Silversage', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(16626, @PTEMPLATE+5, 0, 'Mountain Silversage - Silithus - South', 0, 0, 10),
(68795, @PTEMPLATE+5, 0, 'Mountain Silversage - Silithus - South', 0, 0, 10),
(49411, @PTEMPLATE+5, 0, 'Mountain Silversage - Silithus - South', 0, 0, 10),
(605, @PTEMPLATE+5, 0, 'Mountain Silversage - Silithus - South', 0, 0, 10);

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- East
DELETE FROM `pool_gameobject` WHERE `guid` IN (66837, 49410, 604, 602);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+6, 1, 'Silithus - East - Mountain Silversage', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(66837, @PTEMPLATE+6, 0, 'Mountain Silversage - Silithus - East', 0, 0, 10),
(49410, @PTEMPLATE+6, 0, 'Mountain Silversage - Silithus - East', 0, 0, 10),
(604, @PTEMPLATE+6, 0, 'Mountain Silversage - Silithus - East', 0, 0, 10),
(602, @PTEMPLATE+6, 0, 'Mountain Silversage - Silithus - East', 0, 0, 10);

DELETE FROM `gameobject` WHERE `guid` = 49409;
DELETE FROM `pool_template` WHERE  `entry`=1222 AND `patch_min`=0 AND `patch_max`=10;

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
