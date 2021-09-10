DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210909163207');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210909163207');
-- Add your query below.

ALTER TABLE `characters`
	ADD COLUMN `xp_rate` FLOAT DEFAULT '-1.0' AFTER `xp`;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
