DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250303170125');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250303170125');
-- Add your query below.

-- Spell script for Tonk Control Console (24934)
UPDATE `spell_template` SET `script_name`='spell_darkmoon_steam_tonk_control_console' WHERE `entry`=24934;

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
