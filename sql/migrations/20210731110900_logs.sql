DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210731110900');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210731110900');
-- Add your query below.


DROP TABLE IF EXISTS `system_fingerprint_usage`;

CREATE TABLE `system_fingerprint_usage` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fingerprint` int(10) unsigned NOT NULL,
  `account` int(10) unsigned NOT NULL,
  `ip` varchar(16) NOT NULL,
  `realm` int(10) unsigned NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `architecture` varchar(16) DEFAULT NULL,
  `cputype` varchar(64) DEFAULT NULL,
  `activecpus` int(10) unsigned DEFAULT NULL,
  `totalcpus` int(10) unsigned DEFAULT NULL,
  `pagesize` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fingerprint` (`fingerprint`),
  KEY `account` (`account`),
  KEY `ip` (`ip`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
