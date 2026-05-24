DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260109115717');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260109115717');
-- Add your query below.


INSERT INTO `allowed_clients` (`major_version`, `minor_version`, `bugfix_version`, `hotfix_version`, `build`, `os`, `platform`, `integrity_hash`) VALUES (1, 5, 2, '', 4467, 'Win', 'x86', '32D1EC5C6655A671C9B96058A0736543184CC2B3');
INSERT INTO `allowed_clients` (`major_version`, `minor_version`, `bugfix_version`, `hotfix_version`, `build`, `os`, `platform`, `integrity_hash`) VALUES (1, 5, 2, '', 4467, 'OSX', 'x86', '');
INSERT INTO `allowed_clients` (`major_version`, `minor_version`, `bugfix_version`, `hotfix_version`, `build`, `os`, `platform`, `integrity_hash`) VALUES (1, 5, 2, '', 4467, 'OSX', 'PPC', '');
INSERT INTO `allowed_clients` (`major_version`, `minor_version`, `bugfix_version`, `hotfix_version`, `build`, `os`, `platform`, `integrity_hash`) VALUES (1, 5, 1, '', 4449, 'Win', 'x86', '2CF01440DDF16A7C77D734FFDFFB07573183EA4A');
INSERT INTO `allowed_clients` (`major_version`, `minor_version`, `bugfix_version`, `hotfix_version`, `build`, `os`, `platform`, `integrity_hash`) VALUES (1, 5, 1, '', 4449, 'OSX', 'x86', '');
INSERT INTO `allowed_clients` (`major_version`, `minor_version`, `bugfix_version`, `hotfix_version`, `build`, `os`, `platform`, `integrity_hash`) VALUES (1, 5, 1, '', 4449, 'OSX', 'PPC', '');


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
