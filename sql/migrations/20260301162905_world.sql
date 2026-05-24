DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260301162905');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260301162905');
-- Add your query below.

-- Pool Golden Sansam in Silithus
SET @PTEMPLATE = 3729;
-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Group 1
DELETE FROM `pool_gameobject` WHERE `guid` IN (49399, 68695, 30460, 66965);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Silithus - Group 1 - Golden Sansam', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(49399, @PTEMPLATE+1, 0, 'Golden Sansam - Silithus - Group 1', 0, 0, 10),
(68695, @PTEMPLATE+1, 0, 'Golden Sansam - Silithus - Group 1', 0, 0, 10),
(30460, @PTEMPLATE+1, 0, 'Golden Sansam - Silithus - Group 1', 0, 0, 10),
(66965, @PTEMPLATE+1, 0, 'Golden Sansam - Silithus - Group 1', 0, 0, 10);

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Group 2
DELETE FROM `pool_gameobject` WHERE `guid` IN (30457, 30455, 68696, 49398);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+2, 1, 'Silithus - Group 2 - Golden Sansam', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(30457, @PTEMPLATE+2, 0, 'Golden Sansam - Silithus - Group 2', 0, 0, 10),
(30455, @PTEMPLATE+2, 0, 'Golden Sansam - Silithus - Group 2', 0, 0, 10),
(68696, @PTEMPLATE+2, 0, 'Golden Sansam - Silithus - Group 2', 0, 0, 10),
(49398, @PTEMPLATE+2, 0, 'Golden Sansam - Silithus - Group 2', 0, 0, 10);

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Group 3
DELETE FROM `pool_gameobject` WHERE `guid` IN (30458, 30456, 49397, 591);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+3, 1, 'Silithus - Group 3 - Golden Sansam', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(30458, @PTEMPLATE+3, 0, 'Golden Sansam - Silithus - Group 3', 0, 0, 10),
(30456, @PTEMPLATE+3, 0, 'Golden Sansam - Silithus - Group 3', 0, 0, 10),
(49397, @PTEMPLATE+3, 0, 'Golden Sansam - Silithus - Group 3', 0, 0, 10),
(591, @PTEMPLATE+3, 0, 'Golden Sansam - Silithus - Group 3', 0, 0, 10);

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Group 4
DELETE FROM `pool_gameobject` WHERE `guid` IN (68697, 30461, 30454, 49400);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+4, 1, 'Silithus - Group 4 - Golden Sansam', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(68697, @PTEMPLATE+4, 0, 'Golden Sansam - Silithus - Group 4', 0, 0, 10),
(30461, @PTEMPLATE+4, 0, 'Golden Sansam - Silithus - Group 4', 0, 0, 10),
(30454, @PTEMPLATE+4, 0, 'Golden Sansam - Silithus - Group 4', 0, 0, 10),
(49400, @PTEMPLATE+4, 0, 'Golden Sansam - Silithus - Group 4', 0, 0, 10);


DELETE FROM `pool_template` WHERE  `entry`=1224 AND `patch_min`=0 AND `patch_max`=10;

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
