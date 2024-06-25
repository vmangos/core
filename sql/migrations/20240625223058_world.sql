DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20240625223058');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20240625223058');
-- Add your query below.


-- Stratholme door check fails before 1.11.
UPDATE `warden_scans` SET `build_min`=5464 WHERE `id`=74;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
