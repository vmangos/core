DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260301153517');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260301153517');
-- Add your query below.

-- Pool Sungrass in Silithus
SET @PTEMPLATE = 3545;
-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Hive\'Zora
DELETE FROM `pool_gameobject` WHERE `guid` IN (68912, 52644, 52641, 52643);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Silithus - Hive\'Zora - Sungrass', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(68912, @PTEMPLATE+1, 0, 'Sungrass - Silithus - Hive\'Zora', 0, 0, 10),
(52644, @PTEMPLATE+1, 0, 'Sungrass - Silithus - Hive\'Zora', 0, 0, 10),
(52641, @PTEMPLATE+1, 0, 'Sungrass - Silithus - Hive\'Zora', 0, 0, 10),
(52643, @PTEMPLATE+1, 0, 'Sungrass - Silithus - Hive\'Zora', 0, 0, 10);

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Cenarion Hold
DELETE FROM `pool_gameobject` WHERE `guid` IN (52645, 13691, 52646, 598);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+2, 1, 'Silithus - Cenarion Hold - Sungrass', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(52645, @PTEMPLATE+2, 0, 'Sungrass - Silithus - Cenarion Hold', 0, 0, 10),
(13691, @PTEMPLATE+2, 0, 'Sungrass - Silithus - Cenarion Hold', 0, 0, 10),
(52646, @PTEMPLATE+2, 0, 'Sungrass - Silithus - Cenarion Hold', 0, 0, 10),
(598, @PTEMPLATE+2, 0, 'Sungrass - Silithus - Cenarion Hold', 0, 0, 10);

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Staghelm Point
DELETE FROM `pool_gameobject` WHERE `guid` IN (52642, 52640, 52639, 599);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+3, 1, 'Silithus - Staghelm Point - Sungrass', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(52642, @PTEMPLATE+3, 0, 'Sungrass - Silithus - Staghelm Point', 0, 0, 10),
(52640, @PTEMPLATE+3, 0, 'Sungrass - Silithus - Staghelm Point', 0, 0, 10),
(52639, @PTEMPLATE+3, 0, 'Sungrass - Silithus - Staghelm Point', 0, 0, 10),
(599, @PTEMPLATE+3, 0, 'Sungrass - Silithus - Staghelm Point', 0, 0, 10);

DELETE FROM `pool_template` WHERE  `entry`=1223 AND `patch_min`=0 AND `patch_max`=10;

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
