DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20181108192531');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20181108192531');
-- Add your query below.


-- These tables are empty. It's a TBC feature.
DROP TABLE `skill_discovery_template`;
DROP TABLE `skill_extra_item_template`;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
