DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20241108102245');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20241108102245');
-- Add your query below.

-- Moved to characters db (world_persistent_variables)
DROP TABLE IF EXISTS `variables`;

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
