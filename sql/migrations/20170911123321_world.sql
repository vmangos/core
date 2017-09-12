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
