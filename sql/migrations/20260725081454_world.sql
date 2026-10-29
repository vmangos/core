DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260725081454');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260725081454');
-- Add your query below.

UPDATE `locales_quest` SET `Title_loc1` = '윙윙상자 827' WHERE `entry` = 983;
UPDATE `locales_quest` SET `Title_loc1` = '윙윙상자 411' WHERE `entry` = 1001;
UPDATE `locales_quest` SET `Title_loc1` = '윙윙상자 323' WHERE `entry` = 1002;
UPDATE `locales_quest` SET `Title_loc1` = '윙윙상자 525' WHERE `entry` = 1003;

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
