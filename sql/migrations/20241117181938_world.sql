DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20241117181938');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20241117181938');
-- Add your query below.


-- Add script name column.
ALTER TABLE `spell_template`
	ADD COLUMN `script_name` VARCHAR(64) NOT NULL DEFAULT '' AFTER `customFlags`;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
