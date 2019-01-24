DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190123062532');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190123062532');
-- Add your query below.


ALTER TABLE `creature_template`
	DROP COLUMN `KillCredit1`,
	DROP COLUMN `KillCredit2`;
ALTER TABLE `creature_template`
	CHANGE COLUMN `modelid_1` `display_id1` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `patch`,
	CHANGE COLUMN `modelid_2` `display_id2` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `display_id1`,
	CHANGE COLUMN `modelid_3` `display_id3` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `display_id2`,
	CHANGE COLUMN `modelid_4` `display_id4` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `display_id3`,
	CHANGE COLUMN `minlevel` `level_min` TINYINT(3) UNSIGNED NOT NULL DEFAULT '1' AFTER `gossip_menu_id`,
	CHANGE COLUMN `maxlevel` `level_max` TINYINT(3) UNSIGNED NOT NULL DEFAULT '1' AFTER `level_min`,
	CHANGE COLUMN `minhealth` `health_min` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `level_max`,
	CHANGE COLUMN `maxhealth` `health_max` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `health_min`,
	CHANGE COLUMN `minmana` `mana_min` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `health_max`,
	CHANGE COLUMN `maxmana` `mana_max` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `mana_min`,
	CHANGE COLUMN `npcflag` `npc_flags` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `faction`,
	CHANGE COLUMN `Detection` `detection_range` FLOAT NOT NULL DEFAULT '20' AFTER `scale`,
	CHANGE COLUMN `CallForHelp` `call_for_help_range` FLOAT NOT NULL DEFAULT '5' AFTER `detection_range`,
	CHANGE COLUMN `Leash` `leash_range` FLOAT NOT NULL DEFAULT '0' AFTER `call_for_help_range`,
	CHANGE COLUMN `ExperienceMultiplier` `xp_multiplier` FLOAT NOT NULL DEFAULT '1' AFTER `rank`,
	CHANGE COLUMN `mindmg` `dmg_min` FLOAT NOT NULL DEFAULT '0' AFTER `xp_multiplier`,
	CHANGE COLUMN `maxdmg` `dmg_max` FLOAT NOT NULL DEFAULT '0' AFTER `dmg_min`,
	CHANGE COLUMN `dmgschool` `dmg_school` TINYINT(4) NOT NULL DEFAULT '0' AFTER `dmg_max`,
	CHANGE COLUMN `attackpower` `attack_power` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `dmg_school`,
	CHANGE COLUMN `baseattacktime` `base_attack_time` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `dmg_multiplier`,
	CHANGE COLUMN `rangeattacktime` `ranged_attack_time` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `base_attack_time`,
	CHANGE COLUMN `dynamicflags` `dynamic_flags` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `unit_flags`,
	CHANGE COLUMN `family` `beast_family` TINYINT(4) NOT NULL DEFAULT '0' AFTER `dynamic_flags`,
	CHANGE COLUMN `minrangedmg` `ranged_dmg_min` FLOAT NOT NULL DEFAULT '0' AFTER `trainer_race`,
	CHANGE COLUMN `maxrangedmg` `ranged_dmg_max` FLOAT NOT NULL DEFAULT '0' AFTER `ranged_dmg_min`,
	CHANGE COLUMN `rangedattackpower` `ranged_attack_power` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0' AFTER `ranged_dmg_max`,
	CHANGE COLUMN `lootid` `loot_id` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `type_flags`,
	CHANGE COLUMN `pickpocketloot` `pickpocket_loot_id` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `loot_id`,
	CHANGE COLUMN `skinloot` `skinning_loot_id` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `pickpocket_loot_id`,
	CHANGE COLUMN `resistance1` `holy_res` SMALLINT(5) NOT NULL DEFAULT '0' AFTER `skinning_loot_id`,
	CHANGE COLUMN `resistance2` `fire_res` SMALLINT(5) NOT NULL DEFAULT '0' AFTER `holy_res`,
	CHANGE COLUMN `resistance3` `nature_res` SMALLINT(5) NOT NULL DEFAULT '0' AFTER `fire_res`,
	CHANGE COLUMN `resistance4` `frost_res` SMALLINT(5) NOT NULL DEFAULT '0' AFTER `nature_res`,
	CHANGE COLUMN `resistance5` `shadow_res` SMALLINT(5) NOT NULL DEFAULT '0' AFTER `frost_res`,
	CHANGE COLUMN `resistance6` `arcane_res` SMALLINT(5) NOT NULL DEFAULT '0' AFTER `shadow_res`,
	CHANGE COLUMN `spell1` `spell_id1` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `arcane_res`,
	CHANGE COLUMN `spell2` `spell_id2` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `spell_id1`,
	CHANGE COLUMN `spell3` `spell_id3` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `spell_id2`,
	CHANGE COLUMN `spell4` `spell_id4` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `spell_id3`,
	CHANGE COLUMN `spells_template` `spell_list_id` INT(11) UNSIGNED NOT NULL DEFAULT '0' AFTER `spell_id4`,
	CHANGE COLUMN `PetSpellDataId` `pet_spell_list_id` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `spell_list_id`,
	CHANGE COLUMN `mingold` `gold_min` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `pet_spell_list_id`,
	CHANGE COLUMN `maxgold` `gold_max` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `gold_min`,
	CHANGE COLUMN `AIName` `ai_name` CHAR(64) NOT NULL DEFAULT '' AFTER `gold_max`,
	CHANGE COLUMN `MovementType` `movement_type` TINYINT(3) UNSIGNED NULL DEFAULT '0' AFTER `ai_name`,
	CHANGE COLUMN `InhabitType` `inhabit_type` TINYINT(3) UNSIGNED NOT NULL DEFAULT '3' AFTER `movement_type`,
	CHANGE COLUMN `Civilian` `civilian` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' AFTER `inhabit_type`,
	CHANGE COLUMN `RacialLeader` `racial_leader` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' AFTER `civilian`,
	CHANGE COLUMN `RegenHealth` `regeneration` TINYINT(3) UNSIGNED NOT NULL DEFAULT '1' AFTER `racial_leader`,
	CHANGE COLUMN `MechanicImmuneMask` `mechanic_immune_mask` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `vendor_id`,
	CHANGE COLUMN `SchoolImmuneMask` `school_immune_mask` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `mechanic_immune_mask`,
	CHANGE COLUMN `ScriptName` `script_name` CHAR(64) NOT NULL DEFAULT '' AFTER `flags_extra`;
ALTER TABLE `gameobject_template`
	CHANGE COLUMN `ScriptName` `script_name` VARCHAR(64) NOT NULL DEFAULT '' AFTER `maxgold`;
ALTER TABLE `scripted_areatrigger`
	CHANGE COLUMN `ScriptName` `script_name` CHAR(64) NOT NULL AFTER `entry`;
ALTER TABLE `scripted_event_id`
	CHANGE COLUMN `ScriptName` `script_name` CHAR(64) NOT NULL AFTER `id`;
ALTER TABLE `map_template`
	CHANGE COLUMN `Entry` `entry` SMALLINT(5) UNSIGNED NOT NULL FIRST,
	CHANGE COLUMN `Parent` `parent` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `patch`,
	CHANGE COLUMN `MapType` `map_type` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' AFTER `parent`,
	CHANGE COLUMN `LinkedZone` `linked_zone` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `map_type`,
	CHANGE COLUMN `LevelMin` `level_min` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' AFTER `linked_zone`,
	CHANGE COLUMN `LevelMax` `level_max` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' AFTER `level_min`,
	CHANGE COLUMN `MaxPlayers` `player_limit` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' AFTER `level_max`,
	CHANGE COLUMN `ResetDelay` `reset_delay` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `player_limit`,
	CHANGE COLUMN `GhostEntranceMap` `ghost_entrance_map` SMALLINT(5) NOT NULL DEFAULT '-1' AFTER `reset_delay`,
	CHANGE COLUMN `GhostEntranceX` `ghost_entrance_x` FLOAT NOT NULL DEFAULT '0' AFTER `ghost_entrance_map`,
	CHANGE COLUMN `GhostEntranceY` `ghost_entrance_y` FLOAT NOT NULL DEFAULT '0' AFTER `ghost_entrance_x`,
	CHANGE COLUMN `MapName` `map_name` VARCHAR(128) NOT NULL DEFAULT '' AFTER `ghost_entrance_y`,
	CHANGE COLUMN `ScriptName` `script_name` VARCHAR(128) NOT NULL DEFAULT '' AFTER `map_name`;
ALTER TABLE `creature_template`
	CHANGE COLUMN `regeneration` `regeneration` TINYINT(3) UNSIGNED NOT NULL DEFAULT '3' AFTER `racial_leader`;
UPDATE `creature_template` SET `regeneration`=3 WHERE `regeneration`=1;
ALTER TABLE `creature_template`
	CHANGE COLUMN `dmg_school` `dmg_school` TINYINT(4) UNSIGNED NOT NULL DEFAULT '0' AFTER `dmg_max`,
	CHANGE COLUMN `movement_type` `movement_type` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' AFTER `ai_name`;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
