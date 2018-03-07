DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180129011939');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180129011939');
-- Add your query below.


-- Open Alliance Officer's Door based on patch.
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (26262, 176576, 0, -8765.82, 403.164, 104.162, -0.898844, 0, 0, -0.434445, 0.900698, 900, 900, 100, 0, 0, 0, 2, 10);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (30699, 176576, 0, -8765.82, 403.164, 104.162, -0.898844, 0, 0, -0.434445, 0.900698, 900, 900, 100, 1, 0, 0, 0, 1);

-- Add missing door inside Alliance Officer room.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (112987, 176575, 449, -2.51994, -2.90728, 0, 4.71239, 0, 0, -0.707107, 0.707107, 7200, 7200, 255, 0, 0, 0, 0, 10);

-- Open Horde Officer's Door based on patch.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (31660, 176562, 1, 1634.87, -4247.86, 55.8397, -2.08567, 0, 0, -0.863836, 0.503773, 180, 180, 100, 1, 0, 0, 0, 1);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (31661, 176562, 1, 1634.87, -4247.86, 55.8397, -2.08567, 0, 0, -0.863836, 0.503773, 180, 180, 100, 0, 0, 0, 2, 10);

-- Assign patch to creatures inside Officer rooms.
UPDATE `creature` SET `patch_min`=2 WHERE `map` IN (449, 450);

-- Assign patch to gameobjects inside Dire Maul.
UPDATE `gameobject` SET `patch_min`=1 WHERE `map`=429;

-- Assign patch to gameobjects inside Blackwing Lair.
UPDATE `gameobject` SET `patch_min`=4 WHERE `map`=469;

-- Assign patch to gameobjects inside Zul'Gurub.
UPDATE `gameobject` SET `patch_min`=5 WHERE `map`=309;

-- Assign patch to gameobjects inside Ahn'Qiraj.
UPDATE `gameobject` SET `patch_min`=7 WHERE `map` IN (509, 531);

-- Assign patch to creatures inside Naxxramas.
UPDATE `creature` SET `patch_min`=9 WHERE `map`=533;

-- Assign patch to gameobjects inside Naxxramas.
UPDATE `gameobject` SET `patch_min`=9 WHERE `map`=533;

-- Add patch columns to more tables.
ALTER TABLE `creature_loot_template`
	ADD COLUMN `patch_min` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' AFTER `condition_id`,
	ADD COLUMN `patch_max` TINYINT(3) UNSIGNED NOT NULL DEFAULT '10' AFTER `patch_min`;
ALTER TABLE `fishing_loot_template`
	ADD COLUMN `patch_min` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' AFTER `condition_id`,
	ADD COLUMN `patch_max` TINYINT(3) UNSIGNED NOT NULL DEFAULT '10' AFTER `patch_min`;
ALTER TABLE `gameobject_loot_template`
	ADD COLUMN `patch_min` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' AFTER `condition_id`,
	ADD COLUMN `patch_max` TINYINT(3) UNSIGNED NOT NULL DEFAULT '10' AFTER `patch_min`;
ALTER TABLE `item_loot_template`
	ADD COLUMN `patch_min` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' AFTER `condition_id`,
	ADD COLUMN `patch_max` TINYINT(3) UNSIGNED NOT NULL DEFAULT '10' AFTER `patch_min`;
ALTER TABLE `pickpocketing_loot_template`
	ADD COLUMN `patch_min` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' AFTER `condition_id`,
	ADD COLUMN `patch_max` TINYINT(3) UNSIGNED NOT NULL DEFAULT '10' AFTER `patch_min`;
ALTER TABLE `mail_loot_template`
	ADD COLUMN `patch_min` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' AFTER `condition_id`,
	ADD COLUMN `patch_max` TINYINT(3) UNSIGNED NOT NULL DEFAULT '10' AFTER `patch_min`;
ALTER TABLE `skinning_loot_template`
	ADD COLUMN `patch_min` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' AFTER `condition_id`,
	ADD COLUMN `patch_max` TINYINT(3) UNSIGNED NOT NULL DEFAULT '10' AFTER `patch_min`;
ALTER TABLE `disenchant_loot_template`
	ADD COLUMN `patch_min` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' AFTER `condition_id`,
	ADD COLUMN `patch_max` TINYINT(3) UNSIGNED NOT NULL DEFAULT '10' AFTER `patch_min`;
ALTER TABLE `reference_loot_template`
	ADD COLUMN `patch_min` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' AFTER `condition_id`,
	ADD COLUMN `patch_max` TINYINT(3) UNSIGNED NOT NULL DEFAULT '10' AFTER `patch_min`;
ALTER TABLE `pool_creature`
	ADD COLUMN `patch_min` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' AFTER `flags`,
	ADD COLUMN `patch_max` TINYINT(3) UNSIGNED NOT NULL DEFAULT '10' AFTER `patch_min`;
ALTER TABLE `pool_gameobject`
	ADD COLUMN `patch_min` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' AFTER `flags`,
	ADD COLUMN `patch_max` TINYINT(3) UNSIGNED NOT NULL DEFAULT '10' AFTER `patch_min`;
ALTER TABLE `pool_template`
	ADD COLUMN `patch_min` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' AFTER `instance`,
	ADD COLUMN `patch_max` TINYINT(3) UNSIGNED NOT NULL DEFAULT '10' AFTER `patch_min`;
ALTER TABLE `gameobject_template`
	ADD COLUMN `patch` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' AFTER `entry`,
	DROP PRIMARY KEY,
	ADD PRIMARY KEY (`entry`, `patch`);

-- Gameobjects for these Dark Iron pools have patch_min = 5.
UPDATE `pool_gameobject` SET `patch_min`=5 WHERE `pool_entry` IN (1337, 1338);
UPDATE `pool_template` SET `patch_min`=5 WHERE `entry` IN (1337, 1338);

-- Scarab coffer pool for AQ20.
UPDATE `pool_gameobject` SET `patch_min`=7 WHERE `pool_entry`=42904;
UPDATE `pool_template` SET `patch_min`=7 WHERE `entry`=42904;

-- Dire Maul Dusty Tomes pool.
UPDATE `pool_gameobject` SET `patch_min`=1 WHERE `pool_entry`=1600;
UPDATE `pool_template` SET `patch_min`=1 WHERE `entry`=1600;

-- Dire Maul Dreamfoil pool.
UPDATE `pool_gameobject` SET `patch_min`=1 WHERE `pool_entry`=4291;
UPDATE `pool_template` SET `patch_min`=1 WHERE `entry`=4291;

-- Dire Maul Gromsblood pool.
UPDATE `pool_gameobject` SET `patch_min`=1 WHERE `pool_entry`=4292;
UPDATE `pool_template` SET `patch_min`=1 WHERE `entry`=4292;

-- Dire Maul Ghost Mushroom pool.
UPDATE `pool_gameobject` SET `patch_min`=1 WHERE `pool_entry`=4293;
UPDATE `pool_template` SET `patch_min`=1 WHERE `entry`=4293;

-- ERROR:`pool_creature` has a non existing creature spawn (GUID: 56961) defined for pool id (42901), skipped.
UPDATE `pool_creature` SET `patch_min`=1 WHERE `pool_entry`=42901;
UPDATE `pool_template` SET `patch_min`=1 WHERE `entry`=42901;

-- The description of this item changed, it had a joke about paladins.
-- http://db.vanillagaming.org/?item=19815
DELETE FROM `item_template` WHERE `entry`=19815;
INSERT INTO `item_template` (`entry`, `patch`, `class`, `subclass`, `name`, `displayid`, `Quality`, `Flags`, `BuyCount`, `BuyPrice`, `SellPrice`, `InventoryType`, `AllowableClass`, `AllowableRace`, `ItemLevel`, `RequiredLevel`, `RequiredSkill`, `RequiredSkillRank`, `requiredspell`, `requiredhonorrank`, `RequiredCityRank`, `RequiredReputationFaction`, `RequiredReputationRank`, `maxcount`, `stackable`, `ContainerSlots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`, `dmg_min1`, `dmg_max1`, `dmg_type1`, `dmg_min2`, `dmg_max2`, `dmg_type2`, `dmg_min3`, `dmg_max3`, `dmg_type3`, `dmg_min4`, `dmg_max4`, `dmg_type4`, `dmg_min5`, `dmg_max5`, `dmg_type5`, `armor`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `delay`, `ammo_type`, `RangedModRange`, `spellid_1`, `spelltrigger_1`, `spellcharges_1`, `spellppmRate_1`, `spellcooldown_1`, `spellcategory_1`, `spellcategorycooldown_1`, `spellid_2`, `spelltrigger_2`, `spellcharges_2`, `spellppmRate_2`, `spellcooldown_2`, `spellcategory_2`, `spellcategorycooldown_2`, `spellid_3`, `spelltrigger_3`, `spellcharges_3`, `spellppmRate_3`, `spellcooldown_3`, `spellcategory_3`, `spellcategorycooldown_3`, `spellid_4`, `spelltrigger_4`, `spellcharges_4`, `spellppmRate_4`, `spellcooldown_4`, `spellcategory_4`, `spellcategorycooldown_4`, `spellid_5`, `spelltrigger_5`, `spellcharges_5`, `spellppmRate_5`, `spellcooldown_5`, `spellcategory_5`, `spellcategorycooldown_5`, `bonding`, `description`, `PageText`, `LanguageID`, `PageMaterial`, `startquest`, `lockid`, `Material`, `sheath`, `RandomProperty`, `block`, `itemset`, `MaxDurability`, `area`, `Map`, `BagFamily`, `ScriptName`, `DisenchantID`, `FoodType`, `minMoneyLoot`, `maxMoneyLoot`, `Duration`, `ExtraFlags`, `OtherTeamEntry`) VALUES (19815, 5, 15, 0, 'Punctured Voodoo Doll', 2622, 2, 33792, 1, 0, 0, 0, 2, -1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 24285, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 'The doll resembles a paladin or an adolescent girl.', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 1);
INSERT INTO `item_template` (`entry`, `patch`, `class`, `subclass`, `name`, `displayid`, `Quality`, `Flags`, `BuyCount`, `BuyPrice`, `SellPrice`, `InventoryType`, `AllowableClass`, `AllowableRace`, `ItemLevel`, `RequiredLevel`, `RequiredSkill`, `RequiredSkillRank`, `requiredspell`, `requiredhonorrank`, `RequiredCityRank`, `RequiredReputationFaction`, `RequiredReputationRank`, `maxcount`, `stackable`, `ContainerSlots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`, `dmg_min1`, `dmg_max1`, `dmg_type1`, `dmg_min2`, `dmg_max2`, `dmg_type2`, `dmg_min3`, `dmg_max3`, `dmg_type3`, `dmg_min4`, `dmg_max4`, `dmg_type4`, `dmg_min5`, `dmg_max5`, `dmg_type5`, `armor`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `delay`, `ammo_type`, `RangedModRange`, `spellid_1`, `spelltrigger_1`, `spellcharges_1`, `spellppmRate_1`, `spellcooldown_1`, `spellcategory_1`, `spellcategorycooldown_1`, `spellid_2`, `spelltrigger_2`, `spellcharges_2`, `spellppmRate_2`, `spellcooldown_2`, `spellcategory_2`, `spellcategorycooldown_2`, `spellid_3`, `spelltrigger_3`, `spellcharges_3`, `spellppmRate_3`, `spellcooldown_3`, `spellcategory_3`, `spellcategorycooldown_3`, `spellid_4`, `spelltrigger_4`, `spellcharges_4`, `spellppmRate_4`, `spellcooldown_4`, `spellcategory_4`, `spellcategorycooldown_4`, `spellid_5`, `spelltrigger_5`, `spellcharges_5`, `spellppmRate_5`, `spellcooldown_5`, `spellcategory_5`, `spellcategorycooldown_5`, `bonding`, `description`, `PageText`, `LanguageID`, `PageMaterial`, `startquest`, `lockid`, `Material`, `sheath`, `RandomProperty`, `block`, `itemset`, `MaxDurability`, `area`, `Map`, `BagFamily`, `ScriptName`, `DisenchantID`, `FoodType`, `minMoneyLoot`, `maxMoneyLoot`, `Duration`, `ExtraFlags`, `OtherTeamEntry`) VALUES (19815, 6, 15, 0, 'Punctured Voodoo Doll', 2622, 2, 33792, 1, 0, 0, 0, 2, -1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 24285, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 'The doll resembles a paladin.', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 1);

-- Windfury Totem III should not have loot.
-- ERROR:Table 'creature_loot_template' entry 7484 (creature entry) not exist but used as loot id in DB.
UPDATE `creature_template` SET `lootid`=0 WHERE `entry`=7484;
DELETE FROM `creature_loot_template` WHERE `entry`=7484;

-- Zealot Lor'Khan should not have loot.
-- ERROR:Table 'creature_loot_template' entry 11347 (creature entry) not exist but used as loot id in DB.
UPDATE `creature_template` SET `lootid`=0 WHERE `entry`=11347;
DELETE FROM `creature_loot_template` WHERE `entry`=11347;

-- Massive Geyser should not have loot.
-- ERROR:Table 'creature_loot_template' entry 14122 (creature entry) not exist but used as loot id in DB.
UPDATE `creature_template` SET `lootid`=0 WHERE `entry`=14122;
DELETE FROM `creature_loot_template` WHERE `entry`=14122;

-- Parasitic Serpent should not have loot.
-- ERROR:Table 'creature_loot_template' entry 14884 (creature entry) not exist but used as loot id in DB.
UPDATE `creature_template` SET `lootid`=0 WHERE `entry`=14884;
DELETE FROM `creature_loot_template` WHERE `entry`=14884;

-- Frenzied Bloodseeker Bat should not have loot.
-- ERROR:Table 'creature_loot_template' entry 14965 (creature entry) not exist but used as loot id in DB.
UPDATE `creature_template` SET `lootid`=0 WHERE `entry`=14965;
DELETE FROM `creature_loot_template` WHERE `entry`=14965;

-- Ohgan should not have loot.
-- ERROR:Table 'creature_loot_template' entry 14988 (creature entry) not exist but used as loot id in DB.
UPDATE `creature_template` SET `lootid`=0 WHERE `entry`=14988;
DELETE FROM `creature_loot_template` WHERE `entry`=14988;

-- Zulian Guardian should not have loot.
-- ERROR:Table 'creature_loot_template' entry 15068 (creature entry) not exist but used as loot id in DB.
UPDATE `creature_template` SET `lootid`=0 WHERE `entry`=15068;
DELETE FROM `creature_loot_template` WHERE `entry`=15068;

-- Zulian Prowler should not have loot.
-- ERROR:Table 'creature_loot_template' entry 15101 (creature entry) not exist but used as loot id in DB.
UPDATE `creature_template` SET `lootid`=0 WHERE `entry`=15101;
DELETE FROM `creature_loot_template` WHERE `entry`=15101;

-- Chained Spirit should not have loot.
-- ERROR:Table 'creature_loot_template' entry 15117 (creature entry) not exist but used as loot id in DB.
UPDATE `creature_template` SET `lootid`=0 WHERE `entry`=15117;
DELETE FROM `creature_loot_template` WHERE `entry`=15117;

-- ERROR:Table 'creature_loot_template' entry 15571 (creature entry) not exist but used as loot id in DB.
UPDATE `creature_template` SET `patch`=7 WHERE `entry`=15571;
UPDATE `creature_template_addon` SET `patch`=7 WHERE `entry`=15571;

-- ERROR:Table 'creature_loot_template' entry 16059 (creature entry) not exist but used as loot id in DB.
UPDATE `creature_template` SET `patch`=8 WHERE `entry`=16059;

-- ERROR:Table 'creature_loot_template' entry 16095 (creature entry) not exist but used as loot id in DB.
UPDATE `creature_template` SET `patch`=8 WHERE `entry`=16095;
UPDATE `skinning_loot_template` SET `patch_min`=8 WHERE `entry`=16095;

-- ERROR:Table 'creature_loot_template' entry 16101 (creature entry) not exist but used as loot id in DB.
UPDATE `creature_template` SET `patch`=8 WHERE `entry`=16101;
UPDATE `creature` SET `patch_min`=8 WHERE `id`=16101;

-- ERROR:Table 'creature_loot_template' entry 16102 (creature entry) not exist but used as loot id in DB.
UPDATE `creature_template` SET `patch`=8 WHERE `entry`=16102;
UPDATE `creature` SET `patch_min`=8 WHERE `id`=16102;
UPDATE `creature_template` SET `patch`=8 WHERE `entry`=16046;
UPDATE `creature` SET `patch_min`=8 WHERE `id`=16046;

-- ERROR:Table 'creature_loot_template' entry 15082 (creature entry) not exist but used as loot id in DB.
UPDATE `creature_template` SET `patch`=5 WHERE `entry`=15082;
UPDATE `creature` SET `patch_min`=5 WHERE `id`=15082;
UPDATE `creature_template_addon` SET `patch`=5 WHERE `entry`=15082;
-- ERROR:Table 'creature_loot_template' entry 15083 (creature entry) not exist but used as loot id in DB.
UPDATE `creature_template` SET `patch`=5 WHERE `entry`=15083;
UPDATE `creature` SET `patch_min`=5 WHERE `id`=15083;
UPDATE `creature_template_addon` SET `patch`=5 WHERE `entry`=15083;
-- ERROR:Table 'creature_loot_template' entry 15084 (creature entry) not exist but used as loot id in DB.
UPDATE `creature_template` SET `patch`=5 WHERE `entry`=15084;
UPDATE `creature` SET `patch_min`=5 WHERE `id`=15084;
UPDATE `creature_template_addon` SET `patch`=5 WHERE `entry`=15084;
-- ERROR:Table 'creature_loot_template' entry 15085 (creature entry) not exist but used as loot id in DB.
UPDATE `creature_template` SET `patch`=5 WHERE `entry`=15085;
UPDATE `creature` SET `patch_min`=5 WHERE `id`=15085;
UPDATE `creature_template_addon` SET `patch`=5 WHERE `entry`=15085;
-- ERROR:Table 'creature_loot_template' entry 15263 (creature entry) not exist but used as loot id in DB.
UPDATE `creature_template` SET `patch`=7 WHERE `entry`=15263;
UPDATE `creature` SET `patch_min`=7 WHERE `id`=15263;
-- ERROR:Table 'creature_loot_template' entry 15275 (creature entry) not exist but used as loot id in DB.
UPDATE `creature_template` SET `patch`=7 WHERE `entry`=15275;
UPDATE `creature` SET `patch_min`=7 WHERE `id`=15275;
-- ERROR:Table 'creature_loot_template' entry 15276 (creature entry) not exist but used as loot id in DB.
UPDATE `creature_template` SET `patch`=7 WHERE `entry`=15276;
UPDATE `creature` SET `patch_min`=7 WHERE `id`=15276;
-- ERROR:Table 'creature_loot_template' entry 15299 (creature entry) not exist but used as loot id in DB.
UPDATE `creature_template` SET `patch`=7 WHERE `entry`=15299;
UPDATE `creature` SET `patch_min`=7 WHERE `id`=15299;
-- ERROR:Table 'creature_loot_template' entry 15339 (creature entry) not exist but used as loot id in DB.
UPDATE `creature_template` SET `patch`=7 WHERE `entry`=15339;
UPDATE `creature` SET `patch_min`=7 WHERE `id`=15339;
-- ERROR:Table 'creature_loot_template' entry 15340 (creature entry) not exist but used as loot id in DB.
UPDATE `creature_template` SET `patch`=7 WHERE `entry`=15340;
UPDATE `creature` SET `patch_min`=7 WHERE `id`=15340;
-- ERROR:Table 'creature_loot_template' entry 15341 (creature entry) not exist but used as loot id in DB.
UPDATE `creature_template` SET `patch`=7 WHERE `entry`=15341;
UPDATE `creature` SET `patch_min`=7 WHERE `id`=15341;
-- ERROR:Table 'creature_loot_template' entry 15348 (creature entry) not exist but used as loot id in DB.
UPDATE `creature_template` SET `patch`=7 WHERE `entry`=15348;
UPDATE `creature` SET `patch_min`=7 WHERE `id`=15348;
-- ERROR:Table 'creature_loot_template' entry 15369 (creature entry) not exist but used as loot id in DB.
UPDATE `creature_template` SET `patch`=7 WHERE `entry`=15369;
UPDATE `creature` SET `patch_min`=7 WHERE `id`=15369;
-- ERROR:Table 'creature_loot_template' entry 15370 (creature entry) not exist but used as loot id in DB.
UPDATE `creature_template` SET `patch`=7 WHERE `entry`=15370;
UPDATE `creature` SET `patch_min`=7 WHERE `id`=15370;
-- ERROR:Table 'creature_loot_template' entry 15509 (creature entry) not exist but used as loot id in DB.
UPDATE `creature_template` SET `patch`=7 WHERE `entry`=15509;
UPDATE `creature` SET `patch_min`=7 WHERE `id`=15509;
-- ERROR:Table 'creature_loot_template' entry 15510 (creature entry) not exist but used as loot id in DB.
UPDATE `creature_template` SET `patch`=7 WHERE `entry`=15510;
UPDATE `creature` SET `patch_min`=7 WHERE `id`=15510;
-- ERROR:Table 'creature_loot_template' entry 15511 (creature entry) not exist but used as loot id in DB.
UPDATE `creature_template` SET `patch`=7 WHERE `entry`=15511;
UPDATE `creature` SET `patch_min`=7 WHERE `id`=15511;
-- ERROR:Table 'creature_loot_template' entry 15516 (creature entry) not exist but used as loot id in DB.
UPDATE `creature_template` SET `patch`=7 WHERE `entry`=15516;
UPDATE `creature` SET `patch_min`=7 WHERE `id`=15516;
-- ERROR:Table 'creature_loot_template' entry 15517 (creature entry) not exist but used as loot id in DB.
UPDATE `creature_template` SET `patch`=7 WHERE `entry`=15517;
UPDATE `creature` SET `patch_min`=7 WHERE `id`=15517;
-- ERROR:Table 'creature_loot_template' entry 15543 (creature entry) not exist but used as loot id in DB.
UPDATE `creature_template` SET `patch`=7 WHERE `entry`=15543;
UPDATE `creature` SET `patch_min`=7 WHERE `id`=15543;
-- ERROR:Table 'creature_loot_template' entry 15544 (creature entry) not exist but used as loot id in DB.
UPDATE `creature_template` SET `patch`=7 WHERE `entry`=15544;
UPDATE `creature` SET `patch_min`=7 WHERE `id`=15544;
-- ERROR:Table 'creature_loot_template' entry 15989 (creature entry) not exist but used as loot id in DB.
UPDATE `creature_template` SET `patch`=9 WHERE `entry`=15989;
UPDATE `creature` SET `patch_min`=9 WHERE `id`=15989;
-- ERROR:Table 'creature_loot_template' entry 16080 (creature entry) not exist but used as loot id in DB.
UPDATE `creature_template` SET `patch`=8 WHERE `entry`=16080;
UPDATE `creature` SET `patch_min`=8 WHERE `id`=16080;
UPDATE `creature_template` SET `patch`=8 WHERE `entry`=16044;
UPDATE `creature` SET `patch_min`=8 WHERE `id`=16044;
-- ERROR:Table 'creature_loot_template' entry 16097 (creature entry) not exist but used as loot id in DB.
UPDATE `creature_template` SET `patch`=8 WHERE `entry`=16097;
UPDATE `creature` SET `patch_min`=8 WHERE `id`=16097;
UPDATE `creature_template` SET `patch`=8 WHERE `entry`=16045;
UPDATE `creature` SET `patch_min`=8 WHERE `id`=16045;
-- ERROR:Table 'creature_loot_template' entry 16118 (creature entry) not exist but used as loot id in DB.
UPDATE `creature_template` SET `patch`=8 WHERE `entry`=16118;
UPDATE `creature` SET `patch_min`=8 WHERE `id`=16118;
UPDATE `creature_template_addon` SET `patch`=8 WHERE `entry`=16118;
UPDATE `creature_template` SET `patch`=8 WHERE `entry`=16047;
UPDATE `creature` SET `patch_min`=8 WHERE `id`=16047;
UPDATE `creature_template_addon` SET `patch`=8 WHERE `entry`=16047;

-- ERROR:Table 'gameobject_loot_template' entry 11104 (gameobject lootid) not exist but used as loot id in DB.
UPDATE `gameobject_template` SET `patch`=8 WHERE `entry`=161495;
UPDATE `gameobject` SET `patch_min`=8 WHERE `id`=161495;

-- ERROR:Table 'gameobject_loot_template' entry 181207 (gameobject lootid) not exist but used as loot id in DB.
UPDATE `gameobject_template` SET `patch`=9 WHERE `entry`=181207;
UPDATE `gameobject` SET `patch_min`=9 WHERE `id`=181207;

-- ERROR:Table 'gameobject_loot_template' entry 17321 (gameobject lootid) not exist but used as loot id in DB.
UPDATE `gameobject_template` SET `patch`=5 WHERE `entry`=180369;
UPDATE `gameobject` SET `patch_min`=5 WHERE `id`=180369;

-- ERROR:Table 'gameobject_loot_template' entry 18150 (gameobject lootid) not exist but used as loot id in DB.
UPDATE `gameobject_template` SET `patch`=9 WHERE `entry`=181287;
UPDATE `gameobject` SET `patch_min`=9 WHERE `id`=181287;

-- ERROR:Table 'gameobject_loot_template' entry 17320 (gameobject lootid) not exist but used as loot id in DB.
UPDATE `gameobject_template` SET `patch`=5 WHERE `entry`=180346;
UPDATE `gameobject` SET `patch_min`=5 WHERE `id`=180346;

-- ERROR:Table 'gameobject_loot_template' entry 17851 (gameobject lootid) not exist but used as loot id in DB.
UPDATE `gameobject_template` SET `patch`=8 WHERE `entry`=181053;
UPDATE `gameobject` SET `patch_min`=8 WHERE `id`=181053;

-- ERROR:Table 'gameobject_loot_template' entry 17919 (gameobject lootid) not exist but used as loot id in DB.
UPDATE `gameobject_template` SET `patch`=8 WHERE `entry`=181083;
UPDATE `gameobject` SET `patch_min`=8 WHERE `id`=181083;

-- ERROR:Table 'gameobject_loot_template' entry 181074 (gameobject lootid) not exist but used as loot id in DB.
UPDATE `gameobject_template` SET `patch`=8 WHERE `entry`=181074;
UPDATE `gameobject` SET `patch_min`=8 WHERE `id`=181074;

-- ERROR:Table 'item_loot_template' entry 22137 isn't item entry with ITEM_FLAG_LOOTABLE and not referenced from loot, and then useless.
UPDATE `item_loot_template` SET `patch_min`=8 WHERE `entry`=22137;
-- ERROR:Table 'item_loot_template' entry 22648 isn't item entry with ITEM_FLAG_LOOTABLE and not referenced from loot, and then useless.
UPDATE `item_loot_template` SET `patch_min`=7 WHERE `entry`=22648;
-- ERROR:Table 'item_loot_template' entry 22649 isn't item entry with ITEM_FLAG_LOOTABLE and not referenced from loot, and then useless.
UPDATE `item_loot_template` SET `patch_min`=7 WHERE `entry`=22649;
-- ERROR:Table 'item_loot_template' entry 22650 isn't item entry with ITEM_FLAG_LOOTABLE and not referenced from loot, and then useless.
UPDATE `item_loot_template` SET `patch_min`=7 WHERE `entry`=22650;

-- ERROR:Table 'reference_loot_template' entry 322313 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=322313;
-- ERROR:Table 'reference_loot_template' entry 322697 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=322697;
-- ERROR:Table 'reference_loot_template' entry 323468 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=323468;
-- ERROR:Table 'reference_loot_template' entry 323797 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=323797;
-- ERROR:Table 'reference_loot_template' entry 325265 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=325265;
-- ERROR:Table 'reference_loot_template' entry 329236 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=7 WHERE `item`=329236;
-- ERROR:Table 'reference_loot_template' entry 329237 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=7 WHERE `item`=329237;
-- ERROR:Table 'reference_loot_template' entry 329234 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=7 WHERE `item`=329234;
-- ERROR:Table 'reference_loot_template' entry 329235 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=7 WHERE `item`=329235;
-- ERROR:Table 'reference_loot_template' entry 329232 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=7 WHERE `item`=329232;
-- ERROR:Table 'reference_loot_template' entry 324498 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=324498;
-- ERROR:Table 'reference_loot_template' entry 322723 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=322723;
-- ERROR:Table 'reference_loot_template' entry 327591 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=327591;
-- ERROR:Table 'reference_loot_template' entry 328805 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=328805;
-- ERROR:Table 'reference_loot_template' entry 324356 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=324356;
-- ERROR:Table 'reference_loot_template' entry 328927 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=328927;
-- ERROR:Table 'reference_loot_template' entry 328925 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=7 WHERE `item`=328925;
-- ERROR:Table 'reference_loot_template' entry 328928 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=7 WHERE `item`=328928;
-- ERROR:Table 'reference_loot_template' entry 328929 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=7 WHERE `item`=328929;
-- ERROR:Table 'reference_loot_template' entry 328930 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=7 WHERE `item`=328930;
-- ERROR:Table 'reference_loot_template' entry 327683 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=327683;
-- ERROR:Table 'reference_loot_template' entry 328946 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=7 WHERE `item`=328946;
-- ERROR:Table 'reference_loot_template' entry 328944 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=7 WHERE `item`=328944;
-- ERROR:Table 'reference_loot_template' entry 328945 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=7 WHERE `item`=328945;
-- ERROR:Table 'reference_loot_template' entry 328941 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=7 WHERE `item`=328941;
-- ERROR:Table 'reference_loot_template' entry 328943 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=7 WHERE `item`=328943;
-- ERROR:Table 'reference_loot_template' entry 328942 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=7 WHERE `item`=328942;
-- ERROR:Table 'reference_loot_template' entry 328503 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=5 WHERE `item`=328503;
-- ERROR:Table 'reference_loot_template' entry 328502 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=5 WHERE `item`=328502;
-- ERROR:Table 'reference_loot_template' entry 330068 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=330068;
-- ERROR:Table 'reference_loot_template' entry 329064 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=329064;
-- ERROR:Table 'reference_loot_template' entry 328782 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=328782;
-- ERROR:Table 'reference_loot_template' entry 322630 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=322630;
-- ERROR:Table 'reference_loot_template' entry 326647 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=326647;
-- ERROR:Table 'reference_loot_template' entry 936305 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=3 WHERE `item`=936305;
-- ERROR:Table 'reference_loot_template' entry 329436 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=329436;
-- ERROR:Table 'reference_loot_template' entry 329437 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=329437;
-- ERROR:Table 'reference_loot_template' entry 323570 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=323570;
-- ERROR:Table 'reference_loot_template' entry 328725 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=328725;
-- ERROR:Table 'reference_loot_template' entry 325212 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=325212;
-- ERROR:Table 'reference_loot_template' entry 323211 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=323211;
-- ERROR:Table 'reference_loot_template' entry 328494 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=5 WHERE `item`=328494;
-- ERROR:Table 'reference_loot_template' entry 328493 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=5 WHERE `item`=328493;
-- ERROR:Table 'reference_loot_template' entry 330068 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=330068;
-- ERROR:Table 'reference_loot_template' entry 323196 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=323196;
-- ERROR:Table 'reference_loot_template' entry 329468 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=329468;
-- ERROR:Table 'reference_loot_template' entry 329469 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=329469;
-- ERROR:Table 'reference_loot_template' entry 329470 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=329470;
-- ERROR:Table 'reference_loot_template' entry 329467 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=329467;
-- ERROR:Table 'reference_loot_template' entry 329438 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=329438;
-- ERROR:Table 'reference_loot_template' entry 329439 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=329439;
-- ERROR:Table 'reference_loot_template' entry 329440 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=329440;
-- ERROR:Table 'reference_loot_template' entry 325917 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=325917;
-- ERROR:Table 'reference_loot_template' entry 329443 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=329443;
-- ERROR:Table 'reference_loot_template' entry 329444 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=329444;
-- ERROR:Table 'reference_loot_template' entry 324435 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=324435;
-- ERROR:Table 'reference_loot_template' entry 326013 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=326013;
-- ERROR:Table 'reference_loot_template' entry 320231 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=320231;
-- ERROR:Table 'reference_loot_template' entry 329445 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=329445;
-- ERROR:Table 'reference_loot_template' entry 329446 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=329446;
-- ERROR:Table 'reference_loot_template' entry 325579 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=325579;
-- ERROR:Table 'reference_loot_template' entry 312126 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=4 WHERE `item`=312126;
-- ERROR:Table 'reference_loot_template' entry 326161 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=4 WHERE `item`=326161;
-- ERROR:Table 'reference_loot_template' entry 328633 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=5 WHERE `item`=328633;
-- ERROR:Table 'reference_loot_template' entry 328634 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=5 WHERE `item`=328634;
-- ERROR:Table 'reference_loot_template' entry 328499 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=5 WHERE `item`=328499;
-- ERROR:Table 'reference_loot_template' entry 328500 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=5 WHERE `item`=328500;
-- ERROR:Table 'reference_loot_template' entry 330068 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=330068;
-- ERROR:Table 'reference_loot_template' entry 322616 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=322616;
-- ERROR:Table 'reference_loot_template' entry 324446 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=324446;
-- ERROR:Table 'reference_loot_template' entry 328965 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=328965;
-- ERROR:Table 'reference_loot_template' entry 323601 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=323601;
-- ERROR:Table 'reference_loot_template' entry 329018 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=329018;
-- ERROR:Table 'reference_loot_template' entry 328558 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=4 WHERE `item`=328558;
-- ERROR:Table 'reference_loot_template' entry 330012 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=330012;
-- ERROR:Table 'reference_loot_template' entry 324956 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=324956;
-- ERROR:Table 'reference_loot_template' entry 323809 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=323809;
-- ERROR:Table 'reference_loot_template' entry 936304 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=4 WHERE `item`=936304;
-- ERROR:Table 'reference_loot_template' entry 330003 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=4 WHERE `item`=330003;
-- ERROR:Table 'reference_loot_template' entry 324247 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=324247;
-- ERROR:Table 'reference_loot_template' entry 325278 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=325278;
-- ERROR:Table 'reference_loot_template' entry 324535 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=5 WHERE `item`=324535;
-- ERROR:Table 'reference_loot_template' entry 324534 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=5 WHERE `item`=324534;
-- ERROR:Table 'reference_loot_template' entry 324536 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=5 WHERE `item`=324536;
-- ERROR:Table 'reference_loot_template' entry 326028 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=326028;
-- ERROR:Table 'reference_loot_template' entry 329429 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=329429;
-- ERROR:Table 'reference_loot_template' entry 329430 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=329430;
-- ERROR:Table 'reference_loot_template' entry 329431 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=329431;
-- ERROR:Table 'reference_loot_template' entry 324392 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=324392;
-- ERROR:Table 'reference_loot_template' entry 324402 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=324402;
-- ERROR:Table 'reference_loot_template' entry 326731 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=4 WHERE `item`=326731;
-- ERROR:Table 'reference_loot_template' entry 324009 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=324009;
-- ERROR:Table 'reference_loot_template' entry 324488 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=324488;
-- ERROR:Table 'reference_loot_template' entry 322916 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=322916;
-- ERROR:Table 'reference_loot_template' entry 324531 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=5 WHERE `item`=324531;
-- ERROR:Table 'reference_loot_template' entry 324532 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=5 WHERE `item`=324532;
-- ERROR:Table 'reference_loot_template' entry 324533 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=5 WHERE `item`=324533;
-- ERROR:Table 'reference_loot_template' entry 325231 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=325231;
-- ERROR:Table 'reference_loot_template' entry 325567 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=325567;
-- ERROR:Table 'reference_loot_template' entry 322964 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=322964;
-- ERROR:Table 'reference_loot_template' entry 326153 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=4 WHERE `item`=326153;
-- ERROR:Table 'reference_loot_template' entry 323076 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=323076;
-- ERROR:Table 'reference_loot_template' entry 936305 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=3 WHERE `item`=936305;
-- ERROR:Table 'reference_loot_template' entry 323046 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=323046;
-- ERROR:Table 'reference_loot_template' entry 324468 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=324468;
-- ERROR:Table 'reference_loot_template' entry 328677 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=6 WHERE `item`=328677;
-- ERROR:Table 'reference_loot_template' entry 328676 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=6 WHERE `item`=328676;
-- ERROR:Table 'reference_loot_template' entry 325507 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=325507;
-- ERROR:Table 'reference_loot_template' entry 330015 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=330015;
-- ERROR:Table 'reference_loot_template' entry 322900 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=322900;
-- ERROR:Table 'reference_loot_template' entry 328519 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=328519;
-- ERROR:Table 'reference_loot_template' entry 324458 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=324458;
-- ERROR:Table 'reference_loot_template' entry 327007 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=4 WHERE `item`=327007;
-- ERROR:Table 'reference_loot_template' entry 329513 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=8 WHERE `item`=329513;
-- ERROR:Table 'reference_loot_template' entry 328542 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=328542;
-- ERROR:Table 'reference_loot_template' entry 322329 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=322329;
-- ERROR:Table 'reference_loot_template' entry 329029 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=329029;
-- ERROR:Table 'reference_loot_template' entry 328719 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=5 WHERE `item`=328719;
-- ERROR:Table 'reference_loot_template' entry 328496 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=5 WHERE `item`=328496;
-- ERROR:Table 'reference_loot_template' entry 328495 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=5 WHERE `item`=328495;
-- ERROR:Table 'reference_loot_template' entry 330068 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=330068;
-- ERROR:Table 'reference_loot_template' entry 328956 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=7 WHERE `item`=328956;
-- ERROR:Table 'reference_loot_template' entry 328957 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=7 WHERE `item`=328957;
-- ERROR:Table 'reference_loot_template' entry 328955 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=7 WHERE `item`=328955;
-- ERROR:Table 'reference_loot_template' entry 328953 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=7 WHERE `item`=328953;
-- ERROR:Table 'reference_loot_template' entry 327528 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=327528;
-- ERROR:Table 'reference_loot_template' entry 318940 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=318940;
-- ERROR:Table 'reference_loot_template' entry 328788 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=328788;
-- ERROR:Table 'reference_loot_template' entry 329206 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=7 WHERE `item`=329206;
-- ERROR:Table 'reference_loot_template' entry 329208 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=7 WHERE `item`=329208;
-- ERROR:Table 'reference_loot_template' entry 329207 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=7 WHERE `item`=329207;
-- ERROR:Table 'reference_loot_template' entry 329205 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=7 WHERE `item`=329205;
-- ERROR:Table 'reference_loot_template' entry 329203 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=7 WHERE `item`=329203;
-- ERROR:Table 'reference_loot_template' entry 318515 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=318515;
-- ERROR:Table 'reference_loot_template' entry 318528 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=318528;
-- ERROR:Table 'reference_loot_template' entry 328644 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=328644;
-- ERROR:Table 'reference_loot_template' entry 328700 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=6 WHERE `item`=328700;
-- ERROR:Table 'reference_loot_template' entry 328677 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=6 WHERE `item`=328677;
-- ERROR:Table 'reference_loot_template' entry 320006 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=6 WHERE `item`=320006;
-- ERROR:Table 'reference_loot_template' entry 326147 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=4 WHERE `item`=326147;
-- ERROR:Table 'reference_loot_template' entry 329211 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=7 WHERE `item`=329211;
-- ERROR:Table 'reference_loot_template' entry 329210 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=7 WHERE `item`=329210;
-- ERROR:Table 'reference_loot_template' entry 329213 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=7 WHERE `item`=329213;
-- ERROR:Table 'reference_loot_template' entry 329209 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=7 WHERE `item`=329209;
-- ERROR:Table 'reference_loot_template' entry 322344 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=322344;
-- ERROR:Table 'reference_loot_template' entry 322645 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=322645;
-- ERROR:Table 'reference_loot_template' entry 322660 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=322660;
-- ERROR:Table 'reference_loot_template' entry 323586 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=323586;
-- ERROR:Table 'reference_loot_template' entry 323092 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=323092;
-- ERROR:Table 'reference_loot_template' entry 325532 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=325532;
-- ERROR:Table 'reference_loot_template' entry 323271 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=323271;
-- ERROR:Table 'reference_loot_template' entry 323499 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=323499;
-- ERROR:Table 'reference_loot_template' entry 323401 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=323401;
-- ERROR:Table 'reference_loot_template' entry 323890 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=323890;
-- ERROR:Table 'reference_loot_template' entry 323963 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=323963;
-- ERROR:Table 'reference_loot_template' entry 324209 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=324209;
-- ERROR:Table 'reference_loot_template' entry 324382 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=324382;
-- ERROR:Table 'reference_loot_template' entry 324412 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=324412;
-- ERROR:Table 'reference_loot_template' entry 324512 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=324512;
-- ERROR:Table 'reference_loot_template' entry 324523 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=324523;
-- ERROR:Table 'reference_loot_template' entry 325178 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=325178;
-- ERROR:Table 'reference_loot_template' entry 325243 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=325243;
-- ERROR:Table 'reference_loot_template' entry 325556 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=325556;
-- ERROR:Table 'reference_loot_template' entry 325545 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=325545;
-- ERROR:Table 'reference_loot_template' entry 325901 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=325901;
-- ERROR:Table 'reference_loot_template' entry 325998 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=325998;
-- ERROR:Table 'reference_loot_template' entry 328037 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=4 WHERE `item`=328037;
-- ERROR:Table 'reference_loot_template' entry 328035 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=4 WHERE `item`=328035;
-- ERROR:Table 'reference_loot_template' entry 326777 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=326777;
-- ERROR:Table 'reference_loot_template' entry 326783 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=326783;
-- ERROR:Table 'reference_loot_template' entry 326798 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=326798;
-- ERROR:Table 'reference_loot_template' entry 329196 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=7 WHERE `item`=329196;
-- ERROR:Table 'reference_loot_template' entry 329194 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=7 WHERE `item`=329194;
-- ERROR:Table 'reference_loot_template' entry 329195 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=7 WHERE `item`=329195;
-- ERROR:Table 'reference_loot_template' entry 329193 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=7 WHERE `item`=329193;
-- ERROR:Table 'reference_loot_template' entry 329191 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=7 WHERE `item`=329191;
-- ERROR:Table 'reference_loot_template' entry 328027 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=328027;
-- ERROR:Table 'reference_loot_template' entry 328871 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=328871;
-- ERROR:Table 'reference_loot_template' entry 328816 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=328816;
-- ERROR:Table 'reference_loot_template' entry 328498 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=5 WHERE `item`=328498;
-- ERROR:Table 'reference_loot_template' entry 328497 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=5 WHERE `item`=328497;
-- ERROR:Table 'reference_loot_template' entry 330068 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=330068;
-- ERROR:Table 'reference_loot_template' entry 328677 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=6 WHERE `item`=328677;
-- ERROR:Table 'reference_loot_template' entry 328664 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=6 WHERE `item`=328664;
-- ERROR:Table 'reference_loot_template' entry 328688 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=6 WHERE `item`=328688;
-- ERROR:Table 'reference_loot_template' entry 329106 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=7 WHERE `item`=329106;
-- ERROR:Table 'reference_loot_template' entry 329112 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=7 WHERE `item`=329112;
-- ERROR:Table 'reference_loot_template' entry 329113 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=7 WHERE `item`=329113;
-- ERROR:Table 'reference_loot_template' entry 329107 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=7 WHERE `item`=329107;
-- ERROR:Table 'reference_loot_template' entry 328614 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=328614;
-- ERROR:Table 'reference_loot_template' entry 328626 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=328626;
-- ERROR:Table 'reference_loot_template' entry 328709 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=328709;
-- ERROR:Table 'reference_loot_template' entry 328741 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=328741;
-- ERROR:Table 'reference_loot_template' entry 328846 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=328846;
-- ERROR:Table 'reference_loot_template' entry 328853 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=328853;
-- ERROR:Table 'reference_loot_template' entry 329078 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=7 WHERE `item`=329078;
-- ERROR:Table 'reference_loot_template' entry 329077 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=7 WHERE `item`=329077;
-- ERROR:Table 'reference_loot_template' entry 329074 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=7 WHERE `item`=329074;
-- ERROR:Table 'reference_loot_template' entry 329072 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=7 WHERE `item`=329072;
-- ERROR:Table 'reference_loot_template' entry 329073 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=7 WHERE `item`=329073;
-- ERROR:Table 'reference_loot_template' entry 329069 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=7 WHERE `item`=329069;
-- ERROR:Table 'reference_loot_template' entry 329070 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=7 WHERE `item`=329070;
-- ERROR:Table 'reference_loot_template' entry 329050 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=329050;
-- ERROR:Table 'reference_loot_template' entry 329080 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=7 WHERE `item`=329080;
-- ERROR:Table 'reference_loot_template' entry 329086 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=7 WHERE `item`=329086;
-- ERROR:Table 'reference_loot_template' entry 329085 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=7 WHERE `item`=329085;
-- ERROR:Table 'reference_loot_template' entry 329082 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=7 WHERE `item`=329082;
-- ERROR:Table 'reference_loot_template' entry 329087 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=7 WHERE `item`=329087;
-- ERROR:Table 'reference_loot_template' entry 329079 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=7 WHERE `item`=329079;
-- ERROR:Table 'reference_loot_template' entry 329094 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=7 WHERE `item`=329094;
-- ERROR:Table 'reference_loot_template' entry 329095 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=7 WHERE `item`=329095;
-- ERROR:Table 'reference_loot_template' entry 329091 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=7 WHERE `item`=329091;
-- ERROR:Table 'reference_loot_template' entry 329089 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=7 WHERE `item`=329089;
-- ERROR:Table 'reference_loot_template' entry 329088 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=7 WHERE `item`=329088;
-- ERROR:Table 'reference_loot_template' entry 329128 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=7 WHERE `item`=329128;
-- ERROR:Table 'reference_loot_template' entry 329124 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=7 WHERE `item`=329124;
-- ERROR:Table 'reference_loot_template' entry 329127 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=7 WHERE `item`=329127;
-- ERROR:Table 'reference_loot_template' entry 329122 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=7 WHERE `item`=329122;
-- ERROR:Table 'reference_loot_template' entry 329121 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=7 WHERE `item`=329121;
-- ERROR:Table 'reference_loot_template' entry 329136 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=7 WHERE `item`=329136;
-- ERROR:Table 'reference_loot_template' entry 329135 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=7 WHERE `item`=329135;
-- ERROR:Table 'reference_loot_template' entry 329132 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=7 WHERE `item`=329132;
-- ERROR:Table 'reference_loot_template' entry 329130 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=7 WHERE `item`=329130;
-- ERROR:Table 'reference_loot_template' entry 329129 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=7 WHERE `item`=329129;
-- ERROR:Table 'reference_loot_template' entry 329188 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=7 WHERE `item`=329188;
-- ERROR:Table 'reference_loot_template' entry 329190 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=7 WHERE `item`=329190;
-- ERROR:Table 'reference_loot_template' entry 329189 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=7 WHERE `item`=329189;
-- ERROR:Table 'reference_loot_template' entry 329186 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=7 WHERE `item`=329186;
-- ERROR:Table 'reference_loot_template' entry 329201 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=7 WHERE `item`=329201;
-- ERROR:Table 'reference_loot_template' entry 329202 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=7 WHERE `item`=329202;
-- ERROR:Table 'reference_loot_template' entry 329199 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=7 WHERE `item`=329199;
-- ERROR:Table 'reference_loot_template' entry 329200 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=7 WHERE `item`=329200;
-- ERROR:Table 'reference_loot_template' entry 329197 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=7 WHERE `item`=329197;
-- ERROR:Table 'reference_loot_template' entry 329230 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=7 WHERE `item`=329230;
-- ERROR:Table 'reference_loot_template' entry 329231 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=7 WHERE `item`=329231;
-- ERROR:Table 'reference_loot_template' entry 329228 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=7 WHERE `item`=329228;
-- ERROR:Table 'reference_loot_template' entry 329229 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=7 WHERE `item`=329229;
-- ERROR:Table 'reference_loot_template' entry 329226 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=7 WHERE `item`=329226;
-- ERROR:Table 'reference_loot_template' entry 329258 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=7 WHERE `item`=329258;
-- ERROR:Table 'reference_loot_template' entry 329257 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=7 WHERE `item`=329257;
-- ERROR:Table 'reference_loot_template' entry 329432 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=329432;
-- ERROR:Table 'reference_loot_template' entry 329433 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=329433;
-- ERROR:Table 'reference_loot_template' entry 329434 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=329434;
-- ERROR:Table 'reference_loot_template' entry 329435 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=329435;
-- ERROR:Table 'reference_loot_template' entry 329471 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=329471;
-- ERROR:Table 'reference_loot_template' entry 329473 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=329473;
-- ERROR:Table 'reference_loot_template' entry 329474 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=329474;
-- ERROR:Table 'reference_loot_template' entry 329472 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=329472;
-- ERROR:Table 'reference_loot_template' entry 329476 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=329476;
-- ERROR:Table 'reference_loot_template' entry 329475 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=329475;
-- ERROR:Table 'reference_loot_template' entry 329477 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=329477;
-- ERROR:Table 'reference_loot_template' entry 329441 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=329441;
-- ERROR:Table 'reference_loot_template' entry 329442 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=329442;
-- ERROR:Table 'reference_loot_template' entry 329497 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=329497;
-- ERROR:Table 'reference_loot_template' entry 329498 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=329498;
-- ERROR:Table 'reference_loot_template' entry 329501 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=329501;
-- ERROR:Table 'reference_loot_template' entry 329502 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=329502;
-- ERROR:Table 'reference_loot_template' entry 329503 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=329503;
-- ERROR:Table 'reference_loot_template' entry 329504 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=329504;
-- ERROR:Table 'reference_loot_template' entry 329512 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=8 WHERE `item`=329512;
-- ERROR:Table 'reference_loot_template' entry 330015 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=330015;
-- ERROR:Table 'reference_loot_template' entry 328604 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=328604;
-- ERROR:Table 'reference_loot_template' entry 328603 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=328603;
-- ERROR:Table 'reference_loot_template' entry 330013 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=330013;
-- ERROR:Table 'reference_loot_template' entry 330014 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=330014;
-- ERROR:Table 'reference_loot_template' entry 330011 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=330011;
-- ERROR:Table 'reference_loot_template' entry 329511 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=8 WHERE `item`=329511;
-- ERROR:Table 'reference_loot_template' entry 328775 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=328775;
-- ERROR:Table 'reference_loot_template' entry 328731 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=5 WHERE `item`=328731;
-- ERROR:Table 'reference_loot_template' entry 330016 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=9 WHERE `item`=330016;
-- ERROR:Table 'reference_loot_template' entry 328718 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=5 WHERE `item`=328718;
-- ERROR:Table 'reference_loot_template' entry 328717 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=5 WHERE `item`=328717;
-- ERROR:Table 'reference_loot_template' entry 328716 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=5 WHERE `item`=328716;
-- ERROR:Table 'reference_loot_template' entry 12002 (reference id) not exist but used as loot id in DB.
UPDATE `gameobject_loot_template` SET `patch_min`=9 WHERE `mincountOrRef`=-12002;
-- ERROR:Table 'reference_loot_template' entry 172590 (reference id) not exist but used as loot id in DB.
UPDATE `gameobject_loot_template` SET `patch_min`=5 WHERE `item`=172590;
-- ERROR:Table 'reference_loot_template' entry 315709 isn't reference id and not referenced from loot, and then useless.
UPDATE `reference_loot_template` SET `patch_min`=1 WHERE `entry`=315709;
-- ERROR:Table 'reference_loot_template' entry 315710 isn't reference id and not referenced from loot, and then useless.
UPDATE `reference_loot_template` SET `patch_min`=1 WHERE `entry`=315710;
-- ERROR:Table 'reference_loot_template' entry 315715 isn't reference id and not referenced from loot, and then useless.
UPDATE `reference_loot_template` SET `patch_min`=1 WHERE `entry`=315715;
-- ERROR:Table 'reference_loot_template' entry 315716 isn't reference id and not referenced from loot, and then useless.
UPDATE `reference_loot_template` SET `patch_min`=1 WHERE `entry`=315716;
-- ERROR:Table 'reference_loot_template' entry 315717 isn't reference id and not referenced from loot, and then useless.
UPDATE `reference_loot_template` SET `patch_min`=1 WHERE `entry`=315717;
-- ERROR:Table 'reference_loot_template' entry 324888 isn't reference id and not referenced from loot, and then useless.
UPDATE `reference_loot_template` SET `patch_min`=1 WHERE `entry`=324888;
-- ERROR:Table 'reference_loot_template' entry 324889 isn't reference id and not referenced from loot, and then useless.
UPDATE `reference_loot_template` SET `patch_min`=1 WHERE `entry`=324889;
-- ERROR:Table 'reference_loot_template' entry 324891 isn't reference id and not referenced from loot, and then useless.
UPDATE `reference_loot_template` SET `patch_min`=1 WHERE `entry`=324891;
-- ERROR:Table 'reference_loot_template' entry 324893 isn't reference id and not referenced from loot, and then useless.
UPDATE `reference_loot_template` SET `patch_min`=1 WHERE `entry`=324893;
-- ERROR:Table 'reference_loot_template' entry 324895 isn't reference id and not referenced from loot, and then useless.
UPDATE `reference_loot_template` SET `patch_min`=1 WHERE `entry`=324895;
-- ERROR:Table 'reference_loot_template' entry 324897 isn't reference id and not referenced from loot, and then useless.
UPDATE `reference_loot_template` SET `patch_min`=1 WHERE `entry`=324897;
-- ERROR:Table 'reference_loot_template' entry 324899 isn't reference id and not referenced from loot, and then useless.
UPDATE `reference_loot_template` SET `patch_min`=1 WHERE `entry`=324899;
-- ERROR:Table 'reference_loot_template' entry 324901 isn't reference id and not referenced from loot, and then useless.
UPDATE `reference_loot_template` SET `patch_min`=1 WHERE `entry`=324901;
-- ERROR:Table 'reference_loot_template' entry 324903 isn't reference id and not referenced from loot, and then useless.
UPDATE `reference_loot_template` SET `patch_min`=1 WHERE `entry`=324903;
-- ERROR:Table 'reference_loot_template' entry 324906 isn't reference id and not referenced from loot, and then useless.
UPDATE `reference_loot_template` SET `patch_min`=1 WHERE `entry`=324906;
-- ERROR:Table 'reference_loot_template' entry 324910 isn't reference id and not referenced from loot, and then useless.
UPDATE `reference_loot_template` SET `patch_min`=1 WHERE `entry`=324910;
-- ERROR:Table 'reference_loot_template' entry 324912 isn't reference id and not referenced from loot, and then useless.
UPDATE `reference_loot_template` SET `patch_min`=1 WHERE `entry`=324912;
-- ERROR:Table 'reference_loot_template' entry 324916 isn't reference id and not referenced from loot, and then useless.
UPDATE `reference_loot_template` SET `patch_min`=1 WHERE `entry`=324916;
-- ERROR:Table 'reference_loot_template' entry 324917 isn't reference id and not referenced from loot, and then useless.
UPDATE `reference_loot_template` SET `patch_min`=1 WHERE `entry`=324917;
-- ERROR:Table 'reference_loot_template' entry 324921 isn't reference id and not referenced from loot, and then useless.
UPDATE `reference_loot_template` SET `patch_min`=1 WHERE `entry`=324921;
-- ERROR:Table 'reference_loot_template' entry 327338 isn't reference id and not referenced from loot, and then useless.
UPDATE `reference_loot_template` SET `patch_min`=1 WHERE `entry`=327338;
-- ERROR:Table 'reference_loot_template' entry 327340 isn't reference id and not referenced from loot, and then useless.
UPDATE `reference_loot_template` SET `patch_min`=1 WHERE `entry`=327340;
-- ERROR:Table 'reference_loot_template' entry 328259 isn't reference id and not referenced from loot, and then useless.
UPDATE `reference_loot_template` SET `patch_min`=1 WHERE `entry`=328259;
-- ERROR:Table 'reference_loot_template' entry 328261 isn't reference id and not referenced from loot, and then useless.
UPDATE `reference_loot_template` SET `patch_min`=1 WHERE `entry`=328261;
-- ERROR:Table 'reference_loot_template' entry 328267 isn't reference id and not referenced from loot, and then useless.
UPDATE `reference_loot_template` SET `patch_min`=1 WHERE `entry`=328267;
-- ERROR:Table 'reference_loot_template' entry 328268 isn't reference id and not referenced from loot, and then useless.
UPDATE `reference_loot_template` SET `patch_min`=1 WHERE `entry`=328268;
-- ERROR:Table 'reference_loot_template' entry 328270 isn't reference id and not referenced from loot, and then useless.
UPDATE `reference_loot_template` SET `patch_min`=1 WHERE `entry`=328270;
-- ERROR:Table 'reference_loot_template' entry 328272 isn't reference id and not referenced from loot, and then useless.
UPDATE `reference_loot_template` SET `patch_min`=1 WHERE `entry`=328272;
-- ERROR:Table 'reference_loot_template' entry 328274 isn't reference id and not referenced from loot, and then useless.
UPDATE `reference_loot_template` SET `patch_min`=1 WHERE `entry`=328274;
-- ERROR:Table 'reference_loot_template' entry 328277 isn't reference id and not referenced from loot, and then useless.
UPDATE `reference_loot_template` SET `patch_min`=1 WHERE `entry`=328277;
-- ERROR:Table 'reference_loot_template' entry 328278 isn't reference id and not referenced from loot, and then useless.
UPDATE `reference_loot_template` SET `patch_min`=1 WHERE `entry`=328278;
-- ERROR:Table 'reference_loot_template' entry 328306 isn't reference id and not referenced from loot, and then useless.
UPDATE `reference_loot_template` SET `patch_min`=1 WHERE `entry`=328306;
-- ERROR:Table 'reference_loot_template' entry 328314 isn't reference id and not referenced from loot, and then useless.
UPDATE `reference_loot_template` SET `patch_min`=1 WHERE `entry`=328314;
-- ERROR:Table 'reference_loot_template' entry 328316 isn't reference id and not referenced from loot, and then useless.
UPDATE `reference_loot_template` SET `patch_min`=1 WHERE `entry`=328316;

-- ERROR:Table 'reference_loot_template' entry 324908 (reference id) not exist but used as loot id in DB.
-- ERROR:Table 'reference_loot_template' entry 324907 (reference id) not exist but used as loot id in DB.
-- ERROR:Table 'reference_loot_template' entry 324909 (reference id) not exist but used as loot id in DB.
-- ERROR:Table 'reference_loot_template' entry 324911 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=1 WHERE `item`=324908;
UPDATE `creature_loot_template` SET `patch_min`=1 WHERE `item`=324907;
UPDATE `creature_loot_template` SET `patch_min`=1 WHERE `item`=324909;
UPDATE `creature_loot_template` SET `patch_min`=1 WHERE `item`=324911;
UPDATE `creature_loot_template` SET `patch_min`=1 WHERE `entry`=11492;
UPDATE `creature_template` SET `patch`=1 WHERE `entry`=11492;
UPDATE `creature_template_addon` SET `patch`=1 WHERE `entry`=11492;
UPDATE `creature` SET `patch_min`=1 WHERE `id`=11492;

-- ERROR:Table 'reference_loot_template' entry 328492 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=2 WHERE `item`=328492;
UPDATE `creature_loot_template` SET `patch_min`=2 WHERE `entry`=14506;
UPDATE `creature_template` SET `patch`=2 WHERE `entry`=14506;
UPDATE `creature_template_addon` SET `patch`=2 WHERE `entry`=14506;
UPDATE `creature` SET `patch_min`=2 WHERE `id`=14506;
-- ERROR:Table 'reference_loot_template' entry 34011 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=2 WHERE `item`=34011;
-- ERROR:Table 'reference_loot_template' entry 324896 (reference id) not exist but used as loot id in DB.
-- ERROR:Table 'reference_loot_template' entry 324894 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=1 WHERE `entry`=11488;
UPDATE `creature_template` SET `patch`=1 WHERE `entry`=11488;
UPDATE `creature_template_addon` SET `patch`=1 WHERE `entry`=11488;
UPDATE `creature` SET `patch_min`=1 WHERE `id`=11488;
-- ERROR:Table 'reference_loot_template' entry 330001 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=2 WHERE `item`=330001;
-- ERROR:Table 'reference_loot_template' entry 324812 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=1 WHERE `entry`=11467;
UPDATE `creature_template` SET `patch`=1 WHERE `entry`=11467;
UPDATE `creature_template_addon` SET `patch`=1 WHERE `entry`=11467;
UPDATE `creature` SET `patch_min`=1 WHERE `id`=11467;
-- ERROR:Table 'reference_loot_template' entry 324887 (reference id) not exist but used as loot id in DB.
-- ERROR:Table 'reference_loot_template' entry 324886 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=1 WHERE `entry`=11486;
UPDATE `creature_template` SET `patch`=1 WHERE `entry`=11486;
UPDATE `creature_template_addon` SET `patch`=1 WHERE `entry`=11486;
UPDATE `creature` SET `patch_min`=1 WHERE `id`=11486;
-- ERROR:Table 'reference_loot_template' entry 324892 (reference id) not exist but used as loot id in DB.
-- ERROR:Table 'reference_loot_template' entry 324890 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=1 WHERE `entry`=11487;
UPDATE `creature_template` SET `patch`=1 WHERE `entry`=11487;
UPDATE `creature_template_addon` SET `patch`=1 WHERE `entry`=11487;
UPDATE `creature` SET `patch_min`=1 WHERE `id`=11487;
-- ERROR:Table 'reference_loot_template' entry 324898 (reference id) not exist but used as loot id in DB.
-- ERROR:Table 'reference_loot_template' entry 324900 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=1 WHERE `entry`=11489;
UPDATE `creature_template` SET `patch`=1 WHERE `entry`=11489;
UPDATE `creature_template_addon` SET `patch`=1 WHERE `entry`=11489;
UPDATE `creature` SET `patch_min`=1 WHERE `id`=11489;
-- ERROR:Table 'reference_loot_template' entry 324919 (reference id) not exist but used as loot id in DB.
-- ERROR:Table 'reference_loot_template' entry 324920 (reference id) not exist but used as loot id in DB.
-- ERROR:Table 'reference_loot_template' entry 324918 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=1 WHERE `entry`=11501;
UPDATE `creature_template` SET `patch`=1 WHERE `entry`=11501;
UPDATE `creature_template_addon` SET `patch`=1 WHERE `entry`=11501;
UPDATE `creature` SET `patch_min`=1 WHERE `id`=11501;
-- ERROR:Table 'reference_loot_template' entry 328307 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=1 WHERE `entry`=14349;
UPDATE `creature_template` SET `patch`=1 WHERE `entry`=14349;
UPDATE `creature_template_addon` SET `patch`=1 WHERE `entry`=14349;
UPDATE `creature` SET `patch_min`=1 WHERE `id`=14349;
-- ERROR:Table 'reference_loot_template' entry 318124 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=1 WHERE `item`=318124;
-- ERROR:Table 'reference_loot_template' entry 328262 (reference id) not exist but used as loot id in DB.
-- ERROR:Table 'reference_loot_template' entry 328260 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=1 WHERE `entry`=14321;
UPDATE `creature_template` SET `patch`=1 WHERE `entry`=14321;
UPDATE `creature_template_addon` SET `patch`=1 WHERE `entry`=14321;
UPDATE `creature` SET `patch_min`=1 WHERE `id`=14321;
-- ERROR:Table 'reference_loot_template' entry 328280 (reference id) not exist but used as loot id in DB.
-- ERROR:Table 'reference_loot_template' entry 328279 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=1 WHERE `entry`=14327;
UPDATE `creature_template` SET `patch`=1 WHERE `entry`=14327;
UPDATE `creature_template_addon` SET `patch`=1 WHERE `entry`=14327;
UPDATE `creature` SET `patch_min`=1 WHERE `id`=14327;
-- ERROR:Table 'reference_loot_template' entry 34011 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=2 WHERE `item`=34011;
-- ERROR:Table 'reference_loot_template' entry 324902 (reference id) not exist but used as loot id in DB.
-- ERROR:Table 'reference_loot_template' entry 324904 (reference id) not exist but used as loot id in DB.
-- ERROR:Table 'reference_loot_template' entry 324905 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=1 WHERE `entry`=11490;
UPDATE `creature_template` SET `patch`=1 WHERE `entry`=11490;
UPDATE `creature_template_addon` SET `patch`=1 WHERE `entry`=11490;
UPDATE `creature` SET `patch_min`=1 WHERE `id`=11490;
-- ERROR:Table 'reference_loot_template' entry 324915 (reference id) not exist but used as loot id in DB.
-- ERROR:Table 'reference_loot_template' entry 324914 (reference id) not exist but used as loot id in DB.
-- ERROR:Table 'reference_loot_template' entry 324913 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=1 WHERE `entry`=11496;
UPDATE `skinning_loot_template` SET `patch_min`=1 WHERE `entry`=11496;
UPDATE `creature_template` SET `patch`=1 WHERE `entry`=11496;
UPDATE `creature_template_addon` SET `patch`=1 WHERE `entry`=11496;
UPDATE `creature` SET `patch_min`=1 WHERE `id`=11496;
-- ERROR:Table 'reference_loot_template' entry 327339 (reference id) not exist but used as loot id in DB.
-- ERROR:Table 'reference_loot_template' entry 327342 (reference id) not exist but used as loot id in DB.
-- ERROR:Table 'reference_loot_template' entry 327341 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=1 WHERE `entry`=13280;
UPDATE `creature_template` SET `patch`=1 WHERE `entry`=13280;
UPDATE `creature_template_addon` SET `patch`=1 WHERE `entry`=13280;
UPDATE `creature` SET `patch_min`=1 WHERE `id`=13280;
-- ERROR:Table 'reference_loot_template' entry 328315 (reference id) not exist but used as loot id in DB.
-- ERROR:Table 'reference_loot_template' entry 328317 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=1 WHERE `entry`=14354;
UPDATE `creature_template` SET `patch`=1 WHERE `entry`=14354;
UPDATE `creature_template_addon` SET `patch`=1 WHERE `entry`=14354;
UPDATE `creature` SET `patch_min`=1 WHERE `id`=14354;
-- ERROR:Table 'reference_loot_template' entry 328273 (reference id) not exist but used as loot id in DB.
-- ERROR:Table 'reference_loot_template' entry 328275 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=1 WHERE `entry`=14325;
UPDATE `creature_template` SET `patch`=1 WHERE `entry`=14325;
UPDATE `creature_template_addon` SET `patch`=1 WHERE `entry`=14325;
UPDATE `creature` SET `patch_min`=1 WHERE `id`=14325;
-- ERROR:Table 'reference_loot_template' entry 328269 (reference id) not exist but used as loot id in DB.
-- ERROR:Table 'reference_loot_template' entry 328271 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=1 WHERE `entry`=14324;
UPDATE `creature_template` SET `patch`=1 WHERE `entry`=14324;
UPDATE `creature_template_addon` SET `patch`=1 WHERE `entry`=14324;
UPDATE `creature` SET `patch_min`=1 WHERE `id`=14324;
-- ERROR:Table 'reference_loot_template' entry 328266 (reference id) not exist but used as loot id in DB.
-- ERROR:Table 'reference_loot_template' entry 328265 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=1 WHERE `entry`=14323;
UPDATE `creature_template` SET `patch`=1 WHERE `entry`=14323;
UPDATE `creature_template_addon` SET `patch`=1 WHERE `entry`=14323;
UPDATE `creature` SET `patch_min`=1 WHERE `id`=14323;
-- ERROR:Table 'reference_loot_template' entry 328276 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=1 WHERE `entry`=14326;
UPDATE `creature_template` SET `patch`=1 WHERE `entry`=14326;
UPDATE `creature_template_addon` SET `patch`=1 WHERE `entry`=14326;
UPDATE `creature` SET `patch_min`=1 WHERE `id`=14326;
-- ERROR:Table 'reference_loot_template' entry 315718 (reference id) not exist but used as loot id in DB.
-- ERROR:Table 'reference_loot_template' entry 315719 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=1 WHERE `entry`=6109;
UPDATE `skinning_loot_template` SET `patch_min`=1 WHERE `entry`=6109;
UPDATE `creature_template` SET `patch`=1 WHERE `entry`=6109;
UPDATE `creature_template_addon` SET `patch`=1 WHERE `entry`=6109;
UPDATE `creature` SET `patch_min`=1 WHERE `id`=6109;
-- ERROR:Table 'reference_loot_template' entry 328501 (reference id) not exist but used as loot id in DB.
UPDATE `creature_loot_template` SET `patch_min`=2 WHERE `entry`=14516;
UPDATE `creature_template` SET `patch`=2 WHERE `entry`=14516;
UPDATE `creature_template_addon` SET `patch`=2 WHERE `entry`=14516;
UPDATE `creature` SET `patch_min`=2 WHERE `id`=14516;
-- ERROR:Table 'reference_loot_template' entry 12008 (reference id) not exist but used as loot id in DB.
UPDATE `gameobject_loot_template` SET `patch_min`=1 WHERE `mincountOrRef`=-12008;
-- ERROR:Table 'reference_loot_template' entry 12000 (reference id) not exist but used as loot id in DB.
UPDATE `gameobject_loot_template` SET `patch_min`=2 WHERE `mincountOrRef`=-12000;
-- ERROR:Table 'reference_loot_template' entry 12001 (reference id) not exist but used as loot id in DB.
UPDATE `gameobject_loot_template` SET `patch_min`=2 WHERE `mincountOrRef`=-12001;
-- ERROR:Table 'reference_loot_template' entry 12016 (reference id) not exist but used as loot id in DB.
UPDATE `gameobject_loot_template` SET `patch_min`=1 WHERE `mincountOrRef`=-12016;
-- ERROR:Table 'reference_loot_template' entry 12015 (reference id) not exist but used as loot id in DB.
UPDATE `gameobject_loot_template` SET `patch_min`=1 WHERE `mincountOrRef`=-12015;
-- ERROR:Table 'reference_loot_template' entry 12017 (reference id) not exist but used as loot id in DB.
UPDATE `gameobject_loot_template` SET `patch_min`=1 WHERE `mincountOrRef`=-12017;

-- ERROR:Table 'gameobject_loot_template' entry 16523 (gameobject lootid) not exist but used as loot id in DB.
UPDATE `gameobject_template` SET `patch`=1 WHERE `entry`=179516;
UPDATE `gameobject` SET `patch_min`=1 WHERE `id`=179516;
-- ERROR:Table 'gameobject_loot_template' entry 16569 (gameobject lootid) not exist but used as loot id in DB.
UPDATE `gameobject_template` SET `patch`=1 WHERE `entry`=179545;
UPDATE `gameobject` SET `patch_min`=1 WHERE `id`=179545;
-- ERROR:Table 'gameobject_loot_template' entry 16594 (gameobject lootid) not exist but used as loot id in DB.
UPDATE `gameobject_template` SET `patch`=1 WHERE `entry`=179559;
UPDATE `gameobject` SET `patch_min`=1 WHERE `id`=179559;
-- ERROR:Table 'gameobject_loot_template' entry 16593 (gameobject lootid) not exist but used as loot id in DB.
UPDATE `gameobject_template` SET `patch`=1 WHERE `entry`=179565;
UPDATE `gameobject` SET `patch_min`=1 WHERE `id`=179565;
-- ERROR:Table 'gameobject_loot_template' entry 16719 (gameobject lootid) not exist but used as loot id in DB.
UPDATE `gameobject_template` SET `patch`=2 WHERE `entry`=179703;
UPDATE `gameobject` SET `patch_min`=2 WHERE `id`=179703;

-- Remove placeholders previously used to fix errors.
DELETE FROM `item_template` WHERE `name` LIKE "%[DISABLED]%";
DELETE FROM `quest_template` WHERE `title` LIKE "%[DISABLED]%";

-- Add condition column to event ai.
ALTER TABLE `creature_ai_scripts`
	ADD COLUMN `condition_id` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Condition id from conditions table' AFTER `creature_id`;
-- Assign condition ids to type 22 events.
UPDATE `creature_ai_scripts` SET `condition_id`=2, `event_param2`=0, `event_param3`=0, `event_param4`=0 WHERE `id` IN (1511513, 1511514, 1511501, 1511502, 1511503, 1511504, 1511505, 1511512, 1511506, 1511511, 1511510, 1511509, 1511508, 1511507);
UPDATE `creature_ai_scripts` SET `condition_id`=3, `event_param2`=0, `event_param3`=0, `event_param4`=0 WHERE `id` IN (1511306, 1511307, 1511305, 1511304, 1511303, 1511302, 362607, 362606, 362605, 362604, 362603, 362602, 132808, 132807, 132806, 132805, 132804, 132803, 132802, 1511313, 362608, 46612, 46610, 46611, 46613, 1511301, 1511312, 1511311, 1511314, 1511310, 1511309, 1511308, 46609, 46608, 46603, 46604, 46605, 46602, 46606, 46614, 46607);
UPDATE `creature_ai_scripts` SET `condition_id`=3692, `event_param2`=0, `event_param3`=0, `event_param4`=0 WHERE `id` IN (369503);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES (3693, 9, 993, 0);
UPDATE `creature_ai_scripts` SET `condition_id`=3693, `event_param2`=0, `event_param3`=0, `event_param4`=0 WHERE `id` IN (369501);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES (3694, 9, 2608, 1);
UPDATE `creature_ai_scripts` SET `condition_id`=3694, `event_param2`=0, `event_param3`=0, `event_param4`=0 WHERE `id` IN (720702);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES (3695, 9, 8353, 0);
UPDATE `creature_ai_scripts` SET `condition_id`=3695, `event_param2`=0, `event_param3`=0, `event_param4`=0 WHERE `id` IN (511101);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES (3696, 9, 8354, 0);
UPDATE `creature_ai_scripts` SET `condition_id`=3696, `event_param2`=0, `event_param3`=0, `event_param4`=0 WHERE `id` IN (674101);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES (3697, 9, 8355, 0);
UPDATE `creature_ai_scripts` SET `condition_id`=3697, `event_param2`=0, `event_param3`=0, `event_param4`=0 WHERE `id` IN (682601);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES (3698, 9, 8356, 0);
UPDATE `creature_ai_scripts` SET `condition_id`=3698, `event_param2`=0, `event_param3`=0, `event_param4`=0 WHERE `id` IN (674001);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES (3699, 9, 8357, 0);
UPDATE `creature_ai_scripts` SET `condition_id`=3699, `event_param2`=0, `event_param3`=0, `event_param4`=0 WHERE `id` IN (673501);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES (3700, 9, 8358, 0);
UPDATE `creature_ai_scripts` SET `condition_id`=3700, `event_param2`=0, `event_param3`=0, `event_param4`=0 WHERE `id` IN (1181402);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES (3701, 9, 8359, 0);
UPDATE `creature_ai_scripts` SET `condition_id`=3701, `event_param2`=0, `event_param3`=0, `event_param4`=0 WHERE `id` IN (692901);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES (3702, 9, 8360, 0);
UPDATE `creature_ai_scripts` SET `condition_id`=3702, `event_param2`=0, `event_param3`=0, `event_param4`=0 WHERE `id` IN (674601);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES (3703, 22, 993, 0);
UPDATE `creature_ai_scripts` SET `condition_id`=3703, `event_param2`=0, `event_param3`=0, `event_param4`=0 WHERE `id` IN (369502);

-- Replace some old texts with broadcast texts.
UPDATE `creature_ai_scripts` SET `action2_param1`=10789 WHERE `id`=674001;
UPDATE `creature_ai_scripts` SET `action2_param1`=10797 WHERE `id`=692901;
UPDATE `broadcast_text` SET `EmoteId0`=23 WHERE `ID` IN (10789, 10797);
DELETE FROM `creature_ai_texts` WHERE `entry`=-1470;
UPDATE `creature_ai_scripts` SET `action2_param1`=10799 WHERE `id`=682601;
UPDATE `creature_ai_scripts` SET `action2_param1`=10788 WHERE `id`=1181402;
UPDATE `broadcast_text` SET `EmoteId0`=275 WHERE `ID` IN (10799, 10788);
DELETE FROM `creature_ai_texts` WHERE `entry`=-1471;
UPDATE `creature_ai_scripts` SET `action2_param1`=10787 WHERE `id`=673501;
UPDATE `creature_ai_scripts` SET `action2_param1`=10800 WHERE `id`=674601;
UPDATE `broadcast_text` SET `EmoteId0`=94 WHERE `ID` IN (10787, 10800);
DELETE FROM `creature_ai_texts` WHERE `entry`=-1472;
UPDATE `creature_ai_scripts` SET `action2_param1`=10786 WHERE `id`=511101;
UPDATE `creature_ai_scripts` SET `action2_param1`=10798 WHERE `id`=674101;
UPDATE `broadcast_text` SET `EmoteId0`=19 WHERE `ID` IN (10786, 10798);
DELETE FROM `creature_ai_texts` WHERE `entry`=-1473;
UPDATE `creature_ai_scripts` SET `action1_param1`=9407 WHERE `id`=1148601;
UPDATE `broadcast_text` SET `Type`=1 WHERE `ID`=9407;
DELETE FROM `creature_ai_texts` WHERE `entry`=-553;
UPDATE `creature_ai_scripts` SET `action2_param1`=9413 WHERE `id`=1432105;
UPDATE `creature_ai_scripts` SET `action2_param1`=9413 WHERE `id`=1432305;
UPDATE `creature_ai_scripts` SET `action2_param1`=9413 WHERE `id`=1432605;
DELETE FROM `creature_ai_texts` WHERE `entry`=-648;

-- Assign patch to City Guards gossip options.
INSERT INTO `conditions` VALUES (4012, 37, 2, 1);
INSERT INTO `conditions` VALUES (4014, 37, 4, 1);
UPDATE `gossip_menu_option` SET `condition_id`=4012 WHERE `menu_id`=435 && `id`=10;
UPDATE `gossip_menu_option` SET `condition_id`=4014 WHERE `menu_id`=435 && `id`=11;
UPDATE `gossip_menu_option` SET `condition_id`=4012 WHERE `menu_id`=1951 && `id`=9;
UPDATE `gossip_menu_option` SET `condition_id`=4014 WHERE `menu_id`=1951 && `id`=10;
UPDATE `gossip_menu_option` SET `condition_id`=4014 WHERE `menu_id`=721 && `id`=8;
UPDATE `gossip_menu_option` SET `condition_id`=4014 WHERE `menu_id`=2849 && `id`=9;
UPDATE `gossip_menu_option` SET `condition_id`=4014 WHERE `menu_id`=2352 && `id`=8;
UPDATE `gossip_menu_option` SET `condition_id`=4014 WHERE `menu_id`=2121 && `id`=9;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
