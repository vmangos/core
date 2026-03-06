DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260304020200');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260304020200');
-- Add your query below.

-- Source: mod-playerbots-wotlk/data/sql/world/base/emotetextsound_dbc.sql

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
