DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20241207051041');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20241207051041');
-- Add your query below.


-- AQ Door was added in patch 1.9.
UPDATE `warden_scans` SET `build_min`=5086 WHERE `id`=77;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
