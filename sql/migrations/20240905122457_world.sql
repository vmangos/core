DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20240905122457');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20240905122457');
-- Add your query below.

DROP TABLE IF EXISTS `instance_player_immunity`;
CREATE TABLE `instance_player_immunity` (
  `map_id` INT(10) UNSIGNED NOT NULL COMMENT 'map ID to apply player immunity',
  `immunity_flags` INT(10) UNSIGNED NOT NULL COMMENT 'immunity flags, see PlayerImmunityMgr.h',
  `enabled` TINYINT(1) NOT NULL COMMENT 'immunities enabled or not',
  `comment` VARCHAR(256) NOT NULL COMMENT 'description, what immunities are applied and where',
  PRIMARY KEY (`map_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='player immunities on map entry';

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
