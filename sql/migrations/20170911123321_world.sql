INSERT INTO `migrations` VALUES ('20170911123321');


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
-- Dumping data for table `instance_buff_removal`
--

LOCK TABLES `instance_buff_removal` WRITE;
/*!40000 ALTER TABLE `instance_buff_removal` DISABLE KEYS */;
/*!40000 ALTER TABLE `instance_buff_removal` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `instance_creature_kills`
--
DROP TABLE IF EXISTS `instance_creature_kills`;
CREATE TABLE `instance_creature_kills` (
  `mapId` int(10) unsigned NOT NULL COMMENT 'MapId to where creature exist',
  `creatureEntry` int(10) unsigned NOT NULL COMMENT 'entry of the creature who performed the kill',
  `spellEntry` TINYINT(1) NOT NULL COMMENT 'entry of spell which did the kill. 0 for melee or unknown',
  `count` int(10) unsigned NOT NULL COMMENT 'number of kills',
  PRIMARY KEY (`MapId`, `creatureEntry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='creatures killing players statistics';

--
-- Dumping data for table `instance_creature_kills`
--

LOCK TABLES `instance_creature_kills` WRITE;
/*!40000 ALTER TABLE `instance_creature_kills` DISABLE KEYS */;
/*!40000 ALTER TABLE `instance_creature_kills` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `crea`
--
DROP TABLE IF EXISTS `instance_wipes`;
CREATE TABLE `instance_wipes` (
  `mapId` int(10) unsigned NOT NULL COMMENT 'MapId to where creature exist',
  `creatureEntry` int(10) unsigned NOT NULL COMMENT 'creature which the wipe occured against',
  `count` int(10) unsigned NOT NULL COMMENT 'number of wipes',
  PRIMARY KEY (`MapId`, `creatureEntry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='players wiping against creatures statistics';

--
-- Dumping data for table `instance_wipes`
--

LOCK TABLES `instance_wipes` WRITE;
/*!40000 ALTER TABLE `instance_wipes` DISABLE KEYS */;
/*!40000 ALTER TABLE `instance_wipes` ENABLE KEYS */;
UNLOCK TABLES;
