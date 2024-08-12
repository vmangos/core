DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20240320190940');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20240320190940');
-- Add your query below.


-- Make these fields unsigned.
ALTER TABLE `creature_template`
	CHANGE COLUMN `pet_family` `pet_family` TINYINT(4) UNSIGNED NOT NULL DEFAULT '0' AFTER `unit_flags`,
	CHANGE COLUMN `trainer_type` `trainer_type` TINYINT(4) UNSIGNED NOT NULL DEFAULT '0' AFTER `pet_family`;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
