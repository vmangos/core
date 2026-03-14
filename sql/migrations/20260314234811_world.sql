DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260314234811');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260314234811');
-- Add your query below.

UPDATE `creature_template` SET `patch`=0 WHERE  `entry`=15803 AND `patch`=7;

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
