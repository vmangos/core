DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250313124002');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250313124002');
-- Add your query below.

-- AQ40
DELETE FROM `script_texts` WHERE `entry` = -1531041; -- %s begins to slow!
DELETE FROM `script_texts` WHERE `entry` = -1531042; -- %s is freezing up!
DELETE FROM `script_texts` WHERE `entry` = -1531043; -- %s is frozen solid!
DELETE FROM `script_texts` WHERE `entry` = -1531044; -- %s begins to crack!
DELETE FROM `script_texts` WHERE `entry` = -1531045; -- %s looks ready to shatter!

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
