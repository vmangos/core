DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180709164623');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180709164623');
-- Add your query below.


-- Lord Kazzak was added in 1.3.
UPDATE `creature_template` SET `patch`=1 WHERE `entry`=12397;
UPDATE `creature` SET `patch_min`=1 WHERE `id`=12397;
UPDATE `creature_template_addon` SET `patch`=1 WHERE `entry`=12397;
UPDATE `creature_addon` SET `patch`=1 WHERE `guid`=156950;
UPDATE `creature_loot_template` SET `patch_min`=1 WHERE `patch_min`=0 && `entry`=12397;

-- Empyrean Demolisher was added in 1.3.
UPDATE `item_template` SET `patch`=1 WHERE `entry`=17112;
INSERT INTO `forbidden_items` VALUES (17112, 0, 1);

-- Amberseal Keeper was added in 1.3.
UPDATE `item_template` SET `patch`=1 WHERE `entry`=17113 && `patch`=0;
INSERT INTO `forbidden_items` VALUES (17113, 0, 1);
DELETE FROM `creature_equip_template` WHERE `entry`=12071;

-- Tome of Arcane Brilliance was added in 1.4.
UPDATE `item_template` SET `patch`=2 WHERE `entry`=18600;
INSERT INTO `forbidden_items` VALUES (18600, 1, 1);

-- Codex: Prayer of Shadow Protection was added in 1.10.
UPDATE `item_template` SET `patch`=8 WHERE `entry`=22393;
INSERT INTO `forbidden_items` VALUES (22393, 7, 1);

-- Blue gear dropped by Lord Kazzak.
-- According to Allakhazam stats, it seems he could drop more than one blue early on.
-- In patch 1.4 they made sure he only drops blues with an item level above 50.
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES
(12397, 30557, 100, 0, -30557, 1, 0, 1, 10),
(12397, 30558, 50, 0, -30557, 1, 0, 1, 1);
DELETE FROM `reference_loot_template` WHERE `entry`=30557;
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES
(30557, 1203, 0, 1, 1, 1, 0, 1, 10),
(30557, 1714, 0, 1, 1, 1, 0, 1, 1),
(30557, 1715, 0, 1, 1, 1, 0, 1, 1),
(30557, 1716, 0, 1, 1, 1, 0, 1, 1),
(30557, 1718, 0, 1, 1, 1, 0, 1, 1),
(30557, 1973, 0, 1, 1, 1, 0, 1, 10),
(30557, 2564, 0, 1, 1, 1, 0, 1, 10),
(30557, 4090, 0, 1, 1, 1, 0, 1, 1),
(30557, 4696, 0, 1, 1, 1, 0, 1, 10),
(30557, 5266, 0, 1, 1, 1, 0, 1, 10),
(30557, 5267, 0, 1, 1, 1, 0, 1, 10),
(30557, 6622, 0, 1, 1, 1, 0, 1, 10),
(30557, 7734, 0, 1, 1, 1, 0, 1, 10),
(30557, 9395, 0, 1, 1, 1, 0, 1, 1),
(30557, 9402, 0, 1, 1, 1, 0, 1, 10),
(30557, 9434, 0, 1, 1, 1, 0, 1, 1),
(30557, 11302, 0, 1, 1, 1, 0, 1, 10),
(30557, 12691, 0, 1, 1, 1, 0, 1, 10),
(30557, 13000, 0, 1, 1, 1, 0, 1, 10),
(30557, 13001, 0, 1, 1, 1, 0, 1, 10),
(30557, 13002, 0, 1, 1, 1, 0, 1, 10),
(30557, 13003, 0, 1, 1, 1, 0, 1, 10),
(30557, 13004, 0, 1, 1, 1, 0, 1, 10),
(30557, 13006, 0, 1, 1, 1, 0, 1, 10),
(30557, 13007, 0, 1, 1, 1, 0, 1, 10),
(30557, 13008, 0, 1, 1, 1, 0, 1, 10),
(30557, 13009, 0, 1, 1, 1, 0, 1, 10),
(30557, 13013, 0, 1, 1, 1, 0, 1, 10),
(30557, 13015, 0, 1, 1, 1, 0, 1, 10),
(30557, 13029, 0, 1, 1, 1, 0, 1, 1),
(30557, 13030, 0, 1, 1, 1, 0, 1, 10),
(30557, 13036, 0, 1, 1, 1, 0, 1, 10),
(30557, 13040, 0, 1, 1, 1, 0, 1, 10),
(30557, 13047, 0, 1, 1, 1, 0, 1, 10),
(30557, 13053, 0, 1, 1, 1, 0, 1, 10),
(30557, 13060, 0, 1, 1, 1, 0, 1, 10),
(30557, 13066, 0, 1, 1, 1, 0, 1, 10),
(30557, 13067, 0, 1, 1, 1, 0, 1, 10),
(30557, 13070, 0, 1, 1, 1, 0, 1, 10),
(30557, 13071, 0, 1, 1, 1, 0, 1, 1),
(30557, 13072, 0, 1, 1, 1, 0, 1, 10),
(30557, 13073, 0, 1, 1, 1, 0, 1, 10),
(30557, 13074, 0, 1, 1, 1, 0, 1, 1),
(30557, 13075, 0, 1, 1, 1, 0, 1, 10),
(30557, 13076, 0, 1, 1, 1, 0, 1, 1),
(30557, 13077, 0, 1, 1, 1, 0, 1, 10),
(30557, 13083, 0, 1, 1, 1, 0, 1, 10),
(30557, 13085, 0, 1, 1, 1, 0, 1, 10),
(30557, 13089, 0, 1, 1, 1, 0, 1, 1),
(30557, 13091, 0, 1, 1, 1, 0, 1, 10),
(30557, 13095, 0, 1, 1, 1, 0, 1, 1),
(30557, 13096, 0, 1, 1, 1, 0, 1, 10),
(30557, 13100, 0, 1, 1, 1, 0, 1, 1),
(30557, 13102, 0, 1, 1, 1, 0, 1, 1),
(30557, 13107, 0, 1, 1, 1, 0, 1, 10),
(30557, 13111, 0, 1, 1, 1, 0, 1, 10),
(30557, 13112, 0, 1, 1, 1, 0, 1, 1),
(30557, 13113, 0, 1, 1, 1, 0, 1, 10),
(30557, 13115, 0, 1, 1, 1, 0, 1, 1),
(30557, 13116, 0, 1, 1, 1, 0, 1, 10),
(30557, 13117, 0, 1, 1, 1, 0, 1, 1),
(30557, 13118, 0, 1, 1, 1, 0, 1, 10),
(30557, 13120, 0, 1, 1, 1, 0, 1, 10),
(30557, 13123, 0, 1, 1, 1, 0, 1, 10),
(30557, 13125, 0, 1, 1, 1, 0, 1, 10),
(30557, 13126, 0, 1, 1, 1, 0, 1, 10),
(30557, 13128, 0, 1, 1, 1, 0, 1, 1),
(30557, 13130, 0, 1, 1, 1, 0, 1, 10),
(30557, 13132, 0, 1, 1, 1, 0, 1, 1),
(30557, 13133, 0, 1, 1, 1, 0, 1, 10),
(30557, 13134, 0, 1, 1, 1, 0, 1, 1),
(30557, 13135, 0, 1, 1, 1, 0, 1, 10),
(30557, 13144, 0, 1, 1, 1, 0, 1, 10),
(30557, 13146, 0, 1, 1, 1, 0, 1, 10),
(30557, 13199, 0, 1, 1, 1, 0, 1, 1);

-- Dark Rune was added in patch 1.8 and it used the same spell id as Demonic Rune initially.
DELETE FROM `item_template` WHERE `entry`=20520;
INSERT INTO `item_template` (`entry`, `patch`, `class`, `subclass`, `name`, `displayid`, `Quality`, `Flags`, `BuyCount`, `BuyPrice`, `SellPrice`, `InventoryType`, `AllowableClass`, `AllowableRace`, `ItemLevel`, `RequiredLevel`, `RequiredSkill`, `RequiredSkillRank`, `requiredspell`, `requiredhonorrank`, `RequiredCityRank`, `RequiredReputationFaction`, `RequiredReputationRank`, `maxcount`, `stackable`, `ContainerSlots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`, `dmg_min1`, `dmg_max1`, `dmg_type1`, `dmg_min2`, `dmg_max2`, `dmg_type2`, `dmg_min3`, `dmg_max3`, `dmg_type3`, `dmg_min4`, `dmg_max4`, `dmg_type4`, `dmg_min5`, `dmg_max5`, `dmg_type5`, `armor`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `delay`, `ammo_type`, `RangedModRange`, `spellid_1`, `spelltrigger_1`, `spellcharges_1`, `spellppmRate_1`, `spellcooldown_1`, `spellcategory_1`, `spellcategorycooldown_1`, `spellid_2`, `spelltrigger_2`, `spellcharges_2`, `spellppmRate_2`, `spellcooldown_2`, `spellcategory_2`, `spellcategorycooldown_2`, `spellid_3`, `spelltrigger_3`, `spellcharges_3`, `spellppmRate_3`, `spellcooldown_3`, `spellcategory_3`, `spellcategorycooldown_3`, `spellid_4`, `spelltrigger_4`, `spellcharges_4`, `spellppmRate_4`, `spellcooldown_4`, `spellcategory_4`, `spellcategorycooldown_4`, `spellid_5`, `spelltrigger_5`, `spellcharges_5`, `spellppmRate_5`, `spellcooldown_5`, `spellcategory_5`, `spellcategorycooldown_5`, `bonding`, `description`, `PageText`, `LanguageID`, `PageMaterial`, `startquest`, `lockid`, `Material`, `sheath`, `RandomProperty`, `block`, `itemset`, `MaxDurability`, `area`, `Map`, `BagFamily`, `ScriptName`, `DisenchantID`, `FoodType`, `minMoneyLoot`, `maxMoneyLoot`, `Duration`, `ExtraFlags`, `OtherTeamEntry`) VALUES (20520, 6, 7, 0, 'Dark Rune', 32905, 2, 0, 1, 8000, 2000, 0, -1, -1, 55, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 16666, 0, -1, 0, -1, 1153, 120000, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 1);
INSERT INTO `item_template` (`entry`, `patch`, `class`, `subclass`, `name`, `displayid`, `Quality`, `Flags`, `BuyCount`, `BuyPrice`, `SellPrice`, `InventoryType`, `AllowableClass`, `AllowableRace`, `ItemLevel`, `RequiredLevel`, `RequiredSkill`, `RequiredSkillRank`, `requiredspell`, `requiredhonorrank`, `RequiredCityRank`, `RequiredReputationFaction`, `RequiredReputationRank`, `maxcount`, `stackable`, `ContainerSlots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`, `dmg_min1`, `dmg_max1`, `dmg_type1`, `dmg_min2`, `dmg_max2`, `dmg_type2`, `dmg_min3`, `dmg_max3`, `dmg_type3`, `dmg_min4`, `dmg_max4`, `dmg_type4`, `dmg_min5`, `dmg_max5`, `dmg_type5`, `armor`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `delay`, `ammo_type`, `RangedModRange`, `spellid_1`, `spelltrigger_1`, `spellcharges_1`, `spellppmRate_1`, `spellcooldown_1`, `spellcategory_1`, `spellcategorycooldown_1`, `spellid_2`, `spelltrigger_2`, `spellcharges_2`, `spellppmRate_2`, `spellcooldown_2`, `spellcategory_2`, `spellcategorycooldown_2`, `spellid_3`, `spelltrigger_3`, `spellcharges_3`, `spellppmRate_3`, `spellcooldown_3`, `spellcategory_3`, `spellcategorycooldown_3`, `spellid_4`, `spelltrigger_4`, `spellcharges_4`, `spellppmRate_4`, `spellcooldown_4`, `spellcategory_4`, `spellcategorycooldown_4`, `spellid_5`, `spelltrigger_5`, `spellcharges_5`, `spellppmRate_5`, `spellcooldown_5`, `spellcategory_5`, `spellcategorycooldown_5`, `bonding`, `description`, `PageText`, `LanguageID`, `PageMaterial`, `startquest`, `lockid`, `Material`, `sheath`, `RandomProperty`, `block`, `itemset`, `MaxDurability`, `area`, `Map`, `BagFamily`, `ScriptName`, `DisenchantID`, `FoodType`, `minMoneyLoot`, `maxMoneyLoot`, `Duration`, `ExtraFlags`, `OtherTeamEntry`) VALUES (20520, 8, 7, 0, 'Dark Rune', 32905, 2, 0, 1, 8000, 2000, 0, -1, -1, 55, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 27869, 0, -1, 0, -1, 1153, 120000, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 1);
INSERT INTO `forbidden_items` VALUES (20520, 5, 1);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
