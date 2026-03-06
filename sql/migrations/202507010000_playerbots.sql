DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='202507010000');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('202507010000');
-- Add your query below.

-- Source: mod-playerbots-wotlk/data/sql/playerbots/updates/2025_07_01_00_account_type.sql
SET SESSION sql_mode=(SELECT REPLACE(@@SESSION.sql_mode,'NO_BACKSLASH_ESCAPES',''));

-- Create playerbots_account_type table for tracking accounts assignments
DROP TABLE IF EXISTS `playerbots_account_type`;
CREATE TABLE `playerbots_account_type` (
    `account_id` int unsigned NOT NULL,
    `account_type` tinyint unsigned NOT NULL DEFAULT 0 COMMENT '0 = unassigned, 1 = RNDbot, 2 = AddClass',
    `assignment_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Playerbot account type assignments';

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
