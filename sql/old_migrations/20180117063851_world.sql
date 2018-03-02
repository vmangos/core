DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180117063851');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180117063851');
-- Add your query below.

-- Ossirian the Unscarred base Arcane Resistance, min/max damage values (2.4*curr)
UPDATE `creature_template` SET `mindmg` = 4046.4, `maxdmg` = 4466.4, `resistance6` = 1000 WHERE `entry` = 15339;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
