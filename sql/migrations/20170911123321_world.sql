DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20170911123321');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20170911123321');
-- Add your query below.


--
-- Table structure for table `instance_buff_removal`
--
DROP TABLE IF EXISTS `instance_buff_removal`;
CREATE TABLE `instance_buff_removal` (
  `mapId` int(10) unsigned NOT NULL COMMENT 'MapId to remove aura from',
  `auraId` int(10) unsigned NOT NULL COMMENT 'aura id to remove on entering MapId',
  `enabled` TINYINT(1) NOT NULL COMMENT 'aura removal enabled or not',
  `flags` int(10) NOT NULL COMMENT 'flags, see AuraRemovalMgr.h',
  `comment` VARCHAR(256) NOT NULL COMMENT 'description, what is removed',
  PRIMARY KEY (`MapId`, `auraId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Aura removal on map entry';

--
-- Table structure for table `instance_creature_kills`
--
DROP TABLE IF EXISTS `instance_creature_kills`;
CREATE TABLE `instance_creature_kills` (
  `mapId` int(10) unsigned NOT NULL COMMENT 'MapId to where creature exist',
  `creatureEntry` int(10) unsigned NOT NULL COMMENT 'entry of the creature who performed the kill',
  `spellEntry` INT(10) NOT NULL COMMENT 'entry of spell which did the kill. 0 for melee or unknown',
  `count` int(10) unsigned NOT NULL COMMENT 'number of kills',
  PRIMARY KEY (`MapId`, `creatureEntry`,`spellEntry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='creatures killing players statistics';

--
-- Table structure for table `instance_wipes`
--
DROP TABLE IF EXISTS `instance_wipes`;
CREATE TABLE `instance_wipes` (
  `mapId` int(10) unsigned NOT NULL COMMENT 'MapId to where creature exist',
  `creatureEntry` int(10) unsigned NOT NULL COMMENT 'creature which the wipe occured against',
  `count` int(10) unsigned NOT NULL COMMENT 'number of wipes',
  PRIMARY KEY (`MapId`, `creatureEntry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='players wiping against creatures statistics';

--
-- Table structure for table `instance_custom_counters`
--
DROP TABLE IF EXISTS `instance_custom_counters`;
CREATE TABLE `instance_custom_counters` (
  `index` int(10) unsigned NOT NULL COMMENT 'index as defined in InstanceStatistics.h',
  `count` int(10) unsigned NOT NULL COMMENT 'counter',
  PRIMARY KEY (`index`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='custom counters for instance statistics';


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
