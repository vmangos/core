DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20241114131912');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20241114131912');
-- Add your query below.


ALTER TABLE `characters`
	CHANGE COLUMN `instance_id` `instance` INT(11) UNSIGNED NOT NULL DEFAULT '0' AFTER `map`;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
