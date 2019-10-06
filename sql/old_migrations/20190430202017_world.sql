DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190430202017');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190430202017');
-- Add your query below.


-- Map id should be int not float.
ALTER TABLE `areatrigger_bg_entrance`
	CHANGE COLUMN `exit_map` `exit_map` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0' AFTER `bg_template`;
    
-- Remove unused field.
ALTER TABLE `areatrigger_teleport`
	DROP COLUMN `required_failed_text`;
    
-- Change some fields to unsigned.
ALTER TABLE `area_template`
	CHANGE COLUMN `entry` `entry` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' FIRST,
	CHANGE COLUMN `map_id` `map_id` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `entry`,
	CHANGE COLUMN `zone_id` `zone_id` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `map_id`,
	CHANGE COLUMN `explore_flag` `explore_flag` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `zone_id`,
	CHANGE COLUMN `flags` `flags` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `explore_flag`,
	CHANGE COLUMN `team` `team` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' AFTER `name`,
	CHANGE COLUMN `liquid_type` `liquid_type` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' AFTER `team`;
    
-- Change all fields to unsigned.
ALTER TABLE `auctionhousebot`
	CHANGE COLUMN `item` `item` INT(11) UNSIGNED NOT NULL COMMENT 'Item Id' FIRST,
	CHANGE COLUMN `stack` `stack` TINYINT(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Stack Size' AFTER `item`,
	CHANGE COLUMN `bid` `bid` INT(11) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Bid Price' AFTER `stack`,
	CHANGE COLUMN `buyout` `buyout` INT(11) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Buyout Price' AFTER `bid`;

-- Change delay field to unsigned.
ALTER TABLE `autobroadcast`
	CHANGE COLUMN `delay` `delay` INT(11) UNSIGNED NULL DEFAULT NULL FIRST;

-- Rename the comments filed to comment.
ALTER TABLE `autobroadcast`
	CHANGE COLUMN `comments` `comment` VARCHAR(255) NULL DEFAULT NULL AFTER `string_id`;
    
-- Change map field to unsigned.
ALTER TABLE `battleground_events`
	CHANGE COLUMN `map` `map` SMALLINT(5) UNSIGNED NOT NULL FIRST;

-- Change cinematic and timer fields to unsigned.
ALTER TABLE `cinematic_waypoints`
	CHANGE COLUMN `cinematic` `cinematic` INT(11) UNSIGNED NULL DEFAULT '0' FIRST,
	CHANGE COLUMN `timer` `timer` INT(11) UNSIGNED NULL DEFAULT '0' AFTER `cinematic`;

    
-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
