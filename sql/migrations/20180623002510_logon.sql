DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180623002510');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180623002510');
-- Add your query below.

-- A unique identifier for bans
ALTER TABLE `account_banned` ADD COLUMN `banid` bigint UNIQUE NOT NULL AUTO_INCREMENT FIRST;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
