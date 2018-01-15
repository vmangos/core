-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Server version:               5.5.53 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Версия:              9.3.0.4998
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table mangos.areatrigger_bg_entrance
DROP TABLE IF EXISTS `areatrigger_bg_entrance`;
CREATE TABLE IF NOT EXISTS `areatrigger_bg_entrance` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Identifier',
  `name` text,
  `team` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `bg_template` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `exit_map` float NOT NULL DEFAULT '0',
  `exit_position_x` float NOT NULL DEFAULT '0',
  `exit_position_y` float NOT NULL DEFAULT '0',
  `exit_position_z` float NOT NULL DEFAULT '0',
  `exit_orientation` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mangos.areatrigger_involvedrelation
DROP TABLE IF EXISTS `areatrigger_involvedrelation`;
CREATE TABLE IF NOT EXISTS `areatrigger_involvedrelation` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Identifier',
  `quest` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Trigger System';

-- Data exporting was unselected.


-- Dumping structure for table mangos.areatrigger_tavern
DROP TABLE IF EXISTS `areatrigger_tavern`;
CREATE TABLE IF NOT EXISTS `areatrigger_tavern` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Identifier',
  `name` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Trigger System';

-- Data exporting was unselected.


-- Dumping structure for table mangos.areatrigger_teleport
DROP TABLE IF EXISTS `areatrigger_teleport`;
CREATE TABLE IF NOT EXISTS `areatrigger_teleport` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Identifier',
  `patch` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `name` text,
  `required_level` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `required_item` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `required_item2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `required_quest_done` int(11) unsigned NOT NULL DEFAULT '0',
  `required_event` int(11) DEFAULT '0',
  `required_pvp_rank` mediumint(8) unsigned DEFAULT '0',
  `required_team` mediumint(8) unsigned DEFAULT '0',
  `required_failed_text` text,
  `target_map` smallint(5) unsigned NOT NULL DEFAULT '0',
  `target_position_x` float NOT NULL DEFAULT '0',
  `target_position_y` float NOT NULL DEFAULT '0',
  `target_position_z` float NOT NULL DEFAULT '0',
  `target_orientation` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`patch`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Trigger System';

-- Data exporting was unselected.


-- Dumping structure for table mangos.area_template
DROP TABLE IF EXISTS `area_template`;
CREATE TABLE IF NOT EXISTS `area_template` (
  `Entry` mediumint(8) NOT NULL DEFAULT '0',
  `MapId` mediumint(8) NOT NULL DEFAULT '0',
  `ZoneId` mediumint(8) NOT NULL DEFAULT '0',
  `ExploreFlag` mediumint(8) NOT NULL DEFAULT '0',
  `Flags` mediumint(8) NOT NULL DEFAULT '0',
  `AreaLevel` mediumint(8) NOT NULL DEFAULT '0',
  `Name` varchar(100) NOT NULL DEFAULT '',
  `Team` tinyint(3) NOT NULL DEFAULT '0',
  `LiquidTypeId` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mangos.auctionhousebot
DROP TABLE IF EXISTS `auctionhousebot`;
CREATE TABLE IF NOT EXISTS `auctionhousebot` (
  `item` int(11) DEFAULT NULL COMMENT 'ID de l''item',
  `stack` int(11) DEFAULT NULL COMMENT 'Empillement',
  `bid` int(11) DEFAULT NULL COMMENT 'Prix a encherir',
  `buyout` int(11) DEFAULT NULL COMMENT 'Achat immediat'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table mangos.autobroadcast
DROP TABLE IF EXISTS `autobroadcast`;
CREATE TABLE IF NOT EXISTS `autobroadcast` (
  `delay` int(11) DEFAULT NULL,
  `commentaire` varchar(255) DEFAULT NULL,
  `stringId` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table mangos.battleground_events
DROP TABLE IF EXISTS `battleground_events`;
CREATE TABLE IF NOT EXISTS `battleground_events` (
  `map` smallint(5) NOT NULL,
  `event1` tinyint(3) unsigned NOT NULL,
  `event2` tinyint(3) unsigned NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`map`,`event1`,`event2`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mangos.battleground_template
DROP TABLE IF EXISTS `battleground_template`;
CREATE TABLE IF NOT EXISTS `battleground_template` (
  `id` mediumint(8) unsigned NOT NULL,
  `patch` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `MinPlayersPerTeam` smallint(5) unsigned NOT NULL DEFAULT '0',
  `MaxPlayersPerTeam` smallint(5) unsigned NOT NULL DEFAULT '0',
  `MinLvl` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `MaxLvl` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `AllianceWinSpell` smallint(5) unsigned NOT NULL DEFAULT '0',
  `AllianceLoseSpell` smallint(5) unsigned NOT NULL DEFAULT '0',
  `HordeWinSpell` smallint(5) unsigned NOT NULL DEFAULT '0',
  `HordeLoseSpell` smallint(5) unsigned NOT NULL DEFAULT '0',
  `AllianceStartLoc` mediumint(8) unsigned NOT NULL,
  `AllianceStartO` float NOT NULL,
  `HordeStartLoc` mediumint(8) unsigned NOT NULL,
  `HordeStartO` float NOT NULL,
  PRIMARY KEY (`id`,`patch`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mangos.battlemaster_entry
DROP TABLE IF EXISTS `battlemaster_entry`;
CREATE TABLE IF NOT EXISTS `battlemaster_entry` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Entry of a creature',
  `bg_template` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Battleground template id',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mangos.broadcast_text
DROP TABLE IF EXISTS `broadcast_text`;
CREATE TABLE IF NOT EXISTS `broadcast_text` (
  `ID` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `MaleText` longtext,
  `FemaleText` longtext,
  `Sound` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `Type` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `Language` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `EmoteId0` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `EmoteId1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `EmoteId2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `EmoteDelay0` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `EmoteDelay1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `EmoteDelay2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mangos.cinematic_waypoints
DROP TABLE IF EXISTS `cinematic_waypoints`;
CREATE TABLE IF NOT EXISTS `cinematic_waypoints` (
  `cinematic` int(11) DEFAULT '0',
  `timer` int(11) DEFAULT '0',
  `posx` float DEFAULT NULL,
  `posy` float DEFAULT NULL,
  `posz` float DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table mangos.command
DROP TABLE IF EXISTS `command`;
CREATE TABLE IF NOT EXISTS `command` (
  `name` varchar(50) NOT NULL DEFAULT '',
  `security` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `help` longtext,
  `flags` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Chat System';

-- Data exporting was unselected.


-- Dumping structure for table mangos.conditions
DROP TABLE IF EXISTS `conditions`;
CREATE TABLE IF NOT EXISTS `conditions` (
  `condition_entry` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identifier',
  `type` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'Type of the condition',
  `value1` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'data field one for the condition',
  `value2` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'data field two for the condition',
  PRIMARY KEY (`condition_entry`),
  UNIQUE KEY `unique_conditions` (`type`,`value1`,`value2`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Condition System';

-- Data exporting was unselected.


-- Dumping structure for table mangos.creature
DROP TABLE IF EXISTS `creature`;
CREATE TABLE IF NOT EXISTS `creature` (
  `guid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Global Unique Identifier',
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Creature Identifier',
  `map` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Map Identifier',
  `modelid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `equipment_id` mediumint(9) NOT NULL DEFAULT '0',
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  `spawntimesecsmin` int(10) unsigned NOT NULL DEFAULT '120',
  `spawntimesecsmax` int(10) unsigned NOT NULL DEFAULT '120',
  `spawndist` float NOT NULL DEFAULT '5',
  `currentwaypoint` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `curhealth` int(10) unsigned NOT NULL DEFAULT '1',
  `curmana` int(10) unsigned NOT NULL DEFAULT '0',
  `DeathState` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `MovementType` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `spawnFlags` int(10) unsigned NOT NULL DEFAULT '0',
  `visibilitymod` float DEFAULT '0',
  `patch_min` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `patch_max` tinyint(3) unsigned NOT NULL DEFAULT '10',
  PRIMARY KEY (`guid`),
  KEY `idx_map` (`map`),
  KEY `idx_id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Creature System';

-- Data exporting was unselected.


-- Dumping structure for table mangos.creature_addon
DROP TABLE IF EXISTS `creature_addon`;
CREATE TABLE IF NOT EXISTS `creature_addon` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0',
  `patch` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mount` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `bytes1` int(10) unsigned NOT NULL DEFAULT '0',
  `b2_0_sheath` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `b2_1_flags` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `emote` int(10) unsigned NOT NULL DEFAULT '0',
  `moveflags` int(10) unsigned NOT NULL DEFAULT '0',
  `auras` text,
  PRIMARY KEY (`guid`,`patch`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table mangos.creature_ai_scripts
DROP TABLE IF EXISTS `creature_ai_scripts`;
CREATE TABLE IF NOT EXISTS `creature_ai_scripts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identifier',
  `creature_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Creature Template Identifier',
  `event_type` tinyint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Event Type',
  `event_inverse_phase_mask` int(11) NOT NULL DEFAULT '0' COMMENT 'Mask which phases this event will not trigger in',
  `event_chance` int(3) unsigned NOT NULL DEFAULT '100',
  `event_flags` int(3) unsigned NOT NULL DEFAULT '0',
  `event_param1` int(11) NOT NULL DEFAULT '0',
  `event_param2` int(11) NOT NULL DEFAULT '0',
  `event_param3` int(11) NOT NULL DEFAULT '0',
  `event_param4` int(11) NOT NULL DEFAULT '0',
  `action1_type` tinyint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Action Type',
  `action1_param1` int(11) NOT NULL DEFAULT '0',
  `action1_param2` int(11) NOT NULL DEFAULT '0',
  `action1_param3` int(11) NOT NULL DEFAULT '0',
  `action2_type` tinyint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Action Type',
  `action2_param1` int(11) NOT NULL DEFAULT '0',
  `action2_param2` int(11) NOT NULL DEFAULT '0',
  `action2_param3` int(11) NOT NULL DEFAULT '0',
  `action3_type` tinyint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Action Type',
  `action3_param1` int(11) NOT NULL DEFAULT '0',
  `action3_param2` int(11) NOT NULL DEFAULT '0',
  `action3_param3` int(11) NOT NULL DEFAULT '0',
  `comment` varchar(255) NOT NULL DEFAULT '' COMMENT 'Event Comment',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='EventAI Scripts';

-- Data exporting was unselected.


-- Dumping structure for table mangos.creature_ai_summons
DROP TABLE IF EXISTS `creature_ai_summons`;
CREATE TABLE IF NOT EXISTS `creature_ai_summons` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Location Identifier',
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  `spawntimesecs` int(11) unsigned NOT NULL DEFAULT '120',
  `comment` varchar(255) NOT NULL DEFAULT '' COMMENT 'Summon Comment',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='EventAI Summoning Locations';

-- Data exporting was unselected.


-- Dumping structure for table mangos.creature_ai_texts
DROP TABLE IF EXISTS `creature_ai_texts`;
CREATE TABLE IF NOT EXISTS `creature_ai_texts` (
  `entry` mediumint(8) NOT NULL,
  `content_default` text NOT NULL,
  `content_loc1` text,
  `content_loc2` text,
  `content_loc3` text,
  `content_loc4` text,
  `content_loc5` text,
  `content_loc6` text,
  `content_loc7` text,
  `content_loc8` text,
  `sound` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `language` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `emote` smallint(5) NOT NULL DEFAULT '0',
  `comment` text,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Script Texts';

-- Data exporting was unselected.


-- Dumping structure for table mangos.creature_battleground
DROP TABLE IF EXISTS `creature_battleground`;
CREATE TABLE IF NOT EXISTS `creature_battleground` (
  `guid` int(10) unsigned NOT NULL COMMENT 'Creature''s GUID',
  `event1` tinyint(3) unsigned NOT NULL COMMENT 'main event',
  `event2` tinyint(3) unsigned NOT NULL COMMENT 'sub event',
  PRIMARY KEY (`guid`,`event1`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Creature battleground indexing system';

-- Data exporting was unselected.


-- Dumping structure for table mangos.creature_equip_template
DROP TABLE IF EXISTS `creature_equip_template`;
CREATE TABLE IF NOT EXISTS `creature_equip_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Unique entry',
  `patch` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `equipentry1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `equipentry2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `equipentry3` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`patch`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Creature System (Equipment)';

-- Data exporting was unselected.


-- Dumping structure for table mangos.creature_equip_template_raw
DROP TABLE IF EXISTS `creature_equip_template_raw`;
CREATE TABLE IF NOT EXISTS `creature_equip_template_raw` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Unique entry',
  `patch` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `equipmodel1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `equipmodel2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `equipmodel3` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `equipinfo1` int(10) unsigned NOT NULL DEFAULT '0',
  `equipinfo2` int(10) unsigned NOT NULL DEFAULT '0',
  `equipinfo3` int(10) unsigned NOT NULL DEFAULT '0',
  `equipslot1` int(11) NOT NULL DEFAULT '0',
  `equipslot2` int(11) NOT NULL DEFAULT '0',
  `equipslot3` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`patch`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Creature System (Equipment)';

-- Data exporting was unselected.


-- Dumping structure for table mangos.creature_groups
DROP TABLE IF EXISTS `creature_groups`;
CREATE TABLE IF NOT EXISTS `creature_groups` (
  `leaderGUID` int(11) unsigned NOT NULL,
  `memberGUID` int(11) unsigned NOT NULL,
  `dist` float unsigned NOT NULL,
  `angle` float unsigned NOT NULL,
  `flags` int(11) unsigned NOT NULL,
  PRIMARY KEY (`memberGUID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table mangos.creature_involvedrelation
DROP TABLE IF EXISTS `creature_involvedrelation`;
CREATE TABLE IF NOT EXISTS `creature_involvedrelation` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Identifier',
  `quest` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  `patch` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`quest`,`patch`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Creature System';

-- Data exporting was unselected.


-- Dumping structure for table mangos.creature_linking
DROP TABLE IF EXISTS `creature_linking`;
CREATE TABLE IF NOT EXISTS `creature_linking` (
  `guid` int(10) unsigned NOT NULL COMMENT 'creature.guid of the slave mob that is linked',
  `master_guid` int(10) unsigned NOT NULL COMMENT 'master to trigger events',
  `flag` mediumint(8) unsigned NOT NULL COMMENT 'flag - describing what should happen when',
  PRIMARY KEY (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Creature Linking System';

-- Data exporting was unselected.


-- Dumping structure for table mangos.creature_linking_template
DROP TABLE IF EXISTS `creature_linking_template`;
CREATE TABLE IF NOT EXISTS `creature_linking_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'creature_template.entry of the slave mob that is linked',
  `map` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Id of map of the mobs',
  `master_entry` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'master to trigger events',
  `flag` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'flag - describing what should happen when',
  `search_range` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'search_range - describing in which range (spawn-coords) master and slave are linked together',
  PRIMARY KEY (`entry`,`map`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Creature Linking System';

-- Data exporting was unselected.


-- Dumping structure for table mangos.creature_loot_template
DROP TABLE IF EXISTS `creature_loot_template`;
CREATE TABLE IF NOT EXISTS `creature_loot_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'entry 0 used for player insignia loot',
  `item` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ChanceOrQuestChance` float NOT NULL DEFAULT '100',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mincountOrRef` mediumint(9) NOT NULL DEFAULT '1',
  `maxcount` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `condition_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`item`,`groupid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Loot System';

-- Data exporting was unselected.


-- Dumping structure for table mangos.creature_model_info
DROP TABLE IF EXISTS `creature_model_info`;
CREATE TABLE IF NOT EXISTS `creature_model_info` (
  `modelid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `bounding_radius` float NOT NULL DEFAULT '0',
  `combat_reach` float NOT NULL DEFAULT '0',
  `gender` tinyint(3) unsigned NOT NULL DEFAULT '2',
  `modelid_other_gender` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `modelid_other_team` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`modelid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Creature System (Model related info)';

-- Data exporting was unselected.


-- Dumping structure for table mangos.creature_movement
DROP TABLE IF EXISTS `creature_movement`;
CREATE TABLE IF NOT EXISTS `creature_movement` (
  `id` int(10) unsigned NOT NULL COMMENT 'Creature GUID',
  `point` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `waittime` int(10) unsigned NOT NULL DEFAULT '0',
  `script_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `textid1` int(11) NOT NULL DEFAULT '0',
  `textid2` int(11) NOT NULL DEFAULT '0',
  `textid3` int(11) NOT NULL DEFAULT '0',
  `textid4` int(11) NOT NULL DEFAULT '0',
  `textid5` int(11) NOT NULL DEFAULT '0',
  `emote` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `spell` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `wpguid` int(11) NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  `model1` mediumint(9) NOT NULL DEFAULT '0',
  `model2` mediumint(9) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`point`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Creature System';

-- Data exporting was unselected.


-- Dumping structure for table mangos.creature_movement_scripts
DROP TABLE IF EXISTS `creature_movement_scripts`;
CREATE TABLE IF NOT EXISTS `creature_movement_scripts` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `delay` int(10) unsigned NOT NULL DEFAULT '0',
  `command` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `datalong` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `datalong2` int(10) unsigned NOT NULL DEFAULT '0',
  `datalong3` int(10) unsigned NOT NULL DEFAULT '0',
  `datalong4` int(10) unsigned NOT NULL DEFAULT '0',
  `buddy_id` int(10) unsigned NOT NULL DEFAULT '0',
  `buddy_radius` int(10) unsigned NOT NULL DEFAULT '0',
  `buddy_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `data_flags` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `dataint` int(11) NOT NULL DEFAULT '0',
  `dataint2` int(11) NOT NULL DEFAULT '0',
  `dataint3` int(11) NOT NULL DEFAULT '0',
  `dataint4` int(11) NOT NULL DEFAULT '0',
  `x` float NOT NULL DEFAULT '0',
  `y` float NOT NULL DEFAULT '0',
  `z` float NOT NULL DEFAULT '0',
  `o` float NOT NULL DEFAULT '0',
  `comments` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mangos.creature_movement_template
DROP TABLE IF EXISTS `creature_movement_template`;
CREATE TABLE IF NOT EXISTS `creature_movement_template` (
  `entry` mediumint(8) unsigned NOT NULL COMMENT 'Creature entry',
  `point` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `waittime` int(10) unsigned NOT NULL DEFAULT '0',
  `script_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `textid1` int(11) NOT NULL DEFAULT '0',
  `textid2` int(11) NOT NULL DEFAULT '0',
  `textid3` int(11) NOT NULL DEFAULT '0',
  `textid4` int(11) NOT NULL DEFAULT '0',
  `textid5` int(11) NOT NULL DEFAULT '0',
  `emote` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `spell` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `wpguid` int(11) NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  `model1` mediumint(9) NOT NULL DEFAULT '0',
  `model2` mediumint(9) NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`point`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Creature waypoint system';

-- Data exporting was unselected.


-- Dumping structure for table mangos.creature_onkill_reputation
DROP TABLE IF EXISTS `creature_onkill_reputation`;
CREATE TABLE IF NOT EXISTS `creature_onkill_reputation` (
  `creature_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Creature Identifier',
  `RewOnKillRepFaction1` smallint(6) NOT NULL DEFAULT '0',
  `RewOnKillRepFaction2` smallint(6) NOT NULL DEFAULT '0',
  `MaxStanding1` tinyint(4) NOT NULL DEFAULT '0',
  `IsTeamAward1` tinyint(4) NOT NULL DEFAULT '0',
  `RewOnKillRepValue1` mediumint(9) NOT NULL DEFAULT '0',
  `MaxStanding2` tinyint(4) NOT NULL DEFAULT '0',
  `IsTeamAward2` tinyint(4) NOT NULL DEFAULT '0',
  `RewOnKillRepValue2` mediumint(9) NOT NULL DEFAULT '0',
  `TeamDependent` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`creature_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Creature OnKill Reputation gain';

-- Data exporting was unselected.


-- Dumping structure for table mangos.creature_questrelation
DROP TABLE IF EXISTS `creature_questrelation`;
CREATE TABLE IF NOT EXISTS `creature_questrelation` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Identifier',
  `quest` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  `patch` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`quest`,`patch`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Creature System';

-- Data exporting was unselected.


-- Dumping structure for table mangos.creature_spells
DROP TABLE IF EXISTS `creature_spells`;
CREATE TABLE IF NOT EXISTS `creature_spells` (
  `entry` int(11) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `spellId_1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `probability_1` tinyint(3) unsigned NOT NULL DEFAULT '100',
  `castTarget_1` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `castFlags_1` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `delayInitialMin_1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `delayInitialMax_1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `delayRepeatMin_1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `delayRepeatMax_1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `scriptId_1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `spellId_2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `probability_2` tinyint(3) unsigned NOT NULL DEFAULT '100',
  `castTarget_2` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `castFlags_2` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `delayInitialMin_2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `delayInitialMax_2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `delayRepeatMin_2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `delayRepeatMax_2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `scriptId_2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `spellId_3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `probability_3` tinyint(3) unsigned NOT NULL DEFAULT '100',
  `castTarget_3` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `castFlags_3` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `delayInitialMin_3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `delayInitialMax_3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `delayRepeatMin_3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `delayRepeatMax_3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `scriptId_3` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `spellId_4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `probability_4` tinyint(3) unsigned NOT NULL DEFAULT '100',
  `castTarget_4` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `castFlags_4` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `delayInitialMin_4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `delayInitialMax_4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `delayRepeatMin_4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `delayRepeatMax_4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `scriptId_4` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `spellId_5` smallint(5) unsigned NOT NULL DEFAULT '0',
  `probability_5` tinyint(3) unsigned NOT NULL DEFAULT '100',
  `castTarget_5` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `castFlags_5` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `delayInitialMin_5` smallint(5) unsigned NOT NULL DEFAULT '0',
  `delayInitialMax_5` smallint(5) unsigned NOT NULL DEFAULT '0',
  `delayRepeatMin_5` smallint(5) unsigned NOT NULL DEFAULT '0',
  `delayRepeatMax_5` smallint(5) unsigned NOT NULL DEFAULT '0',
  `scriptId_5` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `spellId_6` smallint(5) unsigned NOT NULL DEFAULT '0',
  `probability_6` tinyint(3) unsigned NOT NULL DEFAULT '100',
  `castTarget_6` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `castFlags_6` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `delayInitialMin_6` smallint(5) unsigned NOT NULL DEFAULT '0',
  `delayInitialMax_6` smallint(5) unsigned NOT NULL DEFAULT '0',
  `delayRepeatMin_6` smallint(5) unsigned NOT NULL DEFAULT '0',
  `delayRepeatMax_6` smallint(5) unsigned NOT NULL DEFAULT '0',
  `scriptId_6` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `spellId_7` smallint(5) unsigned NOT NULL DEFAULT '0',
  `probability_7` tinyint(3) unsigned NOT NULL DEFAULT '100',
  `castTarget_7` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `castFlags_7` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `delayInitialMin_7` smallint(5) unsigned NOT NULL DEFAULT '0',
  `delayInitialMax_7` smallint(5) unsigned NOT NULL DEFAULT '0',
  `delayRepeatMin_7` smallint(5) unsigned NOT NULL DEFAULT '0',
  `delayRepeatMax_7` smallint(5) unsigned NOT NULL DEFAULT '0',
  `scriptId_7` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `spellId_8` smallint(5) unsigned NOT NULL DEFAULT '0',
  `probability_8` tinyint(3) unsigned NOT NULL DEFAULT '100',
  `castTarget_8` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `castFlags_8` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `delayInitialMin_8` smallint(5) unsigned NOT NULL DEFAULT '0',
  `delayInitialMax_8` smallint(5) unsigned NOT NULL DEFAULT '0',
  `delayRepeatMin_8` smallint(5) unsigned NOT NULL DEFAULT '0',
  `delayRepeatMax_8` smallint(5) unsigned NOT NULL DEFAULT '0',
  `scriptId_8` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table mangos.creature_spells_scripts
DROP TABLE IF EXISTS `creature_spells_scripts`;
CREATE TABLE IF NOT EXISTS `creature_spells_scripts` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `delay` int(10) unsigned NOT NULL DEFAULT '0',
  `command` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `datalong` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `datalong2` int(10) unsigned NOT NULL DEFAULT '0',
  `datalong3` int(10) unsigned NOT NULL DEFAULT '0',
  `datalong4` int(10) unsigned NOT NULL DEFAULT '0',
  `buddy_id` int(10) unsigned NOT NULL DEFAULT '0',
  `buddy_radius` int(10) unsigned NOT NULL DEFAULT '0',
  `buddy_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `data_flags` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `dataint` int(11) NOT NULL DEFAULT '0',
  `dataint2` int(11) NOT NULL DEFAULT '0',
  `dataint3` int(11) NOT NULL DEFAULT '0',
  `dataint4` int(11) NOT NULL DEFAULT '0',
  `x` float NOT NULL DEFAULT '0',
  `y` float NOT NULL DEFAULT '0',
  `z` float NOT NULL DEFAULT '0',
  `o` float NOT NULL DEFAULT '0',
  `comments` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mangos.creature_template
DROP TABLE IF EXISTS `creature_template`;
CREATE TABLE IF NOT EXISTS `creature_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `patch` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `KillCredit1` int(11) unsigned NOT NULL DEFAULT '0',
  `KillCredit2` int(11) unsigned NOT NULL DEFAULT '0',
  `modelid_1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `modelid_2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `modelid_3` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `modelid_4` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `name` char(100) NOT NULL DEFAULT '0',
  `subname` char(100) DEFAULT NULL,
  `gossip_menu_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `minlevel` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `maxlevel` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `minhealth` int(10) unsigned NOT NULL DEFAULT '0',
  `maxhealth` int(10) unsigned NOT NULL DEFAULT '0',
  `minmana` int(10) unsigned NOT NULL DEFAULT '0',
  `maxmana` int(10) unsigned NOT NULL DEFAULT '0',
  `armor` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `faction_A` smallint(5) unsigned NOT NULL DEFAULT '0',
  `faction_H` smallint(5) unsigned NOT NULL DEFAULT '0',
  `npcflag` int(10) unsigned NOT NULL DEFAULT '0',
  `speed_walk` float NOT NULL DEFAULT '1' COMMENT 'Result of 2.5/2.5, most common value',
  `speed_run` float NOT NULL DEFAULT '1.14286' COMMENT 'Result of 8.0/7.0, most common value',
  `scale` float NOT NULL DEFAULT '1',
  `rank` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mindmg` float NOT NULL DEFAULT '0',
  `maxdmg` float NOT NULL DEFAULT '0',
  `dmgschool` tinyint(4) NOT NULL DEFAULT '0',
  `attackpower` int(10) unsigned NOT NULL DEFAULT '0',
  `dmg_multiplier` float NOT NULL DEFAULT '1',
  `baseattacktime` int(10) unsigned NOT NULL DEFAULT '0',
  `rangeattacktime` int(10) unsigned NOT NULL DEFAULT '0',
  `unit_class` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `unit_flags` int(10) unsigned NOT NULL DEFAULT '0',
  `dynamicflags` int(10) unsigned NOT NULL DEFAULT '0',
  `family` tinyint(4) NOT NULL DEFAULT '0',
  `trainer_type` tinyint(4) NOT NULL DEFAULT '0',
  `trainer_spell` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `trainer_class` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `trainer_race` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `minrangedmg` float NOT NULL DEFAULT '0',
  `maxrangedmg` float NOT NULL DEFAULT '0',
  `rangedattackpower` smallint(5) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `type_flags` int(10) unsigned NOT NULL DEFAULT '0',
  `lootid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `pickpocketloot` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `skinloot` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `resistance1` smallint(5) NOT NULL DEFAULT '0',
  `resistance2` smallint(5) NOT NULL DEFAULT '0',
  `resistance3` smallint(5) NOT NULL DEFAULT '0',
  `resistance4` smallint(5) NOT NULL DEFAULT '0',
  `resistance5` smallint(5) NOT NULL DEFAULT '0',
  `resistance6` smallint(5) NOT NULL DEFAULT '0',
  `spell1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `spell2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `spell3` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `spell4` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `spells_template` int(11) unsigned NOT NULL DEFAULT '0',
  `PetSpellDataId` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `mingold` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `maxgold` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `AIName` char(64) NOT NULL DEFAULT '',
  `MovementType` tinyint(3) unsigned DEFAULT '0',
  `InhabitType` tinyint(3) unsigned NOT NULL DEFAULT '3',
  `Civilian` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `RacialLeader` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `RegenHealth` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `equipment_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `trainer_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `vendor_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `MechanicImmuneMask` int(10) unsigned NOT NULL DEFAULT '0',
  `SchoolImmuneMask` int(10) unsigned NOT NULL DEFAULT '0',
  `flags_extra` int(10) unsigned NOT NULL DEFAULT '0',
  `ScriptName` char(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`entry`,`patch`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Creature System';

-- Data exporting was unselected.


-- Dumping structure for table mangos.creature_template_addon
DROP TABLE IF EXISTS `creature_template_addon`;
CREATE TABLE IF NOT EXISTS `creature_template_addon` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `patch` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mount` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `bytes1` int(10) unsigned NOT NULL DEFAULT '0',
  `b2_0_sheath` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `b2_1_flags` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `emote` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `moveflags` int(10) unsigned NOT NULL DEFAULT '0',
  `auras` text,
  PRIMARY KEY (`entry`,`patch`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mangos.custom_texts
DROP TABLE IF EXISTS `custom_texts`;
CREATE TABLE IF NOT EXISTS `custom_texts` (
  `entry` mediumint(8) NOT NULL,
  `content_default` text NOT NULL,
  `content_loc1` text,
  `content_loc2` text,
  `content_loc3` text,
  `content_loc4` text,
  `content_loc5` text,
  `content_loc6` text,
  `content_loc7` text,
  `content_loc8` text,
  `sound` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `language` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `emote` smallint(5) unsigned NOT NULL DEFAULT '0',
  `comment` text,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Custom Texts';

-- Data exporting was unselected.


-- Dumping structure for table mangos.disenchant_loot_template
DROP TABLE IF EXISTS `disenchant_loot_template`;
CREATE TABLE IF NOT EXISTS `disenchant_loot_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Recommended id selection: item_level*100 + item_quality',
  `item` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ChanceOrQuestChance` float NOT NULL DEFAULT '100',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mincountOrRef` mediumint(9) NOT NULL DEFAULT '1',
  `maxcount` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `condition_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Loot System';

-- Data exporting was unselected.


-- Dumping structure for table mangos.event_scripts
DROP TABLE IF EXISTS `event_scripts`;
CREATE TABLE IF NOT EXISTS `event_scripts` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `delay` int(10) unsigned NOT NULL DEFAULT '0',
  `command` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `datalong` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `datalong2` int(10) unsigned NOT NULL DEFAULT '0',
  `datalong3` int(10) unsigned NOT NULL DEFAULT '0',
  `datalong4` int(10) unsigned NOT NULL DEFAULT '0',
  `buddy_id` int(10) unsigned NOT NULL DEFAULT '0',
  `buddy_radius` int(10) unsigned NOT NULL DEFAULT '0',
  `buddy_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `data_flags` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `dataint` int(11) NOT NULL DEFAULT '0',
  `dataint2` int(11) NOT NULL DEFAULT '0',
  `dataint3` int(11) NOT NULL DEFAULT '0',
  `dataint4` int(11) NOT NULL DEFAULT '0',
  `x` float NOT NULL DEFAULT '0',
  `y` float NOT NULL DEFAULT '0',
  `z` float NOT NULL DEFAULT '0',
  `o` float NOT NULL DEFAULT '0',
  `comments` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mangos.exploration_basexp
DROP TABLE IF EXISTS `exploration_basexp`;
CREATE TABLE IF NOT EXISTS `exploration_basexp` (
  `level` tinyint(4) NOT NULL DEFAULT '0',
  `basexp` mediumint(9) NOT NULL DEFAULT '0',
  PRIMARY KEY (`level`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Exploration System';

-- Data exporting was unselected.


-- Dumping structure for table mangos.fishing_loot_template
DROP TABLE IF EXISTS `fishing_loot_template`;
CREATE TABLE IF NOT EXISTS `fishing_loot_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'entry 0 used for junk loot at fishing fail (if allowed by config option)',
  `item` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ChanceOrQuestChance` float NOT NULL DEFAULT '100',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mincountOrRef` mediumint(9) NOT NULL DEFAULT '1',
  `maxcount` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `condition_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Loot System';

-- Data exporting was unselected.


-- Dumping structure for table mangos.forbidden_items
DROP TABLE IF EXISTS `forbidden_items`;
CREATE TABLE IF NOT EXISTS `forbidden_items` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `patch` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `AfterOrBefore` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`AfterOrBefore`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mangos.gameobject
DROP TABLE IF EXISTS `gameobject`;
CREATE TABLE IF NOT EXISTS `gameobject` (
  `guid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Global Unique Identifier',
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Gameobject Identifier',
  `map` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Map Identifier',
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  `rotation0` float NOT NULL DEFAULT '0',
  `rotation1` float NOT NULL DEFAULT '0',
  `rotation2` float NOT NULL DEFAULT '0',
  `rotation3` float NOT NULL DEFAULT '0',
  `spawntimesecsmin` int(11) NOT NULL DEFAULT '0',
  `spawntimesecsmax` int(11) NOT NULL DEFAULT '0',
  `animprogress` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `state` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `spawnFlags` int(10) unsigned NOT NULL DEFAULT '0',
  `visibilitymod` float DEFAULT '0',
  `patch_min` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `patch_max` tinyint(3) unsigned NOT NULL DEFAULT '10',
  PRIMARY KEY (`guid`),
  KEY `idx_map` (`map`),
  KEY `idx_id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Gameobject System';

-- Data exporting was unselected.


-- Dumping structure for table mangos.gameobject_battleground
DROP TABLE IF EXISTS `gameobject_battleground`;
CREATE TABLE IF NOT EXISTS `gameobject_battleground` (
  `guid` int(10) unsigned NOT NULL COMMENT 'GameObject''s GUID',
  `event1` tinyint(3) unsigned NOT NULL COMMENT 'main event',
  `event2` tinyint(3) unsigned NOT NULL COMMENT 'sub event',
  PRIMARY KEY (`guid`,`event1`,`event2`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='GameObject battleground indexing system';

-- Data exporting was unselected.


-- Dumping structure for table mangos.gameobject_involvedrelation
DROP TABLE IF EXISTS `gameobject_involvedrelation`;
CREATE TABLE IF NOT EXISTS `gameobject_involvedrelation` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `quest` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  `patch` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`quest`,`patch`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mangos.gameobject_loot_template
DROP TABLE IF EXISTS `gameobject_loot_template`;
CREATE TABLE IF NOT EXISTS `gameobject_loot_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `item` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ChanceOrQuestChance` float NOT NULL DEFAULT '100',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mincountOrRef` mediumint(9) NOT NULL DEFAULT '1',
  `maxcount` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `condition_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Loot System';

-- Data exporting was unselected.


-- Dumping structure for table mangos.gameobject_questrelation
DROP TABLE IF EXISTS `gameobject_questrelation`;
CREATE TABLE IF NOT EXISTS `gameobject_questrelation` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `quest` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  `patch` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`quest`,`patch`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mangos.gameobject_requirement
DROP TABLE IF EXISTS `gameobject_requirement`;
CREATE TABLE IF NOT EXISTS `gameobject_requirement` (
  `guid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Global Unique Identifier',
  `reqType` int(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Gameobject Identifier',
  `reqGuid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Gameobject Identifier',
  PRIMARY KEY (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Gameobject System';

-- Data exporting was unselected.


-- Dumping structure for table mangos.gameobject_scripts
DROP TABLE IF EXISTS `gameobject_scripts`;
CREATE TABLE IF NOT EXISTS `gameobject_scripts` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `delay` int(10) unsigned NOT NULL DEFAULT '0',
  `command` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `datalong` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `datalong2` int(10) unsigned NOT NULL DEFAULT '0',
  `datalong3` int(10) unsigned NOT NULL DEFAULT '0',
  `datalong4` int(10) unsigned NOT NULL DEFAULT '0',
  `buddy_id` int(10) unsigned NOT NULL DEFAULT '0',
  `buddy_radius` int(10) unsigned NOT NULL DEFAULT '0',
  `buddy_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `data_flags` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `dataint` int(11) NOT NULL DEFAULT '0',
  `dataint2` int(11) NOT NULL DEFAULT '0',
  `dataint3` int(11) NOT NULL DEFAULT '0',
  `dataint4` int(11) NOT NULL DEFAULT '0',
  `x` float NOT NULL DEFAULT '0',
  `y` float NOT NULL DEFAULT '0',
  `z` float NOT NULL DEFAULT '0',
  `o` float NOT NULL DEFAULT '0',
  `comments` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mangos.gameobject_template
DROP TABLE IF EXISTS `gameobject_template`;
CREATE TABLE IF NOT EXISTS `gameobject_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `displayId` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL DEFAULT '',
  `faction` smallint(5) unsigned NOT NULL DEFAULT '0',
  `flags` int(10) unsigned NOT NULL DEFAULT '0',
  `size` float NOT NULL DEFAULT '1',
  `data0` int(10) unsigned NOT NULL DEFAULT '0',
  `data1` int(10) unsigned NOT NULL DEFAULT '0',
  `data2` int(10) unsigned NOT NULL DEFAULT '0',
  `data3` int(10) unsigned NOT NULL DEFAULT '0',
  `data4` int(10) unsigned NOT NULL DEFAULT '0',
  `data5` int(10) unsigned NOT NULL DEFAULT '0',
  `data6` int(10) unsigned NOT NULL DEFAULT '0',
  `data7` int(10) unsigned NOT NULL DEFAULT '0',
  `data8` int(10) unsigned NOT NULL DEFAULT '0',
  `data9` int(10) unsigned NOT NULL DEFAULT '0',
  `data10` int(10) unsigned NOT NULL DEFAULT '0',
  `data11` int(10) unsigned NOT NULL DEFAULT '0',
  `data12` int(10) unsigned NOT NULL DEFAULT '0',
  `data13` int(10) unsigned NOT NULL DEFAULT '0',
  `data14` int(10) unsigned NOT NULL DEFAULT '0',
  `data15` int(10) unsigned NOT NULL DEFAULT '0',
  `data16` int(10) unsigned NOT NULL DEFAULT '0',
  `data17` int(10) unsigned NOT NULL DEFAULT '0',
  `data18` int(10) unsigned NOT NULL DEFAULT '0',
  `data19` int(10) unsigned NOT NULL DEFAULT '0',
  `data20` int(10) unsigned NOT NULL DEFAULT '0',
  `data21` int(10) unsigned NOT NULL DEFAULT '0',
  `data22` int(10) unsigned NOT NULL DEFAULT '0',
  `data23` int(10) unsigned NOT NULL DEFAULT '0',
  `mingold` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `maxgold` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ScriptName` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Gameobject System';

-- Data exporting was unselected.


-- Dumping structure for table mangos.game_event
DROP TABLE IF EXISTS `game_event`;
CREATE TABLE IF NOT EXISTS `game_event` (
  `entry` mediumint(8) unsigned NOT NULL COMMENT 'Entry of the game event',
  `start_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Absolute start date, the event will never start before',
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Absolute end date, the event will never start afler',
  `occurence` bigint(20) unsigned NOT NULL DEFAULT '5184000' COMMENT 'Delay in minutes between occurences of the event',
  `length` bigint(20) unsigned NOT NULL DEFAULT '2592000' COMMENT 'Length in minutes of the event',
  `holiday` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Client side holiday id',
  `description` varchar(255) DEFAULT NULL COMMENT 'Description of the event displayed in console',
  `hardcoded` tinyint(3) NOT NULL DEFAULT '0',
  `disabled` tinyint(3) NOT NULL DEFAULT '0',
  `patch_min` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `patch_max` tinyint(3) unsigned NOT NULL DEFAULT '10',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mangos.game_event_creature
DROP TABLE IF EXISTS `game_event_creature`;
CREATE TABLE IF NOT EXISTS `game_event_creature` (
  `guid` int(10) unsigned NOT NULL,
  `event` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Put negatives values to remove during event',
  PRIMARY KEY (`guid`,`event`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mangos.game_event_creature_data
DROP TABLE IF EXISTS `game_event_creature_data`;
CREATE TABLE IF NOT EXISTS `game_event_creature_data` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0',
  `entry_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `modelid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `equipment_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `spell_start` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `spell_end` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `event` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`event`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mangos.game_event_gameobject
DROP TABLE IF EXISTS `game_event_gameobject`;
CREATE TABLE IF NOT EXISTS `game_event_gameobject` (
  `guid` int(10) unsigned NOT NULL,
  `event` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Put negatives values to remove during event',
  PRIMARY KEY (`guid`,`event`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mangos.game_event_mail
DROP TABLE IF EXISTS `game_event_mail`;
CREATE TABLE IF NOT EXISTS `game_event_mail` (
  `event` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Negatives value to send at event stop, positive value for send at event start.',
  `raceMask` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `quest` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `mailTemplateId` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `senderEntry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`event`,`raceMask`,`quest`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Game event system';

-- Data exporting was unselected.


-- Dumping structure for table mangos.game_event_quest
DROP TABLE IF EXISTS `game_event_quest`;
CREATE TABLE IF NOT EXISTS `game_event_quest` (
  `quest` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'entry from quest_template',
  `event` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'entry from game_event',
  `patch` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`quest`,`event`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Game event system';

-- Data exporting was unselected.


-- Dumping structure for table mangos.game_graveyard_zone
DROP TABLE IF EXISTS `game_graveyard_zone`;
CREATE TABLE IF NOT EXISTS `game_graveyard_zone` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ghost_zone` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `faction` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`ghost_zone`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Trigger System';

-- Data exporting was unselected.


-- Dumping structure for table mangos.game_tele
DROP TABLE IF EXISTS `game_tele`;
CREATE TABLE IF NOT EXISTS `game_tele` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  `map` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Tele Command';

-- Data exporting was unselected.


-- Dumping structure for table mangos.game_weather
DROP TABLE IF EXISTS `game_weather`;
CREATE TABLE IF NOT EXISTS `game_weather` (
  `zone` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `spring_rain_chance` tinyint(3) unsigned NOT NULL DEFAULT '25',
  `spring_snow_chance` tinyint(3) unsigned NOT NULL DEFAULT '25',
  `spring_storm_chance` tinyint(3) unsigned NOT NULL DEFAULT '25',
  `summer_rain_chance` tinyint(3) unsigned NOT NULL DEFAULT '25',
  `summer_snow_chance` tinyint(3) unsigned NOT NULL DEFAULT '25',
  `summer_storm_chance` tinyint(3) unsigned NOT NULL DEFAULT '25',
  `fall_rain_chance` tinyint(3) unsigned NOT NULL DEFAULT '25',
  `fall_snow_chance` tinyint(3) unsigned NOT NULL DEFAULT '25',
  `fall_storm_chance` tinyint(3) unsigned NOT NULL DEFAULT '25',
  `winter_rain_chance` tinyint(3) unsigned NOT NULL DEFAULT '25',
  `winter_snow_chance` tinyint(3) unsigned NOT NULL DEFAULT '25',
  `winter_storm_chance` tinyint(3) unsigned NOT NULL DEFAULT '25',
  PRIMARY KEY (`zone`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Weather System';

-- Data exporting was unselected.


-- Dumping structure for table mangos.gm_subsurveys
DROP TABLE IF EXISTS `gm_subsurveys`;
CREATE TABLE IF NOT EXISTS `gm_subsurveys` (
  `surveyId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subsurveyId` int(10) unsigned NOT NULL DEFAULT '0',
  `rank` int(10) unsigned NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  PRIMARY KEY (`surveyId`,`subsurveyId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Player System';

-- Data exporting was unselected.


-- Dumping structure for table mangos.gm_surveys
DROP TABLE IF EXISTS `gm_surveys`;
CREATE TABLE IF NOT EXISTS `gm_surveys` (
  `surveyId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `guid` int(10) unsigned NOT NULL DEFAULT '0',
  `mainSurvey` int(10) unsigned NOT NULL DEFAULT '0',
  `overallComment` longtext NOT NULL,
  `createTime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`surveyId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Player System';

-- Data exporting was unselected.


-- Dumping structure for table mangos.gm_tickets
DROP TABLE IF EXISTS `gm_tickets`;
CREATE TABLE IF NOT EXISTS `gm_tickets` (
  `ticketId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `guid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier of ticket creator',
  `name` varchar(12) NOT NULL COMMENT 'Name of ticket creator',
  `message` text NOT NULL,
  `createTime` int(10) unsigned NOT NULL DEFAULT '0',
  `mapId` smallint(5) unsigned NOT NULL DEFAULT '0',
  `posX` float NOT NULL DEFAULT '0',
  `posY` float NOT NULL DEFAULT '0',
  `posZ` float NOT NULL DEFAULT '0',
  `lastModifiedTime` int(10) unsigned NOT NULL DEFAULT '0',
  `closedBy` int(10) NOT NULL DEFAULT '0',
  `assignedTo` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'GUID of admin to whom ticket is assigned',
  `comment` text NOT NULL,
  `response` text NOT NULL,
  `completed` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `escalated` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `viewed` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `haveTicket` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ticketType` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `securityNeeded` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ticketId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Player System';

-- Data exporting was unselected.


-- Dumping structure for table mangos.gossip_menu
DROP TABLE IF EXISTS `gossip_menu`;
CREATE TABLE IF NOT EXISTS `gossip_menu` (
  `entry` smallint(6) unsigned NOT NULL DEFAULT '0',
  `text_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `condition_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`text_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mangos.gossip_menu_option
DROP TABLE IF EXISTS `gossip_menu_option`;
CREATE TABLE IF NOT EXISTS `gossip_menu_option` (
  `menu_id` smallint(6) unsigned NOT NULL DEFAULT '0',
  `id` smallint(6) unsigned NOT NULL DEFAULT '0',
  `option_icon` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `option_text` text CHARACTER SET utf8,
  `OptionBroadcastTextID` mediumint(6) unsigned NOT NULL DEFAULT '0',
  `option_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `npc_option_npcflag` int(10) unsigned NOT NULL DEFAULT '0',
  `action_menu_id` mediumint(8) NOT NULL DEFAULT '0',
  `action_poi_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `action_script_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `box_coded` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `box_money` int(11) unsigned NOT NULL DEFAULT '0',
  `box_text` text CHARACTER SET utf8,
  `BoxBroadcastTextID` mediumint(6) unsigned NOT NULL DEFAULT '0',
  `condition_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`menu_id`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table mangos.gossip_scripts
DROP TABLE IF EXISTS `gossip_scripts`;
CREATE TABLE IF NOT EXISTS `gossip_scripts` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `delay` int(10) unsigned NOT NULL DEFAULT '0',
  `command` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `datalong` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `datalong2` int(10) unsigned NOT NULL DEFAULT '0',
  `datalong3` int(10) unsigned NOT NULL DEFAULT '0',
  `datalong4` int(10) unsigned NOT NULL DEFAULT '0',
  `buddy_id` int(10) unsigned NOT NULL DEFAULT '0',
  `buddy_radius` int(10) unsigned NOT NULL DEFAULT '0',
  `buddy_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `data_flags` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `dataint` int(11) NOT NULL DEFAULT '0',
  `dataint2` int(11) NOT NULL DEFAULT '0',
  `dataint3` int(11) NOT NULL DEFAULT '0',
  `dataint4` int(11) NOT NULL DEFAULT '0',
  `x` float NOT NULL DEFAULT '0',
  `y` float NOT NULL DEFAULT '0',
  `z` float NOT NULL DEFAULT '0',
  `o` float NOT NULL DEFAULT '0',
  `comments` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mangos.gossip_texts
DROP TABLE IF EXISTS `gossip_texts`;
CREATE TABLE IF NOT EXISTS `gossip_texts` (
  `entry` mediumint(8) NOT NULL,
  `content_default` text NOT NULL,
  `content_loc1` text,
  `content_loc2` text,
  `content_loc3` text,
  `content_loc4` text,
  `content_loc5` text,
  `content_loc6` text,
  `content_loc7` text,
  `content_loc8` text,
  `comment` text,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Gossip Texts';

-- Data exporting was unselected.


-- Dumping structure for table mangos.instance_buff_removal
DROP TABLE IF EXISTS `instance_buff_removal`;
CREATE TABLE IF NOT EXISTS `instance_buff_removal` (
  `mapId` int(10) unsigned NOT NULL COMMENT 'MapId to remove aura from',
  `auraId` int(10) unsigned NOT NULL COMMENT 'aura id to remove on entering MapId',
  `enabled` tinyint(1) NOT NULL COMMENT 'aura removal enabled or not',
  `flags` int(10) NOT NULL COMMENT 'flags, see AuraRemovalMgr.h',
  `comment` varchar(256) NOT NULL COMMENT 'description, what is removed',
  PRIMARY KEY (`mapId`,`auraId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Aura removal on map entry';

-- Data exporting was unselected.


-- Dumping structure for table mangos.instance_creature_kills
DROP TABLE IF EXISTS `instance_creature_kills`;
CREATE TABLE IF NOT EXISTS `instance_creature_kills` (
  `mapId` int(10) unsigned NOT NULL COMMENT 'MapId to where creature exist',
  `creatureEntry` int(10) unsigned NOT NULL COMMENT 'entry of the creature who performed the kill',
  `spellEntry` int(10) NOT NULL COMMENT 'entry of spell which did the kill. 0 for melee or unknown',
  `count` int(10) unsigned NOT NULL COMMENT 'number of kills',
  PRIMARY KEY (`mapId`,`creatureEntry`,`spellEntry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='creatures killing players statistics';

-- Data exporting was unselected.


-- Dumping structure for table mangos.instance_custom_counters
DROP TABLE IF EXISTS `instance_custom_counters`;
CREATE TABLE IF NOT EXISTS `instance_custom_counters` (
  `index` int(10) unsigned NOT NULL COMMENT 'index as defined in InstanceStatistics.h',
  `count` int(10) unsigned NOT NULL COMMENT 'counter',
  PRIMARY KEY (`index`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='custom counters for instance statistics';

-- Data exporting was unselected.


-- Dumping structure for table mangos.instance_wipes
DROP TABLE IF EXISTS `instance_wipes`;
CREATE TABLE IF NOT EXISTS `instance_wipes` (
  `mapId` int(10) unsigned NOT NULL COMMENT 'MapId to where creature exist',
  `creatureEntry` int(10) unsigned NOT NULL COMMENT 'creature which the wipe occured against',
  `count` int(10) unsigned NOT NULL COMMENT 'number of wipes',
  PRIMARY KEY (`mapId`,`creatureEntry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='players wiping against creatures statistics';

-- Data exporting was unselected.


-- Dumping structure for table mangos.item_display_info
DROP TABLE IF EXISTS `item_display_info`;
CREATE TABLE IF NOT EXISTS `item_display_info` (
  `field0` int(11) NOT NULL,
  `field5` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table mangos.item_enchantment_template
DROP TABLE IF EXISTS `item_enchantment_template`;
CREATE TABLE IF NOT EXISTS `item_enchantment_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ench` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `chance` float unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`ench`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Item Random Enchantment System';

-- Data exporting was unselected.


-- Dumping structure for table mangos.item_loot_template
DROP TABLE IF EXISTS `item_loot_template`;
CREATE TABLE IF NOT EXISTS `item_loot_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `item` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ChanceOrQuestChance` float NOT NULL DEFAULT '100',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mincountOrRef` mediumint(9) NOT NULL DEFAULT '1',
  `maxcount` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `condition_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Loot System';

-- Data exporting was unselected.


-- Dumping structure for table mangos.item_required_target
DROP TABLE IF EXISTS `item_required_target`;
CREATE TABLE IF NOT EXISTS `item_required_target` (
  `entry` mediumint(8) unsigned NOT NULL,
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `targetEntry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `entry_type_target` (`entry`,`type`,`targetEntry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

-- Data exporting was unselected.


-- Dumping structure for table mangos.item_template
DROP TABLE IF EXISTS `item_template`;
CREATE TABLE IF NOT EXISTS `item_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `patch` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `class` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `subclass` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `displayid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `Quality` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Flags` int(10) unsigned NOT NULL DEFAULT '0',
  `BuyCount` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `BuyPrice` int(10) unsigned NOT NULL DEFAULT '0',
  `SellPrice` int(10) unsigned NOT NULL DEFAULT '0',
  `InventoryType` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `AllowableClass` mediumint(9) NOT NULL DEFAULT '-1',
  `AllowableRace` mediumint(9) NOT NULL DEFAULT '-1',
  `ItemLevel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `RequiredLevel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `RequiredSkill` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredSkillRank` smallint(5) unsigned NOT NULL DEFAULT '0',
  `requiredspell` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `requiredhonorrank` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RequiredCityRank` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RequiredReputationFaction` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredReputationRank` smallint(5) unsigned NOT NULL DEFAULT '0',
  `maxcount` smallint(5) unsigned NOT NULL DEFAULT '0',
  `stackable` smallint(5) unsigned NOT NULL DEFAULT '1',
  `ContainerSlots` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `stat_type1` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `stat_value1` smallint(6) NOT NULL DEFAULT '0',
  `stat_type2` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `stat_value2` smallint(6) NOT NULL DEFAULT '0',
  `stat_type3` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `stat_value3` smallint(6) NOT NULL DEFAULT '0',
  `stat_type4` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `stat_value4` smallint(6) NOT NULL DEFAULT '0',
  `stat_type5` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `stat_value5` smallint(6) NOT NULL DEFAULT '0',
  `stat_type6` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `stat_value6` smallint(6) NOT NULL DEFAULT '0',
  `stat_type7` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `stat_value7` smallint(6) NOT NULL DEFAULT '0',
  `stat_type8` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `stat_value8` smallint(6) NOT NULL DEFAULT '0',
  `stat_type9` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `stat_value9` smallint(6) NOT NULL DEFAULT '0',
  `stat_type10` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `stat_value10` smallint(6) NOT NULL DEFAULT '0',
  `dmg_min1` float NOT NULL DEFAULT '0',
  `dmg_max1` float NOT NULL DEFAULT '0',
  `dmg_type1` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `dmg_min2` float NOT NULL DEFAULT '0',
  `dmg_max2` float NOT NULL DEFAULT '0',
  `dmg_type2` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `dmg_min3` float NOT NULL DEFAULT '0',
  `dmg_max3` float NOT NULL DEFAULT '0',
  `dmg_type3` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `dmg_min4` float NOT NULL DEFAULT '0',
  `dmg_max4` float NOT NULL DEFAULT '0',
  `dmg_type4` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `dmg_min5` float NOT NULL DEFAULT '0',
  `dmg_max5` float NOT NULL DEFAULT '0',
  `dmg_type5` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `armor` smallint(5) unsigned NOT NULL DEFAULT '0',
  `holy_res` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `fire_res` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `nature_res` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `frost_res` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `shadow_res` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `arcane_res` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `delay` smallint(5) unsigned NOT NULL DEFAULT '1000',
  `ammo_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `RangedModRange` float NOT NULL DEFAULT '0',
  `spellid_1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `spelltrigger_1` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `spellcharges_1` tinyint(4) NOT NULL DEFAULT '0',
  `spellppmRate_1` float NOT NULL DEFAULT '0',
  `spellcooldown_1` int(11) NOT NULL DEFAULT '-1',
  `spellcategory_1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `spellcategorycooldown_1` int(11) NOT NULL DEFAULT '-1',
  `spellid_2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `spelltrigger_2` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `spellcharges_2` tinyint(4) NOT NULL DEFAULT '0',
  `spellppmRate_2` float NOT NULL DEFAULT '0',
  `spellcooldown_2` int(11) NOT NULL DEFAULT '-1',
  `spellcategory_2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `spellcategorycooldown_2` int(11) NOT NULL DEFAULT '-1',
  `spellid_3` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `spelltrigger_3` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `spellcharges_3` tinyint(4) NOT NULL DEFAULT '0',
  `spellppmRate_3` float NOT NULL DEFAULT '0',
  `spellcooldown_3` int(11) NOT NULL DEFAULT '-1',
  `spellcategory_3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `spellcategorycooldown_3` int(11) NOT NULL DEFAULT '-1',
  `spellid_4` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `spelltrigger_4` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `spellcharges_4` tinyint(4) NOT NULL DEFAULT '0',
  `spellppmRate_4` float NOT NULL DEFAULT '0',
  `spellcooldown_4` int(11) NOT NULL DEFAULT '-1',
  `spellcategory_4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `spellcategorycooldown_4` int(11) NOT NULL DEFAULT '-1',
  `spellid_5` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `spelltrigger_5` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `spellcharges_5` tinyint(4) NOT NULL DEFAULT '0',
  `spellppmRate_5` float NOT NULL DEFAULT '0',
  `spellcooldown_5` int(11) NOT NULL DEFAULT '-1',
  `spellcategory_5` smallint(5) unsigned NOT NULL DEFAULT '0',
  `spellcategorycooldown_5` int(11) NOT NULL DEFAULT '-1',
  `bonding` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL DEFAULT '',
  `PageText` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `LanguageID` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `PageMaterial` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `startquest` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `lockid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `Material` tinyint(4) NOT NULL DEFAULT '0',
  `sheath` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `RandomProperty` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `block` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `itemset` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `MaxDurability` smallint(5) unsigned NOT NULL DEFAULT '0',
  `area` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `Map` smallint(6) NOT NULL DEFAULT '0',
  `BagFamily` mediumint(9) NOT NULL DEFAULT '0',
  `ScriptName` varchar(64) NOT NULL DEFAULT '',
  `DisenchantID` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `FoodType` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `minMoneyLoot` int(10) unsigned NOT NULL DEFAULT '0',
  `maxMoneyLoot` int(10) unsigned NOT NULL DEFAULT '0',
  `Duration` int(11) unsigned NOT NULL DEFAULT '0',
  `ExtraFlags` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `OtherTeamEntry` int(11) unsigned DEFAULT '1',
  PRIMARY KEY (`entry`,`patch`),
  KEY `items_index` (`class`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Item System';

-- Data exporting was unselected.


-- Dumping structure for table mangos.locales_area
DROP TABLE IF EXISTS `locales_area`;
CREATE TABLE IF NOT EXISTS `locales_area` (
  `Entry` mediumint(8) NOT NULL DEFAULT '0',
  `NameLoc1` varchar(100) NOT NULL DEFAULT '',
  `NameLoc2` varchar(100) NOT NULL DEFAULT '',
  `NameLoc3` varchar(100) NOT NULL DEFAULT '',
  `NameLoc4` varchar(100) NOT NULL DEFAULT '',
  `NameLoc5` varchar(100) NOT NULL DEFAULT '',
  `NameLoc6` varchar(100) NOT NULL DEFAULT '',
  `NameLoc7` varchar(100) NOT NULL DEFAULT '',
  `NameLoc8` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`Entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mangos.locales_broadcast_text
DROP TABLE IF EXISTS `locales_broadcast_text`;
CREATE TABLE IF NOT EXISTS `locales_broadcast_text` (
  `ID` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `MaleText_loc1` longtext,
  `MaleText_loc2` longtext,
  `MaleText_loc3` longtext,
  `MaleText_loc4` longtext,
  `MaleText_loc5` longtext,
  `MaleText_loc6` longtext,
  `MaleText_loc7` longtext,
  `MaleText_loc8` longtext,
  `FemaleText_loc1` longtext,
  `FemaleText_loc2` longtext,
  `FemaleText_loc3` longtext,
  `FemaleText_loc4` longtext,
  `FemaleText_loc5` longtext,
  `FemaleText_loc6` longtext,
  `FemaleText_loc7` longtext,
  `FemaleText_loc8` longtext,
  `VerifiedBuild` smallint(5) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mangos.locales_creature
DROP TABLE IF EXISTS `locales_creature`;
CREATE TABLE IF NOT EXISTS `locales_creature` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `name_loc1` varchar(100) NOT NULL DEFAULT '',
  `name_loc2` varchar(100) NOT NULL DEFAULT '',
  `name_loc3` varchar(100) NOT NULL DEFAULT '',
  `name_loc4` varchar(100) NOT NULL DEFAULT '',
  `name_loc5` varchar(100) NOT NULL DEFAULT '',
  `name_loc6` varchar(100) NOT NULL DEFAULT '',
  `name_loc7` varchar(100) NOT NULL DEFAULT '',
  `name_loc8` varchar(100) NOT NULL DEFAULT '',
  `subname_loc1` varchar(100) DEFAULT NULL,
  `subname_loc2` varchar(100) DEFAULT NULL,
  `subname_loc3` varchar(100) DEFAULT NULL,
  `subname_loc4` varchar(100) DEFAULT NULL,
  `subname_loc5` varchar(100) DEFAULT NULL,
  `subname_loc6` varchar(100) DEFAULT NULL,
  `subname_loc7` varchar(100) DEFAULT NULL,
  `subname_loc8` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mangos.locales_gameobject
DROP TABLE IF EXISTS `locales_gameobject`;
CREATE TABLE IF NOT EXISTS `locales_gameobject` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `name_loc1` varchar(100) NOT NULL DEFAULT '',
  `name_loc2` varchar(100) NOT NULL DEFAULT '',
  `name_loc3` varchar(100) NOT NULL DEFAULT '',
  `name_loc4` varchar(100) NOT NULL DEFAULT '',
  `name_loc5` varchar(100) NOT NULL DEFAULT '',
  `name_loc6` varchar(100) NOT NULL DEFAULT '',
  `name_loc7` varchar(100) NOT NULL DEFAULT '',
  `name_loc8` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mangos.locales_gossip_menu_option
DROP TABLE IF EXISTS `locales_gossip_menu_option`;
CREATE TABLE IF NOT EXISTS `locales_gossip_menu_option` (
  `menu_id` smallint(6) unsigned NOT NULL DEFAULT '0',
  `id` smallint(6) unsigned NOT NULL DEFAULT '0',
  `option_text_loc1` text,
  `option_text_loc2` text,
  `option_text_loc3` text,
  `option_text_loc4` text,
  `option_text_loc5` text,
  `option_text_loc6` text,
  `option_text_loc7` text,
  `option_text_loc8` text,
  `box_text_loc1` text,
  `box_text_loc2` text,
  `box_text_loc3` text,
  `box_text_loc4` text,
  `box_text_loc5` text,
  `box_text_loc6` text,
  `box_text_loc7` text,
  `box_text_loc8` text,
  PRIMARY KEY (`menu_id`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mangos.locales_item
DROP TABLE IF EXISTS `locales_item`;
CREATE TABLE IF NOT EXISTS `locales_item` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `name_loc1` varchar(100) NOT NULL DEFAULT '',
  `name_loc2` varchar(100) NOT NULL DEFAULT '',
  `name_loc3` varchar(100) NOT NULL DEFAULT '',
  `name_loc4` varchar(100) NOT NULL DEFAULT '',
  `name_loc5` varchar(100) NOT NULL DEFAULT '',
  `name_loc6` varchar(100) NOT NULL DEFAULT '',
  `name_loc7` varchar(100) NOT NULL DEFAULT '',
  `name_loc8` varchar(100) NOT NULL DEFAULT '',
  `description_loc1` varchar(255) DEFAULT NULL,
  `description_loc2` varchar(255) DEFAULT NULL,
  `description_loc3` varchar(255) DEFAULT NULL,
  `description_loc4` varchar(255) DEFAULT NULL,
  `description_loc5` varchar(255) DEFAULT NULL,
  `description_loc6` varchar(255) DEFAULT NULL,
  `description_loc7` varchar(255) DEFAULT NULL,
  `description_loc8` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mangos.locales_page_text
DROP TABLE IF EXISTS `locales_page_text`;
CREATE TABLE IF NOT EXISTS `locales_page_text` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `Text_loc1` longtext,
  `Text_loc2` longtext,
  `Text_loc3` longtext,
  `Text_loc4` longtext,
  `Text_loc5` longtext,
  `Text_loc6` longtext,
  `Text_loc7` longtext,
  `Text_loc8` longtext,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mangos.locales_points_of_interest
DROP TABLE IF EXISTS `locales_points_of_interest`;
CREATE TABLE IF NOT EXISTS `locales_points_of_interest` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `icon_name_loc1` text,
  `icon_name_loc2` text,
  `icon_name_loc3` text,
  `icon_name_loc4` text,
  `icon_name_loc5` text,
  `icon_name_loc6` text,
  `icon_name_loc7` text,
  `icon_name_loc8` text,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mangos.locales_quest
DROP TABLE IF EXISTS `locales_quest`;
CREATE TABLE IF NOT EXISTS `locales_quest` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `Title_loc1` text,
  `Title_loc2` text,
  `Title_loc3` text,
  `Title_loc4` text,
  `Title_loc5` text,
  `Title_loc6` text,
  `Title_loc7` text,
  `Title_loc8` text,
  `Details_loc1` text,
  `Details_loc2` text,
  `Details_loc3` text,
  `Details_loc4` text,
  `Details_loc5` text,
  `Details_loc6` text,
  `Details_loc7` text,
  `Details_loc8` text,
  `Objectives_loc1` text,
  `Objectives_loc2` text,
  `Objectives_loc3` text,
  `Objectives_loc4` text,
  `Objectives_loc5` text,
  `Objectives_loc6` text,
  `Objectives_loc7` text,
  `Objectives_loc8` text,
  `OfferRewardText_loc1` text,
  `OfferRewardText_loc2` text,
  `OfferRewardText_loc3` text,
  `OfferRewardText_loc4` text,
  `OfferRewardText_loc5` text,
  `OfferRewardText_loc6` text,
  `OfferRewardText_loc7` text,
  `OfferRewardText_loc8` text,
  `RequestItemsText_loc1` text,
  `RequestItemsText_loc2` text,
  `RequestItemsText_loc3` text,
  `RequestItemsText_loc4` text,
  `RequestItemsText_loc5` text,
  `RequestItemsText_loc6` text,
  `RequestItemsText_loc7` text,
  `RequestItemsText_loc8` text,
  `EndText_loc1` text,
  `EndText_loc2` text,
  `EndText_loc3` text,
  `EndText_loc4` text,
  `EndText_loc5` text,
  `EndText_loc6` text,
  `EndText_loc7` text,
  `EndText_loc8` text,
  `ObjectiveText1_loc1` text,
  `ObjectiveText1_loc2` text,
  `ObjectiveText1_loc3` text,
  `ObjectiveText1_loc4` text,
  `ObjectiveText1_loc5` text,
  `ObjectiveText1_loc6` text,
  `ObjectiveText1_loc7` text,
  `ObjectiveText1_loc8` text,
  `ObjectiveText2_loc1` text,
  `ObjectiveText2_loc2` text,
  `ObjectiveText2_loc3` text,
  `ObjectiveText2_loc4` text,
  `ObjectiveText2_loc5` text,
  `ObjectiveText2_loc6` text,
  `ObjectiveText2_loc7` text,
  `ObjectiveText2_loc8` text,
  `ObjectiveText3_loc1` text,
  `ObjectiveText3_loc2` text,
  `ObjectiveText3_loc3` text,
  `ObjectiveText3_loc4` text,
  `ObjectiveText3_loc5` text,
  `ObjectiveText3_loc6` text,
  `ObjectiveText3_loc7` text,
  `ObjectiveText3_loc8` text,
  `ObjectiveText4_loc1` text,
  `ObjectiveText4_loc2` text,
  `ObjectiveText4_loc3` text,
  `ObjectiveText4_loc4` text,
  `ObjectiveText4_loc5` text,
  `ObjectiveText4_loc6` text,
  `ObjectiveText4_loc7` text,
  `ObjectiveText4_loc8` text,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mangos.mail_loot_template
DROP TABLE IF EXISTS `mail_loot_template`;
CREATE TABLE IF NOT EXISTS `mail_loot_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `item` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ChanceOrQuestChance` float NOT NULL DEFAULT '100',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mincountOrRef` mediumint(9) NOT NULL DEFAULT '1',
  `maxcount` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `condition_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Loot System';

-- Data exporting was unselected.


-- Dumping structure for table mangos.mangos_string
DROP TABLE IF EXISTS `mangos_string`;
CREATE TABLE IF NOT EXISTS `mangos_string` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `content_default` text NOT NULL,
  `content_loc1` text,
  `content_loc2` text,
  `content_loc3` text,
  `content_loc4` text,
  `content_loc5` text,
  `content_loc6` text,
  `content_loc7` text,
  `content_loc8` text,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mangos.map_loot_disabled
DROP TABLE IF EXISTS `map_loot_disabled`;
CREATE TABLE IF NOT EXISTS `map_loot_disabled` (
  `mapid` int(11) NOT NULL DEFAULT '0',
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`mapid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table mangos.map_template
DROP TABLE IF EXISTS `map_template`;
CREATE TABLE IF NOT EXISTS `map_template` (
  `Entry` smallint(5) unsigned NOT NULL,
  `patch` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Parent` int(10) unsigned NOT NULL DEFAULT '0',
  `MapType` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `LinkedZone` int(10) unsigned NOT NULL DEFAULT '0',
  `LevelMin` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `LevelMax` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `MaxPlayers` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ResetDelay` int(10) unsigned NOT NULL DEFAULT '0',
  `GhostEntranceMap` smallint(5) NOT NULL DEFAULT '-1',
  `GhostEntranceX` float NOT NULL DEFAULT '0',
  `GhostEntranceY` float NOT NULL DEFAULT '0',
  `MapName` varchar(128) NOT NULL DEFAULT '',
  `ScriptName` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`Entry`,`patch`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mangos.migrations
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mangos.nostalrius_string
DROP TABLE IF EXISTS `nostalrius_string`;
CREATE TABLE IF NOT EXISTS `nostalrius_string` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `content_default` text NOT NULL,
  `content_loc1` text,
  `content_loc2` text,
  `content_loc3` text,
  `content_loc4` text,
  `content_loc5` text,
  `content_loc6` text,
  `content_loc7` text,
  `content_loc8` text,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mangos.npc_gossip
DROP TABLE IF EXISTS `npc_gossip`;
CREATE TABLE IF NOT EXISTS `npc_gossip` (
  `npc_guid` int(10) unsigned NOT NULL DEFAULT '0',
  `textid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`npc_guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mangos.npc_text
DROP TABLE IF EXISTS `npc_text`;
CREATE TABLE IF NOT EXISTS `npc_text` (
  `ID` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `BroadcastTextID0` mediumint(6) unsigned NOT NULL DEFAULT '0',
  `Probability0` float NOT NULL DEFAULT '0',
  `BroadcastTextID1` mediumint(6) unsigned NOT NULL DEFAULT '0',
  `Probability1` float NOT NULL DEFAULT '0',
  `BroadcastTextID2` mediumint(6) unsigned NOT NULL DEFAULT '0',
  `Probability2` float NOT NULL DEFAULT '0',
  `BroadcastTextID3` mediumint(6) unsigned NOT NULL DEFAULT '0',
  `Probability3` float NOT NULL DEFAULT '0',
  `BroadcastTextID4` mediumint(6) unsigned NOT NULL DEFAULT '0',
  `Probability4` float NOT NULL DEFAULT '0',
  `BroadcastTextID5` mediumint(6) unsigned NOT NULL DEFAULT '0',
  `Probability5` float NOT NULL DEFAULT '0',
  `BroadcastTextID6` mediumint(6) unsigned NOT NULL DEFAULT '0',
  `Probability6` float NOT NULL DEFAULT '0',
  `BroadcastTextID7` mediumint(6) unsigned NOT NULL DEFAULT '0',
  `Probability7` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mangos.npc_trainer
DROP TABLE IF EXISTS `npc_trainer`;
CREATE TABLE IF NOT EXISTS `npc_trainer` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `spell` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `spellcost` int(10) unsigned NOT NULL DEFAULT '0',
  `reqskill` smallint(5) unsigned NOT NULL DEFAULT '0',
  `reqskillvalue` smallint(5) unsigned NOT NULL DEFAULT '0',
  `reqlevel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `entry_spell` (`entry`,`spell`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mangos.npc_trainer_template
DROP TABLE IF EXISTS `npc_trainer_template`;
CREATE TABLE IF NOT EXISTS `npc_trainer_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `spell` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `spellcost` int(10) unsigned NOT NULL DEFAULT '0',
  `reqskill` smallint(5) unsigned NOT NULL DEFAULT '0',
  `reqskillvalue` smallint(5) unsigned NOT NULL DEFAULT '0',
  `reqlevel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `entry_spell` (`entry`,`spell`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mangos.npc_vendor
DROP TABLE IF EXISTS `npc_vendor`;
CREATE TABLE IF NOT EXISTS `npc_vendor` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `item` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `maxcount` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `incrtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Npc System';

-- Data exporting was unselected.


-- Dumping structure for table mangos.npc_vendor_template
DROP TABLE IF EXISTS `npc_vendor_template`;
CREATE TABLE IF NOT EXISTS `npc_vendor_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `item` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `maxcount` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `incrtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Npc System';

-- Data exporting was unselected.


-- Dumping structure for table mangos.page_text
DROP TABLE IF EXISTS `page_text`;
CREATE TABLE IF NOT EXISTS `page_text` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `text` longtext NOT NULL,
  `next_page` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Item System';

-- Data exporting was unselected.


-- Dumping structure for table mangos.petcreateinfo_spell
DROP TABLE IF EXISTS `petcreateinfo_spell`;
CREATE TABLE IF NOT EXISTS `petcreateinfo_spell` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `Spell1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `Spell2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `Spell3` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `Spell4` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Pet Create Spells';

-- Data exporting was unselected.


-- Dumping structure for table mangos.pet_levelstats
DROP TABLE IF EXISTS `pet_levelstats`;
CREATE TABLE IF NOT EXISTS `pet_levelstats` (
  `creature_entry` mediumint(8) unsigned NOT NULL,
  `level` tinyint(3) unsigned NOT NULL,
  `hp` smallint(5) unsigned NOT NULL,
  `mana` smallint(5) unsigned NOT NULL,
  `armor` int(10) unsigned NOT NULL DEFAULT '0',
  `str` smallint(5) unsigned NOT NULL,
  `agi` smallint(5) unsigned NOT NULL,
  `sta` smallint(5) unsigned NOT NULL,
  `inte` smallint(5) unsigned NOT NULL,
  `spi` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`creature_entry`,`level`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 PACK_KEYS=0 COMMENT='Stores pet levels stats.';

-- Data exporting was unselected.


-- Dumping structure for table mangos.pet_name_generation
DROP TABLE IF EXISTS `pet_name_generation`;
CREATE TABLE IF NOT EXISTS `pet_name_generation` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `word` tinytext NOT NULL,
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `half` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mangos.pickpocketing_loot_template
DROP TABLE IF EXISTS `pickpocketing_loot_template`;
CREATE TABLE IF NOT EXISTS `pickpocketing_loot_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `item` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ChanceOrQuestChance` float NOT NULL DEFAULT '100',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mincountOrRef` mediumint(9) NOT NULL DEFAULT '1',
  `maxcount` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `condition_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Loot System';

-- Data exporting was unselected.


-- Dumping structure for table mangos.playerbot
DROP TABLE IF EXISTS `playerbot`;
CREATE TABLE IF NOT EXISTS `playerbot` (
  `char_guid` bigint(20) unsigned NOT NULL,
  `chance` int(10) unsigned NOT NULL DEFAULT '10',
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`char_guid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table mangos.playercreateinfo
DROP TABLE IF EXISTS `playercreateinfo`;
CREATE TABLE IF NOT EXISTS `playercreateinfo` (
  `race` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `class` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `map` smallint(5) unsigned NOT NULL DEFAULT '0',
  `zone` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`race`,`class`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mangos.playercreateinfo_action
DROP TABLE IF EXISTS `playercreateinfo_action`;
CREATE TABLE IF NOT EXISTS `playercreateinfo_action` (
  `race` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `class` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `button` smallint(5) unsigned NOT NULL DEFAULT '0',
  `action` int(11) unsigned NOT NULL DEFAULT '0',
  `type` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`race`,`class`,`button`),
  KEY `playercreateinfo_race_class_index` (`race`,`class`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mangos.playercreateinfo_item
DROP TABLE IF EXISTS `playercreateinfo_item`;
CREATE TABLE IF NOT EXISTS `playercreateinfo_item` (
  `race` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `class` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `itemid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `amount` tinyint(3) unsigned NOT NULL DEFAULT '1',
  KEY `playercreateinfo_race_class_index` (`race`,`class`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mangos.playercreateinfo_spell
DROP TABLE IF EXISTS `playercreateinfo_spell`;
CREATE TABLE IF NOT EXISTS `playercreateinfo_spell` (
  `race` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `class` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Spell` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `Note` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`race`,`class`,`Spell`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mangos.player_classlevelstats
DROP TABLE IF EXISTS `player_classlevelstats`;
CREATE TABLE IF NOT EXISTS `player_classlevelstats` (
  `class` tinyint(3) unsigned NOT NULL,
  `level` tinyint(3) unsigned NOT NULL,
  `basehp` smallint(5) unsigned NOT NULL,
  `basemana` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`class`,`level`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 PACK_KEYS=0 COMMENT='Stores levels stats.';

-- Data exporting was unselected.


-- Dumping structure for table mangos.player_factionchange_items
DROP TABLE IF EXISTS `player_factionchange_items`;
CREATE TABLE IF NOT EXISTS `player_factionchange_items` (
  `alliance_id` int(8) NOT NULL,
  `horde_id` int(8) NOT NULL,
  `comment` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`alliance_id`,`horde_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mangos.player_factionchange_mounts
DROP TABLE IF EXISTS `player_factionchange_mounts`;
CREATE TABLE IF NOT EXISTS `player_factionchange_mounts` (
  `RaceId` int(8) NOT NULL,
  `MountNum` int(8) NOT NULL,
  `ItemEntry` int(8) NOT NULL,
  `Comment` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`RaceId`,`MountNum`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mangos.player_factionchange_quests
DROP TABLE IF EXISTS `player_factionchange_quests`;
CREATE TABLE IF NOT EXISTS `player_factionchange_quests` (
  `alliance_id` int(8) NOT NULL,
  `horde_id` int(8) NOT NULL,
  `comment` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`alliance_id`,`horde_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mangos.player_factionchange_reputations
DROP TABLE IF EXISTS `player_factionchange_reputations`;
CREATE TABLE IF NOT EXISTS `player_factionchange_reputations` (
  `alliance_id` int(8) NOT NULL,
  `horde_id` int(8) NOT NULL,
  PRIMARY KEY (`alliance_id`,`horde_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mangos.player_factionchange_spells
DROP TABLE IF EXISTS `player_factionchange_spells`;
CREATE TABLE IF NOT EXISTS `player_factionchange_spells` (
  `alliance_id` int(8) NOT NULL,
  `horde_id` int(8) NOT NULL,
  `comment` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`alliance_id`,`horde_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mangos.player_levelstats
DROP TABLE IF EXISTS `player_levelstats`;
CREATE TABLE IF NOT EXISTS `player_levelstats` (
  `race` tinyint(3) unsigned NOT NULL,
  `class` tinyint(3) unsigned NOT NULL,
  `level` tinyint(3) unsigned NOT NULL,
  `str` tinyint(3) unsigned NOT NULL,
  `agi` tinyint(3) unsigned NOT NULL,
  `sta` tinyint(3) unsigned NOT NULL,
  `inte` tinyint(3) unsigned NOT NULL,
  `spi` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`race`,`class`,`level`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 PACK_KEYS=0 COMMENT='Stores levels stats.';

-- Data exporting was unselected.


-- Dumping structure for table mangos.player_xp_for_level
DROP TABLE IF EXISTS `player_xp_for_level`;
CREATE TABLE IF NOT EXISTS `player_xp_for_level` (
  `lvl` int(3) unsigned NOT NULL,
  `xp_for_next_level` int(10) unsigned NOT NULL,
  PRIMARY KEY (`lvl`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mangos.points_of_interest
DROP TABLE IF EXISTS `points_of_interest`;
CREATE TABLE IF NOT EXISTS `points_of_interest` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `x` float NOT NULL DEFAULT '0',
  `y` float NOT NULL DEFAULT '0',
  `icon` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `flags` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `data` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `icon_name` text NOT NULL,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mangos.pool_creature
DROP TABLE IF EXISTS `pool_creature`;
CREATE TABLE IF NOT EXISTS `pool_creature` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0',
  `pool_entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `chance` float unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) CHARACTER SET utf8 NOT NULL,
  `flags` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FLAG_SPAWN_ENABLE_IF_WORLD_POP_OVER_BLIZZLIKE = 1',
  PRIMARY KEY (`guid`),
  KEY `pool_idx` (`pool_entry`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table mangos.pool_creature_template
DROP TABLE IF EXISTS `pool_creature_template`;
CREATE TABLE IF NOT EXISTS `pool_creature_template` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `pool_entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `chance` float unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL,
  `flags` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FLAG_SPAWN_ENABLE_IF_WORLD_POP_OVER_BLIZZLIKE = 1',
  PRIMARY KEY (`id`),
  KEY `pool_idx` (`pool_entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mangos.pool_gameobject
DROP TABLE IF EXISTS `pool_gameobject`;
CREATE TABLE IF NOT EXISTS `pool_gameobject` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0',
  `pool_entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `chance` float unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) CHARACTER SET utf8 NOT NULL,
  `flags` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FLAG_SPAWN_ENABLE_IF_WORLD_POP_OVER_BLIZZLIKE = 1',
  PRIMARY KEY (`guid`),
  KEY `pool_idx` (`pool_entry`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table mangos.pool_gameobject_template
DROP TABLE IF EXISTS `pool_gameobject_template`;
CREATE TABLE IF NOT EXISTS `pool_gameobject_template` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `pool_entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `chance` float unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL,
  `flags` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FLAG_SPAWN_ENABLE_IF_WORLD_POP_OVER_BLIZZLIKE = 1',
  PRIMARY KEY (`id`),
  KEY `pool_idx` (`pool_entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mangos.pool_pool
DROP TABLE IF EXISTS `pool_pool`;
CREATE TABLE IF NOT EXISTS `pool_pool` (
  `pool_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `mother_pool` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `chance` float NOT NULL DEFAULT '0',
  `description` varchar(255) CHARACTER SET utf8 NOT NULL,
  `flags` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FLAG_SPAWN_ENABLE_IF_WORLD_POP_OVER_BLIZZLIKE = 1',
  PRIMARY KEY (`pool_id`),
  KEY `pool_idx` (`mother_pool`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table mangos.pool_template
DROP TABLE IF EXISTS `pool_template`;
CREATE TABLE IF NOT EXISTS `pool_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Pool entry',
  `max_limit` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Max number of objects (0) is no limit',
  `description` varchar(255) NOT NULL,
  `flags` int(11) unsigned NOT NULL DEFAULT '0',
  `instance` mediumint(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mangos.quest_end_scripts
DROP TABLE IF EXISTS `quest_end_scripts`;
CREATE TABLE IF NOT EXISTS `quest_end_scripts` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `delay` int(10) unsigned NOT NULL DEFAULT '0',
  `command` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `datalong` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `datalong2` int(10) unsigned NOT NULL DEFAULT '0',
  `datalong3` int(10) unsigned NOT NULL DEFAULT '0',
  `datalong4` int(10) unsigned NOT NULL DEFAULT '0',
  `buddy_id` int(10) unsigned NOT NULL DEFAULT '0',
  `buddy_radius` int(10) unsigned NOT NULL DEFAULT '0',
  `buddy_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `data_flags` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `dataint` int(11) NOT NULL DEFAULT '0',
  `dataint2` int(11) NOT NULL DEFAULT '0',
  `dataint3` int(11) NOT NULL DEFAULT '0',
  `dataint4` int(11) NOT NULL DEFAULT '0',
  `x` float NOT NULL DEFAULT '0',
  `y` float NOT NULL DEFAULT '0',
  `z` float NOT NULL DEFAULT '0',
  `o` float NOT NULL DEFAULT '0',
  `comments` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mangos.quest_greeting
DROP TABLE IF EXISTS `quest_greeting`;
CREATE TABLE IF NOT EXISTS `quest_greeting` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `content_default` text NOT NULL,
  `content_loc1` text,
  `content_loc2` text,
  `content_loc3` text,
  `content_loc4` text,
  `content_loc5` text,
  `content_loc6` text,
  `content_loc7` text,
  `content_loc8` text,
  `Emote` smallint(5) unsigned NOT NULL DEFAULT '0',
  `EmoteDelay` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mangos.quest_start_scripts
DROP TABLE IF EXISTS `quest_start_scripts`;
CREATE TABLE IF NOT EXISTS `quest_start_scripts` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `delay` int(10) unsigned NOT NULL DEFAULT '0',
  `command` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `datalong` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `datalong2` int(10) unsigned NOT NULL DEFAULT '0',
  `datalong3` int(10) unsigned NOT NULL DEFAULT '0',
  `datalong4` int(10) unsigned NOT NULL DEFAULT '0',
  `buddy_id` int(10) unsigned NOT NULL DEFAULT '0',
  `buddy_radius` int(10) unsigned NOT NULL DEFAULT '0',
  `buddy_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `data_flags` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `dataint` int(11) NOT NULL DEFAULT '0',
  `dataint2` int(11) NOT NULL DEFAULT '0',
  `dataint3` int(11) NOT NULL DEFAULT '0',
  `dataint4` int(11) NOT NULL DEFAULT '0',
  `x` float NOT NULL DEFAULT '0',
  `y` float NOT NULL DEFAULT '0',
  `z` float NOT NULL DEFAULT '0',
  `o` float NOT NULL DEFAULT '0',
  `comments` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mangos.quest_template
DROP TABLE IF EXISTS `quest_template`;
CREATE TABLE IF NOT EXISTS `quest_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `patch` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Method` tinyint(3) unsigned NOT NULL DEFAULT '2',
  `ZoneOrSort` smallint(6) NOT NULL DEFAULT '0',
  `MinLevel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `MaxLevel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `QuestLevel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Type` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredClasses` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredRaces` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredSkill` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredSkillValue` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RepObjectiveFaction` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RepObjectiveValue` mediumint(9) NOT NULL DEFAULT '0',
  `RequiredMinRepFaction` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredMinRepValue` mediumint(9) NOT NULL DEFAULT '0',
  `RequiredMaxRepFaction` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredMaxRepValue` mediumint(9) NOT NULL DEFAULT '0',
  `SuggestedPlayers` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `LimitTime` int(10) unsigned NOT NULL DEFAULT '0',
  `QuestFlags` smallint(5) unsigned NOT NULL DEFAULT '0',
  `SpecialFlags` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `PrevQuestId` mediumint(9) NOT NULL DEFAULT '0',
  `NextQuestId` mediumint(9) NOT NULL DEFAULT '0',
  `ExclusiveGroup` mediumint(9) NOT NULL DEFAULT '0',
  `NextQuestInChain` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `SrcItemId` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `SrcItemCount` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `SrcSpell` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `Title` text,
  `Details` text,
  `Objectives` text,
  `OfferRewardText` text,
  `RequestItemsText` text,
  `EndText` text,
  `ObjectiveText1` text,
  `ObjectiveText2` text,
  `ObjectiveText3` text,
  `ObjectiveText4` text,
  `ReqItemId1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ReqItemId2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ReqItemId3` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ReqItemId4` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ReqItemCount1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ReqItemCount2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ReqItemCount3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ReqItemCount4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ReqSourceId1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ReqSourceId2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ReqSourceId3` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ReqSourceId4` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ReqSourceCount1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ReqSourceCount2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ReqSourceCount3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ReqSourceCount4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ReqCreatureOrGOId1` mediumint(9) NOT NULL DEFAULT '0',
  `ReqCreatureOrGOId2` mediumint(9) NOT NULL DEFAULT '0',
  `ReqCreatureOrGOId3` mediumint(9) NOT NULL DEFAULT '0',
  `ReqCreatureOrGOId4` mediumint(9) NOT NULL DEFAULT '0',
  `ReqCreatureOrGOCount1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ReqCreatureOrGOCount2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ReqCreatureOrGOCount3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ReqCreatureOrGOCount4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ReqSpellCast1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ReqSpellCast2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ReqSpellCast3` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ReqSpellCast4` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RewChoiceItemId1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RewChoiceItemId2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RewChoiceItemId3` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RewChoiceItemId4` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RewChoiceItemId5` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RewChoiceItemId6` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RewChoiceItemCount1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RewChoiceItemCount2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RewChoiceItemCount3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RewChoiceItemCount4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RewChoiceItemCount5` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RewChoiceItemCount6` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RewItemId1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RewItemId2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RewItemId3` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RewItemId4` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RewItemCount1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RewItemCount2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RewItemCount3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RewItemCount4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RewRepFaction1` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'faction id from Faction.dbc in this case',
  `RewRepFaction2` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'faction id from Faction.dbc in this case',
  `RewRepFaction3` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'faction id from Faction.dbc in this case',
  `RewRepFaction4` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'faction id from Faction.dbc in this case',
  `RewRepFaction5` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'faction id from Faction.dbc in this case',
  `RewRepValue1` mediumint(9) NOT NULL DEFAULT '0',
  `RewRepValue2` mediumint(9) NOT NULL DEFAULT '0',
  `RewRepValue3` mediumint(9) NOT NULL DEFAULT '0',
  `RewRepValue4` mediumint(9) NOT NULL DEFAULT '0',
  `RewRepValue5` mediumint(9) NOT NULL DEFAULT '0',
  `RewOrReqMoney` int(11) NOT NULL DEFAULT '0',
  `RewMoneyMaxLevel` int(10) unsigned NOT NULL DEFAULT '0',
  `RewSpell` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RewSpellCast` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RewMailTemplateId` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RewMailDelaySecs` int(11) unsigned NOT NULL DEFAULT '0',
  `PointMapId` smallint(5) unsigned NOT NULL DEFAULT '0',
  `PointX` float NOT NULL DEFAULT '0',
  `PointY` float NOT NULL DEFAULT '0',
  `PointOpt` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `DetailsEmote1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `DetailsEmote2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `DetailsEmote3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `DetailsEmote4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `DetailsEmoteDelay1` int(11) unsigned NOT NULL DEFAULT '0',
  `DetailsEmoteDelay2` int(11) unsigned NOT NULL DEFAULT '0',
  `DetailsEmoteDelay3` int(11) unsigned NOT NULL DEFAULT '0',
  `DetailsEmoteDelay4` int(11) unsigned NOT NULL DEFAULT '0',
  `IncompleteEmote` smallint(5) unsigned NOT NULL DEFAULT '0',
  `CompleteEmote` smallint(5) unsigned NOT NULL DEFAULT '0',
  `OfferRewardEmote1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `OfferRewardEmote2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `OfferRewardEmote3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `OfferRewardEmote4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `OfferRewardEmoteDelay1` int(11) unsigned NOT NULL DEFAULT '0',
  `OfferRewardEmoteDelay2` int(11) unsigned NOT NULL DEFAULT '0',
  `OfferRewardEmoteDelay3` int(11) unsigned NOT NULL DEFAULT '0',
  `OfferRewardEmoteDelay4` int(11) unsigned NOT NULL DEFAULT '0',
  `StartScript` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `CompleteScript` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`patch`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Quest System';

-- Data exporting was unselected.


-- Dumping structure for table mangos.reference_loot_template
DROP TABLE IF EXISTS `reference_loot_template`;
CREATE TABLE IF NOT EXISTS `reference_loot_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `item` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ChanceOrQuestChance` float NOT NULL DEFAULT '100',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mincountOrRef` mediumint(9) NOT NULL DEFAULT '1',
  `maxcount` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `condition_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Loot System';

-- Data exporting was unselected.


-- Dumping structure for table mangos.reputation_reward_rate
DROP TABLE IF EXISTS `reputation_reward_rate`;
CREATE TABLE IF NOT EXISTS `reputation_reward_rate` (
  `faction` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `quest_rate` float NOT NULL DEFAULT '1',
  `creature_rate` float NOT NULL DEFAULT '1',
  `spell_rate` float NOT NULL DEFAULT '1',
  PRIMARY KEY (`faction`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mangos.reputation_spillover_template
DROP TABLE IF EXISTS `reputation_spillover_template`;
CREATE TABLE IF NOT EXISTS `reputation_spillover_template` (
  `faction` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT 'faction entry',
  `faction1` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT 'faction to give spillover for',
  `rate_1` float NOT NULL DEFAULT '0' COMMENT 'the given rep points * rate',
  `rank_1` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'max rank, above this will not give any spillover',
  `faction2` smallint(6) unsigned NOT NULL DEFAULT '0',
  `rate_2` float NOT NULL DEFAULT '0',
  `rank_2` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `faction3` smallint(6) unsigned NOT NULL DEFAULT '0',
  `rate_3` float NOT NULL DEFAULT '0',
  `rank_3` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `faction4` smallint(6) unsigned NOT NULL DEFAULT '0',
  `rate_4` float NOT NULL DEFAULT '0',
  `rank_4` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`faction`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Reputation spillover reputation gain';

-- Data exporting was unselected.


-- Dumping structure for table mangos.reserved_name
DROP TABLE IF EXISTS `reserved_name`;
CREATE TABLE IF NOT EXISTS `reserved_name` (
  `name` varchar(12) NOT NULL DEFAULT '',
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player Reserved Names';

-- Data exporting was unselected.


-- Dumping structure for table mangos.scripted_areatrigger
DROP TABLE IF EXISTS `scripted_areatrigger`;
CREATE TABLE IF NOT EXISTS `scripted_areatrigger` (
  `entry` mediumint(8) NOT NULL,
  `ScriptName` char(64) NOT NULL,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mangos.scripted_event_id
DROP TABLE IF EXISTS `scripted_event_id`;
CREATE TABLE IF NOT EXISTS `scripted_event_id` (
  `id` mediumint(8) NOT NULL,
  `ScriptName` char(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Script library scripted events';

-- Data exporting was unselected.


-- Dumping structure for table mangos.script_escort_data
DROP TABLE IF EXISTS `script_escort_data`;
CREATE TABLE IF NOT EXISTS `script_escort_data` (
  `creature_id` int(11) DEFAULT NULL,
  `quest` int(11) DEFAULT NULL,
  `escort_faction` int(11) DEFAULT NULL,
  UNIQUE KEY `creature_id` (`creature_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.


-- Dumping structure for table mangos.script_texts
DROP TABLE IF EXISTS `script_texts`;
CREATE TABLE IF NOT EXISTS `script_texts` (
  `entry` mediumint(8) NOT NULL,
  `content_default` text NOT NULL,
  `content_loc1` text,
  `content_loc2` text,
  `content_loc3` text,
  `content_loc4` text,
  `content_loc5` text,
  `content_loc6` text,
  `content_loc7` text,
  `content_loc8` text,
  `sound` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `language` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `emote` smallint(5) unsigned NOT NULL DEFAULT '0',
  `comment` text,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Script Texts';

-- Data exporting was unselected.


-- Dumping structure for table mangos.script_waypoint
DROP TABLE IF EXISTS `script_waypoint`;
CREATE TABLE IF NOT EXISTS `script_waypoint` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'creature_template entry',
  `pointid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `location_x` float NOT NULL DEFAULT '0',
  `location_y` float NOT NULL DEFAULT '0',
  `location_z` float NOT NULL DEFAULT '0',
  `waittime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'waittime in millisecs',
  `point_comment` text,
  PRIMARY KEY (`entry`,`pointid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Script Creature waypoints';

-- Data exporting was unselected.


-- Dumping structure for table mangos.skill_discovery_template
DROP TABLE IF EXISTS `skill_discovery_template`;
CREATE TABLE IF NOT EXISTS `skill_discovery_template` (
  `spellId` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'SpellId of the discoverable spell',
  `reqSpell` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'spell requirement',
  `chance` float NOT NULL DEFAULT '0' COMMENT 'chance to discover',
  PRIMARY KEY (`spellId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Skill Discovery System';

-- Data exporting was unselected.


-- Dumping structure for table mangos.skill_extra_item_template
DROP TABLE IF EXISTS `skill_extra_item_template`;
CREATE TABLE IF NOT EXISTS `skill_extra_item_template` (
  `spellId` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'SpellId of the item creation spell',
  `requiredSpecialization` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Specialization spell id',
  `additionalCreateChance` float NOT NULL DEFAULT '0' COMMENT 'chance to create add',
  `additionalMaxNum` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'max num of adds',
  PRIMARY KEY (`spellId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Skill Specialization System';

-- Data exporting was unselected.


-- Dumping structure for table mangos.skill_fishing_base_level
DROP TABLE IF EXISTS `skill_fishing_base_level`;
CREATE TABLE IF NOT EXISTS `skill_fishing_base_level` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Area identifier',
  `skill` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Base skill level requirement',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Fishing system';

-- Data exporting was unselected.


-- Dumping structure for table mangos.skinning_loot_template
DROP TABLE IF EXISTS `skinning_loot_template`;
CREATE TABLE IF NOT EXISTS `skinning_loot_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `item` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ChanceOrQuestChance` float NOT NULL DEFAULT '100',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mincountOrRef` mediumint(9) NOT NULL DEFAULT '1',
  `maxcount` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `condition_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Loot System';

-- Data exporting was unselected.


-- Dumping structure for table mangos.spell_affect
DROP TABLE IF EXISTS `spell_affect`;
CREATE TABLE IF NOT EXISTS `spell_affect` (
  `entry` smallint(5) unsigned NOT NULL DEFAULT '0',
  `effectId` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `SpellFamilyMask` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`effectId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mangos.spell_area
DROP TABLE IF EXISTS `spell_area`;
CREATE TABLE IF NOT EXISTS `spell_area` (
  `spell` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `area` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `quest_start` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `quest_start_active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `quest_end` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `aura_spell` mediumint(8) NOT NULL DEFAULT '0',
  `racemask` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `gender` tinyint(1) unsigned NOT NULL DEFAULT '2',
  `autocast` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`spell`,`area`,`quest_start`,`quest_start_active`,`aura_spell`,`racemask`,`gender`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mangos.spell_bonus_data
DROP TABLE IF EXISTS `spell_bonus_data`;
CREATE TABLE IF NOT EXISTS `spell_bonus_data` (
  `entry` smallint(5) unsigned NOT NULL,
  `direct_bonus` float NOT NULL DEFAULT '0',
  `dot_bonus` float NOT NULL DEFAULT '0',
  `ap_bonus` float NOT NULL DEFAULT '0',
  `ap_dot_bonus` float NOT NULL DEFAULT '0',
  `comments` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mangos.spell_chain
DROP TABLE IF EXISTS `spell_chain`;
CREATE TABLE IF NOT EXISTS `spell_chain` (
  `spell_id` mediumint(9) NOT NULL DEFAULT '0',
  `prev_spell` mediumint(9) NOT NULL DEFAULT '0',
  `first_spell` mediumint(9) NOT NULL DEFAULT '0',
  `rank` tinyint(4) NOT NULL DEFAULT '0',
  `req_spell` mediumint(9) NOT NULL DEFAULT '0',
  PRIMARY KEY (`spell_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Spell Additinal Data';

-- Data exporting was unselected.


-- Dumping structure for table mangos.spell_check
DROP TABLE IF EXISTS `spell_check`;
CREATE TABLE IF NOT EXISTS `spell_check` (
  `spellid` mediumint(7) unsigned NOT NULL DEFAULT '0',
  `SpellFamilyName` smallint(5) NOT NULL DEFAULT '-1',
  `SpellFamilyMask` bigint(30) NOT NULL DEFAULT '-1',
  `SpellIcon` int(10) NOT NULL DEFAULT '-1',
  `SpellVisual` int(10) NOT NULL DEFAULT '-1',
  `SpellCategory` int(10) NOT NULL DEFAULT '-1',
  `EffectType` int(10) NOT NULL DEFAULT '-1',
  `EffectAura` int(10) NOT NULL DEFAULT '-1',
  `EffectIdx` tinyint(3) NOT NULL DEFAULT '-1',
  `Name` varchar(40) NOT NULL DEFAULT '',
  `Code` varchar(40) NOT NULL DEFAULT '',
  PRIMARY KEY (`spellid`,`SpellFamilyName`,`SpellFamilyMask`,`SpellIcon`,`SpellVisual`,`SpellCategory`,`Code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mangos.spell_disabled
DROP TABLE IF EXISTS `spell_disabled`;
CREATE TABLE IF NOT EXISTS `spell_disabled` (
  `entry` int(10) unsigned NOT NULL COMMENT 'Disabled spell',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table mangos.spell_effect_mod
DROP TABLE IF EXISTS `spell_effect_mod`;
CREATE TABLE IF NOT EXISTS `spell_effect_mod` (
  `Id` int(10) unsigned NOT NULL DEFAULT '0',
  `EffectIndex` int(3) unsigned NOT NULL DEFAULT '0',
  `Effect` int(3) NOT NULL DEFAULT '-1',
  `EffectDieSides` int(10) NOT NULL DEFAULT '-1',
  `EffectBaseDice` int(10) NOT NULL DEFAULT '-1',
  `EffectDicePerLevel` float NOT NULL DEFAULT '-1',
  `EffectRealPointsPerLevel` float NOT NULL DEFAULT '-1',
  `EffectBasePoints` int(10) NOT NULL DEFAULT '-1',
  `EffectAmplitude` int(10) NOT NULL DEFAULT '-1',
  `EffectPointsPerComboPoint` float NOT NULL DEFAULT '-1',
  `EffectChainTarget` int(10) NOT NULL DEFAULT '-1',
  `EffectMultipleValue` float NOT NULL DEFAULT '-1',
  `EffectMechanic` int(10) NOT NULL DEFAULT '-1',
  `EffectImplicitTargetA` int(10) NOT NULL DEFAULT '-1',
  `EffectImplicitTargetB` int(10) NOT NULL DEFAULT '-1',
  `EffectRadiusIndex` int(10) NOT NULL DEFAULT '-1',
  `EffectApplyAuraName` int(10) NOT NULL DEFAULT '-1',
  `EffectItemType` int(10) NOT NULL DEFAULT '-1',
  `EffectMiscValue` int(10) NOT NULL DEFAULT '-1',
  `EffectTriggerSpell` int(10) NOT NULL DEFAULT '-1',
  `Comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`,`EffectIndex`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table mangos.spell_elixir
DROP TABLE IF EXISTS `spell_elixir`;
CREATE TABLE IF NOT EXISTS `spell_elixir` (
  `entry` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'SpellId of potion',
  `mask` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'Mask 0x1 battle 0x2 guardian 0x3 flask 0x7 unstable flasks 0xB shattrath flasks',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Spell System';

-- Data exporting was unselected.


-- Dumping structure for table mangos.spell_facing
DROP TABLE IF EXISTS `spell_facing`;
CREATE TABLE IF NOT EXISTS `spell_facing` (
  `entry` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Spell ID',
  `facingcasterflag` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'flag for facing state, usually 1',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table mangos.spell_group
DROP TABLE IF EXISTS `spell_group`;
CREATE TABLE IF NOT EXISTS `spell_group` (
  `group_id` int(11) unsigned NOT NULL DEFAULT '0',
  `group_spell_id` int(11) unsigned NOT NULL DEFAULT '0',
  `spell_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`group_id`,`group_spell_id`,`spell_id`),
  UNIQUE KEY `group_id` (`group_id`,`group_spell_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Spell System';

-- Data exporting was unselected.


-- Dumping structure for table mangos.spell_group_stack_rules
DROP TABLE IF EXISTS `spell_group_stack_rules`;
CREATE TABLE IF NOT EXISTS `spell_group_stack_rules` (
  `group_id` int(11) unsigned NOT NULL DEFAULT '0',
  `stack_rule` tinyint(3) NOT NULL DEFAULT '1',
  PRIMARY KEY (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mangos.spell_learn_spell
DROP TABLE IF EXISTS `spell_learn_spell`;
CREATE TABLE IF NOT EXISTS `spell_learn_spell` (
  `entry` smallint(5) unsigned NOT NULL DEFAULT '0',
  `SpellID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `Active` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`entry`,`SpellID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Item System';

-- Data exporting was unselected.


-- Dumping structure for table mangos.spell_mod
DROP TABLE IF EXISTS `spell_mod`;
CREATE TABLE IF NOT EXISTS `spell_mod` (
  `Id` int(11) NOT NULL DEFAULT '0',
  `procChance` int(11) DEFAULT '-1',
  `procFlags` int(11) DEFAULT '-1',
  `procCharges` int(11) DEFAULT '-1',
  `DurationIndex` int(11) DEFAULT '-1',
  `Category` int(11) DEFAULT '-1',
  `CastingTimeIndex` int(11) DEFAULT '-1',
  `StackAmount` int(11) DEFAULT '-1',
  `SpellIconID` int(11) DEFAULT '-1',
  `activeIconID` int(11) DEFAULT '-1',
  `manaCost` int(11) DEFAULT '-1',
  `Attributes` int(11) DEFAULT '-1',
  `AttributesEx` int(11) DEFAULT '-1',
  `AttributesEx2` int(11) DEFAULT '-1',
  `AttributesEx3` int(11) DEFAULT '-1',
  `AttributesEx4` int(11) DEFAULT '-1',
  `Custom` int(11) DEFAULT '0',
  `InterruptFlags` int(11) DEFAULT '-1',
  `AuraInterruptFlags` int(11) DEFAULT '-1',
  `ChannelInterruptFlags` int(11) DEFAULT '-1',
  `Dispel` int(10) NOT NULL DEFAULT '-1',
  `Stances` int(11) DEFAULT '-1',
  `StancesNot` int(11) DEFAULT '-1',
  `SpellVisual` int(11) DEFAULT '-1',
  `ManaCostPercentage` int(11) DEFAULT '-1',
  `StartRecoveryCategory` int(11) DEFAULT '-1',
  `StartRecoveryTime` int(11) DEFAULT '-1',
  `MaxAffectedTargets` int(11) DEFAULT '-1',
  `MaxTargetLevel` int(11) DEFAULT '-1',
  `DmgClass` int(11) DEFAULT '-1',
  `rangeIndex` int(11) DEFAULT '-1',
  `RecoveryTime` int(11) NOT NULL DEFAULT '-1',
  `CategoryRecoveryTime` int(11) NOT NULL DEFAULT '-1',
  `SpellFamilyName` int(11) NOT NULL DEFAULT '-1',
  `SpellFamilyFlags` bigint(20) unsigned DEFAULT '0',
  `Mechanic` int(2) DEFAULT '-1',
  `EquippedItemClass` int(2) DEFAULT '-1',
  `Comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table mangos.spell_pet_auras
DROP TABLE IF EXISTS `spell_pet_auras`;
CREATE TABLE IF NOT EXISTS `spell_pet_auras` (
  `spell` mediumint(8) unsigned NOT NULL COMMENT 'dummy spell id',
  `pet` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'pet id; 0 = all',
  `aura` mediumint(8) unsigned NOT NULL COMMENT 'pet aura id',
  PRIMARY KEY (`spell`,`pet`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table mangos.spell_proc_event
DROP TABLE IF EXISTS `spell_proc_event`;
CREATE TABLE IF NOT EXISTS `spell_proc_event` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `SchoolMask` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `SpellFamilyName` smallint(5) unsigned NOT NULL DEFAULT '0',
  `SpellFamilyMask0` bigint(40) unsigned NOT NULL DEFAULT '0',
  `SpellFamilyMask1` bigint(40) unsigned NOT NULL DEFAULT '0',
  `SpellFamilyMask2` bigint(40) unsigned NOT NULL DEFAULT '0',
  `procFlags` int(10) unsigned NOT NULL DEFAULT '0',
  `procEx` int(10) unsigned NOT NULL DEFAULT '0',
  `ppmRate` float NOT NULL DEFAULT '0',
  `CustomChance` float NOT NULL DEFAULT '0',
  `Cooldown` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mangos.spell_proc_item_enchant
DROP TABLE IF EXISTS `spell_proc_item_enchant`;
CREATE TABLE IF NOT EXISTS `spell_proc_item_enchant` (
  `entry` mediumint(8) unsigned NOT NULL,
  `ppmRate` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mangos.spell_scripts
DROP TABLE IF EXISTS `spell_scripts`;
CREATE TABLE IF NOT EXISTS `spell_scripts` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `delay` int(10) unsigned NOT NULL DEFAULT '0',
  `command` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `datalong` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `datalong2` int(10) unsigned NOT NULL DEFAULT '0',
  `datalong3` int(10) unsigned NOT NULL DEFAULT '0',
  `datalong4` int(10) unsigned NOT NULL DEFAULT '0',
  `buddy_id` int(10) unsigned NOT NULL DEFAULT '0',
  `buddy_radius` int(10) unsigned NOT NULL DEFAULT '0',
  `buddy_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `data_flags` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `dataint` int(11) NOT NULL DEFAULT '0',
  `dataint2` int(11) NOT NULL DEFAULT '0',
  `dataint3` int(11) NOT NULL DEFAULT '0',
  `dataint4` int(11) NOT NULL DEFAULT '0',
  `x` float NOT NULL DEFAULT '0',
  `y` float NOT NULL DEFAULT '0',
  `z` float NOT NULL DEFAULT '0',
  `o` float NOT NULL DEFAULT '0',
  `comments` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mangos.spell_script_target
DROP TABLE IF EXISTS `spell_script_target`;
CREATE TABLE IF NOT EXISTS `spell_script_target` (
  `entry` mediumint(8) unsigned NOT NULL,
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `targetEntry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `entry_type_target` (`entry`,`type`,`targetEntry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Spell System';

-- Data exporting was unselected.


-- Dumping structure for table mangos.spell_target_position
DROP TABLE IF EXISTS `spell_target_position`;
CREATE TABLE IF NOT EXISTS `spell_target_position` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Identifier',
  `target_map` smallint(5) unsigned NOT NULL DEFAULT '0',
  `target_position_x` float NOT NULL DEFAULT '0',
  `target_position_y` float NOT NULL DEFAULT '0',
  `target_position_z` float NOT NULL DEFAULT '0',
  `target_orientation` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`target_map`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Spell System';

-- Data exporting was unselected.


-- Dumping structure for table mangos.spell_template
DROP TABLE IF EXISTS `spell_template`;
CREATE TABLE IF NOT EXISTS `spell_template` (
  `ID` int(4) unsigned NOT NULL DEFAULT '0',
  `school` int(4) unsigned DEFAULT '0' COMMENT 'Resistances.dbc',
  `category` int(4) unsigned DEFAULT '0' COMMENT 'SpellCategory.dbc',
  `castUI` int(4) unsigned DEFAULT '0',
  `dispel` int(4) unsigned DEFAULT '0' COMMENT 'SpellDispelType.dbc',
  `mechanic` int(4) unsigned DEFAULT '0' COMMENT 'SpellMechanic.dbc',
  `attributes` int(4) unsigned DEFAULT '0',
  `attributesEx` int(4) unsigned DEFAULT '0',
  `attributesEx2` int(4) unsigned DEFAULT '0',
  `attributesEx3` int(4) unsigned DEFAULT '0',
  `attributesEx4` int(4) unsigned DEFAULT '0',
  `stances` int(4) unsigned DEFAULT '0' COMMENT 'SpellShapeshiftForm.dbc',
  `stancesNot` int(4) unsigned DEFAULT '0' COMMENT 'SpellShapeshiftForm.dbc',
  `targets` int(4) unsigned DEFAULT '0',
  `targetCreatureType` int(4) unsigned DEFAULT '0' COMMENT 'CreatureType.dbc',
  `requiresSpellFocus` int(4) unsigned DEFAULT '0' COMMENT 'SpellFocusObject.dbc',
  `casterAuraState` int(4) unsigned DEFAULT '0',
  `targetAuraState` int(4) unsigned DEFAULT '0',
  `castingTimeIndex` int(4) unsigned DEFAULT '0' COMMENT 'SpellCastTimes.dbc',
  `recoveryTime` int(4) unsigned DEFAULT '0',
  `categoryRecoveryTime` int(4) unsigned DEFAULT '0',
  `interruptFlags` int(4) unsigned DEFAULT '0',
  `auraInterruptFlags` int(4) unsigned DEFAULT '0',
  `channelInterruptFlags` int(4) unsigned DEFAULT '0',
  `procFlags` int(4) unsigned DEFAULT '0',
  `procChance` int(4) unsigned DEFAULT '0',
  `procCharges` int(4) unsigned DEFAULT '0',
  `maxLevel` int(4) unsigned DEFAULT '0',
  `baseLevel` int(4) unsigned DEFAULT '0',
  `spellLevel` int(4) unsigned DEFAULT '0',
  `durationIndex` int(4) unsigned DEFAULT '0' COMMENT 'SpellDuration.dbc',
  `powerType` int(4) unsigned DEFAULT '0',
  `manaCost` int(4) unsigned DEFAULT '0',
  `manCostPerLevel` int(4) unsigned DEFAULT '0',
  `manaPerSecond` int(4) unsigned DEFAULT '0',
  `manaPerSecondPerLevel` int(4) unsigned DEFAULT '0',
  `rangeIndex` int(4) unsigned DEFAULT '0' COMMENT 'SpellRange.dbc',
  `speed` float DEFAULT '0',
  `modelNextSpell` int(4) unsigned DEFAULT '0',
  `stackAmount` int(4) unsigned DEFAULT '0',
  `totem1` int(4) unsigned DEFAULT '0',
  `totem2` int(4) unsigned DEFAULT '0',
  `reagent1` int(4) DEFAULT '0',
  `reagent2` int(4) DEFAULT '0',
  `reagent3` int(4) DEFAULT '0',
  `reagent4` int(4) DEFAULT '0',
  `reagent5` int(4) DEFAULT '0',
  `reagent6` int(4) DEFAULT '0',
  `reagent7` int(4) DEFAULT '0',
  `reagent8` int(4) DEFAULT '0',
  `reagentCount1` int(4) unsigned DEFAULT '0',
  `reagentCount2` int(4) unsigned DEFAULT '0',
  `reagentCount3` int(4) unsigned DEFAULT '0',
  `reagentCount4` int(4) unsigned DEFAULT '0',
  `reagentCount5` int(4) unsigned DEFAULT '0',
  `reagentCount6` int(4) unsigned DEFAULT '0',
  `reagentCount7` int(4) unsigned DEFAULT '0',
  `reagentCount8` int(4) unsigned DEFAULT '0',
  `equippedItemClass` int(4) DEFAULT '0' COMMENT 'ItemClass.dbc',
  `equippedItemSubClassMask` int(4) DEFAULT '0' COMMENT 'ItemSubClass.dbc',
  `equippedItemInventoryTypeMask` int(4) DEFAULT '0',
  `effect1` int(4) unsigned DEFAULT '0',
  `effect2` int(4) unsigned DEFAULT '0',
  `effect3` int(4) unsigned DEFAULT '0',
  `effectDieSides1` int(4) DEFAULT '0',
  `effectDieSides2` int(4) DEFAULT '0',
  `effectDieSides3` int(4) DEFAULT '0',
  `effectBaseDice1` int(4) unsigned DEFAULT '0',
  `effectBaseDice2` int(4) unsigned DEFAULT '0',
  `effectBaseDice3` int(4) unsigned DEFAULT '0',
  `effectDicePerLevel1` float DEFAULT '0',
  `effectDicePerLevel2` float DEFAULT '0',
  `effectDicePerLevel3` float DEFAULT '0',
  `effectRealPointsPerLevel1` float DEFAULT '0',
  `effectRealPointsPerLevel2` float DEFAULT '0',
  `effectRealPointsPerLevel3` float DEFAULT '0',
  `effectBasePoints1` int(4) DEFAULT '0',
  `effectBasePoints2` int(4) DEFAULT '0',
  `effectBasePoints3` int(4) DEFAULT '0',
  `effectMechanic1` int(4) unsigned DEFAULT '0',
  `effectMechanic2` int(4) unsigned DEFAULT '0',
  `effectMechanic3` int(4) unsigned DEFAULT '0',
  `effectImplicitTargetA1` int(4) unsigned DEFAULT '0',
  `effectImplicitTargetA2` int(4) unsigned DEFAULT '0',
  `effectImplicitTargetA3` int(4) unsigned DEFAULT '0',
  `effectImplicitTargetB1` int(4) unsigned DEFAULT '0',
  `effectImplicitTargetB2` int(4) unsigned DEFAULT '0',
  `effectImplicitTargetB3` int(4) unsigned DEFAULT '0',
  `effectRadiusIndex1` int(4) unsigned DEFAULT '0' COMMENT 'SpellRadius.dbc',
  `effectRadiusIndex2` int(4) unsigned DEFAULT '0' COMMENT 'SpellRadius.dbc',
  `effectRadiusIndex3` int(4) unsigned DEFAULT '0' COMMENT 'SpellRadius.dbc',
  `effectApplyAuraName1` int(4) unsigned DEFAULT '0',
  `effectApplyAuraName2` int(4) unsigned DEFAULT '0',
  `effectApplyAuraName3` int(4) unsigned DEFAULT '0',
  `effectAmplitude1` int(4) unsigned DEFAULT '0',
  `effectAmplitude2` int(4) unsigned DEFAULT '0',
  `effectAmplitude3` int(4) unsigned DEFAULT '0',
  `effectMultipleValue1` float DEFAULT '0',
  `effectMultipleValue2` float DEFAULT '0',
  `effectMultipleValue3` float DEFAULT '0',
  `effectChainTarget1` int(4) unsigned DEFAULT '0',
  `effectChainTarget2` int(4) unsigned DEFAULT '0',
  `effectChainTarget3` int(4) unsigned DEFAULT '0',
  `effectItemType1` int(4) unsigned DEFAULT '0',
  `effectItemType2` int(4) unsigned DEFAULT '0',
  `effectItemType3` int(4) unsigned DEFAULT '0',
  `effectMiscValue1` int(4) DEFAULT '0',
  `effectMiscValue2` int(4) DEFAULT '0',
  `effectMiscValue3` int(4) DEFAULT '0',
  `effectTriggerSpell1` int(4) unsigned DEFAULT '0',
  `effectTriggerSpell2` int(4) unsigned DEFAULT '0',
  `effectTriggerSpell3` int(4) unsigned DEFAULT '0',
  `effectPointsPerComboPoint1` float DEFAULT '0',
  `effectPointsPerComboPoint2` float DEFAULT '0',
  `effectPointsPerComboPoint3` float DEFAULT '0',
  `spellVisual1` int(4) unsigned DEFAULT '0' COMMENT 'SpellVisual.dbc',
  `spellVisual2` int(4) unsigned DEFAULT '0' COMMENT 'SpellVisual.dbc',
  `spellIconId` int(4) unsigned DEFAULT '0' COMMENT 'SpellIcon.dbc',
  `activeIconId` int(4) unsigned DEFAULT '0' COMMENT 'SpellIcon.dbc',
  `spellPriority` int(4) unsigned DEFAULT '0',
  `name1` varchar(256) COLLATE utf8_unicode_ci DEFAULT '',
  `name2` varchar(256) COLLATE utf8_unicode_ci DEFAULT '',
  `name3` varchar(256) COLLATE utf8_unicode_ci DEFAULT '',
  `name4` varchar(256) COLLATE utf8_unicode_ci DEFAULT '',
  `name5` varchar(256) COLLATE utf8_unicode_ci DEFAULT '',
  `name6` varchar(256) COLLATE utf8_unicode_ci DEFAULT '',
  `name7` varchar(256) COLLATE utf8_unicode_ci DEFAULT '',
  `name8` varchar(256) COLLATE utf8_unicode_ci DEFAULT '',
  `nameFlags` int(4) unsigned DEFAULT '0',
  `nameSubtext1` varchar(256) COLLATE utf8_unicode_ci DEFAULT '',
  `nameSubtext2` varchar(256) COLLATE utf8_unicode_ci DEFAULT '',
  `nameSubtext3` varchar(256) COLLATE utf8_unicode_ci DEFAULT '',
  `nameSubtext4` varchar(256) COLLATE utf8_unicode_ci DEFAULT '',
  `nameSubtext5` varchar(256) COLLATE utf8_unicode_ci DEFAULT '',
  `nameSubtext6` varchar(256) COLLATE utf8_unicode_ci DEFAULT '',
  `nameSubtext7` varchar(256) COLLATE utf8_unicode_ci DEFAULT '',
  `nameSubtext8` varchar(256) COLLATE utf8_unicode_ci DEFAULT '',
  `nameSubtextFlags` int(4) unsigned DEFAULT '0',
  `description1` varchar(1024) COLLATE utf8_unicode_ci DEFAULT '',
  `description2` varchar(1024) COLLATE utf8_unicode_ci DEFAULT '',
  `description3` varchar(1024) COLLATE utf8_unicode_ci DEFAULT '',
  `description4` varchar(1024) COLLATE utf8_unicode_ci DEFAULT '',
  `description5` varchar(1024) COLLATE utf8_unicode_ci DEFAULT '',
  `description6` varchar(1024) COLLATE utf8_unicode_ci DEFAULT '',
  `description7` varchar(1024) COLLATE utf8_unicode_ci DEFAULT '',
  `description8` varchar(1024) COLLATE utf8_unicode_ci DEFAULT '',
  `descriptionFlags` int(4) unsigned DEFAULT '0',
  `auraDescription1` varchar(512) COLLATE utf8_unicode_ci DEFAULT '',
  `auraDescription2` varchar(512) COLLATE utf8_unicode_ci DEFAULT '',
  `auraDescription3` varchar(512) COLLATE utf8_unicode_ci DEFAULT '',
  `auraDescription4` varchar(512) COLLATE utf8_unicode_ci DEFAULT '',
  `auraDescription5` varchar(512) COLLATE utf8_unicode_ci DEFAULT '',
  `auraDescription6` varchar(512) COLLATE utf8_unicode_ci DEFAULT '',
  `auraDescription7` varchar(512) COLLATE utf8_unicode_ci DEFAULT '',
  `auraDescription8` varchar(512) COLLATE utf8_unicode_ci DEFAULT '',
  `auraDescriptionFlags` int(4) unsigned DEFAULT '0',
  `manaCostPercentage` int(4) unsigned DEFAULT '0',
  `startRecoveryCategory` int(4) unsigned DEFAULT '0',
  `startRecoveryTime` int(4) unsigned DEFAULT '0',
  `maxTargetLevel` int(4) unsigned DEFAULT '0',
  `spellFamilyName` int(4) unsigned DEFAULT '0' COMMENT 'ChrClasses.dbc',
  `spellFamilyFlags` bigint(20) unsigned DEFAULT '0',
  `maxAffectedTargets` int(4) unsigned DEFAULT '0',
  `dmgClass` int(4) unsigned DEFAULT '0',
  `preventionType` int(4) unsigned DEFAULT '0',
  `stanceBarOrder` int(4) DEFAULT '0',
  `dmgMultiplier1` float DEFAULT '0',
  `dmgMultiplier2` float DEFAULT '0',
  `dmgMultiplier3` float DEFAULT '0',
  `minFactionId` int(4) unsigned DEFAULT '0',
  `minReputation` int(4) unsigned DEFAULT '0',
  `requiredAuraVision` int(4) unsigned DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Data exporting was unselected.


-- Dumping structure for table mangos.spell_threat
DROP TABLE IF EXISTS `spell_threat`;
CREATE TABLE IF NOT EXISTS `spell_threat` (
  `entry` mediumint(8) unsigned NOT NULL,
  `Threat` smallint(6) NOT NULL,
  `multiplier` float NOT NULL DEFAULT '1' COMMENT 'threat multiplier for damage/healing',
  `ap_bonus` float NOT NULL DEFAULT '0' COMMENT 'additional threat bonus from attack power',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

-- Data exporting was unselected.


-- Dumping structure for table mangos.transports
DROP TABLE IF EXISTS `transports`;
CREATE TABLE IF NOT EXISTS `transports` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0',
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `name` text,
  `period` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Transports';

-- Data exporting was unselected.


-- Dumping structure for table mangos.variables
DROP TABLE IF EXISTS `variables`;
CREATE TABLE IF NOT EXISTS `variables` (
  `index` int(10) unsigned NOT NULL DEFAULT '0',
  `value` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`index`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
