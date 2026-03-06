DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='202411250000');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('202411250000');
-- Add your query below.

-- Source: mod-playerbots-wotlk/data/sql/playerbots/updates/2024_11_25_00.sql
SET SESSION sql_mode=(SELECT REPLACE(@@SESSION.sql_mode,'NO_BACKSLASH_ESCAPES',''));

UPDATE `updates_include`
SET `path` = '$/data/sql/playerbots/updates'
WHERE `state` = 'RELEASED';

UPDATE `updates_include`
SET `path` = '$/data/sql/playerbots/custom'
WHERE `state` = 'CUSTOM';

UPDATE `updates_include`
SET `path` = '$/data/sql/playerbots/archive'
WHERE `state` = 'ARCHIVED';

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
