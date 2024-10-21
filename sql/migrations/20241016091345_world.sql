DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20241016091345');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20241016091345');
-- Add your query below.

UPDATE `game_tele` SET `name` = 'LordamereLake' WHERE `id` = 745;

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
