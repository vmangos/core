DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200731014220');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200731014220');
-- Add your query below.

ALTER TABLE `characters` ADD `city_protector` TINYINT(3) NOT NULL DEFAULT '0' AFTER `world_phase_mask`;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
