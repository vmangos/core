DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260508133031');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260508133031');
-- Add your query below.

SET @PTEMPLATE = 3603;

DELETE FROM `pool_template` WHERE `entry` = 1148;
DELETE FROM `pool_gameobject` WHERE `pool_entry` = 1148;


INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Grave Moss - Wetlands - Group 1 - Master', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES
(29128, @PTEMPLATE+1, 'Grave Moss - Wetlands - Group 1'),
(68704, @PTEMPLATE+1, 'Grave Moss - Wetlands - Group 1'),
(29124, @PTEMPLATE+1, 'Grave Moss - Wetlands - Group 1'),
(14662, @PTEMPLATE+1, 'Grave Moss - Wetlands - Group 1'),
(34110, @PTEMPLATE+1, 'Grave Moss - Wetlands - Group 1');


INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+2, 1, 'Grave Moss - Wetlands - Group 2 - Master', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES
(29127, @PTEMPLATE+2, 'Grave Moss - Wetlands - Group 2'),
(29125, @PTEMPLATE+2, 'Grave Moss - Wetlands - Group 2'),
(15015, @PTEMPLATE+2, 'Grave Moss - Wetlands - Group 2'),
(29126, @PTEMPLATE+2, 'Grave Moss - Wetlands - Group 2');

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
