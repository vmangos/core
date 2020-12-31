DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200225211912');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200225211912');
-- Add your query below.

ALTER TABLE `autobroadcast` DROP COLUMN `delay`;
ALTER TABLE `autobroadcast` DROP COLUMN `comment`;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
