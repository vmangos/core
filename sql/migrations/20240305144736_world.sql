DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20240305144736');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20240305144736');
-- Add your query below.


ALTER TABLE `locales_faction`
      ADD COLUMN `name_loc7` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' AFTER `name_loc6`,
      ADD COLUMN `name_loc8` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' AFTER `name_loc7`,
      ADD COLUMN `description_loc7` varchar(512) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' AFTER `description_loc6`,
      ADD COLUMN `description_loc8` varchar(512) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' AFTER `description_loc7`;

ALTER TABLE `locales_spell`
      ADD COLUMN `name_loc7` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' AFTER `name_loc6`,
      ADD COLUMN `name_loc8` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' AFTER `name_loc7`,
      ADD COLUMN `nameSubtext_loc7` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' AFTER `nameSubtext_loc6`,
      ADD COLUMN `nameSubtext_loc8` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' AFTER `nameSubtext_loc7`,
      ADD COLUMN `description_loc7` varchar(1024) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' AFTER `description_loc6`,
      ADD COLUMN `description_loc8` varchar(1024) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' AFTER `description_loc7`,
      ADD COLUMN `auraDescription_loc7` varchar(512) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' AFTER `auraDescription_loc6`,
      ADD COLUMN `auraDescription_loc8` varchar(512) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' AFTER `auraDescription_loc7`;

ALTER TABLE `locales_taxi_node`
      ADD COLUMN `name_loc7` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' AFTER `name_loc6`,
      ADD COLUMN `name_loc8` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' AFTER `name_loc7`;

ALTER TABLE `mail_text_template`
      ADD COLUMN `content_loc8` text AFTER `content_loc7`;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
