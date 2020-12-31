DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200202140333');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200202140333');
-- Add your query below.


ALTER TABLE `broadcast_text`
	CHANGE COLUMN `ID` `entry` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' FIRST,
	CHANGE COLUMN `MaleText` `male_text` LONGTEXT NULL AFTER `entry`,
	CHANGE COLUMN `FemaleText` `female_text` LONGTEXT NULL AFTER `male_text`,
	CHANGE COLUMN `Type` `chat_type` TINYINT UNSIGNED NOT NULL DEFAULT '0' AFTER `female_text`,
	CHANGE COLUMN `Sound` `sound_id` SMALLINT UNSIGNED NOT NULL DEFAULT '0' AFTER `chat_type`,
	CHANGE COLUMN `Language` `language_id` TINYINT UNSIGNED NOT NULL DEFAULT '0' AFTER `sound_id`,
	CHANGE COLUMN `EmoteId0` `emote_id1` SMALLINT UNSIGNED NOT NULL DEFAULT '0' AFTER `language_id`,
	CHANGE COLUMN `EmoteId1` `emote_id2` SMALLINT UNSIGNED NOT NULL DEFAULT '0' AFTER `emote_id1`,
	CHANGE COLUMN `EmoteId2` `emote_id3` SMALLINT UNSIGNED NOT NULL DEFAULT '0' AFTER `emote_id2`,
	CHANGE COLUMN `EmoteDelay0` `emote_delay1` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `emote_id3`,
	CHANGE COLUMN `EmoteDelay1` `emote_delay2` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `emote_delay1`,
	CHANGE COLUMN `EmoteDelay2` `emote_delay3` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `emote_delay2`;

ALTER TABLE `locales_broadcast_text`
	CHANGE COLUMN `MaleText_loc1` `male_text_loc1` LONGTEXT NULL AFTER `ID`,
	CHANGE COLUMN `MaleText_loc2` `male_text_loc2` LONGTEXT NULL AFTER `male_text_loc1`,
	CHANGE COLUMN `MaleText_loc3` `male_text_loc3` LONGTEXT NULL AFTER `male_text_loc2`,
	CHANGE COLUMN `MaleText_loc4` `male_text_loc4` LONGTEXT NULL AFTER `male_text_loc3`,
	CHANGE COLUMN `MaleText_loc5` `male_text_loc5` LONGTEXT NULL AFTER `male_text_loc4`,
	CHANGE COLUMN `MaleText_loc6` `male_text_loc6` LONGTEXT NULL AFTER `male_text_loc5`,
	CHANGE COLUMN `MaleText_loc7` `male_text_loc7` LONGTEXT NULL AFTER `male_text_loc6`,
	CHANGE COLUMN `MaleText_loc8` `male_text_loc8` LONGTEXT NULL AFTER `male_text_loc7`,
	CHANGE COLUMN `FemaleText_loc1` `female_text_loc1` LONGTEXT NULL AFTER `male_text_loc8`,
	CHANGE COLUMN `FemaleText_loc2` `female_text_loc2` LONGTEXT NULL AFTER `female_text_loc1`,
	CHANGE COLUMN `FemaleText_loc3` `female_text_loc3` LONGTEXT NULL AFTER `female_text_loc2`,
	CHANGE COLUMN `FemaleText_loc4` `female_text_loc4` LONGTEXT NULL AFTER `female_text_loc3`,
	CHANGE COLUMN `FemaleText_loc5` `female_text_loc5` LONGTEXT NULL AFTER `female_text_loc4`,
	CHANGE COLUMN `FemaleText_loc6` `female_text_loc6` LONGTEXT NULL AFTER `female_text_loc5`,
	CHANGE COLUMN `FemaleText_loc7` `female_text_loc7` LONGTEXT NULL AFTER `female_text_loc6`,
	CHANGE COLUMN `FemaleText_loc8` `female_text_loc8` LONGTEXT NULL AFTER `female_text_loc7`,
	DROP COLUMN `VerifiedBuild`;

ALTER TABLE `locales_broadcast_text`
	CHANGE COLUMN `ID` `entry` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' FIRST;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
