DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20251226201935');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20251226201935');
-- Add your query below.


-- Dark Iron Land Mines should not move.
UPDATE `creature_template` SET `movement_type` = 0 WHERE `entry` = 8035;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
