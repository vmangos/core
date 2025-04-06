DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250224143004');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250224143004');
-- Add your query below.

UPDATE `creature` SET `wander_distance` = 1.15, `movement_type` = 1 WHERE `guid` = 38291;

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
