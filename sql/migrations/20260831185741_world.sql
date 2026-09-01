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


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
