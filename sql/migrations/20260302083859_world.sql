DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260302083859');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260302083859');
-- Add your query below.

-- Pool Firebloom in Blasted Lands
SET @PTEMPLATE = 5152;
-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Group 1
DELETE FROM `pool_gameobject` WHERE `guid` IN (12316, 55465, 55471, 55470, 12278);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Blasted Lands - Group 1 - Firebloom', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(12316, @PTEMPLATE+1, 0, 'Firebloom - Blasted Lands - Group 1', 0, 0, 10),
(55465, @PTEMPLATE+1, 0, 'Firebloom - Blasted Lands - Group 1', 0, 0, 10),
(55471, @PTEMPLATE+1, 0, 'Firebloom - Blasted Lands - Group 1', 0, 0, 10),
(55470, @PTEMPLATE+1, 0, 'Firebloom - Blasted Lands - Group 1', 0, 0, 10),
(12278, @PTEMPLATE+1, 0, 'Firebloom - Blasted Lands - Group 1', 0, 0, 10);

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Group 2
DELETE FROM `pool_gameobject` WHERE `guid` IN (55468, 68622, 55464, 32308, 32105);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+2, 1, 'Blasted Lands - Group 2 - Firebloom', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(55468, @PTEMPLATE+2, 0, 'Firebloom - Blasted Lands - Group 2', 0, 0, 10),
(68622, @PTEMPLATE+2, 0, 'Firebloom - Blasted Lands - Group 2', 0, 0, 10),
(55464, @PTEMPLATE+2, 0, 'Firebloom - Blasted Lands - Group 2', 0, 0, 10),
(32308, @PTEMPLATE+2, 0, 'Firebloom - Blasted Lands - Group 2', 0, 0, 10),
(32105, @PTEMPLATE+2, 0, 'Firebloom - Blasted Lands - Group 2', 0, 0, 10);

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Group 3
DELETE FROM `pool_gameobject` WHERE `guid` IN (32104, 29685, 32303, 32760, 55467);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+3, 1, 'Blasted Lands - Group 3 - Firebloom', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(32104, @PTEMPLATE+3, 0, 'Firebloom - Blasted Lands - Group 3', 0, 0, 10),
(29685, @PTEMPLATE+3, 0, 'Firebloom - Blasted Lands - Group 3', 0, 0, 10),
(32303, @PTEMPLATE+3, 0, 'Firebloom - Blasted Lands - Group 3', 0, 0, 10),
(32760, @PTEMPLATE+3, 0, 'Firebloom - Blasted Lands - Group 3', 0, 0, 10),
(55467, @PTEMPLATE+3, 0, 'Firebloom - Blasted Lands - Group 3', 0, 0, 10);

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Group 4
DELETE FROM `pool_gameobject` WHERE `guid` IN (29683, 55469, 32102, 32360, 55466);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+4, 1, 'Blasted Lands - Group 4 - Firebloom', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(29683, @PTEMPLATE+4, 0, 'Firebloom - Blasted Lands - Group 4', 0, 0, 10),
(55469, @PTEMPLATE+4, 0, 'Firebloom - Blasted Lands - Group 4', 0, 0, 10),
(32102, @PTEMPLATE+4, 0, 'Firebloom - Blasted Lands - Group 4', 0, 0, 10),
(32360, @PTEMPLATE+4, 0, 'Firebloom - Blasted Lands - Group 4', 0, 0, 10),
(55466, @PTEMPLATE+4, 0, 'Firebloom - Blasted Lands - Group 4', 0, 0, 10);

DELETE FROM `pool_template` WHERE  `entry`=1276 AND `patch_min`=0 AND `patch_max`=10;




-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
