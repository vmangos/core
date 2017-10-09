DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171005155633');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171005155633');
-- Add your query below.


-- Heartseeking Crossbow
UPDATE `item_template` SET `patch`=10 WHERE  `entry`=13040 AND `patch`=0;
INSERT INTO `item_template` (`entry`, `class`, `subclass`, `name`, `displayid`, `Quality`, `BuyPrice`, `SellPrice`, `InventoryType`, `ItemLevel`, `RequiredLevel`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `dmg_min1`, `dmg_max1`, `dmg_min2`, `dmg_max2`, `dmg_type2`, `delay`, `ammo_type`, `RangedModRange`, `spellcooldown_5`, `bonding`, `Material`, `MaxDurability`, `DisenchantID`) 
VALUES (13040, 2, 18, 'Heartseeking Crossbow', 22929, 3, 147220, 29444, 26, 56, 51, 3, 9, 7, 4, 71, 108, 1, 4, 5, 3100, 2, 100, 0, 2, 2, 75, 48);

-- Bow of Searing Arrows
UPDATE `item_template` SET `patch`=10 WHERE  `entry`=2825 AND `patch`=0;
INSERT INTO `item_template` (`entry`, `class`, `subclass`, `name`, `displayid`, `Quality`, `BuyPrice`, `SellPrice`, `InventoryType`, `ItemLevel`, `RequiredLevel`, `dmg_min1`, `dmg_max1`, `dmg_min2`, `dmg_max2`, `dmg_type2`, `delay`, `ammo_type`, `RangedModRange`, `spellcooldown_5`, `bonding`, `Material`, `MaxDurability`, `DisenchantID`) 
VALUES (2825, 2, 2, 'Bow of Searing Arrows', 20552, 4, 73609, 14721, 15, 42, 37, 47, 88, 1, 5, 2, 2700, 2, 100, 0, 2, 2, 90, 61);

-- Dwarven Hand Cannon
UPDATE `item_template` SET `patch`=10 WHERE  `entry`=2099 AND `patch`=0;
INSERT INTO `item_template` (`entry`, `class`, `subclass`, `name`, `displayid`, `Quality`, `BuyPrice`, `SellPrice`, `InventoryType`, `ItemLevel`, `RequiredLevel`, `dmg_min1`, `dmg_max1`, `dmg_min2`, `dmg_max2`, `dmg_type2`, `delay`, `ammo_type`, `RangedModRange`, `spellid_1`, `spelltrigger_1`, `spellcooldown_5`, `bonding`, `Material`, `MaxDurability`, `DisenchantID`) 
VALUES (2099, 2, 3, 'Dwarven Hand Cannon', 28636, 4, 225203, 45040, 26, 58, 53, 66, 124, 1, 11, 2, 2900, 3, 100, 29625, 1, 0, 2, 1, 90, 64);

-- Dark Iron Rifle
UPDATE `item_template` SET `patch`=10 WHERE  `entry`=16004 AND `patch`=0;
INSERT INTO `item_template` (`entry`, `class`, `subclass`, `name`, `displayid`, `Quality`, `BuyPrice`, `SellPrice`, `InventoryType`, `ItemLevel`, `RequiredLevel`, `dmg_min1`, `dmg_max1`, `dmg_min2`, `dmg_max2`, `dmg_type2`, `delay`, `ammo_type`, `RangedModRange`, `spellcooldown_5`, `bonding`, `Material`, `MaxDurability`, `DisenchantID`) 
VALUES (16004, 2, 3, 'Dark Iron Rifle', 26737, 3, 145762, 29152, 26, 55, 50, 53, 100, 2, 4, 5, 2700, 3, 100, 0, 2, 1, 75, 47);

-- Galgann
UPDATE `item_template` SET `patch`=10 WHERE  `entry`=9412 AND `patch`=0;
INSERT INTO `item_template` (`entry`, `class`, `subclass`, `name`, `displayid`, `Quality`, `BuyPrice`, `SellPrice`, `InventoryType`, `ItemLevel`, `RequiredLevel`, `dmg_min1`, `dmg_max1`, `dmg_min2`, `dmg_max2`, `dmg_type2`, `delay`, `ammo_type`, `RangedModRange`, `spellcooldown_5`, `bonding`, `Material`, `MaxDurability`, `DisenchantID`) 
VALUES (9412, 2, 3, 'Galgann\'s Fireblaster', 18298, 3, 83405, 16681, 26, 47, 42, 44, 84, 1, 3, 2, 2600, 3, 100, 0, 1, 1, 75, 46);

-- Shell Launcher Shotgun
UPDATE `item_template` SET `patch`=10 WHERE  `entry`=13146 AND `patch`=0;
INSERT INTO `item_template` (`entry`, `class`, `subclass`, `name`, `displayid`, `Quality`, `BuyPrice`, `SellPrice`, `InventoryType`, `ItemLevel`, `RequiredLevel`, `dmg_min1`, `dmg_max1`, `dmg_min2`, `dmg_max2`, `dmg_type2`, `delay`, `ammo_type`, `RangedModRange`, `spellcooldown_5`, `bonding`, `Material`, `MaxDurability`, `DisenchantID`) 
VALUES (13146, 2, 3, 'Shell Launcher Shotgun', 28743, 3, 173521, 34704, 26, 58, 53, 48, 89, 1, 4, 2, 2300, 3, 100, 0, 2, 1, 75, 48);

-- Venomstrike
UPDATE `item_template` SET `patch`=10 WHERE  `entry`=6469 AND `patch`=0;
INSERT INTO `item_template` (`entry`, `class`, `subclass`, `name`, `displayid`, `Quality`, `BuyPrice`, `SellPrice`, `InventoryType`, `ItemLevel`, `RequiredLevel`, `dmg_min1`, `dmg_max1`, `dmg_min2`, `dmg_max2`, `dmg_type2`, `delay`, `ammo_type`, `RangedModRange`, `spellcooldown_5`, `bonding`, `Material`, `MaxDurability`, `DisenchantID`) 
VALUES (6469, 2, 2, 'Venomstrike', 20652, 3, 11201, 2240, 15, 24, 19, 16, 30, 3, 6, 3, 2400, 2, 100, 0, 1, 2, 65, 41);

-- Verdant Keeper
UPDATE `item_template` SET `patch`=10 WHERE  `entry`=17753 AND `patch`=0;
INSERT INTO `item_template` (`entry`, `class`, `subclass`, `name`, `displayid`, `Quality`, `BuyPrice`, `SellPrice`, `InventoryType`, `ItemLevel`, `dmg_min1`, `dmg_max1`, `dmg_min2`, `dmg_max2`, `dmg_type2`, `delay`, `ammo_type`, `RangedModRange`, `spellcooldown_5`, `bonding`, `Material`, `MaxDurability`, `DisenchantID`) 
VALUES (17753, 2, 2, 'Verdant Keeper\'s Aim', 29932, 3, 130233, 26046, 15, 53, 53, 100, 1, 4, 3, 2800, 2, 100, 0, 1, 2, 75, 47);

-- Dark Iron Bracers
INSERT INTO `item_template` (`entry`, `patch`, `class`, `subclass`, `name`, `displayid`, `Quality`, `BuyPrice`, `SellPrice`, `InventoryType`, `ItemLevel`, `RequiredLevel`, `stat_type1`, `stat_value1`, `armor`, `fire_res`, `delay`, `spellcooldown_5`, `spellcategorycooldown_5`, `bonding`, `Material`, `MaxDurability`, `DisenchantID`) 
VALUES (17014, 4, 4, 4, 'Dark Iron Bracers', 28844, 4, 63189, 12637, 9, 59, 54, 7, 7, 394, 18, 0, 0, 0, 2, 6, 55, 64);

-- Nightfall
UPDATE `item_template` SET `dmg_min1`=171, `dmg_max1`=258, `delay`=3200 WHERE  `entry`=19169 AND `patch`=4;
INSERT INTO `item_template` (`entry`, `patch`, `class`, `subclass`, `name`, `displayid`, `Quality`, `BuyPrice`, `SellPrice`, `InventoryType`, `ItemLevel`, `RequiredLevel`, `requiredspell`, `dmg_min1`, `dmg_max1`, `delay`, `spellid_1`, `spelltrigger_1`, `spellppmRate_1`, `spellcooldown_5`, `spellcategorycooldown_5`, `bonding`, `Material`, `sheath`, `MaxDurability`, `DisenchantID`) 
VALUES (19169, 10, 2, 1, 'Nightfall', 31735, 4, 645562, 129112, 17, 70, 60, 197, 187, 282, 3500, 23605, 2, 2, 0, 0, 2, 1, 1, 120, 65);

-- Necromantic Band
UPDATE `item_template` SET `spellid_1`=21597 WHERE  `entry`=18760 AND `patch`=2;
INSERT INTO `item_template` (`entry`, `patch`, `class`, `name`, `displayid`, `Quality`, `BuyPrice`, `SellPrice`, `InventoryType`, `ItemLevel`, `RequiredLevel`, `maxcount`, `delay`, `spellid_1`, `spelltrigger_1`, `spellcooldown_5`, `spellcategorycooldown_5`, `bonding`, `Material`, `DisenchantID`) 
VALUES (18760, 8, 4, 'Necromantic Band', 9839, 3, 123465, 30866, 11, 62, 57, 1, 0, 20885, 1, 0, 0, 1, 3, 49);

-- Beheading Blade
INSERT INTO `item_template` (`entry`, `patch`, `class`, `subclass`, `name`, `displayid`, `Quality`, `BuyPrice`, `SellPrice`, `InventoryType`, `ItemLevel`, `RequiredLevel`, `dmg_min1`, `dmg_max1`, `delay`, `spellcooldown_5`, `spellcategorycooldown_5`, `bonding`, `Material`, `sheath`, `RandomProperty`, `MaxDurability`, `DisenchantID`) 
VALUES (15253, 4, 2, 8, 'Beheading Blade', 28321, 2, 157738, 31547, 17, 52, 47, 113, 170, 3500, 0, 0, 2, 1, 1, 5290, 85, 29);

-- Garon Hutchins
INSERT INTO `forbidden_items` (`entry`, `patch`, `AfterOrBefore`) VALUES (23161, 8, 1);

-- General Drakkisath
UPDATE `reference_loot_template` SET `ChanceOrQuestChance`=0 WHERE `entry` IN (322689,322689) AND `item`<>22268;

-- Vibrant Plumes
UPDATE `quest_template` SET `RequiredMaxRepValue`=2500 WHERE  `entry`=7902 AND `patch`=4;

-- A Better Ingredient
UPDATE `quest_template` SET `patch`=8 WHERE  `entry`=9053 AND `patch`=9;
UPDATE `creature_questrelation` SET `patch`=8 WHERE  `id`=9619 AND `quest`=9053 AND `patch`=9;

-- Soulstring
UPDATE `item_template` SET `dmg_min1`=103, `dmg_max1`=192 WHERE  `entry`=22811 AND `patch`=9;

-- Nerubian Slavemaker
UPDATE `item_template` SET `dmg_min1`=136, `dmg_max1`=253, `delay`=3400 WHERE  `entry`=22812 AND `patch`=9;
INSERT INTO `item_template` (`entry`, `patch`, `class`, `subclass`, `name`, `displayid`, `Quality`, `BuyPrice`, `SellPrice`, `InventoryType`, `AllowableClass`, `AllowableRace`, `ItemLevel`, `RequiredLevel`, `dmg_min1`, `dmg_max1`, `delay`, `ammo_type`, `RangedModRange`, `spellid_1`, `spelltrigger_1`, `spellid_2`, `spelltrigger_2`, `spellcooldown_5`, `bonding`, `Material`, `MaxDurability`, `DisenchantID`) 
VALUES (22812, 10, 2, 18, 'Nerubian Slavemaker', 35253, 4, 1059247, 211849, 26, 1503, 255, 89, 60, 128, 238, 3200, 2, 100, 14027, 1, 7597, 1, 0, 1, 2, 90, 65);

-- Hides stack count
UPDATE `item_template` SET `stackable`=5 WHERE  entry in (783,8169,4232,4235,8171,15407) AND `patch`=0;
UPDATE `item_template` SET `stackable`=10 WHERE entry in (4231,4236,4233,8172) AND `patch`=0;
INSERT INTO `item_template` (`entry`, `patch`, `class`, `name`, `displayid`, `Quality`, `BuyPrice`, `SellPrice`, `ItemLevel`, `stackable`, `delay`, `spellcooldown_5`, `spellcategorycooldown_5`, `Material`) VALUES (783, 9, 7, 'Light Hide', 6687, 1, 200, 50, 10, 10, 0, 0, 0, 8);
INSERT INTO `item_template` (`entry`, `patch`, `class`, `name`, `displayid`, `Quality`, `BuyPrice`, `SellPrice`, `ItemLevel`, `stackable`, `delay`, `spellcooldown_5`, `spellcategorycooldown_5`, `Material`) VALUES (4232, 9, 7, 'Medium Hide', 21463, 1, 500, 125, 20, 10, 0, 0, 0, 8);
INSERT INTO `item_template` (`entry`, `patch`, `class`, `name`, `displayid`, `Quality`, `BuyPrice`, `SellPrice`, `ItemLevel`, `stackable`, `delay`, `spellcooldown_5`, `spellcategorycooldown_5`, `Material`) VALUES (4235, 9, 7, 'Heavy Hide', 11164, 1, 800, 200, 30, 10, 0, 0, 0, 8);
INSERT INTO `item_template` (`entry`, `patch`, `class`, `name`, `displayid`, `Quality`, `BuyPrice`, `SellPrice`, `ItemLevel`, `stackable`, `delay`, `spellcooldown_5`, `spellcategorycooldown_5`, `Material`) VALUES (8169, 9, 7, 'Thick Hide', 8952, 1, 2000, 500, 40, 10, 0, 0, 0, 8);
INSERT INTO `item_template` (`entry`, `patch`, `class`, `name`, `displayid`, `Quality`, `BuyPrice`, `SellPrice`, `ItemLevel`, `stackable`, `delay`, `spellcooldown_5`, `spellcategorycooldown_5`, `Material`) VALUES (8171, 9, 7, 'Rugged Hide', 8794, 1, 2000, 500, 50, 10, 0, 0, 0, 8);
INSERT INTO `item_template` (`entry`, `patch`, `class`, `name`, `displayid`, `Quality`, `BuyPrice`, `SellPrice`, `ItemLevel`, `stackable`, `delay`, `spellcooldown_5`, `spellcategorycooldown_5`, `Material`) VALUES (4231, 9, 7, 'Cured Light Hide', 5086, 1, 440, 110, 10, 20, 0, 0, 0, 8);
INSERT INTO `item_template` (`entry`, `patch`, `class`, `name`, `displayid`, `Quality`, `BuyPrice`, `SellPrice`, `ItemLevel`, `stackable`, `delay`, `spellcooldown_5`, `spellcategorycooldown_5`, `Material`) VALUES (4233, 9, 7, 'Cured Medium Hide', 7112, 1, 800, 200, 20, 20, 0, 0, 0, 8);
INSERT INTO `item_template` (`entry`, `patch`, `class`, `name`, `displayid`, `Quality`, `BuyPrice`, `SellPrice`, `ItemLevel`, `stackable`, `delay`, `spellcooldown_5`, `spellcategorycooldown_5`, `Material`) VALUES (4236, 9, 7, 'Cured Heavy Hide', 3164, 1, 900, 225, 30, 20, 0, 0, 0, 8);
INSERT INTO `item_template` (`entry`, `patch`, `class`, `name`, `displayid`, `Quality`, `BuyPrice`, `SellPrice`, `ItemLevel`, `stackable`, `delay`, `spellcooldown_5`, `spellcategorycooldown_5`, `Material`) VALUES (8172, 9, 7, 'Cured Thick Hide', 7354, 1, 2000, 500, 40, 20, 0, 0, 0, 8);
INSERT INTO `item_template` (`entry`, `patch`, `class`, `name`, `displayid`, `Quality`, `BuyPrice`, `SellPrice`, `ItemLevel`, `stackable`, `delay`, `spellcooldown_5`, `spellcategorycooldown_5`, `Material`) VALUES (15407, 5, 7, 'Cured Rugged Hide', 6660, 1, 2000, 500, 50, 10, 0, 0, 0, 8);
INSERT INTO `item_template` (`entry`, `patch`, `class`, `name`, `displayid`, `Quality`, `BuyPrice`, `SellPrice`, `ItemLevel`, `stackable`, `delay`, `spellcooldown_5`, `spellcategorycooldown_5`, `Material`) VALUES (15407, 9, 7, 'Cured Rugged Hide', 6660, 1, 2000, 500, 50, 20, 0, 0, 0, 8);

-- Mindthrust Bracers
UPDATE `item_template` SET `stat_value2`=-5 WHERE  `entry`=1974 AND `patch`=0;

-- The Unstoppable Force
UPDATE `item_template` SET `spellid_2`=23699 WHERE  `entry`=19323 AND `patch`=3;
INSERT INTO `item_template` (`entry`, `patch`, `class`, `subclass`, `name`, `displayid`, `Quality`, `Flags`, `BuyPrice`, `SellPrice`, `InventoryType`, `ItemLevel`, `RequiredLevel`, `requiredspell`, `RequiredReputationRank`, `maxcount`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `dmg_min1`, `dmg_max1`, `delay`, `spellid_1`, `spelltrigger_1`, `spellid_2`, `spelltrigger_2`, `spellcooldown_5`, `spellcategorycooldown_5`, `bonding`, `Material`, `sheath`, `MaxDurability`) 
VALUES (19323, 5, 2, 5, 'The Unstoppable Force', 31817, 4, 32768, 1564900, 312980, 17, 65, 60, 199, 7, 1, 4, 19, 7, 15, 175, 292, 3800, 7598, 1, 23454, 2, 0, 0, 1, 1, 1, 120);

-- Kania formulas
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (15419, 20732);
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES (15419, 20733);

-- Boots of Displacement
UPDATE `item_template` SET `armor`=166 WHERE  `entry`=23073 AND `patch`=9;

-- Andorov patterns
REPLACE INTO `npc_vendor` VALUES (15471, 22219, 1, 604800);
REPLACE INTO `npc_vendor` VALUES (15471, 22221, 1, 604800);

-- Dawnbringer Shoulders existed in 1.2 but were added to loot tables in 1.12 or 2.0.
DELETE FROM `forbidden_items` WHERE `entry` IN (12625, 12698);
INSERT INTO `forbidden_items` (`entry`, `patch`, `AfterOrBefore`) VALUES (12625, 9, 1);
INSERT INTO `forbidden_items` (`entry`, `patch`, `AfterOrBefore`) VALUES (12698, 9, 1);
DELETE FROM `item_template` WHERE `entry` IN (12625, 12698);
INSERT INTO `item_template` (`entry`, `patch`, `class`, `subclass`, `name`, `displayid`, `Quality`, `Flags`, `BuyCount`, `BuyPrice`, `SellPrice`, `InventoryType`, `AllowableClass`, `AllowableRace`, `ItemLevel`, `RequiredLevel`, `RequiredSkill`, `RequiredSkillRank`, `requiredspell`, `requiredhonorrank`, `RequiredCityRank`, `RequiredReputationFaction`, `RequiredReputationRank`, `maxcount`, `stackable`, `ContainerSlots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`, `dmg_min1`, `dmg_max1`, `dmg_type1`, `dmg_min2`, `dmg_max2`, `dmg_type2`, `dmg_min3`, `dmg_max3`, `dmg_type3`, `dmg_min4`, `dmg_max4`, `dmg_type4`, `dmg_min5`, `dmg_max5`, `dmg_type5`, `armor`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `delay`, `ammo_type`, `RangedModRange`, `spellid_1`, `spelltrigger_1`, `spellcharges_1`, `spellppmRate_1`, `spellcooldown_1`, `spellcategory_1`, `spellcategorycooldown_1`, `spellid_2`, `spelltrigger_2`, `spellcharges_2`, `spellppmRate_2`, `spellcooldown_2`, `spellcategory_2`, `spellcategorycooldown_2`, `spellid_3`, `spelltrigger_3`, `spellcharges_3`, `spellppmRate_3`, `spellcooldown_3`, `spellcategory_3`, `spellcategorycooldown_3`, `spellid_4`, `spelltrigger_4`, `spellcharges_4`, `spellppmRate_4`, `spellcooldown_4`, `spellcategory_4`, `spellcategorycooldown_4`, `spellid_5`, `spelltrigger_5`, `spellcharges_5`, `spellppmRate_5`, `spellcooldown_5`, `spellcategory_5`, `spellcategorycooldown_5`, `bonding`, `description`, `PageText`, `LanguageID`, `PageMaterial`, `startquest`, `lockid`, `Material`, `sheath`, `RandomProperty`, `block`, `itemset`, `MaxDurability`, `area`, `Map`, `BagFamily`, `ScriptName`, `DisenchantID`, `FoodType`, `minMoneyLoot`, `maxMoneyLoot`, `Duration`, `ExtraFlags`, `OtherTeamEntry`) VALUES (12625, 0, 4, 4, 'Dawnbringer Shoulders', 25827, 3, 0, 1, 114235, 22847, 3, -1, -1, 58, 53, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 6, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 455, 0, 0, 0, 0, 0, 0, 0, 0, 0, 18031, 1, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 2, '', 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 80, 0, 0, 0, '', 48, 0, 0, 0, 0, 0, 1);
INSERT INTO `item_template` (`entry`, `patch`, `class`, `subclass`, `name`, `displayid`, `Quality`, `Flags`, `BuyCount`, `BuyPrice`, `SellPrice`, `InventoryType`, `AllowableClass`, `AllowableRace`, `ItemLevel`, `RequiredLevel`, `RequiredSkill`, `RequiredSkillRank`, `requiredspell`, `requiredhonorrank`, `RequiredCityRank`, `RequiredReputationFaction`, `RequiredReputationRank`, `maxcount`, `stackable`, `ContainerSlots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`, `dmg_min1`, `dmg_max1`, `dmg_type1`, `dmg_min2`, `dmg_max2`, `dmg_type2`, `dmg_min3`, `dmg_max3`, `dmg_type3`, `dmg_min4`, `dmg_max4`, `dmg_type4`, `dmg_min5`, `dmg_max5`, `dmg_type5`, `armor`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `delay`, `ammo_type`, `RangedModRange`, `spellid_1`, `spelltrigger_1`, `spellcharges_1`, `spellppmRate_1`, `spellcooldown_1`, `spellcategory_1`, `spellcategorycooldown_1`, `spellid_2`, `spelltrigger_2`, `spellcharges_2`, `spellppmRate_2`, `spellcooldown_2`, `spellcategory_2`, `spellcategorycooldown_2`, `spellid_3`, `spelltrigger_3`, `spellcharges_3`, `spellppmRate_3`, `spellcooldown_3`, `spellcategory_3`, `spellcategorycooldown_3`, `spellid_4`, `spelltrigger_4`, `spellcharges_4`, `spellppmRate_4`, `spellcooldown_4`, `spellcategory_4`, `spellcategorycooldown_4`, `spellid_5`, `spelltrigger_5`, `spellcharges_5`, `spellppmRate_5`, `spellcooldown_5`, `spellcategory_5`, `spellcategorycooldown_5`, `bonding`, `description`, `PageText`, `LanguageID`, `PageMaterial`, `startquest`, `lockid`, `Material`, `sheath`, `RandomProperty`, `block`, `itemset`, `MaxDurability`, `area`, `Map`, `BagFamily`, `ScriptName`, `DisenchantID`, `FoodType`, `minMoneyLoot`, `maxMoneyLoot`, `Duration`, `ExtraFlags`, `OtherTeamEntry`) VALUES (12625, 2, 4, 4, 'Dawnbringer Shoulders', 25827, 3, 0, 1, 114235, 22847, 3, -1, -1, 58, 53, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 6, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 455, 0, 0, 0, 0, 0, 0, 0, 0, 0, 17371, 1, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 2, '', 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 80, 0, 0, 0, '', 48, 0, 0, 0, 0, 0, 1);
INSERT INTO `item_template` (`entry`, `patch`, `class`, `subclass`, `name`, `displayid`, `Quality`, `Flags`, `BuyCount`, `BuyPrice`, `SellPrice`, `InventoryType`, `AllowableClass`, `AllowableRace`, `ItemLevel`, `RequiredLevel`, `RequiredSkill`, `RequiredSkillRank`, `requiredspell`, `requiredhonorrank`, `RequiredCityRank`, `RequiredReputationFaction`, `RequiredReputationRank`, `maxcount`, `stackable`, `ContainerSlots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`, `dmg_min1`, `dmg_max1`, `dmg_type1`, `dmg_min2`, `dmg_max2`, `dmg_type2`, `dmg_min3`, `dmg_max3`, `dmg_type3`, `dmg_min4`, `dmg_max4`, `dmg_type4`, `dmg_min5`, `dmg_max5`, `dmg_type5`, `armor`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `delay`, `ammo_type`, `RangedModRange`, `spellid_1`, `spelltrigger_1`, `spellcharges_1`, `spellppmRate_1`, `spellcooldown_1`, `spellcategory_1`, `spellcategorycooldown_1`, `spellid_2`, `spelltrigger_2`, `spellcharges_2`, `spellppmRate_2`, `spellcooldown_2`, `spellcategory_2`, `spellcategorycooldown_2`, `spellid_3`, `spelltrigger_3`, `spellcharges_3`, `spellppmRate_3`, `spellcooldown_3`, `spellcategory_3`, `spellcategorycooldown_3`, `spellid_4`, `spelltrigger_4`, `spellcharges_4`, `spellppmRate_4`, `spellcooldown_4`, `spellcategory_4`, `spellcategorycooldown_4`, `spellid_5`, `spelltrigger_5`, `spellcharges_5`, `spellppmRate_5`, `spellcooldown_5`, `spellcategory_5`, `spellcategorycooldown_5`, `bonding`, `description`, `PageText`, `LanguageID`, `PageMaterial`, `startquest`, `lockid`, `Material`, `sheath`, `RandomProperty`, `block`, `itemset`, `MaxDurability`, `area`, `Map`, `BagFamily`, `ScriptName`, `DisenchantID`, `FoodType`, `minMoneyLoot`, `maxMoneyLoot`, `Duration`, `ExtraFlags`, `OtherTeamEntry`) VALUES (12698, 0, 9, 4, 'Plans: Dawnbringer Shoulders', 1102, 3, 64, 1, 22000, 5500, 0, -1, -1, 58, 0, 164, 290, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 16686, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 'Teaches you how to make Dawnbringer Shoulders.', 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 1);

-- Reins of the Winterspring Frostsaber
UPDATE `item_template` SET `ItemLevel`=60, `RequiredLevel`=60, `BuyPrice`=10000000 WHERE  `entry`=13086 AND `patch`=0;

-- Evergreen Pouch
UPDATE `item_template` SET `RequiredLevel`=0 WHERE  `entry`=11020 AND `patch`=0;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
