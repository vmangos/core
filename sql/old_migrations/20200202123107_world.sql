DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200202123107');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200202123107');
-- Add your query below.


ALTER TABLE `creature_model_info`
	COMMENT='Creature System (display id related info)',
	CHANGE COLUMN `modelid` `display_id` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' FIRST,
	CHANGE COLUMN `modelid_other_gender` `display_id_other_gender` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `gender`,
	DROP COLUMN `modelid_other_team`;

RENAME TABLE `creature_model_info` TO `creature_display_info_addon`;

ALTER TABLE `game_event_creature_data`
	CHANGE COLUMN `modelid` `display_id` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `entry_id`;

ALTER TABLE `creature`
	CHANGE COLUMN `modelid` `display_id` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `map`;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
