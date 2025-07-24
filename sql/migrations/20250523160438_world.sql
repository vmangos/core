DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250523160438');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250523160438');
-- Add your query below.


-- Slim's Friend should be immune to Mind Control.
UPDATE `creature_template` SET `mechanic_immune_mask`=1 WHERE `entry`=4971;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
