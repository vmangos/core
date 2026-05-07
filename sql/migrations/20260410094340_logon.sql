DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260410094340');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260410094340');
-- Add your query below.


REPLACE INTO `allowed_clients` (`major_version`, `minor_version`, `bugfix_version`, `hotfix_version`, `build`, `os`, `platform`, `integrity_hash`) VALUES (1, 4, 2, '', 4375, 'Win', 'x86', '6D4E8CFD0C258708B0164C0EAD09482495E96FE2');
REPLACE INTO `allowed_clients` (`major_version`, `minor_version`, `bugfix_version`, `hotfix_version`, `build`, `os`, `platform`, `integrity_hash`) VALUES (1, 4, 2, '', 4375, 'OSX', 'x86', '');
REPLACE INTO `allowed_clients` (`major_version`, `minor_version`, `bugfix_version`, `hotfix_version`, `build`, `os`, `platform`, `integrity_hash`) VALUES (1, 4, 2, '', 4375, 'OSX', 'PPC', '');


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
