DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20241108102245');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20241108102245');
-- Add your query below.

DROP TABLE IF EXISTS `world_persistent_variables`;
CREATE TABLE `world_persistent_variables` (
  `index` int(10) unsigned NOT NULL DEFAULT 0,
  `value` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`index`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='War Effort, Stranglethorn Vale Fishing, ...';

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
