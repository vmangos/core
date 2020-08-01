DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200801082003');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200801082003');
-- Add your query below.

ALTER TABLE `characters` DROP COLUMN IF EXISTS `city_protector`;
ALTER TABLE `characters` DROP COLUMN IF EXISTS `customflags`;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
