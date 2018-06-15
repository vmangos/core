DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180615111903');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180615111903');
-- Add your query below.


-- ERROR:Table 'reference_loot_template' entry 30211 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=30211;

-- ERROR:Table 'reference_loot_template' entry 30412 isn't reference id and not referenced from loot, and then useless.
UPDATE `creature_loot_template` SET `patch_min`=7 WHERE `item`=30412;

-- These spells do not need an entry in this table. They already learn riding.
-- Paladin Horse 40
DELETE FROM `spell_learn_spell` WHERE `entry`=13819;
-- Paladin Horse 60
DELETE FROM `spell_learn_spell` WHERE `entry`=23214;
-- Warlock Horse 40
UPDATE `quest_template` SET `RewSpellCast`=1710 WHERE `RewSpellCast`=5785;
DELETE FROM `spell_learn_spell` WHERE `entry`=5784;
-- Warlock Horse 60
DELETE FROM `spell_learn_spell` WHERE `entry`=23161;

-- Add a way to define minimum target level for spells.
ALTER TABLE `spell_template`
	ADD COLUMN `minTargetLevel` INT(4) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Custom Field' AFTER `startRecoveryTime`,
	CHANGE COLUMN `maxTargetLevel` `maxTargetLevel` INT(4) UNSIGNED NOT NULL DEFAULT '0' AFTER `minTargetLevel`,
	CHANGE COLUMN `customFlags` `customFlags` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Custom Field' AFTER `requiredAuraVision`;

-- Raptor Punch
-- https://classicdb.ch/?item=5342#comments
UPDATE `spell_template` SET `minTargetLevel`=8 WHERE `ID`=6114;
-- Senggin Root
-- https://classicdb.ch/?item=3448#comments
UPDATE `spell_template` SET `minTargetLevel`=5 WHERE `ID`=2639;
-- Furbolg Medicine Pouch
-- https://web.archive.org/web/20070102103440/http://wow.allakhazam.com/db/item.html?witem=16768
UPDATE `spell_template` SET `minTargetLevel`=50 WHERE `ID`=20631;

-- These items are duplicates of existing ones with a custom id.
DELETE FROM `item_template` WHERE `entry` > 26000;

-- This npc is not a vendor.
DELETE FROM `npc_vendor` WHERE `entry`=4453;

-- Wing Commander Mulverick had wrong equipment.
DELETE FROM `creature_equip_template` WHERE `entry`=13181;
INSERT INTO `creature_equip_template` (`entry`, `equipentry1`, `equipentry2`, `equipentry3`) VALUES (13181, 13625, 0, 11021);

-- Adjust patch for creature only equipment.
UPDATE `item_template` SET `displayid`=35719, `patch`=9 WHERE `entry`=25818;
UPDATE `item_template` SET `patch`=9 WHERE `entry`=24418;
UPDATE `item_template` SET `patch`=9 WHERE `entry`=23743;
UPDATE `creature_equip_template` SET `patch`=9 WHERE `entry` IN (1493, 1494, 1495);
UPDATE `creature_template` SET `patch`=9 WHERE `entry`=15953;
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `entry`=15953;

-- An Antique Gun probably added in 1.11 and should drop from Heavy Junkbox and Sturdy Junkbox.
UPDATE `item_template` SET `patch`=9 WHERE `entry`=24283;
INSERT INTO `item_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (16884, 24283, 0.01, 0, 1, 1, 0, 9, 10);
INSERT INTO `item_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (16885, 24283, 0.01, 0, 1, 1, 0, 9, 10);
INSERT INTO `forbidden_items` VALUES (24283, 8, 1);

-- Rogue's Diary was added in 1.11 and was locked before 1.12.
DELETE FROM `item_template` WHERE `entry`=24282;
INSERT INTO `item_template` (`entry`, `patch`, `class`, `subclass`, `name`, `displayid`, `Quality`, `Flags`, `BuyCount`, `BuyPrice`, `SellPrice`, `InventoryType`, `AllowableClass`, `AllowableRace`, `ItemLevel`, `RequiredLevel`, `RequiredSkill`, `RequiredSkillRank`, `requiredspell`, `requiredhonorrank`, `RequiredCityRank`, `RequiredReputationFaction`, `RequiredReputationRank`, `maxcount`, `stackable`, `ContainerSlots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`, `dmg_min1`, `dmg_max1`, `dmg_type1`, `dmg_min2`, `dmg_max2`, `dmg_type2`, `dmg_min3`, `dmg_max3`, `dmg_type3`, `dmg_min4`, `dmg_max4`, `dmg_type4`, `dmg_min5`, `dmg_max5`, `dmg_type5`, `armor`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `delay`, `ammo_type`, `RangedModRange`, `spellid_1`, `spelltrigger_1`, `spellcharges_1`, `spellppmRate_1`, `spellcooldown_1`, `spellcategory_1`, `spellcategorycooldown_1`, `spellid_2`, `spelltrigger_2`, `spellcharges_2`, `spellppmRate_2`, `spellcooldown_2`, `spellcategory_2`, `spellcategorycooldown_2`, `spellid_3`, `spelltrigger_3`, `spellcharges_3`, `spellppmRate_3`, `spellcooldown_3`, `spellcategory_3`, `spellcategorycooldown_3`, `spellid_4`, `spelltrigger_4`, `spellcharges_4`, `spellppmRate_4`, `spellcooldown_4`, `spellcategory_4`, `spellcategorycooldown_4`, `spellid_5`, `spelltrigger_5`, `spellcharges_5`, `spellppmRate_5`, `spellcooldown_5`, `spellcategory_5`, `spellcategorycooldown_5`, `bonding`, `description`, `PageText`, `LanguageID`, `PageMaterial`, `startquest`, `lockid`, `Material`, `sheath`, `RandomProperty`, `block`, `itemset`, `MaxDurability`, `area`, `Map`, `BagFamily`, `ScriptName`, `DisenchantID`, `FoodType`, `minMoneyLoot`, `maxMoneyLoot`, `Duration`, `ExtraFlags`, `OtherTeamEntry`) VALUES (24282, 9, 15, 0, 'Rogue\'s Diary', 1588, 0, 0, 1, 1025, 256, 0, -1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 1620, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 1);
INSERT INTO `item_template` (`entry`, `patch`, `class`, `subclass`, `name`, `displayid`, `Quality`, `Flags`, `BuyCount`, `BuyPrice`, `SellPrice`, `InventoryType`, `AllowableClass`, `AllowableRace`, `ItemLevel`, `RequiredLevel`, `RequiredSkill`, `RequiredSkillRank`, `requiredspell`, `requiredhonorrank`, `RequiredCityRank`, `RequiredReputationFaction`, `RequiredReputationRank`, `maxcount`, `stackable`, `ContainerSlots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`, `dmg_min1`, `dmg_max1`, `dmg_type1`, `dmg_min2`, `dmg_max2`, `dmg_type2`, `dmg_min3`, `dmg_max3`, `dmg_type3`, `dmg_min4`, `dmg_max4`, `dmg_type4`, `dmg_min5`, `dmg_max5`, `dmg_type5`, `armor`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `delay`, `ammo_type`, `RangedModRange`, `spellid_1`, `spelltrigger_1`, `spellcharges_1`, `spellppmRate_1`, `spellcooldown_1`, `spellcategory_1`, `spellcategorycooldown_1`, `spellid_2`, `spelltrigger_2`, `spellcharges_2`, `spellppmRate_2`, `spellcooldown_2`, `spellcategory_2`, `spellcategorycooldown_2`, `spellid_3`, `spelltrigger_3`, `spellcharges_3`, `spellppmRate_3`, `spellcooldown_3`, `spellcategory_3`, `spellcategorycooldown_3`, `spellid_4`, `spelltrigger_4`, `spellcharges_4`, `spellppmRate_4`, `spellcooldown_4`, `spellcategory_4`, `spellcategorycooldown_4`, `spellid_5`, `spelltrigger_5`, `spellcharges_5`, `spellppmRate_5`, `spellcooldown_5`, `spellcategory_5`, `spellcategorycooldown_5`, `bonding`, `description`, `PageText`, `LanguageID`, `PageMaterial`, `startquest`, `lockid`, `Material`, `sheath`, `RandomProperty`, `block`, `itemset`, `MaxDurability`, `area`, `Map`, `BagFamily`, `ScriptName`, `DisenchantID`, `FoodType`, `minMoneyLoot`, `maxMoneyLoot`, `Duration`, `ExtraFlags`, `OtherTeamEntry`) VALUES (24282, 10, 15, 0, 'Rogue\'s Diary', 1588, 0, 0, 1, 18250, 4562, 0, -1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 'All the pages are blank.', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 1);
INSERT INTO `forbidden_items` VALUES (24282, 8, 1);
UPDATE `reference_loot_template` SET `patch_min`=9 WHERE `item`=24282;

-- Carved Ivory Bone probably added in 1.12.
UPDATE `item_template` SET `patch`=10 WHERE `entry`=24281;
INSERT INTO `forbidden_items` VALUES (24281, 9, 1);
UPDATE `reference_loot_template` SET `patch_min`=10 WHERE `item`=24281;

-- Shabby Knot probably added in 1.12.
UPDATE `item_template` SET `patch`=10 WHERE `entry`=24232;
INSERT INTO `forbidden_items` VALUES (24232, 9, 1);
UPDATE `reference_loot_template` SET `patch_min`=10 WHERE `item`=24232;

-- Coarse Snuff probably added in 1.12.
UPDATE `item_template` SET `patch`=10 WHERE `entry`=24231;
INSERT INTO `forbidden_items` VALUES (24231, 9, 1);
UPDATE `reference_loot_template` SET `patch_min`=10 WHERE `item`=24231;
UPDATE `creature_loot_template` SET `patch_min`=10 WHERE `item`=24231;
UPDATE `pickpocketing_loot_template` SET `patch_min`=10 WHERE `item`=24231;

-- All items in this reference loot template are from 1.11 or later.
UPDATE `item_loot_template` SET `patch_min`=9 WHERE `item`=1001;

-- Correct gossip menu id for Marduk Blackpool.
UPDATE `creature_template` SET `gossip_menu_id`=3649 WHERE `entry`=10433;
INSERT INTO `gossip_menu` VALUES (3649, 4447, 0);
UPDATE `npc_text` SET `Probability0`=5, `Probability1`=5, `Probability2`=5, `Probability3`=5 WHERE `ID`=4447;

-- These tables should be in the Logs database.
DROP TABLE `instance_creature_kills`;
DROP TABLE `instance_custom_counters`;
DROP TABLE `instance_wipes`;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
