DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260412104728');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260412104728');
-- Add your query below.

UPDATE `pool_template` SET `description`='Gromsblood - Blasted Lands - Group 1 - Master' WHERE `entry` = 3663;
UPDATE `pool_gameobject` SET `description`='Gromsblood - Blasted Lands - Group 1' WHERE `pool_entry` = 3663;

UPDATE `pool_template` SET `description`='Gromsblood - Blasted Lands - Group 2 - Master' WHERE `entry` = 3664;
UPDATE `pool_gameobject` SET `description`='Gromsblood - Blasted Lands - Group 2' WHERE `pool_entry` = 3664;

UPDATE `pool_template` SET `description`='Gromsblood - Blasted Lands - Group 3 - Master' WHERE `entry` = 3665;
UPDATE `pool_gameobject` SET `description`='Gromsblood - Blasted Lands - Group 3' WHERE `pool_entry` = 3665;

UPDATE `pool_template` SET `description`='Gromsblood - Blasted Lands - Group 4 - Master' WHERE `entry` = 3666;
UPDATE `pool_gameobject` SET `description`='Gromsblood - Blasted Lands - Group 4' WHERE `pool_entry` = 3666;

UPDATE `pool_template` SET `description`='Gromsblood - Blasted Lands - Group 5 - Master' WHERE `entry` = 3667;
UPDATE `pool_gameobject` SET `description`='Gromsblood - Blasted Lands - Group 5' WHERE `pool_entry` = 3667;

UPDATE `pool_template` SET `description`='Gromsblood - Blasted Lands - Group 6 - Master' WHERE `entry` = 3668;
UPDATE `pool_gameobject` SET `description`='Gromsblood - Blasted Lands - Group 6' WHERE `pool_entry` = 3668;

UPDATE `pool_template` SET `description`='Sungrass - Blasted Lands - Group 1 - Master' WHERE `entry` = 4085;
UPDATE `pool_gameobject` SET `description`='Sungrass - Blasted Lands - Group 1' WHERE `pool_entry` = 4085;

UPDATE `pool_template` SET `description`='Sungrass - Blasted Lands - Group 2 - Master' WHERE `entry` = 4086;
UPDATE `pool_gameobject` SET `description`='Sungrass - Blasted Lands - Group 2' WHERE `pool_entry` = 4086;

UPDATE `pool_template` SET `description`='Sungrass - Blasted Lands - Group 3 - Master' WHERE `entry` = 4087;
UPDATE `pool_gameobject` SET `description`='Sungrass - Blasted Lands - Group 3' WHERE `pool_entry` = 4087;

UPDATE `pool_template` SET `description`='Sungrass - Blasted Lands - Group 4 - Master' WHERE `entry` = 4088;
UPDATE `pool_gameobject` SET `description`='Sungrass - Blasted Lands - Group 4' WHERE `pool_entry` = 4088;

UPDATE `pool_template` SET `description`='Firebloom - Blasted Lands - Group 1 - Master' WHERE `entry` = 5153;
UPDATE `pool_gameobject` SET `description`='Firebloom - Blasted Lands - Group 1' WHERE `pool_entry` = 5153;

UPDATE `pool_template` SET `description`='Firebloom - Blasted Lands - Group 2 - Master' WHERE `entry` = 5154;
UPDATE `pool_gameobject` SET `description`='Firebloom - Blasted Lands - Group 2' WHERE `pool_entry` = 5154;

UPDATE `pool_template` SET `description`='Firebloom - Blasted Lands - Group 3 - Master' WHERE `entry` = 5155;
UPDATE `pool_gameobject` SET `description`='Firebloom - Blasted Lands - Group 3' WHERE `pool_entry` = 5155;

UPDATE `pool_template` SET `description`='Firebloom - Blasted Lands - Group 4 - Master' WHERE `entry` = 5156;
UPDATE `pool_gameobject` SET `description`='Firebloom - Blasted Lands - Group 4' WHERE `pool_entry` = 5156;

SET @PTEMPLATE = 3601;

DELETE FROM `pool_template` WHERE `entry` = 57;
DELETE FROM `pool_gameobject` WHERE `pool_entry` = 57;
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Solid Chest (153451) - Blasted Lands - Group 1 - Master', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES
(32134, @PTEMPLATE+1, 'Solid Chest (153451) - Blasted Lands - Group 1'),
(32510, @PTEMPLATE+1, 'Solid Chest (153451) - Blasted Lands - Group 1'),
(32514, @PTEMPLATE+1, 'Solid Chest (153451) - Blasted Lands - Group 1');

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+2, 1, 'Solid Chest (153451) - Blasted Lands - Group 2 - Master', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES
(42439, @PTEMPLATE+2, 'Solid Chest (153451) - Blasted Lands - Group 2'),
(42445, @PTEMPLATE+2, 'Solid Chest (153451) - Blasted Lands - Group 2'),
(42444, @PTEMPLATE+2, 'Solid Chest (153451) - Blasted Lands - Group 2');

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
