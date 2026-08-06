DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260525000939');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260525000939');
-- Add your query below.


UPDATE `pool_gameobject` SET `patch_max` = 8 WHERE `guid` = 1034;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
