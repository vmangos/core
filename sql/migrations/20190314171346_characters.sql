DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190314171346');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190314171346');
-- Add your query below.


DROP TABLE IF EXISTS `warden_action`;
CREATE TABLE `warden_action` (
  `wardenId` SMALLINT(5) UNSIGNED NOT NULL,
  `action` TINYINT(3) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`wardenId`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
