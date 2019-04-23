DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20181124131732');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20181124131732');
-- Add your query below.


-- Rename some columns to match convention - lower case with underscores.
ALTER TABLE `areatrigger_template`
	CHANGE COLUMN `ID` `id` SMALLINT(4) UNSIGNED NOT NULL FIRST;
ALTER TABLE `map_loot_disabled`
	CHANGE COLUMN `mapid` `map_id` INT(11) NOT NULL DEFAULT '0' FIRST;
ALTER TABLE `cinematic_waypoints`
	CHANGE COLUMN `posx` `position_x` FLOAT NULL DEFAULT NULL AFTER `timer`,
	CHANGE COLUMN `posy` `position_y` FLOAT NULL DEFAULT NULL AFTER `position_x`,
	CHANGE COLUMN `posz` `position_z` FLOAT NULL DEFAULT NULL AFTER `position_y`;
ALTER TABLE `item_required_target`
	CHANGE COLUMN `targetEntry` `target_entry` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `type`;
ALTER TABLE `area_template`
	CHANGE COLUMN `Entry` `entry` MEDIUMINT(8) NOT NULL DEFAULT '0' FIRST,
	CHANGE COLUMN `MapId` `map_id` MEDIUMINT(8) NOT NULL DEFAULT '0' AFTER `entry`,
	CHANGE COLUMN `ZoneId` `zone_id` MEDIUMINT(8) NOT NULL DEFAULT '0' AFTER `map_id`,
	CHANGE COLUMN `ExploreFlag` `explore_flag` MEDIUMINT(8) NOT NULL DEFAULT '0' AFTER `zone_id`,
	CHANGE COLUMN `Flags` `flags` MEDIUMINT(8) NOT NULL DEFAULT '0' AFTER `explore_flag`,
	CHANGE COLUMN `AreaLevel` `area_level` MEDIUMINT(8) NOT NULL DEFAULT '0' AFTER `flags`,
	CHANGE COLUMN `Name` `name` VARCHAR(100) NOT NULL DEFAULT '' AFTER `area_level`,
	CHANGE COLUMN `Team` `team` TINYINT(3) NOT NULL DEFAULT '0' AFTER `name`,
	CHANGE COLUMN `LiquidTypeId` `liquid_type` TINYINT(3) NOT NULL DEFAULT '0' AFTER `team`;
ALTER TABLE `autobroadcast`
	CHANGE COLUMN `stringId` `string_id` INT(11) NULL DEFAULT NULL AFTER `delay`;
ALTER TABLE `battleground_template`
	CHANGE COLUMN `MinPlayersPerTeam` `min_players_per_team` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0' AFTER `patch`,
	CHANGE COLUMN `MaxPlayersPerTeam` `max_players_per_team` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0' AFTER `min_players_per_team`,
	CHANGE COLUMN `MinLvl` `min_level` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' AFTER `max_players_per_team`,
	CHANGE COLUMN `MaxLvl` `max_level` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' AFTER `min_level`,
	CHANGE COLUMN `AllianceWinSpell` `alliance_win_spell` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0' AFTER `max_level`,
	CHANGE COLUMN `AllianceLoseSpell` `alliance_lose_spell` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0' AFTER `alliance_win_spell`,
	CHANGE COLUMN `HordeWinSpell` `horde_win_spell` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0' AFTER `alliance_lose_spell`,
	CHANGE COLUMN `HordeLoseSpell` `horde_lose_spell` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0' AFTER `horde_win_spell`,
	CHANGE COLUMN `AllianceStartLoc` `alliance_start_location` MEDIUMINT(8) UNSIGNED NOT NULL AFTER `horde_lose_spell`,
	CHANGE COLUMN `AllianceStartO` `alliance_start_o` FLOAT NOT NULL AFTER `alliance_start_location`,
	CHANGE COLUMN `HordeStartLoc` `horde_start_location` MEDIUMINT(8) UNSIGNED NOT NULL AFTER `alliance_start_o`,
	CHANGE COLUMN `HordeStartO` `horde_start_o` FLOAT NOT NULL AFTER `horde_start_location`;
ALTER TABLE `battleground_template`
	CHANGE COLUMN `alliance_start_location` `alliance_start_location` MEDIUMINT(8) UNSIGNED NOT NULL COMMENT 'WorldSafeLocs.dbc' AFTER `horde_lose_spell`,
	CHANGE COLUMN `horde_start_location` `horde_start_location` MEDIUMINT(8) UNSIGNED NOT NULL COMMENT 'WorldSafeLocs.dbc' AFTER `alliance_start_o`;
ALTER TABLE `sound_entries`
	CHANGE COLUMN `ID` `id` SMALLINT(6) NOT NULL DEFAULT '0' FIRST;
ALTER TABLE `skill_line_ability`
	CHANGE COLUMN `ID` `id` SMALLINT(5) UNSIGNED NOT NULL FIRST;
ALTER TABLE `skill_line_ability`
	CHANGE COLUMN `skillId` `skill_id` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `build`,
	CHANGE COLUMN `spellId` `spell_id` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `skill_id`,
	CHANGE COLUMN `raceMask` `race_mask` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `spell_id`,
	CHANGE COLUMN `classMask` `class_mask` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `race_mask`,
	CHANGE COLUMN `reqSkillValue` `req_skill_value` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `class_mask`,
	CHANGE COLUMN `supersededBySpell` `superseded_by_spell` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `req_skill_value`,
	CHANGE COLUMN `learnOnGetSkill` `learn_on_get_skill` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `superseded_by_spell`,
	CHANGE COLUMN `maxValue` `max_value` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `learn_on_get_skill`,
	CHANGE COLUMN `minValue` `min_value` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `max_value`,
	CHANGE COLUMN `reqTrainPoints` `req_train_points` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `min_value`;
ALTER TABLE `creature_groups`
	CHANGE COLUMN `leaderGUID` `leader_guid` INT(11) UNSIGNED NOT NULL FIRST,
	CHANGE COLUMN `memberGUID` `member_guid` INT(11) UNSIGNED NOT NULL AFTER `leader_guid`;
ALTER TABLE `faction`
	CHANGE COLUMN `reputationListID` `reputation_list_id` MEDIUMINT(9) NOT NULL DEFAULT '0' AFTER `build`,
	CHANGE COLUMN `baseRepRaceMask1` `base_rep_race_mask1` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `reputation_list_id`,
	CHANGE COLUMN `baseRepRaceMask2` `base_rep_race_mask2` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `base_rep_race_mask1`,
	CHANGE COLUMN `baseRepRaceMask3` `base_rep_race_mask3` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `base_rep_race_mask2`,
	CHANGE COLUMN `baseRepRaceMask4` `base_rep_race_mask4` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `base_rep_race_mask3`,
	CHANGE COLUMN `baseRepClassMask1` `base_rep_class_mask1` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `base_rep_race_mask4`,
    CHANGE COLUMN `baseRepClassMask2` `base_rep_class_mask2` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `base_rep_class_mask1`,
	CHANGE COLUMN `baseRepClassMask3` `base_rep_class_mask3` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `base_rep_class_mask2`,
	CHANGE COLUMN `baseRepClassMask4` `base_rep_class_mask4` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `base_rep_class_mask3`,
	CHANGE COLUMN `baseRepValue1` `base_rep_value1` MEDIUMINT(9) NOT NULL DEFAULT '0' AFTER `base_rep_class_mask4`,
	CHANGE COLUMN `baseRepValue2` `base_rep_value2` MEDIUMINT(9) NOT NULL DEFAULT '0' AFTER `base_rep_value1`,
	CHANGE COLUMN `baseRepValue3` `base_rep_value3` MEDIUMINT(9) NOT NULL DEFAULT '0' AFTER `base_rep_value2`,
	CHANGE COLUMN `baseRepValue4` `base_rep_value4` MEDIUMINT(9) NOT NULL DEFAULT '0' AFTER `base_rep_value3`,
	CHANGE COLUMN `reputationFlags1` `reputation_flags1` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `base_rep_value4`,
	CHANGE COLUMN `reputationFlags2` `reputation_flags2` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `reputation_flags1`,
	CHANGE COLUMN `reputationFlags3` `reputation_flags3` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `reputation_flags2`,
	CHANGE COLUMN `reputationFlags4` `reputation_flags4` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `reputation_flags3`;
ALTER TABLE `faction`
	CHANGE COLUMN `ID` `id` SMALLINT(3) UNSIGNED NOT NULL DEFAULT '0' FIRST;
ALTER TABLE `faction_template`
	CHANGE COLUMN `ID` `id` SMALLINT(4) UNSIGNED NOT NULL DEFAULT '0' FIRST,
	CHANGE COLUMN `factionId` `faction_id` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `build`,
	CHANGE COLUMN `factionFlags` `faction_flags` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `faction_id`,
	CHANGE COLUMN `ourMask` `our_mask` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `faction_flags`,
	CHANGE COLUMN `friendlyMask` `friendly_mask` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `our_mask`,
	CHANGE COLUMN `hostileMask` `hostile_mask` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `friendly_mask`,
	CHANGE COLUMN `enemyFaction1` `enemy_faction1` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `hostile_mask`,
	CHANGE COLUMN `enemyFaction2` `enemy_faction2` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `enemy_faction1`,
	CHANGE COLUMN `enemyFaction3` `enemy_faction3` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `enemy_faction2`,
	CHANGE COLUMN `enemyFaction4` `enemy_faction4` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `enemy_faction3`,
	CHANGE COLUMN `friendFaction1` `friend_faction1` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `enemy_faction4`,
	CHANGE COLUMN `friendFaction2` `friend_faction2` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `friend_faction1`,
	CHANGE COLUMN `friendFaction3` `friend_faction3` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `friend_faction2`,
	CHANGE COLUMN `friendFaction4` `friend_faction4` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `friend_faction3`;
ALTER TABLE `forbidden_items`
	CHANGE COLUMN `AfterOrBefore` `after_or_before` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' AFTER `patch`;
ALTER TABLE `taxi_nodes`
	CHANGE COLUMN `ID` `id` SMALLINT(3) UNSIGNED NOT NULL FIRST,
	CHANGE COLUMN `mapId` `map_id` MEDIUMINT(6) UNSIGNED NOT NULL DEFAULT '0' AFTER `build`,
	CHANGE COLUMN `mountCreatureId1` `mount_creature_id1` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0' AFTER `name8`,
	CHANGE COLUMN `mountCreatureId2` `mount_creature_id2` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0' AFTER `mount_creature_id1`;
ALTER TABLE `taxi_path_transitions`
	CHANGE COLUMN `inPath` `in_path` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' FIRST,
	CHANGE COLUMN `outPath` `out_path` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `in_path`,
	CHANGE COLUMN `inNode` `in_node` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `out_path`,
	CHANGE COLUMN `outNode` `out_node` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `in_node`;
ALTER TABLE `petcreateinfo_spell`
	CHANGE COLUMN `Spell1` `spell1` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `entry`,
	CHANGE COLUMN `Spell2` `spell2` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `spell1`,
	CHANGE COLUMN `Spell3` `spell3` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `spell2`,
	CHANGE COLUMN `Spell4` `spell4` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `spell3`;
ALTER TABLE `instance_buff_removal`
	CHANGE COLUMN `mapId` `map_id` INT(10) UNSIGNED NOT NULL COMMENT 'MapId to remove aura from' FIRST,
	CHANGE COLUMN `auraId` `spell_id` INT(10) UNSIGNED NOT NULL COMMENT 'aura id to remove on entering MapId' AFTER `map_id`;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
