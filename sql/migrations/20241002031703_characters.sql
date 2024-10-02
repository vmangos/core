DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20241002031703');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20241002031703');
-- Add your query below.


-- Add instance id player logged out inside of to characters table to prevent exploits.
ALTER TABLE `characters`
	ADD COLUMN `instance_id` INT(11) UNSIGNED NOT NULL DEFAULT '0' AFTER `map`;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
