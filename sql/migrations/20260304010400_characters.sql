DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260304010400');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260304010400');
-- Add your query below.

UPDATE guild
SET
	emblem_style     = FLOOR(RAND() * 181),
	emblem_color     = FLOOR(RAND() * 18),
	border_style     = FLOOR(RAND() * 8),
	border_color     = FLOOR(RAND() * 18),
	background_color = FLOOR(RAND() * 52)
WHERE emblem_style=0 AND emblem_color=0 AND border_style=0 AND border_color=0 AND background_color=0;

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
