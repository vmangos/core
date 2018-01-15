DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171219071309');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171219071309');
-- Add your query below.

ALTER TABLE `petition` ADD COLUMN `charterguid` int unsigned UNIQUE COMMENT 'Charter item GUID' AFTER `petitionguid`;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
