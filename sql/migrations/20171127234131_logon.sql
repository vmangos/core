DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171127234131');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171127234131');
-- Add your query below.


ALTER TABLE `uptime`
	ADD COLUMN `onlineplayers` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0' AFTER `uptime`;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
