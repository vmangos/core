DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20231113010252');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20231113010252');
-- Add your query below.


-- Change order of creature template columns, so we don't have to scroll to see name.
ALTER TABLE `creature_template`
	CHANGE COLUMN `name` `name` CHAR(100) NOT NULL DEFAULT '0' AFTER `patch`,
	CHANGE COLUMN `subname` `subname` CHAR(100) NULL DEFAULT NULL AFTER `name`,
	CHANGE COLUMN `level_min` `level_min` TINYINT(3) UNSIGNED NOT NULL DEFAULT '1' AFTER `subname`,
	CHANGE COLUMN `level_max` `level_max` TINYINT(3) UNSIGNED NOT NULL DEFAULT '1' AFTER `level_min`,
	CHANGE COLUMN `faction` `faction` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0' AFTER `level_max`,
	CHANGE COLUMN `npc_flags` `npc_flags` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `faction`,
	CHANGE COLUMN `gossip_menu_id` `gossip_menu_id` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `npc_flags`;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
