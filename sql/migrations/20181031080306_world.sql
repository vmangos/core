DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20181031080306');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20181031080306');
-- Add your query below.


ALTER TABLE `item_template`
	CHANGE COLUMN `displayid` `display_id` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `name`,
	CHANGE COLUMN `Quality` `quality` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' AFTER `display_id`,
	CHANGE COLUMN `Flags` `flags` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `quality`,
	CHANGE COLUMN `BuyCount` `buy_count` TINYINT(3) UNSIGNED NOT NULL DEFAULT '1' AFTER `flags`,
	CHANGE COLUMN `BuyPrice` `buy_price` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `buy_count`,
	CHANGE COLUMN `SellPrice` `sell_price` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `buy_price`,
	CHANGE COLUMN `InventoryType` `inventory_type` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' AFTER `sell_price`,
	CHANGE COLUMN `AllowableClass` `allowable_class` MEDIUMINT(9) NOT NULL DEFAULT '-1' AFTER `inventory_type`,
	CHANGE COLUMN `AllowableRace` `allowable_race` MEDIUMINT(9) NOT NULL DEFAULT '-1' AFTER `allowable_class`,
	CHANGE COLUMN `ItemLevel` `item_level` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' AFTER `allowable_race`,
	CHANGE COLUMN `RequiredLevel` `required_level` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' AFTER `item_level`,
	CHANGE COLUMN `RequiredSkill` `required_skill` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0' AFTER `required_level`,
	CHANGE COLUMN `RequiredSkillRank` `required_skill_rank` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0' AFTER `required_skill`,
	CHANGE COLUMN `requiredspell` `required_spell` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `required_skill_rank`,
	CHANGE COLUMN `requiredhonorrank` `required_honor_rank` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `required_spell`,
	CHANGE COLUMN `RequiredCityRank` `required_city_rank` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `required_honor_rank`,
	CHANGE COLUMN `RequiredReputationFaction` `required_reputation_faction` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0' AFTER `required_city_rank`,
	CHANGE COLUMN `RequiredReputationRank` `required_reputation_rank` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0' AFTER `required_reputation_faction`,
	CHANGE COLUMN `maxcount` `max_count` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0' AFTER `required_reputation_rank`,
	CHANGE COLUMN `ContainerSlots` `container_slots` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' AFTER `stackable`,
	CHANGE COLUMN `RangedModRange` `range_mod` FLOAT NOT NULL DEFAULT '0' AFTER `ammo_type`,
	CHANGE COLUMN `spellppmRate_1` `spellppmrate_1` FLOAT NOT NULL DEFAULT '0' AFTER `spellcharges_1`,
	CHANGE COLUMN `spellppmRate_2` `spellppmrate_2` FLOAT NOT NULL DEFAULT '0' AFTER `spellcharges_2`,
	CHANGE COLUMN `spellppmRate_3` `spellppmrate_3` FLOAT NOT NULL DEFAULT '0' AFTER `spellcharges_3`,
	CHANGE COLUMN `spellppmRate_4` `spellppmrate_4` FLOAT NOT NULL DEFAULT '0' AFTER `spellcharges_4`,
	CHANGE COLUMN `spellppmRate_5` `spellppmrate_5` FLOAT NOT NULL DEFAULT '0' AFTER `spellcharges_5`,
	CHANGE COLUMN `PageText` `page_text` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `description`,
	CHANGE COLUMN `LanguageID` `page_language` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' AFTER `page_text`,
	CHANGE COLUMN `PageMaterial` `page_material` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' AFTER `page_language`,
	CHANGE COLUMN `startquest` `start_quest` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `page_material`,
	CHANGE COLUMN `lockid` `lock_id` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `start_quest`,
	CHANGE COLUMN `Material` `material` TINYINT(4) NOT NULL DEFAULT '0' AFTER `lock_id`,
	CHANGE COLUMN `RandomProperty` `random_property` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `sheath`,
	CHANGE COLUMN `itemset` `set_id` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `block`,
	CHANGE COLUMN `MaxDurability` `max_durability` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0' AFTER `set_id`,
	CHANGE COLUMN `area` `area_bound` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `max_durability`,
	CHANGE COLUMN `Map` `map_bound` SMALLINT(6) NOT NULL DEFAULT '0' AFTER `area_bound`,
	CHANGE COLUMN `BagFamily` `bag_family` MEDIUMINT(9) NOT NULL DEFAULT '0' AFTER `map_bound`,
	CHANGE COLUMN `DisenchantID` `disenchant_id` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `ScriptName`,
	CHANGE COLUMN `FoodType` `food_type` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' AFTER `disenchant_id`,
	CHANGE COLUMN `minMoneyLoot` `min_money_loot` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `food_type`,
	CHANGE COLUMN `maxMoneyLoot` `max_money_loot` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `min_money_loot`,
	CHANGE COLUMN `Duration` `duration` INT(11) UNSIGNED NOT NULL DEFAULT '0' AFTER `max_money_loot`,
	CHANGE COLUMN `ExtraFlags` `extra_flags` TINYINT(1) UNSIGNED NOT NULL DEFAULT '0' AFTER `duration`,
	CHANGE COLUMN `OtherTeamEntry` `other_team_entry` INT(11) UNSIGNED NULL DEFAULT '1' AFTER `extra_flags`;

ALTER TABLE `item_template`
	DROP COLUMN `ScriptName`;

ALTER TABLE `item_template`
	CHANGE COLUMN `description` `description` VARCHAR(255) NOT NULL DEFAULT '' AFTER `name`;

ALTER TABLE `item_template`
	CHANGE COLUMN `delay` `delay` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '1000' AFTER `stat_value10`,
	CHANGE COLUMN `range_mod` `range_mod` FLOAT NOT NULL DEFAULT '0' AFTER `delay`,
	CHANGE COLUMN `ammo_type` `ammo_type` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' AFTER `range_mod`;

ALTER TABLE `item_template`
	CHANGE COLUMN `duration` `duration` INT(11) UNSIGNED NOT NULL DEFAULT '0' AFTER `map_bound`;

ALTER TABLE `item_template`
	CHANGE COLUMN `block` `block` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `dmg_type5`;

ALTER TABLE `item_template`
	CHANGE COLUMN `armor` `armor` SMALLINT(5) NOT NULL DEFAULT '0' AFTER `block`,
	CHANGE COLUMN `holy_res` `holy_res` SMALLINT(5) NOT NULL DEFAULT '0' AFTER `armor`,
	CHANGE COLUMN `fire_res` `fire_res` SMALLINT(5) NOT NULL DEFAULT '0' AFTER `holy_res`,
	CHANGE COLUMN `nature_res` `nature_res` SMALLINT(5) NOT NULL DEFAULT '0' AFTER `fire_res`,
	CHANGE COLUMN `frost_res` `frost_res` SMALLINT(5) NOT NULL DEFAULT '0' AFTER `nature_res`,
	CHANGE COLUMN `shadow_res` `shadow_res` SMALLINT(5) NOT NULL DEFAULT '0' AFTER `frost_res`,
	CHANGE COLUMN `arcane_res` `arcane_res` SMALLINT(5) NOT NULL DEFAULT '0' AFTER `shadow_res`;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
