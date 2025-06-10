DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250520041627');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250520041627');
-- Add your query below.


UPDATE `spell_template` SET `script_name`='spell_warlock_create_healthstone' WHERE `entry` IN (5699, 6201, 6202, 11729, 11730);


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
