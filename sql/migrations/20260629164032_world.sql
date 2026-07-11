DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260629164032');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260629164032');
-- Add your query below.

UPDATE `creature` SET `mana_percent` = 100 WHERE `id` IN (6379, 193, 6135, 8555);
UPDATE `creature_ai_scripts` SET `delay` = 0 WHERE `id` = 1074101;

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
