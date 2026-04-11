DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260411162511');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260411162511');
-- Add your query below.

SET @PTEMPLATE = 4348;
DELETE FROM `pool_template` WHERE `entry` = 1216;
DELETE FROM `pool_gameobject` WHERE `pool_entry` = 1216;

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Blindweed - Un\'Goro Crater - Group 1 - Master', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES
(16323, @PTEMPLATE+1, 'Blindweed - Un\'Goro Crater - Group 1'),
(16329, @PTEMPLATE+1, 'Blindweed - Un\'Goro Crater - Group 1'),
(16392, @PTEMPLATE+1, 'Blindweed - Un\'Goro Crater - Group 1'),
(16396, @PTEMPLATE+1, 'Blindweed - Un\'Goro Crater - Group 1'),
(17591, @PTEMPLATE+1, 'Blindweed - Un\'Goro Crater - Group 1');

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+2, 1, 'Blindweed - Un\'Goro Crater - Group 2 - Master', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES
(16303, @PTEMPLATE+2, 'Blindweed - Un\'Goro Crater - Group 2'),
(16378, @PTEMPLATE+2, 'Blindweed - Un\'Goro Crater - Group 2'),
(17590, @PTEMPLATE+2, 'Blindweed - Un\'Goro Crater - Group 2'),
(22186, @PTEMPLATE+2, 'Blindweed - Un\'Goro Crater - Group 2'),
(22187, @PTEMPLATE+2, 'Blindweed - Un\'Goro Crater - Group 2'),
(68348, @PTEMPLATE+2, 'Blindweed - Un\'Goro Crater - Group 2');

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
