DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220601082200');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220601082200');
-- Add your query below.

-- Now unused tables
DROP TABLE IF EXISTS `logs_behavior`;
DROP TABLE IF EXISTS `logs_characters`;
DROP TABLE IF EXISTS `logs_chat`;
DROP TABLE IF EXISTS `logs_movement`;
DROP TABLE IF EXISTS `logs_spamdetect`;
DROP TABLE IF EXISTS `logs_warden`;

-- New unified table
DROP TABLE IF EXISTS `logs_player`;
CREATE TABLE `logs_player` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `time` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  `type` ENUM(
    'Basic', 'WorldPacket', 'Chat', 'BG', 'Character', 'Honor', 'RA', 'DBError', 'DBErrorFix', 'ClientIds',
    'Loot', 'LevelUp', 'Performance', 'MoneyTrade', 'GM', 'GMCritical', 'ChatSpam', 'Anticheat'
  ) NOT NULL,
  `subtype` VARCHAR(20),
  `account` INT UNSIGNED NOT NULL,
  `ip` VARCHAR(16),
  `guid` INT,
  `name` VARCHAR(20),
  `map` INT UNSIGNED,
  `pos_x` FLOAT,
  `pos_y` FLOAT,
  `pos_z` FLOAT,
  `text` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`) , KEY (`account`) , KEY (`guid`) , KEY (`name`)
) ENGINE=MYISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='player and account specific log entries';

-- End of migration.
END IF;
END??
delimiter ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;

DROP TABLE IF EXISTS `logs_behavior`;
