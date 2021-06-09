DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210607095329');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210607095329');
-- Add your query below.


ALTER TABLE `auction`
	CHANGE COLUMN `houseid` `house_id` INT(11) UNSIGNED NOT NULL DEFAULT '0' AFTER `id`,
	CHANGE COLUMN `itemguid` `item_guid` INT(11) UNSIGNED NOT NULL DEFAULT '0' AFTER `house_id`,
	CHANGE COLUMN `item_template` `item_id` INT(11) UNSIGNED NOT NULL DEFAULT '0' AFTER `item_guid`,
	CHANGE COLUMN `itemowner` `seller_guid` INT(11) UNSIGNED NOT NULL DEFAULT '0' AFTER `item_id`,
	CHANGE COLUMN `buyoutprice` `buyout_price` INT(11) NOT NULL DEFAULT '0' AFTER `seller_guid`,
	CHANGE COLUMN `time` `expire_time` BIGINT(40) NOT NULL DEFAULT '0' AFTER `buyout_price`,
	CHANGE COLUMN `buyguid` `buyer_guid` INT(11) UNSIGNED NOT NULL DEFAULT '0' AFTER `expire_time`,
	CHANGE COLUMN `lastbid` `last_bid` INT(11) NOT NULL DEFAULT '0' AFTER `buyer_guid`,
	CHANGE COLUMN `startbid` `start_bid` INT(11) NOT NULL DEFAULT '0' AFTER `last_bid`;

DROP TABLE `bugreport`;

DROP TABLE `bugreports`;

DROP TABLE `census`;

ALTER TABLE `characters`
	DROP COLUMN `cinematic`;

ALTER TABLE `characters`
	ADD COLUMN `skin` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' AFTER `gender`,
	ADD COLUMN `face` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' AFTER `skin`,
	ADD COLUMN `hair_style` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' AFTER `face`,
	ADD COLUMN `hair_color` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' AFTER `hair_style`,
	ADD COLUMN `facial_hair` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' AFTER `hair_color`;

UPDATE `characters` SET `skin`=(`playerBytes` & 0xFF);
UPDATE `characters` SET `face`=((`playerBytes` >> 8) & 0xFF);
UPDATE `characters` SET `hair_style`=((`playerBytes` >> 16) & 0xFF);
UPDATE `characters` SET `hair_color`=((`playerBytes` >> 24) & 0xFF);
UPDATE `characters` SET `facial_hair`=(`playerBytes2` & 0xFF);

ALTER TABLE `characters`
	CHANGE COLUMN `playerFlags` `player_flags` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `money`,
	CHANGE COLUMN `zone` `zone` INT(11) UNSIGNED NOT NULL DEFAULT '0' AFTER `player_flags`,
	CHANGE COLUMN `map` `map` INT(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Map Identifier' AFTER `zone`,
	CHANGE COLUMN `transguid` `transport_guid` BIGINT(20) UNSIGNED NOT NULL DEFAULT '0' AFTER `orientation`,
	CHANGE COLUMN `trans_x` `transport_x` FLOAT NOT NULL DEFAULT '0' AFTER `transport_guid`,
	CHANGE COLUMN `trans_y` `transport_y` FLOAT NOT NULL DEFAULT '0' AFTER `transport_x`,
	CHANGE COLUMN `trans_z` `transport_z` FLOAT NOT NULL DEFAULT '0' AFTER `transport_y`,
	CHANGE COLUMN `trans_o` `transport_o` FLOAT NOT NULL DEFAULT '0' AFTER `transport_z`,
	CHANGE COLUMN `taximask` `known_taxi_mask` LONGTEXT NULL COMMENT 'discovered flight points' AFTER `transport_o`,
	CHANGE COLUMN `taxi_path` `current_taxi_path` TEXT NULL COMMENT 'flight destination' AFTER `known_taxi_mask`,
	CHANGE COLUMN `totaltime` `played_time_total` INT(11) UNSIGNED NOT NULL DEFAULT '0' AFTER `online`,
	CHANGE COLUMN `leveltime` `played_time_level` INT(11) UNSIGNED NOT NULL DEFAULT '0' AFTER `played_time_total`,
	ADD COLUMN `create_time` BIGINT(20) UNSIGNED NOT NULL DEFAULT '0' AFTER `played_time_level`,
	CHANGE COLUMN `resettalents_multiplier` `reset_talents_multiplier` INT(11) UNSIGNED NOT NULL DEFAULT '0' AFTER `rest_bonus`,
	CHANGE COLUMN `resettalents_time` `reset_talents_time` BIGINT(20) UNSIGNED NOT NULL DEFAULT '0' AFTER `reset_talents_multiplier`,
	CHANGE COLUMN `death_expire_time` `death_expire_time` BIGINT(20) UNSIGNED NOT NULL DEFAULT '0' AFTER `reset_talents_time`,
	ADD COLUMN `bank_bag_slots` TINYINT(1) UNSIGNED NOT NULL DEFAULT '0' AFTER `stable_slots`,
	CHANGE COLUMN `at_login` `at_login_flags` INT(11) UNSIGNED NOT NULL DEFAULT '0' AFTER `bank_bag_slots`,
	CHANGE COLUMN `extra_flags` `extra_flags` INT(11) UNSIGNED NOT NULL DEFAULT '0' AFTER `at_login_flags`,
	CHANGE COLUMN `honorRankPoints` `honor_rank_points` FLOAT NOT NULL DEFAULT '0' AFTER `extra_flags`,
	CHANGE COLUMN `honorHighestRank` `honor_highest_rank` INT(11) UNSIGNED NOT NULL DEFAULT '0' AFTER `honor_rank_points`,
	CHANGE COLUMN `honorStanding` `honor_standing` INT(11) UNSIGNED NOT NULL DEFAULT '0' AFTER `honor_highest_rank`,
	CHANGE COLUMN `honorLastWeekHK` `honor_last_week_hk` INT(11) UNSIGNED NOT NULL DEFAULT '0' AFTER `honor_standing`,
	CHANGE COLUMN `honorLastWeekCP` `honor_last_week_cp` FLOAT NOT NULL DEFAULT '0' AFTER `honor_last_week_hk`,
	CHANGE COLUMN `honorStoredHK` `honor_stored_hk` INT(11) NOT NULL DEFAULT '0' AFTER `honor_last_week_cp`,
	CHANGE COLUMN `honorStoredDK` `honor_stored_dk` INT(11) NOT NULL DEFAULT '0' AFTER `honor_stored_hk`,
	CHANGE COLUMN `watchedFaction` `watched_faction` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `honor_stored_dk`,
	CHANGE COLUMN `exploredZones` `explored_zones` LONGTEXT NULL AFTER `power5`,
	CHANGE COLUMN `equipmentCache` `equipment_cache` LONGTEXT NULL AFTER `explored_zones`,
	CHANGE COLUMN `ammoId` `ammo_id` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `equipment_cache`,
	CHANGE COLUMN `actionBars` `action_bars` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' AFTER `ammo_id`,
	CHANGE COLUMN `deleteInfos_Account` `deleted_account` INT(11) UNSIGNED NULL DEFAULT NULL AFTER `action_bars`,
	CHANGE COLUMN `deleteInfos_Name` `deleted_name` VARCHAR(12) NULL DEFAULT NULL AFTER `deleted_account`,
	CHANGE COLUMN `deleteDate` `deleted_time` BIGINT(20) NULL DEFAULT NULL AFTER `deleted_name`;
  
UPDATE `characters` SET `bank_bag_slots`=((`playerBytes2` >> 16) & 0xFF);

ALTER TABLE `characters`
	DROP COLUMN `playerBytes`,
	DROP COLUMN `playerBytes2`,
	DROP COLUMN `area`,
	DROP COLUMN `customFlags`;

ALTER TABLE `characters`
	CHANGE COLUMN `watched_faction` `watched_faction` BIGINT NOT NULL DEFAULT '0' AFTER `honor_stored_dk`;

UPDATE `characters` SET `watched_faction`=-1 WHERE `watched_faction`=4294967295;

ALTER TABLE `characters`
	CHANGE COLUMN `watched_faction` `watched_faction` INT NOT NULL DEFAULT '-1' AFTER `honor_stored_dk`;

ALTER TABLE `character_aura`
	CHANGE COLUMN `stackcount` `stacks` INT(11) UNSIGNED NOT NULL DEFAULT '1' AFTER `spell`,
	CHANGE COLUMN `remaincharges` `charges` INT(11) UNSIGNED NOT NULL DEFAULT '0' AFTER `stacks`,
	CHANGE COLUMN `basepoints0` `base_points0` FLOAT NOT NULL DEFAULT '0' AFTER `charges`,
	CHANGE COLUMN `basepoints1` `base_points1` FLOAT NOT NULL DEFAULT '0' AFTER `base_points0`,
	CHANGE COLUMN `basepoints2` `base_points2` FLOAT NOT NULL DEFAULT '0' AFTER `base_points1`,
	CHANGE COLUMN `periodictime0` `periodic_time0` INT(11) UNSIGNED NOT NULL DEFAULT '0' AFTER `base_points2`,
	CHANGE COLUMN `periodictime1` `periodic_time1` INT(11) UNSIGNED NOT NULL DEFAULT '0' AFTER `periodic_time0`,
	CHANGE COLUMN `periodictime2` `periodic_time2` INT(11) UNSIGNED NOT NULL DEFAULT '0' AFTER `periodic_time1`,
	CHANGE COLUMN `maxduration` `max_duration` INT(11) NOT NULL DEFAULT '0' AFTER `periodic_time2`,
	CHANGE COLUMN `remaintime` `duration` INT(11) NOT NULL DEFAULT '0' AFTER `max_duration`,
	CHANGE COLUMN `effIndexMask` `effect_index_mask` TINYINT UNSIGNED NOT NULL DEFAULT '0' AFTER `duration`;

ALTER TABLE `pet_aura`
	CHANGE COLUMN `stackcount` `stacks` INT(11) UNSIGNED NOT NULL DEFAULT '1' AFTER `spell`,
	CHANGE COLUMN `remaincharges` `charges` INT(11) UNSIGNED NOT NULL DEFAULT '0' AFTER `stacks`,
	CHANGE COLUMN `basepoints0` `base_points0` FLOAT NOT NULL DEFAULT '0' AFTER `charges`,
	CHANGE COLUMN `basepoints1` `base_points1` FLOAT NOT NULL DEFAULT '0' AFTER `base_points0`,
	CHANGE COLUMN `basepoints2` `base_points2` FLOAT NOT NULL DEFAULT '0' AFTER `base_points1`,
	CHANGE COLUMN `periodictime0` `periodic_time0` INT(11) UNSIGNED NOT NULL DEFAULT '0' AFTER `base_points2`,
	CHANGE COLUMN `periodictime1` `periodic_time1` INT(11) UNSIGNED NOT NULL DEFAULT '0' AFTER `periodic_time0`,
	CHANGE COLUMN `periodictime2` `periodic_time2` INT(11) UNSIGNED NOT NULL DEFAULT '0' AFTER `periodic_time1`,
	CHANGE COLUMN `maxduration` `max_duration` INT(11) NOT NULL DEFAULT '0' AFTER `periodic_time2`,
	CHANGE COLUMN `remaintime` `duration` INT(11) NOT NULL DEFAULT '0' AFTER `max_duration`,
	CHANGE COLUMN `effIndexMask` `effect_index_mask` TINYINT UNSIGNED NOT NULL DEFAULT '0' AFTER `duration`;

DROP TABLE `character_bgqueue`;

ALTER TABLE `character_deleted_items`
	CHANGE COLUMN `item_entry` `item_id` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `player_guid`;

ALTER TABLE `character_gifts`
	CHANGE COLUMN `entry` `item_id` INT(20) UNSIGNED NOT NULL DEFAULT '0' AFTER `item_guid`;

ALTER TABLE `character_honor_cp`
	CHANGE COLUMN `victimType` `victim_type` TINYINT(3) UNSIGNED NOT NULL DEFAULT '4' COMMENT 'Object Type Id' AFTER `guid`,
	CHANGE COLUMN `victim` `victim_id` INT(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Creature Id / Player Guid' AFTER `victim_type`;

ALTER TABLE `character_inventory`
	CHANGE COLUMN `item` `item_guid` INT(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Item Global Unique Identifier' AFTER `slot`,
	CHANGE COLUMN `item_template` `item_id` INT(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Item Identifier' AFTER `item_guid`;

ALTER TABLE `character_pet`
	CHANGE COLUMN `modelid` `display_id` INT(11) UNSIGNED NULL DEFAULT '0' AFTER `owner`,
	CHANGE COLUMN `CreatedBySpell` `created_by_spell` INT(11) UNSIGNED NOT NULL DEFAULT '0' AFTER `display_id`,
	CHANGE COLUMN `PetType` `pet_type` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' AFTER `created_by_spell`,
	CHANGE COLUMN `Reactstate` `react_state` TINYINT(1) UNSIGNED NOT NULL DEFAULT '0' AFTER `exp`,
	CHANGE COLUMN `loyaltypoints` `loyalty_points` INT(11) NOT NULL DEFAULT '0' AFTER `react_state`,
	CHANGE COLUMN `trainpoint` `training_points` INT(11) NOT NULL DEFAULT '0' AFTER `loyalty`,
	CHANGE COLUMN `curhealth` `current_health` INT(11) UNSIGNED NOT NULL DEFAULT '1' AFTER `slot`,
	CHANGE COLUMN `curmana` `current_mana` INT(11) UNSIGNED NOT NULL DEFAULT '0' AFTER `current_health`,
	CHANGE COLUMN `curhappiness` `current_happiness` INT(11) UNSIGNED NOT NULL DEFAULT '0' AFTER `current_mana`,
	CHANGE COLUMN `savetime` `save_time` BIGINT(20) UNSIGNED NOT NULL DEFAULT '0' AFTER `current_happiness`,
	CHANGE COLUMN `resettalents_cost` `reset_talents_cost` INT(11) UNSIGNED NOT NULL DEFAULT '0' AFTER `save_time`,
	CHANGE COLUMN `resettalents_time` `reset_talents_time` BIGINT(20) UNSIGNED NOT NULL DEFAULT '0' AFTER `reset_talents_cost`,
	CHANGE COLUMN `abdata` `action_bar_data` LONGTEXT NULL AFTER `reset_talents_time`,
	CHANGE COLUMN `teachspelldata` `teach_spell_data` LONGTEXT NULL AFTER `action_bar_data`;

ALTER TABLE `character_pet`
	CHANGE COLUMN `exp` `xp` INT(11) UNSIGNED NOT NULL DEFAULT '0' AFTER `level`;
ALTER TABLE `character_pet`
	CHANGE COLUMN `owner` `owner_guid` INT(11) UNSIGNED NOT NULL DEFAULT '0' AFTER `entry`;

ALTER TABLE `character_queststatus`
	CHANGE COLUMN `mobcount1` `mob_count1` INT(11) UNSIGNED NOT NULL DEFAULT '0' AFTER `timer`,
	CHANGE COLUMN `mobcount2` `mob_count2` INT(11) UNSIGNED NOT NULL DEFAULT '0' AFTER `mob_count1`,
	CHANGE COLUMN `mobcount3` `mob_count3` INT(11) UNSIGNED NOT NULL DEFAULT '0' AFTER `mob_count2`,
	CHANGE COLUMN `mobcount4` `mob_count4` INT(11) UNSIGNED NOT NULL DEFAULT '0' AFTER `mob_count3`,
	CHANGE COLUMN `itemcount1` `item_count1` INT(11) UNSIGNED NOT NULL DEFAULT '0' AFTER `mob_count4`,
	CHANGE COLUMN `itemcount2` `item_count2` INT(11) UNSIGNED NOT NULL DEFAULT '0' AFTER `item_count1`,
	CHANGE COLUMN `itemcount3` `item_count3` INT(11) UNSIGNED NOT NULL DEFAULT '0' AFTER `item_count2`,
	CHANGE COLUMN `itemcount4` `item_count4` INT(11) UNSIGNED NOT NULL DEFAULT '0' AFTER `item_count3`;

ALTER TABLE `character_spell_cooldown`
	CHANGE COLUMN `SpellId` `spell` INT(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Spell Identifier' AFTER `guid`,
	CHANGE COLUMN `SpellExpireTime` `spell_expire_time` BIGINT(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Spell cooldown expire time' AFTER `spell`,
	CHANGE COLUMN `Category` `category` INT(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Spell category' AFTER `spell_expire_time`,
	CHANGE COLUMN `CategoryExpireTime` `category_expire_time` BIGINT(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Spell category cooldown expire time' AFTER `category`,
	CHANGE COLUMN `ItemId` `item_id` INT(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Item Identifier' AFTER `category_expire_time`;

ALTER TABLE `character_stats`
	CHANGE COLUMN `maxhealth` `max_health` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `guid`,
	CHANGE COLUMN `maxpower1` `max_power1` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `max_health`,
	CHANGE COLUMN `maxpower2` `max_power2` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `max_power1`,
	CHANGE COLUMN `maxpower3` `max_power3` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `max_power2`,
	CHANGE COLUMN `maxpower4` `max_power4` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `max_power3`,
	CHANGE COLUMN `maxpower5` `max_power5` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `max_power4`,
	CHANGE COLUMN `maxpower6` `max_power6` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `max_power5`,
	CHANGE COLUMN `maxpower7` `max_power7` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `max_power6`,
	CHANGE COLUMN `strength` `strength` FLOAT NOT NULL DEFAULT '0' AFTER `max_power7`,
	CHANGE COLUMN `agility` `agility` FLOAT NOT NULL DEFAULT '0' AFTER `strength`,
	CHANGE COLUMN `stamina` `stamina` FLOAT NOT NULL DEFAULT '0' AFTER `agility`,
	CHANGE COLUMN `intellect` `intellect` FLOAT NOT NULL DEFAULT '0' AFTER `stamina`,
	CHANGE COLUMN `spirit` `spirit` FLOAT NOT NULL DEFAULT '0' AFTER `intellect`,
	CHANGE COLUMN `armor` `armor` INT(10) NOT NULL DEFAULT '0' AFTER `spirit`,
	CHANGE COLUMN `resHoly` `holy_res` INT(10) NOT NULL DEFAULT '0' AFTER `armor`,
	CHANGE COLUMN `resFire` `fire_res` INT(10) NOT NULL DEFAULT '0' AFTER `holy_res`,
	CHANGE COLUMN `resNature` `nature_res` INT(10) NOT NULL DEFAULT '0' AFTER `fire_res`,
	CHANGE COLUMN `resFrost` `frost_res` INT(10) NOT NULL DEFAULT '0' AFTER `nature_res`,
	CHANGE COLUMN `resShadow` `shadow_res` INT(10) NOT NULL DEFAULT '0' AFTER `frost_res`,
	CHANGE COLUMN `resArcane` `arcane_res` INT(10) NOT NULL DEFAULT '0' AFTER `shadow_res`,
	CHANGE COLUMN `blockPct` `block_chance` FLOAT NOT NULL DEFAULT '0' AFTER `arcane_res`,
	CHANGE COLUMN `dodgePct` `dodge_chance` FLOAT NOT NULL DEFAULT '0' AFTER `block_chance`,
	CHANGE COLUMN `parryPct` `parry_chance` FLOAT NOT NULL DEFAULT '0' AFTER `dodge_chance`,
	CHANGE COLUMN `critPct` `crit_chance` FLOAT NOT NULL DEFAULT '0' AFTER `parry_chance`,
	CHANGE COLUMN `rangedCritPct` `ranged_crit_chance` FLOAT NOT NULL DEFAULT '0' AFTER `crit_chance`,
	CHANGE COLUMN `attackPower` `attack_power` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `ranged_crit_chance`,
	CHANGE COLUMN `rangedAttackPower` `ranged_attack_power` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `attack_power`;

DROP TABLE `character_ticket`;

ALTER TABLE `creature_respawn`
	CHANGE COLUMN `respawntime` `respawn_time` BIGINT(20) NOT NULL DEFAULT '0' AFTER `guid`;

ALTER TABLE `corpse`
	CHANGE COLUMN `player` `player_guid` INT(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Character Global Unique Identifier' AFTER `guid`;

ALTER TABLE `gameobject_respawn`
	CHANGE COLUMN `respawntime` `respawn_time` BIGINT(20) NOT NULL DEFAULT '0' AFTER `guid`;

ALTER TABLE `gm_subsurveys`
	CHANGE COLUMN `surveyId` `survey_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT FIRST,
	CHANGE COLUMN `subsurveyId` `subsurvey_id` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `survey_id`;

ALTER TABLE `gm_surveys`
	CHANGE COLUMN `surveyId` `survey_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT FIRST,
	CHANGE COLUMN `mainSurvey` `main_survey` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `guid`,
	CHANGE COLUMN `overallComment` `overall_comment` LONGTEXT NOT NULL AFTER `main_survey`,
	CHANGE COLUMN `createTime` `create_time` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `overall_comment`;

ALTER TABLE `gm_tickets`
	CHANGE COLUMN `ticketId` `ticket_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT FIRST,
	CHANGE COLUMN `createTime` `create_time` BIGINT UNSIGNED NOT NULL DEFAULT '0' AFTER `message`,
	CHANGE COLUMN `mapId` `map` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0' AFTER `create_time`,
	CHANGE COLUMN `posX` `position_x` FLOAT NOT NULL DEFAULT '0' AFTER `map`,
	CHANGE COLUMN `posY` `position_y` FLOAT NOT NULL DEFAULT '0' AFTER `position_x`,
	CHANGE COLUMN `posZ` `position_z` FLOAT NOT NULL DEFAULT '0' AFTER `position_y`,
	CHANGE COLUMN `lastModifiedTime` `last_modified_time` BIGINT UNSIGNED NOT NULL DEFAULT '0' AFTER `position_z`,
	CHANGE COLUMN `closedBy` `closed_by` INT(10) NOT NULL DEFAULT '0' AFTER `last_modified_time`,
	CHANGE COLUMN `assignedTo` `assigned_to` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'GUID of admin to whom ticket is assigned' AFTER `closed_by`,
	CHANGE COLUMN `haveTicket` `have_ticket` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' AFTER `viewed`,
	CHANGE COLUMN `ticketType` `ticket_type` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' AFTER `have_ticket`,
	CHANGE COLUMN `securityNeeded` `security_needed` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' AFTER `ticket_type`;

ALTER TABLE `groups`
	CHANGE COLUMN `groupId` `group_id` INT(11) UNSIGNED NOT NULL FIRST,
	CHANGE COLUMN `leaderGuid` `leader_guid` INT(11) UNSIGNED NOT NULL AFTER `group_id`,
	CHANGE COLUMN `mainTank` `main_tank_guid` INT(11) UNSIGNED NOT NULL AFTER `leader_guid`,
	CHANGE COLUMN `mainAssistant` `main_assistant_guid` INT(11) UNSIGNED NOT NULL AFTER `main_tank_guid`,
	CHANGE COLUMN `lootMethod` `loot_method` TINYINT(4) UNSIGNED NOT NULL AFTER `main_assistant_guid`,
	CHANGE COLUMN `lootThreshold` `loot_threshold` TINYINT(4) UNSIGNED NOT NULL AFTER `loot_method`,
	CHANGE COLUMN `looterGuid` `looter_guid` INT(11) UNSIGNED NOT NULL AFTER `loot_threshold`,
	CHANGE COLUMN `isRaid` `is_raid` TINYINT(1) UNSIGNED NOT NULL AFTER `icon8`;
  
ALTER TABLE `group_instance`
	CHANGE COLUMN `leaderGuid` `leader_guid` INT(11) UNSIGNED NOT NULL DEFAULT '0' FIRST;

ALTER TABLE `group_member`
	CHANGE COLUMN `groupId` `group_id` INT(11) UNSIGNED NOT NULL FIRST,
	CHANGE COLUMN `memberGuid` `member_guid` INT(11) UNSIGNED NOT NULL AFTER `group_id`;

ALTER TABLE `guild`
	CHANGE COLUMN `guildid` `guild_id` INT(6) UNSIGNED NOT NULL DEFAULT '0' FIRST,
	CHANGE COLUMN `leaderguid` `leader_guid` INT(6) UNSIGNED NOT NULL DEFAULT '0' AFTER `name`,
	CHANGE COLUMN `EmblemStyle` `emblem_style` INT(5) NOT NULL DEFAULT '0' AFTER `leader_guid`,
	CHANGE COLUMN `EmblemColor` `emblem_color` INT(5) NOT NULL DEFAULT '0' AFTER `emblem_style`,
	CHANGE COLUMN `BorderStyle` `border_style` INT(5) NOT NULL DEFAULT '0' AFTER `emblem_color`,
	CHANGE COLUMN `BorderColor` `border_color` INT(5) NOT NULL DEFAULT '0' AFTER `border_style`,
	CHANGE COLUMN `BackgroundColor` `background_color` INT(5) NOT NULL DEFAULT '0' AFTER `border_color`,
	CHANGE COLUMN `createdate` `create_date` BIGINT(20) NOT NULL DEFAULT '0' AFTER `motd`;

ALTER TABLE `guild_eventlog`
	CHANGE COLUMN `guildid` `guild_id` INT(11) NOT NULL COMMENT 'Guild Identificator' FIRST,
	CHANGE COLUMN `LogGuid` `log_guid` INT(11) NOT NULL COMMENT 'Log record identificator - auxiliary column' AFTER `guild_id`,
	CHANGE COLUMN `EventType` `event_type` TINYINT(1) NOT NULL COMMENT 'Event type' AFTER `log_guid`,
	CHANGE COLUMN `PlayerGuid1` `player_guid1` INT(11) NOT NULL COMMENT 'Player 1' AFTER `event_type`,
	CHANGE COLUMN `PlayerGuid2` `player_guid2` INT(11) NOT NULL COMMENT 'Player 2' AFTER `player_guid1`,
	CHANGE COLUMN `NewRank` `new_rank` TINYINT(2) NOT NULL COMMENT 'New rank(in case promotion/demotion)' AFTER `player_guid2`,
	CHANGE COLUMN `TimeStamp` `timestamp` BIGINT(20) NOT NULL COMMENT 'Event UNIX time' AFTER `new_rank`;

ALTER TABLE `guild_member`
	CHANGE COLUMN `guildid` `guild_id` INT(6) UNSIGNED NOT NULL DEFAULT '0' FIRST,
	CHANGE COLUMN `pnote` `player_note` VARCHAR(255) NOT NULL DEFAULT '' AFTER `rank`,
	CHANGE COLUMN `offnote` `officer_note` VARCHAR(255) NOT NULL DEFAULT '' AFTER `player_note`;
  
ALTER TABLE `guild_rank`
	CHANGE COLUMN `guildid` `guild_id` INT(6) UNSIGNED NOT NULL DEFAULT '0' FIRST,
	CHANGE COLUMN `rid` `id` INT(11) UNSIGNED NOT NULL AFTER `guild_id`,
	CHANGE COLUMN `rname` `name` VARCHAR(255) NOT NULL DEFAULT '' AFTER `id`;

ALTER TABLE `instance`
	CHANGE COLUMN `resettime` `reset_time` BIGINT(40) NOT NULL DEFAULT '0' AFTER `map`;

ALTER TABLE `instance_reset`
	CHANGE COLUMN `mapid` `map` INT(11) UNSIGNED NOT NULL DEFAULT '0' FIRST,
	CHANGE COLUMN `resettime` `reset_time` BIGINT(40) NOT NULL DEFAULT '0' AFTER `map`;

ALTER TABLE `item_instance`
	CHANGE COLUMN `itemEntry` `item_id` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `guid`,
	CHANGE COLUMN `creatorGuid` `creator_guid` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `owner_guid`,
	CHANGE COLUMN `giftCreatorGuid` `gift_creator_guid` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `creator_guid`,
	CHANGE COLUMN `randomPropertyId` `random_property_id` SMALLINT(5) NOT NULL DEFAULT '0' AFTER `enchantments`;

ALTER TABLE `item_loot`
	CHANGE COLUMN `itemid` `item_id` INT(11) UNSIGNED NOT NULL DEFAULT '0' AFTER `owner_guid`;

ALTER TABLE `mail`
	CHANGE COLUMN `messageType` `message_type` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' AFTER `id`,
	CHANGE COLUMN `mailTemplateId` `mail_template_id` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `stationery`,
	CHANGE COLUMN `sender` `sender_guid` INT(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Character Global Unique Identifier' AFTER `mail_template_id`,
	CHANGE COLUMN `receiver` `receiver_guid` INT(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Character Global Unique Identifier' AFTER `sender_guid`,
	CHANGE COLUMN `itemTextId` `item_text_id` INT(11) UNSIGNED NOT NULL DEFAULT '0' AFTER `subject`;

ALTER TABLE `mail_items`
	CHANGE COLUMN `item_template` `item_id` INT(11) UNSIGNED NOT NULL DEFAULT '0' AFTER `item_guid`,
	CHANGE COLUMN `receiver` `receiver_guid` INT(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Character Global Unique Identifier' AFTER `item_id`;

ALTER TABLE `petition`
	CHANGE COLUMN `ownerguid` `owner_guid` INT(10) UNSIGNED NOT NULL FIRST,
	CHANGE COLUMN `petitionguid` `petition_guid` INT(10) UNSIGNED NULL DEFAULT '0' AFTER `owner_guid`,
	CHANGE COLUMN `charterguid` `charter_guid` INT(10) UNSIGNED NULL DEFAULT NULL COMMENT 'Charter item GUID' AFTER `petition_guid`;

ALTER TABLE `petition_sign`
	CHANGE COLUMN `ownerguid` `owner_guid` INT(10) UNSIGNED NOT NULL FIRST,
	CHANGE COLUMN `petitionguid` `petition_guid` INT(11) UNSIGNED NOT NULL DEFAULT '0' AFTER `owner_guid`,
	CHANGE COLUMN `playerguid` `player_guid` INT(11) UNSIGNED NOT NULL DEFAULT '0' AFTER `petition_guid`;

ALTER TABLE `saved_variables`
	CHANGE COLUMN `lastHonorMaintenanceDay` `honor_last_maintenance_day` INT(11) UNSIGNED NOT NULL DEFAULT '0' AFTER `cleaning_flags`,
	CHANGE COLUMN `nextHonorMaintenanceDay` `honor_next_maintenance_day` INT(11) UNSIGNED NOT NULL DEFAULT '0' AFTER `honor_last_maintenance_day`,
	CHANGE COLUMN `honorMaintenanceMarker` `honor_maintenance_marker` TINYINT(1) UNSIGNED NOT NULL DEFAULT '0' AFTER `honor_next_maintenance_day`;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
