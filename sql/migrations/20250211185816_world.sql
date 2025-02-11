DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250211185816');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250211185816');
-- Add your query below.

UPDATE `creature` SET `position_x` = 2253.341, `position_y` = 270.2201, `position_z` = 34.4887, `orientation` = 2.509722 WHERE `guid` = 38291;

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
