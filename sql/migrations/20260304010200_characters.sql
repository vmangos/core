DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260304010200');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260304010200');
-- Add your query below.

-- Source: mod-playerbots-wotlk/data/sql/characters/base/playerbots_guild_names.sql

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
