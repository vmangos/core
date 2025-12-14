DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20240304213652');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20240304213652');
-- Add your query below.


ALTER TABLE `creature_ai_events`
	CHANGE COLUMN `event_chance` `event_chance` TINYINT UNSIGNED NOT NULL DEFAULT '100' AFTER `event_inverse_phase_mask`;

ALTER TABLE `creature_ai_scripts`
	CHANGE COLUMN `id` `id` INT(10) UNSIGNED NOT NULL DEFAULT '0' FIRST,
	CHANGE COLUMN `command` `command` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' AFTER `priority`,
	CHANGE COLUMN `datalong` `datalong` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `command`;

ALTER TABLE `creature_movement_scripts`
	CHANGE COLUMN `id` `id` INT(10) UNSIGNED NOT NULL DEFAULT '0' FIRST,
	CHANGE COLUMN `command` `command` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' AFTER `priority`,
	CHANGE COLUMN `datalong` `datalong` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `command`;

ALTER TABLE `creature_spells_scripts`
	CHANGE COLUMN `id` `id` INT(10) UNSIGNED NOT NULL DEFAULT '0' FIRST,
	CHANGE COLUMN `command` `command` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' AFTER `priority`,
	CHANGE COLUMN `datalong` `datalong` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `command`;

ALTER TABLE `event_scripts`
	CHANGE COLUMN `id` `id` INT(10) UNSIGNED NOT NULL DEFAULT '0' FIRST,
	CHANGE COLUMN `command` `command` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' AFTER `priority`,
	CHANGE COLUMN `datalong` `datalong` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `command`;

ALTER TABLE `gameobject_scripts`
	CHANGE COLUMN `id` `id` INT(10) UNSIGNED NOT NULL DEFAULT '0' FIRST,
	CHANGE COLUMN `command` `command` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' AFTER `priority`,
	CHANGE COLUMN `datalong` `datalong` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `command`;

ALTER TABLE `generic_scripts`
	CHANGE COLUMN `id` `id` INT(10) UNSIGNED NOT NULL DEFAULT '0' FIRST,
	CHANGE COLUMN `command` `command` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' AFTER `priority`,
	CHANGE COLUMN `datalong` `datalong` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `command`;

ALTER TABLE `gossip_scripts`
	CHANGE COLUMN `id` `id` INT(10) UNSIGNED NOT NULL DEFAULT '0' FIRST,
	CHANGE COLUMN `command` `command` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' AFTER `priority`,
	CHANGE COLUMN `datalong` `datalong` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `command`;

ALTER TABLE `quest_end_scripts`
	CHANGE COLUMN `id` `id` INT(10) UNSIGNED NOT NULL DEFAULT '0' FIRST,
	CHANGE COLUMN `command` `command` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' AFTER `priority`,
	CHANGE COLUMN `datalong` `datalong` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `command`;

ALTER TABLE `quest_start_scripts`
	CHANGE COLUMN `id` `id` INT(10) UNSIGNED NOT NULL DEFAULT '0' FIRST,
	CHANGE COLUMN `command` `command` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' AFTER `priority`,
	CHANGE COLUMN `datalong` `datalong` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `command`;

ALTER TABLE `spell_scripts`
	CHANGE COLUMN `id` `id` INT(10) UNSIGNED NOT NULL DEFAULT '0' FIRST,
	CHANGE COLUMN `command` `command` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' AFTER `priority`,
	CHANGE COLUMN `datalong` `datalong` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `command`;

ALTER TABLE `spell_area`
	CHANGE COLUMN `spell` `spell` SMALLINT UNSIGNED NOT NULL DEFAULT '0' FIRST,
	CHANGE COLUMN `aura_spell` `aura_spell` SMALLINT NOT NULL DEFAULT '0' AFTER `quest_end`;

ALTER TABLE `spell_chain`
	CHANGE COLUMN `spell_id` `spell_id` SMALLINT UNSIGNED NOT NULL DEFAULT '0' FIRST,
	CHANGE COLUMN `prev_spell` `prev_spell` SMALLINT UNSIGNED NOT NULL DEFAULT '0' AFTER `spell_id`,
	CHANGE COLUMN `first_spell` `first_spell` SMALLINT UNSIGNED NOT NULL DEFAULT '0' AFTER `prev_spell`,
	CHANGE COLUMN `req_spell` `req_spell` SMALLINT UNSIGNED NOT NULL DEFAULT '0' AFTER `rank`;

ALTER TABLE `spell_check`
	CHANGE COLUMN `spellid` `spellid` SMALLINT UNSIGNED NOT NULL DEFAULT '0' FIRST;

ALTER TABLE `spell_disabled`
	CHANGE COLUMN `entry` `entry` SMALLINT UNSIGNED NOT NULL COMMENT 'Disabled spell' FIRST;

ALTER TABLE `spell_effect_mod`
	CHANGE COLUMN `Id` `Id` SMALLINT UNSIGNED NOT NULL DEFAULT '0' FIRST;

ALTER TABLE `spell_elixir`
	CHANGE COLUMN `entry` `entry` SMALLINT UNSIGNED NOT NULL DEFAULT '0' COMMENT 'SpellId of potion' FIRST;

ALTER TABLE `spell_enchant_charges`
	CHANGE COLUMN `entry` `entry` SMALLINT UNSIGNED NOT NULL FIRST;

ALTER TABLE `spell_group`
	CHANGE COLUMN `spell_id` `spell_id` SMALLINT UNSIGNED NOT NULL DEFAULT '0' AFTER `group_spell_id`;

ALTER TABLE `spell_mod`
	CHANGE COLUMN `Id` `Id` SMALLINT UNSIGNED NOT NULL DEFAULT '0' FIRST;

ALTER TABLE `spell_pet_auras`
	CHANGE COLUMN `spell` `spell` SMALLINT UNSIGNED NOT NULL COMMENT 'dummy spell id' FIRST;

ALTER TABLE `spell_proc_event`
	CHANGE COLUMN `entry` `entry` SMALLINT UNSIGNED NOT NULL DEFAULT '0' FIRST;

ALTER TABLE `spell_proc_item_enchant`
	CHANGE COLUMN `entry` `entry` SMALLINT UNSIGNED NOT NULL FIRST;

ALTER TABLE `spell_script_target`
	CHANGE COLUMN `entry` `entry` SMALLINT UNSIGNED NOT NULL FIRST;

ALTER TABLE `spell_target_position`
	CHANGE COLUMN `id` `id` SMALLINT UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Identifier' FIRST;

ALTER TABLE `spell_template`
	CHANGE COLUMN `entry` `entry` SMALLINT UNSIGNED NOT NULL DEFAULT '0' FIRST;

ALTER TABLE `spell_threat`
	CHANGE COLUMN `entry` `entry` SMALLINT UNSIGNED NOT NULL FIRST;

ALTER TABLE `skill_line_ability`
	CHANGE COLUMN `spell_id` `spell_id` SMALLINT UNSIGNED NOT NULL DEFAULT '0' AFTER `skill_id`;

ALTER TABLE `skill_line_ability`
	CHANGE COLUMN `superseded_by_spell` `superseded_by_spell` SMALLINT UNSIGNED NOT NULL DEFAULT '0' AFTER `req_skill_value`;

ALTER TABLE `quest_template`
	CHANGE COLUMN `ReqSpellCast1` `ReqSpellCast1` SMALLINT UNSIGNED NOT NULL DEFAULT '0' AFTER `ReqCreatureOrGOCount4`,
	CHANGE COLUMN `ReqSpellCast2` `ReqSpellCast2` SMALLINT UNSIGNED NOT NULL DEFAULT '0' AFTER `ReqSpellCast1`,
	CHANGE COLUMN `ReqSpellCast3` `ReqSpellCast3` SMALLINT UNSIGNED NOT NULL DEFAULT '0' AFTER `ReqSpellCast2`,
	CHANGE COLUMN `ReqSpellCast4` `ReqSpellCast4` SMALLINT UNSIGNED NOT NULL DEFAULT '0' AFTER `ReqSpellCast3`,
	CHANGE COLUMN `RewSpell` `RewSpell` SMALLINT UNSIGNED NOT NULL DEFAULT '0' AFTER `RewMoneyMaxLevel`,
	CHANGE COLUMN `RewSpellCast` `RewSpellCast` SMALLINT UNSIGNED NOT NULL DEFAULT '0' AFTER `RewSpell`;

ALTER TABLE `quest_template`
	CHANGE COLUMN `SrcSpell` `SrcSpell` SMALLINT UNSIGNED NOT NULL DEFAULT '0' AFTER `SrcItemCount`;

ALTER TABLE `player_premade_spell`
	CHANGE COLUMN `spell` `spell` SMALLINT UNSIGNED NOT NULL AFTER `entry`;

ALTER TABLE `player_factionchange_spells`
	CHANGE COLUMN `alliance_id` `alliance_id` SMALLINT UNSIGNED NOT NULL FIRST,
	CHANGE COLUMN `horde_id` `horde_id` SMALLINT UNSIGNED NOT NULL AFTER `alliance_id`;
  
ALTER TABLE `playercreateinfo_spell`
	CHANGE COLUMN `spell` `spell` SMALLINT UNSIGNED NOT NULL DEFAULT '0' AFTER `class`;

ALTER TABLE `petcreateinfo_spell`
	CHANGE COLUMN `spell1` `spell1` SMALLINT UNSIGNED NOT NULL DEFAULT '0' AFTER `entry`,
	CHANGE COLUMN `spell2` `spell2` SMALLINT UNSIGNED NOT NULL DEFAULT '0' AFTER `spell1`,
	CHANGE COLUMN `spell3` `spell3` SMALLINT UNSIGNED NOT NULL DEFAULT '0' AFTER `spell2`,
	CHANGE COLUMN `spell4` `spell4` SMALLINT UNSIGNED NOT NULL DEFAULT '0' AFTER `spell3`;

ALTER TABLE `item_template`
	CHANGE COLUMN `required_spell` `required_spell` SMALLINT UNSIGNED NOT NULL DEFAULT '0' AFTER `required_skill_rank`,
	CHANGE COLUMN `spellid_1` `spellid_1` SMALLINT UNSIGNED NOT NULL DEFAULT '0' AFTER `arcane_res`,
	CHANGE COLUMN `spellid_2` `spellid_2` SMALLINT UNSIGNED NOT NULL DEFAULT '0' AFTER `spellcategorycooldown_1`,
	CHANGE COLUMN `spellid_3` `spellid_3` SMALLINT UNSIGNED NOT NULL DEFAULT '0' AFTER `spellcategorycooldown_2`,
	CHANGE COLUMN `spellid_4` `spellid_4` SMALLINT UNSIGNED NOT NULL DEFAULT '0' AFTER `spellcategorycooldown_3`,
	CHANGE COLUMN `spellid_5` `spellid_5` SMALLINT UNSIGNED NOT NULL DEFAULT '0' AFTER `spellcategorycooldown_4`;

ALTER TABLE `game_event_creature_data`
	CHANGE COLUMN `spell_start` `spell_start` SMALLINT UNSIGNED NOT NULL DEFAULT '0' AFTER `equipment_id`,
	CHANGE COLUMN `spell_end` `spell_end` SMALLINT UNSIGNED NOT NULL DEFAULT '0' AFTER `spell_start`;

ALTER TABLE `creature_template`
	CHANGE COLUMN `spell_id1` `spell_id1` SMALLINT UNSIGNED NOT NULL DEFAULT '0' AFTER `gold_max`,
	CHANGE COLUMN `spell_id2` `spell_id2` SMALLINT UNSIGNED NOT NULL DEFAULT '0' AFTER `spell_id1`,
	CHANGE COLUMN `spell_id3` `spell_id3` SMALLINT UNSIGNED NOT NULL DEFAULT '0' AFTER `spell_id2`,
	CHANGE COLUMN `spell_id4` `spell_id4` SMALLINT UNSIGNED NOT NULL DEFAULT '0' AFTER `spell_id3`,
	CHANGE COLUMN `spawn_spell_id` `spawn_spell_id` SMALLINT UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Spell with effect 46 that will be cast immediately upon spawning. Creature will remain unattackable until the cast finishes.' AFTER `pet_spell_list_id`;

ALTER TABLE `creature_template`
	CHANGE COLUMN `trainer_spell` `trainer_spell` SMALLINT UNSIGNED NOT NULL DEFAULT '0' AFTER `trainer_type`;

ALTER TABLE `instance_buff_removal`
	CHANGE COLUMN `spell_id` `spell_id` SMALLINT UNSIGNED NOT NULL COMMENT 'aura id to remove on entering MapId' AFTER `map_id`;

ALTER TABLE `locales_spell`
	CHANGE COLUMN `entry` `entry` SMALLINT UNSIGNED NOT NULL FIRST;

ALTER TABLE `npc_trainer`
	CHANGE COLUMN `spell` `spell` SMALLINT UNSIGNED NOT NULL DEFAULT '0' AFTER `entry`;

ALTER TABLE `npc_trainer_template`
	CHANGE COLUMN `spell` `spell` SMALLINT UNSIGNED NOT NULL DEFAULT '0' AFTER `entry`;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
