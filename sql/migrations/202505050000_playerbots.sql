DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='202505050000');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('202505050000');
-- Add your query below.

-- Source: mod-playerbots-wotlk/data/sql/playerbots/updates/2025_05_05_00_accountlinking.sql
SET SESSION sql_mode=(SELECT REPLACE(@@SESSION.sql_mode,'NO_BACKSLASH_ESCAPES',''));

DROP TABLE IF EXISTS `playerbot_account_links`;

CREATE TABLE `playerbot_account_links` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `account_id` INT NOT NULL,
    `linked_account_id` INT NOT NULL,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE KEY `account_link` (`account_id`, `linked_account_id`)
) ENGINE=INNODB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `playerbot_account_keys`;

CREATE TABLE `playerbot_account_keys` (
    `account_id` INT PRIMARY KEY,
    `security_key` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=INNODB DEFAULT CHARSET=latin1;

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
