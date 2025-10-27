DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250308172541');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250308172541');
-- Add your query below.

UPDATE `spell_template` SET `script_name` = "spell_heavy_armor_kit" WHERE `entry` = 2833 AND `build` = 4695;

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
