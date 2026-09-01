DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260831185741');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260831185741');
-- Add your query below.


-- Fix Snowfall Banner not working.
UPDATE `spell_template` SET `script_name`='spell_battleground_banner_trigger' WHERE `entry`=24677;

-- Use script instead of overwritting data for AB banners too.
UPDATE `spell_template` SET `script_name`='spell_battleground_banner_trigger' WHERE `entry` IN (23932, 23935, 23936, 23937, 23938);
UPDATE `gameobject_template` SET `data16`=0 WHERE `entry` IN (180087, 180088, 180089, 180090, 180091);

-- Ossirian Crystal
UPDATE `gameobject_template` SET `data16`=0 WHERE `entry`=180619;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
