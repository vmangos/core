DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='202502240000');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('202502240000');
-- Add your query below.

-- Source: mod-playerbots-wotlk/data/sql/playerbots/updates/2025_02_24_00.sql
SET SESSION sql_mode=(SELECT REPLACE(@@SESSION.sql_mode,'NO_BACKSLASH_ESCAPES',''));

-- Update max_level for TBC Heroic dungeons in `playerbots_dungeon_suggestion_definition`
UPDATE `playerbots_dungeon_suggestion_definition`
SET `max_level` = 73
WHERE `id` IN (40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56);

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
