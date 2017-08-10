
--
-- Table structure for table `creature_linking`
--

DROP TABLE IF EXISTS `creature_linking`;
CREATE TABLE `creature_linking` (
  `guid` int(10) unsigned NOT NULL COMMENT 'creature.guid of the slave mob that is linked',
  `master_guid` int(10) unsigned NOT NULL COMMENT 'master to trigger events',
  `flag` mediumint(8) unsigned NOT NULL COMMENT 'flag - describing what should happen when',
  PRIMARY KEY (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Creature Linking System';

--
-- Dumping data for table `creature_linking`
--

LOCK TABLES `creature_linking` WRITE;
/*!40000 ALTER TABLE `creature_linking` DISABLE KEYS */;
/*!40000 ALTER TABLE `creature_linking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creature_linking_template`
--

DROP TABLE IF EXISTS `creature_linking_template`;
CREATE TABLE `creature_linking_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'creature_template.entry of the slave mob that is linked',
  `map` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Id of map of the mobs',
  `master_entry` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'master to trigger events',
  `flag` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'flag - describing what should happen when',
  `search_range` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'search_range - describing in which range (spawn-coords) master and slave are linked together',
  PRIMARY KEY (`entry`,`map`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Creature Linking System';

--
-- Dumping data for table `creature_linking_template`
--

LOCK TABLES `creature_linking_template` WRITE;
/*!40000 ALTER TABLE `creature_linking_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `creature_linking_template` ENABLE KEYS */;
UNLOCK TABLES;
