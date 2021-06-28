-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.53 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             9.3.0.4998
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table characters.auction
CREATE TABLE IF NOT EXISTS `auction` (
  `id` int(11) unsigned NOT NULL DEFAULT '0',
  `house_id` int(11) unsigned NOT NULL DEFAULT '0',
  `item_guid` int(11) unsigned NOT NULL DEFAULT '0',
  `item_id` int(11) unsigned NOT NULL DEFAULT '0',
  `seller_guid` int(11) unsigned NOT NULL DEFAULT '0',
  `buyout_price` int(11) NOT NULL DEFAULT '0',
  `expire_time` bigint(40) NOT NULL DEFAULT '0',
  `buyer_guid` int(11) unsigned NOT NULL DEFAULT '0',
  `last_bid` int(11) NOT NULL DEFAULT '0',
  `start_bid` int(11) NOT NULL DEFAULT '0',
  `deposit` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_item_guid` (`item_guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table characters.characters
CREATE TABLE IF NOT EXISTS `characters` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `account` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Account Identifier',
  `name` varchar(12) NOT NULL DEFAULT '',
  `race` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `class` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `gender` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `skin` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `face` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `hair_style` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `hair_color` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `facial_hair` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `level` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `xp` int(10) unsigned NOT NULL DEFAULT '0',
  `money` int(10) unsigned NOT NULL DEFAULT '0',
  `player_flags` int(10) unsigned NOT NULL DEFAULT '0',
  `zone` int(11) unsigned NOT NULL DEFAULT '0',
  `map` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Map Identifier',
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  `transport_guid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `transport_x` float NOT NULL DEFAULT '0',
  `transport_y` float NOT NULL DEFAULT '0',
  `transport_z` float NOT NULL DEFAULT '0',
  `transport_o` float NOT NULL DEFAULT '0',
  `known_taxi_mask` longtext COMMENT 'discovered flight points',
  `current_taxi_path` text COMMENT 'flight destination',
  `online` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `played_time_total` int(11) unsigned NOT NULL DEFAULT '0',
  `played_time_level` int(11) unsigned NOT NULL DEFAULT '0',
  `create_time` bigint(20) unsigned NOT NULL DEFAULT '0',
  `logout_time` bigint(20) unsigned NOT NULL DEFAULT '0',
  `is_logout_resting` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rest_bonus` float NOT NULL DEFAULT '0',
  `reset_talents_multiplier` int(11) unsigned NOT NULL DEFAULT '0',
  `reset_talents_time` bigint(20) unsigned NOT NULL DEFAULT '0',
  `death_expire_time` bigint(20) unsigned NOT NULL DEFAULT '0',
  `stable_slots` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `bank_bag_slots` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `at_login_flags` int(11) unsigned NOT NULL DEFAULT '0',
  `extra_flags` int(11) unsigned NOT NULL DEFAULT '0',
  `honor_rank_points` float NOT NULL DEFAULT '0',
  `honor_highest_rank` int(11) unsigned NOT NULL DEFAULT '0',
  `honor_standing` int(11) unsigned NOT NULL DEFAULT '0',
  `honor_last_week_hk` int(11) unsigned NOT NULL DEFAULT '0',
  `honor_last_week_cp` float NOT NULL DEFAULT '0',
  `honor_stored_hk` int(11) NOT NULL DEFAULT '0',
  `honor_stored_dk` int(11) NOT NULL DEFAULT '0',
  `watched_faction` int(11) NOT NULL DEFAULT '-1',
  `drunk` smallint(5) unsigned NOT NULL DEFAULT '0',
  `health` int(10) unsigned NOT NULL DEFAULT '0',
  `power1` int(10) unsigned NOT NULL DEFAULT '0',
  `power2` int(10) unsigned NOT NULL DEFAULT '0',
  `power3` int(10) unsigned NOT NULL DEFAULT '0',
  `power4` int(10) unsigned NOT NULL DEFAULT '0',
  `power5` int(10) unsigned NOT NULL DEFAULT '0',
  `explored_zones` longtext,
  `equipment_cache` longtext,
  `ammo_id` int(10) unsigned NOT NULL DEFAULT '0',
  `action_bars` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `deleted_account` int(11) unsigned DEFAULT NULL,
  `deleted_name` varchar(12) DEFAULT NULL,
  `deleted_time` bigint(20) DEFAULT NULL,
  `world_phase_mask` int(11) DEFAULT '0',
  PRIMARY KEY (`guid`),
  KEY `idx_account` (`account`),
  KEY `idx_online` (`online`),
  KEY `idx_name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';

-- Data exporting was unselected.


-- Dumping structure for table characters.characters_guid_delete
CREATE TABLE IF NOT EXISTS `characters_guid_delete` (
  `guid` int(11) DEFAULT NULL,
  UNIQUE KEY `key_guid` (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table characters.characters_item_delete
CREATE TABLE IF NOT EXISTS `characters_item_delete` (
  `entry` int(11) DEFAULT NULL,
  UNIQUE KEY `key_entry` (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table characters.character_action
CREATE TABLE IF NOT EXISTS `character_action` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `button` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `action` int(11) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`button`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';

-- Data exporting was unselected.


-- Dumping structure for table characters.character_aura
CREATE TABLE IF NOT EXISTS `character_aura` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `caster_guid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'Full Global Unique Identifier',
  `item_guid` int(11) unsigned NOT NULL DEFAULT '0',
  `spell` int(11) unsigned NOT NULL DEFAULT '0',
  `stacks` int(11) unsigned NOT NULL DEFAULT '1',
  `charges` int(11) unsigned NOT NULL DEFAULT '0',
  `base_points0` float NOT NULL DEFAULT '0',
  `base_points1` float NOT NULL DEFAULT '0',
  `base_points2` float NOT NULL DEFAULT '0',
  `periodic_time0` int(11) unsigned NOT NULL DEFAULT '0',
  `periodic_time1` int(11) unsigned NOT NULL DEFAULT '0',
  `periodic_time2` int(11) unsigned NOT NULL DEFAULT '0',
  `max_duration` int(11) NOT NULL DEFAULT '0',
  `duration` int(11) NOT NULL DEFAULT '0',
  `effect_index_mask` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`caster_guid`,`item_guid`,`spell`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';

-- Data exporting was unselected.


-- Dumping structure for table characters.character_battleground_data
CREATE TABLE IF NOT EXISTS `character_battleground_data` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `instance_id` int(11) unsigned NOT NULL DEFAULT '0',
  `team` int(11) unsigned NOT NULL DEFAULT '0',
  `join_x` float NOT NULL DEFAULT '0',
  `join_y` float NOT NULL DEFAULT '0',
  `join_z` float NOT NULL DEFAULT '0',
  `join_o` float NOT NULL DEFAULT '0',
  `join_map` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';

-- Data exporting was unselected.


-- Dumping structure for table characters.character_deleted_items
CREATE TABLE IF NOT EXISTS `character_deleted_items` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `player_guid` int(11) unsigned NOT NULL DEFAULT '0',
  `item_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `stack_count` mediumint(8) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Data exporting was unselected.


-- Dumping structure for table characters.character_duplicate_account
CREATE TABLE IF NOT EXISTS `character_duplicate_account` (
  `account` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table characters.character_forgotten_skills
CREATE TABLE IF NOT EXISTS `character_forgotten_skills` (
  `guid` int(11) unsigned NOT NULL COMMENT 'Global Unique Identifier',
  `skill` mediumint(9) unsigned NOT NULL,
  `value` mediumint(9) unsigned NOT NULL,
  PRIMARY KEY (`guid`,`skill`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';

-- Data exporting was unselected.


-- Dumping structure for table characters.character_gifts
CREATE TABLE IF NOT EXISTS `character_gifts` (
  `guid` int(20) unsigned NOT NULL DEFAULT '0',
  `item_guid` int(11) unsigned NOT NULL DEFAULT '0',
  `item_id` int(20) unsigned NOT NULL DEFAULT '0',
  `flags` int(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`item_guid`),
  KEY `idx_guid` (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table characters.character_homebind
CREATE TABLE IF NOT EXISTS `character_homebind` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `map` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Map Identifier',
  `zone` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Zone Identifier',
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';

-- Data exporting was unselected.


-- Dumping structure for table characters.character_honor_cp
CREATE TABLE IF NOT EXISTS `character_honor_cp` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `victim_type` tinyint(3) unsigned NOT NULL DEFAULT '4' COMMENT 'Object Type Id',
  `victim_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Creature Id / Player Guid',
  `cp` float NOT NULL DEFAULT '0',
  `date` int(11) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  KEY `idx_guid` (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';

-- Data exporting was unselected.


-- Dumping structure for table characters.character_instance
CREATE TABLE IF NOT EXISTS `character_instance` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0',
  `instance` int(11) unsigned NOT NULL DEFAULT '0',
  `permanent` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`instance`),
  KEY `idx_instance` (`instance`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table characters.character_inventory
CREATE TABLE IF NOT EXISTS `character_inventory` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `bag` int(11) unsigned NOT NULL DEFAULT '0',
  `slot` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `item_guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Item Global Unique Identifier',
  `item_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Item Identifier',
  PRIMARY KEY (`item_guid`),
  KEY `idx_guid` (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';

-- Data exporting was unselected.


-- Dumping structure for table characters.character_pet
CREATE TABLE IF NOT EXISTS `character_pet` (
  `id` int(11) unsigned NOT NULL DEFAULT '0',
  `entry` int(11) unsigned NOT NULL DEFAULT '0',
  `owner_guid` int(11) unsigned NOT NULL DEFAULT '0',
  `display_id` int(11) unsigned DEFAULT '0',
  `created_by_spell` int(11) unsigned NOT NULL DEFAULT '0',
  `pet_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `level` int(11) unsigned NOT NULL DEFAULT '1',
  `xp` int(11) unsigned NOT NULL DEFAULT '0',
  `react_state` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `loyalty_points` int(11) NOT NULL DEFAULT '0',
  `loyalty` int(11) unsigned NOT NULL DEFAULT '0',
  `training_points` int(11) NOT NULL DEFAULT '0',
  `name` varchar(100) DEFAULT 'Pet',
  `renamed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `slot` int(11) unsigned NOT NULL DEFAULT '0',
  `current_health` int(11) unsigned NOT NULL DEFAULT '1',
  `current_mana` int(11) unsigned NOT NULL DEFAULT '0',
  `current_happiness` int(11) unsigned NOT NULL DEFAULT '0',
  `save_time` bigint(20) unsigned NOT NULL DEFAULT '0',
  `reset_talents_cost` int(11) unsigned NOT NULL DEFAULT '0',
  `reset_talents_time` bigint(20) unsigned NOT NULL DEFAULT '0',
  `action_bar_data` longtext,
  `teach_spell_data` longtext,
  PRIMARY KEY (`id`),
  KEY `idx_owner` (`owner_guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Pet System';

-- Data exporting was unselected.


-- Dumping structure for table characters.character_queststatus
CREATE TABLE IF NOT EXISTS `character_queststatus` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `quest` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  `status` int(11) unsigned NOT NULL DEFAULT '0',
  `rewarded` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `explored` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `timer` bigint(20) unsigned NOT NULL DEFAULT '0',
  `mob_count1` int(11) unsigned NOT NULL DEFAULT '0',
  `mob_count2` int(11) unsigned NOT NULL DEFAULT '0',
  `mob_count3` int(11) unsigned NOT NULL DEFAULT '0',
  `mob_count4` int(11) unsigned NOT NULL DEFAULT '0',
  `item_count1` int(11) unsigned NOT NULL DEFAULT '0',
  `item_count2` int(11) unsigned NOT NULL DEFAULT '0',
  `item_count3` int(11) unsigned NOT NULL DEFAULT '0',
  `item_count4` int(11) unsigned NOT NULL DEFAULT '0',
  `reward_choice` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`quest`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';

-- Data exporting was unselected.


-- Dumping structure for table characters.character_reputation
CREATE TABLE IF NOT EXISTS `character_reputation` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `faction` int(11) unsigned NOT NULL DEFAULT '0',
  `standing` int(11) NOT NULL DEFAULT '0',
  `flags` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`faction`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';

-- Data exporting was unselected.


-- Dumping structure for table characters.character_skills
CREATE TABLE IF NOT EXISTS `character_skills` (
  `guid` int(11) unsigned NOT NULL COMMENT 'Global Unique Identifier',
  `skill` mediumint(9) unsigned NOT NULL,
  `value` mediumint(9) unsigned NOT NULL,
  `max` mediumint(9) unsigned NOT NULL,
  PRIMARY KEY (`guid`,`skill`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';

-- Data exporting was unselected.


-- Dumping structure for table characters.character_social
CREATE TABLE IF NOT EXISTS `character_social` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Character Global Unique Identifier',
  `friend` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Friend Global Unique Identifier',
  `flags` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'Friend Flags',
  PRIMARY KEY (`guid`,`friend`,`flags`),
  KEY `idx_guid` (`guid`),
  KEY `idx_friend` (`friend`),
  KEY `idx_guid_flags` (`guid`,`flags`),
  KEY `idx_friend_flags` (`friend`,`flags`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';

-- Data exporting was unselected.


-- Dumping structure for table characters.character_spell
CREATE TABLE IF NOT EXISTS `character_spell` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `spell` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Spell Identifier',
  `active` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `disabled` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`spell`),
  KEY `idx_spell` (`spell`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';

-- Data exporting was unselected.


-- Dumping structure for table characters.character_spell_cooldown
CREATE TABLE IF NOT EXISTS `character_spell_cooldown` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier, Low part',
  `spell` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Spell Identifier',
  `spell_expire_time` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'Spell cooldown expire time',
  `category` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Spell category',
  `category_expire_time` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'Spell category cooldown expire time',
  `item_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Item Identifier',
  PRIMARY KEY (`guid`,`spell`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table characters.character_stats
CREATE TABLE IF NOT EXISTS `character_stats` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier, Low part',
  `max_health` int(10) unsigned NOT NULL DEFAULT '0',
  `max_power1` int(10) unsigned NOT NULL DEFAULT '0',
  `max_power2` int(10) unsigned NOT NULL DEFAULT '0',
  `max_power3` int(10) unsigned NOT NULL DEFAULT '0',
  `max_power4` int(10) unsigned NOT NULL DEFAULT '0',
  `max_power5` int(10) unsigned NOT NULL DEFAULT '0',
  `max_power6` int(10) unsigned NOT NULL DEFAULT '0',
  `max_power7` int(10) unsigned NOT NULL DEFAULT '0',
  `strength` float NOT NULL DEFAULT '0',
  `agility` float NOT NULL DEFAULT '0',
  `stamina` float NOT NULL DEFAULT '0',
  `intellect` float NOT NULL DEFAULT '0',
  `spirit` float NOT NULL DEFAULT '0',
  `armor` int(10) NOT NULL DEFAULT '0',
  `holy_res` int(10) NOT NULL DEFAULT '0',
  `fire_res` int(10) NOT NULL DEFAULT '0',
  `nature_res` int(10) NOT NULL DEFAULT '0',
  `frost_res` int(10) NOT NULL DEFAULT '0',
  `shadow_res` int(10) NOT NULL DEFAULT '0',
  `arcane_res` int(10) NOT NULL DEFAULT '0',
  `block_chance` float NOT NULL DEFAULT '0',
  `dodge_chance` float NOT NULL DEFAULT '0',
  `parry_chance` float NOT NULL DEFAULT '0',
  `crit_chance` float NOT NULL DEFAULT '0',
  `ranged_crit_chance` float NOT NULL DEFAULT '0',
  `attack_power` int(10) unsigned NOT NULL DEFAULT '0',
  `ranged_attack_power` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table characters.character_tutorial
CREATE TABLE IF NOT EXISTS `character_tutorial` (
  `account` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Account Identifier',
  `tut0` int(11) unsigned NOT NULL DEFAULT '0',
  `tut1` int(11) unsigned NOT NULL DEFAULT '0',
  `tut2` int(11) unsigned NOT NULL DEFAULT '0',
  `tut3` int(11) unsigned NOT NULL DEFAULT '0',
  `tut4` int(11) unsigned NOT NULL DEFAULT '0',
  `tut5` int(11) unsigned NOT NULL DEFAULT '0',
  `tut6` int(11) unsigned NOT NULL DEFAULT '0',
  `tut7` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`account`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';

-- Data exporting was unselected.


-- Dumping structure for table characters.corpse
CREATE TABLE IF NOT EXISTS `corpse` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `player_guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Character Global Unique Identifier',
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  `map` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Map Identifier',
  `time` bigint(20) unsigned NOT NULL DEFAULT '0',
  `corpse_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `instance` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`),
  KEY `idx_type` (`corpse_type`),
  KEY `idx_instance` (`instance`),
  KEY `idx_player` (`player_guid`),
  KEY `idx_time` (`time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Death System';

-- Data exporting was unselected.


-- Dumping structure for table characters.creature_respawn
CREATE TABLE IF NOT EXISTS `creature_respawn` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `respawn_time` bigint(20) NOT NULL DEFAULT '0',
  `instance` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `map` int(5) unsigned DEFAULT '0',
  PRIMARY KEY (`guid`,`instance`),
  KEY `idx_instance` (`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Grid Loading System';

-- Data exporting was unselected.


-- Dumping structure for table characters.gameobject_respawn
CREATE TABLE IF NOT EXISTS `gameobject_respawn` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `respawn_time` bigint(20) NOT NULL DEFAULT '0',
  `instance` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `map` int(5) unsigned DEFAULT '0',
  PRIMARY KEY (`guid`,`instance`),
  KEY `idx_instance` (`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Grid Loading System';

-- Data exporting was unselected.


-- Dumping structure for table characters.game_event_status
CREATE TABLE IF NOT EXISTS `game_event_status` (
  `event` smallint(6) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`event`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Game event system';

-- Data exporting was unselected.


-- Dumping structure for table characters.gm_subsurveys
CREATE TABLE IF NOT EXISTS `gm_subsurveys` (
  `survey_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subsurvey_id` int(10) unsigned NOT NULL DEFAULT '0',
  `rank` int(10) unsigned NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  PRIMARY KEY (`survey_id`,`subsurvey_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Player System';

-- Data exporting was unselected.


-- Dumping structure for table characters.gm_surveys
CREATE TABLE IF NOT EXISTS `gm_surveys` (
  `survey_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `guid` int(10) unsigned NOT NULL DEFAULT '0',
  `main_survey` int(10) unsigned NOT NULL DEFAULT '0',
  `overall_comment` longtext NOT NULL,
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`survey_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Player System';

-- Data exporting was unselected.


-- Dumping structure for table characters.gm_tickets
CREATE TABLE IF NOT EXISTS `gm_tickets` (
  `ticket_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `guid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier of ticket creator',
  `name` varchar(12) NOT NULL COMMENT 'Name of ticket creator',
  `message` text NOT NULL,
  `create_time` bigint(20) unsigned NOT NULL DEFAULT '0',
  `map` smallint(5) unsigned NOT NULL DEFAULT '0',
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `last_modified_time` bigint(20) unsigned NOT NULL DEFAULT '0',
  `closed_by` int(10) NOT NULL DEFAULT '0',
  `assigned_to` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'GUID of admin to whom ticket is assigned',
  `comment` text NOT NULL,
  `response` text NOT NULL,
  `completed` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `escalated` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `viewed` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `have_ticket` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ticket_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `security_needed` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ticket_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Player System';

-- Data exporting was unselected.


-- Dumping structure for table characters.groups
CREATE TABLE IF NOT EXISTS `groups` (
  `group_id` int(11) unsigned NOT NULL,
  `leader_guid` int(11) unsigned NOT NULL,
  `main_tank_guid` int(11) unsigned NOT NULL,
  `main_assistant_guid` int(11) unsigned NOT NULL,
  `loot_method` tinyint(4) unsigned NOT NULL,
  `loot_threshold` tinyint(4) unsigned NOT NULL,
  `looter_guid` int(11) unsigned NOT NULL,
  `icon1` int(11) unsigned NOT NULL,
  `icon2` int(11) unsigned NOT NULL,
  `icon3` int(11) unsigned NOT NULL,
  `icon4` int(11) unsigned NOT NULL,
  `icon5` int(11) unsigned NOT NULL,
  `icon6` int(11) unsigned NOT NULL,
  `icon7` int(11) unsigned NOT NULL,
  `icon8` int(11) unsigned NOT NULL,
  `is_raid` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`group_id`),
  UNIQUE KEY `key_leaderGuid` (`leader_guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Groups';

-- Data exporting was unselected.


-- Dumping structure for table characters.group_instance
CREATE TABLE IF NOT EXISTS `group_instance` (
  `leader_guid` int(11) unsigned NOT NULL DEFAULT '0',
  `instance` int(11) unsigned NOT NULL DEFAULT '0',
  `permanent` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`leader_guid`,`instance`),
  KEY `idx_instance` (`instance`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table characters.group_member
CREATE TABLE IF NOT EXISTS `group_member` (
  `group_id` int(11) unsigned NOT NULL,
  `member_guid` int(11) unsigned NOT NULL,
  `assistant` tinyint(1) unsigned NOT NULL,
  `subgroup` smallint(6) unsigned NOT NULL,
  PRIMARY KEY (`group_id`,`member_guid`),
  KEY `idx_memberGuid` (`member_guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Groups';

-- Data exporting was unselected.


-- Dumping structure for table characters.guild
CREATE TABLE IF NOT EXISTS `guild` (
  `guild_id` int(6) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `leader_guid` int(6) unsigned NOT NULL DEFAULT '0',
  `emblem_style` int(5) NOT NULL DEFAULT '0',
  `emblem_color` int(5) NOT NULL DEFAULT '0',
  `border_style` int(5) NOT NULL DEFAULT '0',
  `border_color` int(5) NOT NULL DEFAULT '0',
  `background_color` int(5) NOT NULL DEFAULT '0',
  `info` text NOT NULL,
  `motd` varchar(255) NOT NULL DEFAULT '',
  `create_date` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`guild_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Guild System';

-- Data exporting was unselected.


-- Dumping structure for table characters.guild_eventlog
CREATE TABLE IF NOT EXISTS `guild_eventlog` (
  `guild_id` int(11) NOT NULL COMMENT 'Guild Identificator',
  `log_guid` int(11) NOT NULL COMMENT 'Log record identificator - auxiliary column',
  `event_type` tinyint(1) NOT NULL COMMENT 'Event type',
  `player_guid1` int(11) NOT NULL COMMENT 'Player 1',
  `player_guid2` int(11) NOT NULL COMMENT 'Player 2',
  `new_rank` tinyint(2) NOT NULL COMMENT 'New rank(in case promotion/demotion)',
  `timestamp` bigint(20) NOT NULL COMMENT 'Event UNIX time',
  PRIMARY KEY (`guild_id`,`log_guid`),
  KEY `idx_PlayerGuid1` (`player_guid1`),
  KEY `idx_PlayerGuid2` (`player_guid2`),
  KEY `idx_LogGuid` (`log_guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Guild Eventlog';

-- Data exporting was unselected.


-- Dumping structure for table characters.guild_member
CREATE TABLE IF NOT EXISTS `guild_member` (
  `guild_id` int(6) unsigned NOT NULL DEFAULT '0',
  `guid` int(11) unsigned NOT NULL DEFAULT '0',
  `rank` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `player_note` varchar(255) NOT NULL DEFAULT '',
  `officer_note` varchar(255) NOT NULL DEFAULT '',
  UNIQUE KEY `key_guid` (`guid`),
  KEY `idx_guildid` (`guild_id`),
  KEY `idx_guildid_rank` (`guild_id`,`rank`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Guild System';

-- Data exporting was unselected.


-- Dumping structure for table characters.guild_rank
CREATE TABLE IF NOT EXISTS `guild_rank` (
  `guild_id` int(6) unsigned NOT NULL DEFAULT '0',
  `id` int(11) unsigned NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `rights` int(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guild_id`,`id`),
  KEY `idx_rid` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Guild System';

-- Data exporting was unselected.


-- Dumping structure for table characters.instance
CREATE TABLE IF NOT EXISTS `instance` (
  `id` int(11) unsigned NOT NULL DEFAULT '0',
  `map` int(11) unsigned NOT NULL DEFAULT '0',
  `reset_time` bigint(40) NOT NULL DEFAULT '0',
  `data` longtext,
  PRIMARY KEY (`id`),
  KEY `idx_map` (`map`),
  KEY `idx_resettime` (`reset_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table characters.instance_reset
CREATE TABLE IF NOT EXISTS `instance_reset` (
  `map` int(11) unsigned NOT NULL DEFAULT '0',
  `reset_time` bigint(40) NOT NULL DEFAULT '0',
  PRIMARY KEY (`map`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table characters.item_instance
CREATE TABLE IF NOT EXISTS `item_instance` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0',
  `item_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `owner_guid` int(10) unsigned NOT NULL DEFAULT '0',
  `creator_guid` int(10) unsigned NOT NULL DEFAULT '0',
  `gift_creator_guid` int(10) unsigned NOT NULL DEFAULT '0',
  `count` int(10) unsigned NOT NULL DEFAULT '1',
  `duration` int(10) NOT NULL DEFAULT '0',
  `charges` tinytext,
  `flags` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `enchantments` text NOT NULL,
  `random_property_id` smallint(5) NOT NULL DEFAULT '0',
  `durability` smallint(5) unsigned NOT NULL DEFAULT '0',
  `text` int(10) unsigned NOT NULL DEFAULT '0',
  `generated_loot` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`guid`),
  KEY `idx_owner_guid` (`owner_guid`),
  KEY `idx_itemEntry` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Item System';

-- Data exporting was unselected.


-- Dumping structure for table characters.item_loot
CREATE TABLE IF NOT EXISTS `item_loot` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0',
  `owner_guid` int(11) unsigned NOT NULL DEFAULT '0',
  `item_id` int(11) unsigned NOT NULL DEFAULT '0',
  `amount` int(11) unsigned NOT NULL DEFAULT '0',
  `property` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`item_id`),
  KEY `idx_owner_guid` (`owner_guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Item System';

-- Data exporting was unselected.


-- Dumping structure for table characters.item_text
CREATE TABLE IF NOT EXISTS `item_text` (
  `id` int(11) unsigned NOT NULL DEFAULT '0',
  `text` longtext,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Item System';

-- Data exporting was unselected.


-- Dumping structure for table characters.mail
CREATE TABLE IF NOT EXISTS `mail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identifier',
  `message_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `stationery` tinyint(3) NOT NULL DEFAULT '41',
  `mail_template_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `sender_guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Character Global Unique Identifier',
  `receiver_guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Character Global Unique Identifier',
  `subject` longtext,
  `item_text_id` int(11) unsigned NOT NULL DEFAULT '0',
  `has_items` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `expire_time` bigint(40) NOT NULL DEFAULT '0',
  `deliver_time` bigint(40) NOT NULL DEFAULT '0',
  `money` int(11) unsigned NOT NULL DEFAULT '0',
  `cod` int(11) unsigned NOT NULL DEFAULT '0',
  `checked` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_receiver` (`receiver_guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Mail System';

-- Data exporting was unselected.


-- Dumping structure for table characters.mail_items
CREATE TABLE IF NOT EXISTS `mail_items` (
  `mail_id` int(11) unsigned NOT NULL DEFAULT '0',
  `item_guid` int(11) unsigned NOT NULL DEFAULT '0',
  `item_id` int(11) unsigned NOT NULL DEFAULT '0',
  `receiver_guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Character Global Unique Identifier',
  PRIMARY KEY (`mail_id`,`item_guid`),
  KEY `idx_receiver` (`receiver_guid`),
  KEY `idx_item_guid` (`item_guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.


-- Dumping structure for table characters.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table characters.petition
CREATE TABLE IF NOT EXISTS `petition` (
  `owner_guid` int(10) unsigned NOT NULL,
  `petition_guid` int(10) unsigned DEFAULT '0',
  `charter_guid` int(10) unsigned DEFAULT NULL COMMENT 'Charter item GUID',
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`owner_guid`),
  UNIQUE KEY `key_ownerguid_petitionguid` (`owner_guid`,`petition_guid`),
  UNIQUE KEY `charterguid` (`charter_guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Guild System';

-- Data exporting was unselected.


-- Dumping structure for table characters.petition_sign
CREATE TABLE IF NOT EXISTS `petition_sign` (
  `owner_guid` int(10) unsigned NOT NULL,
  `petition_guid` int(11) unsigned NOT NULL DEFAULT '0',
  `player_guid` int(11) unsigned NOT NULL DEFAULT '0',
  `player_account` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`petition_guid`,`player_guid`),
  KEY `idx_playerguid` (`player_guid`),
  KEY `idx_ownerguid` (`owner_guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Guild System';

-- Data exporting was unselected.


-- Dumping structure for table characters.pet_aura
CREATE TABLE IF NOT EXISTS `pet_aura` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `caster_guid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'Full Global Unique Identifier',
  `item_guid` int(11) unsigned NOT NULL DEFAULT '0',
  `spell` int(11) unsigned NOT NULL DEFAULT '0',
  `stacks` int(11) unsigned NOT NULL DEFAULT '1',
  `charges` int(11) unsigned NOT NULL DEFAULT '0',
  `base_points0` float NOT NULL DEFAULT '0',
  `base_points1` float NOT NULL DEFAULT '0',
  `base_points2` float NOT NULL DEFAULT '0',
  `periodic_time0` int(11) unsigned NOT NULL DEFAULT '0',
  `periodic_time1` int(11) unsigned NOT NULL DEFAULT '0',
  `periodic_time2` int(11) unsigned NOT NULL DEFAULT '0',
  `max_duration` int(11) NOT NULL DEFAULT '0',
  `duration` int(11) NOT NULL DEFAULT '0',
  `effect_index_mask` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`caster_guid`,`item_guid`,`spell`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Pet System';

-- Data exporting was unselected.


-- Dumping structure for table characters.pet_spell
CREATE TABLE IF NOT EXISTS `pet_spell` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `spell` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Spell Identifier',
  `active` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`spell`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Pet System';

-- Data exporting was unselected.


-- Dumping structure for table characters.pet_spell_cooldown
CREATE TABLE IF NOT EXISTS `pet_spell_cooldown` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier, Low part',
  `spell` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Spell Identifier',
  `time` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`spell`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table characters.playerbot
CREATE TABLE IF NOT EXISTS `playerbot` (
  `char_guid` bigint(20) unsigned NOT NULL,
  `chance` int(10) unsigned NOT NULL DEFAULT '10',
  `comment` varchar(255) DEFAULT NULL,
  `ai` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`char_guid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table characters.saved_variables
CREATE TABLE IF NOT EXISTS `saved_variables` (
  `key` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `cleaning_flags` int(11) unsigned NOT NULL DEFAULT '0',
  `honor_last_maintenance_day` int(11) unsigned NOT NULL DEFAULT '0',
  `honor_next_maintenance_day` int(11) unsigned NOT NULL DEFAULT '0',
  `honor_maintenance_marker` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Variable Saves';

-- Data exporting was unselected.


-- Dumping structure for table characters.world
CREATE TABLE IF NOT EXISTS `world` (
  `map` int(11) unsigned NOT NULL DEFAULT '0',
  `data` longtext,
  PRIMARY KEY (`map`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table characters.worldstates
CREATE TABLE IF NOT EXISTS `worldstates` (
  `entry` int(11) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  UNIQUE KEY `key_entry` (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
